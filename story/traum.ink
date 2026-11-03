// DER JÄGERTRAUM: Hub zwischen den Jagden. Gehrman, die Puppe, die Boten.
// [KANON] Traum als sicherer Ort, Rückkehr über Laternen, Puppe erwacht mit Einsicht. PRÜFEN: Einzelheiten.

=== traum_von_laterne ===
// TITEL: Laterne: in den Traum
~ leben = LEBEN_MAX
Du berührst die Laterne, und die Stadt verblasst wie ein Bild, auf das man zu lange gestarrt hat. # bild: traum # stimmung: ruhig
-> traum_hub

=== traum_erwachen ===
// TITEL: Erwachen nach dem Tod
# bild: traum # stimmung: ruhig
{ tode:
- 1: Du erwachst zwischen weißen Blumen, und es dauert lange, bis du begreifst, dass du nicht träumst. Du warst tot. Du weißt es so sicher, wie man weiß, dass man gefallen ist. Ein alter Mann im Rollstuhl, unter einem breitkrempigen Hut, sieht dich vom Weg aus an, ohne Überraschung. Der Traum lasse dich nicht sterben, sagt er sanft. Nur aufwachen. Gewöhn dich daran, junger Jäger. # lore: jaegertraum
- 2: Wieder die Blumen. Wieder das Erwachen, und diesmal ist das Erschrecken kleiner, und das erschreckt dich mehr als der Tod selbst. { puppe_wach: Die Puppe kniet neben dir und hält deine Hand, und ihre Finger sind kalt und glatt wie Porzellan. }
- else: {~Die Blumen kennen dich inzwischen. Du stehst auf, klopfst dir die Blütenblätter vom Mantel und versuchst, nicht daran zu denken, wie oft du das schon getan hast.|Du erwachst, und das Erste, was du tust, ist zählen. Du hast aufgehört zu wissen, wie oft. Das Zählen tröstet trotzdem.|Der Himmel des Traumes sieht auf dich herab, unverändert, gleichgültig. Du stehst auf. Natürlich stehst du auf.}
}
{ LIST_COUNT(gelernt) > 0: Im Halbschlaf, in dem Moment zwischen Tod und Erwachen, hast du es noch einmal gesehen: das, was dich getötet hat, die Bewegung davor, das winzige Zeichen. Diesmal wirst du es kommen sehen. # notiz: gelernt }
-> traum_hub

=== traum_hub ===
// TITEL: Jägertraum
~ ort = "traum"
~ ampulle = 1
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
{~Der Traum liegt still unter seinem elfenbeinfarbenen Himmel. Die Boten wimmeln zwischen den Grabsteinen.|Ein Wind, der nicht weht, bewegt die weißen Blumen. Das Haus auf dem Hügel ist erleuchtet.|Irgendwo im Traum läutet eine Glocke, einmal, ganz leise, und du bist nicht sicher, ob du sie wirklich gehört hast.}
Deine Blutampulle ist wieder gefüllt, als hätte sie nie gefehlt.
- (wahl)
+ {puppe_wach} [Mit der Puppe sprechen]
    { tode >= 2:
        Die Puppe sagt, sie habe gezählt, wie oft du zurückgekehrt bist. Sie wisse nicht, warum sie zähle. Aber jede Zahl mache ihr ein wenig mehr Angst, und sie wisse nicht, ob Puppen Angst haben dürfen.
    - else:
        Die Puppe fragt, wie die Jagd sei, und hört dir zu, als wäre jedes Wort neu für sie und kostbar. Sie habe nicht viel, sagt sie, außer zuhören. Und dem Garten. Und dir.
    }
    -> wahl
+ [Zu Gehrman in die Werkstatt] -> gehrman -> wahl
+ [Zum Bad der Boten] -> boten_laden -> wahl
+ [Zurück zur Laterne]
    Du berührst den Grabstein, und die Stadt kehrt zurück, Geruch zuerst, dann Geräusch, dann Kälte.
    -> laterne

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht (Recherche: sicher).
~ puppe_wach = true
Am Fuß der Treppe steht die Puppe, so wie sie immer stand. Aber als du an ihr vorbeigehst, bewegt sich etwas. Ein Lid. Dann der Kopf, langsam, mit einem kaum hörbaren Knirschen, wie altes Holz. Sie sieht dich an. Sie sieht dich wirklich an. # gedaechtnis: puppe_erwacht # stimmung: schoen
Dann spricht sie, mit einer Stimme, die sanft und klar ist und vollkommen menschlich, und das ist das Unheimlichste daran. Sie heißt dich willkommen, guter Jäger. Sie sei eine Puppe, sagt sie, hier, um für dich zu sorgen. Sie werde dich stärken, wenn du Echos bringst, sie werde da sein, wenn du zurückkehrst. Sie neigt den Kopf und hält ihn so, als warte sie darauf, dass du etwas erwiderst, und du weißt nicht, was man einer Puppe erwidert, die zu dir spricht wie zu einem Kind, das von einer langen Reise heimkehrt. # lore: puppe
Hinter ihr, vielleicht nur eine Täuschung des Lichts, siehst du für einen Moment Dinge auf den Grabsteinen sitzen, die vorher nicht da waren. Dann sind sie fort.
->->

=== gehrman ===
// TITEL: Gehrman
// [KANON] Gehrman, der erste Jäger, Berater im Traum. [ERWEITERT] Gesprächsthemen als Lore-Quelle.
{ gehrman == 1:
    In der Werkstatt riecht es nach Öl, Leder und altem Papier. An den Wänden hängen Waffen, Werkzeuge, Pläne, und überall stehen Gläser mit Dingen darin, die du nicht genauer ansehen willst. Im Rollstuhl am Kamin sitzt der alte Mann mit dem breitkrempigen Hut. Er heißt Gehrman, sagt er, und er sei hier, um neuen Jägern beizustehen, so gut er es eben noch könne. Er sei einmal selbst einer gewesen, der erste von allen. Es sei lange her. # bild: werkstatt # stimmung: ruhig
- else:
    Gehrman hebt den Kopf, als du eintrittst, und nickt dir zu wie einem alten Bekannten.
}
- (thema)
* [Was dieser Ort ist]
    Ein Traum, sagt Gehrman. Ein Zufluchtsort für Jäger, solange die Nacht dauert. Hier könne man ruhen, sich rüsten, sich erinnern. Er lächelt, und das Lächeln erreicht seine Augen nicht ganz. Man kehre hierher zurück, sagt er, ob man wolle oder nicht. # lore: jaegertraum
    -> thema
* [Wozu die Laternen dienen]
    Die Laternen, sagt er, verbinden die Stadt mit dem Traum. Wer eine entzünde, finde den Weg hierher zurück, und von hier wieder zu ihr. Er rät dir, jede zu entzünden, die du findest. Die Nacht in Yharnam sei lang, und die Wege darin noch länger. # lore: laternen
    -> thema
* [Wie man mit der Feuerwaffe kämpft]
    Nicht zum Töten, sagt er, und für einen Moment ist in seiner Stimme der alte Jäger zu hören. Ein Schuss im richtigen Augenblick, genau dann, wenn die Bestie ausholt und ihr ganzes Gewicht in den Schlag legt, bringe sie ins Wanken. Und eine wankende Bestie, sagt er, sei eine tote Bestie, wenn man schnell genug sei. # lore: parade
    ~ parade = true
    -> thema
* {einsicht >= 1} [Warum das Blut Bilder zeigt]
    Gehrman schweigt lange. Das Blut erinnere sich, sagt er schließlich, sehr leise, als spreche er nicht zu dir. Und manchmal teile es seine Erinnerungen mit dem, der es vergießt. Es sei kein Geschenk, sagt er. Es sei auch keine Strafe. Es sei einfach das, was Blut tue, wenn man ihm zu nahe komme. # lore: blutgedaechtnis
    -> thema
* [Woher die Bestien kommen]
    Er weicht aus. Die Jagd sei nicht dazu da, verstanden zu werden, sagt er. Sie sei dazu da, gejagt zu werden. Dann wendet er sich dem Kamin zu, und du weißt, dass das Gespräch beendet ist. Aber du hast gesehen, wie seine Hände sich um die Lehnen des Rollstuhls gekrampft haben. # lore: bestienseuche
    -> thema
+ [Gehen]
    Gehrman wünscht dir eine gute Jagd, mit dem Ton eines Mannes, der diesen Satz schon viel zu oft gesagt hat.
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
+ [Genug]
    Die Boten sinken zurück ins Wasser, enttäuscht oder gleichgültig, du kannst es nicht sagen.
    ->->
