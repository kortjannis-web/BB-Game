# Besser schreiben, Lore vollständig: Analyse und Plan

Stand 2026-11-04, nach der Kritik des Nutzers: eigenartige Wörter, unlogische Aussagen, grauenhafte Entscheidungsoptionen, keine fesselnde, schöne Sprache, keine Atmosphäre, ständig Sätze, die einen rauswerfen. Die Kritik trifft zu. Dieses Dokument sagt, warum, und was wir ändern.

---

## Teil A: Was am Text schlecht ist (gemessen, mit Belegen aus unserem Text)

### A1 Zahlen (gemessen über alle Ink-Dateien, ~22.000 Wörter)
| Messwert | Wert | Bewertung |
|---|---|---|
| Durchschnittliche Satzlänge | **10,3 Wörter** | zu kurz für den Ton „Buch, Lovecraft, eloquent“. Gute deutsche Erzählprosa liegt meist deutlich höher und wechselt stark; wir schreiben Stakkato. Die Vorgabe „Folge kurz und hart“ hat das in den Kämpfen noch verstärkt. |
| „etwas“ | 88-mal (häufigstes Inhaltswort) | Verlegenheitswort: Wo „etwas“ steht, fehlt das Ding. |
| „wie ein/eine …“ und „als ob/als hätte …“ | zusammen 92-mal, rund 4 je 1.000 Wörter | Vergleichsflut. Jeder zweite Absatz erklärt sich durch ein Bild von woanders, statt das Ding selbst zu zeigen. |
| „langsam“, „einmal/noch einmal“ | 34 und 40 | Tics. |
| Reihen „X, Y, Z“ | rund 6 je 1.000 Wörter | die typische Dreierreihe von Sprachmodellen. |
| Satzanfang „Du“ | 191-mal | Anleitungston in Wellen. |
| Optionen | 259, im Schnitt 4,6 Wörter | 20 bestehen aus einem einzigen Wort („Gehen“, „Zurück“, „Nein“, „Nicken“), 56 sind bloße Ortsnamen, 26 Meta-Verben („sagen“, „fragen“, „versprechen“, „anfahren“), 12 mit Semikolon oder Doppelpunkt. |

### A2 Entscheidungsoptionen: die größte Schwäche
Belege und was daran falsch ist:
- **Formular statt Figur:** „Ja; du sagst ihr, wo du ihn gesehen hast“, „Ihn anfahren, er solle dich in Ruhe lassen“, „Ihr sagen, sie solle sich um ihren Kram kümmern“. Indirekte Rede im Befehlsinfinitiv, dazu Semikolon. So spricht niemand, so füllt man ein Amtsformular aus.
- **Speisekarte:** „Die Gasse unter den Dächern“, „Die Türen mit den Räucherlampen“, „Der Brunnenplatz, wo eine Spieluhr spielt“. Orte als Menüpunkte, ohne Sog.
- **Datenblatt:** „Die Pistole: genau“, „Die Donnerbüchse: streut, hält auf Abstand“.
- **Leerlauf:** „Gehen“, „Zurück“, „Nein“, „Nicken“, „Knapp bleiben“, „Schweigen“. Kein Ton, keine Haltung, kein Bild.
- **Die Lösung steht in der Option:** „Auf den Rücken, dorthin, wo es nicht beißen kann“.
- **Echo:** Nach „Ihm deinen Namen sagen“ folgt „Du sagst ihm deinen Namen“. Die Option wird im Text wiederholt, der Leser liest alles zweimal.

### A3 Sätze, die rauswerfen
- **Die Mechanik spricht mit:** „Einsicht. Das Wort ist einfach da“, „mehr Echos als je zuvor“, „mit der Wärme der Puppe in den Schultern“. Spielbegriffe im Erzähltext brechen die Welt.
- **Der Erzähler klopft dir auf die Schulter:** „Gilbert hatte recht.“, „Du lebst.“, „Es hilft nichts.“, „Das Abzeichen wiegt trotzdem schwer.“ Urteile und Floskeln statt Bild.
- **Bilder, die nicht tragen:** „Sie stirbt wie ein Gebäude, das einstürzt“, „wie eine Streichholzschachtel“ (Streichhölzer, ein Wort aus unserer Gegenwart), „Ebenso gut könnte man einen Wasserfall mit einem Spaten aufhalten“. Falsche Welt oder schief.
- **Falscher Ton in Figurenmund:** „Mach ich. Genau das mach ich.“, „Steht dir nicht.“, „Na, na.“ Gegenwartsdeutsch in einer viktorianisch-gotischen Stadt.
- **Unlogisches:** links und rechts ohne Blickpunkt; „Gascoigne sieht“ trotz Augenbinde (schon zweimal korrigiert, das Muster zeigt, dass ich Szenen nicht räumlich denke); ein Schuss, der „ins Leere“ geht und dann trotzdem trifft.

### A4 Fehlende Atmosphäre
- Kein Ort hat einen **Leitklang**, eine **Leitfarbe**, einen **Leitgeruch**, die wiederkehren und sich verändern.
- **Keine Stille.** Jeder Absatz meldet etwas. Grauen braucht Leerlauf, Warten, das Ausbleiben eines Geräuschs.
- **Kein Rhythmus über die Szene hinweg:** lange, lauernde Perioden fehlen fast ganz (Ø 10 Wörter).
- **Zu wenig Yharnam:** kaum Dinge, die es nur dort gibt (Handwerk, Kleidung, Kirchensprache, Straßennamen, Speisen, Bräuche). Statt Welt allgemeines Gruselinventar: Nebel, Blut, Dunkelheit.

### A5 Ursachen (ehrlich)
1. **Zu viel in zu kurzer Zeit:** 22.000 Wörter in wenigen Sitzungen, fast alles in einem Durchgang. Kein Text hat drei Fassungen gesehen.
2. **Die Skills sind Verbotslisten, keine Stimme.** Sie sagen, was nicht sein darf (keine Gedankenstriche, kein „plötzlich“), aber nicht, wie es klingen soll. Ergebnis: sauber und leblos.
3. **Keine Vorbilder im Ohr.** Es gibt keinen Referenztext, an dem sich die Stimme eicht.
4. **Die Prüfungen messen Logik, nicht Prosa.** `npm run check` prüft Erreichbarkeit, nicht Klang. Der Prüf-Agent ist dasselbe Modell mit denselben Gewohnheiten.
5. **Optionen werden zuletzt und nebenbei geschrieben**, als Beschriftung, nicht als Satz der Figur.
6. **Typische Schwächen eines Sprachmodells im Deutschen:** Vergleichsflut, Dreierreihen, Übersetzungsdeutsch, Verlegenheitswörter („etwas“, „langsam“), Sicherheitsfloskeln.

---

## Teil B: Ideen, wie wir deutlich besser schreiben

### B1 Erst die Stimme, dann der Text
1. **Stimm-Bibel mit Vorbildern.** Eine Datei `docs/stimme.md` mit 6 bis 10 Vorbildern, die gemeinfrei sind und den Ton treffen, je mit einer Analyse ihrer Griffe (nie mit kopierten Sätzen im Spiel):
   - Jeremias Gotthelf, „Die schwarze Spinne“ (1842): Volksgrauen, Rahmen, Kirche, Seuche, Schuld. Das ist unsere Stufe 1, fast deckungsgleich.
   - E. T. A. Hoffmann, „Der Sandmann“ (1816): Kindheitsschrecken, unzuverlässige Wahrnehmung, Augen. Passt zu Einsicht.
   - Annette von Droste-Hülshoff, „Die Judenbuche“ (1842): Dorf, Schweigen, Andeutung; Grauen durch Weglassen.
   - Theodor Storm, „Der Schimmelreiter“ (1888): Erzählrahmen, Aberglaube gegen Vernunft, Wetter als Figur.
   - Gustav Meyrink, „Der Golem“ (1915): Stadt als Organismus, Gassen, Traumlogik. Passt zu Yharnam.
   - Georg Heym, Novellen und Gedichte (bis 1912): Stadt, Seuche, Großstadtgrauen in harten Bildern.
   - Franz Kafka, „In der Strafkolonie“ (1919): das Ungeheure in ruhiger Amtssprache. Passt zur Kirche.
   - H. P. Lovecraft im Original (in der EU gemeinfrei): Bauplan, Indizienkette, kosmischer Maßstab.
   Aus jedem Vorbild: drei Griffe, je mit einem **eigenen** Beispielsatz in Yharnam.
2. **Drei Stimmproben, du wählst.** Dieselbe kurze Szene (z. B. Gilberts Fenster) in drei Stimmen: volkstümlich-chronikhaft (Gotthelf), fiebrig-nah (Hoffmann), ruhig-amtlich-kalt (Kafka). Du sagst pro Probe einen Satz. Die gewählte Stimme wird Gesetz.
3. **Satzmelodie festlegen:** Zielwert Ø 15 bis 20 Wörter mit großer Streuung. Lange, gebaute Perioden für Ankunft und Lauern; kurze Sätze nur dort, wo etwas geschieht, und dann wirklich nur dort.
4. **Yharnam-Lexikon** (`docs/lexikon.md`): Wörter der Welt (Blutstelle, Jagdnacht, Räucherwerk, Ampulle, Laternenpfahl, Vikar, Kapelle, Spital, Schlagbaum, Gaslaterne, Pferdedroschke …), Anrede-Formen, Flüche, Kirchensprache, Maße. Dazu eine **Sperrliste** gegenwärtiger Wörter (Kram, checken, okay, Streichholzschachtel, „Na, na“, „Mach ich“).
5. **Figurenstimmen als Hörprobe:** je Figur fünf Musterzeilen und ein Verbot. Beispiel: Gascoigne gesund spricht in vollen, warmen Sätzen mit fremdem Satzbau, nie in Gegenwartsdeutsch.

### B2 Entscheidungsoptionen neu denken
Regeln (gelten ab sofort, werden automatisch geprüft, siehe B4):
1. **Eine Option ist ein Satz der Figur, kein Menüpunkt.** Gesprochene Wahl in Anführungszeichen, als Anfang dessen, was du sagst: „Er ist zu den Gräbern hinunter.“ statt „Ja; du sagst ihr, wo du ihn gesehen hast“.
2. **Handlungen mit dem Körper**, 2 bis 7 Wörter, ein kräftiges Verb: „Unter den Arm tauchen“ statt „Nach rechts, unter den Arm“ (die Richtung steht dann im Anzeichen, nicht in der Option).
3. **Orte locken mit dem, was man von dort wahrnimmt:** „Dem Klang der Spieluhr nach“ statt „Der Brunnenplatz, wo eine Spieluhr spielt“; „Zu den roten Lampen und dem Lachen hinter der Tür“.
4. **Haltung statt Meta-Verb:** „Behalt deinen Husten für dich.“ statt „Ihn anfahren, er solle dich in Ruhe lassen“.
5. **Nie ein einzelnes Wort.** „Gehen“ wird zu „Dich vom Gitter lösen“ oder „„Ich muss weiter.““
6. **Die Option verrät nie die Lösung**, sie beschreibt nur die Absicht. Die Begründung gehört ins Anzeichen.
7. **Der Text danach wiederholt die Option nicht**, er setzt dort ein, wo die Option aufhört (Folge, Antwort, Bild).
8. **Gleiche Bauart innerhalb einer Wahl:** alle gesprochen oder alle Handlung, gleich lang, gleich gewichtet, damit die richtige nicht durch Form auffällt.
9. **Optionen zuerst schreiben**, nicht zuletzt: Bevor die Szene steht, stehen die drei Wege als Sätze da. Die Szene baut auf sie hin.

Vorher und nachher, aus unserem Text:
| Vorher | Nachher (Vorschlag) |
|---|---|
| Ihn anfahren, er solle dich in Ruhe lassen | „Behalt deinen Husten für dich.“ |
| Ja; du sagst ihr, wo du ihn gesehen hast | „Er ist zu den Gräbern hinunter.“ |
| Die Pistole: genau | Die schmale Pistole, ein Schuss, der sitzt |
| Die Gasse unter den Dächern | Unter die Dächer, wo vorhin ein Lauf blinkte |
| Gehen | Dich vom Gitter lösen |
| Stehen bleiben, dann zur Seite | Warten, bis das Geweih dich fast berührt |

### B3 Atmosphäre bauen
1. **Ortsbibel je Ort:** Leitklang, Leitgeruch, Leitfarbe, ein Fundstück, eine Unstimmigkeit, und was sich beim Wiederkommen verändert. Zentral-Yharnam: Glocken ohne Glöckner, süßes Räucherwerk, rotes Glas. Unterstadt: Wasser, das nie aufhört, Moder, Grün. Grab: Erde, Eisen, das Ausbleiben jedes Geräuschs.
2. **Stille als Mittel:** In jeder großen Szene ein Absatz, in dem nichts geschieht und der Leser wartet.
3. **Die Zeit als Druck:** die Sonne, die nicht sinkt, an festen Stellen und jedes Mal ein Grad falscher.
4. **Ein Ding pro Szene, das nur hier vorkommt** (Schnalle am Stiefel, der neue Nagel am Anschlag). Lieber ein genaues Ding als drei allgemeine.
5. **Weniger Vergleiche, mehr Genauigkeit:** höchstens ein Vergleich je Absatz, und er kommt aus Yharnams Welt (Kirche, Blut, Handwerk, Seuche), nie aus unserer.
6. **Weniger Text, mehr Wirkung:** Alexis Kennedy (Failbetter, „Fallen London“, „Sunless Sea“) rät, Knappheit über Üppigkeit zu stellen. Für uns heißt das nicht kurze Sätze, sondern **keine überflüssigen Sätze**. Jede Szene wird nach dem Entwurf um ein Fünftel gekürzt.

### B4 Werkzeuge, die mich zwingen
1. **Stilprüfer `tools/stil.mjs`** (Teil von `npm run check`, zuerst als Warnung, später als Fehler). Meldet: Optionen mit einem Wort, mit Semikolon, Doppelpunkt oder Meta-Verb; Optionen ohne Verb (außer gesprochen); Echo der Option im ersten Satz danach; mehr als ein „wie ein/als ob“ je Absatz; „etwas“, „langsam“, „einmal“ über Grenzwert; Wörter der Sperrliste; Spielbegriffe im Erzähltext (Einsicht, Echos, Stärkung) außerhalb erlaubter Stellen; Satzlänge je Szene (Mittelwert und Streuung); dreimal derselbe Satzanfang.
2. **Zitatprüfer:** vergleicht unsere Texte mit einer privaten, nicht eingecheckten Datei mit Spieltexten auf gleiche Wortfolgen ab sechs Wörtern. So bleiben wir sicher bei „keine wörtlichen Zitate“.
3. **Zwei Gegenleser-Agenten mit klaren Rollen**, ohne mein Urteil vorgegeben:
   - *Lektorin eines Literaturverlags*: bekommt die Stimm-Bibel und die Vorbilder und bewertet jede Passage auf fünf Achsen (Klang, Bild, Logik, Figur, Atmosphäre), mit Neufassung.
   - *Spieler, der rausfliegt*: spielt die Szene durch und markiert jede Stelle, an der er aus der Welt fällt, und jede Option, bei der er nicht weiß, was er da wählt.
4. **Laut lesen lassen:** Die Seite kann mit der Sprachausgabe des Browsers vorlesen (Knopf „Vorlesen“ in der Werkstatt). Holpern hört man, bevor man es liest.

### B5 Ablauf ändern
1. **Szene für Szene statt Kapitel in einer Nacht.** Pro Runde höchstens 2 bis 3 Szenen, jede in drei Fassungen: Entwurf, Klangfassung (gegen Stimm-Bibel und Stilprüfer), Streichfassung.
2. **Goldstandard zuerst:** Wir bringen **eine** Szene auf Stufe 4 (von dir bestätigt), etwa Gilberts Fenster oder die Ankunft. Sie wird das Eichmaß für alles andere.
3. **Deine Hand als Lehrer:** Du schreibst in der Werkstatt zwei, drei Absätze um, wie du sie haben willst. Ich leite Regeln ab (`docs/nutzerstil.md`) und übertrage sie. Das wirkt stärker als jede Liste.
4. **Deine Lieblingsbücher:** Nenn mir zwei, drei Bücher oder Autoren, deren Klang du dir wünschst. Ich analysiere ihre Griffe (nicht ihre Sätze) und baue sie in die Stimm-Bibel ein.
5. **Überarbeitung von Kapitel 1 nach Wirkung:** zuerst alle Optionen (größter Schaden, geringster Aufwand), dann die Ankunft (erster Eindruck), dann die beiden Bosse, dann der Rest.

---

## Teil C: Lore vollständig und sicher

### C1 Ausgangslage
- Heute: zwei Recherchedateien (`docs/recherche/`), teils aus dem Gedächtnis, teils aus Web-Funden, mit vielen `PRÜFEN:`. Das reicht nicht für „perfekt“.
- **Hindernis:** Diese Umgebung erlaubt nur bestimmte Adressen. Gesperrt sind u. a. `bloodborne.wiki.fextralife.com`, `bloodborne.fandom.com`, `en.wikipedia.org`, `www.reddit.com`, `web.archive.org`, `docs.google.com`, `gamefaqs.gamespot.com`.

### C2 Quellen, in Rangfolge
1. **Spieltexte** (Gegenstandsbeschreibungen, Dialoge, Notizen im Spiel): die eigentliche Lore. Zugang über die Wikis (Fextralife, Fandom), die Gegenstand für Gegenstand die Texte führen, und über Tabellen der Datamining-Gemeinde (eine „Bloodborne Master Spreadsheet“ mit IDs aller Waffen, Kleidung, Gegenstände; eine Tabelle, die japanische Originaltexte mit der englischen Übersetzung vergleicht).
2. **Japanische Originaltexte** neben der Übersetzung: wichtig, weil die Übersetzung manches verschiebt.
3. **Offizielles Begleitmaterial:** „Bloodborne Official Artworks“ (mit Konzepttexten), Interviews mit Miyazaki.
4. **Fan-Analysen** nur als [Deutung]: „The Paleblood Hunt“ von Redgrave (rund 100 Seiten, 2015, arbeitet nur mit Belegen aus dem Spiel), die Lore-Seiten der Wikis, Videoanalysen.
5. **Spielverlauf:** Reihenfolge der Orte, Auslöser von Quests (Blutmond, Amelia, Einsicht-Stufen), was man wann sehen kann. Das braucht unser Spiel mehr als jede Theorie.

### C3 Ordnersystem
```
lore/
  README.md            Regeln: Kennzeichnung [Kanon]/[Deutung]/[Offen], Sicherheit, Quellenkürzel, Paraphrase-Pflicht
  quellen.md           Quellenverzeichnis mit Kürzel, Art, Zuverlässigkeit, Abrufdatum
  zeitleiste.md        alle Ereignisse von Pthumeru bis zum Ende, je mit Beleg
  begriffe/            Glossar: Einsicht, altes Blut, bleiches Blut, Albtraum, Echos, Laternen, Boten …
  orte/                je Ort eine Datei: Lage, Wege, Abkürzungen, Gegner, Funde, Figuren, Stimmung, was sich nach dem Blutmond ändert
  figuren/             je Figur: belegte Biografie, Beziehungen, Questablauf Schritt für Schritt mit Auslösern, Inhalt der Dialoge (sinngemäß), Enden
  fraktionen/          Heilende Kirche, Chor, Schule von Mensis, Byrgenwerth, Cainhurst, Werkstatt, Pulverfässer, Pthumerer, Fischerdorf
  wesen/               Große, Abkömmlinge, Bestien, Celestiale, Boten …
  gegenstaende/        Waffen, Kleidung, Schlüssel, Notizen, Runen: je Eintrag, was er verrät (Paraphrase), Fundort
  bosse/               Ablauf, Phasen, Schwächen, Herkunft, Beute
  quests/              Ablaufdiagramme mit Bedingungen (welcher Schritt schließt welchen aus)
  deutungen/           große Theorien, je mit Belegen dafür und dagegen; nie als Tatsache verwenden
  offen.md             was das Spiel bewusst offenlässt
```
**Jede Datei besteht aus Faktenkarten:**
```
### gascoigne-03
Aussage: Gascoigne stammt nicht aus Yharnam; er war Geistlicher, bevor er Jäger wurde. (Paraphrase)
Status: [Kanon] · Sicherheit: sicher
Belege: GEG-Kappe, GEG-Schal, DIA-Tochter (Kürzel aus quellen.md, mit Fundstelle)
Wichtig für: Kapitel 1, Gräber, Grab des Oedon
Siehe auch: viola-01, henryk-02
```

### C4 Regeln für das Archiv
- **Eigene Worte, Fundstelle dazu.** Das Archiv fasst Spieltexte zusammen, es kopiert sie nicht. Wörtliche Spieltexte (falls du sie mir als Datei gibst) liegen in einem nicht eingecheckten Ordner `quellen/roh/`, nur zum Lesen und für den Zitatprüfer.
- **Jede Kanonzeile im Spiel verweist auf eine Karte:** `// [KANON lore:gascoigne-03]`. Der Prüfer meldet Kanonkommentare ohne gültige Karte und Karten mit Status [Deutung], die im Erzähltext als Tatsache stehen.
- **Zwei Belege für „sicher“**, einer für „wahrscheinlich“, Widersprüche kommen in `offen.md`.
- **Kapitel-Bibel vor jedem Kapitel:** ein Auszug aus dem Archiv mit allem, was das Kapitel braucht, vom Nutzer kurz abgenickt.

### C5 Ablauf der Vollerfassung
1. **Zugang schaffen** (du): entweder die Adressen oben in der Umgebung freigeben (Netzwerkzugriff in den Einstellungen der Cloud-Umgebung, „Allowed domains“) oder mir Quellen als Dateien geben (PDF der Paleblood Hunt, Exporte der Tabellen, eigene Notizen).
2. **Gerüst** (ich): Listen aller Orte, Figuren, Bosse, Gegenstände aus den Kategorieseiten der Wikis ziehen. Das ergibt die Inventur, grob 400 bis 700 Gegenstände, rund 50 Figuren, rund 25 Orte, rund 30 Bosse. Die Zahlen schätze ich nur.
3. **Erfassung in Paketen**, Kategorie für Kategorie, mit mehreren Agenten parallel (das kostet viele Token; ich frage vorher und schätze den Umfang). Jede Karte wird von einem zweiten Agenten gegen die Quelle geprüft.
4. **Lückenprüfung:** Was in der Inventur steht und keine Karte hat, wird nachgeholt.
5. **Anschluss ans Spiel:** bestehende `[KANON]`-Kommentare und alle `PRÜFEN:` gegen das Archiv auflösen.

---

## Teil D: Reihenfolge (Empfehlung)
1. Optionen von Kapitel 1 nach B2 neu schreiben, mit Stilprüfer. Größte Wirkung, überschaubarer Aufwand.
2. Stimm-Bibel und drei Stimmproben; du wählst.
3. Goldstandard-Szene bis Stufe 4.
4. Parallel: Zugang zu den Lore-Quellen, dann Inventur.
5. Kapitel 1 Szene für Szene in der neuen Stimme überarbeiten.
6. Erst dann das Gerüst für Kapitel 2.
