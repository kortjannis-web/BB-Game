// Szenarien: Beweist, dass bestimmte Wege und Ausgänge wirklich erreichbar sind.
// Ein Szenario hat Wünsche (Teile von Auswahltexten, die bevorzugt gewählt werden), Verbote (nie wählen)
// und Erwartungen an den Endzustand. Es wird mit vielen Startwerten versucht, bis die Erwartungen erfüllt sind.
// Aufruf: npm run szenarien
import { compile, play, rng, variable } from "./ink.mjs";

const SZENARIEN = [
  {
    name: "Bester Weg: Moment der Klarheit mit Gascoigne",
    wuensche: ["Ihm danken", "Ihm deinen Namen sagen", "Ich richte es ihr aus", "Ich finde deine Mama", "allein entgegengehen", "Nach Gascoigne rufen", "„Gascoigne. Gascoigne!“", "Den Kopf berühren", "Deine Kleine wartet", "Spieluhr aufziehen", "Ihn rufen", "Ihm versprechen", "Lügen", "Dein Papa wusste", "Versprechen, es auszurichten", "Versprechen, die Mutter", "Sie kommt bald", "beim Namen rufen"],
    verbote: ["Lauf zu der Ärztin", "anfahren", "gegen ein Türblatt", "fliehen", "Wurf ablenken", "wo du ihn gesehen", "Brosche geben", "Klinik zu laufen", "drohen"],
    erwartet: { gascoigne_moment: true, gedaechtnis_kleriker: true, versprechen_gascoigne: true, maedchen_wo: "zuhause" },
  },
  {
    name: "Falsche Entscheidung: Mädchen weggeschickt, Band beim Schwein",
    wuensche: ["Lauf zu der Ärztin", "zum Brunnenplatz"],
    verbote: [],
    erwartet: { maedchen_tot: true, spieluhr: false },
  },
  {
    name: "Kleriker-Bestie abgelenkt",
    wuensche: ["Wurf ablenken"],
    verbote: ["allein entgegengehen", "fliehen"],
    erwartet: { kleriker: "abgelenkt" },
  },
  {
    name: "Kleriker-Bestie: Flucht durch die Gassen",
    wuensche: ["fliehen"],
    verbote: ["allein entgegengehen", "Wurf ablenken"],
    erwartet: { kleriker: "geflohen" },
  },
  {
    name: "Verrat an Gascoigne, Eileens Angebot für Kapitel 2",
    wuensche: ["Ihm danken", "für Abzeichen", "wo du ihn gesehen", "anbieten, mit ihr zu jagen"],
    verbote: ["warnen"],
    erwartet: { gascoigne_verraten: true, eileen_partner: true },
  },
  {
    name: "Gascoigne gewarnt, Bruch mit Eileen",
    wuensche: ["Ihm danken", "für Abzeichen", "anbieten, mit ihr zu jagen", "Die Frau im Federmantel jagt"],
    verbote: ["wo du ihn gesehen"],
    erwartet: { gascoigne_gewarnt: true, eileen_partner: false },
  },
  {
    name: "Lüge an das Mädchen",
    wuensche: ["Ich finde deine Mama", "Lügen", "Versprechen, die Mutter", "Sie kommt bald"],
    verbote: ["Lauf zu der Ärztin", "Klinik zu laufen"],
    erwartet: { q_mutter: 4, maedchen_wo: "zuhause" },
  },
  {
    name: "Kanon-Tragödie: Brosche gegeben, Band beim Schwein auf dem Rückweg",
    wuensche: ["zum Brunnenplatz", "Ich finde deine Mama", "Die Brosche an dich", "Brosche geben"],
    verbote: ["Lauf zu der Ärztin"],
    erwartet: { q_mutter: 3, maedchen_tot: true },
  },
  {
    name: "Namen getauscht: Gascoigne kennt dich beim Namen",
    wuensche: ["Ihm deinen Namen sagen", "In den Schatten um den Platz"],
    verbote: [],
    erwartet: { gascoigne_name: true, q_frau: 1 },
  },
  {
    name: "Mob verbrannt: Martha stirbt, Gascoigne kühler",
    wuensche: ["Ihm deinen Namen nennen", "Dich verabschieden", "Stehen bleiben und die Säge", "Feuer in die Menge"],
    verbote: [],
    erwartet: { mob_verbrannt: true },
  },
  {
    name: "Im Lied zugeschlagen",
    wuensche: ["Ich finde deine Mama", "Spieluhr aufziehen", "Zuschlagen, solange er zuhört", "Versprechen, die Mutter", "solange er zuhört"],
    verbote: ["Lauf zu der Ärztin", "Klinik zu laufen"],
    erwartet: { im_lied_getroffen: true },
  },
  {
    name: "Wahrheit ohne Brosche: Sie glaubt halb und bleibt",
    wuensche: ["Ich finde deine Mama", "zum Brunnenplatz", "Sie ihr lassen", "Deine Mama kommt nicht wieder"],
    verbote: ["Lauf zu der Ärztin", "Die Brosche an dich"],
    erwartet: { q_mutter: 7, maedchen_wo: "zuhause" },
  },
  {
    name: "Schütze verschont, rettet dich auf dem Rückweg",
    wuensche: ["in die Gasse unter den Dächern", "Langsam, die Dächer", "Hinaufklettern", "Ihm das Gewehr abnehmen"],
    verbote: ["mit der Säge beenden"],
    erwartet: { schuetze_verschont: true },
  },
  {
    name: "Wendels Mantel (dunkles Haus): Gascoigne angelogen",
    wuensche: ["zum dunklen Haus", "in das dunkle Haus", "Der offenen Tür folgen", "Den Mantel vom Haken nehmen", "Der lag in einer Gasse", "Lügen: in einer Gasse", "In den Schatten"],
    verbote: ["Ihn hängen lassen"],
    erwartet: { mantel: true, mantel_erkannt: true, mantel_gelogen: true },
  },
  {
    name: "Gilbert das Versprechen gegeben",
    wuensche: ["Ihm deinen Namen nennen", "Dich verabschieden", "Es ihm versprechen", "Am Grab war ein Pater"],
    verbote: [],
    erwartet: { versprechen_gilbert: true },
  },
  {
    name: "Verraten und gewarnt: Eileen wendet sich ab",
    wuensche: ["Ihm danken", "In den Schatten um den Platz", "wo du ihn gesehen", "Die Frau im Federmantel jagt"],
    verbote: [],
    erwartet: { gascoigne_verraten: true, gascoigne_gewarnt: true, eileen_partner: false },
  },
  {
    name: "Dachweg: Jagdheft, Brandflasche und Kiesel gefunden",
    wuensche: ["Die Leiter hinaufsteigen", "Das Heft aus der Tasche"],
    verbote: ["Nur die Flasche"],
    erwartet: { jagdnotizen: true },
  },
  {
    name: "Route ohne dunkles Haus: kein Mantel, keine Brückenspur im Haus",
    wuensche: ["Dem Hund folgen", "Den Glocken folgen"],
    verbote: ["Der offenen Tür folgen"],
    erwartet: { mantel: false, haus_zettel: false },
  },
  {
    name: "Der Tod bringt ein Nachbild mit Fragment: Rückkehr an den Kampfanfang",
    wuensche: [],
    verbote: [],
    erwartet: { tode: (t) => t >= 4, fr_gespielt: (l) => l.Count >= 1 },
  },
  {
    name: "Kirchenbrief aus dem Fell der Kleriker-Bestie (Fundstück statt Handel)",
    wuensche: ["allein entgegengehen", "Nach Gascoigne rufen"],
    verbote: ["Wurf ablenken", "fliehen"],
    erwartet: { kirchenbrief: true, kleriker: "besiegt" },
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
    const ok = Object.entries(sz.erwartet).every(([k, v]) => (typeof v === "function" ? v(variable(story, k)) : variable(story, k) === v));
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
