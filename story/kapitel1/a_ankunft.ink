// KAPITEL 1, TEIL A: ANKUNFT. Linear, mit Haltungen. Endet an der ersten Laterne.

=== k1_prolog ===
// TITEL: Prolog: Wer du bist
// [ERWEITERT] Eigene Szene vor dem Original, eingeleitet von einem Auszug aus den Aufzeichnungen des Jägers. Den Namen setzt die Oberfläche (VAR name).
# kapitel: 1
KAPITEL EINS: YHARNAM # stil: titel
Aus den Aufzeichnungen, die man später fand, in einer Schrift, die gegen Ende kaum noch eine menschliche Hand verriet: # stil: tagebuch
„Ich schreibe dies nieder, solange ich noch weiß, in welcher Reihenfolge die Dinge geschahen. Man wird sagen, ich sei krank gewesen, und das ist wahr. Aber die Krankheit erklärt nicht, was ich gesehen habe, und sie erklärt erst recht nicht, warum ich es bis heute sehe, wenn ich die Augen schließe. Es begann mit einer Kutsche, mit Regen und mit einem Versprechen, das man mir in einer fremden Sprache gab.“ # stil: tagebuch
Die Kutsche schlingert seit Stunden über eine Straße, die nur noch aus Schlaglöchern zu bestehen scheint. Regen trommelt auf das Dach, und durch die beschlagene Scheibe siehst du ein Land, das sich nicht entscheiden kann, ob es Moor ist oder Wald: schwarze Stämme, schwarzes Wasser, und dazwischen ein Nebel, der sich bewegt, auch wenn kein Wind geht. # bild: anreise # stimmung: ruhig
Das Fieber sitzt dir hinter den Augen. Es kommt in Wellen, wie seit Wochen, und in den Tälern zwischen den Wellen denkst du an das, was man sich in den Häfen und Gasthäusern erzählt hat: dass es im Osten, jenseits der Berge, eine Stadt gibt, deren Blut alles heilt. Keine Arznei, kein Gebet, kein Glaube an irgendetwas. Blut.
Dann teilt sich der Nebel, und du siehst sie. Yharnam liegt über dem Tal wie etwas, das gewachsen und nicht gebaut wurde: Turm auf Turm, Giebel auf Giebel, schwarze Spitzen, die so dicht stehen, dass sie den Himmel in schmale, kranke Streifen schneiden. Über allem eine Kathedrale, deren Ausmaße dein Auge nicht fassen will. Du wendest den Blick ab, ohne zu wissen, warum.
Der Kutscher hat seit dem letzten Dorf kein Wort mehr gesprochen. Jetzt fragt er, ohne sich umzudrehen, woher du kommst.
* [Aus verarmtem Adel]
    ~ herkunft = "adel"
    „Aus einem Haus mit einem großen Namen und leeren Kellern“, sagst du. Der Kutscher lacht kurz, ohne Freude. Hier, sagt er, gelte ein Name nur so viel wie das Blut dahinter.
* [Aus dem Krieg]
    ~ herkunft = "soldat"
    „Aus dem Krieg“, sagst du, und mehr musst du nicht sagen. Deine Hände wissen noch, wie sich ein Bajonett anfühlt, auch wenn dein Kopf es lieber vergessen würde.
* [Aus den Hörsälen]
    ~ herkunft = "gelehrter"
    „Von der Universität.“ Du hast Bücher über diese Stadt gelesen, wenige, schlecht gebundene, deren Verfasser ihre Sätze mitten im Gedanken abbrachen. Damals hielt man das für schlechten Stil.
* [Als Einziger, der übrig blieb]
    ~ herkunft = "ueberlebender"
    „Von nirgendwo mehr.“ Das Dorf, aus dem du kommst, gibt es nicht mehr, und die Namen der Menschen darin sprichst du nicht aus, weil niemand mehr da ist, der sie dir zurückgeben könnte.
* [Aus einem Fieber, das dich nicht loslässt]
    ~ herkunft = "kranker"
    „Aus dem Bett“, sagst du und hustest. Die Ärzte zu Hause haben aufgehört, dir in die Augen zu sehen. Das war der Tag, an dem du deine Sachen gepackt hast.
* [Vor dem Galgen davon]
    ~ herkunft = "gesuchter"
    Du antwortest nicht. Der Kutscher nickt, als sei auch das eine Antwort, die er schon oft gehört hat. Nach Yharnam, sagt er, fragt niemand, was einer getan hat. Nur, was er geworden ist.
- Und warum, will er wissen, kommt jemand freiwillig hierher, in diesen Tagen?
* [Um selbst geheilt zu werden]
    ~ grund = "heilung_selbst"
    Weil das Fieber dich sonst noch vor dem Winter frisst. Du sagst es so ruhig, als ginge es um das Wetter.
* [Für jemanden, der zu Hause stirbt]
    ~ grund = "heilung_anderer"
    Weil zu Hause jemand in einem abgedunkelten Zimmer liegt und auf einen Brief wartet, der sagt, dass es Hoffnung gibt. Du hast versprochen, diesen Brief zu schreiben.
* [Um jemanden zu finden, der hierher ging]
    ~ grund = "suche"
    Weil jemand, den du liebst, vor einem Jahr in dieselbe Richtung gefahren ist und seitdem nicht mehr geschrieben hat. Der letzte Brief roch nach Weihrauch und nach etwas darunter, das du nicht benennen konntest.
* [Weil du etwas wiedergutmachen musst]
    ~ grund = "schuld"
    Weil du etwas getan hast, das sich nicht wiedergutmachen lässt, und weil man sagt, Yharnam mache aus einem Menschen etwas Neues. Vielleicht genügt das.
- Der Kutscher schweigt lange. Dann sagt er nur: „Die Jagd ist bald.“ Du verstehst nicht, was er meint, und er erklärt es nicht.
Die Kutsche hält in einer engen Straße vor einem hohen, schmalen Haus. Die Fenster sind von innen mit Tüchern verhängt, und über der Tür hängt ein Schild, das jemand mit roter Farbe beschriftet hat: eine Klinik. Der Kutscher wartet nicht, bis du die Tür geschlossen hast.
-> k1_klinik

=== k1_klinik ===
// TITEL: Iosefkas Klinik: Transfusion
// [KANON] Der Blutminister, der Vertrag (im Original die Charaktererstellung), die Transfusion. Wortlaut nur sinngemäß.
Drinnen riecht es nach Karbol, nach kaltem Kerzenwachs und, darunter, nach Eisen. Ein langer Raum, Liegen an den Wänden, die meisten leer, auf einigen liegen Gestalten unter Laken, die sich nicht bewegen. Das Licht kommt von Öllampen, deren Schein nicht bis in die Ecken reicht, und in diesen Ecken scheint das Dunkel dichter zu sein, als Dunkel sein dürfte. # bild: klinik_innen # stimmung: spannung
Am Ende des Raumes sitzt ein alter Mann in einem Rollstuhl. Sein Gesicht liegt halb im Schatten, und als er spricht, klingt seine Stimme, als habe er seit Jahrzehnten nichts anderes getan, als genau diese Sätze zu sagen.
Ah, sagt er, du hast dir also Yharnam ausgesucht, um das Blut zu empfangen. Eine gute Wahl. Aber zuerst brauche es einen Vertrag, eine Formalität, mehr nicht. # lore: bluttransfusion
Er schiebt dir ein Papier hin. Die Tinte ist braun, und du bist nicht sicher, ob es Tinte ist.
* [Unterschreiben, ohne zu lesen]
    ~ haltung_vertrag = "blind"
    Du unterschreibst. Die Feder kratzt, und für einen Moment ist es das einzige Geräusch im Raum. Der alte Mann lächelt, und das Lächeln bleibt etwas zu lange in seinem Gesicht.
* [Lesen, dann unterschreiben]
    ~ haltung_vertrag = "wach"
    Du liest. Die Sätze sind lang und verschachtelt, und am Ende eines jeden fühlst du dich, als hättest du etwas verpasst, das in der Mitte stand. Nur ein Wort bleibt hängen, weil es so fremd ist: bleiches Blut. Du unterschreibst trotzdem. # lore: paleblood
* [Zögern, bis er lächelt und wartet]
    ~ haltung_vertrag = "zoegernd"
    Du zögerst. Der alte Mann sagt nichts, er drängt nicht. Er wartet nur, mit der Geduld eines Menschen, der weiß, dass am Ende jeder unterschreibt. Und du unterschreibst.
- Gut, sagt er, sehr gut. Was immer geschehe, du mögest es für einen bösen Traum halten.
Man legt dich auf eine Liege. Die Nadel ist dicker, als sie sein sollte. Das Blut, das in deinen Arm fließt, ist zuerst warm wie ein Bad, dann kalt wie ein Fluss im Winter, und dann ist es nichts mehr, das man mit einem Wort für Temperatur beschreiben könnte. Es ist fremd. Es breitet sich in dir aus, als suche es etwas.
// [KANON] Fiebervision: eine Bestie steigt aus einer Blutlache, fängt Feuer; kleine graue Wesen kriechen über dich. PRÜFEN: Einzelheiten nur aus Erinnerung.
Du träumst, oder etwas träumt dich. Auf dem Boden der Klinik breitet sich eine Lache aus, rot und glänzend, und aus ihr steigt etwas auf: zuerst Fell, dann Klauen, dann ein Kopf, der zu lang ist und zu viele Zähne hat. Es beugt sich über dich, und sein Atem riecht nach Grab. Dann fängt es Feuer, einfach so, als hätte jemand es so beschlossen, und verbrennt kreischend, bis nur Asche bleibt. # gedaechtnis: vision_klinik # stimmung: grauen
Und dann kommen die Kleinen. Graue, verdrehte Wesen, nicht größer als ein Kind, mit Gesichtern wie aus nassem Ton, kriechen über die Kante der Liege, über deine Beine, deine Brust, und ihre Berührung ist kalt und neugierig. Eines von ihnen sieht dich an. Du willst schreien. Es gelingt dir nicht. Dann ist da nichts mehr.
-> k1_erwachen

=== k1_erwachen ===
// TITEL: Erwachen und erster Tod
// [KANON] Notiz über bleiches Blut an der Wand. Der erste Tod ist unausweichlich und zählt nicht.
Du erwachst. Die Klinik ist leer, der Rollstuhl verschwunden, die Lampen fast heruntergebrannt. Dein Arm schmerzt dort, wo die Nadel war, und unter der Haut fühlt es sich an, als bewege sich etwas, langsam, im Takt deines Herzens. # stimmung: spannung
An der Wand, auf Augenhöhe, steckt ein Zettel. Die Schrift ist eilig, die Buchstaben drängen sich aneinander, als habe der Schreiber keine Zeit gehabt oder keine Ruhe: Etwas über bleiches Blut, und darüber, dass man es suchen müsse, um die Jagd zu überwinden. Du weißt nicht, wer das geschrieben hat. Du hast das unbestimmte Gefühl, dass es deine eigene Handschrift sein könnte. # lore: paleblood
Hinter dir knarrt eine Diele.
Zwischen den Liegen richtet sich etwas auf. Es ist größer als ein Mensch und hat einmal einer gehört: Fetzen eines Hemdes hängen an seinen Schultern, ein Knopf glänzt im Fell. Es atmet schwer und nass, und als es den Kopf dreht, siehst du, dass seine Augen kein Weiß mehr haben. # anzeichen: erster_tod # stimmung: grauen
* [Nach etwas greifen, das als Waffe taugt]
    Deine Hand findet einen Stuhl, du hebst ihn, und die Bestie schlägt ihn dir aus den Händen, als wäre er aus Papier.
* [Zur Tür rennen]
    Du kommst drei Schritte weit. Dann trifft dich etwas in den Rücken, schwer wie ein fallender Balken.
* [Still liegen bleiben]
    Du hältst den Atem an. Es hilft nichts; sie riecht dich, sie riecht das neue Blut in deinen Adern.
- Klauen, Zähne, Gewicht. Du spürst keinen Schmerz, nur Erstaunen darüber, wie schnell es geht, und dann eine große, dunkle Stille, in der sich etwas Kleines, Graues bewegt.
-> k1_traum_erst

=== k1_traum_erst ===
// TITEL: Erster Besuch im Jägertraum
// [KANON] Erster Besuch: das Haus ist verschlossen, die Puppe leblos, die Boten geben Wandelwaffe und Feuerwaffe. PRÜFEN: Reihenfolge.
~ ort = "traum"
Du liegst auf dem Rücken. Über dir ein Himmel ohne Sonne, ohne Wolken, ohne Sterne, ein Himmel von der Farbe alten Elfenbeins, der weder Tag noch Nacht ist. Unter deinen Händen Blumen, weiß und unzählig, und ihr Duft ist so süß, dass er dir die Kehle zuschnürt. # bild: traum # stimmung: ruhig # lore: jaegertraum
Du stehst auf. Du lebst. Du solltest nicht leben. Der Gedanke ist so groß, dass er keinen Platz in deinem Kopf findet, und so legst du ihn beiseite wie einen Brief, den man später lesen will.
Ein Pfad führt zwischen Grabsteinen einen Hügel hinauf zu einem kleinen Haus mit erleuchteten Fenstern. Die Tür ist verschlossen. Im Garten stehen leere Bänke, an einem Baum lehnt ein Rollstuhl, in dem niemand sitzt, und alles hier wirkt wie ein Ort, den jemand sehr geliebt und dann sehr lange nicht mehr betreten hat.
Am Fuß einer Treppe steht eine Frau, reglos, in einem schlichten Kleid und mit einer Haube. Erst als du näher kommst, siehst du die Gelenke an ihren Händen: Sie ist eine Puppe, so groß wie ein Mensch, mit einem Gesicht von stiller, unheimlicher Schönheit. Ihre Augen sind offen. Sie sehen dich nicht. # lore: puppe
Dann bewegt sich der Boden. Aus der Erde zwischen den Blumen kriechen die kleinen grauen Wesen aus deinem Traum, und diesmal träumst du nicht. Sie fürchten dich nicht. Sie strecken dir ihre dünnen Arme entgegen, und in ihren Händen liegen Waffen. Es sind Boten, denkst du, ohne zu wissen, woher dieses Wort kommt. # lore: boten
Die erste Waffe, die sie dir reichen, ist eine Wandelwaffe der Jäger, gemacht, um sich im Kampf zu verwandeln.
* [Den Sägespalter: reißt, schnell, ausgeklappt weit]
    ~ waffe = "saege"
    Eine gezahnte Klinge, die sich zu doppelter Länge ausklappt. Sie ist nicht dafür gemacht, schnell zu töten, sondern dafür, Fleisch zu zerreißen, und du begreifst mit einem kalten Schauer, dass die Leute, die sie entworfen haben, genau wussten, wogegen sie kämpfen.
* [Die Jägeraxt: spaltet, wuchtig, langsam]
    ~ waffe = "axt"
    Eine schwere Axt, deren Stiel sich zu einer langen Stange ausfahren lässt. Sie liegt dir wie ein Versprechen in der Hand: Was immer kommt, sie wird es spalten.
* [Den Gewindestock: elegant, wird zur Peitsche]
    ~ waffe = "stock"
    Ein Spazierstock eines Gentleman, besetzt mit Klingen, die sich mit einem Ruck zu einer Peitsche aus Stahl entrollen. Eine Waffe für jemanden, der Würde behalten will, während er Dinge tut, die keine Würde kennen.
- Dazu eine Feuerwaffe. Sie ist nicht zum Töten, das begreifst du erst später, sondern um im richtigen Augenblick etwas zum Wanken zu bringen.
* [Die Pistole: genau]
    ~ feuerwaffe = "pistole"
    Eine schwere Pistole, die Kugeln aus Quecksilber verschießt. Ihr Gewicht beruhigt dich.
* [Die Donnerbüchse: streut, hält auf Abstand]
    ~ feuerwaffe = "donnerbuechse"
    Eine kurze, plumpe Büchse mit trichterförmigem Lauf, die eine Handvoll Kugeln auf einmal in die Welt speit.
- Am Rand des Gartens steht ein Grabstein, auf dem kein Name steht. Als du ihn berührst, verschwimmt der Garten, die Blumen, die Puppe, das Haus, wie Farbe in Wasser, und der Geruch von Karbol kehrt zurück.
-> k1_klinik_kampf

=== k1_klinik_kampf ===
// TITEL: Lernkampf in der Klinik
// [KANON] Die Bestie in der Klinik. Erster Kampf, lehrt das Lesen der Anzeichen.
~ laterne = -> k1_klinik_kampf
-> betreten("klinik") ->
{ k1_klinik_kampf == 1:
    Du stehst wieder in der Klinik, auf genau der Diele, auf der du gestorben bist. Deine Hand liegt um den Griff der Waffe, und zum ersten Mal in dieser Nacht fühlst du so etwas wie Zorn. # stimmung: kampf
- else:
    Wieder die Klinik, wieder der Geruch von Eisen. Du kennst diesen Raum jetzt besser, als dir lieb ist. # stimmung: kampf
}
Die Bestie hockt zwischen den Liegen, über etwas gebeugt, das du nicht ansehen willst. Sie hebt den Kopf, als hätte sie auf dich gewartet. # kampf: klinik_bestie
- (t1)
Sie duckt sich tief. Die Hinterläufe spannen sich, die Krallen graben sich in die Dielen, und das ganze Gewicht ihres Körpers wandert nach hinten wie bei einer Feder, die man zusammendrückt. # anzeichen: sprung
{ gelernt ? sprung: Du kennst das. Wer sich so duckt, springt, und er springt dorthin, wo du jetzt stehst. }
+ [Zur Seite ausweichen]
    Du wirfst dich nach links. Die Bestie fliegt an dir vorbei, so nah, dass ihr Fell dein Gesicht streift, und kracht in ein Regal. Glas zersplittert, irgendetwas Flüssiges läuft über den Boden.
    -> t2
+ [Den Sprung mit der Waffe abfangen]
    Du stemmst dich gegen den Sprung, als könntest du ihn aufhalten. Das Gewicht trifft dich wie ein Fuhrwerk und wirft dich gegen eine Liege. Etwas in deiner Schulter knackt.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Sie richtet sich auf, größer, als du dachtest, und hebt beide Arme weit über den Kopf. Für einen Augenblick steht sie offen da, wie ein Prediger auf der Kanzel. # anzeichen: schwer
+ [Unter dem Schlag hindurch nach vorn]
    Du gehst nach vorn statt zurück, in den Schlag hinein und unter ihm hindurch. Die Arme fahren hinter dir zusammen, und deine Waffe findet ihre Seite. Sie heult, und es klingt fast menschlich.
    -> t3
+ [Zurückweichen]
    Du weichst zurück, aber die Arme sind länger, als sie aussehen. Die Krallen ziehen drei heiße Linien über deine Brust.
    ~ zuletzt = schwer
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
- (t3)
Sie taumelt, Blut tropft aus ihrer Seite, und sie reißt das Maul auf, um ein letztes Mal nach dir zu schnappen. # anzeichen: biss
+ [Feuerwaffe ins aufgerissene Maul]
    Du hebst die Feuerwaffe und schießt, mitten hinein. Die Bestie bricht in die Knie, und du bist über ihr, bevor sie sich fangen kann.
    -> sieg
+ [Zuschlagen, bevor sie beißt]
    Du schlägst zu, und sie beißt zu, im selben Herzschlag. Ihre Zähne schließen sich um deinen Unterarm, dann erschlaffen sie.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
- (sieg)
~ echos = echos + 2
Die Bestie liegt still. Aus ihrem Körper steigt etwas auf, kein Rauch, kein Dampf, sondern eine Art Schimmer, der in dich hineinfließt, und für einen Augenblick fühlst du dich stärker, satter, als hättest du gegessen. Blutechos, denkst du, und wieder weißt du nicht, woher das Wort kommt. # notiz: blutechos
Du stehst lange da und siehst sie an. Ein Knopf glänzt in ihrem Fell. Irgendjemand hat ihn einmal angenäht.
Dann ruft eine Frauenstimme, gedämpft, hinter einer Tür am Ende des Ganges.
-> k1_iosefka

=== k1_iosefka ===
// TITEL: Iosefkas Tür
// [KANON] Iosefka öffnet nicht, um ihre Patienten zu schützen, schiebt aber eine Blutampulle hinaus.
// Später (Kapitel 2) steht hier eine Hochstaplerin; die Stimme jetzt ist der Maßstab, an dem man sie erkennt.
Die Tür ist aus schwerem Holz und von innen verriegelt. Die Stimme dahinter ist jung, müde und sehr klar. Sie heißt Iosefka, sagt sie, und dies sei ihre Klinik. Sie könne dich nicht hereinlassen. Nicht in dieser Nacht. Sie habe Patienten, und die Jagd mache aus Menschen Dinge, die man nicht mehr hereinlassen dürfe. # notiz: iosefka
* [Höflich bitten]
    ~ iosefka = iosefka + 1
    Du bittest sie, ruhig, wie man einen Arzt bittet. Sie lacht leise, nicht unfreundlich: Ein höflicher Jäger, das sei selten geworden. Du merkst dir ihre Stimme, das leichte Spötteln darin, die genaue Art, Sätze zu beenden. Irgendwann wirst du dich daran erinnern müssen. # notiz: iosefka_stimme
* [Gegen die Tür schlagen]
    ~ iosefka = iosefka - 1
    Du schlägst gegen die Tür, bis dir die Knöchel brennen. Drinnen wird es still. Dann sagt sie, kühler als zuvor, dass sie genau solche Nächte kenne und genau solche Jäger.
- Etwas schabt über den Boden. Durch einen Spalt unter der Tür schiebt sie dir eine kleine Phiole mit dunkelrotem Inhalt zu. Eine Blutampulle, sagt sie. Man stößt sie sich in den Schenkel, und das Blut heilt. Mehr könne sie nicht für dich tun. # notiz: blutampulle
~ ampulle = 1
Du hörst ihre Schritte, die sich entfernen, und dann das leise Stöhnen von jemandem, der hinter dieser Tür in einem Bett liegt und nicht schlafen kann.
-> k1_laterne_zentral

=== k1_laterne_zentral ===
// TITEL: Laterne Zentral-Yharnam
// [KANON] Erste Laterne gleich vor der Klinik, neben Gilberts Fenster.
Vor der Klinik öffnet sich die Nacht. Kalte Luft, die nach Rauch riecht, nach nassem Stein und nach etwas Verbranntem, das kein Holz ist. Neben der Tür steht eine Laterne auf einem eisernen Pfahl, erloschen. Als du sie berührst, flammt sie auf, und aus dem Boden um sie herum kriechen die Boten, als hätten sie hier auf dich gewartet. # bild: laterne # lore: laternen
Du verstehst, ohne dass es dir jemand sagt: Von hier aus führt ein Weg zurück in den Garten mit den weißen Blumen. Die Laterne ist ein Ort, an dem du nicht verloren gehen kannst. Es ist der erste tröstliche Gedanke in dieser Nacht, und er tröstet dich weniger, als er sollte.
~ laterne = -> k1_hub_b
-> k1_hub_b
