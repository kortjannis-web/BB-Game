// Twine-Ansicht: zerlegt die Ink-Dateien in Passagen (Knoten, Stitches, Sammelpunkte) mit ihren Entscheidungen
// und Übergängen, berechnet ein Twine-artiges Layout (Start oben, Linien zu den Folgen) und schreibt:
//   web/twine.json                  Daten für die Ansicht web/karte.html
//   docs/yharnam-kapitel1.twee      Twee-3-Datei zum Öffnen in Twine (Bibliothek → Importieren)
// Nichts wird von Hand kopiert: Quelle sind allein die .ink-Dateien. Aufruf: npm run twine
import { writeFileSync } from "node:fs";
import { createRequire } from "node:module";
import { inkFiles } from "./ink.mjs";

const dagre = createRequire(import.meta.url)("dagre");

const START = "k1_prolog";
const TEILE = {
  "kapitel1/a_ankunft.ink": ["A", "Ankunft"],
  "kapitel1/b_yharnam.ink": ["B", "Akt II: Zentral-Yharnam"],
  "kapitel1/n1_kleriker.ink": ["N1", "Nadelöhr 1: Kleriker-Bestie"],
  "kapitel1/c_unterstadt.ink": ["C", "Akt III: Unterstadt"],
  "kapitel1/n2_gascoigne.ink": ["N2", "Nadelöhr 2: Gascoigne"],
  "kapitel1/d_nachspiel.ink": ["D", "Akt IV: Heimweg"],
  "traum.ink": ["T", "Jägertraum"],
  "nachbild.ink": ["T", "Jägertraum"],
  "system.ink": ["S", "Bausteine"],
};
// Bausteine, die von überall angesprungen werden; in der Story-Ansicht ausgeblendet.
const BAUSTEINE = new Set(["tod", "betreten", "ampulle_ruhig", "ampulle_gefahr"]);

// ---------------------------------------------------------------- Zerlegen
const passages = new Map();
const order = [];
const ids = new Set(["END", "KAMPFANFANG"]);

function stripTags(s) {
  // Alles ab dem ersten "#" (am Zeilenanfang oder nach Leerraum) sind Tags, durch "#" getrennt.
  const i = s.search(/(^|\s)#/);
  if (i < 0) return { text: s.trim(), tags: [] };
  const tags = s.slice(i).split("#").map((t) => t.trim()).filter(Boolean);
  return { text: s.slice(0, i).trim(), tags };
}

/** Diverts einer Zeile: Ziel (oder null), Tunnelaufrufe, bedingte Ziele, Rücksprung. */
function diverts(line) {
  // Zuweisungen (~ kampfanfang = -> knoten) speichern nur ein Sprungziel, sie springen nicht
  if (line.trim().startsWith("~")) return { ziel: null, tunnel: [], bedingt: [], rueck: false };
  const bedingt = [];
  const ohneBedingung = line.replace(/\{[^{}]*\}/g, (block) => {
    for (const m of block.matchAll(/->\s*([A-Za-z_][\w.]*)/g)) bedingt.push(m[1]);
    return "";
  });
  if (ohneBedingung.includes("->->")) return { ziel: null, tunnel: [], bedingt, rueck: true };
  const teile = ohneBedingung.split("->");
  if (teile.length < 2) return { ziel: null, tunnel: [], bedingt, rueck: false };
  const namen = teile.slice(1).map((t) => t.trim().replace(/\(.*$/, "").trim());
  const endetMitPfeil = ohneBedingung.trim().endsWith("->");
  const ziel = endetMitPfeil ? null : namen[namen.length - 1] || null;
  const tunnel = (endetMitPfeil ? namen : namen.slice(0, -1)).filter(Boolean);
  return { ziel, tunnel, bedingt, rueck: false };
}

const braceDelta = (s) => (s.match(/\{/g) ?? []).length - (s.match(/\}/g) ?? []).length;

for (const [file, src] of Object.entries(inkFiles())) {
  if (file === "main.ink" || file.endsWith("zustand.ink")) continue;
  const [gruppe] = TEILE[file] ?? ["S"];
  let knot = null;
  let knotTitel = null;
  let stitch = null;
  let cur = null;
  let choice = null;
  let depth = 0;
  let anon = 0;
  let istFunktion = false;

  const ctx = () => ({ knot, stitch });
  const neu = (id, titel, art) => {
    // Durchfall: eine Passage ohne Abschluss fließt in den nächsten Sammelpunkt desselben Knotens
    if (cur && art === "sammel" && cur.knot === knot) {
      if (cur.choices.length) for (const c of cur.choices) if (!c.zielRoh && !c.endet) c.zielRoh = { name: id, ctx: ctx(), direkt: true };
      if (!cur.choices.length && !cur.abgeschlossen) cur.weiter.push({ name: id, ctx: ctx(), direkt: true, art: "weiter" });
    }
    const p = { id, titel, gruppe, datei: file, knot, art, zeilen: [], logik: [], tags: [], herkunft: [], choices: [], weiter: [], abgeschlossen: false };
    passages.set(id, p);
    order.push(id);
    ids.add(id);
    cur = p;
    choice = null;
    return p;
  };

  for (const raw of src.split("\n")) {
    const line = raw.replace(/\s+$/, "");
    const t = line.trim();
    if (!t) continue;

    const k = t.match(/^===\s*(function\s+)?([A-Za-z_]\w*)/);
    if (k) {
      istFunktion = !!k[1];
      if (istFunktion) {
        cur = null;
        continue;
      }
      knot = k[2];
      stitch = null;
      anon = 0;
      depth = 0;
      knotTitel = knot;
      neu(knot, knot, "knoten");
      continue;
    }
    if (istFunktion || !cur) continue;

    const titel = t.match(/^\/\/\s*TITEL:\s*(.+)$/);
    if (titel) {
      if (cur.id === knot) {
        knotTitel = titel[1].trim();
        cur.titel = knotTitel;
      }
      continue;
    }
    if (t.startsWith("//")) {
      const h = t.match(/\[(KANON|KANON-nah|ERWEITERT|OFFEN)\]|PRÜFEN/);
      if (h) cur.herkunft.push(t.replace(/^\/\/\s*/, ""));
      continue;
    }

    const st = t.match(/^=\s*([A-Za-z_]\w*)\s*$/);
    if (st && depth === 0) {
      stitch = st[1];
      anon = 0;
      neu(`${knot}.${stitch}`, `${knotTitel} › ${stitch}`, "stitch");
      continue;
    }

    const container = stitch ? `${knot}.${stitch}` : knot;
    const eingerueckt = /^\s/.test(line);

    // Entscheidung
    const ch = depth === 0 && !eingerueckt && t.match(/^([*+])\s*(?:\(([\w]+)\)\s*)?(?:\{([^}]*)\}\s*)?\[(.*?)\]\s*(.*)$/);
    if (ch) {
      const d = diverts(ch[5]);
      choice = { text: ch[4], bedingung: ch[3]?.trim() ?? null, wiederholbar: ch[1] === "+", folgen: [], logik: [], zielRoh: null, tunnel: [], bedingt: [], endet: false };
      if (d.ziel) choice.zielRoh = { name: d.ziel, ctx: ctx() };
      if (d.rueck) choice.endet = true;
      choice.tunnel.push(...d.tunnel.map((n) => ({ name: n, ctx: ctx() })));
      cur.choices.push(choice);
      continue;
    }

    // Zeile im Körper einer Entscheidung
    if (choice && eingerueckt) {
      const d = diverts(t);
      if (d.ziel) choice.zielRoh = { name: d.ziel, ctx: ctx() };
      if (d.rueck) choice.endet = true;
      choice.tunnel.push(...d.tunnel.map((n) => ({ name: n, ctx: ctx() })));
      choice.bedingt.push(...d.bedingt.map((n) => ({ name: n, ctx: ctx() })));
      if (t.startsWith("~")) choice.logik.push(t.slice(1).trim());
      else if (!t.includes("->") && !/^[{}]/.test(t) && !/^-\s/.test(t)) {
        const { text } = stripTags(t);
        if (text) choice.folgen.push(text);
      } else if (/^\{[^}]*:$/.test(t)) choice.folgen.push(`⟨wenn ${t.slice(1, -1).trim()}⟩`);
      else if (/^-\s*else\s*:/.test(t)) choice.folgen.push("⟨sonst⟩");
      depth = Math.max(0, depth + braceDelta(t) * 0);
      continue;
    }

    // Sammelpunkt (Gather) auf oberster Ebene
    const g = depth === 0 && t.match(/^-\s*(?:\(([\w]+)\))?\s*(.*)$/);
    if (g && !t.startsWith("->")) {
      const label = g[1];
      const id = label ? `${container}.${label}` : `${container}.~${++anon}`;
      const name = label ? `${knotTitel}${stitch ? ` › ${stitch}` : ""} › ${label}` : `${knotTitel}${stitch ? ` › ${stitch}` : ""} › weiter`;
      neu(id, name, "sammel");
      const rest = g[2]?.trim();
      if (rest) {
        const d = diverts(rest);
        if (d.ziel) {
          cur.weiter.push({ name: d.ziel, ctx: ctx(), art: "weiter" });
          cur.abgeschlossen = true;
        }
        for (const b of d.bedingt) cur.weiter.push({ name: b, ctx: ctx(), art: "bedingt" });
        if (!rest.startsWith("{") && !rest.includes("->")) {
          const { text, tags } = stripTags(rest);
          if (text) cur.zeilen.push(text);
          cur.tags.push(...tags);
        }
      }
      continue;
    }
    choice = null;

    // Logik, Diverts, Bedingungsblöcke, Text
    const d = diverts(t);
    for (const n of d.tunnel) cur.weiter.push({ name: n, ctx: ctx(), art: "tunnel" });
    for (const b of d.bedingt) cur.weiter.push({ name: b, ctx: ctx(), art: "bedingt" });
    if (d.ziel) {
      cur.weiter.push({ name: d.ziel, ctx: ctx(), art: depth > 0 ? "bedingt" : "weiter" });
      if (depth === 0) cur.abgeschlossen = true;
    }
    if (d.rueck && depth === 0) cur.abgeschlossen = true;

    if (t.startsWith("~")) cur.logik.push(t.slice(1).trim());
    else if (t.startsWith("#")) cur.tags.push(...stripTags(t).tags);
    else if (/^\{[^}]*:$/.test(t) || /^\{\s*[\w.]+\s*:$/.test(t)) cur.zeilen.push(`⟨wenn ${t.slice(1, -1).trim()}⟩`);
    else if (depth > 0 && /^-\s*else\s*:/.test(t)) {
      cur.zeilen.push("⟨sonst⟩");
      const rest = t.replace(/^-\s*else\s*:\s*/, "");
      if (rest && !rest.includes("->")) cur.zeilen.push(stripTags(rest).text);
    } else if (depth > 0 && /^-\s*[^:]+:/.test(t)) {
      const m = t.match(/^-\s*([^:]+):\s*(.*)$/);
      cur.zeilen.push(`⟨bei ${m[1].trim()}⟩`);
      if (m[2] && !m[2].includes("->")) cur.zeilen.push(stripTags(m[2]).text);
    } else if (t === "}") {
      /* Blockende */
    } else if (/^\{.*\}(\s*#.*)?$/.test(t) && braceDelta(t) === 0) {
      // einzeilige Bedingung {bedingung: Text} oder Zufallstext {~a|b|c}
      const { text, tags } = stripTags(t);
      cur.tags.push(...tags);
      const zufall = text.match(/^\{~(.*)\}$/);
      const bed = text.match(/^\{\s*([^:{}]+):\s*(.*)\}$/);
      if (zufall) cur.zeilen.push(`⟨zufällig eine von⟩ ${zufall[1].split("|").join(" ／ ")}`);
      else if (bed && !bed[2].includes("->")) cur.zeilen.push(`⟨wenn ${bed[1].trim()}⟩ ${bed[2]}`);
    } else if (!t.startsWith("->") && !t.includes("->")) {
      const { text, tags } = stripTags(t);
      if (text) cur.zeilen.push(text);
      cur.tags.push(...tags);
    }
    depth = Math.max(0, depth + braceDelta(t));
  }
}

// ---------------------------------------------------------------- Namen auflösen
function aufloesen({ name, ctx, direkt }) {
  if (direkt) return name;
  if (name === "END" || name === "DONE") return "END";
  if (name === "kampfanfang") return "KAMPFANFANG";
  const kandidaten = [];
  if (name.includes(".")) kandidaten.push(name);
  if (ctx.stitch) kandidaten.push(`${ctx.knot}.${ctx.stitch}.${name}`);
  kandidaten.push(`${ctx.knot}.${name}`, name);
  const gefunden = kandidaten.find((k) => ids.has(k));
  if (gefunden) return gefunden;
  // Ink findet Marken auch in anderen Stitches desselben Knotens
  return [...ids].find((k) => k.startsWith(`${ctx.knot}.`) && k.endsWith(`.${name}`)) ?? null;
}

const offen = [];
const kanten = [];
for (const id of order) {
  const p = passages.get(id);
  for (const w of p.weiter) {
    const ziel = aufloesen(w);
    if (!ziel) offen.push(`${id} → ${w.name}`);
    else kanten.push({ von: id, nach: ziel, art: ziel === "tod" ? "tod" : w.art });
  }
  p.choices.forEach((c, i) => {
    c.ziel = c.zielRoh ? aufloesen(c.zielRoh) : null;
    if (c.zielRoh && !c.ziel) offen.push(`${id} [${c.text}] → ${c.zielRoh.name}`);
    if (c.ziel) kanten.push({ von: id, nach: c.ziel, art: "wahl", wahl: i });
    for (const tn of c.tunnel) {
      const z = aufloesen(tn);
      if (z) kanten.push({ von: id, nach: z, art: "tunnel", wahl: i });
    }
    for (const b of c.bedingt) {
      const z = aufloesen(b);
      if (z) kanten.push({ von: id, nach: z, art: z === "tod" ? "tod" : "bedingt", wahl: i });
    }
    delete c.zielRoh;
  });
}
if (offen.length) {
  console.log("Nicht auflösbare Übergänge:", offen);
  process.exit(1);
}

passages.set("END", { id: "END", titel: "ENDE DES KAPITELS", gruppe: "D", knot: "END", art: "ende", zeilen: [], logik: [], tags: [], herkunft: [], choices: [], weiter: [] });
passages.set("KAMPFANFANG", { id: "KAMPFANFANG", titel: "Zurück an den Anfang des Kampfes", gruppe: "T", knot: "KAMPFANFANG", art: "virtuell", zeilen: ["Nach dem Nachbild (Tod, Monolog, Fragment) geht es an den Anfang des Kampfes oder Moments zurück, in dem man starb. Es gibt keine Laterne als Speicherpunkt."], logik: [], tags: [], herkunft: [], choices: [], weiter: [] });
for (const ziel of ["k1_klinik_kampf", "k1_b_haus", "k1_b_scheiterhaufen.kampf", "k1_b_daecher", "k1_c_kanal.kampf", "k1_n1_kleriker", "k1_n2_gascoigne"]) {
  if (ids.has(ziel)) kanten.push({ von: "KAMPFANFANG", nach: ziel, art: "bedingt" });
}

// Doppelte Kanten zusammenfassen (gleiches Paar, gleiche Art)
const kantenEindeutig = [...new Map(kanten.map((k) => [`${k.von}|${k.nach}|${k.art}`, k])).values()];

// ---------------------------------------------------------------- Layout (Start oben)
const istBaustein = (id) => BAUSTEINE.has(passages.get(id)?.knot);
function layout(mitBausteinen) {
  const g = new dagre.graphlib.Graph({ multigraph: true });
  g.setGraph({ rankdir: "TB", nodesep: 28, ranksep: 64, edgesep: 10, marginx: 40, marginy: 40, ranker: "network-simplex" });
  g.setDefaultEdgeLabel(() => ({}));
  const sichtbar = [...passages.keys()].filter((id) => mitBausteinen || !istBaustein(id));
  for (const id of sichtbar) g.setNode(id, { width: 240, height: 112 });
  kantenEindeutig.forEach((k, i) => {
    if (!g.hasNode(k.von) || !g.hasNode(k.nach)) return;
    if (!mitBausteinen && k.art === "tod") return;
    // Rücksprünge (zurück an den Anfang des Kampfes) sollen das Layout nicht nach oben ziehen
    const gewicht = k.art === "wahl" || k.art === "weiter" ? 2 : 1;
    g.setEdge(k.von, k.nach, { weight: gewicht, minlen: 1 }, String(i));
  });
  dagre.layout(g);
  const pos = {};
  for (const id of g.nodes()) {
    const n = g.node(id);
    pos[id] = [Math.round(n.x), Math.round(n.y)];
  }
  const { width, height } = g.graph();
  return { pos, breite: Math.round(width), hoehe: Math.round(height) };
}
const layoutStory = layout(false);
const layoutVoll = layout(true);

// ---------------------------------------------------------------- Ausgabe: JSON für die Ansicht
const woerter = (s) => s.split(/\s+/).filter((w) => /\p{L}/u.test(w)).length;
const daten = {
  erzeugt: new Date().toISOString(),
  start: START,
  teile: Object.fromEntries(Object.values(TEILE).map(([k, n]) => [k, n])),
  passagen: [...passages.values()].map((p) => ({
    id: p.id,
    titel: p.titel,
    gruppe: p.gruppe,
    art: p.art,
    baustein: istBaustein(p.id),
    zeilen: p.zeilen,
    logik: p.logik,
    tags: [...new Set(p.tags)],
    herkunft: p.herkunft,
    woerter: woerter(p.zeilen.join(" ")) + p.choices.reduce((s, c) => s + woerter(c.folgen.join(" ")), 0),
    choices: p.choices.map((c) => ({ text: c.text, bedingung: c.bedingung, wiederholbar: c.wiederholbar, folgen: c.folgen, logik: c.logik, ziel: c.ziel })),
  })),
  kanten: kantenEindeutig,
  layout: { story: layoutStory, voll: layoutVoll },
};
const stats = {
  passagen: daten.passagen.filter((p) => p.art !== "virtuell").length,
  entscheidungen: daten.passagen.reduce((s, p) => s + p.choices.length, 0),
  kanten: kantenEindeutig.length,
  woerter: daten.passagen.reduce((s, p) => s + p.woerter, 0),
};
daten.stats = stats;
writeFileSync(new URL("../web/twine.json", import.meta.url), JSON.stringify(daten));

// ---------------------------------------------------------------- Ausgabe: Twee 3 für Twine
// Jede Entscheidung mit eigenem Folgetext wird eine eigene Passage, damit Twine den Weg so zeigt, wie er gespielt wird.
const tw = [];
const sicher = (s) => s.replace(/\[\[|\]\]/g, "").replace(/->/g, "→");
const twName = (id) => (id === "END" ? "ENDE" : id);
// Eigenes Layout für Twine: Passagen und Folgetexte als 100×100-Blöcke, Start oben.
const twGraph = new dagre.graphlib.Graph({ multigraph: true });
twGraph.setGraph({ rankdir: "TB", nodesep: 40, ranksep: 70, marginx: 50, marginy: 50 });
twGraph.setDefaultEdgeLabel(() => ({}));
for (const p of daten.passagen) {
  twGraph.setNode(p.id, { width: 100, height: 100 });
  p.choices.forEach((c, i) => {
    if (!c.folgen.length) return;
    const f = `${p.id} ✦ ${i + 1}`;
    twGraph.setNode(f, { width: 100, height: 100 });
    twGraph.setEdge(p.id, f, { weight: 3 }, `${f}<`);
    if (c.ziel) twGraph.setEdge(f, c.ziel, { weight: 2 }, `${f}>`);
  });
}
kantenEindeutig.forEach((k, i) => {
  if (k.art === "tunnel") return;
  const p = daten.passagen.find((x) => x.id === k.von);
  const c = k.wahl !== undefined ? p?.choices[k.wahl] : null;
  if (c && c.folgen.length && k.art === "wahl") return;
  twGraph.setEdge(k.von, k.nach, { weight: 1 }, `k${i}`);
});
dagre.layout(twGraph);
const twPos = (name) => {
  const n = twGraph.node(name) ?? { x: 0, y: 0 };
  return `{"position":"${Math.round(n.x - 50)},${Math.round(n.y - 50)}","size":"100,100"}`;
};
tw.push(":: StoryTitle", "Yharnam – Kapitel 1", "");
tw.push(":: StoryData", JSON.stringify({ ifid: "6C1F9E52-3B8A-4E0B-9D1A-7A51C0B1D9E3", format: "Harlowe", "format-version": "3.3.8", start: START, zoom: 0.6 }, null, 2), "");
for (const p of daten.passagen) {
  const tags = [p.gruppe, p.baustein ? "baustein" : null].filter(Boolean).join(" ");
  tw.push(`:: ${twName(p.id)} [${tags}] ${twPos(p.id)}`);
  if (p.herkunft.length) tw.push(...p.herkunft.map((h) => `<!-- ${h} -->`));
  tw.push(...p.zeilen.map(sicher));
  if (p.logik.length) tw.push(`<!-- Logik: ${p.logik.join(" · ")} -->`);
  p.choices.forEach((c, i) => {
    const bed = c.bedingung ? ` (nur wenn ${c.bedingung})` : "";
    if (c.folgen.length) {
      const folgeName = `${twName(p.id)} ✦ ${i + 1}`;
      tw.push(`[[${sicher(c.text)}${bed}->${folgeName}]]`);
    } else if (c.ziel) tw.push(`[[${sicher(c.text)}${bed}->${twName(c.ziel)}]]`);
  });
  for (const k of kantenEindeutig.filter((k) => k.von === p.id && k.wahl === undefined && k.art !== "tunnel")) {
    tw.push(`[[${k.art === "bedingt" ? "(bedingt) " : k.art === "tod" ? "(Tod) " : ""}weiter->${twName(k.nach)}]]`);
  }
  tw.push("");
  p.choices.forEach((c, i) => {
    if (!c.folgen.length) return;
    tw.push(`:: ${twName(p.id)} ✦ ${i + 1} [${p.gruppe} folge] ${twPos(`${p.id} ✦ ${i + 1}`)}`);
    tw.push(...c.folgen.map(sicher));
    if (c.logik.length) tw.push(`<!-- Logik: ${c.logik.join(" · ")} -->`);
    if (c.ziel) tw.push(`[[weiter->${twName(c.ziel)}]]`);
    tw.push("");
  });
}
writeFileSync(new URL("../docs/yharnam-kapitel1.twee", import.meta.url), tw.join("\n"));
console.log(`Twine-Ansicht: ${stats.passagen} Passagen, ${stats.entscheidungen} Entscheidungen, ${stats.kanten} Verbindungen, ~${stats.woerter} Wörter. web/twine.json und docs/yharnam-kapitel1.twee geschrieben.`);
