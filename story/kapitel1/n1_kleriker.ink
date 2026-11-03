// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei (bis die Leiter in der Kanalisation offen ist).
// Drei Wege: kämpfen (allein oder mit Gascoigne), ablenken, fliehen. Nur wer sie besiegt, bekommt die Laterne an der Brücke
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// [KANON] Die Bestie klettert herab auf die Brücke; riesiger Arm, Geweih, Kreischen; feueranfällig; man kann Gascoigne als Helfer rufen.
// [KANON] Ihre Beute (Jägerabzeichen) sagt sinngemäß: Gerade Kleriker wurden zu den abscheulichsten Bestien.
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis.

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
{ kleriker == "besiegt": -> uebergang }
Die große Brücke, Kutschen, Leichen, Nebel; vom Turm am anderen Ende klettert etwas Riesiges herab und landet so schwer, dass die Brücke bebt. # bild: bruecke # kampf: kleriker
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    Du verstehst plötzlich, dass die Welt größer ist, als du dachtest. # notiz: erste_einsicht
}
{ schreie >= 1: Das Kreischen, das du gehört hast; jetzt hat es einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Sie hat dich nicht vergessen. }
+ {q_frau == 1 and not gascoigne_verraten} [Gascoigne rufen und gemeinsam kämpfen] -> mit_gascoigne
+ [Allein kämpfen] -> kampf
+ {kiesel > 0 or molotow > 0} [Etwas werfen, damit sie sich abwendet, und an ihr vorbei] -> ablenken
+ [Über das Geländer und durch die Gassen fliehen] -> fliehen
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= kampf
- (t1)
Sie stützt sich auf den übergroßen linken Arm und schiebt den Kopf vor. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Du kennst das: der lange Arm kommt im Bogen von links. }
+ [Nach rechts, unter den Arm]
    Der Arm fegt über dich hinweg; du triffst die Flanke.
    -> t2
+ [Nach hinten ausweichen]
    Der Bogen ist länger, als du dachtest.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Feuer in ihr Gesicht]
    Das Fell brennt; sie weicht zurück und schlägt blind. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf und reißt das Maul auf. # anzeichen: kreischen
+ [Ohren zu, Abstand halten]
    Der Schrei geht durch dich hindurch, aber du stehst.
    -> t3
+ [Jetzt angreifen, solange sie schreit]
    Der Schrei wirft dich aus dem Gleichgewicht.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
+ {molotow > 0} [Molotow ins offene Maul]
    ~ molotow = molotow - 1
    Das Feuer frisst sich in den Schlund; sie stürzt auf die Knie.
    -> phase2
+ {ampulle > 0} [Die Blutampulle trinken]
    Während sie schreit, ist Zeit.
    -> ampulle_ruhig -> t3
- (t3)
Sie springt mit beiden Armen voran. # anzeichen: sprung
{ gelernt ? sprung: Wer sich so streckt, landet dort, wo du stehst. }
+ {parade} [Im Absprung schießen]
    Sie wankt mitten in der Luft und stürzt vor dir auf die Brust; du stößt zu, tief. # notiz: viszeral
    -> phase2
+ [Seitlich wegrollen]
    -> phase2
+ [Den Sprung abfangen]
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Der linke Arm reißt auf, Knochen wie kahle Äste; sie wird schneller. # phase
- (t4)
+ [Zwischen den Hieben nach vorn, dorthin, wo der Arm nicht hinkommt]
    -> sieg
+ [Rückwärts, bis die Kutschen dich decken]
    Eine Kutsche zersplittert; ein Stück trifft dich.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t4
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke
- (sieg)
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ echos = echos + 6
Sie bricht zusammen, und ihr Geweih kratzt über das Pflaster, bis es still ist. Bei ihr ein silbernes Abzeichen der Kirche. # lore: kleriker_bestien
~ laterne = -> k1_hub_c
-> gedaechtnis

= mit_gascoigne
// [KANON-nah] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Spieluhr-Moment.
~ gascoigne = gascoigne + 1
Gascoigne kommt mit einem Lachen, das zu laut ist für diesen Ort; er kämpft, als hätte er nur auf diese Bestie gewartet. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur Augen für ihn; ihr Arm holt gegen ihn aus. # anzeichen: kleriker_hieb
+ [Ihm den Rücken decken]
    Ihr treibt sie gemeinsam gegen das Geländer.
    -> g2
+ [Die Gelegenheit nutzen und zuschlagen]
    Dein Hieb sitzt; Gascoigne fängt den Arm ab.
    -> g2
- (g2)
{ spieluhr:
    Mitten im Kampf hörst du ihn eine Melodie summen, dieselbe wie die der kleinen Spieluhr in deiner Tasche. # notiz: gascoigne_lied
}
Er schlägt weiter, als die Bestie längst am Boden liegt, bis du ihn an der Schulter fasst. # notiz: gascoigne_kippt
* [Ihn beruhigen]
    ~ gascoigne = gascoigne + 1
    Er blinzelt, lacht verlegen und sagt, die Jagd gehe einem ins Blut.
* [Nichts sagen]
- -> sieg

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Der Kiesel klappert weit hinten gegen eine Kutsche; sie fährt herum.
- else:
    ~ molotow = molotow - 1
    Das Feuer fängt in den Kutschen am Rand; sie wendet sich kreischend dem Brand zu.
}
Du läufst an ihr vorbei; hinter dir schlägt etwas so laut ins Pflaster, dass dir die Zähne klappern. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
Über das Geländer, hinunter in die Gassen; sie folgt dir über die Dächer, und einmal erwischt sie dich. # anzeichen: sprung
~ zuletzt = sprung
~ treffer(2)
{ leben <= 0: -> tod }
Du stürzt eine Treppe hinab und landest im Knietiefen: die Kanalisation. Oben kreischt sie, aber sie kommt nicht nach. # notiz: kleriker_lebt
~ kleriker = "geflohen"
-> k1_c_kanal

= marke
~ jaegermarken = jaegermarken - 1
Du zerdrückst die Marke, und die Brücke zerfällt wie ein Traum, der endet. # klang: marke
-> traum_von_laterne

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
Ihr Kopf ist so groß wie ein Fass; aus dem Geweih tropft noch Blut.
+ [Den Kopf berühren]
    Du siehst durch fremde Augen: ein Kleriker, der in einer Kathedrale Blut empfängt, Gesang, eine Stimme, die kippt; und am Ende ein Rest Mensch, der nach einem Namen sucht, den er vergessen hat. # gedaechtnis: kleriker # lore: blutgedaechtnis # lore: kleriker_bestien
    Du weißt jetzt, woran man den Moment erkennt, in dem einer kippt, und dass dahinter noch jemand ist. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Nicht berühren und weitergehen] -> uebergang

= uebergang
{ kleriker == "besiegt":
    An der Brücke flammt eine Laterne auf. # lore: laternen
}
Hinter der Brücke führen Treppen hinab zur Unterstadt und zu den Gräbern.
-> k1_hub_c
