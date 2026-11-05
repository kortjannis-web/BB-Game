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
// [KANON lore:figuren/blutminister] Ein alter Mann im Rollstuhl empfängt den Fremden: Wer bleiches Blut suche, sei hier richtig; zuerst ein wenig Blut aus Yharnam und ein Vertrag; was auch geschehe, man solle es für einen bösen Traum halten. Wortlaut eigen.
// [KANON lore:orte/iosefkas-klinik] Vision während der Transfusion: eine Bestie aus einer Blutlache, die Feuer fängt; kleine graue Wesen kriechen über den Liegenden; eine Frauenstimme. PRÜFEN: Einzelheiten nach RK1 §1 (wahrscheinlich).
// [ERWEITERT] Die braune Tinte, die nicht abgeht: Anker für die Bindung an den Traum (nur gezeigt, nie erklärt; dass der Vertrag bindet, ist [Deutung]).
// Stimme des Blutministers: glatt, geübt, amüsiert, duzt.
Drinnen riecht es nach Karbol, nach kaltem Kerzenwachs und darunter nach Eisen. Ein langer Saal, Liegen an beiden Wänden, die meisten leer; auf einigen liegen Gestalten unter Laken, die sich nicht rühren. Öllampen brennen in Wandhaltern, und ihr Schein reicht nicht bis in die Ecken, wo das Dunkel dichter steht, als Dunkel stehen dürfte. An einem Haken neben der Tür hängt eine Schürze, steif von etwas, das getrocknet ist. # bild: klinik_innen # stimmung: spannung
Am Ende des Saals sitzt ein alter Mann in einem Rollstuhl, das Gesicht zur Hälfte im Schatten. Er spricht, bevor du ihn erreichst, mit einer glatten, geübten Stimme, die diese Sätze schon sehr oft gesagt hat und jedes Mal ein kleines Vergnügen daran findet.
„Noch einer, durch den Regen, mit Fieber in den Augen. Dann hat der Kutscher dich nicht umsonst gefahren.“ Er beugt sich vor, bis das Lampenlicht seine Nasenspitze erreicht, und mustert dich, als lese er dir etwas von der Stirn ab. „Bleiches Blut“, sagt er leise, und dann lacht er in sich hinein, als hättest du ihm einen guten Witz erzählt. „Da bist du hier richtig. Nur muss man erst ein wenig von unserem Blut im Leib haben, ehe man solche Dinge versteht.“ # lore: paleblood
{ herkunft == "adel": Sein Blick wandert über deine Handschuhe, das gute Leder, die gestopften Fingerspitzen, und das Lachen wird breiter. }
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
„Gut“, sagt der alte Mann. „Sehr gut. Und wenn dir heute Nacht etwas über den Weg läuft, das es nicht geben kann: Schlaf darüber. Am Ende war alles nur das Fieber.“ Er lacht wieder, dasselbe leise Lachen, und rollt rückwärts in den Schatten, bis nur noch das Knarren der Räder von ihm bleibt.
Man legt dich auf eine Liege; wer, siehst du nicht. Die Nadel ist dicker, als sie sein sollte. Das Blut, das in deinen Arm fließt, ist zuerst warm wie ein Bad, dann kalt wie ein Fluss im Winter, und dann ist es nichts mehr, wofür es ein Wort der Wärme oder der Kälte gäbe. Es ist fremd. Es breitet sich in dir aus und tastet, Ader um Ader, nach einem Zimmer, das ihm gehört.
Du träumst, oder etwas träumt dich. Auf dem Boden der Klinik breitet sich eine Lache aus, rot und glänzend, und aus ihr wächst eine Gestalt: zuerst Fell, dann Klauen, dann ein Kopf, der zu lang ist und zu viele Zähne hat. Es beugt sich über dich, und sein Atem riecht nach umgegrabener Erde. Dann fängt es Feuer, ohne Funken, ohne Grund, und verbrennt kreischend über dir, bis nur noch Asche auf dein Laken rieselt. # gedaechtnis: vision_klinik # stimmung: grauen
Danach kommen die Kleinen. Graue, verdrehte Wesen, nicht größer als ein Kind, mit Gesichtern aus nassem Ton, kriechen über die Kante der Liege, über deine Beine, deine Brust, und ihre Berührung ist kalt und neugierig. Eines hebt den Kopf und sieht dich an. Du willst schreien, und deine Kehle gehorcht dir nicht.
// [KANON] Am Ende der Vision eine Frauenstimme, die sich freut, einen Jäger gefunden zu haben (Wortlaut eigen, Sprecherin [Offen]).
Ganz nah an deinem Ohr sagt eine Frauenstimme, sanft und zufrieden wie jemand, der lange gesucht hat: „Da bist du ja. Ein Jäger.“ Dann ist nichts mehr.
-> k1_erwachen

=== k1_erwachen ===
// TITEL: Erwachen und erster Tod
// Handgearbeitet 2026-11-05 in Stimme B. Optionen fließen in den Satz; der erste Tod ist unausweichlich.
// [KANON lore:orte/iosefkas-klinik] Zettel über bleiches Blut (sinngemäß: suchen, um die Jagd zu überwinden); die Bestie im Krankensaal. Der erste Tod zählt als erster (tode = 1), damit der Traum danach nicht noch einmal „zum ersten Mal“ erzählt.
~ tode = 1
Du erwachst, und die Klinik ist leer. Der Rollstuhl ist fort, die Lampen sind fast heruntergebrannt, und auf den Liegen an der Wand liegt niemand mehr unter den Laken, nur die Laken selbst, zerwühlt, als sei jemand hastig aufgestanden. Dein Arm pocht dort, wo die Nadel war, und unter der Haut bewegt sich etwas, langsam, im Takt deines Herzens. # stimmung: spannung
An der Wand, auf Augenhöhe, steckt ein Zettel. Die Schrift ist eilig, die Buchstaben drängen sich aneinander, als habe der Schreiber keine Zeit gehabt oder keine Ruhe mehr: Es geht um bleiches Blut, und darum, dass man es suchen müsse, um über die Jagd hinauszukommen. Wer das geschrieben hat, weißt du nicht. Die Hand, die es schrieb, hält den Stift so, wie du ihn hältst. # lore: paleblood
Hinter dir knarrt eine Diele.
Zwischen den Liegen richtet sich etwas auf. Es ist größer als ein Mensch und hat einmal einem gehört: Fetzen eines Hemdes hängen ihm an den Schultern, und im Fell an seiner Brust glänzt ein einzelner Hornknopf. Es atmet schwer und nass, und als es den Kopf dreht, siehst du, dass seine Augen kein Weiß mehr haben. # anzeichen: erster_tod # stimmung: grauen
* [Nach dem Stuhl neben der Liege greifen #fliesst]
    Nach dem Stuhl neben der Liege greifst du, hebst ihn, und die Bestie schlägt ihn dir aus den Händen, als wäre er aus Papier.
* [Zur Tür stürzen #fliesst]
    Zur Tür stürzt du und kommst drei Schritte weit. Dann trifft dich etwas in den Rücken, schwer wie ein fallender Balken.
* [Den Atem anhalten und still liegen #fliesst]
    Du hältst den Atem an und liegst still. Es hilft nichts. Sie riecht dich, sie riecht das neue Blut in deinen Adern.
- Klauen, Zähne, Gewicht. Es tut nicht weh; du staunst nur, wie schnell es geht. Dann senkt sich eine große, dunkle Stille über dich, und in dieser Stille bewegt sich etwas Kleines, Graues.
-> k1_traum_erst

=== k1_traum_erst ===
// TITEL: Erster Besuch im Jägertraum
// [KANON] Erster Besuch: das Haus ist verschlossen, die Puppe leblos, die Boten geben Wandelwaffe und Feuerwaffe. PRÜFEN: Reihenfolge.
~ ort = "traum"
Du liegst auf dem Rücken. Über dir ein Himmel ohne Sonne, ohne Wolken, ohne Sterne, ein Himmel von der Farbe alten Elfenbeins, der weder Tag noch Nacht ist. Unter deinen Händen Blumen, weiß und unzählig, und ihr Duft ist so süß, dass er dir die Kehle zuschnürt. # bild: traum # stimmung: ruhig # lore: jaegertraum
Du stehst auf. Du lebst. Du solltest nicht leben. Der Gedanke ist so groß, dass er keinen Platz in deinem Kopf findet, und so legst du ihn beiseite wie einen Brief, den man später lesen will. Der Einstich in deiner Armbeuge pocht, frisch, als hätte man dir eben erst Blut gegeben. Sonst ist es still. Kein Vogel, kein Wind, kein Wasser. Nur dein eigenes Herz.
Ein Pfad führt zwischen Grabsteinen einen Hügel hinauf zu einem kleinen Haus mit erleuchteten Fenstern. Die Tür ist verschlossen. Im Garten stehen leere Bänke, und im Gras liegt eine umgekippte Gießkanne, in der das Wasser längst verdunstet ist, während ringsum alles blüht. Es ist ein Ort, den jemand sehr geliebt und dann sehr lange nicht mehr betreten hat.
// [ERWEITERT] Kein Weg hinaus. PRÜFEN: Gartentor im Original.
Du gehst den Zaun entlang und suchst ein Tor. Jeder Weg, den du nimmst, biegt zwischen den Grabsteinen ab und führt dich zurück zum Fuß des Hügels.
Am Fuß einer Treppe steht eine Frau, reglos, in einem schlichten Kleid und mit einer Haube. Erst als du näher kommst, siehst du die Gelenke an ihren Händen: Sie ist eine Puppe, so groß wie ein Mensch, mit einem Gesicht, so sorgfältig gemalt, dass du die Pinselstriche an den Wimpern siehst. Ihre Augen sind offen. Sie sehen dich nicht. # lore: puppe
Dann bewegt sich der Boden. Aus der Erde zwischen den Blumen kriechen die kleinen grauen Wesen aus deinem Traum, und diesmal träumst du nicht. Sie fürchten dich nicht. Sie benehmen sich nicht wie Fremde, eher wie Leute, die etwas abholen, das man ihnen versprochen hat. Sie strecken dir ihre dünnen Arme entgegen, und in ihren Händen liegen Waffen. Boten, denkst du, ohne zu wissen, woher dieses Wort kommt. # lore: boten
// Entscheidung des Nutzers (2026-11-04): keine Waffenwahl, der Sägespalter reicht.
~ waffe = "saege"
Die erste Waffe, die sie dir reichen, ist eine Wandelwaffe der Jäger: ein Sägespalter, eine gezahnte Klinge, die sich mit einem Ruck zu doppelter Länge ausklappt. Die Zähne sind nach hinten geschliffen, für Fell und für das, was darunter liegt. Wer ihn entworfen hat, wusste genau, wogegen er ihn baute. Der Griff ist abgegriffen. Jemand vor dir hat ihn lange getragen.
Dazu eine Feuerwaffe, kurz und schwer, in einer Hand, die zu klein ist, um sie zu tragen.
* [Die Pistole: genau]
    ~ feuerwaffe = "pistole"
    Eine schwere Pistole, die Kugeln aus Quecksilber verschießt. Ihr Gewicht beruhigt dich.
* [Die Donnerbüchse: streut, hält auf Abstand]
    ~ feuerwaffe = "donnerbuechse"
    Eine kurze, plumpe Büchse mit trichterförmigem Lauf, die eine Handvoll Kugeln auf einmal in die Welt speit.
- Am Fuß des Hügels steht ein Grabstein, auf dem kein Name steht. Es ist der einzige Ort im Garten, der irgendwohin führt. Als du ihn berührst, verschwimmt der Garten, die Blumen, die Puppe, das Haus, wie Farbe in Wasser, und der Geruch von Karbol kehrt zurück.
-> k1_klinik_kampf

=== k1_klinik_kampf ===
// TITEL: Lernkampf in der Klinik
// [KANON] Die Bestie in der Klinik. Erster Kampf, lehrt das Lesen der Anzeichen.
~ laterne = -> k1_klinik_kampf
-> betreten("klinik") ->
{ k1_klinik_kampf == 1:
    Du stehst wieder in der Klinik, auf genau der Diele, auf der du gestorben bist. Unter deinen Stiefeln ist das Holz noch dunkel. Deine Hand liegt um den Griff der Waffe, so fest, dass die Knöchel weiß werden. # stimmung: kampf
- else:
    Wieder die Klinik, wieder der Geruch von Eisen. Du kennst diesen Raum jetzt besser, als dir lieb ist. # stimmung: kampf
}
Die Bestie hockt zwischen den Liegen, über etwas gebeugt, das du nicht ansehen willst. Sie hebt den Kopf, als hätte sie auf dich gewartet. # kampf: klinik_bestie
- (t1)
Sie duckt sich tief. Die Hinterläufe spannen sich, die Krallen graben sich in die Dielen, und das ganze Gewicht ihres Körpers wandert nach hinten wie bei einer Feder, die man zusammendrückt. # anzeichen: klinik_sprung
{ gelernt ? klinik_sprung: Du kennst das. Wer sich so duckt, springt, und er springt dorthin, wo du jetzt stehst. }
+ [Zur Seite ausweichen]
    Du wirfst dich nach links. Die Bestie fliegt an dir vorbei, so nah, dass ihr Fell dein Gesicht streift, und kracht in ein Regal. Glas zersplittert, irgendetwas Flüssiges läuft über den Boden.
    -> t2
+ [Den Sprung mit der Waffe abfangen]
    Du stemmst dich gegen den Sprung, als könntest du ihn aufhalten. Das Gewicht trifft dich wie ein Fuhrwerk und wirft dich gegen eine Liege. Etwas in deiner Schulter knackt.
    ~ zuletzt = klinik_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Sie richtet sich auf, größer, als du dachtest, und hebt beide Arme weit über den Kopf. Für einen Augenblick steht sie offen da, wie ein Prediger auf der Kanzel. # anzeichen: klinik_schwer
+ [Unter dem Schlag hindurch nach vorn]
    Du gehst nach vorn statt zurück, in den Schlag hinein und unter ihm hindurch. Die Arme fahren hinter dir zusammen, und deine Waffe findet ihre Seite. Sie heult, und es klingt fast menschlich.
    -> t3
+ [Zurückweichen]
    Du weichst zurück, aber die Arme sind länger, als sie aussehen. Die Krallen ziehen drei heiße Linien über deine Brust.
    ~ zuletzt = klinik_schwer
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
Die Bestie liegt still. Aus ihrem Körper steigt ein Schimmer auf, dünner als Rauch, und fließt in dich hinein, und für einen Augenblick fühlst du dich stärker, satter, als hättest du gegessen. Blutechos. Das Wort liegt dir auf der Zunge, bevor du es gedacht hast. # notiz: blutechos
Du stehst lange da und siehst sie an. Ein Knopf glänzt in ihrem Fell. Irgendjemand hat ihn einmal angenäht.
Dann ruft eine Frauenstimme, gedämpft, hinter einer Tür am Ende des Ganges.
-> k1_iosefka

=== k1_iosefka ===
// TITEL: Iosefkas Tür
// [KANON] Iosefka öffnet nicht, um ihre Patienten zu schützen, schiebt aber eine Blutampulle hinaus.
// Später (Kapitel 2) steht hier eine Hochstaplerin; die Stimme jetzt ist der Maßstab, an dem man sie erkennt.
// [ERWEITERT] Ihre Eigenart (Sie-Form, „Das notiere ich“) ist der Maßstab, an dem man in Kapitel 2 die Hochstaplerin erkennt.
Die Tür ist aus schwerem Holz und von innen verriegelt. Dahinter eine junge Stimme, müde und sehr genau, die jedes Wort setzt wie einen Stich mit der Nadel. „Bleiben Sie, wo Sie sind. Ich bin Iosefka, und das hier ist meine Klinik. Heute Nacht öffne ich nicht. Nicht für Sie und nicht für sonst jemanden. Was die Jagd aus Menschen macht, lasse ich nicht zu meinen Kranken.“ # notiz: iosefka
* [Höflich bitten]
    ~ iosefka = iosefka + 1
    Du bittest sie, ruhig, wie man einen Arzt bittet. Hinter der Tür ein kurzes Schweigen, dann ein Laut, der beinahe ein Lachen ist. „Ein höflicher Jäger. Das notiere ich mir.“ Du hörst tatsächlich eine Feder kratzen. # notiz: iosefka_stimme
* [Gegen die Tür schlagen]
    ~ iosefka = iosefka - 1
    Du schlägst gegen die Tür, bis dir die Knöchel brennen. Drinnen wird es still. „Faustschläge gegen eine verriegelte Tür“, sagt sie dann, kühl. „Das notiere ich auch.“ Eine Feder kratzt. # notiz: iosefka_stimme
- Etwas schabt über den Boden. Durch den Spalt unter der Tür kommt eine kleine Phiole. Das Blut darin ist heller als alles, was du heute Nacht gesehen hast, und durch das Glas hindurch warm. „Aus meinem eigenen Vorrat“, sagt sie. „Besser als das, was die Kirche ausgibt. In den Oberschenkel, kräftig, nicht zögern. Sie jagen für diese Stadt, ob die Stadt es Ihnen dankt oder nicht. Mehr kann ich nicht tun.“ # notiz: blutampulle
~ ampulle = 1
Du hörst ihre Schritte, die sich entfernen, und dann das leise Stöhnen von jemandem, der hinter dieser Tür in einem Bett liegt und nicht schlafen kann.
-> k1_laterne_zentral

=== k1_laterne_zentral ===
// TITEL: Laterne Zentral-Yharnam
// [KANON] Erste Laterne gleich vor der Klinik, neben Gilberts Fenster.
Vor der Klinik öffnet sich die Stadt. Kalte Luft, die nach Rauch riecht, nach nassem Stein und nach etwas Verbranntem, das kein Holz ist. Über den Dächern hängt die Sonne, tief und rot hinter dem Rauch, kurz vor dem Untergang. Neben der Tür steht eine Laterne auf einem eisernen Pfahl, erloschen. Als du sie berührst, flammt sie auf, und aus dem Boden um sie herum kriechen die Boten, als hätten sie hier auf dich gewartet. # bild: laterne # lore: laternen
Du verstehst, ohne dass es dir jemand sagt: Von hier aus führt ein Weg zurück in den Garten mit den weißen Blumen. An einer Laterne kannst du nicht verloren gehen. Ein zweiter Gedanke folgt dem ersten so leise, dass du nicht weißt, ob er deiner ist: Wer nicht verloren gehen kann, kann auch nicht davonlaufen.
~ laterne = -> k1_hub_b
-> k1_hub_b
