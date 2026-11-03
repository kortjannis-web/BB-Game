// Szenarien: Beweist, dass bestimmte Wege und Ausgänge wirklich erreichbar sind.
// Ein Szenario hat Wünsche (Teile von Auswahltexten, die bevorzugt gewählt werden), Verbote (nie wählen)
// und Erwartungen an den Endzustand. Es wird mit vielen Startwerten versucht, bis die Erwartungen erfüllt sind.
// Aufruf: npm run szenarien
import { compile, play, rng, variable } from "./ink.mjs";

const SZENARIEN = [
  {
    name: "Bester Weg: Moment der Klarheit mit Gascoigne",
    wuensche: ["Ihm danken", "Versprechen, die Mutter", "Allein kämpfen", "Gascoigne rufen", "Den Kopf berühren", "an seine Tochter", "Spieluhr aufziehen", "Ihm versprechen", "Lügen", "Ihr sagen, ihr Vater"],
    verbote: ["Klinik zu laufen", "anfahren", "drohen", "fliehen", "werfen", "wo du ihn gesehen", "Brosche geben", "Jägermarke"],
    erwartet: { gascoigne_moment: true, gedaechtnis_kleriker: true, versprechen_gascoigne: true, maedchen_wo: "zuhause" },
  },
  {
    name: "Falsche Entscheidung: Mädchen weggeschickt, Band beim Schwein",
    wuensche: ["Klinik zu laufen", "Hinab in die Kanalisation"],
    verbote: [],
    erwartet: { maedchen_tot: true, spieluhr: false },
  },
  {
    name: "Kleriker-Bestie abgelenkt",
    wuensche: ["Langsam, die Dächer", "Hinaufklettern", "Etwas werfen"],
    verbote: ["kämpfen", "fliehen"],
    erwartet: { kleriker: "abgelenkt" },
  },
  {
    name: "Kleriker-Bestie: Flucht durch die Gassen",
    wuensche: ["fliehen"],
    verbote: ["kämpfen", "werfen"],
    erwartet: { kleriker: "geflohen" },
  },
  {
    name: "Verrat an Gascoigne, Partnerschaft mit Eileen",
    wuensche: ["Ihm danken", "Respekt", "wo du ihn gesehen", "Mitgehen", "Eileen ein Zeichen", "Rabenfedern"],
    verbote: ["warnen", "Jägermarke"],
    erwartet: { gascoigne_verraten: true, eileen_partner: true },
  },
  {
    name: "Gascoigne gewarnt, Eileen verloren",
    wuensche: ["Ihm danken", "Respekt", "Mitgehen", "Rabenfedern", "vor der Frau mit den Rabenfedern"],
    verbote: ["wo du ihn gesehen", "Jägermarke"],
    erwartet: { gascoigne_gewarnt: true, eileen_partner: false, eileen_hilft: false },
  },
  {
    name: "Lüge an das Mädchen",
    wuensche: ["Versprechen, die Mutter", "Lügen"],
    verbote: ["Klinik zu laufen"],
    erwartet: { q_mutter: 4, maedchen_wo: "zuhause" },
  },
  {
    name: "Kanon-Tragödie: Brosche gegeben, Band beim Schwein auf dem Rückweg",
    wuensche: ["Versprechen, die Mutter", "Die Brosche an dich", "Brosche geben", "Durch die Kanalisation zurück"],
    verbote: ["Klinik zu laufen"],
    erwartet: { q_mutter: 3, maedchen_tot: true },
  },
];

const { json, errors } = compile();
if (!json) {
  console.log("Kompiliert nicht:", errors);
  process.exit(1);
}

let fehler = 0;
for (const sz of SZENARIEN) {
  let gefunden = null;
  for (let seed = 1; seed <= 400 && !gefunden; seed++) {
    const r = rng(seed * 7919);
    const { story, stuck } = play(json, (choices) => {
      const texts = choices.map((c) => c.text);
      const erlaubt = texts.map((t, i) => i).filter((i) => !sz.verbote.some((v) => texts[i].includes(v)));
      const pool = erlaubt.length ? erlaubt : texts.map((t, i) => i);
      const wunsch = pool.filter((i) => sz.wuensche.some((w) => texts[i].includes(w)));
      if (wunsch.length && r() < 0.85) return wunsch[Math.floor(r() * wunsch.length)];
      return pool[Math.floor(r() * pool.length)];
    });
    if (stuck) continue;
    const ok = Object.entries(sz.erwartet).every(([k, v]) => variable(story, k) === v);
    if (ok) gefunden = seed;
  }
  if (gefunden) console.log(`  ok    ${sz.name} (Startwert ${gefunden})`);
  else {
    fehler++;
    console.log(`  FEHLT ${sz.name}`);
  }
}
if (fehler) {
  console.log(`\nNICHT BESTANDEN: ${fehler} Szenario(s) nicht erreichbar.`);
  process.exit(1);
}
console.log("\nAlle Szenarien erreichbar.");
