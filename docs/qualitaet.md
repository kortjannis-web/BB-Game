# Qualitätsliste

Grundsatz (CLAUDE.md, „Rolle“): **Nichts ist gut, bis der Nutzer es bestätigt.** Alles, was Claude allein gebaut hat, gilt als Entwurf mit Fehlern. Diese Liste misst den Fortschritt: Mit jeder gezielten Runde rückt ein Stück eine Stufe nach oben.

**Stufen:** 0 Gerüst · 1 Entwurf (Claude allein) · 2 überarbeitet (Claude, mit Gegenprüfung) · 3 vom Nutzer kommentiert · 4 vom Nutzer bestätigt. Stufe 4 vergibt nur der Nutzer.

**Pflege:** nach jeder Arbeit Stufe, Datum und neue Schwächen eintragen. Schwächen konkret („Eileens zweite Begegnung erklärt Henryk, statt ihn zu zeigen“), nicht allgemein. Die schwächste Stelle mit der größten Wirkung ist der nächste Vorschlag an den Nutzer.

Stand 2026-11-04, nach Runde 1: drei unabhängige Prüfungen (Plot und Logik, Lore und Tiefe, Figuren und Prosa, zusammen rund 75 Befunde), danach Überarbeitung des ganzen Kapitels. Die Berichte liegen nicht im Repository; ihre Punkte sind unten als „behoben“ oder „offen“ eingearbeitet. Danach eine zweite, unabhängige Gegenprüfung (30 Befunde, darunter Phasenfehler im Gascoigne-Kampf nach einem Tod, doppelte Begrüßung der Puppe, Wissenslecks, Zeilen zu nah am Original); alle eingearbeitet und die schwersten nachgespielt.

**Überarbeitung Text für Text (2026-11-06, Auftrag des Nutzers):** Jeder Text von Kapitel 1 einzeln überarbeitet mit Skill `stil-1800`, nach den Festlegungen Ü1 bis Ü12 (`docs/ueberarbeitung-kapitel1.md`), von neun Bearbeitern parallel je Datei. **Nacht von Anfang an** (Mond statt Sonne, Stufen Klinik → Treppen → Dachweg → Brücke → Gräber → Heimweg). Alle Platzhalter ausgeschrieben: 30 Monologe im Nachbild, 6 Fragmente, Dachweg, Übung im Hof, Unterstadt, Tor, Übergänge der Viertel. Jede Option hat `// WARUM:`. Notizbuch in Stimme A nachgezogen. **Das ganze Buch** (`web/buch.html`, `docs/kapitel1-buch.md`) zeigt alle Texte chronologisch und ist im Buch selbst bearbeitbar (Werkstatt). Danach zwei unabhängige Prüfungen über das ganze Buch (Stil 60 Befunde, Lore/Logik 50 Befunde) und eine Nachbesserung nach N1 bis N9 (`docs/nachbesserung-2026-11-06.md`), alle Befunde bearbeitet; die starken Stellen der Prüfer blieben. Stand: Stufe 2 überall, nichts vom Nutzer abgenommen; nach der Nachbesserung kein zweiter unabhängiger Leser. Bekannte Schwächen aus den Berichten der Bearbeiter: tote Zweige (`q_frau` immer 1, `gascoigne2` in Eileens Szene immer wahr, `eileen_frage_offen` nie gesetzt, Teile von `puppe_gespraech` und Gehrmans Parade-Zweige unerreichbar); der Klinik-Monolog ist praktisch unerreichbar (Lernkampf höchstens 4 Schaden); der Zettel aus dem dunklen Haus fehlt im Notizbuch; Wurf der Donnerbüchse durch Gascoigne in Phase 2 ist eine Zuspitzung (PRÜFEN); Mädchen früh zur Klinik endet trotzdem beim Schwein (Kanon anders, Entscheidung des Nutzers); kein Durchlauf im Browser durch einen Menschen.

**Umbau zum Entscheidungsbuch (2026-11-06):** Kapitel 1 ist nach Fassung 2 umgebaut (`docs/kapitel1-struktur.md`): vier Akte, jede Station einmal, zwei Viertel mit Kartenmodell (zwei von drei), Kreuzung Scheiterhaufen, Eileen fest, drei feste Traumszenen, Tod als Nachbild mit Monolog und Story-Fragment, Rückkehr an den Anfang des Kampfes. Entfallen: Blutechos, Stärkung, Bad der Boten, Jägermarken, Laternen als Speicherpunkte, Leiter und alle Rückwege. **Alle Texte bleiben Stufe 2 (vorheriger Stand), neue Stationen, Nachbilder und Fragmente sind Platzhalter (Stufe 0 bis 1).** Offene Schwächen: Gilbert kommt vor der Ankunft in Yharnam (Reihenfolge der Orte), Eileens zweite Form ist nur ein Satz, die Kämpfe hängen nicht mehr am Vorbereiten im Traum (Balance ungetestet; Zufallsspieler 5 Tode je Lauf, vorher rund 8), Revisit-Zweige in einzelnen Szenen sind teils noch als tote Zweige im Quelltext.

**Nacht 2026-11-04 (Freigabe des Nutzers):** Waffenwahl entfernt (Sägespalter); Stärkung bei der Puppe (zwei Stufen, je eine Zusatzmöglichkeit in Schwein, Kleriker, Gascoigne); Chronik der Nacht; Einsicht mit Kosten (falscher Schatten am Grab); Ton (erzeugte Atmosphäre je Stimmung, Herzschlag bei wenig Leben, eigene Spieluhr-Melodie, CC0-Geräusche, Schalter); Icons in der Leiste (Ampulle füllt sich, Auge öffnet sich mit Einsicht); pulsierende Anzeichen, „erkannt“ bei gelernten, Trefferrand, Schwarzblende beim Tod; Ortskarten; Notizbuch mit Reitern Aufzeichnungen, Personen, Fragen der Nacht und Neu-Markierung.

**Feinschliff Kapitel 1 nach Lektorat (2026-11-05):** Ein Lektor hat das Kapitel als Ganzes gelesen (`docs/lektorat-kapitel1.md`: Tonbrüche, gezählte Wiederholungen, Leitmotive, drei bis acht schwächste Stellen je Knoten). Danach jede Datei Absatz für Absatz geschliffen nach `docs/umsetzung-lektorat.md` (L1 Fortsetzungen nach der Wahl ohne „Du“-Protokoll und ohne Umstellungstick, L2 keine Spielsprache, Brandflasche statt Molotow, L3 Lernsätze als Körpererinnerung, L4 keine christlichen Formeln, L5 Wiederholungen gekappt, L6 Leitmotive: Sonne als wachsendes Zeichen, Choral ohne Kommentar, Spieluhr mit fehlendem Ton als durchgehendes Motiv). Stilprüfer: 1 Warnung. Ungeprüft: zweite Lektüre nach dem Feinschliff, Abnahme durch den Nutzer (er testet am Ende selbst).

**Faktencheck und Überarbeitung Kapitel 1 (2026-11-05):** Lore Teil B eingearbeitet (Archiv vollständig bis auf `lore/offen.md`). Unabhängiger Faktencheck mit 99 Befunden (`docs/faktencheck-kapitel1.md`), alle Dateien von Kapitel 1 nach den gemeinsamen Regeln (`docs/umsetzung-faktencheck.md`) überarbeitet: Kanonfehler behoben (weißes Band, Jägermarke kostet Echos, schwarze Kirchenjäger, Brücke gesperrt, Eileen nur zwei Begegnungen, Gerücht statt Beweis bei der Kleriker-Bestie), Kernsätze der Figuren ergänzt, Ziel der Nacht im Traum, Notizbuch ohne Vorwegnahme, alle Optionen fließen in den Satz, Text in Stimme A/B/C. Stilprüfer: 4 Warnungen (vorher rund 100). Ungeprüft: keine zweite unabhängige Lektüre der neuen Texte, nur ein Browserdurchlauf über 120 Wahlen, vom Nutzer nichts gelesen.

**Lore-Archiv (2026-11-04):** Lore-Dokument des Nutzers (LK) in `lore/` als Wurzelsystem eingearbeitet: 97 Dateien nach Welt, Fraktionen, Orten, Figuren, Bossen, Gegenständen und Deutungen, dazu handgeschrieben Wurzel, Kern, Lesepakete Kapitel 1 und 2 mit Wissenssperre, Lückenliste. Stufe 1 (von Claude gebaut, nicht gegengeprüft). Bekannte Lücken: gewöhnliche Gegner, Bürgerstimmen, alle Notizen, Mädchen-Quest als Figur, frühe Dialoge Gehrman/Puppe, Feuerwaffen, Widerspruch zu Gascoignes Töchtern (`lore/offen.md`).

**Kritik des Nutzers 2026-11-04 (nach der Abfragerunde):** Schreibstil schwach, eigenartige Wörter, unlogische Aussagen, Entscheidungsoptionen grauenhaft, keine Atmosphäre, Sätze, die rauswerfen. Gemessen: Ø Satzlänge 10,3 Wörter, „etwas“ 88-mal, rund 4 Vergleiche je 1.000 Wörter, 20 Ein-Wort-Optionen. Analyse und Plan in `docs/stil-und-lore-plan.md`. Bis zur Überarbeitung gilt für alle Texte: Prosa höchstens Stufe 2, Optionen Stufe 1.

**Stilprüfer und erste Optionen (2026-11-04):** `tools/stil.mjs` (in `npm run check`, vorerst nur Warnungen; `npm run stil` zeigt alle Fundstellen). Optionen von Gilbert und der Kleriker-Bestie nach `docs/stimme.md` neu geschrieben (Probe zur Abnahme); „Blutampulle trinken“ überall durch „Die Ampulle in den Schenkel stoßen“ ersetzt (Widerspruch zum Text). Restliche Optionen von Kapitel 1 warten auf das Okay des Nutzers.

**Abfragerunde 2026-11-04 (16 Antworten des Nutzers, umgesetzt):** Kleriker-Bestie 7 Takte (neu: Kutschenwurf, Ansturm mit dem Geweih, falsche Ruhe), Weg mit Gascoigne 3 Takte; Gascoigne 8 Takte (neu: Schuss aus nächster Nähe, Hieb von oben mit Zählen, Umkreisen); Folgen kürzer und härter. Kirche: Glocke und Choral als Klänge (nach beiden Bossen und nach Marthas Tod), Anschlag an einer Kapellentür (neuer Knoten). Ludwig als Gerücht bei Gilbert. Boten: Jagdnotizen (lehren drei Anzeichen vorab), Kirchenbrief (Saat Kapitel 2), Wendels Mantel (Gascoigne und Eileen erkennen ihn, Weiche Wahrheit/Lüge mit Szenario). Einsicht kostet leise (Gilbert und Eileen merken es ab 2, Ruf hinter dem Fenster ab 2, Heulen im Kopf ab 3). Tonwahl auf der Titelseite. Danach unabhängige Prüfung (25 Befunde, alle eingearbeitet: Begründungen aus den Beschriftungen gestrichen, je Boss Takte mit zwei plausiblen Möglichkeiten, eigene Anzeichen statt geteilter, Augenbinde-Widersprüche, Ampulle ohne Risiko, Rückkehr-Widerspruch, Choral jedes Mal anders, Kanon-Prüfmarken bei Ludwig, Vikarin, Siegel, Traum). Selbst gefunden: Die richtige Möglichkeit stand fast immer an erster Stelle; Reihenfolge jetzt gemischt. Offen: Balance für aufmerksame Spieler nur von Hand geschätzt (Prüfer: an den Bossen 0 bis 3 Schaden vor den Änderungen); Choral-Lautstärke nur gerechnet.

**Runde 1, was sich geändert hat:**
- *Fehler auf normalen Wegen:* Schwein-Zustand beim Vorbeischleichen, Rückweg-Kanal nach Ursache, Rückweg über die Brücke nach dem Sieg, Laternen-Rückkehr aus dem Traum (Wahl zwischen den entzündeten), Gascoigne am Scheiterhaufen nach den Gräbern (jetzt nur noch ein Schuss aus dem Nebel und blutige Spuren), Wissenslecks (Name, Parade-Quelle, Wahlen an den Gräbern), Mädchen im Nachspiel ohne frühere Begegnung, Eileen sieht Gascoigne am Tor, Mob verbrannt.
- *Traum als Fluch:* Tinte an den Fingern, Nadelstich beim Erwachen, „daheim“, die Sonne, die nicht untergeht (statt des zu frühen Blutmonds), Frauenstimme in der Vision, Gehrman (Zuflucht, Vertrag, „wann ist die Nacht vorbei“, Schlaf), die Puppe (die Kleinen, Fragen nach draußen, „sei vorsichtig“).
- *Gascoigne:* Namenstausch, Branntwein am Laternenpfahl, Freundschaft mit Minuswerten (Schwelle 3), Verrat mit Folgen, Lied und Vikar auf der Brücke, kippende Anrede an den Gräbern, Spieluhr als Entscheidung mit Steigerung, Moment der Klarheit in gebrochener Rede, Sieg endet auf der Kappe, Neid auf seinen Tod.
- *Figuren:* direkte Rede mit eigenen Stimmen statt einheitlichem Bericht; Erzählerurteile über die Wahl des Spielers gestrichen; rotes Band am Fenster gesät; Eileen nur noch zwei Begegnungen plus stumme Geste; Gilbert mit Geschenk, Birnbaum, Bericht mit Wahl und Versprechen; Viola-Spur hinter einer Tür; Schütze verschonbar; Herkunft und Grund mit Echos.
- *Notizbuch* in Stufen nach dem, was der Spieler erlebt hat; neue Einträge Einsicht, Gehrman.

## Ganzes Kapitel 1
| Bereich | Stufe | Bekannte Schwächen, offene Fragen |
|---|---|---|
| Plotfäden und Logik (Saat und Ernte, Übergänge, Widersprüche) | 2 | Runde 1 und Gegenprüfung eingearbeitet; nicht jeder Weg nachgespielt |
| Einsatz der Lore (alles Wichtige drin? Potenzial verschenkt?) | 2 | Kirche jetzt hörbar und lesbar (Choral, Glocke, Anschlag, Brief), Ludwig als Gerücht; ob der Choral im Ohr wirkt, ungetestet |
| Figuren (Gascoigne, Eileen, Gilbert, Viola, das Mädchen, Iosefka, Gehrman, Puppe) | 2 | Stimmen jetzt verschieden; ob sie so klingen, wie der Nutzer sie hört, ist ungeklärt |
| Ton und Treppe des Grauens (gotisch → körperlich → Vorschein kosmisch) | 2 | je Einsichtspunkt ein Detail; Wirkung ungetestet |
| Entscheidungen (richtig/falsch fair angekündigt, Folgen sichtbar) | 2 | 7 neue Weichen mit Szenario; Folgen in Kapitel 2 noch nicht gebaut |
| Kämpfe (Anzeichen, Möglichkeiten, Folgen, Tod als Erzählung) | 2 | Bosse nach Vorgabe des Nutzers verlängert (7 und 8 Takte), unabhängig geprüft; Balance nur mit Zufallsspieler gemessen (9,4 Tode je Durchlauf, sagt wenig über aufmerksame Spieler); Mob, Schwein, Klinik noch alte Länge |
| Rede: direkte Rede mit eigenen Stimmen | 3 | vom Nutzer per Abfrage bestätigt (2026-11-04); einzelne Stimmen noch nicht gehört |
| Der Traum als Fluch (Dosierung) | 2 | gebaut nach Plan; ob es „cool“ genug ist, entscheidet der Nutzer |

## Knoten
| Knoten | Titel | Stufe | Schwächen |
|---|---|---|---|
| k1_prolog | Prolog: Wer du bist | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. Handgearbeitet 2026-11-05 (A, B, Optionen fließen); nicht abgenommen |
| k1_klinik | Iosefkas Klinik: Transfusion | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. Handgearbeitet 2026-11-05 (Vertrag in Stimme C); Vision nur nach RK1 (wahrscheinlich); nicht abgenommen |
| k1_erwachen | Erwachen und erster Tod | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. Handgearbeitet 2026-11-05; nicht abgenommen |
| k1_traum_erst | Erster Besuch im Jägertraum | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_klinik_kampf | Lernkampf in der Klinik | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. sehr kurz (81 Wörter) |
| k1_iosefka | Iosefkas Tür | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_laterne_zentral | Laterne vor der Klinik (nur Licht) | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. | Umbau 2026-11-06: Laterne ist kein Weg mehr in den Garten.
| schrei | Kreischen von der Brücke | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_gilbert | Gilbert | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. **Erste handgearbeitete Szene** (2026-11-04): Ortsbild in Stimme A, Begegnung in B, Optionen fließen in den Satz (#fliesst), Lore aus `lore/`; vom Nutzer nicht gelesen. Offen: Gilberts Sätze nur sinngemäß gegen Kanon geprüft (RK1 §5), Ruß an der Düse als Deutungs-Detail |
| k1_b_tueren | Türen mit Räucherlampen | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_scheiterhaufen | Scheiterhaufen, erste Begegnung mit Gascoigne | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_maedchen | Das Mädchen am Fenster | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_daecher | Gasse unter den Dächern (Schütze) | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_eileen | Eileen die Krähe (Dach) | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_n1_kleriker | Nadelöhr 1: Kleriker-Bestie | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. 7 Takte (Abfrage); vom Nutzer nicht gespielt |
| k1_b_anschlag | Der Anschlag an der Kapellentür | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. neu; Wortlaut der Kirche eigen |
| k1_c_kanal | Kanalisation (Schwein, Leiter) | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_c_eileen | Eileen über den Gräbern | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_c_graeber | Die Gräber, zweite Begegnung mit Gascoigne | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_n2_gascoigne | Nadelöhr 2: Gascoigne | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. 8 Takte (Abfrage); neue Takte unabhängig geprüft, vom Nutzer nicht gespielt |
| k1_d_grab | Viola und die Brosche | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_d_maedchen | Weiche: Was sagst du dem Mädchen? | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_d_kanal | Rückweg durch die Kanalisation | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_d_gilbert | Gilbert hinter der Brücke | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_d_traum | Kapitelende im Traum | 2 | Faktencheck 2026-11-05 umgesetzt, in neuer Stimme, Optionen fließen; nicht abgenommen. |
| k1_b_ankunft, k1_viertel1, k1_nach_viertel1, k1_nach_scheiterhaufen, k1_viertel2, k1_nach_viertel2, k1_vor_bruecke | Akt II: Ankunft, Viertel (zwei von drei), Übergänge mit Spuren des Nichtgewählten | 1 | Umbau 2026-11-06, Entwurf von Claude. Texte der Spuren und Übergänge sind knappe Platzhalter; die Wahloptionen sind von Spuren angekündigt, aber ungeprüft, ob die Wahl „nicht blind“ wirkt. |
| k1_b_dachweg | Der Dachweg (neu) | 0 | Platzhalter-Station, knappe Sätze; Jagdheft-Text aus dem alten Handel übernommen. |
| k1_c_unterstadt, k1_c_tor | Unterstadt (Ankunft mit Laterne), Tor des Oedon | 1 | Umbau 2026-11-06; Ankunft aus dem alten Hub übernommen, Laterne neu (Text knapp). |
| k1_traum_zwei, training | Traum 2: Laterne, Gehrman, Puppe, Übung im Hof | 1 | Neu 2026-11-06; Übung im Hof ist Platzhalter (kurz); öffnet gegen Gascoigne je eine Möglichkeit. |
| nachbild, Monologe (ca. 30), Fragmente (6) | Tod: Nachbild, innerer Monolog, Story-Fragment | 0 | Platzhalter. Monologe sind kurz und klar, aber unausgefeilt; „sehr viele“ (Nutzer) sind noch zu schreiben (zwei bis drei je Todesszene und Entscheidung). Fragmente sind knappe Deutungen des Jägers. |
| k1_d_heimweg, _a bis _d | Heimweg (linear) | 1 | Umbau 2026-11-06: kein Hub; Reihenfolge Mädchen, Kanalisation (nur nach der Brosche), Gilbert, Laterne am Grab. |
| traum (gehrman, puppe_erwacht, puppe_gespraech) | Jägertraum | 2 | Faktencheck 2026-11-05 umgesetzt; hier nur noch in festen Szenen. Entfallen: Hub, Bad der Boten (Handel), Stärkung der Puppe. |

## Werkzeuge und Oberfläche
| Stück | Stufe | Schwächen |
|---|---|---|
| Spieloberfläche (Lesen, Leiste, Vignette, Notizbuch) | 2 | Icons, Kampfdarstellung, Ortskarten, Notizbuch als Buch neu; im Browser getestet, Geschmack ungeprüft |
| Ton | 1 | erzeugt, nur technisch getestet (kein Hörtest möglich); Lautstärke und Stimmung ungeprüft; Choral und Glocke neu; Wahl beim Start |
| Mechaniken der Nacht (Chronik, Einsicht kostet leise, Nachbild, Fragmente) | 1 | Stärkung, Blutechos, Marken und Handel entfallen (2026-11-06). Einsicht kostet an fünf Stellen leise; Balance ungetestet. |
| Werkstatt im Spiel und im Erzählbaum | 2 | getestet nur gegen nachgebildetes GitHub; erster echter Versand steht aus; Vorschläge liegen nur im jeweiligen Browser |
| Erzählbaum (Karte) | 1 | |
| Hosting | 1 | Umstellung 2026-11-05 von Netlify (Credits aufgebraucht, Production-Deploys pausiert) auf GitHub Pages: https://kortjannis-web.github.io/BB-Game/. Workflow vorhanden, erster Lauf und Erreichbarkeit noch nicht geprüft (von hier aus nicht erreichbar) |
| Skills `erzaehlkunst-deutsch`, `hpl-horror` | 2 | ein Vergleich (Gascoigne); Rede-Regel in hpl-horror nach Runde 1 geändert, Paket neu |
| Notizbuch (Stufen nach Erlebtem) | 2 | neu gebaut, im Browser noch nicht durchgesehen |
