# Schreibkunst: Analyse und Plan (2026-11-06)

Auftrag des Nutzers: „Deine Texte sind leider schlecht … wirken wie absoluter Slop. Gib mir eine große Analyse und Recherche, wie wir deine Texte verbessern könnten und du wie ein unfassbar guter Schreiber schreibst. Mit eleganten Worten und einer verspielten 1800er Art … dass die deutsche Sprache zur Kunst wird … eerie und mystic, aber ästhetisch, wie Bloodborne, mit der richtigen Lore.“

Grundlage dieser Analyse:
1. **Messung** (Stilometrie) unserer Prosa aus Kapitel 1 (rund 26.000 Wörter) gegen sieben gemeinfreie Meisterwerke: Gotthelf, *Die schwarze Spinne* (1842); Storm, *Der Schimmelreiter* (1888); Hoffmann, *Der Sandmann* (1817); Kleist, *Das Bettelweib von Locarno* (1811); Eichendorff, *Das Marmorbild* (1819); Tieck, *Der blonde Eckbert* (1797); Droste-Hülshoff, *Die Judenbuche* (1842). Texte aus Forschungskorpora auf GitHub, Skript im Arbeitsordner der Sitzung.
2. **Blinde Kritik** durch einen unabhängigen Lektor-Agenten. Er bekam weder meine Einschätzung noch `docs/nutzerstil.md`, sondern las die Prosa, die Skills und `docs/stimme.md`.
3. **Bestand** der Schreibregeln: zwei Skills mit acht Nachschlagewerken (rund 11.000 Wörter), `docs/stimme.md`, Stilprüfer `tools/stil.mjs`.

Vorbehalte: Die Klassiker erzählen meist in der Er-Form und im Präteritum, wir in der Du-Form und im Präsens. Der Kleist-Text ist kurz (960 Wörter). Die Zählungen sind Heuristiken ohne Wortartenbestimmung und taugen als Richtwerte, nicht als Urteil.

---

## 1 Befund in einem Satz

Billiger Slop im üblichen Sinn ist es nicht: „plötzlich“, „Schatten tanzen“ oder „nicht X, sondern Y“ kommen null Mal vor. Das eigentliche Problem: Die Prosa ist **regelkonform, gleichförmig und ohne Erzähler**. Sie ist moderne Schreibschul-Prosa mit Kameraauge, in kurzen Sätzen gebaut, bei der jeder Absatz nach demselben Plan läuft: Ortsinventar, Geruchstriade, Vergleich, Körperreaktion, Schlusspointe. Ein Text um 1800 klingt genau umgekehrt: ein Erzähler mit Haltung, lange Perioden mit logischen Gelenken, seltene, dafür kühne Bilder.

**Der wichtigste Teil des Befunds:** Ein großer Teil der Formelhaftigkeit kommt aus **unseren eigenen Regeln** (Abschnitt 4). Mehr Regeln derselben Art würden es schlimmer machen.

---

## 2 Messung: Wir gegen die Meister

Werte je 1.000 Wörter, wo nicht anders angegeben.

| Merkmal | Meister (Spanne) | **Wir** | Was es bedeutet |
|---|---|---|---|
| Satzlänge im Mittel (Wörter) | 24,8 bis 49,5 | **15,3** | Wir schreiben halb so lange Sätze. |
| Satzlänge Median | 19 bis 44 | **13** | |
| Streuung der Satzlänge (SD) | 19 bis 43 | **10** | Gleichförmiger Takt, keine Wellen. |
| Sehr kurze Sätze (≤ 6 Wörter) | 0 bis 8 % | **21 %** | Stakkato, Pointenmaschine. |
| Lange Sätze (≥ 35 Wörter) | 19 bis 60 % | **4 %** | Die Periode fehlt fast ganz. |
| Nebensätze je Satz | 0,43 bis 1,55 | **0,35** | Reihung statt Gefüge, „und“ statt „indem“, „da“ oder „wiewohl“. |
| Kommas je Satz | 2,2 bis 7,0 | **1,7** | |
| Erzählerwörter der Zeit (*freilich, wohl, gar, indessen, jedoch, sogleich, ehe, zuweilen, doch, denn …*) | 6,2 bis 12,5 | **1,5** | Die Melodie um 1800 fehlt. |
| Konjunktiv I (Gerücht, Bericht) | 0,7 bis 7,2 | 1,6 | Das Dorfgerede der Gotthelf-Art fehlt. |
| Vergleiche „wie ein …“ | 0,9 bis 3,4 | **2,7** | Mehr als fast alle Meister. |
| Gedankenstriche | 0 bis 21,5 | **0** | Unser Verbot ist unhistorisch: Hoffmann 21,5, Droste 19,2. |
| Ausrufe | 1,1 bis 16,9 | **0,7** | Der Erzähler erregt sich nie. |
| Länge des letzten Satzes im Absatz | 25 bis 83 | **14,9** | Absätze enden auf Kurzsatz-Pointen; Meister lassen sie ausschwingen. |
| Wortvielfalt (MATTR 500) | 0,53 bis 0,61 | **0,52** | Kleiner Wortschatz, viele Wiederholungen. |

Die Zahlen bestätigen, was du beim Lesen spürst. **Unser Satzbau ist Gegenwartsprosa.** `docs/stimme.md` schreibt für das Standardregister sogar „Mittel 14 bis 18 Wörter“ vor. Die Messung trifft also genau die Regel.

---

## 3 Die blinde Kritik: fünfzehn wiederkehrende Schwächen

Kurzfassung des unabhängigen Lektorats; die Belege tragen die Zeilen der Ink-Dateien.

1. **Vergleichsautomat:** rund 145 Vergleiche, alle aus derselben Stube (Tenne, Krämer, Andacht, Fuhrwerk), alle gleich groß und gleich gemütlich, zum Beispiel „wie einem Fohlen in seiner ersten Stunde“.
2. **„so …, dass“ als Messprotokoll** (45-mal): „so sorgfältig gemalt, dass an den Wimpern jeder Pinselstrich einzeln steht“.
3. **Nachgestellte Adjektivpaare** (etwa 45-mal): „kurz und trocken“, „lang und feucht“, „schwer und nass“, als Rhythmusfüller.
4. **Trommelschlag am Absatzende:** „Es frisst.“, „Der Knoten hält.“, „Blut.“ Einzeln wirksam, in Serie eine Maschine.
5. **Körperautomatik** (21-mal „bevor“ oder „ehe du“): „Deine Hand ist schon auf dem Weg zur Säge, bevor du sie losschickst.“ Ersatz für das verbotene Gefühlswort; die Figur wird zur Gliederpuppe.
6. **Verneinungslitanei** (54-mal „ohne“): „ohne Sonne, ohne Wolken und ohne Sterne“, „Kein Vorname, keine Jahreszahl, kein Gebet.“
7. **„X um X“** (29-mal): „Schnalle um Schnalle“, „Ader um Ader“ und „Lampe um Lampe“ stehen in drei Sätzen hintereinander.
8. **Ortsinventar mit Geruchstriade:** „nach A, nach B und darunter nach C“, danach eine Liste der Dinge; eine Kamerafahrt, keine Erzählung.
9. **Präpositionsauftakt:** 14 % der Sätze beginnen mit einer Ortsangabe, 42-mal „Hinter …“.
10. **Nur „und“, keine Logik:** *freilich, zwar, jedoch, indessen, nämlich, wohl, gleichsam* stehen jeweils 0-mal im Erzähltext. Der Erzähler registriert, er denkt nicht.
11. **Erzähler ohne Gesicht:** keine Ironie, kein Urteil, keine Jahreszahl, keine Abschweifung. „Sagt man“ dient nur als Dekor.
12. **Doppelpunkt als Gelenk** (122-mal außerhalb der Rede): „die Gelenke an ihren Händen: Sie ist eine Puppe“.
13. **Aphorismen-Pingpong im Dialog:** Kutscher, Gascoigne und Eileen reden alle in denselben Kalendersprüchen („Hier liest keiner. Hier sieht man.“, „Misstrauen hält länger als Mut.“).
14. **Requisiten-Echo statt Leitmotiv:** Verband 25-mal, Husten 21-mal, Räucherwerk 18-mal, „zieht die Luft ein, lange, durch die Nase“ sechsmal. Die Motive kehren wieder, verwandeln sich aber nicht.
15. **Registerbrüche** (auch aus Werkstatt-Texten): „im gotischen Baustil“, „ein rustikales, abgenutztes Schild begrüßt euch“, Optionen wie Formularfelder.

**Was gut ist und bleiben muss:**
- Der Kirchenanschlag mit den übereinandergeklebten, „jeder ein wenig gelber“ Datumsstreifen und der Kreidezeile „Er hatte keinen Durst.“ (`b_yharnam.ink`).
- Martha, die „mit zu viel Kümmel“ backt: ein ganzes Leben in einem Satz.
- Der Vertrag, bei dem einem am Satzende entgleitet, was in der Mitte stand.

---

## 4 Wo unsere Regeln die Formel selbst erzeugen

| Regel (Ort) | Erzeugt | Vorschlag |
|---|---|---|
| „Jede Szene: Ort mit Sinnen (Geruch, Geräusch, Kälte)“ (`CLAUDE.md`, Schreibregeln; `bb-game.md`; Regel R1) | Geruchstriade, Ortsinventar (3.8) | Streichen. Ersatz: „Ein Ort beginnt mit dem, was nur er hat: eine Geschichte, ein Name, ein Urteil.“ Sinne dann, wenn sie etwas erzählen. |
| „Szene endet auf Bild oder Tat“ (SKILL.md §5, R10, R13, hpl-horror) | Absatzpointen (3.4) | Höchstens eine Pointe je Szene; Absätze dürfen ausschwingen und in den nächsten fließen. |
| „Gefühl nur über den Körper“, „nie du hast Angst“ (R19, SKILL.md §4, hpl-horror Grundsatz 4) | Körperautomatik (3.5) | „Show, don't tell“ ist ein Dogma des 20. Jahrhunderts. Um 1800 benennt und urteilt der Erzähler. Erlauben; verboten bleibt nur, Entscheidungen des Spielers zu diktieren. |
| „Ein Vergleich je Absatz“, Vergleiche aus Handwerk, Wetter, Brauch (SKILL.md §2, stimme.md) | Vergleichsautomat (3.1) | Höchstens ein Vergleich je **Szene**, dann ein entlegener, gelehrter oder doppeldeutiger (Jean Paul, Hoffmann). |
| „Ein wenig zu genaues Detail“, „je Szene ein Fundstück“ (R4) | Messprotokoll, Requisiten-Echo (3.2, 3.14) | Als Ausnahme, nicht als Pflicht. |
| „Keine Gedankenstriche“ (SKILL.md §3, regeln.md) | Doppelpunkt- und Semikolon-Tic (3.12) | Aufheben: Der Gedankenstrich ist das Zeichen der Zeit (Kleist, Droste, Hoffmann). |
| „Kein Satz über etwa 30 Wörter“ (R8), B mit „Mittel 14 bis 18 Wörter“ (stimme.md) | Fehlende Periode (Abschnitt 2) | Streichen. Neues Ziel: Mittel um 25, mit starker Streuung. |
| „Sätze beginnen mit Ort, Zeit oder Ding“ (R7, SKILL.md §4) | Präpositionsauftakt (3.9) | Erzählersätze erlauben („Man muss wissen, dass …“, „Es war aber so, dass …“). |
| Füllwort- und Partikellisten (*scheinen, wohl, doch, eben* „sparsam“) | Tilgen *freilich, wohl, gar* aus der Erzählerrede (3.10) | Für den Erzähler freigeben, für Figuren je nach Stand. |
| `muster.md` (sechs Mustertexte) | Sie sind selbst moderne Workshop-Prosa mit denselben Tics | Ersetzen durch kommentierte Originalpassagen der Meister (gemeinfrei; das Zitierverbot gilt nur für Bloodborne). |
| Mustersätze in `stimme.md` (Kampfer, kalter Tee, „Kammern der Kranken“, „winzige Laterne“) | Sie wandern wörtlich in den Text | Griffe abstrakt beschreiben, keine Mustersätze. |
| „B fiebrig und nah als Standard“ | Überreizung als Normalzustand; das Fieber sticht nicht mehr hervor | Ein ruhig erzählendes Grundregister einführen, gegen das das Fieber absticht. |

Wichtig: Einige dieser Regeln stehen in `CLAUDE.md` unter „Schreibregeln“ und könnten deine eigenen sein. Ich ändere sie nicht, bevor du zustimmst (Häppchen 3 unten).

---

## 5 Was die Meister anders machen (und was wir übernehmen)

| Meister | Werk | Griff für uns |
|---|---|---|
| **Kleist** | *Das Bettelweib von Locarno*, *Michael Kohlhaas* | Eine einzige Periode trägt Ursache, Folge und Nebenumstand. Der erste Satz des Bettelweibs geht über fünf Zeilen mit vier Nebensätzen bis zum Doppelpunkt, dann folgt das Unheil als Amtsbericht. Modell für die Kirche (Register C) und für Kämpfe: Kausalsatz statt Fragment. |
| **Gotthelf** | *Die schwarze Spinne* | Rahmen (ein Tauffest, ein Großvater erzählt), Idylle vor dem Grauen (die Sonne „in klarer Majestät“ über dem engen Tal), ein Ding mit Geschichte (der schwarze Fensterpfosten) statt Inventar, Gemeinde als Gedächtnis, Konjunktiv I des Hörensagens (7,2 je 1.000 Wörter). Modell für Gerüchte und für die Chronik der Nacht. |
| **Droste-Hülshoff** | *Die Judenbuche* | Chronik mit Jahreszahl, Dorfgerede, Auslassung statt Pointe. Das Entscheidende geschieht zwischen den Absätzen; am Ende steht eine ungedeutete Inschrift („Wenn du dich diesem Orte nahest …“). Modell für Lore-Funde und das Kapitelende. |
| **E.T.A. Hoffmann** | *Der Sandmann* | Der Erzähler spricht den Leser an („günstiger Leser!“, „Geneigtester!“), grübelt über den richtigen Anfang, ist ironisch und unzuverlässig. Gedankenstriche (21,5 je 1.000 Wörter) und Ausrufe (11,1). Figuren mit Marotten statt Sentenzen. Der Blutminister ist reiner Coppelius-Stoff. **Das ist die „verspielte 1800er Art“.** |
| **Tieck** | *Der blonde Eckbert* | Märchenton, Wiederholung als Beschwörung (das Lied „Waldeinsamkeit“), ein einziger Name, den niemand wissen dürfte (Strohmian), trägt den Schock. Modell für Einsicht und Traum. |
| **Eichendorff** | *Das Marmorbild* | Lied, Mondnacht, gefährliche Schönheit im Garten. Modell für Jägertraum und Puppe. |
| **Storm** | *Der Schimmelreiter* | Mehrfacher Rahmen, Aberglaube gegen Vernunft, offenes Ende; Satzlänge im Mittel 49,5. Modell für Gilbert als Gewährsmann und für das Ludwig-Gerücht. |
| **Jean Paul, Hebel, Meyrink** (noch nicht gemessen) | *Siebenkäs*, *Unverhofftes Wiedersehen*, *Der Golem* | Jean Paul für kühne, gelehrte, witzige Vergleiche. Hebel für Jahrzehnte in einem Absatz (Chronik). Meyrink für hohe Einsicht: Häuser als Wesen, Traumlogik. |

**Was allen gemeinsam ist:** Ein Erzähler mit Haltung, der urteilt, vermutet und spottet. Satzbau mit logischen Gelenken. Wortschatz der Zeit in Maßen (*freilich, wohl, gar, indessen, dergleichen, Stube, Gesinde*). Seltene, dafür entlegene Bilder. Das Grauen kommt aus der Ruhe und der Ordnung des Berichts.

### Probe (aus dem blinden Lektorat, Absatz „Drinnen riecht es nach Karbol“)

> Drinnen empfängt dich jener Geruch, den man in Yharnam schlechthin meint, wenn man Klinik sagt: Karbol, das für Reinlichkeit bürgen soll, erkaltetes Wachs, und unter beidem, geduldig wie ein Gläubiger, das Eisen. Der Saal ist länger, als das schmale Haus von der Gasse her versprach. An beiden Wänden stehen Liegen, die meisten leer; auf einigen freilich ruht unter dem Laken etwas, das du für Schlafende nimmst, weil es sich so leichter denkt. Die Lampen geben gerade so viel Licht, wie einer braucht, der nicht stolpern will – man spart hier, wie es scheint, an allem außer am Blut –, und so bleibt die Ecke im Dunkeln, wo ein Eimer unter einem Tuch steht, dessen Zipfel wohl niemand mit Absicht hineingehängt haben wird. Auf den Borden zwischen den verhängten Fenstern drängen sich Flaschen, um die jeder Apotheker der Ebene das Haus beneiden müsste, und in manchen hat der Inhalt sich ungefragt in ein Oben und ein Unten geschieden. Neben der Tür hängt eine Schürze, steif vom Gebrauch, und indem du dich noch besinnst, von welchem, spricht am Ende des Saals schon jemand zu dir.

Was anders ist: Ein Erzähler, der die Stadt kennt und ihr misstraut, urteilt, vermutet („wohl … haben wird“) und spottet leise („geduldig wie ein Gläubiger“ meint den Frommen und den Schuldherrn zugleich). Perioden mit Gelenken (*freilich, so, indem*), eine Parenthese in Gedankenstrichen, ein einziger Vergleich, kein Pointenschluss.

---

## 6 Lore-Fehler: warum sie passieren und wie wir sie verhindern

**Der Fall Mond und Nacht.** Laut Lore-Archiv (`lore/kern.md`, `lore/welt/mechanik-und-welt.md` §9.7) spielt Kapitel 1 im Original am **Abend**:
- Der Sonnenuntergang kommt erst nach Gascoigne, beim Betreten der Oedon-Kapelle.
- Die Nacht kommt nach Amelia.
- Der Blutmond kommt nach Rom.

Zugleich zeigt laut Artbook „fast jedes Außenbild einen großen Mond“ (`lore/welt/aussehen.md`), und das ist das Bild, das Spieler im Kopf haben. Unser Text folgt der Spielmechanik (Abendsonne, eigenes Motiv der stehenden Sonne). Du erinnerst das Bild: ewige Nacht, großer, tiefer Mond. **Der Fehler liegt also nicht in einer falschen Tatsache, sondern in der fehlenden Abwägung zwischen Spielkanon und Spielgefühl**, und darin, dass ich dir diese Entscheidung nicht vorgelegt habe.

**Ursachen allgemein:**
1. Das Archiv ist groß (eine Wurzel, Kern, Lesepakete), aber ein **„Bild der Welt“ für das Auge** fehlt: was ein Spieler auf jedem Bildschirm sieht (Mond, Laternen, Kopfsteinpflaster, Särge an Ketten, Weihrauch, Gaslicht, Nebel).
2. Ich lade beim Schreiben nur, was eine Szene laut Plan braucht. Das **Gesamtgefühl** fällt dabei durch.
3. Es gibt keine Prüfung danach, die gezielt fragt: „Würde ein Kenner hier stutzen?“

**Gegenmittel (Vorschlag):**
1. **`lore/weltbild.md`:** 40 bis 60 Sätze „So sieht, hört und riecht sich Yharnam an“, aus Artbook, Spielgefühl und deinen Erinnerungen. Pflichtlektüre vor jeder Szene.
2. **„Nutzer-Kanon“** im selben Dokument: Wo du bewusst vom Spiel abweichst (zum Beispiel der Mond), steht das dort als Entscheidung und gewinnt.
3. **Kenner-Prüfung:** Nach jeder neuen Szene liest ein unabhängiger Agent sie mit Archiv und Weltbild und markiert alles, worüber ein Bloodborne-Kenner stolpern würde.

---

## 7 Bestand: Was an Sprachwissen da ist

| Baustein | Umfang | Taugt | Taugt nicht |
|---|---|---|---|
| Skill `erzaehlkunst-deutsch` (SKILL.md, regeln.md, wortschatz.md, muster.md, live-erzaehlen.md) | etwa 6.000 Wörter | Grammatik, Floskel-Liste, Du-Präsens ohne Anleitungston | Er ist auf moderne Spielleiter-Prosa zugeschnitten (kurz, sinnlich, „show, don't tell“). Daher kommen die meisten Formeln aus Abschnitt 4. |
| Skill `hpl-horror` (SKILL.md, lovecraft.md, gotik-volkskunde.md, buch-und-perspektive.md, bb-game.md) | etwa 5.300 Wörter | Architektur des Grauens, Treppe gotisch → kosmisch, Perspektiven, Dokumente | Wenig zur **Sprache** um 1800; „der Körper weiß es zuerst“ verstärkt die Körperautomatik. |
| `docs/stimme.md` | etwa 600 Wörter | Drei Register, Optionen im Satz | Satzlängen modern; Mustersätze wandern wörtlich in den Text. |
| Stilprüfer `tools/stil.mjs` | prüft Stakkato, lange Optionen, Vergleiche | Fängt grobe Fehler | Misst nicht, was gute Prosa ausmacht (Perioden, Gelenke, Erzählerwörter, Streuung). |
| Lesekorpus | **fehlt** | | Ich schreibe aus dem Gedächtnis über Vorbilder, ohne sie beim Schreiben vor Augen zu haben. |

---

## 8 Plan Phase 2 (nach deinem „ja“)

1. **Bibliothek im Repo** (`.claude/skills/stil-1800/korpus/`). Gemeinfreie Volltexte: die sieben gemessenen plus Hoffmann (*Die Elixiere des Teufels*, *Das Fräulein von Scuderi*), Jean Paul, Hebel, Hauff (*Das kalte Herz*), Meyrink (*Der Golem*), Droste (*Der Knabe im Moor*) und Lovecraft in guter deutscher Übertragung, soweit gemeinfrei. Dazu je Werk eine Seite „Griffe“ mit kurzen Originalstellen und Analyse.
2. **Neuer Skill `stil-1800`** statt Flickwerk:
   - die Erzählerhaltung (Hoffmann, Gotthelf);
   - der Satzbau (Periode, Gelenke, Gedankenstrich, Parenthese);
   - die Wortkammer (Erzählerwörter, Wortschatz der Zeit, Gegenwartswörter, die verboten sind);
   - das Bild (selten, kühn, gelehrt, doppeldeutig);
   - Dialog nach Stand und Marotte statt Sentenz;
   - Gerücht und Chronik (Konjunktiv I, Jahreszahl, Auslassung);
   - das Unheimliche als Leseerfahrung;
   - Bloodbornes Ton als Brücke: Erhabenes, Liturgisches, Ellipse.

   Mit Mustern aus den Originalen, nicht aus meiner Feder.
3. **Alte Regeln umbauen** nach Abschnitt 4: Formeln streichen, `muster.md` ersetzen, `stimme.md` neu fassen (ein ruhiges Grundregister, Satzlängen nach den Meistern).
4. **Stilprüfer v2:** misst die Werte aus Abschnitt 2 je Szene gegen einen Zielkorridor der Meister. Er warnt bei Stakkato, Pointenschluss, Vergleichsdichte, „X um X“, „so …, dass“, Adjektivpaaren und fehlenden Gelenken.
5. **Weltbild und Kenner-Prüfung** nach Abschnitt 6.
6. **Probe zuerst:** Der Prolog (Kutsche, Klinik) wird in der neuen Kunst neu geschrieben, mit deinen bisherigen Änderungen als Pflicht. Du liest und urteilst, erst dann folgt der Rest von Kapitel 1, Szene für Szene.

Ehrlich: Ein Sprachmodell wird nicht von selbst zu Kleist. Was hilft, sind drei Dinge zusammen: die Vorbilder beim Schreiben vor Augen, Regeln, die das Richtige messen statt der modernen Formel, und dein Urteil an jeder Probe.
