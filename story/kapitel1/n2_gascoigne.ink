// KAPITEL 1, NADELÖHR 2: PATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// [KANON] Er hackt auf eine Leiche ein; Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig).
// [KANON] Die Spieluhr lässt ihn innehalten; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 2), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie.
// Eileen hilft in Kapitel 1 nicht im Kampf; die Partnerschaft beginnt in Kapitel 2.

=== k1_n2_gascoigne ===
// TITEL: NADELÖHR 2: Gascoigne
-> betreten("grab") ->
~ spieluhr_mal = 0
~ moment_moeglich = gascoigne >= 2 and spieluhr and gedaechtnis_kleriker
{ k1_n2_gascoigne == 1:
    ~ einsicht = einsicht + 1
    Hinter dem Tor liegt das Grab des Oedon. Es ist kein einzelnes Grab, sondern ein weiter, offener Friedhof unter einem Himmel, der hier tiefer zu hängen scheint als anderswo, so tief, dass du dich unwillkürlich duckst. Hunderte Grabsteine, kreuz und quer, und zwischen ihnen Nebel, der sich in Bodennähe hält wie Wasser in einem Becken. Ein Name ohne Gesicht über einem Ort, an dem niemand mehr betet. # bild: grab_oedon # stimmung: grauen # lore: oedon
    In der Mitte des Friedhofs beugt sich ein Mann über einen Leichnam. Er hackt. Wieder und wieder hebt sich die Axt und fällt, mit einem Geräusch wie Holzhacken im Winter, nur nasser, und bei jedem Hieb bebt der lange Mantel auf seinen Schultern. # kampf: gascoigne
- else:
    Wieder das Grab des Oedon, wieder der Nebel zwischen den Steinen. Und wieder der Mann mit der Axt über dem Leichnam, als hätte er nie aufgehört, als hätte deine Rückkehr für ihn nicht stattgefunden. # bild: grab_oedon # stimmung: grauen # kampf: gascoigne
}
{ gascoigne >= 1:
    Dann hört er auf. Er dreht sich um, langsam, und es ist Gascoigne, der Verband über den Augen ist schwarz vor Blut. Er sagt deinen Namen, {name}, und er sagt ihn, als wäre es ein Fluch, als hättest du ihm etwas genommen. Überall seien Bestien, sagt er, überall, überall, und früher oder später werdest auch du eine sein. Du wirst sehen. Du wirst sehen.
- else:
    Dann hört er auf. Er dreht sich um, die Augen verbunden, groß und schwer, und er lächelt nicht. Überall Bestien, sagt er mit einer Stimme wie aus einem tiefen Brunnen, überall. Und früher oder später werde man selbst eine. Du wirst sehen. # lore: gascoigne
}
-> p1

= p1
# stimmung: kampf
- (t1)
Er reißt die Donnerbüchse hoch. Der trichterförmige Lauf schwenkt herum, sucht dich, und du siehst seinen Finger am Abzug. # anzeichen: schuss
{ gelernt ? schuss: Du kennst das jetzt. Erst der Schuss, der dich auf Abstand hält, dann kommt die Axt, sobald du dich zeigst. }
+ [Hinter einen Grabstein]
    Du wirfst dich hinter den nächsten Grabstein. Die Ladung schlägt in den Stein, und Splitter regnen auf dich herab, Bruchstücke eines Namens, den niemand mehr lesen wird.
    -> t2
+ {parade} [Selbst schießen, im Moment seines Ausholens]
    Du wartest. Er hebt die Axt nach dem Schuss, das ganze Gewicht in den Schlag, so wie er es dir gezeigt hat, auf dem Platz am Scheiterhaufen, mit dem Feuer im Rücken. Und du schießt, genau in diesem Augenblick. Er wankt. Er wankt, wie er es dir beigebracht hat, und du stößt zu, und für eine Sekunde glaubst du, Stolz in seinem Gesicht zu sehen. # notiz: seine_lehre
    -> t2
+ [Auf ihn zu]
    Du stürmst auf ihn zu, quer über die Gräber. Die Ladung trifft dich in die Brust, Dutzende kleine Kugeln, und es ist, als renne man gegen eine Wand aus glühenden Nadeln.
    ~ zuletzt = schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
- (t2)
Er kommt. Die Axt beschreibt einen weiten, flachen Bogen über die Grabsteine, so schnell, dass sie in der Luft singt. # anzeichen: schwer
+ [Unter dem Bogen durch und zuschlagen]
    Du duckst dich, und die Axt pfeift über deinen Kopf. Dann bist du an ihm, und deine Waffe findet seine Seite, und er grunzt, mehr überrascht als verletzt.
    -> p2
+ [Zurückweichen]
    Du weichst zurück. Er folgt, schneller als ein Mann seiner Größe sein dürfte, und die Axt trifft dich an der Schulter.
    ~ zuletzt = schwer
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p2
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t2
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= p2
Er tritt zurück, und mit einem Ruck seiner Handgelenke klappt er die Axt aus. Der Stiel fährt aus, doppelt so lang wie zuvor, und er packt sie mit beiden Händen. Die Donnerbüchse wirft er weg, achtlos, zwischen die Gräber. Sein Lachen hat sich verändert. Es ist tiefer jetzt, kehliger, und es hört nicht mehr auf, auch nicht, wenn er atmet. # phase # stimmung: kampf
- (t3)
Die lange Axt fegt über die Gräber, kreisend, und zerschlägt Grabsteine wie Brotlaibe. # anzeichen: axt_lang
{ gelernt ? axt_lang: Du weißt jetzt: Die lange Axt reicht weiter, als seine Arme sind. Wer zurückweicht, ist schon getroffen. Nur ganz nah ist man sicher. }
+ [Ganz nah heran, wo die lange Axt nicht hinkommt]
    Du tust das Gegenteil von dem, was jeder Instinkt in dir schreit. Du gehst auf ihn zu, in den Kreis der Axt hinein, bis du so nah bist, dass du seinen Atem riechst, Eisen und etwas Süßes, Verdorbenes. Hier kann die lange Klinge dich nicht treffen. Hier triffst du.
    -> p3
+ [Zurück hinter die Gräber]
    Du weichst zurück, hinter einen hohen Stein. Die Axt geht durch den Stein hindurch, als wäre er aus Kreide, und trifft dich dahinter.
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t3

= uhr
~ spieluhr_mal = spieluhr_mal + 1
Du ziehst die kleine Spieluhr auf, mit zitternden Fingern, und hältst sie hoch. Das Lied steigt auf, dünn und klar zwischen den Gräbern, ein Kinderlied in einem Albtraum. Gascoigne erstarrt mitten in der Bewegung. Er lässt die Axt sinken. Er presst die Hände an den Kopf, als wollte er etwas darin festhalten, das ihm entgleitet, und ein Laut kommt aus seiner Kehle, der kein Wort ist und kein Schrei. # klang: spieluhr # lore: spieluhr
{ moment_moeglich and not gascoigne_moment: -> moment }
{ spieluhr_mal >= 3:
    Doch beim dritten Mal bricht etwas in ihm. Du siehst es geschehen, und du wirst es nie vergessen: Das Lied, das ihn eben noch festgehalten hat, zerreißt das letzte Band. Er schreit, und der Schrei geht über in etwas anderes. # notiz: spieluhr_dritte # stimmung: grauen
    -> p3
}
Er steht da, gekrümmt, und hört zu. Du nutzt den Moment, und es ist der grausamste Moment dieser Nacht: Du triffst ihn, während er sich an seine Familie erinnert.
-> p2

= moment
// Die bessere Entscheidung, die das Blutgedächtnis möglich macht.
~ gascoigne_moment = true
Und du erkennst es. Du erkennst es, weil du es schon einmal gesehen hast, auf der Brücke, durch die Augen eines Klerikers, der seinen Namen suchte: die Stimme, die bricht, den Blick auf die eigenen Hände, und dahinter, ganz hinten, jemanden, der noch antworten kann. Du rufst ihn. Nicht den Jäger, nicht den Pater. Du rufst ihn bei dem Namen, der im Deckel der Spieluhr steht. # gedaechtnis: gascoigne_klarheit # stimmung: schoen
Gascoigne hebt den Kopf. Und für einen Atemzug, einen einzigen, ist er da. Du siehst es an der Art, wie er die Schultern hält, wie er den Kopf neigt, als lausche er. Er sagt: Viola. Er sagt es nicht zu dir. Dann sagt er, ganz ruhig, mit seiner alten, warmen Stimme, dass er wisse, was er geworden sei. Dass er es schon lange wisse. Und er bittet dich, es zu beenden, bevor er wieder gehe. Denn er werde wieder gehen. Er spüre es schon.
* [Ihm versprechen, nach seiner Tochter zu sehen]
    ~ versprechen_gascoigne = true
    Du versprichst es ihm. Er nickt, und die Tränen laufen unter dem Verband hervor. Sag ihr, flüstert er, sag ihr, Papa hat das Lied nicht vergessen. Nur alles andere.
* [Ihn fragen, was mit Viola geschehen ist]
    Du fragst ihn nach seiner Frau. Er sieht dich lange an, und dann sagt er das Schlimmste, das er in dieser Nacht sagt: Er wisse es nicht mehr. Er wisse es nicht. Und an seinem Gesicht siehst du, dass er Angst hat vor der Antwort. # notiz: viola_frage
* [Schweigen und die Waffe heben]
    Du sagst nichts. Du hebst nur die Waffe. Er versteht. Er breitet die Arme aus, ein wenig, wie ein Priester, der den Segen spricht.
- Dann kippt er. Du siehst es kommen, diesmal, und das macht es nicht leichter.
-> p3

= p3
Das Fell bricht durch den Mantel. Es wächst aus seinem Nacken, aus seinen Armen, aus seinem Gesicht, schwarz und struppig, und der Verband reißt, und darunter sind keine Augen mehr, nur zwei glühende Punkte in einem Schädel, der sich in die Länge zieht, knackend, wie ein Ast unter Last. Er wächst. Er wird größer, schwerer, krummer, bis vor dir eine Bestie steht, so groß wie die auf der Brücke, und um ihren Hals hängt, zerrissen und schmutzig, ein Priesterschal. # phase # anzeichen: bestie_sprung # stimmung: grauen
- (t4)
Sie springt. Sie springt über drei Gräber hinweg, die Klauen voran, mit einem Heulen, das dir das Blut gefrieren lässt. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Du weißt, wohin sie springt: dorthin, wo du jetzt stehst, nicht dorthin, wo du gleich sein wirst. }
+ {feuer or molotow > 0} [Feuer]
    { feuer:
        Du reißt den Flammenwerfer hoch, Gilberts Geschenk, und hältst die Flamme in den Sprung hinein. Das Fell fängt Feuer, und die Bestie heult und wälzt sich zwischen den Gräbern.
    - else:
        ~ molotow = molotow - 1
        Du wirfst den Molotow. Er zerspringt an ihrer Brust, und das Feuer läuft über ihr Fell wie Wasser über einen Stein.
    }
    -> t5
+ [Seitlich weg]
    Du wirfst dich zur Seite, und sie landet hinter dir, so schwer, dass ein Grabstein aus der Erde springt.
    -> t5
+ [Den Sprung abfangen]
    Du versuchst, sie mit der Waffe aufzuhalten. Es ist, als wolle man einen Wasserfall mit einem Brett aufhalten.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t4
- (t5)
Sie packt dich. Beide Klauen schließen sich um deine Schultern, und sie hebt dich hoch, bis ihr Gesicht vor deinem ist, und du riechst ihren Atem, und darin, unfassbar, ganz schwach, Weihrauch. # anzeichen: griff
+ [Dich fallen lassen und wegrollen]
    Du machst dich schwer, lässt dich aus ihrem Griff fallen wie ein nasser Sack, rollst über den Boden und bist wieder auf den Füßen, als sie ins Leere greift. Und dann, während sie sich umdreht, ist da ihre Brust, offen, und du stößt zu, so tief du kannst, und lässt nicht los.
    -> sieg
+ [Zustechen, solange sie dich hält]
    Du stichst zu, mitten in ihren Griff hinein. Ihre Klauen graben sich in dein Fleisch, und deine Klinge gräbt sich in ihres, und für einen langen Moment haltet ihr euch fest wie zwei Tänzer. Dann gibt sie nach.
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= marke
~ jaegermarken = jaegermarken - 1
Du zerdrückst die Marke. Das Grab, das Heulen, die glühenden Augen, alles zerfällt, wie Asche zerfällt, wenn man hineinbläst. # klang: marke
-> traum_von_laterne

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
~ echos = echos + 10
# stimmung: ruhig
{ gascoigne_moment:
    Die Bestie sinkt zwischen den Gräbern zusammen, und als sie stirbt, geht das Fell zurück, nicht ganz, nur ein wenig, als atme jemand darunter ein letztes Mal aus. Er stirbt als Mensch, oder beinahe. Seine Lippen bewegen sich. Es klingt wie der Anfang eines Liedes. # notiz: gascoigne_ende_mensch
- else:
    Die Bestie fällt zwischen die Gräber und rührt sich nicht mehr. Erst jetzt, als alles still ist, erkennst du den zerrissenen Priesterschal wieder, den sie um den Hals trägt, und die Hand, die einmal eine Axt gehalten hat und dir auf die Schulter geschlagen, genau auf die Stelle, die wehtat. # notiz: gascoigne_ende_bestie
}
Die Echos, die aus ihm aufsteigen, sind so zahlreich, dass sie dich beinahe von den Füßen reißen. Und mit ihnen kommt etwas anderes, ein Wissen, ein Riss in der Wand deiner Welt, durch den ein kaltes, fremdes Licht fällt. Du hast etwas gesehen, das ein Mensch nicht sehen sollte: wie dünn die Haut ist zwischen einem Vater und einer Bestie.
-> k1_d_grab
