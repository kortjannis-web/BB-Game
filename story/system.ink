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
{~Du stößt dir die Ampulle in den Schenkel, und mit der Wärme kommt für einen Herzschlag die Klinik zurück, die Riemen über deinen Handgelenken, die zwei Flaschen über dir, eine leer, eine dunkel, und hinter der Wärme ein Durst nach mehr, den kein Wasser stillen würde.|Die Nadel der Ampulle geht durch den Stoff in den Schenkel. Einen Herzschlag lang nichts, dann eine Hitze, die vom Bein aufsteigt wie Branntwein in die Kehle.|Du drückst die Ampulle in den Schenkel und lehnst dich an die nächste Wand, bis das Zittern in deinen Händen aufhört. Es hört auf. Es hört jedes Mal auf.} # klang: ampulle
->->

// Ampulle mitten im Angriff: heilt, aber der Gegner trifft dabei (Schaden höchstens 2, damit Trinken nie tötet).
=== ampulle_gefahr(schaden) ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
~ treffer(schaden)
{~Du stößt dir die Ampulle in den Schenkel, mitten im Kampf, und im selben Atemzug trifft dich der Schlag, den du kommen sahst. Das Blut heilt, was es heilen kann.|Du hast die Ampulle gerade im Bein, als der Hieb kommt. Das Blut wärmt dich von innen, und von außen wird es kalt, dort, wo er dich getroffen hat.|Die Nadel setzen und zugleich ausweichen, das geht nicht, und dein Körper weiß es eher als dein Kopf. Die Wärme der Ampulle und der Schmerz des Treffers kommen im selben Augenblick.} # klang: ampulle
->->

// Tod: Erwachen im Traum. Die Echos bleiben am Todesort liegen; ein zweiter Tod vorher löscht sie.
// Ort "grab": [KANON lore:figuren/gascoigne] Tötet Gascoigne den Jäger, spottet er, dass der sich nur hinter einer Maske zeige, und lobt die Jagd als sportlich (eigene Worte). In Bestienform spricht er nicht.
// Die Sonne nur als Wahrnehmung, keine Gewissheit des Erzählers (G5).
=== tod ===
// TITEL: Tod
~ tode = tode + 1
~ neu_gelernt = zuletzt != () and not (gelernt ? zuletzt)
~ temp als_bestie = (zuletzt ? bestie_sprung) or (zuletzt ? bestie_kreis) or (zuletzt ? griff)
~ gelernt += zuletzt
~ zuletzt = ()
~ fleck_ort = ort
~ fleck_echos = echos
~ echos = 0
~ leben = LEBEN_MAX
{ ort:
- "bruecke": Das Letzte, was du siehst, ist das Geweih über dir, schwarz gegen den Nebel, und eine Kutsche, die sich langsam dreht, als läge sie auf Wasser. # tod: {ort} # stimmung: grauen
- "kanal": Das Wasser schlägt über dir zusammen, kalt, mit einem Geschmack nach Eisen, und von oben, sehr weit weg, hörst du die Ratten. # tod: {ort} # stimmung: grauen
- "grab":
    {
    - gascoigne_tot:
        Zwischen zwei Grabsteinen liegst du auf dem Rücken, und über dir hängt die rote Sonne. Du wartest darauf, dass sie sinkt, und dann wartest du auf gar nichts mehr. # tod: {ort} # stimmung: grauen
    - als_bestie:
        Zwischen zwei Grabsteinen liegst du auf dem Rücken. Vor die rote Sonne schiebt sich ein Schädel, zu lang für das Gesicht, das er einmal war, schnauft dich an, warm und nass, und zieht sich zurück zu den Gräbern, wo das Heulen weitergeht. # tod: {ort} # stimmung: grauen
    - else:
        Zwischen zwei Grabsteinen liegst du auf dem Rücken, und über dir hängt die rote Sonne, genau dort, wo sie hing, als du kamst. Dann beugt er sich davor, der Verband dunkel bis zum Knoten, so nah, dass dir sein Atem ins Gesicht schlägt, Teer und nasses Fell. „Versteckst dich“, sagt er, beinahe zärtlich. „Versteckst dich bis zuletzt, hinter so einem Gesicht.“ Er lacht. „Gute Jagd. War trotzdem eine gute Jagd.“ # tod: {ort} # stimmung: grauen
    }
- "scheiterhaufen": Der Pflasterstein unter deiner Wange ist warm vom Feuer. Jemand sagt etwas, eine Frau, und du verstehst es nicht mehr. # tod: {ort} # stimmung: grauen
- else: Der Boden kommt dir entgegen, langsam, als habe er alle Zeit der Welt. Das Letzte, was du hörst, ist dein eigener Atem, der an einer Stelle hängen bleibt und nicht weitergeht. # tod: {ort} # stimmung: grauen
}
Dann wird es dunkel, und in der Dunkelheit bewegen sich kleine graue Hände.
-> traum_erwachen

// --- Jägermarke ----------------------------------------------------------------
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Wer die Marke zerdrückt, erwacht im Traum, als wäre alles nur ein böser Traum gewesen, und verliert alle Blutechos; sie bleiben auch nicht als Fleck liegen (G3). Ein früherer Fleck bleibt, wo er ist.
// Gemeinsamer Baustein für die Kämpfe statt einer Fassung je Kampf. Aufruf aus einem Kampf:
//   ~ marke_zerdruecken()
//   -> traum_von_laterne
// Als Funktion, damit der Prüfer sie nicht als unerreichten Knoten meldet; Tags (etwa # klang: marke) gehören an die aufrufende Zeile.
VAR marke_eben = false   // eben eine Marke zerdrückt: traum_von_laterne beginnt dann ohne Laterne
=== function marke_zerdruecken()
~ jaegermarken = jaegermarken - 1
~ marke_eben = true
{ ort:
- "bruecke": Du zerdrückst die Marke in der Faust. Das Messing wird warm, dann heiß, und die Brücke zerfällt, die Bestie, der Nebel, wie ein Traum zerfällt, wenn man erwacht.
- "grab": Du zerdrückst die Marke in der Faust. Das Grab, das Heulen, die Gestalt auf der obersten Stufe, alles zerfällt, wie Asche zerfällt, wenn man hineinbläst.
- else: Du zerdrückst die Marke in der Faust, und das Messing wird heiß, und um dich her zerfällt die Stadt wie ein Traum beim Erwachen.
}
{ echos > 0:
    Was aus den Bestien in dich geflossen ist, bleibt dort zurück, und kein Fleck zeigt, wo.
}
~ echos = 0
~ marke_benutzt = true
