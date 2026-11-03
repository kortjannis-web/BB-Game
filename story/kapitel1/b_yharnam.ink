// KAPITEL 1, TEIL B: ZENTRAL-YHARNAM. Freie Reihenfolge. Führt zu NADELÖHR 1 (Brücke).

=== k1_hub_b ===
// TITEL: Zentral-Yharnam (frei)
-> betreten("zentral") ->
{ k1_hub_b == 1:
    Yharnam ist eine Stadt aus Treppen. Sie steigen und fallen zwischen Häusern, deren Fassaden sich nach vorn neigen, als lauschten sie, und über den Dächern hängt ein Rauch, der sich nicht verzieht. Irgendwo in der Ferne läuten Glocken, unregelmäßig, als zöge niemand an den Seilen. Unten in den Straßen wandern Fackeln. # bild: zentral_yharnam # stimmung: spannung # lore: jagdnacht
    Vor vielen Fenstern hängen kleine Laternen mit rotem Glas, in denen Räucherwerk schwelt. Der Geruch ist süß und schwer, und er liegt über allem wie ein Tuch über einem Gesicht. Er soll die Bestien fernhalten, begreifst du, und daran, wie dicht die Lampen hängen, erkennst du, wie sehr man in dieser Stadt Angst hat. # lore: raeucherwerk
    Es ist eine Jagdnacht. Du weißt nicht, was das bedeutet, aber die ganze Stadt scheint es zu wissen und den Atem anzuhalten.
- else:
    {~Die Laterne brennt, und die Straßen von Zentral-Yharnam liegen vor dir, nass und glänzend wie die Haut eines Tieres.|Der Rauch über den Dächern hat sich nicht bewegt. Irgendwo bellt ein Hund und hört mitten im Bellen auf.|Wieder die Laterne, wieder das Räucherwerk. Eine Glocke schlägt, dann noch eine, und dann ist es so still, dass du dein eigenes Blut hörst.|Fackeln ziehen in einer fernen Straße vorbei, und jemand singt dazu ein Lied, das klingt wie ein Kinderlied und keines ist.}
}
// Das Kreischen der Kleriker-Bestie, zweimal, bevor man ihr begegnet.
{ kleriker == "" and (k1_hub_b == 3 or k1_hub_b == 6):
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
+ [An der Laterne in den Traum] -> traum_von_laterne
+ [Zur großen Brücke] -> k1_n1_kleriker

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
// [KANON] Kranker Fremder hinter dem Fenster bei der ersten Laterne; verweist auf die Heilende Kirche und die Brücke; wird nach dem Blutmond zur Bestie.
// [ERWEITERT] Mehr Gespräch, seine Bitte. Sein Feuer gibt er hier schon (im Original später). PRÜFEN: Zeitpunkt der Übergabe.
-> betreten("gilbert") ->
{ k1_b_gilbert == 1:
    Neben der Laterne, hinter einem vergitterten Fenster, hustet jemand. Es ist ein Husten, der tief unten sitzt, nass und rasselnd, und der klingt, als habe er seinen Besitzer schon lange vor dieser Nacht bewohnt. # bild: gilbert # stimmung: ruhig
    Hinter dem Gitter erscheint ein Gesicht, eingefallen, mit fiebrigen, freundlichen Augen. Du bist ein Jäger, nicht wahr, sagt der Mann, und ein Fremder, das höre er an deinem Schritt. Er auch. Er heißt Gilbert. Das Blut dieser Stadt, sagt er, und lächelt schief, kaufe ihm nur Zeit, nichts weiter. # lore: fremde # lore: bluttransfusion
- else:
    Gilbert ist am Fenster, bevor du anklopfst. Er höre dich kommen, sagt er; er habe sonst nicht viel zu tun, als zu hören.
}
-> themen

= themen
* [Wer er ist]
    Gilbert erzählt, stockend, zwischen den Hustenanfällen. Eine Krankheit, die kein Arzt in seiner Heimat benennen konnte. Ein Gerücht über Yharnam. Eine lange Reise. Das Blut habe geholfen, für eine Weile, und dann habe es aufgehört zu helfen, und jetzt sitze er hier und zähle die Nächte. Er rät dir, die Stadt zu verlassen, sobald du kannst. Was immer man hier gewinne, sagt er, koste mehr, als es wert sei.
    -> haltung
* [Was diese Nacht ist]
    Eine Jagdnacht, sagt er. In solchen Nächten verriegeln die Bürger ihre Türen und hängen Räucherwerk vor die Fenster, und die, die nicht mehr warten wollen, nehmen Fackeln und Mistgabeln und gehen selbst hinaus. Was ihnen begegnet, sagt er leiser, sei meistens jemand, den sie gestern noch gegrüßt haben. Die Seuche mache aus Menschen Bestien, und niemand wisse, wen es als Nächstes treffe. # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Was bleiches Blut ist]
    Er denkt lange nach. Das Wort kenne er nicht. Aber wenn es um Blut gehe, dann wisse die Heilende Kirche alles darüber, was man wissen könne, und wahrscheinlich mehr, als man wissen sollte. Sie verwalte jedes Blut in dieser Stadt, jede Transfusion, jedes Geheimnis. Ihr Sitz liege oben im Kathedralenbezirk, über der Stadt. # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    -> themen
* {gilbert_bruecke} [Wie man zur Kirche kommt]
    Nur über die große Brücke, sagt er. Aber auf der Brücke hause etwas. Man höre es manchmal, nachts, wenn der Wind richtig stehe. Die Leute sagen, es habe einmal in der Kirche gedient, gesungen vielleicht, gepredigt. Und dass ausgerechnet die Kirchenleute zu den schlimmsten Bestien würden. Er bekreuzigt sich nicht. Er sieht nur sehr müde aus. # lore: kleriker_bestien
    -> themen
* {q_gilbert == 1 and k1_hub_c} [Ihm erzählen, was hinter der Brücke liegt]
    ~ q_gilbert = 2
    ~ gilbert = gilbert + 1
    Du erzählst ihm von der Brücke, den Treppen, den Gräbern. Gilbert hört zu, die Stirn gegen das Gitter gelehnt, und hustet die ganze Zeit nicht. Als du fertig bist, dankt er dir, als hättest du ihm etwas geschenkt, das man nicht kaufen kann. # quest: gilbert_bericht
    -> themen
+ [Gehen]
    Gilbert wünscht dir eine gute Jagd. Es klingt nicht wie eine Floskel.
    -> k1_hub_b

= haltung
* [Ihm deinen Namen sagen und zuhören]
    ~ gilbert = gilbert + 1
    Du sagst ihm deinen Namen, {name}, und bleibst, bis er ausgehustet hat. Er wiederholt den Namen leise, als wolle er ihn behalten für die Zeit, in der niemand mehr vor seinem Fenster stehen wird.
* [Knapp bleiben]
    Du nickst nur. Er versteht. Jäger, sagt er, seien selten gesprächig.
* [Ihn anfahren, er solle dich in Ruhe lassen]
    ~ gilbert = gilbert - 2
    Du sagst ihm, er solle seinen Husten für sich behalten. Er zieht sich vom Gitter zurück. Lange ist es still, und dann hustet er wieder, gedämpft, als halte er sich etwas vor den Mund.
- { gilbert >= 0: -> geschenk }
-> themen

= geschenk
~ feuer = true
Gilbert verschwindet vom Fenster. Du hörst ihn kramen, hörst etwas Schweres über Holz schleifen, und dann schiebt er dir durch die Lücke zwischen den Gitterstäben einen eisernen Behälter mit einem Schlauch und einer Düse. Feuer, sagt er. Bestien fürchten Feuer, mehr als alles andere. Er selbst habe es nie benutzt. Er habe immer gedacht, er würde es eines Tages brauchen, und dann sei ihm klar geworden, dass der Tag, an dem er es brauche, der Tag sein werde, an dem er nicht mehr der sei, der es benutzen könne. # notiz: bestien_feuer
{ gilbert >= 1:
    Und noch etwas, sagt er. Wenn du über die Brücke kommst, erzähl ihm, was dahinter liegt. Er werde es nicht mehr selbst sehen. # quest: gilbert_bericht
    ~ q_gilbert = 1
}
-> themen

=== k1_b_tueren ===
// TITEL: Türen mit Räucherlampen
// [KANON] Bürger hinter Türen: Fremdenhass, Angst, manche feiern. Die einsame alte Frau mit dem Hund am Weg zur Kanalisation.
-> betreten("tueren") ->
Eine Gasse voller Türen, vor jeder eine rote Räucherlampe. Hinter manchen Türen ist es still. Hinter einer lacht jemand, laut und schrill, und mehrere Stimmen lachen mit, als feierten sie ein Fest, während draußen die Welt untergeht. # bild: tueren # stimmung: spannung
Du klopfst. Eine Männerstimme fährt dich an: Ein Fremder, natürlich, wer sonst klopfe in einer Jagdnacht. Ihr habt die Seuche gebracht, ihr mit eurem kranken Blut, und jetzt wollt ihr auch noch hereingelassen werden. Ein Riegel wird vorgeschoben, dann ein zweiter. # lore: fremde # lore: raeucherwerk
* [Bei der alten Frau mit dem Hund klopfen]
    Am Ende der Gasse, dort, wo eine Treppe hinunter zu den Kanälen führt, liegt ein magerer Hund vor einer Tür und knurrt dich an, ohne aufzustehen. Hinter der Tür eine alte Frauenstimme, brüchig und bitter. Fremde, sagt sie, nichts als Fremde, und die Kirche lasse sie alle herein mit ihrem Blut, und dann wundere man sich. Dann weint sie, plötzlich, und du weißt nicht, worüber. Das Räucherwerk, sagt sie, das Räucherwerk halte sie fern. Sonst nichts. Sonst halte gar nichts mehr irgendetwas fern. # lore: raeucherwerk
    ~ alte_frau = true
    -> frau
* [Einer Stimme drohen, bis sie redet]
    Du schlägst mit der Faust gegen eine Tür und sagst, was du mit dem Riegel tun wirst, wenn niemand antwortet. Eine junge Stimme, voller Angst: Die Bürger selbst gingen auf die Jagd, sagt sie, mit Fackeln und Mistgabeln, und am Scheiterhaufen auf der Hauptstraße verbrennen sie alles, was sie für eine Bestie halten, und Fremde halten sie fast immer dafür. Dann verflucht sie dich, mit Worten, die du nicht kennst, die aber klingen, als meine sie es ernst. # lore: buergerjagd
    -> k1_hub_b
+ [Zurück]
    Du lässt die Türen hinter dir. Das Lachen folgt dir noch eine Weile.
    -> k1_hub_b

= frau
// [KANON] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr versprechen, einen sicheren Ort zu suchen]
    Du sagst ihr, du würdest einen sicheren Ort finden und ihr Bescheid geben. Sie lacht verächtlich, ein trockenes, hustendes Lachen. Sicher, sagt sie. Aber der Hund hört auf zu knurren, und als du gehst, hörst du, wie sie hinter der Tür murmelnd etwas wiederholt, als wolle sie es sich merken. # quest: alte_frau_ort
* [Gehen]
    Der Hund sieht dir nach, bis du um die Ecke bist.
- -> k1_hub_b

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON] Scheiterhaufen mit brennender Bestie, Mob aus bewaffneten Bürgern; ein Riese mit Ziegelstein hämmert an eine Tür.
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade und bittet um einen Gruß an seine Frau.
-> betreten("scheiterhaufen") ->
{ mob != "": -> danach }
Die Hauptstraße öffnet sich zu einem Platz, und auf dem Platz brennt ein Scheiterhaufen, so hoch wie ein Haus. Darauf, an einen Pfahl gebunden, hängt etwas Großes, Behaartes, das sich nicht mehr bewegt. Die Flammen haben sein Fell schwarz gefressen, und der Rauch, der aufsteigt, riecht süßlich und fett. # bild: scheiterhaufen # stimmung: spannung # lore: buergerjagd
Um das Feuer stehen Menschen. Ein Dutzend, vielleicht mehr, Männer und Frauen in Mänteln und Schürzen, mit Fackeln, Mistgabeln, Beilen, einer mit einem alten Gewehr. Sie murmeln, alle zugleich und doch nicht zusammen, und das Murmeln klingt wie ein Gebet, dessen Worte man vergessen hat. Am Rand des Platzes steht ein Riese von einem Mann, nackt bis zur Hüfte, und schlägt mit einem Ziegelstein gegen eine Doppeltür, immer wieder, im Takt eines Herzens.
Dann dreht sich der Erste zu dir um. Und dann alle. Ihre Augen glänzen im Feuerschein wie die Augen von Tieren. # kampf: mob
+ [Stehen bleiben und kämpfen] -> kampf
+ [In den Schatten um den Platz herum]
    ~ mob = "umgangen"
    Du drückst dich an die Hauswände, Schritt für Schritt, das Herz bis in die Kehle. Fast hast du den Platz hinter dir, als ein Kind, das du nicht gesehen hast, mit dem Finger auf dich zeigt und schreit: Fremder! Fremder!
    -> gascoigne_greift_ein
+ [Zurück]
    Du ziehst dich zurück, bevor sie dich erreichen. Ihr Murmeln schwillt an, dann ebbt es wieder ab. Sie folgen dir nicht. Noch nicht.
    -> k1_hub_b

= kampf
- (t1)
Sie kommen von zwei Seiten zugleich. Ein hagerer Mann mit einer Mistgabel löst sich aus der Menge, holt aus und zielt auf deinen Bauch. # anzeichen: mobhieb
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
    Du hebst Gilberts Flammenwerfer, und eine Zunge aus Feuer fährt in die Menge. Sie schreien, nicht wie ein Mob, sondern wie einzelne, erschrockene Menschen, und sie stieben auseinander, in Gassen und Hauseingänge, bis der Platz leer ist bis auf das brennende Ding auf dem Pfahl und dich. Du stehst da, die Düse noch warm in der Hand, und weißt nicht, ob du dich schämen sollst.
    ~ mob = "zerstreut"
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
    Du bleibst stehen. Es ist ein Fehler. Der Ziegel trifft dich an der Schulter, und die Welt wird für einen Augenblick weiß.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(1) -> t2

= gascoigne_greift_ein
~ q_frau = 1
Ein Schuss kracht über den Platz, so laut, dass die Fensterscheiben zittern. Zwischen dich und die Bürger tritt ein Mann. Er ist groß, breitschultrig, in einen langen Jägermantel gehüllt, um den Hals einen schmutzigen Schal, wie ihn Priester tragen. Um seine Augen ist ein Verband gewickelt, und trotzdem dreht er den Kopf, als sehe er jeden Einzelnen von ihnen. In der einen Hand hält er eine Axt, in der anderen eine rauchende Donnerbüchse. # stimmung: ruhig # lore: gascoigne
Er sagt nichts Drohendes. Er ruft sie beim Namen. Martha. Hennings. Der alte Brack. Geht nach Hause, sagt er, mit einer tiefen, ruhigen Stimme, in der ein fremder Akzent liegt. Geht nach Hause zu euren Kindern. Und sie gehen. Einer nach dem anderen senken sie die Fackeln und verschwinden in den Gassen, und selbst der Riese trottet davon, den Ziegel hinter sich herziehend.
Dann wendet er sich dir zu. Gascoigne, sagt er und reicht dir die Hand. Pater Gascoigne, wenn man es genau nimmt, aber hier nenne ihn niemand mehr so; in dieser Stadt gebe es keine Pater, nur Vikare und Jäger. Er komme von weit her, so wie du. Er jage seit vielen Jahren. # notiz: gascoigne_pater
* [Ihm danken]
    ~ gascoigne = gascoigne + 1
    Du dankst ihm. Er winkt ab, aber du siehst, dass es ihm gefällt. Man bedanke sich selten bei einem Jäger, sagt er. Meistens schließe man nur die Tür.
* [Fragen, warum er einem Fremden hilft]
    Weil er selbst einmal einer war, sagt er, und es manchmal vergesse. Weil ihm damals auch jemand geholfen habe. Er lächelt unter dem Verband, und das Lächeln ist warm und ein wenig traurig.
    ~ gascoigne = gascoigne + 1
* [Sagen, du hättest es allein geschafft]
    Er lacht, laut und herzlich, und schlägt dir auf die Schulter, genau auf die Stelle, die wehtut. Natürlich, sagt er. Natürlich hättest du das.
- Er nimmt deine Feuerwaffe, wiegt sie in der Hand und gibt sie dir zurück. Damit töte man keine Bestie, sagt er, damit bringe man sie ins Wanken. Und dann zeigt er es dir, mitten auf dem verlassenen Platz, mit dem Feuer im Rücken: Man wartet, bis sie ausholt, bis das ganze Gewicht in den Schlag geht, und genau dann schießt man. Nicht davor. Nicht danach. Dann wankt sie, und dann gehört sie dir. # lore: parade
~ parade = true
Er lehnt sich an einen Laternenpfahl und atmet tief durch. Für einen Augenblick wirkt er sehr alt. Dann sagt er, beinahe verlegen: Wenn du in dieser Nacht einer Frau begegnest, mit einer großen roten Brosche am Kleid, dann richte ihr aus, er komme bald nach Hause. Sie mache sich immer Sorgen. Sie solle bei den Kindern bleiben. # quest: gascoigne_frau
* [Versprechen, es auszurichten]
    ~ gascoigne = gascoigne + 1
    Du versprichst es. Er nickt, und etwas in seinen Schultern löst sich.
* [Nicken]
    Du nickst. Er scheint es zu sehen, trotz des Verbandes.
- Und noch etwas, sagt er im Gehen. Wenn du zur großen Brücke gehst, dann ruf ihn. Dort hause eine, die er schon sehr lange kenne. Er lacht, ein kurzes, merkwürdiges Lachen, das nicht ganz zu ihm passt, und verschwindet im Rauch. # quest: gascoigne_bruecke
-> k1_hub_b

= danach
{ mob:
- "zerstreut": Der Platz ist leer. Verlassene Fackeln liegen auf dem Pflaster und rauchen, und auf dem Scheiterhaufen ist von der Bestie nur ein schwarzes Gerippe geblieben. Der Riese ist fort. Die Doppeltür, gegen die er geschlagen hat, ist an einer Stelle gesplittert, und dahinter ist es dunkel.
- else: Der Mob hat sich verlaufen. Das Feuer ist heruntergebrannt, und in der Glut knackt es manchmal, als bewege sich darin noch etwas. Du siehst nicht hin.
}
-> k1_hub_b

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON] Gascoignes Tochter, Mutter (Viola) ging den Vater suchen; Spieluhr: Papas Lied, wenn er sie vergisst. Namen im Deckel. Sie erwähnt einen Großvater.
// [ERWEITERT] Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation.
-> betreten("maedchen") ->
{ maedchen_wo == "fort": -> leer }
{ k1_b_maedchen > 1: -> wieder }
Hinter einem Tor liegt ein kleiner Platz mit einem versiegten Brunnen. Und mitten in all dem Rauch und Räucherwerk hörst du eine Melodie, dünn und klar wie Glas: eine Spieluhr. Sie spielt ein Lied, das du nicht kennst und das dir trotzdem das Herz zusammenzieht, so wie es nur Lieder tun, die man als Kind gehört hat. # bild: brunnenplatz # stimmung: schoen
Die Melodie kommt aus einem Fenster im ersten Stock eines schmalen Hauses. Als du näher kommst, verstummt sie, und eine Kinderstimme flüstert durch die Ritzen der Läden: Bist du ein Jäger? # lore: familie_gascoigne
Es ist ein Mädchen, du kannst sie nicht sehen, nur hören, und sie spricht in dem schnellen, ernsten Ton von Kindern, die zu lange allein waren. Papa, sagt sie, ist auf die Jagd gegangen und nicht wiedergekommen. Und Mama ist gegangen, ihn zu suchen, und auch nicht wiedergekommen. Und Opa sei auch nicht da. Sie habe die Tür verriegelt, so wie Mama es gesagt habe. Sie habe das Räucherwerk angezündet. Sie habe alles richtig gemacht.
Wenn Mama nicht bald kommt, sagt sie dann, mit diesem Trotz, den nur Kinder haben, dann gehe sie selbst und suche sie. # notiz: maedchen_warnung
* [Versprechen, die Mutter zu finden]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    Du versprichst es ihr. Hinter den Läden ist es einen Moment still, und dann sagt sie ganz leise: Danke.
    -> spieluhr_geben
* [Fragen, woran du die Mutter erkennst]
    ~ q_mutter = 1
    An der Brosche, sagt sie sofort. Mama trägt immer die große rote Brosche. Man sieht sie von Weitem.
    -> spieluhr_geben
* [Ihr raten, zu Iosefkas Klinik zu laufen, dort sei es sicher]
    -> fort

= spieluhr_geben
Etwas schabt am Fensterbrett. Durch einen Spalt zwischen den Läden schiebt sie dir eine kleine Spieluhr, kaum größer als deine Handfläche, aus Holz und abgegriffenem Messing. Das ist Papas Lied, sagt sie. Manchmal vergisst Papa uns. Dann spielen wir es ihm vor, und dann weiß er wieder, wer wir sind. Mama hat sie dummerweise vergessen. Bring sie ihr. # lore: spieluhr # stimmung: schoen
~ spieluhr = true
Du öffnest den Deckel. Auf der Innenseite klebt ein vergilbter Zettel mit zwei Namen, in einer feinen, verblassten Schrift: Viola. Gascoigne. # lore: familie_gascoigne
{ q_frau == 1:
    Du stehst sehr still. Du denkst an einen Mann mit verbundenen Augen und einem Priesterschal, an seine ruhige Stimme, an eine Frau mit einer roten Brosche, der du ausrichten sollst, dass er bald nach Hause kommt. Du klappst den Deckel zu, und das Geräusch ist lauter, als es sein dürfte.
}
-> k1_hub_b

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
Du sagst ihr, sie solle zur Klinik laufen, dort gebe es eine Ärztin, dort sei sie sicher. Du sagst es, weil es leichter ist, als hier zu stehen und zu überlegen, was man mit einem Kind tut, das allein in einer Jagdnacht hinter einem Fenster sitzt. # quest: maedchen_fort
Sie zögert. Dann hörst du ihre Schritte auf einer Treppe, ein Riegel, ein zweiter, das Knarren einer Haustür. Ein kleiner Schatten huscht über den Platz, in Richtung der Treppen, die zu den Kanälen führen, weil das der kürzeste Weg ist. Sie hat dir die Spieluhr nicht gegeben. Du hast nicht danach gefragt.
Erst als sie fort ist, fällt dir ein, was Iosefka gesagt hat: dass sie in dieser Nacht niemanden einlässt.
-> k1_hub_b

= wieder
{ q_mutter == 1:
    Das Mädchen hört dich, bevor du klopfst. Hast du Mama gefunden, fragt sie, und in der Frage ist so viel Hoffnung, dass du kurz die Augen schließen musst.
- else:
    Die Stimme hinter den Läden fragt wieder nach ihrer Mutter. Ob du sie gesehen hast. Ob du sie suchen wirst.
}
+ [Noch nicht]
    Noch nicht, sagst du. Sie sagt, dann warte sie eben noch ein bisschen. Sie sei gut im Warten.
    -> k1_hub_b
+ {not spieluhr} [Ihr versprechen, die Mutter zu suchen]
    ~ q_mutter = 1
    Diesmal versprichst du es.
    -> spieluhr_geben

= leer
Das Fenster im ersten Stock ist dunkel. Die Haustür steht einen Spalt offen und bewegt sich im Wind, und drinnen brennt das Räucherwerk herunter, für niemanden. # stimmung: grauen
-> k1_hub_b

=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel.
-> betreten("daecher") ->
{ schuetze == "erledigt":
    Die Gasse ist ruhig. Oben in der Dachrinne liegen ein paar Patronenhülsen, und der Wind spielt mit ihnen.
    -> k1_hub_b
}
Eine enge Gasse, so schmal, dass du die Hauswände zu beiden Seiten berühren könntest. Über dir hängen Dachrinnen, zerbrochene Fensterläden, Wäscheleinen, an denen nichts mehr hängt. Es ist still hier, zu still, und es riecht nach Schießpulver. # bild: gasse # stimmung: spannung
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
    Eine Regenrinne, ein Fenstersims, ein Balken. Als du oben bist, versucht er nachzuladen, aber seine Finger sind zu langsam, zu alt, zu ungeschickt in ihrer Eile. Er sieht dich an, als du über ihm stehst, und in seinen Augen ist keine Angst, nur eine wirre, kindliche Freude, als sei das alles ein Spiel. Es ist schnell vorbei. # stimmung: kampf
    Bei ihm findest du einen Beutel mit glatten Kieselsteinen und eine Flasche mit Öl und einem Stofffetzen im Hals: ein Molotow. Wozu ein alter Mann Kieselsteine sammelt, willst du nicht wissen. # notiz: kiesel
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    ~ echos = echos + 1
    -> k1_hub_b
+ [In Deckung zurück zur Straße]
    Du drückst dich in einen Hauseingang und wartest, bis du sicher bist, dass er nicht mehr zielt. Dann gehst du zurück.
    -> k1_hub_b

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON] Eileen auf einem Dach über dem Kanaleingang, Jägerin der Jäger, gibt Jägermarken. Nächstes Treffen im Original vor der Kapelle (Kapitel 2).
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und seinen alten Partner. Die Partnerschaft beginnt erst in Kapitel 2.
-> betreten("eileen") ->
{ eileen_stufe >= 1:
    Auf den Dachbalken ist niemand mehr. Nur eine schwarze Feder liegt dort, wo sie saß, und bewegt sich nicht, obwohl der Wind weht.
    -> k1_hub_b
}
~ eileen_stufe = 1
Über dem Eingang zur Kanalisation führen alte Dachbalken von Haus zu Haus, und auf ihnen, halb verborgen hinter ein paar Fässern, sitzt jemand, so still, dass du ihn für einen Haufen alter Kleider gehalten hättest, wenn er nicht den Kopf gedreht hätte. # bild: daecher_eileen # stimmung: ruhig
Es ist eine Frau. Sie trägt einen Mantel aus schwarzen Federn, die im Wind leise rascheln, und vor dem Gesicht eine Maske mit einem langen, gebogenen Schnabel, wie die Pestärzte sie in alten Holzschnitten tragen. Sie sieht dich lange an. Dann sagt sie, mit einer heiseren, ruhigen Stimme: Du bist neu. Sie riecht es. Es ist nicht unangenehm.
Sie jage nicht Bestien, sagt sie. Sie jage Jäger. Die, die sich zu tief ins Blut gewagt haben und nicht mehr zurückfinden, die nicht mehr wissen, ob das, was sie jagen, Bestien sind oder Menschen, und denen es irgendwann gleich ist. Irgendjemand müsse das tun. Sie nennt sich Eileen. # lore: jaeger_der_jaeger # lore: blutrausch
* [Ihr Respekt zollen]
    ~ eileen = eileen + 1
    Du sagst ihr, dass das eine schwere Aufgabe sei. Sie neigt den Kopf, und die Federn rascheln. Schwer, sagt sie, sei nicht das Wort. Einsam vielleicht.
* [Misstrauisch bleiben]
    Du hältst die Hand am Griff deiner Waffe. Sie bemerkt es und scheint es dir nicht übelzunehmen. Gut, sagt sie. Misstrauen hält Jäger am Leben.
* [Ihr sagen, sie solle sich um ihren Kram kümmern]
    ~ eileen = eileen - 1
    Sie lacht, ein kurzes, raues Krächzen. Das tue sie, sagt sie. Genau das tue sie.
- Sie greift in ihren Mantel und wirft dir zwei kleine, abgegriffene Marken zu, aus Messing, mit einem eingeprägten Zeichen. Jägermarken, sagt sie. Wer eine zerdrückt, wacht im Traum auf, ohne vorher sterben zu müssen. Für den Fall, dass du einmal schneller weg musst, als deine Beine dich tragen. # notiz: jaegermarke
~ jaegermarken = 2
Dann fragt sie, beiläufig, als ginge es um nichts: Ob du einem Pater begegnet bist, einem großen Mann mit verbundenen Augen. # notiz: eileen_frage
* {q_frau == 1} [Ja, und er hat dir geholfen; du verteidigst ihn]
    ~ gascoigne = gascoigne + 1
    Du erzählst ihr, wie er dich vor dem Mob gerettet hat, wie er die Bürger beim Namen nannte. Eileen hört zu, ohne dich zu unterbrechen. Dann hoffe, sagt sie, dass er es bleibt. Sein alter Partner, Henryk, habe es nicht geschafft. Und die beiden seien einmal die Besten gewesen. # notiz: henryk
* {q_frau == 1} [Ja; du sagst ihr, wo du ihn gesehen hast]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Du sagst ihr, wo du ihn getroffen hast, und in welche Richtung er gegangen ist. Sie nickt, langsam, und für einen Moment glaubst du, Traurigkeit hinter der Maske zu spüren. Danke, sagt sie. Es ist das Richtige. Es fühlt sich nicht so an. # notiz: verrat_gascoigne
* [Nein]
    Nein, sagst du. Sie nickt, als habe sie diese Antwort erwartet, und als glaube sie dir nur halb.
- Dann steht sie auf, breitet den Mantel aus wie Flügel, und ist mit einem Sprung auf dem nächsten Dach. Wir sehen uns wieder, ruft sie, ohne sich umzudrehen. Jäger sehen sich immer wieder. Meistens zu spät. # quest: eileen_treffen
-> k1_hub_b
