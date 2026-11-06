---
name: stil-1800
description: Deutsche Buchprosa auf dem Niveau der Meister um 1800 bis 1910 (Büchner, Hoffmann, Mann, Kleist, Storm, Droste, Gotthelf, Rilke, Kafka). Diesen Skill immer laden, bevor Prosa für das BB-Game (Yharnam, Ink, Du-Form im Präsens) geschrieben, umgeschrieben oder überarbeitet wird, und für jede deutsche Prosa auf literarischem Niveau, auch wenn nur „schöner“, „eleganter“, „wie ein Buch“, „unheimlicher“ oder „klingt nach Slop“ gesagt wird. Enthält ein abfragbares Prinzipien-Netz (77 Prinzipien, 19 Momente), eine Anthologie von Musterstellen und eine Wortkammer mit Dosis.
---

# stil-1800: Prinzipien-Netz für deutsche Buchprosa

**Zweck.** Prosa, die hautnah, unheimlich, mystisch, elegant, meisterhaft und klar zugleich ist, wie bei den deutschen Meistern, und doch Du-Präsens für ein Erzählspiel am Handy. Das Netz sagt in jedem Moment des Schreibens, welche Griffe tragen, wo ihre Grenze liegt und womit sie in Spannung stehen. Bauplan: `NETZ.md`.

## Rangfolge (bei Widerspruch)
1. **Muster und Entscheidungen des Nutzers** (`docs/nutzerstil.md`, `CLAUDE.md`, `docs/stimme.md`) gehen jedem Prinzip vor, auch den Meistern. Wo ein Prinzip sie berührt, steht es im Feld „Nutzer“ des Knotens.
2. **Prinzipien dieses Netzes.**
3. **Ältere Regeln der Skills** `erzaehlkunst-deutsch` und `hpl-horror`, wo sie dem Netz widersprechen (etwa „keine Gedankenstriche“, „Szene endet auf Bild oder Tat“, „ein Vergleich je Absatz aus Handwerk und Brauch“). Achtung: Was davon in `CLAUDE.md` oder `docs/stimme.md` steht, könnte dem Nutzer gehören und gilt bis zu seiner Zustimmung weiter (offen: Gefühl benennen, Gedankenstrich, Erzählerurteile in B, Ort mit Sinnen). Das Netz vermerkt jeden dieser Fälle.

## Ablauf beim Schreiben
1. Szene planen (Lore, Figuren, Saat und Ernte), dann den **Moment** bestimmen (`npm run stil -- liste`). Eine Szene hat oft zwei Momente (etwa anzeichen, dann kampf).
2. `npm run stil -- <moment>`: Prinzipien nach Gewicht mit Regel, Prüffrage, Nutzer-Vermerk und Spannungen; die Musterstellen; Wörter mit Dosis.
3. **Die zwei bis drei Musterstellen ganz lesen**, laut im Ohr, ehe ein eigener Satz entsteht. Nur hören und lernen, nie Sätze übernehmen.
4. Schreiben, mit dem Netz im Blick. Einen Knoten vollständig (Belege, Maß, Kanten): `npm run stil -- prinzip SA-01`.
5. Prüfen: die Prüffragen des Moments Satz für Satz, `npm run stil` (Stilprüfer), dann Kritiker (Stil blind, Lore, Logik), dann der Nutzer. Ungeprüftes ehrlich als Entwurf melden (Stufe 0 bis 3 in `docs/qualitaet.md`).

## Vorbilder vor Verboten
Ein Sprachmodell ahmt Vorbilder besser nach, als es Regeln befolgt, und ein genanntes Verbot zieht den Fehler an (`docs/ki-schreibmethode.md`). Darum ist jede Regel des Netzes **positiv** formuliert und an einem Original belegt. Die Schwächen S1 bis S15 (`docs/schreibkunst-analyse.md`, Abschnitt 3) stehen nur als „gegen“ im Knoten und gehören in die Prüfung danach, nicht in den Schreibauftrag.

## Dosis der Wortkammer
Die Wortkammer ist eine Würzkammer, kein Pensum. Jedes Wort hat eine Höchstdosis: **frei** (Gelenke wie wohl, gar, doch, indem: sollen häufiger werden), **bis 3 je Kapitel**, **höchstens 1 je Kapitel** (stark markierte und altertümliche Wörter), **selten** (1 bis 2 im ganzen Spiel). Altertümliches nur in Stimme A, in Dokumenten oder im Mund alter Figuren. Ein seltenes Wort, das zur Formel wird, ist Wortschmuck; lieber ein schlichtes Wort, das sitzt (Regel 5 des Nutzers).

## Wo was liegt
| Ort | Inhalt |
|---|---|
| `NETZ.md` | Bauplan: neun Ebenen (WO, FB, SA, AB, ST, FI, SZ, WE, SP), sechs Wirkungen (HN, UN, MY, EL, ME, KL), Knotenschema, Momente |
| `netz/prinzipien.json`, `netz/PRINZIPIEN.md` | die Knoten mit Regel, Warum, Beleg, Übertragung, Grenze, Prüffrage, Kanten (stärkt, braucht, Spannung mit Auflösung) |
| `netz/situationen.json`, `netz/SITUATIONEN.md` | je Moment: Prinzipien nach Gewicht, Musterstellen, Wörter |
| `analysen/` | Wort-für-Wort-Analysen (Büchner *Lenz*, Hoffmann *Der Sandmann*, Mann *Der Tod in Venedig*): Schlüsselstellen, Griffe, Vorher und Nachher an unseren Sätzen |
| `musterstellen/` | Anthologie: 67 Originalstellen nach 18 Momenten (`index.json`) |
| `wortkammer/` | 1.589 Wörter mit Beleg, Register, Dosis, Momenten (`wortkammer.json`, `WORTKAMMER.md`) |
| `korpus/` | 14 gemeinfreie Volltexte (`QUELLEN.md`) |
| `werkzeuge/` | Messung (`stil.py`), Wortkandidaten (`wortkammer.py`), Slop-Detektor (`slop.py`), Zitatprüfung (`zitatcheck.py`) |
| `tools/stil-netz.mjs` | Abfrage: `npm run stil -- <moment> / prinzip <ID> / ebene <XX> / liste / md / pruefen`; ohne Argument läuft wie bisher der Stilprüfer `tools/stil.mjs` |

## Pflege
Neue Analysen oder Griffe werden in `netz/prinzipien.json` eingearbeitet: Gleiches wird ein Knoten mit mehreren Belegen, Widersprüche werden Kanten „spannung“ mit Auflösung. Danach `npm run stil -- pruefen` (Belege müssen wörtlich in `analysen/` stehen, Kanten symmetrisch) und `npm run stil -- md`. Antworten des Nutzers fließen zuerst in `docs/nutzerstil.md`, dann in die Felder „Nutzer“.

Stand 2026-11-06: erste Fassung, Stufe 0. Kein Knoten ist vom Nutzer bestätigt; alle Übertragungen sind Entwürfe.
