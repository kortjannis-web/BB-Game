# Faktencheck und Lektorat Kapitel 1

Stand 2026-11-05. Geprüft: `story/kapitel1/*.ink`, `story/traum.ink`, `story/system.ink`, `web/notizbuch.js` gegen `lore/kern.md`, `lore/kapitel/kapitel1.md` (Lesepaket mit Wissenssperre), die dort genannten Lore-Dateien, RK1 (`docs/recherche/kapitel1.md`) und `docs/stimme.md`. Unabhängige Prüfung, kein Urteil des Autors vorgegeben. Nur gelesen, nichts gespielt; Ink-Bedingungen sind am Quelltext nachvollzogen, nicht im Browser getestet.

Form: Jeder Befund nennt Knoten/Stitch mit kurzem Anker aus unserem Text, das Problem, den Beleg und eine Umsetzungsanweisung. Schwerste Befunde je Abschnitt zuerst. Textvorschläge sind eigene Worte, keine Spielzitate.

---

## Übergreifend

### Struktur, Neulinge, Leitmotive

1. **Das Ziel der Nacht fehlt.** Ein Neuling erfährt nur: bleiches Blut suchen, die Kirche weiß vielleicht etwas, die Kathedrale liegt oben. Warum er jagen soll und wann die Nacht endet, sagt ihm nichts in der Welt. Kanon: Im Haus des Traums liegt ein Blatt beim Altar: Wer dem Traum entkommen will, muss die Quelle der Seuche beenden, sonst dauert die Nacht ewig. Beleg: `welt/notizen.md` (LK §21.2, Nr. 3), `orte/jaegertraum.md` (LK 7.1.1). Das Lesepaket erlaubt Nr. 1 bis 4.
   **Umsetzung:** In `traum.ink`, Knoten `gehrman`, beim ersten Besuch der Werkstatt (beide Zweige `gehrman == 1`) einen Satz zum Altar im hinteren Raum und darauf einem Blatt in fremder, alter Hand: Man müsse der Seuche die Quelle nehmen, sonst gehe diese Nacht nicht vorbei. Als Fundstück in Stimme A, Präteritum für den Schreiber, ohne Kommentar. Neuer Tag `# lore: ende_der_nacht`, Eintrag im Notizbuch. Gehrmans Antwort „Wenn die Nacht vorbei ist“ bekommt damit ihren Gegenpol.

2. **Die Brücke führt nicht dahin, wohin Gilbert sie schickt, und niemand sagt warum.** Gilbert nennt die große Brücke als Weg zur Kathedrale; nach der Kleriker-Bestie führen aber nur Treppen hinab in die Unterstadt (`n1_kleriker.ink`, `uebergang`). Kanon: Die Kirche hat beim Beginn der Jagd die Große Brücke gesperrt und die Bürger sich selbst überlassen, während der alte Stadtteil in jener Nacht brannte (Notiz Nr. 2). Die Brücke ist im Original eine Sackgasse, der Weg zu Gascoigne geht unten herum. Beleg: `welt/notizen.md` (LK §21.1, Nr. 2), `orte/zentral-yharnam.md` (LK 7.1.2), RK1 §4 und §8, `figuren/gilbert.md` (LK §24.12: Ist die Brücke gesperrt, nennt er einen anderen Weg).
   **Umsetzung:** (a) In `k1_n1_kleriker.uebergang` vor den Treppen ein Tor am Brückenende zeigen, von der anderen Seite verriegelt, frische Ketten an alten Angeln; nur die Treppen hinab bleiben. (b) Die Notiz Nr. 2 als Fundstück in Zentral-Yharnam einbauen (siehe `b_yharnam.ink` Nr. 6). (c) Im Lesepaket unter „Bekannte Abweichungen“ eintragen: Bei uns ist die Brücke der Übergang zur Unterstadt.

3. **Das Blut heilt, aber der Text sagt nie, was es mit dem Fieber gemacht hat.** Der Prolog baut das Fieber auf („seit Wochen“, „vor dem Winter“), danach kommt es nie wieder vor. Das Wort Blutministration fällt kein einziges Mal. Für Neulinge fehlt damit der Schlüssel, warum die ganze Stadt am Blut hängt (es wirkt, und man will mehr). Beleg: `lore/kern.md` (Blutministration, Abhängigkeit), `figuren/blutminister.md` (LK §24.12: das Blut als Handel der Stadt und einziges Heilmittel), `gegenstaende/yharnam-und-blut.md` (Blood Vial: jede weitere Infusion lässt die erste nachklingen).
   **Umsetzung:** Siehe `a_ankunft.ink` Nr. 2 und 3 und `system.ink` Nr. 3.

4. **Die freie Mitte (Teil B) hat keinen Spannungsanstieg.** Acht Ziele stehen gleichzeitig offen; die Wiederkehrtexte von `k1_hub_b` und `k1_hub_c` sind Zufallsfolgen (`{~...}`), die Stadt verändert sich nicht mit dem, was der Spieler tut. Einzige Steigerung ist das Kreischen. Nach Martha, nach dem Mädchen, nach Gascoignes Verwandlung an den Gräbern bleibt Zentral-Yharnam gleich.
   **Umsetzung:** In `k1_hub_b` die Zufallsfolge durch zustandsgebundene Sätze ersetzen, je einer, der nach einem Ereignis einmal kommt: nach `mob_verbrannt` (verkohlte Fackel vor einer Tür, die Läden der Bäckerei zu), nach `spieluhr` (die Spieluhr in der Tasche klickt beim Gehen), nach `gascoigne2` (eine Glocke, die nicht aufhört), nach `schreie == 2`. Die Zufallssätze nur noch als Rest, wenn nichts Neues vorliegt.

5. **Eileen hat drei Auftritte, der Nutzer hat zwei entschieden.** Dach über dem Kanaleingang, Dach über den Gräbern, und im Nachspiel steht sie sichtbar am Grab, legt ein Abzeichen ab, dreht sich weg oder tippt an die Maske (`d_nachspiel.ink`, `eileen_danach`). Auch `docs/kapitel1-struktur.md` §3 führt „Nachspiel (Urteil)“ als dritte Station. Beleg: `CLAUDE.md` (Entscheidungen: in Kapitel 1 zwei Begegnungen), `docs/kapitel1-struktur.md` §9.
   **Umsetzung:** Siehe `d_nachspiel.ink` Nr. 1. In `kapitel1-struktur.md` §3 die dritte Station streichen.

6. **Zu viele Spielbegriffe fallen dem Jäger als Eingebung zu.** Dreimal dasselbe Mittel: „Boten, denkst du, ohne zu wissen, woher dieses Wort kommt“, „Blutechos. Das Wort liegt dir auf der Zunge“, „Einsicht. Das Wort ist einfach da“. Das ist das Spiel, das dem Spieler Begriffe beibringt, nicht ein Buch. Beleg: `docs/stimme.md` (A: nie Spielbegriffe; B: nie Erklärungen dessen, was die Szene gezeigt hat).
   **Umsetzung:** Höchstens einmal behalten (die Boten, weil es ein Name ist). Echos und Einsicht im Text nur zeigen; den Namen tragen Notizbuch und Figuren (die Puppe spricht ohnehin von dem, „was aus ihnen aufsteigt“). Einzelheiten in `a_ankunft.ink` Nr. 5 und `n1_kleriker.ink` Nr. 6.

7. **Kampfoptionen nennen die Richtung oft nicht.** Entscheidung des Nutzers: Kampfoptionen nennen die Richtung ausdrücklich. Verstöße: „Zur Seite ausweichen“ (`k1_klinik_kampf`), „Zur Seite, im letzten Moment“ (`k1_c_kanal.kampf`), „Zur Seite rollen“ und „Sofort zur Seite springen“ (`k1_n1_kleriker.kampf` t4, t6), „Seitlich weg“ (`k1_n2_gascoigne` t4). Beleg: `CLAUDE.md` (Abfragerunde 2026-11-04).
   **Umsetzung:** Jede dieser Optionen mit links/rechts/vorn/hinten benennen, passend zum Anzeichen (beim Klinikkampf steht „nach links“ schon im Folgetext).

8. **Viele Optionen sind noch alte Form oder ein einzelnes Wort.** Einzelwörter verbietet die Stimm-Bibel ausdrücklich: „Nicken“, „Gehen“, „Zurück“, „Nein“, „Schweigen“, „Genug“, „Feuer“, „Noch nicht“, „Umkehren“. Dazu Optionen mit Doppelpunkt und Spielwert („Die Pistole: genau“) und Ladenoptionen mit Preisen. Beleg: `docs/stimme.md` (Optionen: 2 bis 7 Wörter, nie ein einzelnes Wort, nie ein Meta-Verb), `docs/stand.md` (Baustelle bekannt).
   **Umsetzung:** Beim Neuschreiben jeder Szene mitziehen; die schlimmsten Stellen stehen in den Dateiabschnitten.

9. **Die Sonne, die nicht untergeht, wird vom Erzähler zu Tode gesichert.** Das Motiv ist stark, aber dreimal behauptet der Erzähler, was er nicht wissen kann: „Sie wird nicht untergehen“ (`k1_d_rueckweg`), „Sie wird es nicht“ (`tod`, Ort Grab), dazu das Notizbuch. Kanon: Der Sonnenuntergang beginnt nach Gascoigne beim Betreten der Oedon-Kapelle; Kapitel 2 braucht die Tür offen. Beleg: `lore/kapitel/kapitel1.md` (Zeit und Weltzustand).
   **Umsetzung:** Nur Wahrnehmung, keine Gewissheit: Du wartest darauf, dass sie sinkt, und sie sinkt nicht. Siehe `d_nachspiel.ink` Nr. 6, `system.ink` Nr. 1.

10. **Lose Fäden.**
    - Weihrauch beim Weg `grund == "suche"`: Der Brief roch nach Weihrauch, Gilbert sagt, Weihrauch rieche man nur oben bei der Kathedrale, der Anschlag riecht danach, und dann riecht die Bestie Gascoigne danach („So roch der letzte Brief“). Damit rückt Gascoigne in die Nähe des gesuchten Menschen, was nirgends aufgelöst wird. Siehe `n2_gascoigne.ink` Nr. 5.
    - „Was hat Gehrman unterschrieben?“ (`notizbuch.js`, FRAGEN) baut einen Faden, den der Kanon nicht einlösen kann, ohne Gesperrtes zu öffnen. Siehe `traum.ink` Nr. 6.
    - Violas Spur: Die betende Frau sagt, die Dame mit der Brosche habe nach dem Weg zu den Gräbern gefragt. An den Gräbern findet sich keine Spur von ihr, erst auf dem Dach die Leiche. Siehe `c_unterstadt.ink` Nr. 4.
    - Birne doppelt: Gilberts Birnbaum und Gascoignes Birnenbranntwein. Wenn das kein gewollter Bezug ist, verwischt es beide Figuren. **Umsetzung:** Einen der beiden ändern (Gascoignes Branntwein nach etwas Fremdem, das zu seinem Akzent passt, etwa Torf oder Rauch) oder den Bezug einmal sichtbar machen.

11. **Kanonische Kernsätze der Figuren fehlen.** Zusammengefasst, Einzelheiten in den Dateien: der „böse Traum“ des Blutministers ist zum „Fieber“ geworden; Iosefkas Hoffnung auf das Ende der Nacht fehlt; Eileens Warnung (keine Menschen mehr hier, Jäger überlass ihr) fehlt; das Mädchen erkennt den Jäger nicht am Geruch, und sein Satz über den Morgen fehlt; Gascoignes Satz in der zweiten Phase (das süße Blut singt, ihm wird übel) fehlt; die Puppe sagt nicht, dass die Gräber für frühere Jäger stehen; Gehrman sagt nicht, dass die Jäger hier Blut für Waffen und Fleisch nahmen.

12. **Die Dokumente widersprechen dem Text.** `docs/kapitel1-struktur.md`: Moment der Klarheit „Freundschaft ≥ 2“ (Code: `gascoigne >= 3`); Gascoigne „5 Takte“ (Code: 9); Jägermarken „Echos bleiben“ (Kanon: Echos gehen verloren, unmarkiert); Eileen dritte Station. Das Lesepaket führt unter „Bekannte Abweichungen“ nicht: Brücke als Übergang, Iosefkas Tür im Inneren der Klinik, Gascoigne per Zuruf statt per Glocke, Jägermarke ohne Kosten, Band des Mädchens von Anfang an rot.
    **Umsetzung:** Beide Dateien nachziehen, sobald die Befunde unten entschieden sind.

---

## a_ankunft.ink

1. **`k1_klinik`, Anker „Am Ende war alles nur das Fieber.“** Der kanonische Satz des Blutministers lautet sinngemäß: Was auch geschieht, halte es für einen bösen Traum. Aus dem Traum ist das Fieber geworden. Damit fehlt die Saat für den Jägertraum, für die Jägermarke (Kanon: man erwacht, als wäre alles nur ein böser Traum gewesen) und für sein Lachen. Beleg: `figuren/blutminister.md` (LK 5.1, LK §24.12), `gegenstaende/jaeger-und-werkstatt.md` (Hunter's Mark), RK1 §1 (sicher).
   **Umsetzung:** Den Satz auf den Traum zurückführen, eigene Worte, etwa: Was dir heute Nacht begegnet und es nicht geben dürfte, das nimmst du am Morgen für einen schlechten Traum. Danach das Lachen. Das Fieber kann im ersten Satz („mit Fieber in den Augen“) bleiben.

2. **`k1_klinik`, Rede des Blutministers.** Die Behandlung bekommt keinen Namen, und sein kanonischer Inhalt fehlt: Die Seuche der Heimat verschone kaum einen, das Blut sei, womit Yharnam handle, und das Einzige, das heile; danach sei man wie neu. Für Neulinge ist das der Schlüssel zur Stadt. Beleg: `figuren/blutminister.md` (LK §24.12), `lore/kern.md`.
   **Umsetzung:** Vor „Erst die Papiere“ ein, höchstens zwei Sätze in seiner glatten Stimme: Draußen sterbe man an so etwas, hier lasse man es sich ausbluten; hier heiße das Ministration, und die Stadt lebe davon. Das Wort einmal, beiläufig, als Fachwort aus seinem Mund.

3. **`k1_erwachen`, Anker „Dein Arm pocht dort, wo die Nadel war“.** Was das Blut getan hat, bleibt offen: Ist das Fieber weg? Der Grund `heilung_selbst` hat im ganzen Kapitel keine Folge. Beleg: `gegenstaende/yharnam-und-blut.md` (Blood Vial), `lore/kern.md`.
   **Umsetzung:** Nach dem Satz zum Arm: Das Fieber ist fort. Zum ersten Mal seit Wochen ist dein Kopf klar, so klar, dass es dich erschreckt, und unter der Klarheit liegt ein Hunger, der nicht nach Brot fragt. Für `grund == "heilung_selbst"` einen Halbsatz: Du bist gekommen, um zu genesen, und bist genesen, und weißt nicht, ob das eine gute Nachricht ist.

4. **`k1_traum_erst`, Feuerwaffe.** „Dazu eine Feuerwaffe“ (Einzahl), danach stehen zwei zur Wahl. Die Optionen „Die Pistole: genau“ und „Die Donnerbüchse: streut, hält auf Abstand“ sind Spielwerte mit Doppelpunkt, ohne `#fliesst`. Verschenkt ist die Lore der Werkstatt-Feuerwaffen: Ihre Quecksilberkugeln werden mit dem Blut des Trägers verschmolzen. Beleg: `gegenstaende/jaeger-und-werkstatt.md` (LK §19), `docs/stimme.md` (Optionen).
   **Umsetzung:** „Dazu halten dir zwei Hände je eine Feuerwaffe hin.“ Optionen: „Nach der schweren Pistole greifen #fliesst“, „Die kurze Büchse mit dem Trichter nehmen #fliesst“. Im Folgetext ein Bote, der dir mit einer Nadel in die Fingerkuppe sticht und den Tropfen auf eine Kugel aus Quecksilber reibt; zeigen, nicht erklären.

5. **`k1_klinik_kampf.sieg`, Anker „Blutechos. Das Wort liegt dir auf der Zunge“**, dazu `k1_traum_erst` „Boten, denkst du, ohne zu wissen“. Siehe Übergreifend Nr. 6.
   **Umsetzung:** Den Satz mit „Blutechos“ streichen; der Schimmer und das Gefühl, satt zu sein, reichen. Die Boten können bleiben.

6. **`k1_iosefka`, beide Optionen.** Iosefkas kanonische Wärme fehlt: Sie hofft, dass man sich nach dem Ende der Nacht ins Gesicht sehen kann, sie sollte das nicht denken und freut sich trotzdem, und sie wünscht dem Jäger Licht. Auf Schläge gegen die Tür fragt sie im Kanon, warum er sich wie ein Tier benimmt, er jage doch Bestien, das sei nicht er. Bei uns trägt nur das „Das notiere ich“ (erfunden) ihre Stimme, und genau an ihr soll Kapitel 2 die Hochstaplerin messen. Beleg: `figuren/iosefka.md` (LK §24.12), CLAUDE.md (Figuren lebendiger als im Original).
   **Umsetzung:** In „Höflich bitten“ nach der Feder einen Satz: Wenn diese Nacht vorbei ist, öffne sie die Tür, und dann wolle sie das Gesicht sehen, das so höflich war; sie sollte das nicht sagen. Nach der Phiole als letzte Worte einen kurzen Segen um Licht für die Nacht. In „Gegen die Tür schlagen“ zuerst ihre Frage, ob das wirklich der sei, der für die Stadt jage, oder etwas, das die Jagd aus ihm gemacht habe; danach erst das kühle „Das notiere ich“.

7. **`k1_klinik`, Anker „Man legt dich auf eine Liege; wer, siehst du nicht.“** Das Artbook gibt für die Transfusion einen schweren Holzstuhl mit Riemen und einen Infusionsständer mit zwei Flaschen, für den Raum Regale voller Flaschen und einen Seziertisch. Beleg: `orte/iosefkas-klinik.md` (LK §25.3).
   **Umsetzung:** Statt der Liege der Stuhl: Riemen über Handgelenke und Brust werden geschlossen, Schnalle um Schnalle, von Händen, die du nicht siehst; über dir zwei Flaschen an einem Ständer, eine leer, eine dunkel. Das Ortsbild im ersten Absatz um ein Regal voller Flaschen ergänzen.

8. **`k1_klinik_kampf`, Optionen.** „Zur Seite ausweichen“ nennt keine Richtung; alle drei Takte sind alte Optionen ohne `#fliesst`. Beleg: Übergreifend Nr. 7, 8.
   **Umsetzung:** „Nach links ausweichen“, die übrigen beim Neuschreiben in den Satz fließen lassen.

9. **`k1_erwachen`, dritte Option, Anker „Es hilft nichts. Sie riecht dich“.** Die Bestie ist durchgehend „es“, hier plötzlich „sie“ ohne Bezugswort.
   **Umsetzung:** „Es riecht dich, es riecht das neue Blut in deinen Adern.“

10. **`k1_erwachen`, Zettel, und `k1_klinik`, Option „Erst lesen“.** Die Deutung, der Jäger habe den Zettel selbst geschrieben, ist laut RK1 §1 [Deutung], unsicher. Der Text legt sie an drei Stellen nahe (Hand wie deine, Schrift im Vertrag wie deine, Notizbuch zweimal). Dreimal gezeigt wird eine Deutung zur Tatsache. Kanon: Der Zettel liegt auf dem Stuhl rechts, nicht an der Wand. Beleg: RK1 §1, `welt/notizen.md` (LK §21.1, Nr. 1).
   **Umsetzung:** Den Satz „Die Hand, die es schrieb, hält den Stift so, wie du ihn hältst“ streichen und nur im Vertragszweig „wach“ behalten. Den Zettel auf den Stuhl neben dem Lager legen, als habe ein Besucher ihn dort vergessen. In `notizbuch.js` die Stufe `k1_erwachen` ohne „Die Schrift sah aus wie meine“.

11. **`k1_iosefka`, Kopf.** Im Kanon spricht man Iosefka von außen an der Kliniktür, nach dem ersten Traum. Bei uns innen, vor der ersten Laterne. Dazu „Besser als das, was die Kirche ausgibt“ (Erfindung). Beides unmarkiert. Beleg: RK1 §3.
    **Umsetzung:** `// [ERWEITERT]` für Ort und Vergleich setzen und im Lesepaket unter Abweichungen eintragen. Kein Textumbau nötig.

---

## b_yharnam.ink

1. **`k1_b_maedchen`, Anker „hängt das Ende eines roten Bandes“.** Kanon: Das Mädchen trägt eine große **weiße** Schleife; rot ist das Band erst, als das Schwein es fallen lässt, durchtränkt von Blut, und die Boten tragen es als Trauerzeichen. Unser Band ist von Anfang an rot. Damit ist die stärkste Verwandlung der Nebenhandlung (weiß wird rot) verschenkt, und der Fund im Kanal zeigt nichts Neues. Beleg: `figuren/maedchen-und-viola.md` (LK §17.4 Nr. 3, 4, 6), RK1 §6. Die ältere Schwester bleibt gesperrt; die Farbe der Schleife ist es nicht.
   **Umsetzung:** Am Riegel eine weiße Haarschleife. In `c_unterstadt.ink` (`k1_c_kanal`) und `d_nachspiel.ink` (`k1_d_kanal`) hängt aus dem Maul des Schweins ein Band, rot und schwer, nur am Knoten noch ein Fingerbreit weiß. In `k1_d_maedchen` „Das rote Band hängt noch am Riegel“ zu weiß, ebenso in `zustand.ink` (Kommentar zu `band`) und in `notizbuch.js` (`familie_gascoigne`, PERSONEN „Das Mädchen“). Nach dem Tod heißt es im Text dann „das rote Band“.

2. **`k1_b_scheiterhaufen.gascoigne_greift_ein`, Zweig `mob == "zerstreut"`.** Gascoigne kniet neben Martha, die du eben verbrannt hast, sagt „So.“, und dann läuft dieselbe Szene wie im freundlichen Zweig: Namensfrage, Parade, Blechflasche, Bitte an seine Frau, Einladung zur Brücke. Das ist unglaubwürdig und nimmt der „Wärme, die zerbricht“ ihren Wert, weil sie nichts kostet. Beleg: CLAUDE.md (Gascoigne: Wärme, die zerbricht).
   **Umsetzung:** Im Zweig `zerstreut` die Blechflasche weglassen und die Parade kalt geben: Er zeigt es dir, damit du beim nächsten Mal kein Feuer brauchst, und sieht dich dabei nicht an. Die Bitte an Viola bleibt, aber begründet: Er hat niemand anderen in dieser Nacht. Die Einladung zur Brücke nur bei `gascoigne >= 0`. Bedingungen um die Flaschenzeile und um `# quest: gascoigne_bruecke`.

3. **`k1_b_gilbert.themen`, „Nach den Jägern der Kirche fragen“, Anker „Seine Klinge soll im Dunkeln geleuchtet haben wie ein Stück vom Mond“.** Die leuchtende Klinge ist Ludwigs Mondlichtschwert aus dem Zusatzinhalt; dessen Itemtext sagt, kaum jemand habe es gesehen. Ein Volkslied darüber widerspricht dem, und das Lesepaket nimmt für Ludwig ausdrücklich nur `fraktionen/jaeger.md`, nicht die DLC-Datei. Der Mond ist zudem ein kosmischer Hinweis, der hier zu deutlich wird. Dazu „Kein Adliger, einer aus den Gassen“: nicht belegt (eigenes PRÜFEN). Beleg: `gegenstaende/heilende-kirche.md` (Holy Moonlight Sword, Sword Hunter Badge, Yharnam Hunter Set), `lore/kapitel/kapitel1.md` (Gegenstände, Ludwig).
   **Umsetzung:** Die Mondklinge streichen. Stattdessen das silberne Schwert als Zeichen seiner Jäger: Auf seinen Abzeichen sei ein Schwert aus Silber gewesen, und die Leute hätten es auf ihre Türen gemalt, bis sie es wieder abkratzten. Das ist Kanon und wird auf der Brücke geerntet, wenn das Abzeichen im Fell der Bestie liegt. „Aus den Gassen“ streichen; die Anwerbung von Fuhrknechten und Gerbern bleibt (Yharnam Hunter Set: Ludwig warb Bürger an).

4. **`k1_b_gilbert`, Anker „Gilbert steht schon am Gitter“ und `geschenk`, „Das Gesicht verschwindet vom Gitter. Drinnen wird ein Stuhl gerückt, dann schleift Schweres“.** Kanon: Gilbert kann nicht aufstehen. Beleg: `figuren/gilbert.md` (LK §24.12).
   **Umsetzung:** „Gilbert sitzt schon am Gitter, den Stuhl dicht ans Fenster gerückt.“ Im Geschenk: Der Tank steht seit Wochen unter dem Fensterbrett, er angelt ihn mit dem Stock heran und schiebt ihn mit beiden Händen durch die Stäbe; der Husten danach dauert länger. Im ersten Besuch „Er legt die Hand an einen Stab“ bleibt.

5. **`k1_b_scheiterhaufen`, Gascoignes erster Auftritt.** Der Geruch fehlt. Kanon: Seine Kleidung ist von Bestiengestank durchdrungen, der an ihm zehrt; das ist das Detail, das seine Geschichte trägt. Eileen sagt später „Merk dir, wie er riecht“, das Notizbuch behauptet „Er riecht nach Blut, mehr als ein Jäger sollte“, die Szene selbst zeigt nichts davon. Beleg: `gegenstaende/jaeger-und-werkstatt.md` (Gascoigne's Set), `figuren/gascoigne.md` (Als Boss, „Das Detail, das die Geschichte trägt“).
   **Umsetzung:** Beim Händedruck oder bei der Flasche ein Satz: Unter Teer und Branntwein riecht er nach etwas anderem, nach nassem Fell in einem geschlossenen Flur, und er merkt, dass du es merkst, und tritt einen halben Schritt zurück. Im Zweig mit Wendels Mantel prüfen, dass sich die Gerüche nicht stapeln.

6. **Neues Fundstück fehlt: das dunkle Haus mit der Notiz Nr. 2.** Kanon: Im Dunklen Haus nahe der ersten Laterne, im ersten Stock neben einem Rollstuhl-Bürger, liegt der Zettel, dass die Kirche bei Beginn der Jagd die Bürger im Stich ließ und die Brücke sperrte, während der alte Stadtteil brannte. Das ist der Gegenpol zum Anschlag („Die Jäger der Kirche wachen über euch“) und der Schlüssel zu Übergreifend Nr. 2. Der Rollstuhl-Bürger (Wahnlachen, atmet nur durch den Mund) ist ungenutzt. Beleg: `welt/notizen.md` (LK §21.1, Nr. 2), `gegner/rollstuhl-mob.md` (LK §20.2). Wissenssperre: erlaubt.
   **Umsetzung:** Eine Option in `k1_hub_b` („Das Haus mit der offenen Tür neben der Laterne #fliesst“) und ein kurzer Stitch: Treppe, Staub, im ersten Stock ein Rollstuhl mit einer Gestalt darin, die durch den offenen Mund atmet und lacht, als du kommst; auf dem Regal daneben der Zettel. Zettel in Stimme A, ein Bürger als Schreiber, Präteritum, bitter, drei Sätze. Den alten Stadtteil nicht beim Namen nennen, nur „unten im Tal, wo die Stadt früher war“. Kampf mit dem Rollstuhl-Bürger als ein Takt oder ausweichbar. Tag `# lore: kirche_sperrt_bruecke`, Notizbuch-Eintrag. Die Ähnlichkeit zum Rollstuhl des Blutministers nur stehen lassen, nie aussprechen (RK1 §1: Deutung).

7. **`k1_b_eileen`, erste Begegnung.** Ihre zwei kanonischen Kernaussagen fehlen: Hier gebe es keine Menschen mehr, nur fleischhungrige Bestien; und ein Jäger solle Bestien jagen und die Jäger ihr überlassen. Damit ist „Jägerin der Jäger“ nur über die Abzeichen erzählt. Der Kommentar „PRÜFEN: Was Eileen im Kanon über den Traum weiß“ ist lösbar: Sie kennt ihn (grüßt die kleine Puppe). Beleg: `figuren/eileen.md` (LK 5.1, LK §24.12).
   **Umsetzung:** Nach „Riecht man.“ ein Satz in ihrer Kürze: Menschen gebe es hier keine mehr, nur Hunger mit Gesichtern. Vor dem Sprung aufs Nachbardach: Bestien jagst du, Jäger jag ich. Das PRÜFEN durch `// [KANON lore:figuren/eileen]` ersetzen.

8. **`k1_b_eileen`, Jägermarken, Anker „Zerdrücken, und du wachst im Garten auf. Ohne vorher zu sterben.“** Kanon: Wer sich auf die Marke konzentriert, verliert alle Blutechos und erwacht, als wäre alles nur ein böser Traum gewesen. Bei uns kostet die Marke nichts (`docs/kapitel1-struktur.md`: „Echos bleiben“), unmarkiert. Beleg: `gegenstaende/jaeger-und-werkstatt.md` (Hunter's Mark).
   **Umsetzung:** Kanon übernehmen: Eileen sagt dazu, es koste alles, was du an Blut bei dir trägst. In `n1_kleriker.ink` und `n2_gascoigne.ink` (`marke`) `~ echos = 0` ohne Fleck und ein Satz, dass die Echos auf der Brücke bleiben, ohne Spur. Wenn der Nutzer es anders will: `// [ERWEITERT]` und Lesepaket-Abweichung.

9. **`k1_b_anschlag`, Anker „ein Kelch mit Strahlen darüber“.** Das Archiv kennt kein Zeichen der Heilenden Kirche. Ein Kelch zeigt auf die Kelche des Labyrinths und damit auf die Herkunft des Alten Bluts, die in Kapitel 1 gesperrt ist; Gehrman bringt den Heiligen Kelch erst nach Gascoigne. Beleg: `lore/kapitel/kapitel1.md` (Wissenssperre: Herkunft des Alten Bluts gar nicht; Gehrman nach Gascoigne nicht), eigenes PRÜFEN.
   **Umsetzung:** Das Siegel unbestimmt lassen: rotes Wachs, darin ein Zeichen, so oft gestempelt, dass es sich abgenutzt hat. `// [ERWEITERT]`, PRÜFEN streichen.

10. **`k1_b_gilbert.themen`, „Nach dem bleichen Blut fragen“.** Es fehlt Gilberts kanonischer Hinweis, warum gerade diese Nacht zählt: Die Leute hier teilen nichts mit Fremden, aber in einer Jagdnacht liegen die Dinge anders; dazu die Kathedrale im Osten des Tals. Für Neulinge ist das der Grund, hinauszugehen statt zu fliehen. Beleg: `figuren/gilbert.md` (LK §24.12).
    **Umsetzung:** Vor dem Schulterzucken ein Satz: Einem Fremden sagt hier keiner etwas, in gewöhnlichen Nächten; eine Jagdnacht ist keine gewöhnliche, da stehen Türen offen, die sonst zu sind, nur nicht die, an die man klopft. Die Himmelsrichtung „drüben im Osten des Tals“ einfügen.

11. **`k1_b_tueren`, Bürgerstimmen.** Vier Stimmen (Mann, Lacher, alte Frau, Betende, junge Stimme), das Archiv hat mehr und bessere: die Gesundheitslüge (alle gesund, nicht einmal ein Schnupfen), die Alte, die fragt, ob man das Murmeln vom Friedhof höre, bald sei es so weit; die Frau, die bittet, nicht zu klopfen, jeder Laut bringe Unglück; die Mutter, die nach ihrem Kind ruft. Das Friedhofsmurmeln wäre Saat für die Gräber. Beleg: `figuren/buerger.md` (LK §22.1, Haltungen 2, 4, 5, 3).
    **Umsetzung:** Eine wiederholbare Option „Weiter an den Türen klopfen #fliesst“ mit Sequenz (`{&...}` oder `{stopping}`), je Besuch eine Stimme: erst die Gesundheitslüge, während dahinter jemand hustet; dann das Friedhofsmurmeln; dann die Bitte um Stille. Eigene Worte.

12. **`k1_b_scheiterhaufen`, Mob.** Die Menge murmelt nur; rufen tut ein Kind. Kanon: Die Jagdmeute schreit, der Fremde trage die Krankheit, man solle ihn verbrennen, er sei eine verfluchte Bestie. Das ist der Schlüssel für Neulinge, warum sie dich angreifen. Beleg: `gegner/jagdmeute.md` (LK §20.1), `figuren/buerger.md` (LK §22.2). Den Ruf mit dem Namen Willem nicht verwenden (Wissenssperre).
    **Umsetzung:** Nach „Dann dreht sich der Erste zu dir um“ zwei Rufe, kurz: einer, dass der da die Seuche an sich trage, man rieche es, einer, dass er brennen solle wie das auf dem Pfahl.

13. **`k1_b_maedchen`, Anker „Bist du ein Jäger?“.** Kanon: Sie erkennt den Besucher nicht an der Stimme, sondern am Geruch, dem eines Jägers. Beleg: `figuren/maedchen-und-viola.md` (LK §17.3, §24.14).
    **Umsetzung:** „Du riechst wie Papa, wenn er spät heimkommt“, dann erst die Frage. Das bindet auch Gascoignes Geruch (Nr. 5).

14. **`k1_hub_b`, erstes Ortsbild.** Das Artbook gibt für Zentral-Yharnam Dinge, die fehlen: Särge und Karren in den Gassen, Gräber mitten in der Stadt, ein Leichenwagen, Gaslaternen mit geschwungenen Eisenhaltern, verhüllte Statuen, Hunde in Käfigen. Beleg: `welt/aussehen.md` (LK §25.1), `orte/zentral-yharnam.md` (LK §25.4), `gegner/hunde.md` (LK §20.5).
    **Umsetzung:** Im ersten Absatz einen Satz mit einem Ding, das man nicht vergisst: Särge an den Hauswänden, aufrecht, mit Ketten an die Ringe geschlossen, als sollte nichts mehr herauskommen. Die Zufallsfolge siehe Übergreifend Nr. 4.

15. **`k1_b_scheiterhaufen`, der Riese mit dem Ziegel.** Kanon: Die Riesen murmeln Klagen von Kälte und einer lieben Schwester und schreien beim Schlag, alles sei deine Schuld. Unerklärt, genau richtig für Kapitel 1. Beleg: `gegner/ziegel-troll.md` (LK §20.3), `figuren/maedchen-und-viola.md` (LK §17.4 Nr. 7).
    **Umsetzung:** Zwischen zwei Schlägen gegen die Tür murmelt er etwas von Kälte und einer Schwester; im Takt t2 („riese_ansturm“) brüllt er, es sei deine Schuld. Nicht erklären.

16. **`k1_hub_b`, Anker „„Die Jagd ist bald“, hat der Kutscher gesagt.“** Im Prolog sagt er „Bald ist Jagd.“ Falsch zitiert.
    **Umsetzung:** Wortlaut angleichen.

17. **Gascoignes Kopfbedeckung, „eine Kappe tief in der Stirn“ und „die Krempe seiner Kappe“.** Artbook: breitkrempiger Hut. Kappe mit Krempe liest sich schief. Beleg: `orte/zentral-yharnam.md` (LK §25.4).
    **Umsetzung:** In `b_yharnam.ink`, `n2_gascoigne.ink`, `d_nachspiel.ink` und `notizbuch.js` „Hut“ mit breiter Krempe; der Hut liegt auf dem Grabstein.

18. **`k1_b_daecher`, Anker „Patronenhülsen“.** Yharnams Feuerwaffen sind Vorderlader mit Quecksilberkugeln; Hülsen sind fremd in dieser Welt. Beleg: `gegenstaende/jaeger-und-werkstatt.md` (LK §19).
    **Umsetzung:** Verschüttetes Pulver in der Rinne und ein abgebissenes Papierende.

19. **Optionen in Teil B.** Am schwächsten: „Nicken“ (`gascoigne_greift_ein`), „Gehen“ (`frau`), „Zurück“ (mehrfach), „Noch nicht“ (`wieder`), „Nein“ (`k1_b_eileen`), „Umkehren“. Beleg: Übergreifend Nr. 8.
    **Umsetzung:** Beim Neuschreiben der Szenen in Satzanfänge umwandeln, etwa „Ihm stumm zunicken #fliesst“.

---

## c_unterstadt.ink

1. **`k1_c_kanal`, rotes Band.** Siehe `b_yharnam.ink` Nr. 1: Erst hier wird das Band rot.
   **Umsetzung:** „Ein Band, das einmal weiß war“, rot und schwer bis auf den Knoten. `{maedchen_gesehen:...}` entsprechend: Du hast es weiß gesehen, am Riegel.

2. **`k1_c_kanal.kampf`, Option „Zur Seite, im letzten Moment“.** Keine Richtung. Beleg: Übergreifend Nr. 7.
   **Umsetzung:** „Im letzten Moment nach rechts springen“.

3. **`k1_hub_c`, Anker „Oben, über dir, siehst du ein gewaltiges Tor, das hinauf zum Kathedralenbezirk führt“.** Kanon: Der Schlüssel des Oedon öffnet das Tor, das die Gruft des Oedon versperrt; es liegt oben an der Treppe hinter der Arena. Wer es mitten in der Unterstadt sieht, fragt sich, warum der Schlüssel am Grab liegt. Beleg: `gegenstaende/heilende-kirche.md` (Oedon Tomb Key), RK1 §9.
   **Umsetzung:** Das Tor hoch über den Gräbern zeigen, jenseits des Friedhofs, über einer Treppe; in `k1_d_grab` steht es dann am Ende der Treppe hinter der Arena.

4. **`k1_c_graeber`, erste Ankunft.** Violas Spur endet: Die betende Frau sagt, die Dame mit der Brosche habe nach dem Weg zu den Gräbern gefragt; hier findet sich nichts von ihr, obwohl sie hier vorbeigekommen sein muss. Beleg: `figuren/maedchen-und-viola.md` (LK §17.1: Viola ist offenbar dorthin gelangt), unser `notiz: viola_spur`.
   **Umsetzung:** Ein kleines Ding auf einem Grab, nur wenn `k1_b_tueren` besucht wurde oder immer: ein Damenhandschuh, ordentlich auf einen Grabstein gelegt, als wolle die Besitzerin ihn gleich wieder holen. Keine Deutung. `// [ERWEITERT]`.

5. **`k1_c_graeber.warnung`.** Hier wäre der Platz für Gascoignes kanonische Sätze aus dem Rausch, die im ganzen Kapitel fehlen: Männer gehen als Jäger hinaus und kommen als Bestien heim. Beleg: `figuren/gascoigne.md` (LK §24.11).
   **Umsetzung:** Nach „Ich jag sie schon so lange“ ein Satz in seiner kippenden Stimme, eigene Worte: Sie gehen alle als Jäger fort, alle, und was heimkommt, klopft anders an.

6. **Kopf von `c_unterstadt.ink`.** „Unterstadt“ als eigener Bereich ist nicht Kanon (im Original Kanalisation und Grab des Oedon). Unmarkiert.
   **Umsetzung:** `// [ERWEITERT]` im Kopf und als Abweichung im Lesepaket.

---

## n1_kleriker.ink

1. **`k1_n1_kleriker.kampf` t1, Option mit Gilberts Flamme, Anker „Gilbert hatte recht.“** Genau das Beispiel, das die Stimm-Bibel als verbotenes Erzählerurteil nennt. Beleg: `docs/stimme.md` (B, Nie).
   **Umsetzung:** Streichen. Wenn ein Nachklang gewollt ist: Du denkst an den Husten hinter dem Gitter.

2. **Kragen, Abzeichen, Gedächtnis und Gascoignes Erinnerung: das Gerücht wird Gewissheit.** Die Bestie trägt sichtbar „ein Priesterkragen“, im Fell ein Kirchenabzeichen, das Blutgedächtnis zeigt einen Kleriker, Gascoigne sagt zweimal, der habe ihn getraut. Danach steht „Beweisen kann es dir niemand“, was nach vier Belegen nicht mehr stimmt. Kanon: Der Name der Bestie geht auf ein Gerücht zurück; die Wissenssperre führt „Kirchenleute werden die schlimmsten Bestien“ nur als Gerücht. Beleg: `bosse/kleriker-bestie.md` (Name und Bedeutung), RK1 §8, `lore/kapitel/kapitel1.md` (Wissenssperre).
   **Umsetzung:** Im Ortsbild „Ein Kragen. Ein Priesterkragen.“ ersetzen durch: Reste von etwas Weißem, ein Streifen Stoff im Fell, Kragen oder Verband, du kannst es nicht sagen. In `phase2` den Satz zum verschwundenen Kragen anpassen. Das Gedächtnis darf den Kragen zeigen (es ist ein fremder Blick, unzuverlässig). Gascoignes Satz an der Brücke nur in einer der beiden Szenen (Scheiterhaufen oder Brücke), nicht in beiden. Dann trägt „Beweisen kann es dir niemand“ wieder. In `notizbuch.js` (`kleriker_bestien`) den Kragen herausnehmen.

3. **`beute`, Bedingung `k1_b_gilbert.themen`.** Der Text „Du denkst an Gilberts Gerücht, dass aus Kirchenleuten die schlimmsten Bestien werden“ erscheint, sobald der Spieler Gilberts Themenliste einmal gesehen hat, auch wenn er die Frage nach dem Weg nie gestellt hat (nur dort fällt das Gerücht). Fehler in der Logik.
   **Umsetzung:** In `k1_b_gilbert.themen`, Option „Nach dem Weg zur Kathedrale fragen“, Zweig `kleriker == ""`, eine Variable setzen (`~ gilbert_kleriker = true`, neu in `zustand.ink`) und in `beute` darauf prüfen.

4. **`uebergang`, Anker „Hinter der Brücke führen breite Treppen hinab“.** Siehe Übergreifend Nr. 2.
   **Umsetzung:** Davor: Am Ende der Brücke ein hohes Tor zur Kathedrale hin, von drüben verriegelt, die Kette frisch, das Schloss alt. Jemand hat mit einem Messer etwas ins Holz geritzt und es nicht zu Ende gebracht. Dann die Treppen.

5. **Ortsbild der Bestie.** Kanonisches Aussehen verschenkt: Im Fell der Beine sitzen Nägel, das Fell ist stellenweise pilzartig, im Artbook weiß. Beleg: `bosse/kleriker-bestie.md` (Aussehen), `orte/zentral-yharnam.md` (LK §25.4).
   **Umsetzung:** In der Beschreibung (nach dem Geweih) ein Satz: In den Hinterläufen stecken Nägel, rostige, Dutzende, und um jeden Nagel ist das Fell weißlich aufgeworfen wie Schimmel auf Brot. Kein Grund dazu. Dafür einen der drei Vergleiche im selben Absatz streichen.

6. **Anker „Einsicht. Das Wort ist einfach da, wie ein Geschmack im Mund.“** Siehe Übergreifend Nr. 6.
   **Umsetzung:** Den Satz streichen; der Spalt unter der Tür trägt allein. Der Begriff steht im Notizbuch.

7. **`mit_gascoigne`, Spieluhr.** Kanon: Spielt man dem gerufenen Gascoigne die Spieluhr vor, lacht er beim ersten Mal leise. Bei uns summt er nur. Eine Gelegenheit, die erste Ahnung zu säen, bevor man ihn zwischen den Gräbern sieht. Beleg: `figuren/maedchen-und-viola.md` (LK §17.5), RK1 §6.
   **Umsetzung:** In `g2` bei `spieluhr` eine Option „Die Spieluhr aus der Tasche ziehen #fliesst“: Er lacht leise, mitten im Kampf, und fragt, woher du die hast, und vergisst die Antwort, noch während du sie gibst. Danach weiter wie bisher. Zählt nicht für `spieluhr_mal`.

8. **`marke`, Anker „Das war ein Weg hinein. Einen Weg hinaus hat dir niemand in die Hand gedrückt.“** Für Neulinge unverständlich, und das PRÜFEN ist lösbar (Kanon: Echos gehen verloren). Beleg: `gegenstaende/jaeger-und-werkstatt.md` (Hunter's Mark).
   **Umsetzung:** Siehe `b_yharnam.ink` Nr. 8. Den Gedanken ersetzen durch: Was du an Echos bei dir trugst, bleibt zurück, und kein Fleck zeigt, wo. PRÜFEN streichen. Die Marke als eine Stelle in `system.ink` führen statt doppelt in `n1` und `n2`.

9. **Optionen ohne Richtung.** t4 „Zur Seite rollen“, t6 „Sofort zur Seite springen“. Beleg: Übergreifend Nr. 7.
   **Umsetzung:** „Nach rechts wegrollen“, „Sofort nach links springen“ (t6: im Folgetext steht „ein Schritt nach links“ für die richtige Option; die falsche muss sich in der Richtung nicht unterscheiden, aber im Zeitpunkt).

10. **`beute`, Abzeichen.** Kanon: Das Abzeichen der Kirchenjäger schaltet bei den Boten Waren frei. Bei uns liegt es nutzlos in der Tasche. Beleg: RK1 §8, `figuren/boten.md`.
    **Umsetzung:** `~ abzeichen_schwert = true` (neu in `zustand.ink`) und in `traum.ink` nutzen (siehe dort Nr. 7).

---

## n2_gascoigne.ink

1. **`p2`, Anker „Jetzt lacht er. Es ist ein tiefes, kehliges Lachen“.** Sein kanonischer Satz beim Übergang in die zweite Phase fehlt: Er riecht das süße Blut, es singt zu ihm, und ihm wird übel davon. Beleg: `figuren/gascoigne.md` (LK 6.1.2, LK §24.11), RK1 §11.
   **Umsetzung:** Nach dem Wegwerfen der Donnerbüchse: Er hält inne, zieht die Luft ein, und das Lachen bricht. Eigene Worte, kurz und kippend: Riechst du das, wie süß, es singt ja, und dann würgt er, die Hand vor dem Mund, und lacht weiter.

2. **`p3`, Anker „bis vor dir eine Bestie steht, so groß wie die auf der Brücke“.** Die Kleriker-Bestie ist bei uns „größer als ein Haus“. Gascoignes Bestie ist im Kanon groß, aber weit kleiner, dafür schneller und springender. Beleg: RK1 §11 (Phase 3), `bosse/kleriker-bestie.md`.
   **Umsetzung:** „doppelt so groß, wie er war, kleiner als das Ding auf der Brücke und schneller“.

3. **Spieluhr in der Bestienform fehlt.** Kanon: Sie lässt ihn in Menschen- und in Bestienform stocken. Bei uns ist sie in `p3` nicht mehr anwählbar. Gerade dort wäre der Moment am grausamsten. Beleg: `figuren/maedchen-und-viola.md` (LK §17.5), RK1 Widerspruch 3.
   **Umsetzung:** In `t4b` eine einmalige Option `{spieluhr and not uhr_bestie}` „Die Spieluhr noch einmal aufziehen #fliesst“: Die Bestie bleibt stehen, senkt den Kopf zur Melodie und winselt, ein Laut aus einem zu großen Körper; ein freier Hieb. Danach nie wieder.

4. **Taktzahl.** t1, t2, t2b, t3, t3b, t4, t4b, t4c, t5: neun Takte. Entscheidung des Nutzers: 6 bis 8. Beleg: CLAUDE.md (Abfragerunde 2026-11-04).
   **Umsetzung:** `t4b` und `t4c` zu einem Takt zusammenlegen (Kreis und Stille in einem Anzeichen).

5. **`t5`, Anker „darunter, ganz schwach, nach Weihrauch“ und `{grund == "suche": Weihrauch. So roch der letzte Brief.}`.** Siehe Übergreifend Nr. 10. Ohne Erklärung legt der Text nahe, Gascoigne habe mit dem gesuchten Menschen zu tun. Kanon: Gascoigne trägt einen Schal, der als heiliges Tuch der Kirche beschrieben wird. Beleg: RK1 §11 (Gascoigne's Garb, wahrscheinlich).
   **Umsetzung:** Den Weihrauch an den Schal binden, nicht an den Atem: aus dem zerrissenen Schal, nicht aus dem Maul. Die Zeile für `suche` ändern in: Weihrauch, wie im Brief. Die Kirche hat auch ihn berührt.

6. **`t1`, Option „Hinter einen Grabstein“.** Hier passt sein kanonischer Satz aus dem Rausch: Was sich bewegt, ist eine Bestie, und was sich nicht bewegt, dem traue er auch nicht; dabei lacht er. Beleg: `figuren/gascoigne.md` (LK §24.11).
   **Umsetzung:** Nach dem Einschlag im Stein ruft er dir das hinter den Grabstein nach, eigene Worte.

7. **`t4`, Option „Feuer“.** Einzelnes Wort. Beleg: `docs/stimme.md`.
   **Umsetzung:** `{feuer}` „Gilberts Flamme in den Sprung halten #fliesst“, `{molotow > 0}` „Den Molotow gegen ihre Brust werfen #fliesst“ als zwei Optionen.

8. **`t4`, Option „Seitlich weg“.** Keine Richtung, und der falsche Schatten springt „nach links“, die Einsichtsoption heißt „nach rechts“. Ohne Richtung in der neutralen Option bleibt unklar, was richtig ist. Beleg: Übergreifend Nr. 7.
   **Umsetzung:** „Nach links weg, dem Schatten nach #fliesst“ als richtige Option (der Schatten lügt nur für den, der zu viel sieht, und weist sonst den Weg) oder die Logik im Kommentar festhalten.

9. **Erste Ankunft, Anker „Seine Kappe hat er auf einen Grabstein gelegt“.** Im Kanon trägt er den Hut im Kampf. Das Bild ist gut, aber unmarkiert.
   **Umsetzung:** `// [ERWEITERT]`. Siehe auch `b_yharnam.ink` Nr. 17 (Hut).

---

## d_nachspiel.ink

1. **`k1_d_grab.eileen_danach`.** Dritte Begegnung mit Eileen gegen die Entscheidung des Nutzers (Übergreifend Nr. 5). Zudem verraten ihre Gesten, was der Spieler getan hat, statt dass er es selbst merkt.
   **Umsetzung:** Eileen nicht zeigen. Nur Spuren: Beim Abstieg liegt bei dem Toten ein Abzeichen von ihrer Schnur (Dank, `gascoigne_verraten`) oder eine zerknickte schwarze Feder (Bruch, `gascoigne_gewarnt`); für die Partnerschaft zwei frische Kerben im Holz des Tores zum Kathedralenbezirk, in Höhe eines Schnabels. Die Partnerschaft darf sonst nur aus `k1_c_eileen` kommen. Chronik und Notizbuch entsprechend („Sie hat zum Bezirk gezeigt“ → was der Spieler sieht).

2. **`k1_d_maedchen`, Zweig ohne `maedchen_gesehen`, Anker „ein Lied, das du heute Nacht schon einmal gehört hast: gesummt, zwischen Axthieben“.** Gilt nur, wenn der Spieler Gascoigne auf die Brücke gerufen hat. Sonst hat er das Lied nie gehört (am Grab vielleicht aus der Spieluhr, aber die hat er in diesem Zweig nicht). Logikfehler.
   **Umsetzung:** `{k1_n1_kleriker.mit_gascoigne: ... | ein Lied, das du nicht kennst und das dir doch den Hals eng macht}`.

3. **`weiche`, kanonische Sätze des Mädchens fehlen.** Nach der Brosche fragt sie im Kanon, ob das wirklich die Mutter war, und bittet, sie nicht allein zu lassen; bei uns weint sie nur stumm. Behält man die Brosche oder lügt, sagt sie im Kanon, der Morgen komme immer; bei uns „Ich kann gut warten“, was schon in `k1_b_maedchen.wieder` steht. Beleg: `figuren/maedchen-und-viola.md` (LK §17.4, §24.14).
   **Umsetzung:** Brosche: Vor dem Weinen eine Frage, ganz klein, ob die Mama das wirklich war, und dann die Bitte, nicht zu gehen, eigene Worte; dann das Weinen und das Schweigen. Lüge: „Ich kann gut warten“ ersetzen durch ihren Satz über den Morgen, der immer kommt, in Kinderworten (Mama sagt, irgendwann wird es immer hell). Das hallt gegen die Sonne, die nicht sinkt.

4. **`k1_d_maedchen`, erste Begegnung nach Gascoignes Tod.** Kanon: Die Spieluhr bekommt man auch dann noch. Bei uns nicht. Beleg: RK1 §6, `figuren/maedchen-und-viola.md` (LK §17.5).
   **Umsetzung:** Wenn `not spieluhr`: Sie schiebt die Spieluhr trotzdem durch den Spalt, für Papa, wenn du ihn findest. Der Spieler hält das Lied eines Toten in der Hand. Kurz, ohne Kommentar.

5. **`k1_d_traum`, Block „WAS DU JETZT WEISST“.** Der Text erklärt, was die Szenen gezeigt haben („Dass Yharnam mit Blut heilt …“). Das ist das Füttern, das der Nutzer nicht will, und doppelt die Fragen im Notizbuch. Beleg: `docs/stimme.md` (B: nie Erklärungen dessen, was die Szene gezeigt hat), Ziel des Nutzers (nicht gefüttert werden).
   **Umsetzung:** Den Block „WAS DU JETZT WEISST“ streichen. „WAS OFFEN BLEIBT“ entweder streichen (steht im Notizbuch unter Fragen) oder in den Tagebuchauszug als zwei Fragen in der Ich-Stimme übernehmen. Die Bedeutung trägt das Tagebuch.

6. **`k1_d_rueckweg`, Anker „Sie hat sich nicht bewegt. Sie wird nicht untergehen.“** Siehe Übergreifend Nr. 9.
   **Umsetzung:** „Sie wird nicht untergehen“ ersetzen durch: Du bleibst stehen und wartest, dass sie sinkt. Sie sinkt nicht. Den Satz „Die Nacht der Jagd hat noch nicht einmal richtig angefangen“ behalten.

7. **Tagebuch, Anker „Ich habe gelernt, dass man in Yharnam nicht stirbt.“** Falsch: Martha, Gascoigne, Viola sterben endgültig, der Text hat es eben selbst gesagt („Er wacht nicht zwischen weißen Blumen auf“).
   **Umsetzung:** „dass ich in Yharnam nicht sterbe. Die anderen schon.“

8. **`k1_d_grab`, Anker „Er wird das Tor zum Kathedralenbezirk öffnen.“** Der Erzähler weiß, was der Jäger nicht weiß.
   **Umsetzung:** Zeigen: Das eingeprägte Zeichen ist dasselbe wie über dem Tor oben an der Treppe hinter dem Friedhof (siehe `c_unterstadt.ink` Nr. 3). Den Rest denkt der Spieler.

9. **`k1_d_kanal`, Anker „Sie ist zur Klinik gelaufen, weil du es ihr gesagt hast, und dann die Treppe hinunter, der Mutter nach.“** Der Erzähler behauptet einen Ablauf, den niemand gesehen hat.
   **Umsetzung:** Als Gedanke des Jägers: Du denkst an die Treppe zu den Kanälen, an der ein kleiner Schatten stehen blieb.

10. **`k1_d_traum`, Bilanz `gedaechtnis_kleriker`, Anker „warum es gerade die trifft, die der Kirche am nächsten sind“.** Das ist die Fan-Deutung (Kleriker am nächsten am reinsten Blut) als Ahnung des Jägers. Mit „Beweisen kannst du es nicht“ gerade noch zulässig; fällt mit Nr. 5 ohnehin weg. Beleg: RK1 §8 ([Deutung]).
    **Umsetzung:** Mit dem Block streichen; die Ahnung steht schon im Notizbuch („Was ich ahne“).

11. **Chronik der Nacht, „Wirkt nach.“** Neunmal derselbe Spielbegriff am Zeilenende.
    **Umsetzung:** Streichen oder durch ein Zeichen der Oberfläche ersetzen (etwa ein Symbol über `# stil: chronik`); der Text bleibt Prosa.

---

## traum.ink

1. **`gehrman`, erster Besuch: das Blatt beim Altar fehlt.** Siehe Übergreifend Nr. 1 (Notiz Nr. 3).
   **Umsetzung:** wie dort beschrieben, in beiden Zweigen `gehrman == 1`.

2. **`gehrman`, „Wer die Jäger macht“, Anker „Mit ihren weißen Mänteln und ihren schönen Hämmern.“** Falsch: Die Jäger der Kirche tragen Schwarz; Weiß tragen die Ärzte der Kirche. Beleg: `gegenstaende/heilende-kirche.md` (Black Church Set, White Church Set), `fraktionen/heilende-kirche.md`.
   **Umsetzung:** „Mit ihren schwarzen Mänteln und ihren schönen Hämmern.“

3. **`gehrman`, Schlafrede, Anker „„Lasst mich gehen.““.** Das ist im Kanon Gehrmans späte Klage (nach Rom: man möge ihn aus den Fesseln befreien), und dass er gefangen ist, ist [Deutung], die laut Kopf von `traum.ink` nur gezeigt werden soll. Das Lesepaket erlaubt nur den frühen Gehrman. Beleg: `figuren/gehrman.md` (LK §18.1), `lore/kapitel/kapitel1.md` (Gehrman).
   **Umsetzung:** Statt der Bitte nur ein Laut, der nicht zu deuten ist: ein Name, den du nicht verstehst, und dann fragt er, ob es draußen schon hell werde. Gefangenschaft bleibt Unterton.

4. **`gehrman`, erste Begrüßung.** Der kanonische Inhalt fehlt zum Teil: Hier hätten die Jäger einst Blut für ihre Waffen und ihr eigenes Fleisch genommen; es gebe weniger Werkzeug als früher; auch die Puppe dürfe man gebrauchen. Bei uns steht die Puppe nur im zweiten Zweig, als Geste. Das Blut für das eigene Fleisch erklärt Neulingen die Stärkung bei der Puppe. Beleg: `figuren/gehrman.md` (LK §18.1).
   **Umsetzung:** In beiden Erstbesuch-Zweigen nach „Das hier war einmal für Leute wie dich gedacht“ ein Satz: Früher habe man hier Blut in den Stahl gegeben und in sich selbst, heute sei weniger da, aber es reiche. Und mit einer Pause, beiläufig, zu leise: die Puppe draußen, auch die stehe dir zu, wenn dir danach sei. Der Satz soll unangenehm sein.

5. **`puppe_gespraech`.** Kanon: Die Puppe sagt früh, unzählige Jäger seien schon gekommen, die Gräber stünden für sie; und Gehrman sei vor langer Zeit selbst Jäger gewesen. Für Neulinge der Schlüssel, dass sie nicht die Ersten sind. Beleg: `figuren/puppe.md` (LK §18.2, Früh und Anfang).
   **Umsetzung:** Eine dritte Stufe in `stopping`: Sie zeigt auf die Grabsteine und sagt, für jeden sei einmal einer gekommen wie du, und alles sei so lange her, dass sie die Gesichter verwechsle.

6. **`gehrman`, „Den Vertrag in der Klinik erwähnen“, Anker „Ich weiß nicht mehr, was ich unterschrieben habe.“** Erfindung, die einen Faden eröffnet (FRAGEN: „Was hat Gehrman unterschrieben?“), den der Kanon nur mit Gesperrtem einlösen kann. Kanon hat stattdessen: Er habe einem lieben Freund ein Versprechen gegeben. Beleg: `figuren/gehrman.md` (LK §24.13).
   **Umsetzung:** „Jeder hier hat irgendwann irgendwas versprochen. Ich auch. Einem Freund. Ich weiß noch, dass ich es versprochen habe.“ Den Namen nicht nennen (Laurence gesperrt). In `notizbuch.js` FRAGEN entsprechend.

7. **`boten_laden`, Abzeichen ohne Wirkung.** Siehe `n1_kleriker.ink` Nr. 10.
   **Umsetzung:** Den Brief mit Kirchensiegel nur mit `abzeichen_schwert` anbieten: Ein Bote tippt auf das Abzeichen an deinem Gürtel und holt etwas aus dem Wasser, das er vorher nicht gezeigt hat.

8. **`boten_laden`, Kirchenbrief.** Das PRÜFEN zum Ort der Vikarin ist lösbar: Sie betet in der Großen Kathedrale. Der Brief ist ein Kirchendokument, wird aber in Stimme B nacherzählt. Beleg: `figuren/amelia.md`, `docs/stimme.md` (C: Briefe von Kirchenleuten).
   **Umsetzung:** PRÜFEN streichen. Den Brief als Dokument mit `# stil: anschlag` (oder eigenem Stil) setzen, Stimme C: sorgfältig, höflich, Vorgang statt Gefühl; der ausgestrichene Satz als Riss in der Ordnung.

9. **`traum_erwachen`, `tode == 2`, Gehrman im Garten.** Gehrman sitzt im Kanon im ersten Teil des Spiels in der Werkstatt; im Garten erst später. Hier erklärt er zudem die Regel (nicht sterben, nur aufwachen), was Neulingen hilft, aber unmarkiert erfunden ist.
   **Umsetzung:** `// [ERWEITERT]`. Inhalt behalten.

10. **`gehrman`, „Wer die Jäger macht“, Anker „Ich habe Jäger gemacht … Lange bevor die Kirche welche hatte.“** Grenzfall der Wissenssperre: Das Lesepaket gibt für Gehrman nur den frühen Dialog frei; dass er der erste Jäger ist, steht dort nicht. Inhaltlich Kanon (`fraktionen/jaeger.md`, LK 2.9).
    **Umsetzung:** Entscheidung des Nutzers einholen; bis dahin weicher: Er habe früher Jäger ausgebildet, als es noch wenige gab.

---

## system.ink

1. **`tod`, Ort „grab“, Anker „Sie hat sich nicht bewegt. Sie wird es nicht.“** Erzählergewissheit (Übergreifend Nr. 9). Verschenkt: Gascoignes kanonischer Spott, wenn er den Jäger tötet (er verspottet, dass der sich nur mit Maske zeige, und lobt die Jagd als sportlich). Beleg: `figuren/gascoigne.md` (Als Boss, Was er sagt).
   **Umsetzung:** „Sie wird es nicht“ streichen. Bei `ort == "grab" and not gascoigne_tot` darüber seine Stimme, eigene Worte, etwa: Er beugt sich über dich und fragt, warum du dich versteckst, hinter so einem Gesicht; gute Jagd sei es trotzdem gewesen.

2. **Jägermarke an zwei Stellen.** `marke` steht gleich in `n1_kleriker.ink` und `n2_gascoigne.ink`; die Kanon-Kosten fehlen (siehe `b_yharnam.ink` Nr. 8).
   **Umsetzung:** Einen Knoten `marke` in `system.ink` mit `~ echos = 0` (ohne Fleck), Ortszeile über `ort`, und von beiden Kämpfen dorthin.

3. **`ampulle_ruhig` und `ampulle_gefahr`.** Kanon: Wer einmal mit Blut behandelt wurde, spürt bei jeder Infusion die erste nach. Das bindet die Ampulle an die Klinik. Beleg: `gegenstaende/yharnam-und-blut.md` (Blood Vial).
   **Umsetzung:** In `ampulle_ruhig` eine der drei Varianten ersetzen: Mit der Wärme kommt für einen Herzschlag die Klinik zurück, die Riemen, die zwei Flaschen, und der Wunsch nach mehr.

4. **Hinweis, keine Pflicht:** Kanon kennt das Zurückholen verlorener Gesundheit durch sofortigen Gegenangriff (RK1 §13). Es fehlt in der Mechanik. Nur nennen, Entscheidung beim Nutzer.

---

## notizbuch.js

1. **Das Notizbuch weiß mehr als der Spieler.** Mehrere Stufen hängen am Besuch eines Knotens statt an der gehörten Zeile und nehmen damit vorweg (CLAUDE.md: Einträge dürfen nichts vorwegnehmen):
   - `bluttransfusion`, Stufe `gilbert_geschenk || k1_b_gilbert`: „Zeit gekauft“ sagt Gilbert nur im Geschenk; wer sich abwendet, hört nichts.
   - `jagdnacht`, Stufe `k1_b_gilbert`: nur nach dem Thema „verriegelte Türen“.
   - `heilende_kirche`, Stufe `""`: „Ihr Blut, heißt es, kommt aus der großen Kathedrale“ sagt nur Gilbert; der Tag feuert aber auch am Tor der Unterstadt und beim Anschlag.
   - `heilende_kirche`, Stufe `k1_b_tueren`: nennt die Betende und die alte Frau, auch wenn der Spieler keine von beiden gewählt hat.
   - `kleriker_bestien`, Stufe `""`: „Man sagt …“, auch wenn der Spieler das Gerücht nie gehört hat.
   - `jaeger_der_jaeger`, Stufe `eileen_name`: „Sie heißt Eileen“ hängt an der Dörrfleisch-Szene, in der sie ihren Namen gar nicht nennt; ihr Name kommt über `eileen_genannt`.
   - PERSONEN „Gehrman“: „Seine Hände halten die Lehnen zu fest“ sieht man nur im Thema „Woher die Bestien kommen“.
   - `gascoigne`, Stufe `""`: Donnerbüchse und das Rollen in der Stimme, auch wenn man ihn zuerst an den Gräbern trifft (dort weder Büchse noch Rollen).
   **Umsetzung:** In den Ink-Dateien an den genauen Zeilen Merker setzen (`gilbert_jagd`, `gilbert_kirche` = `gilbert_bruecke`, `frau_betet`, `gilbert_kleriker`, `gehrman_bestien`) und die Bedingungen darauf umstellen. Die erste Stufe von `heilende_kirche` neutral fassen (sie verwaltet das Blut), die Kathedrale als eigene Stufe mit `gilbert_bruecke`. `kleriker_bestien` erste Stufe nur mit `gilbert_kleriker`, sonst mit dem, was der Spieler auf der Brücke sah. `jaeger_der_jaeger` Name über `eileen_genannt`, Dörrfleisch über `eileen_name`.

2. **PERSONEN „Gascoigne“, Stufe `gascoigne>=1 && q_frau==1`: „Er riecht nach Blut, mehr als ein Jäger sollte.“** Die Szene zeigt keinen Geruch.
   **Umsetzung:** Szene ergänzen (`b_yharnam.ink` Nr. 5) und den Eintrag an den neuen Satz anpassen (nasses Fell, nicht Blut).

3. **`fremde`, Stufe `k1_b_gilbert`: „Er hört es am Schritt.“** In der Szene riecht Gilbert es (Regen, Landstraße); am Schritt hört es Gascoigne.
   **Umsetzung:** „Er riecht es an mir, Regen und Landstraße.“

4. **`familie_gascoigne`, PERSONEN „Das Mädchen“, `kleriker_bestien`.** Folgeänderungen: Band weiß statt rot (`b_yharnam.ink` Nr. 1), kein sicherer Priesterkragen (`n1_kleriker.ink` Nr. 2), Hut statt Kappe (`b_yharnam.ink` Nr. 17).

5. **`paleblood`, Stufen `k1_erwachen` und `haltung_vertrag==wach`.** Beide sagen „Die Schrift sah aus wie meine“ (siehe `a_ankunft.ink` Nr. 10).
   **Umsetzung:** Nur in der Vertragsstufe behalten.

6. **FRAGEN „Was hat Gehrman unterschrieben?“.** Folgeänderung zu `traum.ink` Nr. 6: „Wem hat Gehrman etwas versprochen?“

7. **Fehlende Einträge** für neue Funde: das Blatt im Traum (Übergreifend Nr. 1), der Zettel im dunklen Haus (`b_yharnam.ink` Nr. 6), die Kosten der Jägermarke; dazu `viola_spur` (die Dame mit der Brosche fragte nach den Gräbern) als Stufe in `familie_gascoigne`, Bedingung auf den Merker der Betenden.
