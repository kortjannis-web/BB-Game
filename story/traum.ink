// DER JÄGERTRAUM: Hub zwischen den Jagden. Gehrman, die Puppe, die Boten.
// [KANON lore:orte/jaegertraum] Traum als Zuflucht, Rückkehr über Laternen und Grabsteine, das Blatt beim Altar (Notiz Nr. 3), Puppe erwacht mit Einsicht, Gehrman bietet alles hier an, auch die Puppe.
// [DEUTUNG] Dass der Vertrag an den Traum bindet und Gehrman selbst gefangen ist: nur gezeigt (Tinte, Nadelstich, daheim, seine Hände, die Frage nach dem Hellwerden), nie gesagt.
// Stimmen: Gehrman müde und warm, mit Pausen, ganz anders als der glatte Mann in der Klinik. Die Puppe förmlich, sanft, fragt nach der Welt draußen.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck: Garten, Werkstatt und Fundstücke in A, Gespräche in B, der Brief der Kirche in C. Optionen fließen in den Satz (#fliesst).

// --- Merker des Traums (nur hier gesetzt) -----------------------------------------
VAR altar_blatt = false          // das Blatt am Altar in der Werkstatt gesehen (Ziel der Nacht)
VAR blatt_erinnert = false       // beim Erwachen an das Blatt gedacht (zweite Stelle von ende_der_nacht)
VAR gehrman_bestien = false      // Gehrman nach den Bestien gefragt (seine Hände an den Lehnen)
VAR gehrman_wann = false         // gefragt, wann die Nacht vorbei ist (er antwortet nicht)
VAR gehrman_versprochen = false  // Gehrman hat von seinem Versprechen an einen Freund gesprochen
VAR puppe_daheim = false         // die Puppe hat den Traum beim Erwachen daheim genannt
VAR brief_gezeigt = false        // ein Bote hat für das Abzeichen den Brief mit Kirchensiegel hervorgeholt

=== traum_von_laterne ===
// TITEL: Laterne: in den Traum
~ leben = LEBEN_MAX
{ marke_eben:
    ~ marke_eben = false
    Weiße Blumen unter deinen Knien, und der Garten liegt so still, als sei draußen nie etwas gewesen. Deine Faust ist noch geschlossen. Als du sie öffnest, liegt nichts darin als ein wenig Staub aus Messing. # bild: traum # stimmung: ruhig
- else:
    Unter deiner Hand wird das Glas der Laterne warm, und die Stadt verblasst um dich her wie ein Bild, auf das man zu lange gestarrt hat, bis nur der Duft der weißen Blumen bleibt. # bild: traum # stimmung: ruhig
}
-> traum_hub

=== traum_erwachen ===
// TITEL: Erwachen nach dem Tod
// tode zählt den unausweichlichen ersten Tod in der Klinik mit (k1_erwachen setzt 1).
# bild: traum # stimmung: ruhig
{ tode:
- 2:
    Weiße Blumen, dicht vor deinem Gesicht, jede so genau, dass du die feinen Adern in den Blättern zählen könntest. Es dauert lange, bis du begreifst, dass du nicht träumst. Du warst tot; dein Körper weiß es, so wie er einen Sturz noch kennt, wenn der Boden längst stillhält. In der Armbeuge sitzt ein frischer Einstich mit einem roten Hof darum, und im Mund schmeckst du Eisen. # lore: jaegertraum
    { gehrman:
        // [ERWEITERT] Im Kanon sitzt Gehrman im ersten Teil des Spiels in der Werkstatt, nicht am Weg im Garten.
        Am Weg sitzt Gehrman in seinem Rollstuhl und nickt dir zu, ohne Überraschung, wie man jemandem zunickt, der vom Brunnen zurückkommt.
    - else:
        // [ERWEITERT] Gehrman im Garten und seine Regel (nicht sterben, nur aufwachen): im Kanon nicht an dieser Stelle; für Neulinge behalten.
        ~ gehrman_gesehen = true
        Am Weg steht ein Rollstuhl, und darin sitzt ein alter Mann unter einem breitkrempigen Hut, eine Decke über den Knien, und sieht dir ohne Überraschung beim Aufstehen zu. „Sterben“, sagt er, und macht eine Pause, als suche er ein freundlicheres Wort. „Sterben kannst du hier nicht. Nur aufwachen. Man gewöhnt sich daran.“ Er zieht die Decke zurecht. „Mehr oder weniger.“ # lore: gehrman
    }
- 3:
    Wieder die Blumen, wieder das Erwachen. Diesmal zittern deine Hände nicht einmal mehr, und du siehst lange auf sie hinunter. Die braune Tinte an deinen Fingerkuppen ist noch da. Du bist gestorben, und sie ist noch da.
    { puppe_wach:
        ~ puppe_daheim = true
        Die Puppe kniet neben dir im Gras und hält deine Hand. Ihre Finger sind kühl und vollkommen glatt, ohne Linien, ohne Nägel. „Hier geschieht dir nichts“, sagt sie leise. „Hier bist du …“ Sie sucht nach dem Wort und findet es nicht gleich. „Daheim.“ Dir wird eng unter dem Brustbein.
    }
- else:
    {~Die Blumen kennen dich inzwischen. Du stehst auf, klopfst dir die Blütenblätter vom Mantel und versuchst, nicht daran zu denken, wie oft du das schon getan hast.|Das Erste nach dem Erwachen ist das Zählen. Wie oft, weißt du längst nicht mehr, und du zählst trotzdem, weil das Zählen die Hände ruhig macht.|Über dir liegt der Himmel des Traumes, unverändert und gleichgültig, von der Farbe alten Elfenbeins. Du stehst auf. Natürlich stehst du auf.}
    { gehrman: {~Gehrman sieht dich kommen und sagt nichts. Seine Finger trommeln einmal auf die Lehne.|„Wieder da“, sagt Gehrman, so wie man feststellt, dass es regnet.|Gehrman hebt die Hand, als wolle er etwas sagen, und lässt sie wieder sinken.} }
}
// Zweite Stelle des Blattes am Altar: Es kommt beim nächsten Erwachen zurück.
{ altar_blatt and not blatt_erinnert:
    ~ blatt_erinnert = true
    Zwischen den Blumen fällt dir das Blatt vom Altar wieder ein, die Buchstaben, die nach rechts kippten. Bleibt die Quelle offen, bleibt die Nacht. Wo eine Seuche ihre Quelle hat, weißt du nicht, und wann diese Nacht begonnen hat, weißt du auch nicht mehr. # lore: ende_der_nacht
}
{ neu_gelernt: Im Halbschlaf, zwischen dem Tod und dem Erwachen, hast du es noch einmal gesehen: das, was dich getötet hat, die Bewegung davor, das winzige Zeichen. Jetzt sitzt es dir hinter den Augen, scharf umrissen, wie mit einer Nadel nachgezogen. # notiz: gelernt }
-> traum_hub

=== traum_hub ===
// TITEL: Jägertraum
~ ort = "traum"
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
{~Still liegt der Garten unter seinem Himmel aus altem Elfenbein, und zwischen den Grabsteinen, deren Inschriften niemand mehr lesen kann, wühlen die Boten in der Erde, als suchten sie dort, was ihnen einmal gehört hat.|Durch die weißen Blumen geht ein Wind, den du auf der Haut nicht spürst, und legt sie alle in dieselbe Richtung, und oben auf dem Hügel brennt im Haus das Licht, das dort immer brennt.|Irgendwo jenseits der Grabsteine läutet eine Glocke, ein einziges Mal und so leise, dass du hinterher nicht sagen könntest, ob sie im Garten geläutet hat oder in dir.}
{ einsicht >= 2: {Auf den Grabsteinen am Rand des Gartens sitzt etwas. Es geht nicht mehr weg, wenn du blinzelst.|Die Dinge auf den Grabsteinen sind noch da.|} }
{ ampulle == 0: An deinem Gürtel hängt die Ampulle wieder, voll und warm, und niemand hat sie gefüllt. }
~ ampulle = 1
- (wahl)
+ {puppe_wach} [Zur Puppe an die Treppe gehen #fliesst]
    {~Du gehst zur Puppe an die Treppe, und sie hebt den Kopf, bevor du sie erreichst.|Du trittst zu ihr an die Treppe. Sie hat dich kommen sehen und die Hände vor dem Kleid gefaltet.|Du gehst zu ihr hinüber, und sie wendet dir das Gesicht zu, mit dem leisen Knirschen in der Halsfuge.}
    -> puppe_gespraech -> wahl
+ {k1_laterne_zentral} [Den Pfad zur Werkstatt hinaufgehen #fliesst]
    { gehrman == 0:
        Du steigst den Pfad zwischen den Grabsteinen hinauf zum Haus, und diesmal gibt die Tür unter deiner Hand nach, als hätte drinnen jemand den Riegel zurückgezogen.
    - else:
        Du steigst den Pfad zwischen den Grabsteinen hinauf zur Werkstatt.
    }
    -> gehrman -> wahl
+ {not k1_laterne_zentral} [Den Pfad zum Haus hinaufgehen #fliesst]
    Du steigst den Pfad zwischen den Grabsteinen hinauf, aber die Tür des Hauses ist verschlossen. Durch das Fenster siehst du einen Kamin, in dem ein Feuer brennt, das niemand angezündet hat.
    -> wahl
+ {puppe_wach and staerke < 2} [Der Puppe {staerke == 0:fünf|acht} Echos bringen #fliesst]
    Du trittst dicht vor die Puppe hin, so nah, dass du das Holz unter ihrem Lack riechst.
    -> puppe_staerken -> wahl
+ [Zum Bad der Boten am Weg #fliesst]
    Du gehst den Weg hinunter zu dem steinernen Becken, in dem die Boten hocken.
    -> boten_laden -> wahl
+ [Zurück zur Laterne, an der du warst #fliesst]
    Du legst die Hand auf den Grabstein ohne Namen und denkst an die Laterne, an der du zuletzt warst, und die Stadt kehrt zurück, der Geruch zuerst, dann die Geräusche, zuletzt die Kälte.
    -> laterne
+ {k1_laterne_zentral and laterne != -> k1_hub_b} [Zur Laterne vor der Klinik #fliesst]
    ~ laterne = -> k1_hub_b
    Du legst die Hand auf den Grabstein und denkst an die Laterne vor der Klinik, und Zentral-Yharnam kehrt zurück, das Räucherwerk zuerst, dann die Glocken.
    -> k1_hub_b
+ {bruecke_laterne and laterne != -> k1_hub_c} [Zur Laterne an der Brücke #fliesst]
    ~ laterne = -> k1_hub_c
    Du legst die Hand auf den Grabstein und denkst an die Laterne an der Brücke, und die Brücke kehrt zurück, der Wind zuerst, dann das Rauschen der Unterstadt.
    -> k1_hub_c

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON lore:figuren/puppe] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht: Sie soll den Jäger behüten und verwandelt, was aus den Bestien aufsteigt, in Stärke. Inhalt sinngemäß, Wortlaut eigen.
~ puppe_wach = true
Am Fuß der Treppe steht die Puppe, wie sie immer stand, die Hände vor dem Kleid gefaltet. Als du an ihr vorbeigehst, hebt sich ein Lid. Dann wendet sich der Kopf, mit einem leisen Knirschen in der Halsfuge, und die gemalten Augen bleiben auf dir liegen, und diesmal sehen sie dich. # gedaechtnis: puppe_erwacht # stimmung: schoen
„Oh“, sagt sie. „Du siehst mich.“ Ihre Stimme ist sanft und klar, und zwischen den Sätzen atmet sie nicht. „Man hat mich in diesen Garten gestellt, damit ich auf dich achtgebe. Ich habe sehr lange gewartet, dass jemand kommt, auf den man achtgeben kann.“ Sie neigt den Kopf und hält ihn so, wartend. „Bring mir, was aus ihnen aufsteigt, wenn sie fallen. Ich mache dir etwas daraus, das bleibt.“ Diese Stimme hast du schon einmal gehört, ganz nah an deinem Ohr, und du weißt nicht mehr, wo. # lore: puppe
Hinter ihr, vielleicht nur eine Täuschung des Lichts, sitzen Dinge auf den Grabsteinen, die vorher nicht da waren. Dann sind sie fort.
->->

=== puppe_gespraech ===
// TITEL: Gespräch mit der Puppe
// [KANON lore:figuren/puppe] Die Kleinen (Boten) finden Jäger und dienen ihnen; die Gräber stehen für unzählige frühere Jäger, alles scheint lange her; Gehrman war vor langer Zeit selbst Jäger und gibt nur noch Rat. [ERWEITERT] Ihre Fragen nach der Stadt, ihr Zählen.
{ stopping:
- Die Puppe sieht zu den Boten hinüber, die zwischen den Blumen wühlen. „Die Kleinen“, sagt sie, und es klingt zärtlich. „Sie haben dich zuerst gesehen, lange vor mir. Sie graben nach Leuten wie dir, so wie andere nach Wurzeln graben. Dich haben sie ausgegraben.“ Sie legt den Kopf schief. „Du hast sie schon gekannt, nicht wahr? Von vorher?“ # lore: boten
- -> frage
- Die Puppe sieht an dir vorbei zu den Grabsteinen, die schief im Gras stehen, so viele, dass du sie nicht zählen magst. „Für jeden dieser Steine ist einmal einer gekommen wie du“, sagt sie. „Er stand hier, wo du stehst, und hat mit mir gesprochen.“ Ihre Hände bleiben gefaltet. „Es ist alles so lange her, dass ich die Gesichter verwechsle. Verzeih. Deines will ich mir merken.“ # lore: jaegertraum
    { gehrman_gesehen or gehrman:
        Sie wendet den Kopf zum Haus auf dem Hügel. „Auch Gehrman war einmal einer von ihnen, vor sehr langer Zeit. Jetzt gibt er nur noch Rat, und hinaus geht er nicht mehr.“
    }
- { tode >= 3:
        „Ich habe gezählt, wie oft du zurückgekehrt bist“, sagt sie. „Ich weiß nicht, warum ich zähle. Aber bei jeder Zahl wird mir die nächste schwerer.“ Ihre Finger liegen still auf dem Kleid, und sie sieht nicht auf.
    - else:
        Sie fragt, wie die Jagd ist, und hört zu, als wäre jedes Wort neu für sie. Als du fertig bist, wiederholt sie eines davon, leise, um es sich zu merken: {k1_b_maedchen:Brunnenplatz|Räucherlampe}.
    }
}
->->

= frage
„Darf ich dich etwas fragen? Wie riecht es draußen? Ich habe nur Blumen.“
* [„Nach Rauch. Nach Blut.“ #fliesst]
    „Nach Rauch“, sagst du. „Nach Blut und nassem Stein.“ Sie hört zu, ohne das Gesicht zu verziehen. „Rauch“, wiederholt sie. „Und Blut. Danke. Ich wollte wissen, wie es ist, nicht, wie es sein sollte.“
* [Ihr vom Räucherwerk erzählen #fliesst]
    Du erzählst ihr vom Räucherwerk in den roten Lampen vor den Fenstern, süß und schwer. Sie schließt die Augen, als könne sie es so riechen. „Süß“, sagt sie. „Dann ist es draußen nicht nur schlimm.“
- ->->

=== puppe_staerken ===
// TITEL: Die Puppe stärkt dich
// [KANON lore:figuren/puppe] Die Puppe verwandelt Blutechos in Stärke; man soll nahe stehen und die Augen schließen. [ERWEITERT] Hier erzählt statt in Zahlen: jede Stärkung öffnet in bestimmten Kämpfen eine Möglichkeit.
~ temp preis = 5
{ staerke == 1:
    ~ preis = 8
}
{ echos < preis:
    Sie sieht dich an und schüttelt sanft den Kopf. „Es ist noch zu wenig“, sagt sie. „Bring mir mehr von dem, was aus ihnen aufsteigt, wenn sie fallen. Ich warte.“
    ->->
}
~ echos = echos - preis
~ staerke = staerke + 1
„Schließ die Augen“, sagt sie. Ihre Hand liegt dir kühl auf der Brust. Ein Schimmer löst sich aus deiner Haut und fließt in ihre Finger, und was zurückkommt, ist schwerer und wärmer und sinkt dir in die Arme, wie Blei in eine Form sinkt und darin erkaltet. # klang: echos # notiz: staerke
{ staerke == 1: Als du die Augen öffnest, sind deine Hände ruhiger als seit Wochen. Du könntest etwas Schweres halten, das sich nicht halten lassen will. }
{ staerke == 2: Diesmal bleibt die Wärme in deinen Schultern. Du denkst an Klauen, die sich um dich schließen, und daran, dass man sie aufbrechen könnte. }
„Mehr kann ich nicht für dich tun“, sagt sie. „Noch nicht.“
->->

=== gehrman ===
// TITEL: Gehrman
// [KANON lore:figuren/gehrman] Früher Dialog (LK §18.1): einst Zuflucht und Werkstatt, in der Jäger Blut für ihre Waffen und ihr eigenes Fleisch nahmen; weniger Werkzeug als früher; alles darf man benutzen, geflüstert auch die Puppe; nicht zu viel nachdenken, jagen, man gewöhnt sich. Einst selbst Jäger. Dass er der erste war, ist in Kapitel 1 gesperrt (G4).
// [KANON lore:orte/jaegertraum] Das Blatt beim Altar im hinteren Teil des Hauses (Notiz Nr. 3): Ziel der Nacht. Wortlaut eigen.
// [ERWEITERT] Gesprächsthemen als Lore-Quelle; der Vertrag und das Verlassen des Traums. Schlafreden nur als Laut und Frage, ohne die Gefangenschaft auszusprechen.
{
- gehrman == 1 and gehrman_gesehen:
    In der Werkstatt riecht es nach Lampenöl, nach Leder und nach Papier, das zu lange in der Nähe eines Feuers gelegen hat. Am Kamin sitzt der alte Mann vom Weg in seinem Rollstuhl, die Decke über den Knien, als hätte er sich seit dem Garten nicht gerührt. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Du schon wieder.“ Es klingt nicht unfreundlich. „Gehrman. Ich hätte mich draußen vorstellen sollen, aber wer gerade aufwacht, will keine Namen hören.“ Seine Hand beschreibt einen kleinen Bogen, der die ganze Werkstatt umfasst. „Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- gehrman == 1:
    In der Werkstatt riecht es nach Lampenöl, nach Leder und nach Papier, das zu lange in der Nähe eines Feuers gelegen hat. An den Wänden hängen Werkzeuge und Pläne, auf den Borden stehen Flaschen und Tontöpfe, und in einem der Töpfe kauert eine kleine Gestalt aus Knochen, die jemand mit großer Geduld zusammengesetzt hat. Vor dem Kamin steht ein Rollstuhl, und darin sitzt ein alter Mann mit grauem Haar unter einem breitkrempigen Hut, eine Decke über den Knien. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Da kommt jemand.“ Seine Stimme ist warm und müde und macht Pausen, wo man keine erwartet. „Setz dich, wenn du magst. Oder bleib stehen, das tun die meisten. Gehrman. Ich helfe euch, so gut ich … noch kann. Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- else:
    { gehrman >= 4 and gehrman % 4 == 0:
        Gehrman schläft. Der Kopf ist ihm auf die Brust gesunken, der Hut sitzt schief, und seine Lippen bewegen sich. Ein Name kommt darüber, zwei Silben, vielleicht drei, zu leise, um ihn festzuhalten. Dann, deutlicher, ohne dass er die Augen öffnet: „Wird es draußen schon hell?“ Du wartest. Er wacht nicht auf, und im Kamin brennt das Feuer weiter, ohne dass jemand nachlegt. # notiz: gehrman_schlaf
        ->->
    }
    Gehrman hebt den Kopf, als du eintrittst, und nickt dir zu wie einem alten Bekannten.
}
{ gehrman == 1:
    ~ altar_blatt = true
    „Früher hat man hier Blut in den Stahl gegeben“, sagt er, „und in sich selbst, ins eigene Fleisch. Heute ist weniger da. Es reicht.“ Dann macht er eine Pause, länger als die anderen, und als er weiterspricht, ist seine Stimme zu leise für den Raum. „Die Puppe draußen … die steht dir auch zu. Wenn dir danach ist.“ Er sieht dabei nicht dich an, sondern ins Feuer.
    Im hinteren Teil des Hauses, wo das Licht des Kamins nicht mehr hinreicht, steht ein Altar aus dunklem Holz, und darauf liegt unter einem Kerzenstumpf ein Blatt. Wer es beschrieb, drückte die Feder so fest auf, dass die Buchstaben auf der Rückseite erhaben stehen, und jeder kippt nach rechts, dem nächsten entgegen, als hätte die Hand nicht viel Zeit gehabt. # lore: ende_der_nacht
    „Aus diesem Traum kommt nur hinaus, wer der Seuche ihre Quelle verschließt. Bleibt die Quelle offen, bleibt die Nacht.“ # stil: tagebuch
    Ein Name steht nicht darunter.
}
- (thema)
* [Nach diesem Ort fragen #fliesst]
    Du fragst ihn, was das für ein Ort ist. „Ein Traum.“ Er lässt das Wort stehen. „Ein Ort, an dem Jäger ruhen, solange die Jagd dauert. Sich rüsten. Sich erinnern.“ Er zieht die Decke über seinen Knien glatt, obwohl sie glatt ist. „Man kommt hierher zurück. Ob man will oder nicht.“ # lore: jaegertraum
    -> thema
* [Nach dem Weg hinaus fragen #fliesst]
    // [ERWEITERT] Seine Antwort als Meinung, nicht als Gesetz; Gegenpol zum Blatt am Altar.
    ~ gehrman_nacht = true
    Du fragst ihn, wie man diesen Traum wieder verlässt. „Wenn die Nacht vorbei ist.“ Er sagt es schnell, wie etwas Auswendiggelerntes. „So hat man es mir gesagt.“
    ** [„Und wann ist sie vorbei?“ #fliesst]
        ~ gehrman_wann = true
        „Und wann ist sie vorbei?“, fragst du. Er sieht lange ins Feuer, dann auf die Decke über seinen Knien, dann wieder ins Feuer. Er antwortet nicht. Nach einer Weile nimmt er ein Werkzeug von der Bank und beginnt, es zu putzen, sorgfältig, obwohl es sauber ist. { altar_blatt: Hinter ihm, im dunklen Teil des Hauses, liegt das Blatt auf dem Altar, und er dreht sich nicht danach um. } # notiz: nacht_ohne_ende
    ** [Es dabei bewenden lassen #fliesst]
        Du lässt es dabei bewenden. Er nickt, ein wenig zu schnell, und die Hand, die eben noch die Lehne gehalten hat, lässt sie los.
    -- -> thema
* {haltung_vertrag != ""} [Den Vertrag aus der Klinik erwähnen #fliesst]
    // [KANON lore:figuren/gehrman] (LK §24.13) Er hat einem lieben Freund ein Versprechen gegeben; den Namen nicht nennen (gesperrt). Dass der Vertrag bindet, ist [DEUTUNG].
    ~ gehrman_versprochen = true
    Du erwähnst den Vertrag, den du in der Klinik unterschrieben hast. Er fragt nicht, was darin stand. Er sieht auf deine Hände, auf die braune Tinte an deinen Fingerkuppen, und für einen Augenblick wird sein Mund schmal. „Jeder hier hat irgendwann irgendwas versprochen“, sagt er. „Ich auch. Einem Freund.“ Er wartet, bis im Kamin ein Scheit gebrochen ist. „Ich weiß noch, dass ich es versprochen habe.“ # notiz: vertrag_gehrman
    -> thema
* [Nach den Jägern fragen #fliesst]
    // [KANON lore:fraktionen/jaeger] Werkstattjäger vor den Kirchenjägern. [KANON lore:gegenstaende/heilende-kirche] Die Jäger der Kirche tragen Schwarz (Black Church Set), dazu ihre Hämmer. G4: Er war einst Jäger; dass er der erste war, sagt er nicht.
    ~ gehrman_jaeger = true
    Du fragst ihn, woher die Jäger kommen. „Ich war selbst einmal einer“, sagt er, und für einen Atemzug ist er nicht alt. Seine rechte Hand schließt sich um einen Griff, den es nicht gibt. „Damals gab es nicht viele von uns. Ein paar habe ich angelernt, hier, an dieser Bank.“ Die Hand öffnet sich wieder. „Später hatte die Kirche ihre eigenen, mit schwarzen Mänteln und schönen Hämmern.“ Er lacht, kurz. „Wir hatten Sägen. Die taten, was sie sollten.“ # lore: gehrman
    -> thema
* [Nach der Feuerwaffe fragen #fliesst]
    Du fragst ihn, wie man mit der Feuerwaffe kämpft.
    { parade:
        „Das weißt du schon, sehe ich.“ Er betrachtet, wie du die Waffe hältst. „Dann hat es dir einer gezeigt, der es kann. Gut. Mehr könnte ich dir auch nicht sagen.“
    - else:
        „Nicht zum Töten.“ Er beugt sich vor, und seine Stimme wird fest, eine Stimme für Höfe und Übungsplätze. „Ein Schuss, genau dann, wenn die Bestie ausholt und ihr ganzes Gewicht in den Schlag legt. Dann wankt sie. Und eine wankende Bestie ist eine tote Bestie, wenn man schnell genug ist.“ # lore: parade
        ~ parade = true
        ~ parade_quelle = "gehrman"
    }
    -> thema
* {einsicht >= 1} [Nach den Bildern im Blut fragen #fliesst]
    ~ gehrman_blut = true
    Du fragst ihn, warum das Blut dir Bilder zeigt, die nicht deine sind. Gehrman schweigt lange. „Man sagt, das Blut erinnert sich“, sagt er schließlich, sehr leise. „Das haben Leute gesagt, die zu viel Blut gesehen haben. Ob es stimmt …“ Er hebt die Schultern. „Ich habe es nie wissen wollen.“ # lore: blutgedaechtnis
    -> thema
* [Nach den Bestien fragen #fliesst]
    ~ gehrman_bestien = true
    Du fragst ihn, woher die Bestien kommen. Er antwortet nicht gleich. Seine Hände legen sich um die Lehnen des Rollstuhls und schließen sich, bis die Knöchel weiß werden. „Jag sie“, sagt er dann. „Denk nicht zu viel darüber nach. Das andere hilft dir nicht, und mit der Zeit gewöhnt man sich.“ Er wendet sich dem Kamin zu. # lore: bestienseuche
    -> thema
+ [Dich zur Tür wenden #fliesst]
    Du wendest dich zur Tür. „Gute Jagd“, sagt Gehrman hinter dir, im Ton eines Mannes, der diesen Satz schon viel zu oft gesagt hat.
    ->->

=== boten_laden ===
// TITEL: Bad der Boten
// [KANON lore:figuren/boten] Die Boten verkaufen gegen Blutechos; ihr Sortiment wächst mit Abzeichen (das Abzeichen der Schwertjäger stammt aus der Beute der Kleriker-Bestie, kleriker == "besiegt"). PRÜFEN: welche Waren im ersten Abschnitt.
// Kaufen fließt in den Satz: der Preis knapp in der Option, im Folgetext nur noch die Ware.
{ boten_laden == 1:
    Neben dem Weg steht ein steinernes Becken, halb voll mit einem Wasser, das sich nie klärt, und darin hocken die Boten, so dicht, dass man nicht sagen kann, wo einer aufhört und der nächste beginnt. Einer trägt einen winzigen, zerbeulten Hut. Als du dich über den Rand beugst, heben sie die grauen Hände aus dem Wasser, und die Gesichter aus nassem Ton wenden sich dir alle zugleich zu. # lore: boten
- else:
    {~Im Becken regt sich das trübe Wasser, und graue Hände tauchen auf, alle zugleich.|Der Bote mit dem zerbeulten Hut ist bis an den Rand gekrochen und wartet.|Die Boten heben die Gesichter aus dem Wasser, als hätten sie die ganze Zeit auf dich gewartet.}
}
{ kleriker == "besiegt" and not kirchenbrief and not brief_gezeigt:
    ~ brief_gezeigt = true
    Einer der Boten streckt den Arm aus und tippt mit einem nassen Finger auf das silberne Abzeichen, das du von der Brücke mitgebracht hast, genau auf das Schwert. Dann taucht er unter und kommt mit einem Brief wieder hoch, den er dir vorher nicht gezeigt hat, das rote Siegel voran.
}
- (wahl)
+ {echos >= 3 and molotow < 3} [Für drei Echos einen Molotow kaufen #fliesst]
    ~ echos = echos - 3
    ~ molotow = molotow + 1
    Du kaufst eine Flasche mit Öl und einem Lappen im Hals, und der Bote, der sie dir reicht, hält sie einen Atemzug zu lange fest, bevor er loslässt.
    -> wahl
+ {echos >= 1 and kiesel < 3} [Für ein Echo einen Kieselstein kaufen #fliesst]
    ~ echos = echos - 1
    ~ kiesel = kiesel + 1
    Du kaufst einen glatten grauen Kiesel, kühl in der Hand, gut, um Lärm zu machen an einem Ort, an dem man selbst nicht sein will.
    -> wahl
// [ERWEITERT] Wissen und Kleidung (Entscheidung des Nutzers 2026-11-04): Was die Boten anbieten, haben sie Toten abgenommen.
+ {echos >= 6 and not jagdnotizen} [Für sechs Echos Jagdnotizen eines Toten kaufen #fliesst]
    ~ echos = echos - 6
    ~ jagdnotizen = true
    ~ gelernt += (wurf, ansturm, axt_wirbel)
    Du kaufst ein Heft mit gewellten Seiten, das einmal nass geworden ist. Ein Jäger hat darin gezeichnet, was ihn beinahe umgebracht hat, mit Bleistift und mit Pfeilen: ein Arm, der eine Kutsche über die Schulter hebt. Ein Geweih, gesenkt, und daneben das Wort „spät“, dreimal unterstrichen. Ein Strich, gerade von oben nach unten, und darunter drei Kerben, die dritte tiefer als die anderen. Die letzte Seite ist leer bis auf einen braunen Daumenabdruck. # notiz: jagdnotizen
    -> wahl
+ {kleriker == "besiegt" and echos >= 2 and not kirchenbrief} [Für zwei Echos den gesiegelten Brief kaufen #fliesst]
    ~ echos = echos - 2
    ~ kirchenbrief = true
    // [KANON lore:figuren/amelia] Die Vikarin betet in der Großen Kathedrale. [KANON] Die Oedon-Kapelle im Kathedralbezirk nimmt Überlebende auf (erst Kapitel 2). [ERWEITERT] Der Brief, der Schreiber, die Glocken, der ausgestrichene Satz. Stimme C: Vorgang statt Gefühl; der Riss in der Ordnung ist der letzte Satz.
    Du kaufst den Brief. Das Siegel ist schon gebrochen, gelesen hat ihn jemand vor dir, und die Hand darin ist klein und sorgfältig, jede Zeile gleich weit von der nächsten.
    „Liebe Schwester, ich darf dir mitteilen, dass die Kapelle oben im Bezirk auf Weisung nunmehr jeden aufnimmt, der an die Tür klopft und noch sprechen kann. Wer nicht mehr sprechen kann, wird an die nächste Stelle des Blutes verwiesen. Die Vikarin betet in der großen Kathedrale jede Nacht am längsten von uns allen; wo sie kniet, sind die Steine danach nass, und es wird gewischt. Mir ist aufgetragen, die Glocken zu läuten, auch wenn niemand mehr kommt. Ich läute sie.“ # stil: anschlag # notiz: kirchenbrief
    Darunter steht ein letzter Satz, so fest ausgestrichen, dass die Feder das Papier zerrissen hat. Lesbar sind davon nur die ersten beiden Wörter: Komm nicht.
    -> wahl
+ {echos >= 3 and not mantel} [Für drei Echos den Jägermantel kaufen #fliesst]
    ~ echos = echos - 3
    ~ mantel = true
    // [ERWEITERT] Wendel, ein erfundener Jäger. Saat für Kapitel 2: Wer ihn zuletzt gesehen hat.
    Du kaufst den Mantel, und zwei Boten ziehen ihn gemeinsam aus dem Wasser, langes, geöltes Leder, schwer wie ein nasser Hund. Er riecht nach Teer, nach Pulver und nach einem Menschen, der nicht du bist. Am Saum fehlt ein Stück, glatt abgetrennt. Innen, ins Futter gestickt, mit rotem Garn und ungeschickten Stichen, steht ein Name: Wendel. # notiz: mantel_wendel
    -> wahl
+ [Den Boten den Rücken kehren #fliesst]
    Du kehrst ihnen den Rücken, und hinter dir sinken sie zurück ins trübe Wasser, enttäuscht oder gleichgültig, du kannst es nicht sagen.
    ->->
