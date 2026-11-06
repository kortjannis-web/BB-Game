// KAPITEL 1, AKT II: ZENTRAL-YHARNAM. Entscheidungsbuch (Umbau 2026-11-06): jede Station einmal, vorwärts, kein Hub. Erstes Viertel: zwei von drei Stationen; Kreuzung: Scheiterhaufen (fest); zweites Viertel: zwei von drei; Eileen (fest); dann NADELÖHR 1 (Brücke).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt b_yharnam und Übergreifend 2b, 4, 10):
// Ortsbilder in Stimme A, Geschehen in B, alles von der Kirche in C. Alle Optionen fließen in den Satz (#fliesst).
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen nach der Wahl beginnen mit dem, was geschieht;
// keine christlichen Formeln; der Choral ohne Kommentar; die Spieluhr mit ihrer Lücke; Gascoignes Geruch am Platz nur leise.
// Überarbeitung 2026-11-06 (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12), Teil 1 bis vor k1_b_scheiterhaufen: Text für Text mit stil-1800.
//   Ü1: Mond statt Sonne. Er steht links vom höchsten Turm der Kathedrale und wandert nicht; Saat in k1_b_ankunft (eine Handbreit Himmel
//   zwischen Rand und Turm), Ernte in k1_nach_viertel2 (nur noch ein Finger: er ist gewachsen). Die Brücke (n1) zeigt die nächste Stufe.
//   Ü10: Die Spuren der Viertel kündigen an, was dort wartet (Hund, Glöckchen, Knarren; Spieluhr, Knall in der Gasse, Mantelzipfel am Dach),
//   und hinterlassen, wenn man sie auslässt, je einen Satz, der verrät, was man verpasst hat. Ü7: Jede Option hat ein WARUM.
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
// Früher der erste Besuch des Hubs; jetzt die Ankunft nach Gilbert, einmal. Seit 2026-11-06 der erste Blick über die Stadt, ein paar Schritte hinter Gilberts Fenster
//   (löst die Schwäche „Gilbert vor der Ankunft“ aus docs/qualitaet.md: Gilbert ist die Gasse, dies ist die Stadt).
// [ERWEITERT, Ü1] Der Mond links vom höchsten Turm der Kathedrale, eine Handbreit Himmel dazwischen: Saat für k1_nach_viertel2. Keine Größenformel hier,
//   die Stufe „über den Giebeln“ gehört der Laterne vor der Klinik (a_ankunft).
// [ERWEITERT] Der Schluss mit dem Hasen und den Treibern: Saat für den Mob am Scheiterhaufen. Ersetzt „der nicht weiß, worauf alle warten“
//   (widersprach dem Gespräch mit Gilbert über die Jagdnacht).
-> betreten("zentral") ->
Ein paar Schritte hinter Gilberts Fenster bricht die Gasse über eine Kante ab, und zum ersten Mal siehst du, dass Yharnam eine Stadt aus Treppen ist. Sie steigen und fallen zwischen Häusern, deren Giebel sich so weit über die Gassen neigen, dass zwischen ihnen nur ein Streifen Himmel bleibt, und über allen Dächern steht ein Rauch, der sich nicht verzieht. Fern im Osten ragt die Kathedrale daraus auf, und links von ihrem höchsten Turm, eine Handbreit Himmel dazwischen, steht der Mond. Von irgendwo läuten Glocken, unregelmäßig, als zöge niemand an den Seilen; unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht # klang: glocke
An den Hauswänden lehnen Särge, aufrecht, mit Ketten an die eisernen Ringe geschlossen, an denen man sonst die Pferde festmacht, als sollte aus ihnen nichts mehr herauskommen. Das Pflaster ist noch nass vom Regen, in dem du gekommen bist, und die Kälte steigt dir durch die Sohlen in die Knöchel. Gleich neben deiner Laterne steht eine Haustür offen, die einzige in der ganzen Straße, und schon hinter ihrer Schwelle fängt das Dunkel an.
Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt, an manchen Häusern drei oder vier übereinander, an einem ein ganzes Dutzend, so dicht, dass das Fenster dahinter verschwindet. Der Geruch ist süß und schwer und legt sich dir auf die Zunge wie ein Tuch auf ein Gesicht. # lore: raeucherwerk
Hinter den Fenstern brennt kein Licht als das rote, die Riegel sind vorgeschoben, und die Straße gehört dir allein, so wie ein Feld dem Hasen gehört, wenn die Treiber kommen.
-> k1_viertel1

=== k1_viertel1 ===
// TITEL: Erstes Viertel (zwei von drei)
// Kartenmodell (Sorcery!): Von drei Stationen besucht man zwei, in beliebiger Reihenfolge; die dritte bleibt verloren. Die Wahl ist nicht blind: jede Station kündigt sich durch einen Laut an,
//   der verrät, was dort wartet (Ü10, 2026-11-06): der Hund vor der Tür der alten Frau (k1_b_tueren), das Glöckchen über der Kapelle mit dem Anschlag (k1_b_anschlag),
//   das Knarren des Rollstuhls oben im dunklen Haus (k1_b_haus; zugleich ein erstes Anzeichen für den Schützen).
{ v1_zahl >= 2: -> k1_nach_viertel1 }
{ v1_zahl == 0:
    Drei Laute ziehen dich von der Ecke an der Laterne in drei Richtungen. Unten, wo die roten Lampen am dichtesten hängen, bellt ein Hund, heiser und ohne Pause. Aus einer Seitengasse schlägt ein einzelnes Glöckchen an, dünn und in keinem Takt, ein ganz anderer Ton als die großen Glocken über der Stadt. Und aus der offenen Tür kommt, wenn du still stehst, ein Knarren von Holz, oben irgendwo im Haus, langsam und in gleichen Abständen. Zweien davon kannst du nachgehen. Den dritten wirst du hinter dir lassen, und was an seinem Ende wartet, erfährst du nicht.
- else:
    Wieder an der Ecke bei der Laterne. Zwei Laute sind noch übrig, und einem davon kannst du noch nachgehen; danach führt dich die Straße weiter.
}
- (wahl)
// WARUM: Der Spieler folgt dem Hund in die Gasse der Türen: die Stimmen der Stadt, die alte Frau und Violas Spur. Keine Gefahr; die Station schenkt Wissen und ein Versprechen.
+ {not k1_b_tueren and v1_zahl < 2} [Dem Bellen nach, die Stufen hinab #fliesst]
    ~ v1_zahl = v1_zahl + 1
    Dem Bellen nach führen sieben Stufen hinab, in der Mitte zu Mulden ausgetreten, und mit jeder wird es heiserer und näher, bis es auf der letzten in ein Knurren übergeht und aufhört.
    -> k1_b_tueren
// WARUM: Der Spieler folgt dem Glöckchen zur Kapelle: der Anschlag der Kirche (Stimme C) und die Kreide eines Bruders darunter. Keine Gefahr; Lore über das Blut und die Ordnung der Kirche.
+ {not k1_b_anschlag and v1_zahl < 2} [Dem Glöckchen nach in die Seitengasse #fliesst]
    ~ v1_zahl = v1_zahl + 1
    Dem Glöckchen nach in die Seitengasse, so schmal, dass dein Mantel die Mauern streift, und an ihrem Ende führen drei Stufen hinab, glatt getreten von vielen Füßen, die nicht mehr kommen.
    -> k1_b_anschlag
// WARUM: Der Spieler geht dem Knarren in das dunkle Haus nach: ein Schütze im Rollstuhl, der Zettel über die gesperrte Brücke, Wendels Mantel. Die einzige Station mit Kampf; das Knarren in gleichen Abständen warnt den Aufmerksamen, dass oben jemand sitzt.
+ {not k1_b_haus and v1_zahl < 2} [Durch die offene Tür ins Haus #fliesst]
    ~ v1_zahl = v1_zahl + 1
    Durch die offene Tür ins Haus, und unter dem ersten Schritt knarrt die Schwelle so laut, dass du stehen bleibst und horchst. Oben knarrt es weiter, in seinen gleichen Abständen, als hätte es nichts gehört.
    -> k1_b_haus
// WARUM: Heilen in Ruhe, zwischen zwei Stationen: hier trifft kein Gegner beim Trinken. Prüft nichts; erinnert daran, dass die eine Ampulle verbraucht werden kann.
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl

=== k1_nach_viertel1 ===
// Spuren des Nichtgewählten: ein Satz je ausgelassener Station, der andeutet, was dort wartete (Ü10). Dann das erste Kreischen, dann der Rauch.
// [ERWEITERT] Die alte Stimme, die auf „Fremde“ schimpft (alte Frau); der Anschlag, den ein anderer liest; das Knarren wie ein Atem (der Mann im Rollstuhl).
{ not k1_b_tueren: Unten bei den roten Lampen bellt der Hund noch immer, und eine alte Stimme schimpft auf ihn ein, oder auf etwas anderes; du verstehst nur das Wort Fremde. }
{ not k1_b_anschlag: Das Glöckchen in der Seitengasse schlägt noch einmal an. Was an der Tür darunter angeschlagen hängt, liest heute Nacht ein anderer, oder keiner. }
{ not k1_b_haus: Die Tür neben der Laterne bleibt hinter dir offen, und oben im Haus knarrt es weiter, so ruhig, wie ein Schlafender atmet. }
{ haus_zettel:
    Von der Ecke an der Laterne sieht man zwischen zwei Giebeln ein Stück der großen Brücke, einen schwarzen Bogen gegen den Rauch, und auf ihrer ganzen Länge brennt nicht ein Licht. Der Zettel aus dem dunklen Haus steckt in deiner Tasche, und du musst ihn nicht noch einmal lesen. # lore: kirche_sperrt_bruecke
}
-> schrei ->
Danach führt nur noch ein Weg weiter, die Hauptstraße hinauf, dem Rauch entgegen, und mit jedem Schritt wird er schwerer; unter dem Holzrauch liegt ein Geruch, der in eine Küche gehört und nicht auf die Straße.
-> k1_b_scheiterhaufen

=== k1_nach_scheiterhaufen ===
// Nach der Kreuzung: Wiederkehrsatz aus dem alten Hub, einmal, an fester Stelle.
// Martha: Die Bäckerei am Markt erntet „unten am Markt Brot gebacken, mit zu viel Kümmel“ (Gascoigne, „Wer war sie?“). Das frische Reisig bleibt unerklärt.
{ mob_verbrannt:
    An der Ecke zum Markt liegt vor der Tür einer Bäckerei eine verkohlte Fackel, sorgsam quer über die Schwelle gelegt. Die Läden sind geschlossen, um die Klinke hat jemand ein schwarzes Tuch gebunden, und aus der Ritze unter der Tür riecht es nach kaltem Ofen und nach Kümmel.
- else:
    Am Ende des Platzes siehst du dich noch einmal um. Das Feuer ist heruntergebrannt, und am Fuß des Pfahls liegt schon frisches Reisig, sorgfältig geschichtet, für das nächste.
}
-> k1_viertel2

=== k1_viertel2 ===
// TITEL: Zweites Viertel (zwei von drei)
// Ü10 (2026-11-06): Jede Spur kündigt an, was dort wartet. Die Spieluhr erntet Gascoignes Bitte („wenn du irgendwo eine Spieluhr hörst“) und hakt an ihrer Stelle (Ü11, die Lücke);
//   der Knall springt zwischen engen Mauern (Gasse mit dem Schützen); über der Dachrinne hängt ein Mantelzipfel (der tote Jäger auf dem Dachweg).
// [ERWEITERT] Der Mantelzipfel über der Dachrinne. Anschluss für k1_b_dachweg: der Tote am Schornstein trägt einen langen Mantel, dessen Saum über die Rinne hängt.
{ v2_zahl >= 2: -> k1_nach_viertel2 }
{ v2_zahl == 0:
    Hinter dem Platz teilt sich die Straße, und wieder ziehen dich drei Spuren in drei Richtungen. Hinter einer Mauer spielt eine Spieluhr, so leise, dass du zweimal stehen bleibst, um sicher zu sein, und an einer Stelle hakt sie, jedes Mal an derselben. Aus einer Gasse zur Linken kracht ein Schuss, und der Knall springt zwischen den Hauswänden hin und her, so eng stehen sie; einen Schrei hörst du danach nicht. Und an einer Hauswand lehnt eine Leiter, die zu den Dächern hinaufführt, und über der Dachrinne hängt der Zipfel eines Mantels herab, der sich nur rührt, wenn der Wind ihn anfasst. Zweien davon kannst du folgen.
- else:
    Wieder dort, wo die Straße sich teilt. Einer der beiden übrigen Spuren kannst du noch folgen; dann führt dich die Straße weiter.
}
- (wahl)
// WARUM: Der Spieler folgt der Spieluhr, um die Gascoigne gebeten hat: das Mädchen am Fenster, die Spieluhr mit den zwei Namen, ein Versprechen. Wer Gascoigne zugehört hat, weiß, wessen Kind dort wartet.
+ {not k1_b_maedchen and v2_zahl < 2} [Hinter die Mauer, der Spieluhr nach #fliesst]
    ~ v2_zahl = v2_zahl + 1
    Hinter die Mauer, der Spieluhr nach, und ein Stück an ihr entlang, bis eine Pforte sich auftut, kaum höher als du, der Flügel nur angelehnt.
    -> k1_b_maedchen
// WARUM: Der Spieler geht dem Schuss nach: die Gasse mit dem Schützen auf dem Dach, der Schuss von hinten. Der Knall zwischen engen Mauern und die Stille danach warnen: Dort wartet jemand mit einem Gewehr, der nicht gefehlt hat.
+ {not k1_b_daecher and v2_zahl < 2} [In die enge Gasse, dem Knall nach #fliesst]
    ~ v2_zahl = v2_zahl + 1
    In die enge Gasse, aus der der Knall kam, und nach dem ersten Schritt bleibt das Mondlicht oben auf den Dächern zurück.
    -> k1_b_daecher
// WARUM: Der Spieler steigt zu dem Mantelzipfel hinauf: der Dachweg mit dem toten Jäger, seinem Heft und Wurfzeug. Keine Gefahr; Wissen über Gegner, die noch kommen, und ein Blick auf die anderen Wege.
+ {not k1_b_dachweg and v2_zahl < 2} [Hinauf über die Leiter, zum Mantel #fliesst]
    ~ v2_zahl = v2_zahl + 1
    Hinauf über die Leiter, die Sprossen kalt und rau vom Rost, und mit jeder Sprosse wird der Rauch unter dir dünner und der Mantelzipfel über dir schwerer und nasser.
    -> k1_b_dachweg
// WARUM: Heilen in Ruhe, zwischen zwei Stationen: hier trifft kein Gegner beim Trinken. Prüft nichts; erinnert daran, dass die eine Ampulle verbraucht werden kann.
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl

=== k1_nach_viertel2 ===
// Spuren des Nichtgewählten (je ein Satz, der verrät, was verpasst ist), das zweite Kreischen, der Mond; dann Eileen (fest).
// [ERWEITERT, Ü1] Ernte der Saat aus k1_b_ankunft: Der Mond steht noch links vom höchsten Turm, aber zwischen Rand und Turm passt nur noch ein Finger. Er wandert nicht, er wächst.
//   Ersetzt den Satz von der roten Sonne über den Giebeln. Danach der Weg hinab zum Kanaleingang, wo Eileen wartet.
// Die betende Stimme nach dem zweiten Kreischen (schreie == 2) jetzt als Nachklang im Weitergehen; vorher wurde sie im selben Atemzug „heiser“ (Zeitsprung aus dem alten Hub).
{ not k1_b_maedchen: Hinter der Mauer setzt die Spieluhr noch einmal ein, hakt an ihrer Stelle und schweigt dann, mitten im Lauf. }
{ not k1_b_daecher: Aus der engen Gasse kracht noch ein Schuss, und danach schreit jemand, kurz, und dann nicht mehr. }
{ not k1_b_dachweg: Der Mantelzipfel über der Dachrinne hängt noch, wo er hing, und heute Nacht steigt keiner mehr hinauf, um nachzusehen, wem er gehört. }
{ spieluhr: Die Spieluhr in deiner Tasche klickt bei jedem Schritt gegen einen Knopf deines Mantels, und du legst die Hand darauf, damit sie still ist, und lässt sie dort. }
-> schrei ->
{ schreie == 2: Noch zwei Gassen weiter hörst du die alte Stimme beten, durch Holz und Stein, und als sie nicht mehr zu hören ist, weißt du nicht, ob sie aufgehört hat oder ob du nur zu weit gegangen bist. }
~ fr_frei_machen(fr_nacht)
Links vom höchsten Turm der Kathedrale steht der Mond, genau dort, wo er stand, als du zum ersten Mal auf die Treppen der Stadt hinabsahst. Nur lag vorhin eine Handbreit Himmel zwischen seinem Rand und dem Turm, und jetzt passt kaum ein Finger hinein. Gewandert ist er nicht. Er ist größer geworden.
Die Straße fällt ab, zu einem gemauerten Bogen, aus dem kalte Luft steigt und das Rauschen von Wasser, und dein Schatten läuft dir voraus, die Stufen hinunter, bis er im Dunkel unter dem Bogen verschwindet.
-> k1_b_eileen

=== k1_vor_bruecke ===
// Nach Eileen: der Weg zur Brücke.
// [ERWEITERT] Die leeren Haken, die offenen Läden, das Hufeisen: Saat für die Kutschen und toten Pferde auf der Brücke (n1_kleriker). Ü1: Der Weg führt auf den Mond zu,
//   darum fällt der Schatten jetzt hinter dich; seine Größe zeigt erst die Brücke.
Zur großen Brücke führt eine Straße hinauf, die mit jedem Schritt breiter und leerer wird. Die Räucherlampen an den Fenstern werden seltener, dann hängen nur noch leere Haken da, und die Läden stehen offen, die Zimmer dahinter ausgeräumt bis auf die Tapeten. Mitten auf dem Pflaster liegt ein Hufeisen, die Nägel noch darin, so wie es einem Pferd vom Huf gerissen wurde, das zu schnell bergauf wollte. Dein Schatten fällt hinter dich, lang und schmal, den Weg zurück, den du gekommen bist, und vor dir ist nur noch Wind.
-> k1_n1_kleriker

=== schrei ===
// TITEL: Kreischen von der Brücke
// [KANON lore:bosse/kleriker-bestie] Das Kreischen hört man durch die Stadt, lange bevor man die Bestie sieht. Ein Kernmoment des Spielgefühls: Ankündigung ohne Erklärung.
// Überarbeitung 2026-11-06 (Moment anzeichen: das Ohr zuerst, zwei Gewohnte und ein Drittes; der Hund als Zeuge nach Kleist): Beim ersten Mal stellt sich der Laut neben
//   das Bellen und die Glocken und bringt den Hund zum Schweigen; beim zweiten Mal steckt ein Wort darin, und der Körper antwortet (die Schultern: Saat für n1_kleriker,
//   „deine Schultern kennen den Ton“).
~ schreie = schreie + 1
{ schreie:
- 1: Zu dem Bellen von unten und den Glocken, die in keinem Takt schlagen, kommt ein dritter Laut, von weit her, aus der Richtung, in der die Stadt über eine Brücke zur Kathedrale hinaufsteigt. Ein Kreischen, das länger dauert, als ein Mensch Atem hat, und noch immer nicht abreißt, bis dir selbst die Luft knapp wird und du merkst, dass du sie angehalten hast. Unten in der Gasse verstummt der Hund mitten im Bellen. Hinter einem Fenster löscht jemand hastig eine Kerze, und das rote Räucherlicht davor brennt allein weiter. # klang: kleriker_schrei # stimmung: grauen
- 2: Wieder das Kreischen, und diesmal näher. Ein Wort steckt darin, oder was von einem Wort übrig bleibt, wenn man es lange genug zieht und zerreißt; du hörst es zweimal und könntest beim dritten Mal nicht mehr sagen, welches. Deine Schultern sind oben, bis an die Ohren, ehe du es merkst, und lassen sich nicht gleich wieder senken. Hinter einer Tür beginnt eine alte Stimme zu beten, schnell und tonlos, und hört nicht mehr auf. # klang: kleriker_schrei # stimmung: grauen
}
->->

=== k1_b_gilbert ===
// TITEL: Gilbert
// Handgearbeitet 2026-11-04 nach docs/stimme.md: Ortsbild in Stimme A, Begegnung in Stimme B. Optionen fließen in den Satz (#fliesst).
// 2026-11-05 nur die Befunde des Faktenchecks: Gilbert sitzt (kann nicht aufstehen), Jagdnacht als Gelegenheit und der Osten des Tals, Ludwigs Silberschwert statt der Mondklinge, Merker gilbert_jagd und gilbert_kleriker.
// 2026-11-05 Lektorat (Maßstab, nur das Genannte): Antwort zum bleichen Blut gekürzt, keine Bekreuzigung, Weihrauch ohne Formel, Fortsetzungen nach der Wahl ohne „Du fragst“.
// Überarbeitung 2026-11-06 (Momente begegnung, gespraech, geruecht): Was trägt, bleibt. Die Fragen sind jetzt Rede des Jägers (er siezt Gilbert, wie Gilbert ihn), keine Menüpunkte;
//   „gelb wie Kerzenwachs“ gestrichen (Wachs gehört dem Mond, Ü1); die Seuche in Gilberts Worten statt als Lehrsatz; die Frage nach den Jägern kommt vom neuen Jäger selbst.
// Lore: lore/figuren/gilbert.md, lore/orte/zentral-yharnam.md, RK1 §5. Wissenssperre: lore/kapitel/kapitel1.md.
// [KANON lore:figuren/gilbert] Kranker Fremder hinter dem Fenster bei der ersten Laterne; nennt den Jäger einen Mitfremden; kann nicht aufstehen; kennt bleiches Blut nicht und verweist auf die Kirche und die Kathedrale im Osten des Tals; in der Jagdnacht sei die Gelegenheit; nennt zuerst die Große Brücke als Weg (RK1 §5, sicher); rät, die Stadt bald zu verlassen; wird nach dem Blutmond zur Bestie.
// [ERWEITERT] Kampfer und kalter Tee, der zu weite Ring, der Birnbaum, das Sammeln von Namen, seine Bitte. Der Flammenwerfer kommt bei uns schon in Kapitel 1 und mit ihm der Satz vom erkauften Aufschub (Kanon: beides ab Sonnenuntergang).
// [Deutung, nur als Detail, nie aussprechen] Er könnte einst Kirchenjäger gewesen sein (LK 5.1): Die Düse ist alt verrußt, obwohl er sagt, er habe das Gerät nie benutzt.
// Stimme Gilbert: höflich, siezt, selbstironisch, fragt zurück; der Husten schneidet ihm die Sätze ab.
-> betreten("gilbert") ->
~ fr_frei_machen(fr_blut)
{ k1_b_gilbert == 1:
    Neben der Laterne, wo die Gasse sich zum Platz hin weitet, steht ein schmales Haus mit einem Fenster zu ebener Erde, und vor dem Fenster sitzt ein Gitter, wie man es in Yharnam vor die Kammern der Kranken setzt, damit nichts hinein kann und nichts heraus. Die Läden sind bis auf einen Spalt geschlossen. Aus dem Spalt dringt kein Räucherwerk wie aus den Nachbarhäusern; es riecht nach Kampfer und kaltem Tee, nach einer Stube, in der seit Wochen niemand gelüftet hat. # bild: gilbert # stimmung: ruhig
    Dahinter atmet jemand, nass und tief, und der Atem verhakt sich an einer Stelle und reißt und wird zu einem Husten, der kein Ende findet. Dein eigener Hals zieht sich zusammen. Der Einstich in deiner Armbeuge, durch den in der Klinik das fremde Blut in dich hineinlief, pocht im Takt dieses Hustens, so genau, dass du die Hand darauflegst.
    Am Gitter erscheint ein Gesicht, hager und gelb, mit Augen, die freundlicher sind, als eine Jagdnacht es erlaubt. In jedem steht eine winzige Laterne. „Sie riechen nach Regen“, sagt der Mann, „und nach Landstraße. Nicht nach Rauch. Von draußen also.“ Er legt die Hand an einen Stab, eine Hand, an der der Ring zu weit geworden ist. „Gilbert. Auch von draußen, nur schon länger, als mir lieb ist. Und Jäger sind Sie geworden, nicht wahr? Man sieht es an der Art, wie Sie stehen.“ # lore: fremde
    { herkunft == "kranker":
        Da hustest du selbst, trocken und kurz, und er hält mitten im Satz inne. „Oh“, sagt er leise. „Das kenne ich. Das kenne ich sehr gut.“
    }
    -> haltung
}

= haltung
// WARUM: Der Spieler gibt sich zu erkennen. Öffnet Gilberts Freundschaft (er sammelt Namen) und damit später seine Bitte um den Bericht.
* [Ihm deinen Namen nennen #fliesst]
    ~ gilbert = gilbert + 1
    Du nennst ihm deinen Namen und bleibst am Gitter, bis der Husten sich gelegt hat. „{name}“, wiederholt er, leise, zweimal, so wie man sich eine Hausnummer merkt. „Danke. Hinter so einem Gitter wird man wunderlich, wissen Sie. Man sammelt Namen, wie andere Leute Knöpfe sammeln.“
// WARUM: Der Spieler hält sich bedeckt, ohne unfreundlich zu sein. Gilbert durchschaut die kleine Lüge und bleibt freundlich; das Gespräch geht weiter, die Freundschaft wächst nicht.
* [„Ich bin nur auf der Durchreise.“ #fliesst]
    „Ich bin nur auf der Durchreise.“ Er lächelt, als hättest du einen alten Scherz erzählt, den er gern noch einmal hört. „Das waren wir alle, als wir kamen.“ Er hustet in die Faust und wartet, bis es vorbei ist. „Jäger reden wenig, ich weiß. Ich rede für zwei, das gleicht sich aus.“
// WARUM: Der Spieler weist den Kranken ab. Falsch für den, der zugehört hat (er ist ein Fremder wie du und will helfen): Es kostet das Gespräch, das Feuer und Gilberts Bitte.
* [Dich vom Gitter abwenden #fliesst]
    ~ gilbert = gilbert - 2
    Er hat noch nicht ausgesprochen, als du dich abwendest. Hinter dir weicht das Gesicht vom Gitter zurück, ohne ein Wort des Vorwurfs, und eine Weile kommt aus dem Spalt kein Laut. Dann hustet er wieder, gedämpft, als presse er sich ein Tuch vor den Mund, damit es dich nicht stört.
    -> k1_b_ankunft
- -> themen

= themen
// WARUM: Der Spieler fragt nach dem Menschen, nicht nach dem Weg. Öffnet Gilberts Geschichte und die erste Warnung vor dem Blut (Lore Bluttransfusion).
* [„Seit wann husten Sie so?“ #fliesst]
    „Seit wann husten Sie so?“ Er lacht, kurz, und das Lachen kostet ihn einen neuen Anfall. „Eine Krankheit, für die mein Arzt zu Hause keinen Namen hatte“, sagt er, als er wieder kann. „Dann ein Gerücht über diese Stadt, in einer Postkutsche, von einem Mann, der nicht hustete. Dann eine lange Reise.“ Er dreht den zu weiten Ring am Finger. „Man hat mir hier Blut gegeben. Es hat geholfen, eine Weile. Im Spital lagen Leute, bei denen hat es nicht bloß aufgehört zu helfen.“ Sein Blick geht an dir vorbei in die Gasse. „Wir hatten einen Birnbaum hinter dem Haus. Ich denke dauernd an diesen Birnbaum, ist das nicht albern? Gehen Sie, sobald Sie können. Was diese Stadt einem gibt, holt sie sich doppelt zurück.“ # lore: bluttransfusion
    -> themen
// WARUM: Der Spieler will die Regeln der Nacht verstehen. Öffnet Jagdnacht, Seuche und Bürgerjagd (Lore) und warnt vor dem Mob am Scheiterhaufen.
* [„Warum ist hier jede Tür verriegelt?“ #fliesst]
    ~ gilbert_jagd = true
    ~ fr_frei_machen(fr_menschen)
    „Warum ist hier jede Tür verriegelt?“ „Eine Jagdnacht“, sagt er, als nenne er das Wetter. „Dann schieben die Leute die Riegel vor und hängen Räucherwerk ins Fenster, und wer das Warten nicht mehr aushält, nimmt Fackel und Mistgabel und geht selbst hinaus.“ Er senkt die Stimme, obwohl niemand zuhört. „Was ihnen da draußen begegnet, haben sie meistens gestern noch gegrüßt. Es ist eine Seuche, verstehen Sie. Aus Menschen werden Bestien, bei dem einen langsam, beim anderen über Nacht, und wen es als Nächsten trifft, weiß keiner. Mich hat es noch nicht getroffen.“ Er hustet. „Noch nicht.“ # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
// WARUM: Der Spieler fragt nach dem Grund seiner Reise (der Zettel in der Klinik). Öffnet die Heilende Kirche als Herrin des Blutes und den Weg zur Kathedrale.
* [„Wissen Sie, was bleiches Blut ist?“ #fliesst]
    „Wissen Sie, was bleiches Blut ist?“ Gilbert wiederholt die zwei Wörter, die Stirn am Eisen, und denkt lange darüber nach. „Davon habe ich nie gehört. Aber Blut ist in dieser Stadt die Sache der Heilenden Kirche, jeder Tropfen, und ihr Blut, sagt man, kommt aus der großen Kathedrale drüben im Osten des Tals, so wie Wasser aus einer Quelle. Wenn einer das Wort kennt, dann sie.“ Er hustet, und als er wieder kann, spricht er leiser. „Einem Fremden sagt hier keiner etwas, in gewöhnlichen Nächten. Aber eine Jagdnacht ist keine gewöhnliche. Da stehen Türen offen, die sonst zu sind. Nur nicht die, an die man klopft.“ # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    ~ fr_frei_machen(fr_blut)
    -> themen
// WARUM: Der Spieler fragt nach dem Weg. Öffnet die Brücke, das Gerücht von der Bestie, die einmal in der Kirche diente, und die Sperre der Kirche; bereitet Nadelöhr 1 vor.
* {gilbert_bruecke} [„Wie komme ich zur Kathedrale?“ #fliesst]
    „Wie komme ich zur Kathedrale?“
    { kleriker == "":
        ~ gilbert_kleriker = true
        „Über die große Brücke, einen anderen Weg kenne ich nicht. Gesperrt soll sie sein, sagt man, seit die Jagd begann, aber was heißt das schon.“ Er lauscht in die Richtung, als könne er es von hier aus hören. „Und auf der Brücke haust etwas. Es soll einmal in der Kirche gedient haben, gesungen oder gepredigt, so genau weiß das keiner. Man sagt auch, aus Kirchenleuten werden die schlimmsten.“ Er greift nicht nach dem Räucherwerk, wie man es in Yharnam tut, wenn davon die Rede ist. Er hat keins. # lore: kleriker_bestien # lore: kirche_sperrt_bruecke
    - else:
        „Über die große Brücke.“ Sein Blick geht zu deinen Händen und bleibt dort. „Aber das wissen Sie schon, nicht wahr? Sie waren oben. Ist es … ist es noch da?“ # lore: kleriker_bestien
    }
    -> themen
// WARUM: Der neue Jäger fragt nach seinesgleichen. Öffnet das Gerücht vom ersten Jäger der Kirche ohne Namen (Wissenssperre: Ludwig) und das Silberschwert, das auf der Brücke wiederkehrt.
* {gilbert_bruecke} [„Gibt es hier noch andere Jäger?“ #fliesst]
    // [KANON lore:fraktionen/jaeger] Ludwig führte die ersten Jäger der Kirche an; viele Kirchenjäger waren Kleriker. Hier nur als Gerücht, ohne Namen.
    // [KANON lore:gegenstaende/heilende-kirche] Das Silberschwert ist das Zeichen der Kirchenjäger (Abzeichen der Schwertjäger, auf der Brücke im Fell der Bestie); Ludwig warb Bürger als Jäger an (Kleidung der Yharnam-Jäger).
    // [ERWEITERT] Das Schwert auf den Haustüren und die Kratzer. Die Mondklinge gestrichen (Zusatzinhalt, Wissenssperre).
    „Gibt es hier noch andere Jäger?“ Gilbert lehnt die Stirn ans Gitter. „Für die Kirche jagen welche, das schon. Die Leute hier erzählen von einem, der als Erster für sie gejagt hat. Er hat geworben, wen er bekommen konnte: Fuhrknechte, Gerber, Söhne von Wäscherinnen. Und Kleriker. Viele Kleriker.“ Er wartet, bis der Husten vorbei ist. „Auf den Abzeichen seiner Leute war ein Schwert aus Silber, und eine Zeit lang hat man es ihnen zu Ehren auf die Haustüren gemalt.“ Ein schiefes Lächeln. „Dann hat man es wieder abgekratzt. An manchen Türen sieht man noch die Kratzer. Seinen Namen sagt hier keiner gern; ich habe einmal gefragt, warum, und ringsum sind die Läden zugefallen.“ # notiz: erster_kirchenjaeger
    -> themen
// WARUM: Der Spieler beendet das Gespräch, wann er will. Wer Gilbert nicht abgewiesen hat, bekommt beim Abschied das Feuer (Waffe gegen Mob, Brücke und Gascoigne).
+ [Die Hand zum Abschied heben #fliesst]
    { gilbert >= 0 and not gilbert_geschenk: -> geschenk }
    { gilbert < 0: Du hebst die Hand, und hinter dem Gitter hustet er und tut nicht so, als hätte er es gesehen. }
    { gilbert >= 0: Du hebst die Hand. „Gute Jagd“, sagt Gilbert, und er meint es. }
    -> k1_b_ankunft

= geschenk
~ gilbert_geschenk = true
~ feuer = true
// [KANON lore:figuren/gilbert] Er kann nicht aufstehen: Er angelt den Tank mit dem Stock heran.
Noch ehe deine Hand oben ist, hebt er seine. „Warten Sie.“ Er beugt sich zur Seite, so weit der Stuhl es erlaubt, und angelt mit seinem Stock nach etwas unter dem Fensterbrett, das dort seit Wochen gestanden haben muss, denn als es über die Dielen schleift, zieht es eine Bahn durch den Staub. Es ist ein eiserner Tank mit Schlauch und Düse. Mit beiden Händen schiebt er ihn dir durch die Lücke zwischen zwei Stäben, so behutsam, als reiche er ein schlafendes Kind über einen Zaun, und danach hustet er lange, länger als je zuvor, die Stirn am kalten Eisen.
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
// Überarbeitung 2026-11-06: Der Hund ist der, dessen Bellen der Spieler gefolgt ist (Ernte der Spur aus k1_viertel1); das Versprechen an die Alte als Rede des Jägers.
-> betreten("tueren") ->
{ k1_b_tueren == 1:
    Unten liegt eine Gasse aus Türen, eine neben der anderen, so dicht, dass kaum ein Fenster dazwischen Platz hat, und vor jeder hängt eine rote Räucherlampe, deren Rauch an der Hauswand hinaufkriecht, bis er sich unter dem nächsten Sims staut. Auf manchen Schwellen liegt eine Prise Salz, auf einer ein umgedrehter Besen. In einer Jagdnacht klopft man in Yharnam nicht an, sagt man, und wer es doch tut, will etwas, das man ihm besser nicht gibt. # bild: tueren # stimmung: spannung
    Hinter den meisten Türen rührt sich nichts. Nur einmal, als du vorbeigehst, dreht innen jemand einen Schlüssel um, behutsam, damit es nicht klickt, und es klickt doch. Hinter einer anderen Tür lacht jemand, schrill und ohne Atem zu holen, und mehrere Stimmen fallen ein, als feierten sie ein Fest, zu dem du nicht geladen bist.
    An der ersten Tür, vor der du stehen bleibst, fährt dich eine Männerstimme an, noch ehe deine Hand das Holz berührt: „Ein Fremder. Natürlich. Wer sonst klopft in einer Jagdnacht? Ihr habt sie doch hergebracht, die Seuche, ihr mit eurem kranken Blut, und jetzt wollt ihr rein.“ Ein Riegel wird vorgeschoben, dann ein zweiter, obwohl der erste genügt hätte. # lore: fremde # lore: raeucherwerk
}
- (wahl)
// WARUM: Der Spieler geht zu dem Hund, dem er gefolgt ist: die einsame alte Frau, die Fremden die Schuld gibt. Öffnet ein Versprechen, das in Kapitel 2 Folgen hat.
* [Zu dem Hund am Ende der Gasse #fliesst]
    ~ alte_frau = true
    Zu dem Hund am Ende der Gasse, wo eine Treppe zu den Kanälen hinunterführt: Mager liegt er quer über einer Schwelle und knurrt dich an, ohne aufzustehen, und wenn er knurrt, bewegt sich nur sein Bauch. Hinter der Tür antwortet eine alte Stimme, bevor du etwas gesagt hast, brüchig und bitter. „Fremde. Nichts als Fremde. Und die Kirche lässt sie alle rein mit ihrem Blut, und dann wundert man sich.“ Ein Schniefen, und die Stimme wird dünn. „Das Räucherwerk hält sie fern. Sonst hält gar nichts mehr irgendwas fern.“ # lore: raeucherwerk
    -> frau
// WARUM: Der Spieler hört zu, statt zu klopfen. Belohnt das Leise mit Violas Spur (die Dame mit der roten Brosche fragte nach den Gräbern), die beim Mädchen und am Grab wiederkehrt.
* [An der Tür mit den drei Lampen lauschen #fliesst]
    ~ frau_betet = true
    An der Tür mit den drei Lampen, das Ohr dicht am Holz: Dahinter murmelt eine Frauenstimme ein Gebet, Silbe für Silbe, und bricht ab, als dein Stiefel auf dem Stein knirscht. „Gehen Sie weiter. Das Blut behüte Sie, aber gehen Sie weiter.“ Die Stimme ist heiser vom Beten, und Schärfe hat sie keine mehr. „Die Kirche hat uns das Räucherwerk gesegnet. Ohne die Kirche wären wir alle schon … Sie verstehen.“ # lore: heilende_kirche
    Nach einer Weile, mehr zu sich selbst: „Da war vorhin schon eine. Eine Dame, mit so einer großen roten Brosche. Hat geklopft und nach dem Weg zu den Gräbern gefragt. Ich hab nicht aufgemacht.“ Die Silben fangen wieder an, schneller als zuvor. # notiz: viola_spur
    -> wahl
// WARUM: Der Spieler sammelt Stimmen der Stadt, eine nach der anderen (bis zu drei): Gesundheitslüge, Todeslust, Aberglaube. Reine Atmosphäre und Volkskunde; keine Gefahr.
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
// WARUM: Der Spieler erzwingt eine Antwort mit Gewalt. Er erfährt vom Feuer auf der Hauptstraße und davon, dass man Fremde dafür hält (Warnung vor dem Mob), verliert aber die übrigen Türen: Die Gasse schließt sich.
* [Mit der Faust gegen ein Türblatt schlagen #fliesst]
    Dreimal fährt die Faust gegen das Türblatt, und das Holz dröhnt bis in die Nachbarhäuser; die Lampe davor schaukelt an ihrem Haken und wirft roten Schein die Gasse hinauf und hinab. Eine junge Stimme antwortet, schnell vor Angst: „Die gehen selber jagen! Mit Gabeln, mit Fackeln! Oben auf der Hauptstraße, am Feuer, da hängt schon einer … Und Fremde halten sie immer dafür, immer! Gehen Sie doch!“ Danach verflucht sie dich mit Wörtern, die du nicht kennst, und als du dich abwendest, schwankt die Lampe noch immer. # lore: buergerjagd
    -> k1_viertel1
// WARUM: Der Spieler geht, wann er will. Was er nicht gehört hat, bleibt hinter den Türen.
+ [Die Türen hinter dir lassen #fliesst]
    Die Türen bleiben hinter dir, aber das Lachen folgt dir bis an die Treppe und noch zwei Stufen hinauf.
    -> k1_viertel1

= frau
// [KANON lore:figuren/einsame-alte-frau] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
// WARUM: Der Spieler verspricht einer Frau, die ihn verachtet, einen sicheren Ort. Öffnet die Quest der alten Frau (Kapitel 2); der Hund hört auf zu knurren.
* [„Ich finde einen sicheren Ort für Sie.“ #fliesst]
    ~ alte_frau_versprochen = true
    „Ich finde einen sicheren Ort für Sie, und dann sage ich Ihnen Bescheid.“ Sie schnaubt, trocken, und das Schnauben wird zu einem Husten. „Sicher. Natürlich.“ Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
// WARUM: Der Spieler lässt die Verbitterte, wie sie ist. Kein Versprechen, keine Quest; nichts Falsches, nur nichts Gewonnenes.
* [Ohne Antwort weitergehen #fliesst]
    Ohne Antwort weiter, und die Stimme hinter der Tür ruft dir nichts nach. Der Hund sieht dir nach, bis du um die Ecke bist; erst dann legt er den Kopf wieder auf die Pfoten.
- -> k1_viertel1

=== k1_b_anschlag ===
// TITEL: Der Anschlag an der Kapellentür
// [ERWEITERT] Ein Anschlag der Heilenden Kirche zur Jagdnacht, eigener Wortlaut. Das Siegel bleibt unbestimmt (rotes Wachs, abgegriffenes Zeichen): Das Archiv kennt kein Zeichen der Kirche, und ein Kelch zeigte auf Gesperrtes (Faktencheck b_yharnam Nr. 9). Die übereinander geklebten Datumsstreifen: Die Jagd kehrt wieder.
// [KANON lore:fraktionen/heilende-kirche] Die Kirche verwaltet das Blut; die Bürger verriegeln sich mit Räucherwerk.
// Die Kirche ist in Kapitel 1 nur zu hören und zu lesen, nie zu sehen (Entscheidung des Nutzers 2026-11-04). Ortsbild A, der Anschlag C, das Atmen hinter der Tür B.
// [ERWEITERT, Überarbeitung 2026-11-06] Das Glöckchen, dem der Spieler gefolgt ist, schlägt nur der Wind an; sein Strick ist über der Tür abgeschnitten. Nicht erklären.
//   Die Kapelle wird jetzt beim Namen genannt (vorher hing „Sie duckt sich“ am Satz der Option).
-> betreten("anschlag") ->
~ fr_frei_machen(fr_kirche)
Die Kapelle duckt sich zwischen zwei Häuser, kaum breiter als ein Hauseingang, mit einer Tür aus schwarzem Holz und einem Fenster darüber, das man von innen mit Brettern vernagelt hat. Auf dem First sitzt ein Türmchen aus Latten, und darin hängt das Glöckchen, dem du gefolgt bist, nicht größer als ein Milcheimer; es schlägt an, wenn der Wind in die Gasse fährt. Der Strick, an dem man es läuten könnte, ist dicht über dem Türsturz abgeschnitten. # bild: tueren # stimmung: spannung
Auf der Tür hängt ein Anschlag, mit vier Nägeln befestigt; drei sind braun vor Rost, der vierte ist neu und blank. Das Papier hat sich in der feuchten Luft gewellt, und als du dich vorbeugst, riecht es herb und harzig, nach Weihrauch. Oben sitzt ein Siegel aus rotem Wachs, darin ein Zeichen, so oft gestempelt, dass seine Linien sich abgegriffen haben wie die Prägung einer Münze, die durch zu viele Hände ging. Darunter steht in großen, sauberen Lettern:
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
// Überarbeitung 2026-11-06: Das Knarren, dem der Spieler gefolgt ist, ist der Stuhl, der bei jedem Atemzug nachgibt (Ernte der Spur und Anzeichen vor dem Schuss).
//   „Gestalt … sie“ wurde „ein Mann … er“ (der Wechsel des Pronomens warf heraus). Wendels Mantel ausgeschrieben (Ü10, vorher PLATZHALTER): Er hängt hinter der Haustür
//   (hinter dem Blatt der offenen Tür) und zeigt sich erst beim Gehen; „der Haken schwingt leer“ beim Hängenlassen war ein Logikfehler.
-> betreten("haus") ->
~ kampfanfang = -> k1_b_haus
{ k1_b_haus == 1:
    Hinter der Tür liegt ein Flur, in dem seit Wochen niemand Licht gemacht hat, und eine Treppe, auf deren Stufen der Staub so dick liegt, dass deine Stiefel Abdrücke hinterlassen wie im ersten Schnee. Nur in der Mitte jeder Stufe ist er weggewischt, in zwei schmalen, gleichmäßigen Bahnen. Am Geländer ist ein Seil festgeknotet, und auf halber Höhe ist es an einer Stelle blank gescheuert. Es riecht nach kaltem Talg und nach einem Zimmer, in dem jemand schläft. # bild: haus_dunkel # stimmung: spannung
}
Im ersten Stock steht ein Rollstuhl mit dem Rücken zum Fenster, und in ihm sitzt ein Mann unter einer Decke, den Kopf auf der Brust. Er atmet durch den offenen Mund, lang und feucht, und bei jedem Zug gibt der Stuhl ein wenig nach und knarrt. Als unter deinem Stiefel eine Diele knackt, hebt er den Kopf, und aus dem offenen Mund kommt ein Lachen, das mit dem Atem geht, hoch und pfeifend, ein Ton bei jedem Einziehen, während unter der Decke eine Hand hervorkommt und in der Hand eine Pistole, deren Lauf erst zittert und dann ganz ruhig wird. Rechts von dir steht ein Schrank mit einer schweren Eichentür; links ist nur die nackte Wand. # anzeichen: schuss # kampf: rollstuhl
// WARUM: Richtig für den Aufmerksamen: Der Lauf wird ruhig, und rechts steht das einzige, was eine Kugel aufhält. Der Schuss geht ins Holz, der Spieler bleibt heil.
+ [Nach rechts hinter den Schrank #fliesst]
    Nach rechts, hinter die Eichentür: Der Schuss schlägt in das Holz, eine Handbreit über deinem Kopf, und die Splitter regnen dir in den Kragen. Bevor er nachladen kann, bist du bei ihm und drehst ihm die Pistole aus der Hand. Er wehrt sich nicht. Sein Lachen pfeift weiter durch den offenen Mund, und seine Augen folgen dir, wie ein Kind einem Ball folgt.
// WARUM: Falsch, und erkennbar: Ein ruhiger Lauf auf drei, vier Schritte Entfernung trifft. Der Spieler kommt an ihn heran, aber mit einer Kugel in der Seite.
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
Der Zettel knistert, als du ihn einsteckst. Auf der Treppe, die Hand am Seil, hörst du, wie oben der Mann wieder durch den Mund zu atmen beginnt, lang und feucht, und wie der Stuhl dazu knarrt, als hätte ihn nie jemand gestört.
// Fundstück (Umbau 2026-11-06, ersetzt den Kauf bei den Boten): Wendels Mantel. Ausgeschrieben 2026-11-06 (vorher Platzhalter).
// [ERWEITERT] Das fehlende, glatt abgetrennte Stück am Saum (erntet Eileen: „Wendel. Steht dir nicht.“), der Geruch nach Teer und Pulver (erntet Gascoigne: „Teer. Pulver. Und Wendel.“),
//   der Name im Futter (erntet Gascoignes „ein Name im Futter“). Wer Wendel war und warum sein Mantel hier hängt, bleibt offen: Gascoigne zieht den Schluss, nicht der Text.
Erst unten, als du nach der Haustür greifst, die noch immer offen steht, siehst du, was die ganze Zeit hinter ihrem Blatt hing, an einem Haken an der Wand: ein Jägermantel, langes geöltes Leder, schwer wie ein Zelt nach dem Regen. Er riecht nach Teer, nach Pulver und nach einem Menschen, der nicht du bist. Am Saum fehlt ein Stück, glatt abgetrennt. Innen, ins Futter gestickt, mit rotem Garn und ungeschickten Stichen, steht ein Name: Wendel.
// WARUM: Der Spieler nimmt einem Toten, den andere kennen, den Mantel. Nicht falsch, aber mit Folgen: Gascoigne und Eileen erkennen ihn am Geruch und am Saum, und der Spieler muss sagen, woher er ihn hat.
* [Den Mantel vom Haken nehmen #fliesst]
    ~ mantel = true
    Der Mantel kommt schwer vom Haken, und als du ihn überziehst, sitzt er, als hätte ihn jemand für deine Schultern gearbeitet. Das Futter ist kalt, und es wird nicht wärmer. # notiz: mantel_wendel
// WARUM: Der Spieler lässt dem Toten, was ihm gehört. Kein Fundstück, keine Fragen von Gascoigne und Eileen; der Name im Futter bleibt die einzige Spur.
* [Den Mantel hängen lassen #fliesst]
    Der Mantel bleibt am Haken. Als du die Tür hinter dir zuziehst, schlägt er einmal von innen gegen das Holz, schwer, so wie sich einer anlehnt, der müde ist.
- -> k1_viertel1

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON lore:gegner/jagdmeute] Mob aus bewaffneten Bürgern, die den Fremden für den Überträger halten und rufen, er trage die Krankheit, er solle brennen (LK §20.1, §22.2; den Ruf mit Willem nicht verwenden).
// [KANON lore:gegner/ziegel-troll] Der Riese mit dem Ziegel hämmert an eine Tür, murmelt von Kälte und einer Schwester und brüllt beim Schlag, alles sei deine Schuld. Unerklärt lassen.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Gascoignes Kleidung ist von Bestiengestank durchdrungen, der an ihm zehrt; „Vater“ ist ein Titel aus einem fremden Land. Breitkrempiger Hut (Artbook, orte/zentral-yharnam).
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade, fragt nach deinem Namen, teilt Branntwein aus seiner Heimat (Torf und Rauch, G8) und bittet um einen Gruß an seine Frau. Hat der Spieler Martha verbrannt, bleibt er kalt: keine Flasche, die Parade ohne Blick, die Bitte nur, weil er niemand anderen hat, die Einladung zur Brücke nur bei gascoigne >= 0.
// [ERWEITERT] Lektorat 2026-11-05: Gascoigne tritt über den Ton auf (Schuss, dann die Namen); das Auge sieht zuerst nur den Verband, Mantel, Hut und Schal erst aus der Nähe. Sein Geruch am Platz nur einmal und leise, ohne „nasses Fell“ (die Steigerung folgt an den Gräbern, c_unterstadt). Martha mit Mehl an den Ärmeln in beiden Zweigen; die Frau mit der Fackel wie ein Kerzenleuchter.
// Stimme Gascoigne (gesund): tief, ruhig, kurze Sätze, warm und spaßig, nennt Leute beim Namen, sagt „Fremder“, bis er deinen Namen hat; beendet Dinge mit „So.“ Wärme, die zerbricht: der Geruch, das Spiel der Bestie, ein Blick zum Feuer.
-> betreten("scheiterhaufen") ->
~ kampfanfang = -> k1_b_scheiterhaufen.kampf
~ fr_frei_machen(fr_menschen)
{ k1_b_scheiterhaufen == 1:
    Die Hauptstraße öffnet sich zu einem Platz, und in seiner Mitte brennt ein Scheiterhaufen, höher als die Dachtraufen ringsum. Oben, an einen Pfahl gebunden, hängt etwas Großes, Behaartes, das sich nicht mehr regt; die Flammen haben ihm das Fell schwarz gefressen, und der Rauch, der von ihm aufsteigt, riecht süßlich und fett, nach einem Schlachttag, an dem keiner sein Handwerk verstand. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
    Um das Feuer stehen Menschen, ein Dutzend oder mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln und Beilen, einer mit einem alten Gewehr, dessen Kolben mit Draht geflickt ist. Eine Frau hält ihre Fackel wie einen Kerzenleuchter, mit abgespreiztem kleinem Finger. Sie murmeln, alle zugleich und doch nicht zusammen. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens. Zwischen zwei Schlägen murmelt er, und was er murmelt, gilt nicht der Tür: „Kalt ist es, Schwesterchen. So kalt.“
    Einer dreht sich zu dir um, dann drei, dann alle, und das Murmeln bricht ab, so wie ein Topf aufhört zu kochen, wenn man ihn vom Feuer zieht. „Der da“, sagt die Frau mit der Fackel, und ihr kleiner Finger spreizt sich noch immer ab. „Der trägt sie an sich, die Seuche, riecht ihr das nicht?“ Und ein Mann, heiser vom Rauch: „Brennen soll er! Brennen wie das da oben!“ # kampf: mob
}
+ [Stehen bleiben und die Säge ausklappen #fliesst]
    Die Säge klappt in deiner Hand auf, mit einem Schnappen, das lauter ist als das Feuer, und vorn in der Menge senken sich die ersten Gabeln auf dich.
    -> kampf
+ [In den Schatten um den Platz herum #fliesst]
    ~ mob = "umgangen"
    In den Schatten, an den Hauswänden entlang, Schritt für Schritt, und dein Puls klopft dir bis in die Zähne. Fast liegt der Platz hinter dir, als ein Kind, das du nicht gesehen hast, mit dem Finger auf dich zeigt und schreit: „Da! Der Fremde! Da ist er!“
    -> gascoigne_greift_ein

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
    Er wendet sich zum Gehen und bleibt nach drei Schritten stehen. „Eins noch.“ Er sagt es zum Pflaster vor seinen Stiefeln. „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie soll bei der Kleinen bleiben. Und wenn du irgendwo eine Spieluhr hörst: Das ist meine Kleine. Geh hin, wenn du kannst.“ Eine Pause. „Ich hab heute Nacht keinen, den ich sonst fragen könnte.“ # quest: gascoigne_frau
- else:
    Er dreht die Flasche in den Händen, bevor er sie einsteckt, und sagt, beinahe verlegen: „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, sag ihr, ich komm bald. Sie macht sich immer Sorgen. Sie soll bei der Kleinen bleiben. Und wenn du irgendwo eine Spieluhr hörst: Das ist meine Kleine. Geh hin, wenn du kannst.“ # quest: gascoigne_frau
}
* [„Ich richte es ihr aus.“ #fliesst]
    ~ gascoigne = gascoigne + 1
    „Ich richte es ihr aus.“ Er nickt, und etwas in seinen Schultern löst sich{mob == "zerstreut":, nicht viel, eine Fingerbreite}.
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
    „Pass auf dich auf, {gascoigne_name:{name}|Fremder}.“ Er tippt an die Krempe seines Hutes und geht in den Rauch.
}
-> k1_nach_scheiterhaufen

= mantel_frage
// [ERWEITERT] Wendels Mantel: Gascoigne kennt den Geruch. Er wird misstrauisch. Sein eigener Geruch ist dann schon gefallen (leise, ohne Namen); hier riecht er an dir, nicht umgekehrt.
{ mob == "zerstreut": Er tritt einen Schritt näher, beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Sein Gesicht wird noch eine Spur härter, so wie Reif auf einer Scheibe dichter wird.| Noch hält er deine Hand. Er beugt sich vor, bis die Krempe seines Hutes fast deine Schulter berührt, und zieht die Luft ein, lange, durch die Nase. Als er sich aufrichtet, geht das Freundliche aus seinem Gesicht, nicht ganz, aber so, wie die Wärme aus einem Zimmer geht, wenn jemand die Tür offen lässt.}
„Teer. Pulver. Und Wendel.“ Er sagt den Namen, als lege er ihn auf einen Tisch. „Wendel ist seit zwei Jagden nicht heimgekommen. Woher hast du seinen Mantel?“
~ mantel_erkannt = true
* [Ihm die Wahrheit über den Mantel sagen #fliesst]
    // [ERWEITERT] Umbau 2026-11-06: Der Mantel hing hinter der Tür im dunklen Haus (nicht mehr bei den Boten). Gascoigne glaubt dir, ohne zu sagen, warum.
    Die Wahrheit, so wie sie war: ein Haus mit offener Tür, ein Haken hinter der Tür, ein Name im Futter. Noch während du erzählst, hörst du, wie es klingt. Gascoigne schweigt lange. „Hinter der Tür“, sagt er endlich. „Dann ist er dort hineingegangen und nicht mehr heraus.“ Er reibt sich mit dem Daumen über den Verband, dort, wo die Augen sein müssten. „Das glaub ich dir. Das ist ja das Schlimme.“ # notiz: gascoigne_mantel
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
    -> k1_viertel2

= spieluhr_geben
// [KANON lore:figuren/maedchen-und-viola] Inhalt sinngemäß, Wortlaut eigen.
Etwas schabt am Fensterbrett, und durch den Spalt zwischen den Läden schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. „Die ist von Papa. Papa riecht manchmal ganz fremd, und dann sagt er unsere Namen falsch. Dann zieh ich die auf, und er hört zu, und hinterher ist er wieder Papa.“ Sie schiebt sie noch ein Stück weiter. „Mama hätte sie mitnehmen müssen. Sie hat sie hier auf dem Tisch vergessen, Mama vergisst immer was. Bring sie ihr.“ # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Unter dem Deckel klebt ein vergilbter Zettel mit zwei Namen, in einer feinen Schrift, deren V einen kleinen Kringel nach links macht: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Der Deckel bleibt offen in deiner Hand, eine ganze Weile. Dann klappst du ihn zu, und auf dem Platz verstummt etwas, von dem du nicht wusstest, dass es zu hören war.
}
-> k1_viertel2

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien. Die weiße Schleife nimmt sie mit.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
„Lauf zu der Ärztin in der Klinik“, sagst du. „Dort bist du sicher.“ # quest: maedchen_fort
„Wirklich?“ Sie zögert. Auf einer Treppe im Haus trappeln Schritte, ein Riegel geht, ein zweiter, eine Haustür knarrt. Ein kleiner Schatten huscht über den Platz und bleibt an der Ecke stehen, wo die Treppe zu den Kanälen hinabführt, in der Richtung, in die ihre Mutter gegangen ist. Dann ist er fort. Am Riegel hängt keine weiße Schleife mehr.
-> k1_viertel2


=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON lore:orte/zentral-yharnam] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Feuerwaffen sind Vorderlader (LK §19): Pulver und Papier, keine Hülsen.
// [ERWEITERT] Der Alte zählt (Kiesel, fünf und fünf; beim Nachladen zählen die Lippen mit). Das Zählen gehört ihm (Lektorat 1.2).
-> betreten("daecher") ->
~ kampfanfang = -> k1_b_daecher
Die Gasse ist so schmal, dass du die Hauswände zu beiden Seiten mit den Ellbogen streifst, und über dir kreuzen sich Dachrinnen, zerbrochene Fensterläden und Wäscheleinen, an denen nichts mehr hängt als eine einzelne hölzerne Klammer. Keine Taube, kein Tropfen. Es riecht nach Schießpulver, frisch, so wie es nur riecht, wenn eben erst jemand geladen hat. # bild: gasse # stimmung: spannung
+ {not schuetze_gesehen} [Langsam, die Dächer im Blick #fliesst]
    Schritt für Schritt, den Blick auf den Dachkanten, und beim zehnten erstarrst du: Hinter einem Schornstein, kaum mehr als ein Umriss, hockt ein alter Mann, gebeugt, eine Schlafmütze auf dem Kopf und in den Händen ein Gewehr, das länger ist als er selbst. Er hat dich noch nicht gesehen. Der Lauf zielt auf eine Stelle der Gasse, zwanzig Schritte vor dir, über die du in drei Atemzügen gegangen wärst. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
+ {not schuetze_gesehen} [Schnell geradeaus hindurch #fliesst]
    Auf halbem Weg kracht hinter dir ein Schuss. Etwas Heißes fährt dir in die Schulter, bevor du begreifst, woher es kam, und das Pflaster springt dir entgegen; du fängst dich mit den Händen. Als du dich umdrehst, lädt auf dem Dach hinter dir, hinter einem Schornstein, ein alter Mann mit zitternden Händen nach, und seine Lippen zählen dabei mit. # klang: schuss
    ~ zuletzt = schuss
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ schuetze_gesehen = true
    -> oben

= oben
+ [Hinaufklettern und ihn stellen #fliesst]
    Über eine Regenrinne hinauf, einen Fenstersims, einen Balken, und als du oben bist, versucht er nachzuladen, aber seine Finger sind zu alt und zu eilig, und das Pulver rieselt ihm neben den Lauf. Er sieht zu dir hoch und klatscht einmal in die Hände. Neben ihm auf dem Sims liegen Kieselsteine, sorgfältig in Reihen gelegt, immer fünf und fünf, so wie man Tage zählt. # stimmung: kampf
    -> schuetze_wahl
+ [Im Hauseingang Deckung suchen #fliesst]
    Im nächsten Hauseingang, den Rücken an der kalten Tür, wartest du, bis oben kein Lauf mehr über die Dachkante ragt. Zurück geht es dicht an der Wand, den Stein an der Schulter, bis die Gasse dich freigibt.
    -> k1_viertel2

= schuetze_wahl
* [Ihm das Gewehr abnehmen und gehen #fliesst]
    ~ schuetze_verschont = true
    Er lässt das Gewehr los wie ein Kind ein Spielzeug, das ihm ohnehin langweilig geworden ist, und fängt an, seine Kiesel neu zu zählen. Unten im Hof schlägt der Kolben auf das Pflaster. Zwei Kiesel nimmst du mit und eine Flasche, in deren Hals ein ölgetränkter Lappen steckt; er zählt weiter, um die Lücke herum. # notiz: kiesel
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_viertel2
* [Es mit der Säge beenden #fliesst]
    Es geht schnell. Er macht dabei einen kleinen, überraschten Laut, mehr nicht. Unter der Schlafmütze ist sein Haar sorgfältig gekämmt und mit Wasser angelegt, wie man es für den Sonntag tut. Zwei von seinen Kieseln steckst du ein und die Flasche mit dem öligen Lappen im Hals; die übrigen liegen weiter in ihren Reihen, fünf und fünf. # notiz: kiesel
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_viertel2

=== k1_b_dachweg ===
// TITEL: Der Dachweg (neue Station, Platzhalter)
// [ERWEITERT] Neue Station des Umbaus 2026-11-06 (Kartenmodell, zweites Viertel). PLATZHALTER: knappe Sätze, die sagen, was da ist; neu geschrieben wird mit dem Skill stil-1800.
// Fundstücke (ersetzen den Handel im Bad der Boten): das Jagdheft eines Toten (aus dem Bestand von boten_laden), eine Brandflasche, zwei Kiesel. Von oben sind Spuren der anderen Wege zu sehen.
-> betreten("dachweg") ->
Oben läuft ein Weg aus Balken, Ziegeln und gespannten Leinen von Dach zu Dach, und von hier sieht die Stadt anders aus: Die Gassen sind Risse, die Fackeln wandern wie Glühwürmchen, und die Räucherlampen sind rote Punkte in Reihen. # bild: daecher_eileen # stimmung: ruhig
{ not k1_b_maedchen: Irgendwo zwischen den Giebeln, tief unten, spielt etwas, das fast eine Melodie ist. }
{ not k1_b_daecher: Auf einem Dach in der Ferne sitzt ein Schatten mit einem langen Gewehr und rührt sich nicht. }
Auf einem Sims, an einem Schornstein, lehnt ein toter Jäger, den Kopf auf der Brust, die Hände im Schoß, als schliefe er. In seiner Manteltasche steckt ein Heft. Neben ihm stehen eine Flasche mit einem ölgetränkten Lappen im Hals und zwei glatte Kiesel in einer Reihe.
* [Das Heft aus der Tasche ziehen #fliesst]
    ~ jagdnotizen = true
    ~ gelernt += (wurf, ansturm, axt_wirbel)
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    Die Seiten sind gewellt, einmal nass geworden und wieder getrocknet. Ein Jäger hat darin gezeichnet, was ihn beinahe umgebracht hat, mit Bleistift und mit Pfeilen: ein Arm, der eine Kutsche über die Schulter hebt. Ein Geweih, gesenkt, und daneben das Wort „spät“, dreimal unterstrichen. Ein Strich, gerade von oben nach unten, und darunter drei Kerben, die dritte tiefer als die anderen. Die letzte Seite ist leer bis auf einen braunen Daumenabdruck. Die Flasche und die Kiesel steckst du auch ein. # notiz: jagdnotizen
* [Nur die Flasche und die Kiesel nehmen #fliesst]
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    Die Flasche und die Kiesel nimmst du an dich. Dem Toten lässt du sein Heft.
- Der Weg führt dich hinab, zwischen zwei Giebeln hindurch, ohne dass du ein Dach verlassen hättest, das jemals ein Dach gewesen wäre.
-> k1_viertel2

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON lore:figuren/eileen] Eileen auf den Dachbalken über dem Kanaleingang (RK1 §7, §12), Jägerin der Jäger, gibt Jägermarken. Ihre Warnung: Menschen gebe es hier keine mehr, nur Bestien mit Hunger; ein Jäger jage Bestien, die Jäger überlasse er ihr. Sie kennt den Jägertraum (grüßt die kleine Puppe). Nächstes Treffen in Kapitel 1 auf dem Dach über den Gräbern (G2).
// Die Jägermarken sind entfallen (Entscheidung des Nutzers 2026-11-06: Buchgefühl vor Videospiel).
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und Henryk. Die Partnerschaft beginnt erst in Kapitel 2. Die Abzeichen an der Schnur.
// Stimme: heiser, sehr kurz, Sätze ohne Anlauf; beantwortet Fragen mit Gegenfragen oder gar nicht. Ihr Lachen ist ein Krächzen.
-> betreten("eileen") ->
// Zwei Formen der ersten Begegnung (Fassung 2): über den Dachweg oder von unten über die Krampen am Kanaleingang.
{ k1_b_dachweg:
    Über dem Kanaleingang laufen Balken von Haus zu Haus, und hier hat jemand gewartet.
- else:
    Zu den Dachbalken über dem Kanaleingang führen eiserne Krampen in der Mauer hinauf, kalt und rau vom Rost.
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
- Sie sieht dich an, und ihr Schnabel bleibt an deiner Armbeuge hängen, an der Stelle, wo der Einstich pocht. # notiz: eileen_armbeuge
// [KANON lore:figuren/eileen] Sie kennt den Jägertraum (LK 5.1: grüßt die kleine Puppe).
Du hast niemandem von dem Garten erzählt, und sie hat ihn nicht erwähnt. Sie hat ihn gegrüßt, ohne das Wort.
* [„Woher kennst du den Garten?“ #fliesst]
    „Woher kennst du den Garten?“ Keine Antwort. Sie rückt nur die Maske zurecht, und die Abzeichen an ihrem Hals klappern einmal.
* [Schweigen, wie sie schweigt #fliesst]
    Du sagst nichts. Sie sieht, dass du es bemerkt hast, und sagt auch nichts.
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
- Sie steht auf. „Bestien jagst du“, sagt sie. „Jäger jag ich.“ Sie breitet den Mantel aus wie Flügel und ist mit einem Sprung auf dem nächsten Dach, und von dort ruft sie, ohne sich umzudrehen: „Jäger sehen sich wieder. Meistens zu spät.“ # quest: eileen_treffen
-> k1_vor_bruecke
