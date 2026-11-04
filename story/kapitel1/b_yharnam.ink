// KAPITEL 1, TEIL B: ZENTRAL-YHARNAM. Freie Reihenfolge. Führt zu NADELÖHR 1 (Brücke).
// Rede: Figuren sprechen in direkter Rede mit eigener Stimme (siehe hpl-horror, references/bb-game.md).

=== k1_hub_b ===
// TITEL: Zentral-Yharnam (frei)
-> betreten("zentral") ->
{ k1_hub_b == 1:
    Yharnam ist eine Stadt aus Treppen. Sie steigen und fallen zwischen Häusern, deren Fassaden sich nach vorn neigen, als lauschten sie, und über den Dächern hängt ein Rauch, der sich nicht verzieht. Irgendwo in der Ferne läuten Glocken, unregelmäßig, als zöge niemand an den Seilen. Unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht
    Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt. Der Geruch ist süß und schwer, und er liegt über allem wie ein Tuch über einem Gesicht. An manchen Häusern hängen drei, vier Lampen übereinander, an einem ein ganzes Dutzend, so dicht, dass das Fenster dahinter verschwindet. # lore: raeucherwerk
    Eine Jagdnacht, hat der Kutscher gesagt. Die Stadt hält den Atem an, und du bist der Einzige auf der Straße, der nicht weiß, warum.
- else:
    {~Die Laterne brennt, und die Straßen von Zentral-Yharnam liegen vor dir, nass und glänzend wie die Haut eines Tieres.|Der Rauch über den Dächern hat sich nicht bewegt. Irgendwo bellt ein Hund und hört mitten im Bellen auf.|Wieder die Laterne, wieder das Räucherwerk. Eine Glocke schlägt, dann noch eine, und dann ist es so still, dass du dein eigenes Blut hörst.|Fackeln ziehen in einer fernen Straße vorbei, und jemand singt dazu ein Lied, das klingt wie ein Kinderlied und keines ist.|Die Sonne hängt noch immer über den Giebeln, rot und klein. Sie hat sich nicht bewegt, seit du aus der Klinik getreten bist.}
}
// Das Kreischen der Kleriker-Bestie, zweimal, bevor man ihr begegnet: beim ersten Zurückkommen und beim vierten Mal.
{ kleriker == "" and ((schreie == 0 and k1_hub_b >= 2) or (schreie == 1 and k1_hub_b >= 4)):
    -> schrei ->
}
- (wohin)
+ [Gilberts Fenster neben der Laterne] -> k1_b_gilbert
+ [Die Türen mit den Räucherlampen] -> k1_b_tueren
+ [Die Hauptstraße mit dem Scheiterhaufen] -> k1_b_scheiterhaufen
+ [Der Brunnenplatz, wo eine Spieluhr spielt] -> k1_b_maedchen
+ [Die Gasse unter den Dächern] -> k1_b_daecher
+ [Die Dachbalken über dem Kanaleingang] -> k1_b_eileen
+ {kanal_leiter} [Durch die Kanalisation in die Unterstadt] -> k1_hub_c
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Blutampulle trinken] -> ampulle_ruhig -> wohin
+ [An der Laterne in den Traum]
    ~ laterne = -> k1_hub_b
    -> traum_von_laterne
+ {kleriker != "besiegt"} [Zur großen Brücke] -> k1_n1_kleriker
+ {kleriker == "besiegt"} [Über die große Brücke in die Unterstadt] -> k1_n1_kleriker

=== schrei ===
// TITEL: Kreischen von der Brücke
~ schreie = schreie + 1
{ schreie:
- 1: Da ist ein Geräusch, von weit her, aus der Richtung, wo die Stadt über eine Brücke hinüber zur Kathedrale steigt. Ein Kreischen, zu hoch für ein Tier und zu lang für einen Menschen, ein Laut, der nicht aufhören will, als hätte das, was ihn ausstößt, vergessen, wie man atmet. Die Härchen auf deinen Armen stellen sich auf. Hinter einem Fenster löscht jemand hastig eine Kerze. # klang: kleriker_schrei # stimmung: grauen
- 2: Wieder das Kreischen, und diesmal ist es näher. Diesmal ist ein Wort darin, oder etwas, das einmal ein Wort war, gezogen und zerrissen, bis nur noch der Klang übrig ist. Hinter einer Tür beginnt eine alte Stimme zu beten, schnell und tonlos, und hört nicht mehr auf. # klang: kleriker_schrei # stimmung: grauen
}
->->

=== k1_b_gilbert ===
// TITEL: Gilbert
// [KANON] Kranker Fremder hinter dem Fenster bei der ersten Laterne; verweist auf die Heilende Kirche, die Kathedrale als Ursprung ihres Blutes und die Brücke; wird nach dem Blutmond zur Bestie.
// [ERWEITERT] Mehr Gespräch, seine Bitte, der Birnbaum. Sein Feuer gibt er hier schon (im Original später). PRÜFEN: Zeitpunkt der Übergabe.
// Stimme: höflich, selbstironisch, fragt zurück; der Husten unterbricht ihn mitten im Satz.
-> betreten("gilbert") ->
{ k1_b_gilbert == 1:
    Neben der Laterne, hinter einem vergitterten Fenster, hustet jemand. Es ist ein Husten, der tief unten sitzt, nass und rasselnd, und der klingt, als habe er seinen Besitzer schon lange vor dieser Nacht bewohnt. # bild: gilbert # stimmung: ruhig
    Hinter dem Gitter erscheint ein Gesicht, eingefallen, mit fiebrigen, freundlichen Augen. „Ein Jäger“, sagt der Mann. „Und kein Hiesiger. Die Hiesigen gehen anders, schneller, mit dem Kopf zwischen den Schultern. Ich auch nicht, falls Sie sich wundern. Gilbert.“ Er deutet eine Verbeugung an, so weit das Gitter es zulässt. „Man hat mir hier Blut gegeben. Es kauft mir Zeit. Nur Zeit, wissen Sie, nichts weiter.“ # lore: fremde # lore: bluttransfusion
    { herkunft == "kranker":
        Dann hustest du, und er hört auf zu lächeln. „Oh“, sagt er leise. „Oh, das kenne ich. Das kenne ich sehr gut.“
    }
    -> haltung
- else:
    Gilbert ist am Fenster, bevor du anklopfst. „Ich hab Sie kommen hören“, sagt er. „Ich habe nicht viel anderes zu tun als hören.“
    -> themen
}

= haltung
* [Ihm deinen Namen sagen und zuhören]
    ~ gilbert = gilbert + 1
    Du sagst ihm deinen Namen, {name}, und bleibst, bis er ausgehustet hat. „{name}“, wiederholt er, leise, zweimal, wie man sich eine Hausnummer merkt. „Danke. Man wird ein bisschen seltsam hinter so einem Gitter. Man sammelt Namen.“
* [Knapp bleiben]
    Du nickst nur. „Schon gut“, sagt er. „Jäger reden wenig. Ich rede für zwei, das gleicht sich aus.“
* [Ihn anfahren, er solle dich in Ruhe lassen]
    ~ gilbert = gilbert - 2
    Du sagst ihm, er solle seinen Husten für sich behalten. Er zieht sich vom Gitter zurück. Lange ist es still, und dann hustet er wieder, gedämpft, als halte er sich etwas vor den Mund.
- -> themen

= themen
* [Wer er ist]
    Er erzählt, stockend, zwischen den Anfällen. „Eine Krankheit, für die mein Arzt zu Hause keinen Namen hatte. Dann ein Gerücht über diese Stadt. Dann eine lange Reise.“ Er lächelt schief. „Das Blut hat geholfen, eine Weile. Dann hat es aufgehört zu helfen. Ich kannte Leute im Hospiz, bei denen hat es nicht nur aufgehört.“ Er schweigt einen Atemzug lang. „Wir hatten einen Birnbaum zu Hause. Ich denke dauernd an diesen Birnbaum. Ist das nicht albern? Gehen Sie, sobald Sie können. Was man hier gewinnt, bezahlt man doppelt.“
    -> themen
* [Was diese Nacht ist]
    „Eine Jagdnacht.“ Er sagt es, als wäre es Wetter. „Dann verriegeln die Leute ihre Türen und hängen Räucherwerk vor die Fenster. Und die, die nicht mehr warten wollen, nehmen Fackeln und Mistgabeln und gehen selbst.“ Er senkt die Stimme. „Was ihnen da draußen begegnet, haben sie meistens gestern noch gegrüßt. Die Seuche macht aus Menschen Bestien. Wen es als Nächsten trifft, weiß keiner.“ # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Was bleiches Blut ist]
    Er denkt lange nach. „Das Wort kenne ich nicht. Aber Blut, Blut ist die Sache der Heilenden Kirche. Jede Transfusion in dieser Stadt geht durch ihre Hände. Ihr Blut, heißt es, kommt aus der großen Kathedrale da oben, wie Wasser aus einer Quelle.“ Er hustet. „Wenn einer weiß, was bleiches Blut ist, dann die. Und ob die es Ihnen sagen …“ Er hebt die Schultern. # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    -> themen
* {gilbert_bruecke} [Wie man zur Kirche kommt]
    { kleriker == "":
        „Nur über die große Brücke. Aber da oben haust etwas.“ Er lauscht, als könne er es jetzt hören. „Man sagt, es hat einmal in der Kirche gedient. Gesungen, gepredigt, ich weiß es nicht. Man sagt auch, aus Kirchenleuten werden die schlimmsten.“ Er bekreuzigt sich nicht. Er sieht nur sehr müde aus. # lore: kleriker_bestien
    - else:
        „Über die große Brücke.“ Er sieht dich an, dann auf deine Hände. „Aber das wissen Sie schon, nicht wahr. Sie waren dort. Ist es … ist es noch da oben?“ # lore: kleriker_bestien
    }
    -> themen
* {grund == "suche"} [Nach dem Menschen fragen, den du suchst]
    Du beschreibst ihn, so gut es durch ein Gitter geht, und erwähnst den letzten Brief, der nach Weihrauch roch. Gilbert schüttelt langsam den Kopf. „Nein. Hier kommt niemand vorbei, der stehen bleibt, außer Ihnen.“ Dann, nach einer Weile: „Weihrauch. Das riecht man nur oben, bei der Kathedrale. Da unten im Viertel ist es Räucherwerk, süß, Sie haben es gerochen. Weihrauch ist etwas anderes.“ # notiz: spur_vermisst
    -> themen
* {q_gilbert == 1 and k1_hub_c} [Ihm erzählen, was hinter der Brücke liegt]
    ~ q_gilbert = 2
    ~ gilbert = gilbert + 1
    Du erzählst ihm von der Brücke, den Treppen, der Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, von den Gräbern}. Gilbert hört zu, die Stirn gegen das Gitter gelehnt, und hustet die ganze Zeit nicht. „Gibt es da unten Bäume?“, fragt er, als du fertig bist. Du denkst nach und sagst ihm die Wahrheit: einen, verkrüppelt, an einer Treppe. „Einen“, sagt er zufrieden. „Das ist mehr, als ich hier habe.“ # quest: gilbert_bericht
    -> themen
+ [Gehen]
    { gilbert >= 0 and not gilbert_geschenk: -> geschenk }
    { gilbert < 0: Er hustet, als du gehst, und tut nicht so, als hätte er dich gehört. }
    { gilbert >= 0: „Gute Jagd“, sagt Gilbert, und er meint es. }
    -> k1_hub_b

= geschenk
~ gilbert_geschenk = true
~ feuer = true
„Warten Sie.“ Gilbert verschwindet vom Fenster. Du hörst ihn kramen, hörst etwas Schweres über Holz schleifen, und dann schiebt er dir durch die Lücke zwischen den Gitterstäben einen eisernen Behälter mit einem Schlauch und einer Düse. „Feuer. Bestien fürchten Feuer mehr als alles andere. Ich habe es nie benutzt. Ich dachte immer, eines Tages brauche ich es, und dann …“ Ein Hustenanfall schneidet den Satz ab, und er nimmt ihn nicht wieder auf. „Nehmen Sie es einfach.“ # notiz: bestien_feuer
{ gilbert >= 1:
    „Und noch etwas. Wenn Sie über die Brücke kommen, erzählen Sie mir, was dahinter liegt. Ich werde es nicht mehr selbst sehen.“ # quest: gilbert_bericht
    ~ q_gilbert = 1
}
-> k1_hub_b

=== k1_b_tueren ===
// TITEL: Türen mit Räucherlampen
// [KANON] Bürger hinter Türen: Fremdenhass, Angst, manche feiern. Die einsame alte Frau mit dem Hund am Weg zur Kanalisation.
// [ERWEITERT] Die fromme Stimme und Violas Spur (sie fragte nach dem Weg zu den Gräbern).
-> betreten("tueren") ->
{ k1_b_tueren == 1:
    Eine Gasse voller Türen, vor jeder eine rote Räucherlampe. Hinter manchen Türen ist es still. Hinter einer lacht jemand, laut und schrill, und mehrere Stimmen lachen mit, als feierten sie ein Fest, während draußen die Welt untergeht. # bild: tueren # stimmung: spannung
    Du klopfst. Eine Männerstimme fährt dich an: „Ein Fremder. Natürlich. Wer sonst klopft in einer Jagdnacht? Ihr habt sie doch gebracht, die Seuche, ihr mit eurem kranken Blut. Und jetzt wollt ihr rein.“ Ein Riegel wird vorgeschoben, dann ein zweiter. # lore: fremde # lore: raeucherwerk
- else:
    Die Gasse mit den Räucherlampen. Das Lachen hinter der einen Tür hat nicht aufgehört; es ist nur heiserer geworden. # stimmung: spannung
}
- (wahl)
* [Bei der alten Frau mit dem Hund klopfen]
    ~ alte_frau = true
    Am Ende der Gasse, dort, wo eine Treppe hinunter zu den Kanälen führt, liegt ein magerer Hund vor einer Tür und knurrt dich an, ohne aufzustehen. Hinter der Tür eine alte Stimme, brüchig und bitter. „Fremde. Nichts als Fremde. Und die Kirche lässt sie alle rein mit ihrem Blut, und dann wundert man sich.“ Ein Schniefen, dann wird die Stimme dünn. „Das Räucherwerk hält sie fern. Das Räucherwerk. Sonst hält gar nichts mehr irgendwas fern.“ # lore: raeucherwerk
    -> frau
* [An der Tür lauschen, hinter der jemand betet]
    Hinter einer Tür mit drei Lampen murmelt eine Frauenstimme ein Gebet, Silbe für Silbe, und unterbricht sich, als du näher kommst. „Gehen Sie weiter. Gott segne Sie, aber gehen Sie weiter.“ Sie klingt nicht feindselig, nur sehr müde. „Die Kirche hat uns das Räucherwerk gesegnet. Ohne die Kirche wären wir alle schon … Sie verstehen.“ # lore: heilende_kirche
    Dann, leiser, als rede sie mit sich selbst: „Da war vorhin schon eine. Eine Dame, mit so einer großen roten Brosche. Hat geklopft und nach dem Weg zu den Gräbern gefragt. Ich hab nicht aufgemacht.“ Die Silben fangen wieder an, schneller als zuvor. # notiz: viola_spur
    -> wahl
* [Einer Stimme drohen, bis sie redet]
    Du schlägst mit der Faust gegen eine Tür und sagst, was du mit dem Riegel tun wirst, wenn niemand antwortet. Eine junge Stimme, schnell vor Angst: „Die gehen selbst jagen, die Leute! Mit Fackeln und Gabeln. Am Scheiterhaufen auf der Hauptstraße verbrennen sie alles, was sie für eine Bestie halten, und Fremde halten sie fast immer dafür. Jetzt gehen Sie!“ Dann verflucht sie dich, mit Wörtern, die du nicht kennst. # lore: buergerjagd
    -> k1_hub_b
+ [Zurück]
    Du lässt die Türen hinter dir. Das Lachen folgt dir noch eine Weile.
    -> k1_hub_b

= frau
// [KANON] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr versprechen, einen sicheren Ort zu suchen]
    ~ alte_frau_versprochen = true
    Du sagst ihr, du würdest einen sicheren Ort finden und ihr Bescheid geben. Sie lacht, ein trockenes, hustendes Lachen. „Sicher. Natürlich.“ Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
* [Gehen]
    Der Hund sieht dir nach, bis du um die Ecke bist.
- -> k1_hub_b

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON] Scheiterhaufen mit brennender Bestie, Mob aus bewaffneten Bürgern; ein Riese mit Ziegelstein hämmert an eine Tür. Gascoignes Kappe gehört zu seinem Set.
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade, fragt nach deinem Namen und bittet um einen Gruß an seine Frau.
// Stimme Gascoigne (gesund): tief, ruhig, kurze Sätze, nennt Leute beim Namen, sagt „Fremder“, bis er deinen Namen hat; beendet Dinge mit „So.“
-> betreten("scheiterhaufen") ->
{ mob != "": -> danach }
Die Hauptstraße öffnet sich zu einem Platz, und auf dem Platz brennt ein Scheiterhaufen, so hoch wie ein Haus. Darauf, an einen Pfahl gebunden, hängt etwas Großes, Behaartes, das sich nicht mehr bewegt. Die Flammen haben sein Fell schwarz gefressen, und der Rauch, der aufsteigt, riecht süßlich und fett. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
Um das Feuer stehen Menschen. Ein Dutzend, vielleicht mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln, Beilen, einer mit einem alten Gewehr. Sie murmeln, alle zugleich und doch nicht zusammen, und das Murmeln klingt wie ein Gebet, dessen Worte man vergessen hat. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens.
Dann dreht sich der Erste zu dir um. Und dann alle. Ihre Augen glänzen im Feuerschein wie die Augen von Tieren. # kampf: mob
+ [Stehen bleiben und kämpfen] -> kampf
+ [In den Schatten um den Platz herum]
    ~ mob = "umgangen"
    Du drückst dich an die Hauswände, Schritt für Schritt. Dein Puls klopft dir bis in die Zähne. Fast hast du den Platz hinter dir, als ein Kind, das du nicht gesehen hast, mit dem Finger auf dich zeigt und schreit: „Fremder! Fremder!“
    -> gascoigne_greift_ein
+ [Zurück]
    Du ziehst dich zurück, bevor sie dich erreichen. Ihr Murmeln schwillt an, dann ebbt es wieder ab. Sie folgen dir nicht. Noch nicht.
    -> k1_hub_b

= kampf
- (t1)
Sie kommen von zwei Seiten zugleich. Ein hagerer Mann mit einer Mistgabel löst sich aus der Menge, holt aus und zielt auf deinen Bauch. # anzeichen: mobhieb
{ herkunft == "gesuchter": Eine Frau in der zweiten Reihe starrt dich an, als kenne sie dein Gesicht von einem Anschlag. Vielleicht tut sie das. }
+ [Zurückweichen, bis sie hintereinander stehen]
    Du gehst rückwärts in eine enge Gasse. Die Menge drängt nach, und auf einmal stehen sie sich selbst im Weg, Schulter an Schulter, die Mistgabeln verkeilt. Du triffst den Ersten, dann den Zweiten.
    -> t2
+ [Mitten hinein]
    Du stürzt dich in die Menge, und für einen Moment glaubst du, sie werde zurückweichen. Sie weicht nicht. Die Zinken der Mistgabel fahren dir in die Seite, ein Beil streift deinen Arm.
    ~ zuletzt = mobhieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Feuer in die Menge]
    Du hebst Gilberts Flammenwerfer, und eine Zunge aus Feuer fährt in die Menge. Sie schreien, nicht wie ein Mob, sondern wie einzelne, erschrockene Menschen, und sie stieben auseinander, in Gassen und Hauseingänge. Eine bleibt liegen. Ihre Schürze brennt noch, als sie schon still ist. Die Düse in deiner Hand ist warm.
    ~ mob = "zerstreut"
    ~ mob_verbrannt = true
    -> gascoigne_greift_ein
- (t2)
Mehr kommen. Und der Riese hat aufgehört, gegen die Tür zu schlagen. Er dreht sich langsam um, den Ziegel in der Faust, und dann rennt er, schwerfällig und unaufhaltsam, wie ein Fuhrwerk, dem die Pferde durchgegangen sind. # anzeichen: ansturm
+ [Dort durchbrechen, wo der Kreis am dünnsten ist]
    Du suchst die Lücke, findest sie und wirfst dich hindurch. Ein Ellbogen trifft dein Kinn, ein Stiefel dein Knie, aber du bist draußen, und hinter dir schlägt der Riese in die eigenen Leute.
    ~ zuletzt = ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ [Stehen und weiterkämpfen]
    Du bleibst stehen. Der Ziegel trifft dich an der Schulter, und die Welt wird für einen Augenblick weiß.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(1) -> t2

= gascoigne_greift_ein
// Wer Gascoigne schon zwischen den Gräbern gesehen hat, sieht ihn hier nicht mehr gesund: Er ist längst hinter dem Tor.
{ gascoigne2: -> ohne_ihn }
~ q_frau = 1
{ mob:
- "zerstreut":
    Ein Mann kommt über den Platz, zu spät für alles, groß und breitschultrig, in einem langen Jägermantel, eine Kappe tief in der Stirn und um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem geht er geradewegs auf die Frau zu, die liegen geblieben ist. Er kniet sich neben sie. Er nimmt ihre Hand, obwohl sie schwarz ist. „Martha“, sagt er. Nur das. # stimmung: grauen # lore: gascoigne
    Dann steht er auf, langsam, und wendet dir den Verband zu. „Gascoigne“, sagt er. „Ich jage hier. Seit vielen Jahren. Sie hat mir manchmal Brot gegeben, wenn ich spät kam.“ Er schweigt. „So.“
    ~ gascoigne = gascoigne - 1
- "durchbrochen":
    Hinter dir kracht ein Schuss, so laut, dass die Fensterscheiben zittern. Zwischen dich und die Verfolger tritt ein Mann, groß, breitschultrig, in einem langen Jägermantel, eine Kappe tief in der Stirn und um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem dreht er den Kopf, als sehe er jeden Einzelnen. In der einen Hand eine Axt, in der anderen eine rauchende Donnerbüchse. # stimmung: ruhig # lore: gascoigne
    „Martha“, sagt er, ruhig, tief, mit einem fremden Rollen in der Stimme. „Hennings. Brack, du alter Esel. Geht heim. Geht heim zu euren Kindern.“ Und sie gehen, einer nach dem anderen, die Fackeln gesenkt, und selbst der Riese trottet davon und zieht den Ziegel hinter sich her.
- else:
    Ein Schuss kracht über den Platz, so laut, dass die Fensterscheiben zittern. Zwischen dich und die Bürger tritt ein Mann, groß, breitschultrig, in einem langen Jägermantel, eine Kappe tief in der Stirn und um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem dreht er den Kopf, als sehe er jeden Einzelnen. In der einen Hand eine Axt, in der anderen eine rauchende Donnerbüchse. # stimmung: ruhig # lore: gascoigne
    „Martha“, sagt er, ruhig, tief, mit einem fremden Rollen in der Stimme. „Hennings. Brack, du alter Esel. Geht heim. Geht heim zu euren Kindern.“ Und sie gehen, einer nach dem anderen, die Fackeln gesenkt, und selbst der Riese trottet davon und zieht den Ziegel hinter sich her.
}
{ mob != "zerstreut":
    Dann wendet er sich dir zu und streckt dir die Hand hin. Sie ist warm und trocken und sehr groß. „Gascoigne. Pater, wenn man es genau nimmt, aber so nennt mich hier keiner. In dieser Stadt gibt es keine Pater. Nur Vikare und Jäger.“ Er legt den Kopf schief. „Und du bist auch nicht von hier, Fremder. Man hört es an deinen Stiefeln.“ # notiz: gascoigne_pater
    { herkunft == "soldat": „Und du gehst wie einer, der Gräben kennt“, fügt er hinzu. „Ich auch. Lange her.“ }
}
* [Ihm danken]
    ~ gascoigne = gascoigne + 1
    Du dankst ihm. Er winkt ab, aber seine Mundwinkel ziehen sich hoch. „Bedankt wird sich selten bei einem Jäger. Meistens macht man nur die Tür zu.“
* [Fragen, warum er einem Fremden hilft]
    ~ gascoigne = gascoigne + 1
    „Weil ich selbst einer war“, sagt er. „Und es manchmal vergesse. Damals hat mir auch jemand geholfen.“ Unter dem Verband lächelt er, warm und ein wenig schief.
* [Sagen, du hättest es allein geschafft]
    Er lacht, laut und herzlich, und schlägt dir auf die Schulter, genau auf die Stelle, die wehtut. „Natürlich. Natürlich hättest du das.“
- „Wie heißt du, Fremder?“
* [Ihm deinen Namen sagen]
    ~ gascoigne_name = true
    ~ gascoigne = gascoigne + 1
    „{name}“, wiederholt er, und es klingt in seinem Mund schwerer, als hätte er dem Namen ein Gewicht angehängt. „Gut. Den behalte ich.“
* [Nur „Jäger“ sagen]
    „Jäger.“ Er nickt, als sei das eine ehrliche Antwort. „Dann eben Fremder. Bis du es dir anders überlegst.“
- Er nimmt deine Feuerwaffe, wiegt sie in der Hand und gibt sie dir zurück. „Damit tötest du keine Bestie. Damit bringst du sie ins Wanken.“ Und dann zeigt er es dir, mitten auf dem Platz, mit dem Feuer im Rücken: das Warten, bis sie ausholt, bis das ganze Gewicht im Schlag liegt, und genau dann der Schuss. „Nicht davor. Nicht danach. Dann wankt sie, und dann gehört sie dir. So.“ # lore: parade
~ parade = true
~ parade_quelle = "gascoigne"
Er lehnt sich an einen Laternenpfahl, zieht eine flache Blechflasche aus dem Mantel und hält sie dir hin. „Gegen die Kälte. Und gegen das andere.“ Es ist Branntwein, scharf, mit einem Nachgeschmack nach Birne. Er trinkt nach dir und wischt den Hals der Flasche mit dem Ärmel ab, sorgfältig, wie ein Mann, der das zu Hause für jemanden tut. # notiz: gascoigne_flasche
Dann sagt er, beinahe verlegen: „Wenn du heute Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid: Sag ihr, ich komme bald. Sie macht sich immer Sorgen. Sie soll bei der Kleinen bleiben.“ # quest: gascoigne_frau
* [Versprechen, es auszurichten]
    ~ gascoigne = gascoigne + 1
    Du versprichst es. Er nickt, und etwas in seinen Schultern löst sich.
* [Nicken]
    Du nickst. Er scheint es zu sehen, trotz des Verbandes.
-
{ kleriker != "besiegt":
    // [ERWEITERT] Gascoigne glaubt, die Bestie auf der Brücke gekannt zu haben. Wer sie war, ist im Kanon [OFFEN]; hier nur seine Vermutung.
    „Und noch was.“ Er stößt sich vom Pfahl ab. „Wenn du zur großen Brücke gehst, ruf mich. Da oben haust einer, den ich, glaube ich, gekannt habe. Er hat Viola und mich getraut. Oder einer, der genauso gesungen hat.“ Er lacht, ein kurzes Lachen, das nicht ganz zu ihm passt, und geht in den Rauch. # quest: gascoigne_bruecke
- else:
    „Pass auf dich auf, {gascoigne_name:{name}|Fremder}.“ Er tippt an die Kappe und geht in den Rauch.
}
-> k1_hub_b

= ohne_ihn
// Gascoigne ist schon hinter dem Tor des Oedon. Der Schuss kommt aus dem Nebel; niemand tritt hervor.
Ein Schuss kracht über den Platz. Die Menge stiebt auseinander, als wüsste jeder Einzelne, wem dieser Knall gehört, und sie lassen dir eine Gasse frei. Niemand tritt aus dem Rauch hervor. Wo der Schuss herkam, ist nur Nebel, und auf dem Pflaster, frisch und dunkel, eine Spur von Stiefelabdrücken, die in Richtung der großen Brücke führt. Sie glänzen. # stimmung: grauen # notiz: blutige_spur
-> k1_hub_b

= danach
{ mob:
- "zerstreut": Der Platz ist leer. Verlassene Fackeln liegen auf dem Pflaster und rauchen. Jemand hat eine Decke über die Frau gelegt, die liegen geblieben ist, und auf die Decke einen Kanten Brot. Du weißt nicht, wer.
- else: Das Feuer ist heruntergebrannt, und doch hängt auf dem Pfahl wieder etwas, schwarz und still, als hätte die Nacht es neu aufgehängt. Du siehst nicht genauer hin.
}
-> k1_hub_b

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON] Gascoignes Tochter, Mutter (Viola) ging den Vater suchen; Spieluhr: das Lied ihres Vaters, das ihn an die Familie erinnert. Namen im Deckel. Sie erwähnt einen Großvater. Das rote Band gehört ihr.
// [ERWEITERT] Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation.
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat.
-> betreten("maedchen") ->
{ maedchen_wo == "fort": -> leer }
{ k1_b_maedchen > 1: -> wieder }
~ maedchen_gesehen = true
Hinter einem Tor liegt ein kleiner Platz mit einem versiegten Brunnen. Und mitten in all dem Rauch und Räucherwerk eine Melodie, dünn und klar wie Glas: eine Spieluhr. Sie spielt ein Lied, das du nicht kennst und das dir trotzdem den Hals eng macht, so wie es nur Lieder tun, die man als Kind gehört hat. # bild: brunnenplatz # stimmung: schoen
Die Melodie kommt aus einem Fenster im ersten Stock eines schmalen Hauses. Durch die Ritzen der Läden hängt das Ende eines roten Bandes, um den Riegel geknotet, wie ein Zeichen für jemanden, der den Weg nach Hause sucht. Als du näher kommst, verstummt die Melodie. „Bist du ein Jäger?“ # lore: familie_gascoigne
Zwischen den Läden erscheinen vier kleine Finger, dann zwei Augen, sehr ernst. „Papa ist auf die Jagd gegangen und nicht wiedergekommen. Und Mama ist gegangen, ihn zu suchen, und auch nicht wiedergekommen. Und Opa ist auch nicht da. Ich hab die Tür zugemacht, so wie Mama gesagt hat. Ich hab das Räucherwerk angezündet. Ich hab das Band rausgehängt, damit Mama das Fenster findet. Ich hab alles richtig gemacht.“
Dann, mit einem Trotz, der größer ist als sie: „Wenn Mama nicht bald kommt, geh ich selber und such sie.“ # notiz: maedchen_warnung
* [Versprechen, die Mutter zu finden]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    Du versprichst es ihr. Hinter den Läden ist es einen Moment still. Dann, ganz leise: „Danke.“
    -> spieluhr_geben
* [Fragen, woran du die Mutter erkennst]
    ~ q_mutter = 1
    „An der Brosche“, sagt sie sofort. „Mama trägt immer die große rote Brosche. Die sieht man von Weitem.“
    -> spieluhr_geben
* [Ihr raten, zu Iosefkas Klinik zu laufen, dort sei es sicher]
    -> fort
* [Gehen, ohne etwas zu versprechen]
    „Kommst du wieder?“, fragt sie, als du dich abwendest. Du antwortest nicht. Die Finger verschwinden aus dem Spalt.
    -> k1_hub_b

= spieluhr_geben
// [KANON] Inhalt sinngemäß, Wortlaut eigen.
Etwas schabt am Fensterbrett. Durch den Spalt zwischen den Läden kommt eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. „Das ist Papas Lied. Wenn Papa wieder komisch ist und uns nicht mehr kennt, spielen wir es ihm, und dann kennt er uns wieder. Mama hätte sie mitnehmen müssen. Sie liegt die ganze Zeit hier auf dem Tisch. Bring sie ihr.“ # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Du öffnest den Deckel. Auf der Innenseite klebt ein vergilbter Zettel mit zwei Namen, in einer feinen Schrift, deren V einen kleinen Kringel nach links macht: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Der Deckel bleibt offen in deiner Hand. Ein Mann mit verbundenen Augen und einem Priesterschal, eine Flasche, die nach Birne schmeckt, eine Frau mit einer roten Brosche, der du ausrichten sollst, dass er bald kommt. Du klappst den Deckel zu, und das Geräusch ist lauter, als es sein dürfte.
}
-> k1_hub_b

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
Du sagst ihr, sie solle zur Klinik laufen, dort gebe es eine Ärztin, dort sei sie sicher. # quest: maedchen_fort
„Wirklich?“ Sie zögert. Dann hörst du ihre Schritte auf einer Treppe, einen Riegel, einen zweiten, das Knarren einer Haustür. Ein kleiner Schatten huscht über den Platz, und an der Ecke bleibt er stehen und sieht die Treppe hinunter, die zu den Kanälen führt, in die Richtung, in die ihre Mutter gegangen ist. Dann ist er fort. Das rote Band hängt nicht mehr am Riegel.
-> k1_hub_b

= wieder
{ q_mutter == 1:
    Das Mädchen hört dich, bevor du klopfst. „Hast du Mama gefunden?“ In der Frage ist so viel Hoffnung, dass du kurz die Augen schließt.
- else:
    Die Finger erscheinen wieder zwischen den Läden. „Du bist ja doch gekommen. Hast du Mama gesehen? Suchst du sie?“
}
+ [Noch nicht]
    „Noch nicht“, sagst du. „Dann warte ich noch“, sagt sie. „Ich kann gut warten.“
    -> k1_hub_b
+ {not spieluhr} [Ihr versprechen, die Mutter zu suchen]
    ~ q_mutter = 1
    ~ maedchen = maedchen + 1
    Diesmal versprichst du es.
    -> spieluhr_geben
+ {not spieluhr and q_mutter == 0} [Ihr raten, zu Iosefkas Klinik zu laufen]
    -> fort

= leer
Das Fenster im ersten Stock ist dunkel. Die Haustür steht einen Spalt offen und bewegt sich, und drinnen brennt das Räucherwerk herunter, für niemanden. # stimmung: grauen
-> k1_hub_b

=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel.
-> betreten("daecher") ->
{ schuetze == "erledigt":
    Die Gasse ist ruhig. Oben in der Dachrinne liegen ein paar Patronenhülsen, und der Wind spielt mit ihnen.
    -> k1_hub_b
}
{ schuetze_verschont:
    Die Gasse ist ruhig. Oben hinter dem Schornstein sitzt der Alte ohne Gewehr und zählt seine Kiesel. Er sieht nicht auf.
    -> k1_hub_b
}
Eine enge Gasse, so schmal, dass du die Hauswände zu beiden Seiten berühren könntest. Über dir hängen Dachrinnen, zerbrochene Fensterläden, Wäscheleinen, an denen nichts mehr hängt. Kein Geräusch, nicht einmal Tauben. Es riecht nach Schießpulver. # bild: gasse # stimmung: spannung
+ {not schuetze_gesehen} [Langsam, die Dächer im Blick]
    Du gehst langsam, Schritt für Schritt, den Blick nach oben. Und da: hinter einem Schornstein, kaum mehr als ein Umriss, ein alter Mann, gebeugt, mit einer Schlafmütze auf dem Kopf und einem Gewehr in den Händen, das länger ist als er selbst. Er hat dich noch nicht gesehen. Er zielt auf die Stelle der Gasse, durch die du gerade hättest laufen sollen. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
+ {not schuetze_gesehen} [Schnell hindurch]
    Du läufst los. Auf halbem Weg kracht hinter dir ein Schuss, und etwas Heißes fährt dir in die Schulter, bevor du überhaupt begreifst, woher er kam. Du stolperst, fängst dich, drehst dich um: Auf dem Dach hinter dir, hinter einem Schornstein, lädt ein alter Mann mit zitternden Händen sein Gewehr nach. Er kichert dabei. # klang: schuss
    ~ zuletzt = schuss
    ~ schuetze_gesehen = true
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> oben
+ {schuetze_gesehen} [Wieder zu dem Alten mit dem Gewehr] -> oben
+ [Umkehren]
    Du kehrst um. Irgendwo über dir knirscht ein Dachziegel.
    -> k1_hub_b

= oben
+ [Hinaufklettern und ihn stellen]
    Eine Regenrinne, ein Fenstersims, ein Balken. Als du oben bist, versucht er nachzuladen, aber seine Finger sind zu alt und zu eilig. Er sieht zu dir hoch, und in seinen Augen ist keine Angst, nur eine wirre, kindliche Freude, als sei das alles ein Spiel, das er gleich gewinnt. Neben ihm auf dem Sims liegen Kieselsteine, sorgfältig in Reihen gelegt, immer fünf und fünf, so wie man Tage zählt. # stimmung: kampf
    -> schuetze_wahl
+ [In Deckung zurück zur Straße]
    Du drückst dich in einen Hauseingang und wartest, bis du sicher bist, dass er nicht mehr zielt. Dann gehst du zurück.
    -> k1_hub_b

= schuetze_wahl
* [Ihm das Gewehr abnehmen und gehen]
    ~ schuetze_verschont = true
    Du nimmst ihm das Gewehr aus den Händen. Er lässt es los wie ein Kind ein Spielzeug, das ihm ohnehin langweilig geworden ist, und beginnt, seine Kiesel neu zu zählen. Das Gewehr wirfst du in den Hof. Zwei Kiesel und eine Flasche mit Öl und einem Lappen im Hals nimmst du mit. Er protestiert nicht. # notiz: kiesel
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    -> k1_hub_b
* [Es beenden]
    Es ist schnell vorbei. Er macht dabei einen kleinen, überraschten Laut. Unter der Schlafmütze ist sein Haar sorgfältig gekämmt, mit Wasser angelegt, wie jemand es für den Sonntag tut. Seine Kiesel nimmst du mit, und eine Flasche mit Öl und einem Lappen im Hals: ein Molotow. # notiz: kiesel
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    ~ echos = echos + 1
    -> k1_hub_b

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON] Eileen auf einem Dach über dem Kanaleingang, Jägerin der Jäger, gibt Jägermarken. Nächstes Treffen im Original vor der Kapelle (Kapitel 2).
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und Henryk. Die Partnerschaft beginnt erst in Kapitel 2. Die Abzeichen an der Schnur.
// Stimme: heiser, sehr kurz, Sätze ohne Anlauf; beantwortet Fragen mit Gegenfragen oder gar nicht.
-> betreten("eileen") ->
{ eileen_stufe >= 1:
    Auf den Dachbalken ist niemand mehr. Nur eine schwarze Feder liegt dort, wo sie saß.
    -> k1_hub_b
}
~ eileen_stufe = 1
Über dem Eingang zur Kanalisation führen alte Dachbalken von Haus zu Haus, und auf ihnen, halb verborgen hinter ein paar Fässern, sitzt jemand, so still, dass du ihn für einen Haufen alter Kleider gehalten hättest, wenn er nicht den Kopf gedreht hätte. # bild: daecher_eileen # stimmung: ruhig
Es ist eine Frau. Sie trägt einen Mantel aus schwarzen Federn, die leise rascheln, und vor dem Gesicht eine Maske mit einem langen, gebogenen Schnabel, wie die Pestärzte sie in alten Holzschnitten tragen. Um ihren Hals hängt eine Schnur, an der kleine Abzeichen klappern, Messing, Silber, Eisen, jedes anders, jedes abgegriffen. Sie sieht dich lange an. „Neu“, sagt sie. Nicht als Frage. „Riecht man.“
* [Nach den Abzeichen fragen]
    Sie fasst die Schnur mit zwei Fingern und lässt die Abzeichen durch die Hand laufen, eins nach dem anderen, wie Perlen beim Beten. „Jäger“, sagt sie. „Die nicht mehr wussten, was sie jagen.“ Sie lässt die Schnur fallen. „Irgendwer muss sie heimbringen. Eileen.“ Erst nach einem Atemzug merkst du, dass das ihr Name war. # lore: jaeger_der_jaeger # lore: blutrausch
    ~ eileen = eileen + 1
* [Misstrauisch bleiben]
    Du hältst die Hand am Griff deiner Waffe. Sie bemerkt es und nickt, beinahe zufrieden. „Gut. Misstrauen hält länger als Mut.“ Sie klopft gegen die Abzeichen an ihrer Schnur. „Die hier waren mutig. Eileen.“ # lore: jaeger_der_jaeger # lore: blutrausch
* [Ihr sagen, sie solle sich um ihren Kram kümmern]
    ~ eileen = eileen - 1
    Sie lacht, ein kurzes, raues Krächzen. „Mach ich. Genau das mach ich.“ Die Abzeichen klappern. Sie sagt dir ihren Namen nicht; du hörst ihn später von anderen. # lore: jaeger_der_jaeger # lore: blutrausch
- Sie greift in ihren Mantel und wirft dir zwei kleine, abgegriffene Marken zu, aus Messing, mit einem eingeprägten Zeichen. „Zerdrücken, und du wachst im Garten auf. Ohne vorher zu sterben. Für den Fall, dass deine Beine zu langsam sind.“ # notiz: jaegermarke
~ jaegermarken = 2
// [ERWEITERT] Eileen kennt den Garten. PRÜFEN: Was Eileen im Kanon über den Traum weiß.
Du hast niemandem von dem Garten erzählt. „Du kennst den Garten?“ Sie antwortet nicht. Sie rückt nur die Maske zurecht.
Dann, beiläufig, als ginge es um nichts: „Ein Pater. Groß, Verband über den Augen. Schon gesehen?“ # notiz: eileen_frage
* {q_frau == 1} [Ja, und er hat dir geholfen; du verteidigst ihn]
    ~ gascoigne = gascoigne + 1
    Du erzählst ihr, wie er dich vor dem Mob gerettet hat, wie er die Bürger beim Namen nannte. Eileen unterbricht dich nicht. „Hoffentlich bleibt er so“, sagt sie dann. „Er und Henryk, sein alter Partner. Zu lange zusammen draußen. Zu viele Nächte.“ Sie zählt nicht weiter. # notiz: henryk
* {q_frau == 1} [Ja; du sagst ihr, wo du ihn gesehen hast]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Du sagst ihr, wo du ihn getroffen hast und in welche Richtung er gegangen ist. Sie nickt, langsam. Eine ihrer Hände findet die Schnur mit den Abzeichen und hält sie fest. „Danke“, sagt sie. „Ist richtig so.“ Ihre Stimme klingt nicht, als glaube sie es. # notiz: verrat_gascoigne
* {q_frau == 1} [Nein]
    „Nein.“ Sie nickt, als habe sie diese Antwort erwartet und glaube sie nur halb.
* {q_frau == 0} [Nein]
    ~ eileen_frage_offen = true
    „Nein.“ Sie neigt den Schnabel. „Wirst du. Merk dir, wie er riecht.“
- Dann steht sie auf, breitet den Mantel aus wie Flügel, und ist mit einem Sprung auf dem nächsten Dach. „Jäger sehen sich wieder“, ruft sie, ohne sich umzudrehen. „Meistens zu spät.“ # quest: eileen_treffen
-> k1_hub_b
