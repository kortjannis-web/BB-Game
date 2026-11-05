// KAPITEL 1, TEIL A: ANKUNFT. Linear, mit Haltungen. Endet an der ersten Laterne.

=== k1_prolog ===
// TITEL: Prolog: Wer du bist
// Handgearbeitet 2026-11-05 nach docs/stimme.md: Aufzeichnungen in A (Ich, Präteritum), Anreise A, Fieber und Kutscher B. Optionen fließen in den Satz (#fliesst).
// [ERWEITERT] Eigene Szene vor dem Original, eingeleitet von einem Auszug aus den Aufzeichnungen des Jägers. Den Namen setzt die Oberfläche (VAR name).
// Lore: lore/kern.md, lore/kapitel/kapitel1.md (Wissenssperre), lore/welt/welt.md (Fremde sind verhasst, Blut als Heilmittel).
# kapitel: 1
KAPITEL EINS: YHARNAM # stil: titel
Aus den Aufzeichnungen, die man später fand, in einer Schrift, die gegen Ende kaum noch eine menschliche Hand verriet: # stil: tagebuch
„Ich schreibe dies nieder, solange ich die Reihenfolge der Dinge noch weiß. Man wird sagen, ich sei krank gewesen, und das ist wahr; aber eine Krankheit erklärt nicht, was ich gesehen habe, und erst recht nicht, warum ich es noch heute sehe, sobald ich die Augen schließe. Es begann mit einer Kutsche, mit Regen und mit einem Versprechen, das man mir in einer Sprache gab, die ich nur halb verstand.“ # stil: tagebuch
Seit Stunden schlingert die Kutsche über eine Straße, die fast nur noch aus Schlaglöchern besteht. Der Regen trommelt auf das Dach, und hinter der beschlagenen Scheibe zieht ein Land vorbei, das sich nicht entscheiden kann, ob es Moor sein will oder Wald: schwarze Stämme, schwarzes Wasser, und dazwischen ein Nebel, der sich bewegt, obwohl kein Wind geht. In den Dörfern, durch die ihr kommt, sind die Läden geschlossen, und an manchen Türen hängt ein Bündel trockener Kräuter, das niemand mehr erneuert hat. # bild: anreise # stimmung: ruhig
Das Fieber sitzt dir hinter den Augen. Es kommt in Wellen, wie seit Wochen, und in den Tälern zwischen den Wellen denkst du an das, was man sich in Häfen und Gasthäusern erzählt hat, leise und mit einem Blick zur Tür: Im Osten, jenseits der Berge, liege eine Stadt, deren Blut jede Krankheit heile. Keine Arznei, kein Gebet. Blut.
Im Westen hängt die Sonne tief, ein kleiner roter Fleck hinter dem Regen; sie hing schon dort, als die Kutsche losfuhr. Dann reißt der Nebel auf, und vor dir liegt Yharnam, über dem Tal aufgetürmt wie etwas, das gewachsen ist und nicht gebaut: Turm auf Turm, Giebel auf Giebel, schwarze Spitzen, so dicht gedrängt, dass sie den Himmel in schmale, kranke Streifen schneiden. Über allem erhebt sich eine Kathedrale, deren Maße dein Auge nicht halten will. Du siehst weg und weißt nicht, warum.
Der Kutscher hat seit dem letzten Dorf kein Wort gesprochen. Jetzt fragt er, ohne sich umzudrehen, woher du kommst.
* [Aus einem Haus mit großem Namen #fliesst]
    ~ herkunft = "adel"
    Aus einem Haus mit großem Namen und leeren Kellern, sagst du, und es klingt bitterer, als du es meintest. Der Kutscher lacht kurz, ohne Freude. „Hier gilt ein Name so viel wie das Blut dahinter“, sagt er.
* [Aus dem Krieg #fliesst]
    ~ herkunft = "soldat"
    Aus dem Krieg, sagst du, und mehr musst du nicht sagen. Deine Hände wissen noch, wie sich ein Bajonett anfühlt, auch wenn dein Kopf es lieber vergessen würde.
* [Aus den Hörsälen einer Universität #fliesst]
    ~ herkunft = "gelehrter"
    Aus den Hörsälen einer Universität, sagst du. Über diese Stadt hast du dort Bücher gelesen, wenige, schlecht gebunden, und ihre Verfasser brachen die Sätze mitten im Gedanken ab. Damals hieltest du das für schlechten Stil.
* [Aus einem Dorf, das es nicht mehr gibt #fliesst]
    ~ herkunft = "ueberlebender"
    Aus einem Dorf, das es nicht mehr gibt, sagst du, und die Namen der Menschen darin sprichst du nicht aus. Es ist niemand mehr da, der sie dir zurückgeben könnte.
* [Aus einem Krankenbett #fliesst]
    ~ herkunft = "kranker"
    Aus einem Krankenbett, sagst du, und dann hustest du, als müsstest du es beweisen. Die Ärzte zu Hause haben dir zuletzt nicht mehr in die Augen gesehen. An dem Tag hast du deine Sachen gepackt.
* [Vor dem Galgen davon #fliesst]
    ~ herkunft = "gesuchter"
    Vor dem Galgen bist du davon, aber das sagst du ihm nicht; du sagst gar nichts. Der Kutscher nickt, als sei auch Schweigen eine Antwort, die er oft gehört hat. „In Yharnam fragt keiner, was einer getan hat“, sagt er. „Nur, was aus ihm geworden ist.“
- Und warum, will er wissen, fährt einer freiwillig dorthin, in diesen Tagen?
* [Um selbst zu genesen #fliesst]
    ~ grund = "heilung_selbst"
    Um selbst zu genesen, sagst du, weil das Fieber dich sonst noch vor dem Winter frisst. Du sagst es so ruhig, als ginge es um das Wetter.
* [Für jemanden, der zu Hause stirbt #fliesst]
    ~ grund = "heilung_anderer"
    Für jemanden, der zu Hause in einem abgedunkelten Zimmer liegt und auf einen Brief wartet, in dem steht, dass es Hoffnung gibt. Du hast versprochen, diesen Brief zu schreiben.
* [Um jemanden zu finden, der vorausging #fliesst]
    ~ grund = "suche"
    Um jemanden zu finden, sagst du, der vor einem Jahr in dieselbe Richtung gefahren ist und seither nicht mehr geschrieben hat. Der letzte Brief roch nach Weihrauch und nach etwas darunter, für das du keinen Namen hattest.
* [Um eine Schuld abzutragen #fliesst]
    ~ grund = "schuld"
    Um eine Schuld abzutragen, sagst du, eine, die sich mit nichts begleichen lässt. Man erzählt sich, Yharnam mache aus einem Menschen etwas Neues. Vielleicht genügt das.
- Der Kutscher schweigt so lange, dass du glaubst, er habe dich nicht gehört. Dann sagt er nur: „Bald ist Jagd.“ Was er damit meint, erklärt er nicht, und du fragst nicht nach.
Die Kutsche hält in einer engen Straße vor einem hohen, schmalen Haus. Die Fenster sind von innen mit Tüchern verhängt, und über der Tür hat jemand mit roter Farbe ein einziges Wort auf ein Brett gemalt: Klinik. Der Kutscher wartet nicht, bis du die Tür geschlossen hast.
-> k1_klinik

=== k1_klinik ===
// TITEL: Iosefkas Klinik: Transfusion
// Handgearbeitet 2026-11-05: Raum in A, Begegnung in B, der Vertrag in C (Formular der Blutstelle). Optionen fließen in den Satz.
// Faktencheck 2026-11-05 (a_ankunft Nr. 1, 2, 7): böser Traum statt Fieber, Ministration als Fachwort, Stuhl mit Riemen statt Liege.
// [KANON lore:figuren/blutminister] Ein alter Mann im Rollstuhl empfängt den Fremden: Wer bleiches Blut suche, sei hier richtig; die Seuche der Heimat verschone kaum einen, das Blut der Ministration sei Yharnams Handel und heile, danach sei man wie neu; zuerst ein wenig Blut aus Yharnam und ein Vertrag; was auch geschehe, man solle es für einen bösen Traum halten. Wortlaut eigen.
// [KANON lore:orte/iosefkas-klinik] Artbook: Regale voller Flaschen; für die Transfusion ein schwerer Holzstuhl mit Riemen und ein Ständer mit zwei Flaschen.
// [KANON lore:orte/iosefkas-klinik] Vision während der Transfusion: eine Bestie aus einer Blutlache, die Feuer fängt; kleine graue Wesen kriechen über den Liegenden; eine Frauenstimme. PRÜFEN: Einzelheiten nach RK1 §1 (wahrscheinlich).
// [ERWEITERT] Die braune Tinte, die nicht abgeht: Anker für die Bindung an den Traum (nur gezeigt, nie erklärt; dass der Vertrag bindet, ist [Deutung]).
// Stimme des Blutministers: glatt, geübt, amüsiert, duzt.
Drinnen riecht es nach Karbol, nach kaltem Kerzenwachs und darunter nach Eisen. Ein langer Saal, Liegen an beiden Wänden, die meisten leer; auf einigen liegen Gestalten unter Laken, die sich nicht rühren. Öllampen brennen in Wandhaltern, und ihr Schein reicht nicht bis in die Ecken, wo das Dunkel dichter steht, als Dunkel stehen dürfte. Zwischen den verhängten Fenstern reichen Regale bis unter die Decke, Flasche an Flasche, und in manchen hat sich der Inhalt in zwei Schichten getrennt, oben hell und unten trüb. An einem Haken neben der Tür hängt eine Schürze, steif von etwas, das getrocknet ist. # bild: klinik_innen # stimmung: spannung
Am Ende des Saals sitzt ein alter Mann in einem Rollstuhl, das Gesicht zur Hälfte im Schatten. Er spricht, bevor du ihn erreichst, mit einer glatten, geübten Stimme, die diese Sätze schon sehr oft gesagt hat und jedes Mal ein kleines Vergnügen daran findet.
„Noch einer, durch den Regen, mit Fieber in den Augen. Dann hat der Kutscher dich nicht umsonst gefahren.“ Er beugt sich vor, bis das Lampenlicht seine Nasenspitze erreicht, und mustert dich, als lese er dir etwas von der Stirn ab. „Bleiches Blut“, sagt er leise, und dann lacht er in sich hinein, als hättest du ihm einen guten Witz erzählt. „Da bist du hier richtig. Nur muss man erst ein wenig von unserem Blut im Leib haben, ehe man solche Dinge versteht.“ # lore: paleblood
{ herkunft == "adel": Sein Blick wandert über deine Handschuhe, das gute Leder, die gestopften Fingerspitzen, und das Lachen wird breiter. }
„Gegen das Fieber hilft es nebenbei auch. Wo du herkommst, rafft so etwas die halben Gassen hin; hier bekommst du Blut, und danach bist du wie neu.“ Das nächste Wort spricht er aus wie ein Krämer den Namen seiner besten Ware. „Ministration. Die ganze Stadt lebt davon.“
„Erst die Papiere. Ohne Papiere kein Blut, so ist das hier.“ # lore: bluttransfusion
Er schiebt dir einen Bogen hin, eng bedruckt, mit einer Feder darauf. Die Tinte im Fass ist braun, und du bist nicht sicher, dass es Tinte ist.
Vereinbarung über die Behandlung mit Blut. Der Unterzeichnete erklärt, aus freien Stücken und bei klarem Verstand zu kommen. Er erklärt, die Behandlung zu empfangen, wie sie ihm gereicht wird, und keine andere zu verlangen. Er erklärt, dass er den Grund seiner Reise wahrheitsgemäß angegeben hat. Folgen, die aus der Behandlung erwachsen, fallen dem Empfänger zu. # stil: anschlag
* [Ungelesen unterschreiben #fliesst]
    ~ haltung_vertrag = "blind"
    Ungelesen unterschreibst du. Die Feder kratzt, und für einen Augenblick ist sie das einzige Geräusch im Saal. Der alte Mann lächelt, und das Lächeln bleibt ein wenig zu lange in seinem Gesicht.
* [Erst lesen, dann unterschreiben #fliesst]
    ~ haltung_vertrag = "wach"
    Erst liest du, Zeile für Zeile, und am Ende jedes Satzes hast du etwas verpasst, das in seiner Mitte stand. Weiter unten, in der Zeile für den Grund der Reise, stehen schon zwei Wörter: bleiches Blut. Die Schrift sieht deiner ähnlich. Du hast sie nicht geschrieben, oder du weißt es nicht mehr. Dann unterschreibst du darunter.
* [Die Feder über dem Bogen zögern lassen #fliesst]
    ~ haltung_vertrag = "zoegernd"
    Die Feder zögert über dem Bogen, und ein Tropfen fällt auf das Papier und läuft in die Fasern. Der alte Mann drängt nicht. Er wartet, die Hände im Schoß gefaltet, mit der Geduld eines Menschen, der weiß, dass am Ende jeder unterschreibt. Und du unterschreibst.
- Die Tinte bleibt an deinen Fingerkuppen kleben, braun und ein wenig zäh. Du reibst sie am Mantel ab. Sie geht nicht ab.
„Gut“, sagt der alte Mann. „Sehr gut. Und was dir heute Nacht auch über den Weg läuft und es nicht geben dürfte: Am Morgen hältst du es für einen bösen Traum. Das tun sie alle.“ Er lacht wieder, dasselbe leise Lachen, und rollt rückwärts in den Schatten, bis nur noch das Knarren der Räder von ihm bleibt.
Man setzt dich in einen schweren Stuhl aus Holz. Riemen legen sich über deine Handgelenke und über die Brust, Schnalle um Schnalle, von Händen, die du nicht siehst. Über dir hängen zwei Flaschen an einem eisernen Ständer, eine leer, eine dunkel.
Die Nadel ist dicker, als sie sein sollte. Das Blut, das in deinen Arm fließt, ist zuerst warm wie ein Bad, dann kalt wie ein Fluss im Winter, und dann ist es nichts mehr, wofür es ein Wort der Wärme oder der Kälte gäbe. Es ist fremd. Es breitet sich in dir aus und tastet, Ader um Ader, nach einem Zimmer, das ihm gehört.
Du träumst, oder etwas träumt dich. Auf dem Boden der Klinik breitet sich eine Lache aus, rot und glänzend, und aus ihr wächst eine Gestalt: zuerst Fell, dann Klauen, dann ein Kopf, der zu lang ist und zu viele Zähne hat. Es beugt sich über dich, und sein Atem riecht nach umgegrabener Erde. Dann fängt es Feuer, ohne Funken, ohne Grund, und verbrennt kreischend über dir, bis nur noch Asche in deinen Schoß rieselt. # gedaechtnis: vision_klinik # stimmung: grauen
Danach kommen die Kleinen. Graue, verdrehte Wesen, nicht größer als ein Kind, mit Gesichtern aus nassem Ton, kriechen an den Stuhlbeinen herauf, über die Riemen, über deine Knie und deine Brust, und ihre Berührung ist kalt und neugierig. Eines hebt den Kopf und sieht dich an. Du willst schreien, und deine Kehle gehorcht dir nicht.
// [KANON] Am Ende der Vision eine Frauenstimme, die sich freut, einen Jäger gefunden zu haben (Wortlaut eigen, Sprecherin [Offen]).
Ganz nah an deinem Ohr sagt eine Frauenstimme, sanft und zufrieden wie jemand, der lange gesucht hat: „Da bist du ja. Ein Jäger.“ Dann ist nichts mehr.
-> k1_erwachen

=== k1_erwachen ===
// TITEL: Erwachen und erster Tod
// Handgearbeitet 2026-11-05 in Stimme B. Optionen fließen in den Satz; der erste Tod ist unausweichlich.
// Faktencheck 2026-11-05 (a_ankunft Nr. 3, 9, 10): das Fieber ist fort, die Bestie bleibt „es“, der Zettel liegt auf dem Stuhl rechts und verrät nicht, wessen Hand ihn schrieb.
// [KANON lore:orte/iosefkas-klinik] Zettel über bleiches Blut (sinngemäß: suchen, um die Jagd zu überwinden), nach RK1 §1 auf einem Stuhl rechts (wahrscheinlich); die Bestie im Krankensaal. Dass der Jäger ihn selbst schrieb, ist [Deutung] (RK1 §1, unsicher) und wird nur im Vertragszweig „wach“ angedeutet.
// [KANON lore:gegenstaende/yharnam-und-blut] Wer einmal Blut empfing, spürt es bei jedem weiteren nach: hier als Hunger unter der Klarheit.
// Der erste Tod zählt als erster (tode = 1), damit der Traum danach nicht noch einmal „zum ersten Mal“ erzählt.
~ tode = 1
Du erwachst im Stuhl, und die Klinik ist leer. Die Riemen hängen offen von den Armlehnen, und am Ständer ist auch die dunkle Flasche durchsichtig geworden, bis auf einen roten Rand am Boden. Der Rollstuhl ist fort, die Lampen sind fast heruntergebrannt, und auf den Liegen an der Wand liegt niemand mehr unter den Laken, nur die Laken selbst, zerwühlt, als sei jemand hastig aufgestanden. Dein Arm pocht dort, wo die Nadel war, und unter der Haut bewegt sich etwas, langsam, im Takt deines Herzens. # stimmung: spannung
Das Fieber ist fort. Zum ersten Mal seit Wochen ist dein Kopf klar, so klar, dass die Kanten der Dinge schärfer stehen als zuvor, und unter der Klarheit liegt ein Hunger, der nicht nach Brot fragt.
{ grund == "heilung_selbst": Du bist gekommen, um zu genesen, und du bist genesen. Deine Hand legt sich von selbst auf die Armbeuge und bleibt dort liegen, die Finger fest um den Einstich. }
Auf dem Stuhl rechts von dir, einem einfachen, auf dem sonst ein Besucher sitzt, liegt ein Zettel, als habe jemand ihn dort vergessen. Die Schrift ist eilig, die Buchstaben drängen sich aneinander, und die letzte Zeile läuft über den Rand des Papiers hinaus. Es geht um bleiches Blut, und darum, dass man es suchen müsse, um über die Jagd hinauszukommen. Wer das geschrieben hat, weißt du nicht. # lore: paleblood
Hinter dir knarrt eine Diele.
Zwischen den Liegen richtet sich etwas auf. Es ist größer als ein Mensch und hat einmal einem gehört: Fetzen eines Hemdes hängen ihm an den Schultern, und im Fell an seiner Brust glänzt ein einzelner Hornknopf. Es atmet schwer und nass, und als es den Kopf dreht, siehst du, dass seine Augen kein Weiß mehr haben. # anzeichen: erster_tod # stimmung: grauen
* [Nach dem Stuhl rechts von dir greifen #fliesst]
    Nach dem Stuhl rechts von dir greifst du, der Zettel segelt zu Boden, und als du den Stuhl hebst, schlägt die Bestie ihn dir aus den Händen, als wäre er aus Papier.
* [Zur Tür stürzen #fliesst]
    Zur Tür stürzt du und kommst drei Schritte weit. Dann trifft dich etwas in den Rücken, schwer wie ein fallender Balken.
* [Den Atem anhalten und still sitzen #fliesst]
    Du hältst den Atem an und rührst dich nicht, die Hände flach auf den Armlehnen. Es hilft nichts. Es riecht dich, es riecht das neue Blut in deinen Adern.
- Klauen, Zähne, Gewicht. Es tut nicht weh; du staunst nur, wie schnell es geht. Dann senkt sich eine große, dunkle Stille über dich, und in dieser Stille bewegt sich etwas Kleines, Graues.
-> k1_traum_erst

=== k1_traum_erst ===
// TITEL: Erster Besuch im Jägertraum
// Handgearbeitet 2026-11-05 (Faktencheck): Garten und Haus in A, Erwachen, Boten und Waffen in B. Optionen fließen in den Satz.
// [KANON lore:orte/jaegertraum] Erster Besuch: das Haus ist verschlossen, die Puppe leblos, die Boten geben Wandelwaffe und Feuerwaffe. PRÜFEN: Reihenfolge.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Sägespalter: Zähne, die Bestienblut ziehen, Klinge, die sich ausklappt. Pistole und Donnerbüchse: Quecksilberkugeln, mit dem Blut des Trägers verschmolzen (LK §19); hier gezeigt durch den Stich in die Fingerkuppe.
// Übergreifend Nr. 6: Der Name „Boten“ fällt dem Jäger einmal zu; das bleibt die einzige solche Eingebung.
~ ort = "traum"
Du liegst auf dem Rücken, und über dir steht ein Himmel ohne Sonne, ohne Wolken und ohne Sterne, von der Farbe alten Elfenbeins, ein Himmel, der weder Tag sein will noch Nacht. Unter deinen Händen wachsen Blumen, weiß und unzählig, und ihr Duft ist so süß, dass er dir die Kehle zuschnürt. # bild: traum # stimmung: ruhig # lore: jaegertraum
Beim Aufstehen tastest du nach der Stelle, an der dich die Klauen trafen, und findest den Mantel heil und die Haut darunter glatt. Du lebst. Der Gedanke ist zu groß für deinen Kopf, und so legst du ihn beiseite wie einen Brief, den man später öffnen will. Nur der Einstich in der Armbeuge pocht noch, und er ist frisch. Kein Vogel singt hier, kein Wind geht, nirgends läuft Wasser; zu hören ist nur dein eigenes Herz.
Ein Pfad führt zwischen Grabsteinen einen Hügel hinauf zu einem kleinen Haus, in dessen Fenstern Licht brennt, ohne dass sich dahinter je ein Schatten bewegt. Die Tür ist verschlossen. Im Garten stehen leere Bänke, und im Gras liegt eine umgekippte Gießkanne, längst trocken, während ringsum alles blüht. Es ist ein Ort, den jemand sehr geliebt und dann sehr lange nicht mehr betreten hat.
// [ERWEITERT] Kein Weg hinaus. PRÜFEN: Gartentor im Original.
Am Zaun entlang suchst du ein Tor. Jeder Weg biegt zwischen den Grabsteinen ab, sanft und ohne Eile, und bringt dich zum Fuß des Hügels zurück, und beim dritten Mal erkennst du den Stein wieder, an dem du losgegangen bist.
Am Fuß einer Treppe steht eine Frau, reglos, in einem schlichten Kleid und mit einer Haube. Erst als du näher kommst, siehst du die Gelenke an ihren Händen: Sie ist eine Puppe, so groß wie ein Mensch, mit einem Gesicht, so sorgfältig gemalt, dass sich an den Wimpern jeder Pinselstrich zählen lässt. Ihre Augen sind offen. Sie sehen dich nicht. # lore: puppe
Dann regt sich der Boden. Zwischen den Blumen bricht die Erde auf, und heraus kriechen die kleinen grauen Wesen aus deinem Fiebertraum, und diesmal träumst du nicht. Sie fürchten dich nicht. Sie drängen heran wie Leute, die abholen, was man ihnen versprochen hat, und strecken dir ihre dünnen Arme entgegen, und in ihren Händen liegen Waffen. Boten, denkst du, und weißt nicht, wer dir das Wort eingegeben hat. # lore: boten
// Entscheidung des Nutzers (2026-11-04): keine Waffenwahl, der Sägespalter reicht.
~ waffe = "saege"
Die erste Waffe, die sie dir reichen, ist ein Sägespalter: eine gezahnte Klinge, die mit einem Ruck aus ihrem Gelenk schnellt und dann doppelt so lang ist. Die Zähne stehen schräg nach hinten, so gefeilt, dass sie beim Herausziehen mehr mitnehmen als beim Hineingehen. Das Leder am Griff ist schwarz und glatt gegriffen, und in der Mulde für den Daumen hat ein anderer Daumen vor dir eine Kuhle hinterlassen.
Dann halten dir zwei Hände je eine Feuerwaffe hin, Hände, die zu klein sind, um dieses Gewicht zu tragen, und es trotzdem tragen.
* [Nach der schweren Pistole greifen #fliesst]
    ~ feuerwaffe = "pistole"
    Nach der schweren Pistole greifst du, und ihr Gewicht legt sich in deine Hand, als habe sie dort schon einmal gelegen.
* [Die kurze Büchse mit dem Trichter nehmen #fliesst]
    ~ feuerwaffe = "donnerbuechse"
    Die kurze Büchse mit dem Trichter nimmst du, eine plumpe Donnerbüchse, deren Lauf sich zur Mündung hin weitet, damit eine Handvoll Kugeln auf einmal hinausfährt.
- Ein Bote zupft dich am Ärmel. In seiner Hand liegt eine Nadel, und ehe du zurückweichen kannst, sticht er dir in die Fingerkuppe, ohne Hast und ohne Bosheit. Den Tropfen, der aufquillt, reibt er auf eine Kugel aus Quecksilber, die in seiner Handfläche zittert, als lebe sie, und das Blut zieht in das Silber ein und ist fort. Dann legt er die Kugel zu den anderen, in die Tasche an deinem Gürtel.
Nur vor einem Grabstein am Fuß des Hügels, einem ohne Namen, sind die Blumen niedergetreten, zu einem schmalen Pfad aus geknickten Stängeln. Als du die Hand auf den Stein legst, verschwimmen der Garten, die Blumen, die Puppe und das Haus wie Farbe in Wasser, und der Geruch von Karbol kehrt zurück.
-> k1_klinik_kampf

=== k1_klinik_kampf ===
// TITEL: Lernkampf in der Klinik
// Handgearbeitet 2026-11-05 (Faktencheck): Anzeichen ruhig und genau, Folge kurz und hart; Optionen fließen in den Satz und nennen die Richtung.
// [KANON lore:orte/iosefkas-klinik] Die Bestie im Krankensaal frisst an einer Leiche (RK1 §1). Erster Kampf, lehrt das Lesen der Anzeichen. Kronleuchter und Flaschenregale aus dem Artbook (LK §25.3).
~ laterne = -> k1_klinik_kampf
-> betreten("klinik") ->
{ k1_klinik_kampf == 1:
    Du stehst wieder in der Klinik, auf genau der Diele, auf der du gestorben bist. Das Holz unter deinen Stiefeln ist noch dunkel und klebt. Deine Hand liegt um den Griff des Sägespalters, so fest, dass die Knöchel weiß hervortreten. # stimmung: kampf
- else:
    Wieder die Klinik, wieder Karbol und Eisen. Inzwischen kennst du die Diele, die unter dem ersten Schritt knarrt, und die Stelle auf dem Boden, an der du zuletzt gelegen hast. # stimmung: kampf
}
Die Bestie hockt zwischen den Liegen über einem Körper, von dem nur noch ein Fuß in einem Filzpantoffel zu dir herüberzeigt. Sie hebt den Kopf, als hätte sie auf dich gewartet. # kampf: klinik_bestie
- (t1)
Sie duckt sich tief. Die Hinterläufe spannen sich, die Krallen graben sich in die Dielen, und das ganze Gewicht ihres Körpers wandert nach hinten wie bei einer Feder, die man zusammendrückt. Ihr Blick hängt an der Stelle, an der du stehst, und links von dir ist zwischen zwei Liegen eine Lücke frei. # anzeichen: klinik_sprung
{ gelernt ? klinik_sprung: Du kennst das. Wer sich so duckt, springt, und er springt dorthin, wo du jetzt stehst. }
+ [Nach links ausweichen #fliesst]
    Nach links wirfst du dich, flach über die Dielen. Die Bestie fliegt an dir vorbei, so nah, dass ihr Fell dein Gesicht streift, und kracht in ein Regal. Glas zersplittert, und über den Boden läuft, was in den Flaschen war, dunkel und dick.
    -> t2
+ [Nach vorn gegen den Sprung stemmen #fliesst]
    Nach vorn stemmst du dich gegen den Sprung, die Klinge quer vor der Brust. Das Gewicht trifft dich wie ein Fuhrwerk und wirft dich rückwärts gegen eine Liege, und in deiner Schulter knackt es.
    ~ zuletzt = klinik_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Sie richtet sich auf, größer, als du dachtest, und hebt beide Arme über den Kopf, bis die Krallen beinahe an den Kronleuchter rühren. Für einen Augenblick steht sie offen da wie ein Prediger auf der Kanzel, und unter ihren Armen, zwischen Achsel und Hüfte, klafft eine Lücke, breit genug für einen Menschen. # anzeichen: klinik_schwer
+ [Unter den Armen hindurch nach vorn #fliesst]
    Unter den Armen hindurch gehst du nach vorn, in den Schlag hinein statt aus ihm heraus. Hinter dir fahren die Arme zusammen, und deine Säge findet ihre Seite. Sie heult, und es klingt fast menschlich.
    -> t3
+ [Zwei Schritte nach hinten weichen #fliesst]
    Zwei Schritte weichst du nach hinten, aber die Arme reichen weiter, als du gedacht hast. Die Krallen ziehen drei heiße Linien über deine Brust.
    ~ zuletzt = klinik_schwer
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
- (t3)
Sie taumelt. Blut läuft ihr aus der Seite, und der Kopf sinkt auf deine Höhe herab. Dann reißt sie das Maul auf, so weit, dass hinter den Zähnen der Schlund offen liegt, und für einen Herzschlag hält sie still, den Atem tief in der Brust, bevor sie zubeißt. # anzeichen: biss
+ [Vorn in das offene Maul schießen #fliesst]
    { feuerwaffe == "pistole":
        Vorn in das offene Maul schießt du, eine einzige Kugel, und der Knall springt zwischen den Wänden hin und her.
    - else:
        Vorn in das offene Maul schießt du, und die Donnerbüchse speit ihre Handvoll Kugeln so nah hinein, dass dir das Blut warm ins Gesicht spritzt.
    }
    Die Bestie bricht in die Knie, und du bist über ihr, bevor sie sich fangen kann.
    -> sieg
+ [Mit der Säge von oben zuschlagen #fliesst]
    Mit der Säge schlägst du von oben zu, und im selben Herzschlag beißt sie. Ihre Zähne schließen sich um deinen Unterarm, dann erschlaffen sie.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
- (sieg)
~ echos = echos + 2
Die Bestie liegt still. Aus ihrem Körper steigt ein Schimmer, dünner als Rauch, und fließt dir über die Hände in die Ärmel, und für einen Augenblick bist du satt, als hättest du gegessen, warm bis in die Fingerspitzen. # notiz: blutechos
Lange stehst du da und siehst sie an. Im Fell an ihrer Brust glänzt der Hornknopf, und an ihm hängen noch zwei Fäden. Irgendjemand hat ihn einmal angenäht.
Dann ruft hinter einer Tür am Ende des Ganges eine Frauenstimme, gedämpft durch das Holz, ob da draußen noch jemand atme.
-> k1_iosefka

=== k1_iosefka ===
// TITEL: Iosefkas Tür
// Handgearbeitet 2026-11-05 (Faktencheck Nr. 6, 11): Tür in A, Iosefka in B. Optionen fließen in den Satz.
// [KANON lore:figuren/iosefka] Iosefka öffnet nicht, damit ihre Patienten sich nicht anstecken; sie weiß, dass der Jäger für die Stadt jagt, und gibt eine Blutampulle hinaus. Sie hofft auf das Ende der Nacht, um dem Jäger dann ins Gesicht zu sehen, sollte das nicht denken und freut sich trotzdem; sie betet um Licht für ihn. Wer gegen die Tür schlägt, wird gefragt, warum er sich wie ein Tier benimmt, er jage doch Bestien; danach: sich nicht von der Jagd überwältigen lassen. Wortlaut eigen.
// [ERWEITERT] Ort: Im Kanon spricht man Iosefka von außen an der Kliniktür, nach dem ersten Traum (RK1 §3). Bei uns hinter einer Tür im Inneren der Klinik, vor der ersten Laterne.
// [ERWEITERT] „Besser als das, was die Kirche ausgibt“: eigener Vergleich (Kanon: verfeinertes Blut, Spezialität der Klinik, lore:gegenstaende/yharnam-und-blut).
// [ERWEITERT] Ihre Eigenart (Sie-Form, „Das notiere ich“) ist der Maßstab, an dem man in Kapitel 2 die Hochstaplerin erkennt; ebenso ihre Wärme.
Die Tür am Ende des Ganges ist aus schwerem Holz, mit Eisen beschlagen und von innen verriegelt. Unter ihr liegt ein Streifen Licht, und durch die Ritze zieht ein scharfer Geruch nach Alkohol und Kampfer, sauberer als alles andere in diesem Haus.
„Bleiben Sie, wo Sie sind.“ Die Stimme ist jung, müde und sehr genau, und sie setzt jedes Wort wie einen Stich mit der Nadel. „Ich bin Iosefka, und das hier ist meine Klinik. Heute Nacht öffne ich nicht, nicht für Sie und für niemanden sonst. Meine Kranken dürfen sich nicht anstecken, und was die Jagd aus den Menschen macht, lasse ich nicht zu ihnen herein.“ # notiz: iosefka
* [Leise durch das Holz bitten #fliesst]
    ~ iosefka = iosefka + 1
    Leise bittest du durch das Holz, mit der Geduld, die man in Wartezimmern lernt. Hinter der Tür ein kurzes Schweigen, dann ein Laut, der beinahe ein Lachen ist. „Ein höflicher Jäger. Das notiere ich mir.“ Drinnen kratzt tatsächlich eine Feder. Dann, leiser und mehr zu sich selbst: „Wenn diese Nacht vorbei ist, schiebe ich den Riegel zurück, und dann möchte ich das Gesicht sehen, das so höflich war.“ Eine Pause. „So etwas sollte ich nicht einmal denken. Ich denke es trotzdem gern.“ # notiz: iosefka_stimme
* [Mit der Faust gegen das Holz schlagen #fliesst]
    ~ iosefka = iosefka - 1
    Mit der Faust schlägst du gegen das Holz, bis dir die Knöchel brennen. Drinnen wird es still. Dann, nah an der Ritze: „Sind Sie das noch, der Jäger, der für diese Stadt jagt? Oder schon das, was die Jagd aus ihm gemacht hat? Sie jagen Bestien. Benehmen Sie sich nicht wie eine.“ Eine Weile hörst du nur ihren Atem. „Faustschläge gegen eine verriegelte Tür“, sagt sie dann, kühl. „Das notiere ich auch.“ Eine Feder kratzt. # notiz: iosefka_stimme
- Über die Dielen schabt Glas. Durch den Spalt unter der Tür schiebt sich eine kleine Phiole, und das Blut darin ist heller als alles Blut, das du in dieser Stadt gesehen hast, und durch das Glas hindurch warm. „Aus meinem eigenen Vorrat“, sagt sie. „Besser als das, was die Kirche ausgibt. In den Oberschenkel, kräftig, und nicht zögern. Sie jagen für diese Stadt, ob die Stadt es Ihnen dankt oder nicht. Mehr kann ich nicht für Sie tun.“ # notiz: blutampulle
~ ampulle = 1
{ iosefka > 0:
    Ihre Stimme entfernt sich schon, als sie noch einmal spricht. „Ich bete, dass Ihnen in dieser Nacht ein Licht bleibt.“
- else:
    Ihre Stimme entfernt sich schon, als sie noch einmal spricht. „Und lassen Sie nicht zu, dass die Jagd Sie frisst.“
}
Dann Schritte, die leiser werden, und gedämpft durch eine zweite Tür das Stöhnen von jemandem, der in einem Bett liegt und nicht schlafen kann.
-> k1_laterne_zentral

=== k1_laterne_zentral ===
// TITEL: Laterne Zentral-Yharnam
// Handgearbeitet 2026-11-05 (Faktencheck): Gasse in A, Laterne und Boten in B. Sonne nur als Wahrnehmung (G5).
// [KANON lore:orte/zentral-yharnam] Erste Laterne gleich vor der Klinik, neben Gilberts Fenster (Gilbert hier nur als Husten hinter dem Gitter; Begegnung in b_yharnam).
Vor der Klinik schlägt dir kalte Luft entgegen, die nach Rauch riecht, nach nassem Stein und nach einem Brand, in dem kein Holz gebrannt hat. Die Gasse ist steil und leer. Zwischen zwei Giebeln hängt die Sonne, tief und rot, und du wartest darauf, dass sie sinkt.
Neben der Tür steht auf einem eisernen Pfahl eine Laterne, erloschen, das Glas von innen verrußt. Als du sie berührst, flammt sie auf, ohne dass du Feuer gemacht hättest, und um ihren Fuß bricht die Erde auf: Die Boten kriechen heraus, drei, vier, und drängen sich an das Eisen, wo es warm ist. Über dir, hinter einem vergitterten Fenster, bricht ein Husten ab, mitten im Anfall. # bild: laterne # lore: laternen
Im Flackern hinter dem Glas liegt für einen Lidschlag der Garten, weiß und still, und sein süßer Duft weht dir in die Nase. Dorthin führt von hier ein Weg zurück, das weiß dein Körper, bevor du es denkst; an einer Laterne kannst du nicht verloren gehen. Ein zweiter Gedanke folgt dem ersten so leise, dass du nicht weißt, ob er deiner ist: Wer nicht verloren gehen kann, kann auch nicht davonlaufen.
~ laterne = -> k1_hub_b
-> k1_hub_b
