// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei (bis die Leiter in der Kanalisation offen ist).
// Wege: allein kämpfen, mit Gascoigne kämpfen, ablenken, fliehen, Jägermarke. Nur wer sie besiegt, bekommt die Laterne an der Brücke
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt n1_kleriker.ink):
// Ortsbilder in A, Geschehen in B, der Choral in C. Optionen fließen in den Satz (#fliesst); Kampfoptionen nennen Richtung und Handlung.
// [KANON lore:bosse/kleriker-bestie] Sie klettert herab auf die Brücke; riesiger linker Arm, verwachsenes Geweih, Kreischen; Nägel in den Beinen,
//   das Fell stellenweise pilzartig, im Artbook weiß (lore:orte/zentral-yharnam, LK §25.4); feueranfällig; Gascoigne als Helfer.
// [KANON lore:bosse/kleriker-bestie] Der Name geht auf ein Gerücht zurück. Wissenssperre Kapitel 1 (lore/kapitel/kapitel1.md): dass sie ein
//   Kleriker war, bleibt Gerücht. Die Belege hier deuten an (Stoffstreifen, Abzeichen, Nadelnarben, ein fremdes Gedächtnis), keiner beweist.
// [KANON lore:gegenstaende/heilende-kirche] Beute: das Abzeichen der Schwertjäger (Kirchenjäger); es schaltet bei den Boten Waren frei (RK1 §8).
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat beim Beginn der Jagd die Große Brücke gesperrt. [ERWEITERT, bewusst] Bei uns führen von der
//   Brücke Treppen hinab in die Unterstadt; am Brückenende ein von drüben verriegeltes Tor.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Die Jägermarke bringt in den Traum und kostet alle Blutechos, ohne Fleck (G3).
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis, das Lied auf der Brücke, der Wurf mit der Kutsche, der Ansturm, die falsche Ruhe.

VAR abzeichen_schwert = false   // Abzeichen der Schwertjäger aus der Beute der Bestie; schaltet bei den Boten Waren frei (traum.ink)

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
{ kleriker == "besiegt": -> uebergang }
{ k1_n1_kleriker == 1:
    Die Große Brücke trägt den Weg aus der unteren Stadt hinauf zur Kathedrale, auf Bögen aus grauem Stein, die so tief in den Nebel hinabreichen, dass keiner, den man fragt, ihren Fuß je gesehen haben will. Breit genug ist sie für vier Kutschen nebeneinander, und als die Jagd ausgerufen wurde, wollten alle zugleich hinüber; drüben, sagt man in den Gassen, habe ihnen niemand aufgemacht. Die Kutschen stehen noch da, umgestürzt und ineinander verkeilt, die Pferde im Geschirr, aufgedunsen und starr, und zwischen den Rädern liegen die Menschen, die hinüberwollten. Fortgeräumt hat man sie nicht. Am anderen Ende ragt ein Turm über das schmiedeeiserne Geländer, und hinter ihm steht schwarz die Kathedrale. Die Sonne hängt am Turm, so tief wie vor der Klinik, keinen Fingerbreit tiefer. # bild: bruecke # stimmung: grauen
    Auf der Brücke ist es so still, dass du deine Stiefel auf dem Pflaster hörst, und auf halbem Weg den Atem eines der Pferde, das keinen Atem mehr hat; es ist der Wind in seinen Nüstern. Dann kommt vom Turm her ein Kratzen, hoch über dir. Horn auf Stein, ein Schaben, eine Pause, wieder Horn auf Stein. Was da herabsteigt, lässt sich Zeit.
- else:
    Wieder die Kutschen, wieder die Pferde im Geschirr, und vom Turm her an derselben Stelle wie zuvor das Kratzen, Horn auf Stein. Deine Schultern ziehen sich hoch, bevor du hinsiehst. # bild: bruecke # stimmung: grauen
}
Dann springt es. Zwischen den Kutschen schlägt es auf, so schwer, dass dir das Pflaster gegen die Sohlen stößt und vom Geländer Steine in den Nebel fallen, ohne dass du sie unten aufkommen hörst. # kampf: kleriker
Es ist größer als ein Haus und dabei so mager, dass sich unter dem Fell jede Rippe abzeichnet. Das Fell hängt in verfilzten Strähnen von ihm herab, bleich und nass wie Moos an einem toten Baum. Aus dem Schädel wächst ein Geweih, verdreht und in sich verknotet, Horn, das gegen sich selbst gewachsen ist. Der linke Arm ist doppelt so lang wie der rechte und aufgebläht von Muskeln, und an seinem Ende krümmen sich Krallen, jede so lang wie dein Unterarm.
In den Hinterläufen stecken Nägel, rostige, Dutzende, und um jeden Nagel ist das Fell weißlich aufgeworfen und weich, Schimmel auf altem Brot. Um den Hals, ins Fell eingewachsen, hängt ein Streifen Stoff, der einmal weiß war. Kragen oder Verband, du kannst es von hier aus nicht sagen.
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    Dein Blick bleibt an dem langen Arm hängen und will nicht los. Ohne es zu wollen, zählst du die Gelenke: Schulter, Ellbogen, noch ein Ellbogen, noch einer. Beim zweiten Zählen kommst du auf eine andere Zahl. Hinter deiner Stirn tut sich ein Spalt auf, so schmal wie der unter einer Tür, und durch ihn siehst du, dass der Arm noch wächst, jetzt, während du hinsiehst. # notiz: erste_einsicht # lore: einsicht # stimmung: grauen
}
{ schreie >= 1: Es reißt das Maul auf und kreischt, und du erkennst den Laut wieder, den du über den Dächern gehört hast. Jetzt hat er einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Es hat dich nicht vergessen. Der schwere Kopf dreht sich, Zoll um Zoll, und sucht genau die Stelle, an der du stehst. }
+ {q_frau == 1} [Nach Gascoigne rufen #fliesst] -> rufen
+ [Die Säge ausklappen und ihr allein entgegengehen #fliesst]
    Die Säge klappst du aus, bis das Blatt einrastet, und gehst ihr allein entgegen, zwischen den toten Pferden hindurch.
    -> kampf
+ {kiesel > 0 or molotow > 0} [Sie mit einem Wurf ablenken und vorbeischleichen #fliesst] -> ablenken
+ [Über das Geländer springen und fliehen #fliesst] -> fliehen
+ {jaegermarken > 0} [Die Jägermarke in der Faust zerdrücken #fliesst] -> marke

= rufen
Nach Gascoigne rufst du, so laut, dass es dir im Hals kratzt, und sein Name läuft über die Brücke und zwischen den Kutschen hindurch.
{ gascoigne_verraten:
    Das Echo kommt zurück, einmal, zweimal, und sonst nichts. Erst jetzt siehst du die Federn auf dem Pflaster am Brückenkopf, schwarz, ein ganzer Kreis davon, und dazwischen dunkle Tropfen. Wer hier gewartet hat, hat auf einen anderen gewartet als auf dich. # notiz: federn_bruecke
    -> kampf
}
{ gascoigne2:
    Nur der Nebel antwortet.{k1_c_graeber.warnung: Wo er jetzt ist, hast du gesehen: hinter einem Tor mit einem Namen darüber.}
    -> kampf
}
-> mit_gascoigne

= kampf
// Sieben Takte in zwei Phasen (Entscheidung des Nutzers 2026-11-04: Bosskämpfe 6 bis 8 Takte).
// Tempo gemischt: das Anzeichen ruhig und genau, die Folge kurz und hart. Jede Möglichkeit nennt Richtung und Handlung;
// die Begründung steht im Anzeichen.
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den langen Arm und schiebt den Kopf vor, schnüffelnd, die Augen halb geschlossen; sie sucht dich mit der Nase. Unter dem Fell der Schulter ziehen sich die Muskeln zusammen, Faser um Faser, zu einem Knoten, so groß wie ein Mehlsack. Der lange Arm steht dir zur Rechten, und unter ihm, zwischen Ellbogen und Pflaster, bleibt ein Spalt. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Du kennst diesen Knoten. Der Arm kommt flach aus deiner Rechten und reicht weiter, als du springen kannst. Nur unter ihm ist Platz. }
+ [Nach rechts, unter den Arm #fliesst]
    Nach rechts läufst du, unter den Arm, hinein statt weg, dorthin, wo der Bogen beginnt. Ein Luftzug fährt dir über den Scheitel. Hinter dir kippt eine Kutsche in den Abgrund. Dann bist du an ihrer Flanke, und die Säge beißt in Rippen.
    -> t2
+ [Mit einem Satz nach hinten springen #fliesst]
    Mit einem Satz springst du nach hinten, und er ist zu kurz. Der Bogen reicht weiter, als ein Arm reichen dürfte. Krallen an der Hüfte, dann ein Wagenrad im Rücken.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ [Nach links, aus dem Bogen #fliesst]
    Nach links wirfst du dich, aus dem Bogen heraus, doch er endet nicht, wo du ihn enden siehst. Am Ende ihrer Bahn holen die Krallen dich ein, schwächer, aber sie holen dich ein.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Gilberts Flamme nach vorn, in die Schnauze #fliesst]
    Gilberts Flammenwerfer reißt du hoch und hältst ihn nach vorn, in die schnüffelnde Schnauze. Das verfilzte Fell fängt sofort. Sie wirft sich zurück und schlägt blind um sich, den brennenden Kopf zwischen den Schultern, und durch den Gestank von versengtem Haar denkst du an den Husten hinter dem Gitter. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis das Geweih im Nebel verschwindet, und reißt das Maul auf. Ihr Hals weitet sich wie ein Blasebalg, die Rippen treten unter dem Fell hervor, und für einen Herzschlag ist es auf der Brücke so still, dass du die Tropfen hörst, die von ihrem Geweih fallen. # anzeichen: kreischen
{ gelernt ? kreischen: Diese Stille kennst du. Sie holt Luft für den Schrei, und wer dann in ihrer Nähe steht, hört eine Weile gar nichts mehr. }
+ [Nach vorn, in den Schrei hinein #fliesst]
    Nach vorn gehst du, in den Schrei hinein, und er trifft dich aus nächster Nähe, eine Glocke, die dicht neben deinem Kopf geschlagen wird. Du taumelst. Ihr kleiner Arm erwischt dich, beinahe beiläufig.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
+ [Ohren zuhalten und nach hinten weichen #fliesst]
    Die Ohren hältst du dir zu und weichst nach hinten, Schritt um Schritt. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen, und einen Augenblick lang weißt du nicht, wo oben ist. Aber du stehst.
    -> t3
+ {molotow > 0} [Den Molotow hinauf ins Maul werfen #fliesst]
    ~ molotow = molotow - 1
    Den Molotow wirfst du hinauf, in hohem Bogen, und die Flasche zerspringt zwischen ihren Zähnen. Feuer im Schlund. Der Schrei bricht ab und wird zu einem nassen, gurgelnden Würgen, und sie stürzt auf die Knie. Bevor sie wieder hochkommt, bist du an ihr, und die Säge reißt ihr die Flanke auf.
    -> t4
+ {ampulle > 0} [Nach hinten treten, die Ampulle setzen #fliesst]
    Nach hinten trittst du, aus ihrer Reichweite, und solange sie schreit, ist Zeit.
    -> ampulle_ruhig -> t3
- (t3)
// [ERWEITERT] Der Wurf mit der Kutsche.
Sie fällt auf alle viere zurück und tastet mit dem langen Arm zwischen die Kutschen, wie eine Hand, die im Dunkeln nach einem Becher sucht. Die Krallen schließen sich um eine Achse. Fast andächtig hebt sie die ganze Kutsche vom Pflaster, und der Arm wandert damit nach hinten, weit über ihre Schulter, bis das Holz knarrt. Ihr Kopf zeigt auf dich. # anzeichen: wurf
{ gelernt ? wurf: Was über diese Schulter geht, kommt hoch und schwer zurück, genau dorthin, wohin ihr Kopf zeigt. Deckung gibt es dagegen keine. }
+ [Links hinter die nächste Kutsche ducken #fliesst]
    Links hinter die nächste Kutsche duckst du dich. Die zweite trifft die erste. Beide über dir. Splitter, Eisen, das Gewicht eines toten Pferdes auf deinem Bein.
    ~ zuletzt = wurf
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4
+ [Nach rechts, quer über die Brücke #fliesst]
    Nach rechts rennst du, quer über die Brücke, aus der Linie ihres Kopfes. Hinter dir schlägt die Kutsche auf, dort, wo du standest. Holz, Glas, ein Pferdebein, das durch die Luft wirbelt. Dann Stille. Du lebst.
    -> t4
+ [Nach vorn, unter den erhobenen Arm #fliesst]
    Nach vorn läufst du, unter den erhobenen Arm, und die Kutsche fliegt über dich hinweg und zerschellt hinter dir. Ein Hieb in den Bauch, wo das Fell dünn ist. Sie heult. Aber der kleine Arm findet dich auf dem Rückweg und schlägt dich zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
- (t4)
Sie zieht sich zusammen, die Hinterläufe unter den Leib, den langen Arm nach vorn gestreckt, und ihr ganzes Gewicht sackt nach hinten, wie bei einer Feder, die man spannt, bis sie zittert. Die Nägel in ihren Läufen schaben über das Pflaster. Die Krallen des langen Armes graben sich in die Fugen zwischen den Steinen. # anzeichen: sprung
{ gelernt ? sprung: Wer sich so streckt, landet dort, wo du jetzt stehst. Genau dort. }
+ {parade} [Im Absprung nach oben schießen #fliesst]
    Im Absprung schießt du nach oben, nicht früher: Du hast gewartet, {parade_quelle == "gascoigne":wie Gascoigne es dir auf dem Platz gezeigt hat|wie der alte Mann im Traum es beschrieben hat}, bis ihr ganzes Gewicht im Sprung lag. Sie wankt mitten in der Luft und schlägt vor dir auf die Brust. Du bist über ihr, bevor sie sich fängt, und stößt zu, tief, mit beiden Händen. # notiz: viszeral
    -> phase2
+ [Nach rechts wegrollen #fliesst]
    Nach rechts rollst du weg, über Schulter und Hüfte. Sie landet, wo du standest, und das Pflaster springt in Platten auf.
    -> phase2
+ [Den Sprung von vorn abfangen #fliesst]
    Den Sprung willst du von vorn abfangen, die Säge quer vor der Brust, und schon dabei weiß dein Rücken, dass es falsch ist. Das Gewicht begräbt dich. Die Brücke unter deinen Schulterblättern ist kalt.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und sie ist schneller geworden: Der nächste Schritt kommt, bevor der Staub vom letzten liegt. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste einer Weide im Winter. Der Streifen Stoff an ihrem Hals ist fort. Du suchst ihn auf dem Pflaster und findest ihn nicht. # phase
- (t5)
Der verzweigte Arm schlägt um sich, links, rechts, links, ein Sturm aus Knochen und Krallen. Zwischen den Schlägen schwingt er jedes Mal ein Stück weiter aus, als ziehe ihn sein eigenes Gewicht, und für die Länge eines Atemzugs ist ihre Brust offen. # anzeichen: knochensturm
{ gelernt ? knochensturm: Links, rechts, links, und dann die Lücke. Der Sturm reicht weit, aber nicht bis an ihre Brust. }
+ [Nach hinten, hinter die Kutschen #fliesst]
    Nach hinten flüchtest du, hinter eine Kutsche, und sie birst unter dem nächsten Schlag in Latten und Glas. Ein Speichenrad an der Schläfe.
    ~ zuletzt = knochensturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    Als du wieder stehst, ist sie dir nachgekommen, bis ans Geländer.
    -> t6
+ {staerke >= 1} [Den Knochenarm von vorn umklammern #fliesst]
    Den Knochenarm umklammerst du von vorn, nicht den Hieb, den Arm, Knochen gegen die Brust und beide Arme darum, und du hältst, mit der Wärme der Puppe in den Schultern. Sie zerrt, einmal, zweimal. Lange genug. Die Säge fährt in die Achsel, bis zum Anschlag. Sie reißt sich los und taumelt rückwärts gegen das Geländer, und der Knochenarm hängt schlaff. # notiz: staerke_genutzt
    -> t6
+ [Zwischen den Hieben nach vorn, an ihre Brust #fliesst]
    Zwischen den Hieben gehst du nach vorn, in den einen Atemzug hinein, an ihre Brust, so nah, dass du den Herzschlag durch das Fell spürst. Hier erreicht der Arm dich nicht. Du schlägst zu, wieder und wieder. Sie taumelt rückwärts gegen das Geländer.
    -> t6
+ {ampulle > 0} [Nach hinten weichen, die Ampulle setzen #fliesst]
    Nach hinten weichst du, mitten im Sturm, und setzt die Ampulle an.
    -> ampulle_gefahr(2) -> t5
+ {jaegermarken > 0} [Hinter die Kutsche, die Jägermarke zerdrücken #fliesst]
    Hinter die nächste Kutsche wirfst du dich, und deine Hand findet die Tasche.
    -> marke
- (t6)
// [ERWEITERT] Der Ansturm mit dem Geweih.
Am Geländer senkt sie den Kopf, bis das verknotete Geweih auf der Höhe deiner Brust steht. Die Hinterläufe scharren über das Pflaster, einmal, zweimal, und mit jedem Scharren rückt sie ein Stück zur Seite, bis sie dich genau vor den Hörnern hat. Ihre Augen sind halb geschlossen, als ziele sie mit etwas anderem als mit ihnen. Machst du einen halben Schritt nach links, scharrt sie und rückt nach. # anzeichen: ansturm
{ gelernt ? ansturm: Wer vor diesem Geweih davonläuft, läuft in ihrer Richtung. Sie ist schneller. Nur im letzten Augenblick zur Seite, nicht früher. }
+ [Nach hinten über die Brücke rennen #fliesst]
    Nach hinten rennst du, über die Brücke, und hinter dir trommeln ihre Läufe, näher, näher. Das Geweih erwischt dich im Rücken und wirft dich über eine Kutsche hinweg.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Sofort nach links springen #fliesst]
    Sofort springst du nach links, kaum dass sie losläuft. Sie scharrt nicht mehr. Sie lenkt nur. Das Geweih trifft dich in der Hüfte, mitten im Sprung.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Warten, dann im letzten Augenblick links #fliesst]
    Du wartest, bis das Geweih vor dir zu einem Wald aus Horn geworden ist, so nah, dass du die Splitter darin zählen könntest. Jetzt. Ein Schritt nach links. Sie rast vorbei, und das Geländer, gegen das sie prallt, bricht in Stücken in den Abgrund. Sie hängt halb darüber, die Hinterläufe in der Luft.
    -> t7
+ [Nach vorn, dem Geweih entgegen #fliesst]
    Nach vorn stürmst du, dem Geweih entgegen. Die Säge trifft Horn und prallt ab. Das Geweih nicht. Es hebt dich hoch und lässt dich fallen.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ {ampulle > 0} [Nach rechts weg, die Ampulle setzen #fliesst]
    Nach rechts weichst du aus und setzt die Ampulle an, und sie scharrt und rückt nach.
    -> ampulle_gefahr(2) -> t6
- (t7)
// [ERWEITERT] Die falsche Ruhe: Sie liegt still, aber der kleine Arm lauert.
Sie liegt auf der Seite, den Knochenarm unter sich begraben, und ihr Atem geht rasselnd und flach, wie bei einem Tier, das ein Fuhrwerk auf der Straße erfasst hat. Der Kopf liegt auf dem Pflaster, ganz nah, das Auge geschlossen. Nur der kleine Arm, der rechte, liegt nicht still. Seine Finger öffnen und schließen sich, ohne Eile, auf und zu, auf und zu. # anzeichen: letzter_griff
{ gelernt ? letzter_griff: Die Finger. Sie greifen nicht im Schlaf. Sie warten darauf, dass jemand sich über den Kopf beugt. }
+ [Über den Kopf gebeugt zustoßen #fliesst]
    Über den Kopf beugst du dich, die Säge zum Stoß erhoben. Die kleine Hand schließt sich um deinen Knöchel und reißt dich von den Füßen. Ihr Auge ist offen. Erst als deine Säge in diesem Auge steckt, lässt die Hand los.
    ~ zuletzt = letzter_griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ [Zuerst nach unten, auf die Hand treten #fliesst]
    Zuerst trittst du nach unten, mit dem ganzen Gewicht auf die kleine Hand, und die Finger schnappen zu, um nichts. Dann stößt du die Säge hinter das Ohr, wo der Schädel dünn ist. Einmal. Es genügt.
    -> sieg
+ {ampulle > 0} [Nach hinten treten, die Ampulle setzen #fliesst]
    Zwei Schritte trittst du nach hinten, aus der Reichweite der kleinen Hand, und nimmst dir die Zeit, solange sie liegt.
    -> ampulle_ruhig -> t7
- (sieg)
Die Bestie stirbt, wie ein alter Speicher einstürzt: lange nur ein Ächzen im Gebälk, dann alles zugleich, und ihr Geweih schabt noch über das Pflaster, als der Rest längst liegt. Dann liegt auch das Geweih still. # stimmung: ruhig
// Stimme C: Die Kirche betritt die Szene nur als Klang.
Jenseits des Turms, im Bezirk der Kathedrale, beginnt ein Gesang. Er setzt genau jetzt ein, als habe man ihn auf diesen Augenblick angesetzt: viele Stimmen hinter geschlossenen Türen, gleichmäßig und ohne Eile, in einer Tonart, die nicht aufgeht. Nach der dritten Zeile endet er ordnungsgemäß, und niemand stimmt die vierte an. # klang: choral
Die Zähne deiner Klinge haben sich in ihrem Fell festgefressen. Um sie herauszuziehen, musst du den Fuß auf ihre Brust stellen.
-> beute

= beute
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ echos = echos + 6
~ abzeichen_schwert = true
Aus ihrem Leib steigt ein roter Schimmer, dünn wie Atem in kalter Luft, und fließt dir in die Brust, mehr als je zuvor, so viel, dass dir die Knie weich werden.
Unter dem Fell, über der Brust, wo es dünn wird, sitzen Narben, klein und rund und in ordentlichen Reihen, Dutzende, Hunderte, Stich neben Stich. Du reibst dir die Armbeuge, ohne es zu merken. # notiz: nadelnarben
Zwischen den Fellsträhnen glänzt ein silbernes Abzeichen, ein Schwert auf einem Wappen, wie es in Yharnam die Jäger der Kirche tragen. Ob sie es selbst getragen hat oder mitsamt seinem Träger gefressen, verrät das Fell nicht. {gilbert_kleriker: Du denkst an Gilberts Gerücht, dass aus Kirchenleuten die schlimmsten Bestien werden.|Du denkst an den Streifen Stoff an ihrem Hals, der einmal weiß war.} Beweisen kann es dir niemand. Das Abzeichen wiegt trotzdem schwer in der Hand. # lore: kleriker_bestien # notiz: jaegerabzeichen
-> gedaechtnis

= mit_gascoigne
// [KANON lore:bosse/kleriker-bestie] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
// [KANON lore:figuren/maedchen-und-viola, LK §17.5] Spielt man dem gerufenen Gascoigne die Spieluhr vor, lacht er beim ersten Mal leise.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Noch bevor das Echo verklungen ist, ist er da, aus dem Nebel am Brückenkopf, und du hast ihn nicht kommen hören. Gascoigne lacht. Es ist ein zu lautes Lachen für diesen Ort, es springt zwischen den toten Pferden hin und her, und er stürzt sich auf die Bestie, mit offenem Mund, die Zähne bloß. Du hast einen Hund so laufen sehen, einmal, auf einen Fuchs zu. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. # anzeichen: kleriker_hieb
+ [Hinten bleiben und zusehen #fliesst]
    Hinten bleibst du und siehst zu. Er nimmt den Schlag allein, und er fliegt, und auf dem Rückweg erwischt der Arm auch dich, weil du genau dort stehst, wo er gelandet ist.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_schrei
+ [Links neben ihn, Schulter an Schulter #fliesst]
    Links neben ihn stellst du dich, Schulter an Schulter, und ihr nehmt den Schlag gemeinsam, du mit der Säge, er mit der Axt. Dann treibt ihr sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er hält den Takt, Hieb, Schritt, Hieb, ohne den Kopf zu wenden, und atmet dabei wie ein Mann beim Holzhacken, ruhig und gleichmäßig.
    -> g_schrei
+ [Rechts herum, ihr in die Flanke #fliesst]
    Rechts herum läufst du, und während sie nach ihm schlägt, bist du an ihrer Flanke und triffst, tief. Gascoigne fängt den Arm mit der Axt ab und brüllt dabei Worte, kehlig und rund, in einer Sprache, die nicht die dieser Stadt ist.
    -> g_schrei
- (g_schrei)
Am Geländer richtet sie sich auf, das Maul weit offen, und die Rippen treten unter dem Fell hervor wie die Spanten eines Bootes. Gascoigne achtet nicht darauf. Er will nur an ihren Hals. # anzeichen: kreischen
+ [Ihn am Mantel nach hinten reißen #fliesst]
    ~ gascoigne = gascoigne + 1
    Am Mantel reißt du ihn nach hinten, mit beiden Händen, und der Schrei geht über euch hinweg. Er schüttelt sich und dreht dir den Verband zu. „Danke“, sagt er. Dann noch einmal, leiser, als müsse er sich das Wort merken: „Danke.“
    -> g_wurf
+ [Mit ihm nach vorn, in den Schrei #fliesst]
    Mit ihm läufst du nach vorn, in den Schrei hinein, und er trifft euch zugleich, und das Pflaster kippt unter dir weg. Er steht als Erster wieder, lachend, mit blutenden Ohren.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_wurf
- (g_wurf)
// [ERWEITERT] Sie wirft nach ihm, nicht nach dir.
Sie tastet mit dem langen Arm zwischen die Kutschen und hebt eine vom Pflaster, das Holz knarrt. Der Arm wandert über ihre Schulter, und ihr Kopf zeigt nicht auf dich. Er zeigt auf Gascoigne, der zwischen zwei Pferdeleibern kniet und seine Donnerbüchse lädt, mit dem Rücken zu ihr. # anzeichen: wurf
+ [Ihm von hinten eine Warnung zurufen #fliesst]
    Von hinten rufst du ihm eine Warnung zu, seinen Namen, so laut du kannst. Er dreht den Kopf zu dir, nicht zu ihr. Die Kutsche trifft ihn in den Rücken und wirft ihn gegen dich, und ihr geht beide zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g2
+ [Nach vorn, ihn aus der Bahn stoßen #fliesst]
    ~ gascoigne = gascoigne + 1
    Nach vorn rennst du und rammst ihm die Schulter in die Seite. Ihr rollt über das Pflaster. Die Kutsche schlägt dort ein, wo er gekniet hat, und ein Rad springt über euch hinweg in den Abgrund. Er liegt auf dem Rücken und lacht, bis er husten muss. „So“, sagt er. „So. Das war knapp.“
    -> g2
- (g2)
{ spieluhr:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er. Eine Melodie, leise und zärtlich, die nicht in diesen Lärm passt; es ist dieselbe, die die Spieluhr in deiner Tasche spielt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
- else:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er, leise und zärtlich, ein Kinderlied, das nicht in diesen Lärm passt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
    -> g_fall
}
// Die Spieluhr zählt hier nicht für spieluhr_mal (n2_gascoigne).
* [Die Spieluhr aus der Tasche ziehen #fliesst]
    Die Spieluhr ziehst du aus der Tasche und drehst die Kurbel, zwischen zwei Hieben, und die ersten Töne gehen im Lärm beinahe unter. Er hört sie trotzdem. Er lacht, leise, mitten im Kampf, ein Lachen, das du von ihm noch nicht kanntest. „Woher hast du die?“, fragt er über die Schulter. Du fängst an zu antworten, und mitten in deinem Satz wendet er sich ab, als hättest du nichts gesagt, und schlägt wieder zu. # notiz: gascoigne_lacht
* [Die Spieluhr in der Tasche lassen #fliesst]
    In der Tasche lässt du sie, die Hand auf dem Deckel, bis er zu summen aufhört.
- (g_fall)
Die Bestie fällt. Gascoigne hört nicht auf. Er schlägt weiter, in den Kadaver hinein, und weiter, nass und gleichmäßig, und er lacht dabei, tief in der Brust, bis du ihn an der Schulter packst. # notiz: gascoigne_kippt # stimmung: grauen
* [„Gascoigne. Gascoigne!“ #fliesst]
    ~ gascoigne = gascoigne + 1
    Seinen Namen sagst du, einmal, zweimal, und erst beim dritten Mal hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er lacht verlegen, und es ist wieder sein eigenes Lachen. „Ruhig. Ruhig. Das geht einem ins Blut, wenn man nicht aufpasst.“ Er wischt die Klinge am Mantel ab. „Pass du besser auf als ich.“ Dann geht er die Treppe hinab, in Richtung der Gräber.
* [„Was hast du da gesummt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    ~ gascoigne_lied = true
    „Was hast du da gesummt?“, fragst du, und er hört auf zu schlagen und wendet dir das Gesicht zu, als hättest du ihn geweckt. „Gesummt?“ Er denkt nach. „Das Lied von der Kleinen. Sie heißt …“ Er bricht ab. Sein Mund bleibt offen. „Sie heißt“, sagt er noch einmal, und dann nichts mehr. Die Axt senkt er, bis die Schneide auf dem Pflaster liegt, und hebt sie nicht wieder. Ohne ein weiteres Wort geht er die Treppe hinab.
* [„Hast du ihn gekannt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Hast du ihn gekannt?“, fragst du. Seine Hand findet im Fell den Streifen Stoff, der einmal weiß war, und reibt ihn zwischen den Fingern, wie man auf dem Markt ein Tuch prüft. „Von weitem hab ich's geglaubt“, sagt er. „Am Singen.“ Er lässt den Stoff los. „Von nah hat er kein Gesicht mehr, an dem man einen erkennt.“ Dann geht er die Treppe hinab, ohne sich umzudrehen.
* [Schweigen und warten, bis er aufhört #fliesst]
    ~ gascoigne = gascoigne - 1
    Schweigend wartest du. Irgendwann sinkt die Axt von selbst, und er steht schwer atmend da und starrt auf das, was er angerichtet hat. Dann geht er ohne ein Wort die Treppe hinab, in Richtung der Gräber.
- -> beute

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Mit einem Kieselstein lenkst du sie ab. Er fliegt zurück, zu dem Ende der Brücke, von dem du gekommen bist, und klappert gegen eine Kutsche, hell und deutlich, und die Bestie fährt herum, schneller, als ihr Leib es erlauben dürfte, und schnüffelt dem Klang nach.
- else:
    ~ molotow = molotow - 1
    Mit dem Molotow lenkst du sie ab. Die Flasche zerspringt auf den Kutschen am Rand, das alte Holz fängt sofort, und die Bestie wendet sich kreischend dem Brand zu. Vor den Flammen senkt sie den Kopf und wird still, und für einen Atemzug sieht es aus, als knie sie.
}
Geduckt läufst du zwischen den toten Pferden hindurch, so leise, wie es mit dem Herzschlag im Hals geht. Hinter dir kracht eine Kutsche aufs Pflaster, so schwer, dass dir die Zähne aufeinanderschlagen; du drehst dich nicht um, nicht bevor die Treppen am anderen Ende unter deinen Stiefeln sind. Erst dort siehst du zurück. Sie steht noch auf der Brücke, riesig im Nebel, und sieht dir nach. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
~ ort = "gassen"
Über das Geländer springst du, auf ein tiefer gelegenes Dach, rutschst über nasse Ziegel und fällst in eine Gasse. Oben auf den Dächern folgt sie dir, von First zu First, und wo sie aufsetzt, regnen die Ziegel herab. An einer Ecke holt sie dich ein, ein einziger Hieb, und die Hauswand kommt dir entgegen. # stimmung: kampf
~ zuletzt = sprung
~ treffer(2)
{ leben <= 0: -> tod }
Du rappelst dich auf und rennst weiter, eine Treppe hinab, noch eine, bis der Boden unter dir nachgibt und du in knietiefes Wasser stürzt, eiskalt, mit dem Geruch von Fäulnis und nassem Kalk. Die Kanalisation. Oben am Rand des Schachts kreischt sie, aber sie kommt dir nicht nach. # notiz: kleriker_lebt
~ kleriker = "geflohen"
-> k1_c_kanal

= marke
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Hunter's Mark: zurück in den Traum, alle Blutechos verloren, kein Fleck (G3).
~ jaegermarken = jaegermarken - 1
~ marke_benutzt = true
In der Faust zerdrückst du die Marke. Das Messing wird warm, dann heiß, und dann zerfallen die Brücke, die Bestie und der Nebel, so wie ein Traum zerfällt, wenn man erwacht. # klang: marke
{ echos > 0: Im Fallen rinnt dir aus der Haut, was die Toten dieser Nacht in dich gegeben haben, ein warmer Schimmer, der nicht mitkommt. Er bleibt zurück, und kein Fleck wird zeigen, wo. }
~ echos = 0
-> traum_von_laterne

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
// Wissenssperre: Das Gedächtnis darf den Kragen zeigen; es ist ein fremder Blick, und der Jäger kann ihm nicht trauen.
Vor ihrem Kopf bleibst du stehen. Er reicht dir bis an die Brust, und aus dem verknoteten Geweih tropft noch Blut, einzeln, in Abständen, die du mitzählst. Du denkst an die Klinik, an das, was du gesehen hast, als fremdes Blut in deinen Arm floss. Deine Hand will dorthin, wie die Zunge zu einem wackelnden Zahn will, und deine Schultern wollen weg.
+ [Den Kopf berühren #fliesst]
    Den Kopf berührst du mit der flachen Hand. Das Fell ist nass, das Blut darin warm, und dann bist du nicht mehr auf der Brücke. # stimmung: grauen
    Er sah eine Kathedrale, hoch und hell, Kerzen zu Tausenden, und hörte einen Gesang, so schön, dass es wehtat. Er kniete. Er trug einen weißen Kragen. Eine Hand legte sich auf seinen Kopf, eine Nadel ging in seinen Arm, und das Blut, das hineinfloss, war heilig, hieß es, das Blut der Kirche, das reinste. Es war warm. Er dankte dafür. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Dann ein anderer Tag. Er sang, und seine Stimme kippte mitten im Lied, und alle drehten sich zu ihm um. Er sah auf seine Hände. Sie waren zu groß. Und ganz hinten, in einem Winkel, den das Blut noch nicht erreichte, saß noch jemand und suchte nach einem Namen. Seinem eigenen. Und fand ihn nicht.
    Mit einem Ruck ist deine Hand wieder bei dir. Du kniest auf der Brücke, der Atem geht dir wie nach einem langen Lauf, und ob das ihre Erinnerung war oder eine, die das Blut aus einem anderen mitgebracht hat, kannst du nicht sagen. Die Bilder bleiben: die Stimme, die mitten im Lied kippt. Der Blick auf die eigenen Hände. Und ganz hinten einer, der nach seinem Namen sucht. Hätte ihn jemand gerufen, bei diesem Namen, in diesem Augenblick. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Die Hand zurückziehen #fliesst]
    Die Hand ziehst du zurück. Was in diesem Blut ist, gehört nicht dir. Hinter dir seufzt es, als atme etwas, das längst tot sein sollte, oder es ist nur der Wind im Geweih.
    -> uebergang

= uebergang
{ kleriker == "besiegt" and not bruecke_laterne:
    ~ bruecke_laterne = true
    Wo der Turm in den Fels übergeht, steht eine Laterne. Als du sie berührst, flammt sie auf, und die Boten kriechen aus dem Boden und neigen die Köpfe, als grüßten sie dich. # lore: laternen
}
{ bruecke_von == "unten":
    ~ bruecke_von = "oben"
    Am Ende der Brücke führen die Treppen hinauf, zurück nach Zentral-Yharnam, zum Räucherwerk und zu den Glocken.
    -> k1_hub_b
}
{ not bruecken_tor: -> bruecken_tor -> }
Neben dem Tor bleiben nur die Treppen, breit und in der Mitte ausgetreten, und sie führen hinab in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen den Dächern, ragen die Spitzen von Grabsteinen.
-> k1_hub_c

= bruecken_tor
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat die Große Brücke gesperrt. [ERWEITERT] Das Tor, die Kette, die Ritzung (Übergreifend Nr. 2a).
Am Ende der Brücke, wo der Weg zur Kathedrale hinaufführen müsste, schließt ein hohes Tor aus schwarzem Eichenholz die Straße ab, mit Eisen beschlagen und von der anderen Seite verriegelt. Durch den Spalt zwischen den Flügeln sieht man eine Kette, frisch geschmiedet und noch blank, an Angeln, die älter sind als jeder, der in dieser Stadt noch lebt. In Schulterhöhe hat jemand mit einem Messer Buchstaben ins Holz geritzt, tief und mit Mühe, und mitten im dritten aufgehört.
->->
