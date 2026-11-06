// Bauen: kompiliert die Geschichte für den Browser und erzeugt den Erzählbaum.
//   web/story.json, web/ink.js        Spiel (web/index.html)
//   web/twine.json                    Erzählbaum (web/karte.html), über tools/twine.mjs
//   web/quelle.json, web/ink-full.js  Quelltexte und Compiler für die Werkstatt (Bearbeiten, Testen im Browser)
//   web/artefakt/spiel.html, karte.html   dieselben Seiten ohne HTML-Grundgerüst für die Veröffentlichung als
//                                        claude.ai-Artefakt; Links zeigen auf die Adressen aus web/artefakte.json
// Aufruf: npm run bauen
import { copyFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { execFileSync } from "node:child_process";
import { compile, inkFiles } from "./ink.mjs";

const { json, errors } = compile();
if (!json) {
  console.log("Kompiliert nicht:", errors);
  process.exit(1);
}
const web = new URL("../web/", import.meta.url);
writeFileSync(new URL("story.json", web), json);
copyFileSync(new URL("../node_modules/inkjs/dist/ink.js", import.meta.url), new URL("ink.js", web));
console.log(`Gebaut: web/story.json (${Math.round(json.length / 1024)} KB) und web/ink.js`);

execFileSync(process.execPath, [new URL("twine.mjs", import.meta.url).pathname], { stdio: "inherit" });

// Werkstatt: alle Quelltexte, die man im Browser lesen, ändern und (Ink) testweise neu kompilieren kann.
// knoten: wo jeder Knoten und Stitch steht (Datei, erste und letzte Zeile, 1-basiert), damit man von einer
// Passage im Spiel oder im Baum direkt zu ihrem Ink-Quelltext springen kann.
const dateien = Object.fromEntries(Object.entries(inkFiles()).map(([n, t]) => [`story/${n}`, t]));
for (const n of ["spiel.js", "notizbuch.js", "stil.css"]) dateien[`web/${n}`] = readFileSync(new URL(n, web), "utf8");
const knoten = {};
for (const [datei, text] of Object.entries(dateien)) {
  if (!datei.endsWith(".ink")) continue;
  const zeilen = text.split("\n");
  let knot = null;
  const offen = [];
  const schliessen = (bis) => {
    while (offen.length) knoten[offen.pop()].bis = bis;
  };
  zeilen.forEach((z, i) => {
    const k = z.match(/^\s*===\s*(?:function\s+)?([A-Za-z_]\w*)/);
    const st = z.match(/^\s*=\s*([A-Za-z_]\w*)\s*$/);
    if (k) {
      schliessen(i);
      knot = k[1];
      knoten[knot] = { datei, von: i + 1, bis: zeilen.length };
      offen.push(knot);
    } else if (st && knot) {
      const id = `${knot}.${st[1]}`;
      if (offen.length > 1) knoten[offen.pop()].bis = i;
      knoten[id] = { datei, von: i + 1, bis: zeilen.length };
      offen.push(id);
    }
  });
  schliessen(zeilen.length);
}
writeFileSync(new URL("quelle.json", web), JSON.stringify({ dateien, knoten }));
copyFileSync(new URL("../node_modules/inkjs/dist/ink-full.js", import.meta.url), new URL("ink-full.js", web));
copyFileSync(new URL("../docs/yharnam-kapitel1.twee", import.meta.url), new URL("yharnam-kapitel1.twee", web));
console.log(`Gebaut: web/quelle.json (${Object.keys(dateien).length} Dateien, ${Object.keys(knoten).length} Knoten und Stitches), web/ink-full.js`);

// Seitenfassung für Artefakte: Titel, Metas und Stylesheets aus dem Kopf, dann der Inhalt des Körpers.
const adressen = existsSync(new URL("artefakte.json", web)) ? JSON.parse(readFileSync(new URL("artefakte.json", web), "utf8")) : {};
function fragment(datei, ersetzen) {
  const html = readFileSync(new URL(datei, web), "utf8");
  const kopf = html.match(/<head>([\s\S]*?)<\/head>/)?.[1] ?? "";
  const koerper = html.match(/<body[^>]*>([\s\S]*?)<\/body>/)?.[1] ?? "";
  const behalten = [...kopf.matchAll(/<title>[\s\S]*?<\/title>|<meta name="claude:[^>]*>|<link[^>]*>/g)].map((m) => m[0]);
  let out = `${behalten.join("\n")}\n${koerper.trim()}\n`;
  for (const [alt, neu] of ersetzen) if (neu) out = out.replaceAll(alt, neu);
  return out;
}
mkdirSync(new URL("artefakt/", web), { recursive: true });
writeFileSync(new URL("artefakt/spiel.html", web), fragment("index.html", [['href="karte.html"', adressen.karte && `href="${adressen.karte}" target="_blank" rel="noopener"`]]));
writeFileSync(new URL("artefakt/karte.html", web), fragment("karte.html", [['href="index.html"', adressen.spiel && `href="${adressen.spiel}" target="_blank" rel="noopener"`]]));
console.log("Gebaut: web/artefakt/spiel.html und web/artefakt/karte.html");

// Erklärungen zu jeder Entscheidung für das Spiel (Block „Claude erklärt“)
execFileSync(process.execPath, [new URL("entscheidungen.mjs", import.meta.url).pathname], { stdio: "inherit" });
