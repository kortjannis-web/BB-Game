# Stand und Übergabe

**Zweck:** Wer hier neu einsteigt (ein neuer Chat, eine neue Sitzung), liest zuerst diese Datei und weiß dann, wo wir stehen und was als Nächstes kommt. Claude aktualisiert sie nach jeder Arbeit, committet und merged nach `main`. Alles Wichtige liegt im Repository, nichts nur im Chat.

**Zuletzt aktualisiert:** 2026-11-06, nach dem **Umbau von Kapitel 1 zum Entscheidungsbuch** (`docs/kapitel1-struktur.md`). Die Texte stammen aus dem Stand vom 2026-11-05 (Stufe 2); neue Stationen, Nachbilder (Monologe) und Fragmente sind Platzhalter. **Der Nutzer hat noch nichts davon gespielt.**

## So startet ein neuer Chat
1. `CLAUDE.md` wird automatisch gelesen. Danach diese Datei, dann die Leseliste in `CLAUDE.md` („Lesen zu Beginn“).
2. Arbeitszweig: Jede Sitzung bekommt ihren eigenen Zweig. `main` ist immer der aktuelle, geprüfte Stand und geht automatisch online (https://kortjannis-web.github.io/BB-Game/, GitHub Pages).
3. Der Nutzer will: Häppchen statt Fragenkataloge; selbstständig bauen, prüfen, mergen; jede Szene von Hand; am Ende jeder Antwort das nächste Häppchen.

## Protokoll der letzten Sitzung (2026-11-04 bis 2026-11-05)
1. **Abfragerunde** (16 Antworten des Nutzers): längere Bosskämpfe, Kirche hörbar, Ludwig als Gerücht, Boten mit Wissen und Wendels Mantel, Einsicht kostet leise, Tonwahl beim Start. Alles in `CLAUDE.md` unter „Entscheidungen“.
2. **Kritik am Stil** → Analyse und Plan (`docs/stil-und-lore-plan.md`), Stimmproben, **Stimme festgelegt** (`docs/stimme.md`: A Chronik für Orte und Vergangenheit, B fiebrig und nah als Standard, C kalt und amtlich für die Kirche), **Optionen fließen in den Satz** (`#fliesst`, keine eigene Zeile mit der Wahl), Arbeitsweise handgearbeitet („Wie würde ein Buch das schreiben?“).
3. **Stilprüfer** `tools/stil.mjs` (in `npm run check`).
4. **Lore-Archiv** `lore/` als Wurzelsystem aus dem Dokument des Nutzers (`quellen/lore-komplett.md`, mit Teil B: Dialogskript, Artbook, Notizen, Bürgerstimmen, Gegner, japanische Texte, Original-Entwurf). Kern (`lore/kern.md`), Lesepakete je Kapitel mit Wissenssperre (`lore/kapitel/`), Lücken und Widersprüche (`lore/offen.md`). Zweimal unabhängig geprüft.
5. **Faktencheck Kapitel 1** (unabhängig, 99 Befunde: `docs/faktencheck-kapitel1.md`) und **Umsetzung in allen Dateien** von Kapitel 1 nach `docs/umsetzung-faktencheck.md` (gemeinsame Festlegungen G1 bis G9). Wichtigste Änderungen:
   - Kanon: Das Band des Mädchens ist weiß (rot erst beim Schwein); die Jägermarke kostet alle Echos; Kirchenjäger tragen Schwarz; die Kirche hat die Große Brücke gesperrt (verriegeltes Tor, Notiz im neuen „dunklen Haus“); Eileen hat nur zwei Begegnungen, im Nachspiel nur ihre Spuren; dass die Kleriker-Bestie ein Kleriker war, bleibt Gerücht; Gascoigne-Kampf 8 Takte, mit seinem Satz vom süßen Blut; der Blutminister spricht vom bösen Traum.
   - Für Neulinge: Das Ziel der Nacht steht auf einem Blatt am Altar im Traum; der Blutminister nennt die Ministration; das Fieber ist nach der Transfusion fort; Zentral-Yharnam verändert sich nach Ereignissen.
   - Figuren: Iosefkas Wärme, Eileens Warnung, das Mädchen und der Morgen, Gehrman (einst Jäger), die Puppe (Gräber früherer Jäger), Gascoigne (Wärme, die zerbricht; Branntwein nach Torf und Rauch statt Birne).
   - Text: Alle Optionen fließen in den Satz, alle Szenen in der neuen Stimme, Stilprüfer von rund 100 auf 4 Warnungen.
   - Technik: Ton-Fehler bei ausgeschaltetem Ton behoben; neue Ortskarte „Das dunkle Haus“; Notizbuch hängt nur noch an Gesehenem.
6. **Lektorat und Feinschliff:** Ein Lektor hat Kapitel 1 als Ganzes gelesen (`docs/lektorat-kapitel1.md`); danach wurde jede Datei Absatz für Absatz geschliffen nach `docs/umsetzung-lektorat.md` (Festlegungen L1 bis L6). Neu als durchgehende Motive: der Spieluhr fehlt ein Ton (Gascoigne summt ihn, das Mädchen summt ihn mit, sein Name fällt in die Lücke), der Choral bricht nach der dritten Zeile ab (im Blutgedächtnis kippt die Stimme in der vierten), die Sonne als Schatten, der nicht wandert, und als Siegel im Tagebuch. Stilprüfer: 1 Warnung.
7. **Übergabe:** diese Datei; `CLAUDE.md` verlangt, sie nach jeder Arbeit zu aktualisieren.

## Wo was liegt
| Was | Datei |
|---|---|
| Regeln und Entscheidungen des Nutzers | `CLAUDE.md` |
| Stimme, Optionen, Arbeitsweise | `docs/stimme.md` |
| Kritik am alten Stil, Plan, Regeln für Optionen | `docs/stil-und-lore-plan.md` |
| Lore-Archiv | `lore/README.md` (Wurzel), `lore/kern.md`, `lore/kapitel/`, `lore/offen.md` |
| Faktencheck Kapitel 1 und Umsetzungsregeln | `docs/faktencheck-kapitel1.md`, `docs/umsetzung-faktencheck.md` |
| Quellen des Nutzers | `quellen/` (Verzeichnis in `quellen/README.md`) |
| Qualität je Stück (Stufe 0 bis 4) | `docs/qualitaet.md` |
| Was der Nutzer mag und nicht mag | `docs/nutzerstil.md` |

## Stand Kapitel 1
Alle Szenen sind überarbeitet und geschliffen (Stufe 2: von Claude gebaut und zweimal gegengeprüft: Faktencheck und Lektorat). **Der Nutzer hat noch nichts davon abgenommen; er testet am Ende selbst.** Die Texte stammen aus parallelen Bearbeitungen nach gemeinsamen Regeln; eine Lektüre nach dem Feinschliff steht aus.

## Nächste Schritte (Empfehlung, in dieser Reihenfolge)
1. **Nutzer spielt Kapitel 1** und sagt pro Szene einen Satz (oder schickt Änderungen über die Werkstatt). Das ist der wichtigste Schritt; alles andere ist Vermutung.
2. **Rückmeldungen des Nutzers einarbeiten** (Werkstatt-Vorschläge mit `npm run vorschlaege`, Ablauf in `docs/vorschlaege.md`; Muster in `docs/nutzerstil.md`).
3. **Offene Kleinigkeiten:** eine Stilprüfer-Warnung (kurze Sätze in der Chronik am Kapitelende, bewusst). Ein Durchlauf nach dem Feinschliff durch einen unabhängigen Leser wäre gut. `system.ink` Nr. 4 aus dem Faktencheck (Blut zurückholen durch Gegenangriff) ist eine Entscheidung des Nutzers, nicht gebaut.
4. **Kapitel 2 (Kathedralbezirk):** zuerst ein Gerüst mit Ein-Satz-Platzhaltern nach `lore/kapitel/kapitel2.md`, dem Nutzer als Abfrage vorlegen.

## Offen beim Nutzer
- **Tod und Traum (2026-11-06, Entwurf):** Monologe je Todesszene (viele), Story-Fragmente nach dem Monolog, feste Traumstellen über Straßenlaternen, Training im Traum. Siehe `docs/struktur-entscheidungsbuch.md`, Abschnitt 9; wartet auf Abnahme der drei Stellen.
- **Umbau Kapitel 1 (2026-11-06, gebaut, ungespielt):** Kapitel 1 ist ein linearer Ablauf in vier Akten (Gerüst, Fadentabelle, Echo-Tabelle: `docs/kapitel1-struktur.md`). Zwei Viertel mit Kartenmodell (zwei von drei), Kreuzung Scheiterhaufen, Eileen fest, Kanalisation-Mündung auf allen Wegen, drei feste Traumszenen (Klinik, Laterne am Eingang der Unterstadt, Kapitelende), Tod als **Nachbild** (Körper, innerer Monolog, Story-Fragment) und Rückkehr an den Anfang des Kampfes. **Entfallen** (Entscheidung des Nutzers, „wie ein Buch, nicht wie ein Videospiel“): Blutechos, Stärkung bei der Puppe, Bad der Boten (Fundstücke liegen jetzt in der Geschichte: Mantel im dunklen Haus, Jagdheft auf dem Dachweg, Brief im Fell der Bestie), Jägermarken, Laternen als Speicherpunkte, Leiter und Rückwege. Die Blutampulle und die grüne Markierung des Gelesenen bleiben.
- **Als Nächstes vom Nutzer:** (1) Kapitel 1 einmal durchspielen und pro Akt einen Satz sagen. (2) Die Monologe und Fragmente sind Platzhalter: Er sagt, welche Gedanken er sich vom Jäger wünscht (Vorschlag: `docs/kapitel1-struktur.md`, Abschnitt 4). (3) Offen: Soll die Leiste weiter Zahlen zeigen (Einsicht, Ampulle)? Gilbert kommt jetzt vor der Ankunft in Yharnam: stimmt die Reihenfolge? Eileens zweite Form der ersten Begegnung ist nur ein Satz Unterschied.
- **Offen für Claude nach dem Umbau:** (a) `// WARUM:`-Begründungen je Option (`docs/vorschlaege.md`, 6c), erst jetzt sinnvoll. (b) Texte neu schreiben erst mit dem Skill `stil-1800` (Anweisung des Nutzers). (c) Tote Revisit-Zweige im Quelltext einzelner Szenen (Türen, Gilbert u. a.) aufräumen. (d) Balance der Kämpfe ohne Vorbereitung im Traum prüfen.
- **Neu im Spiel (2026-11-06):** Kommentare an Claude als Sprechblasen an der Stelle (Antworten in `web/kommentare.json`); Block „Claude erklärt“ unter jeder Entscheidung im Modus Bearbeiten; Bewerten mit 👍/👎. Begründungen (`// WARUM:`) folgen nach dem Umbau.
- **Skill `stil-1800` (2026-11-06), erste Fassung fertig:** Korpus 14 Werke (345.000 Wörter), Analysen Büchner/Hoffmann/Mann, Anthologie 67 Musterstellen, Wortkammer 1.589 Einträge, Prinzipien-Netz 77 Knoten mit Kanten und Situationsindex (`npm run stil -- <moment>`). Alles Stufe 0 (ungeprüft durch Kritiker und Nutzer). Nächste Runde: Analysen Storm (Aquis, Schimmelreiter), Kleist, Rilke; Golem fehlt im Korpus.
- **Anweisung des Nutzers (2026-11-06): Noch keine Spieltexte erneuern.** Erst Skill und Wissen aufbauen (Prinzipien-Netz `.claude/skills/stil-1800/NETZ.md`, Analysen, Anthologie `musterstellen/` nach Momenten, Wortkammer). Vorher/Nachher in den Analysen sind nur Übungen.
- **Schreibkunst (2026-11-06):** Leseliste (nur deutsche Werke) in `docs/schreibkunst-lektuere.md`, Methode aus der KI-Schreibforschung in `docs/ki-schreibmethode.md` (Vorbilder statt Verbote, Slop-Detektor, Bibel, drei Kritiker, Varianten); nächster Schritt Wort-für-Wort-Analyse. Nutzer findet die Prosa „Slop“. Analyse in `docs/schreibkunst-analyse.md` (Messung gegen sieben Klassiker, blinde Kritik, Regeln, die Formeln erzeugen, Plan Phase 2: Korpus, Skill `stil-1800`, Prüfer v2, Weltbild, Probe am Prolog). Wartet auf seine Entscheidungen (Probe-Ton, Regeln umbauen, Mond).
- **Mond/Nacht:** Kanon Kapitel 1 = Abend (Sonnenuntergang nach Gascoigne); Nutzer erinnert ewige Nacht und großen, tiefen Mond. Entscheidung offen.
- **Drei Werkstatt-Fixes bis zur Klinik** (2026-11-06) noch nicht übermittelt.
- **Neu im Spiel:** Gelesenes und getroffene Entscheidungen dauerhaft grün; „← Zurück“ (eine Entscheidung).
- **Hosting (2026-11-06):** Umstellung auf GitHub Pages ist vorbereitet. Nutzer muss: Repo öffentlich machen (https://github.com/kortjannis-web/BB-Game/settings, unten Danger Zone), dann `/settings/pages` Source „GitHub Actions“, dann Workflow „Spiel veröffentlichen“ starten. `quellen/lore-komplett.md` ist aus Repo und Geschichte entfernt (Kopie hat der Nutzer). Netlify erst trennen, wenn die Werkstatt-Vorschläge gesichert sind.
- **Prolog (2026-11-06):** Änderungen des Nutzers (Screenshots) als Vorschlag v1 bis v5b übernommen, einzelne Commits, Tippfehler korrigiert; Muster in `docs/nutzerstil.md`. Herkunftsfrage neu gebaut (Fahrer blickt sich zum ersten Mal um, „Aus was für Verhältnissen …“), Wortlaut der Antworten ist **Entwurf**. Zweite Einreichung (v1 bis v13, Herkunft und Grund) umgesetzt: Gründe „Suche“ und „Schuld“ gestrichen (samt Folgestellen), neu „etwas krank“, „schwer krank“, „Schweigen“. **Offen:** v9 „unaufrichtig“ (Lüge?), Wortlaut der Folgetexte von mir.
- **Herkunft Einfluss:** Entscheidung des Nutzers 2026-11-06: nur Dialog und Text, keine eigenen Optionen. Nebenzeilen dürfen in weiteren Szenen dazukommen (Figuren reagieren auf die Herkunft), aber ohne Weichen.
- Abnahme von Kapitel 1 (siehe oben).
- Entscheidung: Soll ein sofortiger Gegenangriff nach einem Treffer Blut zurückbringen (Kanon: „Rally“)?
- Lore: Der Nutzer hat geliefert, was er hat. Restlücken in `lore/offen.md` (Bewegungen der Bosse für Anzeichen, einige Werkzeuge, welches Fenster welche Bürgerstimme spricht).

## Bekannte Baustellen
- Balance der Kämpfe nur mit Zufallsspieler gemessen (rund 8 Tode je Zufallsdurchlauf).
- Netz: Die Umgebung lässt Wikis, YouTube und Wikipedia nicht durch; nur GitHub ist erreichbar.
- Der Ordner `.claude/worktrees/` (Arbeitskopien der parallelen Bearbeitung) ist von Git ausgeschlossen; er kann gelöscht werden, wenn er stört.
