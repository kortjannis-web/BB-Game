// Vorschläge des Nutzers lesen: holt den Zweig "vorschlaege", zeigt jede eingereichte Änderung mit ihrer Stelle
// im Ink-Quelltext (Datei:Zeile), damit Claude sie einzeln umsetzen kann. Ablauf: docs/vorschlaege.md
//   npm run vorschlaege                  alle offenen Einreichungen (ohne Antwort)
//   npm run vorschlaege -- --alle        auch bereits beantwortete
//   npm run vorschlaege -- <datei.json>  eine Einreichung (Name aus eingang/ oder Pfad zu einer heruntergeladenen Datei)
import { execFileSync } from "node:child_process";
import { existsSync, readFileSync } from "node:fs";
import { inkFiles } from "./ink.mjs";

const ZWEIG = process.env.VORSCHLAG_ZWEIG ?? "vorschlaege";
const args = process.argv.slice(2);
const alle = args.includes("--alle");
const datei = args.find((a) => !a.startsWith("--"));

const git = (...a) => execFileSync("git", a, { encoding: "utf8", stdio: ["ignore", "pipe", "pipe"] });
try {
  git("fetch", "--quiet", "origin", `${ZWEIG}:refs/remotes/origin/${ZWEIG}`);
} catch {
  console.log(`(Konnte origin/${ZWEIG} nicht holen; nutze den lokalen Stand.)`);
}
const ref = `origin/${ZWEIG}`;
const liste = (ordner) => {
  try {
    return git("ls-tree", "--name-only", `${ref}:vorschlaege/${ordner}`).split("\n").filter((n) => n.endsWith(".json"));
  } catch {
    return [];
  }
};
const lesen = (pfad) => JSON.parse(git("show", `${ref}:${pfad}`));

// ------------------------------------------------------------ Stelle im Quelltext finden
const quellen = Object.entries(inkFiles()).map(([n, t]) => [`story/${n}`, t.split("\n")]);
const norm = (s) => (s ?? "").replace(/\s+/g, " ").trim();
function stelle(text) {
  const probe = norm(text).slice(0, 60);
  if (probe.length < 6) return null;
  for (const [n, zeilen] of quellen) {
    const i = zeilen.findIndex((z) => norm(z).includes(probe));
    if (i >= 0) return `${n}:${i + 1}`;
  }
  return null;
}
function knotenStelle(id) {
  if (!id) return null;
  const [knot, stitch] = id.split(".");
  for (const [n, zeilen] of quellen) {
    const k = zeilen.findIndex((z) => new RegExp(`^\\s*===\\s*${knot}\\b`).test(z));
    if (k < 0) continue;
    if (!stitch || stitch.startsWith("~")) return `${n}:${k + 1}`;
    const s = zeilen.findIndex((z, i) => i > k && new RegExp(`^\\s*=\\s*${stitch}\\s*$|\\(${stitch}\\)`).test(z));
    return `${n}:${(s >= 0 ? s : k) + 1}`;
  }
  return null;
}

// ------------------------------------------------------------ Ausgabe
const ARTEN = {
  text: "Text geändert", einfuegen: "Absatz eingefügt", loeschen: "Absatz gestrichen", wahl: "Entscheidung umbenannt",
  "wahl-ziel": "Entscheidung führt woandershin", "wahl-folge": "Folgetext einer Entscheidung", "wahl-neu": "Neue Entscheidung",
  "wahl-loeschen": "Entscheidung gestrichen", "passage-neu": "Neue Passage", "passage-loeschen": "Passage gestrichen",
  "passage-titel": "Passage umbenannt", quelle: "Quelltext geändert", notiz: "Kommentar an Claude (prüfen und umsetzen, nicht wörtlich übernehmen)", bewertung: "Entscheidung bewertet (gut/schlecht: analysieren)", datei: "Datei angehängt",
};
const einr = (s, n = 6) => String(s ?? "").split("\n").map((z) => " ".repeat(n) + z).join("\n");

function diff(vorher, nachher) {
  // Kleiner Zeilenvergleich (LCS), reicht für Knoten-Größe.
  const a = vorher.split("\n");
  const b = nachher.split("\n");
  const m = a.map(() => new Array(b.length + 1).fill(0));
  m.push(new Array(b.length + 1).fill(0));
  for (let i = a.length - 1; i >= 0; i--) for (let j = b.length - 1; j >= 0; j--) m[i][j] = a[i] === b[j] ? m[i + 1][j + 1] + 1 : Math.max(m[i + 1][j], m[i][j + 1]);
  const out = [];
  let i = 0;
  let j = 0;
  while (i < a.length || j < b.length) {
    if (i < a.length && j < b.length && a[i] === b[j]) {
      i++;
      j++;
    } else if (j < b.length && (i >= a.length || m[i][j + 1] >= m[i + 1][j])) out.push(`+ ${b[j++]}`);
    else out.push(`- ${a[i++]}`);
  }
  return out.join("\n");
}

function zeigen(name, paket, antwort) {
  console.log(`\n${"=".repeat(78)}\n${name}\n  „${paket.titel}“, ${new Date(paket.erstellt).toLocaleString("de-DE")}, ${paket.aenderungen.length} Änderungen${antwort ? "  [BEANTWORTET]" : ""}`);
  if (paket.kommentar) console.log(`  Kommentar: ${paket.kommentar}`);
  for (const a of paket.aenderungen) {
    const wo = a.ort?.datei ? `${a.ort.datei}:${a.ort.zeile}` : stelle(a.vorher ?? a.nach ?? "") ?? knotenStelle(a.knoten ?? a.passage);
    console.log(`\n  [${a.id}] ${ARTEN[a.art] ?? a.art}${a.passage ? ` · ${a.passage}` : ""}${wo ? ` · ${wo}` : ""}${a.seite ? ` · aus ${{ baum: "dem Erzählbaum", buch: "dem ganzen Buch", spiel: "dem Spiel" }[a.seite] ?? a.seite}` : ""}`);
    if (a.art === "quelle") {
      console.log(`      ${a.datei}${a.knoten ? ` › ${a.knoten}` : " (ganze Datei)"}`);
      console.log(einr(diff(a.vorher, a.nachher)));
    } else if (a.art === "passage-neu") {
      console.log(`      Titel: ${a.titel}${a.nahe ? `   (angelegt von ${a.nahe})` : ""}`);
      for (const z of a.zeilen ?? []) console.log(einr(z));
      for (const c of a.choices ?? []) console.log(`      › ${c.text}${c.ziel ? ` → ${c.ziel}` : ""}${c.folgen?.length ? `\n${einr(c.folgen.join("\n"), 8)}` : ""}`);
    } else if (a.art === "datei") {
      console.log(`      ${a.name} (${a.nachher.length} Zeichen; vollständig in der JSON-Datei)`);
    } else {
      if (a.wahlText) console.log(`      Entscheidung: ${a.wahlText}`);
      if (a.nachWahl) console.log(`      in der Entscheidung nach: ${a.nachWahl}`);
      if (a.markiert) console.log(`      MARKIERT:\n${einr(a.markiert, 8)}`);
      if (a.bis) console.log(`      bis Absatz${a.bisPassage && a.bisPassage !== a.passage ? ` (in ${a.bisPassage})` : ""}: ${a.bis}`);
      if (a.nach !== undefined) console.log(`      nach: ${a.nach}`);
      if (a.vorher !== undefined && a.vorher !== "") console.log(`      VORHER:\n${einr(a.vorher, 8)}`);
      const neu = a.art === "wahl-neu" ? a.text : a.nachher;
      if (neu !== undefined && a.art !== "loeschen" && a.art !== "wahl-loeschen" && a.art !== "passage-loeschen") console.log(`      NACHHER:\n${einr(neu, 8)}`);
      if (a.folge) console.log(`      dann:\n${einr(a.folge, 8)}`);
      if (a.ziel) console.log(`      → ${a.ziel}`);
    }
    if (a.kommentar) console.log(`      WARUM: ${a.kommentar}`);
    if (a.kontext) console.log(`      Kontext: ${Object.entries(a.kontext).filter(([, v]) => v !== undefined).map(([k, v]) => `${k}=${v}`).join(", ")}`);
    if (antwort?.aenderungen?.[a.id]) console.log(`      Antwort: ${antwort.aenderungen[a.id].status}: ${antwort.aenderungen[a.id].notiz ?? ""}`);
  }
}

if (datei && existsSync(datei)) {
  zeigen(datei, JSON.parse(readFileSync(datei, "utf8")), null);
} else {
  const eingang = liste("eingang");
  const antworten = new Set(liste("antworten"));
  const auswahl = datei ? eingang.filter((n) => n.includes(datei)) : eingang.filter((n) => alle || !antworten.has(n));
  if (!eingang.length) console.log(`Keine Vorschläge auf ${ref}.`);
  else if (!auswahl.length) console.log(`Keine offenen Vorschläge (${eingang.length} eingereicht, alle beantwortet). Mit --alle zeigen.`);
  for (const n of auswahl) zeigen(n, lesen(`vorschlaege/eingang/${n}`), antworten.has(n) ? lesen(`vorschlaege/antworten/${n}`) : null);
  if (auswahl.length) console.log(`\n${auswahl.length} Einreichung(en). Ablauf zum Umsetzen: docs/vorschlaege.md`);
}
