# BB-Game: Arbeitsregeln

Privates Fanprojekt: Bloodborne als geschriebenes, verzweigtes Erzählspiel auf Deutsch (Ink + inkjs). Kein KI-Spielleiter zur Laufzeit; Claude ist Autor.

## Lesen zu Beginn
1. `docs/spieldesign.md` (Richtung, Mechaniken, Entscheidungen des Nutzers)
2. `docs/kapitel1-struktur.md` (Raster des aktuellen Kapitels)
3. Für Kanon: `docs/recherche/*.md` (jede Angabe mit [Kanon]/[Deutung]/[Offen], Sicherheit, Quellen)

## Entscheidungen des Nutzers (verbindlich)
- Viel festgelegt, führt den Spieler; Freiheit, **wie und wo** man erkundet und was man tut.
- Verzweigungen, die wieder zusammenlaufen (Nadelöhre); Entscheidungen prägen Quests, Figuren und den Verlauf, auch gravierend.
- Richtige und falsche Entscheidungen; falsche sind für Aufmerksame vorher erkennbar.
- Kämpfe sind immer erzählt und geschrieben (kein Zufall): Anzeichen, Möglichkeiten, feste Folgen.
- 5 unsichtbare Leben; Vignette bei 3 orange, 2 rot, 1 schwarz. Eine Blutampulle, heilt 2; im falschen Moment trifft der Gegner beim Trinken.
- Kapitel 1 = Yharnam bis Gascoigne, zwei Nadelöhre: Kleriker-Bestie (kämpfen, ablenken, fliehen) und Gascoigne (Pflicht).
- Tiefe Lore und echte Geschichte; Figuren lebendiger als im Original (Freundschaft mit Gascoigne; Eileen: in Kapitel 1 zwei Begegnungen, Partnerschaft ab Kapitel 2).
- Das Spielgefühl des Originals einfangen (Schuss von hinten, Kreischen in der Ferne, die Leiche beim Schwein).
- Ton: Lovecraft und gotischer Horror; zuerst gotische Volkskunde, mit Einsicht und Kapiteln immer kosmischer.
- Nur Deutsch.

## Schreibregeln
- Nur eigene Prosa. **Keine wörtlichen Zitate** aus dem Spiel (Dialoge, Itemtexte), höchstens sinngemäß.
- Kanon vor Erfindung; Erfindungen mit `// [ERWEITERT]` kennzeichnen, Kanon mit `// [KANON]`, Unsicheres mit `PRÜFEN:`.
- [Deutung] nie als Tatsache erzählen, nur als Meinung einer Figur. [Offen] bleibt offen.
- Erst Struktur, dann Text: neue Kapitel zuerst als Gerüst mit Ein-Satz-Platzhaltern, ausformuliert nach Abnahme durch den Nutzer.
- Stil: wie ein Buch, das man hautnah miterlebt, Lovecraft und eloquent. Du-Form, Präsens. Jede Szene: Ort mit Sinnen (Geruch, Geräusch, Kälte), dann Handlung, dann was der Spieler fühlt; Details statt Behauptungen.
- Notizbuch (`web/notizbuch.js`): Einträge dürfen beim ersten Fund nichts vorwegnehmen.
- Konventionen für Tags stehen oben in `story/main.ink`.

## Prüfen (muss grün sein vor jedem Commit)
`npm run check` = Prüfer (3.000 Zufallsdurchläufe, Erreichbarkeit, Lore an zwei Stellen) + Szenarien + Karte + Bauen der Webfassung.
Neue Weiche ⇒ neues Szenario in `tools/szenarien.mjs`. Ink-Fallen: Kampfoptionen mit `+` (wiederholbar nach Tod); Namen von Variablen, Knoten, Stitches und LIST-Einträgen dürfen sich nicht überschneiden.
