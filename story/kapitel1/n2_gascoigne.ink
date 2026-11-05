// KAPITEL 1, NADELÖHR 2: VATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbild in A, Kampf in B (Anzeichen ruhig und genau, Folge kurz und hart). Optionen fließen in den Satz (#fliesst) und nennen die Richtung.
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen ohne „Du“-Protokoll, Lernsätze als Erinnerung des Körpers, „er“ bis zum Tod, Verwandlung als langsamer Vorgang, Moment der Klarheit ohne Erklärung.
// [KANON lore:figuren/gascoigne, RK1 §11] Er hackt auf eine Leiche ein. Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine. Im Rausch: was sich bewegt, ist Bestie, und was sich nicht bewegt, dem traut er auch nicht. Beim Übergang in die zweite Phase riecht er süßes Blut, es singt ihm, und ihm wird übel davon. Alles sinngemäß, eigene Worte; das Bild (angebrannter Kandis, ein Lied, das er kennt) ist unser.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig, schneller, springt viel; kleiner als die Kleriker-Bestie).
// Acht Takte (Festlegung G9, Entscheidung des Nutzers 6 bis 8): Phase 1 t1, t2, t2b; Phase 2 t3, t3b; Phase 3 t4, t4b, t5. Die Spieluhr (uhr) ist kein eigener Takt.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat an den Gräbern). Um den Hals trägt er einen schmutzigen Schal, der als heiliges Tuch der Kirche gilt (RK1 §11, wahrscheinlich): Daran hängt der Weihrauch, nicht an seinem Atem.
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn in Menschen- und in Bestienform stocken; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [ERWEITERT] Dem Kamm der Spieluhr fehlt ein Zahn; in der dritten Zeile fällt ein Ton aus. An den Gräbern summt Gascoigne genau diesen Ton, im Kampf presst er die Hände an den Kopf, die Bestie winselt ihn, im Moment der Klarheit fällt sein Name in die Lücke, im Tod hört er dort auf. Der Choral reißt am Ende ebenfalls ab.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Die Jägermarke kostet alle Blutechos, und sie bleiben nicht als Fleck liegen (Festlegung G3).
// [ERWEITERT] Der Hut mit der breiten Krempe liegt auf einem Grabstein; im Kanon trägt er ihn im Kampf. Der Ring, der ihm in den Finger gewachsen ist (Gegenbild zu Gilberts zu weitem Ring).
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 3), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie, und nur, wenn man ihn ruft.
// Eileen hilft in Kapitel 1 nicht im Kampf; die Partnerschaft beginnt in Kapitel 2.
// Rede: Hier bricht seine Stimme wörtlich durch, kurz und kippend; im Moment der Klarheit nur noch Reste, zuletzt sein „So.“.
// Geruch (L5): An den Gräbern einmal „nasses Fell“, am Grab unbenannt (der Körper atmet schon durch den Mund), Ernte erst im Griff (t5).

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
    Hinter dem Tor hört das Wasser auf. Den ganzen Weg durch die Unterstadt ist es neben dir hergelaufen, in den Rinnen, über die Stufen, aus den Fugen der Mauern, und erst jetzt, da es fehlt, merkst du, wie laut es war. Hier riecht es nach umgegrabener Erde und kaltem Eisen. Der Friedhof steigt in breiten Stufen an, Grab über Grab, und der Nebel liegt so flach zwischen den Steinen, dass nur ihre Köpfe herausragen, Reihe um Reihe, eine Gemeinde, die auf den Beginn der Predigt wartet. Über der obersten Mauer hängt die Sonne, tief und rot, und du kannst in sie hineinsehen, ohne dass dir die Augen tränen.{not k1_c_graeber: Über dem Tor, durch das du gekommen bist, steht ein einziges Wort im Stein: Oedon.} # bild: grab_oedon # stimmung: grauen # lore: oedon
    Weiter oben schlägt es. Schwer und ohne Eile kommt es herunter, im Takt eines Dreschflegels auf der Tenne, und zwischen zwei Schlägen schmatzt es jedes Mal leise und nass. Ab und zu fährt die Klinge ganz hindurch und trifft auf Stein; dann klingt es hell und kurz, und der Ton läuft über die Gräber davon, bis der Nebel ihn schluckt.
    Er steht auf der obersten Stufe, mit dem Rücken zu dir, der lange Mantel nass bis an die Knie, und die Axt hebt sich und fällt. Seinen Hut hat er auf einen Grabstein gelegt, die breite Krempe nach oben, so ordentlich, wie man ihn vor der Andacht auf die Bank legt. Was zu seinen Füßen liegt, trägt noch einen Stiefel, und die Schnalle daran ist blank geputzt. Der Wind kommt von oben herab, und du atmest schon durch den Mund. Der Griff deiner Feuerwaffe ist warm in deiner Hand; wann du ihn gepackt hast, weißt du nicht. # kampf: gascoigne
    Sein Schatten liegt auf dem Nebel, und er liegt falsch. Er fällt der tiefen Sonne entgegen, als käme das Licht von woanders. # lore: einsicht
- else:
    Hinter dem Tor verstummt das Wasser wieder. Oben auf der letzten Stufe hebt sich die Axt und fällt, im selben Takt wie beim ersten Mal, und kein Schlag kommt früher, weil du zurück bist. Der Hut liegt auf seinem Grabstein, die Krempe nach oben. # bild: grab_oedon # stimmung: grauen # kampf: gascoigne
}
{ k1_n2_gascoigne > 1:
    Die Axt bleibt oben stehen. Er dreht sich um, die Schulter zuerst, dann die Hüfte, genau wie beim ersten Mal, und zieht die Luft ein, lange, durch die Nase. Nichts in seinem Gesicht verrät, dass ihr euch schon begegnet seid. { q_frau == 1 or gascoigne2: „{gascoigne_name:{name}|Fremder}“, sagt er, freundlich, als käme er dich an der Tür abholen. „Dann siehst du's auch.“ | „Noch einer“, sagt er. „Immer noch einer.“ }
    -> p1
}
{ q_frau == 1 or gascoigne2:
    Die Axt bleibt oben stehen. Er dreht sich um, die Schulter zuerst, dann die Hüfte. Der Verband über seinen Augen ist steif geworden und dunkel bis zum Knoten, und trotzdem findet sein Gesicht dich sofort.{ gascoigne2 and q_frau == 1: An den Gräbern hat er einen Atemzug zu lang gebraucht. Jetzt lächelt er, bevor du stehst.| Er lächelt.}
    „{gascoigne_name:{name}|Fremder}.“ Es klingt wie ein Gruß an der Haustür{ q_frau == 1:, mit dem Rollen in der Stimme, das du vom Scheiterhaufen kennst}. „Gut. Gut, dass du kommst. Dann siehst du's auch.“
    // [ERWEITERT] Der Bäckerjunge (Jonas) ist erfunden und liegt im frischen Grab an den Gräbern; Martha, Hennings und der alte Brack stammen aus der Szene am Scheiterhaufen.
    { q_frau == 1:
        Er deutet mit der Axt hinab auf die Dächer, und von der Schneide fällt Tropfen um Tropfen in den Nebel. { mob_verbrannt: „Martha. Die hast du mir abgenommen. Hennings. Der alte Brack. Der Bäckerjunge.“ Er wartet, als müsse er nachzählen. „Alle.|„Martha. Hennings. Der alte Brack. Der Bäckerjunge. Alle.} Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
    - else:
        Er deutet mit der Axt hinab auf die Dächer, und von der Schneide fällt Tropfen um Tropfen in den Nebel. „Alle da unten. Der Bäckerjunge. Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
    }
    Er hebt das Kinn und zieht die Luft ein, einmal, zweimal, wie ein Hund an einer fremden Schwelle. „An dir noch nicht.“ Das Lächeln wird breiter. „Noch nicht, {gascoigne_name:{name}|Fremder}. Ist nur eine Frage der Nächte.“
- else:
    Die Axt bleibt oben stehen. Er hebt den Kopf und nimmt Witterung auf, mit kleinen Rucken, wie ein Jagdhund im Wind, und dreht sich um. Die Augen sind verbunden, der Verband ist schwarz und steif, und das Gesicht darunter ist das eines Mannes, der seit Nächten nicht geschlafen hat. # lore: gascoigne
    „Noch einer“, sagt er. Seine Stimme kommt tief und ruhig, mit einem Rollen darin, das nicht aus diesen Gassen stammt. Er deutet mit der Axt über die Gräber hinab auf die Stadt. „Da unten. Hinter jeder Tür, in jedem Bett, in jeder Kirchenbank. Die tragen ihre Gesichter nur noch wie Mäntel.“ Er zieht die Luft ein und legt den Kopf schief. „Du auch. Nicht heute vielleicht. Aber du auch.“
}
-> p1

= p1
# stimmung: kampf
- (t1)
{ t1 == 1:
    Ohne Hast hebt er die Donnerbüchse. Der trichterförmige Lauf schwenkt über die Steine, findet dich und bleibt ruhig, das Gewicht liegt auf seinem hinteren Fuß, und die Axt hängt locker an seiner Seite. Links von dir steht ein Grabstein, breit genug für zwei.{ parade_quelle == "gascoigne": Diese Haltung kennst du. Auf dem Platz am Scheiterhaufen hat er sie dir vorgemacht, für den Augenblick, in dem eine Bestie ausholt. Jetzt wartet er darauf, dass du ausholst.| Er wartet darauf, dass du dich rührst.} # anzeichen: gascoigne_schuss
- else:
    Er reißt die Donnerbüchse hoch. Der Trichter schwenkt herum und sucht dich, sein Finger liegt schon am Abzug, und links von dir wartet derselbe breite Grabstein. # anzeichen: gascoigne_schuss
}
{ gelernt ? gascoigne_schuss: Unter deinem Brustbein brennen die Körner der letzten Ladung noch einmal auf, und deine Augen gehen von selbst zu dem Stein zur Linken. }
+ [Geradeaus auf ihn zustürmen #fliesst]
    Der Trichter spuckt Feuer, bevor du die zweite Reihe der Gräber erreichst. Die Ladung schlägt dir in die Brust, eine Handvoll glühender Körner, und wirft dich rückwärts über einen Stein.
    ~ zuletzt = gascoigne_schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {parade} [Unter der Ladung weg, dann schießen #fliesst]
    Bis der Trichter Feuer spuckt, hältst du still; dann wirfst du dich flach, und die Ladung pfeift über dich hinweg. Er setzt mit der Axt nach, das ganze Gewicht im Schlag, und in diesen Schlag hinein drückst du ab. { parade_quelle == "gascoigne": Er wankt, genau so, wie er es dir auf dem Platz vorgemacht hat, und für einen Herzschlag zieht sich sein Mund zu etwas zusammen, das Stolz sein könnte. Die Säge ist in ihm, bevor er sich fängt. | Er wankt, und die Säge ist in ihm, bevor er sich fängt. } # notiz: seine_lehre
    -> t2b
+ [Links hinter den Grabstein #fliesst]
    Der Stein nimmt die Ladung für dich. Splitter regnen dir in den Nacken, Bruchstücke eines Namens, den nun niemand mehr lesen wird, und über den Stein hinweg hörst du ihn lachen. „Was zappelt, ist Bestie“, ruft er. „Und was sich hinterm Stein still hält, das hau ich trotzdem. Sicher ist sicher. Sicher ist sicher.“
    -> t2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
- (t2)
Er lässt die Donnerbüchse sinken und kommt in langen Schritten über die Gräber. Die Axt nimmt er tief hinter die Hüfte, die Schneide flach, genau auf der Höhe der Grabsteinköpfe, und zwei Schritte vor dir dreht sich seine Schulter ein. # anzeichen: gascoigne_bogen
{ gelernt ? gascoigne_bogen: Deine Knie geben schon nach, bevor seine Schulter sich eindreht; sie wissen noch, auf welcher Höhe die Schneide kommt. }
+ [Rückwärts zwischen die Gräber weichen #fliesst]
    Er folgt, Schritt für Schritt, und seine Schritte sind länger als deine. Zwischen zwei Steinen holt die Axt dich ein und beißt dir in die Schulter.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
+ [Über die flache Axt springen #fliesst]
    Im Sprung siehst du die Schneide steigen; er hat sie angehoben, eine Handbreit nur. Sie nimmt dir die Beine weg, und das Gras schlägt dir ins Gesicht.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
+ [Unter dem Bogen durch und zuschlagen #fliesst]
    Tief, beinahe auf den Knien: Die Axt pfeift dir über den Scheitel, und dann bist du an ihm, so nah, dass dir der nasse Saum seines Mantels über die Wange streicht. Die Säge findet seine Seite. Er grunzt und sieht an sich hinab, als suche er die Stelle.
    -> t2b
+ {ampulle > 0} [Zurückspringen und die Ampulle stoßen #fliesst]
    Zwei Sätze zurück, die Ampulle schon in der Faust.
    -> ampulle_gefahr(2) -> t2
+ {jaegermarken > 0} [Eine Jägermarke in der Faust zerdrücken #fliesst] -> marke
- (t2b)
// [ERWEITERT] Der Schuss aus nächster Nähe: Er lässt dich herankommen.
Er tritt nicht zurück. Er lässt die Axt in der Rechten sinken, ganz, bis die Schneide im Gras liegt, und dreht dir die linke Schulter zu, als wolle er dich umarmen. Die Donnerbüchse hängt an seiner linken Hüfte, der Trichter zeigt zu Boden. Nur sein Daumen bewegt sich. Er spannt den Hahn, und das Klicken ist das lauteste Geräusch auf dem Friedhof. # anzeichen: donner_nah
{ gelernt ? donner_nah: Beim Klicken brennt dir die Haut im Gesicht, wo vorhin die Glut saß, und deine Füße ziehen nach rechts, dorthin, wo die Axt im Gras liegt. }
+ [Von vorn in die offene Brust #fliesst]
    Die Säge trifft, und im selben Augenblick kommt der Trichter hoch. Der Schuss reißt dich von den Füßen, und als du wieder sehen kannst, liegst du auf dem Rücken, Glut im Gesicht und Erde zwischen den Zähnen.
    ~ zuletzt = donner_nah
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p2
+ [Rechts um ihn herum, hinter ihn #fliesst]
    Um seine Schulter herum, zwei Schritte, drei, und der Schuss fährt dorthin, wo du eben noch standest, zwischen die Gräber. Dein Hieb trifft ihn dicht unter dem Mantelkragen. Er brüllt.
    -> p2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= p2
~ g_phase = 2
Er tritt zurück, und mit einem Ruck der Handgelenke klappt er die Axt aus: Der Stiel fährt heraus, doppelt so lang wie zuvor, und er packt ihn mit beiden Händen. Die Donnerbüchse wirft er weg, achtlos, zwischen die Gräber. Er lacht dabei, tief in der Kehle, und er lacht auch beim Einatmen, nach innen, mit einem Geräusch wie ein Blasebalg mit einem Riss. # phase # stimmung: kampf
Mitten darin hält er inne. Er hebt das Gesicht und zieht die Luft ein, lange, durch die Nase, und das Lachen bricht ab. „Riechst du's? Das Blut.“ Seine Stimme ist ganz weich geworden. „Wie Kandis in der Pfanne, kurz bevor er schwarz wird. Und es summt mir was vor. Ich kenn das Lied. Ich kenn's doch …“ Er krümmt sich über den langen Stiel, eine Hand vor dem Mund, und würgt, und durch die Finger hindurch lacht er weiter.
- (t3)
Er fasst den Stiel ganz am Ende und beginnt sich zu drehen. Die Schneide zieht einen Kreis, weiter, als seine Arme reichen, und wo sie einen Grabstein streift, fliegt der Kopf des Steins davon; nur innen, dicht an seinem Körper, schwingt der Stiel leer durch die Luft. # anzeichen: axt_lang
{ gelernt ? axt_lang: Deine Rippen erinnern sich an die Schneide, die durch den Stein kam, und zum ersten Mal in diesem Kampf ziehen dich deine Füße nach vorn. }
+ [Zurück hinter einen hohen Stein #fliesst]
    Hinter dem Stein ist es einen Atemzug lang ruhig. Dann geht die Axt durch ihn hindurch wie durch Kreide, und durch dich.
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t3b
+ {staerke >= 1} [Die lange Axt vorn abfangen #fliesst]
    Stahl schlägt auf Stahl, mitten in ihrem Kreis, und der Schlag fährt dir bis in die Zähne. Deine Arme halten, schwer und warm von dem, was die Puppe dir gegeben hat. Einen Atemzug lang steht ihr so, Klinge an Klinge, und er neigt den Kopf, als erkenne er an dir etwas wieder. Dann reißt er sich los. # notiz: staerke_genutzt
    -> t3b
+ [Vorwärts, ganz nah an ihn heran #fliesst]
    In den Kreis hinein, gegen alles, was deine Beine wollen, bis du seinen Atem riechst, Eisen und angebrannten Zucker. So nah trifft die lange Klinge nicht. So nah triffst du.
    -> t3b
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
+ {ampulle > 0} [Rückwärts gehen und die Ampulle stoßen #fliesst]
    Rückwärts, Schritt um Schritt, die Ampulle schon in der Hand, und der Kreis der Axt wandert mit dir.
    -> ampulle_gefahr(2) -> t3
- (t3b)
// [ERWEITERT] Der Hieb von oben: Er stemmt die lange Axt in die Höhe und zählt stumm bis drei.
Er stößt dich mit dem Stiel von sich, nicht fest, nur weit genug, und hebt die lange Axt über den Kopf, beide Hände am Ende des Stiels, und hält sie dort, und hoch über ihm zittert die Schneide vor dem roten Himmel. Er lacht nicht mehr. Wohin du auch trittst, sein Kopf wandert mit dir, gleichmäßig und genau. # anzeichen: axt_wirbel
Stumm zählen seine Lippen. Eins.
{ gelernt ? axt_wirbel: Die Stelle, an der dich diese Axt zuletzt gefunden hat, beginnt zu pochen, und sie pocht in seinem Takt. }
+ [Sofort nach hinten weglaufen #fliesst]
    Bei eins hast du ihm schon den Rücken zugedreht. Sein Kopf folgt dir, und die Schneide folgt seinem Kopf; sie trifft dich zwischen die Schulterblätter.
    ~ zuletzt = axt_wirbel
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
+ [Bis drei warten, dann nach links #fliesst]
    Zwei. Seine Lippen formen die Drei, und erst jetzt wirfst du dich nach links. Die Axt fährt in den Grabstein neben dir und bleibt darin stecken, und während er am Stiel zerrt, schlägst du ihm in die Kniekehle, bis er auf ein Knie sinkt.
    -> p3
+ [Vorn hinein, solange die Arme oben sind #fliesst]
    Unter den erhobenen Armen ist er offen, und die Säge geht tief. Er zählt nicht weiter. Er lässt einfach los, und der Stiel kracht dir auf den Schädel.
    ~ zuletzt = axt_wirbel
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p3
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= uhr
~ spieluhr_mal = spieluhr_mal + 1
{ spieluhr_mal:
- 1: Die Feder knirscht unter deinem Daumen, eine Umdrehung, zwei, und das Lied steigt über die Gräber, ein Kinderlied an einem Ort, an dem keine Kinder sind. Gascoigne erstarrt mitten in der Bewegung. In der dritten Zeile, wo dem Kamm ein Zahn fehlt, fällt ein Ton aus, und in diese Lücke hinein lässt er die Axt sinken und presst die Hände an den Kopf, um darin festzuhalten, was ihm entgleitet. Aus seiner Kehle kommt der Laut eines Mannes, der im Schlaf etwas Schweres hebt. # klang: spieluhr # lore: spieluhr
- 2: Noch einmal die Feder, noch einmal das Lied, und zwischen den Steinen klingt es jetzt blechern; die Mauer gibt es einen halben Takt zu spät zurück, so dass zwei Lieder über die Gräber laufen und eines davon falsch. Er dreht den Kopf, suchend, nach links, nach rechts. „Viola?“, sagt er. „Viola, wo …“ Er findet sie nicht, und die Hände an seinem Kopf zittern. # klang: spieluhr
- else: Beim dritten Aufziehen hakt die Feder, ehe sie das Lied freigibt, und es kommt nicht mehr bis zur Lücke. Er krümmt sich darunter wie unter einem Schlag und schreit, und der Schrei geht über in ein Brüllen, das aus einem größeren Brustkorb kommt, als er ihn hat. # klang: spieluhr # notiz: spieluhr_dritte # stimmung: grauen
    -> p3
}
+ [Von vorn zuschlagen, solange er zuhört #fliesst]
    ~ im_lied_getroffen = true
    Er wehrt sich nicht. Gekrümmt steht er da, die Hände am Kopf, und nimmt den Hieb, ohne die Arme zu senken, weil die Hände an seinem Kopf wichtiger sind. Das Lied spielt weiter, bis die Feder abgelaufen ist.
    -> weiter_nach_lied
+ {ampulle > 0} [Hinter einem Stein die Ampulle stoßen #fliesst]
    Hinter dem nächsten Stein gehst du in die Knie. Er hört nur das Lied, und du hast Zeit.
    -> ampulle_ruhig -> weiter_nach_lied
+ [Einen Schritt zurück, das Lied abwarten #fliesst]
    Note um Note läuft das Lied aus, und mit der letzten lässt er die Hände sinken und greift wieder nach der Axt, zögernder als vorher, wie ein Mann, der aus dem Schlaf hochfährt und nicht weiß, wo er ist.
    -> weiter_nach_lied
+ [Ihn leise beim Namen rufen #fliesst]
    { moment_moeglich and not gascoigne_moment: -> moment }
    Bei deiner Stimme hebt sich sein Kopf, und einen halben Atemzug lang sucht etwas in seinem Gesicht nach dir. „Henryk?“, sagt er. Es ist fort, so schnell, wie ein Docht ausgeht, und die Axt ist wieder oben. # notiz: halber_moment
    -> weiter_nach_lied

= weiter_nach_lied
{ g_phase == 2:
    -> t3
- else:
    -> t2
}

= moment
// Die bessere Entscheidung, die das Blutgedächtnis möglich macht. Der Text zeigt nur das Echo der kippenden Stimme; er erklärt nicht, warum es hilft.
~ gascoigne_moment = true
Das Lied läuft wieder auf die Lücke zu. Seine Lippen gehen mit, Ton um Ton, und kurz davor kippt ihm die Stimme, mitten im Summen, an derselben Stelle, an der auf der Brücke einem anderen das Lied gekippt ist. In die Lücke, wo der Ton fehlt, sagst du seinen Namen, leise, so wie er im Deckel steht. # gedaechtnis: gascoigne_klarheit # stimmung: schoen
Gascoigne hebt den Kopf. Für einen Atemzug, einen einzigen, ist er da. Er steht gerade, die Axt hängt ihm locker in der Hand wie ein Werkzeug nach Feierabend, und er neigt den Kopf zur Seite.
„Viola“, sagt er. Nicht zu dir.
Seine alte Stimme kommt zurück, die warme, tiefe, aber in Stücken: „Ich weiß. Was ich bin. Lang schon.“ Er atmet. „Mach's. Bevor ich wieder geh.“ Er atmet noch einmal, und es klingt schon nicht mehr ganz nach ihm. „So.“
* [Ihm versprechen, nach der Kleinen zu sehen #fliesst]
    ~ versprechen_gascoigne = true
    Noch bevor du ausgesprochen hast, nickt er, und unter dem Verband laufen Tränen hervor, und er lässt sie laufen. „Sag ihr …“ Er sucht. „Das Lied. Sag ihr, das Lied weiß ich noch. Nur alles andere nicht.“
* [Ihn nach Viola fragen #fliesst]
    Bei ihrem Namen öffnet sich sein Mund und schließt sich wieder. „Weiß nicht“, sagt er. „Weiß es nicht mehr.“ Seine Hände suchen an seinem Mantel nach einer Tasche, einem Knopf, und finden nichts. # notiz: viola_frage
* [Schweigend die Säge heben #fliesst]
    Die Säge steht zwischen euch, und er versteht. Er breitet die Arme aus, nur ein wenig, die Handflächen nach vorn, so wie am Ende einer Andacht die Gemeinde entlassen wird.
- Dann kippt er.
-> p3

= p3
~ g_phase = 3
Zuerst sind es die Hände. Er hält sie vor sich, die Finger gespreizt, und senkt den verbundenen Kopf über sie, wie einer, der vor dem Essen nachsieht, ob sie sauber sind. Sie werden länger, Glied um Glied, und jedes Glied knackt, bevor es nachgibt. Aus den Fingerkuppen schieben sich Nägel, schwarz und dick, und die Haut darüber reißt nicht; sie weicht nur zurück. # phase # stimmung: grauen
An den Schultern platzen die Nähte seines Mantels, eine nach der anderen, mit kleinen trockenen Lauten, und durch die Risse drängt Haar, grob und schwarz wie die Borsten eines Ebers. Sein Rücken krümmt sich unter dem, was da wächst, und richtet sich nicht wieder ganz auf. Gebückt, wie er jetzt steht, reicht sein Schatten über drei Gräber, und er fällt noch immer der Sonne entgegen.
Er will noch etwas sagen. {gascoigne_name:Die erste Silbe ist noch dein Name|Es fängt an wie „Fremder“}, die zweite gehört schon dem Kiefer, der sich dabei nach vorn schiebt, Zahn um Zahn, bis der Mund nicht mehr in das Gesicht passt, aus dem er spricht. Der Verband reißt über der Nasenwurzel. Was darunter ist, hältst du keinen Atemzug lang aus, und dein Blick flieht von selbst nach unten, zu seinem Hals.
Dort sitzt der Schal, wie er immer saß, ordentlich geknotet, an einem Hals, der zu dick für ihn geworden ist.
Der Knoten hält.
- (t4)
Mit einem Satz ist er rechts von dir auf einem Grabstein und kauert dort, Hände und Füße dicht beisammen auf dem schmalen Kopf des Steins, und unter dem Haar ziehen sich die Hinterläufe zusammen. Sein Kopf zielt auf die Stelle, an der du jetzt stehst, und bleibt dort, auch als du das Gewicht verlagerst. Er springt von rechts, über drei Gräber hinweg, die Klauen voran, und sein Heulen klettert an den Grabsteinen hoch und kommt oben von der Mauer zurück. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Deine linke Schulter senkt sich schon, ehe er abspringt; die rechte erinnert sich an seine Klauen. }
// [ERWEITERT] Einsicht kostet: Wer zu viel sieht, sieht auch den falschen Schatten (angekündigt bei der Ankunft). Der Schatten springt nach links; wer ihm nach rechts ausweicht, läuft der Bestie entgegen. Der richtige Weg bleibt links, für alle.
{ einsicht >= 3: Sein Schatten springt ihm voraus über die Gräber, und er springt nach links. Er selbst ist noch in der Luft. }
+ {feuer} [Gilberts Flamme hoch in den Sprung halten #fliesst]
    Mitten im Sprung fährt ihm Gilberts Flamme entgegen, und das Haar auf seiner Brust fängt Feuer. Er heult und wälzt sich zwischen den Gräbern, und es riecht nach versengtem Haar und nach Fett.
    -> t4b
+ {molotow > 0} [Die Brandflasche hoch gegen ihn werfen #fliesst]
    ~ molotow = molotow - 1
    Das Glas zerspringt an seiner Brust, und das Feuer läuft ihm über das Haar wie Wasser über einen Stein.
    -> t4b
+ {einsicht >= 3} [Vor dem Schatten nach rechts weichen #fliesst]
    Der Schatten lügt. Er landet genau dort, wo du aufkommst, mit beiden Klauen voran.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ [{einsicht >= 3:Nach links, dem Schatten nach|Nach links aus seiner Bahn} #fliesst]
    Er schlägt hinter dir auf, so schwer, dass ein Grabstein aus der Erde springt und dir gegen die Fersen rollt.
    -> t4b
+ [Den Sprung von vorn abfangen #fliesst]
    Säge gegen Klauen, und die Klauen sind schwerer. Er reißt dich um wie ein Fuhrwerk einen Zaunpfahl, und die Erde des Grabes unter dir ist kalt.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
+ {ampulle > 0} [Zurückspringen und die Ampulle stoßen #fliesst]
    Rückwärts über ein Grab, die Ampulle schon zwischen den Fingern.
    -> ampulle_gefahr(2) -> t4
- (t4b)
// [ERWEITERT] Kreis und Stille in einem Takt (Festlegung G9): Er umkreist dich heulend; wenn das Heulen aussetzt, springt er von dort, wo die Stille anfing.
Er greift nicht gleich wieder an. Auf allen vieren läuft er im Kreis um dich herum über die Gräber, und wo seine Klauen aufsetzen, reißt die Erde in Furchen auf. Dabei heult er ohne Pause, ein langer Ton, den die Mauer zurückgibt, so dass er von zwei Seiten zugleich kommt: links, dann hinten, dann rechts, dann wieder hinten. # anzeichen: bestie_kreis
Hinter dir, mitten im Kreis, setzt das Heulen aus.
{ gelernt ? bestie_kreis: In deinem Nacken stellen sich die Haare auf, genau dort, wo das Heulen aufgehört hat. }
// [ERWEITERT] Einsicht kostet: Wer zu viel hört, hört das Heulen weiter, auch als es schon aufgehört hat.
{ einsicht >= 3: In deinem Kopf aber hört es nicht auf. Es läuft weiter, rund um dich, und jetzt kommt es von vorn. }
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn auch in Bestienform stocken. Einmal je Anlauf.
+ {spieluhr and not uhr_bestie} [Mit der Spieluhr nach hinten herumfahren #fliesst]
    ~ uhr_bestie = true
    ~ im_lied_getroffen = true
    Die Feder ist schon gespannt, als du herumkommst, und das Lied fällt in die Stille wie ein Stein in einen Brunnen. Er bleibt stehen, mitten im Ansatz zum Sprung, und senkt den Kopf zur Melodie, tief, bis die Schnauze das Gras berührt. An der Stelle, wo der Ton fehlt, winselt er, hoch und dünn, genau einen Ton lang. Er rührt sich nicht, als du zuschlägst. # klang: spieluhr # stimmung: grauen
    -> t5
+ {einsicht >= 3} [Vor dem Heulen nach hinten weichen #fliesst]
    Von vorn kommt nichts. Von hinten kommt er, und du läufst ihm rückwärts in die Klauen.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Nach vorn davonlaufen #fliesst]
    Drei Schritte, vier, und sein Gewicht landet dir im Rücken und drückt dich mit dem Gesicht in die Graberde.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ [Nach hinten herumfahren, unter ihn #fliesst]
    Er ist schon in der Luft, als du herumkommst, ein Leib, der den halben Himmel deckt. Tief in die Knie, die Säge hoch, und er reißt sich selbst den Bauch daran auf.
    -> t5
+ [Stehen bleiben, nach hinten horchen #fliesst]
    Der Friedhof gibt keinen Laut. Ein Atemzug, zwei; dann trifft dich seine Schulter von hinten, und du fliegst gegen einen Stein.
    ~ zuletzt = bestie_kreis
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t5
+ {ampulle > 0} [Rechts hinter einen Stein, die Ampulle #fliesst]
    Der Stein zur Rechten ist breit genug für deine Schultern und für nichts sonst; die Ampulle hast du schon in der Faust.
    -> ampulle_gefahr(2) -> t4b
- (t5)
Er packt dich. Beide Klauen schließen sich um deine Schultern, und er hebt dich hoch, bis sein Gesicht vor deinem ist und dir sein Atem entgegenschlägt, Blut und Eisen und nasses Fell. Der Schal an seinem Hals schwingt dicht vor deinen Augen, noch immer geknotet, und aus dem schmutzigen Stoff steigt, ganz schwach, ein herber, harziger Geruch, der nicht hierher gehört: Weihrauch. Die Klauen haben sich in deinen Mantel gekrallt, nicht in dich, und das Leder knarrt an den Nähten. # anzeichen: griff
{ gelernt ? griff: Deine Schultern erinnern sich, wie das Leder an den Nähten nachgab, und werden schwer, von selbst. }
{ grund == "suche": Weihrauch, wie an deinem letzten Brief. }
+ [Von vorn in seinen Griff stechen #fliesst]
    Seine Klauen graben sich in dein Fleisch und deine Säge in seines, und einen langen Moment haltet ihr einander fest wie zwei Tänzer, die nicht loslassen können. Dann gibt er nach.
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ {staerke >= 2} [Seine Klauen nach beiden Seiten aufbrechen #fliesst]
    Finger um Finger biegst du sie auf, mit einer Kraft, die nicht ganz deine ist. Er heult auf, hoch und kurz, und dann bist du frei, und seine Brust ist offen. # notiz: staerke_genutzt
    -> sieg
+ [Nach unten aus seinem Griff fallen #fliesst]
    Schwer wie ein Sack Korn rutschst du nach unten weg, und seine Klauen schließen sich um Leder und Luft. Über den Boden, hoch, und während er sich umdreht, liegt seine Brust offen. Die Säge geht hinein, so tief sie geht, und du lässt nicht los.
    -> sieg
+ {jaegermarken > 0} [Eine Jägermarke in der Faust zerdrücken #fliesst] -> marke

= marke
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Wer die Marke zerdrückt, verliert alle Blutechos; sie bleiben nicht als Fleck liegen (Festlegung G3). Eine gemeinsame Stelle in system.ink wäre besser (Faktencheck system.ink Nr. 2); bis dahin hier und in n1_kleriker.ink.
~ jaegermarken = jaegermarken - 1
~ marke_benutzt = true
Die Marke bricht in deiner Faust, und {g_phase < 3:der Friedhof und sein lachender Mund|der Friedhof und das Heulen} zerfallen, wie Asche zerfällt, wenn man hineinbläst. # klang: marke
{ echos > 0: Was an fremdem Blut in dir gesummt hat, seit du in dieser Stadt tötest, bleibt auf dem Friedhof zurück, und nichts wird zeigen, wo. }
~ echos = 0
~ marke_eben = true
-> traum_von_laterne

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
~ echos = echos + 10
# stimmung: ruhig
{ gascoigne_moment:
    Er sinkt zwischen den Gräbern zusammen, und als er stirbt, weicht das Haar ein Stück zurück, bis an den Hals, und das Gesicht darunter ist beinahe wieder seines. Seine Lippen bewegen sich. Es sind die ersten Töne des Liedes, und an der Stelle, wo der Ton fehlt, hören sie auf. # notiz: gascoigne_ende_mensch
- else:
    Er fällt zwischen die Gräber und rührt sich nicht mehr. Der Schal sitzt noch, geknotet, und eine Hand liegt offen auf der Erde, halb Klaue, halb Hand; an einem der Finger steckt ein schmaler Ring, so tief eingewachsen, dass das Fleisch darüber zusammengeschlagen ist. # notiz: gascoigne_ende_bestie
}
Was aus ihm aufsteigt, geht in dich über, warm, und du findest nichts in dir, das es aufhalten könnte. Eine Weile wartest du, dass etwas geschieht. Es geschieht nichts. Er ist tot. Er bleibt tot. Er wacht nicht zwischen weißen Blumen auf.
Deine Hand liegt an deiner Armbeuge, dort, wo der Einstich pocht, und sie bleibt lange dort.
Hinter der Mauer, oben im Bezirk der Kathedrale, singen sie wieder, gemessen und rein.{ gedaechtnis_kleriker: Mitten in der dritten Zeile reißt der Gesang ab, an einer Stelle, die du kennst, und niemand singt sie zu Ende.| Mitten in einer Zeile reißt der Gesang ab, und niemand singt sie zu Ende.} # klang: choral
Auf dem Grabstein liegt noch sein Hut, die Krempe nach oben, und es regnet hinein.
-> k1_d_grab
