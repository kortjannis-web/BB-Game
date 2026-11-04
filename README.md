# BB-Game

Bloodborne als geschriebenes, verzweigtes Erzählspiel auf Deutsch. Privates Fanprojekt, nicht kommerziell, nicht mit FromSoftware oder Sony verbunden.

**Stand:** Kapitel 1 (Yharnam bis Gascoigne) vollständig geschrieben und im Browser spielbar.

- **Spielen:** https://yahrnams-neverending-night.netlify.app/ (Netlify, baut bei jedem Push auf `main` neu; Einrichtung in [`docs/hosting.md`](docs/hosting.md))
- **Erzählbaum:** https://yahrnams-neverending-night.netlify.app/karte.html
- **Spielen (Artefakt):** https://claude.ai/artifact/8K6UJippKkrq1CsXpkXvaL
- **Erzählbaum (Twine-Ansicht):** https://claude.ai/artifact/NPHhjkNgsNCP2FrLbTGFUX

Beide Seiten sind privat; Teilen geht über das Teilen-Menü der Seite.

## Mitschreiben: die Werkstatt
Im Spiel und im Erzählbaum oben **✎ Bearbeiten** einschalten: Absätze umschreiben, streichen oder ergänzen, Entscheidungen umbenennen oder neue vorschlagen, im Baum ganze Passagen anlegen, verbinden oder streichen, und über **Quelltext** die Ink-Mechanik ändern und sofort testen. Alles bleibt Vorschlag und geht über **Werkstatt → An GitHub senden** auf den Zweig `vorschlaege`. Claude setzt jede Änderung einzeln um, antwortet in der Werkstatt und lernt daraus den eigenen Stil (`docs/nutzerstil.md`). Ablauf: [`docs/vorschlaege.md`](docs/vorschlaege.md).

## Schreib-Skills
Zwei Skills für Claude: `erzaehlkunst-deutsch` (deutsches Erzählhandwerk, aus der Erzählstimme des AI-Dungeon-Masters) und `hpl-horror` (Horror, Lovecraft, Perspektiven, Dialog, Buchbau). In Claude-Code-Sitzungen in diesem Repo laden sie von selbst (`.claude/skills/`). Für normale Chats, auch in der Claude-App am Handy: die Dateien aus `skills-pakete/` unter claude.ai → Einstellungen → Fähigkeiten → Skills hochladen.

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

## Erzählbaum und Twine
Der Erzählbaum (`web/karte.html`) wird vollständig aus den Ink-Dateien erzeugt (`tools/twine.mjs`): Start oben, jede Passage ein Block, Linien zu den Folgen, Klick zeigt den ganzen Text mit allen Entscheidungen, Suche, Zoom, Minikarte. Dieselben Daten gibt es als echte Twine-Datei: `docs/yharnam-kapitel1.twee` in Twine 2.6 oder neuer über *Bibliothek → Importieren* öffnen.

## Befehle
```
npm run check      # alles prüfen: Kompilieren, 3.000 Durchläufe, Szenarien, Karte
npm run pruefen    # nur Prüfer (optional Anzahl: npm run pruefen -- 10000)
npm run szenarien  # bestimmte Wege und Ausgänge erreichbar?
npm run karte      # docs/karte-kapitel1.md neu erzeugen
npm run bauen      # Spiel- und Baumdaten, Twee-Datei und Artefakt-Fassungen neu erzeugen
npm run twine      # nur Erzählbaum und Twee-Datei
npm run vorschlaege  # eingereichte Vorschläge lesen (mit Datei:Zeile im Quelltext)
```

Zum Durchklicken und Bearbeiten eignet sich auch [Inky](https://github.com/inkle/inky) (Datei `story/main.ink` öffnen).
