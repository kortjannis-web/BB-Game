// KAPITEL 1, AKT II: ZENTRAL-YHARNAM. Entscheidungsbuch (Umbau 2026-11-06): jede Station einmal, vorwärts, kein Hub. Erstes Viertel: zwei von drei Stationen; Kreuzung: Scheiterhaufen (fest); zweites Viertel: zwei von drei; Eileen (fest); dann NADELÖHR 1 (Brücke).
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

=== k1_b_ankunft ===
// TITEL: Zentral-Yharnam: Ankunft (Akt II)
// [KANON lore:orte/zentral-yharnam] Särge in den Gassen, Gaslaternen, Hunde in Käfigen (Artbook, LK §25.1, §25.4; gegner/hunde.md).
// Früher der erste Besuch des Hubs; jetzt die Ankunft nach Gilbert, einmal.
-> betreten("zentral") ->
Yharnam ist eine Stadt aus Treppen. Sie steigen und fallen zwischen Häusern, deren Giebel sich so weit über die Gassen neigen, dass zwischen ihnen nur ein Streifen Himmel bleibt, und über den Dächern steht ein Rauch, der sich nicht verzieht. Irgendwo läuten Glocken, unregelmäßig, als zöge niemand an den Seilen. Unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht # klang: glocke
An den Hauswänden lehnen Särge, aufrecht, mit Ketten an die eisernen Ringe geschlossen, an denen man sonst die Pferde festmacht, als sollte aus ihnen nichts mehr herauskommen. Gleich neben deiner Laterne steht eine Haustür offen, die einzige in der ganzen Straße, und gleich hinter ihrer Schwelle fängt das Dunkel an.
Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt, an manchen Häusern drei oder vier übereinander, an einem ein ganzes Dutzend, so dicht, dass das Fenster dahinter verschwindet. Der Geruch ist süß und schwer und legt sich dir auf die Zunge wie ein Tuch auf ein Gesicht. # lore: raeucherwerk
Hinter den Fenstern brennt kein Licht als das rote, die Riegel sind vorgeschoben, und auf der ganzen Straße bist du der Einzige, der nicht weiß, worauf alle warten.
-> k1_viertel1

=== k1_viertel1 ===
// TITEL: Erstes Viertel (zwei von drei)
// Kartenmodell (Sorcery!): Von drei Stationen besucht man zwei, in beliebiger Reihenfolge; die dritte bleibt verloren. Die Wahl ist nicht blind: jede Station kündigt sich durch eine Spur an (Hund, Glocke, offene Tür).
{ v1_zahl >= 2: -> k1_nach_viertel1 }
{ v1_zahl == 0:
    Drei Spuren ziehen dich in verschiedene Richtungen: ein Hund, der weit unten bellt, eine Glocke aus der Tiefe einer Gasse, und die offene Tür, hinter der das Dunkel anfängt. Zwei davon kannst du folgen. Die dritte bleibt hinter dir.
- else:
    Zwei Spuren sind noch da. Eine davon darfst du noch gehen, dann ist der Weg weiter vorn.
}
- (wahl)
+ {not k1_b_tueren and v1_zahl < 2} [Dem Hund folgen, in die Gasse mit den Räucherlampen hinab #fliesst]
    ~ v1_zahl = v1_zahl + 1
    In die Gasse mit den Räucherlampen führen sieben Stufen hinab, in der Mitte zu Mulden ausgetreten.
    -> k1_b_tueren
+ {not k1_b_anschlag and v1_zahl < 2} [Den Glocken folgen, zu der schmalen Kapelle hinab #fliesst]
    ~ v1_zahl = v1_zahl + 1
    Zu der schmalen Kapelle führen drei Stufen hinab, glatt getreten von vielen Füßen, die nicht mehr kommen.
    -> k1_b_anschlag
+ {not k1_b_haus and v1_zahl < 2} [Der offenen Tür folgen, in das dunkle Haus #fliesst]
    ~ v1_zahl = v1_zahl + 1
    In das dunkle Haus mit der offenen Tür, und unter dem ersten Schritt knarrt die Schwelle so laut, dass du stehen bleibst und horchst.
    -> k1_b_haus
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl

=== k1_nach_viertel1 ===
// Spuren des Nichtgewählten: ein Satz je ausgelassener Station. Dann das erste Kreischen, dann der Rauch.
{ not k1_b_tueren: Weit hinter dir bellt noch der Hund, und du gehst nicht hin. }
{ not k1_b_anschlag: Die Glocke in der Tiefe der Gasse schlägt noch einmal, und du gehst nicht hin. }
{ not k1_b_haus: Die offene Tür steht hinter dir im Dunkel, und du gehst nicht hinein. }
{ haus_zettel:
    Von der Ecke an der Laterne sieht man zwischen zwei Giebeln ein Stück der großen Brücke, einen schwarzen Bogen gegen den Rauch, und auf ihrer ganzen Länge brennt nicht ein Licht. Der Zettel aus dem dunklen Haus knistert in deiner Tasche. # lore: kirche_sperrt_bruecke
}
-> schrei ->
Dem Rauch nach die Hauptstraße hinauf, und mit jedem Schritt wird der Geruch fetter.
-> k1_b_scheiterhaufen

=== k1_nach_scheiterhaufen ===
// Nach der Kreuzung: Wiederkehrsatz aus dem alten Hub, einmal, an fester Stelle.
{ mob_verbrannt:
    Vor einer Tür an der Ecke zum Markt liegt eine verkohlte Fackel, sorgsam quer über die Schwelle gelegt. Die Läden der Bäckerei daneben sind geschlossen, um die Klinke hat jemand ein schwarzes Tuch gebunden, und aus der Ritze unter der Tür riecht es nach kaltem Ofen und nach Kümmel.
- else:
    Hinter dir bleibt der Platz zurück. Das Feuer ist heruntergebrannt, und am Fuß des Pfahls liegt frisches Reisig, sorgfältig geschichtet, für das nächste.
}
-> k1_viertel2

=== k1_viertel2 ===
// TITEL: Zweites Viertel (zwei von drei)
{ v2_zahl >= 2: -> k1_nach_viertel2 }
{ v2_zahl == 0:
    Wieder drei Spuren: eine Melodie, so leise, dass du zweimal stehen bleibst, um sicher zu sein; ein Schuss, weit weg, und danach Stille; und eine Leiter, die an einer Hauswand hinauf zu den Dächern führt. Zwei davon kannst du folgen.
- else:
    Zwei Spuren sind noch da. Eine darfst du noch gehen.
}
- (wahl)
+ {not k1_b_maedchen and v2_zahl < 2} [Der Melodie folgen, zum Brunnenplatz #fliesst]
    ~ v2_zahl = v2_zahl + 1
    Zum Brunnenplatz führt dich eine Melodie, so leise, dass du zweimal stehen bleibst, um sicher zu sein, und dann durch ein Tor in der Mauer.
    -> k1_b_maedchen
+ {not k1_b_daecher and v2_zahl < 2} [Dem Schuss folgen, in die Gasse unter den Dächern #fliesst]
    ~ v2_zahl = v2_zahl + 1
    In die Gasse unter den Dächern, und mit dem ersten Schritt wird es eng.
    -> k1_b_daecher
+ {not k1_b_dachweg and v2_zahl < 2} [Die Leiter hinaufsteigen, auf die Dächer #fliesst]
    ~ v2_zahl = v2_zahl + 1
    Eine Leiter an der Hauswand, die Sprossen kalt und rau vom Rost, und über dir wird der Rauch dünner.
    -> k1_b_dachweg
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl

=== k1_nach_viertel2 ===
// Spuren des Nichtgewählten, das zweite Kreischen, die Sonne; dann Eileen (fest).
{ not k1_b_maedchen: Von irgendwo hinter den Mauern weht eine Melodie herüber, so leise, dass du sie nicht erkennst, und bricht ab. }
{ not k1_b_daecher: Irgendwo über den Dächern kracht noch einmal ein Schuss. Niemand hat auf dich gezielt. }
{ not k1_b_dachweg: An einer Hauswand lehnt eine Leiter, und du bist nicht hinaufgestiegen. }
{ spieluhr: Die Spieluhr in deiner Tasche klickt bei jedem Schritt gegen einen Knopf deines Mantels, und du legst die Hand darauf, damit sie still ist, und lässt sie dort. }
-> schrei ->
{ schreie == 2: Die alte Stimme, die hinter einer Tür zu beten begonnen hat, betet noch immer. Sie ist heiser geworden, aber den Faden hat sie nicht verloren. }
~ fr_frei_machen(fr_nacht)
Der Schatten des Laternenpfahls liegt über derselben Fuge im Pflaster wie bei deiner Ankunft, auf den Fingerbreit genau, und über den Giebeln ist die rote Sonne nicht von der Stelle gerückt.
-> k1_b_eileen

=== k1_vor_bruecke ===
// Nach Eileen: der Weg zur Brücke.
Hinauf zur großen Brücke führt eine Straße, die mit jedem Schritt breiter und leerer wird, bis an den Fenstern keine Räucherlampe mehr hängt und nur noch Wind ist.
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
~ fr_frei_machen(fr_blut)
{ k1_b_gilbert == 1:
    Neben der Laterne, wo die Gasse sich zum Platz hin weitet, steht ein schmales Haus mit einem Fenster zu ebener Erde, und vor dem Fenster sitzt ein Gitter, wie man es in Yharnam vor die Kammern der Kranken setzt, damit nichts hinein kann und nichts heraus. Die Läden sind bis auf einen Spalt geschlossen. Aus dem Spalt dringt kein Räucherwerk wie aus den Nachbarhäusern; es riecht nach Kampfer und kaltem Tee, nach einer Stube, in der seit Wochen niemand gelüftet hat. # bild: gilbert # stimmung: ruhig
    Dahinter atmet jemand, nass und tief, und der Atem verhakt sich an einer Stelle und reißt und wird zu einem Husten, der nicht enden will. Dein eigener Hals zieht sich zusammen. Der Einstich in deiner Armbeuge, durch den in der Klinik das fremde Blut in dich hineinlief, pocht im Takt dieses Hustens, so genau, dass du die Hand darauflegst.
    Am Gitter erscheint ein Gesicht, hager und gelb wie Kerzenwachs, mit Augen, die freundlicher sind, als eine Jagdnacht es erlaubt. In jedem steht eine winzige Laterne. „Sie riechen nach Regen“, sagt der Mann, „und nach Landstraße. Nicht nach Rauch. Von draußen also.“ Er legt die Hand an einen Stab, eine Hand, an der der Ring zu weit geworden ist. „Gilbert. Auch von draußen, nur schon länger, als mir lieb ist. Und Jäger sind Sie geworden, nicht wahr? Man sieht es an der Art, wie Sie stehen.“ # lore: fremde
    { herkunft == "kranker":
        Da hustest du selbst, und er hört auf zu lächeln. „Oh“, sagt er leise. „Das kenne ich. Das kenne ich sehr gut.“
    }
    -> haltung
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
    -> k1_b_ankunft
- -> themen

= themen
* [Nach seinem Husten fragen #fliesst]
    Über seinen Husten lacht er, kurz, und das Lachen kostet ihn einen neuen Anfall. „Eine Krankheit, für die mein Arzt zu Hause keinen Namen hatte“, sagt er, als er wieder kann. „Dann ein Gerücht über diese Stadt, in einer Postkutsche, von einem Mann, der nicht hustete. Dann eine lange Reise.“ Er dreht den zu weiten Ring am Finger. „Man hat mir hier Blut gegeben. Es hat geholfen, eine Weile. Im Spital lagen Leute, bei denen hat es nicht bloß aufgehört zu helfen.“ Sein Blick geht an dir vorbei in die Gasse. „Wir hatten einen Birnbaum hinter dem Haus. Ich denke dauernd an diesen Birnbaum, ist das nicht albern? Gehen Sie, sobald Sie können. Was diese Stadt einem gibt, holt sie sich doppelt zurück.“ # lore: bluttransfusion
    -> themen
* [Nach den verriegelten Türen fragen #fliesst]
    ~ gilbert_jagd = true
    ~ fr_frei_machen(fr_menschen)
    Warum in dieser Stadt jede Tür verriegelt ist? „Eine Jagdnacht“, sagt er, als nenne er das Wetter. „Dann schieben die Leute die Riegel vor und hängen Räucherwerk ins Fenster, und wer das Warten nicht mehr aushält, nimmt Fackel und Mistgabel und geht selbst hinaus.“ Er senkt die Stimme, obwohl niemand zuhört. „Was ihnen da draußen begegnet, haben sie meistens gestern noch gegrüßt. Die Seuche macht aus Menschen Bestien, und wen es als Nächsten trifft, weiß keiner. Mich hat es noch nicht getroffen.“ Er hustet. „Noch nicht.“ # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Nach dem bleichen Blut fragen #fliesst]
    Die Worte vom Zettel in der Klinik, bleiches Blut: Gilbert denkt lange darüber nach, die Stirn am Eisen. „Das Wort kenne ich nicht. Aber Blut ist in dieser Stadt die Sache der Heilenden Kirche, jeder Tropfen, und ihr Blut, sagt man, kommt aus der großen Kathedrale drüben im Osten des Tals, so wie Wasser aus einer Quelle. Wenn einer das Wort kennt, dann sie.“ Er hustet, und als er wieder kann, spricht er leiser. „Einem Fremden sagt hier keiner etwas, in gewöhnlichen Nächten. Aber eine Jagdnacht ist keine gewöhnliche. Da stehen Türen offen, die sonst zu sind. Nur nicht die, an die man klopft.“ # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    ~ fr_frei_machen(fr_blut)
    -> themen
* {gilbert_bruecke} [Nach dem Weg zur Kathedrale fragen #fliesst]
    { kleriker == "":
        ~ gilbert_kleriker = true
        „Zur Kathedrale? Über die große Brücke, einen anderen Weg kenne ich nicht. Gesperrt soll sie sein, sagt man, seit die Jagd begann, aber was heißt das schon.“ Er lauscht in die Richtung, als könne er es von hier aus hören. „Und auf der Brücke haust etwas. Es soll einmal in der Kirche gedient haben, gesungen oder gepredigt, so genau weiß das keiner. Man sagt auch, aus Kirchenleuten werden die schlimmsten.“ Er greift nicht nach dem Räucherwerk, wie man es in Yharnam tut, wenn davon die Rede ist. Er hat keins. # lore: kleriker_bestien # lore: kirche_sperrt_bruecke
    - else:
        „Zur Kathedrale? Über die große Brücke.“ Sein Blick geht zu deinen Händen und bleibt dort. „Aber das wissen Sie schon, nicht wahr? Sie waren oben. Ist es … ist es noch da?“ # lore: kleriker_bestien
    }
    -> themen
* {gilbert_bruecke} [Nach den Jägern der Kirche fragen #fliesst]
    // [KANON lore:fraktionen/jaeger] Ludwig führte die ersten Jäger der Kirche an; viele Kirchenjäger waren Kleriker. Hier nur als Gerücht, ohne Namen.
    // [KANON lore:gegenstaende/heilende-kirche] Das Silberschwert ist das Zeichen der Kirchenjäger (Abzeichen der Schwertjäger, auf der Brücke im Fell der Bestie); Ludwig warb Bürger als Jäger an (Kleidung der Yharnam-Jäger).
    // [ERWEITERT] Das Schwert auf den Haustüren und die Kratzer. Die Mondklinge gestrichen (Zusatzinhalt, Wissenssperre).
    Wer für die Kirche jagt? Gilbert lehnt die Stirn ans Gitter. „Die Leute hier erzählen von einem, der als Erster für sie gejagt hat. Er hat geworben, wen er bekommen konnte: Fuhrknechte, Gerber, Söhne von Wäscherinnen. Und Kleriker. Viele Kleriker.“ Er wartet, bis der Husten vorbei ist. „Auf den Abzeichen seiner Leute war ein Schwert aus Silber, und eine Zeit lang hat man es ihnen zu Ehren auf die Haustüren gemalt.“ Ein schiefes Lächeln. „Dann hat man es wieder abgekratzt. An manchen Türen sieht man noch die Kratzer. Seinen Namen sagt hier keiner gern; ich habe einmal gefragt, warum, und ringsum sind die Läden zugefallen.“ # notiz: erster_kirchenjaeger
    -> themen
+ [Dich verabschieden #fliesst]
    { gilbert >= 0 and not gilbert_geschenk: -> geschenk }
    { gilbert < 0: Hinter dir hustet er, als du gehst, und tut nicht so, als hätte er dich gehört. }
    { gilbert >= 0: „Gute Jagd“, sagt Gilbert zum Abschied, und er meint es. }
    -> k1_b_ankunft

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
-> k1_b_ankunft

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
    -> k1_viertel1
+ [Die Türen hinter dir lassen #fliesst]
    Das Lachen folgt dir bis an die Treppe und noch zwei Stufen hinauf.
    -> k1_viertel1

= frau
// [KANON lore:figuren/einsame-alte-frau] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr einen sicheren Ort versprechen #fliesst]
    ~ alte_frau_versprochen = true
    Einen sicheren Ort versprichst du ihr, irgendwo in dieser Stadt, und Bescheid, sobald du ihn gefunden hast. Sie schnaubt, trocken, und das Schnauben wird zu einem Husten. „Sicher. Natürlich.“ Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
* [Ohne Antwort weitergehen #fliesst]
    Ohne Antwort weiter, und die Stimme hinter der Tür ruft dir nichts nach. Der Hund sieht dir nach, bis du um die Ecke bist; erst dann legt er den Kopf wieder auf die Pfoten.
- -> k1_viertel1

=== k1_b_anschlag ===
// TITEL: Der Anschlag an der Kapellentür
// [ERWEITERT] Ein Anschlag der Heilenden Kirche zur Jagdnacht, eigener Wortlaut. Das Siegel bleibt unbestimmt (rotes Wachs, abgegriffenes Zeichen): Das Archiv kennt kein Zeichen der Kirche, und ein Kelch zeigte auf Gesperrtes (Faktencheck b_yharnam Nr. 9). Die übereinander geklebten Datumsstreifen: Die Jagd kehrt wieder.
// [KANON lore:fraktionen/heilende-kirche] Die Kirche verwaltet das Blut; die Bürger verriegeln sich mit Räucherwerk.
// Die Kirche ist in Kapitel 1 nur zu hören und zu lesen, nie zu sehen (Entscheidung des Nutzers 2026-11-04). Ortsbild A, der Anschlag C, das Atmen hinter der Tür B.
-> betreten("anschlag") ->
~ fr_frei_machen(fr_kirche)
Sie duckt sich zwischen zwei Häuser, kaum breiter als ein Hauseingang, mit einer Tür aus schwarzem Holz und einem Fenster darüber, das man von innen mit Brettern vernagelt hat. Auf der Tür hängt ein Anschlag, mit vier Nägeln befestigt; drei sind braun vor Rost, der vierte ist neu und blank. Das Papier hat sich in der feuchten Luft gewellt, und als du dich vorbeugst, riecht es herb und harzig, nach Weihrauch. # bild: tueren # stimmung: spannung
Oben sitzt ein Siegel aus rotem Wachs, darin ein Zeichen, so oft gestempelt, dass seine Linien sich abgegriffen haben wie die Prägung einer Münze, die durch zu viele Hände ging. Darunter steht in großen, sauberen Lettern:
An die Gemeinde in der Nacht der Jagd. Bleibt in euren Häusern und lasst das Räucherwerk nicht erlöschen. Die Jäger der Kirche wachen über euch. Wer Fieber an sich spürt, wer Durst hat, den kein Wasser stillt, wer seine eigene Stimme fremd findet, der zögere nicht und begebe sich zur nächsten Stelle des Blutes. Das Blut der Kirche heilt, was es berührt. Fürchtet nicht das Blut. Fürchtet, was ohne das Blut aus euch würde. # stil: anschlag # lore: heilende_kirche
Gegeben im Namen der Heilenden Kirche, zur Nacht der Jagd. # stil: anschlag
Das Datum unter der letzten Zeile steht auf einem schmalen Papierstreifen, der über einen älteren geklebt ist, und an der Kante, wo die Feuchtigkeit den Leim gelöst hat, siehst du, dass unter dem älteren noch weitere liegen, Streifen auf Streifen, jeder ein wenig gelber als der darüber.
Unten auf der Tür, unter dem Papier, hat jemand mit Kreide etwas dazugeschrieben, klein und schief, und dann versucht, es mit dem Ärmel wegzuwischen. Lesbar ist es noch: Mein Bruder ist gegangen. Er hatte keinen Durst. # notiz: anschlag_kreide
Hinter der Tür, ganz nah am Holz, atmet jemand. Als dein Schatten auf die Tür fällt, hört das Atmen auf.
-> k1_viertel1

=== k1_b_haus ===
// TITEL: Das dunkle Haus (Zettel über die Brücke)
// [KANON lore:welt/notizen] Notiz Nr. 2 (LK §21.1): Beim Beginn der Jagd ließ die Heilende Kirche die Bewohner im Stich und sperrte die Große Brücke, während der alte Stadtteil in jener Nacht brannte. Fundort: das dunkle Haus nahe der ersten Laterne, Regal im ersten Stock neben einem Rollstuhl-Bürger. Gegenpol zum Anschlag (Faktencheck Übergreifend 2b, b_yharnam Nr. 6).
// [KANON lore:gegner/rollstuhl-mob] Bürger im Rollstuhl: Wahnlachen, atmet in Ruhe nur durch den Mund, greift aus dem Stuhl heraus an.
// [ERWEITERT] Wortlaut und Schreiber des Zettels; der eine Takt mit der Pistole. Den alten Stadtteil nicht beim Namen nennen, nur „unten im Tal, wo die Stadt früher war“ (Faktencheck).
// [ERWEITERT] Das Seil am Geländer, blank gescheuert (Lektorat 1.1 f): Jemand hat den Stuhl hinaufgezogen. Nicht erklären. Sein Lachen pfeift mit dem Atem (eigener Laut, Lektorat 1.2).
// [Deutung, nie aussprechen] Der Rollstuhl gleicht dem des Mannes in der Klinik (RK1 §1). Nur stehen lassen: die knarrenden Räder.
-> betreten("haus") ->
~ kampfanfang = -> k1_b_haus
{ k1_b_haus == 1:
    Hinter der Tür liegt ein Flur, in dem seit Wochen niemand Licht gemacht hat, und eine Treppe, auf deren Stufen der Staub so dick liegt, dass deine Stiefel Abdrücke hinterlassen wie im ersten Schnee. Nur in der Mitte jeder Stufe ist er weggewischt, in zwei schmalen, gleichmäßigen Bahnen. Am Geländer ist ein Seil festgeknotet, und auf halber Höhe ist es an einer Stelle blank gescheuert. Es riecht nach kaltem Talg und nach einem Zimmer, in dem jemand schläft. # bild: haus_dunkel # stimmung: spannung
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
~ fr_frei_machen(fr_kirche)
Der Zettel knistert, als du ihn einsteckst. Auf der Treppe, die Hand am Seil, hörst du, wie oben der Mann wieder durch den Mund zu atmen beginnt, lang und feucht, als hätte ihn nie jemand gestört.
// Fundstück (Umbau 2026-11-06, ersetzt den Kauf bei den Boten): Wendels Mantel. PLATZHALTER, knapp.
Im Flur unten hängt, an einem Haken hinter der Tür, ein Jägermantel, langes geöltes Leder, schwer wie ein Zelt nach dem Regen. Er riecht nach Teer, nach Pulver und nach einem Menschen, der nicht du bist. Am Saum fehlt ein Stück, glatt abgetrennt. Innen, ins Futter gestickt, mit rotem Garn und ungeschickten Stichen, steht ein Name: Wendel.
* [Den Mantel vom Haken nehmen #fliesst]
    ~ mantel = true
    Du nimmst ihn vom Haken und ziehst ihn über. Er sitzt, als hätte jemand ihn für deine Schultern gearbeitet, und das gefällt dir nicht. # notiz: mantel_wendel
* [Ihn hängen lassen #fliesst]
    Du lässt ihn hängen. Die Tür fällt hinter dir ins Schloss, und der Haken schwingt noch eine Weile leer.
- -> k1_viertel1

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON lore:gegner/jagdmeute] Mob aus bewaffneten Bürgern, viele in Kleidung der Kirche, die den Fremden für den Überträger halten und rufen, er trage die Krankheit, er solle brennen; im Leerlauf murmeln sie von einem Fluch und einer Stadt, die erledigt sei (LK §20.1, §22.2; den Ruf mit Willem nicht verwenden). Alles sinngemäß, Wortlaut eigen.
// [KANON lore:gegner/ziegel-troll] Der Riese mit dem Ziegel hämmert an eine Tür, murmelt von Kälte und einer Schwester und brüllt beim Schlag, alles sei deine Schuld. Unerklärt lassen.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Gascoignes Kleidung ist von Bestiengestank durchdrungen, der an ihm zehrt; „Vater“ ist ein Titel aus einem fremden Land. Breitkrempiger Hut (Artbook, orte/zentral-yharnam). Jägeraxt und Donnerbüchse.
// [KANON lore:figuren/henryk] Henryk ist wortkarg; hier ohne Namen („ein Dürrer mit Federn am Hut“, Artbook), der Name fällt erst bei Eileen.
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade, fragt nach deinem Namen, teilt Branntwein aus seiner Heimat (Torf und Rauch, G8) und bittet um einen Gruß an seine Frau. Hat der Spieler Martha verbrannt, bleibt er kalt: keine Flasche, die Parade ohne Blick, die Bitte nur, weil er niemand anderen hat, die Einladung zur Brücke nur bei gascoigne >= 0.
// [ERWEITERT] Lektorat 2026-11-05: Gascoigne tritt über den Ton auf (Schuss, dann die Namen); das Auge sieht zuerst nur den Verband, Mantel, Hut und Schal erst aus der Nähe. Sein Geruch am Platz nur einmal und leise, ohne „nasses Fell“ (die Steigerung folgt an den Gräbern, c_unterstadt). Martha mit Mehl an den Ärmeln in beiden Zweigen; die Frau mit der Fackel wie ein Kerzenleuchter.
// Überarbeitung 2026-11-06 (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12): Mob als Chor aus einzelnen Menschen (Martha schon in der Menge gesät); Gascoigne riecht nach Torf und Rauch (Ü11), der Branntwein erntet den Geruch; Henryk wortkarg; „morgen“ aus Gascoignes Mund gestrichen (Ü1: die Stadt spricht nicht vom Morgen).
// [ERWEITERT] Spieluhr-Saat (Ü11): Beim Gruß summt Gascoigne ein paar Töne der Spieluhr vor, damit du sie erkennst; am Brunnenplatz erkennt man die ersten Töne wieder, und dort fehlt einer. Die Lücke erklärt keiner.
// Stimme Gascoigne (gesund): tief, ruhig, kurze Sätze, warm und spaßig, nennt Leute beim Namen, sagt „Fremder“, bis er deinen Namen hat; beendet Dinge mit „So.“ Wärme, die zerbricht: der Geruch, das Spiel der Bestie, ein Blick zum Feuer.
-> betreten("scheiterhaufen") ->
~ kampfanfang = -> k1_b_scheiterhaufen.kampf
~ fr_frei_machen(fr_menschen)
{ k1_b_scheiterhaufen == 1:
    Am oberen Ende der Hauptstraße treten die Häuser zurück und lassen einen Platz frei, und mitten darauf brennt ein Scheiterhaufen, höher als die Traufen ringsum. Oben am Pfahl hängt, mit Ketten festgezurrt, etwas Großes, Behaartes, das sich nicht mehr regt; das Feuer hat ihm das Fell bis auf die Haut geschwärzt, und was von ihm in die Glut tropft, zischt. Der Rauch riecht nach einem Schlachttag, an dem keiner sein Handwerk verstand, und die Hitze schlägt dir noch dreißig Schritte vor dem Feuer ins Gesicht. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
    Um das Feuer stehen Menschen, ein Dutzend oder mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln und Beilen. Einer trägt einen schwarzen Kirchenrock, der ihm um die Schultern schlottert, einer ein altes Gewehr, dessen Kolben mit Draht geflickt ist, und eine Frau hat noch Mehl an den Ärmeln und hält ein Brotmesser in der Faust. Die Frau neben ihr hält ihre Fackel wie einen Kerzenleuchter, mit abgespreiztem kleinem Finger.
    Sie murmeln, alle zugleich und keiner mit dem anderen. Ein Fluch sei das, sagt einer, ein verdammter Fluch, und ein anderer, mit dieser Stadt sei es aus, und eine Dritte zählt Namen auf, leise, an den Fingern. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens. Zwischen zwei Schlägen murmelt er, und was er murmelt, gilt nicht der Tür: „Kalt ist es, Schwesterchen. So kalt.“
    Einer dreht sich zu dir um, dann drei, dann alle, und das Murmeln bricht ab, so wie ein Topf aufhört zu kochen, wenn man ihn vom Feuer zieht. Nur der Riese schlägt weiter gegen seine Tür. „Der da“, sagt die Frau mit der Fackel, und ihr kleiner Finger spreizt sich noch immer ab. „Der trägt sie an sich, die Seuche, riecht ihr das nicht?“ Und ein Mann, heiser vom Rauch: „Brennen soll er! Brennen wie das da oben!“ # kampf: mob
}
// WARUM: Der Spieler stellt sich der Menge; das öffnet den Kampf mit zwei Takten, in dem er Anzeichen lesen lernt und mit Gilberts Feuer die falsche, für Aufmerksame erkennbare Wahl treffen kann (es sind Menschen mit Mehl an den Ärmeln).
+ [Stehen bleiben und die Säge ausklappen #fliesst]
    Mit einem Schnappen, lauter als das Feuer, klappt die Säge in deiner Hand auf, und vorn in der Menge senken sich die ersten Gabeln.
    -> kampf
// WARUM: Der vorsichtige Weg ohne Kampf; er kostet nichts, führt aber sofort zu Gascoigne und lässt die Menge unversehrt (mob = umgangen). Kein falscher Weg.
+ [In den Schatten um den Platz herum #fliesst]
    ~ mob = "umgangen"
    An den Hauswänden entlang, Schritt für Schritt, und dein Herz schlägt dir bis in den Hals. Fast liegt der Platz hinter dir, als auf einer Türschwelle ein Bündel, das du für Lumpen gehalten hast, den Kopf hebt. Es ist ein Kind, und es zeigt mit dem Finger auf dich und schreit: „Da! Der Fremde! Da ist er!“
    -> gascoigne_greift_ein

= kampf
- (t1)
Sie kommen von zwei Seiten zugleich, aber nicht gleich schnell. Ein hagerer Mann mit einer Mistgabel löst sich als Erster aus der Menge, die Zinken tief und auf deinen Bauch gerichtet, und die anderen drängen hinter ihm her, so dicht, dass sie einander auf die Fersen treten. Hinter dir öffnet sich die Gasse, aus der du gekommen bist, so eng, dass darin keine zwei Mann nebeneinander Platz haben. # anzeichen: mobhieb
{ herkunft == "gesuchter": Eine Frau in der zweiten Reihe starrt dich an, als kenne sie dein Gesicht von einem Anschlag. Vielleicht tut sie das. }
// WARUM: Die richtige Richtung: Das Anzeichen nennt die enge Gasse, in der die Menge sich selbst im Weg steht. Kein Schaden.
+ [Nach hinten in die enge Gasse weichen #fliesst]
    Rückwärts in die enge Gasse, Schritt um Schritt, und die Menge drängt nach, bis sie sich selbst im Weg steht, Schulter an Schulter, die Gabeln ineinander verkeilt. Die Säge trifft den Ersten. Den Zweiten am Arm, der die Fackel hält.
    -> t2
// WARUM: Mut ohne Verstand; erkennbar falsch, weil das Anzeichen zeigt, dass die Menge dicht nachdrängt. Kostet zwei Leben.
+ [Nach vorn, mitten in die Menge hinein #fliesst]
    Mitten hinein, und für einen Herzschlag sieht es aus, als werde die Menge zurückweichen. Sie weicht nicht. Die Zinken fahren dir in die Seite, ein Beil streift deinen Arm.
    ~ zuletzt = mobhieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Die Versuchung der schnellen Lösung: Sie beendet den Kampf, tötet aber Martha. Für Aufmerksame falsch, denn die Menge besteht aus Bürgern (Mehl, Brotmesser, Schürzen), nicht aus Bestien; Gascoigne bleibt danach kalt.
+ {feuer} [Gilberts Feuer in die Menge halten #fliesst]
    Aus der Düse fährt eine Zunge, gelb und brüllend, mitten in die Menge. Sie schreien, jeder für sich, erschrockene Menschen, die eben noch eine Menge waren, und stieben auseinander, in Gassen und Hauseingänge. Eine bleibt liegen. Ihre Schürze brennt weiter; an den Ärmeln, wohin das Feuer nicht kam, ist sie weiß von Mehl. Neben ihrer Hand liegt das Brotmesser. Die Düse in deiner Hand ist warm.
    ~ mob = "zerstreut"
    ~ mob_verbrannt = true
    Die Frau am Boden rührt sich nicht. Von oben, von der Kathedrale her, setzt ein Choral ein, langsam und fern, in Stimmen, die jede Silbe sauber zu Ende singen. # klang: choral
    -> gascoigne_greift_ein
- (t2)
Von den Rändern des Platzes kommen mehr. Der Riese hat aufgehört, gegen die Tür zu schlagen; er dreht sich um, den Ziegel in der Faust, und brüllt über den Platz, mit einer Stimme, die überschnappt wie die eines Jungen: „Du! Du bist schuld! An allem bist du schuld!“ Er rennt los, schwerfällig und unaufhaltsam, mitten durch die eigenen Leute. Links, zwischen einer Frau mit einem Beil und dem Pfahl einer Gaslaterne, steht der Kreis nur einen Mann tief. # anzeichen: riese_ansturm
// WARUM: Die Richtung steht im Anzeichen (links ist der Kreis nur einen Mann tief); der Weg kostet einen Stoß, bringt dich aber aus dem Kreis, und der Riese pflügt in die eigenen Leute.
+ [Links durch die Lücke im Kreis #fliesst]
    Links durch die Lücke, zwischen dem Beil und dem Laternenpfahl hindurch: Ein Ellbogen trifft dein Kinn, ein Stiefel dein Knie, aber du bist draußen, und hinter dir pflügt der Riese in die eigenen Leute.
    ~ zuletzt = riese_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
// WARUM: Sich dem Größten stellen; erkennbar falsch, weil der Riese „schwerfällig und unaufhaltsam“ läuft. Kostet zwei Leben.
+ [Dem Riesen von vorn entgegen #fliesst]
    Der Ziegel trifft dich an der Schulter, noch bevor deine Klinge ihn erreicht, und die Welt wird für einen Augenblick weiß.
    ~ zuletzt = riese_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
// WARUM: Heilen im falschen Moment: Mitten im Ansturm trifft der Gegner beim Trinken (Regel der Ampulle).
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen #fliesst]
    -> ampulle_gefahr(1) -> t2

= gascoigne_greift_ein
~ q_frau = 1
{ mob == "zerstreut":
    Aus dem Rauch kommen Schritte über das Pflaster, schwer und ohne Eile, und halten bei der Frau, die liegen geblieben ist. Von dem Mann siehst du zuerst nur den Verband, schmutziges Leinen, mehrmals um die Augen gewickelt, und doch ist er geradewegs zu ihr gegangen, ohne einmal den Kopf zu wenden. Er kniet sich neben sie und nimmt ihre Hand, obwohl sie schwarz ist. „Martha“, sagt er. Nur das. # stimmung: grauen # lore: gascoigne
    Als er aufsteht, überragt er dich um einen Kopf, ein langer Jägermantel, ein Hut mit breiter Krempe, um den Hals der Schal eines Priesters. Sein Ärmel streift deinen Arm. Er riecht nach Torf und Rauch, und darunter liegt, schwach und warm, ein anderer Geruch, wie von einer Decke, auf der lange ein Tier geschlafen hat. Er wendet dir den Verband zu. „Gascoigne“, sagt er. „Ich jag hier seit vielen Jahren. Wenn ich spät kam, hatte sie noch Brot für mich.“ Er schweigt. „So.“
    ~ gascoigne = gascoigne - 1
- else:
    Ein Schuss kracht über den Platz{mob == "durchbrochen":, hinter dir}, so laut, dass die Scheiben in den Rahmen klirren. In das Klirren hinein spricht eine Stimme, ruhig und tief, mit einem Rollen, das nicht aus diesen Gassen stammt: „Martha. Hennings. Brack, du alter Esel, nimm die Gabel runter.“ # stimmung: ruhig # lore: gascoigne
    Zwischen dich und die Bürger tritt ein Mann, und von ihm siehst du zuerst nur den Verband, schmutziges Leinen, mehrmals um die Augen gewickelt. Trotzdem wendet er den Kopf von einem zum anderen, und wen der Verband trifft, der lässt die Fackel sinken. In der einen Hand hält er eine Axt, in der anderen eine Donnerbüchse, aus deren Trichter noch Rauch steigt. „Geht heim“, sagt er. „Geht heim zu euren Kindern.“
    Und sie gehen, einer nach dem anderen. Die Frau mit dem Mehl an den Ärmeln nickt ihm im Vorbeigehen zu, beinahe verlegen, das Brotmesser hinter dem Rücken, und selbst der Riese trottet davon und zieht den Ziegel hinter sich her, dass er über das Pflaster schrammt.
    Erst dann wendet er sich dir zu und streckt dir die Hand hin, warm und trocken und sehr groß, und aus der Nähe siehst du auch den Rest: den langen Jägermantel, den Hut mit der breiten Krempe und um den Hals den Schal eines Priesters, grau vom Ruß. Er riecht nach Torf und Rauch, und darunter liegt, schwach und warm, ein anderer Geruch, wie von einer Decke, auf der lange ein Tier geschlafen hat. Er merkt, dass du es merkst, und tritt einen halben Schritt zurück, ohne deine Hand loszulassen. „Gascoigne. Pater, wenn man's genau nimmt. Aber hier nimmt's keiner genau.“ Er legt den Kopf schief. „Und du bist auch nicht von hier, Fremder. Man hört es an deinen Stiefeln.“ # notiz: gascoigne_pater
    { herkunft == "soldat": „Und du gehst wie einer, der Gräben kennt“, fügt er hinzu. „Ich auch. Lange her.“ }
}
{ mantel: -> mantel_frage }
- (nach_mantel)
// WARUM: Die Ausrede nach Marthas Tod; Gascoigne lässt sie nicht gelten, nimmt sie aber hin. Ohne Folge für die Freundschaft.
* {mob == "zerstreut"} [„Ich hatte keine Wahl.“ #fliesst]
    „Ich hatte keine Wahl.“ Noch während du es sagst, hörst du, wie dünn es klingt. „Man hat immer eine“, sagt er. „Meistens eine schlechte.“ Er wischt die Hand, die ihre gehalten hat, am Mantel ab, Finger für Finger.
// WARUM: Nach der Tat nach dem Menschen fragen; das ist die einzige Antwort, die ihn ein wenig zurückgewinnt (gascoigne + 1), und sie gibt Martha einen Namen und ein Leben.
* {mob == "zerstreut"} [„Wer war sie?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Wer war sie?“ Er wendet den Verband nicht von ihr ab. „Martha. Hat unten am Markt Brot gebacken, mit zu viel Kümmel, immer, und jeder hat's ihr gesagt, und sie hat's nie gelassen.“ Er hebt den Verband zum Pfahl hinauf. „Sie hatte Angst vor dir. Deshalb stand sie hier.“
// WARUM: Schweigen statt Rechtfertigung; neutral, aber der Spieler sieht, wie Gascoigne die Tote aushält.
* {mob == "zerstreut"} [Schweigend neben ihm stehen bleiben #fliesst]
    Keiner von euch sagt ein Wort. Das Feuer auf dem Scheiterhaufen knackt, und irgendwann fällt oben etwas vom Pfahl in die Glut, und er zuckt nicht.
// WARUM: Dank für die Rettung; Wärme, die Gascoigne erwidert (gascoigne + 1). Ein Gruß der Freundschaft, kein Prüfstein.
* {mob != "zerstreut"} [Ihm danken, die Hand noch in seiner #fliesst]
    ~ gascoigne = gascoigne + 1
    „Danke.“ Er winkt mit der freien Hand ab, aber unter dem Verband ziehen sich seine Mundwinkel nach oben. „Bedankt wird sich selten bei einem Jäger. Meistens macht man nur die Tür zu.“ Er zeigt mit dem Daumen über die Schulter, dorthin, wo die Bürger verschwunden sind. „Die da danken mir beim nächsten Mal auch nicht. Ist schon recht.“
// WARUM: Neugier auf den Mann; öffnet seine Vergangenheit als Fremder und sät Henryk (ohne Namen) für Eileen und Kapitel 2 (gascoigne + 1).
* {mob != "zerstreut"} [„Warum hilfst du einem Fremden?“ #fliesst]
    // [ERWEITERT] Der Mann mit den Federn am Hut ist Henryk (Artbook: Federn am Hut), hier ohne Namen; der Name fällt erst bei Eileen.
    ~ gascoigne = gascoigne + 1
    „Warum hilfst du einem Fremden?“ Er hebt die Axt auf die Schulter. „Weil ich selbst einer war. Und es manchmal vergess.“ Er schweigt einen Atemzug. „Damals hat mir auch einer geholfen. Ein Dürrer mit Federn am Hut. Hat kein Wort gesagt, nur mir die Axt in der Hand umgedreht, weil ich sie verkehrt herum hielt.“ Unter dem Verband lächelt er, warm und ein wenig schief.
// WARUM: Stolz statt Dank; Gascoigne nimmt es mit Humor, die Freundschaft wächst nicht. Kein falscher Weg, nur ein kühlerer.
* {mob != "zerstreut"} [„Das hätte ich auch allein geschafft.“ #fliesst]
    „Das hätte ich auch allein geschafft.“ Er lacht, tief aus der Brust, und schlägt dir auf die Schulter, so kräftig, dass du einen Schritt zur Seite machst. „Natürlich. Natürlich hättest du das.“
- { mob == "zerstreut": „Und du“, sagt er, ohne dir den Verband zuzuwenden. „Wie heißt einer, der so was tut?“ | „Wie heißt du, Fremder?“ }
// WARUM: Den Namen geben heißt Nähe zulassen; Gascoigne behält ihn (gascoigne_name), und am Ende hängt am Namen, ob man ihn im Zerfall noch erreicht.
* [Ihm deinen Namen sagen #fliesst]
    ~ gascoigne_name = true
    ~ gascoigne = gascoigne + 1
    „{name}“, sagst du. { mob == "zerstreut": Er wiederholt ihn nicht. Er nickt nur, so wie man etwas annimmt, das man nicht bestellt hat, und es trotzdem nicht zurückgibt.| „{name}“, wiederholt er, und mit dem Rollen in seiner Stimme klingt der Name schwerer, als hätte er ihm ein Gewicht angehängt. „Gut. Den behalte ich.“}
// WARUM: Distanz wahren; man bleibt „Fremder“. Später kann Gascoigne dich nicht beim Namen erkennen, was den Moment der Klarheit erschwert (für Aufmerksame: Er sagt, er behalte Namen).
* [„Jäger. Das muss reichen.“ #fliesst]
    „Jäger. Das muss reichen.“ { mob == "zerstreut": „Reicht“, sagt er. „Für heute.“| Er nickt, als sei das eine ehrliche Antwort. „Dann eben Fremder. Bis du es dir anders überlegst.“}
-
~ parade = true
~ parade_quelle = "gascoigne"
{ mob == "zerstreut":
    Ohne zu fragen, nimmt er dir die Feuerwaffe aus der Hand und wiegt sie. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Er zeigt es dir, mitten auf dem Platz, das Gesicht dem Feuer zugewandt und nicht dir: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach.“ Er gibt dir die Waffe zurück. „Damit du beim nächsten Mal kein Feuer brauchst.“ # lore: parade
- else:
    Er nimmt deine Feuerwaffe, wiegt sie in der Hand und gibt sie dir zurück. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Und dann zeigt er es dir, mitten auf dem Platz, mit dem Feuer im Rücken: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. Die Bestie spielt er gleich mit, den Arm hoch über dem Kopf, das Knurren tief in der Kehle, so echt, dass über euch ein Fensterladen zuschlägt. „Nicht davor. Nicht danach. Dann wankt sie, und dann gehört sie dir. So.“ # lore: parade
    Er lehnt sich an einen Laternenpfahl und zieht eine flache Blechflasche aus dem Mantel. „Gegen die Kälte. Und gegen das andere.“ { mantel_gelogen: Er trinkt zuerst und reicht sie dir, ohne den Hals abzuwischen.| Er wischt den Hals mit dem Ärmel ab, sorgfältig, wie ein Mann, der das zu Hause für jemanden tut, und reicht sie dir zuerst.} Der Branntwein ist scharf und schmeckt, wie Gascoigne riecht, nach Torf und Rauch, nach einem Land mit mehr Moor als Straßen. „Von daheim“, sagt er. „Das Letzte, was ich davon hab.“ # notiz: gascoigne_flasche
    Einmal, mitten im Trinken, dreht er den Kopf zum Scheiterhaufen und zieht die Luft ein, tief, und was dabei über sein Gesicht geht, ist kein Ekel. Er schraubt die Flasche zu, fester als nötig.
}
{ mob == "zerstreut":
    Er wendet sich zum Gehen und bleibt nach drei Schritten stehen. „Eins noch.“ Er sagt es zum Pflaster vor seinen Stiefeln. „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie soll bei der Kleinen bleiben. Und wenn du irgendwo eine Spieluhr hörst …“ Er summt drei, vier Töne, hoch und so leise, dass das Feuer sie beinahe zudeckt, und bricht ab. „Das ist meine Kleine. Geh hin, wenn du kannst.“ Eine Pause. „Ich hab heute Nacht keinen, den ich sonst fragen könnte.“ # quest: gascoigne_frau
- else:
    Er dreht die Flasche in den Händen, bevor er sie einsteckt, und sagt, beinahe verlegen: „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie macht sich immer Sorgen. Sie soll bei der Kleinen bleiben.“ Er räuspert sich. „Und wenn du irgendwo eine Spieluhr hörst, so eine …“ Er summt dir ein paar Töne vor, hoch und vorsichtig, viel zu hoch für eine so tiefe Brust, und schüttelt über sich selbst den Kopf. „So ungefähr. Bei ihr klingt's schöner. Das ist meine Kleine. Geh hin, wenn du kannst.“ # quest: gascoigne_frau
}
// WARUM: Das Versprechen, den Gruß auszurichten; bindet den Spieler an Viola und das Mädchen (gascoigne + 1) und ist Saat für Brosche und Spieluhr.
* [„Ich richte es ihr aus.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ich richte es ihr aus.“ Er nickt, und etwas in seinen Schultern löst sich{mob == "zerstreut":, nicht viel, eine Fingerbreite}.
// WARUM: Zusage ohne Wort; die Bitte ist angenommen, aber nicht versprochen. Neutral.
* [Ihm stumm zunicken #fliesst]
    Ein Nicken, ohne ein Wort, und er nickt zurück, trotz des Verbandes, im selben Augenblick wie du.
-
{
- kleriker != "besiegt" and gascoigne >= 0 and mob == "zerstreut":
    // [ERWEITERT] Gascoigne glaubt, die Bestie auf der Brücke gekannt zu haben. Wer sie war, ist im Kanon [OFFEN]; eine Hochzeit nennt er nirgends mehr (Faktencheck n1 Nr. 2: Gerücht statt Beweis).
    „Und wenn du zur großen Brücke gehst …“ Er dreht sich halb um. „Ruf mich. Da oben haust einer, den ich, glaub ich, kenne.“ Er geht in den Rauch. Neben Martha sind in der Asche zwei Abdrücke geblieben, wo er gekniet hat. # quest: gascoigne_bruecke
- kleriker != "besiegt" and gascoigne >= 0:
    „Und noch was.“ Er stößt sich vom Laternenpfahl ab. „Wenn du zur großen Brücke gehst, ruf mich. Da oben haust einer, den ich, glaub ich, kenne. Ich will ihn mir ansehen.“ Er tippt gegen den Verband und grinst. „So gut das eben geht.“ Dann geht er in den Rauch, und eine Weile hörst du noch seine Stiefel. # quest: gascoigne_bruecke
- mob == "zerstreut":
    Er geht in den Rauch, ohne sich umzudrehen. Neben Martha sind in der Asche zwei Abdrücke geblieben, wo er gekniet hat.
- else:
    „Pass auf dich auf, {gascoigne_name:{name}|Fremder}.“ Er tippt an die Krempe seines Hutes und geht in den Rauch, und der Geruch von Torf bleibt noch einen Atemzug länger als er.
}
-> k1_nach_scheiterhaufen

= mantel_frage
// [ERWEITERT] Wendels Mantel: Gascoigne kennt den Geruch. Er wird misstrauisch. Sein eigener Geruch ist dann schon gefallen (leise, ohne Namen); hier riecht er an dir, nicht umgekehrt. Teer und Pulver gehören dem Mantel (dunkles Haus), Torf und Rauch Gascoigne.
{ mob == "zerstreut": Er tritt einen Schritt näher, beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Sein Gesicht wird noch eine Spur härter, so wie Reif auf einer Scheibe dichter wird.| Noch hält er deine Hand. Er beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Als er sich aufrichtet, geht das Freundliche aus seinem Gesicht, nicht ganz, aber so, wie die Wärme aus einem Zimmer geht, wenn jemand die Tür offen lässt.}
„Teer. Pulver. Und Wendel.“ Er sagt den Namen, als lege er ihn auf einen Tisch. „Wendel ist seit zwei Jagden nicht heimgekommen. Woher hast du seinen Mantel?“
~ mantel_erkannt = true
// WARUM: Die Wahrheit über den Fund; Gascoigne glaubt sie, und sie tut ihm weh. Der ehrliche Weg, ohne Strafe.
* [Ihm die Wahrheit über den Mantel sagen #fliesst]
    // [ERWEITERT] Umbau 2026-11-06: Der Mantel hing hinter der Tür im dunklen Haus (nicht mehr bei den Boten). Gascoigne glaubt dir, ohne zu sagen, warum.
    Die Wahrheit, so wie sie war: ein Haus mit offener Tür, ein Haken hinter der Tür, ein Name im Futter. Noch während du erzählst, hörst du, wie es klingt. Gascoigne schweigt lange. „Hinter der Tür“, sagt er endlich. „Dann ist er dort hineingegangen und nicht mehr heraus.“ Er reibt sich mit dem Daumen über den Verband, dort, wo die Augen sein müssten. „Das glaub ich dir. Das ist ja das Schlimme.“ # notiz: gascoigne_mantel
// WARUM: Die Lüge; für Aufmerksame falsch, denn Gascoigne hat eben am Mantel gerochen und kennt Wendel. Folge: Misstrauen (gascoigne − 1), die Flasche ohne abgewischten Hals, später ein Echo im Nachbild.
* [„Der lag in einer Gasse.“ #fliesst]
    ~ mantel_gelogen = true
    ~ gascoigne = gascoigne - 1
    „Der lag in einer Gasse“, sagst du, „einfach so.“ Gascoigne nickt langsam. „Wendel lag in keiner Gasse“, sagt er. „Wendel lag nie irgendwo. So.“ Mehr sagt er nicht dazu, aber als er dir den Rücken zuwendet, tut er es einen halben Schritt später als vorher. # notiz: gascoigne_mantel
- -> gascoigne_greift_ein.nach_mantel

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON lore:figuren/maedchen-und-viola] Gascoignes Tochter; erkennt den Jäger am Geruch, nicht an der Stimme; die Mutter (Viola) ging den Vater suchen; Spieluhr mit dem Lied des Vaters, das ihn an die Familie erinnert, wenn er vergisst; Namen im Deckel; die Mutter sei schusselig; sie erwähnt einen Großvater; der Morgen komme immer (im Kanon später, beim Warten; hier schon gesät, Ernte in d_nachspiel). Sie trägt eine große weiße Schleife (G1); rot wird das Band erst beim Schwein.
// [ERWEITERT] Die Schleife am Riegel als Zeichen für die Mutter (nicht erklären; das sagt das Kind selbst). Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation (erkennbar: Sie will selbst suchen gehen, und Iosefka öffnet niemandem).
// [ERWEITERT] Lektorat 1.3: Der Spieluhr fehlt ein Ton; an derselben Stelle jeder Runde stolpert die Melodie über eine Lücke. Überarbeitung 2026-11-06: Man sieht die Ursache, eine Lücke im Kamm; Gascoigne hat die ersten Töne am Scheiterhaufen vorgesummt (Wiedererkennung ohne Erklärung). Ernte an Brücke und Grab (andere Dateien).
// [ERWEITERT] Die heruntergebrannte Räucherlampe vor ihrem Fenster: Sie ist schon lange allein.
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat. Sie kennt den Vater am Geruch, nicht an den Augen (Verband).
-> betreten("maedchen") ->
~ maedchen_gesehen = true
Hinter dem Tor liegt ein kleiner Platz, so eng umbaut, dass die Fenster einander in die Läden sehen, und in seiner Mitte steht ein Brunnen, der lange kein Wasser mehr gegeben hat; sein Becken ist voll Laub und zerbrochener Ziegel. Von den Gassen her dringt der Lärm nur gedämpft herein. Mitten in diese Stille spielt eine Spieluhr, ein Lied aus wenigen hohen Tönen, und die ersten kennst du: So hat Gascoigne sie auf dem Platz am Feuer gesummt, nur tiefer. Hier aber fehlt an derselben Stelle jeder Runde ein Ton, und die Melodie stolpert über die Lücke und fängt sich wieder. Davon wird dir der Hals eng, so wie es nur Lieder tun, die man als Kind gehört hat. # bild: brunnenplatz # stimmung: schoen
Die Melodie kommt aus einem Fenster im ersten Stock. Davor brennt eine einzige Räucherlampe, so weit herunter, dass ihr rotes Glas von innen schwarz beschlagen ist, und aus den Ritzen der Läden hängt eine weiße Haarschleife, um den Riegel geknotet; das Band ist so lang, dass es im Zug gegen das Holz schlägt. # lore: familie_gascoigne
Als du näher kommst, bricht die Melodie mitten im Takt ab. Hinter den Läden zieht jemand die Luft ein, kurz und prüfend. „Du riechst wie Papa, wenn er spät heimkommt“, sagt eine dünne Stimme. „Bist du ein Jäger?“
Zwischen den Läden erscheinen vier kleine Finger, dann zwei Augen, sehr ernst. „Papa ist auf die Jagd gegangen und nicht wiedergekommen. Und Mama ist gegangen, ihn zu suchen, und auch nicht wiedergekommen. Und Opa ist auch nicht da. Ich hab die Tür zugemacht, so wie Mama gesagt hat. Ich hab das Räucherwerk angezündet. Ich hab meine Schleife rausgehängt, damit Mama das Fenster findet. Ich hab alles richtig gemacht.“ Sie holt Luft. „Und ich bleib wach. Mama sagt, der Morgen kommt immer.“
Dann, so bestimmt, wie Kinder Dinge sagen, die sie sich lange überlegt haben: „Wenn Mama nicht bald kommt, geh ich selber und such sie.“ # notiz: maedchen_warnung
// WARUM: Das Versprechen an das Kind; öffnet die Suche nach der Mutter (q_mutter) und gibt die Spieluhr. Der richtige Weg, auch wenn das Versprechen schwer zu halten ist.
* [„Ich finde deine Mama.“ #fliesst]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    „Ich finde deine Mama.“ Hinter den Läden kommt einen Atemzug lang nichts. Dann, kaum hörbar: „Versprochen?“ Und bevor du antworten kannst: „Danke.“
    -> spieluhr_geben
// WARUM: Erst fragen, dann versprechen; öffnet die Suche ebenso, ohne das Kind an ein Versprechen zu binden, und nennt die rote Brosche (Wiedererkennung Violas).
* [„Woran erkenne ich deine Mama?“ #fliesst]
    ~ q_mutter = 1
    „An der Brosche“, sagt sie, noch bevor du ausgesprochen hast. „Mama trägt immer die große rote Brosche. Die sieht man von Weitem, die ist schöner als alles.“
    -> spieluhr_geben
// WARUM: Das Kind in Sicherheit schicken wollen; für Aufmerksame falsch, denn Iosefka öffnet niemandem (Klinik), und das Kind hat eben gesagt, es wolle selbst suchen gehen. Folge in der Kanalisation.
* [„Lauf zu der Ärztin in der Klinik.“ #fliesst]
    -> fort
// WARUM: Sich nicht binden; das Kind bleibt am Fenster, aber ohne Spieluhr und ohne Suche. Ein kalter, kein tödlicher Weg.
* [Dich ohne ein Versprechen abwenden #fliesst]
    „Kommst du wieder?“, fragt sie deinem Rücken nach. Du antwortest nicht, und als du dich am Tor noch einmal umsiehst, sind die Finger aus dem Spalt verschwunden.
    -> k1_viertel2

= spieluhr_geben
// [KANON lore:figuren/maedchen-und-viola] Inhalt sinngemäß, Wortlaut eigen.
Etwas schabt am Fensterbrett, und durch den Spalt zwischen den Läden schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. „Die ist von Papa. Das ist sein Lied. Papa riecht manchmal ganz fremd, und dann sagt er unsere Namen falsch. Dann zieh ich die auf, und er hört zu, und hinterher ist er wieder Papa.“ Sie schiebt sie noch ein Stück weiter. „Mama hätte sie mitnehmen müssen. Sie hat sie hier auf dem Tisch vergessen, Mama vergisst immer was. Bring sie ihr.“ # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Der Deckel steht einen Spalt offen. Innen sitzt der stählerne Kamm, und in der Reihe seiner Zähne klafft eine Lücke, wie in einem Kindermund. Auf die Innenseite des Deckels ist ein vergilbter Zettel geklebt, zwei Namen in einer feinen Schrift, deren V einen kleinen Kringel nach links macht: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Der Deckel bleibt offen in deiner Hand, eine ganze Weile. Dann klappst du ihn zu, und auf dem Platz verstummt etwas, von dem du nicht wusstest, dass es zu hören war.
}
-> k1_viertel2

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien. Die weiße Schleife nimmt sie mit.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
„Lauf zu der Ärztin in der Klinik“, sagst du. „Dort bist du sicher.“ # quest: maedchen_fort
„Wirklich?“ Ein Atemzug, dann noch einer. Auf einer Treppe im Haus trappeln Schritte, ein Riegel geht, ein zweiter, eine Haustür knarrt. Ein kleiner Schatten huscht über den Platz und bleibt an der Ecke stehen, wo eine Treppe zu den Kanälen hinabführt; dort sieht er hinunter, lange, und nicht in die Richtung der Klinik. Dann ist er fort. Am Riegel hängt keine weiße Schleife mehr, und hinter den Läden brennt die Räucherlampe allein weiter.
-> k1_viertel2


=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON lore:orte/zentral-yharnam] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel (Kernmoment, Entscheidung des Nutzers).
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Feuerwaffen sind Vorderlader (LK §19): Pulver und Papier, keine Hülsen. Die Brandflasche ist eines der ältesten Werkzeuge der Jäger.
// [ERWEITERT] Der Alte zählt (Kiesel, fünf und fünf; beim Nachladen zählen die Lippen mit). Das Zählen gehört ihm (Lektorat 1.2).
// Überarbeitung 2026-11-06: Der Schütze sitzt über dem Eingang der Gasse, also hinter dir; das Anzeichen (frisches Pulver, die schaukelnde Klammer an einer Leine, die zum Dach führt) steht vor der Wahl. Die Brandflasche liegt sichtbar neben ihm.
-> betreten("daecher") ->
~ kampfanfang = -> k1_b_daecher
Die Gasse ist so schmal, dass du die Hauswände zu beiden Seiten mit den Ellbogen streifst, und über dir kreuzen sich Dachrinnen, zerbrochene Fensterläden und Wäscheleinen. An einer davon hängt nichts mehr als eine einzelne hölzerne Klammer, und die schaukelt, obwohl in dieser Gasse kein Wind geht. Keine Taube, kein Tropfen, nur der Geruch von Schießpulver, frisch, so wie es nur riecht, wenn eben erst jemand geladen hat. # bild: gasse # stimmung: spannung
// WARUM: Die Zeichen ernst nehmen (frisches Pulver, die schaukelnde Klammer); der Aufmerksame entdeckt den Schützen, bevor er schießt. Kein Schaden.
+ {not schuetze_gesehen} [Langsam, die Dächer im Blick #fliesst]
    Schritt für Schritt, den Blick auf den Dachkanten, vor dir und hinter dir, und beim zehnten Schritt bleibst du stehen. Über dem Eingang der Gasse, durch den du eben gekommen bist, hockt hinter einem Schornstein, kaum mehr als ein Umriss, ein alter Mann, gebeugt, eine Schlafmütze auf dem Kopf und in den Händen ein Gewehr, das länger ist als er selbst. Er hat dich noch nicht gesehen. Sein Lauf zielt an dir vorbei auf eine Stelle der Gasse, zwanzig Schritte weiter, wo in drei Atemzügen dein Rücken gewesen wäre. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
// WARUM: Eile über die Zeichen hinweg; erkennbar falsch, denn die Gasse riecht nach frisch geladenem Pulver. Folge: der Schuss von hinten, ein Leben.
+ {not schuetze_gesehen} [Schnell geradeaus hindurch #fliesst]
    Auf halbem Weg kracht hinter dir ein Schuss, etwas Heißes fährt dir in die Schulter, das Pflaster springt dir entgegen, und deine Hände fangen dich auf, ehe du weißt, woher es kam. Als du dich umdrehst, hockt über dem Eingang der Gasse hinter einem Schornstein ein alter Mann mit einer Schlafmütze und lädt nach, mit zitternden Händen, und seine Lippen zählen dabei mit. # klang: schuss
    ~ zuletzt = schuss
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ schuetze_gesehen = true
    -> oben

= oben
// WARUM: Den Schützen stellen; öffnet die Begegnung mit dem Alten, die Wahl zwischen Gnade und Tod und den Fund (Kiesel, Brandflasche).
+ [Hinaufklettern und ihn stellen #fliesst]
    Über eine Regenrinne hinauf, einen Fenstersims, einen Balken, und als du oben bist, will er das Gewehr herumreißen, aber es ist zu lang für den schmalen Sims und schlägt gegen den Schornstein. Er sieht zu dir auf und klatscht einmal in die Hände. Neben ihm auf dem Sims liegen Kieselsteine, sorgfältig in Reihen gelegt, immer fünf und fünf, so wie man Tage zählt, und am Schornstein lehnt eine Flasche, in deren Hals ein ölgetränkter Lappen steckt. # stimmung: kampf
    -> schuetze_wahl
// WARUM: Ausweichen statt stellen; sicher, aber ohne Fund und ohne den Alten. Kein falscher Weg, ein ärmerer.
+ [Im Hauseingang Deckung suchen #fliesst]
    Im nächsten Hauseingang, den Rücken an der kalten Tür, wartest du, bis oben kein Lauf mehr über die Dachkante ragt. Dann weiter, dicht an der Wand, den Stein an der Schulter, bis die Gasse dich freigibt. Hinter dir, über den Dächern, zählt eine dünne Stimme bis fünf und fängt von vorn an.
    -> k1_viertel2

= schuetze_wahl
// WARUM: Gnade für einen, der nicht mehr weiß, was er tut; der Alte lebt, und später schießt er dir den Rücken frei (d_nachspiel).
* [Ihm das Gewehr abnehmen und gehen #fliesst]
    ~ schuetze_verschont = true
    Er lässt das Gewehr los wie ein Kind ein Spielzeug, das ihm ohnehin langweilig geworden ist, und fängt an, seine Kiesel neu zu zählen. Unten in der Gasse schlägt der Kolben auf das Pflaster. Zwei Kiesel nimmst du mit und die Flasche mit dem Lappen im Hals; er zählt weiter, um die Lücke herum. # notiz: kiesel
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_viertel2
// WARUM: Die Gefahr beenden; kein Spielfehler, aber ein Mord an einem Wehrlosen, den das Detail (das sonntäglich gekämmte Haar) hinterher spüren lässt.
* [Es mit der Säge beenden #fliesst]
    Es geht schnell. Er macht dabei einen kleinen, überraschten Laut, mehr nicht. Unter der Schlafmütze ist sein Haar sorgfältig gekämmt und mit Wasser angelegt, wie man es für den Sonntag tut. Zwei von seinen Kieseln steckst du ein und die Flasche mit dem öligen Lappen im Hals; die übrigen liegen weiter in ihren Reihen, fünf und fünf. # notiz: kiesel
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_viertel2

=== k1_b_dachweg ===
// TITEL: Der Dachweg
// [ERWEITERT] Station des Umbaus 2026-11-06 (Kartenmodell, zweites Viertel), ausgeschrieben in der Überarbeitung 2026-11-06 (Ü10).
// Fundstücke (ersetzen den Handel im Bad der Boten): das Jagdheft eines Toten (aus dem Bestand von boten_laden), eine Brandflasche, zwei Kiesel. Von oben sind Spuren der anderen Wege zu sehen.
// [ERWEITERT, Ü1] Der Mond, zweite Stufe: tiefer und größer als über den Giebeln der Klinik, an derselben Stelle; vor der Brücke (Türme als Scherenschnitte) und vor den Gräbern (Narben).
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Die Jäger der Jäger kleiden sich wie Krähen und deuten damit eine Himmelsbestattung an; der erste von ihnen gab den Toten ein würdiges Begräbnis nach seiner Heimat. Daraus [ERWEITERT]: Der Tote sitzt aufgebahrt unter dem Himmel, die Hände gefaltet, eine schwarze Feder zwischen den Fingern; Krähen warten. Wer ihn so hingesetzt hat, sagt niemand (Saat für Eileen, gleich danach; [Offen], ob sie ihn getötet hat).
// [ERWEITERT] Das Heft zeichnet die drei Anzeichen, die es lehrt (wurf, ansturm, axt_wirbel), und die beiden Griffe, die es freischaltet (Knochenarm, Ansturm des Schweins).
-> betreten("dachweg") ->
Oben läuft ein Weg, wie Jäger ihn sich legen, wenn ihnen die Gassen zu eng werden: Bretter von First zu First, Balken über den Lücken, gespannte Leinen, an denen man sich halten kann, wenn man der Leine traut. Hier oben geht ein Wind, den es unten nicht gibt, kalt und rein, und zum ersten Mal seit der Klinik riecht die Luft nicht nach Räucherwerk. Von hier sieht Yharnam anders aus. Die Gassen sind Risse zwischen den Dächern, in den Rissen wandern Fackeln, und an den Hauswänden hängen die Räucherlampen in roten Reihen übereinander, an manchen Häusern so viele, dass man die Angst darin abzählen könnte. Weit hinten glimmt der Platz, an dem das Feuer brennt. # bild: daecher_eileen # stimmung: ruhig
Über allem steht der Mond, tiefer als über den Giebeln der Klinik und größer, bleich wie ausgekochter Knochen, und der Rauch legt ihm einen Hof um, der nicht weicht. Er steht noch an derselben Stelle. Die Schatten der Schornsteine liegen lang über den Ziegeln und zeigen alle in dieselbe Richtung, von ihm fort.
{ not k1_b_maedchen: Tief unten, zwischen den Giebeln, spielt etwas, das fast eine Melodie ist, und hört an einer Stelle auf und fängt wieder an. }
{ not k1_b_daecher: Auf einem Dach weiter hinten hockt ein Schatten hinter einem Schornstein, mit einem Gewehr, das länger ist als er selbst, und zielt in eine Gasse hinunter, in der niemand geht. }
Am Fuß eines Schornsteins sitzt ein Jäger, den Rücken an den Ziegeln, den Kopf auf der Brust. Er ist tot. Jemand hat ihm die Hände in den Schoß gelegt, die eine über die andere, und zwischen die Finger eine schwarze Feder gesteckt. Auf dem First über ihm hocken drei Krähen nebeneinander und sehen zu, wie du näher kommst. Keine fliegt auf.
Aus seiner Manteltasche ragt ein Heft, an den Ecken weich gegriffen. Neben seinem Stiefel stehen, sorgsam aufgereiht, eine Flasche mit einem ölgetränkten Lappen im Hals und zwei glatte Kiesel.
// WARUM: Wissen nehmen, auch von einem Toten; das Heft lehrt drei Anzeichen im Voraus und öffnet an Brücke und Schwein je eine Möglichkeit mehr. Der nützlichere Weg, um den Preis, die Ruhe des Toten zu stören.
* [Das Heft aus der Tasche ziehen #fliesst]
    ~ jagdnotizen = true
    ~ gelernt += (wurf, ansturm, axt_wirbel)
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    Die Seiten sind gewellt, einmal nass geworden und wieder getrocknet, und ein Jäger hat darin mit Bleistift gezeichnet, was ihn beinahe umgebracht hat, mit Pfeilen und wenigen Wörtern. Ein Arm, der eine Kutsche über die Schulter hebt, und ein Pfeil vom Kopf der Bestie dorthin, wohin sie wirft. Ein Geweih, gesenkt, daneben das Wort „spät“, dreimal unterstrichen. Ein Arm aus lauter Knochen, verzweigt wie Reisig, mit einem Kreis um das Ende, wo die Knochen zusammenlaufen, und darunter „fassen“. Ein Eber von vorn, und vor ihm eine Gestalt aus drei Strichen, die Füße gestemmt, die Schulter voraus: „nicht weichen“. Zuletzt ein Strich, gerade von oben nach unten, und darunter drei Kerben, die dritte tiefer als die anderen. # notiz: jagdnotizen
    Die letzte Seite ist leer bis auf einen braunen Daumenabdruck. Die Flasche und die Kiesel steckst du auch ein, und als du dich aufrichtest, rücken die Krähen auf dem First ein Stück näher an den Toten heran.
// WARUM: Den Toten in Ruhe lassen und nur nehmen, was neben ihm steht; achtungsvoll, aber ohne das Wissen des Hefts. Kein falscher Weg, ein ärmerer.
* [Nur die Flasche und die Kiesel nehmen #fliesst]
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    Die Flasche und die Kiesel nimmst du an dich, und das Heft schiebst du ihm tiefer in die Tasche, damit der Wind es nicht holt. Über dir rücken die Krähen auf dem First zusammen.
- Am Ende des Dachwegs führt eine zweite Leiter in einen Hinterhof hinab, und mit jeder Sprosse wird die Luft wieder dick vom Räucherwerk, bis der Wind von oben nur noch eine Erinnerung im Nacken ist.
-> k1_viertel2

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON lore:figuren/eileen] Eileen auf den Dachbalken über dem Kanaleingang (RK1 §7, §12), Jägerin der Jäger, gibt Jägermarken. Ihre Warnung: Menschen gebe es hier keine mehr, nur Bestien mit Hunger; ein Jäger jage Bestien, die Jäger überlasse er ihr. Sie kennt den Jägertraum (grüßt die kleine Puppe). Nächstes Treffen in Kapitel 1 auf dem Dach über den Gräbern (G2).
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Im Schnabel ihrer Maske steckt Weihrauch gegen den Geruch von Blut und Bestie; die Jäger der Jäger kleiden sich wie Krähen (Himmelsbestattung).
// Die Jägermarken sind entfallen (Entscheidung des Nutzers 2026-11-06: Buchgefühl vor Videospiel).
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und Henryk. Die Partnerschaft beginnt erst in Kapitel 2. Die Abzeichen an der Schnur.
// Überarbeitung 2026-11-06: Die zwei Formen der ersten Begegnung bekommen je ein eigenes Zeichen (Dachweg: die Feder wie beim Toten; Krampen: Weihrauch in der Luft), ohne neue Weiche. Sie erkennt den Traum an der Tinte an deinen Fingern und sagt es (statt des alten Rätselsatzes „gegrüßt, ohne das Wort“); die Puppe nennt sie, aber nicht mit den Worten des Spiels.
// Stimme: heiser, sehr kurz, Sätze ohne Anlauf; beantwortet Fragen mit Gegenfragen oder gar nicht. Ihr Lachen ist ein Krächzen.
-> betreten("eileen") ->
// Zwei Formen der ersten Begegnung (Fassung 2): über den Dachweg oder von unten über die Krampen am Kanaleingang.
{ k1_b_dachweg:
    Über dem Kanaleingang laufen Balken von Haus zu Haus, so schwarz von Ruß wie die oben auf dem Dachweg, und eine Regenrinne führt zu ihnen hinauf. Auf halber Höhe hat sich im Rost eine schwarze Feder verfangen, eine wie die zwischen den Händen des Toten.
- else:
    Zu den Balken über dem Kanaleingang führen eiserne Krampen die Mauer hinauf, schuppig von Rost, und je höher du steigst, desto deutlicher riecht es nach Weihrauch, herb, wie aus einer Kapelle, obwohl hier oben keine Lampe hängt.
}
~ eileen_stufe = 1
Oben laufen die Balken von Dach zu Dach, schwarz von Ruß und Regen, und auf ihnen, halb hinter ein paar Fässern, sitzt jemand so still, dass du ihn für einen Haufen alter Kleider hältst, bis er den Kopf dreht. # bild: daecher_eileen # stimmung: ruhig
Es ist eine Frau, in einem Mantel aus schwarzen Federn, die bei jeder Bewegung rascheln, und vor ihrem Gesicht sitzt ein langer, gebogener Schnabel, wie die Pestärzte ihn auf alten Holzschnitten tragen. An einer Schnur um ihren Hals hängen kleine Abzeichen, Messing, Silber, Eisen, jedes anders und jedes abgegriffen; sie klappern, als sie sich vorbeugt und dich lange ansieht. „Neu“, sagt sie, nicht als Frage. „Riecht man. Sogar hierdurch.“ Sie tippt mit einem Finger an den Schnabel, und aus ihm weht dir Weihrauch entgegen. Nach einem Atemzug: „Menschen gibt's hier keine mehr. Nur Hunger mit Gesichtern.“
{ mantel:
    ~ mantel_erkannt = true
    Ihr Schnabel senkt sich zu deinem Mantel, zum Saum, wo das Stück fehlt. Sie streckt die Hand aus und fährt mit dem Daumen über die Schnittkante, glatt, wie mit einer Klinge gezogen. „Wendel“, sagt sie und zieht die Hand zurück. „Steht dir nicht.“ Als sie sich wieder zurücklehnt, klappert an ihrer Schnur eines der Abzeichen gegen die anderen, und du siehst nicht, welches. # notiz: eileen_mantel
}
// WARUM: Nach den Abzeichen fragen; öffnet, wer sie ist (Jägerin der Jäger) und ihren Namen (eileen + 1). Für Aufmerksame ein Zeichen, dass man ihr den Pater besser nicht zeigt.
* [„Was sind das für Abzeichen?“ #fliesst]
    „Was sind das für Abzeichen?“ Sie fasst die Schnur mit zwei Fingern und lässt die Abzeichen durch die Hand laufen, eins nach dem anderen, und bei jedem hält ihr Daumen kurz an. „Jäger. Die nicht mehr wussten, was sie jagen.“ Sie lässt die Schnur fallen. „Irgendwer muss sie heimbringen. Eileen.“ Erst nach einem Atemzug merkst du, dass das ihr Name war. # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen = eileen + 1
    ~ eileen_genannt = true
// WARUM: Misstrauen zeigen; Eileen achtet es und nennt ihren Namen, ohne dass die Beziehung wächst.
* [Die Hand am Griff der Säge lassen #fliesst]
    Sie sieht die Hand am Griff der Säge und nickt, beinahe zufrieden. „Gut. Misstrauen hält länger als Mut.“ Sie klopft gegen die Abzeichen an ihrer Schnur. „Die hier waren mutig.“ Ihren Namen sagt sie, wie man einen Preis nennt, den man nicht verhandelt: „Eileen.“ # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen_genannt = true
// WARUM: Abweisung; Eileen lacht darüber, behält ihren Namen für sich und begegnet dir an den Gräbern kälter (eileen − 1).
* [„Kümmer dich um deine Sachen.“ #fliesst]
    ~ eileen = eileen - 1
    „Kümmer dich um deine Sachen.“ Unter dem Schnabel krächzt es, kurz und rau; so lacht sie. „Tu ich. Genau das tu ich.“ Die Abzeichen klappern. Ihren Namen sagt sie dir nicht. # lore: jaeger_der_jaeger # lore: blutrausch
- Ihr Schnabel wandert an dir herunter und bleibt an deiner Armbeuge hängen, an der Stelle, wo der Einstich pocht, und dann an deinen Fingern, an der braunen Tinte, die seit der Klinik nicht abgeht. „Hast unterschrieben“, sagt sie. „Wachst also auch im Gras auf, da drüben. Bei der Puppe.“ # notiz: eileen_armbeuge
// [KANON lore:figuren/eileen] Sie kennt den Jägertraum (LK 5.1: grüßt die kleine Puppe). Wortlaut eigen.
Du hast niemandem von dem Garten erzählt.
// WARUM: Nachfragen, woher sie den Traum kennt; sie antwortet nicht. Zeigt, dass Eileen mehr weiß, als sie sagt (Saat für Kapitel 2).
* [„Woher kennst du den Garten?“ #fliesst]
    „Woher kennst du den Garten?“ Keine Antwort. Sie rückt nur die Maske zurecht, und die Abzeichen an ihrem Hals klappern einmal.
// WARUM: Schweigen wie sie; ein stilles Einverständnis zwischen zwei, die denselben Traum kennen. Neutral.
* [Schweigen, wie sie schweigt #fliesst]
    Du sagst nichts. Sie sieht, dass du es bemerkt hast, und sagt auch nichts.
- Dann, während sie die Schnur ordnet: „Ein Pater. Groß, Verband über den Augen. Schon gesehen?“ # notiz: eileen_frage
// WARUM: Für Gascoigne sprechen; Eileen hört zu und nennt Henryk (gascoigne + 1). Der richtige Weg, wenn man den Freund schützen will.
* {q_frau == 1} [„Ja. Er hat mir geholfen.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ja. Er hat mir geholfen.“ Und du erzählst ihr{ mob == "zerstreut":, wie er neben einer Toten kniete und ihren Namen sagte und dir trotzdem zeigte, wie man wartet.|, wie er dich vor der Menge bewahrt und die Bürger beim Namen genannt hat, einen nach dem anderen.} Eileen unterbricht dich nicht. „Hoffentlich bleibt er so“, sagt sie dann. „Er und Henryk, sein alter Partner. Zu lange zusammen draußen. Zu viele Nächte.“ Ihr Daumen liegt auf einem der Abzeichen an der Schnur und bleibt dort. # notiz: henryk
// WARUM: Den Pater der Jägerin der Jäger ausliefern; für Aufmerksame falsch, denn die Abzeichen an ihrer Schnur zeigen, was sie mit Jägern tut. Folge: Gascoigne kann auf der Brücke nicht gerufen werden, und die Nacht trägt es nach.
* {q_frau == 1} [Ihr zeigen, wo du ihn gesehen hast #fliesst]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Mit ausgestrecktem Arm zeigst du über die Dächer, dorthin, wo du ihn gesehen hast, und in welche Richtung er gegangen ist. Sie nickt, langsam. Eine ihrer Hände findet die Schnur mit den Abzeichen und hält sie fest. „Danke“, sagt sie. „Ist richtig so.“ Ihre Stimme klingt nicht, als glaube sie es. # notiz: verrat_gascoigne
// WARUM: Den Freund verleugnen, um ihn zu schützen; Eileen glaubt es nur halb. Neutral für beide.
* {q_frau == 1} [„Nein. Nie gesehen.“ #fliesst]
    „Nein. Nie gesehen.“ Sie nickt, als habe sie diese Antwort erwartet, und der Schnabel bleibt so lange auf dich gerichtet, dass du weißt, wie viel sie dir glaubt und wie viel nicht.
- Sie steht auf. „Bestien jagst du“, sagt sie. „Jäger jag ich.“ Sie breitet den Mantel aus wie Flügel und ist mit einem Sprung auf dem nächsten Dach, und von dort ruft sie, ohne sich umzudrehen: „Jäger sehen sich wieder. Meistens zu spät.“ Wo sie gesessen hat, riecht es noch eine Weile nach Weihrauch. # quest: eileen_treffen
-> k1_vor_bruecke
