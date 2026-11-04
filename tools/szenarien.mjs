// Szenarien: Beweist, dass bestimmte Wege und Ausgänge wirklich erreichbar sind.
// Ein Szenario hat Wünsche (Teile von Auswahltexten, die bevorzugt gewählt werden), Verbote (nie wählen)
// und Erwartungen an den Endzustand. Es wird mit vielen Startwerten versucht, bis die Erwartungen erfüllt sind.
// Aufruf: npm run szenarien
import { compile, play, rng, variable } from "./ink.mjs";

const SZENARIEN = [
  {
    name: "Bester Weg: Moment der Klarheit mit Gascoigne",
    wuensche: ["Ihm danken", "Ihm deinen Namen sagen", "Versprechen, es auszurichten", "Versprechen, die Mutter", "allein entgegengehen", "Nach Gascoigne rufen", "„Gascoigne. Gascoigne!“", "Den Kopf berühren", "an seine Tochter", "Spieluhr aufziehen", "Ihn rufen", "Ihm versprechen", "Lügen", "Ihr sagen, ihr Vater"],
    verbote: ["Klinik zu laufen", "anfahren", "drohen", "fliehen", "Wurf ablenken", "wo du ihn gesehen", "Brosche geben", "Jägermarke"],
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
    wuensche: ["Langsam, die Dächer", "Hinaufklettern", "Wurf ablenken"],
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
    wuensche: ["Ihm danken", "Nach den Abzeichen", "wo du ihn gesehen", "Rabenfedern auf dem Dach", "anbieten, mit ihr zu jagen"],
    verbote: ["warnen", "Jägermarke"],
    erwartet: { gascoigne_verraten: true, eileen_partner: true },
  },
  {
    name: "Gascoigne gewarnt, Bruch mit Eileen",
    wuensche: ["Ihm danken", "Nach den Abzeichen", "Rabenfedern auf dem Dach", "anbieten, mit ihr zu jagen", "vor der Frau mit den Rabenfedern"],
    verbote: ["wo du ihn gesehen", "Jägermarke"],
    erwartet: { gascoigne_gewarnt: true, eileen_partner: false },
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
  {
    name: "Namen getauscht: Gascoigne kennt dich beim Namen",
    wuensche: ["Ihm deinen Namen sagen", "In den Schatten um den Platz"],
    verbote: [],
    erwartet: { gascoigne_name: true, q_frau: 1 },
  },
  {
    name: "Mob verbrannt: Martha stirbt, Gascoigne kühler",
    wuensche: ["Gilberts Fenster", "Ihm deinen Namen nennen", "Dich verabschieden", "Hauptstraße mit dem Scheiterhaufen", "Stehen bleiben und kämpfen", "Feuer in die Menge"],
    verbote: [],
    erwartet: { mob_verbrannt: true },
  },
  {
    name: "Im Lied zugeschlagen",
    wuensche: ["Versprechen, die Mutter", "Spieluhr aufziehen", "Zuschlagen, solange er zuhört"],
    verbote: ["Klinik zu laufen"],
    erwartet: { im_lied_getroffen: true },
  },
  {
    name: "Wahrheit ohne Brosche: Sie glaubt halb und bleibt",
    wuensche: ["Versprechen, die Mutter", "Sie ihr lassen", "Die Wahrheit sagen, ohne Beweis", "Ihr die Wahrheit sagen, ohne Beweis", "Brunnenplatz, wo das Mädchen wartet"],
    verbote: ["Klinik zu laufen", "Die Brosche an dich"],
    erwartet: { q_mutter: 7, maedchen_wo: "zuhause" },
  },
  {
    name: "Schütze verschont, rettet dich auf dem Rückweg",
    wuensche: ["Gasse unter den Dächern", "Langsam, die Dächer", "Hinaufklettern", "Ihm das Gewehr abnehmen"],
    verbote: ["Es beenden"],
    erwartet: { schuetze_verschont: true },
  },
  {
    name: "Wendels Mantel: Gascoigne angelogen",
    wuensche: ["Gasse unter den Dächern", "Langsam, die Dächer", "Hinaufklettern", "An der Laterne in den Traum", "Zum Bad der Boten", "Jägermantel kaufen", "Zurück zur Laterne", "Hauptstraße mit dem Scheiterhaufen", "In den Schatten", "Lügen: in einer Gasse"],
    verbote: ["Molotow kaufen", "Kieselstein kaufen", "Jagdnotizen", "Brief mit Kirchensiegel"],
    erwartet: { mantel: true, mantel_erkannt: true, mantel_gelogen: true },
  },
  {
    name: "Gilbert das Versprechen gegeben",
    wuensche: ["Gilberts Fenster", "Ihm deinen Namen nennen", "Dich verabschieden", "Zu Gilbert", "Ihm von Gascoigne erzählen", "Es ihm versprechen"],
    verbote: [],
    erwartet: { versprechen_gilbert: true },
  },
  {
    name: "Verraten und gewarnt: Eileen wendet sich ab",
    wuensche: ["Ihm danken", "In den Schatten um den Platz", "Dachbalken über dem Kanaleingang", "wo du ihn gesehen", "Zu den Gräbern", "vor der Frau mit den Rabenfedern"],
    verbote: [],
    erwartet: { gascoigne_verraten: true, gascoigne_gewarnt: true, eileen_partner: false },
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
