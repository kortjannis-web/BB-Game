# Lore-Archiv: die Wurzel

Die gesamte Lore von Bloodborne (Hauptspiel und The Old Hunters), aufgeteilt so, dass beim Schreiben **nie unnötige Lore gelesen** wird, aber die nötige immer griffbereit ist.

## So wird gelesen (Pflicht vor jedem Schreiben)
1. **Immer:** `kern.md` (eine Seite: Grundbegriffe, Wissenstreppe, Regeln).
2. **Für das Kapitel, an dem gearbeitet wird:** `kapitel/kapitelN.md`. Das Paket nennt genau die Dateien, die das Kapitel braucht, und die **Wissenssperre** (was der Spieler in diesem Kapitel wissen darf, was nur als Gerücht vorkommt, was gar nicht).
3. **Für eine einzelne Szene:** nur die Dateien ihres Ortes, ihrer Figuren und ihrer Gegner aus dem Paket.
4. **Nachschlagen bei Bedarf:** `welt/glossar.md`, `welt/mechanik-und-welt.md`, `welt/zeitlinie.md`.
5. **Deutungen** (`deutungen/`) nur lesen, wenn eine Figur eine Meinung äußern soll. Was dort steht, ist nie Tatsache im Erzähltext.

## Der Baum
```
lore/
  README.md            diese Wurzel
  kern.md              immer lesen
  kapitel/             Lesepakete je Kapitel mit Wissenssperre
  welt/                Welt, Glossar, Regeln der Welt (Einsicht, Mondphasen), Spielablauf, Zeitlinie, Enden, Monde und Albtraum
  fraktionen/          Heilende Kirche, Jäger, Byrgenwerth, Chor, Mensis, Cainhurst und Henker, Pthumerer, Große Wesen, Bünde
  orte/                je Schauplatz eine Datei (Klinik, Zentral-Yharnam, Grab des Oedon, Kathedralbezirk … Fischerdorf)
  figuren/             je Figur eine Datei; Figuren, die auch Boss sind (Gascoigne, Gehrman, Amelia, Ludwig …), stehen hier mit beiden Teilen
  bosse/               Bosse, die keine Figuren sind, und ein Überblick, welche Bosse die Welt verändern
  gegenstaende/        nach Thema statt Alphabet (Yharnam und Blut, Jäger und Werkstatt, Kirche, Chor, Runen, Cainhurst, Labyrinth …)
  deutungen/           Theorien, gestrichene Inhalte, Entwicklung und Einflüsse
  offen.md             Lücken des Archivs und offene Fragen des Spiels
```

## Quellen und Kennzeichnung
- **LK** = `quellen/lore-komplett.md`, das Lore-Dokument des Nutzers (2026-11-04). Alle Dateien außer den handgeschriebenen (`README.md`, `kern.md`, `kapitel/`, `offen.md`) sind daraus abschnittsweise übernommen; der Kopf jeder Datei nennt die Abschnitte.
- **RK1** = `docs/recherche/kapitel1.md`, **RV** = `docs/recherche/vorgeschichte.md`: frühere Recherche aus dem Netz, mit [Kanon]/[Deutung]/[Offen] und Sicherheit; ergänzt LK vor allem für Kapitel 1.
- Kennzeichnung in LK: ohne Zusatz = im Spiel belegt; **[Theorie]** = Deutung; *sinngemäß* = Inhalt, nicht Wortlaut. Im Spiel gilt: [Theorie] = [Deutung], nur als Meinung einer Figur.
- Alle Spieltexte sind in LK in eigenen Worten wiedergegeben. Ins Spiel kommt trotzdem nichts aus dem Archiv wörtlich: Das Archiv liefert Fakten, die Sätze schreiben wir selbst.

## Pflege
- Die Dateien werden ab jetzt von Hand gepflegt. Neue Funde kommen in die passende Datei mit Quellenkürzel.
- Neue Quelle: in `quellen/` ablegen, in `quellen/README.md` eintragen, Inhalte in die Äste einarbeiten, Lücken in `offen.md` abhaken.
- `tools/lore-aufteilen.mjs` hat die erste Aufteilung erzeugt. Bei einer neuen Fassung von LK: `node tools/lore-aufteilen.mjs --neu` schreibt nach `lore-neu/` zum Vergleich; es überschreibt nie das Archiv.
