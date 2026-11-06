// DER JÄGERTRAUM: feste Szenen der Geschichte (erster Tod, Laterne am Eingang der Unterstadt, Kapitelende), kein Hub zwischen den Jagden (Entscheidung des Nutzers 2026-11-06). Gehrman, die Puppe, die Boten als stumme Gesellschaft. Der Tod führt nicht hierher, sondern in das Nachbild (story/nachbild.ink).
// [KANON lore:orte/jaegertraum] Traum als Zuflucht, Rückkehr über Laternen und Grabsteine, das Blatt beim Altar (Notiz Nr. 3), Puppe erwacht mit Einsicht, Gehrman bietet alles hier an, auch die Puppe.
// [DEUTUNG] Dass der Vertrag an den Traum bindet und Gehrman selbst gefangen ist: nur gezeigt (Tinte, Nadelstich, daheim, seine Hände, die Frage nach dem Hellwerden, die Rinnen seiner Räder in den Dielen), nie gesagt.
// [ERWEITERT, Ü1] Über dem Traum steht in Kapitel 1 kein Mond (im Artbook ein Mond hinter einem kahlen Baum): Der Himmel ist leer, das Licht kommt von nirgendwo. Kontrast zum Mond über der Stadt, der nicht wandert und näher kommt.
// Stimmen: Gehrman müde und warm, mit Pausen, ganz anders als der glatte Mann in der Klinik; er spricht oft zum Feuer hin statt zu dir; kurze Sätze, die wörtlich Auskunft sind und einen zweiten Sinn tragen. Die Puppe förmlich, sanft, ohne Atem zwischen den Sätzen, fragt nach der Welt draußen.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck: Garten, Werkstatt und Hof in A, Gespräche in B. Optionen fließen in den Satz (#fliesst).
// Feinschliff nach dem Lektorat 2026-11-05 (docs/lektorat-kapitel1.md, L1 bis L6): stiller, falscher Friede. Keine Ladensprache im Erzähltext, Gehrmans Optionen als eigene Rede, kein „von selbst“ mehr als einmal, Dinge auf den Grabsteinen mit einer Wirkung statt einer Entschuldigung.
// Überarbeitet 2026-11-06 Text für Text (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12, Skill stil-1800, Momente traum, gespraech, option): Mond fehlt über dem Garten, die Puppe verspricht keine Stärkung mehr (entfallen 2026-11-06), Gehrmans Fortsetzungen nehmen die Frage hörbar auf, die Übung im Hof ist ausgeschrieben (Ü10). Jede Option mit WARUM (Ü7).
// Notizbuch (web/notizbuch.js) spiegelt einige Bilder wörtlich: das geputzte saubere Werkzeug, die Hände an den Lehnen, der Griff, den es nicht gibt, „Da bist du ja“, „Dich haben sie ausgegraben“, „dass er es versprochen habe“. Diese Bilder bleiben.

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
// Anschluss: c_unterstadt endet mit dem kalten, weißen Licht der Laterne; hier wird ihr Glas warm.
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Unter deiner Hand wird das Glas der Laterne warm, und die Unterstadt bleicht aus wie ein Kupferstich im Fenster eines Ladens, der seit Jahren nicht mehr öffnet: zuerst die Giebel, dann die Gasse, zuletzt das Pflaster unter deinen Stiefeln. Unter den Sohlen ist Gras. Den Mond hat die Stadt behalten; über dem Garten ist der Himmel leer, und doch liegt auf jedem Blütenblatt Licht. # bild: traum # stimmung: ruhig
-> traum_fragmente ->
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
{~Zwischen den Grabsteinen, deren Inschriften der Regen ausgewaschen hat, obwohl es hier nie regnet, wühlen die Boten mit beiden Händen in der Erde, ohne Eile, als suchten sie dort, was ihnen einmal gehört hat.|Durch die weißen Blumen geht ein Wind, den du auf der Haut nicht spürst, und legt sie alle zur selben Seite, und oben auf dem Hügel brennt im Haus das Licht, das dort immer brennt.}
// Einsicht 2: das Ding auf dem Stein nie beschrieben, nur seine Wirkung (Lektorat 1.3). Steigerung gegen puppe_erwacht: Dort verschwindet es beim Blinzeln, hier nicht mehr.
{ einsicht >= 2: Auf einem Grabstein am Rand des Gartens sitzt etwas, das nicht weggeht, wenn du blinzelst. Ansehen lässt es sich nicht; dein Blick gleitet daran ab und landet jedes Mal im Gras daneben. Um den Stein aber sind die weißen Blumen braun geworden, in einem Kreis, so rund, als hätte ihn jemand mit dem Zirkel gezogen. }
- (wahl)
// WARUM: Der Spieler sucht die Nähe der Puppe, ehe er zu Gehrman hinaufgeht. Freiwillig und ohne Risiko; öffnet Lore (die Kleinen, ihre Frage, wie es draußen riecht) und zeigt, wie die Puppe die Stadt nur aus Erzählungen kennt.
+ {puppe_wach and not puppe_besucht} [Zur Puppe an die Treppe gehen #fliesst]
    ~ puppe_besucht = true
    {~Zur Treppe hinüber, zwischen den Blumen hindurch, und noch ehe du sie erreichst, hebt sie den Kopf, mit dem leisen Knirschen in der Halsfuge.|An der Treppe steht sie schon und sieht dir entgegen, die Hände vor dem Kleid gefaltet; sie hat dich kommen sehen, lange bevor du losgingst.}
    -> puppe_gespraech -> wahl
// WARUM: Der Pflichtweg der Szene: Gehrman, das Blatt am Altar (Ziel der Nacht) und die Übung im Hof, die `geuebt` setzt und gegen Gascoigne zwei Möglichkeiten öffnet. Kein Risiko; nach dem Gespräch endet der Traum.
+ [Den Pfad zur Werkstatt hinaufgehen #fliesst]
    { gehrman == 0:
        Den Pfad hinauf, an den letzten Grabsteinen vorbei, und oben gibt die Tür diesmal nach, kaum dass deine Hand sie berührt. Einen Riegel hast du nicht gehört.
    - else:
        Den Pfad hinauf; oben steht die Tür der Werkstatt einen Spalt offen, und aus dem Spalt fällt Feuerschein auf die Stufe.
    }
    -> gehrman ->
- Den Hügel hinab, bis zum Grabstein ohne Namen. Unter deiner Hand ist er kalt, und während du an die Stadt denkst, kehrt sie zurück, zuerst als Rauschen, das Wasser in den Rinnen der Unterstadt, dann als Geruch nach nassem Stein, zuletzt als Kälte im Nacken. # bild: unterstadt
-> k1_c_graeber

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON lore:figuren/puppe] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht: Sie soll den Jäger behüten und ist da, wenn sein Geist krank wird (sinngemäß, Wortlaut eigen). Dass sie Blutechos in Stärke verwandelt, entfällt mit der Stärkung (Entscheidung des Nutzers 2026-11-06); ihr Versprechen gilt jetzt dem, was draußen in dir krank wird.
// [Offen] Wessen Stimme am Ende der Vision in der Klinik sprach („Da bist du ja. Ein Jäger.“). Hier nur ein Echo der Worte, keine Erklärung (Lektorat puppe_erwacht 1).
// Aufgerufen in Traum 2 und, wer erst später Einsicht hat, in Traum 3 (d_nachspiel); der Text muss beide Male tragen.
~ puppe_wach = true
Am Fuß der Treppe steht die Puppe, wie sie beim ersten Mal stand, die Hände vor dem Kleid gefaltet. Als du an ihr vorbeigehst, hebt sich ein Lid, nur eines. Dann knirscht es in ihrer Halsfuge, Holz an Holz, und der Kopf wendet sich dir nach, so langsam, dass du die Bewegung erst bemerkst, als sie vorbei ist. Die gemalten Augen bleiben auf dir liegen. Diesmal sehen sie dich. # gedaechtnis: puppe_erwacht # stimmung: schoen
„Oh“, sagt sie. „Da bist du ja.“ Ihre Stimme ist sanft und klar, und zwischen den Sätzen atmet sie nicht; die Sätze stehen nur da, einer neben dem anderen, wie Gedecke auf einem Tisch, an dem niemand sitzt. „Man hat mich in diesen Garten gestellt, damit ich dich behüte. Es ist lange her, dass einer kam, den man behüten konnte.“ Sie neigt den Kopf und lässt ihn so. „Was draußen in dir krank wird, das bring mir. Ich gehe nirgendwohin.“ # lore: puppe
Über ihre Schulter hinweg siehst du die Grabsteine am Hang, und auf dreien sitzt etwas, das vorher nicht dort saß. Du blinzelst. Auf zweien. Vor dem dritten Stein liegen die Blumen flach, wie unter einem Gewicht, das sich eben erst erhoben hat.
->->

=== puppe_gespraech ===
// TITEL: Gespräch mit der Puppe
// [KANON lore:figuren/puppe] Die Kleinen (Boten) reden nicht, hängen aber an den Jägern und dienen ihnen, und die Puppe hat sie gern; die Gräber stehen für unzählige frühere Jäger, alles scheint lange her; Gehrman war vor langer Zeit selbst Jäger und gibt nur noch Rat. [ERWEITERT] Ihre Fragen nach der Stadt, ihr Gedächtnis für deine Rückkehren (Lektorat: das Zählen gehört dem Zwang und der Ansteckung, hier ein Merken).
// Hinweis zur Technik (nicht geändert, Ü9): puppe_gespraech wird nur einmal aufgerufen (puppe_besucht), darum spielt von {stopping} nur der erste Teil. Die beiden anderen bleiben als Text für spätere Besuche.
{ stopping:
- Die Puppe sieht zu den Boten hinüber, die zwischen den Blumen wühlen. „Die Kleinen“, sagt sie, und ihre gefalteten Hände lösen sich und finden wieder zueinander. „Sie haben dich zuerst gesehen, lange vor mir. Sie graben nach Leuten wie dir, so wie andere nach Wurzeln graben. Dich haben sie ausgegraben.“ Der Kopf neigt sich, bis das Knirschen in der Fuge aufhört. „Sprechen können sie nicht. Ich habe sie trotzdem gern. Du kanntest sie schon, nicht wahr? Von vorher?“ # lore: boten
- -> frage
- Die Puppe sieht an dir vorbei zu den Grabsteinen, die schief im Gras stehen, Reihe hinter Reihe, bis die hintersten nur noch Striche sind, und hinter den Strichen stehen weitere. „Für jeden dieser Steine ist einmal einer gekommen wie du“, sagt sie. „Er stand hier, wo du stehst, und hat mit mir gesprochen.“ Ihre Hände bleiben gefaltet. „Es ist alles so lange her, dass ich die Gesichter verwechsle. Verzeih. Deines will ich mir merken.“ # lore: jaegertraum
    { gehrman_gesehen or gehrman:
        Sie wendet den Kopf zum Haus auf dem Hügel. „Auch Gehrman war einmal einer von ihnen, vor sehr langer Zeit. Jetzt gibt er nur noch Rat. Hinaus geht er nicht mehr.“
    }
- { tode >= 3:
        „Du liegst jedes Mal ein wenig anders im Gras, wenn du zurückkehrst“, sagt sie. „Ich merke es mir. Einmal lag deine Hand offen, einmal war sie geschlossen.“ Sie sieht nicht auf. „Wozu ich es mir merke, weiß ich nicht. Aber es wird mir jedes Mal schwerer.“
    - else:
        „Wie ist die Jagd?“, fragt sie, und während du erzählst, regt sich an ihr nichts als die Lider. Als du fertig bist, wiederholt sie ein einziges Wort davon, behutsam, wie man eine fremde Münze zwischen den Fingern dreht: „{k1_b_maedchen:Brunnenplatz|Räucherlampe}.“
    }
}
->->

= frage
„Darf ich dich etwas fragen? Wie riecht es draußen? Hier riecht alles nur nach Blumen.“
// WARUM: Die Wahrheit, ungeschönt: Der Spieler mutet der Puppe die Stadt zu, wie sie ist. Prüft nichts und färbt nur die Puppe: Sie dankt für eine Wahrheit, die ihr andere erspart haben.
* [„Nach Rauch. Nach Blut.“ #fliesst]
    „Nach Rauch. Nach Blut. Und nach nassem Stein.“ Ihr Gesicht verzieht sich nicht; es kann es nicht. „Rauch“, wiederholt sie, und dann, als lege sie es behutsam neben die Blumen:„Und Blut. Danke. Die meisten haben mir etwas Schönes erzählt.“
// WARUM: Der Spieler schont sie und sucht in der Stadt etwas, das sich erzählen lässt; das Räucherwerk wird so ein zweites Mal Lore. Keine falsche Wahl; dass der süße Rauch die Bestien fernhalten soll, liest der Aufmerksame in ihrem „nicht nur schlimm“ mit.
* [„Nach den roten Lampen vor den Fenstern.“ #fliesst]
    „Nach den roten Lampen vor den Fenstern.“ Sie will wissen, was das für Lampen sind, und du erzählst ihr vom Räucherwerk, das hinter dem roten Glas glimmt, damit die Bestien an den Häusern vorbeigehen, und vom Rauch, der in die Gassen sinkt und sich in die Kleider setzt, bis man ihn nicht mehr bemerkt. Als sie fragt, wonach er riecht, suchst du lange und sagst dann: „Süß.“ Sie schließt die Augen, als könne sie es so riechen. „Süß“, wiederholt sie. „Dann ist es draußen nicht nur schlimm.“
- ->->

=== gehrman ===
// TITEL: Gehrman
// [KANON lore:figuren/gehrman] Früher Dialog (LK §18.1): einst Zuflucht und Werkstatt, in der Jäger Blut für ihre Waffen und ihr eigenes Fleisch nahmen; weniger Werkzeug als früher; alles darf man benutzen, geflüstert auch die Puppe; nicht zu viel nachdenken, jagen, man gewöhnt sich. Einst selbst Jäger. Dass er der erste war, ist in Kapitel 1 gesperrt (G4).
// [KANON lore:orte/jaegertraum] Werkstatt innen nach dem Artbook (LK §25.2): Kamin mit Feuer, Licht durch das Fenster, Flaschen, Kerzen, Tontöpfe mit Skelettfiguren; Gehrman mit grauem Haar, Hut, Schal, abgetragenem Mantel. Das Blatt beim Altar im hinteren Teil des Hauses (Notiz Nr. 3): Ziel der Nacht. Wortlaut eigen.
// [ERWEITERT] Das Feuer ohne Holz (einmal, mit Folge statt „von selbst“, Lektorat traum_hub 4); Gesprächsthemen als Lore-Quelle; der Vertrag und das Verlassen des Traums. Schlafreden nur als Laut und Frage, ohne die Gefangenschaft auszusprechen.
// Lektorat gehrman: Die Optionen sind eigene Rede des Jägers; die Fortsetzung nimmt sie hörbar auf (wie bei Gilbert und Gascoigne), dann seine Antwort oder sein Schweigen. Seine Pausen werden gezeigt (Feuer, Decke, Hände), nicht beschrieben.
{
- gehrman == 1 and gehrman_gesehen:
    In der Werkstatt riecht es nach Lampenöl, nach altem Leder und nach Papier, das zu lange am Feuer gelegen hat. An Haken hängen Werkzeuge, deren Namen du nicht kennst, auf einem Bord kauert in einem Tontopf eine kleine Gestalt aus Knochen, und im Kamin brennen zwei Scheite, obwohl du nirgends Holz liegen siehst. Davor sitzt der alte Mann vom Weg in seinem Rollstuhl, die Decke über den Knien, als hätte er sich seit dem Garten nicht gerührt. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Du schon wieder.“ Er sagt es zum Feuer hin. „Gehrman. Ich hätte mich draußen schon … vorstellen sollen. Aber wer gerade erst aufwacht, will keine Namen hören.“ Seine Hand beschreibt einen kleinen Bogen über die Borde, die Bank, die Töpfe. „Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- gehrman == 1:
    In der Werkstatt riecht es nach Lampenöl, nach altem Leder und nach Papier, das zu lange am Feuer gelegen hat. An den Wänden hängen Werkzeuge und Pläne, auf den Borden stehen Flaschen und Tontöpfe, und in einem der Töpfe kauert eine kleine Gestalt aus Knochen, die jemand mit großer Geduld zusammengesetzt hat. Durch das einzige Fenster fällt ein Streifen Licht schräg auf die Dielen, obwohl draußen nichts steht, von dem er kommen könnte. Vor dem Kamin, in dem zwei Scheite brennen und nirgends ein drittes bereitliegt, steht ein Rollstuhl, und darin sitzt ein alter Mann mit grauem Haar unter einem breitkrempigen Hut, einen Schal um den Hals und eine Decke über den Knien. Er dreht sich nicht um. # bild: werkstatt # stimmung: ruhig # lore: gehrman
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
    „Früher hat man hier Blut in den Stahl gegeben“, sagt er, „und in sich selbst. Ins eigene Fleisch.“ Er lässt das stehen. Im Kamin sinkt ein Scheit in die Glut und wird nicht kleiner. „Heute ist weniger da. Es reicht.“ Dann senkt er die Stimme, obwohl außer dir niemand da ist: „Die Puppe draußen … die steht dir auch zu. Wenn dir danach ist.“ Seine Augen bleiben dabei in den Flammen.
    Im hinteren Teil des Hauses, wo das Licht des Kamins nicht mehr hinreicht, steht ein Altar aus dunklem Holz, und darauf liegt unter einem Kerzenstumpf ein Blatt. Wer es beschrieb, drückte die Feder so fest auf, dass sich die Buchstaben durch das Papier drücken, und jeder kippt nach rechts, dem nächsten entgegen, als hätte die Hand nicht viel Zeit gehabt. # lore: ende_der_nacht
    „Aus diesem Traum kommt nur hinaus, wer der Seuche ihre Quelle verschließt. Bleibt die Quelle offen, bleibt die Nacht.“ # stil: tagebuch
    Ein Name steht nicht darunter.
}
-> training ->
- (thema)
// WARUM: Die erste, naheliegende Frage nach dem Ort. Öffnet die Lore des Traums (früher Zuflucht, jetzt ein Ort, an den man zurückkommt, ob man will oder nicht); kein Risiko.
* [„Was ist das für ein Ort?“ #fliesst]
    „Was ist das für ein Ort?“ Er lässt sich Zeit. „Ein Traum.“ Danach wartet er, als prüfe er, ob das Wort hält. „Früher eine Zuflucht. Hier haben Jäger geruht, solange die Jagd dauerte. Sich gerüstet. Sich erinnert.“ Er streicht die Decke über seinen Knien glatt, immer an derselben Stelle, wo der Stoff schon dünn geworden ist. „Man kommt hierher zurück. Ob man will oder nicht.“ # lore: jaegertraum
    -> thema
// WARUM: Der Spieler will hinaus; Gehrmans auswendig gelernte Antwort ist der Gegenpol zum Blatt am Altar (setzt `gehrman_nacht`) und öffnet die Nachfrage, wann die Nacht vorbei ist.
* [„Wie kommt man hier wieder hinaus?“ #fliesst]
    // [ERWEITERT] Seine Antwort als Meinung, nicht als Gesetz; Gegenpol zum Blatt am Altar.
    ~ gehrman_nacht = true
    „Wie kommt man hier wieder hinaus?“ Die Antwort kommt schnell, schneller als alles, was er bisher gesagt hat, und sie klingt wie auswendig gelernt: „Wenn die Nacht vorbei ist.“ Nach einer Weile setzt er hinzu: „So hat man es mir gesagt.“
    // WARUM: Nachhaken, wo er ausweicht. Er antwortet nicht; sein Schweigen und das geputzte, saubere Werkzeug sind die Antwort (Notiz nacht_ohne_ende). Kein Risiko.
    ** [„Und wann ist sie vorbei?“ #fliesst]
        ~ gehrman_wann = true
        „Und wann ist sie vorbei?“ Er sieht ins Feuer, dann auf die Decke über seinen Knien, dann wieder ins Feuer. Er antwortet nicht. Nach einer Weile nimmt er ein Werkzeug von der Bank, eine kleine Zange, und putzt sie mit einem Zipfel der Decke, sorgfältig, obwohl sie sauber ist. { altar_blatt: Hinter ihm, im dunklen Teil des Hauses, liegt das Blatt auf dem Altar, und er dreht sich nicht danach um. } # notiz: nacht_ohne_ende
    // WARUM: Den alten Mann schonen. Erspart ihm die Frage, die er fürchtet; seine Erleichterung zeigt dem Aufmerksamen, dass es eine solche Frage gibt.
    ** [Nicken und nicht weiterfragen #fliesst]
        Ein Nicken, mehr nicht, und er nickt zurück, ein wenig zu schnell, und die Hand, die eben noch die Lehne gehalten hat, lässt sie los.
    -- -> thema
// WARUM: Nur wer in der Klinik unterschrieben hat. Die Tinte an den Fingern macht den Vertrag sichtbar; Gehrman spricht von seinem eigenen Versprechen an einen Freund (setzt `gehrman_versprochen`, Saat für spätere Kapitel, Name gesperrt).
* {haltung_vertrag != ""} [„In der Klinik habe ich unterschrieben.“ #fliesst]
    // [KANON lore:figuren/gehrman] (LK §24.13) Er hat einem lieben Freund ein Versprechen gegeben; den Namen nicht nennen (gesperrt). Dass der Vertrag bindet, ist [DEUTUNG].
    ~ gehrman_versprochen = true
    „In der Klinik habe ich unterschrieben.“ Er fragt nicht, was darin stand. Er sieht auf deine Hände, auf die braune Tinte an deinen Fingerkuppen, und für einen Augenblick wird sein Mund schmal. „Jeder hier hat einmal etwas versprochen“, sagt er. „Ich auch. Einem Freund.“ Er sieht lange in die Glut. „Ich weiß noch, dass ich es versprochen habe.“ # notiz: vertrag_gehrman
    -> thema
// WARUM: Fragt nach der Herkunft der Jäger und bekommt Gehrmans eigene: Werkstattjäger mit Sägen vor den schwarzen Jägern der Kirche (setzt `gehrman_jaeger`). Lore für Leser, die Bloodborne nicht kennen; kein Risiko.
* [„Woher kommen die Jäger?“ #fliesst]
    // [KANON lore:fraktionen/jaeger] Werkstattjäger vor den Kirchenjägern. [KANON lore:gegenstaende/heilende-kirche] Die Jäger der Kirche tragen Schwarz (Black Church Set), dazu ihre Hämmer. G4: Er war einst Jäger; dass er der erste war, sagt er nicht.
    ~ gehrman_jaeger = true
    „Woher kommen die Jäger?“ Für einen Atemzug ist er nicht alt. Seine rechte Hand schließt sich um einen Griff, den es nicht gibt. „Ich war selbst einmal einer. Damals gab es nicht viele von uns. Ein paar habe ich angelernt, hier, an dieser Bank.“ Die Hand öffnet sich wieder. „Später hatte die Kirche ihre eigenen, in schwarzen Mänteln, mit schönen Hämmern.“ Er schnaubt, und es ist beinahe ein Lachen. „Wir hatten Sägen. Die taten, was sie sollten.“ # lore: gehrman
    -> thema
// WARUM: Rückfall für die Parade (sie kommt sonst immer von Gascoigne am Scheiterhaufen). Wer sie schon kann, erfährt etwas über die Kugeln, in die der Bote sein Blut gerieben hat.
* [Ihm die Feuerwaffe hinhalten #fliesst]
    { parade:
        // [KANON lore:gegenstaende/jaeger-und-werkstatt] Quecksilberkugeln, mit dem Blut des Trägers verschmolzen (LK §19); in Traum 1 reibt ein Bote den Tropfen aus deiner Fingerkuppe in die Kugel.
        Die Feuerwaffe hältst du ihm hin, den Kolben voran, aber er nimmt sie nicht. Er sieht auf deine Fingerkuppe, auf den kleinen Stich, den dir der Bote gesetzt hat. „Die haben dein Blut in die Kugeln gegeben“, sagt er. „Dann geh sparsam damit um.“ Er wendet sich wieder dem Feuer zu. „Mit beidem.“
    - else:
        Die Feuerwaffe hältst du ihm hin, und er schiebt sie mit zwei Fingern zur Seite. „Nicht zum Töten.“ Er beugt sich vor, und für drei Sätze ist seine Stimme eine für Höfe und Übungsplätze. „Wenn sie ausholt. Wenn ihr ganzes Gewicht im Schlag liegt. Dann schießt du, und sie wankt.“ Er lehnt sich zurück, und die Stimme ist wieder alt. „Den Rest macht die Säge.“ # lore: parade
        ~ parade = true
        ~ parade_quelle = "gehrman"
    }
    -> thema
// WARUM: Nur ab Einsicht 1, wenn der Spieler selbst fremde Erinnerungen gesehen hat. Gehrman gibt das Gerücht weiter, das Blut erinnere sich, und will es nicht wissen (setzt `gehrman_blut`).
* {einsicht >= 1} [„Ich sehe Dinge, die nicht meine sind.“ #fliesst]
    ~ gehrman_blut = true
    „Ich sehe Dinge, die nicht meine sind.“ Lange kommt keine Antwort, und als sie kommt, spricht er sie in seine gefalteten Hände hinein: „Man sagt, das Blut erinnert sich. Das haben Leute gesagt, die zu viel davon gesehen haben. Ob es stimmt …“ Er hebt die Schultern. „Ich habe es nie wissen wollen.“ # lore: blutgedaechtnis
    -> thema
// WARUM: Die gefährlichste Frage des Traums. Gehrmans Rat, nicht zu viel nachzudenken (Kanon, eigene Worte), und seine Hände an den Lehnen zeigen, dass er die Antwort fürchtet (setzt `gehrman_bestien`).
* [„Woher kommen die Bestien?“ #fliesst]
    // PRÜFEN erledigt (Lektorat gehrman 3): Der Rat, nicht zu viel nachzudenken, bleibt sinngemäß, der Wortlaut ist eigen; „man gewöhnt sich“ steht nur noch beim ersten Erwachen.
    ~ gehrman_bestien = true
    „Woher kommen die Bestien?“ Er antwortet nicht gleich. Seine Hände legen sich um die Lehnen des Rollstuhls und schließen sich, bis das Holz unter ihnen knackt. „Jag sie“, sagt er dann. „Wer zu lange fragt, woher sie kommen, fängt irgendwann an, es zu wissen.“ Er wendet sich dem Kamin zu, und die Hände bleiben, wo sie sind. # lore: bestienseuche
    -> thema
// WARUM: Das Gespräch beenden und in die Stadt zurückkehren. Immer möglich; was ungefragt bleibt, bleibt ungesagt.
+ [Dich zur Tür wenden #fliesst]
    Zur Tür. Hinter dir sagt Gehrman: „Gute Jagd.“ Er sagt es zum Feuer hin und dreht sich nicht um.
    ->->

=== training ===
// TITEL: Übung im Hof
// [KANON lore:figuren/gehrman, lore:figuren/gascoigne] Die Parade lernt man von Gehrman wie von Gascoigne. [ERWEITERT] Die Übung im Hof ist eine Szene, kein Menü: Sie öffnet gegen Gascoigne je eine Möglichkeit (`geuebt`).
// Ausgeschrieben 2026-11-06 aus dem Platzhalter (Ü10). Saat für n2_gascoigne, ohne die Optionen zu verraten: der Schwenkbalken am Pfahl (Ernte: „Die lange Axt vorn abfangen“, „geübt an einem Pfahl im Hof, der für dich ausholen musste“) und der Griff um die Handgelenke, den man zum Daumen hin bricht (Ernte: „Seine Klauen nach beiden Seiten aufbrechen“). [ERWEITERT] Hof, Pfahl mit Schwenkbalken und Sandsack (nach Art einer Quintane), die Kerben früherer Jäger, die Rinnen seiner Räder in den Dielen.
// Parade: Nach dem Umbau kommt sie immer von Gascoigne (docs/kapitel1-struktur.md, Abweichung 7); der Zweig „not parade“ bleibt als Rückfall.
~ geuebt = true
Gehrman rollt am Altar vorbei zur Hintertür, ohne den Kopf nach dem Blatt zu wenden, und stößt sie mit der Fußstütze seines Stuhls auf. „Komm“, sagt er. „Bevor du wieder hinausgehst, will ich sehen, wie du stehst.“ # lore: gehrman
Hinter dem Haus liegt ein Hof aus gestampfter Erde, nicht größer als eine Bauernstube; die weißen Blumen wachsen bis an seinen Rand und keinen Halm weiter. In der Mitte steht ein Pfahl, mannshoch und mit Leder umwickelt, und das Leder ist zerhauen, Kerbe über Kerbe, die alten schwarz, die jüngsten noch hell. Oben dreht sich auf einem Eisenzapfen ein Querbalken, und an seinem einen Ende hängt ein Sack voll Sand.
Gehrman hakt eine Stange hinter den Sack und zieht. Der Balken schwingt herum, schwerer, als er aussieht, und dein Körper tut, was jeder Körper tut: Er weicht zurück. Am Ende seines Weges holt der Sack dich ein und nimmt dir die Luft. „Zurück entkommst du ihm nicht“, sagt Gehrman, ohne die Stimme zu heben. „Er ist länger als dein Schritt. Stell dich davor. Die Säge quer, beide Hände, die Füße in den Boden.“
Er zieht wieder und wieder. Einmal schlägt dir der Balken die eigene Klinge gegen die Brust, einmal reißt er dich von den Füßen, und du liegst in der gestampften Erde und siehst über dir den leeren Himmel. Dann hält es. Der Stoß fährt dir durch die Unterarme bis in die Zähne, der Sand im Sack knirscht, und der Balken steht still, quer vor dir, auf deiner Klinge.
{ not parade:
    ~ parade = true
    ~ parade_quelle = "gehrman"
    Danach zieht er den Balken weit zurück und hält ihn dort, zum Schlag gespannt. „Wenn sie ausholen“, sagt er, „und ihr ganzes Gewicht im Schlag liegt, dann schießt du. Dann wanken sie, so wie der hier.“ Er lässt los, und dein Schuss trifft den Sack mitten im Schwung. # lore: parade
- else:
    Danach zieht er den Balken weit zurück und hält ihn dort, zum Schlag gespannt, und kaum lässt er los, hast du die Feuerwaffe schon in der Hand und den Schuss im Sack, genau in dem Augenblick, in dem er ausholt. Sand rinnt aus dem Loch. Gehrman sieht eine Weile auf den Sand und sagt nichts; dann nickt er. „Das hat dir schon einer beigebracht. Einer, der es kann.“
}
Zuletzt winkt er dich zu sich, bis du vor seinem Stuhl stehst, und nimmt deine Handgelenke. Die Haut seiner Hände ist dünn über den Knöcheln, fleckig vom Alter, und die Finger schließen sich um deine Gelenke wie geschmiedete Ringe. Du ziehst, und er hält. Du ziehst stärker, und er hält, ohne dass sich in seinem Gesicht etwas regt. „Nicht ziehen“, sagt er. „Wer packt, ist zum Daumen hin offen. Nach außen. Beide zugleich.“ Du drehst die Unterarme gegen seine Daumen, nach außen, mit einem Ruck, und seine Finger springen auf, und deine Hände sind frei.
Er reibt sich die Daumen. „Das behältst du“, sagt er. „Die Hände behalten so etwas länger als der Kopf.“
Danach sind deine Schultern müde und deine Hände ruhig. Drinnen rollt Gehrman an seinen Platz vor dem Kamin zurück, und die Räder finden in den Dielen zwei helle Rinnen, die sie in langen Jahren selbst gefahren haben.
->->
