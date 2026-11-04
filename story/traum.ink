// DER JÄGERTRAUM: Hub zwischen den Jagden. Gehrman, die Puppe, die Boten.
// [KANON] Traum als Zuflucht, Rückkehr über Laternen und Grabsteine, Puppe erwacht mit Einsicht, Gehrman bietet alles hier an, auch die Puppe.
// [DEUTUNG] Dass der Vertrag an den Traum bindet und Gehrman selbst gefangen ist: nur gezeigt (Tinte, Nadelstich, daheim, seine Hände), nie gesagt.
// Stimmen: Gehrman müde und warm, mit Pausen, ganz anders als der glatte Mann in der Klinik. Die Puppe förmlich, sanft, fragt nach der Welt draußen.

=== traum_von_laterne ===
// TITEL: Laterne: in den Traum
~ leben = LEBEN_MAX
Du berührst die Laterne, und die Stadt verblasst wie ein Bild, auf das man zu lange gestarrt hat. # bild: traum # stimmung: ruhig
-> traum_hub

=== traum_erwachen ===
// TITEL: Erwachen nach dem Tod
// tode zählt den unausweichlichen ersten Tod in der Klinik mit (k1_erwachen setzt 1).
# bild: traum # stimmung: ruhig
{ tode:
- 2:
    Du erwachst zwischen weißen Blumen, und es dauert lange, bis du begreifst, dass du nicht träumst. Du warst tot. Du weißt es so sicher, wie man weiß, dass man gefallen ist. In deiner Armbeuge sitzt ein neuer Schmerz, ein Stich, wie von einer Nadel, die eben erst herausgezogen wurde, und im Mund schmeckst du Eisen. # lore: jaegertraum
    { gehrman:
        Gehrman sitzt am Weg in seinem Rollstuhl und nickt dir zu, ohne Überraschung, wie man jemandem zunickt, der vom Brunnen zurückkommt.
    - else:
        ~ gehrman_gesehen = true
        Ein alter Mann im Rollstuhl, unter einem breitkrempigen Hut, sieht dich vom Weg aus an, ohne Überraschung. „Sterben“, sagt er, und macht eine Pause, als suche er ein freundlicheres Wort. „Sterben kannst du hier nicht. Nur aufwachen. Man gewöhnt sich daran. Mehr oder weniger.“ # lore: gehrman
    }
- 3:
    Wieder die Blumen. Wieder das Erwachen. Diesmal zittern deine Hände nicht einmal mehr, und du siehst lange auf sie hinunter. Die braune Tinte an deinen Fingerkuppen ist noch da. Du bist gestorben, und sie ist noch da.
    { puppe_wach: Die Puppe kniet neben dir und hält deine Hand, und ihre Finger sind kalt und glatt wie Porzellan. „Hier passiert dir nichts“, sagt sie leise. „Hier ist es …“ Sie sucht nach dem Wort, als liege es irgendwo im Gras. „Daheim.“ Unter deinem Brustbein zieht sich etwas zusammen. }
- else:
    {~Die Blumen kennen dich inzwischen. Du stehst auf, klopfst dir die Blütenblätter vom Mantel und versuchst, nicht daran zu denken, wie oft du das schon getan hast.|Du erwachst, und das Erste, was du tust, ist zählen. Du hast aufgehört zu wissen, wie oft. Das Zählen hilft trotzdem.|Der Himmel des Traumes liegt über dir, unverändert, gleichgültig. Du stehst auf. Natürlich stehst du auf.}
    { gehrman: {~Gehrman sieht dich kommen und sagt nichts. Seine Finger trommeln einmal auf die Lehne.|„Wieder da“, sagt Gehrman. Nicht freundlich, nicht unfreundlich. Wie man das Wetter feststellt.|Gehrman hebt die Hand, als wolle er etwas sagen, und lässt sie wieder sinken.} }
}
{ neu_gelernt: Im Halbschlaf, in dem Moment zwischen Tod und Erwachen, hast du es noch einmal gesehen: das, was dich getötet hat, die Bewegung davor, das winzige Zeichen. Es hat sich eingebrannt wie ein Bild, das man zu lange angesehen hat. # notiz: gelernt }
-> traum_hub

=== traum_hub ===
// TITEL: Jägertraum
~ ort = "traum"
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
{~Der Traum liegt still unter seinem elfenbeinfarbenen Himmel. Die Boten wimmeln zwischen den Grabsteinen.|Ein Wind, der nicht weht, bewegt die weißen Blumen. Das Haus auf dem Hügel ist erleuchtet.|Irgendwo im Traum läutet eine Glocke, einmal, ganz leise, und du bist nicht sicher, ob du sie wirklich gehört hast.}
{ einsicht >= 2: {Auf den Grabsteinen am Rand des Gartens sitzt etwas. Es geht nicht mehr weg, wenn du blinzelst.|Die Dinge auf den Grabsteinen sind noch da.|} }
{ ampulle == 0: Deine Blutampulle ist wieder gefüllt, als hätte sie nie gefehlt. }
~ ampulle = 1
- (wahl)
+ {puppe_wach} [Mit der Puppe sprechen] -> puppe_gespraech -> wahl
+ {k1_laterne_zentral} [Zu Gehrman in die Werkstatt] -> gehrman -> wahl
+ {not k1_laterne_zentral} [Zum Haus auf dem Hügel]
    Die Tür ist verschlossen. Durch das Fenster siehst du einen Kamin, in dem ein Feuer brennt, das niemand angezündet hat.
    -> wahl
+ {puppe_wach and staerke < 2} [Der Puppe Echos bringen ({staerke == 0:5|8} Echos)] -> puppe_staerken -> wahl
+ [Zum Bad der Boten] -> boten_laden -> wahl
+ [Zurück zur Laterne]
    Du berührst den Grabstein, und die Stadt kehrt zurück, Geruch zuerst, dann Geräusch, dann Kälte.
    -> laterne
+ {k1_laterne_zentral and laterne != -> k1_hub_b} [Zur Laterne vor der Klinik]
    ~ laterne = -> k1_hub_b
    Du berührst den Grabstein, und Zentral-Yharnam kehrt zurück, Räucherwerk zuerst, dann die Glocken.
    -> k1_hub_b
+ {bruecke_laterne and laterne != -> k1_hub_c} [Zur Laterne an der Brücke]
    ~ laterne = -> k1_hub_c
    Du berührst den Grabstein, und die Brücke kehrt zurück, der Wind zuerst, dann das Rauschen der Unterstadt.
    -> k1_hub_c

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht (Recherche: sicher). Inhalt sinngemäß, Wortlaut eigen.
~ puppe_wach = true
Am Fuß der Treppe steht die Puppe, so wie sie immer stand. Aber als du an ihr vorbeigehst, bewegt sich etwas. Ein Lid. Dann der Kopf, langsam, mit einem kaum hörbaren Knirschen, wie altes Holz. Sie sieht dich an. Sie sieht dich wirklich an. # gedaechtnis: puppe_erwacht # stimmung: schoen
„Oh“, sagt sie. „Du siehst mich.“ Ihre Stimme ist sanft und klar, und zwischen ihren Sätzen atmet sie nicht. „Man hat mich in diesen Garten gestellt, damit jemand auf dich achtgibt. Ich habe sehr lange gewartet, dass jemand kommt, auf den man achtgeben kann.“ Sie neigt den Kopf und hält ihn so, wartend. Du hast diese Stimme schon einmal gehört, ganz nah an deinem Ohr, und du weißt nicht mehr, wo. # lore: puppe
Hinter ihr, vielleicht nur eine Täuschung des Lichts, sitzen Dinge auf den Grabsteinen, die vorher nicht da waren. Dann sind sie fort.
->->

=== puppe_gespraech ===
// TITEL: Gespräch mit der Puppe
// [KANON] Die Puppe nennt die Boten die Kleinen; sie finden Jäger und dienen ihnen. [ERWEITERT] Ihre Fragen nach der Stadt, ihr Zählen.
{ stopping:
- Die Puppe sieht zu den Boten hinüber, die zwischen den Blumen wühlen. „Die Kleinen“, sagt sie, und es klingt zärtlich. „Sie haben dich zuerst gesehen, lange vor mir. Sie graben nach Leuten wie dir, so wie andere nach Wurzeln graben. Dich haben sie ausgegraben.“ Sie legt den Kopf schief. „Du hast sie schon gekannt, nicht wahr? Von vorher?“ # lore: boten
- -> frage
- { tode >= 3:
        „Ich habe gezählt, wie oft du zurückgekehrt bist“, sagt sie. „Ich weiß nicht, warum ich zähle. Aber bei jeder Zahl wird mir die nächste schwerer.“ Ihre Finger liegen still in ihrem Schoß, und sie sieht nicht auf.
    - else:
        Sie fragt, wie die Jagd ist, und hört zu, als wäre jedes Wort neu für sie. Als du fertig bist, wiederholt sie eines davon, leise, um es sich zu merken: Brunnenplatz.
    }
}
->->

= frage
„Darf ich dich etwas fragen? Wie riecht es draußen? Ich habe nur Blumen.“
* [Ihr die Wahrheit sagen: Rauch, Blut, nasser Stein]
    Du sagst es ihr. Sie hört zu, ohne das Gesicht zu verziehen. „Rauch“, wiederholt sie. „Und Blut. Danke. Ich wollte es wissen, wie es ist, nicht wie es sein sollte.“
* [Ihr vom Räucherwerk erzählen, süß und schwer]
    Du erzählst ihr vom Räucherwerk in den roten Lampen. Sie schließt die Augen, als könne sie es so riechen. „Süß“, sagt sie. „Dann ist es draußen nicht nur schlimm.“
- ->->

=== puppe_staerken ===
// TITEL: Die Puppe stärkt dich
// [KANON] Die Puppe verwandelt Blutechos in Stärke. [ERWEITERT] Hier erzählt statt in Zahlen: jede Stärkung öffnet in bestimmten Kämpfen eine Möglichkeit.
~ temp preis = 5
{ staerke == 1:
    ~ preis = 8
}
{ echos < preis:
    Die Puppe sieht dich an und schüttelt sanft den Kopf. „Es ist noch zu wenig“, sagt sie. „Bring mir mehr von dem, was aus ihnen aufsteigt. Ich warte.“
    ->->
}
~ echos = echos - preis
~ staerke = staerke + 1
„Halt still.“ Sie legt dir eine Hand auf die Brust, kühl und glatt. Etwas verlässt dich, ein Schimmer, der aus deiner Haut steigt und in ihre Finger fließt, und kommt verwandelt zurück, schwerer, wärmer, wie Blei, das in deine Arme sinkt und dort bleibt. # klang: echos # notiz: staerke
{ staerke == 1: Als du die Augen öffnest, sind deine Hände ruhiger als seit Wochen. Du könntest etwas Schweres halten, das sich nicht halten lassen will. }
{ staerke == 2: Diesmal bleibt die Wärme in deinen Schultern. Du denkst an Klauen, die sich um dich schließen, und daran, dass man sie aufbrechen könnte. }
„Mehr kann ich nicht für dich tun“, sagt sie. „Noch nicht.“
->->

=== gehrman ===
// TITEL: Gehrman
// [KANON] Gehrman, der erste Jäger, Berater im Traum; bietet sinngemäß alles hier an, auch die Puppe. Schlafreden (Inhalt hier eigen, nur angedeutet).
// [ERWEITERT] Gesprächsthemen als Lore-Quelle; der Vertrag und das Verlassen des Traums.
{
- gehrman == 1 and gehrman_gesehen:
    In der Werkstatt riecht es nach Öl, Leder und altem Papier. Am Kamin sitzt der alte Mann vom Weg in seinem Rollstuhl, eine Decke über den Knien. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Du schon wieder.“ Es klingt nicht unfreundlich. „Gehrman. Ich hätte mich draußen vorstellen sollen, aber da sieht man die Leute selten gern an.“ Er macht eine kleine Bewegung mit der Hand, die die ganze Werkstatt umfasst. „Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“
- gehrman == 1:
    In der Werkstatt riecht es nach Öl, Leder und altem Papier. An den Wänden hängen Waffen, Werkzeuge, Pläne, und überall stehen Gläser mit Dingen darin, die du nicht genauer ansehen willst. Im Rollstuhl am Kamin sitzt ein alter Mann mit einem breitkrempigen Hut, eine Decke über den Knien. # bild: werkstatt # stimmung: ruhig # lore: gehrman
    „Da kommt jemand. Setz dich, wenn du magst. Oder bleib stehen, das tun die meisten.“ Seine Stimme ist warm und müde und macht Pausen, wo man keine erwartet. „Gehrman. Ich helfe euch, so gut ich … noch kann. Bedien dich. Frag nicht lange. Das hier war einmal für Leute wie dich gedacht.“ Er nickt zur Tür hinaus, dorthin, wo die Puppe steht, so wie man auf ein Möbelstück zeigt, das mit zum Haus gehört.
- else:
    { gehrman >= 4 and gehrman % 4 == 0:
        Gehrman schläft. Der Kopf ist ihm auf die Brust gesunken, der Hut sitzt schief, und seine Lippen bewegen sich. Er murmelt einen Namen, den du nicht verstehst, und dann, ganz deutlich, im Ton eines Kindes, das um etwas bittet: „Lasst mich gehen.“ Du wartest. Er wacht nicht auf. # notiz: gehrman_schlaf
        ->->
    }
    Gehrman hebt den Kopf, als du eintrittst, und nickt dir zu wie einem alten Bekannten.
}
- (thema)
* [Was dieser Ort ist]
    ~ gehrman_nacht = true
    „Ein Traum.“ Er lässt das Wort stehen. „Ein Ort, an dem Jäger ruhen, solange die Jagd dauert. Sich rüsten. Sich erinnern.“ Er zieht die Decke über seinen Knien glatt, obwohl sie glatt ist. „Man kommt hierher zurück. Ob man will oder nicht.“ # lore: jaegertraum
    -> thema
* [Wie man den Traum verlässt]
    // [ERWEITERT] Seine Antwort als Meinung, nicht als Gesetz.
    ~ gehrman_nacht = true
    „Wenn die Nacht vorbei ist.“ Er sagt es schnell, wie etwas Auswendiggelerntes. „So hat man es mir gesagt.“
    ** [Und wann ist sie vorbei?]
        Er sieht lange ins Feuer. Dann auf die Decke über seinen Knien. Dann wieder ins Feuer. Er antwortet nicht. Nach einer Weile nimmt er ein Werkzeug von der Bank und beginnt, es zu putzen, sorgfältig, als hätte er dich vergessen. # notiz: nacht_ohne_ende
    ** [Es dabei belassen]
        Du belässt es dabei. Er wirkt erleichtert.
    -- -> thema
* {haltung_vertrag != ""} [Den Vertrag in der Klinik erwähnen]
    // [ERWEITERT] Keine Erklärung; dass der Vertrag bindet, ist [DEUTUNG].
    Er fragt nicht, was darin stand. Er sieht auf deine Hände, auf die braune Tinte an deinen Fingerkuppen, und für einen Augenblick wird sein Mund schmal. „Jeder hier hat irgendwann irgendwas unterschrieben“, sagt er. „Ich weiß nicht mehr, was ich unterschrieben habe. Ich weiß nur noch, dass ich es getan habe.“ # notiz: vertrag_gehrman
    -> thema
* [Wer die Jäger macht]
    ~ gehrman_jaeger = true
    „Ich habe Jäger gemacht“, sagt er, und für einen Atemzug ist er nicht alt. „Lange bevor die Kirche welche hatte. Mit ihren weißen Mänteln und ihren schönen Hämmern.“ Er lacht, kurz. „Wir hatten Sägen. Die taten, was sie sollten.“ # lore: gehrman
    -> thema
* [Wie man mit der Feuerwaffe kämpft]
    { parade:
        „Das weißt du schon, sehe ich.“ Er betrachtet, wie du die Waffe hältst. „Dann hat es dir einer gezeigt, der es kann. Gut. Mehr kann ich dir auch nicht sagen.“
    - else:
        „Nicht zum Töten.“ Für einen Moment ist in seiner Stimme der alte Jäger. „Ein Schuss, genau dann, wenn die Bestie ausholt und ihr ganzes Gewicht in den Schlag legt. Dann wankt sie. Und eine wankende Bestie ist eine tote Bestie, wenn man schnell genug ist.“ # lore: parade
        ~ parade = true
        ~ parade_quelle = "gehrman"
    }
    -> thema
* {einsicht >= 1} [Warum das Blut Bilder zeigt]
    ~ gehrman_blut = true
    Gehrman schweigt lange. „Man sagt, das Blut erinnert sich“, sagt er schließlich, sehr leise. „Das haben Leute gesagt, die zu viel Blut gesehen haben. Ob es stimmt …“ Er hebt die Schultern. „Ich habe es nie wissen wollen.“ # lore: blutgedaechtnis
    -> thema
* [Woher die Bestien kommen]
    Er antwortet nicht gleich. Seine Hände legen sich um die Lehnen des Rollstuhls und schließen sich, bis die Knöchel weiß werden. „Jag sie“, sagt er dann. „Das andere hilft dir nicht.“ Er wendet sich dem Kamin zu. # lore: bestienseuche
    -> thema
+ [Gehen]
    „Gute Jagd“, sagt Gehrman, in dem Ton eines Mannes, der diesen Satz schon viel zu oft gesagt hat.
    ->->

=== boten_laden ===
// TITEL: Bad der Boten
// [KANON] Die Boten verkaufen gegen Blutechos. PRÜFEN: welche Waren im ersten Abschnitt.
- (wahl)
In einem steinernen Becken voller trüben Wassers hocken Boten, dicht gedrängt, und einer von ihnen trägt einen winzigen, zerbeulten Hut. Sie heben ihre kleinen grauen Hände, wenn du näher kommst, und in ihren Gesichtern aus nassem Ton ist so etwas wie Erwartung. Du hast {echos} Echos. # lore: boten
+ {echos >= 3 and molotow < 3} [Molotow kaufen (3 Echos)]
    ~ echos = echos - 3
    ~ molotow = molotow + 1
    Ein Bote reicht dir eine Flasche mit Öl und einem Lappen im Hals. Er hält sie einen Moment zu lange fest, bevor er loslässt.
    -> wahl
+ {echos >= 1 and kiesel < 3} [Kieselstein kaufen (1 Echo)]
    ~ echos = echos - 1
    ~ kiesel = kiesel + 1
    Ein glatter, grauer Kiesel, kühl in der Hand. Etwas, um Lärm zu machen, wo man selbst nicht sein will.
    -> wahl
// [ERWEITERT] Wissen und Kleidung (Entscheidung des Nutzers 2026-11-04): Was die Boten anbieten, haben sie Toten abgenommen.
+ {echos >= 3 and not jagdnotizen} [Jagdnotizen eines Toten kaufen (3 Echos)]
    ~ echos = echos - 3
    ~ jagdnotizen = true
    ~ gelernt += (wurf, ansturm, axt_wirbel)
    Ein Heft mit gewellten Seiten, das einmal nass geworden ist. Ein Jäger hat darin gezeichnet, was ihn beinahe umgebracht hat, mit Bleistift und mit Pfeilen: ein Arm, der eine Kutsche über die Schulter hebt. Ein Geweih, gesenkt, und daneben das Wort „spät“, dreimal unterstrichen. Ein Mann mit erhobener Axt, und darunter die Ziffern eins, zwei, drei, die Drei eingekreist. Die letzte Seite ist leer bis auf einen braunen Daumenabdruck. # notiz: jagdnotizen
    -> wahl
+ {echos >= 2 and not kirchenbrief} [Einen Brief mit Kirchensiegel kaufen (2 Echos)]
    ~ echos = echos - 2
    ~ kirchenbrief = true
    // [KANON] Die Oedon-Kapelle ist im Kathedralbezirk Zuflucht für Überlebende; eine Vikarin der Kirche. [ERWEITERT] Der Brief, der Schreiber, die Glocken.
    Das Siegel ist gebrochen, der Brief schon gelesen, von wem auch immer. Ein Kirchendiener schreibt an seine Schwester, in einer kleinen, sorgfältigen Hand. In der Kapelle oben im Bezirk nehme man jetzt jeden auf, der an die Tür klopfe und noch sprechen könne. Die Vikarin bete jede Nacht am längsten von allen, und manchmal, wenn sie glaube, allein zu sein, weine sie dabei. Er solle die Glocken läuten, auch wenn niemand komme. Das Letzte ist ausgestrichen, so fest, dass die Feder das Papier zerrissen hat. # notiz: kirchenbrief
    -> wahl
+ {echos >= 3 and not mantel} [Einen Jägermantel kaufen (3 Echos)]
    ~ echos = echos - 3
    ~ mantel = true
    // [ERWEITERT] Wendel, ein erfundener Jäger. Saat für Kapitel 2: Wer ihn zuletzt gesehen hat.
    Zwei Boten ziehen ihn gemeinsam aus dem Wasser, einen langen Mantel aus geöltem Leder, schwer wie ein nasser Hund. Er riecht nach Teer, nach Pulver und nach einem Menschen, der nicht du bist. Am Saum fehlt ein Stück, glatt abgetrennt. Innen, ins Futter gestickt, mit rotem Garn und ungeschickten Stichen, steht ein Name: Wendel. # notiz: mantel_wendel
    -> wahl
+ [Genug]
    Die Boten sinken zurück ins Wasser, enttäuscht oder gleichgültig, du kannst es nicht sagen.
    ->->
