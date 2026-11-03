# BB-Game

Bloodborne als geschriebenes, verzweigtes Erzählspiel auf Deutsch. Privates Fanprojekt, nicht kommerziell, nicht mit FromSoftware oder Sony verbunden.

**Stand:** Kapitel 1 (Yharnam bis Gascoigne) vollständig geschrieben und im Browser spielbar.

## Aufbau
- `story/` die Geschichte in [Ink](https://www.inklestudios.com/ink/) (`main.ink`, `system.ink`, `traum.ink`, `kapitel1/`)
- `tools/` Prüfer, Szenarien, Karte (Node, mit inkjs)
- `web/` die Spieloberfläche (HTML, CSS, JS, Notizbuch)
- `docs/` Spieldesign, Raster von Kapitel 1, Karte, Recherche

## Spielen
```
npm install
npm run spielen    # baut und startet http://localhost:8080
```
Der Ordner `web/` ist eine fertige statische Seite (auch ohne Server-Code auf jedem Webspace hostbar). Der Spielstand liegt im Browser.

## Befehle
```
npm run check      # alles prüfen: Kompilieren, 3.000 Durchläufe, Szenarien, Karte
npm run pruefen    # nur Prüfer (optional Anzahl: npm run pruefen -- 10000)
npm run szenarien  # bestimmte Wege und Ausgänge erreichbar?
npm run karte      # docs/karte-kapitel1.md neu erzeugen
npm run bauen      # web/story.json und web/ink.js neu erzeugen
```

Zum Durchklicken und Bearbeiten eignet sich auch [Inky](https://github.com/inkle/inky) (Datei `story/main.ink` öffnen).
