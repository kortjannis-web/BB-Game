// Das ganze Buch: alle Texte von Kapitel 1 hintereinander, in der Reihenfolge, in der man sie erlebt.
// Quelle sind allein die .ink-Dateien (und web/notizbuch.js, web/spiel.js für Notizbuch und Ortskarten);
// nichts wird von Hand gepflegt. Wird von tools/bauen.mjs aufgerufen (wie der Erzählbaum). Schreibt:
//   web/buch.html            im Spiel verlinkt („Das ganze Buch“), mit Verzeichnis und Sprungmarken
//   web/artefakt/buch.html   dieselbe Seite ohne Grundgerüst, für das claude.ai-Artefakt
//   docs/kapitel1-buch.md    dieselben Texte als Markdown
// Darstellung: Jede Entscheidung steht als Kasten mit allen Möglichkeiten; unter jeder Möglichkeit, was dann folgt.
// Bedingte Stellen („wenn …“), Varianten bei Wiederholung („beim 1. Mal …“) und Zufallsvarianten werden alle gezeigt.
// Tod, Nachbild, Fragmente und Bausteine (Ampulle) stehen nach der Handlung in einem eigenen Teil, das Notizbuch am Ende.
// Aufruf: node tools/buch.mjs
import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import vm from "node:vm";
import { inkFiles } from "./ink.mjs";

const START = "k1_prolog";
// Knoten, die von überall angesprungen werden: nicht in der Handlung, sondern im Teil „Tod und Traum“.
const ANHANG = ["tod", "nachbild", "naechstes_fragment", "frag_blut", "frag_menschen", "frag_kirche", "frag_ich", "frag_nacht", "frag_kippen", "traum_fragmente", "ampulle_ruhig", "ampulle_gefahr", "betreten"];
const AKTE = [
  ["k1_prolog", "Akt I: Ankunft"],
  ["k1_b_gilbert", "Akt II: Zentral-Yharnam"],
  ["k1_n1_kleriker", "Nadelöhr 1: Die Kleriker-Bestie"],
  ["k1_c_kanal", "Akt III: Die Unterstadt"],
  ["k1_n2_gascoigne", "Nadelöhr 2: Gascoigne"],
  ["k1_d_grab", "Akt IV: Heimweg"],
];

// ---------------------------------------------------------------- Knoten einlesen
const knoten = new Map(); // name -> { name, titel, datei, zeilen: [roh] }
for (const [datei, src] of Object.entries(inkFiles())) {
  let cur = null;
  for (const [nr, roh] of src.split("\n").entries()) {
    const k = roh.match(/^\s*===\s*(function\s+)?([A-Za-z_]\w*)/);
    if (k) {
      cur = k[1] ? null : { name: k[2], titel: k[2], datei, zeilen: [], nummern: [], ab: nr + 1 };
      if (cur) knoten.set(cur.name, cur);
      continue;
    }
    if (!cur) continue;
    const t = roh.match(/^\s*\/\/\s*TITEL:\s*(.+)$/);
    if (t) cur.titel = t[1].trim();
    else {
      // Ohne TITEL: der erste Kommentar des Knotens als Name (z. B. „Erste Station: das Fenster des Mädchens“)
      const c = !cur.zeilen.some((z) => z.trim() && !z.trim().startsWith("//")) && roh.match(/^\s*\/\/\s*([^[].{3,80}?)\.?\s*$/);
      if (c && !cur.ersatz && !/^(KANON|ERWEITERT|PRÜFEN|Umbau|Feinschliff|Handgearbeitet|Faktencheck)/.test(c[1])) cur.ersatz = c[1];
      cur.zeilen.push(roh);
      cur.nummern.push(nr + 1);
    }
  }
}

// ---------------------------------------------------------------- Reihenfolge (Ablauf ab dem Prolog)
for (const k of knoten.values()) if (k.titel === k.name && k.ersatz) k.titel = k.ersatz;
const knotVon = (ziel) => ziel.split(".")[0];
// Ziele in der Reihenfolge des Quelltextes; Sprünge in einer Zeile, die mit „{ bedingung: -> …“ beginnt
// (Abkürzungen wie „schon zwei Stationen gesehen, also weiter“), kommen in Knoten mit Entscheidungen zuletzt, damit die Stationen davor stehen.
function ziele(k) {
  const vorn = [];
  const hinten = [];
  const hatWahl = k.zeilen.some((z) => /^\s*[*+]/.test(z));
  for (const z of k.zeilen) {
    const s = z.replace(/\/\/.*$/, "");
    if (/^\s*~/.test(s)) continue;
    const liste = hatWahl && /^\s*\{[^}]*:\s*->/.test(s) ? hinten : vorn;
    for (const m of s.matchAll(/->\s*([A-Za-z_][\w.]*)/g)) liste.push(knotVon(m[1]));
  }
  return [...vorn, ...hinten];
}
const reihenfolge = [];
const gesehen = new Set(["END", "DONE", ...ANHANG]);
(function besuchen(name) {
  if (gesehen.has(name) || !knoten.has(name)) return;
  gesehen.add(name);
  reihenfolge.push(name);
  for (const z of ziele(knoten.get(name))) besuchen(z);
})(START);
const anhang = ANHANG.filter((n) => knoten.has(n));
const verwaist = [...knoten.keys()].filter((n) => !gesehen.has(n));

// ---------------------------------------------------------------- Text und Bedingungen lesbar machen
const esc = (s) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
function bedingungLesbar(b) {
  return b
    .trim()
    .replace(/\s*>=\s*/g, " ≥ ")
    .replace(/\s*<=\s*/g, " ≤ ")
    .replace(/\s*!=\s*/g, " ≠ ")
    .replace(/\s*==\s*/g, " = ")
    .replace(/\band\b|&&/g, "und")
    .replace(/\bor\b|\|\|/g, "oder")
    .replace(/\bnot\s+|!(?=\w)/g, "nicht ")
    .replace(/(\w+)\s*\?\s*(\w+)/g, "$1 enthält $2")
    .replace(/\s+/g, " ");
}
// Tags (# …) abschneiden: alles ab dem ersten „#“, das nicht in geschweiften Klammern steht.
function ohneTags(s) {
  let tiefe = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "{") tiefe++;
    else if (s[i] === "}") tiefe--;
    else if (s[i] === "#" && tiefe === 0) return s.slice(0, i);
  }
  return s;
}
function teileOben(s, zeichen) {
  const out = [];
  let tiefe = 0;
  let start = 0;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === "{") tiefe++;
    else if (s[i] === "}") tiefe--;
    else if (s[i] === zeichen && tiefe === 0) {
      out.push(s.slice(start, i));
      start = i + 1;
    }
  }
  out.push(s.slice(start));
  return out;
}
const istBedingung = (s) => /^[\w\s=<>!().,"'+\-*/&|?^]+$/.test(s.trim()) && s.trim().length > 0 && s.trim().length < 90;
const ART = { "&": "wechselt bei jedem Mal", "~": "zufällig", "!": "nur einmal" };

/** Ein Inline-Ausdruck {…} als Struktur: { art: "alt"|"wenn"|"folge"|"var", … } */
function ausdruck(inhalt) {
  const c = inhalt.trim();
  if (/^[&~!]/.test(c)) return { art: "alt", wie: ART[c[0]], teile: teileOben(c.slice(1), "|") };
  const doppel = teileOben(c, ":");
  if (doppel.length > 1 && istBedingung(doppel[0])) {
    const rest = doppel.slice(1).join(":");
    return { art: "wenn", bedingung: doppel[0], teile: teileOben(rest, "|") };
  }
  const t = teileOben(c, "|");
  if (t.length > 1) return { art: "folge", teile: t };
  return { art: "var", name: c };
}
/** Fließtext mit {…} in HTML oder Markdown. */
function inline(s, fmt) {
  s = s.replace(/->->/g, "").replace(/->\s*([A-Za-z_][\w.]*)(?:\([^)]*\))?\s*(->)?/g, (_, z) => (z === "tod" ? "→ Tod" : `→ ${titelVon(z)}`));
  let out = "";
  let i = 0;
  while (i < s.length) {
    const a = s.indexOf("{", i);
    if (a < 0) {
      out += fmt === "html" ? esc(s.slice(i)) : s.slice(i);
      break;
    }
    out += fmt === "html" ? esc(s.slice(i, a)) : s.slice(i, a);
    let tiefe = 0;
    let e = a;
    for (; e < s.length; e++) {
      if (s[e] === "{") tiefe++;
      else if (s[e] === "}" && --tiefe === 0) break;
    }
    const x = ausdruck(s.slice(a + 1, e));
    const teil = (p) => inline(p.trim(), fmt) || "∅";
    if (x.art === "var") out += fmt === "html" ? `<span class="var">«${esc(x.name)}»</span>` : `«${x.name}»`;
    else if (x.art === "wenn") {
      const [ja, nein] = x.teile;
      const b = bedingungLesbar(x.bedingung);
      out += fmt === "html"
        ? `<span class="bed"><span class="marke">wenn ${esc(b)}:</span> ${teil(ja)}${nein !== undefined ? ` <span class="marke">sonst:</span> ${teil(nein)}` : ""}<span class="marke">]</span></span>`
        : `[wenn ${b}: ${teil(ja)}${nein !== undefined ? ` | sonst: ${teil(nein)}` : ""}]`;
    } else {
      const wie = x.art === "alt" ? x.wie : "der Reihe nach";
      out += fmt === "html"
        ? `<span class="alt"><span class="marke">[${esc(wie)}:</span> ${x.teile.map(teil).join(' <span class="marke">‖</span> ')}<span class="marke">]</span></span>`
        : `[${wie}: ${x.teile.map(teil).join(" ‖ ")}]`;
    }
    i = e + 1;
  }
  return out.replace(/\s+/g, " ").trim();
}

// ---------------------------------------------------------------- Zerlegen in einen Baum
// Knotenarten: absatz {text}, varianten {wie, teile}, sprung {ziel}, stitch {name}, wahl {tiefe, optionen},
// block {art, zweige:[{label, kinder}]}
function zerlege(k) {
  const wurzel = { art: "wurzel", kinder: [] };
  const stapel = [wurzel];
  const oben = () => stapel[stapel.length - 1];
  const hinein = (n) => {
    let o = oben();
    if (o.art === "block") {
      // Text in einem Block vor dem ersten Zweig (oder ein Block ohne Zweige): eigener Zweig mit dem Kopf des Blocks
      const z = { art: "zweig", label: o.label || "", kinder: [] };
      o.zweige.push(z);
      stapel.push(z);
      o = z;
    }
    o.kinder.push(n);
  };
  let warum = null;

  const schliesseOptionen = (tiefe, auchWahl = true) => {
    // Optionen (und bei Sammelpunkten auch die Entscheidung) mit Tiefe >= tiefe schließen, nie über einen Bedingungsblock hinaus
    while (
      (oben().art === "option" && oben().tiefe >= tiefe) ||
      (oben().art === "wahl" && (auchWahl ? oben().tiefe >= tiefe : oben().tiefe > tiefe))
    ) stapel.pop();
  };
  const blockOffen = () => {
    for (let i = stapel.length - 1; i >= 0; i--) if (stapel[i].art === "zweig") return stapel[i];
    return null;
  };
  const textZeile = (roh) => {
    let s = ohneTags(roh).trim();
    if (!s) return;
    // Rücksprung (->->) und Tunnel/Sprünge am Ende abtrennen
    s = s.replace(/->->\s*$/, "").trim();
    const spruenge = [];
    const m = s.match(/((?:\s*->\s*[A-Za-z_][\w.]*(?:\([^)]*\))?)+)\s*(->)?\s*$/);
    if (m && !/\{[^}]*$/.test(s.slice(0, m.index))) {
      for (const z of m[1].matchAll(/->\s*([A-Za-z_][\w.]*)/g)) spruenge.push(z[1]);
      s = s.slice(0, m.index).trim();
    }
    if (s) {
      // Eine ganze Zeile aus einem einzigen {…} mit längeren Teilen wird als Block mit Zweigen gezeigt.
      const ganz = s.match(/^\{([\s\S]*)\}$/);
      const voll = ganz && (() => {
        let tiefe = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === "{") tiefe++;
          else if (s[i] === "}" && --tiefe === 0 && i < s.length - 1) return false;
        }
        return true;
      })();
      const x = voll ? ausdruck(ganz[1]) : null;
      if (voll && x && x.art !== "var" && x.teile.some((p) => p.trim().length > 40)) {
        const label = x.art === "wenn" ? `wenn ${bedingungLesbar(x.bedingung)}` : x.art === "alt" ? x.wie : "der Reihe nach";
        const zweige = x.teile.map((p, i) => ({
          label: x.art === "wenn" ? (i === 0 ? `wenn ${bedingungLesbar(x.bedingung)}` : "sonst") : x.art === "alt" && x.wie === "wechselt bei jedem Mal" ? `beim ${i + 1}. Mal` : x.art === "folge" ? `beim ${i + 1}. Mal` : `Variante ${i + 1}`,
          kinder: p.trim() ? [{ art: "absatz", text: p.trim(), zeile }] : [{ art: "leer" }],
        }));
        hinein({ art: "block", label, zweige });
      } else hinein({ art: "absatz", text: s, zeile });
    }
    for (const z of spruenge) if (!["END", "DONE", "betreten"].includes(z)) hinein({ art: "sprung", ziel: aufloesen(z, k.name) });
  };

  let zeile = 0;
  for (const [idx, roh] of k.zeilen.entries()) {
    zeile = k.nummern[idx];
    const t = roh.trim();
    if (!t) continue;
    const w = t.match(/^\/\/\s*WARUM:\s*(.*)$/);
    if (w) { warum = w[1]; continue; }
    if (t.startsWith("//") || /^(VAR|CONST|LIST|INCLUDE|~)\b/.test(t) || t.startsWith("~")) continue;
    if (t.startsWith("#")) continue;

    // Stitch
    const st = t.match(/^=\s*([A-Za-z_]\w*)\s*$/);
    if (st) {
      stapel.length = 1;
      hinein({ art: "stitch", name: st[1], id: `${k.name}.${st[1]}` });
      continue;
    }
    // Entscheidung
    const ch = t.match(/^([*+](?:\s*[*+])*)\s*(?:\(\s*\w+\s*\)\s*)?((?:\{[^{}]*\}\s*)*)(.*)$/);
    if (ch && /\[/.test(ch[3]) ) {
      const tiefe = ch[1].replace(/\s/g, "").length;
      const bed = [...ch[2].matchAll(/\{([^{}]*)\}/g)].map((m) => bedingungLesbar(m[1])).join(" und ");
      const rest = ch[3];
      const a = rest.indexOf("[");
      const e = rest.indexOf("]", a);
      const vor = rest.slice(0, a);
      const drin = rest.slice(a + 1, e);
      const nach = rest.slice(e + 1);
      schliesseOptionen(tiefe, false);
      if (!(oben().art === "wahl" && oben().tiefe === tiefe)) {
        const wahl = { art: "wahl", tiefe, optionen: [], kinder: null, zeile };
        hinein(wahl);
        stapel.push(wahl);
      }
      const opt = { art: "option", tiefe, text: ohneTags(vor + drin).trim(), bedingung: bed, wiederholbar: ch[1].includes("+"), warum, zeile, kinder: [] };
      warum = null;
      oben().optionen.push(opt);
      stapel.push(opt);
      const folge = (vor + nach).trim();
      if (folge) textZeile(folge);
      continue;
    }
    warum = null;
    // Ende eines Blocks
    if (t === "}") {
      while (stapel.length > 1 && oben().art !== "zweig") stapel.pop();
      if (stapel.length > 1) stapel.pop(); // zweig
      if (stapel.length > 1 && oben().art === "block") stapel.pop();
      continue;
    }
    // Beginn eines Blocks: "{" allein, "{ bedingung:" oder "{ variable:" (Schalter) oder "{ stopping:" usw.
    const bl = t.match(/^\{\s*([^{}]*?)\s*:?\s*$/);
    if (t.startsWith("{") && !t.includes("}") && bl) {
      const kopf = bl[1].replace(/:$/, "").trim();
      const block = { art: "block", label: "", zweige: [] };
      hinein(block);
      stapel.push(block);
      if (["stopping", "cycle", "shuffle", "once"].includes(kopf)) {
        block.folge = { stopping: "der Reihe nach", cycle: "wechselt bei jedem Mal", shuffle: "zufällig", once: "nur einmal" }[kopf];
        block.zaehler = 0;
      } else if (kopf && t.endsWith(":")) {
        if (/^[a-z_]\w*$/.test(kopf) && !knoten.has(kopf)) block.schalter = kopf; // Schalter wie { ort: - "bruecke": … }
        if (block.schalter === undefined || /\(|\s/.test(kopf)) {
          const z = { art: "zweig", label: `wenn ${bedingungLesbar(kopf)}`, kinder: [] };
          block.zweige.push(z);
          stapel.push(z);
        } else block.label = `wenn ${bedingungLesbar(kopf)}`;
      }
      continue;
    }
    // Zweig in einem Block: "- else:", "- bedingung:", '- "wert":' oder Folge-Glied "- text"
    const offen = [...stapel].reverse().find((x) => x.art === "block") ?? null;
    const zw = t.match(/^-\s*(.+?)\s*:\s*(.*)$/);
    if (offen && t.startsWith("-") && !t.startsWith("->")) {
      const innen = stapel.lastIndexOf(offen);
      const istZweig = offen.folge || (zw && (zw[1] === "else" || istBedingung(zw[1])));
      if (istZweig) {
        stapel.length = innen + 1;
        let label;
        let rest;
        if (offen.folge) {
          offen.zaehler++;
          label = offen.folge === "zufällig" ? `Variante ${offen.zaehler}` : `beim ${offen.zaehler}. Mal`;
          rest = t.replace(/^-\s*/, "");
        } else if (zw[1] === "else") {
          label = "sonst";
          rest = zw[2];
        } else {
          label = offen.schalter ? `wenn ${offen.schalter} = ${zw[1].replace(/"/g, "")}` : `wenn ${bedingungLesbar(zw[1])}`;
          rest = zw[2];
        }
        const z = { art: "zweig", label, kinder: [] };
        offen.zweige.push(z);
        stapel.push(z);
        if (rest && rest.trim()) textZeile(rest);
        continue;
      }
    }
    // Sammelpunkt
    const g = t.match(/^(-+(?:\s*-)*)\s*(?:\(\s*\w+\s*\))?\s*(.*)$/);
    if (g && !t.startsWith("->")) {
      const tiefe = g[1].replace(/\s/g, "").length;
      schliesseOptionen(tiefe);
      if (g[2]) textZeile(g[2]);
      continue;
    }
    textZeile(t);
  }
  return wurzel.kinder;
}

// ---------------------------------------------------------------- Ausgabe
// Sprungziele: ein Knoten, ein Stitch im selben Knoten (relativ) oder eine Marke (gather), die keine Sprungmarke hat
function aufloesen(ziel, knot) {
  if (ziel.includes(".") || knoten.has(ziel)) return ziel;
  return `${knot}.${ziel}`;
}
const titelVon = (ziel) => {
  const [kn, st] = ziel.split(".");
  const k = knoten.get(kn);
  if (!k) return ziel;
  return st ? `${k.titel} › ${st}` : k.titel;
};
const anker = (ziel) => ziel.replace(/\./g, "--");
const ankerBekannt = new Set();
const attr = (s) => esc(String(s)).replace(/"/g, "&quot;");

function html(kinder, passage) {
  let out = "";
  for (const n of kinder) {
    if (n.art === "absatz") out += `<p data-orig="${attr(n.text)}" data-zeile="${n.zeile}">${inline(n.text, "html")}</p>\n`;
    else if (n.art === "leer") out += `<p class="leer">(nichts)</p>\n`;
    else if (n.art === "sprung") out += ankerBekannt.has(n.ziel) ? `<p class="sprung">→ <a href="#${anker(n.ziel)}">${esc(titelVon(n.ziel))}</a></p>\n` : `<p class="sprung">→ ${esc(titelVon(n.ziel))}</p>\n`;
    else if (n.art === "stitch") out += `<h4 id="${anker(n.id)}">› ${esc(n.name)}</h4>\n`;
    else if (n.art === "wahl") {
      out += `<div class="wahl" data-zeile="${n.zeile}"><div class="wahl-kopf">Entscheidung (${n.optionen.length} Möglichkeiten)</div>\n`;
      n.optionen.forEach((o, i) => {
        const zusatz = [o.bedingung && `nur wenn ${o.bedingung}`, o.wiederholbar && "wiederholbar"].filter(Boolean).join(" · ");
        out += `<div class="option" data-wahl="${attr(o.text)}" data-zeile="${o.zeile}"><div class="option-text"><span class="nr">${String.fromCharCode(65 + i)}</span> ${inline(o.text, "html") || "<em>(weiter)</em>"}${zusatz ? ` <span class="zusatz">${esc(zusatz)}</span>` : ""}</div>${o.warum ? `<div class="warum">Warum: ${esc(o.warum)}</div>` : ""}\n<div class="antwort">${html(o.kinder, passage)}</div></div>\n`;
      });
      out += `</div>\n`;
    } else if (n.art === "block") {
      out += `<div class="block">\n`;
      for (const z of n.zweige) out += `<div class="zweig"><div class="zweig-kopf">${esc(z.label)}</div>\n${html(z.kinder, passage)}</div>\n`;
      out += `</div>\n`;
    }
  }
  return out;
}
function md(kinder, ebene = 0) {
  const q = "> ".repeat(ebene);
  let out = "";
  for (const n of kinder) {
    if (n.art === "absatz") out += `${q}${inline(n.text, "md")}\n${q}\n`;
    else if (n.art === "leer") out += `${q}(nichts)\n${q}\n`;
    else if (n.art === "sprung") out += `${q}→ *${titelVon(n.ziel)}*\n${q}\n`;
    else if (n.art === "stitch") out += `${q}#### › ${n.name}\n${q}\n`;
    else if (n.art === "wahl") {
      out += `${q}**▼ Entscheidung (${n.optionen.length} Möglichkeiten)**\n${q}\n`;
      n.optionen.forEach((o, i) => {
        const zusatz = [o.bedingung && `nur wenn ${o.bedingung}`, o.wiederholbar && "wiederholbar"].filter(Boolean).join(" · ");
        out += `${q}> **${String.fromCharCode(65 + i)}) ${inline(o.text, "md") || "(weiter)"}**${zusatz ? ` _(${zusatz})_` : ""}\n${q}>\n`;
        out += md(o.kinder, ebene + 1);
      });
      out += `${q}\n`;
    } else if (n.art === "block") {
      for (const z of n.zweige) {
        out += `${q}> _${z.label}:_\n${q}>\n`;
        out += md(z.kinder, ebene + 1);
      }
      out += `${q}\n`;
    }
  }
  return out;
}

// Notizbuch und Ortskarten aus den Skripten der Webfassung
function notizbuch() {
  const ctx = { window: {} };
  try {
    vm.runInNewContext(readFileSync(new URL("../web/notizbuch.js", import.meta.url), "utf8"), ctx);
  } catch {
    return [];
  }
  const out = [];
  for (const [name, wert] of Object.entries(ctx.window)) {
    if (!wert || typeof wert !== "object") continue;
    out.push({ name, wert });
  }
  return out;
}
function ortskarten() {
  const js = readFileSync(new URL("../web/spiel.js", import.meta.url), "utf8");
  const m = js.match(/const ORTE = \{([\s\S]*?)\};/);
  if (!m) return [];
  return [...m[1].matchAll(/(\w+):\s*"([^"]+)"/g)].map((x) => [x[1], x[2]]);
}

const abschnitte = [];
const aktTitel = new Map(AKTE);
for (const n of reihenfolge) abschnitte.push({ name: n, akt: aktTitel.get(n) });
const teilAnhang = anhang.map((n, i) => ({ name: n, akt: i === 0 ? "Tod, Nachbild und Fragmente" : null }));
const teilVerwaist = verwaist.map((n, i) => ({ name: n, akt: i === 0 ? "Weitere Knoten (nicht vom Prolog aus erreichbar)" : null }));
const alle = [...abschnitte, ...teilAnhang, ...teilVerwaist];

let woerter = 0;
let wahlen = 0;
let moeglichkeiten = 0;
let inhaltHtml = "";
let inhaltMd = "";
let verzeichnis = "";
let verzeichnisMd = "";
for (const a of alle) {
  ankerBekannt.add(a.name);
  for (const z of knoten.get(a.name).zeilen) {
    const st = z.match(/^\s*=\s*([A-Za-z_]\w*)\s*$/);
    if (st) ankerBekannt.add(`${a.name}.${st[1]}`);
  }
}
for (const a of alle) {
  const k = knoten.get(a.name);
  const baum = zerlege(k);
  const zaehle = (kinder) => {
    for (const n of kinder) {
      if (n.art === "absatz") woerter += inline(n.text, "md").split(/\s+/).length;
      if (n.art === "wahl") {
        wahlen++;
        moeglichkeiten += n.optionen.length;
        for (const o of n.optionen) zaehle(o.kinder);
      }
      if (n.art === "block") for (const z of n.zweige) zaehle(z.kinder);
    }
  };
  zaehle(baum);
  if (a.akt) {
    inhaltHtml += `<h2 class="akt" id="akt-${anker(a.name)}">${esc(a.akt)}</h2>\n`;
    inhaltMd += `\n## ${a.akt}\n\n`;
    verzeichnis += `<li class="akt"><a href="#akt-${anker(a.name)}">${esc(a.akt)}</a></li>\n`;
    verzeichnisMd += `- **${a.akt}**\n`;
  }
  inhaltHtml += `<section id="${anker(a.name)}" data-passage="${attr(a.name)}" data-datei="story/${attr(k.datei)}" data-zeile="${k.ab}"><h3><span class="titel">${esc(k.titel)}</span> <span class="kennung">${esc(a.name)}</span></h3>\n${html(baum, a.name)}</section>\n`;
  inhaltMd += `### ${k.titel}\n\n<sub>${a.name} · ${k.datei}</sub>\n\n${md(baum)}\n`;
  verzeichnis += `<li><a href="#${anker(a.name)}">${esc(k.titel)}</a></li>\n`;
  verzeichnisMd += `  - ${k.titel}\n`;
}

// Notizbuch
const nb = notizbuch();
let nbHtml = "";
let nbMd = "";
for (const { name, wert } of nb) {
  const eintraege = Array.isArray(wert) ? wert : Object.entries(wert);
  const ueberschrift = { NOTIZBUCH: "Aufzeichnungen", PERSONEN: "Personen", FRAGEN: "Fragen der Nacht" }[name] ?? name;
  nbHtml += `<h3>${esc(ueberschrift)}</h3>\n`;
  nbMd += `### ${ueberschrift}\n\n`;
  for (const e of eintraege) {
    if (e && !Array.isArray(e) && e.stufen) {
      // Person: { name, wenn, stufen } – gezeigt wird die erste Stufe, deren Bedingung gilt
      nbHtml += `<h4>${esc(e.name)}${e.wenn ? ` <span class="marke">(wenn ${esc(e.wenn)})</span>` : ""}</h4>\n`;
      nbMd += `#### ${e.name}${e.wenn ? ` _(wenn ${e.wenn})_` : ""}\n\n`;
      for (const [bed, text] of e.stufen) {
        nbHtml += `<p>${bed ? `<span class="marke">wenn ${esc(bed)}:</span> ` : ""}${esc(text)}</p>\n`;
        nbMd += `${bed ? `_wenn ${bed}:_ ` : ""}${text}\n\n`;
      }
    } else if (Array.isArray(e) && typeof e[1] === "object" && e[1] && e[1].stufen) {
      const [id, { titel, stufen }] = e;
      nbHtml += `<h4>${esc(titel ?? id)}</h4>\n`;
      nbMd += `#### ${titel ?? id}\n\n`;
      for (const [bed, text] of stufen) {
        nbHtml += `<p>${bed ? `<span class="marke">wenn ${esc(bed)}:</span> ` : ""}${esc(text)}</p>\n`;
        nbMd += `${bed ? `_wenn ${bed}:_ ` : ""}${text}\n\n`;
      }
    } else if (Array.isArray(e) && typeof e[1] === "string") {
      nbHtml += `<p>${e[0] ? `<span class="marke">nach ${esc(String(e[0]))}:</span> ` : ""}${esc(e[1])}</p>\n`;
      nbMd += `${e[0] ? `_nach ${e[0]}:_ ` : ""}${e[1]}\n\n`;
    }
  }
}
const orte = ortskarten();
const orteHtml = orte.map(([id, n]) => `<li>${esc(n)} <span class="kennung">${esc(id)}</span></li>`).join("\n");
const orteMd = orte.map(([id, n]) => `- ${n} (${id})`).join("\n");

const stand = new Date().toISOString().slice(0, 10);
const kopfInfo = `${alle.length} Knoten · ${wahlen} Entscheidungen mit ${moeglichkeiten} Möglichkeiten · rund ${Math.round(woerter / 100) * 100} Wörter · erzeugt aus den Ink-Dateien am ${stand}`;

const STIL = `
:root{--grund:#f4efe4;--text:#1d1a16;--leise:#6b6157;--rand:#d8cfbf;--wahl:#ece4d3;--akzent:#7a1f1f;--bed:#2f5b6b;--alt:#5d4a7a}
@media (prefers-color-scheme: dark){:root:not([data-theme="light"]){--grund:#14110f;--text:#e8e0d2;--leise:#9a8f82;--rand:#3a332c;--wahl:#201b17;--akzent:#d0806f;--bed:#8fbfcf;--alt:#b9a6d9}}
:root[data-theme="dark"]{--grund:#14110f;--text:#e8e0d2;--leise:#9a8f82;--rand:#3a332c;--wahl:#201b17;--akzent:#d0806f;--bed:#8fbfcf;--alt:#b9a6d9}
*{box-sizing:border-box}
body{margin:0;background:var(--grund);color:var(--text);font:18px/1.65 Georgia,"Times New Roman",serif}
.seite{display:grid;grid-template-columns:minmax(0,260px) minmax(0,46rem);gap:2.5rem;justify-content:center;padding:1.5rem 16px 6rem}
nav.verzeichnis{position:sticky;top:0;align-self:start;max-height:100vh;overflow:auto;padding:1rem 0;font-size:.85rem;line-height:1.35}
nav.verzeichnis ol{list-style:none;padding:0;margin:0}
nav.verzeichnis li{margin:.2rem 0}
nav.verzeichnis li.akt{margin-top:.9rem;font-weight:bold;color:var(--akzent)}
nav a{color:inherit;text-decoration:none}
nav a:hover{text-decoration:underline}
header h1{font-size:1.9rem;margin:.5rem 0 .25rem;letter-spacing:.02em}
header p{color:var(--leise);font-size:.9rem;margin:.2rem 0}
h2.akt{font-size:1.5rem;color:var(--akzent);border-bottom:1px solid var(--rand);padding-bottom:.3rem;margin-top:3.5rem}
h3{font-size:1.2rem;margin:2.5rem 0 .8rem}
h4{font-size:1rem;color:var(--leise);margin:1.6rem 0 .5rem;font-style:italic}
.kennung{font:12px ui-monospace,Menlo,monospace;color:var(--leise);font-weight:normal;margin-left:.4rem}
p{margin:.55rem 0}
.sprung{font-size:.85rem;color:var(--leise)}
.sprung a{color:var(--akzent)}
.wahl{background:var(--wahl);border:1px solid var(--rand);border-radius:6px;padding:.6rem .9rem;margin:1.1rem 0}
.wahl .wahl{background:var(--grund)}
.wahl-kopf{font:600 12px/1.4 system-ui,sans-serif;text-transform:uppercase;letter-spacing:.08em;color:var(--akzent);margin-bottom:.3rem}
.option{border-top:1px dashed var(--rand);padding:.5rem 0}
.option:first-of-type{border-top:0}
.option-text{font-weight:bold}
.nr{display:inline-block;min-width:1.4rem;font:600 13px system-ui,sans-serif;color:var(--akzent)}
.zusatz{font:12px system-ui,sans-serif;color:var(--bed);font-weight:normal}
.warum{font:13px/1.4 system-ui,sans-serif;color:var(--leise);margin:.2rem 0 .3rem 1.4rem}
.antwort{margin-left:1.4rem;padding-left:.8rem;border-left:2px solid var(--rand)}
.block{margin:.8rem 0;border-left:3px solid var(--bed);padding-left:.8rem}
.zweig{margin:.4rem 0}
.zweig-kopf,.marke{font:600 12px/1.4 system-ui,sans-serif;color:var(--bed)}
.alt .marke{color:var(--alt)}
.bed,.alt{background:color-mix(in srgb,var(--bed) 8%,transparent);border-radius:3px;padding:0 .15rem}
.var{font-style:italic;color:var(--bed)}
.leer{color:var(--leise);font-style:italic}
.notizbuch p{font-style:italic}
.kopf-leiste{display:flex;gap:1rem;align-items:center;flex-wrap:wrap}
.bearbeiten-knopf{font:600 13px system-ui,sans-serif;padding:.35rem .7rem;border:1px solid var(--rand);border-radius:4px;background:var(--wahl);color:var(--text);cursor:pointer}
body.bearbeiten .bearbeiten-knopf{background:#c9a35e;color:#14110f;border-color:#c9a35e}
.hilfe-bearbeiten{display:none;font:14px/1.45 system-ui,sans-serif;background:var(--wahl);border:1px solid var(--rand);border-radius:6px;padding:.6rem .8rem;margin:.6rem 0}
body.bearbeiten .hilfe-bearbeiten{display:block}
body.bearbeiten main p[data-orig],body.bearbeiten main p.eingefuegt,body.bearbeiten .option-text{cursor:text;border-radius:2px}
body.bearbeiten main p[data-orig]:hover,body.bearbeiten main p.eingefuegt:hover,body.bearbeiten .option-text:hover{background:color-mix(in srgb,#c9a35e 14%,transparent)}
main p.geaendert,.option.geaendert>.option-text{box-shadow:inset 3px 0 0 #7fae86;padding-left:.6rem}
main p.eingefuegt,.option.neu>.option-text{box-shadow:inset 3px 0 0 #7fae86;padding-left:.6rem;color:color-mix(in srgb,var(--text) 85%,#2e7d3a)}
main p.gestrichen,.option.gestrichen>.option-text,section.gestrichen h3 .titel{text-decoration:line-through;text-decoration-color:#c25b4f;opacity:.55}
section.gestrichen>*:not(h3):not(.kommentar):not(.abschnitt-werkzeug){opacity:.45}
.kommentar{margin:.2rem 0 .9rem;padding:.45rem .8rem;border-left:3px solid #c9a35e;background:color-mix(in srgb,#c9a35e 10%,transparent);font:14px/1.45 system-ui,sans-serif}
.kommentar p{margin:.2rem 0}
.kommentar .wer{font-weight:600;color:#9a7330}
.kommentar .claude,.kommentar .claude .wer{color:var(--bed)}
.kommentar .offen{cursor:pointer}
.kommentar .zitat{font-style:italic;color:var(--leise)}
.abschnitt-werkzeug,.wahl-werkzeug{display:none;flex-wrap:wrap;gap:.35rem;margin:.2rem 0 .8rem}
body.bearbeiten .abschnitt-werkzeug,body.bearbeiten .wahl-werkzeug{display:flex}
.abschnitt-werkzeug button,.wahl-werkzeug button,.buch-werkzeug button{font:13px system-ui,sans-serif;padding:.25rem .55rem;border:1px solid var(--rand);border-radius:4px;background:var(--grund);color:var(--text);cursor:pointer}
.abschnitt-werkzeug button:hover,.wahl-werkzeug button:hover,.buch-werkzeug button:hover{border-color:#c9a35e}
.buch-werkzeug{display:flex;flex-wrap:wrap;gap:.35rem;margin:.3rem 0 1rem}
.buch-werkzeug .haupt{background:#c9a35e;color:#14110f;border-color:#c9a35e}
textarea.buch-editor{width:100%;min-height:5rem;font:17px/1.55 Georgia,serif;padding:.5rem .6rem;border:1px dashed #c9a35e;border-radius:4px;background:var(--grund);color:var(--text)}
.neuer-abschnitt{border:1px dashed #7fae86;border-radius:6px;padding:.4rem .9rem;margin:1.5rem 0}
#markier-knopf{position:absolute;z-index:50;font:600 13px system-ui,sans-serif;padding:.35rem .6rem;border-radius:4px;border:1px solid #c9a35e;background:#14110f;color:#e8e0d2;cursor:pointer;box-shadow:0 2px 8px rgba(0,0,0,.3)}
@media (max-width:860px){.seite{grid-template-columns:minmax(0,1fr)}nav.verzeichnis{position:static;max-height:none;border-bottom:1px solid var(--rand)}}
`;
const koerper = `<div class="seite">
<nav class="verzeichnis" aria-label="Verzeichnis"><ol>
${verzeichnis}<li class="akt"><a href="#notizbuch">Notizbuch</a></li>
<li class="akt"><a href="#ortskarten">Ortskarten</a></li>
</ol></nav>
<main>
<header><h1>Yharnam, Kapitel 1: Das ganze Buch</h1>
<p>Alle Texte des Kapitels in der Reihenfolge, in der man sie erlebt. Jede Entscheidung mit allen Möglichkeiten (A, B, C …) und darunter, was jeweils folgt. Blau: Stellen, die nur unter einer Bedingung erscheinen; violett: Varianten bei Wiederholung oder Zufall.</p>
<p>${esc(kopfInfo)}</p>
<p class="kopf-leiste"><a href="index.html" class="zurueck">← Zurück zum Spiel</a> <button type="button" class="bearbeiten-knopf" data-werkstatt-modus aria-pressed="false">✎ Bearbeiten</button></p>
<div class="hilfe-bearbeiten"><b>Bearbeiten:</b> Absatz anklicken zum Umschreiben, Streichen, Einfügen oder für eine Notiz. Text markieren (auch über mehrere Absätze) für eine Notiz zur Markierung. An jeder Entscheidung: Möglichkeiten umbenennen, streichen, hinzufügen. Am Kopf jedes Abschnitts: Notiz zum Abschnitt, Absatz oder Entscheidung anhängen, neuer Abschnitt danach, Titel ändern, streichen, Quelltext. Alles sammelt sich in der <b>Werkstatt</b> (unten rechts) und geht von dort an Claude. Jede Notiz ist ein Auftrag.</div></header>
${inhaltHtml}
<h2 class="akt" id="notizbuch">Notizbuch</h2>
<div class="notizbuch">${nbHtml}</div>
<h2 class="akt" id="ortskarten">Ortskarten</h2>
<ul>${orteHtml}</ul>
</main></div>`;

const web = new URL("../web/", import.meta.url);
writeFileSync(
  new URL("buch.html", web),
  `<!doctype html>
<html lang="de"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Das ganze Buch</title>
<meta name="robots" content="noindex">
<link rel="stylesheet" href="werkstatt.css">
<style>${STIL}</style></head>
<body data-seite="buch">
${koerper}
<script src="werkstatt.js"></script>
<script src="buch.js"></script>
</body></html>
`,
);
mkdirSync(new URL("artefakt/", web), { recursive: true });
let adressen = {};
try {
  adressen = JSON.parse(readFileSync(new URL("artefakte.json", web), "utf8"));
} catch {}
writeFileSync(
  new URL("artefakt/buch.html", web),
  `<title>Das ganze Buch</title>\n<link rel="stylesheet" href="werkstatt.css">\n<style>${STIL}</style>\n<div data-seite-buch></div>\n${adressen.spiel ? koerper.replace('href="index.html" class="zurueck"', `href="${adressen.spiel}" target="_blank" rel="noopener" class="zurueck"`) : koerper}\n<script>document.body.dataset.seite = "buch";</script>\n<script src="werkstatt.js"></script>\n<script src="buch.js"></script>\n`,
);
writeFileSync(
  new URL("../docs/kapitel1-buch.md", import.meta.url),
  `# Yharnam, Kapitel 1: Das ganze Buch

Automatisch erzeugt aus den Ink-Dateien (\`node tools/buch.mjs\`, Teil von \`npm run bauen\`); nie von Hand ändern. Im Spiel: „Das ganze Buch“ (\`web/buch.html\`).
Jede Entscheidung mit allen Möglichkeiten (A, B, C …) und darunter, was jeweils folgt. \`[wenn …]\` = nur unter dieser Bedingung, \`[wechselt bei jedem Mal: … ‖ …]\` = Varianten.

${kopfInfo}

## Verzeichnis

${verzeichnisMd}- **Notizbuch**
- **Ortskarten**
${inhaltMd}
## Notizbuch

${nbMd}
## Ortskarten

${orteMd}
`,
);
console.log(`Gebaut: web/buch.html und docs/kapitel1-buch.md (${kopfInfo})${verwaist.length ? `; nicht erreichbar: ${verwaist.join(", ")}` : ""}`);

// ---------------------------------------------------------------- Vollständigkeit
// Jeder Satzanfang aus den Ink-Dateien (Text außerhalb von Kommentaren, Logik und Funktionen) muss im Buch stehen.
// Mit --streng (Teil von npm run check) bricht ein fehlender Text den Bau ab.
{
  const buchText = readFileSync(new URL("../docs/kapitel1-buch.md", import.meta.url), "utf8").replace(/[*_>]/g, "").replace(/\s+/g, " ");
  const fehlend = [];
  let geprueft = 0;
  for (const [datei, src] of Object.entries(inkFiles())) {
    let funktion = false;
    for (const roh of src.split("\n")) {
      const t = roh.trim();
      if (/^===/.test(t)) funktion = /^===\s*function/.test(t);
      if (funktion || !t || /^(\/\/|~|VAR|CONST|LIST|INCLUDE|===)/.test(t)) continue;
      const ohne = ohneTags(/^[*+]/.test(t) ? t.replace(/\{[^{}]*\}(?=[^[]*\[)/g, "") : t)
        .replace(/\{[^{}:|]*:/g, "|") // Bedingungsköpfe
        .replace(/^-\s*else\s*:/, "")
        .replace(/[{}]/g, "|");
      for (const stueck of ohne.match(/[A-Za-zÄÖÜäöüß„“‚‘,.;!?' ]{25,}/g) ?? []) {
        const probe = stueck.replace(/^[^A-Za-zÄÖÜäöüß„‚]+/, "").slice(0, 25).trim();
        if (probe.length < 20) continue;
        geprueft++;
        if (!buchText.includes(probe)) fehlend.push(`${datei}: ${probe}`);
      }
    }
  }
  if (fehlend.length) {
    console.log(`Das ganze Buch: ${fehlend.length} von ${geprueft} Textstellen fehlen:\n  ${fehlend.slice(0, 20).join("\n  ")}`);
    if (process.argv.includes("--streng")) process.exit(1);
  } else console.log(`Das ganze Buch: vollständig (${geprueft} Textstellen geprüft).`);
}
