// Karte: erzeugt aus den .ink-Dateien ein Mermaid-Diagramm der Knoten und Übergänge (wie die Karte in Twine).
// Schreibt docs/karte-kapitel1.md. GitHub zeigt das Diagramm direkt an.
import { writeFileSync } from "node:fs";
import { inkFiles } from "./ink.mjs";

// Bausteine, die überall vorkommen, würden die Karte unlesbar machen.
const AUSGEBLENDET = new Set(["tod", "betreten", "ampulle_ruhig", "ampulle_gefahr", "schrei", "END", "DONE", "laterne", "traum_von_laterne", "puppe_erwacht", "boten_laden", "gehrman"]);
const TEILE = {
  "kapitel1/a_ankunft.ink": "A Ankunft",
  "kapitel1/b_yharnam.ink": "B Zentral-Yharnam (frei)",
  "kapitel1/n1_kleriker.ink": "NADELÖHR 1 Kleriker-Bestie",
  "kapitel1/c_unterstadt.ink": "C Unterstadt (frei)",
  "kapitel1/n2_gascoigne.ink": "NADELÖHR 2 Gascoigne",
  "kapitel1/d_nachspiel.ink": "D Nachspiel",
  "traum.ink": "Jägertraum",
};

const files = inkFiles();
const knotFile = new Map();
const titel = new Map();
const edges = new Set();
for (const [file, src] of Object.entries(files)) {
  let current = null;
  for (const line of src.split("\n")) {
    const k = line.match(/^===\s*(function\s+)?([A-Za-z_]\w*)/);
    if (k) {
      current = k[1] ? null : k[2];
      if (current) knotFile.set(current, file);
      continue;
    }
    const t = line.match(/^\/\/\s*TITEL:\s*(.+)$/);
    if (t && current) titel.set(current, t[1].trim());
    if (!current || line.trim().startsWith("//")) continue;
    for (const m of line.matchAll(/->\s*([A-Za-z_][\w]*)(?:\.[\w]+)?/g)) {
      const target = m[1];
      if (target !== current && !AUSGEBLENDET.has(target)) edges.add(`${current}|${target}`);
    }
  }
}

const id = (k) => k.replace(/[^\w]/g, "_");
const label = (k) => (titel.get(k) ?? k).replace(/"/g, "'");
let out = "flowchart TD\n";
for (const [file, name] of Object.entries(TEILE)) {
  const ks = [...knotFile].filter(([, f]) => f === file).map(([k]) => k).filter((k) => !AUSGEBLENDET.has(k));
  if (!ks.length) continue;
  out += `  subgraph ${id(file)}["${name}"]\n`;
  for (const k of ks) out += `    ${id(k)}["${label(k)}"]\n`;
  out += "  end\n";
}
for (const e of [...edges].sort()) {
  const [a, b] = e.split("|");
  if (knotFile.has(a) && knotFile.has(b)) out += `  ${id(a)} --> ${id(b)}\n`;
}

const md = `# Karte Kapitel 1 (automatisch erzeugt)

Erzeugt mit \`npm run karte\` aus den Ink-Dateien. Nicht von Hand bearbeiten.
Ausgeblendet sind Bausteine, die überall vorkommen (Tod, Ampulle, Laterne, Traum-Laden).

\`\`\`mermaid
${out}\`\`\`
`;
writeFileSync(new URL("../docs/karte-kapitel1.md", import.meta.url), md);
console.log(`Karte geschrieben: ${knotFile.size} Knoten, ${edges.size} Übergänge.`);
