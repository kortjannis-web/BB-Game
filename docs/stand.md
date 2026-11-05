# Stand und Übergabe

**Zweck:** Wer hier neu einsteigt (ein neuer Chat, eine neue Sitzung), liest zuerst diese Datei und weiß dann, wo wir stehen und was als Nächstes kommt. Claude aktualisiert sie nach jeder Arbeit, committet und merged nach `main`. Alles Wichtige liegt im Repository, nichts nur im Chat.

**Zuletzt aktualisiert:** 2026-11-05

## So startet ein neuer Chat
1. `CLAUDE.md` wird automatisch gelesen. Danach diese Datei, dann die Leseliste in `CLAUDE.md` („Lesen zu Beginn“).
2. Arbeitszweig: Jede Sitzung bekommt ihren eigenen Zweig. `main` ist immer der aktuelle, geprüfte Stand und geht automatisch online (https://yahrnams-neverending-night.netlify.app/).
3. Der Nutzer will: Häppchen statt Fragenkataloge; selbstständig bauen, prüfen, mergen; jede Szene von Hand; am Ende jeder Antwort das nächste Häppchen.

## Wo was liegt
| Was | Datei |
|---|---|
| Regeln und Entscheidungen des Nutzers | `CLAUDE.md` |
| Stimme (A Chronik, B fiebrig und nah, C kalt und amtlich), Optionen, Arbeitsweise | `docs/stimme.md` |
| Kritik am alten Stil, Plan, Regeln für Optionen | `docs/stil-und-lore-plan.md` |
| Lore-Archiv (Wurzel, Kern, Lesepakete je Kapitel mit Wissenssperre, Lücken) | `lore/README.md`, `lore/kern.md`, `lore/kapitel/`, `lore/offen.md` |
| Quellen des Nutzers | `quellen/` (Verzeichnis in `quellen/README.md`) |
| Qualität je Stück (Stufe 0 bis 4) | `docs/qualitaet.md` |
| Was der Nutzer mag und nicht mag | `docs/nutzerstil.md` |
| Stilprüfer | `tools/stil.mjs` (`npm run stil`, Teil von `npm run check`) |

## Laufende Arbeit: Kapitel 1 Szene für Szene in der neuen Stimme
Jede Szene wird von Hand neu geschrieben: Lore aus dem Lesepaket, Ortsbild in A, Geschehen in B, Kirche in C, Optionen mit `#fliesst` (die Wahl fließt in den Satz, keine eigene Zeile). Danach `npm run check`, Browsertest, Commit, Merge, Artefakte veröffentlichen, diese Datei aktualisieren.

| Knoten | Szene | Stand |
|---|---|---|
| k1_b_gilbert | Gilberts Fenster | neu (2026-11-04), vom Nutzer noch nicht abgenommen |
| k1_prolog | Prolog, Kutsche | neu (2026-11-05), nicht abgenommen |
| k1_klinik | Klinik, Vertrag (C), Transfusion, Vision | neu (2026-11-05), nicht abgenommen |
| k1_erwachen | Erwachen, Zettel, erster Tod | neu (2026-11-05), nicht abgenommen |
| k1_traum_erst | Erster Besuch im Jägertraum | **als Nächstes** |
| k1_klinik_kampf, k1_iosefka, k1_laterne_zentral | Lernkampf, Iosefkas Tür, erste Laterne | danach |
| k1_hub_b und die Orte in Zentral-Yharnam | Stadt, Türen, Anschlag, Scheiterhaufen, Mädchen, Dächer, Eileen | danach |
| k1_n1_kleriker | Kleriker-Bestie | Kampf schon verlängert, Text noch alte Stimme |
| Unterstadt, Gascoigne, Nachspiel, Traum | Rest des Kapitels | danach |

## Offen beim Nutzer
- Quellen für die Lücken in `lore/offen.md`, vor allem: gewöhnliche Gegner, Bürgerstimmen in Zentral-Yharnam, Kampfwissen zu Kleriker-Bestie und Gascoigne (Fextralife als PDF oder Netzfreigabe der Umgebung).
- Abnahme der neuen Szenen (ein Satz pro Szene reicht).

## Bekannte Baustellen
- Alte Szenen haben noch Optionen mit eigener Zeile (`› …`); beides läuft parallel, bis alles umgeschrieben ist.
- Stilprüfer meldet noch rund 20 Knoten mit Stakkato und viele alte Optionen; das schrumpft mit jeder überarbeiteten Szene.
- Balance der Kämpfe nur mit Zufallsspieler gemessen.
- Netz: Die Umgebung lässt Wikis, YouTube und Wikipedia nicht durch; nur GitHub ist erreichbar.
