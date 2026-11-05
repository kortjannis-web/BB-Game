// KAPITEL 1, NADELÖHR 2: VATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbild in A, Kampf in B (Anzeichen ruhig und genau, Folge kurz und hart). Optionen fließen in den Satz (#fliesst) und nennen die Richtung.
// [KANON lore:figuren/gascoigne, RK1 §11] Er hackt auf eine Leiche ein. Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine. Im Rausch: was sich bewegt, ist Bestie, und was sich nicht bewegt, dem traut er auch nicht. Beim Übergang in die zweite Phase riecht er süßes Blut, es singt ihm, und ihm wird übel davon. Alles sinngemäß, eigene Worte.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig, schneller, springt viel; kleiner als die Kleriker-Bestie).
// Acht Takte (Festlegung G9, Entscheidung des Nutzers 6 bis 8): Phase 1 t1, t2, t2b; Phase 2 t3, t3b; Phase 3 t4, t4b, t5. Die Spieluhr (uhr) ist kein eigener Takt.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat an den Gräbern). Um den Hals trägt er einen schmutzigen Schal, der als heiliges Tuch der Kirche gilt (RK1 §11, wahrscheinlich): Daran hängt der Weihrauch, nicht an seinem Atem.
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn in Menschen- und in Bestienform stocken; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Die Jägermarke kostet alle Blutechos, und sie bleiben nicht als Fleck liegen (Festlegung G3).
// [ERWEITERT] Der Hut mit der breiten Krempe liegt auf einem Grabstein; im Kanon trägt er ihn im Kampf.
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 3), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie, und nur, wenn man ihn ruft.
// Eileen hilft in Kapitel 1 nicht im Kampf; die Partnerschaft beginnt in Kapitel 2.
// Rede: Hier bricht seine Stimme wörtlich durch, kurz und kippend; im Moment der Klarheit nur noch Reste.

VAR uhr_bestie = false        // die Spieluhr in diesem Anlauf schon der Bestie vorgespielt (einmal je Anlauf)

=== k1_n2_gascoigne ===
// TITEL: NADELÖHR 2: Gascoigne
-> betreten("grab") ->
~ spieluhr_mal = 0
~ uhr_bestie = false
~ g_phase = 1
~ moment_moeglich = gascoigne >= 3 and spieluhr and gedaechtnis_kleriker
{ k1_n2_gascoigne == 1:
    ~ einsicht = einsicht + 1
    Hinter dem Tor hört das Räucherwerk auf. Den ganzen Weg durch die Unterstadt hat es dir in den Kleidern gehangen, süß und schwer wie überreifes Obst, und an den Gitterstäben bleibt es zurück. Hier riecht es nach umgegrabener Erde und kaltem Eisen. Der Friedhof steigt in breiten Stufen an, Grab über Grab, und der Nebel liegt so flach zwischen den Steinen, dass nur ihre Köpfe herausragen, Reihe um Reihe, eine Gemeinde, die auf den Beginn der Predigt wartet. Über der obersten Mauer hängt die Sonne, tief und rot, an derselben Stelle, an der sie schon vor Stunden hing.{not k1_c_graeber: Über dem Tor, durch das du gekommen bist, steht ein einziges Wort im Stein: Oedon.} # bild: grab_oedon # stimmung: grauen # lore: oedon
    Weiter oben schlägt es. Dumpf und gleichmäßig kommt es herunter, im Takt eines Dreschflegels auf der Tenne, und zwischen zwei Schlägen schmatzt es jedes Mal leise und nass. Ab und zu fährt die Klinge ganz hindurch und trifft auf Stein; dann klingt es hell und kurz, und der Ton läuft über die Gräber davon, bis der Nebel ihn schluckt.
    Er steht auf der obersten Stufe, mit dem Rücken zu dir, der lange Mantel nass bis an die Knie, und die Axt hebt sich und fällt. Seinen Hut hat er auf einen Grabstein gelegt, die breite Krempe nach oben, so ordentlich, wie man ihn vor der Messe auf die Bank legt. Was zu seinen Füßen liegt, trägt noch einen Stiefel, und die Schnalle daran ist blank geputzt. Der Wind kommt von oben und bringt seinen Geruch mit, nasses Fell und alter Schweiß, so dicht, dass das kalte Eisen darunter verschwindet. Der Griff deiner Feuerwaffe ist warm in deiner Hand. Wann du ihn gepackt hast, weißt du nicht. # kampf: gascoigne
    Sein Schatten liegt auf dem Nebel, und er liegt falsch. Er fällt der tiefen Sonne entgegen, als käme das Licht von woanders. # lore: einsicht
- else:
    Hinter dem Tor bleibt das Räucherwerk wieder zurück. Die Steine stehen im Nebel wie zuvor, und oben auf der letzten Stufe hebt sich die Axt und fällt, im selben Takt, als hätte deine Rückkehr für ihn nicht stattgefunden. Der Hut liegt noch auf dem Grabstein. Niemand hat ihn angerührt. # bild: grab_oedon # stimmung: grauen # kampf: gascoigne
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
        Er deutet mit der Axt hinab auf die Dächer, und von der Schneide fällt Tropfen um Tropfen in den Nebel. { mob_verbrannt: „Martha. Die hast du mir abgenommen. Hennings. Der alte Brack. Der Bäckerjunge.“ Er wartet, als müsse er nachzählen. „Alle.|„Martha. Hennings. Der alte Brack. Der Bäckerjunge. Alle.} Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
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
    Dann hebt er die Donnerbüchse, ohne Hast. Der trichterförmige Lauf schwenkt über die Steine, findet dich und bleibt ruhig, das Gewicht liegt auf seinem hinteren Fuß, und die Axt hängt locker an seiner Seite. Links von dir steht ein Grabstein, breit genug für zwei.{ parade_quelle == "gascoigne": Diese Haltung kennst du. Auf dem Platz am Scheiterhaufen hat er sie dir vorgemacht, für den Augenblick, in dem eine Bestie ausholt. Jetzt wartet er darauf, dass du ausholst.| Er wartet darauf, dass du dich rührst.} # anzeichen: gascoigne_schuss
- else:
    Er reißt die Donnerbüchse hoch. Der Trichter schwenkt herum und sucht dich, sein Finger liegt schon am Abzug, und links von dir wartet derselbe breite Grabstein. # anzeichen: gascoigne_schuss
}
{ gelernt ? gascoigne_schuss: Du kennst das jetzt. Erst der Schuss, der dich auf Abstand hält, dann kommt die Axt, sobald du dich zeigst. }
+ [Geradeaus auf ihn zustürmen #fliesst]
    Du stürmst geradeaus auf ihn zu, quer über die Gräber, und die Ladung trifft dich in die Brust: Dutzende kleiner Kugeln, eine Wand aus glühenden Nadeln.
    ~ zuletzt = gascoigne_schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {parade} [Unter der Ladung weg, dann schießen #fliesst]
    Du bleibst stehen, bis der Trichter Feuer spuckt, und wirfst dich unter der Ladung weg, die über dich hinwegpfeift. Er setzt mit der Axt nach, das ganze Gewicht im Schlag, und genau in diesem Augenblick schießt du. { parade_quelle == "gascoigne": Er wankt, so wie er es dir auf dem Platz beigebracht hat, mit dem Feuer im Rücken, und für einen Herzschlag zieht sich sein Mund zu einem Ausdruck zusammen, der Stolz sein könnte. Du stößt zu, bevor er sich fängt. | Er wankt, und du stößt zu, bevor er sich fängt. } # notiz: seine_lehre
    -> t2b
+ [Links hinter den Grabstein #fliesst]
    Du wirfst dich links hinter den Grabstein, und die Ladung schlägt in den Stein. Splitter regnen auf dich herab, Bruchstücke eines Namens, den niemand mehr lesen wird. Über den Stein hinweg hörst du ihn lachen. „Was zappelt, ist Bestie“, ruft er. „Und was sich hinterm Stein still hält, das hau ich trotzdem. Sicher ist sicher. Sicher ist sicher.“
    -> t2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
- (t2)
Er lässt die Donnerbüchse sinken und kommt in langen Schritten über die Gräber. Die Axt nimmt er tief hinter die Hüfte, die Schneide flach, genau auf der Höhe der Grabsteinköpfe, und zwei Schritte vor dir dreht sich seine Schulter ein. # anzeichen: gascoigne_bogen
{ gelernt ? gascoigne_bogen: Flach und hüfthoch, so kommt diese Axt. Darüber ist kein Platz. Darunter schon. }
+ [Rückwärts zwischen die Gräber weichen #fliesst]
    Du weichst rückwärts zwischen die Gräber, und er folgt, schneller, als ein Mann seiner Größe sein dürfte. Die Axt trifft dich an der Schulter.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
+ [Über die flache Axt springen #fliesst]
    Du springst über die flache Axt, und sie kommt höher, als du gedacht hast. Die Schneide reißt dir die Beine weg.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
+ [Unter dem Bogen durch und zuschlagen #fliesst]
    Du duckst dich unter dem Bogen durch, und die Axt pfeift über deinen Kopf. Dann bist du an ihm, und die Säge findet seine Seite. Er grunzt, mehr überrascht als verletzt.
    -> t2b
+ {ampulle > 0} [Zurückspringen und die Ampulle stoßen #fliesst]
    Du springst zurück, die Ampulle schon in der Faust.
    -> ampulle_gefahr(2) -> t2
+ {jaegermarken > 0} [Eine Jägermarke in der Faust zerdrücken #fliesst] -> marke
- (t2b)
// [ERWEITERT] Der Schuss aus nächster Nähe: Er lässt dich herankommen.
Er tritt nicht zurück. Er lässt die Axt in der Rechten sinken, ganz, bis die Schneide im Gras liegt, und dreht dir die linke Schulter zu, als wolle er dich umarmen. Die Donnerbüchse hängt an seiner linken Hüfte, der Trichter zeigt zu Boden. Nur sein Daumen bewegt sich. Er spannt den Hahn, und das Klicken ist das lauteste Geräusch auf dem Friedhof. # anzeichen: donner_nah
{ gelernt ? donner_nah: Die gesenkte Axt ist ein Köder. Der Schuss kommt aus der Hüfte, nach oben, und er trifft jeden, der vor ihm steht. }
+ [Von vorn in die offene Brust #fliesst]
    Du schlägst von vorn zu, in die offene Brust, und er auch. Der Trichter kommt hoch, und der Schuss reißt dich von den Füßen. Pulverdampf, Glut im Gesicht, Gras im Mund.
    ~ zuletzt = donner_nah
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p2
+ [Rechts um ihn herum, hinter ihn #fliesst]
    Du gehst rechts um ihn herum, hinter ihn, auf die Seite, wo die Axt im Gras liegt, und der Schuss geht ins Leere, in den Nebel. Ein Hieb in den Rücken, dicht unter dem Mantelkragen. Er brüllt.
    -> p2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= p2
~ g_phase = 2
Er tritt zurück, und mit einem Ruck der Handgelenke klappt er die Axt aus: Der Stiel fährt heraus, doppelt so lang wie zuvor, und er packt ihn mit beiden Händen. Die Donnerbüchse wirft er weg, achtlos, zwischen die Gräber. Dann lacht er, tief und kehlig, und das Lachen hört nicht auf, auch nicht, wenn er Atem holt. # phase # stimmung: kampf
Mitten darin hält er inne. Er hebt das Gesicht, zieht die Luft ein, lange, durch die Nase, und das Lachen bricht ab. „Riechst du's? Das Blut.“ Seine Stimme ist ganz weich geworden. „So süß. Und es singt, hörst du, es singt ja …“ Dann würgt er. Er krümmt sich über den langen Stiel, die Hand vor dem Mund, und durch die Finger hindurch lacht er weiter.
- (t3)
Er fasst den Stiel ganz am Ende und beginnt sich zu drehen. Die Schneide zieht einen Kreis, weiter, als seine Arme reichen, und wo sie einen Grabstein streift, fliegt der Kopf des Steins davon; nur innen, dicht an seinem Körper, schwingt der Stiel leer durch die Luft. # anzeichen: axt_lang
{ gelernt ? axt_lang: Du weißt jetzt: Die lange Axt reicht weiter, als seine Arme sind. Wer zurückweicht, ist schon getroffen. Nur ganz nah ist man sicher. }
+ [Zurück hinter einen hohen Stein #fliesst]
    Du weichst zurück hinter einen hohen Stein. Die Axt geht durch den Stein wie durch Kreide, und durch dich.
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t3b
+ {staerke >= 1} [Die lange Axt vorn abfangen #fliesst]
    Du fängst die lange Axt vorn mit der ausgeklappten Säge ab, mitten in ihrem Kreis. Der Schlag fährt dir bis in die Zähne, aber deine Arme halten, warm und schwer von dem, was die Puppe dir gegeben hat. Einen Augenblick steht ihr so, Stahl an Stahl, und er neigt den Kopf, als erkenne er etwas an dir. Dann reißt er sich los. # notiz: staerke_genutzt
    -> t3b
+ [Vorwärts, ganz nah an ihn heran #fliesst]
    Du gehst vorwärts, ganz nah an ihn heran, gegen alles, was deine Beine wollen: in den Kreis der Axt hinein, bis du seinen Atem riechst, Eisen und Süßes, Verdorbenes. Hier trifft die lange Klinge nicht. Hier triffst du.
    -> t3b
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
+ {ampulle > 0} [Rückwärts gehen und die Ampulle stoßen #fliesst]
    Du gehst rückwärts, die Ampulle schon in der Hand, und der Kreis der Axt kommt dir nach.
    -> ampulle_gefahr(2) -> t3
- (t3b)
// [ERWEITERT] Der Hieb von oben: Er stemmt die lange Axt in die Höhe.
Er stößt dich mit dem Stiel von sich, nicht fest, nur weit genug. Dann hebt er die lange Axt über den Kopf, beide Hände am Ende des Stiels, und hält sie dort, und hoch über ihm zittert die Schneide im Nebel. Er lacht nicht mehr. Stumm zählt er mit den Lippen, Silbe um Silbe, wie ein Mann, der früher die Glocke geläutet hat und den Takt im Blut trägt, und als du dich bewegst, wandert sein Kopf mit dir, gleichmäßig und genau. # anzeichen: axt_wirbel
{ gelernt ? axt_wirbel: Er zählt bis drei. Bei drei fällt die Axt, gerade herab, und spaltet, was vor ihm steht. Wer bei zwei geht, geht zu früh: Er folgt ihm mit der Schneide. }
+ [Sofort nach hinten weglaufen #fliesst]
    Du läufst sofort nach hinten weg, schon bei eins. Sein Kopf unter dem Verband folgt dir, und die Schneide folgt seinem Kopf. Sie trifft dich zwischen die Schulterblätter.
    ~ zuletzt = axt_wirbel
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
+ [Bis drei warten, dann nach links #fliesst]
    Du wartest. Eins. Zwei. Seine Lippen formen die Drei, und erst jetzt wirfst du dich nach links. Die Axt fährt in einen Grabstein und bleibt darin stecken, und während er am Stiel zerrt, schlägst du ihm in die Kniekehle, bis er auf ein Knie sinkt.
    -> p3
+ [Vorn hinein, solange die Arme oben sind #fliesst]
    Du gehst vorn hinein, solange seine Arme oben sind, und seine Brust ist offen, und du triffst. Aber er zählt nicht weiter. Er lässt einfach los, und der Stiel trifft dich am Kopf.
    ~ zuletzt = axt_wirbel
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p3
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= uhr
~ spieluhr_mal = spieluhr_mal + 1
{ spieluhr_mal:
- 1: Du ziehst die kleine Spieluhr auf und hältst sie hoch über die Gräber. Das Lied steigt auf, dünn und klar, ein Kinderlied an einem Ort, an dem keine Kinder sind, und Gascoigne erstarrt mitten in der Bewegung. Er lässt die Axt sinken und presst die Hände an den Kopf, um darin festzuhalten, was ihm entgleitet, und aus seiner Kehle kommt ein Laut, der kein Wort ist und kein Schrei. # klang: spieluhr # lore: spieluhr
- 2: Du ziehst die Feder ein zweites Mal auf, und wieder steigt das Lied. Er dreht den Kopf, suchend, über die Gräber, nach links, nach rechts. „Viola?“, sagt er. „Viola, wo …“ Er findet sie nicht, und die Hände an seinem Kopf zittern. # klang: spieluhr
- else: Zum dritten Mal ziehst du die Feder auf. Er krümmt sich unter dem Lied wie unter einem Schlag und schreit, und der Schrei geht über in ein Brüllen, das aus einem viel größeren Brustkorb kommt, als er ihn hat. # klang: spieluhr # notiz: spieluhr_dritte # stimmung: grauen
    -> p3
}
+ [Von vorn zuschlagen, solange er zuhört #fliesst]
    ~ im_lied_getroffen = true
    Du schlägst von vorn zu, solange er zuhört, und er wehrt sich nicht. Er steht gekrümmt da, die Hände am Kopf, und nimmt den Hieb, ohne die Arme zu senken, weil die Hände an seinem Kopf wichtiger sind. Das Lied spielt weiter, bis die Feder abgelaufen ist.
    -> weiter_nach_lied
+ {ampulle > 0} [Hinter einem Stein die Ampulle stoßen #fliesst]
    Hinter dem nächsten Stein gehst du in die Knie. Er hört nur das Lied, und du hast Zeit.
    -> ampulle_ruhig -> weiter_nach_lied
+ [Einen Schritt zurück, das Lied abwarten #fliesst]
    Du trittst einen Schritt zurück und wartest das Lied ab. Note um Note läuft es aus, und mit der letzten lässt er die Hände sinken und greift wieder nach der Axt, zögernder als vorher, wie ein Mann, der aus dem Schlaf hochfährt und nicht weiß, wo er ist.
    -> weiter_nach_lied
+ [Ihn leise beim Namen rufen #fliesst]
    { moment_moeglich and not gascoigne_moment: -> moment }
    Du rufst ihn leise bei seinem Namen. Er hebt den Kopf, und für einen halben Atemzug ist da ein Suchen in seinem Gesicht. „Viola?“, sagt er. Dann ist es fort, so schnell, wie ein Docht ausgeht, und die Axt ist wieder oben. # notiz: halber_moment
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
Du holst Luft, um ihn zu rufen, und hältst sie an, denn du erkennst es. Du hast es schon einmal gesehen, auf der Brücke, durch die Augen eines Klerikers, der seinen Namen suchte: die Stimme, die bricht, den Blick auf die eigenen Hände, und dahinter, ganz hinten, einen, der noch antworten kann. Darum rufst du nicht über die Gräber hinweg. Du wartest, bis seine Stimme bricht, an derselben Stelle wie die des Klerikers im Lied, und dann sagst du seinen Namen, leise, den Namen aus dem Deckel der Spieluhr, der dort neben dem seiner Frau steht. # gedaechtnis: gascoigne_klarheit # stimmung: schoen
Gascoigne hebt den Kopf. Und für einen Atemzug, einen einzigen, ist er da. Er hält die Schultern, wie er sie auf dem Platz am Scheiterhaufen gehalten hat, und neigt den Kopf, als lausche er.
„Viola“, sagt er. Nicht zu dir.
Dann, mit seiner alten Stimme, der warmen, tiefen, aber in Stücken: „Ich weiß. Was ich bin. Lang schon.“ Er atmet. „Mach's. Bevor ich wieder geh.“ Er atmet noch einmal. „Ich geh wieder. Spür's schon.“
* [Ihm versprechen, nach der Kleinen zu sehen #fliesst]
    ~ versprechen_gascoigne = true
    Du versprichst ihm, nach der Kleinen zu sehen. Er nickt, und unter dem Verband laufen Tränen hervor, und er lässt sie laufen. „Sag ihr …“ Er sucht. „Das Lied. Sag ihr, das Lied weiß ich noch. Nur alles andere nicht.“
* [Ihn nach Viola fragen #fliesst]
    Du fragst ihn nach Viola. Sein Mund öffnet sich und schließt sich wieder. „Weiß nicht“, sagt er. „Weiß es nicht mehr.“ Seine Hände suchen an seinem Mantel nach einer Tasche, einem Knopf, und finden nichts. # notiz: viola_frage
* [Schweigend die Säge heben #fliesst]
    Du sagst nichts und hebst nur die Säge. Er versteht. Er breitet die Arme aus, ein wenig, wie ein Priester, der den Segen spricht.
- Dann kippt er. Diesmal siehst du es kommen, und es hilft nichts.
-> p3

= p3
~ g_phase = 3
Das Fell bricht durch den Mantel. Es wächst ihm aus dem Nacken, aus den Armen, aus dem Gesicht, schwarz und struppig, und der Verband reißt, und darunter sind keine Augen mehr, nur zwei glühende Punkte in einem Schädel, der sich knackend in die Länge zieht. Er wächst, bis er doppelt so groß ist, wie er war, krummer und schwerer, kleiner als das Ding auf der Brücke und schneller, und um seinen Hals hängt, zerrissen und schmutzig, der Priesterschal. # phase # stimmung: grauen
{ gascoigne2: Zwischen den Gräbern hast du durch den Mund geatmet, um ihn nicht zu riechen. Jetzt weißt du, wonach er gerochen hat. }
- (t4)
Sie landet rechts von dir auf einem Grabstein und kauert dort, und unter dem Fell ziehen sich die Hinterläufe zusammen. Ihr Kopf zielt auf die Stelle, an der du jetzt stehst, und bleibt dort, auch als du das Gewicht verlagerst. Dann springt sie, von rechts, über drei Gräber hinweg, die Klauen voran, mit einem Heulen, das an den Grabsteinen hochklettert und oben von der Mauer zurückkommt. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Du weißt, wohin sie springt: dorthin, wo du jetzt stehst, und von rechts. Wer nach rechts weicht, läuft ihr in die Klauen. }
// [ERWEITERT] Einsicht kostet: Wer zu viel sieht, sieht auch den falschen Schatten (angekündigt bei der Ankunft). Er springt nach links, und wer vor ihm nach rechts ausweicht, läuft ihr entgegen. Der richtige Weg bleibt links, für alle.
{ einsicht >= 3: Ihr Schatten springt vor ihr her über die Gräber, und er springt nach links. Sie selbst ist noch in der Luft. }
+ {feuer} [Gilberts Flamme hoch in den Sprung halten #fliesst]
    Du hältst Gilberts Flamme hoch in den Sprung hinein, und das Fell fängt Feuer. Die Bestie heult und wälzt sich zwischen den Gräbern, und es riecht nach versengtem Haar und nach Fett.
    -> t4b
+ {molotow > 0} [Den Molotow hoch gegen sie werfen #fliesst]
    ~ molotow = molotow - 1
    Du wirfst den Molotow hoch gegen ihre Brust, und er zerspringt dort, und das Feuer läuft über ihr Fell wie Wasser über einen Stein.
    -> t4b
+ {einsicht >= 3} [Vor dem Schatten nach rechts weichen #fliesst]
    Du weichst vor dem Schatten nach rechts. Der Schatten lag falsch, wie schon bei deiner Ankunft, und sie landet genau dort, wohin du dich geworfen hast.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ [{einsicht >= 3:Nach links, dem Schatten nach|Nach links aus ihrer Bahn} #fliesst]
    Du wirfst dich nach links{einsicht >= 3:, dem Schatten nach, gegen alles, was deine Augen dir sagen|, aus ihrer Bahn}, und sie landet hinter dir. Ein Grabstein springt aus der Erde und rollt dir gegen die Fersen.
    -> t4b
+ [Den Sprung von vorn abfangen #fliesst]
    Du stellst dich ihr von vorn mit der Säge entgegen, und genauso gut könntest du einen Wasserfall mit einem Spaten aufhalten.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ {ampulle > 0} [Zurückspringen und die Ampulle stoßen #fliesst]
    Du springst zurück, die Ampulle schon in der Faust.
    -> ampulle_gefahr(2) -> t4
- (t4b)
// [ERWEITERT] Kreis und Stille in einem Takt (Festlegung G9): Sie umkreist dich heulend; wenn das Heulen aussetzt, springt sie von dort, wo die Stille anfing.
Sie greift nicht gleich wieder an. Sie läuft, auf allen vieren, im Kreis um dich herum über die Gräber, und wo ihre Klauen aufsetzen, reißt die Erde in Furchen auf. Dabei heult sie ohne Pause, ein langer Ton, der von der Mauer zurückkommt, so dass du sie von zwei Seiten zugleich zu hören glaubst: links, dann hinten, dann rechts, dann wieder hinten. Dort, hinter dir, mitten im Kreis, setzt das Heulen aus. # anzeichen: bestie_kreis
{ gelernt ? bestie_kreis: Solange sie heult, läuft sie. Wenn sie still ist, springt sie, und zwar von dort, wo die Stille anfing. }
// [ERWEITERT] Einsicht kostet: Wer zu viel hört, hört das Heulen weiter, auch als es schon aufgehört hat.
{ einsicht >= 3: In deinem Kopf aber hört es nicht auf. Es läuft weiter, rund um dich, und jetzt kommt es von vorn. }
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn auch in Bestienform stocken. Einmal je Anlauf.
+ {spieluhr and not uhr_bestie} [Mit der Spieluhr nach hinten herumfahren #fliesst]
    ~ uhr_bestie = true
    ~ im_lied_getroffen = true
    Du fährst mit der Spieluhr nach hinten herum, die Feder schon gespannt, und lässt sie los. Das Lied steigt in die Stille, dünn und klar. Die Bestie bleibt stehen, mitten im Ansatz zum Sprung, und senkt den Kopf zur Melodie, tief, bis die Schnauze das Gras berührt, und aus dem zu großen Körper kommt ein Winseln, hoch und dünn, das kein Tier dieser Größe haben dürfte. Sie rührt sich nicht, als du zuschlägst. # klang: spieluhr # stimmung: grauen
    -> t5
+ {einsicht >= 3} [Vor dem Heulen nach hinten weichen #fliesst]
    Du weichst vor dem Heulen, das von vorn kommt, nach hinten aus. Von vorn kommt nichts. Von hinten kommt sie.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Nach vorn davonlaufen #fliesst]
    Du läufst nach vorn davon, und sie landet auf deinem Rücken: Klauen, Gewicht, der Geruch von nassem Fell.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Nach hinten herumfahren, unter sie #fliesst]
    Du fährst nach hinten herum, und da ist sie, schon in der Luft. Du duckst dich unter sie und reißt die Säge hoch, und sie reißt sich selbst den Bauch daran auf.
    -> t5
+ [Stehen bleiben, nach hinten horchen #fliesst]
    Du bleibst stehen und horchst nach hinten. Der Friedhof ist still, zu lange still, und dann trifft sie dich von hinten mit der Schulter, und du fliegst gegen einen Stein.
    ~ zuletzt = bestie_kreis
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t5
+ {ampulle > 0} [Rechts hinter einen Stein, die Ampulle #fliesst]
    Du duckst dich rechts hinter einen Stein, die Ampulle schon in der Faust.
    -> ampulle_gefahr(2) -> t4b
- (t5)
Sie packt dich. Beide Klauen schließen sich um deine Schultern, und sie hebt dich hoch, bis ihr Gesicht vor deinem ist und dir ihr Atem entgegenschlägt, Blut und Eisen und nasses Fell. Der zerrissene Schal an ihrem Hals schwingt dicht vor deinen Augen, und aus dem schmutzigen Stoff steigt, ganz schwach, ein herber, harziger Geruch, der nicht hierher gehört: Weihrauch. Die Klauen haben sich in deinen Mantel gekrallt, nicht in dich, und das Leder knarrt an den Nähten. # anzeichen: griff
{ gelernt ? griff: Sie hält den Mantel, nicht dich. Wer sich schwer macht, fällt nach unten heraus. }
{ grund == "suche": Weihrauch, wie an deinem letzten Brief. Auch ihn, denkst du, hat die Kirche einmal angefasst. }
+ [Von vorn in ihren Griff stechen #fliesst]
    Du stichst von vorn zu, mitten in ihren Griff hinein. Ihre Klauen graben sich in dein Fleisch und deine Säge in ihres, und einen langen Moment haltet ihr einander fest wie zwei Tänzer, die nicht loslassen können. Dann gibt sie nach.
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ {staerke >= 2} [Ihre Klauen nach beiden Seiten aufbrechen #fliesst]
    Du legst die Hände auf ihre Klauen und brichst sie nach beiden Seiten auf, Finger um Finger, mit einer Kraft, die nicht ganz deine ist. Sie heult vor Überraschung, und dann bist du frei, und ihre Brust ist offen. # notiz: staerke_genutzt
    -> sieg
+ [Nach unten aus ihrem Griff fallen #fliesst]
    Du machst dich schwer und fällst nach unten aus ihrem Griff, rollst über den Boden und bist wieder auf den Füßen, als sie ins Leere greift. Während sie sich umdreht, liegt ihre Brust offen, und du stößt zu, so tief du kannst, und lässt nicht los.
    -> sieg
+ {jaegermarken > 0} [Eine Jägermarke in der Faust zerdrücken #fliesst] -> marke

= marke
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Wer die Marke zerdrückt, verliert alle Blutechos; sie bleiben nicht als Fleck liegen (Festlegung G3). Eine gemeinsame Stelle in system.ink wäre besser (Faktencheck system.ink Nr. 2); bis dahin hier und in n1_kleriker.ink.
~ jaegermarken = jaegermarken - 1
~ marke_benutzt = true
Du zerdrückst die Marke in der Faust, und {g_phase < 3:der Friedhof, die Axt, sein lachender Mund|das Grab, das Heulen, die glühenden Augen} zerfallen, wie Asche zerfällt, wenn man hineinbläst. # klang: marke
{ echos > 0: Was an fremdem Blut in dir gesummt hat, seit du in dieser Stadt tötest, bleibt auf dem Friedhof zurück, und nichts wird zeigen, wo. }
~ echos = 0
-> traum_von_laterne

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
~ echos = echos + 10
# stimmung: ruhig
{ gascoigne_moment:
    Die Bestie sinkt zwischen den Gräbern zusammen, und als sie stirbt, geht das Fell ein wenig zurück, nicht ganz, als atme darunter jemand ein letztes Mal aus. Seine Lippen bewegen sich, und du kennst die ersten Töne. # notiz: gascoigne_ende_mensch
- else:
    Die Bestie fällt zwischen die Gräber und rührt sich nicht mehr. Um ihren Hals hängt der zerrissene Priesterschal, und eine Hand, halb Klaue, halb Hand, liegt offen auf der Erde{q_frau == 1:, eine Hand, die du vom Scheiterhaufen kennst}. # notiz: gascoigne_ende_bestie
}
Was aus ihm aufsteigt, ist so viel, dass es dich beinahe von den Füßen reißt, eine Wärme, die dir unter die Haut fährt und nicht wieder geht. Du stehst da und wartest, dass etwas geschieht, und es geschieht nichts. Er ist tot. Er bleibt tot. Er wacht nicht zwischen weißen Blumen auf. Deine Hand liegt an deiner Armbeuge, dort, wo der Einstich pocht, und sie bleibt lange dort.
Hinter der Mauer, oben im Bezirk der Kathedrale, singen sie wieder, leise und gemessen.{ gedaechtnis_kleriker: Diesmal reißt die Zeile an derselben Stelle ab, an der auf der Brücke eine Stimme gekippt ist, und niemand singt sie zu Ende.| Mitten in einer Zeile bricht der Gesang ab, und niemand singt sie zu Ende.} # klang: choral
Auf dem Grabstein liegt noch sein Hut, die breite Krempe nach oben. Niemand wird ihn holen.
-> k1_d_grab
