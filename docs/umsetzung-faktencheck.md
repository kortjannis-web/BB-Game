# Umsetzung des Faktenchecks Kapitel 1: gemeinsame Regeln (2026-11-05)

Gilt für alle, die Befunde aus `docs/faktencheck-kapitel1.md` umsetzen.

## Vor dem Schreiben lesen
`CLAUDE.md`, `docs/stimme.md`, `.claude/skills/erzaehlkunst-deutsch/SKILL.md`, `.claude/skills/hpl-horror/SKILL.md` und `references/bb-game.md`, `lore/kern.md`, `lore/kapitel/kapitel1.md` (Wissenssperre), den Abschnitt „Übergreifend“ und den Abschnitt der eigenen Datei in `docs/faktencheck-kapitel1.md`, dann die Lore-Dateien, die die Befunde nennen.

## Was zu tun ist
1. **Jeden Befund der eigenen Datei umsetzen**, dazu die übergreifenden Befunde, soweit sie die eigene Datei betreffen. Weicht man von einer Anweisung ab, im Abschlussbericht begründen.
2. **Alle Optionen der eigenen Datei in die neue Form bringen:** Die Wahl fließt in den Satz (`* [Kurzer Anfang #fliesst]`, der Text danach setzt sie als Satz fort, keine Wiederholung als eigene Zeile). 2 bis 7 Wörter, nie ein einzelnes Wort, kein Doppelpunkt, keine Spielwerte. Kampfoptionen nennen Richtung und Handlung ausdrücklich (links, rechts, vorn, hinten, unter, über), die Begründung steht im Anzeichen, nicht in der Option. Optionen mit `+` bleiben `+` (wiederholbar nach Tod).
3. **Text in der Stimme:** Wo der alte Text unter dem Niveau von `docs/stimme.md` liegt, von Hand neu schreiben: Ortsbild in A, Geschehen in B, alles von der Kirche in C. Prüffrage: Wie würde ein gutes Buch das schreiben? Keine Gedankenstriche, höchstens ein Vergleich je Absatz, keine Gegenwartswörter, kein „etwas“ als Verlegenheit, keine Erzählerurteile.
4. **Für Neulinge:** Die Geschichte soll erlebbar und verständlich sein, ohne Vortrag: ab und zu ein Detail, ein Fundstück, ein Satz einer Figur.
5. **Kanon und Marken:** Kanon vor Erfindung; `// [KANON lore:pfad]`, `// [ERWEITERT]`, `PRÜFEN:`. Keine wörtlichen Zitate aus dem Spiel. [Deutung] nur im Mund einer Figur. Wissenssperre einhalten.

## Festlegungen, die mehrere Dateien betreffen
- **G1 Band des Mädchens:** Sie trägt eine **weiße** Schleife (Kanon). Erst beim Schwein ist das Band rot, getränkt. Die Variable `band` bleibt (der Spieler hat das Band). `b_yharnam`: weiß am Fenster und am Kind; `c_unterstadt`: rot im Kanal beim Schwein; `d_nachspiel` und Notizbuch: der Fund ist rot, die Erinnerung weiß.
- **G2 Eileen:** In Kapitel 1 nur zwei Begegnungen (Dachbalken, Dach über den Gräbern). Im Nachspiel nur Spuren, nicht ihre Person.
- **G3 Jägermarke:** Wie im Kanon: Wer sie zerdrückt, verliert alle Blutechos (sie bleiben auch nicht als Fleck liegen). Umsetzung in den `marke`-Stitches (`~ echos = 0`, ein Satz, der es zeigt); Eileen deutet den Preis beim Übergeben an.
- **G4 Gehrman:** darf in Kapitel 1 sagen, dass er einst selbst Jäger war, nicht, dass er der erste war.
- **G5 Sonne:** nur Wahrnehmung, keine Gewissheit des Erzählers („Du wartest darauf, dass sie sinkt, und sie sinkt nicht.“).
- **G6 Spielbegriffe:** Der Name „Boten“ darf bleiben. Echos und Einsicht im Erzähltext zeigen, nicht benennen; den Namen tragen Notizbuch und Figuren.
- **G7 Brücke:** Die Kirche hat die Große Brücke zur Kathedrale gesperrt (Notiz Nr. 2). Bei uns führen von der Brücke nur Treppen hinab in die Unterstadt; am Brückenende ein von der anderen Seite verriegeltes Tor.
- **G8 Gascoignes Branntwein** schmeckt nicht mehr nach Birne (Gilberts Birnbaum bleibt), sondern nach Torf und Rauch, etwas Fremdem aus seiner Heimat.
- **G9 Gascoigne-Kampf:** höchstens 8 Takte (Entscheidung 6 bis 8).

## Technische Regeln
- **Nur die eigenen Dateien ändern.** Neue Variablen oben in der eigenen Datei deklarieren (`VAR …` mit Kommentar), nicht in `zustand.ink`. Namen von Variablen, Knoten, Stitches und LIST-Einträgen dürfen sich nicht überschneiden.
- `# lore:`-Tags behalten oder gleichwertig ersetzen: Jede Kern-Lore muss an zwei erreichbaren Stellen vorkommen (der Prüfer meldet es).
- Ändert sich ein Optionstext, den `tools/szenarien.mjs` als Wunsch oder Verbot nennt, genau diese Einträge dort anpassen (nur diese Zeilen).
- Was eine andere Datei braucht (Notizbuch, andere Ink-Datei, Dokumente), nicht selbst ändern, sondern im Abschlussbericht genau nennen.
- Vor dem Commit: `npm install` (einmal), dann `npm run check` muss grün sein. Dann committen mit einer klaren Nachricht (Endzeilen: `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>` und `Claude-Session: https://claude.ai/code/session_015KuBTB7CiFKbMaNNJHMa9Z`). Nicht pushen, nicht mergen.
- Abschlussbericht (höchstens 25 Zeilen): umgesetzte Befunde (Nummern), abgewichene mit Grund, Bedarf in anderen Dateien, neue Variablen, geänderte Szenarien, was ungeprüft ist.
