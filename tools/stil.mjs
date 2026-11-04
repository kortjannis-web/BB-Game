// Stilprüfer: findet Muster, die der Nutzer als schwach, unlogisch oder störend benannt hat
// (Kritik 2026-11-04, Plan in docs/stil-und-lore-plan.md, Stimme in docs/stimme.md).
// Aufruf: npm run stil            alle Befunde mit Datei und Zeile
//         node tools/stil.mjs --kurz   nur die Zusammenfassung (Teil von npm run check)
//         node tools/stil.mjs --streng  Befunde der Klasse „fehler“ lassen den Lauf scheitern
// Vorerst sind alle Klassen Warnungen; wird ein Bereich sauber, kann er in STRENG aufgenommen werden.
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, relative } from "node:path";

const WURZEL = new URL("..", import.meta.url).pathname;
const KURZ = process.argv.includes("--kurz");
const STRENG = process.argv.includes("--streng");
// Klassen, die bei --streng als Fehler zählen
const FEHLERKLASSEN = new Set(["option-ein-wort", "option-zeichen", "option-meta", "ampulle-trinken", "gedankenstrich", "sperrwort"]);

function dateien(dir) {
  const aus = [];
  for (const n of readdirSync(dir)) {
    const p = join(dir, n);
    if (statSync(p).isDirectory()) aus.push(...dateien(p));
    else if (n.endsWith(".ink")) aus.push(p);
  }
  return aus;
}

// Wörter aus unserer Gegenwart oder Umgangssprache, die in Yharnam rauswerfen
const SPERRWOERTER = [/\bKram\b/, /\bokay\b/i, /\bchecken\b/i, /\bStreichholz/i, /\bMach ich\b/, /\bNa, na\b/, /\bsuper\b/i, /\bcool\b/i, /\bStress\b/, /\bJob\b/, /\bTipp\b/, /\bProblem\b/, /\bmega\b/i, /\bHallo\b/];
// Spielbegriffe, die im Erzähltext die Welt brechen (in Optionen, Kommentaren und Notizbuch erlaubt)
const SPIELBEGRIFFE = [/\bEinsicht\b/, /\bStärkung\b/, /\bLevel\b/i, /\bLebenspunkt/i];
// Verlegenheits- und Tic-Wörter: höchstens eines je Absatz
const TICS = [/\betwas\b/g, /\blangsam\w*/g, /\bplötzlich\b/g, /\bauf einmal\b/g, /\bscheint\b|\bscheinen\b/g, /\birgendwie\b/g];
const VERGLEICH = /\bwie (ein|eine|einer|einen|einem)\b|\bals (ob|hätte|hättest|wäre|wärst|sei|habe|würde|könne|stünde|läge)\b/g;
const META_OPTION = /^(Ihm|Ihr|Ihn|Sie|Dich)?\s*(\w+\s+)?(sagen|fragen|erzählen|versprechen|raten|drohen|anfahren|antworten|bitten)\b|\b(sagen|fragen|erzählen|versprechen|raten|drohen|anfahren)\s*$/;

const befunde = [];
const melde = (klasse, datei, zeile, text) => befunde.push({ klasse, datei: relative(WURZEL, datei), zeile, text: text.length > 110 ? text.slice(0, 107) + "…" : text });

// Sichtbaren Text einer Zeile gewinnen: Tags, Kommentare, Logik weg; einfache Bedingungen aufgelöst (alle Zweige zusammen).
function sichtbar(z) {
  let s = z.replace(/\/\/.*$/, "").replace(/#.*$/, "");
  s = s.replace(/^\s*[-+*]+\s*(\([^)]*\))?\s*(\{[^{}]*\}\s*)?/, "");
  s = s.replace(/\[[^\]]*\]/g, "");
  s = s.replace(/->\s*[\w.]+(\s*->)?/g, "");
  s = s.replace(/\{[^{}:]*:/g, "").replace(/[{}|]/g, " ");
  return s.replace(/\s+/g, " ").trim();
}

function inhaltswoerter(t) {
  return t.toLowerCase().replace(/[„“‚‘.,;:!?()]/g, " ").split(/\s+/).filter((w) => w.length > 3);
}

const knotenStatistik = [];

for (const datei of dateien(join(WURZEL, "story"))) {
  const zeilen = readFileSync(datei, "utf8").split("\n");
  let knoten = null;
  let saetze = [];
  const knotenAbschluss = () => {
    if (knoten && saetze.length >= 8) {
      const laengen = saetze.map((s) => s.split(/\s+/).length);
      const mittel = laengen.reduce((a, b) => a + b, 0) / laengen.length;
      knotenStatistik.push({ knoten, datei: relative(WURZEL, datei), mittel, anzahl: laengen.length });
    }
    saetze = [];
  };
  for (let i = 0; i < zeilen.length; i++) {
    const roh = zeilen[i];
    const nr = i + 1;
    const z = roh.trim();
    const k = z.match(/^===\s*(\w+)/);
    if (k) {
      knotenAbschluss();
      knoten = k[1];
      continue;
    }
    if (!z || z.startsWith("//") || z.startsWith("~") || z.startsWith("VAR") || z.startsWith("CONST") || z.startsWith("LIST") || z.startsWith("INCLUDE") || z.startsWith("=== function")) continue;

    // --- Optionen
    const opt = z.match(/^[+*]+\s*(\([^)]*\)\s*)?(\{[^}]*\}\s*)?\[([^\]]+)\]/);
    if (opt) {
      const o = opt[3].replace(/\{[^{}:]*:([^|}]*)\|[^}]*\}/g, "$1").trim();
      const gesprochen = /^„/.test(o);
      const woerter = o.replace(/[„“]/g, "").split(/\s+/).filter(Boolean);
      if (woerter.length === 1) melde("option-ein-wort", datei, nr, o);
      if (!gesprochen && /[;:]/.test(o)) melde("option-zeichen", datei, nr, o);
      if (!gesprochen && META_OPTION.test(o)) melde("option-meta", datei, nr, o);
      if (!gesprochen && /^(Die|Der|Das|Den)\s/.test(o) && !/\b\w+(en|ern|eln)\b\s*$/.test(o)) melde("option-menue", datei, nr, o);
      if (woerter.length > 9) melde("option-lang", datei, nr, o);
      if (/Blutampulle trinken/.test(o)) melde("ampulle-trinken", datei, nr, o);
      // Echo: erste sichtbare Zeile danach wiederholt die Option
      const ow = new Set(inhaltswoerter(o));
      if (ow.size >= 2) {
        for (let j = i + 1; j < Math.min(zeilen.length, i + 5); j++) {
          const n = zeilen[j].trim();
          if (!n || n.startsWith("~") || n.startsWith("//") || n.startsWith("{") && !sichtbar(n)) continue;
          if (/^[+*-]|^=/.test(n)) break;
          const erster = sichtbar(n).split(/(?<=[.!?“])\s/)[0] || "";
          const treffer = inhaltswoerter(erster).filter((w) => ow.has(w)).length;
          if (treffer >= Math.max(2, Math.ceil(ow.size * 0.6))) melde("option-echo", datei, j + 1, `${o}  →  ${erster}`);
          break;
        }
      }
      continue;
    }

    // --- Erzähltext
    const t = sichtbar(roh);
    if (t.length < 15) continue;
    if (/ [–—] | - /.test(t)) melde("gedankenstrich", datei, nr, t);
    for (const r of SPERRWOERTER) if (r.test(t)) melde("sperrwort", datei, nr, `${t.match(r)[0]}: ${t}`);
    if (!/#\s*(stil|notiz|lore):?\s*einsicht/.test(roh) && !/„[^“]*Einsicht/.test(t)) for (const r of SPIELBEGRIFFE) if (r.test(t)) melde("spielbegriff", datei, nr, `${t.match(r)[0]}: ${t}`);
    for (const r of TICS) {
      const n = (t.match(r) || []).length;
      if (n >= 2) melde("tic", datei, nr, `${t.match(r)[0]} ×${n}: ${t}`);
    }
    const v = (t.match(VERGLEICH) || []).length;
    if (v >= 2) melde("vergleich", datei, nr, `×${v}: ${t}`);
    const satzliste = t.split(/(?<=[.!?])\s+(?=[A-ZÄÖÜ„])/).filter((s) => s.split(/\s+/).length > 1);
    let du = 0;
    for (const s of satzliste) {
      du = /^„?Du\b/.test(s) ? du + 1 : 0;
      if (du === 3) melde("du-anfang", datei, nr, s);
    }
    saetze.push(...satzliste);
  }
  knotenAbschluss();
}

for (const s of knotenStatistik) if (s.mittel < 12) melde("satzlaenge", s.datei, 0, `${s.knoten}: Ø ${s.mittel.toFixed(1)} Wörter je Satz (${s.anzahl} Sätze), Ziel 14 bis 18`);

const nachKlasse = {};
for (const b of befunde) (nachKlasse[b.klasse] ??= []).push(b);
const ERKLAERUNG = {
  "option-ein-wort": "Option aus einem Wort",
  "option-zeichen": "Option mit Semikolon oder Doppelpunkt",
  "option-meta": "Option mit Meta-Verb (sagen, fragen, versprechen …) statt eigener Rede",
  "option-menue": "Option als Menüpunkt (Artikel + Ort, kein Verb)",
  "option-lang": "Option länger als neun Wörter",
  "option-echo": "Text danach wiederholt die Option",
  "ampulle-trinken": "„Blutampulle trinken“, obwohl man sie sich in den Schenkel stößt",
  gedankenstrich: "Gedankenstrich im Erzähltext",
  sperrwort: "Wort aus unserer Gegenwart",
  spielbegriff: "Spielbegriff im Erzähltext",
  tic: "Verlegenheitswort mehrfach in einer Zeile",
  vergleich: "mehr als ein Vergleich in einer Zeile",
  "du-anfang": "drei Sätze in Folge beginnen mit „Du“",
  satzlaenge: "Knoten mit zu kurzen Sätzen (Stakkato)",
};
console.log("Stilprüfer (Warnungen; Regeln: docs/stimme.md, docs/stil-und-lore-plan.md)");
for (const [klasse, liste] of Object.entries(nachKlasse).sort((a, b) => b[1].length - a[1].length)) {
  console.log(`  ${String(liste.length).padStart(4)}  ${ERKLAERUNG[klasse] ?? klasse}`);
  if (!KURZ) for (const b of liste) console.log(`          ${b.datei}:${b.zeile}  ${b.text}`);
}
if (!befunde.length) console.log("  keine Befunde");
const fehler = befunde.filter((b) => FEHLERKLASSEN.has(b.klasse)).length;
if (STRENG && fehler) {
  console.log(`\nNICHT BESTANDEN (streng): ${fehler} Befunde in Fehlerklassen.`);
  process.exit(1);
}
