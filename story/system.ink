// SYSTEM: Werte und Bausteine für das ganze Spiel.
// Überarbeitet 2026-11-06 Text für Text (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12, Skill stil-1800, Momente tod und kampf): nur Text und Kommentare, Logik und Zahl der Alternativen unverändert (Ü9).

// --- Leben -----------------------------------------------------------------
// Fünf Leben, unsichtbar. Die Oberfläche zeigt nur die Vignette am Rand:
//   3 Leben: leicht orange · 2 Leben: leicht rot · 1 Leben: schwarz
CONST LEBEN_MAX = 5
CONST AMPULLE_HEILT = 2
VAR leben = 5

// Eine Blutampulle, nie mehr. Wird im Traum aufgefüllt (und anfangs von Iosefka gegeben).
VAR ampulle = 0

// --- Fortschritt ------------------------------------------------------------
VAR einsicht = 0
VAR tode = 0
VAR ort = ""
VAR puppe_wach = false
VAR parade = false
// Wohin man nach dem Tod zurückkehrt: an den Anfang des Kampfes oder Moments (2026-11-06, Entscheidung des Nutzers:
// kein Speicherpunkt, keine Laterne als Ort; jeder Kampf setzt sein Ziel selbst, siehe `kampf_ab`).
VAR kampfanfang = -> k1_klinik_kampf

// --- Lernen durch Sterben ---------------------------------------------------
// Vor jedem Treffer wird das Anzeichen gemerkt; wer daran stirbt, erkennt es beim nächsten Mal.
LIST anzeichen = sprung, klinik_sprung, klinik_schwer, gascoigne_bogen, riese_ansturm, schwein_ansturm, biss, mobhieb, schuss, gascoigne_schuss, kleriker_hieb, kreischen, ansturm, axt_lang, bestie_sprung, griff, jaeger_klinge, wurf, knochensturm, letzter_griff, donner_nah, axt_wirbel, bestie_kreis
VAR zuletzt = ()
VAR gelernt = ()

=== function treffer(n)
~ leben = MAX(leben - n, 0)

=== function heile(n)
~ leben = MIN(leben + n, LEBEN_MAX)

// Beim Betreten eines Ortes: Ort merken (der Tod erzählt je nach Ort).
=== betreten(hier) ===
~ ort = hier
->->

// Ampulle in ruhiger Lage: kein Risiko.
// [KANON lore:gegenstaende/yharnam-und-blut] Wer einmal mit Blut behandelt wurde, spürt bei jeder weiteren Infusion die erste nach (Blood Vial). Die Riemen und zwei Flaschen kommen aus der Klinik (a_ankunft, Faktencheck Nr. 7). Die Ampulle wird in den Schenkel gestoßen, nie getrunken.
// Wird an Laternen, vor Kämpfen und mitten in ruhigen Takten gelesen, also oft: jede Fassung ein anderer Sinn (Erinnerung, Hitze, Zittern).
=== ampulle_ruhig ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
{~Kaum sitzt die Ampulle im Schenkel, kommt mit der Wärme für einen Herzschlag die Klinik zurück, die Riemen über deinen Handgelenken, die zwei Flaschen über dir, eine leer, eine dunkel, und hinter der Wärme, ganz leise, der Wunsch nach der zweiten Flasche.|Die Nadel geht durch den Stoff in den Schenkel. Einen Herzschlag lang nichts; dann steigt eine Hitze aus dem Bein herauf in den Leib, wie Branntwein, der den falschen Weg nimmt, und der Einstich in deiner Armbeuge pocht mit.|Du drückst die Ampulle in den Schenkel und lehnst dich an das Nächste, das hält, eine Mauer, einen Pfahl, bis das Zittern in deinen Händen aufhört. Es hört auf. Es hört jedes Mal auf.} # klang: ampulle
->->

// Ampulle mitten im Angriff: heilt, aber der Gegner trifft dabei (Schaden höchstens 2, damit Trinken nie tötet).
// Lektorat system.ink 3: keine Regel in der Prosa („das geht nicht“), nur der Augenblick selbst.
// Gerufen bei Mob, Schwein, Kleriker-Bestie und Gascoigne: kein Wort, das nur zu einem Gegner passt (darum „Schlag“ und „es“, kein „Hieb“).
=== ampulle_gefahr(schaden) ===
~ ampulle = ampulle - 1
~ heile(AMPULLE_HEILT)
~ treffer(schaden)
{~Den Schlag hast du kommen sehen, und die Nadel ist trotzdem schon im Schenkel. Er trifft dich, während das Blut noch in dich hineinläuft, und einen Augenblick lang weiß dein Körper nicht, ob er heilt oder bricht.|Die Ampulle steckt gerade im Bein, da trifft es dich. Das Blut wärmt dich von innen, und von außen wird es kalt, genau dort, wo du getroffen bist, und die beiden treffen sich irgendwo unter den Rippen.|Die Nadel ist erst halb im Schenkel, als der Schlag kommt; das Glas prallt dir gegen die Hüfte und bleibt heil. Wärme und Schmerz kommen im selben Atemzug, und keines von beiden gewinnt.} # klang: ampulle
->->

// Tod: Erwachen im Traum, als Nachbild (story/nachbild.ink): Körper, innerer Monolog, ein Story-Fragment, dann zurück an den Anfang des Kampfes.
// Es gibt keine Blutechos mehr (Entscheidung des Nutzers 2026-11-06: Buchgefühl vor Videospiel).
// Ort "grab": [KANON lore:figuren/gascoigne] Tötet Gascoigne den Jäger, spottet er, dass der sich nur hinter einer Maske zeige, und lobt die Jagd als sportlich (eigene Worte). In Bestienform spricht er nicht. Sein Verband liegt über den Augen (Ü11): Er sieht nicht, er riecht und horcht. Sein Geruch nach Torf und Rauch (Ü11). Der Schal bleibt bis zu seinem Tod geknotet (n2_gascoigne, t5).
// [ERWEITERT, Ü1, N2] Statt der roten Sonne der Mond: übergroß, er wandert nicht, er kommt nur näher. Im Tod keine Narben (die gehören den Gräbern in c_unterstadt), kein Hof, keine Farbe: nur Lage und Wirkung
//   (sein Licht auf dem Gesicht, ein Rand um einen Schädel, dieselbe Stelle und doch größer; an der Brücke der Lichtrand um das schwarze Geweih). Nie rot.
// [KANON lore:gegner/ziegel-troll] Der Riese klagt über Kälte und eine Schwester und brüllt, alles sei deine Schuld (sinngemäß). [KANON lore:gegner/rollstuhl-mob] Der Mann im Rollstuhl lacht beim Einatmen.
// Lektorat 2026-11-05: Jeder Tod hautnah und anders. Die Texte wechseln je Ort und Ursache und wiederholen sich bei mehreren Toden am selben Ort nicht gleich ({&…}); die temp-Werte dienen nur der Wahl des Textes. Kurz und hart (Folge, nicht Anzeichen); der letzte Satz gehört den kleinen grauen Händen, das Nachbild beginnt im Gras.
=== tod ===
// TITEL: Tod
~ tode = tode + 1
~ neu_gelernt = zuletzt != () and not (gelernt ? zuletzt)
~ temp als_bestie = (zuletzt ? bestie_sprung) or (zuletzt ? bestie_kreis) or (zuletzt ? griff)
~ temp durch_schuss = (zuletzt ? schuss) or (zuletzt ? gascoigne_schuss) or (zuletzt ? donner_nah)
~ temp durch_riese = zuletzt ? riese_ansturm
~ gelernt += zuletzt
~ zuletzt = ()
~ leben = LEBEN_MAX
{ ort:
- "bruecke": {&Das Letzte, was du siehst, ist das Geweih über dir, schwarz vor dem Mond, von dem nur ein Rand aus Licht um die Zacken läuft, und eine Kutsche, die sich langsam dreht, als läge sie auf Wasser.|Der Schlag hebt dich vom Pflaster und legt dich zwischen die Räder einer umgestürzten Kutsche, zu den Toten, die man nicht fortgeräumt hat. Einer von ihnen hat die Augen offen. Du siehst ihn an, und er sieht zurück, bis einer von euch beiden aufhört.|Über dir hebt sich der lange Arm noch einmal, und eines seiner Gelenke war vorhin nicht da. Weiter kommst du mit dem Zählen nicht.} # tod: {ort} # stimmung: grauen
- "kanal": {&Das Wasser schlägt über dir zusammen, kalt, mit einem Geschmack nach Eisen, und von oben, sehr weit weg, hörst du die Ratten.|Gegen die Beckenwand gedrückt, unter einem Gewicht, das warm ist und schnauft, hörst du es knirschen, die Mauer oder deine Rippen. Der Atem über dir riecht nach dem, was es zuletzt gefressen hat, und das Schmatzen hört nicht auf, als du still wirst.} # tod: {ort} # stimmung: grauen
- "grab":
    {
    - gascoigne_tot:
        Zwischen zwei Grabsteinen liegst du auf dem Rücken, und über dir hängt der Mond, tiefer als je zuvor, und legt sein kaltes Licht auf dein Gesicht. Deine Augen schließen sich nicht mehr; so bleibt er in ihnen stehen, bis die Dunkelheit ihn von den Rändern her zudeckt. # tod: {ort} # stimmung: grauen
    - als_bestie:
        {&Rücklings im nassen Gras siehst du einen Schädel vor den Mond rücken, zu lang für das Gesicht, das er einmal war, bis vom Mond nur ein bleicher Rand um das Fell bleibt. Der Schädel schnauft dich an, warm und nass, und zieht sich zurück zu den Gräbern, wo das Heulen weitergeht.|Das Gewicht auf deiner Brust ist warm und atmet. Dicht über dir schwingt der Schal an seinem Hals, noch immer geknotet, und das Heulen kommt aus solcher Nähe, dass es in deinen eigenen Rippen klingt.} # tod: {ort} # stimmung: grauen
    - durch_schuss:
        Nach dem Schuss hörst du nichts mehr, nur ein Pfeifen, hoch und rein, wie von einer Glocke, die nicht aufhört. Durch das Pfeifen hindurch siehst du über dir seinen Mund, und der Mund ist freundlich. Zwei Wörter liest du ihm von den Lippen: Gute Jagd. # tod: {ort} # stimmung: grauen
    - else:
        // [ERWEITERT] Die zweite Fassung: Er erkennt dich nicht mehr; er riecht an dir, statt zu sehen (Verband), und die zwei gesummten Töne sind ein Faden zur Spieluhr.
        {&Die Erde zwischen den Gräbern gibt unter deinem Rücken nach. Über dir steht der Mond, an derselben Stelle wie bei deiner Ankunft am Tor, nur größer. Dann schiebt sich der Verband davor, dunkel bis zum Knoten, und sein Atem schlägt dir ins Gesicht, Torf und Rauch und darunter das andere. „Versteckst dich“, sagt er, beinahe zärtlich. „Versteckst dich bis zuletzt, hinter so einem Gesicht.“ Er lacht. „Gute Jagd. War trotzdem eine gute Jagd.“|Die Axt liegt neben deinem Kopf im Gras, wo sie dich losgelassen hat. Er hockt sich zu dir, schwer, mit knackenden Knien, und schnuppert in kurzen Rucken an deinem Hals, den Kopf schief wie einer, der in einer Menge nach einem bekannten Gesicht sucht. „Hm“, macht er. „Dachte, ich kenn dich.“ Er summt zwei Töne und geht zwischen die Gräber zurück.} # tod: {ort} # stimmung: grauen
    }
- "scheiterhaufen":
    { durch_riese:
        Zuletzt hörst du nur noch den Riesen. Er weint über dir, mit der Stimme eines Jungen, und sagt dir immer wieder, dass du an allem schuld bist. Dann, leiser, zu jemandem, der nicht da ist: dass es kalt ist, Schwesterchen, so kalt. # tod: {ort} # stimmung: grauen
    - else:
        {&Der Pflasterstein unter deiner Wange ist warm vom Feuer, und es riecht nach versengtem Haar, vielleicht nach deinem. Über dir sagt eine Frau etwas, und du verstehst es nicht mehr.|Sie hören nicht auf, als du liegst. Eine Gabel, ein Stiefel, noch einmal die Gabel, und zwischen den Stiefeln steht ein Paar Holzpantinen still und tritt nicht mit. Wem sie gehören, erfährst du nicht mehr.} # tod: {ort} # stimmung: grauen
    }
- "klinik": Unter deiner Wange sind die Dielen kalt und klebrig, dieselben, auf denen du vorhin schon gelegen hast, und sie riechen nach Karbol und nach dem, was das Karbol überdecken soll. Über dir schnauft es, ohne Hast. # tod: {ort} # stimmung: grauen
- "haus": Die Kugel setzt dich auf den Boden, den Rücken an der Wand. Der Mann im Rollstuhl lädt nach und lacht dabei, ein hoher, pfeifender Ton bei jedem Einziehen des Atems; seine Finger zittern, und die Kugel findet den Lauf trotzdem beim ersten Mal. Du siehst ihm dabei zu, und es kommt dir nicht mehr wichtig vor. # tod: {ort} # stimmung: grauen
- "daecher": Der zweite Schuss trifft dich, als du dich nach dem ersten umdrehst. Zwischen Hauswänden, so eng, dass deine Schultern beide streifen, rutschst du zu Boden, und hoch über dir an der leeren Leine schaukelt die einzelne hölzerne Klammer, hin und her, und kommt nicht zur Ruhe. # tod: {ort} # stimmung: grauen
- else: {&Der Boden kommt dir entgegen, langsam, und du hast Zeit, eine Fuge zwischen zwei Steinen zu sehen, in der Moos wächst. Das Letzte, was du hörst, ist dein eigener Atem, der an einer Stelle hängen bleibt und nicht weitergeht.|Die Knie geben nach, eines nach dem anderen, und du sitzt, als hätte dich jemand behutsam dorthin gesetzt. Das Licht geht zuerst an den Rändern, zuletzt in der Mitte.|Von den Füßen her steigt die Kälte, so wie Wasser in einem Keller steigt. Als es das Herz erreicht, schlägt das Herz ihm nicht mehr entgegen.} # tod: {ort} # stimmung: grauen
}
{&Es wird dunkel, und in der Dunkelheit bewegen sich kleine graue Hände.|Das Dunkel kommt nicht von außen; es steigt in dir auf, und auf seinem Grund regen sich kleine graue Hände.|Dunkel. Irgendwo darin zupft dich etwas am Ärmel, behutsam, so wie man einen Schlafenden weckt, und es sind viele kleine Hände.}
-> nachbild
