// Prüfer: kompiliert die Geschichte und spielt sie viele Male mit zufälligen Entscheidungen durch.
// Bricht mit Fehlercode ab, wenn etwas nicht "bombenfest" ist:
//  - Kompilierfehler oder -warnungen
//  - ein Durchlauf bleibt stecken (Endlosschleife) oder endet nicht am Kapitelende
//  - ein Nadelöhr wird nicht in jedem Durchlauf erreicht
//  - ein Knoten wird in keinem Durchlauf erreicht (toter Inhalt)
//  - eine Kern-Lore (# lore: x) steht an weniger als zwei Stellen
// Aufruf: npm run pruefen [-- Anzahl]
import { compile, play, rng, variable, visits } from "./ink.mjs";

const RUNS = Number(process.argv[2] ?? 3000);
const NADELOEHRE = ["k1_n1_kleriker", "k1_n2_gascoigne", "k1_d_traum"];
const ENDE_TAG = "kapitel: ende";

const { json, errors, warnings, files } = compile();
let fehler = 0;
const fail = (msg) => {
  fehler++;
  console.log("  FEHLER:", msg);
};

console.log("1) Kompilieren");
for (const e of errors) fail(e);
for (const w of warnings) fail("Warnung: " + w);
if (!json) {
  console.log("Abbruch: Geschichte kompiliert nicht.");
  process.exit(1);
}
console.log("  ok");

// --- Statische Prüfung: Knoten, Kern-Lore an mindestens zwei Stellen, Prüfstellen ---
const knots = [];
const loreStellen = new Map();
let pruefen = 0;
let platzhalterWoerter = 0;
for (const [file, src] of Object.entries(files)) {
  let current = null;
  for (const line of src.split("\n")) {
    const knot = line.match(/^===\s*(?:function\s+)?([A-Za-z_]\w*)/);
    if (knot) {
      current = knot[1];
      if (!line.includes("function")) knots.push({ name: current, file });
    }
    if (line.includes("PRÜFEN")) pruefen++;
    if (line.trim().startsWith("//")) continue;
    for (const m of line.matchAll(/#\s*lore:\s*([\w]+)/g)) {
      if (!loreStellen.has(m[1])) loreStellen.set(m[1], new Set());
      loreStellen.get(m[1]).add(current ?? file);
    }
    if (!line.trim().startsWith("//") && !line.trim().startsWith("~") && !line.trim().startsWith("=")) {
      platzhalterWoerter += line.replace(/#.*$/, "").split(/\s+/).filter((w) => /\p{L}/u.test(w)).length;
    }
  }
}

console.log("2) Kern-Lore an mindestens zwei Stellen");
for (const [id, stellen] of [...loreStellen].sort()) {
  if (stellen.size < 2) fail(`Lore "${id}" nur an einer Stelle: ${[...stellen].join(", ")}`);
}
console.log(`  ${loreStellen.size} Kern-Lore-Einträge geprüft`);

// --- Zufallsdurchläufe ---
console.log(`3) ${RUNS} Zufallsdurchläufe`);
const reached = new Map(knots.map((k) => [k.name, 0]));
const loreGesehen = new Map([...loreStellen.keys()].map((k) => [k, 0]));
const ausgaenge = {};
const zaehle = (key, value) => {
  ausgaenge[key] ??= {};
  ausgaenge[key][value] = (ausgaenge[key][value] ?? 0) + 1;
};
let stuck = 0;
let ohneEnde = 0;
let todeSumme = 0;
let maxSteps = 0;
const todOrte = {};

for (let i = 0; i < RUNS; i++) {
  const r = rng(1000 + i);
  const todeVorher = [];
  const { story, tags, steps, stuck: s } = play(json, (choices, st) => {
    todeVorher.push(variable(st, "tode"));
    return Math.floor(r() * choices.length);
  });
  maxSteps = Math.max(maxSteps, steps);
  if (s) stuck++;
  if (!tags.includes(ENDE_TAG)) ohneEnde++;
  for (const k of knots) if (visits(story, k.name) > 0) reached.set(k.name, reached.get(k.name) + 1);
  const gesehen = new Set(tags.filter((t) => t.startsWith("lore:")).map((t) => t.slice(5).trim()));
  for (const id of gesehen) loreGesehen.set(id, (loreGesehen.get(id) ?? 0) + 1);
  for (const n of NADELOEHRE) if (!s && visits(story, n) === 0) fail(`Durchlauf ${i}: Nadelöhr ${n} nicht erreicht`);
  todeSumme += variable(story, "tode");
  for (const t of tags.filter((t) => t.startsWith("tod:"))) todOrte[t.slice(4).trim()] = (todOrte[t.slice(4).trim()] ?? 0) + 1;
  for (const v of ["kleriker", "q_mutter", "maedchen_wo", "maedchen_tot", "gascoigne_moment", "eileen_partner", "gascoigne_verraten", "gascoigne_gewarnt", "gedaechtnis_kleriker", "waffe", "herkunft"]) {
    zaehle(v, String(variable(story, v)));
  }
}

if (stuck) fail(`${stuck} Durchläufe steckengeblieben (mehr als ${6000} Schritte)`);
if (ohneEnde) fail(`${ohneEnde} Durchläufe ohne Kapitelende`);
const tot = [...reached].filter(([, n]) => n === 0).map(([k]) => k);
for (const k of tot) fail(`Knoten nie erreicht: ${k}`);

const pct = (n) => `${Math.round((100 * n) / RUNS)} %`;
console.log(`  steckengeblieben: ${stuck}, ohne Ende: ${ohneEnde}, längster Lauf: ${maxSteps} Entscheidungen`);
console.log(`  Tode je Durchlauf (Zufallsspieler): ${(todeSumme / RUNS).toFixed(2)}`);
console.log("  Tode nach Ort:", todOrte);
console.log("  Ausgänge:");
for (const [k, v] of Object.entries(ausgaenge)) console.log(`    ${k}:`, Object.fromEntries(Object.entries(v).map(([a, n]) => [a, pct(n)])));
console.log("  Lore gesehen (Anteil der Durchläufe):");
console.log("   ", Object.fromEntries([...loreGesehen].sort((a, b) => a[1] - b[1]).map(([k, n]) => [k, pct(n)])));
console.log(`4) Umfang: ${knots.length} Knoten, ${loreStellen.size} Kern-Lore, ${pruefen} Prüfstellen (PRÜFEN), ~${platzhalterWoerter} Wörter Platzhaltertext`);

if (fehler) {
  console.log(`\nNICHT BESTANDEN: ${fehler} Befund(e).`);
  process.exit(1);
}
console.log("\nBESTANDEN.");
