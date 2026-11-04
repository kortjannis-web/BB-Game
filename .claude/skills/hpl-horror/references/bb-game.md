# Im Projekt BB-Game (Yharnam)

Nur laden, wenn im Repository `BB-Game` gearbeitet wird. Die verbindlichen Regeln stehen in dessen `CLAUDE.md`; hier steht, wie dieser Skill sie umsetzt.

## Vorrang
1. Ausdrückliche Entscheidungen des Nutzers (`CLAUDE.md`, „Entscheidungen des Nutzers“).
2. Das Stilprofil aus seinen Vorschlägen: `docs/nutzerstil.md`. Was er dort durch eigene Änderungen gezeigt hat, schlägt jede allgemeine Regel dieses Skills.
3. Dieser Skill und `erzaehlkunst-deutsch`.

## Kanon und Rechte
- **Keine wörtlichen Zitate aus Bloodborne** (Dialoge, Itemtexte), höchstens sinngemäß. Keine wörtlichen Zitate aus Lovecraft oder anderen Werken.
- **[Kanon] vor Erfindung.** Erfindungen im Ink-Quelltext mit `// [ERWEITERT]` kennzeichnen, Kanon mit `// [KANON]`, Unsicheres mit `PRÜFEN:`.
- **[Deutung] nie als Tatsache**, nur als Meinung einer Figur. **[Offen] bleibt offen.** Die Lovecraft-Parallelen (`lovecraft.md`, Abschnitt 4) sind Deutung.
- Kanonquellen: `docs/recherche/*.md`.

## Die Treppe des Grauens im Spiel
Der Ton folgt der Einsicht und den Kapiteln (Entscheidung des Nutzers: zuerst gotische Volkskunde, mit Einsicht und Kapiteln immer kosmischer).
- **Kapitel 1, Einsicht 0**: Stufe 1. Jagdnacht, Räucherwerk, verriegelte Türen, Stimmen dahinter, Mob mit Fackeln, die Heilende Kirche, Blut als Medizin. Das Wort „Bestie“ ist noch ein Name für eine Krankheit.
- **Erster Anblick der Kleriker-Bestie, erste Einsichtspunkte**: Stufe 2 bricht ein. Körper, Verwandlung, die Frage, warum gerade Geistliche. Die Namen der Kirche erklären nichts mehr.
- **Kapitel 1 Ende** (die Puppe erwacht bei Einsicht 1): ein leiser Vorschein von Stufe 3, kein Ausbruch.
- **Spätere Kapitel**: Stufe 3 wächst. Einsicht schaltet andere Beschreibungen derselben Orte frei: Wer mehr Einsicht hat, sieht an derselben Stelle ein Detail mehr, und dieses Detail stimmt nicht.

## Spielgefühl des Originals
Die Entscheidung des Nutzers nennt Beispiele: der Schuss von hinten, das Kreischen in der Ferne, die Leiche beim Schwein. Daraus die Regel: **Ankündigung ohne Erklärung.** Ein Laut, ein Bild, ein Fund, der erst später Sinn ergibt.

## Kämpfe
Immer erzählt und geschrieben, kein Zufall: Anzeichen (`# anzeichen: id`), Möglichkeiten, feste Folgen. Fünf unsichtbare Leben (Vignette bei 3 orange, 2 rot, 1 schwarz), eine Blutampulle (heilt 2; im falschen Moment trifft der Gegner beim Trinken). Der Horror-Rhythmus aus dem Skill (lauernd lang, Angriff kurz, Nachklang ein langer Satz) gilt für jede Kampfphase.

## Figuren
- **Gascoigne**: Freundschaft vor dem Zerfall. Seine Stimme vor der Verwandlung warm, knapp, mit Gewohnheiten; der Zerfall nach dem Muster „Zerfall über Begegnungen“ (`buch-und-perspektive.md`, Abschnitt 5). Die Spieluhr ist Leitmotiv und Saat.
- **Eileen**: in Kapitel 1 zwei Begegnungen, Partnerschaft ab Kapitel 2. Eine Stimme, die wenig sagt und viel weiß.
- **Gilbert**: der kranke Fremde; seine Stimme bleibt freundlich, sein Husten ist sein Merkmal und seine Uhr.

## Perspektiven im Spiel
- Spieltext: Du, Präsens.
- Die Aufzeichnungen im Prolog und andere Fundstücke: Ich, Präteritum, rückblickend (Stil-Tag `# stil: tagebuch`).
- Blutgedächtnis (`# gedaechtnis: id`): personale Perspektive einer fremden Figur, sichtbar abgesetzt.
- Notizbuch (`web/notizbuch.js`): Stimme des Jägers, Ich; Einträge dürfen beim ersten Fund nichts vorwegnehmen.

## Struktur und Prüfung
- Erst Struktur, dann Text: neue Kapitel als Gerüst mit Ein-Satz-Platzhaltern, ausformuliert nach Abnahme.
- Jede Szene: Ort mit Sinnen, dann Handlung, dann was der Spieler fühlt, und zwar über den Körper gezeigt (Regel aus `erzaehlkunst-deutsch`, Abschnitt 4).
- Tags und Konventionen: oben in `story/main.ink`.
- Vor jedem Commit `npm run check`. Neue Weiche, neues Szenario in `tools/szenarien.mjs`.
