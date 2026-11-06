# Das Prinzipien-Netz: Bauplan

Auftrag des Nutzers (2026-11-06): „Fass die Texte nicht nur irgendwie zusammen, sondern bau ein riesiges Prinzipien-Netz, wie ein Mega-Gehirn: wie man perfekte Buchtexte schreibt, von eloquenten Worten zu sinnvollen Satzstrukturen. Stell sicher, dass du maximal viel lernst und in jedem Moment das Richtige schreiben kannst.“

Das Netz ist keine Sammlung von Zusammenfassungen. Es ist ein Gefüge aus **Prinzipien** (Knoten) und **Beziehungen** (Kanten), das sich nach der **Situation** abfragen lässt. Jedes Prinzip ist an den Meistern belegt, positiv formuliert, prüfbar, und es weiß, wo seine Grenze liegt.

## 1 Neun Ebenen (vom Wort zum Werk)

| Ebene | Kürzel | Frage |
|---|---|---|
| Wort | **WO** | Welches Wort trägt hier: Verb, Adjektiv, Partikel; Register, Klang, Alter? |
| Fügung und Bild | **FB** | Welche Verbindung von Wörtern, welches Bild, welcher Vergleich (oder keiner)? |
| Satz | **SA** | Wie ist der Satz gebaut: Periode, Gefüge, Reihung, Ellipse; wo liegt das Gewicht; welche Gelenke, welche Zeichen? |
| Absatz | **AB** | Welche Welle der Satzlängen, welcher Übergang, wie schließt der Absatz? |
| Stimme | **ST** | Wer erzählt mit welcher Haltung: Nähe, Distanz, Ironie, Urteil, Leseranrede, erlebte Rede? |
| Figur | **FI** | Wie spricht diese Figur nach Stand, Laune und Absicht; was verschweigt sie? |
| Szene | **SZ** | Wie wird diese Art Szene gebaut (Ankunft, Begegnung, Kampf, Grauen, Traum, Tod …)? |
| Werk | **WE** | Leitmotiv, Saat und Ernte, Rahmen, Dokumente, Treppe des Grauens über ein Kapitel |
| Spiel | **SP** | Was verlangt das Medium: Du-Präsens, Optionen im Satz, Lesen am Handy, Wiederholung nach dem Tod? |

## 2 Sechs Wirkungen (die Ziele des Nutzers)

| Wirkung | Kürzel | Bedeutung |
|---|---|---|
| hautnah | **HN** | als erlebe man es gerade (Büchner, Rilke) |
| unheimlich | **UN** | eerie, das Grauen im fast Normalen (Hoffmann, Kafka) |
| mystisch | **MY** | Traum, Ahnung, das Kosmische (Meyrink, Tieck, Eichendorff) |
| elegant | **EL** | Eleganz der Vergangenheit, Periode, Wort (Storm, Mann, Fontane) |
| meisterhaft | **ME** | Genialität des Baus (Kleist, Mann) |
| klar | **KL** | beim ersten Lesen verständlich (Wunsch des Nutzers, `docs/nutzerstil.md`) |

Jedes Prinzip nennt die Wirkungen, die es stärkt, und die, die es gefährdet. Elegante Perioden gefährden zum Beispiel die Klarheit am Handy.

## 3 Ein Prinzip (Knoten)

Gespeichert in `prinzipien.json`, lesbar erzeugt in `PRINZIPIEN.md`.

```json
{
  "id": "SA-07",
  "name": "Die Periode mit früher Achse",
  "ebene": "SA",
  "wirkt": ["EL", "ME"], "gefaehrdet": ["KL"],
  "regel": "Was man tut, positiv formuliert.",
  "warum": "Der Mechanismus: warum es beim Leser wirkt.",
  "belege": [{"werk": "mann_tod-in-venedig", "zitat": "…", "stelle": "Kap. 3"}],
  "uebertragung": ["Eigener Beispielsatz, Du-Präsens, Yharnam."],
  "grenze": "Wann der Griff kippt oder ermüdet.",
  "pruefe": "Prüffrage für den fertigen Text.",
  "mass": "optional: messbare Größe für den Prüfer, z. B. Satzlänge ≥ 30 mit Hauptsatz in den ersten 8 Wörtern",
  "gegen": ["S10"],
  "kanten": {"staerkt": ["AB-02"], "braucht": ["WO-03"], "spannung": ["SP-01"]},
  "szenen": ["ankunft", "chronik"],
  "quelle": "analysen/mann_tod-in-venedig.md#griff-4"
}
```

- `gegen`: Schwächen S1 bis S15 aus `docs/schreibkunst-analyse.md`, Abschnitt 3.
- `kanten`: **staerkt** (wirkt zusammen), **braucht** (setzt voraus), **spannung** (zieht in eine andere Richtung; die Auflösung steht dabei).

## 4 Der Situationsindex (in jedem Moment das Richtige)

`SITUATIONEN.md` und `situationen.json` ordnen jedem Moment des Schreibens zu:
- die Prinzipien, nach Gewicht geordnet;
- **zwei bis drei Musterstellen** aus dem Korpus (Werk und Absatz), die vor dem Schreiben gelesen werden. Vorbilder schlagen Regeln (`docs/ki-schreibmethode.md`).

Momente (erste Liste, wächst mit):

| Moment | Beispiel im Spiel |
|---|---|
| ankunft | ein Ort zum ersten Mal: Yharnam hinter der Kehre, die Klinik |
| rueckkehr | ein bekannter Ort, verändert |
| begegnung | eine Figur tritt auf: der Blutminister, Gilbert am Fenster |
| gespraech | Rede und Gegenrede, Lüge, Verschweigen |
| anzeichen | etwas kündigt sich an: Laut, Geruch, Stille |
| kampf | Takt um Takt, Folge kurz und hart |
| tod | der Spieler stirbt; eine Figur stirbt |
| erwachen | nach dem Tod, im Traum, in der Klinik |
| fund | ein Gegenstand, eine Leiche, eine Spur |
| dokument | Zettel, Anschlag, Tagebuch, Vertrag |
| geruecht | was man sich erzählt (Konjunktiv) |
| kirche | Register C: Amt, Ordnung, Vermerk |
| traum | Jägertraum, Vision, Einsicht |
| grauen | der Moment des Schreckens |
| ruhe | Atem nach dem Schrecken, Wärme |
| abschied | eine Figur bleibt zurück |
| kapitelende | Nachklang, Chronik |
| option | der sichtbare Anfang einer Wahl und die Fortsetzung im Satz |

## 5 Die Wortkammer (statt einer bloßen Liste schöner Wörter)

Wunsch des Nutzers: eine Liste der 1.000 bis 2.000 elegantesten Wörter für deutsche Buchprosa. **Gegenvorschlag, der den Wunsch erfüllt und eine Gefahr vermeidet.** Eine lose Liste „schöner Wörter“ führt bei einer KI zu Wortschmuck: Seltene Wörter werden zum neuen Tic, wie „Tapestry“ im Englischen. Darum:

1. **Gemessen, nicht ausgedacht.** Die Kandidaten kommen aus dem Korpus der Meister: Wörter, die dort in mindestens drei Werken stehen und bei uns fehlen. Erster Lauf: 4.904 Kandidaten aus 345.000 Wörtern. Daraus werden 1.500 bis 2.000 von Hand ausgewählt.
2. **Geordnet nach Aufgabe:** Verben der Bewegung, der Wahrnehmung, des Sprechens; Adjektive für Licht, Alter, Verfall, Seele; Substantive der Zeit (Stube, Antlitz, Gesinde); Partikeln und Gelenke (freilich, indessen, gleichwohl); Fügungen.
3. **Jedes Wort mit Belegsatz** aus dem Korpus, Register (gehoben, altertümlich, Kirche, Volk) und **Dosis** (wie oft je Kapitel höchstens).
4. **Ein Zähler im Prüfer** wacht über die Dosis, damit kein Wort zur Formel wird.

## 6 Wie das Netz beim Schreiben benutzt wird

1. Szene planen, dann den Moment bestimmen (Abschnitt 4).
2. `npm run stil -- <moment>` gibt die Prinzipien, die Musterstellen und passende Wörter der Wortkammer aus. Die Musterstellen werden gelesen.
3. Schreiben, mit dem Netz im Blick, nicht mit Verbotslisten.
4. Prüfer v2: Messwerte gegen den Korridor der Meister, Slop-Detektor, Dosis der Wortkammer.
5. Drei Kritiker (Stil blind, Lore, Logik), dann Überarbeitung, dann der Nutzer.

## 7 Woraus das Netz entsteht

- Wort-für-Wort-Analysen in `analysen/` (je Werk drei Schlüsselstellen Satz für Satz, 15 bis 20 Griffe, Wortkammer, Vorher und Nachher an unseren Sätzen).
- Messwerte (`docs/schreibkunst-analyse.md`, Abschnitt 2) und Slop-Detektor.
- Muster des Nutzers (`docs/nutzerstil.md`). **Sie gehen jedem Prinzip vor**, auch den Meistern.

Die Griffe aller Werke werden zusammengeführt: Doppelte werden zu einem Prinzip mit mehreren Belegen verschmolzen, Widersprüche werden zu Kanten mit dem Vermerk „spannung“ und einer Auflösung. Jedes Prinzip bekommt Übertragungen auf Yharnam.
