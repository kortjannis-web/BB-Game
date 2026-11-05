// KAPITEL 1, TEIL B: ZENTRAL-YHARNAM. Freie Reihenfolge. Führt zu NADELÖHR 1 (Brücke).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt b_yharnam und Übergreifend 2b, 4, 10):
// Ortsbilder in Stimme A, Geschehen in B, alles von der Kirche in C. Alle Optionen fließen in den Satz (#fliesst).
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen nach der Wahl beginnen mit dem, was geschieht;
// keine christlichen Formeln; die Sonne als nicht wandernder Schatten; der Choral ohne Kommentar; die Spieluhr mit ihrer Lücke; Gascoignes Geruch am Platz nur leise.
// Rede: Figuren sprechen in direkter Rede mit eigener Stimme (siehe hpl-horror, references/bb-game.md).
// Lore: lore/kern.md, lore/kapitel/kapitel1.md (Wissenssperre), lore/orte/zentral-yharnam.md, lore/welt/aussehen.md und die Figurendateien je Szene.

// --- Merker dieses Teils (neu 2026-11-05; Notizbuch und andere Teile lesen sie) ---
VAR gilbert_jagd = false      // Gilbert hat von der Jagdnacht und den verriegelten Türen erzählt
VAR gilbert_kleriker = false  // Gilbert hat das Gerücht erzählt, aus Kirchenleuten würden die schlimmsten Bestien (für n1_kleriker, beute)
VAR frau_betet = false        // an der Tür der Betenden gelauscht (Violas Spur)
VAR haus_zettel = false       // im dunklen Haus den Zettel über die gesperrte Brücke gefunden
VAR tuer_stimme = 0           // wie viele weitere Stimmen hinter den Türen gehört (0 bis 3)
VAR hb_fackel = false         // Wiederkehrtext nach Marthas Tod gezeigt
VAR hb_glocke = false         // Wiederkehrtext nach den Gräbern gezeigt
VAR hb_uhr = false            // Wiederkehrtext mit der Spieluhr in der Tasche gezeigt
VAR hb_schrei = false         // Wiederkehrtext nach dem zweiten Kreischen gezeigt
VAR hb_bruecke = false        // Wiederkehrtext mit dem Blick auf die dunkle Brücke gezeigt

=== k1_hub_b ===
// TITEL: Zentral-Yharnam (frei)
// [KANON lore:orte/zentral-yharnam] Särge in den Gassen, Gaslaternen, Hunde in Käfigen (Artbook, LK §25.1, §25.4; gegner/hunde.md).
// Wiederkehr (Faktencheck Übergreifend 4): je Besuch höchstens ein Satz, der zeigt, was sich seit dem letzten Mal verändert hat; Zufallssätze nur als Rest.
// [ERWEITERT] Die Sonne, die nicht sinkt (L6): hier als Schatten des Laternenpfahls, der nicht wandert.
-> betreten("zentral") ->
{ k1_hub_b == 1:
    Yharnam ist eine Stadt aus Treppen. Sie steigen und fallen zwischen Häusern, deren Giebel sich so weit über die Gassen neigen, dass zwischen ihnen nur ein Streifen Himmel bleibt, und über den Dächern steht ein Rauch, der sich nicht verzieht. Irgendwo läuten Glocken, unregelmäßig, als zöge niemand an den Seilen. Unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht # klang: glocke
    An den Hauswänden lehnen Särge, aufrecht, mit Ketten an die eisernen Ringe geschlossen, an denen man sonst die Pferde festmacht, als sollte aus ihnen nichts mehr herauskommen. Gleich neben deiner Laterne steht eine Haustür offen, die einzige in der ganzen Straße, und gleich hinter ihrer Schwelle fängt das Dunkel an.
    Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt, an manchen Häusern drei oder vier übereinander, an einem ein ganzes Dutzend, so dicht, dass das Fenster dahinter verschwindet. Der Geruch ist süß und schwer und legt sich dir auf die Zunge wie ein Tuch auf ein Gesicht. # lore: raeucherwerk
    Hinter den Fenstern brennt kein Licht als das rote, die Riegel sind vorgeschoben, und auf der ganzen Straße bist du der Einzige, der nicht weiß, worauf alle warten.
- else:
    {
    - mob_verbrannt and not hb_fackel:
        ~ hb_fackel = true
        Vor einer Tür an der Ecke zum Markt liegt eine verkohlte Fackel, sorgsam quer über die Schwelle gelegt. Die Läden der Bäckerei daneben sind geschlossen, um die Klinke hat jemand ein schwarzes Tuch gebunden, und aus der Ritze unter der Tür riecht es nach kaltem Ofen und nach Kümmel.
    - gascoigne2 and not hb_glocke:
        ~ hb_glocke = true
        Irgendwo im Osten schlägt eine Glocke an und hört nicht wieder auf, ein einzelner Ton, immer derselbe, in einem Abstand, in dem man einatmen könnte. Deine Lippen zählen die Schläge mit, das tun sie seit den Gräbern, und du merkst es erst beim elften.
    - spieluhr and not hb_uhr:
        ~ hb_uhr = true
        Die Spieluhr in deiner Tasche klickt bei jedem Schritt gegen einen Knopf deines Mantels, und du legst die Hand darauf, damit sie still ist, und lässt sie dort.
    - haus_zettel and not hb_bruecke:
        ~ hb_bruecke = true
        Von der Ecke an der Laterne sieht man zwischen zwei Giebeln ein Stück der großen Brücke, einen schwarzen Bogen gegen den Rauch, und auf ihrer ganzen Länge brennt nicht ein Licht. Der Zettel aus dem dunklen Haus knistert in deiner Tasche. # lore: kirche_sperrt_bruecke
    - schreie == 2 and not hb_schrei:
        ~ hb_schrei = true
        Die alte Stimme, die vorhin hinter einer Tür zu beten begann, betet noch immer. Sie ist heiser geworden, aber den Faden hat sie nicht verloren.
    - else:
        {~Die Straßen glänzen nass im Licht der Laterne, und der Rauch über den Dächern hängt dort, wo er vorhin hing.|In einem Käfig an der Ecke wirft sich ein Hund gegen die Stäbe, einmal, zweimal, und hört mitten im Bellen auf. Warum, hast du nicht gesehen.|Eine Glocke schlägt, dann eine zweite, und danach hörst du nur noch dein eigenes Blut in den Ohren.|In einer fernen Straße ziehen Fackeln vorbei, und jemand singt dazu ein Lied, das wie ein Kinderlied klingt und keines ist.|Der Schatten des Laternenpfahls liegt über derselben Fuge im Pflaster wie bei deiner Ankunft, auf den Fingerbreit genau, und über den Giebeln ist die rote Sonne nicht von der Stelle gerückt.}
    }
}
// Das Kreischen der Kleriker-Bestie, zweimal, bevor man ihr begegnet: beim ersten Zurückkommen und beim vierten Mal.
{ kleriker == "" and ((schreie == 0 and k1_hub_b >= 2) or (schreie == 1 and k1_hub_b >= 4)):
    -> schrei ->
}
- (wohin)
+ [{not k1_b_gilbert:Hinüber zu dem vergitterten Fenster|Zu Gilbert ans Gitter} #fliesst]
    {not k1_b_gilbert:Hinüber zum Fenster sind es nur ein paar Schritte über nasses Pflaster.|Zu Gilbert ans Gitter, und schon von Weitem hörst du ihn husten.}
    -> k1_b_gilbert
+ [In die Gasse mit den Räucherlampen #fliesst]
    {not k1_b_tueren:In die Gasse mit den Räucherlampen führen sieben Stufen hinab, in der Mitte zu Mulden ausgetreten.|In die Gasse mit den Räucherlampen, die sieben ausgetretenen Stufen hinab, und unten schlägt dir der rote Rauch entgegen.}
    -> k1_b_tueren
+ {not k1_b_anschlag} [Zu der schmalen Kapelle hinab #fliesst]
    Zu der schmalen Kapelle führen drei Stufen hinab, glatt getreten von vielen Füßen, die nicht mehr kommen.
    -> k1_b_anschlag
+ [Dem Rauch nach die Hauptstraße hinauf #fliesst]
    {not k1_b_scheiterhaufen:Dem Rauch nach die Hauptstraße hinauf, und mit jedem Schritt wird der Geruch fetter.|Dem Rauch nach die Hauptstraße hinauf, zurück zu dem Platz, und der Geruch erwartet dich schon an der ersten Ecke.}
    -> k1_b_scheiterhaufen
+ [{spieluhr or maedchen_wo == "fort":Zum Brunnenplatz hinter dem Tor|Zum Brunnenplatz, der Spieluhr nach} #fliesst]
    {spieluhr or maedchen_wo == "fort":Zum Brunnenplatz, durch das Tor in der Mauer. Diesmal spielt dort keine Melodie.|Zum Brunnenplatz führt dich eine Melodie, so leise, dass du zweimal stehen bleibst, um sicher zu sein, und dann durch ein Tor in der Mauer.}
    -> k1_b_maedchen
+ [In die Gasse unter den Dächern #fliesst]
    {not k1_b_daecher:In die Gasse unter den Dächern, und mit dem ersten Schritt wird es eng.|In die Gasse unter den Dächern noch einmal, den Blick schon oben an den Kanten.}
    -> k1_b_daecher
+ [Zu den Dachbalken über dem Kanaleingang #fliesst]
    {eileen_stufe == 0:Zu den Dachbalken über dem Kanaleingang führen eiserne Krampen in der Mauer hinauf, kalt und rau vom Rost.|Zu den Dachbalken über dem Kanaleingang noch einmal die rostigen Krampen hinauf.}
    -> k1_b_eileen
+ {not haus_zettel} [In das dunkle Haus mit der offenen Tür #fliesst]
    {not k1_b_haus:In das dunkle Haus mit der offenen Tür, und unter dem ersten Schritt knarrt die Schwelle so laut, dass du stehen bleibst und horchst.|In das dunkle Haus noch einmal, und die Schwelle knarrt wie beim ersten Mal.}
    -> k1_b_haus
+ {kanal_leiter} [Durch die Kanäle hinab in die Unterstadt #fliesst]
    Durch die Kanäle hinab, Sprosse um Sprosse die Leiter entlang, die du schon kennst, bis unten das Rauschen dich wieder aufnimmt.
    -> k1_hub_c
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wohin
+ [An die Laterne treten #fliesst]
    An die Laterne, an das kleine, schiefe Licht vor der Klinik, und die Flamme darin beugt sich zu dir hin, als du näher kommst.
    ~ laterne = -> k1_hub_b
    -> traum_von_laterne
+ {kleriker != "besiegt"} [Hinauf zur großen Brücke #fliesst]
    {not k1_n1_kleriker:Hinauf zur großen Brücke führt eine Straße, die mit jedem Schritt breiter und leerer wird, bis an den Fenstern keine Räucherlampe mehr hängt.|Hinauf zur großen Brücke noch einmal. Die letzte Räucherlampe bleibt hinter dir zurück, und dann ist nur noch Wind.}
    ~ bruecke_von = "oben"
    -> k1_n1_kleriker
+ {kleriker == "besiegt"} [Über die große Brücke hinab #fliesst]
    Über die große Brücke, vorbei an dem, was auf ihr liegt. Fortgeräumt hat es niemand.
    ~ bruecke_von = "oben"
    -> k1_n1_kleriker

=== schrei ===
// TITEL: Kreischen von der Brücke
~ schreie = schreie + 1
{ schreie:
- 1: Von weit her, aus der Richtung, in der die Stadt über eine Brücke zur Kathedrale hinaufsteigt, kommt ein Laut. Ein Kreischen, das länger dauert, als ein Mensch Atem hat, und noch immer nicht abreißt, bis dir selbst die Luft knapp wird und du merkst, dass du sie angehalten hast. Hinter einem Fenster löscht jemand hastig eine Kerze, und das rote Räucherlicht davor brennt allein weiter. # klang: kleriker_schrei # stimmung: grauen
- 2: Wieder das Kreischen, und diesmal näher. Ein Wort steckt darin, oder was von einem Wort übrig bleibt, wenn man es lange genug zieht und zerreißt; du hörst es zweimal und könntest beim dritten Mal nicht mehr sagen, welches. Hinter einer Tür beginnt eine alte Stimme zu beten, schnell und tonlos, und hört nicht mehr auf. # klang: kleriker_schrei # stimmung: grauen
}
->->

=== k1_b_gilbert ===
// TITEL: Gilbert
// Handgearbeitet 2026-11-04 nach docs/stimme.md: Ortsbild in Stimme A, Begegnung in Stimme B. Optionen fließen in den Satz (#fliesst).
// 2026-11-05 nur die Befunde des Faktenchecks: Gilbert sitzt (kann nicht aufstehen), Jagdnacht als Gelegenheit und der Osten des Tals, Ludwigs Silberschwert statt der Mondklinge, Merker gilbert_jagd und gilbert_kleriker.
// 2026-11-05 Lektorat (Maßstab, nur das Genannte): Antwort zum bleichen Blut gekürzt, keine Bekreuzigung, Weihrauch ohne Formel, Fortsetzungen nach der Wahl ohne „Du fragst“.
// Lore: lore/figuren/gilbert.md, lore/orte/zentral-yharnam.md, RK1 §5. Wissenssperre: lore/kapitel/kapitel1.md.
// [KANON lore:figuren/gilbert] Kranker Fremder hinter dem Fenster bei der ersten Laterne; nennt den Jäger einen Mitfremden; kann nicht aufstehen; kennt bleiches Blut nicht und verweist auf die Kirche und die Kathedrale im Osten des Tals; in der Jagdnacht sei die Gelegenheit; nennt zuerst die Große Brücke als Weg (RK1 §5, sicher); wird nach dem Blutmond zur Bestie.
// [ERWEITERT] Kampfer und kalter Tee, der zu weite Ring, der Birnbaum, das Sammeln von Namen, seine Bitte. Der Flammenwerfer kommt bei uns schon in Kapitel 1 und mit ihm der Satz vom erkauften Aufschub (Kanon: beides ab Sonnenuntergang).
// [Deutung, nur als Detail, nie aussprechen] Er könnte einst Kirchenjäger gewesen sein (LK 5.1): Die Düse ist alt verrußt, obwohl er sagt, er habe das Gerät nie benutzt.
// Stimme Gilbert: höflich, siezt, selbstironisch, fragt zurück; der Husten schneidet ihm die Sätze ab.
-> betreten("gilbert") ->
{ k1_b_gilbert == 1:
    Neben der Laterne, wo die Gasse sich zum Platz hin weitet, steht ein schmales Haus mit einem Fenster zu ebener Erde, und vor dem Fenster sitzt ein Gitter, wie man es in Yharnam vor die Kammern der Kranken setzt, damit nichts hinein kann und nichts heraus. Die Läden sind bis auf einen Spalt geschlossen. Aus dem Spalt dringt kein Räucherwerk wie aus den Nachbarhäusern; es riecht nach Kampfer und kaltem Tee, nach einer Stube, in der seit Wochen niemand gelüftet hat. # bild: gilbert # stimmung: ruhig
    Dahinter atmet jemand, nass und tief, und der Atem verhakt sich an einer Stelle und reißt und wird zu einem Husten, der nicht enden will. Dein eigener Hals zieht sich zusammen. Der Einstich in deiner Armbeuge, durch den in der Klinik das fremde Blut in dich hineinlief, pocht im Takt dieses Hustens, so genau, dass du die Hand darauflegst.
    Am Gitter erscheint ein Gesicht, hager und gelb wie Kerzenwachs, mit Augen, die freundlicher sind, als eine Jagdnacht es erlaubt. In jedem steht eine winzige Laterne. „Sie riechen nach Regen“, sagt der Mann, „und nach Landstraße. Nicht nach Rauch. Von draußen also.“ Er legt die Hand an einen Stab, eine Hand, an der der Ring zu weit geworden ist. „Gilbert. Auch von draußen, nur schon länger, als mir lieb ist. Und Jäger sind Sie geworden, nicht wahr? Man sieht es an der Art, wie Sie stehen.“ # lore: fremde
    { herkunft == "kranker":
        Da hustest du selbst, und er hört auf zu lächeln. „Oh“, sagt er leise. „Das kenne ich. Das kenne ich sehr gut.“
    }
    -> haltung
- else:
    // [KANON lore:figuren/gilbert] Er kann nicht aufstehen (LK §24.12).
    Gilbert sitzt schon am Gitter, den Stuhl dicht ans Fenster gerückt, bevor du anklopfst. „Ich habe Sie kommen hören“, sagt er. „Viel anderes als Hören bleibt einem hier nicht.“
    // [ERWEITERT] Einsicht kostet leise: Figuren merken, dass du anders bist.
    { einsicht >= 2:
        Er sieht dich an, dann an dir vorbei auf die Wand hinter dir, und wieder zurück. „Verzeihung“, sagt er. „Sie sehen auf Dinge, die nicht da sind. Oder ich sehe nicht, was da ist. Das zweite wäre mir lieber.“ # notiz: einsicht_gilbert
    }
    -> themen
}

= haltung
* [Ihm deinen Namen nennen #fliesst]
    ~ gilbert = gilbert + 1
    Du nennst ihm deinen Namen und bleibst am Gitter, bis der Husten sich gelegt hat. „{name}“, wiederholt er, leise, zweimal, so wie man sich eine Hausnummer merkt. „Danke. Hinter so einem Gitter wird man wunderlich, wissen Sie. Man sammelt Namen, wie andere Leute Knöpfe sammeln.“
* [Dich für einen Durchreisenden ausgeben #fliesst]
    Nur auf der Durchreise, sagst du. Er lächelt, als hättest du einen alten Scherz erzählt, den er gern noch einmal hört. „Das waren wir alle, als wir kamen.“ Er hustet in die Faust und wartet, bis es vorbei ist. „Jäger reden wenig, ich weiß. Ich rede für zwei, das gleicht sich aus.“
* [Dich vom Gitter abwenden #fliesst]
    ~ gilbert = gilbert - 2
    Er hat noch nicht ausgesprochen, als du dich abwendest. Hinter dir weicht das Gesicht vom Gitter zurück, ohne ein Wort des Vorwurfs, und eine Weile kommt aus dem Spalt kein Laut. Dann hustet er wieder, gedämpft, als presse er sich ein Tuch vor den Mund, damit es dich nicht stört.
    -> k1_hub_b
- -> themen

= themen
* [Nach seinem Husten fragen #fliesst]
    Über seinen Husten lacht er, kurz, und das Lachen kostet ihn einen neuen Anfall. „Eine Krankheit, für die mein Arzt zu Hause keinen Namen hatte“, sagt er, als er wieder kann. „Dann ein Gerücht über diese Stadt, in einer Postkutsche, von einem Mann, der nicht hustete. Dann eine lange Reise.“ Er dreht den zu weiten Ring am Finger. „Man hat mir hier Blut gegeben. Es hat geholfen, eine Weile. Im Spital lagen Leute, bei denen hat es nicht bloß aufgehört zu helfen.“ Sein Blick geht an dir vorbei in die Gasse. „Wir hatten einen Birnbaum hinter dem Haus. Ich denke dauernd an diesen Birnbaum, ist das nicht albern? Gehen Sie, sobald Sie können. Was diese Stadt einem gibt, holt sie sich doppelt zurück.“ # lore: bluttransfusion
    -> themen
* [Nach den verriegelten Türen fragen #fliesst]
    ~ gilbert_jagd = true
    Warum in dieser Stadt jede Tür verriegelt ist? „Eine Jagdnacht“, sagt er, als nenne er das Wetter. „Dann schieben die Leute die Riegel vor und hängen Räucherwerk ins Fenster, und wer das Warten nicht mehr aushält, nimmt Fackel und Mistgabel und geht selbst hinaus.“ Er senkt die Stimme, obwohl niemand zuhört. „Was ihnen da draußen begegnet, haben sie meistens gestern noch gegrüßt. Die Seuche macht aus Menschen Bestien, und wen es als Nächsten trifft, weiß keiner. Mich hat es noch nicht getroffen.“ Er hustet. „Noch nicht.“ # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Nach dem bleichen Blut fragen #fliesst]
    Die Worte vom Zettel in der Klinik, bleiches Blut: Gilbert denkt lange darüber nach, die Stirn am Eisen. „Das Wort kenne ich nicht. Aber Blut ist in dieser Stadt die Sache der Heilenden Kirche, jeder Tropfen, und ihr Blut, sagt man, kommt aus der großen Kathedrale drüben im Osten des Tals, so wie Wasser aus einer Quelle. Wenn einer das Wort kennt, dann sie.“ Er hustet, und als er wieder kann, spricht er leiser. „Einem Fremden sagt hier keiner etwas, in gewöhnlichen Nächten. Aber eine Jagdnacht ist keine gewöhnliche. Da stehen Türen offen, die sonst zu sind. Nur nicht die, an die man klopft.“ # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    -> themen
* {gilbert_bruecke} [Nach dem Weg zur Kathedrale fragen #fliesst]
    { kleriker == "":
        ~ gilbert_kleriker = true
        „Zur Kathedrale? Über die große Brücke, einen anderen Weg kenne ich nicht.“ Er lauscht in die Richtung, als könne er es von hier aus hören. „Aber auf der Brücke haust etwas. Es soll einmal in der Kirche gedient haben, gesungen oder gepredigt, so genau weiß das keiner. Man sagt auch, aus Kirchenleuten werden die schlimmsten.“ Er greift nicht nach dem Räucherwerk, wie man es in Yharnam tut, wenn davon die Rede ist. Er hat keins. # lore: kleriker_bestien
    - else:
        „Zur Kathedrale? Über die große Brücke.“ Sein Blick geht zu deinen Händen und bleibt dort. „Aber das wissen Sie schon, nicht wahr? Sie waren oben. Ist es … ist es noch da?“ # lore: kleriker_bestien
    }
    -> themen
* {gilbert_bruecke and (k1_b_anschlag or gehrman_jaeger or kleriker == "besiegt")} [Nach den Jägern der Kirche fragen #fliesst]
    // [KANON lore:fraktionen/jaeger] Ludwig führte die ersten Jäger der Kirche an; viele Kirchenjäger waren Kleriker. Hier nur als Gerücht, ohne Namen.
    // [KANON lore:gegenstaende/heilende-kirche] Das Silberschwert ist das Zeichen der Kirchenjäger (Abzeichen der Schwertjäger, auf der Brücke im Fell der Bestie); Ludwig warb Bürger als Jäger an (Kleidung der Yharnam-Jäger).
    // [ERWEITERT] Das Schwert auf den Haustüren und die Kratzer. Die Mondklinge gestrichen (Zusatzinhalt, Wissenssperre).
    Wer für die Kirche jagt? Gilbert lehnt die Stirn ans Gitter. „Die Leute hier erzählen von einem, der als Erster für sie gejagt hat. Er hat geworben, wen er bekommen konnte: Fuhrknechte, Gerber, Söhne von Wäscherinnen. Und Kleriker. Viele Kleriker.“ Er wartet, bis der Husten vorbei ist. „Auf den Abzeichen seiner Leute war ein Schwert aus Silber, und eine Zeit lang hat man es ihnen zu Ehren auf die Haustüren gemalt.“ Ein schiefes Lächeln. „Dann hat man es wieder abgekratzt. An manchen Türen sieht man noch die Kratzer. Seinen Namen sagt hier keiner gern; ich habe einmal gefragt, warum, und ringsum sind die Läden zugefallen.“ # notiz: erster_kirchenjaeger
    -> themen
* {grund == "suche"} [Ihm den Menschen beschreiben, den du suchst #fliesst]
    Du beschreibst ihm den Menschen, den du suchst, so gut es sich durch ein Gitter beschreiben lässt, und erzählst vom letzten Brief, der nach Weihrauch roch. Gilbert schüttelt langsam den Kopf. „Hier kommt niemand vorbei, der stehen bleibt. Außer Ihnen.“ Nach einer Weile sagt er: „Weihrauch. Den riecht man nur oben, bei der Kathedrale. Hier unten ist es Räucherwerk. Weihrauch ist bitterer.“ # notiz: spur_vermisst
    -> themen
* {q_gilbert == 1 and k1_hub_c} [Ihm von der Unterstadt erzählen #fliesst]
    ~ q_gilbert = 2
    ~ gilbert = gilbert + 1
    Du erzählst ihm von der Brücke, von den Treppen dahinter und von der Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, und von den Gräbern}. Gilbert hört zu, die Stirn am Eisen, und hustet die ganze Zeit kein einziges Mal. „Gibt es da unten Bäume?“, fragt er, als du fertig bist. Du denkst nach und sagst ihm die Wahrheit: einen, verkrüppelt, an einer Treppe. „Einen“, sagt er zufrieden. „Das ist einer mehr, als ich hier habe.“ # quest: gilbert_bericht
    -> themen
+ [Dich verabschieden #fliesst]
    { gilbert >= 0 and not gilbert_geschenk: -> geschenk }
    { gilbert < 0: Hinter dir hustet er, als du gehst, und tut nicht so, als hätte er dich gehört. }
    { gilbert >= 0: „Gute Jagd“, sagt Gilbert zum Abschied, und er meint es. }
    -> k1_hub_b

= geschenk
~ gilbert_geschenk = true
~ feuer = true
// [KANON lore:figuren/gilbert] Er kann nicht aufstehen: Er angelt den Tank mit dem Stock heran.
Du willst dich verabschieden, doch er hebt die Hand. „Warten Sie.“ Er beugt sich zur Seite, so weit der Stuhl es erlaubt, und angelt mit seinem Stock nach etwas unter dem Fensterbrett, das dort seit Wochen gestanden haben muss, denn als es über die Dielen schleift, zieht es eine Bahn durch den Staub. Es ist ein eiserner Tank mit Schlauch und Düse. Mit beiden Händen schiebt er ihn dir durch die Lücke zwischen zwei Stäben, so behutsam, als reiche er ein schlafendes Kind über einen Zaun, und danach hustet er lange, länger als je zuvor, die Stirn am kalten Eisen.
„Feuer“, sagt er, als er wieder kann. „Die Bestien fürchten es mehr als alles andere. Ich habe es nie benutzt.“ Die Düse ist schwarz von Ruß, alt und tief ins Eisen gebrannt. Er sieht, wohin du siehst, und sieht weg. „Das Blut dieser Stadt hat mir Aufschub gekauft, wissen Sie. Nur Aufschub, nichts weiter. Ich dachte immer, eines Tages brauche ich das Ding selbst, und dann …“ Der Husten schneidet ihm den Satz ab, und er nimmt ihn nicht wieder auf. „Nehmen Sie es einfach.“ # notiz: bestien_feuer
{ gilbert >= 1:
    „Und noch etwas.“ Er zögert. „Wenn Sie über die Brücke kommen, erzählen Sie mir, was dahinter liegt. Ich werde es nicht mehr selbst sehen.“ # quest: gilbert_bericht
    ~ q_gilbert = 1
}
-> k1_hub_b

=== k1_b_tueren ===
// TITEL: Türen mit Räucherlampen
// [KANON lore:figuren/buerger] Stimmen hinter Türen (LK §22.1): Abweisung des Fremden, die Gesundheitslüge, das Murmeln vom Friedhof, die Bitte, nicht zu klopfen, weil jeder Laut Unglück bringe. Wortlaut eigen; welche Tür welche Zeile spricht, ist unsere Wahl.
// [KANON lore:figuren/buerger] Festtagsrausch und Todeslust (LK §22.1, Punkt 4): das Fest hinter der einen Tür, die Alte, die das Murmeln der Gräber kaum erwarten kann.
// [KANON lore:figuren/einsame-alte-frau] Die einsame alte Frau: Fremde und die Kirche seien schuld; fragt später nach einem sicheren Ort.
// [ERWEITERT] Der Hund vor ihrer Tür, die fromme Stimme und Violas Spur (sie fragte nach dem Weg zu den Gräbern). Salz und ein umgedrehter Besen auf den Schwellen (Abwehrbrauch), das gute Kleid der Alten, die Türen, die sich innen über dem Husten schließen.
// Lektorat 2026-11-05: Hier dreht innen jemand einen Schlüssel um; das Atmen hinter dem Holz bleibt dem Anschlag.
-> betreten("tueren") ->
{ k1_b_tueren == 1:
    Unten liegt eine Gasse aus Türen, eine neben der anderen, so dicht, dass kaum ein Fenster dazwischen Platz hat, und vor jeder hängt eine rote Räucherlampe, deren Rauch an der Hauswand hinaufkriecht, bis er sich unter dem nächsten Sims staut. Auf manchen Schwellen liegt eine Prise Salz, auf einer ein umgedrehter Besen. In einer Jagdnacht klopft man in Yharnam nicht an, sagt man, und wer es doch tut, will etwas, das man ihm besser nicht gibt. # bild: tueren # stimmung: spannung
    Hinter den meisten Türen rührt sich nichts. Nur einmal, als du vorbeigehst, dreht innen jemand einen Schlüssel um, behutsam, damit es nicht klickt, und es klickt doch. Hinter einer anderen Tür lacht jemand, schrill und ohne Atem zu holen, und mehrere Stimmen fallen ein, als feierten sie ein Fest, zu dem du nicht geladen bist.
    An der ersten Tür, vor der du stehen bleibst, fährt dich eine Männerstimme an, noch ehe deine Hand das Holz berührt: „Ein Fremder. Natürlich. Wer sonst klopft in einer Jagdnacht? Ihr habt sie doch hergebracht, die Seuche, ihr mit eurem kranken Blut, und jetzt wollt ihr rein.“ Ein Riegel wird vorgeschoben, dann ein zweiter, obwohl der erste genügt hätte. # lore: fremde # lore: raeucherwerk
- else:
    Das Lachen hinter der einen Tür hat nicht aufgehört; es ist nur heiserer geworden, und manchmal setzt es aus, als hole drinnen jemand Luft, der es nicht mehr gewohnt ist. # stimmung: spannung
}
- (wahl)
* [Zu der Tür mit dem mageren Hund #fliesst]
    ~ alte_frau = true
    Ganz am Ende der Gasse, wo eine Treppe zu den Kanälen hinunterführt, wartet die Tür mit dem mageren Hund. Er liegt quer über der Schwelle und knurrt dich an, ohne aufzustehen, und wenn er knurrt, bewegt sich nur sein Bauch. Hinter der Tür antwortet eine alte Stimme, bevor du etwas gesagt hast, brüchig und bitter. „Fremde. Nichts als Fremde. Und die Kirche lässt sie alle rein mit ihrem Blut, und dann wundert man sich.“ Ein Schniefen, und die Stimme wird dünn. „Das Räucherwerk hält sie fern. Sonst hält gar nichts mehr irgendwas fern.“ # lore: raeucherwerk
    -> frau
* [An der Tür mit den drei Lampen lauschen #fliesst]
    ~ frau_betet = true
    An der Tür mit den drei Lampen, das Ohr dicht am Holz: Dahinter murmelt eine Frauenstimme ein Gebet, Silbe für Silbe, und bricht ab, als dein Stiefel auf dem Stein knirscht. „Gehen Sie weiter. Das Blut behüte Sie, aber gehen Sie weiter.“ Die Stimme ist heiser vom Beten, und Schärfe hat sie keine mehr. „Die Kirche hat uns das Räucherwerk gesegnet. Ohne die Kirche wären wir alle schon … Sie verstehen.“ # lore: heilende_kirche
    Nach einer Weile, mehr zu sich selbst: „Da war vorhin schon eine. Eine Dame, mit so einer großen roten Brosche. Hat geklopft und nach dem Weg zu den Gräbern gefragt. Ich hab nicht aufgemacht.“ Die Silben fangen wieder an, schneller als zuvor. # notiz: viola_spur
    -> wahl
+ {tuer_stimme < 3} [Weiter an den Türen klopfen #fliesst]
    ~ tuer_stimme = tuer_stimme + 1
    { tuer_stimme:
    - 1:
        An die nächste Tür, an die übernächste, und hinter der dritten antwortet ein Mann, kaum dass dein Knöchel das Holz berührt hat. „Hier ist alles bestens. Alle gesund, alle wohlauf, nicht einmal ein Schnupfen im ganzen Haus. Gute Jagd, Herr Jäger.“ Tiefer im Haus beginnt jemand zu husten, nass und reißend, und eine Tür schließt sich über dem Husten, dann eine zweite, bis er nur noch zu ahnen ist. „Nicht einmal ein Schnupfen“, sagt der Mann noch einmal, lauter.
    - 2:
        Eine Tür weiter, und noch ehe du die Hand gesenkt hast, kichert dahinter eine alte Frau. „Hören Sie das?“, flüstert sie durch das Schlüsselloch. „Von unten, von den Gräbern. Die murmeln wieder. Wenn die Gräber murmeln, ist es bald so weit.“ Stoff raschelt hinter dem Holz, Falte um Falte. „Ich hab mein gutes Kleid schon an.“ Du lauschst. Da ist nur das Wasser in den Rinnen, oder beinahe nur das Wasser.
    - 3:
        Hinter der letzten Tür vor der Treppe fleht eine Frau, so leise, dass du dich bücken musst, um sie zu verstehen: „Bitte nicht. Bitte hören Sie auf zu klopfen. Jeder Laut bringt Unglück ins Haus, jeder einzelne, und wir haben schon so viel davon.“ Danach kommt kein Laut mehr, auch kein Schritt, der sich entfernt. Sie steht noch hinter dem Holz, eine Handbreit von dir, und wartet, bis du gehst.
    }
    -> wahl
* [Mit der Faust gegen ein Türblatt schlagen #fliesst]
    Dreimal fährt die Faust gegen das Türblatt, und das Holz dröhnt bis in die Nachbarhäuser; die Lampe davor schaukelt an ihrem Haken und wirft roten Schein die Gasse hinauf und hinab. Eine junge Stimme antwortet, schnell vor Angst: „Die gehen selber jagen! Mit Gabeln, mit Fackeln! Oben auf der Hauptstraße, am Feuer, da hängt schon einer … Und Fremde halten sie immer dafür, immer! Gehen Sie doch!“ Danach verflucht sie dich mit Wörtern, die du nicht kennst, und als du dich abwendest, schwankt die Lampe noch immer. # lore: buergerjagd
    -> k1_hub_b
+ [Die Türen hinter dir lassen #fliesst]
    Das Lachen folgt dir bis an die Treppe und noch zwei Stufen hinauf.
    -> k1_hub_b

= frau
// [KANON lore:figuren/einsame-alte-frau] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr einen sicheren Ort versprechen #fliesst]
    ~ alte_frau_versprochen = true
    Einen sicheren Ort versprichst du ihr, irgendwo in dieser Stadt, und Bescheid, sobald du ihn gefunden hast. Sie schnaubt, trocken, und das Schnauben wird zu einem Husten. „Sicher. Natürlich.“ Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
* [Ohne Antwort weitergehen #fliesst]
    Ohne Antwort weiter, und die Stimme hinter der Tür ruft dir nichts nach. Der Hund sieht dir nach, bis du um die Ecke bist; erst dann legt er den Kopf wieder auf die Pfoten.
- -> k1_hub_b

=== k1_b_anschlag ===
// TITEL: Der Anschlag an der Kapellentür
// [ERWEITERT] Ein Anschlag der Heilenden Kirche zur Jagdnacht, eigener Wortlaut. Das Siegel bleibt unbestimmt (rotes Wachs, abgegriffenes Zeichen): Das Archiv kennt kein Zeichen der Kirche, und ein Kelch zeigte auf Gesperrtes (Faktencheck b_yharnam Nr. 9). Die übereinander geklebten Datumsstreifen: Die Jagd kehrt wieder.
// [KANON lore:fraktionen/heilende-kirche] Die Kirche verwaltet das Blut; die Bürger verriegeln sich mit Räucherwerk.
// Die Kirche ist in Kapitel 1 nur zu hören und zu lesen, nie zu sehen (Entscheidung des Nutzers 2026-11-04). Ortsbild A, der Anschlag C, das Atmen hinter der Tür B.
-> betreten("anschlag") ->
Sie duckt sich zwischen zwei Häuser, kaum breiter als ein Hauseingang, mit einer Tür aus schwarzem Holz und einem Fenster darüber, das man von innen mit Brettern vernagelt hat. Auf der Tür hängt ein Anschlag, mit vier Nägeln befestigt; drei sind braun vor Rost, der vierte ist neu und blank. Das Papier hat sich in der feuchten Luft gewellt, und als du dich vorbeugst, riecht es herb und harzig, nach Weihrauch. # bild: tueren # stimmung: spannung
Oben sitzt ein Siegel aus rotem Wachs, darin ein Zeichen, so oft gestempelt, dass seine Linien sich abgegriffen haben wie die Prägung einer Münze, die durch zu viele Hände ging. Darunter steht in großen, sauberen Lettern:
An die Gemeinde in der Nacht der Jagd. Bleibt in euren Häusern und lasst das Räucherwerk nicht erlöschen. Die Jäger der Kirche wachen über euch. Wer Fieber an sich spürt, wer Durst hat, den kein Wasser stillt, wer seine eigene Stimme fremd findet, der zögere nicht und begebe sich zur nächsten Stelle des Blutes. Das Blut der Kirche heilt, was es berührt. Fürchtet nicht das Blut. Fürchtet, was ohne das Blut aus euch würde. # stil: anschlag # lore: heilende_kirche
Gegeben im Namen der Heilenden Kirche, zur Nacht der Jagd. # stil: anschlag
Das Datum unter der letzten Zeile steht auf einem schmalen Papierstreifen, der über einen älteren geklebt ist, und an der Kante, wo die Feuchtigkeit den Leim gelöst hat, siehst du, dass unter dem älteren noch weitere liegen, Streifen auf Streifen, jeder ein wenig gelber als der darüber.
Unten auf der Tür, unter dem Papier, hat jemand mit Kreide etwas dazugeschrieben, klein und schief, und dann versucht, es mit dem Ärmel wegzuwischen. Lesbar ist es noch: Mein Bruder ist gegangen. Er hatte keinen Durst. # notiz: anschlag_kreide
Hinter der Tür, ganz nah am Holz, atmet jemand. Als dein Schatten auf die Tür fällt, hört das Atmen auf.
-> k1_hub_b

=== k1_b_haus ===
// TITEL: Das dunkle Haus (Zettel über die Brücke)
// [KANON lore:welt/notizen] Notiz Nr. 2 (LK §21.1): Beim Beginn der Jagd ließ die Heilende Kirche die Bewohner im Stich und sperrte die Große Brücke, während der alte Stadtteil in jener Nacht brannte. Fundort: das dunkle Haus nahe der ersten Laterne, Regal im ersten Stock neben einem Rollstuhl-Bürger. Gegenpol zum Anschlag (Faktencheck Übergreifend 2b, b_yharnam Nr. 6).
// [KANON lore:gegner/rollstuhl-mob] Bürger im Rollstuhl: Wahnlachen, atmet in Ruhe nur durch den Mund, greift aus dem Stuhl heraus an.
// [ERWEITERT] Wortlaut und Schreiber des Zettels; der eine Takt mit der Pistole. Den alten Stadtteil nicht beim Namen nennen, nur „unten im Tal, wo die Stadt früher war“ (Faktencheck).
// [ERWEITERT] Das Seil am Geländer, blank gescheuert (Lektorat 1.1 f): Jemand hat den Stuhl hinaufgezogen. Nicht erklären. Sein Lachen pfeift mit dem Atem (eigener Laut, Lektorat 1.2).
// [Deutung, nie aussprechen] Der Rollstuhl gleicht dem des Mannes in der Klinik (RK1 §1). Nur stehen lassen: die knarrenden Räder.
-> betreten("haus") ->
{ k1_b_haus == 1:
    Hinter der Tür liegt ein Flur, in dem seit Wochen niemand Licht gemacht hat, und eine Treppe, auf deren Stufen der Staub so dick liegt, dass deine Stiefel Abdrücke hinterlassen wie im ersten Schnee. Nur in der Mitte jeder Stufe ist er weggewischt, in zwei schmalen, gleichmäßigen Bahnen. Am Geländer ist ein Seil festgeknotet, und auf halber Höhe ist es an einer Stelle blank gescheuert. Es riecht nach kaltem Talg und nach einem Zimmer, in dem jemand schläft. # bild: haus_dunkel # stimmung: spannung
- else:
    Wieder die Treppe, das Seil, die zwei schmalen Bahnen im Staub, und oben das Atmen, von dem du jetzt weißt, wem es gehört. # bild: haus_dunkel # stimmung: spannung
}
Im ersten Stock steht ein Rollstuhl mit dem Rücken zum Fenster, und in ihm sitzt eine Gestalt unter einer Decke, den Kopf auf der Brust. Sie atmet durch den offenen Mund, lang und feucht. Als die Diele unter dir knarrt, hebt sie den Kopf, die Räder knarren mit, und aus dem offenen Mund kommt ein Lachen, das mit dem Atem geht, hoch und pfeifend, ein Ton bei jedem Einziehen, während unter der Decke eine Hand hervorkommt und in der Hand eine Pistole, deren Lauf erst zittert und dann ganz ruhig wird. Rechts von dir steht ein Schrank mit einer schweren Eichentür; links ist nur die nackte Wand. # anzeichen: schuss # kampf: rollstuhl
+ [Nach rechts hinter den Schrank #fliesst]
    Der Schuss schlägt in die Eichentür, eine Handbreit über deinem Kopf, und die Splitter regnen dir in den Kragen. Bevor er nachladen kann, bist du bei ihm und drehst ihm die Pistole aus der Hand. Er wehrt sich nicht. Sein Lachen pfeift weiter durch den offenen Mund, und seine Augen folgen dir, wie ein Kind einem Ball folgt.
+ [Geradeaus auf ihn zu #fliesst]
    Drei Schritte, vier, und auf halbem Weg schießt er. Die Kugel fährt dir in die Seite, heiß und dumpf zugleich.
    ~ zuletzt = schuss
    ~ treffer(1)
    { leben <= 0: -> tod }
    Mit der Hand auf der Wunde bist du bei ihm und drehst ihm die Pistole aus den Fingern. Sein Lachen pfeift weiter, als hätte er gewonnen.
-
~ haus_zettel = true
Neben dem Rollstuhl steht ein Regal, und darauf, zwischen einer leeren Tasse und einem Gebetbuch mit gebrochenem Rücken, liegt ein Zettel, mehrmals gefaltet und wieder glattgestrichen. Die Schrift gehört einem, der selten schreibt und deshalb fest aufdrückt:
Als die Jagd begann, sperrte die Kirche die große Brücke und überließ uns hier unten uns selbst. Unten im Tal, wo die Stadt früher war, brannte es die ganze Nacht, und von oben kam keiner. Sie wachen über uns, schreiben sie an die Türen; über ihre Brücke wachen sie. # stil: tagebuch # lore: kirche_sperrt_bruecke
Der Zettel knistert, als du ihn einsteckst. Auf der Treppe, die Hand am Seil, hörst du, wie oben der Mann wieder durch den Mund zu atmen beginnt, lang und feucht, als hätte ihn nie jemand gestört.
-> k1_hub_b

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON lore:gegner/jagdmeute] Mob aus bewaffneten Bürgern, die den Fremden für den Überträger halten und rufen, er trage die Krankheit, er solle brennen (LK §20.1, §22.2; den Ruf mit Willem nicht verwenden).
// [KANON lore:gegner/ziegel-troll] Der Riese mit dem Ziegel hämmert an eine Tür, murmelt von Kälte und einer Schwester und brüllt beim Schlag, alles sei deine Schuld. Unerklärt lassen.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Gascoignes Kleidung ist von Bestiengestank durchdrungen, der an ihm zehrt; „Vater“ ist ein Titel aus einem fremden Land. Breitkrempiger Hut (Artbook, orte/zentral-yharnam).
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade, fragt nach deinem Namen, teilt Branntwein aus seiner Heimat (Torf und Rauch, G8) und bittet um einen Gruß an seine Frau. Hat der Spieler Martha verbrannt, bleibt er kalt: keine Flasche, die Parade ohne Blick, die Bitte nur, weil er niemand anderen hat, die Einladung zur Brücke nur bei gascoigne >= 0.
// [ERWEITERT] Lektorat 2026-11-05: Gascoigne tritt über den Ton auf (Schuss, dann die Namen); das Auge sieht zuerst nur den Verband, Mantel, Hut und Schal erst aus der Nähe. Sein Geruch am Platz nur einmal und leise, ohne „nasses Fell“ (die Steigerung folgt an den Gräbern, c_unterstadt). Martha mit Mehl an den Ärmeln in beiden Zweigen; die Frau mit der Fackel wie ein Kerzenleuchter.
// Stimme Gascoigne (gesund): tief, ruhig, kurze Sätze, warm und spaßig, nennt Leute beim Namen, sagt „Fremder“, bis er deinen Namen hat; beendet Dinge mit „So.“ Wärme, die zerbricht: der Geruch, das Spiel der Bestie, ein Blick zum Feuer.
-> betreten("scheiterhaufen") ->
{ mob != "": -> danach }
{ k1_b_scheiterhaufen == 1:
    Die Hauptstraße öffnet sich zu einem Platz, und in seiner Mitte brennt ein Scheiterhaufen, höher als die Dachtraufen ringsum. Oben, an einen Pfahl gebunden, hängt etwas Großes, Behaartes, das sich nicht mehr regt; die Flammen haben ihm das Fell schwarz gefressen, und der Rauch, der von ihm aufsteigt, riecht süßlich und fett, nach einem Schlachttag, an dem keiner sein Handwerk verstand. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
    Um das Feuer stehen Menschen, ein Dutzend oder mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln und Beilen, einer mit einem alten Gewehr, dessen Kolben mit Draht geflickt ist. Eine Frau hält ihre Fackel wie einen Kerzenleuchter, mit abgespreiztem kleinem Finger. Sie murmeln, alle zugleich und doch nicht zusammen. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens. Zwischen zwei Schlägen murmelt er, und was er murmelt, gilt nicht der Tür: „Kalt ist es, Schwesterchen. So kalt.“
    Einer dreht sich zu dir um, dann drei, dann alle, und das Murmeln bricht ab, so wie ein Topf aufhört zu kochen, wenn man ihn vom Feuer zieht. „Der da“, sagt die Frau mit der Fackel, und ihr kleiner Finger spreizt sich noch immer ab. „Der trägt sie an sich, die Seuche, riecht ihr das nicht?“ Und ein Mann, heiser vom Rauch: „Brennen soll er! Brennen wie das da oben!“ # kampf: mob
- else:
    Der Scheiterhaufen ist heruntergebrannt bis auf Mannshöhe, und die Menge steht um ihn, als hätte sie sich nicht gerührt, seit du gegangen bist. Der Riese schlägt noch immer gegen die Tür. Diesmal dreht sich keiner langsam um. „Da ist er wieder“, ruft einer, „der Fremde, der so stinkt!“ # bild: scheiterhaufen # stimmung: spannung # kampf: mob
}
+ [Stehen bleiben und die Säge ausklappen #fliesst]
    Die Säge klappt in deiner Hand auf, mit einem Schnappen, das lauter ist als das Feuer, und vorn in der Menge senken sich die ersten Gabeln auf dich.
    -> kampf
+ [In den Schatten um den Platz herum #fliesst]
    ~ mob = "umgangen"
    In den Schatten, an den Hauswänden entlang, Schritt für Schritt, und dein Puls klopft dir bis in die Zähne. Fast liegt der Platz hinter dir, als ein Kind, das du nicht gesehen hast, mit dem Finger auf dich zeigt und schreit: „Da! Der Fremde! Da ist er!“
    -> gascoigne_greift_ein
+ [Rückwärts in die Gasse zurückweichen #fliesst]
    Rückwärts in die Gasse, bevor sie dich erreichen. Das Murmeln schwillt an und ebbt wieder ab, und keiner folgt dir. Noch nicht.
    -> k1_hub_b

= kampf
- (t1)
Sie kommen von zwei Seiten zugleich, aber nicht gleich schnell. Ein hagerer Mann mit einer Mistgabel löst sich als Erster aus der Menge, die Zinken tief und auf deinen Bauch gerichtet, und hinter dir öffnet sich die Gasse, aus der du gekommen bist, so eng, dass darin keine zwei Mann nebeneinander Platz haben. # anzeichen: mobhieb
{ herkunft == "gesuchter": Eine Frau in der zweiten Reihe starrt dich an, als kenne sie dein Gesicht von einem Anschlag. Vielleicht tut sie das. }
+ [Nach hinten in die enge Gasse #fliesst]
    Rückwärts in die enge Gasse, Schritt um Schritt, und die Menge drängt nach, bis sie sich selbst im Weg steht, Schulter an Schulter, die Gabeln ineinander verkeilt. Die Säge trifft den Ersten. Den Zweiten am Arm, der die Fackel hält.
    -> t2
+ [Nach vorn mitten in die Menge #fliesst]
    Mitten hinein, und für einen Herzschlag sieht es aus, als werde die Menge zurückweichen. Sie weicht nicht. Die Zinken fahren dir in die Seite, ein Beil streift deinen Arm.
    ~ zuletzt = mobhieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Gilberts Feuer in die Menge halten #fliesst]
    Aus der Düse fährt eine Zunge, gelb und brüllend, mitten in die Menge. Sie schreien, jeder für sich, erschrockene Menschen, die eben noch eine Menge waren, und stieben auseinander, in Gassen und Hauseingänge. Eine bleibt liegen. Ihre Schürze brennt weiter; an den Ärmeln, wohin das Feuer nicht kam, ist sie weiß von Mehl. Die Düse in deiner Hand ist warm.
    ~ mob = "zerstreut"
    ~ mob_verbrannt = true
    Die Frau am Boden rührt sich nicht. Von oben, von der Kathedrale her, setzt ein Choral ein, langsam und fern, in Stimmen, die jede Silbe sauber zu Ende singen. # klang: choral
    -> gascoigne_greift_ein
- (t2)
Mehr kommen. Der Riese hat aufgehört, gegen die Tür zu schlagen; er dreht sich um, den Ziegel in der Faust, und brüllt über den Platz, mit einer Stimme, die überschnappt wie die eines Jungen: „Du! Du bist schuld! An allem bist du schuld!“ Er rennt los, schwerfällig und unaufhaltsam, mitten durch die eigenen Leute. Links, zwischen einer Frau mit einem Beil und dem Pfahl einer Gaslaterne, steht der Kreis nur einen Mann tief. # anzeichen: riese_ansturm
+ [Links durch die Lücke im Kreis #fliesst]
    Links durch die Lücke, zwischen dem Beil und dem Laternenpfahl hindurch: Ein Ellbogen trifft dein Kinn, ein Stiefel dein Knie, aber du bist draußen, und hinter dir pflügt der Riese in die eigenen Leute.
    ~ zuletzt = riese_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ [Dem Riesen von vorn entgegen #fliesst]
    Der Ziegel trifft dich an der Schulter, noch bevor deine Klinge ihn erreicht, und die Welt wird für einen Augenblick weiß.
    ~ zuletzt = riese_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen #fliesst]
    -> ampulle_gefahr(1) -> t2

= gascoigne_greift_ein
// Wer Gascoigne schon zwischen den Gräbern gesehen hat, sieht ihn hier nicht mehr gesund: Er ist längst hinter dem Tor.
{ gascoigne2: -> ohne_ihn }
~ q_frau = 1
{ mob == "zerstreut":
    Über das Pflaster kommen Schritte aus dem Rauch, schwer und ohne Eile, und halten bei der Frau, die liegen geblieben ist. Von dem Mann siehst du zuerst nur den Verband, schmutziges Leinen, mehrmals um die Augen gewickelt, und doch ist er geradewegs zu ihr gegangen, ohne einmal den Kopf zu wenden. Er kniet sich neben sie und nimmt ihre Hand, obwohl sie schwarz ist. „Martha“, sagt er. Nur das. # stimmung: grauen # lore: gascoigne
    Als er aufsteht, überragt er dich um einen Kopf, ein langer Jägermantel, ein Hut mit breiter Krempe, um den Hals der Schal eines Priesters. Sein Ärmel streift deinen Arm, und unter Teer und Rauch liegt ein anderer Geruch, schwach und warm, wie von einer Decke, auf der lange ein Tier geschlafen hat. Er wendet dir den Verband zu. „Gascoigne“, sagt er. „Ich jage hier, seit vielen Jahren. Sie hat mir Brot gegeben, wenn ich spät kam.“ Er schweigt. „So.“
    ~ gascoigne = gascoigne - 1
- else:
    Ein Schuss kracht über den Platz{mob == "durchbrochen":, hinter dir}, so laut, dass die Scheiben in den Rahmen klirren. In das Klirren hinein spricht eine Stimme, ruhig und tief, mit einem Rollen, das nicht aus diesen Gassen stammt: „Martha. Hennings. Brack, du alter Esel, nimm die Gabel runter.“ # stimmung: ruhig # lore: gascoigne
    Zwischen dich und die Bürger tritt ein Mann, und von ihm siehst du zuerst nur den Verband, schmutziges Leinen, mehrmals um die Augen gewickelt. Trotzdem wendet er den Kopf von einem zum anderen, und wen der Verband trifft, der lässt die Fackel sinken. In der einen Hand hält er eine Axt, in der anderen eine Donnerbüchse, aus deren Trichter noch Rauch steigt. „Geht heim“, sagt er. „Geht heim zu euren Kindern.“
    Und sie gehen, einer nach dem anderen; eine Frau mit Mehl an den Ärmeln nickt ihm im Vorbeigehen zu, beinahe verlegen, und selbst der Riese trottet davon und zieht den Ziegel hinter sich her über das Pflaster.
    Erst dann wendet er sich dir zu und streckt dir die Hand hin, warm und trocken und sehr groß, und aus der Nähe siehst du auch den Rest: den langen Jägermantel, den Hut mit der breiten Krempe und um den Hals den Schal eines Priesters, grau vom Ruß. Unter Teer und Pulver liegt ein anderer Geruch, schwach und warm, wie von einer Decke, auf der lange ein Tier geschlafen hat. Er merkt, dass du es merkst, und tritt einen halben Schritt zurück, ohne deine Hand loszulassen. „Gascoigne. Pater, wenn man's genau nimmt. Aber hier nimmt's keiner genau.“ Er legt den Kopf schief. „Und du bist auch nicht von hier, Fremder. Man hört es an deinen Stiefeln.“ # notiz: gascoigne_pater
    { herkunft == "soldat": „Und du gehst wie einer, der Gräben kennt“, fügt er hinzu. „Ich auch. Lange her.“ }
}
{ mantel: -> mantel_frage }
- (nach_mantel)
* {mob == "zerstreut"} [„Ich hatte keine Wahl.“ #fliesst]
    „Ich hatte keine Wahl.“ Noch während du es sagst, hörst du, wie dünn es klingt. „Man hat immer eine“, sagt er. „Meistens eine schlechte.“ Er wischt die Hand, die ihre gehalten hat, am Mantel ab, Finger für Finger.
* {mob == "zerstreut"} [„Wer war sie?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Wer war sie?“ Er wendet den Verband nicht von ihr ab. „Martha. Hat unten am Markt Brot gebacken, mit zu viel Kümmel, immer, und jeder hat's ihr gesagt, und sie hat's nie gelassen.“ Er hebt den Verband zum Pfahl hinauf. „Sie hatte Angst vor dir. Deshalb stand sie hier.“
* {mob == "zerstreut"} [Schweigend neben ihm stehen bleiben #fliesst]
    Keiner von euch sagt ein Wort. Das Feuer auf dem Scheiterhaufen knackt, und irgendwann fällt oben etwas vom Pfahl in die Glut, und er zuckt nicht.
* {mob != "zerstreut"} [Ihm danken #fliesst]
    ~ gascoigne = gascoigne + 1
    Er winkt ab, als du ihm dankst, aber unter dem Verband ziehen sich seine Mundwinkel nach oben. „Bedankt wird sich selten bei einem Jäger. Meistens macht man nur die Tür zu.“ Er zeigt mit dem Daumen über die Schulter, dorthin, wo die Bürger verschwunden sind. „Die da danken mir morgen auch wieder nicht. Ist schon recht.“
* {mob != "zerstreut"} [„Warum hilfst du einem Fremden?“ #fliesst]
    // [ERWEITERT] Der Mann mit den Federn am Hut ist Henryk (Artbook: Federn am Hut), hier ohne Namen; der Name fällt erst bei Eileen.
    ~ gascoigne = gascoigne + 1
    „Warum hilfst du einem Fremden?“ Er hebt die Axt auf die Schulter. „Weil ich selbst einer war. Und es manchmal vergesse. Damals hat mir auch einer geholfen, ein Dürrer mit Federn am Hut, der mich ausgelacht hat, weil ich die Axt verkehrt herum hielt.“ Unter dem Verband lächelt er, warm und ein wenig schief.
* {mob != "zerstreut"} [„Das hätte ich auch allein geschafft.“ #fliesst]
    „Das hätte ich auch allein geschafft.“ Er lacht, tief aus der Brust, und schlägt dir auf die Schulter, genau auf die Stelle, die wehtut. „Natürlich. Natürlich hättest du das.“
- { mob == "zerstreut": „Und du“, sagt er, ohne dich anzusehen. „Wie heißt einer, der so was tut?“ | „Wie heißt du, Fremder?“ }
* [Ihm deinen Namen sagen #fliesst]
    ~ gascoigne_name = true
    ~ gascoigne = gascoigne + 1
    „{name}“, sagst du. { mob == "zerstreut": Er wiederholt ihn nicht. Er nickt nur, so wie man etwas annimmt, das man nicht bestellt hat, und es trotzdem nicht zurückgibt.| „{name}“, wiederholt er, und mit dem Rollen in seiner Stimme klingt der Name schwerer, als hätte er ihm ein Gewicht angehängt. „Gut. Den behalte ich.“}
* [„Jäger. Das muss reichen.“ #fliesst]
    „Jäger. Das muss reichen.“ { mob == "zerstreut": „Reicht“, sagt er. „Für heute.“| Er nickt, als sei das eine ehrliche Antwort. „Dann eben Fremder. Bis du es dir anders überlegst.“}
-
~ parade = true
~ parade_quelle = "gascoigne"
{ mob == "zerstreut":
    Ohne zu fragen, nimmt er dir die Feuerwaffe aus der Hand und wiegt sie. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Er zeigt es dir, mitten auf dem Platz, ohne dich dabei anzusehen: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach.“ Er gibt dir die Waffe zurück. „Damit du beim nächsten Mal kein Feuer brauchst.“ # lore: parade
- else:
    Er nimmt deine Feuerwaffe, wiegt sie in der Hand und gibt sie dir zurück. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Und dann zeigt er es dir, mitten auf dem Platz, mit dem Feuer im Rücken, und spielt dir die Bestie gleich mit, den Arm hoch über dem Kopf, das Knurren tief in der Kehle, so gut, dass über euch ein Fensterladen zuschlägt: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach. Dann wankt sie, und dann gehört sie dir. So.“ # lore: parade
    Er lehnt sich an einen Laternenpfahl und zieht eine flache Blechflasche aus dem Mantel. „Gegen die Kälte. Und gegen das andere.“ { mantel_gelogen: Er trinkt zuerst und reicht sie dir, ohne den Hals abzuwischen.| Er reicht sie dir zuerst, und als du getrunken hast, nimmt er sie zurück und wischt den Hals mit dem Ärmel ab, sorgfältig, wie ein Mann, der das zu Hause für jemanden tut.} Der Branntwein ist scharf und schmeckt nach Torf und Rauch, nach einem Land mit mehr Moor als Straßen. „Von daheim“, sagt er. „Das Letzte, was ich davon hab.“ # notiz: gascoigne_flasche
    Einmal, mitten im Trinken, dreht er den Kopf zum Scheiterhaufen und zieht die Luft ein, tief, und was dabei über sein Gesicht geht, ist kein Ekel. Er schraubt die Flasche zu, fester als nötig.
}
{ mob == "zerstreut":
    Er wendet sich zum Gehen und bleibt nach drei Schritten stehen. „Eins noch.“ Er sagt es zum Pflaster vor seinen Stiefeln. „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie soll bei der Kleinen bleiben.“ Eine Pause. „Ich hab heute Nacht keinen, den ich sonst fragen könnte.“ # quest: gascoigne_frau
- else:
    Er dreht die Flasche in den Händen, bevor er sie einsteckt, und sagt, beinahe verlegen: „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie macht sich immer Sorgen. Sie soll bei der Kleinen bleiben.“ # quest: gascoigne_frau
}
* [„Ich richte es ihr aus.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ich richte es ihr aus.“ Er nickt, und etwas in seinen Schultern löst sich{mob == "zerstreut":, nicht viel, eine Fingerbreite}.
* [Ihm stumm zunicken #fliesst]
    Ein Nicken, ohne ein Wort, und er nickt zurück, trotz des Verbandes, im selben Augenblick wie du.
-
{
- kleriker != "besiegt" and gascoigne >= 0 and mob == "zerstreut":
    // [ERWEITERT] Gascoigne glaubt, die Bestie auf der Brücke gekannt zu haben. Wer sie war, ist im Kanon [OFFEN]; die Hochzeit nennt er erst auf der Brücke (n1_kleriker), nicht hier.
    „Und wenn du zur großen Brücke gehst …“ Er dreht sich halb um. „Ruf mich. Da oben haust einer, den ich, glaub ich, kenne.“ Er geht in den Rauch. Neben Martha sind in der Asche zwei Abdrücke geblieben, wo er gekniet hat. # quest: gascoigne_bruecke
- kleriker != "besiegt" and gascoigne >= 0:
    „Und noch was.“ Er stößt sich vom Laternenpfahl ab. „Wenn du zur großen Brücke gehst, ruf mich. Da oben haust einer, den ich, glaub ich, kenne. Ich will ihn mir ansehen.“ Er tippt gegen den Verband und grinst. „So gut das eben geht.“ Dann geht er in den Rauch, und eine Weile hörst du noch seine Stiefel. # quest: gascoigne_bruecke
- mob == "zerstreut":
    Er geht in den Rauch, ohne sich umzudrehen. Neben Martha sind in der Asche zwei Abdrücke geblieben, wo er gekniet hat.
- else:
    „Pass auf dich auf, {gascoigne_name:{name}|Fremder}.“ Er tippt an die Krempe seines Hutes und geht in den Rauch.
}
-> k1_hub_b

= ohne_ihn
// Gascoigne ist schon hinter dem Tor des Oedon. Der Schuss kommt aus dem Rauch; niemand tritt hervor.
Ein Schuss kracht über den Platz. Die Menge stiebt auseinander, als wüsste jeder Einzelne, wem dieser Knall gehört, und lässt dir eine Gasse frei. Niemand tritt aus dem Rauch. Wo der Schuss herkam, steht nur Qualm, und auf dem Pflaster, frisch und dunkel, eine Spur von Stiefelabdrücken, die zur großen Brücke führt. Sie glänzen. # stimmung: grauen # notiz: blutige_spur
-> k1_hub_b

= danach
{ mob:
- "zerstreut": Der Platz ist leer. Verlassene Fackeln liegen auf dem Pflaster und rauchen noch. Jemand hat eine Decke über die Frau gelegt, die liegen geblieben ist, und auf die Decke einen Kanten Brot, und wer es war, weißt du nicht.
- else: Das Feuer ist heruntergebrannt, und doch hängt auf dem Pfahl wieder etwas, schwarz und reglos, und am Fuß des Pfahls liegt frisches Reisig, sorgfältig geschichtet, für das nächste.
}
-> k1_hub_b

= mantel_frage
// [ERWEITERT] Wendels Mantel: Gascoigne kennt den Geruch. Er wird misstrauisch. Sein eigener Geruch ist dann schon gefallen (leise, ohne Namen); hier riecht er an dir, nicht umgekehrt.
{ mob == "zerstreut": Er tritt einen Schritt näher, beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Sein Gesicht wird noch eine Spur härter, so wie Reif auf einer Scheibe dichter wird.| Noch hält er deine Hand. Er beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Als er sich aufrichtet, geht das Freundliche aus seinem Gesicht, nicht ganz, aber so, wie die Wärme aus einem Zimmer geht, wenn jemand die Tür offen lässt.}
„Teer. Pulver. Und Wendel.“ Er sagt den Namen, als lege er ihn auf einen Tisch. „Wendel ist seit zwei Jagden nicht heimgekommen. Woher hast du seinen Mantel?“
~ mantel_erkannt = true
* [Ihm die Wahrheit über den Mantel sagen #fliesst]
    // [ERWEITERT] PRÜFEN: Ob Gascoigne den Jägertraum kennt, ist [Offen]. Er glaubt dir, ohne zu sagen, warum.
    Die Wahrheit, so wie sie war: der Garten, das Becken, die kleinen grauen Hände, die dir den Mantel heraufreichten. Noch während du erzählst, hörst du, wie es klingt. Gascoigne schweigt lange. „Im Traum“, sagt er endlich. „Von denen.“ Er reibt sich mit dem Daumen über den Verband, dort, wo die Augen sein müssten. „Das glaub ich dir. Das ist ja das Schlimme.“ # notiz: gascoigne_mantel
* [„Der lag in einer Gasse.“ #fliesst]
    ~ mantel_gelogen = true
    ~ gascoigne = gascoigne - 1
    „Der lag in einer Gasse“, sagst du, „einfach so.“ Gascoigne nickt langsam. „Wendel lag in keiner Gasse“, sagt er. „Wendel lag nie irgendwo. So.“ Mehr sagt er nicht dazu, aber als er dir den Rücken zuwendet, tut er es einen halben Schritt später als vorher. # notiz: gascoigne_mantel
- -> gascoigne_greift_ein.nach_mantel

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON lore:figuren/maedchen-und-viola] Gascoignes Tochter; erkennt den Jäger am Geruch, nicht an der Stimme; die Mutter (Viola) ging den Vater suchen; Spieluhr mit dem Lied des Vaters, das ihn an die Familie erinnert, wenn er vergisst; Namen im Deckel; die Mutter sei schusselig; sie erwähnt einen Großvater. Sie trägt eine große weiße Schleife (G1); rot wird das Band erst beim Schwein.
// [ERWEITERT] Die Schleife am Riegel als Zeichen für die Mutter (nicht erklären; das sagt das Kind selbst). Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation (erkennbar: Sie will selbst suchen gehen, und Iosefka öffnet niemandem).
// [ERWEITERT] Lektorat 1.3: Der Spieluhr fehlt ein Ton; an derselben Stelle jeder Runde stolpert die Melodie über eine Lücke. Wiedererkennung für Brücke und Grab (andere Dateien).
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat. Sie kennt den Vater am Geruch, nicht an den Augen (Verband).
-> betreten("maedchen") ->
{ maedchen_wo == "fort": -> leer }
{ k1_b_maedchen > 1: -> wieder }
~ maedchen_gesehen = true
Hinter dem Tor liegt ein kleiner Platz mit einem versiegten Brunnen, dessen Becken voller Laub und zerbrochener Ziegel ist, und ringsum stehen schmale Häuser, so dicht, dass ihre Fenster einander in die Läden sehen. Mitten in all dem Rauch und Räucherwerk spielt eine Spieluhr, ein Lied aus wenigen hohen Tönen, und an derselben Stelle jeder Runde fehlt einer, eine kleine Lücke, über die die Melodie hinwegstolpert. Du kennst das Lied nicht, und trotzdem wird dir davon der Hals eng, so wie es nur Lieder tun, die man als Kind gehört hat. # bild: brunnenplatz # stimmung: schoen
Die Melodie kommt aus einem Fenster im ersten Stock. Durch die Ritzen der Läden hängt eine weiße Haarschleife, um den Riegel geknotet, das Band so lang, dass es im Zug gegen das Holz schlägt. # lore: familie_gascoigne
Als du näher kommst, bricht die Melodie mitten im Takt ab. Hinter den Läden zieht jemand die Luft ein, kurz und prüfend. „Du riechst wie Papa, wenn er spät heimkommt“, sagt eine dünne Stimme. „Bist du ein Jäger?“
Zwischen den Läden erscheinen vier kleine Finger, dann zwei Augen, sehr ernst. „Papa ist auf die Jagd gegangen und nicht wiedergekommen. Und Mama ist gegangen, ihn zu suchen, und auch nicht wiedergekommen. Und Opa ist auch nicht da. Ich hab die Tür zugemacht, so wie Mama gesagt hat. Ich hab das Räucherwerk angezündet. Ich hab meine Schleife rausgehängt, damit Mama das Fenster findet. Ich hab alles richtig gemacht.“
Mit einem Trotz, der größer ist als sie, setzt sie hinzu: „Wenn Mama nicht bald kommt, geh ich selber und such sie.“ # notiz: maedchen_warnung
* [„Ich finde deine Mama.“ #fliesst]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    „Ich finde deine Mama.“ Hinter den Läden kommt einen Atemzug lang nichts. Dann, kaum hörbar: „Versprochen?“ Und bevor du antworten kannst: „Danke.“
    -> spieluhr_geben
* [„Woran erkenne ich deine Mama?“ #fliesst]
    ~ q_mutter = 1
    „An der Brosche“, sagt sie, noch bevor du ausgesprochen hast. „Mama trägt immer die große rote Brosche. Die sieht man von Weitem, die ist schöner als alles.“
    -> spieluhr_geben
* [„Lauf zu der Ärztin in der Klinik.“ #fliesst]
    -> fort
* [Dich ohne ein Versprechen abwenden #fliesst]
    „Kommst du wieder?“, fragt sie deinem Rücken nach. Es kommt keine Antwort, und die Finger verschwinden aus dem Spalt.
    -> k1_hub_b

= spieluhr_geben
// [KANON lore:figuren/maedchen-und-viola] Inhalt sinngemäß, Wortlaut eigen.
Etwas schabt am Fensterbrett, und durch den Spalt zwischen den Läden schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. „Die ist von Papa. Papa riecht manchmal ganz fremd, und dann sagt er unsere Namen falsch. Dann zieh ich die auf, und er hört zu, und hinterher ist er wieder Papa.“ Sie schiebt sie noch ein Stück weiter. „Mama hätte sie mitnehmen müssen. Sie hat sie hier auf dem Tisch vergessen, Mama vergisst immer was. Bring sie ihr.“ # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Unter dem Deckel klebt ein vergilbter Zettel mit zwei Namen, in einer feinen Schrift, deren V einen kleinen Kringel nach links macht: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Der Deckel bleibt offen in deiner Hand, eine ganze Weile. Dann klappst du ihn zu, und auf dem Platz verstummt etwas, von dem du nicht wusstest, dass es zu hören war.
}
-> k1_hub_b

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien. Die weiße Schleife nimmt sie mit.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
„Lauf zu der Ärztin in der Klinik“, sagst du. „Dort bist du sicher.“ # quest: maedchen_fort
„Wirklich?“ Sie zögert. Auf einer Treppe im Haus trappeln Schritte, ein Riegel geht, ein zweiter, eine Haustür knarrt. Ein kleiner Schatten huscht über den Platz und bleibt an der Ecke stehen, wo die Treppe zu den Kanälen hinabführt, in der Richtung, in die ihre Mutter gegangen ist. Dann ist er fort. Am Riegel hängt keine weiße Schleife mehr.
-> k1_hub_b

= wieder
{ q_mutter == 1:
    Sie fragt, bevor du am Brunnen bist. „Hast du Mama gefunden?“ Am Riegel schlägt die weiße Schleife im Zug gegen das Holz.
- else:
    Die Finger erscheinen wieder zwischen den Läden. „Du bist ja doch gekommen. Hast du Mama gesehen? Suchst du sie?“
}
+ [„Noch nicht.“ #fliesst]
    „Noch nicht.“ Die Finger bleiben im Spalt. „Dann warte ich noch“, sagt sie. „Ich kann gut warten. Ich bin die Beste im Warten.“
    -> k1_hub_b
+ {not spieluhr} [„Ich finde deine Mama. Versprochen.“ #fliesst]
    ~ q_mutter = 1
    ~ maedchen = maedchen + 1
    „Ich finde deine Mama. Versprochen“, sagst du, und diesmal sagst du es so, dass sie es hört.
    -> spieluhr_geben
+ {not spieluhr and q_mutter == 0} [„Lauf zu der Ärztin in der Klinik.“ #fliesst]
    -> fort

= leer
Das Fenster im ersten Stock ist dunkel. Die Haustür steht einen Spalt offen und bewegt sich im Zug, und drinnen brennt das Räucherwerk herunter, für niemanden. # stimmung: grauen
-> k1_hub_b

=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON lore:orte/zentral-yharnam] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Feuerwaffen sind Vorderlader (LK §19): Pulver und Papier, keine Hülsen.
// [ERWEITERT] Der Alte zählt (Kiesel, fünf und fünf; beim Nachladen zählen die Lippen mit). Das Zählen gehört ihm (Lektorat 1.2).
-> betreten("daecher") ->
{ schuetze == "erledigt":
    Die Gasse ist ruhig. Oben in der Dachrinne liegt verschüttetes Pulver, schwarz auf dem nassen Blech, und daneben das abgebissene Ende einer Papierpatrone, an dem noch die Spuren alter Zähne sind.
    -> k1_hub_b
}
{ schuetze_verschont:
    Die Gasse ist ruhig. Oben hinter dem Schornstein sitzt der Alte ohne Gewehr und zählt seine Kiesel, immer fünf und fünf. Er sieht nicht auf.
    -> k1_hub_b
}
Die Gasse ist so schmal, dass du die Hauswände zu beiden Seiten mit den Ellbogen streifst, und über dir kreuzen sich Dachrinnen, zerbrochene Fensterläden und Wäscheleinen, an denen nichts mehr hängt als eine einzelne hölzerne Klammer. Keine Taube, kein Tropfen. Es riecht nach Schießpulver, frisch, so wie es nur riecht, wenn eben erst jemand geladen hat. # bild: gasse # stimmung: spannung
+ {not schuetze_gesehen} [Langsam, die Dächer im Blick #fliesst]
    Schritt für Schritt, den Blick auf den Dachkanten, und beim zehnten erstarrst du: Hinter einem Schornstein, kaum mehr als ein Umriss, hockt ein alter Mann, gebeugt, eine Schlafmütze auf dem Kopf und in den Händen ein Gewehr, das länger ist als er selbst. Er hat dich noch nicht gesehen. Der Lauf zielt auf eine Stelle der Gasse, zwanzig Schritte vor dir, über die du in drei Atemzügen gegangen wärst. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
+ {not schuetze_gesehen} [Schnell geradeaus hindurch #fliesst]
    Auf halbem Weg kracht hinter dir ein Schuss. Etwas Heißes fährt dir in die Schulter, bevor du begreifst, woher es kam, und das Pflaster springt dir entgegen; du fängst dich mit den Händen. Als du dich umdrehst, lädt auf dem Dach hinter dir, hinter einem Schornstein, ein alter Mann mit zitternden Händen nach, und seine Lippen zählen dabei mit. # klang: schuss
    ~ zuletzt = schuss
    ~ schuetze_gesehen = true
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> oben
+ {schuetze_gesehen} [Wieder zu dem Alten hinauf #fliesst]
    Er sitzt noch hinter seinem Schornstein, das Gewehr auf den Knien, und summt, als du hinaufsiehst.
    -> oben
+ [Auf der Stelle umkehren #fliesst]
    Kaum hast du kehrtgemacht, knirscht über dir ein Dachziegel, dann noch einer, ein Stück weiter, als ginge oben jemand mit dir mit.
    -> k1_hub_b

= oben
+ [Hinaufklettern und ihn stellen #fliesst]
    Über eine Regenrinne hinauf, einen Fenstersims, einen Balken, und als du oben bist, versucht er nachzuladen, aber seine Finger sind zu alt und zu eilig, und das Pulver rieselt ihm neben den Lauf. Er sieht zu dir hoch und klatscht einmal in die Hände. Neben ihm auf dem Sims liegen Kieselsteine, sorgfältig in Reihen gelegt, immer fünf und fünf, so wie man Tage zählt. # stimmung: kampf
    -> schuetze_wahl
+ [Im Hauseingang Deckung suchen #fliesst]
    Im nächsten Hauseingang, den Rücken an der kalten Tür, wartest du, bis oben kein Lauf mehr über die Dachkante ragt. Zurück geht es dicht an der Wand, den Stein an der Schulter, bis die Gasse dich freigibt.
    -> k1_hub_b

= schuetze_wahl
* [Ihm das Gewehr abnehmen und gehen #fliesst]
    ~ schuetze_verschont = true
    Er lässt das Gewehr los wie ein Kind ein Spielzeug, das ihm ohnehin langweilig geworden ist, und fängt an, seine Kiesel neu zu zählen. Unten im Hof schlägt der Kolben auf das Pflaster. Zwei Kiesel nimmst du mit und eine Flasche, in deren Hals ein ölgetränkter Lappen steckt; er zählt weiter, um die Lücke herum. # notiz: kiesel
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_hub_b
* [Es mit der Säge beenden #fliesst]
    Es geht schnell. Er macht dabei einen kleinen, überraschten Laut, mehr nicht. Unter der Schlafmütze ist sein Haar sorgfältig gekämmt und mit Wasser angelegt, wie man es für den Sonntag tut. Zwei von seinen Kieseln steckst du ein und die Flasche mit dem öligen Lappen im Hals; die übrigen liegen weiter in ihren Reihen, fünf und fünf. # notiz: kiesel
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    ~ echos = echos + 1
    -> k1_hub_b

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON lore:figuren/eileen] Eileen auf den Dachbalken über dem Kanaleingang (RK1 §7, §12), Jägerin der Jäger, gibt Jägermarken. Ihre Warnung: Menschen gebe es hier keine mehr, nur Bestien mit Hunger; ein Jäger jage Bestien, die Jäger überlasse er ihr. Sie kennt den Jägertraum (grüßt die kleine Puppe). Nächstes Treffen in Kapitel 1 auf dem Dach über den Gräbern (G2).
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Jägermarke: Wer sie benutzt, verliert alle Blutechos und erwacht wie aus einem bösen Traum (G3). Eileen deutet den Preis an; die Folge steht in den marke-Stellen der Bosskämpfe.
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und Henryk. Die Partnerschaft beginnt erst in Kapitel 2. Die Abzeichen an der Schnur.
// Stimme: heiser, sehr kurz, Sätze ohne Anlauf; beantwortet Fragen mit Gegenfragen oder gar nicht. Ihr Lachen ist ein Krächzen.
-> betreten("eileen") ->
{ eileen_stufe >= 1:
    Auf den Dachbalken ist niemand mehr. Nur eine schwarze Feder liegt dort, wo sie saß, und zittert im Zug, der aus dem Kanal heraufsteigt.
    -> k1_hub_b
}
~ eileen_stufe = 1
Oben laufen alte Dachbalken von Haus zu Haus, schwarz von Ruß und Regen, und auf ihnen, halb hinter ein paar Fässern verborgen, sitzt jemand so still, dass du ihn für einen Haufen alter Kleider gehalten hättest, wenn er nicht den Kopf gedreht hätte. # bild: daecher_eileen # stimmung: ruhig
Es ist eine Frau, in einem Mantel aus schwarzen Federn, die bei jeder Bewegung rascheln, und vor ihrem Gesicht sitzt ein langer, gebogener Schnabel, wie die Pestärzte ihn auf alten Holzschnitten tragen. An einer Schnur um ihren Hals hängen kleine Abzeichen, Messing, Silber, Eisen, jedes anders und jedes abgegriffen; sie klappern, als sie sich vorbeugt und dich lange ansieht. „Neu“, sagt sie, nicht als Frage. „Riecht man.“ Und nach einem Atemzug: „Menschen gibt's hier keine mehr. Nur Hunger mit Gesichtern.“
{ mantel:
    ~ mantel_erkannt = true
    Ihr Schnabel senkt sich zu deinem Mantel, zum Saum, wo das Stück fehlt. Sie streckt die Hand aus und fährt mit dem Daumen über die Schnittkante, glatt, wie mit einer Klinge gezogen. „Wendel“, sagt sie, und zieht die Hand zurück. „Steht dir nicht.“ Unter ihrem Federmantel, an der Schnur mit den Abzeichen, klappert etwas, als sie sich wieder zurücklehnt, und du kannst nicht sehen, welches. # notiz: eileen_mantel
}
* [„Was sind das für Abzeichen?“ #fliesst]
    „Was sind das für Abzeichen?“ Sie fasst die Schnur mit zwei Fingern und lässt die Abzeichen durch die Hand laufen, eins nach dem anderen, und bei jedem hält ihr Daumen kurz an. „Jäger. Die nicht mehr wussten, was sie jagen.“ Sie lässt die Schnur fallen. „Irgendwer muss sie heimbringen. Eileen.“ Erst nach einem Atemzug merkst du, dass das ihr Name war. # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen = eileen + 1
    ~ eileen_genannt = true
* [Die Hand am Griff der Säge lassen #fliesst]
    Sie sieht die Hand am Griff der Säge und nickt, beinahe zufrieden. „Gut. Misstrauen hält länger als Mut.“ Sie klopft gegen die Abzeichen an ihrer Schnur. „Die hier waren mutig. Eileen.“ # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen_genannt = true
* [„Kümmer dich um deine Sachen.“ #fliesst]
    ~ eileen = eileen - 1
    „Kümmer dich um deine Sachen.“ Unter dem Schnabel krächzt es, kurz und rau; so lacht sie. „Tu ich. Genau das tu ich.“ Die Abzeichen klappern. Ihren Namen sagt sie dir nicht. # lore: jaeger_der_jaeger # lore: blutrausch
- Sie greift in ihren Mantel und wirft dir zwei kleine Marken zu, Messing, abgegriffen, mit einem eingeprägten Zeichen, das auf dem Kopf steht, ganz gleich, wie du sie drehst. „Zerdrück sie, und du bist im Garten. Lebend. Für den Fall, dass deine Beine zu langsam sind.“ Sie hält die Hand noch einen Atemzug offen, als wolle sie die Marken zurück. „Kostet alles Blut, das du bei dir trägst. Liegt danach nirgends.“ # notiz: jaegermarke
~ jaegermarken = 2
// [KANON lore:figuren/eileen] Sie kennt den Jägertraum (LK 5.1: grüßt die kleine Puppe).
Du hast niemandem von dem Garten erzählt.
* [„Woher kennst du den Garten?“ #fliesst]
    „Woher kennst du den Garten?“ Keine Antwort. Sie rückt nur die Maske zurecht, und die Abzeichen an ihrem Hals klappern einmal.
* [Die Marken schweigend einstecken #fliesst]
    Die Marken verschwinden in deiner Tasche, ohne ein Wort. Sie sieht, dass du es bemerkt hast, und sagt auch nichts.
- Dann, während sie die Schnur ordnet: „Ein Pater. Groß, Verband über den Augen. Schon gesehen?“ # notiz: eileen_frage
* {q_frau == 1} [„Ja. Er hat mir geholfen.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ja. Er hat mir geholfen.“ Und du erzählst ihr{ mob == "zerstreut":, wie er neben einer Toten kniete und ihren Namen sagte und dir trotzdem zeigte, wie man wartet.|, wie er dich vor der Menge bewahrt und die Bürger beim Namen genannt hat, einen nach dem anderen.} Eileen unterbricht dich nicht. „Hoffentlich bleibt er so“, sagt sie dann. „Er und Henryk, sein alter Partner. Zu lange zusammen draußen. Zu viele Nächte.“ Ihr Daumen liegt auf einem der Abzeichen an der Schnur und bleibt dort. # notiz: henryk
* {q_frau == 1} [Ihr zeigen, wo du ihn gesehen hast #fliesst]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Mit ausgestrecktem Arm zeigst du über die Dächer, dorthin, wo du ihn gesehen hast, und in welche Richtung er gegangen ist. Sie nickt, langsam. Eine ihrer Hände findet die Schnur mit den Abzeichen und hält sie fest. „Danke“, sagt sie. „Ist richtig so.“ Ihre Stimme klingt nicht, als glaube sie es. # notiz: verrat_gascoigne
* {q_frau == 1} [„Nein. Nie gesehen.“ #fliesst]
    „Nein. Nie gesehen.“ Sie nickt, als habe sie diese Antwort erwartet, und der Schnabel bleibt so lange auf dich gerichtet, dass du weißt, wie viel sie dir glaubt und wie viel nicht.
* {q_frau == 0 and gascoigne2} [„Ja. Zwischen den Gräbern.“ #fliesst]
    „Ja. Zwischen den Gräbern.“ Sie sieht in die Richtung der großen Brücke. „Dann weißt du's schon. Wie er riecht.“
* {q_frau == 0 and gascoigne2} [Ihr zeigen, wohin er gegangen ist #fliesst]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Dein Arm zeigt über die Dächer, zu dem Tor hinter dem Friedhof. Sie nickt, langsam. „Danke. Ist richtig so.“ # notiz: verrat_gascoigne
* {q_frau == 0 and not gascoigne2} [„Nein. Wer ist das?“ #fliesst]
    ~ eileen_frage_offen = true
    „Nein. Wer ist das?“ Sie neigt den Schnabel. „Wirst du sehen. Merk dir, wie er riecht.“
- Sie steht auf. „Bestien jagst du“, sagt sie. „Jäger jag ich.“ Sie breitet den Mantel aus wie Flügel und ist mit einem Sprung auf dem nächsten Dach, und von dort ruft sie, ohne sich umzudrehen: „Jäger sehen sich wieder. Meistens zu spät.“ # quest: eileen_treffen
-> k1_hub_b
