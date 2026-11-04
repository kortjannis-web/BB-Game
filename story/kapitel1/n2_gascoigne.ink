// KAPITEL 1, NADELÖHR 2: PATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// [KANON] Er hackt auf eine Leiche ein; Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig). Gascoignes Kappe gehört zu seinem Set.
// [KANON] Die Spieluhr lässt ihn innehalten; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 3), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie, und nur, wenn man ihn ruft.
// Eileen hilft in Kapitel 1 nicht im Kampf; die Partnerschaft beginnt in Kapitel 2.
// Rede: Hier bricht seine Stimme wörtlich durch, kurz und kippend; im Moment der Klarheit nur noch Reste.

=== k1_n2_gascoigne ===
// TITEL: NADELÖHR 2: Gascoigne
-> betreten("grab") ->
~ spieluhr_mal = 0
~ g_phase = 1
~ moment_moeglich = gascoigne >= 3 and spieluhr and gedaechtnis_kleriker
{ k1_n2_gascoigne == 1:
    ~ einsicht = einsicht + 1
    Hinter dem Tor hört das Räucherwerk auf. Den ganzen Weg durch die Unterstadt hat es dir in den Kleidern gehangen, süß und schwer wie überreifes Obst, und an den Gitterstäben bleibt es zurück. Hier riecht es nach umgegrabener Erde und kaltem Eisen. Der Friedhof steigt in breiten Stufen an, Grab über Grab, und der Nebel liegt so flach zwischen den Steinen, dass nur ihre Köpfe herausragen, Reihe um Reihe, wie eine Gemeinde, die auf den Beginn der Predigt wartet. Über der obersten Mauer hängt die Sonne, tief und rot, wie seit Stunden.{not k1_c_graeber: Über dem Tor, durch das du gekommen bist, steht ein einziges Wort im Stein: Oedon.} # bild: grab_oedon # stimmung: grauen # lore: oedon
    Weiter oben schlägt etwas. Dumpf und gleichmäßig kommt es herunter, im Takt eines Dreschflegels auf der Tenne, und zwischen zwei Schlägen schmatzt es jedes Mal leise und nass. Ab und zu fährt die Klinge ganz hindurch und trifft auf Stein. Dann klingt es hell und kurz, und der Ton läuft über die Gräber davon, bis der Nebel ihn schluckt.
    Er steht auf der obersten Stufe, mit dem Rücken zu dir, der lange Mantel nass bis an die Knie. Die Axt hebt sich und fällt. Seine Kappe hat er auf einen Grabstein gelegt, die Krempe nach oben, so ordentlich, wie man sie vor der Messe auf die Bank legt. Was zu seinen Füßen liegt, trägt noch einen Stiefel, und die Schnalle daran ist blank geputzt. Der Griff deiner Feuerwaffe ist warm in deiner Hand. Wann du ihn gepackt hast, weißt du nicht. # kampf: gascoigne
    Sein Schatten liegt auf dem Nebel, und er liegt falsch. Er fällt der tiefen Sonne entgegen, als käme das Licht von woanders. # lore: einsicht
- else:
    Hinter dem Tor bleibt das Räucherwerk wieder zurück. Die Steine stehen im Nebel wie zuvor, und oben auf der letzten Stufe hebt sich die Axt und fällt, im selben Takt, als hätte deine Rückkehr für ihn nicht stattgefunden. Die Kappe liegt noch auf dem Grabstein. Niemand hat sie angerührt. # bild: grab_oedon # stimmung: grauen # kampf: gascoigne
}
{ k1_n2_gascoigne > 1:
    Die Axt bleibt oben stehen. Er dreht sich um, mit derselben langsamen Bewegung wie beim ersten Mal, und zieht die Luft ein, als röche er dich zum ersten Mal in dieser Nacht. { q_frau == 1 or gascoigne2: „{gascoigne_name:{name}|Fremder}“, sagt er, freundlich, als käme er dich an der Tür abholen. „Dann siehst du's auch.“ | „Noch einer“, sagt er. „Immer noch einer.“ }
    -> p1
}
{ q_frau == 1 or gascoigne2:
    Die Axt bleibt oben stehen. Langsam dreht er sich um. Der Verband über seinen Augen ist steif geworden und dunkel bis zum Knoten, und trotzdem findet sein Gesicht dich sofort.{ gascoigne2 and q_frau == 1: Zwischen den Gräbern der Unterstadt hat er einen Atemzug zu lang gebraucht, um dich zu erkennen. Jetzt lächelt er gleich.| Er lächelt.}
    „{gascoigne_name:{name}|Fremder}.“ Es klingt wie ein Gruß an der Haustür{ q_frau == 1:, mit dem Rollen in der Stimme, das du vom Scheiterhaufen kennst}. „Gut. Gut, dass du kommst. Dann siehst du's auch.“
    // [ERWEITERT] Der Bäckerjunge (Jonas) ist erfunden und liegt im frischen Grab an den Gräbern; Martha, Hennings und der alte Brack stammen aus der Szene am Scheiterhaufen.
    { q_frau == 1:
        Er deutet mit der Axt hinab auf die Dächer, und von der Schneide fällt Tropfen um Tropfen in den Nebel. { mob_verbrannt: „Martha. Die hast du mir abgenommen. Hennings. Der alte Brack. Der Bäckerjunge.“ | „Martha. Hennings. Der alte Brack. Der Bäckerjunge.“ } „Alle. Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
    - else:
        Er deutet mit der Axt hinab auf die Dächer, und von der Schneide fällt Tropfen um Tropfen in den Nebel. „Alle da unten. Der Bäckerjunge. Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
    }
    Er hebt das Kinn und zieht die Luft ein, einmal, zweimal, wie ein Hund an einer fremden Schwelle. „An dir noch nicht.“ Das Lächeln wird breiter. „Noch nicht, {gascoigne_name:{name}|Fremder}. Ist nur eine Frage der Nächte.“
- else:
    Die Axt bleibt oben stehen. Er hebt den Kopf und nimmt Witterung auf, mit kleinen Rucken, wie ein Jagdhund im Wind, dann dreht er sich um. Die Augen sind verbunden, der Verband ist schwarz und steif, und das Gesicht darunter ist das eines Mannes, der lange nicht geschlafen hat. # lore: gascoigne
    „Noch einer“, sagt er. Seine Stimme kommt tief und ruhig, mit einem Rollen darin, das nicht aus diesen Gassen stammt. Er deutet mit der Axt über die Gräber hinab auf die Stadt. „Da unten. Hinter jeder Tür, in jedem Bett, in jeder Kirchenbank. Die tragen ihre Gesichter nur noch wie Mäntel.“ Er zieht die Luft ein und legt den Kopf schief. „Du auch. Nicht heute vielleicht. Aber du auch.“
}
-> p1

= p1
# stimmung: kampf
- (t1)
{ t1 == 1:
    Dann hebt er die Donnerbüchse, ohne Hast. Der trichterförmige Lauf schwenkt über die Steine, findet dich und bleibt ruhig. Das Gewicht liegt auf seinem hinteren Fuß, die Axt hängt locker an der Seite.{ parade_quelle == "gascoigne": Diese Haltung kennst du. Auf dem Platz am Scheiterhaufen hat er sie dir vorgemacht, für den Augenblick, in dem eine Bestie ausholt. Jetzt wartet er darauf, dass du ausholst.| Er wartet darauf, dass du dich rührst.} # anzeichen: gascoigne_schuss
- else:
    Er reißt die Donnerbüchse hoch. Der trichterförmige Lauf schwenkt herum, sucht dich, und sein Finger liegt am Abzug. # anzeichen: gascoigne_schuss
}
{ gelernt ? gascoigne_schuss: Du kennst das jetzt. Erst der Schuss, der dich auf Abstand hält, dann kommt die Axt, sobald du dich zeigst. }
+ [Auf ihn zu]
    Du stürmst auf ihn zu, quer über die Gräber. Die Ladung trifft dich in die Brust. Dutzende kleine Kugeln, eine Wand aus glühenden Nadeln.
    ~ zuletzt = gascoigne_schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {parade} [Selbst schießen, im Moment seines Ausholens]
    Du bleibst stehen, bis der Trichter Feuer spuckt, und wirfst dich darunter weg. Die Ladung pfeift über dich. Er setzt mit der Axt nach, das ganze Gewicht im Schlag, und genau da schießt du. Er wankt. { parade_quelle == "gascoigne": Er wankt, wie er es dir beigebracht hat, auf dem Platz, mit dem Feuer im Rücken, und für eine Sekunde zieht sich sein Mund zu etwas zusammen, das Stolz sein könnte. Du stößt zu, bevor er sich fangen kann. | Er wankt, und du stößt zu, bevor er sich fangen kann. } # notiz: seine_lehre
    -> t2b
+ [Hinter einen Grabstein]
    Hinter den nächsten Grabstein. Die Ladung schlägt in den Stein. Splitter regnen auf dich, Bruchstücke eines Namens, den niemand mehr lesen wird.
    -> t2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
- (t2)
Er lässt die Donnerbüchse sinken und kommt in langen Schritten über die Gräber. Die Axt nimmt er tief hinter die Hüfte, die Schneide flach, auf der Höhe der Grabsteinköpfe. Zwei Schritte vor dir dreht sich seine Schulter ein. # anzeichen: gascoigne_bogen
{ gelernt ? gascoigne_bogen: Flach und hüfthoch, so kommt diese Axt. Darüber ist kein Platz. Darunter schon. }
+ [Zurückweichen]
    Du weichst zurück. Er folgt, schneller, als ein Mann seiner Größe sein dürfte. Die Axt an der Schulter.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
+ [Unter dem Bogen durch und zuschlagen]
    Du duckst dich. Die Axt pfeift über deinen Kopf. Dann bist du an ihm, und die Säge findet seine Seite. Er grunzt, mehr überrascht als verletzt.
    -> t2b
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(2) -> t2
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke
- (t2b)
// [ERWEITERT] Der Schuss aus nächster Nähe: Er lässt dich herankommen.
Er tritt nicht zurück. Er lässt die Axt sinken, ganz, bis die Schneide im Gras liegt, und dreht dir die linke Schulter zu, als wolle er dich umarmen. Die Donnerbüchse hängt an seiner Hüfte, der Trichter zeigt zu Boden. Nur sein Daumen bewegt sich. Er spannt den Hahn, und das Klicken ist das lauteste Geräusch auf dem Friedhof. # anzeichen: donner_nah
{ gelernt ? donner_nah: Die gesenkte Axt ist ein Köder. Der Schuss kommt aus der Hüfte, nach oben, und er trifft jeden, der vor ihm steht. }
+ [Jetzt zuschlagen, die Axt ist unten]
    Du schlägst zu. Er auch. Der Trichter kommt hoch, und der Schuss reißt dich von den Füßen. Pulverdampf, Glut im Gesicht, Gras im Mund.
    ~ zuletzt = donner_nah
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p2
+ [Hinter ihn, auf die Seite der Axt]
    Du gehst nicht vor ihm vorbei, du gehst um ihn herum, auf die Seite, wo die Axt im Gras liegt. Der Schuss geht ins Leere, in den Nebel. Ein Hieb in den Rücken, dicht unter dem Mantelkragen. Er brüllt.
    -> p2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr

= p2
~ g_phase = 2
Er tritt zurück, und mit einem Ruck seiner Handgelenke klappt er die Axt aus. Der Stiel fährt aus, doppelt so lang wie zuvor, und er packt sie mit beiden Händen. Die Donnerbüchse wirft er weg, achtlos, zwischen die Gräber. Jetzt lacht er. Es ist ein tiefes, kehliges Lachen, und es hört nicht auf, auch nicht, wenn er Atem holt. # phase # stimmung: kampf
- (t3)
Er fasst den Stiel ganz am Ende und beginnt sich zu drehen. Die Schneide zieht einen Kreis, weiter, als seine Arme reichen, und wo sie einen Grabstein streift, fliegt der Kopf des Steins davon. Nur innen, nah an seinem Körper, schwingt der Stiel leer. # anzeichen: axt_lang
{ gelernt ? axt_lang: Du weißt jetzt: Die lange Axt reicht weiter, als seine Arme sind. Wer zurückweicht, ist schon getroffen. Nur ganz nah ist man sicher. }
+ [Zurück hinter die Gräber]
    Zurück, hinter einen hohen Stein. Die Axt geht durch den Stein wie durch Kreide. Und durch dich.
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t3b
+ {staerke >= 1} [Die lange Axt mit dem Sägespalter abfangen]
    Du stellst dich in den Kreis der Axt und fängst sie mit der ausgeklappten Säge ab. Der Schlag geht dir bis in die Zähne, aber deine Arme halten, warm und schwer von dem, was die Puppe dir gegeben hat. Für einen Augenblick steht ihr so, Stahl an Stahl, und er neigt den Kopf, als erkenne er etwas an dir. Dann reißt er sich los. # notiz: staerke_genutzt
    -> t3b
+ [Ganz nah heran]
    Du tust das Gegenteil von dem, was deine Beine wollen. In den Kreis der Axt hinein, bis du seinen Atem riechst, Eisen und etwas Süßes, Verdorbenes. Hier trifft die lange Klinge nicht. Hier triffst du.
    -> t3b
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(2) -> t3
- (t3b)
// [ERWEITERT] Der Hieb von oben: Er stemmt die lange Axt in die Höhe.
Er stößt dich mit dem Stiel von sich, nicht fest, nur weit genug. Dann hebt er die lange Axt über den Kopf, beide Hände am Ende des Stiels, und hält sie dort. Die Schneide zittert hoch über ihm im Nebel. Er lacht nicht mehr. Er zählt, stumm, mit den Lippen, wie ein Mann, der früher die Glocke geläutet hat und den Takt im Blut trägt. Als du dich bewegst, wandert sein Kopf mit, langsam, wie eine Kompassnadel. # anzeichen: axt_wirbel
{ gelernt ? axt_wirbel: Er zählt bis drei. Bei drei fällt die Axt, gerade herab, und spaltet, was vor ihm steht. Wer bei zwei geht, geht zu früh: Er folgt ihm mit der Schneide. }
+ [Sofort weglaufen]
    Du rennst bei eins. Sein Kopf unter dem Verband folgt dir, und die Schneide folgt seinem Kopf. Sie trifft dich zwischen den Schulterblättern.
    ~ zuletzt = axt_wirbel
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
+ [Warten, bis die Axt fällt, dann zur Seite]
    Eins. Zwei. Seine Lippen formen die Drei, und erst jetzt bist du weg. Die Axt fällt in einen Grabstein und bleibt darin stecken. Er zerrt am Stiel. Du schlägst ihm in die Kniekehle, und er sinkt auf ein Knie.
    -> p3
+ [Hinein, solange die Arme oben sind]
    Du gehst auf ihn zu. Seine Arme sind oben, seine Brust ist offen, und du triffst. Aber er zählt nicht weiter. Er lässt einfach los, und der Stiel trifft dich am Kopf.
    ~ zuletzt = axt_wirbel
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p3
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr

= uhr
~ spieluhr_mal = spieluhr_mal + 1
{ spieluhr_mal:
- 1: Du ziehst die kleine Spieluhr auf und hältst sie hoch. Das Lied steigt auf, dünn und klar zwischen den Gräbern, ein Kinderlied an einem Ort, an dem keine Kinder sind. Gascoigne erstarrt mitten in der Bewegung. Er lässt die Axt sinken. Er presst die Hände an den Kopf, als wolle er etwas darin festhalten, das ihm entgleitet, und aus seiner Kehle kommt ein Laut, der kein Wort ist und kein Schrei. # klang: spieluhr # lore: spieluhr
- 2: Wieder das Lied. Er dreht den Kopf, suchend, über die Gräber, nach links, nach rechts. „Viola?“, sagt er. „Viola, wo …“ Er findet sie nicht. Die Hände an seinem Kopf zittern. # klang: spieluhr
- else: Zum dritten Mal das Lied. Er krümmt sich darunter wie unter einem Schlag. Er schreit, und der Schrei geht über in etwas anderes, in ein Brüllen, das aus einem viel größeren Brustkorb kommt, als er ihn hat. # klang: spieluhr # notiz: spieluhr_dritte # stimmung: grauen
    -> p3
}
+ [Zuschlagen, solange er zuhört]
    ~ im_lied_getroffen = true
    Du schlägst zu. Er wehrt sich nicht. Er steht da, gekrümmt, die Hände am Kopf, und nimmt den Hieb, ohne die Arme zu senken, weil die Hände an seinem Kopf wichtiger sind. Das Lied spielt weiter, bis die Feder abgelaufen ist.
    -> weiter_nach_lied
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen, solange er lauscht]
    Er hört nur das Lied. Du hast Zeit.
    -> ampulle_ruhig -> weiter_nach_lied
+ [Abwarten, bis das Lied endet]
    Du wartest. Das Lied läuft ab, Note für Note, und mit der letzten Note lässt er die Hände sinken und greift wieder nach der Axt, langsamer als vorher, wie ein Mann, der aus einem Schlaf hochfährt und nicht weiß, wo er ist.
    -> weiter_nach_lied
+ [Ihn rufen]
    { moment_moeglich and not gascoigne_moment: -> moment }
    Du rufst seinen Namen. Er hebt den Kopf, und für einen halben Atemzug ist da etwas in seinem Gesicht, ein Suchen. „Viola?“, sagt er. Dann ist es fort, so schnell, wie ein Docht ausgeht, und die Axt ist wieder oben. # notiz: halber_moment
    -> weiter_nach_lied

= weiter_nach_lied
{ g_phase == 2:
    -> t3
- else:
    -> t2
}

= moment
// Die bessere Entscheidung, die das Blutgedächtnis möglich macht.
~ gascoigne_moment = true
Und du erkennst es. Du erkennst es, weil du es schon einmal gesehen hast, auf der Brücke, durch die Augen eines Klerikers, der seinen Namen suchte: die Stimme, die bricht, den Blick auf die eigenen Hände, und dahinter, ganz hinten, jemanden, der noch antworten kann. Du rufst ihn nicht wie einen Jäger, über die Gräber hinweg. Du wartest, bis seine Stimme bricht, wie die des Klerikers mitten im Lied, und dann sagst du seinen Namen leise, so wie er im Deckel der Spieluhr steht, in derselben feinen Schrift wie der seiner Frau. # gedaechtnis: gascoigne_klarheit # stimmung: schoen
Gascoigne hebt den Kopf. Und für einen Atemzug, einen einzigen, ist er da. Er hält die Schultern, wie er sie am Laternenpfahl gehalten hat. Er neigt den Kopf, als lausche er.
„Viola“, sagt er. Nicht zu dir.
Dann, mit seiner alten Stimme, der warmen, tiefen, aber in Stücken: „Ich weiß. Was ich bin. Lang schon.“ Er atmet. „Mach's. Bevor ich wieder geh.“ Er atmet noch einmal. „Ich geh wieder. Spür's schon.“
* [Ihm versprechen, nach seiner Tochter zu sehen]
    ~ versprechen_gascoigne = true
    Du versprichst es ihm. Er nickt, und unter dem Verband laufen Tränen hervor, und er lässt sie laufen. „Sag ihr …“ Er sucht. „Das Lied. Sag ihr, das Lied weiß ich noch. Nur alles andere nicht.“
* [Ihn fragen, was mit Viola geschehen ist]
    Du fragst ihn nach seiner Frau. Sein Mund öffnet sich und schließt sich wieder. „Weiß nicht“, sagt er. „Weiß es nicht mehr.“ Seine Hände suchen nach etwas an seinem Mantel, einer Tasche, einem Knopf, und finden nichts. # notiz: viola_frage
* [Schweigen und die Waffe heben]
    Du sagst nichts. Du hebst nur die Säge. Er versteht. Er breitet die Arme aus, ein wenig, wie ein Priester, der den Segen spricht.
- Dann kippt er. Du siehst es kommen, diesmal. Es hilft nichts.
-> p3

= p3
Das Fell bricht durch den Mantel. Es wächst aus seinem Nacken, aus seinen Armen, aus seinem Gesicht, schwarz und struppig, und der Verband reißt, und darunter sind keine Augen mehr, nur zwei glühende Punkte in einem Schädel, der sich in die Länge zieht, knackend, wie ein Ast unter Last. Er wächst. Er wird größer, schwerer, krummer, bis vor dir eine Bestie steht, so groß wie die auf der Brücke, und um ihren Hals hängt, zerrissen und schmutzig, ein Priesterschal. # phase # stimmung: grauen
- (t4)
Sie springt. Sie springt über drei Gräber hinweg, die Klauen voran, mit einem Heulen, das an den Grabsteinen hochklettert und oben an der Mauer zurückkommt. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Du weißt, wohin sie springt: dorthin, wo du jetzt stehst, nicht dorthin, wo du gleich sein wirst. }
// [ERWEITERT] Einsicht kostet: Wer zu viel sieht, sieht auch den falschen Schatten (angekündigt bei der Ankunft) und kann ihm folgen.
{ einsicht >= 3: Ihr Schatten springt vor ihr her, über die Gräber, und er springt nach links. Sie selbst ist noch in der Luft. }
+ {feuer or molotow > 0} [Feuer]
    { feuer:
        Du reißt den Flammenwerfer hoch, Gilberts Geschenk, und hältst die Flamme in den Sprung hinein. Das Fell fängt Feuer, und die Bestie heult und wälzt sich zwischen den Gräbern.
    - else:
        ~ molotow = molotow - 1
        Du wirfst den Molotow. Er zerspringt an ihrer Brust, und das Feuer läuft über ihr Fell wie Wasser über einen Stein.
    }
    -> t4b
+ {einsicht >= 3} [Dem Schatten ausweichen, nach rechts]
    Du wirfst dich nach rechts, weg von dem Schatten. Der Schatten lag falsch, wie schon bei deiner Ankunft. Sie landet genau dort, wohin du dich geworfen hast.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ [Seitlich weg]
    Zur Seite. Sie landet hinter dir. Ein Grabstein springt aus der Erde.
    -> t4b
+ [Den Sprung abfangen]
    Du stellst dich ihr mit der Säge entgegen. Ebenso gut könnte man einen Wasserfall mit einem Spaten aufhalten.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(2) -> t4
- (t4b)
// [ERWEITERT] Sie umkreist dich über die Gräber; wenn das Heulen aussetzt, kommt sie.
Sie greift nicht an. Sie läuft. Im Kreis um dich, über die Gräber, auf allen vieren, und wo ihre Klauen aufsetzen, reißt die Erde in Furchen auf. Sie heult dabei, ohne Pause, ein langer Ton, der von der Mauer zurückkommt, so dass du sie von zwei Seiten zugleich zu hören glaubst.
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen, solange sie heult]
    Solange sie heult, ist Zeit. Du nimmst sie dir.
    -> ampulle_ruhig -> t4c
+ [Horchen, wo sie ist]
    Du horchst. Links, dann hinten, dann rechts. Der Ton wandert um dich wie Wasser um einen Stein.
    -> t4c
- (t4c)
Dann setzt das Heulen aus. Mitten im Kreis, hinter dir. # anzeichen: bestie_kreis
{ gelernt ? bestie_kreis: Solange sie heult, läuft sie. Wenn sie still ist, springt sie, und sie springt von dort, wo die Stille anfing. }
// [ERWEITERT] Einsicht kostet: Wer zu viel hört, hört das Heulen weiter, auch als es schon aufgehört hat.
{ einsicht >= 3: Aber in deinem Kopf hört es nicht auf. Es läuft weiter, rund um dich, und jetzt kommt es von vorn. }
+ {einsicht >= 3} [Dem Heulen nach, das du noch hörst, nach vorn ausweichen]
    Du weichst dem Heulen aus, das von vorn kommt. Von vorn kommt nichts. Von hinten kommt sie.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Nach vorn, weg von ihr]
    Du läufst nach vorn. Sie landet auf deinem Rücken. Klauen, Gewicht, der Geruch von nassem Fell.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Herumfahren]
    Du drehst dich um. Da ist sie, schon in der Luft. Du duckst dich unter ihr weg und reißt die Säge hoch, und sie reißt sich selbst den Bauch daran auf.
    -> t5
+ [Stehen bleiben und horchen]
    Du bleibst stehen und horchst. Der Friedhof ist still. Zu lange. Sie trifft dich von hinten, mit der Schulter, und du fliegst gegen einen Stein.
    ~ zuletzt = bestie_kreis
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t5
- (t5)
Sie packt dich. Beide Klauen schließen sich um deine Schultern, und sie hebt dich hoch, bis ihr Gesicht vor deinem ist. Ihr Atem riecht nach Blut, nach Eisen, und darunter, ganz schwach, nach Weihrauch. Die Klauen haben sich in deinen Mantel gekrallt, nicht in dich. Das Leder knarrt an den Nähten. # anzeichen: griff
{ gelernt ? griff: Sie hält den Mantel, nicht dich. Wer sich schwer macht, fällt heraus. }
{ grund == "suche": Weihrauch. So roch der letzte Brief. }
+ [Zustechen, solange sie dich hält]
    Du stichst zu, mitten in ihren Griff hinein. Ihre Klauen graben sich in dein Fleisch, und deine Säge gräbt sich in ihres, und für einen langen Moment haltet ihr euch fest wie zwei Tänzer. Dann gibt sie nach.
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ {staerke >= 2} [Ihren Griff aufbrechen]
    Du legst die Hände auf ihre Klauen und drückst sie auseinander, Finger um Finger, mit einer Kraft, die nicht ganz deine ist. Sie heult vor Überraschung. Dann bist du frei, und ihre Brust ist offen. # notiz: staerke_genutzt
    -> sieg
+ [Dich fallen lassen und wegrollen]
    Du machst dich schwer, lässt dich aus ihrem Griff fallen wie ein nasser Sack, rollst über den Boden und bist wieder auf den Füßen, als sie ins Leere greift. Und dann, während sie sich umdreht, ist da ihre Brust, offen, und du stößt zu, so tief du kannst, und lässt nicht los.
    -> sieg
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= marke
~ jaegermarken = jaegermarken - 1
Du zerdrückst die Marke. Das Grab, das Heulen, die glühenden Augen, alles zerfällt, wie Asche zerfällt, wenn man hineinbläst. # klang: marke
{ not marke_benutzt:
    ~ marke_benutzt = true
    Im Fallen denkst du: Das war ein Weg hinein. Einen Weg hinaus hat dir niemand in die Hand gedrückt.
}
-> traum_von_laterne

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
~ echos = echos + 10
# stimmung: ruhig
{ gascoigne_moment:
    Die Bestie sinkt zwischen den Gräbern zusammen, und als sie stirbt, geht das Fell zurück, nicht ganz, nur ein wenig, als atme jemand darunter ein letztes Mal aus. Seine Lippen bewegen sich. Es klingt wie der Anfang eines Liedes. # notiz: gascoigne_ende_mensch
- else:
    Die Bestie fällt zwischen die Gräber und rührt sich nicht mehr. Um ihren Hals hängt noch der zerrissene Priesterschal, und eine Hand, halb Klaue, halb Hand, liegt offen auf der Erde{q_frau == 1:, die Hand, die dir am Laternenpfahl die Blechflasche gereicht hat}. # notiz: gascoigne_ende_bestie
}
Die Echos, die aus ihm aufsteigen, sind so zahlreich, dass sie dich beinahe von den Füßen reißen. Du stehst da und wartest, dass etwas geschieht, und es geschieht nichts. Er ist tot. Er bleibt tot. Er wacht nicht zwischen weißen Blumen auf. Deine Hand liegt an deiner Armbeuge, dort, wo der Einstich pocht, und sie bleibt lange dort.
Hinter der Mauer, oben im Bezirk der Kathedrale, singen sie wieder, leise und langsam.{ gedaechtnis_kleriker: Diesmal reißt die Zeile an derselben Stelle ab, an der auf der Brücke eine Stimme gekippt ist, und niemand singt sie zu Ende.| Mitten in einer Zeile bricht der Gesang ab, und niemand singt sie zu Ende.} # klang: choral
Auf dem Grabstein liegt noch seine Kappe, die Krempe nach oben. Niemand wird sie holen.
-> k1_d_grab
