# Vorschläge des Nutzers: Werkstatt und Ablauf

Der Nutzer spielt im Browser und kann dabei alles ändern: Texte, Entscheidungen, Verbindungen, ganze Passagen und den Ink-Quelltext (Mechanik). Nichts davon geht direkt ins Spiel. Alles wird als **Vorschlag** eingereicht; Claude liest ihn, setzt jede Änderung **einzeln** um und lernt daraus, wie der Nutzer schreibt und denkt (`docs/nutzerstil.md`).

## Für den Nutzer: so geht es

1. Spiel öffnen (Adresse in `README.md`), oben **✎ Bearbeiten** einschalten.
2. **Im Spiel:** auf einen Absatz klicken, um ihn umzuschreiben, zu streichen oder einen Absatz danach einzufügen. Neben jeder Entscheidung ist ein **✎**: umbenennen oder streichen. Unter den Entscheidungen: **+ Entscheidung vorschlagen** (Text, was dann passiert, wohin), **Notiz zu dieser Stelle**, **Quelltext dieser Stelle**. Geänderte Texte erscheinen beim Weiterspielen schon in deiner Fassung.
3. **Im Erzählbaum:** **Baum** oben im Spiel springt zur aktuellen Passage. Mit **✎ Bearbeiten** wird die Tafel rechts zum Editor: Absätze, Titel, Entscheidungen, Folgetexte und Ziele ändern; **+ Neue Passage von hier** legt eine neue Passage samt Verbindung an (auf der Karte gestrichelt, mit der Maus verschiebbar); **Ganze Passage streichen**. **+ Passage** oben legt eine freie Passage an.
4. **Mechanik:** **Quelltext** öffnet den Ink-Code der Stelle (oder jede Datei, auch `system.ink` mit Leben und Ampulle). **Speichern und testen** kompiliert die Geschichte mit deinen Änderungen im Browser und spielt sie ab dieser Stelle (gelbes Band oben = Testfassung). **▶ Ab hier spielen** im Baum springt ohne Änderungen an eine Passage.
5. **Werkstatt** (unten rechts) zeigt alles Gesammelte. Zu jeder Änderung kannst du kurz schreiben, **warum**. Das hilft am meisten. Dann **An GitHub senden**. Die Vorschläge bleiben bis dahin in deinem Browser, auch über Neuladen hinweg.
6. Unter **Eingereicht und Antworten** steht später, was ich übernommen, angepasst oder nicht übernommen habe, mit Begründung.

Einmalig nötig: ein GitHub-Schlüssel, der nur für dieses Repository gilt und nur Dateien schreiben darf (Anleitung direkt in der Werkstatt unter „GitHub-Verbindung“). Ohne Schlüssel geht **Als Datei speichern**; die Datei kann man dann im Chat schicken oder auf GitHub hochladen.

## Wo die Vorschläge liegen

Zweig **`vorschlaege`** (nicht `main`, damit die Geschichte selbst unberührt bleibt):

```
vorschlaege/eingang/2026-11-04-2130-gilbert-lebendiger.json   eingereicht von der Seite
vorschlaege/antworten/2026-11-04-2130-gilbert-lebendiger.json  Antwort von Claude (gleicher Name)
```

### Format einer Einreichung (`yharnam-vorschlag-1`)

```json
{ "format": "yharnam-vorschlag-1", "erstellt": "…", "titel": "…", "kommentar": "…",
  "aenderungen": [ { "id": "v12", "art": "text", "seite": "spiel|baum", "passage": "k1_b_gilbert",
                     "vorher": "…", "nachher": "…", "kommentar": "warum", "ort": { "datei": "story/…", "zeile": 42 },
                     "kontext": { "letzteWahl": "…", "leben": 5 } } ] }
```

Arten: `text`, `einfuegen` (`nach` = Absatz davor), `loeschen`, `wahl` (Entscheidung umbenannt), `wahl-ziel`, `wahl-folge` (`wahlText` = Entscheidung), `wahl-neu` (`text`, `folge`, `ziel`), `wahl-loeschen`, `passage-neu` (`titel`, `zeilen`, `choices`, `nahe`), `passage-loeschen`, `passage-titel`, `quelle` (`datei`, `knoten`, `vorher`/`nachher` = Ink-Code), `notiz`, `datei` (angehängte Datei, z. B. eine in Twine bearbeitete `.twee`).

### Format einer Antwort

```json
{ "bearbeitet": "2026-11-05", "zusammenfassung": "Ein Satz, was ich daraus gemacht habe.",
  "aenderungen": { "v12": { "status": "übernommen|angepasst|abgelehnt|offen", "notiz": "warum, was genau", "commit": "abc1234" } },
  "uebertragen": [ { "wo": "k1_c_…", "was": "gleiche Kürzung bei Eileen", "commit": "def5678" } ] }
```

## Für Claude: Vorschläge umsetzen

Zu Beginn jeder Sitzung (siehe `CLAUDE.md`): `npm run vorschlaege` zeigt alle offenen Einreichungen mit Datei:Zeile, Vorher/Nachher, Begründung und Kontext.

1. **Lesen, nicht sofort tippen.** Erst die ganze Einreichung lesen; was will der Nutzer insgesamt (Titel, Kommentar, Begründungen)?
2. **Jede Änderung ein eigener Commit** auf dem Arbeitszweig: `Vorschlag v12: Gilberts erster Satz kürzer`. Text des Nutzers möglichst wörtlich übernehmen; nur anpassen, wo Kanon, Ink-Logik, Lore-Pflicht (zwei Stellen), Notizbuch-Regel oder Mechanik es verlangen, und das in der Antwort begründen.
3. **Regeln aus `CLAUDE.md` gelten weiter:** keine wörtlichen Zitate aus dem Spiel, `[KANON]`/`[ERWEITERT]`/`PRÜFEN:` setzen, neue Weiche ⇒ neues Szenario, `npm run check` grün vor jedem Commit.
4. **Neue Passagen und Strukturänderungen** (`passage-neu`, `wahl-neu`, `wahl-ziel`, `passage-loeschen`, `quelle`): in Ink übersetzen, Knotennamen nach Konvention (`k1_…`), Nadelöhre nicht brechen. Ist etwas unklar oder widerspricht es einer verbindlichen Entscheidung, Status `offen` mit Rückfrage statt raten.
5. **Muster lernen:** nach jeder Einreichung `docs/nutzerstil.md` ergänzen (eigener Commit): was hat der Nutzer geändert, welche Regel steckt dahinter, mit einem kurzen Vorher/Nachher als Beleg.
6. **Übertragen:** Wo ein Muster klar ist, dieselbe Art Verbesserung an anderen Strängen anwenden, als eigene Commits `Übertragen aus v12: …`, und in der Antwort unter `uebertragen` auflisten, damit der Nutzer sie prüfen und ablehnen kann. Nur übertragen, was eindeutig dasselbe Muster ist; im Zweifel als Vorschlag in die Antwort schreiben.
7. **Antworten:** Antwortdatei auf dem Zweig `vorschlaege` unter `vorschlaege/antworten/` mit gleichem Namen anlegen und pushen. Die Werkstatt zeigt sie dem Nutzer.
8. Danach wie immer bauen und veröffentlichen (`CLAUDE.md`, Abschnitt Veröffentlichen); die Domain aktualisiert sich nach dem Merge auf `main` von selbst.
