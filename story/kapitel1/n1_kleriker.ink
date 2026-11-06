// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei (bis die Leiter in der Kanalisation offen ist).
// Wege: allein kämpfen, mit Gascoigne kämpfen, ablenken, fliehen. Alle Wege führen danach durch die Kanalisation-Mündung in die Unterstadt (Umbau 2026-11-06: keine Laterne an der Brücke)
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt n1_kleriker.ink):
// Ortsbilder in A, Geschehen in B, der Choral in C. Optionen fließen in den Satz (#fliesst); Kampfoptionen nennen Richtung und Handlung.
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen ohne umgestellten Tick,
//   Lernsätze als Erinnerung des Körpers, Brandflasche statt Molotow, Choral ohne Kommentar, Gedächtnis ohne Nachsatz.
// [KANON lore:bosse/kleriker-bestie] Sie klettert herab auf die Brücke; riesiger linker Arm, verwachsenes Geweih, Kreischen; Nägel in den Beinen,
//   das Fell stellenweise pilzartig, im Artbook weiß (lore:orte/zentral-yharnam, LK §25.4); feueranfällig; Gascoigne als Helfer.
// [KANON lore:bosse/kleriker-bestie] Der Name geht auf ein Gerücht zurück. Wissenssperre Kapitel 1 (lore/kapitel/kapitel1.md): dass sie ein
//   Kleriker war, bleibt Gerücht. Die Belege hier deuten an (Stoffstreifen, Abzeichen, Nadelnarben, ein fremdes Gedächtnis), keiner beweist.
// [KANON lore:gegenstaende/heilende-kirche] Beute: das Abzeichen der Schwertjäger (Kirchenjäger); es schaltet bei den Boten Waren frei (RK1 §8).
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat beim Beginn der Jagd die Große Brücke gesperrt. [ERWEITERT, bewusst] Bei uns führen von der
//   Brücke Treppen hinab in die Unterstadt; am Brückenende ein von drüben verriegeltes Tor.
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis, das Lied auf der Brücke, der Wurf mit der Kutsche, der Ansturm, die falsche Ruhe.
// [ERWEITERT] Die vierte Zeile: Im Gedächtnis kippt seine Stimme in der vierten Zeile; der Choral nach dem Sieg endet nach der dritten.
//   Der Leser verbindet es selbst; am Grab (n2_gascoigne) reißt die Zeile an derselben Stelle.

VAR abzeichen_schwert = false   // Abzeichen der Schwertjäger aus der Beute der Bestie

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
~ kampfanfang = -> k1_n1_kleriker
{ kleriker == "besiegt": -> uebergang }
{ k1_n1_kleriker == 1:
    Die Große Brücke trägt den Weg aus der unteren Stadt hinauf zur Kathedrale, auf Bögen aus grauem Stein, die so tief in den Nebel hinabreichen, dass keiner, den man fragt, ihren Fuß je gesehen haben will. Breit genug ist sie für vier Kutschen nebeneinander, und als die Jagd ausgerufen wurde, wollten alle zugleich hinüber; drüben, sagt man in den Gassen, habe ihnen niemand aufgemacht. Die Kutschen stehen noch da, umgestürzt und ineinander verkeilt, die Pferde im Geschirr, aufgedunsen und starr, und zwischen den Rädern liegen die Menschen, die hinüberwollten. Fortgeräumt hat man sie nicht. Am anderen Ende ragt ein Turm über das schmiedeeiserne Geländer, und hinter ihm steht schwarz die Kathedrale. Die Sonne hängt am Turm, so tief wie vor der Klinik, keinen Fingerbreit tiefer. # bild: bruecke # stimmung: grauen
    Nur deine Stiefel sind auf dem Pflaster zu hören, und auf halbem Weg der Atem eines der Pferde, das keinen Atem mehr hat; es ist der Wind in seinen Nüstern. Vom Turm her kommt ein Kratzen, hoch über dir. Horn auf Stein, ein Schaben, eine Pause, wieder Horn auf Stein. Was da herabsteigt, lässt sich Zeit.
- else:
    Wieder die Kutschen, wieder die Pferde im Geschirr, und vom Turm her an derselben Stelle wie zuvor das Kratzen, Horn auf Stein. Deine Schultern ziehen sich hoch, bevor du hinsiehst. # bild: bruecke # stimmung: grauen
}
Dann springt es. Zwischen den Kutschen schlägt es auf, so schwer, dass dir das Pflaster gegen die Sohlen stößt und vom Geländer Steine in den Nebel fallen, ohne dass du sie unten aufkommen hörst. # kampf: kleriker
Selbst gekauert überragt es die umgestürzten Kutschen um zwei Mannslängen, und dabei ist es so mager, dass unter dem Fell jede Rippe einzeln steht. Das Fell hängt in verfilzten Strähnen von ihm herab, bleich und nass wie Moos an einem toten Baum. Aus dem Schädel wächst ein Geweih, verdreht und in sich verknotet, Horn, das gegen sich selbst gewachsen ist. Der linke Arm ist doppelt so lang wie der rechte und aufgebläht von Muskeln, und an seinem Ende krümmen sich Krallen, jede so lang wie dein Unterarm.
In den Hinterläufen stecken Nägel, rostige, Dutzende, und um jeden Nagel ist das Fell weißlich aufgeworfen und weich, Schimmel auf altem Brot. Um den Hals, ins Fell eingewachsen, hängt ein Streifen Stoff, der einmal weiß war. Kragen oder Verband, du kannst es von hier aus nicht sagen.
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    ~ fr_frei_machen(fr_ich)
    Dein Blick bleibt an dem langen Arm hängen und will nicht los. Ohne es zu wollen, zählst du die Gelenke: Schulter, Ellbogen, noch ein Ellbogen, noch einer. Beim zweiten Zählen kommst du auf eine andere Zahl. Hinter deiner Stirn tut sich ein Spalt auf, so schmal wie der unter einer Tür, und durch ihn siehst du, dass der Arm noch wächst, jetzt, während du hinsiehst. # notiz: erste_einsicht # lore: einsicht # stimmung: grauen
}
{ schreie >= 1: Es reißt das Maul auf und kreischt, hoch und lang, und deine Schultern kennen den Ton von den Dächern her, bevor du ihn erkennst. Jetzt hat er einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Es hat dich nicht vergessen. Der schwere Kopf dreht sich, Zoll um Zoll, und sucht genau die Stelle, an der du stehst. }
+ {q_frau == 1} [Nach Gascoigne rufen #fliesst] -> rufen
+ [Die Säge ausklappen und ihr allein entgegengehen #fliesst]
    Das Blatt schnappt aus dem Griff und rastet ein. Allein gehst du ihr entgegen, zwischen den toten Pferden hindurch, und mit jedem Schritt riecht die Luft schwerer, nach Schimmel und kaltem Stall.
    -> kampf
+ {kiesel > 0 or molotow > 0} [Sie mit einem Wurf ablenken und vorbeischleichen #fliesst] -> ablenken
+ [Über das Geländer springen und fliehen #fliesst] -> fliehen

= rufen
„Gascoigne!“ Der Name kratzt dir im Hals und läuft über die Brücke, zwischen den Kutschen hindurch, bis hinüber zum Turm.
{ gascoigne_verraten:
    Das Echo kommt zurück, einmal, zweimal, und sonst nichts. Erst jetzt siehst du die Federn auf dem Pflaster am Brückenkopf, schwarz, ein ganzer Kreis davon, und dazwischen dunkle Tropfen. Wer hier gewartet hat, hat auf einen anderen gewartet als auf dich. # notiz: federn_bruecke
    -> kampf
}
{ gascoigne2:
    Unten zwischen den Dächern bellt ein Hund, ein einziges Mal, und sonst antwortet niemand.{k1_c_graeber.warnung: Wo er jetzt ist, hast du gesehen: hinter einem Tor mit einem Namen darüber.}
    -> kampf
}
-> mit_gascoigne

= kampf
// Sieben Takte in zwei Phasen (Entscheidung des Nutzers 2026-11-04: Bosskämpfe 6 bis 8 Takte).
// Tempo gemischt: das Anzeichen ruhig und genau, die Folge kurz und hart. Jede Möglichkeit nennt Richtung und Handlung;
// die Begründung steht im Anzeichen. Lernsätze (gelernt) als Erinnerung des Körpers an den letzten Tod, jeder anders (L3).
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den langen Arm und schiebt den Kopf vor, schnüffelnd, die Augen halb geschlossen; sie sucht dich mit der Nase. Unter dem Fell der Schulter ziehen sich die Muskeln zusammen, Faser um Faser, zu einem Knoten, so groß wie ein Mehlsack. Der lange Arm steht dir zur Rechten, und unter ihm, zwischen Ellbogen und Pflaster, bleibt ein Spalt. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Die Stelle, an der dich zuletzt die Krallen fanden, brennt, obwohl dort keine Wunde mehr ist. Von rechts kam der Arm, flach und weiter, als ein Sprung trägt, und Platz war nur darunter. }
+ [Nach rechts, unter den Arm #fliesst]
    Hinein statt fort, dorthin, wo der Bogen beginnt: Ein Luftzug fährt dir über den Scheitel, hinter dir kippt eine Kutsche in den Abgrund, und schon bist du an ihrer Flanke. Die Säge beißt in Rippen.
    -> t2
+ [Mit einem Satz nach hinten springen #fliesst]
    Der Satz ist zu kurz. Der Bogen reicht einen Schritt weiter, als dein Sprung dich trägt, und holt dich ein: Krallen an der Hüfte, dann ein Wagenrad im Rücken.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ [Nach links, aus dem Bogen #fliesst]
    Der Bogen endet nicht dort, wo dein Auge ihn enden sieht. Am äußersten Rand seiner Bahn holen die Krallen dich ein, matter schon, aber sie holen dich ein, und über der Schulter reißt der Mantel.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Gilberts Flamme nach vorn, in die Schnauze #fliesst]
    Aus der Düse fährt das Feuer mitten in die schnüffelnde Schnauze. Das nasse, verfilzte Fell zischt zuerst, dann fängt es. Sie wirft sich zurück und schlägt blind um sich, den brennenden Kopf zwischen den Schultern, und der Gestank von versengtem Haar setzt sich dir so tief in den Hals, dass du selbst zu husten beginnst. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis du den Kopf in den Nacken legen musst, um das Geweih zu sehen, und reißt das Maul auf. Ihr Hals weitet sich wie ein Blasebalg, die Rippen treten unter dem Fell hervor, und für einen Herzschlag hört alles auf, ihr Atem, das Knarren der Kutschen, der Wind in den Nüstern der Pferde. Nur die Tropfen, die von ihrem Geweih fallen, hörst du noch. # anzeichen: kreischen
{ gelernt ? kreischen: In deinen Ohren beginnt es zu klingen, noch bevor sie schreit, wie zuletzt, als du ihrem Maul zu nahe warst. }
+ [Nach vorn, in den Schrei hinein #fliesst]
    Aus nächster Nähe trifft dich der Schrei, eine Glocke, die man dir dicht am Kopf anschlägt, und die Brücke kippt. Im Taumeln erwischt dich ihr kleiner Arm, beinahe beiläufig.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
+ [Ohren zuhalten und nach hinten weichen #fliesst]
    Die Handballen fest auf den Ohren, Schritt um Schritt zurück. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen, und einen Augenblick lang weißt du nicht, wo oben ist. Aber du stehst.
    -> t3
+ {molotow > 0} [Die Brandflasche hinauf ins Maul werfen #fliesst]
    ~ molotow = molotow - 1
    In hohem Bogen steigt die Flasche, der brennende Lappen voran, und zerspringt zwischen ihren Zähnen. Feuer im Schlund. Der Schrei bricht ab und wird zu einem nassen, gurgelnden Würgen, und sie stürzt auf die Knie. Bevor sie wieder hochkommt, bist du an ihr, und die Säge reißt ihr die Flanke auf.
    -> t4
+ {ampulle > 0} [Nach hinten treten, die Ampulle setzen #fliesst]
    Rückwärts aus ihrer Reichweite, die Hand schon an der Tasche: Solange sie schreit, ist Zeit.
    -> ampulle_ruhig -> t3
- (t3)
// [ERWEITERT] Der Wurf mit der Kutsche.
Sie fällt auf alle viere zurück und tastet mit dem langen Arm zwischen die Kutschen, wie eine Hand, die im Dunkeln nach einem Becher sucht. Die Krallen schließen sich um eine Achse. Fast andächtig hebt sie die ganze Kutsche vom Pflaster, und der Arm wandert damit nach hinten, weit über ihre Schulter, bis das Holz knarrt. Ihr Kopf zeigt auf dich. # anzeichen: wurf
{ gelernt ? wurf: Dein Rücken zieht sich zusammen, bevor die Kutsche die Schulter verlässt. Sie fliegt dorthin, wohin ihr Kopf zeigt, und keine Deckung hält sie auf. }
+ [Links hinter die nächste Kutsche ducken #fliesst]
    Die Kutsche, hinter der du kauerst, hält genau einen Herzschlag lang. Dann schlägt die zweite in die erste, und beide kommen über dich, in Splittern und Eisen, und zuletzt legt sich das Gewicht eines toten Pferdes auf dein Bein.
    ~ zuletzt = wurf
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4
+ [Nach rechts, quer über die Brücke #fliesst]
    Quer über die Brücke, aus der Linie ihres Kopfes, so schnell die Stiefel auf dem nassen Pflaster greifen. Hinter dir schlägt die Kutsche dort auf, wo du eben noch standest; Glas springt über die Steine, und an dir vorbei wirbelt ein Pferdebein, das Eisen noch am Huf. Das letzte Rad rollt aus, kippt und liegt.
    -> t4
+ [Nach vorn, unter den erhobenen Arm #fliesst]
    Unter dem erhobenen Arm hindurch, und die Kutsche fliegt über dich hinweg und zerschellt in deinem Rücken. Ein Hieb in den Bauch, wo das Fell dünn ist; sie heult. Aber der kleine Arm findet dich auf dem Rückweg und schlägt dich zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
- (t4)
Sie zieht die Hinterläufe unter den Leib und streckt den langen Arm nach vorn, und ihr ganzes Gewicht sackt nach hinten, bis die Läufe darunter zittern. Die Nägel darin schaben über das Pflaster. Die Krallen des langen Armes graben sich in die Fugen zwischen den Steinen, und ihr Kopf hält still, genau auf dich gerichtet. # anzeichen: sprung
{ gelernt ? sprung: Unter deinen Schulterblättern ist das Pflaster wieder kalt, obwohl du stehst. Wo du jetzt stehst, landet sie. }
+ {parade} [Im Absprung nach oben schießen #fliesst]
    {parade_quelle == "gascoigne":„Nicht davor“, sagt in deinem Kopf eine tiefe Stimme, die nicht aus diesen Gassen stammt. „Nicht danach.“|„Genau dann, wenn sie ihr Gewicht hineinlegt“, sagt in deinem Kopf eine müde Stimme, eine für Höfe und Übungsplätze.} Erst als sie ganz in der Luft hängt, drückst du ab. Sie wankt mitten im Sprung und schlägt vor dir auf die Brust. Bevor sie sich fängt, bist du über ihr und stößt zu, tief, mit beiden Händen. # notiz: viszeral
    -> phase2
+ [Nach rechts wegrollen #fliesst]
    Über Schulter und Hüfte rollst du nach rechts, und wo du eben standest, landet sie. Das Pflaster springt in Platten auf, und eine davon kippt dir gegen die Stiefel.
    -> phase2
+ [Den Sprung von vorn abfangen #fliesst]
    Die Säge quer vor der Brust, die Füße fest, und schon dabei weiß dein Rücken, dass es falsch ist. Das Gewicht begräbt dich. Unter deinen Schulterblättern ist die Brücke kalt, und über dir ist nur noch Fell.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und sie ist schneller geworden: Der nächste Schritt kommt, bevor der Staub vom letzten liegt. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste einer Weide im Winter. Der Streifen Stoff an ihrem Hals ist fort. Du suchst ihn auf dem Pflaster und findest ihn nicht. # phase
- (t5)
Links, rechts, links: Der verzweigte Arm schlägt um sich, und jeder Schlag trägt ihn weiter aus als der vorige. Dazwischen, einen Atemzug lang, steht ihre Brust offen. # anzeichen: knochensturm
{ gelernt ? knochensturm: Deine Schläfe pocht im Takt der Schläge, links, rechts, links, und wartet mit dir auf die Lücke. Bis an ihre Brust reicht der Sturm nicht. }
+ [Nach hinten, hinter die Kutschen #fliesst]
    Die Kutsche, hinter die du dich flüchtest, birst unter dem nächsten Schlag in Latten und Glas, und ein Speichenrad trifft dich an der Schläfe.
    ~ zuletzt = knochensturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    Als du wieder stehst, ist sie dir nachgekommen, bis ans Geländer.
    -> t6
+ {jagdnotizen} [Den Knochenarm von vorn umklammern #fliesst]
    Einen Arm um den Knochen, die Brust dagegen, und du hältst. Das Heft des Toten hat dir gezeigt, wo dieser Arm am Ende zu fassen ist, und deine Hände wissen es vor dir. Die Bestie zerrt, einmal, zweimal. Lange genug: Mit der freien Hand treibst du ihr die Säge in die Achsel, bis zum Anschlag. Sie reißt sich los und taumelt rückwärts gegen das Geländer, und der Knochenarm hängt schlaff. # notiz: jagdnotizen_genutzt
    -> t6
+ [Zwischen den Hieben nach vorn, an ihre Brust #fliesst]
    In den einen Atemzug hinein, an ihre Brust, so nah, dass du ihr Herz durch das Fell schlagen spürst, schwer und mit zu langen Pausen. Hinter deinem Rücken schlägt der Arm ins Leere. Die Säge geht hinein, wieder und wieder, bis sie rückwärts gegen das Geländer taumelt.
    -> t6
+ {ampulle > 0} [Nach hinten weichen, die Ampulle setzen #fliesst]
    Mitten im Sturm zurück, die Hand schon an der Tasche.
    -> ampulle_gefahr(2) -> t5
- (t6)
// [ERWEITERT] Der Ansturm mit dem Geweih.
Am Geländer senkt sie den Kopf, bis das verknotete Geweih auf der Höhe deiner Brust steht. Die Hinterläufe scharren über das Pflaster, einmal, zweimal, und mit jedem Scharren rückt sie ein Stück zur Seite, bis sie dich genau vor den Hörnern hat. Ihre Augen sind halb geschlossen, als ziele sie mit etwas anderem als mit ihnen. Machst du einen halben Schritt nach links, scharrt sie und rückt nach. # anzeichen: ansturm
{ gelernt ? ansturm: Deine Beine zucken schon zur Seite und erinnern sich, was dann kam. Davonlaufen hilft vor diesem Geweih nicht, und wer zu früh weicht, dem lenkt sie nach; dir gehört nur der letzte Augenblick. }
+ [Nach hinten über die Brücke rennen #fliesst]
    Zurück über die Brücke, so schnell du kannst, und hinter dir trommeln ihre Läufe, näher, näher, bis das Geweih dich im Rücken erwischt und über eine Kutsche hinwegwirft.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Sofort nach links springen #fliesst]
    Kaum dass sie losläuft, bist du schon links. Sie scharrt nicht mehr, sie lenkt nur noch, und mitten im Sprung trifft dich das Geweih in die Hüfte.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Warten, dann im letzten Augenblick links #fliesst]
    Das Geweih wächst vor dir, bis es ein Wald aus Horn ist, so nah, dass du die Kruste aus altem Blut in seinen Gabelungen siehst. Jetzt. Ein Schritt nach links. Sie rast vorbei, und das Geländer, gegen das sie prallt, bricht in Stücken in den Abgrund. Sie hängt halb darüber, die Hinterläufe in der Luft, und zieht sich mit dem kleinen Arm zurück auf die Brücke.
    -> t7
+ [Nach vorn, dem Geweih entgegen #fliesst]
    Dem Geweih entgegen, die Säge voran: Sie trifft Horn und prallt ab. Das Geweih prallt nicht ab. Es hebt dich hoch und lässt dich fallen.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ {ampulle > 0} [Nach rechts weg, die Ampulle setzen #fliesst]
    Ein Schritt nach rechts, die Hand an der Tasche, und sie scharrt und rückt nach.
    -> ampulle_gefahr(2) -> t6
- (t7)
// [ERWEITERT] Die falsche Ruhe: Sie liegt still, aber der kleine Arm lauert. Lang und langsam erzählt, gegen den Knochensturm.
Sie liegt auf der Seite, den Knochenarm unter sich begraben, und ihr Atem geht rasselnd und flach, wie bei einem Tier, das ein Fuhrwerk auf der Straße erfasst hat. Zwischen zwei Atemzügen vergeht so viel Zeit, dass du jedes Mal glaubst, der letzte sei schon gewesen, und jedes Mal kommt noch einer, nasser als der vorige. Der Kopf liegt auf dem Pflaster, ganz nah, das Auge geschlossen. Nur der kleine Arm, der rechte, liegt nicht still. Seine Finger öffnen und schließen sich, ohne Eile, auf und zu, auf und zu. # anzeichen: letzter_griff
{ gelernt ? letzter_griff: Um deinen Knöchel liegt noch ein Griff, den es nicht mehr gibt. Diese Finger warten darauf, dass sich einer über den Kopf beugt. }
+ [Über den Kopf gebeugt zustoßen #fliesst]
    Kaum fällt dein Schatten über ihren Kopf, schließt sich die kleine Hand um deinen Knöchel und reißt dich von den Füßen. Ihr Auge ist offen. Erst als deine Säge in diesem Auge steckt, lässt die Hand los.
    ~ zuletzt = letzter_griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ [Zuerst nach unten, auf die Hand treten #fliesst]
    Dein Stiefel kommt mit dem ganzen Gewicht auf die kleine Hand, und die Finger schnappen zu, um nichts. Hinter dem Ohr, wo der Schädel dünn ist, findet die Säge ihren Weg. Einmal. Es genügt.
    -> sieg
+ {ampulle > 0} [Nach hinten treten, die Ampulle setzen #fliesst]
    Zwei Schritte zurück, aus der Reichweite der kleinen Hand. Sie liegt, und ihre Finger öffnen und schließen sich weiter, ohne dich.
    -> ampulle_ruhig -> t7
- (sieg)
Die Bestie stirbt, wie ein alter Speicher einstürzt: lange nur ein Ächzen im Gebälk, dann alles zugleich, und ihr Geweih schabt noch über das Pflaster, als der Rest längst liegt. # stimmung: ruhig
Zuletzt liegt auch das Geweih still.
// Stimme C: Die Kirche betritt die Szene nur als Klang. Der Choral setzt ein, ohne dass der Erzähler das Timing kommentiert (L6).
Jenseits des Turms, im Bezirk der Kathedrale, setzt ein Gesang ein: viele Stimmen hinter geschlossenen Türen, gleichmäßig und ohne Eile, in einer Tonart, die nicht aufgeht. Nach der dritten Zeile endet er ordnungsgemäß, und niemand stimmt die vierte an. # klang: choral
Die Zähne deiner Klinge haben sich in ihrem Fell festgefressen. Um sie herauszuziehen, musst du den Fuß auf ihre Brust stellen.
-> beute

= beute
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ abzeichen_schwert = true
Aus ihrem Leib steigt ein roter Dunst, dicht wie Rauch aus nassem Holz, und als du ihn einatmest, stützt du dich auf die Säge, bis die Knie wieder tragen.
Unter dem Fell, über der Brust, wo es dünn wird, sitzen Narben, klein und rund und in ordentlichen Reihen, Dutzende, Hunderte, Stich neben Stich. Du reibst dir die Armbeuge, ohne es zu merken. # notiz: nadelnarben
// [ERWEITERT] Das zerkratzte Schwert: Indiz, das sich auf Gilberts abgekratzte Haustüren reimt, ohne zu beweisen, wem das Abzeichen gehörte.
In den Fellsträhnen hat sich Silber verfangen, ein Abzeichen, ein Schwert auf einem Wappen, wie es in Yharnam die Jäger der Kirche tragen. Unter dem Daumen löst sich das Blut vom Silber. Darunter ist das Schwert zerkratzt, kreuz und quer, Strich um Strich, bis nur noch die Spitze klar zu erkennen ist.{gilbert_kleriker: Aus Kirchenleuten, hat Gilbert gesagt, werden die schlimmsten.} Du steckst es ein und wischst den Daumen lange am Mantel ab. # lore: kleriker_bestien # notiz: jaegerabzeichen
// Fundstück (ersetzt den Kauf bei den Boten): der gesiegelte Brief im Fell. PLATZHALTER-Einbettung, Briefwortlaut unverändert.
Unter dem Streifen Stoff am Hals der Bestie steckt etwas Festes im Fell, ein Brief, mehrfach gefaltet und mit dem Blut getränkt. Das Siegel ist schon gebrochen; gelesen hat ihn jemand vor dir.
~ kirchenbrief = true
// [KANON lore:figuren/amelia] Die Vikarin betet in der Großen Kathedrale. [KANON] Die Oedon-Kapelle im Kathedralbezirk nimmt Überlebende auf (erst Kapitel 2). [ERWEITERT] Der Brief, der Schreiber, die Glocken, der ausgestrichene Satz. Stimme C: Vorgang statt Gefühl; der Riss in der Ordnung ist der letzte Satz.
Die Hand darin ist klein und sorgfältig, jede Zeile gleich weit von der nächsten.
„Liebe Schwester, ich darf dir mitteilen, dass die Kapelle oben im Bezirk auf Weisung nunmehr jeden aufnimmt, der an die Tür klopft und noch sprechen kann. Wer nicht mehr sprechen kann, wird an die nächste Stelle des Blutes verwiesen. Die Vikarin betet in der großen Kathedrale jede Nacht am längsten von uns allen; wo sie kniet, sind die Steine danach nass, und es wird gewischt. Mir ist aufgetragen, die Glocken zu läuten, auch wenn niemand mehr kommt. Ich läute sie.“ # stil: anschlag # notiz: kirchenbrief
Darunter steht ein letzter Satz, so fest ausgestrichen, dass die Feder das Papier zerrissen hat. Lesbar sind davon nur die ersten beiden Wörter: Komm nicht.
-> gedaechtnis

= mit_gascoigne
// [KANON lore:bosse/kleriker-bestie] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
// [KANON lore:figuren/maedchen-und-viola, LK §17.5] Spielt man dem gerufenen Gascoigne die Spieluhr vor, lacht er beim ersten Mal leise.
// Lachen sparsam (Lektorat 1.2): Es gehört hier dem Kippenden, an den falschen Stellen.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Noch bevor das Echo vom Turm zurückkommt, ist er da, aus dem Nebel am Brückenkopf, und seine Stiefel hast du nicht gehört. Gascoigne lacht, und das Lachen springt zwischen den toten Pferden hin und her. Mit offenem Mund stürzt er sich auf die Bestie, die Zähne bloß. Einmal hast du einen Hund so laufen sehen, auf einen Fuchs zu. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. # anzeichen: kleriker_hieb
+ [Hinten bleiben und zusehen #fliesst]
    Er nimmt den Schlag allein und fliegt, rückwärts, mit ausgebreiteten Armen, genau vor deine Füße, und auf dem Rückweg erwischt der Arm auch dich.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_schrei
+ [Links neben ihn, Schulter an Schulter #fliesst]
    Gemeinsam nehmt ihr den Schlag, du mit der Säge, er mit der Axt, und treibt sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er hält den Takt, Hieb, Schritt, Hieb, ohne den Kopf zu wenden, und atmet dabei wie ein Mann beim Holzhacken, ruhig und gleichmäßig.
    -> g_schrei
+ [Rechts herum, ihr in die Flanke #fliesst]
    Während sie nach ihm schlägt, bist du an ihrer Flanke, und die Säge geht tief hinein. Gascoigne fängt den Arm mit der Axt ab und brüllt dabei Worte, kehlig und rund, in einer Sprache, die nicht die dieser Stadt ist.
    -> g_schrei
- (g_schrei)
Am Geländer richtet sie sich auf, das Maul weit offen, und die Rippen treten unter dem Fell hervor wie die Spanten eines Bootes. Gascoigne achtet nicht darauf. Er hackt nach ihrem Hals, immer wieder auf dieselbe Stelle, und hebt nicht einmal den Kopf. # anzeichen: kreischen
+ [Ihn am Mantel nach hinten reißen #fliesst]
    ~ gascoigne = gascoigne + 1
    Der Mantel ist schwer und nass in deinen Fäusten, und ihr stürzt zusammen rückwärts, als der Schrei über euch hinweggeht. Er schüttelt sich und dreht dir den Verband zu. „Danke“, sagt er, und nach einer Weile noch einmal, leiser, als müsse er sich das Wort merken: „Danke.“
    -> g_wurf
+ [Mit ihm nach vorn, in den Schrei #fliesst]
    Zu zweit in den Schrei hinein, und er trifft euch zugleich; das Pflaster kippt unter dir weg. Gascoigne steht als Erster wieder, lachend, und aus seinen Ohren läuft Blut in den Kragen.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_wurf
- (g_wurf)
// [ERWEITERT] Sie wirft nach ihm, nicht nach dir.
Sie tastet mit dem langen Arm zwischen die Kutschen und hebt eine vom Pflaster, das Holz knarrt. Der Arm wandert über ihre Schulter, und ihr Kopf zeigt nicht auf dich. Er zeigt auf Gascoigne, der zwischen zwei Pferdeleibern kniet und seine Donnerbüchse lädt, mit dem Rücken zu ihr. # anzeichen: wurf
+ [Ihm von hinten eine Warnung zurufen #fliesst]
    „Gascoigne!“ Er dreht den Kopf zu dir, nicht zu ihr. Die Kutsche trifft ihn in den Rücken und wirft ihn gegen dich, und ihr geht beide zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g2
+ [Nach vorn, ihn aus der Bahn stoßen #fliesst]
    ~ gascoigne = gascoigne + 1
    Deine Schulter trifft ihn in die Seite, und ihr rollt über das Pflaster. Die Kutsche schlägt dort ein, wo er gekniet hat, und ein Rad springt über euch hinweg in den Abgrund. Er liegt auf dem Rücken und schnauft wie nach einem Wettlauf. „So“, sagt er. „So. Das war knapp.“
    -> g2
- (g2)
{ spieluhr:
    Mitten im Kampf, zwischen zwei Axthieben, summt er, leise und zärtlich, eine Melodie für eine Kinderstube und nicht für diesen Lärm. Noch bevor du sie erkannt hast, findet deine Hand in der Tasche die Spieluhr und hält den Deckel zu. Er summt weiter, auch als die Axt im Knochen stecken bleibt und er sie mit dem Stiefel herausstemmt. # notiz: gascoigne_lied
- else:
    Mitten im Kampf, zwischen zwei Axthieben, summt er, leise und zärtlich, ein Kinderlied, und summt weiter, auch als die Axt im Knochen stecken bleibt und er sie mit dem Stiefel herausstemmt. # notiz: gascoigne_lied
    -> g_fall
}
// Die Spieluhr zählt hier nicht für spieluhr_mal (n2_gascoigne).
* [Die Spieluhr aus der Tasche ziehen #fliesst]
    Zwischen zwei Hieben drehst du die Kurbel. Die Töne kommen spitz und einzeln gegen das Krachen der Axt an, jeder für sich, und gehen beinahe darin unter. Er hört sie trotzdem. Er lacht, leise, ein Lachen, das du von ihm noch nicht kanntest. „Woher hast du die?“, fragt er über die Schulter. Du fängst an zu antworten, und mitten in deinem Satz wendet er sich ab und schlägt wieder zu. # notiz: gascoigne_lacht
* [Die Spieluhr in der Tasche lassen #fliesst]
    Sie bleibt, wo sie ist, unter deiner Hand, und irgendwann bricht sein Summen ab, mitten in einer Wendung der Melodie.
- (g_fall)
Die Bestie fällt. # stimmung: grauen
Gascoigne hört nicht auf. Er schlägt weiter, in den Kadaver hinein, und weiter, nass und gleichmäßig, und er lacht dabei, tief in der Brust, bis du ihn an der Schulter packst. # notiz: gascoigne_kippt
* [„Gascoigne. Gascoigne!“ #fliesst]
    ~ gascoigne = gascoigne + 1
    Beim dritten Mal erst hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er räuspert sich verlegen, und die Stimme, die dann kommt, ist wieder seine eigene. „Ruhig. Ruhig. Das geht einem ins Blut, wenn man nicht aufpasst.“ Er wischt die Klinge am Mantel ab. „Pass du besser auf als ich.“ Ohne sich umzusehen, geht er die Treppe hinab, zu den Gräbern hin.
* [„Was hast du da gesummt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    ~ gascoigne_lied = true
    Er hört auf zu schlagen und wendet dir das Gesicht zu, wie einer, den man aus dem Schlaf geholt hat. „Gesummt?“ Er denkt nach. „Das Lied von der Kleinen. Sie heißt …“ Er bricht ab. Sein Mund bleibt offen. „Sie heißt“, sagt er noch einmal, und dann nichts mehr. Die Axt senkt er, bis die Schneide auf dem Pflaster liegt, und hebt sie nicht wieder. Ohne ein weiteres Wort geht er die Treppe hinab.
* [„Hast du ihn gekannt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    Seine Hand findet im Fell den Streifen Stoff, der einmal weiß war, und reibt ihn zwischen den Fingern, wie man auf dem Markt ein Tuch prüft. „Von weitem hab ich's geglaubt“, sagt er. „Am Singen.“ Er lässt den Stoff los. „Von nah hat er kein Gesicht mehr, an dem man einen erkennt.“ Er geht die Treppe hinab und dreht sich nicht um.
* [Schweigen und warten, bis er aufhört #fliesst]
    ~ gascoigne = gascoigne - 1
    Irgendwann sinkt die Axt von selbst, und er steht schwer atmend da und starrt auf das, was er angerichtet hat. Dann geht er ohne ein Wort die Treppe hinab, in Richtung der Gräber.
- -> beute

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Der Kiesel fliegt zurück, zu dem Ende der Brücke, von dem du gekommen bist, und klappert gegen eine Kutsche, hell und deutlich. Die Bestie fährt herum, so jäh, dass ihr Geweih gegen das Geländer schlägt, und schnüffelt dem Klang nach.
- else:
    ~ molotow = molotow - 1
    Die Brandflasche zerspringt auf den Kutschen am Rand, das alte Holz fängt sofort, und die Bestie wendet sich kreischend dem Brand zu. Vor den Flammen senkt sie den Kopf und wird still, und für einen Atemzug sieht es aus, als knie sie.
}
Geduckt läufst du zwischen den toten Pferden hindurch, so leise, wie es mit dem Herzschlag im Hals geht. Hinter dir kracht eine Kutsche aufs Pflaster, so schwer, dass dir die Zähne aufeinanderschlagen; umdrehen kannst du dich erst, als die Treppen am anderen Ende unter deinen Stiefeln sind. Sie steht noch zwischen den Kutschen, den Kopf gesenkt, und sieht dir nach. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
~ ort = "gassen"
Das Geländer ist kalt unter deiner Hand, dann ist es fort, und unter dir liegt ein tieferes Dach. Über nasse Ziegel rutschst du hinab und fällst in eine Gasse. Oben auf den Dächern folgt sie dir, von First zu First, und wo sie aufsetzt, regnen die Ziegel herab. An einer Ecke holt sie dich ein, ein einziger Hieb, und die Hauswand kommt dir entgegen. # stimmung: kampf
~ zuletzt = sprung
~ treffer(2)
{ leben <= 0: -> tod }
Du rappelst dich auf und rennst weiter, eine Treppe hinab, noch eine, bis der Boden unter dir nachgibt und du in knietiefes Wasser stürzt, eiskalt, mit dem Geruch von Fäulnis und nassem Kalk. Die Kanalisation. Oben am Rand des Schachts kreischt sie, aber sie kommt dir nicht nach. # notiz: kleriker_lebt
~ kleriker = "geflohen"
-> k1_c_kanal

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
// Wissenssperre: Das Gedächtnis darf den Kragen zeigen; es ist ein fremder Blick, und der Jäger kann ihm nicht trauen.
// Was n2_gascoigne.moment braucht, steht im Gedächtnis selbst: die kippende Stimme, der Blick auf die Hände, einer ganz hinten, der seinen Namen sucht.
Ihr Kopf reicht dir, wie er da auf dem Pflaster liegt, bis an die Brust. Aus dem verknoteten Geweih tropft noch Blut, einzeln, in Abständen, die länger werden. Der Einstich in deiner Armbeuge pocht, wie er in der Klinik gepocht hat, als das fremde Blut hineinlief und Bilder mitbrachte, die nicht deine waren. Deine Hand will zu dem Kopf hin, wie die Zunge zu einem wackelnden Zahn will, und deine Schultern wollen weg.
+ [Den Kopf berühren #fliesst]
    Unter der flachen Hand ist das Fell nass und das Blut darin noch warm, und dann ist die Brücke fort. # stimmung: grauen
    Er sah eine Kathedrale, hell von Kerzen zu Tausenden, und hörte einen Gesang, so hoch, dass ihm die Zähne davon schmerzten. Er kniete. Er trug einen weißen Kragen. Eine Hand legte sich auf seinen Kopf, eine Nadel ging in seinen Arm, und das Blut, das hineinfloss, war heilig, hieß es, das Blut der Kirche, das reinste. Es war warm. Er dankte dafür. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Dann ein anderer Tag. Er sang die vierte Zeile, und mitten darin kippte seine Stimme, und alle drehten sich zu ihm um. Er sah auf seine Hände. Sie waren zu groß. Und ganz hinten, in einem Winkel, den das Blut noch nicht erreichte, saß noch jemand und suchte nach einem Namen. Seinem eigenen. Und fand ihn nicht.
    Mit einem Ruck gehört deine Hand wieder dir. Du kniest auf der Brücke, der Atem geht dir wie nach einem langen Lauf, und ob das ihre Erinnerung war oder eine, die das Blut aus einem anderen mitgebracht hat, kannst du nicht sagen. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Die Hand zurückziehen #fliesst]
    Eine Handbreit über dem nassen Fell hält deine Hand an und kehrt um. Als du dich abwendest, geht der Wind durch das verknotete Geweih und zieht einen Ton daraus, lang und hohl wie aus einer Orgelpfeife, deren Spieler längst gegangen ist.
    -> uebergang

= uebergang
// Sieg und Ablenkung führen über die Treppen hinab; es gibt keine Laterne und keinen Rückweg mehr (Entscheidung des Nutzers 2026-11-06).
{ not bruecken_tor: -> bruecken_tor -> }
Neben dem Tor bleiben nur die Treppen, breit und so steil, dass du die unteren erst siehst, wenn du auf den oberen stehst, und sie führen hinab in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen den Dächern, stehen die grauen Köpfe von Grabsteinen, dicht an dicht, wie Leute, die über eine Mauer sehen. Am Fuß der Treppen mündet ein Kanal in die Straße, und das Wasser zieht dich hinein.
-> k1_c_kanal

= bruecken_tor
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat die Große Brücke gesperrt. [ERWEITERT] Das Tor, die Kette, die Ritzung (Übergreifend Nr. 2a).
Am Ende der Brücke, wo der Weg zur Kathedrale hinaufführen müsste, schließt ein Tor die Straße ab, doppelt so hoch wie ein Reiter und von der anderen Seite verriegelt. Durch den Spalt zwischen den Flügeln zieht kühle Luft, harzig und hell; so riecht in den Gassen hier unten nichts. Dahinter hängt eine Kette, frisch geschmiedet und noch blank, und an ihr ein Schloss, schwarz vor Alter, älter als jeder, der in dieser Stadt noch lebt. In Schulterhöhe hat jemand mit einem Messer Buchstaben ins Holz geritzt, tief und mit Mühe, und mitten im dritten aufgehört.
->->
