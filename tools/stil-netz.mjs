// Prinzipien-Netz des Skills stil-1800 abfragen (ohne Abhängigkeiten).
// Aufruf: npm run stil -- <moment>        Prinzipien, Musterstellen und Wörter für einen Moment (z. B. ankunft)
//         npm run stil -- prinzip <ID>    ein Knoten vollständig, mit Kanten (z. B. SA-01)
//         npm run stil -- ebene <XX>      alle Knoten einer Ebene (WO, FB, SA, AB, ST, FI, SZ, WE, SP)
//         npm run stil -- liste           alle Momente und Ebenen
//         npm run stil -- md              schreibt netz/PRINZIPIEN.md und netz/SITUATIONEN.md neu
//         npm run stil -- pruefen         prüft das Netz (IDs, Kanten, Belege, Musterstellen, Wörter)
//         npm run stil                    ohne Argument (oder mit --kurz/--streng): der Stilprüfer tools/stil.mjs wie bisher
import { readFileSync, writeFileSync, existsSync } from "node:fs";
import { spawnSync } from "node:child_process";
import { join } from "node:path";

const WURZEL = new URL("..", import.meta.url).pathname;
const SKILL = join(WURZEL, ".claude/skills/stil-1800");
const NETZ = join(SKILL, "netz");
const args = process.argv.slice(2);

// Ohne Argument bleibt `npm run stil` der Stilprüfer (Rückwärtsverträglichkeit, docs/qualitaet.md).
if (args.length === 0 || args[0].startsWith("--")) {
  const r = spawnSync(process.execPath, [join(WURZEL, "tools/stil.mjs"), ...args], { stdio: "inherit" });
  if (args.length === 0) console.log("\nPrinzipien-Netz: npm run stil -- liste | <moment> | prinzip <ID> | md | pruefen");
  process.exit(r.status ?? 1);
}

const lies = (p) => JSON.parse(readFileSync(p, "utf8"));
const netz = lies(join(NETZ, "prinzipien.json"));
const sit = lies(join(NETZ, "situationen.json"));
const P = new Map(netz.prinzipien.map((p) => [p.id, p]));
const MOMENTE = Object.keys(sit.momente);
const EBENEN = Object.keys(netz.ebenen);
const name = (id) => (P.get(id) ? `${id} ${P.get(id).name}` : `${id} (unbekannt)`);
const wirk = (l) => (l && l.length ? l.map((k) => `${k} ${netz.wirkungen[k] || "?"}`).join(", ") : "–");
const dosisKurz = (d) => d === "frei" ? "frei" : d.startsWith("bis 3") ? "≤3/Kap." : d.startsWith("höchstens 1") ? "≤1/Kap." : d.startsWith("selten") ? "selten" : d;
const spannungen = (p) => (p.kanten?.spannung || []).map((s) => (typeof s === "string" ? { id: s, aufloesung: "" } : s));
const werkName = (w) => netz.werke?.[w] || w;
const umbruch = (text, breite = 100, einzug = "    ") => {
  const woerter = String(text).split(/\s+/); const zeilen = []; let z = "";
  for (const w of woerter) { if ((z + " " + w).trim().length > breite) { zeilen.push(z); z = w; } else z = (z + " " + w).trim(); }
  if (z) zeilen.push(z);
  return zeilen.map((x, i) => (i ? einzug : "") + x).join("\n");
};

function zeigeMoment(m) {
  const s = sit.momente[m];
  console.log(`MOMENT ${m}: ${s.beispiel}`);
  console.log(`Register: ${s.register}`);
  console.log(umbruch(`Kern: ${s.hinweis}`, 100, "  "));
  console.log(`\nPRINZIPIEN (nach Gewicht; vollständig mit Beleg und Maß: npm run stil -- prinzip <ID>)`);
  s.prinzipien.forEach((id, i) => {
    const p = P.get(id);
    if (!p) { console.log(`${i + 1}. ${id} fehlt im Netz`); return; }
    console.log(`\n${i + 1}. ${p.id} ${p.name}  [${p.ebene}; wirkt ${(p.wirkt || []).join(" ")}${p.gefaehrdet?.length ? "; gefährdet " + p.gefaehrdet.join(" ") : ""}]`);
    console.log("   " + umbruch(p.regel, 96, "   "));
    console.log("   Prüfe: " + umbruch(p.pruefe, 88, "   "));
    if (p.nutzer) console.log("   Nutzer: " + umbruch(p.nutzer, 88, "   "));
    for (const sp of spannungen(p)) console.log(`   ↔ ${sp.id}: ` + umbruch(sp.aufloesung, 88, "     "));
  });
  console.log(`\nMUSTERSTELLEN (vor dem Schreiben lesen)`);
  for (const ms of s.musterstellen) console.log(`- .claude/skills/stil-1800/${ms.datei}  „${ms.titel}“ (${ms.werk}, ${ms.woerter} Wörter)`);
  if (s.anmerkung_musterstellen) console.log("  " + umbruch(s.anmerkung_musterstellen, 98, "  "));
  console.log(`\nWÖRTER (Angebot, kein Pensum; Dosis beachten)`);
  const gruppen = {};
  for (const w of s.woerter) (gruppen[dosisKurz(w.dosis)] ||= []).push(`${w.wort}${w.register === "elegant-neutral" ? "" : " (" + w.register + ")"}`);
  for (const [d, l] of Object.entries(gruppen)) console.log(umbruch(`${d}: ${l.join(", ")}`, 100, "  "));
}

function zeigePrinzip(id) {
  const p = P.get(id.toUpperCase());
  if (!p) { console.error(`Unbekanntes Prinzip ${id}. Liste: npm run stil -- liste`); process.exit(1); }
  console.log(`${p.id} ${p.name}`);
  console.log(`Ebene: ${p.ebene} ${netz.ebenen[p.ebene]} | wirkt: ${wirk(p.wirkt)} | gefährdet: ${wirk(p.gefaehrdet)}`);
  console.log(`Gegen: ${(p.gegen || []).map((s) => `${s} ${netz.schwaechen[s] || ""}`).join("; ") || "–"}`);
  console.log(`Momente: ${(p.szenen || []).join(", ")}`);
  console.log(`\nRegel: ${umbruch(p.regel, 92, "  ")}`);
  console.log(`\nWarum: ${umbruch(p.warum, 92, "  ")}`);
  console.log(`\nBelege:`);
  for (const b of p.belege) console.log(`- ${werkName(b.werk)}, ${b.stelle}:\n  „${umbruch(b.zitat, 94, "   ")}“`);
  console.log(`\nÜbertragung (eigene Prosa, Entwurf):`);
  for (const u of p.uebertragung) console.log(`- ${umbruch(u, 96, "  ")}`);
  console.log(`\nGrenze: ${umbruch(p.grenze, 92, "  ")}`);
  console.log(`\nPrüfe: ${umbruch(p.pruefe, 92, "  ")}`);
  if (p.mass) console.log(`\nMaß: ${umbruch(p.mass, 92, "  ")}`);
  if (p.nutzer) console.log(`\nNutzer: ${umbruch(p.nutzer, 92, "  ")}`);
  console.log(`\nKanten:`);
  console.log(`  stärkt:   ${(p.kanten.staerkt || []).map(name).join("; ") || "–"}`);
  console.log(`  braucht:  ${(p.kanten.braucht || []).map(name).join("; ") || "–"}`);
  const gebraucht = netz.prinzipien.filter((q) => (q.kanten.braucht || []).includes(p.id)).map((q) => name(q.id));
  if (gebraucht.length) console.log(`  gebraucht von: ${gebraucht.join("; ")}`);
  for (const sp of spannungen(p)) console.log(`  Spannung ${name(sp.id)}:\n    ${umbruch(sp.aufloesung, 92, "    ")}`);
  console.log(`\nQuelle: ${[].concat(p.quelle).join("; ")}`);
}

function zeigeListe() {
  console.log("MOMENTE (npm run stil -- <moment>)");
  for (const m of MOMENTE) console.log(`  ${m.padEnd(12)} ${String(sit.momente[m].prinzipien.length).padStart(2)} Prinzipien  ${sit.momente[m].beispiel}`);
  console.log("\nEBENEN (npm run stil -- ebene <XX>, npm run stil -- prinzip <ID>)");
  for (const e of EBENEN) {
    const l = netz.prinzipien.filter((p) => p.ebene === e);
    console.log(`  ${e} ${netz.ebenen[e]} (${l.length})`);
    for (const p of l) console.log(`     ${p.id} ${p.name}`);
  }
  console.log("\nWIRKUNGEN: " + Object.entries(netz.wirkungen).map(([k, v]) => `${k} ${v}`).join(", "));
}

function zeigeEbene(e) {
  e = e.toUpperCase();
  if (!netz.ebenen[e]) { console.error(`Unbekannte Ebene ${e}: ${EBENEN.join(", ")}`); process.exit(1); }
  for (const p of netz.prinzipien.filter((x) => x.ebene === e)) {
    console.log(`${p.id} ${p.name}\n   ${umbruch(p.regel, 96, "   ")}\n   Prüfe: ${umbruch(p.pruefe, 88, "   ")}\n`);
  }
}

// Prüfung des Netzes
function pruefen() {
  const f = [];
  const analysen = {};
  for (const w of Object.keys(netz.werke)) {
    const pfad = join(SKILL, "analysen", w + ".md");
    analysen[w] = existsSync(pfad) ? readFileSync(pfad, "utf8").replace(/\s+/g, " ") : "";
  }
  const index = lies(join(SKILL, "musterstellen/index.json"));
  const kammer = new Map(lies(join(SKILL, "wortkammer/wortkammer.json")).map((w) => [w.wort, w]));
  for (const p of netz.prinzipien) {
    for (const feld of ["regel", "warum", "grenze", "pruefe"]) if (!p[feld]) f.push(`${p.id}: ${feld} fehlt`);
    if (!p.belege?.length) f.push(`${p.id}: kein Beleg`);
    if (!p.uebertragung?.length) f.push(`${p.id}: keine Übertragung`);
    if (!netz.ebenen[p.ebene] || !p.id.startsWith(p.ebene + "-")) f.push(`${p.id}: Ebene ${p.ebene}`);
    for (const k of [...(p.wirkt || []), ...(p.gefaehrdet || [])]) if (!netz.wirkungen[k]) f.push(`${p.id}: Wirkung ${k}`);
    for (const s of p.gegen || []) if (!netz.schwaechen[s]) f.push(`${p.id}: Schwäche ${s}`);
    for (const m of p.szenen || []) if (!sit.momente[m]) f.push(`${p.id}: Moment ${m}`);
    for (const z of [...(p.kanten.staerkt || []), ...(p.kanten.braucht || [])]) if (!P.has(z)) f.push(`${p.id}: Kante zu ${z}`);
    for (const z of p.kanten.staerkt || []) if (!(P.get(z)?.kanten.staerkt || []).includes(p.id)) f.push(`${p.id}: staerkt ${z} nicht symmetrisch`);
    for (const sp of spannungen(p)) {
      if (!P.has(sp.id)) { f.push(`${p.id}: Spannung zu ${sp.id}`); continue; }
      if (!sp.aufloesung) f.push(`${p.id}: Spannung ${sp.id} ohne Auflösung`);
      if (!spannungen(P.get(sp.id)).some((x) => x.id === p.id)) f.push(`${p.id}: Spannung ${sp.id} nicht symmetrisch`);
    }
    for (const b of p.belege || []) {
      const text = analysen[b.werk];
      if (!text) { f.push(`${p.id}: Analyse fehlt für ${b.werk}`); continue; }
      for (const st of b.zitat.split("…").map((x) => x.trim()).filter((x) => x.length >= 4))
        if (!text.includes(st.replace(/\s+/g, " "))) f.push(`${p.id}: Beleg nicht wörtlich in analysen/${b.werk}.md: ${st.slice(0, 50)}…`);
    }
  }
  for (const [m, s] of Object.entries(sit.momente)) {
    if (s.prinzipien.length < 6 || s.prinzipien.length > 12) f.push(`${m}: ${s.prinzipien.length} Prinzipien (6 bis 12)`);
    for (const id of s.prinzipien) if (!P.has(id)) f.push(`${m}: Prinzip ${id} fehlt`);
    for (const ms of s.musterstellen) {
      if (!index.some((x) => x.titel === ms.titel && "musterstellen/" + x.datei === ms.datei)) f.push(`${m}: Musterstelle ${ms.titel} nicht im Index`);
      if (!existsSync(join(SKILL, ms.datei))) f.push(`${m}: Datei ${ms.datei} fehlt`);
    }
    if (s.woerter.length < 15 || s.woerter.length > 25) f.push(`${m}: ${s.woerter.length} Wörter (15 bis 25)`);
    for (const w of s.woerter) if (!kammer.has(w.wort)) f.push(`${m}: Wort ${w.wort} nicht in der Wortkammer`);
  }
  const zahl = {}; for (const p of netz.prinzipien) zahl[p.ebene] = (zahl[p.ebene] || 0) + 1;
  const kanten = { staerkt: 0, braucht: 0, spannung: 0 };
  for (const p of netz.prinzipien) { kanten.staerkt += p.kanten.staerkt.length; kanten.braucht += p.kanten.braucht.length; kanten.spannung += spannungen(p).length; }
  console.log(`Netz: ${netz.prinzipien.length} Prinzipien (${EBENEN.map((e) => `${e} ${zahl[e] || 0}`).join(", ")})`);
  console.log(`Kanten: stärkt ${kanten.staerkt / 2} Paare, braucht ${kanten.braucht}, Spannung ${kanten.spannung / 2} Paare`);
  console.log(`Momente: ${MOMENTE.length}`);
  if (f.length) { console.log(`\n${f.length} Befunde:\n` + f.join("\n")); process.exit(1); }
  console.log("Prüfung: grün");
}

// Lesbare Ausgaben
function md() {
  const anker = (id) => "#" + id.toLowerCase();
  const verweis = (id) => (P.get(id) ? `[${id}](${anker(id)}) ${P.get(id).name}` : id);
  const L = [];
  L.push("# Prinzipien-Netz: alle Knoten", "");
  L.push("*Erzeugt aus `prinzipien.json` mit `node tools/stil-netz.mjs md`; nicht von Hand bearbeiten. Stand: " + netz.stand + ".*", "");
  L.push("Jedes Prinzip ist an den Meistern belegt (Zitate wörtlich aus `../analysen/`), positiv formuliert und kennt seine Grenze. Die Übertragungen sind eigene Prosa und Entwürfe, keine Bausteine. **Die Muster des Nutzers (`docs/nutzerstil.md`) gehen jedem Prinzip vor**; wo ein Knoten sie berührt, steht es unter „Nutzer“.", "");
  L.push("**Wirkungen:** " + Object.entries(netz.wirkungen).map(([k, v]) => `${k} ${v}`).join(", ") + ".  ");
  L.push("**Schwächen (gegen):** " + Object.entries(netz.schwaechen).map(([k, v]) => `${k} ${v}`).join("; ") + " (`docs/schreibkunst-analyse.md`, Abschnitt 3).", "");
  const zahl = {}; for (const p of netz.prinzipien) zahl[p.ebene] = (zahl[p.ebene] || 0) + 1;
  L.push("| Ebene | Frage | Knoten |", "|---|---|---|");
  const fragen = { WO: "Welches Wort trägt?", FB: "Welche Fügung, welches Bild?", SA: "Wie ist der Satz gebaut?", AB: "Welche Welle, welcher Schluss?", ST: "Wer erzählt mit welcher Haltung?", FI: "Wie spricht diese Figur?", SZ: "Wie wird diese Art Szene gebaut?", WE: "Motiv, Saat und Ernte, Rahmen", SP: "Was verlangt das Medium?" };
  for (const e of EBENEN) L.push(`| ${e} ${netz.ebenen[e]} | ${fragen[e] || ""} | ${netz.prinzipien.filter((p) => p.ebene === e).map((p) => `[${p.id}](${anker(p.id)})`).join(" ")} |`);
  L.push("");
  for (const e of EBENEN) {
    L.push(`## ${e} ${netz.ebenen[e]}`, "");
    for (const p of netz.prinzipien.filter((x) => x.ebene === e)) {
      L.push(`<a id="${p.id.toLowerCase()}"></a>`, `### ${p.id} ${p.name}`, "");
      L.push(`*Wirkt:* ${wirk(p.wirkt)}. *Gefährdet:* ${wirk(p.gefaehrdet)}. *Gegen:* ${(p.gegen || []).map((s) => `${s} ${netz.schwaechen[s]}`).join("; ") || "–"}. *Momente:* ${(p.szenen || []).join(", ")}.`, "");
      L.push(`**Regel.** ${p.regel}`, "");
      L.push(`**Warum.** ${p.warum}`, "");
      L.push("**Beleg.**");
      for (const b of p.belege) L.push(`- ${werkName(b.werk)}, ${b.stelle}: „${b.zitat}“`);
      L.push("", "**Übertragung** (eigene Prosa, Entwurf).");
      for (const u of p.uebertragung) L.push(`- ${u}`);
      L.push("", `**Grenze.** ${p.grenze}`, "", `**Prüffrage.** ${p.pruefe}`, "");
      if (p.mass) L.push(`**Maß.** ${p.mass}`, "");
      if (p.nutzer) L.push(`**Nutzer.** ${p.nutzer}`, "");
      L.push("**Kanten.**");
      L.push(`- stärkt: ${(p.kanten.staerkt || []).map(verweis).join("; ") || "–"}`);
      if ((p.kanten.braucht || []).length) L.push(`- braucht: ${p.kanten.braucht.map(verweis).join("; ")}`);
      for (const sp of spannungen(p)) L.push(`- Spannung mit ${verweis(sp.id)}: ${sp.aufloesung}`);
      L.push("", `*Quelle:* ${[].concat(p.quelle).map((q) => "`" + q + "`").join(", ")}`, "");
    }
  }
  writeFileSync(join(NETZ, "PRINZIPIEN.md"), L.join("\n"));

  const S = [];
  S.push("# Situationsindex: in jedem Moment das Richtige", "");
  S.push("*Erzeugt aus `situationen.json` und `prinzipien.json` mit `node tools/stil-netz.mjs md`; nicht von Hand bearbeiten. Stand: " + sit.stand + ".*", "");
  S.push("Vor dem Schreiben: Moment bestimmen, `npm run stil -- <moment>` aufrufen, die Musterstellen **lesen**, dann schreiben und mit den Prüffragen prüfen. Die Wörter sind ein Angebot, kein Pensum; die Dosis gilt je Kapitel.", "");
  S.push("| Moment | Beispiel im Spiel | Register | Prinzipien |", "|---|---|---|---|");
  for (const m of MOMENTE) S.push(`| [${m}](#${m}) | ${sit.momente[m].beispiel} | ${sit.momente[m].register} | ${sit.momente[m].prinzipien.length} |`);
  S.push("");
  for (const m of MOMENTE) {
    const s = sit.momente[m];
    S.push(`<a id="${m}"></a>`, `## ${m}`, "", `*${s.beispiel}.* Register: ${s.register}.`, "", `**Kern.** ${s.hinweis}`, "");
    S.push("| Rang | Prinzip | Regel (kurz) | Prüffrage |", "|---|---|---|---|");
    s.prinzipien.forEach((id, i) => {
      const p = P.get(id);
      const kurzRegel = p.regel.split(/(?<=[.;])\s/)[0];
      S.push(`| ${i + 1} | [${id}](PRINZIPIEN.md#${id.toLowerCase()}) ${p.name} | ${kurzRegel.replace(/\|/g, "/")} | ${p.pruefe.replace(/\|/g, "/")} |`);
    });
    const innen = [];
    for (const id of s.prinzipien) for (const sp of spannungen(P.get(id))) if (s.prinzipien.includes(sp.id) && id < sp.id) innen.push(`- ${id} ↔ ${sp.id}: ${sp.aufloesung}`);
    if (innen.length) S.push("", "**Spannungen in diesem Moment.**", ...innen);
    S.push("", "**Musterstellen** (vor dem Schreiben lesen).");
    for (const ms of s.musterstellen) S.push(`- [${ms.titel}](../${ms.datei}) (${ms.werk}, ${ms.woerter} Wörter)`);
    if (s.anmerkung_musterstellen) S.push(`- *${s.anmerkung_musterstellen}*`);
    S.push("", "**Wörter** (Wortkammer, Dosis je Kapitel).");
    const gruppen = {};
    for (const w of s.woerter) (gruppen[w.dosis] ||= []).push(`${w.wort}${w.register === "elegant-neutral" ? "" : " *(" + w.register + ")*"}`);
    for (const [d, l] of Object.entries(gruppen)) S.push(`- ${d}: ${l.join(", ")}`);
    S.push("");
  }
  writeFileSync(join(NETZ, "SITUATIONEN.md"), S.join("\n"));
  console.log(`geschrieben: ${join(".claude/skills/stil-1800/netz", "PRINZIPIEN.md")} (${netz.prinzipien.length} Knoten), ${join(".claude/skills/stil-1800/netz", "SITUATIONEN.md")} (${MOMENTE.length} Momente)`);
}

const [befehl, wert] = args;
if (befehl === "liste") zeigeListe();
else if (befehl === "prinzip") { if (!wert) { console.error("Aufruf: npm run stil -- prinzip <ID>"); process.exit(1); } zeigePrinzip(wert); }
else if (befehl === "ebene") { if (!wert) { console.error("Aufruf: npm run stil -- ebene <XX>"); process.exit(1); } zeigeEbene(wert); }
else if (befehl === "md") md();
else if (befehl === "pruefen") pruefen();
else if (befehl === "hilfe" || befehl === "help") console.log(readFileSync(new URL(import.meta.url), "utf8").split("\n").slice(1, 9).map((z) => z.replace(/^\/\/ ?/, "")).join("\n"));
else if (sit.momente[befehl]) zeigeMoment(befehl);
else if (/^[A-Za-z]{2}-\d{2}$/.test(befehl)) zeigePrinzip(befehl);
else {
  const nah = MOMENTE.filter((m) => m.startsWith(befehl.slice(0, 3).toLowerCase()));
  console.error(`Unbekannt: ${befehl}.${nah.length ? " Meinst du " + nah.join(", ") + "?" : ""} Momente: ${MOMENTE.join(", ")}`);
  process.exit(1);
}
