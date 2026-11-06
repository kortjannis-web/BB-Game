# Quellen (Rohmaterial für das Lore-Archiv)

Hier liegen Quellen, die der Nutzer liefert: PDF-Analysen, Transkripte von Videos, Exporte von Tabellen.
Der Ordner liegt außerhalb von `web/` und kommt deshalb nicht auf die Spielseite (GitHub Pages veröffentlicht nur `web/`). **Achtung:** Das Repository ist öffentlich. Deshalb liegen Rohmaterialien (`lore-komplett.md`, `pdf/`, `videos/`) **nicht** im Repository, sondern nur lokal beim Nutzer; `.gitignore` hält sie draußen (am 2026-11-06 samt Git-Geschichte entfernt). Die Skripte `tools/lore-aufteilen.mjs` und `tools/lore-teil-b.py` brauchen die Datei und sind einmalige Werkzeuge; das Ergebnis liegt in `lore/`.

Regeln:
- Rohmaterial wird **gelesen und ausgewertet, nie ins Spiel kopiert**. Ins Archiv (`lore/`) kommen nur eigene Zusammenfassungen mit Fundstelle.
- Fan-Analysen und Videos sind **[Deutung]**. Was sie aus Spieltexten belegen, wird als Hinweis auf eine Kanonstelle genutzt und, wo möglich, gegen den Spieltext geprüft.
- Der Zitatprüfer vergleicht unsere Ink-Texte mit dem Rohmaterial auf gleiche Wortfolgen.

Ablage:
- `pdf/`      PDF-Dateien, Name: `autor_titel.pdf`
- `videos/`   je Video eine `.txt`-Datei. Erste Zeilen: Titel, Kanal, Adresse, Datum, dann das Transkript.

Verzeichnis (Kürzel für Belege in `lore/`):
| Kürzel | Art | Titel | Autor/Kanal | Datei | Zuverlässigkeit |
|---|---|---|---|---|---|
| LK | Lore-Dokument (Fextralife, Wikipedia, Paleblood Hunt, Presse; Teil B: Dialogskript, Artbook, Notizliste, Survivors, Japanese Text, Original Cut Dialogues; in eigenen Worten) | Bloodborne – Die komplette Lore-Dokumentation, mit Teil B | vom Nutzer geliefert, 2026-11-04, Fassung mit Teil B 2026-11-05 | `lore-komplett.md` | gut; eigene Kennzeichnung [Theorie]/[Deutung]; Reddit und YouTube fehlen |
| RK1 | Recherche Kapitel 1 (Websuche) | Recherchepaket Kapitel 1 | Claude, 2026-11-03 | `../docs/recherche/kapitel1.md` | mittel; nur Suchtreffer |
| RV | Recherche Vorgeschichte (Websuche) | Vorgeschichte und Gesamt-Lore | Claude, 2026-11-03 | `../docs/recherche/vorgeschichte.md` | mittel |
