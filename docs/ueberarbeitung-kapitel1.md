# Überarbeitung Kapitel 1, Text für Text (2026-11-06)

Auftrag des Nutzers (2026-11-06): Jeden Text von Kapitel 1 einzeln vornehmen, gründlich überarbeiten, mit dem Skill `stil-1800`; die Lore nicht verfälschen; Platzhalter ausschreiben; am Ende eine automatisch erzeugte Datei mit allen Texten in chronologischer Reihenfolge (`web/buch.html`, `docs/kapitel1-buch.md`).

## Antworten des Nutzers vor dem Start (Abfrage 2026-11-06)
1. **Nacht von Anfang an.** Ab dem Erwachen in der Klinik ist Nacht; ein übergroßer, tiefer, bleicher Mond steht über der Stadt und wird im Laufe des Kapitels größer und näher. Das Sonnen-Motiv fällt weg; die Sonne erscheint nur noch in der Kutsche, als letztes Tageslicht.
2. **Frei überarbeiten**, auch die Texte des Nutzers bis zur Klinik (Prolog, Herkunft, Grund); seine Muster (`docs/nutzerstil.md`) bleiben Richtschnur.
3. **Alle Platzhalter ausschreiben** (Monologe, Fragmente, Dachweg, Übung im Hof, Übergänge der Viertel).
4. **Länge etwa gleich, dichter:** Füllsätze raus, dafür Sinne, Lore-Details, Figurenstimme. Einzelne Szenen dürfen wachsen, andere schrumpfen.

## Gemeinsame Festlegungen (Ü1 bis Ü12), verbindlich für alle Bearbeiter

**Ü1 Mond statt Sonne.** [ERWEITERT, Entscheidung des Nutzers; Kanon wäre: Abend bis Gascoigne.] Die Kutsche fährt in den letzten Tag hinein; bei der Ankunft vor der Klinik versinkt die Sonne hinter dem Regen (das letzte Mal, dass der Jäger sie sieht). Ab dem Erwachen in der Klinik ist Nacht. Der Mond:
- übergroß, tief, zu nah; bleich wie Knochen oder altes Wachs, mit einem Hof im Dunst; nie rot (der Blutmond gehört späteren Kapiteln, nie verbrauchen), nie „gelb wie Käse“, keine Kitschfarben.
- Er **wandert nicht** (das alte Motiv der nicht sinkenden Sonne geht auf ihn über), aber er wird **jedes Mal ein wenig größer und näher**: an der Klinik über den Giebeln, über der Brücke so groß, dass die Türme vor ihm stehen wie Scherenschnitte, über den Gräbern so nah, dass man seine Narben sieht, auf dem Heimweg füllt er die halbe Gasse aus. Jede Erwähnung zeigt eine andere Stufe; nie dieselbe Formel.
- Die Stadt spricht nicht vom Morgen (Gilbert, das Mädchen: „Mama sagt, der Morgen kommt immer“ bleibt und wird stärker). Gehrmans „Die Nacht wird enden“ und die Frage „Wann ist die Nacht vorbei?“ bekommen dadurch Gewicht.
- Schatten fallen im Mondlicht; der falsche Schatten (Einsicht) fällt dem Mond **entgegen**.
- Der Jägertraum hat **keinen** Mond in Kapitel 1: Himmel von der Farbe alten Elfenbeins, ohne Gestirn (Kontrast, bleibt).
- Notizbuch und Chronik ziehen nach („Warum geht der Mond nicht unter?“; Chronik: „Oft sah ich in dieser Nacht nach dem Mond …“).

**Ü2 Lore ist das höchste Gut.** Kanon nicht verfälschen: Bestienseuche aus dem Alten Blut der Kirche, Blutministration, Jagdnacht, Räucherwerk, Fremdenhass, Jäger und Traum, Wissenssperre aus `lore/kapitel/kapitel1.md` (nichts Kosmisches beim Namen, Ludwig nur als namenloses Gerücht, die Großen gesperrt, Byrgenwerth, Chor, Cainhurst gesperrt). Figuren wie im Lesepaket. [Deutung] nur im Mund einer Figur. Bestehende `// [KANON …]`, `// [ERWEITERT]`, `PRÜFEN:` bleiben oder werden nachgezogen. Keine wörtlichen Zitate aus dem Spiel.

**Ü3 Ablauf je Text (stil-1800).** Moment bestimmen, `npm run stil -- <moment>`, die zwei bis drei Musterstellen ganz lesen, dann den Absatz neu fassen, dann die Prüffragen Satz für Satz. Jeder Absatz und jede Option wird einzeln angesehen; nichts wird blind übernommen, nichts blind neu geschrieben: Was schon trägt, bleibt.

**Ü4 Stimme nach `docs/stimme.md`:** A Chronik (Orte, Vergangenheit, Notizbuch, Aufzeichnungen), B fiebrig und nah (Standard), C kalt und amtlich (Kirche). Du-Form, Präsens. Szene: Ort mit Sinnen, dann Handlung, dann was der Spieler fühlt, durch Details statt Behauptungen.

**Ü5 Muster des Nutzers** (`docs/nutzerstil.md`, gehen dem Skill vor): Klarheit beim ersten Lesen; keine Saat ohne Ernte; Ursache zeigen; natürliche, bekannte Wendungen statt preziöser Körperbilder; Ort vom Großen zum Kleinen; Namen über Dinge der Welt (Schilder, Anschläge); knappe Vergleiche, höchstens einer je Absatz; direkte Rede mit eigenen Stimmen; Antworten des Spielers als vollständige Ich-Aussagen mit Lebenslage; Gascoigne: Wärme, die zerbricht. Wer Bloodborne nicht kennt, soll die Geschichte verstehen (ein Detail, ein Satz, ein Fundstück).

**Ü6 Optionen** fließen in den Satz (`#fliesst`): sichtbarer Anfang 2 bis 7 Wörter (länger erlaubt, wenn der Satz Lage trägt), kein Meta-Verb, keine Ein-Wort-Option; die Fortsetzung beginnt mit dem, was geschieht, nicht mit „Du entscheidest dich“. Kampfoptionen nennen die Richtung ausdrücklich. Falsche Entscheidungen sind für Aufmerksame vorher erkennbar (das Zeichen steht vor der Wahl).

**Ü7 `// WARUM:` über jeder Option**, die du anfasst oder die noch keins hat (ein bis zwei Sätze: was der Spieler ausdrückt, was die Option prüft oder öffnet, ob sie für Aufmerksame als falsch erkennbar ist). Format: eine eigene Kommentarzeile direkt über der Zeile mit `*` oder `+`.

**Ü8 Kämpfe:** Anzeichen ruhig und genau, Folge kurz und hart. Takte, Variablen, Logik und Zahl der Möglichkeiten nicht ändern (nur Text), außer ein Fehler zwingt dazu; dann im Bericht nennen.

**Ü9 Technik nicht brechen.** Nur Text, Kommentare und Tags anfassen; Variablen, Knoten, Stitches, Bedingungen, Diverts, Tags (`# lore:`, `# notiz:`, `# bild:`, `# klang:`, `# stil:`, `# anzeichen:`, `# tod:`, `#fliesst` …) bleiben, wie sie sind. Kampfoptionen bleiben `+`. Ink: Text mit `{`, `}`, `|`, `->`, `#`, `//`, `[`, `]` ist Syntax; Alternativen `{&a|b}` / `{~a|b}` / `{!a|b}` behalten ihre Zahl der Glieder. Vor dem Commit muss `npm run check` grün sein.

**Ü10 Platzhalter ausschreiben**, wo sie in deiner Datei stehen (`PLATZHALTER`, Ein-Satz-Entwürfe, Stufe-0-Stellen in `docs/qualitaet.md`), in fertiger Prosa; den Kommentar `PLATZHALTER` dann entfernen bzw. durch eine Herkunftsnotiz ersetzen.

**Ü11 Durchgehende Motive** (nicht verlieren, nicht überdosieren): die Spieluhr, der ein Ton fehlt (Gascoigne summt ihn, das Mädchen summt mit, sein Name fällt in die Lücke); der Choral bricht nach der dritten Zeile ab; der Mond (Ü1); Räucherwerk; das Band des Mädchens ist weiß (rot erst beim Schwein); Gilberts Husten; Gascoignes Verband über den Augen und sein Geruch nach Torf und Rauch; Wendels Mantel.

**Ü12 Wortkammer mit Dosis**, Altertümliches nur in A, Dokumenten, alten Figuren. Keine Spielsprache (Echos, Leben, Punkte, Level). „Etwas“ sparsam.
