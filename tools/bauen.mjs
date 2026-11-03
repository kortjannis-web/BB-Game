// Bauen: kompiliert die Geschichte für den Browser und erzeugt den Erzählbaum.
//   web/story.json, web/ink.js        Spiel (web/index.html)
//   web/twine.json                    Erzählbaum (web/karte.html), über tools/twine.mjs
//   web/artefakt/spiel.html, karte.html   dieselben Seiten ohne HTML-Grundgerüst für die Veröffentlichung als
//                                        claude.ai-Artefakt; Links zeigen auf die Adressen aus web/artefakte.json
// Aufruf: npm run bauen
import { copyFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { execFileSync } from "node:child_process";
import { compile } from "./ink.mjs";

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

// Seitenfassung für Artefakte: Titel, Metas und Stylesheets aus dem Kopf, dann der Inhalt des Körpers.
const adressen = existsSync(new URL("artefakte.json", web)) ? JSON.parse(readFileSync(new URL("artefakte.json", web), "utf8")) : {};
function fragment(datei, ersetzen) {
  const html = readFileSync(new URL(datei, web), "utf8");
  const kopf = html.match(/<head>([\s\S]*?)<\/head>/)?.[1] ?? "";
  const koerper = html.match(/<body[^>]*>([\s\S]*?)<\/body>/)?.[1] ?? "";
  const behalten = [...kopf.matchAll(/<title>[\s\S]*?<\/title>|<meta name="claude:[^>]*>|<link[^>]*>/g)].map((m) => m[0]);
  let out = `${behalten.join("\n")}\n${koerper.trim()}\n`;
  for (const [alt, neu] of ersetzen) if (neu) out = out.replace(alt, neu);
  return out;
}
mkdirSync(new URL("artefakt/", web), { recursive: true });
writeFileSync(new URL("artefakt/spiel.html", web), fragment("index.html", [['href="karte.html"', adressen.karte && `href="${adressen.karte}" target="_blank" rel="noopener"`]]));
writeFileSync(new URL("artefakt/karte.html", web), fragment("karte.html", [['href="index.html"', adressen.spiel && `href="${adressen.spiel}" target="_blank" rel="noopener"`]]));
console.log("Gebaut: web/artefakt/spiel.html und web/artefakt/karte.html");
