// Erklärungen zu jeder Entscheidung (Wunsch des Nutzers 2026-11-06): Für jede Option steht im Spiel (Modus Bearbeiten)
// ein Block „Claude erklärt“: wohin sie führt, was sie verändert, wo das später gelesen wird, und warum es sie gibt.
// Quelle: web/twine.json (Ziele, Logik, Bedingungen) und die Ink-Dateien (Lesestellen der Variablen, Kommentare
// „// WARUM: …“ direkt über einer Option). Ergebnis: web/entscheidungen.json. Wird von tools/bauen.mjs aufgerufen.
import { readFileSync, writeFileSync, readdirSync, statSync } from "node:fs";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const wurzel = fileURLToPath(new URL("../", import.meta.url));
const twine = JSON.parse(readFileSync(join(wurzel, "web/twine.json"), "utf8"));
const titel = new Map(twine.passagen.map((p) => [p.id, p.titel]));

const dateien = [];
(function sammeln(dir) {
  for (const n of readdirSync(dir)) {
    const p = join(dir, n);
    if (statSync(p).isDirectory()) sammeln(p);
    else if (n.endsWith(".ink")) dateien.push(p);
  }
})(join(wurzel, "story"));

const ohneTags = (t) => t.replace(/#.*$/, "").trim();
const vars = new Set();
for (const f of dateien) for (const z of readFileSync(f, "utf8").split("\n")) {
  const m = z.match(/^\s*VAR\s+(\w+)/);
  if (m) vars.add(m[1]);
}

// Lesestellen je Variable (Knoten) und Begründungen je Option
const lesen = new Map([...vars].map((v) => [v, []]));
const warum = new Map();
for (const f of dateien) {
  let knoten = "";
  let kommentar = [];
  for (const roh of readFileSync(f, "utf8").split("\n")) {
    const z = roh.trim();
    const k = z.match(/^===\s*(\w+)/);
    if (k) knoten = k[1];
    const w = z.match(/^\/\/\s*WARUM:\s*(.*)$/);
    if (w) {
      kommentar.push(w[1]);
      continue;
    }
    const ch = z.match(/^[*+]\s*(?:\([\w]+\)\s*)?(?:\{[^}]*\}\s*)?\[(.*?)\]/);
    if (ch && kommentar.length) warum.set(`${knoten}|${ohneTags(ch[1])}`, kommentar.join(" "));
    if (!z.startsWith("//")) kommentar = z ? [] : kommentar;
    if (!z || z.startsWith("//") || !knoten) continue;
    for (const v of vars) {
      if (!new RegExp(`\\b${v}\\b`).test(z)) continue;
      if (new RegExp(`^~\\s*${v}\\s*(=|\\+\\+|--)`).test(z) && !new RegExp(`=.*\\b${v}\\b.*\\b${v}\\b`).test(z)) continue;
      if (/^VAR\b/.test(z)) continue;
      lesen.get(v).push({ knoten, zeile: z });
    }
  }
}

// Das Notizbuch liest Variablen auch (Stufen wie "var", "var==wert" in web/notizbuch.js).
titel.set("Notizbuch", "Notizbuch");
for (const z of readFileSync(join(wurzel, "web/notizbuch.js"), "utf8").split("\n")) {
  for (const v of vars) if (new RegExp(`\\b${v}\\b`).test(z)) lesen.get(v).push({ knoten: "Notizbuch", zeile: z.replace(/==\s*([\wäöüß]+)/g, '=="$1"') });
}

const lesbar = (l) =>
  l
    .replace(/^(\w+)\s*=\s*\1\s*\+\s*(\d+)$/, "$1 +$2")
    .replace(/^(\w+)\s*=\s*\1\s*-\s*(\d+)$/, "$1 −$2")
    .replace(/^(\w+)\s*=\s*"([^"]*)"$/, "$1 = „$2“")
    .replace(/^(\w+)\s*=\s*->\s*(\w+)$/, "$1 → $2");

// Zähler und Bausteine sind keine Entscheidungen und brauchen kein Echo (Umbau 2026-11-06, Echo-Regel).
const ZAEHLER = new Set(["v1_zahl", "v2_zahl", "tuer_stimme", "uhr_bestie", "puppe_besucht"]);
const eintraege = [];
for (const p of twine.passagen) {
  const knoten = p.id.split(".")[0];
  for (const c of p.choices ?? []) {
    const text = ohneTags(c.text);
    // Wertgenau: Bei var = "wert" zählen nur Lesestellen, die genau diesen Wert prüfen.
    const gesetzt = (c.logik ?? [])
      .map((l) => l.match(/^(\w+)\s*=\s*(?:"([^"]*)")?/))
      .filter((m) => m && vars.has(m[1]))
      .map((m) => ({ v: m[1], wert: m[2] ?? null }));
    const spaeter = gesetzt.map(({ v, wert }) => {
      const stellen = lesen.get(v).filter((s) => s.knoten !== knoten && (wert === null || s.zeile.includes(`"${wert}"`)));
      return { variable: wert === null ? v : `${v} = „${wert}“`, orte: [...new Set(stellen.map((s) => titel.get(s.knoten) ?? s.knoten))].slice(0, 6) };
    });
    eintraege.push({
      knoten,
      passage: p.id,
      text,
      ziel: c.ziel ? titel.get(c.ziel) ?? c.ziel : null,
      setzt: (c.logik ?? []).map(lesbar),
      bedingung: c.bedingung ?? null,
      wiederholbar: !!c.wiederholbar,
      spaeter: spaeter.filter((x) => x.orte.length),
      ohneEcho: spaeter.filter((x) => !x.orte.length && !ZAEHLER.has(x.variable.split(" ")[0])).map((x) => x.variable),
      warum: warum.get(`${knoten}|${text}`) ?? null,
    });
  }
}
writeFileSync(join(wurzel, "web/entscheidungen.json"), JSON.stringify(eintraege));
const mitWarum = eintraege.filter((e) => e.warum).length;
const ohneEcho = eintraege.filter((e) => e.ohneEcho.length).length;
console.log(`Gebaut: web/entscheidungen.json (${eintraege.length} Entscheidungen, ${mitWarum} mit Begründung, ${ohneEcho} setzen etwas ohne späteres Echo)`);

// Echo-Regel (Umbau 2026-11-06): Mit --streng bricht der Aufruf ab, wenn eine Entscheidung etwas setzt, das nie wieder gelesen wird.
if (process.argv.includes("--streng") && ohneEcho) {
  for (const e of eintraege.filter((x) => x.ohneEcho.length)) console.log(`  OHNE ECHO: ${e.passage}: „${e.text}“ setzt ${e.ohneEcho.join(", ")}`);
  console.log(`\nNICHT BESTANDEN: ${ohneEcho} Entscheidung(en) ohne späteres Echo.`);
  process.exit(1);
}
