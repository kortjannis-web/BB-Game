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
LIST anzeichen = sprung, schwer, biss, mobhieb, schuss, gascoigne_schuss, kleriker_hieb, kreischen, ansturm, axt_lang, bestie_sprung, griff, jaeger_klinge
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
    Auf den Steinen liegt noch dein eigenes Blut, eine dunkle, glänzende Lache an der Stelle, an der du gestorben bist. Als du dich darüber beugst, steigen die Echos daraus auf und kehren zu dir zurück, wie Tauben in den Schlag. # klang: echos
}
->->

// Ampulle in ruhiger Lage: kein Risiko.
=== ampulle_ruhig ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
{~Du stößt dir die Ampulle in den Schenkel. Das Blut brennt, dann wärmt es, und die Wärme läuft dir die Adern hinauf bis in die Fingerspitzen.|Die Nadel der Ampulle geht durch den Stoff in den Schenkel. Einen Herzschlag lang nichts, dann eine Hitze, die vom Bein aufsteigt wie Branntwein in die Kehle.|Du drückst die Ampulle in den Schenkel und lehnst dich an die nächste Wand, bis das Zittern in deinen Händen aufhört. Es hört auf. Es hört jedes Mal auf.} # klang: ampulle
->->

// Ampulle mitten im Angriff: heilt, aber der Gegner trifft dabei (Schaden höchstens 2, damit Trinken nie tötet).
=== ampulle_gefahr(schaden) ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
~ treffer(schaden)
{~Du stößt dir die Ampulle in den Schenkel, mitten im Kampf, und im selben Atemzug trifft dich der Schlag, den du kommen sahst. Das Blut heilt, was es heilen kann.|Du hast die Ampulle gerade im Bein, als der Hieb kommt. Das Blut wärmt dich von innen, und von außen wird es kalt, dort, wo er dich getroffen hat.|Trinken und Ausweichen zugleich geht nicht; dein Körper merkt es eher als dein Kopf. Die Wärme der Ampulle und der Schmerz des Treffers kommen im selben Augenblick.} # klang: ampulle
->->

// Tod: Erwachen im Traum. Die Echos bleiben am Todesort liegen; ein zweiter Tod vorher löscht sie.
=== tod ===
// TITEL: Tod
~ tode = tode + 1
~ neu_gelernt = zuletzt != () and not (gelernt ? zuletzt)
~ gelernt += zuletzt
~ zuletzt = ()
~ fleck_ort = ort
~ fleck_echos = echos
~ echos = 0
~ leben = LEBEN_MAX
{ ort:
- "bruecke": Das Letzte, was du siehst, ist das Geweih über dir, schwarz gegen den Nebel, und eine Kutsche, die sich langsam dreht, als läge sie auf Wasser. # tod: {ort} # stimmung: grauen
- "kanal": Das Wasser schlägt über dir zusammen, kalt, mit einem Geschmack nach Eisen, und von oben, sehr weit weg, hörst du die Ratten. # tod: {ort} # stimmung: grauen
- "grab": Zwischen zwei Grabsteinen liegst du auf dem Rücken. Über dir hängt die rote Sonne. Sie hat sich nicht bewegt. Sie wird es nicht. # tod: {ort} # stimmung: grauen
- "scheiterhaufen": Der Pflasterstein unter deiner Wange ist warm vom Feuer. Jemand sagt etwas, eine Frau, und du verstehst es nicht mehr. # tod: {ort} # stimmung: grauen
- else: Der Boden kommt dir entgegen, langsam, als habe er alle Zeit der Welt. Das Letzte, was du hörst, ist dein eigener Atem, der an einer Stelle hängen bleibt und nicht weitergeht. # tod: {ort} # stimmung: grauen
}
Dann wird es dunkel, und in der Dunkelheit bewegen sich kleine graue Hände.
-> traum_erwachen
