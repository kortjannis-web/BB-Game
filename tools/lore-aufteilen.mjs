// Teilt quellen/lore-komplett.md (Lore-Dokument des Nutzers, Kürzel LK) in das Wurzelsystem lore/ auf.
// Einmalig bzw. bei neuer Fassung der Quelle: node tools/lore-aufteilen.mjs
// Handgeschriebene Dateien (lore/README.md, lore/kern.md, lore/kapitel/*.md, lore/offen.md) werden nie berührt.
// Seit der ersten Aufteilung (2026-11-04) werden die Dateien von Hand gepflegt: Ohne --neu überschreibt das Skript nichts,
// mit --neu schreibt es nach lore-neu/ zum Vergleich (Unterschiede dann von Hand zusammenführen).
import { readFileSync, writeFileSync, mkdirSync, existsSync } from "node:fs";
import { dirname, join } from "node:path";

const WURZEL = new URL("..", import.meta.url).pathname;
const zeilen = readFileSync(join(WURZEL, "quellen/lore-komplett.md"), "utf8").split("\n");

// Abschnitte nach Überschrift (Ebene 1 bis 3) mit Zeilenbereich
const abschnitte = [];
zeilen.forEach((z, i) => {
  const m = z.match(/^(#{1,3}) (.+)$/);
  if (m) abschnitte.push({ ebene: m[1].length, titel: m[2].trim(), von: i });
});
abschnitte.forEach((a, i) => {
  const naechster = abschnitte.slice(i + 1).find((b) => b.ebene <= a.ebene);
  a.bis = naechster ? naechster.von : zeilen.length;
});
const text = (a) => zeilen.slice(a.von + 1, a.bis).join("\n").replace(/^(---\n?)+|(\n---)+\s*$/g, "").trim();
const finde = (anfang) => {
  const a = abschnitte.find((b) => b.titel.startsWith(anfang));
  if (!a) throw new Error(`Abschnitt fehlt: ${anfang}`);
  return a;
};

const dateien = new Map(); // pfad -> { titel, kopf, teile: [] }
function lege(pfad, titel, kapitel, siehe = []) {
  if (!dateien.has(pfad)) dateien.set(pfad, { titel, kapitel, siehe, teile: [] });
  return dateien.get(pfad);
}
function haenge(pfad, abschnittTitel, inhalt, quelle) {
  dateien.get(pfad).teile.push({ abschnittTitel, inhalt, quelle });
}
const quelleVon = (a) => `LK ${a.titel.match(/^[\d.]+/)?.[0] ?? a.titel}`;

// ---------- Fraktionen und Welt (Kapitel 2 der Quelle)
const FRAKTIONEN = [
  ["2.1 ", "welt/welt.md", "Die Welt in einem Absatz", "alle"],
  ["2.2 ", "fraktionen/pthumerer.md", "Die Pthumerer und das Labyrinth", "ab 4"],
  ["2.3 ", "fraktionen/grosse-wesen.md", "Die Großen Wesen und die Kin", "Vorschein ab 1, offen ab 4"],
  ["2.4 ", "fraktionen/byrgenwerth.md", "Byrgenwerth und der Bruch", "Gerücht ab 2, offen ab 3"],
  ["2.5 ", "fraktionen/heilende-kirche.md", "Die Heilende Kirche und die Blutministration", "alle"],
  ["2.6 ", "fraktionen/chor.md", "Der Chor und das Waisenhaus", "Andeutung ab 2"],
  ["2.7 ", "fraktionen/mensis.md", "Die Schule von Mensis", "ab 4"],
  ["2.8 ", "fraktionen/cainhurst-und-henker.md", "Cainhurst, die Vilebloods und die Henker", "ab 2 (Alfred, Arianna)"],
  ["2.9 ", "fraktionen/jaeger.md", "Die Jäger, die Werkstatt, die Jäger der Jäger, der Jägertraum", "alle"],
  ["2.10 ", "welt/monde-und-albtraum.md", "Der Albtraum, der rote Mond und der blasse Mond", "Vorschein ab 1, offen ab 4"],
];
for (const [an, pfad, titel, kap] of FRAKTIONEN) {
  const a = finde(an);
  lege(pfad, titel, kap);
  haenge(pfad, null, text(a), quelleVon(a));
}
lege("fraktionen/buende.md", "Bünde (Jäger der Jäger, Henker, Vilebloods, League)", "ab 2");
haenge("fraktionen/buende.md", null, text(finde("5.2 ")), "LK 5.2");

// ---------- Handlung, Enden, Zeitlinie, Mechanik, Deutungen
lege("welt/spielablauf.md", "Die Handlung des Spiels in Kurzform", "alle (Planung, nie dem Spieler vorwegnehmen)");
haenge("welt/spielablauf.md", null, text(finde("3. Die Handlung")), "LK 3");
lege("welt/enden.md", "Die drei Enden", "6 (Planung)");
haenge("welt/enden.md", null, text(finde("8. Die drei Enden")), "LK 8");
lege("welt/zeitlinie.md", "Zeitlinie (Rekonstruktionen)", "alle (Planung)");
haenge("welt/zeitlinie.md", null, text(finde("10. Zeitlinie")), "LK 10");
lege("welt/mechanik-und-welt.md", "Spielregeln der Welt: Einsicht, Bestienwerdung, Blut, Laternen, Mondphasen", "alle");
haenge("welt/mechanik-und-welt.md", null, text(finde("9. Gameplay")), "LK 9");
lege("welt/glossar.md", "Glossar", "alle");
haenge("welt/glossar.md", null, text(finde("14. Glossar")), "LK 14");
lege("deutungen/theorien.md", "Theorien und Fan-Analysen (nur als Meinung einer Figur verwenden)", "alle (Deutung)");
haenge("deutungen/theorien.md", null, text(finde("11. Theorien")), "LK 11");
lege("deutungen/cut-content.md", "Gestrichene Inhalte (kein Kanon)", "Anregung");
haenge("deutungen/cut-content.md", null, text(finde("12. Cut Content")), "LK 12");
lege("deutungen/entwicklung-und-einfluesse.md", "Entwicklung, Einflüsse, Adaptionen", "Anregung");
haenge("deutungen/entwicklung-und-einfluesse.md", null, text(finde("13. Entwickleraussagen")), "LK 13");

// ---------- Figuren (NPCs) und Bosse
const slug = (s) => s.toLowerCase().replace(/ä/g, "ae").replace(/ö/g, "oe").replace(/ü/g, "ue").replace(/ß/g, "ss").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
const NPC_DATEI = {
  "Adella": ["figuren/adella.md", "Adella, Nonne der Heilenden Kirche", "2"],
  "Alfred": ["figuren/alfred.md", "Alfred, Jäger der Vilebloods (Henker)", "2"],
  "Annalise": ["figuren/annalise.md", "Annalise, Königin der Vilebloods", "ab 3"],
  "Arianna": ["figuren/arianna.md", "Arianna", "2"],
  "Brador": ["figuren/brador.md", "Brador (DLC)", "DLC"],
  "Djura": ["figuren/djura.md", "Djura, ausgeschiedener Jäger", "2"],
  "Eileen": ["figuren/eileen.md", "Eileen die Krähe", "1, 2"],
  "Vater Gascoigne": ["figuren/gascoigne.md", "Vater Gascoigne", "1"],
  "Gehrman": ["figuren/gehrman.md", "Gehrman, der erste Jäger", "alle"],
  "Gilbert": ["figuren/gilbert.md", "Gilbert", "1, 2"],
  "Henryk": ["figuren/henryk.md", "Henryk, alter Jäger", "1 (Name), 2"],
  "Iosefka": ["figuren/iosefka.md", "Iosefka und die falsche Iosefka", "1, 2"],
  "Meister (Propst) Willem": ["figuren/willem.md", "Meister Willem", "Gerücht ab 2, Auftritt ab 3"],
  "Alter Jäger Yamamura": ["figuren/yamamura.md", "Yamamura (DLC)", "DLC"],
  "Patches": ["figuren/patches.md", "Patches die Spinne", "2"],
  "Die Puppe": ["figuren/puppe.md", "Die Puppe", "alle"],
  "Heilige Adeline": ["figuren/adeline.md", "Heilige Adeline (DLC)", "DLC"],
  "Simon": ["figuren/simon.md", "Simon der Gequälte (DLC)", "DLC"],
  "Der Skeptische Mann": ["figuren/skeptischer-mann.md", "Der Skeptische Mann", "2"],
  "Der Verdächtige Bettler": ["figuren/verdaechtiger-bettler.md", "Der Verdächtige Bettler", "3"],
  "Valtr": ["figuren/valtr.md", "Valtr, Meister der League", "3, DLC"],
  "Die einsame alte Frau": ["figuren/einsame-alte-frau.md", "Die einsame alte Frau", "1, 2"],
  "Der Bewohner der Oedon-Kapelle": ["figuren/kapellenbewohner.md", "Der Bewohner der Oedon-Kapelle", "2"],
  "Der Blutminister": ["figuren/blutminister.md", "Der Blutminister", "1"],
  "Boten": ["figuren/boten.md", "Die Boten", "alle"],
  "Alte Jäger als Beschwör-NPCs": ["figuren/beschwoerbare-alte-jaeger.md", "Beschwörbare alte Jäger", "Anregung"],
};
const npcBlock = finde("5.1 Hauptspiel");
for (const a of abschnitte.filter((b) => b.ebene === 3 && b.von > npcBlock.von && b.bis <= npcBlock.bis)) {
  const key = Object.keys(NPC_DATEI).find((k) => a.titel.startsWith(k));
  if (!key) throw new Error(`NPC ohne Datei: ${a.titel}`);
  const [pfad, titel, kap] = NPC_DATEI[key];
  lege(pfad, titel, kap);
  haenge(pfad, "Als Figur", text(a), "LK 5.1");
}

const BOSS_DATEI = {
  "6.1.1 ": ["bosse/kleriker-bestie.md", "Die Kleriker-Bestie", "1"],
  "6.1.2 ": ["figuren/gascoigne.md", null, "1"],
  "6.1.3 ": ["figuren/amelia.md", "Vikarin Amelia", "2"],
  "6.1.4 ": ["bosse/blutdurstige-bestie.md", "Die Blutdurstige Bestie", "2"],
  "6.1.5 ": ["bosse/schatten-von-yharnam.md", "Die Schatten von Yharnam", "3"],
  "6.1.6 ": ["bosse/himmelsbote.md", "Der Himmelsbote", "spät"],
  "6.1.7 ": ["bosse/ebrietas.md", "Ebrietas, Tochter des Kosmos", "spät"],
  "6.1.8 ": ["bosse/rom.md", "Rom, die leere Spinne", "3, 4"],
  "6.1.9 ": ["bosse/hexe-von-hemwick.md", "Die Hexe von Hemwick", "3"],
  "6.1.10 ": ["figuren/logarius.md", "Märtyrer Logarius", "ab 3"],
  "6.1.11 ": ["bosse/paarl.md", "Dunkelbestie Paarl", "spät"],
  "6.1.12 ": ["bosse/amygdala.md", "Amygdala", "spät"],
  "6.1.13 ": ["bosse/wiedergeborene.md", "Die Wiedergeborene", "5"],
  "6.1.14 ": ["figuren/micolash.md", "Micolash", "5"],
  "6.1.15 ": ["bosse/mergos-amme.md", "Mergos Amme", "5"],
  "6.1.16 ": ["figuren/gehrman.md", null, "6"],
  "6.1.17 ": ["bosse/mondpraesenz.md", "Die Mondpräsenz", "6"],
  "6.2.1 ": ["figuren/laurence.md", "Laurence, der erste Vikar", "Gerücht ab 2, DLC"],
  "6.2.2 ": ["figuren/ludwig.md", "Ludwig", "Gerücht ab 1, DLC"],
  "6.2.3 ": ["bosse/lebende-fehlschlaege.md", "Die Lebenden Fehlschläge (DLC)", "DLC"],
  "6.2.4 ": ["figuren/maria.md", "Lady Maria (DLC)", "DLC"],
  "6.2.5 ": ["bosse/waise-von-kos.md", "Die Waise von Kos (DLC)", "DLC"],
  "6.2.6 ": ["bosse/blutige-kraehe.md", "Die Blutige Krähe von Cainhurst", "3"],
};
for (const [an, [pfad, titel, kap]] of Object.entries(BOSS_DATEI)) {
  const a = finde(an);
  lege(pfad, titel ?? a.titel, kap);
  haenge(pfad, "Als Boss", text(a), quelleVon(a));
}
lege("bosse/README.md", "Bosse: Überblick und Weltveränderungen", "alle");
haenge("bosse/README.md", "Weitere Bosse und Kelch-Bosse", text(finde("6.3 ")), "LK 6.3");
haenge("bosse/README.md", "Welche Bosse verändern die Welt", text(finde("6.4 ")), "LK 6.4");

// ---------- Orte
const ORT_DATEI = {
  "7.1.1 ": ["orte/jaegertraum.md", "Der Jägertraum", "alle"],
  "7.1.2 ": ["orte/zentral-yharnam.md", "Zentral-Yharnam und die Große Brücke", "1"],
  "7.1.3 ": ["orte/oedon-grab-und-kapelle.md", "Grab des Oedon und Oedon-Kapelle", "1, 2"],
  "7.1.4 ": ["orte/iosefkas-klinik.md", "Iosefkas Klinik", "1, 2"],
  "7.1.5 ": ["orte/kathedralbezirk.md", "Kathedralbezirk und Große Kathedrale", "2"],
  "7.1.6 ": ["orte/alt-yharnam.md", "Alt-Yharnam", "2"],
  "7.1.7 ": ["orte/verlassene-alte-werkstatt.md", "Verlassene Alte Werkstatt", "2, 3"],
  "7.1.8 ": ["orte/kirchenwerkstatt.md", "Die Werkstatt der Heilenden Kirche", "2, 3"],
  "7.1.9 ": ["orte/verbotener-wald.md", "Verbotener Wald", "3"],
  "7.1.10 ": ["orte/byrgenwerth.md", "Byrgenwerth und der Mondsee", "3, 4"],
  "7.1.11 ": ["orte/hemwick.md", "Hemwick", "3"],
  "7.1.12 ": ["orte/cainhurst.md", "Schloss Cainhurst", "ab 3"],
  "7.1.13 ": ["orte/obere-kathedrale.md", "Oberer Kathedralbezirk, Altar der Verzweiflung, Waisenhaus", "spät"],
  "7.1.14 ": ["orte/yahargul.md", "Yahar'gul, das Unsichtbare Dorf, und das Hypogäische Gefängnis", "4, 5"],
  "7.1.15 ": ["orte/albtraum-grenzland.md", "Albtraum-Grenzland und Vorlesungsgebäude", "5"],
  "7.1.16 ": ["orte/albtraum-von-mensis.md", "Albtraum von Mensis und Mergos Dachboden", "5"],
  "7.2 ": ["orte/kelchverliese.md", "Die Kelchverliese (Labyrinth)", "Anregung, ab 4"],
  "7.3.1 ": ["orte/jaegeralbtraum.md", "Der Albtraum der Jäger (DLC)", "DLC"],
  "7.3.2 ": ["orte/jaegeralbtraum.md", null, "DLC"],
  "7.3.3 ": ["orte/forschungshalle.md", "Die Forschungshalle (DLC)", "DLC"],
  "7.3.4 ": ["orte/fischerdorf.md", "Das Fischerdorf (DLC)", "DLC"],
};
for (const [an, [pfad, titel, kap]] of Object.entries(ORT_DATEI)) {
  const a = finde(an);
  lege(pfad, titel ?? a.titel, kap);
  haenge(pfad, a.titel.replace(/^[\d.]+\s*/, ""), text(a), quelleVon(a));
}

// ---------- Gegenstände: nach Thema statt Alphabet
const GRUPPEN = {
  "gegenstaende/yharnam-und-blut.md": ["Yharnam, Blut und Alltag der Stadt", "1, 2", ["Antidote", "Blood Vial", "Iosefka's Blood Vial", "Tiny Music Box", "Red Jeweled Brooch", "Sedative", "Blue Elixir", "Beast Blood Pellet", "Numbing Mist"]],
  "gegenstaende/jaeger-und-werkstatt.md": ["Jäger und Werkstatt: Waffen, Kleidung, Werkzeuge", "1, 2", ["Saw Cleaver", "Hunter Axe", "Hunter Set", "Gehrman's Hunter Set / Cap", "Burial Blade", "Old Hunter Badge", "Old Hunter Bone", "Molotov Cocktail", "Torch", "Hunter's Torch", "Fire Paper", "Bolt Paper", "Tonitrus / Tiny Tonitrus", "Spark Hunter Badge", "Charred Hunter Set", "Blade of Mercy", "Crow Hunter Badge", "Crowfeather Set", "Hunter's Mark", "Throwing Knife", "Henryk's Hunter Set", "Gascoigne's Set", "Powder Keg Hunter Badge", "Stake Driver", "Cannon", "Gatling Gun", "Grey Wolf Cap", "Beast Claw", "Beast Roar", "Blood Gem Workshop Tool", "Workshop Haze Extractor", "Rune Workshop Tool"]],
  "gegenstaende/jaegertraum.md": ["Jägertraum: Puppe und Boten", "alle", ["Doll Set", "Small Hair Ornament", "Tear Stone / Tear Blood Gem", "Messenger's Gift", "Notebook"]],
  "gegenstaende/heilende-kirche.md": ["Heilende Kirche: Kirchenjäger, Ärzte, Vikare, Gräberforscher", "1, 2", ["Black Church Set", "White Church Set", "Kirkhammer", "Ludwig's Holy Blade", "Ludwig's Rifle", "Holy Moonlight Sword", "Sword Hunter Badge", "Radiant Sword Hunter Badge", "Yharnam Hunter Set", "Harrowed Set", "Poison Knife", "Flamesprayer", "Hunter Chief Emblem", "Oedon Tomb Key", "Gold Blood Gem / Gold Pendant", "Laurence's Skull", "Blood of Adella", "Blood of Arianna", "Arianna's Shoes", "Tomb Prospector Set", "Madman Set", "Madman's Knowledge"]],
  "gegenstaende/chor-und-kosmos.md": ["Chor und Kosmos", "spät", ["A Call Beyond", "Augur of Ebrietas", "Blindfold Cap / Choir Set", "Choir Bell", "Cosmic Eye Watcher Badge", "Rosmarinus", "Orphanage Key", "Upper Cathedral Key", "Empty Phantasm Shell", "Great One's Wisdom", "Great One Coldblood", "Kin Coldblood", "Frenzied Coldblood", "One Third of Umbilical Cord (Nabelschnur)", "Tonsil Stone"]],
  "gegenstaende/byrgenwerth-und-mensis.md": ["Byrgenwerth und Mensis", "3 bis 5", ["Student Set / Student Uniform", "Graveguard Set", "Lunarium Key", "Mensis Cage", "Yahar'gul Set", "Lecture Theatre Key", "Iron Door Key", "Living String"]],
  "gegenstaende/caryll-runen.md": ["Caryll-Runen", "ab 2", ["Caryll Runes", "Anti-clockwise Metamorphosis", "Arcane Lake", "Beast", "Beast's Embrace", "Blood Rapture", "Communion", "Corruption", "Eye", "Formless Oedon", "Heir", "Hunter (Caryll-Rune)", "Milkweed", "Moon", "Oedon Writhe", "Radiance"]],
  "gegenstaende/cainhurst-und-henker.md": ["Cainhurst und die Henker", "ab 3", ["Blood Dreg", "Cainhurst Armor / Cainhurst Set", "Cainhurst Badge", "Cainhurst Summons", "Unopened Summons", "Chikage", "Evelyn", "Reiterpallasch", "Knight's Set", "Noble Dress", "Crown of Illusions", "Queenly Flesh", "Vileblood Register", "Executioner's Gloves", "Executioner Set", "Logarius' Wheel", "Wheel Hunter Badge"]],
  "gegenstaende/labyrinth-und-kelche.md": ["Labyrinth, Pthumerer und Kelche", "ab 4", ["Ailing Loran Chalice", "Ailing Loran Root Chalice", "Bastard of Loran", "Defiled Chalice", "Great Isz Chalice / Isz Chalice", "Isz Root Chalice", "Great Pthumeru Ihyll Chalice", "Hintertomb Chalice", "Pthumeru Chalice", "Pthumeru Root Chalice", "Pthumeru Ihyll Root Chalice", "Inflicted Organ", "Pearl Slug", "Red Jelly", "Sage's Hair / Sage's Wrist", "Shaman Bone Blade", "Yharnam Stone", "Bone Ash Set"]],
  "gegenstaende/dlc-albtraum.md": ["Albtraum der Jäger (DLC)", "DLC", ["Amygdalan Arm", "Kos Parasite", "Rakuyo", "Maria Hunter Set"]],
};
const itemZuGruppe = new Map();
for (const [pfad, [titel, kap, namen]] of Object.entries(GRUPPEN)) {
  lege(pfad, titel, kap);
  for (const n of namen) itemZuGruppe.set(n, pfad);
}
const itemBlock = finde("4. Items");
let aktuell = null;
const unbekannt = [];
for (let i = itemBlock.von + 1; i < itemBlock.bis; i++) {
  const z = zeilen[i];
  const m = z.match(/^\*\*([^*]+)\*\*/);
  if (m) {
    const pfad = itemZuGruppe.get(m[1]);
    if (!pfad) unbekannt.push(m[1]);
    aktuell = { pfad: pfad ?? "gegenstaende/sonstige.md", zeilen: [z] };
    if (!pfad) lege("gegenstaende/sonstige.md", "Sonstige Gegenstände", "–");
    haenge(aktuell.pfad, null, null, "LK 4");
    dateien.get(aktuell.pfad).teile.at(-1).ref = aktuell;
  } else if (aktuell && z.startsWith("- ") ) aktuell.zeilen.push(z);
  else if (!z.trim() || z.startsWith("#") || z.startsWith(">") || z.startsWith("---")) aktuell = z.trim() ? null : aktuell;
}

// ---------- Schreiben
let anzahl = 0;
for (const [pfad, d] of dateien) {
  const kopf = [`# ${d.titel}`, "", `> Quelle: \`quellen/lore-komplett.md\` (LK), Abschnitte ${[...new Set(d.teile.map((t) => t.quelle))].join(", ")}. Wichtig für Kapitel: ${d.kapitel}. Kennzeichnung der Quelle: ohne Zusatz = im Spiel belegt, **[Theorie]** = Deutung, *sinngemäß* = Inhalt, nicht Wortlaut. Für das Spiel gilt: [Theorie] nie als Tatsache erzählen. Wurzel und Lesepfade: \`lore/README.md\`.`, ""];
  const koerper = d.teile.map((t) => {
    if (t.ref) return t.ref.zeilen.join("\n");
    return (t.abschnittTitel ? `## ${t.abschnittTitel}\n\n` : "") + t.inhalt;
  });
  const ziel = join(WURZEL, process.argv.includes("--neu") ? "lore-neu" : "lore", pfad);
  if (!process.argv.includes("--neu") && existsSync(ziel) && !process.argv.includes("--erstmals")) continue;
  mkdirSync(dirname(ziel), { recursive: true });
  writeFileSync(ziel, kopf.join("\n") + "\n" + koerper.join("\n\n") + "\n");
  anzahl++;
}
console.log(`${anzahl} Dateien geschrieben.`);
if (unbekannt.length) console.log("Gegenstände ohne Gruppe (in sonstige.md):", unbekannt.join(", "));
