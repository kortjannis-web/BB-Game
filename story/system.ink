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
LIST anzeichen = sprung, schwer, biss, mobhieb, schuss, kleriker_hieb, kreischen, ansturm, axt_lang, bestie_sprung, griff, jaeger_klinge
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
    Auf den Steinen liegt noch dein eigenes Blut; du nimmst die Echos wieder an dich. # klang: echos
}
->->

// Ampulle in ruhiger Lage: kein Risiko.
=== ampulle_ruhig ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
Du stößt die Ampulle in den Schenkel; Wärme läuft bis in die Finger. # klang: ampulle
->->

// Ampulle mitten im Angriff: heilt, aber der Gegner trifft dabei (Schaden höchstens 2, damit Trinken nie tötet).
=== ampulle_gefahr(schaden) ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
~ treffer(schaden)
Du trinkst, und im selben Atemzug trifft dich der Schlag. # klang: ampulle
->->

// Tod: Erwachen im Traum. Die Echos bleiben am Todesort liegen; ein zweiter Tod vorher löscht sie.
=== tod ===
// TITEL: Tod
~ tode = tode + 1
~ gelernt += zuletzt
~ zuletzt = ()
~ fleck_ort = ort
~ fleck_echos = echos
~ echos = 0
~ leben = LEBEN_MAX
Die Welt kippt, und der Boden kommt dir entgegen. # tod: {ort}
-> traum_erwachen
