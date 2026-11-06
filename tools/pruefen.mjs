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
// Feste Stationen, die in jedem Durchlauf vorkommen müssen (Entscheidungsbuch, Fassung 2): Kreuzung, Eileen, beide Nadelöhre,
// die Kanalisation-Mündung, die zweite Traumszene, die Gräber und das Kapitelende.
const NADELOEHRE = ["k1_b_gilbert", "k1_b_scheiterhaufen", "k1_b_eileen", "k1_n1_kleriker", "k1_c_kanal", "k1_traum_zwei", "k1_c_graeber", "k1_c_eileen", "k1_n2_gascoigne", "k1_d_traum"];
// Wahlstationen je Viertel (zwei von drei): jede der neun Routen ist eine Auslassung je Viertel.
const VIERTEL = [["k1_b_tueren", "k1_b_anschlag", "k1_b_haus"], ["k1_b_maedchen", "k1_b_daecher", "k1_b_dachweg"]];
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

// Tod und Neustart (Prüfbericht 2026-11-06): Jeder Knoten, der `-> tod` enthält, muss sein Ziel `kampfanfang` selbst setzen.
const knotenText = new Map();
for (const [file, src] of Object.entries(files)) {
  let cur = null;
  for (const line of src.split("\n")) {
    const m = line.match(/^===\s*(?:function\s+)?([A-Za-z_]\w*)/);
    if (m) cur = m[1];
    if (cur) knotenText.set(cur, (knotenText.get(cur) ?? "") + line + "\n");
  }
}
for (const [name, text] of knotenText) {
  if (/->\s*tod\b/.test(text.replace(/\/\/.*$/gm, "")) && !/~\s*kampfanfang\s*=/.test(text) && name !== "tod") fail(`Knoten ${name} führt zum Tod, setzt aber kein kampfanfang (Rückkehr an den Anfang des Kampfes)`);
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
const routenLore = new Map(); // Route (Auslassungen) → Menge der gesehenen Lore-Ids
const routenLaeufe = new Map();

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
  const route = VIERTEL.map((v) => v.find((k) => visits(story, k) === 0) ?? "-").join(" | ohne ");
  if (!routenLore.has(route)) routenLore.set(route, new Set());
  for (const id of gesehen) routenLore.get(route).add(id);
  routenLaeufe.set(route, (routenLaeufe.get(route) ?? 0) + 1);
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

// Lore auf jeder Route (neue Regel des Umbaus): Wer eine Station auslässt, darf keine Kern-Lore verpassen, die auf dieser Route möglich sein muss.
console.log("  Routen (Auslassungen je Viertel) und ihre Läufe:", Object.fromEntries(routenLaeufe));
for (const [route, ids] of routenLore) {
  const fehlt = [...loreStellen.keys()].filter((id) => !ids.has(id));
  if (fehlt.length) fail(`Route „ohne ${route}“: Lore nie gesehen (${routenLaeufe.get(route)} Läufe): ${fehlt.join(", ")}`);
}

const pct = (n) => `${Math.round((100 * n) / RUNS)} %`;
console.log(`  steckengeblieben: ${stuck}, ohne Ende: ${ohneEnde}, längster Lauf: ${maxSteps} Entscheidungen`);
console.log(`  Tode je Durchlauf (Zufallsspieler): ${(todeSumme / RUNS).toFixed(2)}`);
console.log("  Tode nach Ort:", todOrte);
console.log("  Ausgänge:");
for (const [k, v] of Object.entries(ausgaenge)) console.log(`    ${k}:`, Object.fromEntries(Object.entries(v).map(([a, n]) => [a, pct(n)])));
console.log("  Lore gesehen (Anteil der Durchläufe):");
console.log("   ", Object.fromEntries([...loreGesehen].sort((a, b) => a[1] - b[1]).map(([k, n]) => [k, pct(n)])));
console.log(`4) Umfang: ${knots.length} Knoten, ${loreStellen.size} Kern-Lore, ${pruefen} Prüfstellen (PRÜFEN), ~${platzhalterWoerter} Wörter Text`);

if (fehler) {
  console.log(`\nNICHT BESTANDEN: ${fehler} Befund(e).`);
  process.exit(1);
}
console.log("\nBESTANDEN.");
