// DER JÄGERTRAUM: feste Szenen der Geschichte (erster Tod, Laterne am Eingang der Unterstadt, Kapitelende), kein Hub zwischen den Jagden (Entscheidung des Nutzers 2026-11-06). Gehrman, die Puppe, die Boten als stumme Gesellschaft. Der Tod führt nicht hierher, sondern in das Nachbild (story/nachbild.ink).
// [KANON lore:orte/jaegertraum] Traum als Zuflucht, Rückkehr über Laternen und Grabsteine, das Blatt beim Altar (Notiz Nr. 3), Puppe erwacht mit Einsicht, Gehrman bietet alles hier an, auch die Puppe.
// [DEUTUNG] Dass der Vertrag an den Traum bindet und Gehrman selbst gefangen ist: nur gezeigt (Tinte, Nadelstich, daheim, seine Hände, die Frage nach dem Hellwerden), nie gesagt.
// Stimmen: Gehrman müde und warm, mit Pausen, ganz anders als der glatte Mann in der Klinik; er spricht oft zum Feuer hin statt zu dir. Die Puppe förmlich, sanft, ohne Atem zwischen den Sätzen, fragt nach der Welt draußen.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck: Garten, Werkstatt und Fundstücke in A, Gespräche in B, der Brief der Kirche in C. Optionen fließen in den Satz (#fliesst).
// Feinschliff nach dem Lektorat 2026-11-05 (docs/lektorat-kapitel1.md, L1 bis L6): stiller, falscher Friede. Keine Ladensprache im Erzähltext, Brandflasche statt Molotow, Gehrmans Optionen als eigene Rede, kein „von selbst“ mehr als einmal, Dinge auf den Grabsteinen mit einer Wirkung statt einer Entschuldigung.

// --- Merker des Traums (nur hier gesetzt) -----------------------------------------
VAR altar_blatt = false          // das Blatt am Altar in der Werkstatt gesehen (Ziel der Nacht)
VAR blatt_erinnert = false       // beim Erwachen an das Blatt gedacht (zweite Stelle von ende_der_nacht)
VAR gehrman_bestien = false      // Gehrman nach den Bestien gefragt (seine Hände an den Lehnen)
VAR gehrman_wann = false         // gefragt, wann die Nacht vorbei ist (er antwortet nicht)
VAR gehrman_versprochen = false  // Gehrman hat von seinem Versprechen an einen Freund gesprochen
VAR puppe_daheim = false         // die Puppe hat den Traum beim Erwachen daheim genannt
VAR puppe_besucht = false        // in der zweiten Traumszene mit der Puppe gesprochen
VAR geuebt = false               // Gehrmans Übung im Hof (zweite Traumszene): öffnet je eine Möglichkeit gegen Gascoigne

=== k1_traum_zwei ===
// TITEL: Zweite Traumszene: die Laterne am Eingang der Unterstadt
// Feste Szene der Geschichte (3 Traumszenen in Kapitel 1: erster Tod, hier, Kapitelende). Pflicht für alle Routen: Gehrman und die Übung im Hof (Parade) kann niemand verpassen.
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Unter deiner Hand wird das Glas der Laterne warm, und die Stadt bleicht aus wie ein Kupferstich im Fenster eines Ladens, der seit Jahren nicht mehr öffnet: zuerst die Giebel, dann die Gasse, zuletzt das Pflaster unter deinen Stiefeln. Unter den Sohlen ist Gras. # bild: traum # stimmung: ruhig
-> traum_fragmente ->
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
{~Zwischen den Grabsteinen, deren Inschriften der Regen ausgewaschen hat, obwohl es hier nie regnet, wühlen die Boten in der Erde, als suchten sie dort, was ihnen einmal gehört hat.|Durch die weißen Blumen geht ein Wind, den du auf der Haut nicht spürst, und legt sie alle in dieselbe Richtung, und oben auf dem Hügel brennt im Haus das Licht, das dort immer brennt.}
// Einsicht 2: das Ding auf dem Stein nie beschrieben, nur seine Wirkung (Lektorat 1.3).
{ einsicht >= 2: Auf den Grabsteinen am Rand des Gartens sitzt etwas, das nicht weggeht, wenn du blinzelst. Ansehen lässt es sich nicht; dein Blick gleitet daran ab und landet jedes Mal im Gras daneben. Um den Stein aber sind die weißen Blumen braun geworden, in einem Kreis, so rund, als hätte ihn jemand mit dem Zirkel gezogen. }
- (wahl)
+ {puppe_wach and not puppe_besucht} [Zur Puppe an die Treppe gehen #fliesst]
    ~ puppe_besucht = true
    {~Sie hebt den Kopf, bevor du die Treppe erreichst, mit dem leisen Knirschen in der Halsfuge.|An der Treppe wartet sie schon, die Hände vor dem Kleid gefaltet, und hat dich kommen sehen, lange bevor du losgingst.}
    -> puppe_gespraech -> wahl
+ [Den Pfad zur Werkstatt hinaufgehen #fliesst]
    { gehrman == 0:
        Oben, zwischen den letzten Grabsteinen, gibt die Tür diesmal unter deiner Hand nach. Einen Riegel hast du nicht gehört.
    - else:
        Oben steht die Tür der Werkstatt einen Spalt offen, und aus dem Spalt fällt Feuerschein auf die Stufe.
    }
    -> gehrman ->
- Unter deiner Hand ist der Grabstein ohne Namen kalt, und während du an die Stadt denkst, kehrt sie zurück: der Geruch zuerst, dann die Geräusche, zuletzt die Kälte. # bild: unterstadt
-> k1_c_graeber

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON lore:figuren/puppe] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht: Sie soll den Jäger behüten und verwandelt, was aus den Bestien aufsteigt, in Stärke. Inhalt sinngemäß, Wortlaut eigen.
// [Offen] Wessen Stimme am Ende der Vision in der Klinik sprach. Hier nur ein Echo der Worte („Da bist du ja“), keine Erklärung (Lektorat puppe_erwacht 1).
~ puppe_wach = true
Am Fuß der Treppe steht die Puppe, wie sie immer stand, die Hände vor dem Kleid gefaltet. Als du an ihr vorbeigehst, hebt sich ein Lid, nur eines. Dann knirscht es in ihrer Halsfuge, Holz an Holz, und der Kopf wendet sich dir nach, so langsam, dass du die Bewegung erst bemerkst, als sie vorbei ist. Die gemalten Augen bleiben auf dir liegen. Diesmal sehen sie dich. # gedaechtnis: puppe_erwacht # stimmung: schoen
„Oh“, sagt sie. „Da bist du ja.“ Ihre Stimme ist sanft und klar, und zwischen den Sätzen atmet sie nicht; die Sätze stehen nur da, einer neben dem anderen, wie Gedecke auf einem Tisch, an dem niemand sitzt. „Man hat mich in diesen Garten gestellt, damit ich dich behüte. Es ist lange her, dass einer kam, den man behüten konnte.“ Sie neigt den Kopf und lässt ihn so. „Bring mir, was aus ihnen aufsteigt, wenn sie fallen. Ich mache dir etwas daraus, das bleibt.“ # lore: puppe
Hinter ihr, auf drei Grabsteinen, sitzt etwas, das vorher nicht dort saß. Als du wieder hinsiehst, sind es nur zwei, und vor dem dritten Stein liegen die Blumen flach, wie unter einem Gewicht, das sich eben erst erhoben hat.
->->

=== puppe_gespraech ===
// TITEL: Gespräch mit der Puppe
// [KANON lore:figuren/puppe] Die Kleinen (Boten) finden Jäger und dienen ihnen; die Gräber stehen für unzählige frühere Jäger, alles scheint lange her; Gehrman war vor langer Zeit selbst Jäger und gibt nur noch Rat. [ERWEITERT] Ihre Fragen nach der Stadt, ihr Gedächtnis für deine Rückkehren (Lektorat: das Zählen gehört dem Zwang und der Ansteckung, hier ein Merken).
{ stopping:
- Die Puppe sieht zu den Boten hinüber, die zwischen den Blumen wühlen. „Die Kleinen“, sagt sie, und ihre gefalteten Hände lösen sich und finden wieder zueinander. „Sie haben dich zuerst gesehen, lange vor mir. Sie graben nach Leuten wie dir, so wie andere nach Wurzeln graben. Dich haben sie ausgegraben.“ Der Kopf neigt sich, bis das Knirschen in der Fuge aufhört. „Du kanntest sie schon, nicht wahr? Von vorher?“ # lore: boten
- -> frage
- Die Puppe sieht an dir vorbei zu den Grabsteinen, die schief im Gras stehen, Reihe hinter Reihe, bis die hintersten nur noch Striche sind, und hinter den Strichen stehen weitere. „Für jeden dieser Steine ist einmal einer gekommen wie du“, sagt sie. „Er stand hier, wo du stehst, und hat mit mir gesprochen.“ Ihre Hände bleiben gefaltet. „Es ist alles so lange her, dass ich die Gesichter verwechsle. Verzeih. Deines will ich mir merken.“ # lore: jaegertraum
    { gehrman_gesehen or gehrman:
        Sie wendet den Kopf zum Haus auf dem Hügel. „Auch Gehrman war einmal einer von ihnen, vor sehr langer Zeit. Jetzt gibt er nur noch Rat. Hinaus geht er nicht mehr.“
    }
- { tode >= 3:
        „Du liegst jedes Mal ein wenig anders im Gras, wenn du zurückkehrst“, sagt sie. „Ich merke es mir. Einmal lag deine Hand offen, einmal war sie geschlossen.“ Sie sieht nicht auf. „Ich weiß nicht, wozu ich es mir merke. Aber jedes Mal wird es mir schwerer.“
    - else:
        „Wie ist die Jagd?“, fragt sie, und während du erzählst, regt sich an ihr nichts als die Lider. Als du fertig bist, wiederholt sie ein einziges Wort davon, behutsam, wie man eine fremde Münze zwischen den Fingern dreht: „{k1_b_maedchen:Brunnenplatz|Räucherlampe}.“
    }
}
->->

= frage
„Darf ich dich etwas fragen? Wie riecht es draußen? Ich habe nur Blumen.“
* [„Nach Rauch. Nach Blut.“ #fliesst]
    „Und nach nassem Stein“, setzt du hinzu. Ihr Gesicht verzieht sich nicht; es kann es nicht. „Rauch“, wiederholt sie. „Und Blut. Danke. Ich wollte wissen, wie es ist, nicht, wie es sein soll.“
* [Ihr vom Räucherwerk erzählen #fliesst]
    Von den roten Lampen vor den Fenstern und dem Rauch, der aus ihnen in die Gassen sinkt und sich in die Kleider setzt, bis man ihn nicht mehr bemerkt. Als sie fragt, wonach er riecht, suchst du lange und sagst dann: „Süß.“ Sie schließt die Augen, als könne sie es so riechen. „Süß“, wiederholt sie. „Dann ist es draußen nicht nur schlimm.“
- ->->

=== gehrman ===
// TITEL: Gehrman
// [KANON lore:figuren/gehrman] Früher Dialog (LK §18.1): einst Zuflucht und Werkstatt, in der Jäger Blut für ihre Waffen und ihr eigenes Fleisch nahmen; weniger Werkzeug als früher; alles darf man benutzen, geflüstert auch die Puppe; nicht zu viel nachdenken, jagen, man gewöhnt sich. Einst selbst Jäger. Dass er der erste war, ist in Kapitel 1 gesperrt (G4).
// [KANON lore:orte/jaegertraum] Das Blatt beim Altar im hinteren Teil des Hauses (Notiz Nr. 3): Ziel der Nacht. Wortlaut eigen.
// [ERWEITERT] Gesprächsthemen als Lore-Quelle; der Vertrag und das Verlassen des Traums. Schlafreden nur als Laut und Frage, ohne die Gefangenschaft auszusprechen.
// Lektorat gehrman: Die Optionen sind eigene Rede des Jägers; die Fortsetzung beginnt mit seiner Antwort oder seinem Schweigen. Seine Pausen werden gezeigt (Feuer, Decke, Hände), nicht beschrieben.
{
- gehrman == 1 and gehrman_gesehen:
    In der Werkstatt riecht es nach Lampenöl, nach Leder und nach Papier, das zu lange in der Nähe eines Feuers gelegen hat; an den Wänden hängen Werkzeuge an Haken, und auf einem Bord kauert in einem Tontopf eine kleine Gestalt aus Knochen. Am Kamin sitzt der alte Mann vom Weg in seinem Rollstuhl, die Decke über den Knien, als hätte er sich seit dem Garten nicht gerührt. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Du schon wieder.“ Er sagt es zum Feuer hin. „Gehrman. Ich hätte mich draußen … vorstellen sollen. Aber wer gerade aufwacht, will keine Namen hören.“ Seine Hand beschreibt einen kleinen Bogen, der die Werkstatt umfasst, die Borde, die Bank, die Töpfe. „Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- gehrman == 1:
    In der Werkstatt riecht es nach Lampenöl, nach Leder und nach Papier, das zu lange in der Nähe eines Feuers gelegen hat. An den Wänden hängen Werkzeuge und Pläne, auf den Borden stehen Flaschen und Tontöpfe, und in einem der Töpfe kauert eine kleine Gestalt aus Knochen, die jemand mit großer Geduld zusammengesetzt hat. Vor dem Kamin steht ein Rollstuhl, und darin sitzt ein alter Mann mit grauem Haar unter einem breitkrempigen Hut, eine Decke über den Knien. Er dreht sich nicht um. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Da kommt jemand.“ Er sagt es zum Feuer, nicht zu dir. „Setz dich, wenn du magst. Oder bleib stehen, das tun die meisten. Gehrman. Ich helfe euch, so gut ich …“ Das Ende des Satzes sucht er eine Weile in der Glut. „… noch kann. Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- else:
    { gehrman >= 4 and gehrman % 4 == 0:
        Gehrman schläft. Der Kopf ist ihm auf die Brust gesunken, der Hut sitzt schief, und seine Lippen bewegen sich. Ein Name kommt darüber, zwei Silben, vielleicht drei, zu leise, um ihn festzuhalten. Dann, deutlicher, ohne dass er die Augen öffnet: „Wird es draußen schon hell?“ Du wartest. Er wacht nicht auf. Nur seine Hand auf der Decke öffnet sich, als ließe sie einen Griff los, und schließt sich wieder. # notiz: gehrman_schlaf
        ->->
    }
    Gehrman hebt den Kopf, als du eintrittst, und nickt dir zu wie einem alten Bekannten.
}
{ gehrman == 1:
    ~ altar_blatt = true
    „Früher hat man hier Blut in den Stahl gegeben“, sagt er, „und in sich selbst. Ins eigene Fleisch.“ Er lässt das stehen, so lange, dass du das Feuer knacken hörst. „Heute ist weniger da. Es reicht.“ Dann senkt er die Stimme, obwohl außer dir niemand da ist: „Die Puppe draußen … die steht dir auch zu. Wenn dir danach ist.“ Seine Augen bleiben dabei in den Flammen.
    Im hinteren Teil des Hauses, wo das Licht des Kamins nicht mehr hinreicht, steht ein Altar aus dunklem Holz, und darauf liegt unter einem Kerzenstumpf ein Blatt. Wer es beschrieb, drückte die Feder so fest auf, dass die Buchstaben auf der Rückseite erhaben stehen, und jeder kippt nach rechts, dem nächsten entgegen, als hätte die Hand nicht viel Zeit gehabt. # lore: ende_der_nacht
    „Aus diesem Traum kommt nur hinaus, wer der Seuche ihre Quelle verschließt. Bleibt die Quelle offen, bleibt die Nacht.“ # stil: tagebuch
    Ein Name steht nicht darunter.
}
-> training ->
- (thema)
* [„Was ist das für ein Ort?“ #fliesst]
    Er lässt sich Zeit. „Ein Traum.“ Danach wartet er, als prüfe er, ob das Wort hält. „Ein Ort, an dem Jäger ruhen, solange die Jagd dauert. Sich rüsten. Sich erinnern.“ Er streicht die Decke über seinen Knien glatt, einmal, zweimal, an derselben Stelle. „Man kommt hierher zurück. Ob man will oder nicht.“ # lore: jaegertraum
    -> thema
* [„Wie kommt man hier wieder hinaus?“ #fliesst]
    // [ERWEITERT] Seine Antwort als Meinung, nicht als Gesetz; Gegenpol zum Blatt am Altar.
    ~ gehrman_nacht = true
    „Wenn die Nacht vorbei ist.“ Es kommt schnell, schneller als alles, was er bisher gesagt hat, wie etwas Auswendiggelerntes. „So hat man es mir gesagt.“
    ** [„Und wann ist sie vorbei?“ #fliesst]
        ~ gehrman_wann = true
        Er sieht ins Feuer, dann auf die Decke über seinen Knien, dann wieder ins Feuer. Er antwortet nicht. Nach einer Weile nimmt er ein Werkzeug von der Bank und beginnt, es zu putzen, sorgfältig, obwohl es sauber ist. { altar_blatt: Hinter ihm, im dunklen Teil des Hauses, liegt das Blatt auf dem Altar, und er dreht sich nicht danach um. } # notiz: nacht_ohne_ende
    ** [Es dabei bewenden lassen #fliesst]
        Er nickt, ein wenig zu schnell, und die Hand, die eben noch die Lehne gehalten hat, lässt sie los.
    -- -> thema
* {haltung_vertrag != ""} [„In der Klinik habe ich unterschrieben.“ #fliesst]
    // [KANON lore:figuren/gehrman] (LK §24.13) Er hat einem lieben Freund ein Versprechen gegeben; den Namen nicht nennen (gesperrt). Dass der Vertrag bindet, ist [DEUTUNG].
    ~ gehrman_versprochen = true
    Er fragt nicht, was darin stand. Er sieht auf deine Hände, auf die braune Tinte an deinen Fingerkuppen, und für einen Augenblick wird sein Mund schmal. „Jeder hier hat irgendwann irgendwas versprochen“, sagt er. „Ich auch. Einem Freund.“ Er wartet, bis im Kamin ein Scheit gebrochen ist. „Ich weiß noch, dass ich es versprochen habe.“ # notiz: vertrag_gehrman
    -> thema
* [„Woher kommen die Jäger?“ #fliesst]
    // [KANON lore:fraktionen/jaeger] Werkstattjäger vor den Kirchenjägern. [KANON lore:gegenstaende/heilende-kirche] Die Jäger der Kirche tragen Schwarz (Black Church Set), dazu ihre Hämmer. G4: Er war einst Jäger; dass er der erste war, sagt er nicht.
    ~ gehrman_jaeger = true
    „Ich war selbst einmal einer.“ Für einen Atemzug ist er nicht alt. Seine rechte Hand schließt sich um einen Griff, den es nicht gibt. „Damals gab es nicht viele von uns. Ein paar habe ich angelernt, hier, an dieser Bank.“ Die Hand öffnet sich wieder. „Später hatte die Kirche ihre eigenen, mit schwarzen Mänteln und schönen Hämmern.“ Er schnaubt, und es ist beinahe ein Lachen. „Wir hatten Sägen. Die taten, was sie sollten.“ # lore: gehrman
    -> thema
* [Ihm die Feuerwaffe hinhalten #fliesst]
    { parade:
        Er nimmt sie nicht. Er sieht nur, wie du sie hältst, den Daumen am Hahn, den Lauf zum Boden. „Das weißt du schon. Dann hat es dir einer gezeigt, der es kann.“ Er nickt, zweimal. „Gut. Mehr könnte ich dir auch nicht sagen.“
    - else:
        „Nicht zum Töten.“ Er beugt sich vor, und für drei Sätze ist seine Stimme eine für Höfe und Übungsplätze. „Wenn sie ausholt. Wenn ihr ganzes Gewicht im Schlag liegt. Dann schießt du, und sie wankt.“ Er lehnt sich zurück, und die Stimme ist wieder alt. „Den Rest macht die Säge.“ # lore: parade
        ~ parade = true
        ~ parade_quelle = "gehrman"
    }
    -> thema
* {einsicht >= 1} [„Ich sehe Dinge, die nicht meine sind.“ #fliesst]
    ~ gehrman_blut = true
    Lange kommt keine Antwort, und als sie kommt, spricht er sie in seine gefalteten Hände hinein: „Man sagt, das Blut erinnert sich. Das haben Leute gesagt, die zu viel davon gesehen haben. Ob es stimmt …“ Er hebt die Schultern. „Ich habe es nie wissen wollen.“ # lore: blutgedaechtnis
    -> thema
* [„Woher kommen die Bestien?“ #fliesst]
    // PRÜFEN erledigt (Lektorat gehrman 3): Der Rat, nicht zu viel nachzudenken, bleibt sinngemäß, der Wortlaut ist eigen; „man gewöhnt sich“ steht nur noch beim ersten Erwachen.
    ~ gehrman_bestien = true
    Er antwortet nicht gleich. Seine Hände legen sich um die Lehnen des Rollstuhls und schließen sich, bis das Holz unter ihnen knackt. „Jag sie“, sagt er dann. „Wer zu lange fragt, woher sie kommen, fängt irgendwann an, es zu wissen.“ Er wendet sich dem Kamin zu, und die Hände bleiben, wo sie sind. # lore: bestienseuche
    -> thema
+ [Dich zur Tür wenden #fliesst]
    „Gute Jagd“, sagt Gehrman hinter dir. Er sagt es zum Feuer und dreht sich nicht um.
    ->->

=== training ===
// TITEL: Übung im Hof
// [KANON lore:figuren/gehrman, lore:figuren/gascoigne] Die Parade lernt man von Gehrman wie von Gascoigne. [ERWEITERT] Die Übung im Hof ist eine Szene, kein Menü: Sie öffnet gegen Gascoigne je eine Möglichkeit (`geuebt`). PLATZHALTER, knapp.
~ geuebt = true
Gehrman rollt zur Hintertür und stößt sie mit dem Stuhl auf. „Komm. Einmal noch üben, bevor es weitergeht.“ Im Hof steht ein Pfahl, mit Leder umwickelt und an vielen Stellen zerhauen. Er lässt dich schwere Hiebe abfangen, die für deinen Arm zu schwer sind, und Schüsse setzen, wenn der Pfahl ausholt, den man sich dazudenken muss. # lore: gehrman
{ not parade:
    ~ parade = true
    ~ parade_quelle = "gehrman"
    „Wenn sie ausholt“, sagt er. „Wenn ihr ganzes Gewicht im Schlag liegt. Dann schießt du, und sie wankt.“ # lore: parade
- else:
    Er sieht dir eine Weile zu und sagt nichts. Dann nickt er. „Du hast es schon von einem, der es kann.“
}
Danach sind deine Schultern müde und deine Hände ruhig.
->->
