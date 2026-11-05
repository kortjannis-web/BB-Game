// KAPITEL 1, TEIL B: ZENTRAL-YHARNAM. Freie Reihenfolge. Führt zu NADELÖHR 1 (Brücke).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt b_yharnam und Übergreifend 2b, 4, 10):
// Ortsbilder in Stimme A, Geschehen in B, alles von der Kirche in C. Alle Optionen fließen in den Satz (#fliesst).
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
-> betreten("zentral") ->
{ k1_hub_b == 1:
    Yharnam ist eine Stadt aus Treppen. Sie steigen und fallen zwischen Häusern, deren Giebel sich so weit über die Gassen neigen, dass zwischen ihnen nur ein Streifen Himmel bleibt, und über den Dächern steht ein Rauch, der sich nicht verzieht. Irgendwo läuten Glocken, unregelmäßig, als zöge niemand an den Seilen. Unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht # klang: glocke
    An den Hauswänden lehnen Särge, aufrecht, mit Ketten an die eisernen Ringe geschlossen, an denen man sonst die Pferde festmacht, als sollte aus ihnen nichts mehr herauskommen. Gleich neben deiner Laterne steht eine Haustür offen, die einzige in der ganzen Straße, und dahinter ist es dunkel.
    Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt, an manchen Häusern drei oder vier übereinander, an einem ein ganzes Dutzend, so dicht, dass das Fenster dahinter verschwindet. Der Geruch ist süß und schwer und legt sich dir auf die Zunge wie ein Tuch auf ein Gesicht. # lore: raeucherwerk
    „Bald ist Jagd“, hat der Kutscher gesagt. Hinter den Fenstern brennt kein Licht als das rote, die Riegel sind vorgeschoben, und auf der ganzen Straße bist du der Einzige, der nicht weiß, worauf alle warten.
- else:
    {
    - mob_verbrannt and not hb_fackel:
        ~ hb_fackel = true
        Vor einer Tür an der Ecke zum Markt liegt eine verkohlte Fackel, sorgsam quer über die Schwelle gelegt. Die Läden der Bäckerei daneben sind geschlossen, und um die Klinke hat jemand ein schwarzes Tuch gebunden.
    - gascoigne2 and not hb_glocke:
        ~ hb_glocke = true
        Irgendwo im Osten schlägt eine Glocke an und hört nicht wieder auf, ein einzelner Ton, immer derselbe, in einem Abstand, in dem man einatmen könnte. Seit den Gräbern zählst du die Schläge mit, und deine Lippen bewegen sich dabei.
    - spieluhr and not hb_uhr:
        ~ hb_uhr = true
        Die Spieluhr in deiner Tasche klickt bei jedem Schritt leise gegen einen Knopf deines Mantels, und du legst die Hand darauf, damit sie still ist, und lässt sie dort.
    - haus_zettel and not hb_bruecke:
        ~ hb_bruecke = true
        Von der Ecke an der Laterne sieht man zwischen zwei Giebeln ein Stück der großen Brücke, einen schwarzen Bogen gegen den Rauch, und auf ihrer ganzen Länge brennt nicht ein Licht. Der Zettel aus dem dunklen Haus knistert in deiner Tasche. # lore: kirche_sperrt_bruecke
    - schreie == 2 and not hb_schrei:
        ~ hb_schrei = true
        Die alte Stimme, die vorhin hinter einer Tür zu beten begann, betet noch immer. Sie ist heiser geworden, aber den Faden hat sie nicht verloren.
    - else:
        {~Die Straßen glänzen nass im Licht der Laterne, und der Rauch über den Dächern hängt dort, wo er vorhin hing.|In einem Käfig an der Ecke wirft sich ein Hund gegen die Stäbe, einmal, zweimal, und hört mitten im Bellen auf. Warum, hast du nicht gesehen.|Eine Glocke schlägt, dann eine zweite, und danach ist es so still, dass du dein eigenes Blut in den Ohren hörst.|In einer fernen Straße ziehen Fackeln vorbei, und jemand singt dazu ein Lied, das wie ein Kinderlied klingt und keines ist.|Die Sonne hängt rot und klein über den Giebeln, an derselben Stelle wie vorhin. Du wartest darauf, dass sie sinkt, und sie sinkt nicht.}
    }
}
// Das Kreischen der Kleriker-Bestie, zweimal, bevor man ihr begegnet: beim ersten Zurückkommen und beim vierten Mal.
{ kleriker == "" and ((schreie == 0 and k1_hub_b >= 2) or (schreie == 1 and k1_hub_b >= 4)):
    -> schrei ->
}
- (wohin)
+ [{not k1_b_gilbert:Hinüber zu dem vergitterten Fenster|Zu Gilbert ans Gitter} #fliesst]
    {not k1_b_gilbert:Hinüber zum Fenster sind es nur ein paar Schritte über nasses Pflaster.|Zu Gilbert ans Gitter gehst du, und schon von Weitem hörst du ihn husten.}
    -> k1_b_gilbert
+ [In die Gasse mit den Räucherlampen #fliesst]
    {not k1_b_tueren:In die Gasse mit den Räucherlampen führen sieben Stufen hinab, in der Mitte zu Mulden ausgetreten.|In die Gasse mit den Räucherlampen steigst du wieder hinab, die sieben ausgetretenen Stufen.}
    -> k1_b_tueren
+ {not k1_b_anschlag} [Zu der schmalen Kapelle hinab #fliesst]
    Zu der schmalen Kapelle führen drei Stufen hinab, glatt vom Nebel.
    -> k1_b_anschlag
+ [Dem Rauch nach die Hauptstraße hinauf #fliesst]
    {not k1_b_scheiterhaufen:Dem Rauch nach gehst du die Hauptstraße hinauf, und der Geruch wird mit jedem Schritt fetter.|Dem Rauch nach gehst du die Hauptstraße hinauf, zurück zu dem Platz.}
    -> k1_b_scheiterhaufen
+ [{spieluhr or maedchen_wo == "fort":Zum Brunnenplatz hinter dem Tor|Zum Brunnenplatz, der Spieluhr nach} #fliesst]
    {spieluhr or maedchen_wo == "fort":Zum Brunnenplatz gehst du, durch das Tor in der Mauer, und diesmal spielt dort keine Melodie.|Zum Brunnenplatz führt dich eine Melodie, so leise, dass du zweimal stehen bleibst, um sicher zu sein, und dann durch ein Tor in der Mauer.}
    -> k1_b_maedchen
+ [In die Gasse unter den Dächern #fliesst]
    {not k1_b_daecher:In die Gasse unter den Dächern biegst du ein, und mit dem ersten Schritt wird es eng.|In die Gasse unter den Dächern biegst du wieder ein.}
    -> k1_b_daecher
+ [Zu den Dachbalken über dem Kanaleingang #fliesst]
    {eileen_stufe == 0:Zu den Dachbalken über dem Kanaleingang führen eiserne Krampen in der Mauer hinauf, kalt und rau vom Rost.|Zu den Dachbalken über dem Kanaleingang steigst du noch einmal hinauf.}
    -> k1_b_eileen
+ {not haus_zettel} [In das dunkle Haus mit der offenen Tür #fliesst]
    {not k1_b_haus:In das dunkle Haus mit der offenen Tür trittst du, und die Schwelle knarrt so laut, dass du stehen bleibst und horchst.|In das dunkle Haus trittst du noch einmal, und die Schwelle knarrt wie beim ersten Mal.}
    -> k1_b_haus
+ {kanal_leiter} [Durch die Kanäle hinab in die Unterstadt #fliesst]
    Durch die Kanäle steigst du hinab, die Leiter entlang, die du schon kennst, bis unten das Rauschen dich wieder aufnimmt.
    -> k1_hub_c
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wohin
+ [An die Laterne treten #fliesst]
    An die Laterne trittst du, an das kleine, schiefe Licht vor der Klinik.
    ~ laterne = -> k1_hub_b
    -> traum_von_laterne
+ {kleriker != "besiegt"} [Hinauf zur großen Brücke #fliesst]
    {not k1_n1_kleriker:Hinauf zur großen Brücke führt eine Straße, die mit jedem Schritt breiter und leerer wird, bis an den Fenstern keine Räucherlampe mehr hängt.|Hinauf zur großen Brücke gehst du noch einmal, und die Räucherlampen bleiben hinter dir zurück.}
    ~ bruecke_von = "oben"
    -> k1_n1_kleriker
+ {kleriker == "besiegt"} [Über die große Brücke hinab #fliesst]
    Über die große Brücke gehst du, vorbei an dem, was auf ihr liegt.
    ~ bruecke_von = "oben"
    -> k1_n1_kleriker

=== schrei ===
// TITEL: Kreischen von der Brücke
~ schreie = schreie + 1
{ schreie:
- 1: Von weit her, aus der Richtung, in der die Stadt über eine Brücke zur Kathedrale hinaufsteigt, kommt ein Laut. Ein Kreischen, zu hoch für ein Tier und zu lang für einen Menschen, das nicht abreißt, so lange, bis dir selbst die Luft knapp wird und du merkst, dass du sie angehalten hast. Hinter einem Fenster löscht jemand hastig eine Kerze, und das rote Räucherlicht davor brennt allein weiter. # klang: kleriker_schrei # stimmung: grauen
- 2: Wieder das Kreischen, und diesmal näher. Ein Wort steckt darin, oder was von einem Wort übrig bleibt, wenn man es lange genug zieht und zerreißt; du hörst es zweimal und könntest beim dritten Mal nicht mehr sagen, welches. Hinter einer Tür beginnt eine alte Stimme zu beten, schnell und tonlos, und hört nicht mehr auf. # klang: kleriker_schrei # stimmung: grauen
}
->->

=== k1_b_gilbert ===
// TITEL: Gilbert
// Handgearbeitet 2026-11-04 nach docs/stimme.md: Ortsbild in Stimme A, Begegnung in Stimme B. Optionen fließen in den Satz (#fliesst).
// 2026-11-05 nur die Befunde des Faktenchecks: Gilbert sitzt (kann nicht aufstehen), Jagdnacht als Gelegenheit und der Osten des Tals, Ludwigs Silberschwert statt der Mondklinge, Merker gilbert_jagd und gilbert_kleriker.
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
    Du sagst, du seist nur auf der Durchreise. Er lächelt, als hättest du einen alten Scherz erzählt, den er gern noch einmal hört. „Das waren wir alle, als wir kamen.“ Er hustet in die Faust und wartet, bis es vorbei ist. „Jäger reden wenig, ich weiß. Ich rede für zwei, das gleicht sich aus.“
* [Dich vom Gitter abwenden #fliesst]
    ~ gilbert = gilbert - 2
    Du wendest dich ab, noch bevor er ausgesprochen hat. Hinter dir weicht das Gesicht vom Gitter zurück, ohne ein Wort des Vorwurfs, und eine Weile ist es still. Dann hustet er wieder, gedämpft, als presse er sich ein Tuch vor den Mund, damit es dich nicht stört.
    -> k1_hub_b
- -> themen

= themen
* [Nach seinem Husten fragen #fliesst]
    Du fragst ihn nach seinem Husten. Er lacht darüber, kurz, und das Lachen kostet ihn einen neuen Anfall. „Eine Krankheit, für die mein Arzt zu Hause keinen Namen hatte“, sagt er, als er wieder kann. „Dann ein Gerücht über diese Stadt, in einer Postkutsche, von einem Mann, der nicht hustete. Dann eine lange Reise.“ Er dreht den zu weiten Ring am Finger. „Man hat mir hier Blut gegeben. Es hat geholfen, eine Weile. Im Spital lagen Leute, bei denen hat es nicht bloß aufgehört zu helfen.“ Sein Blick geht an dir vorbei in die Gasse. „Wir hatten einen Birnbaum hinter dem Haus. Ich denke dauernd an diesen Birnbaum, ist das nicht albern? Gehen Sie, sobald Sie können. Was diese Stadt einem gibt, holt sie sich doppelt zurück.“ # lore: bluttransfusion
    -> themen
* [Nach den verriegelten Türen fragen #fliesst]
    ~ gilbert_jagd = true
    Du fragst, warum in dieser Stadt jede Tür verriegelt ist. „Eine Jagdnacht“, sagt er, als nenne er das Wetter. „Dann schieben die Leute die Riegel vor und hängen Räucherwerk ins Fenster, und wer das Warten nicht mehr aushält, nimmt Fackel und Mistgabel und geht selbst hinaus.“ Er senkt die Stimme, obwohl niemand zuhört. „Was ihnen da draußen begegnet, haben sie meistens gestern noch gegrüßt. Die Seuche macht aus Menschen Bestien, und wen es als Nächsten trifft, weiß keiner. Mich hat es noch nicht getroffen.“ Er hustet. „Noch nicht.“ # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Nach dem bleichen Blut fragen #fliesst]
    Du fragst ihn nach den Worten auf dem Zettel in der Klinik, nach dem bleichen Blut. Er denkt lange nach, die Stirn am Eisen. „Das Wort kenne ich nicht. Aber Blut ist in dieser Stadt die Sache der Heilenden Kirche. Jede Behandlung, jede Ampulle, jeder Tropfen geht durch ihre Hände. Ihr Blut, sagt man, kommt aus der großen Kathedrale, drüben im Osten des Tals, so wie Wasser aus einer Quelle.“ Er hustet, und als er wieder kann, spricht er leiser. „Einem Fremden sagt hier keiner etwas, in gewöhnlichen Nächten. Aber eine Jagdnacht ist keine gewöhnliche; da stehen Türen offen, die sonst zu sind. Nur nicht die, an die man klopft.“ Er hebt die Schultern, so weit das Gitter es zulässt. „Wenn einer weiß, was bleiches Blut ist, dann die Kirche. Ob sie es einem Fremden sagt, ist eine andere Frage.“ # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    -> themen
* {gilbert_bruecke} [Nach dem Weg zur Kathedrale fragen #fliesst]
    Du fragst nach dem Weg hinauf zur Kathedrale.
    { kleriker == "":
        ~ gilbert_kleriker = true
        „Über die große Brücke, einen anderen kenne ich nicht.“ Er lauscht in die Richtung, als könne er es von hier aus hören. „Aber auf der Brücke haust etwas. Es soll einmal in der Kirche gedient haben, gesungen oder gepredigt, so genau weiß das keiner. Man sagt auch, aus Kirchenleuten werden die schlimmsten.“ Er bekreuzigt sich nicht. Er sieht nur sehr müde aus. # lore: kleriker_bestien
    - else:
        „Über die große Brücke.“ Sein Blick geht zu deinen Händen und bleibt dort. „Aber das wissen Sie schon, nicht wahr? Sie waren oben. Ist es … ist es noch da?“ # lore: kleriker_bestien
    }
    -> themen
* {gilbert_bruecke and (k1_b_anschlag or gehrman_jaeger or kleriker == "besiegt")} [Nach den Jägern der Kirche fragen #fliesst]
    // [KANON lore:fraktionen/jaeger] Ludwig führte die ersten Jäger der Kirche an; viele Kirchenjäger waren Kleriker. Hier nur als Gerücht, ohne Namen.
    // [KANON lore:gegenstaende/heilende-kirche] Das Silberschwert ist das Zeichen der Kirchenjäger (Abzeichen der Schwertjäger, auf der Brücke im Fell der Bestie); Ludwig warb Bürger als Jäger an (Kleidung der Yharnam-Jäger).
    // [ERWEITERT] Das Schwert auf den Haustüren und die Kratzer. Die Mondklinge gestrichen (Zusatzinhalt, Wissenssperre).
    Du fragst ihn, wer für die Kirche jagt. Gilbert lehnt die Stirn ans Gitter. „Die Leute hier erzählen von einem, der als Erster für sie gejagt hat. Er hat geworben, wen er bekommen konnte: Fuhrknechte, Gerber, Söhne von Wäscherinnen. Und Kleriker. Viele Kleriker.“ Er wartet, bis der Husten vorbei ist. „Auf den Abzeichen seiner Leute war ein Schwert aus Silber, und eine Zeit lang hat man es ihnen zu Ehren auf die Haustüren gemalt.“ Ein schiefes Lächeln. „Dann hat man es wieder abgekratzt. An manchen Türen sieht man noch die Kratzer. Seinen Namen sagt hier keiner gern; ich habe einmal gefragt, warum, und ringsum sind die Läden zugefallen.“ # notiz: erster_kirchenjaeger
    -> themen
* {grund == "suche"} [Ihm den Menschen beschreiben, den du suchst #fliesst]
    Du beschreibst ihm den Menschen, den du suchst, so gut es sich durch ein Gitter beschreiben lässt, und erzählst vom letzten Brief, der nach Weihrauch roch. Gilbert schüttelt langsam den Kopf. „Hier kommt niemand vorbei, der stehen bleibt. Außer Ihnen.“ Nach einer Weile sagt er: „Weihrauch. Den riecht man nur oben, bei der Kathedrale. Hier unten ist es Räucherwerk, süß und schwer, Sie haben es gerochen. Weihrauch ist etwas anderes.“ # notiz: spur_vermisst
    -> themen
* {q_gilbert == 1 and k1_hub_c} [Ihm von der Unterstadt erzählen #fliesst]
    ~ q_gilbert = 2
    ~ gilbert = gilbert + 1
    Du erzählst ihm von der Brücke, von den Treppen dahinter und von der Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, und von den Gräbern}. Gilbert hört zu, die Stirn am Eisen, und hustet die ganze Zeit kein einziges Mal. „Gibt es da unten Bäume?“, fragt er, als du fertig bist. Du denkst nach und sagst ihm die Wahrheit: einen, verkrüppelt, an einer Treppe. „Einen“, sagt er zufrieden. „Das ist einer mehr, als ich hier habe.“ # quest: gilbert_bericht
    -> themen
+ [Dich verabschieden #fliesst]
    { gilbert >= 0 and not gilbert_geschenk: -> geschenk }
    { gilbert < 0: Du gehst. Hinter dir hustet er und tut nicht so, als hätte er dich gehört. }
    { gilbert >= 0: Du verabschiedest dich. „Gute Jagd“, sagt Gilbert, und er meint es. }
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
// [KANON lore:figuren/einsame-alte-frau] Die einsame alte Frau: Fremde und die Kirche seien schuld; fragt später nach einem sicheren Ort.
// [ERWEITERT] Der Hund vor ihrer Tür, die fromme Stimme und Violas Spur (sie fragte nach dem Weg zu den Gräbern).
-> betreten("tueren") ->
{ k1_b_tueren == 1:
    Unten liegt eine Gasse aus Türen, eine neben der anderen, schwarz gestrichen und mit Eisen beschlagen, und vor jeder hängt eine rote Räucherlampe, deren Rauch an der Hauswand hinaufkriecht, bis er unter dem nächsten Sims hängen bleibt. In einer Jagdnacht klopft man in Yharnam nicht an, sagt man, und wer es doch tut, will etwas, das man ihm besser nicht gibt. # bild: tueren # stimmung: spannung
    Hinter den meisten Türen ist es still, eine Stille, in der jemand den Atem anhält. Hinter einer lacht jemand, laut und schrill, und mehrere Stimmen lachen mit, als feierten sie ein Fest.
    An der ersten Tür, an die du klopfst, fährt dich eine Männerstimme an, noch bevor der Laut verklungen ist: „Ein Fremder. Natürlich. Wer sonst klopft in einer Jagdnacht? Ihr habt sie doch hergebracht, die Seuche, ihr mit eurem kranken Blut, und jetzt wollt ihr rein.“ Ein Riegel wird vorgeschoben, dann ein zweiter, obwohl der erste genügt hätte. # lore: fremde # lore: raeucherwerk
- else:
    Das Lachen hinter der einen Tür hat nicht aufgehört; es ist nur heiserer geworden, und manchmal setzt es aus, als hole drinnen jemand Luft, der es nicht mehr gewohnt ist. # stimmung: spannung
}
- (wahl)
* [Zu der Tür mit dem mageren Hund #fliesst]
    ~ alte_frau = true
    Zu der Tür mit dem mageren Hund gehst du, ganz ans Ende der Gasse, wo eine Treppe hinunter zu den Kanälen führt. Der Hund liegt quer vor der Schwelle und knurrt dich an, ohne aufzustehen; unter dem Fell stehen ihm die Rippen wie die Sprossen einer Leiter. Hinter der Tür antwortet eine alte Stimme, brüchig und bitter. „Fremde. Nichts als Fremde. Und die Kirche lässt sie alle rein mit ihrem Blut, und dann wundert man sich.“ Ein Schniefen, und die Stimme wird dünn. „Das Räucherwerk hält sie fern. Sonst hält gar nichts mehr irgendwas fern.“ # lore: raeucherwerk
    -> frau
* [An der Tür mit den drei Lampen lauschen #fliesst]
    ~ frau_betet = true
    An der Tür mit den drei Lampen lauschst du, und dahinter murmelt eine Frauenstimme ein Gebet, Silbe für Silbe, und bricht ab, als dein Stiefel auf dem Stein knirscht. „Gehen Sie weiter. Gott segne Sie, aber gehen Sie weiter.“ Sie klingt nicht feindselig, nur sehr müde. „Die Kirche hat uns das Räucherwerk gesegnet. Ohne die Kirche wären wir alle schon … Sie verstehen.“ # lore: heilende_kirche
    Dann, leiser, als rede sie mit sich selbst: „Da war vorhin schon eine. Eine Dame, mit so einer großen roten Brosche. Hat geklopft und nach dem Weg zu den Gräbern gefragt. Ich hab nicht aufgemacht.“ Die Silben fangen wieder an, schneller als zuvor. # notiz: viola_spur
    -> wahl
+ {tuer_stimme < 3} [Weiter an den Türen klopfen #fliesst]
    ~ tuer_stimme = tuer_stimme + 1
    { tuer_stimme:
    - 1:
        Weiter klopfst du, an die nächste Tür und die übernächste, und hinter der dritten antwortet ein Mann so schnell, als habe er mit dem Ohr am Holz gewartet. „Hier ist alles bestens. Alle gesund, alle wohlauf, nicht einmal ein Schnupfen im ganzen Haus. Gute Jagd, Herr Jäger.“ Tiefer im Haus hustet jemand, nass und reißend, und der Husten bricht mitten im Anfall ab, gedämpft von einem Kissen oder einer Hand. „Nicht einmal ein Schnupfen“, sagt der Mann noch einmal.
    - 2:
        Weiter klopfst du, und eine Tür weiter kichert eine alte Frau, ehe du die Hand gesenkt hast. „Hören Sie das?“, flüstert sie durch das Schlüsselloch. „Von unten, von den Gräbern. Die murmeln wieder. Wenn die Gräber murmeln, ist es bald so weit.“ Sie klatscht leise in die Hände. „Ich zähle schon die Stunden.“ Du lauschst. Da ist nur das Wasser in den Rinnen, oder beinahe nur das Wasser.
    - 3:
        Weiter klopfst du, und hinter der letzten Tür vor der Treppe fleht eine Frau, so leise, dass du dich bücken musst, um sie zu verstehen: „Bitte nicht. Bitte hören Sie auf zu klopfen. Jeder Laut bringt Unglück ins Haus, jeder einzelne, und wir haben schon so viel davon.“ Dann schweigt sie, und du hörst, dass sie hinter der Tür stehen bleibt und wartet, bis du gehst.
    }
    -> wahl
* [Mit der Faust gegen ein Türblatt schlagen #fliesst]
    Mit der Faust schlägst du gegen ein Türblatt, dreimal, und sagst, was du mit dem Riegel tun wirst, wenn niemand antwortet. Eine junge Stimme antwortet, schnell vor Angst: „Die gehen selbst jagen, die Leute! Mit Fackeln und Gabeln. Am Scheiterhaufen auf der Hauptstraße verbrennen sie alles, was sie für eine Bestie halten, und Fremde halten sie fast immer dafür. Jetzt gehen Sie!“ Dann verflucht sie dich mit Wörtern, die du nicht kennst, und die Lampe vor der Tür schwankt noch, als du dich längst abgewandt hast. # lore: buergerjagd
    -> k1_hub_b
+ [Die Türen hinter dir lassen #fliesst]
    Die Türen lässt du hinter dir, und das Lachen folgt dir noch bis an die Treppe.
    -> k1_hub_b

= frau
// [KANON lore:figuren/einsame-alte-frau] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr einen sicheren Ort versprechen #fliesst]
    ~ alte_frau_versprochen = true
    Einen sicheren Ort versprichst du ihr, irgendwo in dieser Stadt, und dass du ihr Bescheid gibst, wenn du ihn gefunden hast. Sie lacht, ein trockenes, hustendes Lachen. „Sicher. Natürlich.“ Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
* [Ohne Antwort weitergehen #fliesst]
    Ohne Antwort gehst du weiter. Der Hund sieht dir nach, bis du um die Ecke bist, und erst dann legt er den Kopf wieder auf die Pfoten.
- -> k1_hub_b

=== k1_b_anschlag ===
// TITEL: Der Anschlag an der Kapellentür
// [ERWEITERT] Ein Anschlag der Heilenden Kirche zur Jagdnacht, eigener Wortlaut. Das Siegel bleibt unbestimmt (rotes Wachs, abgegriffenes Zeichen): Das Archiv kennt kein Zeichen der Kirche, und ein Kelch zeigte auf Gesperrtes (Faktencheck b_yharnam Nr. 9). Die übereinander geklebten Datumsstreifen: Die Jagd kehrt wieder.
// [KANON lore:fraktionen/heilende-kirche] Die Kirche verwaltet das Blut; die Bürger verriegeln sich mit Räucherwerk.
// Die Kirche ist in Kapitel 1 nur zu hören und zu lesen, nie zu sehen (Entscheidung des Nutzers 2026-11-04). Ortsbild A, der Anschlag C, das Atmen hinter der Tür B.
-> betreten("anschlag") ->
Sie duckt sich zwischen zwei Häuser, kaum breiter als ein Hauseingang, mit einer Tür aus schwarzem Holz und einem Fenster darüber, das man von innen mit Brettern vernagelt hat. Auf der Tür hängt ein Anschlag, mit vier Nägeln befestigt; drei sind braun vor Rost, der vierte ist neu und blank. Das Papier ist nass vom Nebel und riecht, als du dich vorbeugst, nicht nach dem süßen Räucherwerk der Gassen, sondern herb und harzig, nach Weihrauch. # bild: tueren # stimmung: spannung
Oben sitzt ein Siegel aus rotem Wachs, darin ein Zeichen, so oft gestempelt, dass seine Linien sich abgegriffen haben wie die Prägung einer Münze, die durch zu viele Hände ging. Darunter steht in großen, sauberen Lettern:
An die Gemeinde in der Nacht der Jagd. Bleibt in euren Häusern und lasst das Räucherwerk nicht erlöschen. Die Jäger der Kirche wachen über euch. Wer Fieber an sich spürt, wer Durst hat, den kein Wasser stillt, wer seine eigene Stimme fremd findet, der zögere nicht und begebe sich zur nächsten Stelle des Blutes. Das Blut der Kirche heilt, was es berührt. Fürchtet nicht das Blut. Fürchtet, was ohne das Blut aus euch würde. # stil: anschlag # lore: heilende_kirche
Gegeben im Namen der Heilenden Kirche, zur Nacht der Jagd. # stil: anschlag
Das Datum unter der letzten Zeile steht auf einem schmalen Papierstreifen, der über einen älteren geklebt ist, und an der Kante, wo der Nebel den Leim gelöst hat, siehst du, dass unter dem älteren noch weitere liegen, Streifen auf Streifen, jeder ein wenig gelber als der darüber.
Unten auf der Tür, unter dem Papier, hat jemand mit Kreide etwas dazugeschrieben, klein und schief, und dann versucht, es mit dem Ärmel wegzuwischen. Lesbar ist es noch: Mein Bruder ist gegangen. Er hatte keinen Durst. # notiz: anschlag_kreide
Hinter der Tür, ganz nah am Holz, atmet jemand. Als dein Schatten auf die Tür fällt, hört das Atmen auf.
-> k1_hub_b

=== k1_b_haus ===
// TITEL: Das dunkle Haus (Zettel über die Brücke)
// [KANON lore:welt/notizen] Notiz Nr. 2 (LK §21.1): Beim Beginn der Jagd ließ die Heilende Kirche die Bewohner im Stich und sperrte die Große Brücke, während der alte Stadtteil in jener Nacht brannte. Fundort: das dunkle Haus nahe der ersten Laterne, Regal im ersten Stock neben einem Rollstuhl-Bürger. Gegenpol zum Anschlag (Faktencheck Übergreifend 2b, b_yharnam Nr. 6).
// [KANON lore:gegner/rollstuhl-mob] Bürger im Rollstuhl: Wahnlachen, atmet in Ruhe nur durch den Mund, greift aus dem Stuhl heraus an.
// [ERWEITERT] Wortlaut und Schreiber des Zettels; der eine Takt mit der Pistole. Den alten Stadtteil nicht beim Namen nennen, nur „unten im Tal, wo die Stadt früher war“ (Faktencheck).
// [Deutung, nie aussprechen] Der Rollstuhl gleicht dem des Mannes in der Klinik (RK1 §1). Nur stehen lassen.
-> betreten("haus") ->
{ k1_b_haus == 1:
    Hinter der Tür liegt ein Flur, in dem seit Wochen niemand Licht gemacht hat, und eine Treppe, auf deren Stufen der Staub so dick liegt, dass deine Stiefel Abdrücke hinterlassen wie im ersten Schnee. Nur in der Mitte jeder Stufe ist er weggewischt, in zwei schmalen, gleichmäßigen Bahnen. Es riecht nach kaltem Talg und nach einem Zimmer, in dem jemand schläft. # bild: haus_dunkel # stimmung: spannung
- else:
    Wieder die Treppe und die zwei schmalen Bahnen im Staub, und oben das Atmen, von dem du jetzt weißt, wem es gehört. # bild: haus_dunkel # stimmung: spannung
}
Im ersten Stock steht ein Rollstuhl mit dem Rücken zum Fenster, und in ihm sitzt eine Gestalt unter einer Decke, den Kopf auf der Brust. Sie atmet durch den offenen Mund, lang und feucht, und als die Diele unter dir knarrt, hebt sie den Kopf und lacht, ein hohes, fröhliches Lachen, das nicht aufhört, während unter der Decke eine Hand hervorkommt und in der Hand eine Pistole, deren Lauf erst zittert und dann ganz still wird. Rechts von dir steht ein Schrank mit einer schweren Eichentür; links ist nur die nackte Wand. # anzeichen: schuss # kampf: rollstuhl
+ [Nach rechts hinter den Schrank #fliesst]
    Nach rechts wirfst du dich, hinter den Schrank, und der Schuss schlägt in die Eichentür, dass die Splitter fliegen. Bevor er nachladen kann, bist du bei ihm und drehst ihm die Pistole aus der Hand. Er wehrt sich nicht. Er lacht weiter, durch den offenen Mund, und seine Augen folgen dir wie einem Witz, den er noch nicht ganz verstanden hat.
+ [Geradeaus auf ihn zu #fliesst]
    Geradeaus gehst du auf ihn zu, und auf halbem Weg schießt er. Die Kugel fährt dir in die Seite, heiß und dumpf zugleich.
    ~ zuletzt = schuss
    ~ treffer(1)
    { leben <= 0: -> tod }
    Dann bist du bei ihm und drehst ihm die Pistole aus der Hand. Er lacht weiter, durch den offenen Mund, als hätte er gewonnen.
-
~ haus_zettel = true
Neben dem Rollstuhl steht ein Regal, und darauf, zwischen einer leeren Tasse und einem Gebetbuch mit gebrochenem Rücken, liegt ein Zettel, mehrmals gefaltet und wieder glattgestrichen. Die Schrift gehört einem, der selten schreibt und deshalb fest aufdrückt:
Als die Jagd begann, sperrte die Kirche die große Brücke und überließ uns hier unten uns selbst. Unten im Tal, wo die Stadt früher war, brannte es die ganze Nacht, und von oben kam keiner. Sie wachen über uns, schreiben sie an die Türen; über ihre Brücke wachen sie. # stil: tagebuch # lore: kirche_sperrt_bruecke
Du steckst den Zettel ein. Als du schon auf der Treppe bist, hörst du, wie der Mann oben wieder durch den Mund zu atmen beginnt, lang und feucht, als hätte ihn nie jemand gestört.
-> k1_hub_b

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON lore:gegner/jagdmeute] Mob aus bewaffneten Bürgern, die den Fremden für den Überträger halten und rufen, er trage die Krankheit, er solle brennen (LK §20.1, §22.2; den Ruf mit Willem nicht verwenden).
// [KANON lore:gegner/ziegel-troll] Der Riese mit dem Ziegel hämmert an eine Tür, murmelt von Kälte und einer Schwester und brüllt beim Schlag, alles sei deine Schuld. Unerklärt lassen.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Gascoignes Kleidung ist von Bestiengestank durchdrungen, der an ihm zehrt; „Vater“ ist ein Titel aus einem fremden Land. Breitkrempiger Hut (Artbook, orte/zentral-yharnam).
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade, fragt nach deinem Namen, teilt Branntwein aus seiner Heimat (Torf und Rauch, G8) und bittet um einen Gruß an seine Frau. Hat der Spieler Martha verbrannt, bleibt er kalt: keine Flasche, die Parade ohne Blick, die Bitte nur, weil er niemand anderen hat, die Einladung zur Brücke nur bei gascoigne >= 0.
// Stimme Gascoigne (gesund): tief, ruhig, kurze Sätze, warm und spaßig, nennt Leute beim Namen, sagt „Fremder“, bis er deinen Namen hat; beendet Dinge mit „So.“ Wärme, die zerbricht: der Geruch, das Spiel der Bestie, ein Blick zum Feuer.
-> betreten("scheiterhaufen") ->
{ mob != "": -> danach }
{ k1_b_scheiterhaufen == 1:
    Die Hauptstraße öffnet sich zu einem Platz, und in seiner Mitte brennt ein Scheiterhaufen, höher als die Dachtraufen ringsum. Oben, an einen Pfahl gebunden, hängt etwas Großes, Behaartes, das sich nicht mehr regt; die Flammen haben ihm das Fell schwarz gefressen, und der Rauch, der von ihm aufsteigt, riecht süßlich und fett, nach einem Schlachttag, an dem keiner sein Handwerk verstand. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
    Um das Feuer stehen Menschen, ein Dutzend oder mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln und Beilen, einer mit einem alten Gewehr, dessen Kolben mit Draht geflickt ist. Sie murmeln, alle zugleich und doch nicht zusammen. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens. Zwischen zwei Schlägen murmelt er, und was er murmelt, gilt nicht der Tür: „Kalt ist es, Schwesterchen. So kalt.“
    Dann dreht sich der Erste zu dir um, und dann alle, und im Feuerschein glänzen ihre Augen wie die von Tieren am Waldrand. „Der da“, ruft eine Frau. „Der trägt sie an sich, die Seuche, riecht ihr das nicht?“ Und ein Mann, heiser vom Rauch: „Brennen soll er! Brennen wie das da oben!“ # kampf: mob
- else:
    Der Scheiterhaufen ist heruntergebrannt bis auf Mannshöhe, und die Menge steht um ihn, als hätte sie sich nicht gerührt, seit du gegangen bist. Der Riese schlägt noch immer gegen die Tür. Diesmal dreht sich keiner langsam um. „Da ist er wieder“, ruft einer, „der Fremde, der so stinkt!“ # bild: scheiterhaufen # stimmung: spannung # kampf: mob
}
+ [Stehen bleiben und die Säge ausklappen #fliesst]
    Stehen bleibst du, und die Säge klappt in deiner Hand auf, mit einem Schnappen, das lauter ist als das Feuer.
    -> kampf
+ [In den Schatten um den Platz herum #fliesst]
    ~ mob = "umgangen"
    In den Schatten um den Platz herum drückst du dich, an den Hauswänden entlang, Schritt für Schritt, und dein Puls klopft dir bis in die Zähne. Fast hast du den Platz hinter dir, als ein Kind, das du nicht gesehen hast, mit dem Finger auf dich zeigt und schreit: „Da! Der Fremde! Da ist er!“
    -> gascoigne_greift_ein
+ [Rückwärts in die Gasse zurückweichen #fliesst]
    Rückwärts weichst du in die Gasse zurück, bevor sie dich erreichen. Ihr Murmeln schwillt an und ebbt wieder ab, und keiner folgt dir. Noch nicht.
    -> k1_hub_b

= kampf
- (t1)
Sie kommen von zwei Seiten zugleich, aber nicht gleich schnell. Ein hagerer Mann mit einer Mistgabel löst sich als Erster aus der Menge, die Zinken tief und auf deinen Bauch gerichtet, und hinter dir öffnet sich die Gasse, aus der du gekommen bist, so eng, dass darin keine zwei Mann nebeneinander Platz haben. # anzeichen: mobhieb
{ herkunft == "gesuchter": Eine Frau in der zweiten Reihe starrt dich an, als kenne sie dein Gesicht von einem Anschlag. Vielleicht tut sie das. }
+ [Nach hinten in die enge Gasse #fliesst]
    Nach hinten weichst du, rückwärts in die enge Gasse, Schritt um Schritt, und die Menge drängt nach, bis sie sich selbst im Weg steht, Schulter an Schulter, die Gabeln ineinander verkeilt. Du triffst den Ersten. Dann den Zweiten.
    -> t2
+ [Nach vorn mitten in die Menge #fliesst]
    Nach vorn stürzt du dich, mitten hinein, und für einen Herzschlag glaubst du, sie werde zurückweichen. Sie weicht nicht. Die Zinken fahren dir in die Seite, ein Beil streift deinen Arm.
    ~ zuletzt = mobhieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Gilberts Feuer in die Menge halten #fliesst]
    Gilberts Feuer hältst du in die Menge, und aus der Düse fährt eine Zunge, gelb und brüllend. Sie schreien, jeder für sich, erschrockene Menschen, die eben noch eine Menge waren, und stieben auseinander, in Gassen und Hauseingänge. Eine bleibt liegen. Ihre Schürze brennt noch, als sie schon still ist, und die Düse in deiner Hand ist warm.
    ~ mob = "zerstreut"
    ~ mob_verbrannt = true
    Von oben, von der Kathedrale her, setzt ein Choral ein, langsam und fern, in Stimmen, die jede Silbe sauber zu Ende singen, und er kommt so genau, als habe er auf diesen Augenblick gewartet. Die Frau am Boden rührt sich nicht. # klang: choral
    -> gascoigne_greift_ein
- (t2)
Mehr kommen. Der Riese hat aufgehört, gegen die Tür zu schlagen; er dreht sich um, den Ziegel in der Faust, und brüllt über den Platz, mit einer Stimme, die überschnappt wie die eines Jungen: „Du! Du bist schuld! An allem bist du schuld!“ Dann rennt er, schwerfällig und unaufhaltsam, mitten durch die eigenen Leute. Links, zwischen einer Frau mit einem Beil und dem Pfahl einer Gaslaterne, steht der Kreis nur einen Mann tief. # anzeichen: riese_ansturm
+ [Links durch die Lücke im Kreis #fliesst]
    Links durch die Lücke wirfst du dich, zwischen dem Beil und dem Laternenpfahl hindurch. Ein Ellbogen trifft dein Kinn, ein Stiefel dein Knie, aber du bist draußen, und hinter dir schlägt der Riese in die eigenen Leute.
    ~ zuletzt = riese_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ [Dem Riesen von vorn entgegen #fliesst]
    Dem Riesen trittst du von vorn entgegen. Der Ziegel trifft dich an der Schulter, und die Welt wird für einen Augenblick weiß.
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
    Über den Platz kommt ein Mann, zu spät für alles, groß und breitschultrig, in einem langen Jägermantel, einen Hut mit breiter Krempe tief in der Stirn und um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem geht er geradewegs auf die Frau zu, die liegen geblieben ist, ohne einmal den Kopf zu wenden. Er kniet sich neben sie und nimmt ihre Hand, obwohl sie schwarz ist. „Martha“, sagt er. Nur das. # stimmung: grauen # lore: gascoigne
    Als er aufsteht, streift sein Mantel deinen Arm, und unter Teer und Rauch riecht er nach etwas anderem, nach nassem Fell in einem geschlossenen Flur. Er wendet dir den Verband zu. „Gascoigne“, sagt er. „Ich jage hier, seit vielen Jahren. Sie hat mir Brot gegeben, wenn ich spät kam.“ Er schweigt. „So.“
    ~ gascoigne = gascoigne - 1
- else:
    Ein Schuss kracht über den Platz{mob == "durchbrochen":, hinter dir}, so laut, dass die Scheiben in den Fensterrahmen klirren. Zwischen dich und die Bürger tritt ein Mann, groß und breitschultrig, in einem langen Jägermantel, einen Hut mit breiter Krempe tief in der Stirn und um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem dreht er den Kopf von einem zum anderen, als sehe er jeden Einzelnen. In der einen Hand hält er eine Axt, in der anderen eine Donnerbüchse, aus deren Trichter noch Rauch steigt. # stimmung: ruhig # lore: gascoigne
    „Martha“, sagt er, ruhig und tief, mit einem Rollen in der Stimme, das nicht aus diesen Gassen stammt. „Hennings. Brack, du alter Esel, nimm die Gabel runter. Geht heim. Geht heim zu euren Kindern.“ Und sie gehen, einer nach dem anderen, die Fackeln gesenkt; eine Frau mit Mehl an den Ärmeln nickt ihm im Vorbeigehen zu, beinahe verlegen, und selbst der Riese trottet davon und zieht den Ziegel hinter sich her über das Pflaster.
    Dann wendet er sich dir zu und streckt dir die Hand hin. Sie ist warm und trocken und sehr groß. Unter Teer und Pulver riecht er nach etwas anderem, nach nassem Fell in einem geschlossenen Flur, und er merkt, dass du es merkst, und tritt einen halben Schritt zurück, ohne deine Hand loszulassen. „Gascoigne. Pater, wenn man's genau nimmt, aber so nennt mich hier keiner. In dieser Stadt gibt's keine Pater, nur Vikare und Jäger.“ Er legt den Kopf schief. „Und du bist auch nicht von hier, Fremder. Man hört es an deinen Stiefeln.“ # notiz: gascoigne_pater
    { herkunft == "soldat": „Und du gehst wie einer, der Gräben kennt“, fügt er hinzu. „Ich auch. Lange her.“ }
}
{ mantel: -> mantel_frage }
- (nach_mantel)
* {mob == "zerstreut"} [„Ich hatte keine Wahl.“ #fliesst]
    „Ich hatte keine Wahl“, sagst du, und hörst selbst, wie dünn es klingt. „Man hat immer eine“, sagt er. „Meistens eine schlechte.“ Er wischt sich die Hand am Mantel ab, obwohl nichts daran ist.
* {mob == "zerstreut"} [„Wer war sie?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Wer war sie?“, fragst du. „Martha. Hat unten am Markt Brot gebacken, mit zu viel Kümmel, immer, und jeder hat's ihr gesagt, und sie hat's nie gelassen.“ Er schweigt. „Sie hatte Angst vor dir. Deshalb stand sie hier.“
* {mob == "zerstreut"} [Schweigend neben ihm stehen bleiben #fliesst]
    Schweigend bleibst du neben ihm stehen. Er sagt auch nichts. Das Feuer auf dem Scheiterhaufen knackt, und irgendwann fällt oben etwas vom Pfahl in die Glut.
* {mob != "zerstreut"} [Ihm danken #fliesst]
    ~ gascoigne = gascoigne + 1
    Du dankst ihm, und er winkt ab, aber unter dem Verband ziehen sich seine Mundwinkel nach oben. „Bedankt wird sich selten bei einem Jäger. Meistens macht man nur die Tür zu.“ Er zeigt mit dem Daumen über die Schulter, dorthin, wo die Bürger verschwunden sind. „Die da danken mir morgen auch wieder nicht. Ist schon recht.“
* {mob != "zerstreut"} [„Warum hilfst du einem Fremden?“ #fliesst]
    // [ERWEITERT] Der Mann mit den Federn am Hut ist Henryk (Artbook: Federn am Hut), hier ohne Namen; der Name fällt erst bei Eileen.
    ~ gascoigne = gascoigne + 1
    „Warum hilfst du einem Fremden?“, fragst du. „Weil ich selbst einer war“, sagt er. „Und es manchmal vergesse. Damals hat mir auch einer geholfen, ein Dürrer mit Federn am Hut, der mich ausgelacht hat, weil ich die Axt verkehrt herum hielt.“ Unter dem Verband lächelt er, warm und ein wenig schief.
* {mob != "zerstreut"} [„Das hätte ich auch allein geschafft.“ #fliesst]
    „Das hätte ich auch allein geschafft“, sagst du. Er lacht, laut und herzlich, und schlägt dir auf die Schulter, genau auf die Stelle, die wehtut. „Natürlich. Natürlich hättest du das.“
- { mob == "zerstreut": „Und du“, sagt er, ohne dich anzusehen. „Wie heißt einer, der so was tut?“ | „Wie heißt du, Fremder?“ }
* [Ihm deinen Namen sagen #fliesst]
    ~ gascoigne_name = true
    ~ gascoigne = gascoigne + 1
    Du sagst ihm deinen Namen. { mob == "zerstreut": Er wiederholt ihn nicht. Er nickt nur, so wie man etwas annimmt, das man nicht bestellt hat, und es trotzdem nicht zurückgibt.| „{name}“, wiederholt er, und in seinem Mund klingt es schwerer, als hätte er dem Namen ein Gewicht angehängt. „Gut. Den behalte ich.“}
* [„Jäger. Das muss reichen.“ #fliesst]
    „Jäger. Das muss reichen“, sagst du. { mob == "zerstreut": „Reicht“, sagt er. „Für heute.“| Er nickt, als sei das eine ehrliche Antwort. „Dann eben Fremder. Bis du es dir anders überlegst.“}
-
~ parade = true
~ parade_quelle = "gascoigne"
{ mob == "zerstreut":
    Dann nimmt er dir die Feuerwaffe aus der Hand und wiegt sie. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Er zeigt es dir, mitten auf dem Platz, ohne dich dabei anzusehen: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach.“ Er gibt dir die Waffe zurück. „Damit du beim nächsten Mal kein Feuer brauchst.“ # lore: parade
- else:
    Er nimmt deine Feuerwaffe, wiegt sie in der Hand und gibt sie dir zurück. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Und dann zeigt er es dir, mitten auf dem Platz, mit dem Feuer im Rücken, und spielt dir die Bestie gleich mit, den Arm hoch über dem Kopf, das Knurren tief in der Kehle, so gut, dass über euch ein Fensterladen zuschlägt: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach. Dann wankt sie, und dann gehört sie dir. So.“ # lore: parade
    Er lehnt sich an einen Laternenpfahl und zieht eine flache Blechflasche aus dem Mantel. „Gegen die Kälte. Und gegen das andere.“ { mantel_gelogen: Er trinkt zuerst und reicht sie dir, ohne den Hals abzuwischen.| Er reicht sie dir zuerst, und als du getrunken hast, nimmt er sie zurück und wischt den Hals mit dem Ärmel ab, sorgfältig, wie ein Mann, der das zu Hause für jemanden tut.} Der Branntwein ist scharf und schmeckt nach Torf und Rauch, nach einem Land mit mehr Moor als Straßen. „Von daheim“, sagt er. „Das Letzte, was ich davon hab.“ # notiz: gascoigne_flasche
    Einmal, mitten im Trinken, dreht er den Kopf zum Scheiterhaufen und zieht die Luft ein, tief, und was dabei über sein Gesicht geht, ist kein Ekel. Dann schraubt er die Flasche zu.
}
{ mob == "zerstreut":
    Er wendet sich zum Gehen und bleibt nach drei Schritten stehen. „Eins noch.“ Er sagt es zum Pflaster vor seinen Stiefeln. „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie soll bei der Kleinen bleiben.“ Eine Pause. „Ich hab heute Nacht keinen, den ich sonst fragen könnte.“ # quest: gascoigne_frau
- else:
    Dann sagt er, beinahe verlegen: „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie macht sich immer Sorgen. Sie soll bei der Kleinen bleiben.“ # quest: gascoigne_frau
}
* [„Ich richte es ihr aus.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ich richte es ihr aus“, sagst du. Er nickt, und etwas in seinen Schultern löst sich{mob == "zerstreut":, nicht viel, eine Fingerbreite}.
* [Ihm stumm zunicken #fliesst]
    Stumm nickst du ihm zu. Er nickt zurück, trotz des Verbandes, genau im selben Augenblick.
-
{
- kleriker != "besiegt" and gascoigne >= 0 and mob == "zerstreut":
    // [ERWEITERT] Gascoigne glaubt, die Bestie auf der Brücke gekannt zu haben. Wer sie war, ist im Kanon [OFFEN]; die Hochzeit nennt er erst auf der Brücke (n1_kleriker), nicht hier.
    „Und wenn du zur großen Brücke gehst …“ Er dreht sich halb um. „Ruf mich. Da oben haust einer, den ich, glaub ich, kenne.“ Dann geht er in den Rauch, und wo er stand, riecht die Luft noch eine Weile nach nassem Fell. # quest: gascoigne_bruecke
- kleriker != "besiegt" and gascoigne >= 0:
    „Und noch was.“ Er stößt sich vom Laternenpfahl ab. „Wenn du zur großen Brücke gehst, ruf mich. Da oben haust einer, den ich, glaub ich, kenne. Ich will ihn mir ansehen.“ Er tippt gegen den Verband und grinst. „So gut das eben geht.“ Dann geht er in den Rauch, und eine Weile hörst du noch seine Stiefel. # quest: gascoigne_bruecke
- mob == "zerstreut":
    Er geht in den Rauch, ohne sich umzudrehen, und wo er stand, riecht die Luft noch eine Weile nach nassem Fell.
- else:
    „Pass auf dich auf, {gascoigne_name:{name}|Fremder}.“ Er tippt an die Krempe seines Hutes und geht in den Rauch.
}
-> k1_hub_b

= ohne_ihn
// Gascoigne ist schon hinter dem Tor des Oedon. Der Schuss kommt aus dem Nebel; niemand tritt hervor.
Ein Schuss kracht über den Platz. Die Menge stiebt auseinander, als wüsste jeder Einzelne, wem dieser Knall gehört, und lässt dir eine Gasse frei. Niemand tritt aus dem Rauch. Wo der Schuss herkam, ist nur Nebel, und auf dem Pflaster, frisch und dunkel, eine Spur von Stiefelabdrücken, die zur großen Brücke führt. Sie glänzen. # stimmung: grauen # notiz: blutige_spur
-> k1_hub_b

= danach
{ mob:
- "zerstreut": Der Platz ist leer. Verlassene Fackeln liegen auf dem Pflaster und rauchen noch. Jemand hat eine Decke über die Frau gelegt, die liegen geblieben ist, und auf die Decke einen Kanten Brot, und wer es war, weißt du nicht.
- else: Das Feuer ist heruntergebrannt, und doch hängt auf dem Pfahl wieder etwas, schwarz und still, als hätte die Nacht es neu aufgehängt. Du siehst nicht genauer hin.
}
-> k1_hub_b

= mantel_frage
// [ERWEITERT] Wendels Mantel: Gascoigne kennt den Geruch. Er wird misstrauisch. Sein eigener Geruch (nasses Fell) ist dann schon gefallen; hier riecht er an dir, nicht umgekehrt.
{ mob == "zerstreut": Er tritt einen Schritt näher, beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Sein Gesicht wird noch eine Spur härter, so wie Reif auf einer Scheibe dichter wird.| Dann hält er inne, die Hand noch halb erhoben, als habe ihn dein Blick auf etwas gebracht. Er beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Dann richtet er sich auf, und das Freundliche geht aus seinem Gesicht, nicht ganz, aber so, wie die Wärme aus einem Zimmer geht, wenn jemand die Tür offen lässt.}
„Teer. Pulver. Und Wendel.“ Er sagt den Namen, als lege er ihn auf einen Tisch. „Wendel ist seit zwei Jagden nicht heimgekommen. Woher hast du seinen Mantel?“
~ mantel_erkannt = true
* [Ihm die Wahrheit über den Mantel sagen #fliesst]
    // [ERWEITERT] PRÜFEN: Ob Gascoigne den Jägertraum kennt, ist [Offen]. Er glaubt dir, ohne zu sagen, warum.
    Die Wahrheit sagst du ihm, so wie sie war: der Garten, das Becken, die kleinen grauen Hände. Es klingt verrückt, noch während du es sagst. Gascoigne schweigt lange. „Im Traum“, sagt er endlich. „Von denen.“ Er reibt sich mit dem Daumen über den Verband, dort, wo die Augen sein müssten. „Das glaub ich dir. Das ist ja das Schlimme.“ # notiz: gascoigne_mantel
* [„Der lag in einer Gasse.“ #fliesst]
    ~ mantel_gelogen = true
    ~ gascoigne = gascoigne - 1
    „Der lag in einer Gasse“, sagst du, „einfach so.“ Gascoigne nickt langsam. „Wendel lag in keiner Gasse“, sagt er. „Wendel lag nie irgendwo. So.“ Mehr sagt er nicht dazu, aber als er dir den Rücken zuwendet, tut er es einen halben Schritt später als vorher. # notiz: gascoigne_mantel
- -> gascoigne_greift_ein.nach_mantel

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON lore:figuren/maedchen-und-viola] Gascoignes Tochter; erkennt den Jäger am Geruch, nicht an der Stimme; die Mutter (Viola) ging den Vater suchen; Spieluhr mit dem Lied des Vaters, das ihn an die Familie erinnert, wenn er vergisst; Namen im Deckel; die Mutter sei schusselig; sie erwähnt einen Großvater. Sie trägt eine große weiße Schleife (G1); rot wird das Band erst beim Schwein.
// [ERWEITERT] Die Schleife am Riegel als Zeichen für die Mutter. Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation (erkennbar: Sie will selbst suchen gehen, und Iosefka öffnet niemandem).
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat.
-> betreten("maedchen") ->
{ maedchen_wo == "fort": -> leer }
{ k1_b_maedchen > 1: -> wieder }
~ maedchen_gesehen = true
Hinter dem Tor liegt ein kleiner Platz mit einem versiegten Brunnen, dessen Becken voller Laub und zerbrochener Ziegel ist, und ringsum stehen schmale Häuser, so dicht, dass ihre Fenster einander in die Läden sehen. Mitten in all dem Rauch und Räucherwerk spielt eine Spieluhr, dünn und klar, ein Lied, das du nicht kennst und das dir trotzdem den Hals eng macht, so wie es nur Lieder tun, die man als Kind gehört hat. # bild: brunnenplatz # stimmung: schoen
Die Melodie kommt aus einem Fenster im ersten Stock. Durch die Ritzen der Läden hängt eine weiße Haarschleife, um den Riegel geknotet, das Band so lang, dass es im Zug gegen das Holz schlägt, ein Zeichen für jemanden, der den Weg nach Hause sucht. # lore: familie_gascoigne
Als du näher kommst, bricht die Melodie mitten im Takt ab. Hinter den Läden zieht jemand die Luft ein, kurz und prüfend. „Du riechst wie Papa, wenn er spät heimkommt“, sagt eine dünne Stimme. „Bist du ein Jäger?“
Zwischen den Läden erscheinen vier kleine Finger, dann zwei Augen, sehr ernst. „Papa ist auf die Jagd gegangen und nicht wiedergekommen. Und Mama ist gegangen, ihn zu suchen, und auch nicht wiedergekommen. Und Opa ist auch nicht da. Ich hab die Tür zugemacht, so wie Mama gesagt hat. Ich hab das Räucherwerk angezündet. Ich hab meine Schleife rausgehängt, damit Mama das Fenster findet. Ich hab alles richtig gemacht.“
Dann, mit einem Trotz, der größer ist als sie: „Wenn Mama nicht bald kommt, geh ich selber und such sie.“ # notiz: maedchen_warnung
* [„Ich finde deine Mama.“ #fliesst]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    „Ich finde deine Mama“, sagst du. Hinter den Läden ist es einen Moment still. Dann, ganz leise: „Versprochen?“ Und bevor du antworten kannst: „Danke.“
    -> spieluhr_geben
* [„Woran erkenne ich deine Mama?“ #fliesst]
    ~ q_mutter = 1
    „Woran erkenne ich deine Mama?“, fragst du. „An der Brosche“, sagt sie sofort. „Mama trägt immer die große rote Brosche. Die sieht man von Weitem, die ist schöner als alles.“
    -> spieluhr_geben
* [„Lauf zu der Ärztin in der Klinik.“ #fliesst]
    -> fort
* [Dich ohne ein Versprechen abwenden #fliesst]
    Ohne ein Versprechen wendest du dich ab. „Kommst du wieder?“, fragt sie. Du antwortest nicht, und die Finger verschwinden aus dem Spalt.
    -> k1_hub_b

= spieluhr_geben
// [KANON lore:figuren/maedchen-und-viola] Inhalt sinngemäß, Wortlaut eigen.
Etwas schabt am Fensterbrett, und durch den Spalt zwischen den Läden schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. „Die ist von Papa. Papa wird manchmal ganz fremd, so mit den Augen, als wüsst er nicht, wer wir sind. Dann zieh ich die auf, und er hört zu, und hinterher ist er wieder Papa.“ Sie schiebt sie noch ein Stück weiter. „Mama hätte sie mitnehmen müssen. Sie hat sie hier auf dem Tisch vergessen, Mama vergisst immer was. Bring sie ihr.“ # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Du öffnest den Deckel. Innen klebt ein vergilbter Zettel mit zwei Namen, in einer feinen Schrift, deren V einen kleinen Kringel nach links macht: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Der Deckel bleibt offen in deiner Hand. Ein Mann mit verbundenen Augen und einem Priesterschal{mob != "zerstreut":, eine Flasche, die nach Torf und Rauch schmeckt}, eine Frau mit einer roten Brosche, der du ausrichten sollst, dass er bald kommt. Du klappst den Deckel zu, und das Geräusch ist lauter, als es sein dürfte.
}
-> k1_hub_b

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien. Die weiße Schleife nimmt sie mit.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
„Lauf zu der Ärztin in der Klinik“, sagst du. „Dort bist du sicher.“ # quest: maedchen_fort
„Wirklich?“ Sie zögert. Dann hörst du ihre Schritte auf einer Treppe, einen Riegel, einen zweiten, das Knarren einer Haustür. Ein kleiner Schatten huscht über den Platz und bleibt an der Ecke stehen, wo die Treppe zu den Kanälen hinabführt, in der Richtung, in die ihre Mutter gegangen ist. Dann ist er fort. Am Riegel hängt keine weiße Schleife mehr.
-> k1_hub_b

= wieder
{ q_mutter == 1:
    Das Mädchen hört dich, bevor du klopfst. „Hast du Mama gefunden?“ In der Frage liegt so viel Hoffnung, dass du kurz die Augen schließt.
- else:
    Die Finger erscheinen wieder zwischen den Läden. „Du bist ja doch gekommen. Hast du Mama gesehen? Suchst du sie?“
}
+ [„Noch nicht.“ #fliesst]
    „Noch nicht“, sagst du. „Dann warte ich noch“, sagt sie. „Ich kann gut warten. Ich bin die Beste im Warten.“
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
    Langsam gehst du, Schritt für Schritt, den Blick auf den Dachkanten. Und da, hinter einem Schornstein, kaum mehr als ein Umriss: ein alter Mann, gebeugt, eine Schlafmütze auf dem Kopf und in den Händen ein Gewehr, das länger ist als er selbst. Er hat dich noch nicht gesehen. Der Lauf zielt auf eine Stelle der Gasse, zwanzig Schritte vor dir, durch die du gerade hättest gehen sollen. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
+ {not schuetze_gesehen} [Schnell geradeaus hindurch #fliesst]
    Schnell läufst du los, geradeaus, und auf halbem Weg kracht hinter dir ein Schuss. Etwas Heißes fährt dir in die Schulter, bevor du begreifst, woher es kam. Du stolperst und fängst dich, und als du dich umdrehst, lädt auf dem Dach hinter dir, hinter einem Schornstein, ein alter Mann mit zitternden Händen nach und kichert dabei. # klang: schuss
    ~ zuletzt = schuss
    ~ schuetze_gesehen = true
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> oben
+ {schuetze_gesehen} [Wieder zu dem Alten hinauf #fliesst]
    Wieder siehst du zu dem Alten hinauf. Er sitzt hinter seinem Schornstein, das Gewehr auf den Knien, und summt.
    -> oben
+ [Auf der Stelle umkehren #fliesst]
    Auf der Stelle kehrst du um. Irgendwo über dir knirscht ein Dachziegel, dann noch einer, ein Stück weiter, als ginge oben jemand mit dir mit.
    -> k1_hub_b

= oben
+ [Hinaufklettern und ihn stellen #fliesst]
    Hinauf kletterst du, über eine Regenrinne, einen Fenstersims, einen Balken, und als du oben bist, versucht er nachzuladen, aber seine Finger sind zu alt und zu eilig, und das Pulver rieselt ihm neben den Lauf. Er sieht zu dir hoch, und in seinen Augen ist keine Angst, nur eine wirre, kindliche Freude. Neben ihm auf dem Sims liegen Kieselsteine, sorgfältig in Reihen gelegt, immer fünf und fünf, so wie man Tage zählt. # stimmung: kampf
    -> schuetze_wahl
+ [Im Hauseingang Deckung suchen #fliesst]
    Im nächsten Hauseingang suchst du Deckung und wartest, bis du sicher bist, dass er nicht mehr zielt. Dann gehst du zurück, dicht an der Wand, den Rücken zum Stein.
    -> k1_hub_b

= schuetze_wahl
* [Ihm das Gewehr abnehmen und gehen #fliesst]
    ~ schuetze_verschont = true
    Das Gewehr nimmst du ihm aus den Händen. Er lässt es los wie ein Kind ein Spielzeug, das ihm ohnehin langweilig geworden ist, und fängt an, seine Kiesel neu zu zählen. Das Gewehr wirfst du hinunter in den Hof. Zwei Kiesel nimmst du mit und eine Flasche, in deren Hals ein ölgetränkter Lappen steckt; er protestiert nicht. # notiz: kiesel
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_hub_b
* [Es mit der Säge beenden #fliesst]
    Mit der Säge beendest du es, und es geht schnell. Er macht dabei einen kleinen, überraschten Laut. Unter der Schlafmütze ist sein Haar sorgfältig gekämmt und mit Wasser angelegt, wie man es für den Sonntag tut. Seine Kiesel nimmst du mit und die Flasche mit dem öligen Lappen im Hals. # notiz: kiesel
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
// Stimme: heiser, sehr kurz, Sätze ohne Anlauf; beantwortet Fragen mit Gegenfragen oder gar nicht.
-> betreten("eileen") ->
{ eileen_stufe >= 1:
    Auf den Dachbalken ist niemand mehr. Nur eine schwarze Feder liegt dort, wo sie saß, und zittert im Zug, der aus dem Kanal heraufsteigt.
    -> k1_hub_b
}
~ eileen_stufe = 1
Oben laufen alte Dachbalken von Haus zu Haus, schwarz von Ruß und Regen, und auf ihnen, halb hinter ein paar Fässern verborgen, sitzt jemand so still, dass du ihn für einen Haufen alter Kleider gehalten hättest, wenn er nicht den Kopf gedreht hätte. # bild: daecher_eileen # stimmung: ruhig
Es ist eine Frau. Ihr Mantel ist aus schwarzen Federn, die bei jeder Bewegung leise rascheln, und vor dem Gesicht trägt sie eine Maske mit einem langen, gebogenen Schnabel, wie die Pestärzte sie auf alten Holzschnitten tragen. Um ihren Hals hängt eine Schnur mit kleinen Abzeichen, Messing, Silber, Eisen, jedes anders und jedes abgegriffen, und sie klappern, als sie sich vorbeugt und dich lange ansieht. „Neu“, sagt sie, nicht als Frage. „Riecht man.“ Und nach einem Atemzug: „Menschen gibt's hier keine mehr. Nur Hunger mit Gesichtern.“
{ mantel:
    ~ mantel_erkannt = true
    Dann bleibt ihr Blick an deinem Mantel hängen, am Saum, wo das Stück fehlt. Sie streckt die Hand aus und fährt mit dem Daumen über die Schnittkante, glatt, wie mit einer Klinge gezogen. „Wendel“, sagt sie, und zieht die Hand zurück. „Steht dir nicht.“ Unter ihrem Federmantel, an der Schnur mit den Abzeichen, klappert etwas, als sie sich wieder zurücklehnt, und du kannst nicht sehen, welches. # notiz: eileen_mantel
}
* [„Was sind das für Abzeichen?“ #fliesst]
    „Was sind das für Abzeichen?“, fragst du. Sie fasst die Schnur mit zwei Fingern und lässt die Abzeichen durch die Hand laufen, eins nach dem anderen, wie Perlen beim Beten. „Jäger. Die nicht mehr wussten, was sie jagen.“ Sie lässt die Schnur fallen. „Irgendwer muss sie heimbringen. Eileen.“ Erst nach einem Atemzug merkst du, dass das ihr Name war. # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen = eileen + 1
    ~ eileen_genannt = true
* [Die Hand am Griff der Säge lassen #fliesst]
    Die Hand lässt du am Griff der Säge. Sie bemerkt es und nickt, beinahe zufrieden. „Gut. Misstrauen hält länger als Mut.“ Sie klopft gegen die Abzeichen an ihrer Schnur. „Die hier waren mutig. Eileen.“ # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen_genannt = true
* [„Kümmer dich um deine Sachen.“ #fliesst]
    ~ eileen = eileen - 1
    „Kümmer dich um deine Sachen“, sagst du. Sie lacht, ein kurzes, raues Krächzen. „Tu ich. Genau das tu ich.“ Die Abzeichen klappern. Ihren Namen sagt sie dir nicht. # lore: jaeger_der_jaeger # lore: blutrausch
- Sie greift in ihren Mantel und wirft dir zwei kleine Marken zu, Messing, abgegriffen, mit einem eingeprägten Zeichen, das auf dem Kopf steht, ganz gleich, wie du sie drehst. „Zerdrücken, und du wachst im Garten auf. Ohne vorher zu sterben. Für den Fall, dass deine Beine zu langsam sind.“ Sie hält die Hand noch einen Atemzug offen, als wolle sie die Marken zurück. „Kostet alles Blut, das du bei dir trägst. Alles. Und es bleibt nirgends liegen, wo du's wiederfindest.“ # notiz: jaegermarke
~ jaegermarken = 2
// [KANON lore:figuren/eileen] Sie kennt den Jägertraum (LK 5.1: grüßt die kleine Puppe).
Du hast niemandem von dem Garten erzählt.
* [„Woher kennst du den Garten?“ #fliesst]
    „Woher kennst du den Garten?“, fragst du. Sie antwortet nicht. Sie rückt nur die Maske zurecht, und die Abzeichen an ihrem Hals klappern einmal.
* [Die Marken schweigend einstecken #fliesst]
    Schweigend steckst du die Marken ein. Sie sieht, dass du es bemerkt hast, und sagt auch nichts.
- Dann, beiläufig, als ginge es um das Wetter: „Ein Pater. Groß, Verband über den Augen. Schon gesehen?“ # notiz: eileen_frage
* {q_frau == 1} [„Ja. Er hat mir geholfen.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ja. Er hat mir geholfen“, sagst du, und dann erzählst du{ mob == "zerstreut":, wie er neben einer Toten kniete und ihren Namen sagte und dir trotzdem zeigte, wie man wartet.|, wie er dich vor der Menge bewahrt und die Bürger beim Namen genannt hat, einen nach dem anderen.} Eileen unterbricht dich nicht. „Hoffentlich bleibt er so“, sagt sie dann. „Er und Henryk, sein alter Partner. Zu lange zusammen draußen. Zu viele Nächte.“ Sie zählt nicht weiter. # notiz: henryk
* {q_frau == 1} [Ihr zeigen, wo du ihn gesehen hast #fliesst]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Du zeigst ihr, wo du ihn gesehen hast, mit ausgestrecktem Arm über die Dächer, und in welche Richtung er gegangen ist. Sie nickt, langsam. Eine ihrer Hände findet die Schnur mit den Abzeichen und hält sie fest. „Danke“, sagt sie. „Ist richtig so.“ Ihre Stimme klingt nicht, als glaube sie es. # notiz: verrat_gascoigne
* {q_frau == 1} [„Nein. Nie gesehen.“ #fliesst]
    „Nein. Nie gesehen“, sagst du. Sie nickt, als habe sie diese Antwort erwartet, und der Schnabel bleibt so lange auf dich gerichtet, dass du weißt, wie halb sie dir glaubt.
* {q_frau == 0 and gascoigne2} [„Ja. Zwischen den Gräbern.“ #fliesst]
    „Ja. Zwischen den Gräbern“, sagst du. „Dann weißt du's schon.“ Sie sieht in die Richtung der großen Brücke. „Wie er riecht.“
* {q_frau == 0 and gascoigne2} [Ihr zeigen, wohin er gegangen ist #fliesst]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Du zeigst ihr, wohin er gegangen ist: durch das Tor hinter dem Friedhof. Sie nickt, langsam. „Danke. Ist richtig so.“ # notiz: verrat_gascoigne
* {q_frau == 0 and not gascoigne2} [„Nein. Wer ist das?“ #fliesst]
    ~ eileen_frage_offen = true
    „Nein. Wer ist das?“, fragst du. Sie neigt den Schnabel. „Wirst du sehen. Merk dir, wie er riecht.“
- Dann steht sie auf. „Bestien jagst du“, sagt sie. „Jäger jag ich.“ Sie breitet den Mantel aus wie Flügel und ist mit einem Sprung auf dem nächsten Dach, und von dort ruft sie, ohne sich umzudrehen: „Jäger sehen sich wieder. Meistens zu spät.“ # quest: eileen_treffen
-> k1_hub_b
