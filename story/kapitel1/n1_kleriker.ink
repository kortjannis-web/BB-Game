// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei.
// Wege: allein kämpfen, mit Gascoigne kämpfen, ablenken, fliehen. Alle Wege führen danach durch die Kanalisation-Mündung in die Unterstadt (Umbau 2026-11-06: keine Laterne an der Brücke)
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und dem Faktencheck (docs/faktencheck-kapitel1.md, Abschnitt n1_kleriker.ink):
// Ortsbilder in A, Geschehen in B, der Choral und der Brief in C. Optionen fließen in den Satz (#fliesst); Kampfoptionen nennen Richtung und Handlung.
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6).
// Überarbeitung Text für Text 2026-11-06 (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12, stil-1800: anzeichen, kampf, tod, dokument, kirche):
//   Mond statt Sonne (Ü1: die Türme stehen schwarz vor seiner Scheibe; er ist nicht gewandert, nur größer), die Bestie steigt als Umriss vor dem Mond herab;
//   der zweite Anlauf nach dem Tod ist verdichtet (SP-05: Ankunft, Sprung und Gestalt nur beim ersten Mal ausführlich, Schrei und Einsicht nur beim ersten Mal);
//   jedes Anzeichen trägt das Zeichen für die falsche Wahl (Reichweite, Deckung, freier Raum); Lernsätze zu Wurf und Ansturm gelten für Heft und Tod zugleich
//   (das Heft setzt gelernt += wurf, ansturm, ohne dass man gestorben ist); Fortsetzungen ohne Echo der Option; WARUM an jeder Option (Ü7);
//   der Brief ausgeschrieben in Stimme C; der Brief steckt in einem Rest Tuch unter dem Schlüsselbein, weil der Streifen am Hals in Phase 2 verschwindet;
//   Gascoigne mit Verband, Torf und Rauch (Ü11), sein Lachen an der Lücke der Spieluhr; „bis du ihn packst“ aus dem Rausch gestrichen (die Wahl „Schweigen“ widersprach).
// [KANON lore:bosse/kleriker-bestie] Sie klettert herab auf die Brücke; riesiger linker Arm, verwachsenes Geweih, Kreischen; Nägel in den Beinen,
//   das Fell stellenweise pilzartig, im Artbook weiß (lore:orte/zentral-yharnam, LK §25.4); feueranfällig; Gascoigne als Helfer.
// [KANON lore:bosse/kleriker-bestie] Der Name geht auf ein Gerücht zurück. Wissenssperre Kapitel 1 (lore/kapitel/kapitel1.md): dass sie ein
//   Kleriker war, bleibt Gerücht. Die Belege hier deuten an (Stoffstreifen, Rest Tuch, Abzeichen, Nadelnarben, ein fremdes Gedächtnis, Gascoignes Meinung), keiner beweist.
// [KANON lore:gegenstaende/heilende-kirche] Beute: das Abzeichen der Schwertjäger (Kirchenjäger). Im Kanon schaltet es bei den Boten Waren frei (RK1 §8);
//   bei uns entfällt der Handel (2026-11-06), das Abzeichen bleibt Fund und Indiz.
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat beim Beginn der Jagd die Große Brücke gesperrt. [ERWEITERT, bewusst] Bei uns führen von der
//   Brücke Treppen hinab in die Unterstadt; am Brückenende ein von drüben verriegeltes Tor.
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis, das Lied auf der Brücke, der Wurf mit der Kutsche, der Ansturm, die falsche Ruhe, der Brief.
// [ERWEITERT, Ü1] Der Mond über der Brücke (zweite Stufe: an der Klinik über den Giebeln, hier die Türme als Schattenriss, über den Gräbern seine Narben). Bleich, nie rot.
// [ERWEITERT] Die vierte Zeile: Im Gedächtnis kippt seine Stimme in der vierten Zeile; der Choral nach dem Sieg endet nach der dritten.
//   Der Leser verbindet es selbst; am Grab (n2_gascoigne) reißt die Zeile an derselben Stelle.

VAR abzeichen_schwert = false   // Abzeichen der Schwertjäger aus der Beute der Bestie
// Stand beim ersten Betreten: Ein Neustart nach dem Tod stellt ihn wieder her (verbrauchte Brandflasche und Kiesel kehren zurück, die Freundschaft zu Gascoigne zählt nicht doppelt).
VAR n1_gascoigne = 0
VAR n1_molotow = 0
VAR n1_kiesel = 0

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
~ kampfanfang = -> k1_n1_kleriker
{ k1_n1_kleriker == 1:
    ~ n1_gascoigne = gascoigne
    ~ n1_molotow = molotow
    ~ n1_kiesel = kiesel
- else:
    ~ gascoigne = n1_gascoigne
    ~ molotow = n1_molotow
    ~ kiesel = n1_kiesel
}
{ kleriker == "besiegt": -> uebergang }
// Stimme A für das Ortsbild, dann B. Beim ersten Mal ganz; nach einem Tod nur das, was sich wiederholt, als Regel (SP-05).
{ k1_n1_kleriker == 1:
    Die Große Brücke trägt den Weg aus der unteren Stadt hinauf zur Kathedrale, auf Bögen aus grauem Stein, die so tief in den Nebel hinabreichen, dass keiner, den man fragt, ihren Fuß je gesehen haben will. Vier Kutschen fänden auf ihr nebeneinander Platz, und als die Jagd ausgerufen wurde, wollten alle zugleich hinüber; drüben, sagt man in den Gassen, habe ihnen niemand aufgetan. Die Kutschen stehen noch da, umgestürzt und ineinander verkeilt, die Pferde im Geschirr, aufgedunsen und starr. Aus einem geplatzten Koffer quillt, was einer in der letzten Stunde für wichtig hielt: Hemden, zwei Kerzenleuchter, ein Gebetbuch mit silbernem Schloss. Zwischen den Rädern liegen die Menschen, die hinüberwollten. Fortgeräumt hat man sie nicht. # bild: bruecke # stimmung: grauen
    Am anderen Ende ragt ein Turm über das schmiedeeiserne Geländer, und dahinter steigen die Spitzen der Kathedrale auf. Hinter ihnen steht der Mond. Seit er über den Giebeln der Klinik hing, ist er keinen Fingerbreit gewandert, aber nun ist er so groß, dass Turm und Kathedrale schwarz vor seiner Scheibe stehen, jede Spitze, jeder Wasserspeier, so scharf umrissen, als hätte sie einer mit der Schere aus Papier geschnitten. Sein Licht liegt knochenbleich auf dem nassen Pflaster, und in jeder Pfütze steht er noch einmal, klein und genau.
    Nur deine Stiefel sind zu hören, und auf halbem Weg der Atem eines der Pferde, das keinen Atem mehr hat; es ist der Wind in seinen Nüstern. Vom Turm her, hoch über dir, kommt ein Kratzen: Horn auf Stein, ein Schaben, eine Pause, wieder Horn auf Stein. Vor der hellen Scheibe löst sich ein Stück vom Umriss des Turms, ein Klumpen mit Zacken, hängt eine Weile still und kriecht dann abwärts. Was da herabsteigt, lässt sich Zeit.
    Auf halber Höhe lässt es los. Zwischen den Kutschen schlägt es auf, so schwer, dass dir das Pflaster gegen die Sohlen stößt und vom Geländer Steine in den Nebel fallen, ohne dass du sie unten aufkommen hörst. # kampf: kleriker
    Selbst gekauert überragt die Bestie die umgestürzten Kutschen um zwei Mannslängen, und dabei ist sie so mager, dass unter dem Fell jede Rippe einzeln steht. Das Fell hängt in verfilzten Strähnen von ihr herab, bleich und nass wie Moos an einem toten Baum. Aus dem Schädel wächst ihr ein Geweih, verdreht und in sich verknotet, Horn, das gegen sich selbst gewachsen ist. Der linke Arm ist doppelt so lang wie der rechte und aufgebläht von Muskeln, und an seinem Ende krümmen sich Krallen, jede länger als das Blatt deiner Säge.
    In den Hinterläufen stecken Nägel, rostige, Dutzende, und um jeden Nagel ist das Fell weißlich aufgeworfen und weich, Schimmel auf altem Brot. Um den Hals, ins Fell eingewachsen, hängt ein Streifen Stoff, der einmal weiß war. Kragen oder Verband: Von hier aus kannst du es nicht sagen.
- else:
    Wieder die Kutschen, die Pferde im Geschirr, der Mond hinter dem Turm, und an derselben Stelle wie zuvor das Kratzen, Horn auf Stein. Deine Schultern ziehen sich hoch, bevor du hinsiehst. # bild: bruecke # stimmung: grauen
    Auf halber Höhe lässt sie los, wie zuvor, und schlägt zwischen den Kutschen auf; das Pflaster stößt dir gegen die Sohlen. Das verknotete Geweih, die Nägel in den Läufen, der Streifen Stoff am Hals: Alles ist, wie es war. Deine Augen gehen von selbst zuerst zu dem langen Arm. # kampf: kleriker
}
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    { schreie >= 1: Sie reißt das Maul auf und kreischt, hoch und lang, und deine Schultern kennen den Ton von den Dächern her, bevor du ihn erkennst. Jetzt hat er einen Körper. }
    Dein Blick bleibt an dem langen Arm hängen und kommt nicht los. Ohne es zu wollen, zählst du die Gelenke: Schulter, Ellbogen, noch ein Ellbogen, noch einer. Beim zweiten Zählen kommst du auf eine andere Zahl. Hinter deiner Stirn tut sich ein Spalt auf, so schmal wie der unter einer Tür, und durch ihn siehst du, dass der Arm noch wächst, jetzt, während du hinsiehst. # notiz: erste_einsicht # lore: einsicht # stimmung: grauen
}
{ kleriker == "abgelenkt" or kleriker == "geflohen": Sie hat dich nicht vergessen. Der schwere Kopf dreht sich, Zoll um Zoll, und sucht genau die Stelle, an der du stehst. }
// WARUM: Wer Gascoigne am Scheiterhaufen beigestanden hat, kann ihn rufen; zu zweit ist der Kampf kürzer und zeigt, wie er kippt (Lachen, Summen, er hört nicht auf). Kein falscher Weg; hat man ihn verraten, antwortet niemand.
+ {q_frau == 1} [Nach Gascoigne rufen #fliesst] -> rufen
// WARUM: Der Weg ohne Hilfe: sieben Takte gegen die ganze Bestie, danach Brief, Abzeichen und Gedächtnis. Richtig für den, der die Anzeichen liest.
+ [Die Säge ausklappen und ihr allein entgegengehen #fliesst]
    Das Blatt schnappt aus dem Griff und rastet ein. Zwischen den toten Pferden hindurch, und mit jedem Schritt riecht die Luft schwerer, nach Schimmel und kaltem Stall.
    -> kampf
// WARUM: Mit Kiesel oder Brandflasche kommt man ohne Kampf vorbei; die Bestie lebt weiter (ihr Kreischen begleitet den Heimweg), und was sie im Fell trägt, bleibt dort.
+ {kiesel > 0 or molotow > 0} [Sie mit einem Wurf ablenken und vorbeischleichen #fliesst] -> ablenken
// WARUM: Der Ausweg der Panik: kostet zwei Treffer und alles, was die Bestie bei sich trägt. Für Aufmerksame falsch, denn eben ist sie vom Turm herabgestiegen: Die Höhe ist ihr Gelände, nicht deins.
+ [Über das Geländer springen und fliehen #fliesst] -> fliehen

= rufen
„Gascoigne!“ Der Name kratzt dir im Hals und läuft über die Brücke davon, zwischen den Kutschen hindurch, bis hinüber zum Turm.
{ gascoigne_verraten:
    Das Echo kommt zurück, einmal, zweimal, und sonst nichts. Erst jetzt siehst du die Federn auf dem Pflaster am Brückenkopf, schwarz, ein ganzer Kreis davon, und dazwischen dunkle Tropfen. Gewartet hat hier jemand, aber nicht auf dich. # notiz: federn_bruecke
    -> kampf
}
{ gascoigne2:
    Unten zwischen den Dächern bellt ein Hund, ein einziges Mal, und sonst antwortet niemand.{k1_c_graeber.warnung: Wo er jetzt ist, hast du gesehen: hinter einem Tor mit einem Namen darüber.}
    -> kampf
}
-> mit_gascoigne

= kampf
// Sieben Takte in zwei Phasen (Entscheidung des Nutzers 2026-11-04: Bosskämpfe 6 bis 8 Takte).
// Tempo gemischt: das Anzeichen ruhig und genau, die Folge kurz und hart. Jede Möglichkeit nennt Richtung und Handlung;
// die Begründung steht im Anzeichen, die Richtung in seinem letzten Satz. Lernsätze (gelernt) als Erinnerung des Körpers an den letzten Tod, jeder anders (L3).
// Die Fortsetzungen beginnen mit dem, was geschieht, nicht mit den Wörtern der Option (Ü6).
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den langen Arm und schiebt den Kopf vor, die Augen halb geschlossen; sie sucht dich mit der Nase. Unter dem Fell der Schulter ziehen sich die Muskeln zusammen, Faser um Faser, zu einem Knoten, so groß wie ein Mehlsack. Die Krallen liegen flach auf dem Pflaster und reichen bis an die übernächste Kutsche. Der lange Arm steht dir zur Rechten, und unter ihm, zwischen Ellbogen und Pflaster, bleibt ein Spalt. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Die Stelle, an der dich zuletzt die Krallen fanden, brennt, obwohl dort keine Wunde mehr ist. Von rechts kam der Arm, flach und weiter, als ein Sprung trägt, und Platz war nur darunter. }
// WARUM: Richtig. Das Anzeichen nennt den Spalt unter dem Ellbogen zur Rechten; nah am Ansatz hat der Bogen noch keine Wucht.
+ [Nach rechts, unter den Arm #fliesst]
    Dorthin, wo der Bogen beginnt, den Kopf zwischen den Schultern: Ein Luftzug fährt dir über den Scheitel, hinter dir kippt eine Kutsche in den Abgrund, und schon bist du an ihrer Flanke. Die Säge beißt in Rippen.
    -> t2
// WARUM: Falsch (zwei Treffer). Das Anzeichen sagt, dass die Krallen bis an die übernächste Kutsche reichen; so weit trägt kein Sprung.
+ [Mit einem Satz nach hinten springen #fliesst]
    Der Bogen reicht einen Schritt weiter, als dein Sprung trägt: Krallen an der Hüfte, dann ein Wagenrad im Rücken.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Halb falsch (ein Treffer). Links liegt der äußere Rand des Bogens, und der reicht laut Anzeichen bis an die übernächste Kutsche.
+ [Nach links, aus dem Bogen #fliesst]
    Bis an die Kutschen, so weit die Beine tragen, und am äußersten Rand ihrer Bahn holen die Krallen dich ein, matter schon, aber sie holen dich ein. Über der Schulter reißt dir der Mantel.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Richtig, wenn Gilbert dir die Flamme gegeben hat: Die Schnauze ist vorgestreckt, und Feuer ist, wogegen diese Bestie nichts hat (Kanon: feueranfällig). Gilberts Husten kehrt als dein eigener wieder.
+ {feuer} [Gilberts Flamme nach vorn, in die Schnauze #fliesst]
    Das Feuer fährt aus der Düse mitten in die schnüffelnde Schnauze. Das nasse, verfilzte Fell zischt zuerst, dann fängt es. Sie wirft sich zurück und schlägt blind um sich, den brennenden Kopf zwischen den Schultern, und der Gestank von versengtem Haar setzt sich dir so tief in den Hals, dass du selbst zu husten beginnst. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis du den Kopf in den Nacken legen musst, um das Geweih zu sehen, und reißt das Maul auf. Ihr Hals weitet sich wie ein Blasebalg, die Rippen treten unter dem Fell hervor, und für einen Herzschlag hört alles auf, ihr Atem, das Knarren der Kutschen, der Wind in den Nüstern der Pferde. Nur die Tropfen hörst du noch, die von ihrem Geweih fallen, und das offene Maul hängt so nah über dir, dass dir sein Atem warm in den Kragen fällt. # anzeichen: kreischen
{ gelernt ? kreischen: In deinen Ohren singt es schon, ehe sie schreit, hoch und dünn, so wie zuletzt, als du ihrem Maul zu nahe warst. }
// WARUM: Falsch (ein Treffer). Das Maul hängt laut Anzeichen so nah, dass ihr Atem dich erreicht; wer noch näher geht, steht mitten im Schrei.
+ [Nach vorn, in den Schrei hinein #fliesst]
    Aus nächster Nähe trifft dich der Schrei, eine Glocke, die man dir dicht am Kopf anschlägt, und die Brücke kippt. Im Taumeln erwischt dich ihr kleiner Arm, beinahe beiläufig.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
// WARUM: Richtig. Die Stille und der geweitete Hals kündigen den Schrei an; Abstand und zugehaltene Ohren lassen dich stehen.
+ [Ohren zuhalten und nach hinten weichen #fliesst]
    Die Handballen fest auf den Ohren, Schritt um Schritt zurück. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen, und einen Augenblick lang weißt du nicht, wo oben ist. Aber du stehst.
    -> t3
// WARUM: Richtig und stark, wenn du eine Brandflasche trägst: Das Maul steht offen, und Feuer im Schlund erspart dir den nächsten Takt.
+ {molotow > 0} [Die Brandflasche hinauf ins Maul werfen #fliesst]
    ~ molotow = molotow - 1
    In hohem Bogen steigt die Flasche, der brennende Lappen voran, und zerspringt zwischen ihren Zähnen. Feuer im Schlund. Der Schrei bricht ab und wird zu einem nassen, gurgelnden Würgen, und sie stürzt auf die Knie. Bevor sie wieder hochkommt, bist du an ihr, und die Säge reißt ihr die Flanke auf.
    -> t4
// WARUM: Ein sicherer Augenblick für die Ampulle: Solange sie Luft holt und schreit, schlägt sie nicht.
+ {ampulle > 0} [Nach hinten treten, die Ampulle setzen #fliesst]
    Rückwärts aus ihrer Reichweite, die Hand schon an der Tasche: Solange sie schreit, ist Zeit.
    -> ampulle_ruhig -> t3
- (t3)
// [ERWEITERT] Der Wurf mit der Kutsche.
Sie fällt auf alle viere zurück und tastet mit dem langen Arm zwischen die Kutschen, wie eine Hand, die im Dunkeln nach einem Becher sucht. Die Krallen schließen sich um eine Achse. Fast andächtig hebt sie die ganze Kutsche vom Pflaster, und der Arm wandert damit nach hinten, weit über ihre Schulter, bis das Holz knarrt. Der kleine Arm hängt frei vor ihrer Brust, die Finger gespreizt. Ihr Kopf zeigt auf dich; links von dir stehen Kutschen, rechts liegt die Brücke frei bis an das andere Geländer. # anzeichen: wurf
{ gelernt ? wurf: Diesen Arm mit der Kutsche über der Schulter hast du schon gesehen, und dein Rücken zieht sich zusammen, ehe das Holz die Schulter verlässt. Sie wirft dorthin, wohin ihr Kopf zeigt, und eine Kutsche hält keine Kutsche auf. }
// WARUM: Falsch (zwei Treffer). Sie hebt selbst eine ganze Kutsche; links stehen laut Anzeichen nur Kutschen, und Holz hält kein Holz auf.
+ [Links hinter die nächste Kutsche ducken #fliesst]
    Die Kutsche, hinter der du kauerst, hält genau einen Herzschlag lang. Die zweite schlägt in die erste, und beide kommen über dich, in Splittern und Eisen, und zuletzt legt sich das Gewicht eines toten Pferdes auf dein Bein.
    ~ zuletzt = wurf
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4
// WARUM: Richtig. Sie wirft, wohin ihr Kopf zeigt; rechts liegt laut Anzeichen die Brücke frei, also hinaus aus der Linie.
+ [Nach rechts, quer über die Brücke #fliesst]
    So schnell die Stiefel auf dem nassen Pflaster greifen, hinaus aus der Linie ihres Kopfes: Hinter dir schlägt die Kutsche dort auf, wo du eben noch standest. Glas springt über die Steine, an dir vorbei wirbelt ein Pferdebein, das Eisen noch am Huf, und das letzte Rad rollt aus, kippt und liegt.
    -> t4
// WARUM: Halb richtig (ein Treffer, aber ein Hieb für dich). Das Anzeichen zeigt den kleinen Arm frei vor ihrer Brust; wer unter dem Wurf hindurchgeht, läuft ihm in die Hand.
+ [Nach vorn, unter den erhobenen Arm #fliesst]
    Die Kutsche fliegt über dich hinweg und zerschellt in deinem Rücken, und du bist an ihrem Bauch, wo das Fell dünn ist; die Säge geht hinein, und sie heult. Aber der kleine Arm hat gewartet. Er schlägt dich zu Boden, beinahe ohne Eile.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
- (t4)
Sie zieht die Hinterläufe unter den Leib und streckt den langen Arm nach vorn, und ihr ganzes Gewicht sackt nach hinten, bis die Läufe darunter zittern. Die Nägel darin schaben über das Pflaster. Die Krallen des langen Armes graben sich in die Fugen zwischen den Steinen, und ihr Kopf hält still, genau auf die Stelle gerichtet, an der du stehst. Zu deiner Rechten ist das Pflaster frei bis an eine umgestürzte Kutsche. # anzeichen: sprung
{ gelernt ? sprung: Unter deinen Schulterblättern ist das Pflaster wieder kalt, obwohl du stehst. Wo du jetzt stehst, landet sie. }
// WARUM: Richtig und am stärksten, wenn Gascoigne (oder Gehrman) dir die Parade gezeigt hat: Ihr ganzes Gewicht liegt im Absprung, genau der Augenblick, von dem er gesprochen hat.
+ {parade} [Im Absprung nach oben schießen #fliesst]
    {parade_quelle == "gascoigne":„Nicht davor“, sagt in deinem Kopf eine tiefe Stimme, die nicht aus diesen Gassen stammt. „Nicht danach.“|„Genau dann, wenn sie ihr Gewicht hineinlegt“, sagt in deinem Kopf eine müde Stimme, eine für Höfe und Übungsplätze.} Erst als sie ganz in der Luft hängt, drückst du ab. Sie wankt mitten im Sprung und schlägt vor dir auf die Brust. Bevor sie sich fängt, bist du über ihr und stößt zu, tief, mit beiden Händen. # notiz: viszeral
    -> phase2
// WARUM: Richtig. Ihr Kopf zielt auf die Stelle, an der du stehst, und rechts ist das Pflaster laut Anzeichen frei.
+ [Nach rechts wegrollen #fliesst]
    Über Schulter und Hüfte, bis an die umgestürzte Kutsche, und wo du eben standest, landet sie. Das Pflaster springt in Platten auf; eine davon kippt dir gegen die Stiefel.
    -> phase2
// WARUM: Falsch (zwei Treffer). Das Anzeichen zeigt, wie viel Gewicht in den Sprung geht (die Läufe zittern darunter); das fängt keine Klinge.
+ [Den Sprung von vorn abfangen #fliesst]
    Die Säge quer vor der Brust, die Füße fest, und schon dabei weiß dein Rücken, dass es falsch ist. Das Gewicht begräbt dich. Unter deinen Schulterblättern ist die Brücke kalt, und über dir ist nur noch Fell.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und sie ist schneller geworden: Der nächste Schritt kommt, bevor das Pflaster vom letzten aufgehört hat zu zittern. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste einer Weide im Winter. Der Streifen Stoff an ihrem Hals ist fort. Du suchst ihn auf dem Pflaster und findest ihn nicht. # phase
- (t5)
// Atemlos und kurz (Lektorat 1.4), gegen die lange falsche Ruhe in t7.
Links, rechts, links. Der verzweigte Arm schlägt um sich, und jeder Schlag reicht weiter als der vorige, bis in die Kutschen hinter dir. Dazwischen, einen Atemzug lang, steht ihre Brust offen. # anzeichen: knochensturm
{ gelernt ? knochensturm: Deine Schläfe pocht im Takt der Schläge, links, rechts, links, und wartet mit dir auf die Lücke. Bis an ihre Brust reicht der Sturm nicht. }
// WARUM: Falsch (ein Treffer). Jeder Schlag reicht weiter als der vorige, laut Anzeichen bis in die Kutschen hinter dir.
+ [Nach hinten, hinter die Kutschen #fliesst]
    Die Kutsche, hinter die du dich flüchtest, birst unter dem nächsten Schlag in Latten und Glas, und ein Speichenrad trifft dich an der Schläfe.
    ~ zuletzt = knochensturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    Als du wieder stehst, ist sie dir nachgekommen, bis ans Geländer.
    -> t6
// WARUM: Richtig, nur mit dem Heft des toten Jägers: Seine Pfeile um den gezeichneten Arm zeigen zur Schulter, wo der lange Arm keine Kraft hat.
+ {jagdnotizen} [Nach vorn, den Knochenarm an der Schulter umklammern #fliesst]
    Einen Arm um den Knochen, dicht an der Schulter, die Brust dagegen, und du hältst. Im Heft des Toten zeigten alle Pfeile hierher, und hier hat der lange Arm keinen Hebel. Die Bestie zerrt, einmal, zweimal. Lange genug: Mit der freien Hand treibst du ihr die Säge in die Achsel, bis zum Anschlag. Sie reißt sich los und taumelt rückwärts gegen das Geländer, und der Knochenarm hängt schlaff. # notiz: jagdnotizen_genutzt
    -> t6
// WARUM: Richtig. Das Anzeichen nennt die offene Brust zwischen den Hieben; vorn ist der einzige Ort, den der Sturm nicht erreicht.
+ [Zwischen den Hieben nach vorn, an ihre Brust #fliesst]
    In den einen Atemzug hinein, so nah an sie heran, dass du ihr Herz durch das Fell schlagen spürst, schwer und mit zu langen Pausen. Hinter deinem Rücken schlägt der Arm ins Leere. Die Säge geht hinein, wieder und wieder, bis sie rückwärts gegen das Geländer taumelt.
    -> t6
// WARUM: Der falsche Augenblick für die Ampulle: Mitten im Sturm trifft dich der nächste Schlag beim Setzen, und der Sturm beginnt von vorn.
+ {ampulle > 0} [Nach hinten weichen, die Ampulle setzen #fliesst]
    Mitten im Sturm einen Schritt zurück, die Hand schon an der Tasche.
    -> ampulle_gefahr(2) -> t5
- (t6)
// [ERWEITERT] Der Ansturm mit dem Geweih.
Am Geländer senkt sie den Kopf, bis das verknotete Geweih auf der Höhe deiner Brust steht. Die Hinterläufe scharren über das Pflaster, einmal, zweimal, und mit jedem Scharren rückt sie ein Stück zur Seite, bis sie dich genau vor den Hörnern hat. Ihre Augen sind halb geschlossen, als ziele sie mit etwas anderem als mit ihnen. Machst du einen halben Schritt nach links, scharrt sie und rückt nach. # anzeichen: ansturm
{ gelernt ? ansturm: Dieses gesenkte Geweih hattest du schon einmal vor Augen, und was es dich gelehrt hat, sitzt dir in den Beinen: Davonlaufen hilft nicht, und wer zu früh weicht, dem lenkt sie nach. Dir gehört nur der letzte Augenblick. }
// WARUM: Falsch (zwei Treffer). Wer eben in einem Satz über Kutschen gesprungen ist, holt einen Läufer ein.
+ [Nach hinten über die Brücke rennen #fliesst]
    So schnell du kannst, und hinter dir trommeln ihre Läufe, näher, näher, bis das Geweih dich ins Kreuz trifft und über eine Kutsche hinwegwirft.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
// WARUM: Falsch (zwei Treffer). Das Anzeichen zeigt es: Auf einen halben Schritt nach links scharrt sie und rückt nach; wer zu früh weicht, dem lenkt sie nach.
+ [Sofort nach links springen #fliesst]
    Noch ehe sie losläuft, bist du links, und sie läuft dir nach; scharren muss sie nicht mehr, nur noch lenken. Mitten im Sprung trifft dich das Geweih in die Hüfte.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
// WARUM: Richtig. Weil sie jeder frühen Bewegung nachlenkt, gehört dir nur der letzte Augenblick; dann trägt ihr eigenes Gewicht sie ins Geländer.
+ [Warten, dann im letzten Augenblick links #fliesst]
    Das Geweih wächst vor dir, bis es ein Wald aus Horn ist, so nah, dass du die Kruste aus altem Blut in seinen Gabelungen siehst. Jetzt. Ein Schritt nach links. Sie rast vorbei, und das Geländer, gegen das sie prallt, bricht in Stücken in den Abgrund. Sie hängt halb darüber, die Hinterläufe in der Luft, und zieht sich mit dem kleinen Arm zurück auf die Brücke.
    -> t7
// WARUM: Falsch (zwei Treffer). Gegen ein gesenktes, verknotetes Geweih mit dem ganzen Gewicht dahinter richtet die Säge nichts aus.
+ [Nach vorn, dem Geweih entgegen #fliesst]
    Die Säge voran: Sie trifft Horn und prallt ab. Das Geweih prallt nicht ab. Es hebt dich hoch und lässt dich fallen.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
// WARUM: Der falsche Augenblick für die Ampulle: Sie rückt jeder Bewegung nach und trifft dich beim Setzen; danach steht sie wieder genau vor dir.
+ {ampulle > 0} [Nach rechts weg, die Ampulle setzen #fliesst]
    Die Hand an der Tasche, und schon scharrt sie und rückt nach.
    -> ampulle_gefahr(2) -> t6
- (t7)
// [ERWEITERT] Die falsche Ruhe: Sie liegt still, aber der kleine Arm lauert. Lang und langsam erzählt, gegen den Knochensturm.
Sie liegt auf der Seite, den Knochenarm unter sich begraben, und ihr Atem geht rasselnd und flach, wie bei einem Tier, das ein Fuhrwerk auf der Straße erfasst hat. Zwischen zwei Atemzügen vergeht so viel Zeit, dass du jedes Mal glaubst, der letzte sei schon gewesen, und jedes Mal kommt noch einer, nasser als der vorige. Der Kopf liegt auf dem Pflaster, ganz nah, das Auge geschlossen, und auf dem Lid liegt das Mondlicht. Nur der kleine Arm, der rechte, liegt nicht still. Seine Finger öffnen und schließen sich, ohne Eile, auf und zu, auf und zu. # anzeichen: letzter_griff
{ gelernt ? letzter_griff: Um deinen Knöchel liegt noch ein Griff, den es nicht mehr gibt. Diese Finger warten darauf, dass sich einer über den Kopf beugt. }
// WARUM: Falsch (ein Treffer, aber der Kampf endet). Das Anzeichen zeigt die kleine Hand, die sich öffnet und schließt: Sie wartet auf den, der sich über den Kopf beugt.
+ [Über den Kopf gebeugt zustoßen #fliesst]
    Kaum fällt dein Schatten auf das Lid, schließt sich die kleine Hand um deinen Knöchel und reißt dich von den Füßen. Ihr Auge ist offen. Erst als deine Säge in diesem Auge steckt, lässt die Hand los.
    ~ zuletzt = letzter_griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
// WARUM: Richtig. Erst die lauernde Hand, dann der Stoß hinter das Ohr; wer das Anzeichen gelesen hat, sieht, woher die Gefahr kommt.
+ [Zuerst nach unten, auf die Hand treten #fliesst]
    Dein Stiefel kommt mit dem ganzen Gewicht auf die kleine Hand, und die Finger schnappen zu, um nichts. Hinter dem Ohr, wo der Schädel dünn ist, findet die Säge ihren Weg. Einmal. Es genügt.
    -> sieg
// WARUM: Ein sicherer Augenblick für die Ampulle: Sie liegt, und die Hand reicht nicht bis zu dir; danach liegt sie noch genauso da.
+ {ampulle > 0} [Zwei Schritte zurück, die Ampulle setzen #fliesst]
    Aus der Reichweite der kleinen Hand. Sie liegt, und ihre Finger öffnen und schließen sich weiter, ohne dich.
    -> ampulle_ruhig -> t7
- (sieg)
Die Bestie stirbt, wie ein alter Speicher einstürzt: lange nur ein Ächzen im Gebälk, dann alles zugleich, und ihr Geweih schabt noch über das Pflaster, als der Rest längst liegt. # stimmung: ruhig
Zuletzt liegt auch das Geweih still.
// Stimme C: Die Kirche betritt die Szene nur als Klang. Der Choral setzt ein, ohne dass der Erzähler das Timing kommentiert (L6); er bricht nach der dritten Zeile ab (Ü11).
Jenseits des Turms, im Bezirk der Kathedrale, setzt ein Gesang ein: viele Stimmen hinter geschlossenen Türen, gleichmäßig und ohne Eile, in einer Tonart, die nicht aufgeht. Nach der dritten Zeile endet er ordnungsgemäß, und niemand stimmt die vierte an. # klang: choral
Die Zähne deiner Klinge haben sich in ihrem Fell festgefressen. Um sie herauszuziehen, musst du den Fuß auf ihre Brust stellen.
-> beute

= beute
// Kein Blutecho mehr (2026-11-06). Der Dunst gehört zur Einsicht dieses Augenblicks: Er zieht gegen den Wind, ein Detail, das nicht stimmt.
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ fr_frei_machen(fr_ich)
~ abzeichen_schwert = true
Aus ihrem Leib steigt ein roter Dunst und zieht gegen den Wind zu dir herüber. Er schmeckt nach Eisen. Als er in dir ist, musst du dich auf die Säge stützen, bis die Knie wieder tragen.
Unter dem Fell, über der Brust, wo es dünn wird, sitzen Narben, klein und rund und in ordentlichen Reihen, Dutzende, Hunderte, Stich neben Stich. Du reibst dir die Armbeuge, ohne es zu merken. # notiz: nadelnarben
// [ERWEITERT] Das zerkratzte Schwert: Indiz, das sich auf Gilberts abgekratzte Haustüren reimt, ohne zu beweisen, wem das Abzeichen gehörte.
In den Fellsträhnen hat sich Silber verfangen, ein Abzeichen, ein Schwert auf einem Wappen, wie es in Yharnam die Jäger der Kirche tragen. Unter dem Daumen löst sich das Blut vom Silber. Darunter ist das Schwert zerkratzt, kreuz und quer, Strich um Strich, bis nur noch die Spitze klar zu erkennen ist.{gilbert_kleriker: Aus Kirchenleuten, hat Gilbert gesagt, werden die schlimmsten.} Du steckst es ein und wischst den Daumen lange am Mantel ab. # lore: kleriker_bestien # notiz: jaegerabzeichen
// Fundstück (ersetzt den Kauf bei den Boten, 2026-11-06): der Brief in einem Rest Tuch unter dem Schlüsselbein (auf beiden Wegen gleich, denn der Streifen am Hals ist nach Phase 2 fort).
Höher, unter dem Schlüsselbein, ist das Fell mit einem Rest Tuch verfilzt, schwarz von Blut, eine Tasche vielleicht, und darin steckt, mehrfach gefaltet, ein Brief. Das Siegel ist gebrochen; gelesen hat ihn schon jemand vor dir.
~ kirchenbrief = true
// [KANON lore:figuren/amelia] Die Vikarin betet in der Großen Kathedrale. [KANON] Die Oedon-Kapelle im Kathedralbezirk nimmt Überlebende auf (erst Kapitel 2).
// [ERWEITERT] Der Brief, der Schreiber, die Frage nach dem Namen (Echo auf das Gedächtnis und auf Gascoigne), die Glocken zu jeder vollen Stunde, der ausgestrichene Satz.
// Stimme C (Ü4): Vorgang statt Gefühl, tadellos höflich; das Detail, das die Zeit verrückt, merkt der Schreiber nicht (die vielen vollen Stunden: Ü1, die Nacht endet nicht). Der Riss in der Ordnung ist der letzte Satz.
// Das Notizbuch (web/notizbuch.js, kirchenbrief) fasst zusammen: Kapelle nimmt auf, wer noch sprechen kann; die Vikarin betet am längsten; „Komm nicht“. Beides muss zusammenpassen.
Die Hand darin ist klein und sorgfältig, jede Zeile gleich weit von der nächsten.
„Liebe Schwester, ich darf dir mitteilen, dass die Kapelle oben im Bezirk auf Weisung nunmehr jeden aufnimmt, der an die Tür klopft und auf die Frage nach seinem Namen noch antworten kann. Wer nicht mehr antwortet, wird an die nächste Stelle des Blutes verwiesen; dafür ist gesorgt. Die Vikarin betet in der großen Kathedrale am längsten von uns allen. Wo sie gekniet hat, sind die Steine danach nass, und es wird gewischt. Mir ist das Läuten der Glocken übertragen, zu jeder vollen Stunde, auch wenn niemand mehr kommt. Es sind, seit ich damit begonnen habe, sehr viele volle Stunden gewesen. Ich läute sie alle.“ # stil: anschlag # notiz: kirchenbrief
Darunter steht ein letzter Satz, so fest ausgestrichen, dass die Feder das Papier zerrissen hat. Lesbar sind davon nur die ersten beiden Wörter: Komm nicht.
-> gedaechtnis

= mit_gascoigne
// [KANON lore:bosse/kleriker-bestie] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
// [KANON lore:figuren/maedchen-und-viola, LK §17.5] Spielt man dem gerufenen Gascoigne die Spieluhr vor, lacht er beim ersten Mal leise.
// [ERWEITERT, Ü11] Er lacht an der Stelle, an der der Spieluhr ein Ton fehlt; den Ton summt er erst an den Gräbern (c_unterstadt). Verband, Torf und Rauch.
// Lachen sparsam (Lektorat 1.2): Es gehört hier dem Kippenden, an den falschen Stellen.
// Stimme Gascoigne: tief, kurz, warm; „So.“ am Ende einer Sache; gerät er in den Rausch, lacht er, wo keiner lacht.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Noch bevor das Echo vom Turm zurückkommt, ist er da, aus dem Nebel am Brückenkopf, und seine Stiefel hast du nicht gehört. Im Vorbeilaufen streift dich sein Geruch, Torf und Rauch, und unter beidem etwas Nasses, Warmes. Gascoigne lacht. Das Lachen springt zwischen den toten Pferden hin und her, und mit offenem Mund, die Zähne bloß, den Verband über den Augen, stürzt er sich auf die Bestie. Einmal hast du einen Hund so laufen sehen, auf einen Fuchs zu. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. Gascoigne steht vor dir, genau in der Bahn des Arms, und weicht nicht; links neben ihm ist Platz, und rechts liegt ihre Flanke frei. # anzeichen: kleriker_hieb
// WARUM: Falsch (ein Treffer). Gascoigne steht laut Anzeichen genau in der Bahn vor dir; wer hinter ihm bleibt, bekommt ihn ab.
+ [Hinten bleiben und zusehen #fliesst]
    Er nimmt den Schlag allein und fliegt, rückwärts, mit ausgebreiteten Armen, genau gegen dich, und der Arm, der ihn geworfen hat, erwischt auf dem Rückweg auch dich.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_schrei
// WARUM: Richtig. Neben ihm ist laut Anzeichen Platz; zu zweit nehmt ihr den Schlag, und er zeigt dir seinen Takt.
+ [Links neben ihn, Schulter an Schulter #fliesst]
    Gemeinsam nehmt ihr den Schlag, du mit der Säge, er mit der Axt, und treibt sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er hält den Takt, Hieb, Schritt, Hieb, ohne den Kopf zu wenden, und atmet dabei wie ein Mann beim Holzhacken, ruhig und gleichmäßig. „Du links, ich rechts“, sagt er einmal, ohne hinzusehen, dabei stehst du längst links von ihm.
    -> g_schrei
// WARUM: Richtig. Sie hat nur Augen für ihn, also liegt ihre Flanke frei.
+ [Rechts herum, ihr in die Flanke #fliesst]
    Während sie nach ihm schlägt, bist du an ihrer Seite, und die Säge geht tief hinein. Gascoigne fängt den Arm mit der Axt ab und brüllt dabei Worte, kehlig und rund, in einer Sprache, die nicht die dieser Stadt ist.
    -> g_schrei
- (g_schrei)
Sie richtet sich auf, das Maul weit offen, und die Rippen treten unter dem Fell hervor wie die Spanten eines Bootes. Gascoigne achtet nicht darauf. Er hackt nach ihrem Hals, immer wieder auf dieselbe Stelle, und hebt nicht einmal den Kopf. # anzeichen: kreischen
// WARUM: Richtig und eine Geste der Freundschaft: Er achtet laut Anzeichen nicht auf den Schrei, also musst du es für ihn tun.
+ [Ihn am Mantel nach hinten reißen #fliesst]
    ~ gascoigne = gascoigne + 1
    Der Mantel ist schwer und nass in deinen Fäusten, und ihr stürzt zusammen rückwärts, als der Schrei über euch hinweggeht. Er schüttelt sich und dreht dir den Verband zu. „Danke“, sagt er, und nach einer Weile noch einmal, leiser, als müsse er sich das Wort merken: „Danke.“
    -> g_wurf
// WARUM: Falsch (ein Treffer). Das offene Maul und die Rippen kündigen den Schrei an; mit ihm hinein heißt, seinen Rausch zu teilen.
+ [Mit ihm nach vorn, in den Schrei #fliesst]
    Der Schrei trifft euch zugleich, und das Pflaster kippt unter dir weg. Gascoigne steht als Erster wieder, lachend, und aus seinen Ohren läuft Blut in den Kragen.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_wurf
- (g_wurf)
// [ERWEITERT] Sie wirft nach ihm, nicht nach dir.
Sie tastet mit dem langen Arm zwischen die Kutschen und hebt eine vom Pflaster, das Holz knarrt. Der Arm wandert über ihre Schulter, und ihr Kopf zeigt nicht auf dich. Er zeigt auf Gascoigne, der keine drei Schritte von dir zwischen zwei Pferdeleibern kniet und seine Donnerbüchse lädt, mit dem Rücken zu ihr. # anzeichen: wurf
// WARUM: Falsch (ein Treffer). Wer gerufen wird, dreht sich nach der Stimme um, nicht nach der Gefahr; er kniet laut Anzeichen keine drei Schritte von dir, also in Reichweite deiner Schulter.
+ [Ihm von hinten eine Warnung zurufen #fliesst]
    „Gascoigne!“ Er dreht den Kopf zu dir, nicht zu ihr. Die Kutsche trifft ihn in den Rücken und wirft ihn gegen dich, und ihr geht beide zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g2
// WARUM: Richtig und Freundschaft: Er kniet in Reichweite, und die Kutsche fliegt dorthin, wohin ihr Kopf zeigt, auf ihn.
+ [Nach vorn, ihn aus der Bahn stoßen #fliesst]
    ~ gascoigne = gascoigne + 1
    Deine Schulter trifft ihn in die Seite, und ihr rollt über das Pflaster. Die Kutsche schlägt dort ein, wo er gekniet hat, und ein Rad springt über euch hinweg in den Abgrund. Er liegt auf dem Rücken und schnauft wie nach einem Wettlauf. „So“, sagt er. „So. Das war knapp.“
    -> g2
- (g2)
{ spieluhr:
    Zwischen zwei Axthieben fängt er an zu summen, eine Melodie, die in eine Kinderstube gehört. Noch ehe du sie erkannt hast, findet deine Hand in der Tasche die Spieluhr und hält den Deckel zu. Er summt weiter, auch als die Axt im Knochen stecken bleibt und er sie mit dem Stiefel herausstemmt. # notiz: gascoigne_lied
- else:
    Zwischen zwei Axthieben fängt er an zu summen, ein Kinderlied, und summt weiter, auch als die Axt im Knochen stecken bleibt und er sie mit dem Stiefel herausstemmt. # notiz: gascoigne_lied
    -> g_fall
}
// Die Spieluhr zählt hier nicht für spieluhr_mal (n2_gascoigne).
// WARUM: Wer die Spieluhr des Mädchens trägt, gibt ihm das Lied zurück, das er summt; er lacht an der Lücke (Kanon: er lacht leise) und fragt, woher du sie hast. Kein Fehler, eine Saat für die Gräber.
* [Die Spieluhr aus der Tasche ziehen #fliesst]
    Zwischen zwei Hieben ziehst du die Feder auf. Die Töne kommen spitz und einzeln gegen das Krachen der Axt an und gehen beinahe darin unter. Er hört sie trotzdem. An der Stelle, an der dem Lied ein Ton fehlt, lacht er, leise, ein Lachen, das du von ihm noch nicht kanntest. „Woher hast du die?“, fragt er über die Schulter. Du fängst an zu antworten, und mitten in deinem Satz wendet er sich ab und schlägt wieder zu. # notiz: gascoigne_lacht
// WARUM: Die Spieluhr bleibt verborgen, und das Lied gehört noch ihm allein. Kein Fehler, aber eine Nähe, die du nicht nimmst.
* [Die Spieluhr in der Tasche lassen #fliesst]
    Sie bleibt, wo sie ist, unter deiner Hand. Sein Summen bricht ab, mitten in einer Wendung der Melodie, und kommt nicht wieder.
- (g_fall)
Die Bestie fällt. # stimmung: grauen
Gascoigne hört nicht auf. Er schlägt weiter in den Kadaver hinein, nass und gleichmäßig, Hieb um Hieb, und lacht dabei, tief in der Brust. # notiz: gascoigne_kippt
// WARUM: Ihn beim Namen zurückholen: Freundschaft, und sein Satz vom Blut ist eine Warnung, die auch dir gilt. Die beste Antwort auf den Rausch.
* [„Gascoigne. Gascoigne!“ #fliesst]
    ~ gascoigne = gascoigne + 1
    Erst beim dritten Mal, und erst, als deine Hand auf seiner Schulter liegt, hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er räuspert sich verlegen, und die Stimme, die dann kommt, ist wieder seine eigene. „Ruhig. Ruhig. Das geht einem ins Blut, wenn man nicht aufpasst.“ Er wischt die Klinge am Mantel ab. „Pass du besser auf als ich.“ Ohne sich umzusehen, geht er zum Ende der Brücke und steigt dort hinab, Stufe um Stufe, bis der Nebel ihn hat.
// WARUM: Fragt nach dem Lied; er findet den Namen seiner Tochter nicht (Saat für den Moment am Grab, Merker gascoigne_lied).
* [„Was hast du da gesummt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    ~ gascoigne_lied = true
    Er hört auf zu schlagen und wendet dir das Gesicht zu, wie einer, den man aus dem Schlaf geholt hat. „Gesummt?“ Er muss nachdenken. „Das Lied von der Kleinen. Sie heißt …“ Er bricht ab. Sein Mund bleibt offen. „Sie heißt“, sagt er noch einmal, und dann nichts mehr. Die Axt senkt er, bis die Schneide auf dem Pflaster liegt, und hebt sie nicht wieder. Ohne ein weiteres Wort geht er davon, zum Ende der Brücke, und die Schneide schleift hinter ihm über die Steine.
// WARUM: Fragt, ob er den Toten kannte; seine Antwort hält das Gerücht vom Kleriker offen, als Meinung eines Mannes, der selbst Vater genannt wird, ohne es zu beweisen.
* [„Hast du ihn gekannt?“ #fliesst]
    ~ gascoigne = gascoigne + 1
    Seine Hand findet im Fell den Streifen Stoff, der einmal weiß war, und reibt ihn zwischen den Fingern, wie man auf dem Markt ein Tuch prüft. „Von weitem hab ich's geglaubt“, sagt er. „An der Stimme. In dem Schrei steckt noch einer, der mal gesungen hat.“ Er lässt den Stoff los. „Von nah hat er kein Gesicht mehr, an dem man einen erkennt.“ Er geht und dreht sich nicht um.
// WARUM: Zusehen statt eingreifen: Er findet allein zurück, aber er sieht dich danach nicht mehr an (Freundschaft sinkt). Für Aufmerksame ein Fehler, denn er hat dir eben noch gezeigt, dass er Hilfe annimmt.
* [Schweigen und warten, bis er aufhört #fliesst]
    ~ gascoigne = gascoigne - 1
    Die Axt sinkt erst, als seine Arme nicht mehr wollen. Schwer atmend steht er über dem, was er angerichtet hat, und wendet dir den Verband nicht zu. Ohne ein Wort geht er davon, und du hörst seine Stiefel noch lange auf den Stufen am Ende der Brücke.
- -> beute

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Der Kiesel fliegt zurück, zu dem Ende der Brücke, von dem du gekommen bist, und klappert gegen eine Kutsche, hell und deutlich. Die Bestie fährt herum, so jäh, dass ihr Geweih gegen das Geländer schlägt, und schnüffelt dem Klang nach.
- else:
    ~ molotow = molotow - 1
    Die Brandflasche zerspringt auf den Kutschen am Rand, das alte Holz fängt sofort, und die Bestie wendet sich kreischend dem Brand zu. Vor den Flammen senkt sie den Kopf und wird still, und für einen Atemzug sieht es aus, als knie sie.
}
Geduckt läufst du zwischen den toten Pferden hindurch, so leise, wie es mit dem Herzschlag im Hals geht. Hinter dir kracht eine Kutsche aufs Pflaster, so schwer, dass dir die Zähne aufeinanderschlagen; umdrehen kannst du dich erst am anderen Ende, mit dem Rücken an kaltem Holz. Sie steht noch zwischen den Kutschen, den Kopf gesenkt, und sieht dir nach. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
~ ort = "gassen"
Das Geländer ist kalt unter deiner Hand, dann ist es fort, und unter dir liegt ein tieferes Dach. Über nasse Ziegel rutschst du hinab und fällst in eine Gasse. Oben folgt sie dir über die Dächer, von First zu First, ein Umriss vor dem Mond, und wo sie aufsetzt, regnen die Ziegel herab. An einer Ecke holt sie dich ein, ein einziger Hieb, und die Hauswand kommt dir entgegen. # stimmung: kampf
~ zuletzt = sprung
~ treffer(2)
{ leben <= 0: -> tod }
Auf und weiter, eine Treppe hinab, noch eine, bis der Boden unter dir nachgibt und du in Wasser stürzt, das nach Fäulnis riecht und nach nassem Kalk. Die Kanalisation. Oben am Rand des Schachts kreischt sie, aber sie kommt dir nicht nach. # notiz: kleriker_lebt
~ kleriker = "geflohen"
-> k1_c_kanal

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
// Wissenssperre: Das Gedächtnis darf den Kragen zeigen; es ist ein fremder Blick, und der Jäger kann ihm nicht trauen. „Das Blut der Kirche“ nur als „hieß es“.
// Was n2_gascoigne.moment braucht, steht im Gedächtnis selbst: die kippende Stimme in der vierten Zeile, der Blick auf die Hände, einer ganz hinten, der seinen Namen sucht.
// Perspektive: er, Präteritum (fremde Erinnerung, hpl-horror); danach zurück ins Du und ins Präsens.
Ihr Kopf reicht dir, wie er da auf dem Pflaster liegt, bis an die Brust. Aus dem verknoteten Geweih tropft noch Blut, einzeln, in Abständen, die länger werden. Der Einstich in deiner Armbeuge pocht, so wie er in der Klinik gepocht hat, als das fremde Blut hineinlief und Bilder mitbrachte, die nicht deine waren. Deine Hand will zu dem Kopf hin, wie die Zunge zu einem wackelnden Zahn will, und deine Schultern wollen weg.
// WARUM: Öffnet das Blutgedächtnis (gedaechtnis_kleriker): eine fremde Erinnerung, an der du bei Gascoigne erkennst, wann eine Stimme kippt. Kostet nichts als das Grauen; richtig für den Neugierigen.
+ [Den Kopf berühren #fliesst]
    Unter der flachen Hand ist das Fell nass und das Blut darin noch warm, und dann ist die Brücke fort. # stimmung: grauen
    Er sah eine Kathedrale, hell von Kerzen zu Tausenden, und hörte einen Gesang, so hoch, dass ihm die Zähne davon schmerzten. Er kniete. Er trug einen weißen Kragen. Eine Hand legte sich auf seinen Kopf, eine Nadel ging in seinen Arm, und das Blut, das hineinfloss, war heilig, hieß es, das Blut der Kirche, das reinste. Es war warm. Er dankte dafür. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Ein anderer Tag, dieselbe Bank. Er sang die vierte Zeile, und mitten darin kippte seine Stimme, und alle drehten sich zu ihm um. Er sah auf seine Hände. Sie waren zu groß. Und ganz hinten, in einem Winkel, den das Blut noch nicht erreicht hatte, saß noch jemand und suchte nach einem Namen. Seinem eigenen. Und fand ihn nicht.
    Mit einem Ruck gehört deine Hand wieder dir. Du kniest auf der Brücke, der Atem geht dir wie nach einem langen Lauf, und ob das ihre Erinnerung war oder eine, die das Blut aus einem anderen mitgebracht hat, kannst du nicht sagen. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
// WARUM: Vorsicht vor fremdem Blut. Kein Fehler, aber das Wissen für den Moment mit Gascoigne bleibt aus.
+ [Die Hand zurückziehen #fliesst]
    Eine Handbreit über dem nassen Fell hält deine Hand an und kehrt um. Als du dich abwendest, geht der Wind durch das verknotete Geweih und zieht einen Ton daraus, lang und hohl wie aus einer Orgelpfeife, deren Spieler längst gegangen ist.
    -> uebergang

= uebergang
// Sieg und Ablenkung führen über die Treppen hinab; es gibt keine Laterne und keinen Rückweg mehr (Entscheidung des Nutzers 2026-11-06).
// Anschluss: k1_c_kanal beginnt unter der Stadt, im knietiefen Wasser des Kanals (c_unterstadt).
{ not bruecken_tor: -> bruecken_tor -> }
Neben dem Tor bleiben nur die Treppen, breit und so steil, dass du die unteren erst siehst, wenn du auf den oberen stehst, und sie führen hinab in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen den Dächern, stehen die grauen Köpfe von Grabsteinen, dicht an dicht, wie Leute, die über eine Mauer sehen. Am Fuß der Treppen endet die Straße an einem gemauerten Bogen, aus dem ein Kanal ins Freie tritt, und weiter geht es nur gegen seinen Strom, hinein ins Dunkel.
-> k1_c_kanal

= bruecken_tor
// [KANON lore:welt/notizen Nr. 2] Die Kirche hat die Große Brücke gesperrt. [ERWEITERT] Das Tor, die Kette, die Ritzung (Übergreifend Nr. 2a).
// „von der anderen Seite verriegelt“ greift Gilbert im Heimweg wörtlich auf (d_nachspiel); nicht ändern.
Am Ende der Brücke, wo der Weg zur Kathedrale hinaufführen müsste, schließt ein Tor die Straße ab, doppelt so hoch wie ein Reiter und von der anderen Seite verriegelt. Durch den Spalt zwischen den Flügeln zieht kühle Luft, harzig und hell; so riecht in den Gassen hier unten nichts. Dahinter hängt eine Kette, frisch geschmiedet und noch blank, und an ihr ein Schloss, schwarz vor Alter. In Schulterhöhe hat jemand mit einem Messer Buchstaben ins Holz geritzt, tief und mit Mühe, und mitten im dritten aufgehört.
->->
