# BB-Game

Bloodborne als geschriebenes, verzweigtes Erzählspiel auf Deutsch. Privates Fanprojekt, nicht kommerziell, nicht mit FromSoftware oder Sony verbunden.

**Stand:** Kapitel 1 (Yharnam bis Gascoigne) als geprüftes Gerüst mit Platzhaltertexten. Noch keine Spieloberfläche.

## Aufbau
- `story/` die Geschichte in [Ink](https://www.inklestudios.com/ink/) (`main.ink`, `system.ink`, `traum.ink`, `kapitel1/`)
- `tools/` Prüfer, Szenarien, Karte (Node, mit inkjs)
- `docs/` Spieldesign, Raster von Kapitel 1, Karte, Recherche

## Befehle
```
npm install
npm run check      # alles prüfen: Kompilieren, 3.000 Durchläufe, Szenarien, Karte
npm run pruefen    # nur Prüfer (optional Anzahl: npm run pruefen -- 10000)
npm run szenarien  # bestimmte Wege und Ausgänge erreichbar?
npm run karte      # docs/karte-kapitel1.md neu erzeugen
```

Zum Durchklicken und Bearbeiten eignet sich auch [Inky](https://github.com/inkle/inky) (Datei `story/main.ink` öffnen).
