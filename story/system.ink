// SYSTEM: Werte und Bausteine für das ganze Spiel.

// --- Leben -----------------------------------------------------------------
// Fünf Leben, unsichtbar. Die Oberfläche zeigt nur die Vignette am Rand:
//   3 Leben: leicht orange · 2 Leben: leicht rot · 1 Leben: schwarz
CONST LEBEN_MAX = 5
CONST AMPULLE_HEILT = 2
VAR leben = 5

// Eine Blutampulle, nie mehr. Wird im Traum aufgefüllt (und anfangs von Iosefka gegeben).
VAR ampulle = 0

// --- Blutechos (Währung) und der Fleck am Todesort ------------------------
VAR echos = 0
VAR fleck_ort = ""
VAR fleck_echos = 0

// --- Fortschritt ------------------------------------------------------------
VAR einsicht = 0
VAR tode = 0
VAR ort = ""
VAR puppe_wach = false
VAR parade = false
// Wohin man nach dem Traum zurückkehrt (die zuletzt entzündete Laterne).
VAR laterne = -> k1_klinik_kampf

// --- Lernen durch Sterben ---------------------------------------------------
// Vor jedem Treffer wird das Anzeichen gemerkt; wer daran stirbt, erkennt es beim nächsten Mal.
LIST anzeichen = sprung, klinik_sprung, klinik_schwer, gascoigne_bogen, riese_ansturm, schwein_ansturm, biss, mobhieb, schuss, gascoigne_schuss, kleriker_hieb, kreischen, ansturm, axt_lang, bestie_sprung, griff, jaeger_klinge, wurf, knochensturm, letzter_griff, donner_nah, axt_wirbel, bestie_kreis
VAR zuletzt = ()
VAR gelernt = ()

=== function treffer(n)
~ leben = MAX(leben - n, 0)

=== function heile(n)
~ leben = MIN(leben + n, LEBEN_MAX)

// Beim Betreten eines Ortes: Ort merken und ein liegengebliebenes Blutecho aufheben.
=== betreten(hier) ===
~ ort = hier
{ fleck_ort == hier and fleck_echos > 0:
    ~ echos = echos + fleck_echos
    ~ fleck_echos = 0
    ~ fleck_ort = ""
    Auf den Steinen liegt noch dein eigenes Blut, eine dunkle, glänzende Lache an der Stelle, an der du gestorben bist. Als du dich darüber beugst, steigt ein Schimmer daraus auf und kehrt zu dir zurück, wie Tauben in den Schlag. # klang: echos
}
->->

// Ampulle in ruhiger Lage: kein Risiko.
// [KANON lore:gegenstaende/yharnam-und-blut] Wer einmal mit Blut behandelt wurde, spürt bei jeder weiteren Infusion die erste nach (Blood Vial). Die Riemen und zwei Flaschen kommen aus der Klinik (a_ankunft, Faktencheck Nr. 7).
=== ampulle_ruhig ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
{~Kaum sitzt die Ampulle im Schenkel, kommt mit der Wärme für einen Herzschlag die Klinik zurück, die Riemen über deinen Handgelenken, die zwei Flaschen über dir, eine leer, eine dunkel, und hinter der Wärme ein Durst nach mehr, den kein Wasser stillen würde.|Die Nadel der Ampulle geht durch den Stoff in den Schenkel. Einen Herzschlag lang nichts, dann eine Hitze, die vom Bein aufsteigt wie Branntwein in die Kehle.|Du drückst die Ampulle in den Schenkel und lehnst dich an das Nächste, das hält, bis das Zittern in deinen Händen aufhört. Es hört auf. Es hört jedes Mal auf.} # klang: ampulle
->->

// Ampulle mitten im Angriff: heilt, aber der Gegner trifft dabei (Schaden höchstens 2, damit Trinken nie tötet).
// Lektorat system.ink 3: keine Regel in der Prosa („das geht nicht“), nur der Augenblick selbst.
=== ampulle_gefahr(schaden) ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
~ treffer(schaden)
{~Den Schlag hast du kommen sehen, und die Nadel ist trotzdem schon im Schenkel. Er trifft dich, während das Blut noch in dich hineinläuft, und einen Augenblick lang weiß dein Körper nicht, ob er heilt oder bricht.|Du hast die Ampulle gerade im Bein, als der Hieb kommt. Das Blut wärmt dich von innen, und von außen wird es kalt, dort, wo er dich getroffen hat.|Die Nadel ist erst halb im Schenkel, als der Schlag kommt, und das Glas schlägt dir gegen die Hüfte und hält. Wärme und Schmerz kommen im selben Atemzug, und keines von beiden gewinnt.} # klang: ampulle
->->

// Tod: Erwachen im Traum. Die Echos bleiben am Todesort liegen; ein zweiter Tod vorher löscht sie.
// Ort "grab": [KANON lore:figuren/gascoigne] Tötet Gascoigne den Jäger, spottet er, dass der sich nur hinter einer Maske zeige, und lobt die Jagd als sportlich (eigene Worte). In Bestienform spricht er nicht.
// Die Sonne nur als Wahrnehmung, keine Gewissheit des Erzählers (G5). L6: jedes Mal ein anderes Zeichen, dass sie nicht sinkt.
// Lektorat 2026-11-05: Jeder Tod hautnah und anders. Die Texte wechseln je Ort und Ursache und wiederholen sich bei mehreren Toden am selben Ort nicht gleich ({&…}); die temp-Werte dienen nur der Wahl des Textes.
=== tod ===
// TITEL: Tod
~ tode = tode + 1
~ neu_gelernt = zuletzt != () and not (gelernt ? zuletzt)
~ temp als_bestie = (zuletzt ? bestie_sprung) or (zuletzt ? bestie_kreis) or (zuletzt ? griff)
~ temp durch_schuss = (zuletzt ? schuss) or (zuletzt ? gascoigne_schuss) or (zuletzt ? donner_nah)
~ temp durch_riese = zuletzt ? riese_ansturm
~ gelernt += zuletzt
~ zuletzt = ()
~ fleck_ort = ort
~ fleck_echos = echos
~ echos = 0
~ leben = LEBEN_MAX
{ ort:
- "bruecke": {&Das Letzte, was du siehst, ist das Geweih über dir, schwarz gegen den Himmel, und eine Kutsche, die sich langsam dreht, als läge sie auf Wasser.|Der Schlag hebt dich vom Pflaster und legt dich zwischen die Räder einer umgestürzten Kutsche, zu denen, die man nicht fortgeräumt hat. Einer von ihnen hat die Augen offen. Du siehst ihn an, und er sieht zurück, bis einer von euch beiden aufhört.|Über dir hebt sich der lange Arm noch einmal, Gelenk um Gelenk, und eines davon war vorhin nicht da. Weiter kommst du mit dem Zählen nicht.} # tod: {ort} # stimmung: grauen
- "kanal": {&Das Wasser schlägt über dir zusammen, kalt, mit einem Geschmack nach Eisen, und von oben, sehr weit weg, hörst du die Ratten.|Gegen die Beckenwand gedrückt, unter einem Gewicht, das warm ist und schnauft, hörst du etwas knirschen, die Mauer oder deine Rippen. Über dir riecht der Atem nach dem, was es zuletzt gefressen hat, und das Schmatzen hört nicht auf, als du still wirst.} # tod: {ort} # stimmung: grauen
- "grab":
    {
    - gascoigne_tot:
        Zwischen zwei Grabsteinen liegst du auf dem Rücken, und über dir hängt die rote Sonne. Du kannst in sie hineinsehen, ohne zu blinzeln, und deine Augen tränen nicht. Sie ist das Letzte, was sich nicht bewegt. # tod: {ort} # stimmung: grauen
    - als_bestie:
        {&Zwischen zwei Grabsteinen liegst du auf dem Rücken. Vor die rote Sonne schiebt sich ein Schädel, zu lang für das Gesicht, das er einmal war, schnauft dich an, warm und nass, und zieht sich zurück zu den Gräbern, wo das Heulen weitergeht.|Das Gewicht auf deiner Brust ist warm und atmet. Dicht über dir, zwischen den Zähnen, hängt ein Fetzen von seinem Schal, und das Heulen kommt aus solcher Nähe, dass es in deinen eigenen Rippen klingt.} # tod: {ort} # stimmung: grauen
    - durch_schuss:
        Nach dem Schuss hörst du nichts mehr, nur ein Pfeifen, hoch und rein, wie von einer Glocke, die nicht aufhört. Durch das Pfeifen hindurch siehst du über dir seinen Mund, und der Mund ist freundlich. Zwei Wörter liest du ihm von den Lippen: Gute Jagd. # tod: {ort} # stimmung: grauen
    - else:
        // [ERWEITERT] Die zweite Fassung: Er erkennt dich nicht mehr; die zwei gesummten Töne sind ein Faden zur Spieluhr.
        {&Zwischen zwei Grabsteinen liegst du auf dem Rücken, und über dir hängt die rote Sonne, genau dort, wo sie hing, als du kamst. Dann beugt er sich davor, der Verband dunkel bis zum Knoten, so nah, dass dir sein Atem ins Gesicht schlägt, Teer und Branntwein und darunter das andere. „Versteckst dich“, sagt er, beinahe zärtlich. „Versteckst dich bis zuletzt, hinter so einem Gesicht.“ Er lacht. „Gute Jagd. War trotzdem eine gute Jagd.“|Die Axt liegt neben deinem Kopf im Gras, wo sie dich losgelassen hat. Er hockt sich zu dir, schwer, mit knackenden Knien, und sieht dich lange an, den Kopf schief, wie man ein Gesicht in einer Menge sucht. „Hm“, macht er. „Dachte, ich kenn dich.“ Er summt zwei Töne und geht zwischen die Gräber zurück.} # tod: {ort} # stimmung: grauen
    }
- "scheiterhaufen":
    { durch_riese:
        Zuletzt hörst du nur noch den Riesen. Er weint, mit der Stimme eines Jungen, und sagt dir immer wieder, dass du an allem schuld bist. # tod: {ort} # stimmung: grauen
    - else:
        {&Der Pflasterstein unter deiner Wange ist warm vom Feuer. Jemand sagt etwas, eine Frau, und du verstehst es nicht mehr.|Sie hören nicht auf, als du liegst. Eine Gabel, ein Stiefel, noch einmal die Gabel, und zwischen den Stiefeln steht ein Paar Holzpantinen still und tritt nicht mit. Wem sie gehören, erfährst du nicht mehr.} # tod: {ort} # stimmung: grauen
    }
- "klinik": Unter deiner Wange sind die Dielen kalt und klebrig, dieselben, auf denen du vorhin schon gelegen hast, und sie riechen nach Karbol. Über dir schnauft es, ohne Hast. # tod: {ort} # stimmung: grauen
- "haus": Die Kugel setzt dich auf den Boden, den Rücken an der Wand. Der Mann im Rollstuhl lädt nach, mit Fingern, die zittern und trotzdem treffen, und du siehst ihm dabei zu, und es kommt dir nicht mehr wichtig vor. # tod: {ort} # stimmung: grauen
- "daecher": Der zweite Schuss trifft dich, als du dich nach dem ersten umdrehst. Zwischen Hauswänden, so eng, dass deine Schultern beide streifen, rutschst du zu Boden, und über dir an der Leine schaukelt die einzelne hölzerne Klammer. # tod: {ort} # stimmung: grauen
- else: {&Der Boden kommt dir entgegen, langsam, und du hast Zeit, eine Fuge zwischen zwei Steinen zu sehen, in der Moos wächst. Das Letzte, was du hörst, ist dein eigener Atem, der an einer Stelle hängen bleibt und nicht weitergeht.|Die Knie geben nach, eines nach dem anderen, und du sitzt, als hätte dich jemand behutsam dorthin gesetzt. Das Licht geht zuerst an den Rändern, zuletzt in der Mitte.|Von den Füßen her wird es kalt, Stufe um Stufe, so wie Wasser in einem Keller steigt. Als es das Herz erreicht, schlägt das Herz ihm nicht mehr entgegen.} # tod: {ort} # stimmung: grauen
}
{&Es wird dunkel, und in der Dunkelheit bewegen sich kleine graue Hände.|Das Dunkel kommt nicht von außen; es steigt in dir auf wie Wasser in einem Brunnen, und auf seinem Grund regen sich kleine graue Hände.|Dunkel. Irgendwo darin zupft dich etwas am Ärmel, behutsam, so wie man einen Schlafenden weckt, und es sind viele kleine Hände.}
-> traum_erwachen

// --- Jägermarke ----------------------------------------------------------------
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Wer die Marke zerdrückt, erwacht im Traum, als wäre alles nur ein böser Traum gewesen, und verliert alle Blutechos; sie bleiben auch nicht als Fleck liegen (G3). Ein früherer Fleck bleibt, wo er ist.
// Gemeinsamer Baustein für die Kämpfe statt einer Fassung je Kampf (noch von keinem Kampf benutzt; die Bosskämpfe haben eigene Stellen). Der Text setzt die Option „… zerdrücken“ fort (L1). Aufruf aus einem Kampf:
//   ~ marke_zerdruecken()
//   -> traum_von_laterne
// Als Funktion, damit der Prüfer sie nicht als unerreichten Knoten meldet; Tags (etwa # klang: marke) gehören an die aufrufende Zeile.
VAR marke_eben = false   // eben eine Marke zerdrückt: traum_von_laterne beginnt dann ohne Laterne
=== function marke_zerdruecken()
~ jaegermarken = jaegermarken - 1
~ marke_eben = true
{ ort:
- "bruecke": Das Messing wird in der Faust warm, dann heiß, und die Brücke zerfällt, die Bestie, die Kutschen, so wie ein Traum zerfällt, wenn man erwacht.
- "grab": Unter den Fingern bricht das Messing, und das Grab, das Heulen, die Gestalt auf der obersten Stufe zerfallen wie Asche, in die einer hineinbläst.
- else: Das Messing wird in der Faust heiß, und um dich her zerfällt die Stadt wie ein Traum beim Erwachen.
}
{ echos > 0:
    Was die Toten dieser Nacht in dich gegeben haben, bleibt dort zurück, und kein Fleck wird zeigen, wo.
}
~ echos = 0
~ marke_benutzt = true
