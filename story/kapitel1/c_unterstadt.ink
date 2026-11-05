// KAPITEL 1, TEIL C: UNTERSTADT UND KANALISATION. Freie Reihenfolge. Führt zu NADELÖHR 2 (Grab des Oedon).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbilder in Stimme A, Geschehen in B. Optionen fließen in den Satz (#fliesst).
// [ERWEITERT] „Die Unterstadt“ als eigener Bereich mit Gassen, Friedhof und eigenem Knotenpunkt ist unsere Erfindung; im Original führen Kanalisation und Treppen von Zentral-Yharnam hinab zum Grab des Oedon (lore:orte/zentral-yharnam, RK1 §7, §9).
// [KANON lore:orte/zentral-yharnam] Zu Gascoigne kommt man über die Kanalisation; dort Ratten, Krähen, das Leichenbecken und das Riesenschwein; eine Leiter führt zurück nach oben.
// [KANON lore:gegenstaende/heilende-kirche] Das Tor zum Kathedralenbezirk öffnet erst der Schlüssel vom Grab des Oedon; es liegt oben an der Treppe hinter dem Friedhof, nicht mitten in der Unterstadt.
// Keine Laterne hier, außer an der Brücke (nur wenn die Kleriker-Bestie besiegt ist). Wer stirbt, läuft weit zurück.

=== k1_hub_c ===
// TITEL: Unterstadt (frei)
-> betreten("unterstadt") ->
{ k1_hub_c == 1:
    Am Fuß der Treppen stehen die Häuser aus einem dunkleren Stein, den der Regen vieler Generationen glatt geschliffen hat, und sie rücken so dicht zusammen, dass sich ihre Traufen über den Gassen berühren und es darunter niemals ganz Tag wird. Wasser läuft hier überall, in Rinnen, über die Stufen, aus den Fugen der Mauern, und sein Geräusch hört nicht auf, auch dann nicht, wenn du stehen bleibst und den Atem anhältst. An einer Treppe wächst ein einzelner Baum, verkrüppelt und schwarz, mit drei Blättern daran. # bild: unterstadt # stimmung: spannung
    Hinter den letzten Dächern beginnt ein Friedhof, und jenseits davon, hoch über den Gräbern, steigt eine schmale Treppe an der Felswand empor bis zu einem Tor, von dem man hier unten nur den dunklen Bogen erkennt. Dahinter, sagt man in Yharnam, liege der Bezirk der Kathedrale, in dem die Heilende Kirche wohnt; das Tor aber ist mit Ketten verhängt, und wer dort hinauf will, braucht einen Schlüssel, den hier unten niemand hat. # lore: heilende_kirche
- else:
    { gascoigne2 and not gascoigne_tot:
        Hinter dem Friedhof, jenseits des Tors mit dem Namen, schlägt es, dumpf und gleichmäßig, und zwischen zwei Schlägen ist es jedes Mal still genug, dass du das Wasser wieder hörst.
    - else:
        {~Das Wasser in den Rinnen rauscht, und irgendwo tropft es in einen Eimer, der längst übergelaufen ist.|In der Unterstadt ist es noch dunkler geworden, oder deine Augen sind müder.|Ein Fenster schlägt, auf, zu, auf, zu, und niemand schließt es.}
    }
}
// [ERWEITERT] Einsicht kostet leise: Ab 2 hört man, was nicht da ist (einmal).
{ k1_hub_c > 1 and einsicht >= 2: {Hinter einem Fenster ruft jemand deinen Namen, {name}, zweimal, leise und freundlich, so wie man zum Essen ruft. Das Fenster ist von außen zugenagelt, und die Nägel sind alt.|} }
{ eileen_stufe == 1: Über den Gräbern, auf dem First einer niedrigen Hütte, bewegen sich schwarze Federn im Wind, zu viele und zu lang für eine Krähe. }
- (wohin)
+ [Hinab in die Kanalisation steigen #fliesst]
    Du steigst {k1_c_kanal:wieder} die Treppe hinab, auf der das Wasser dir vorausläuft, Stufe um Stufe, bis es unten in der Dunkelheit zu rauschen beginnt.
    -> k1_c_kanal
+ {eileen_stufe == 1} [Zu den Rabenfedern auf dem Dach klettern #fliesst]
    Du kletterst über ein Fass und eine Regenrinne zu den Rabenfedern hinauf, und die nassen Ziegel geben unter deinen Stiefeln kaum nach.
    -> k1_c_eileen
+ [Zu den Gräbern hinübergehen #fliesst]
    Du gehst {k1_c_graeber:wieder} zu den Gräbern hinüber, die Gasse entlang, bis die Häuser aufhören und die Steine anfangen.
    -> k1_c_graeber
+ {kanal_leiter} [Über die Kanalleiter hinaufsteigen #fliesst]
    Du watest durch den Kanal bis zur eisernen Leiter und steigst hinauf, bis über dir das Gitter aufschwingt und dir der Rauch der oberen Gassen ins Gesicht schlägt.
    -> k1_hub_b
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wohin
+ {kleriker == "besiegt"} [Die Laterne an der Brücke berühren #fliesst]
    ~ laterne = -> k1_hub_c
    -> traum_von_laterne
+ {kleriker == "besiegt"} [Die Treppen zur Brücke hinaufsteigen #fliesst]
    Du steigst die Treppen zur Brücke hinauf. Dort liegt die Bestie noch, wo sie gefallen ist; die Ratten haben angefangen, und das Geweih ragt über die Kutschen wie die Krone eines umgestürzten Baumes. Du gehst an ihr vorbei, ohne stehen zu bleiben, bis dorthin, wo du die Brücke betreten hast.
    -> k1_hub_b
+ {kleriker != "besiegt"} [Die Treppen zur Brücke hinaufsteigen #fliesst]
    ~ bruecke_von = "unten"
    Du steigst die Treppen wieder hinauf, der Brücke entgegen, und mit jeder Stufe wird das Wasser leiser und der Wind lauter.
    -> k1_n1_kleriker
+ [{k1_c_graeber:Durch das Tor mit dem Namen gehen|Durch das Tor hinter dem Friedhof gehen} #fliesst]
    Du gehst durch das Tor{k1_c_graeber: mit dem Namen darüber|, das hinter dem Friedhof in einem Bogen aus schwarzem Stein steht}. Es gibt unter deiner Hand nach, ohne zu knarren, als habe es eben erst jemand geölt.
    -> k1_n2_gascoigne

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON lore:gegner/schwein, lore:figuren/maedchen-und-viola] Ratten, Krähen, Leichenbecken, das Riesenschwein. Ist das Mädchen draußen, frisst das Schwein es; es lässt dann ihr Band fallen, das am Kind weiß war und hier rot ist, getränkt (Festlegung G1).
// [ERWEITERT] Das Sprichwort vom Wasser; der Leinenstreifen mit der Nummer am Handgelenk eines Toten.
-> betreten("kanal") ->
{ k1_c_kanal == 1:
    Unter der Stadt fließt eine zweite Stadt, aus Wasser und Dunkelheit gebaut, mit Gewölben so hoch und breit wie das Schiff einer Kirche und Simsen zu beiden Seiten, auf denen früher einmal jemand gegangen sein muss. Das Wasser reicht dir bis an die Knie und ist so kalt, dass es nach wenigen Schritten nicht mehr schmerzt. Es trägt alles fort, was die Stadt nicht mehr haben will, und in den Gassen sagt man, es frage nicht, wem es gehört hat. # bild: kanal # stimmung: grauen
    Auf den Simsen sitzen Ratten mit Leibern so lang wie dein Unterarm und sehen dir zu, ohne zu fliehen. Krähen, die nicht auffliegen, hocken auf einem Haufen, den du für Lumpen hältst, bis eine von ihnen den Kopf hineinsteckt und an einem Faden zieht, der kein Faden ist. Dann weitet sich der Kanal zu einem Becken, und in dem Becken liegen die Toten, Dutzende, aufgequollen und bleich und so ineinander verschränkt, dass du nicht sagen kannst, wo einer aufhört und der nächste beginnt. Um ein Handgelenk ist noch ein Streifen Leinen geknotet, darauf eine Nummer in sauberer, amtlicher Tinte. Begraben hat sie niemand. # lore: bestienseuche
    { herkunft == "ueberlebender": Zu Hause, im letzten Winter, hast du so etwas schon einmal gesehen, als keiner mehr übrig war, der die anderen hätte begraben können. Du drehst dich nicht weg; damals hast du es auch nicht getan. }
}
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    { schwein == "tot":
        Das Schwein ist wieder da. Du hast es getötet, und trotzdem steht es im Wasser, als hätte die Nacht es neu geboren, so wie sie dich neu gebiert, jedes Mal.
    }
    ~ schwein = ""
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass, und das Wasser schlägt in kleinen Wellen gegen deine Knie. Ein Schwein, oder es war einmal eines: doppelt so groß wie ein Ochse, das Fell voller Geschwüre, die Hauer gelb und rissig. Es frisst. # bild: kanal_schwein # stimmung: grauen
    Neben ihm im Wasser treibt ein Kleid, das einmal hell war, und ein Schuh, nicht länger als deine Hand. Aus dem Maul, zwischen den Hauern, hängt ein Band. Es war einmal weiß. Jetzt ist es rot und schwer bis an den Knoten, und nur dort, wo es geknotet ist, hat sich ein Fingerbreit Weiß gehalten. {maedchen_gesehen:Du hast es weiß gesehen, am Brunnenplatz, als Schleife um einen Fensterriegel, damit eine Mutter den Weg nach Hause findet.|Eine Haarschleife, so eine, wie kleine Mädchen sie tragen.} # quest: maedchen_tot
    Deine Hand ist schon auf dem Weg zur Säge, bevor du sie losschickst.
}
{ schwein == "tot": -> danach }
{ schwein == "umgangen":
    Das Schwein wühlt noch immer im Wasser, dort, wo du dich an ihm vorbeigeschoben hast. Als du kommst, hebt es den Kopf und lässt ihn wieder sinken. # bild: kanal_schwein
}
{ schwein == "" and not maedchen_tot:
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass. Ein Schwein, doppelt so groß wie ein Ochse, die Hauer gelb und rissig, wühlt im Wasser nach Dingen, die du nicht sehen willst, und hebt dabei nicht einmal den Kopf. # bild: kanal_schwein
}
+ [Dem Schwein entgegenwaten #fliesst]
    Du watest ihm entgegen, die Säge in der Hand, und das kalte Wasser schiebt sich gegen deine Knie, als wolle es dich zurückhalten.
    -> kampf
+ {schwein != "umgangen"} [Dich an der Wand vorbeischleichen #fliesst]
    ~ schwein = "umgangen"
    Du schleichst dich an der Wand vorbei, den Rücken am Schleim der Steine, fingerbreit um fingerbreit. Einmal hebt das Schwein den Kopf und schnüffelt in deine Richtung, und du hörst auf zu atmen, bis es weiterfrisst.
    -> leiter
+ {schwein == "umgangen"} [Noch einmal an ihm vorbei #fliesst]
    Noch einmal schiebst du dich an derselben Wand an ihm vorbei, und diesmal hebt es nicht einmal den Kopf.
    -> leiter
+ [Die Treppe wieder hinaufsteigen #fliesst]
    Du steigst die Treppe wieder hinauf, und das Rauschen bleibt hinter dir zurück, bis es nur noch in den Rinnen der Gassen weiterläuft.
    -> k1_hub_c

= kampf
# stimmung: kampf
- (t1)
Das Schwein hebt den Kopf aus dem Wasser und sieht dich an. Es senkt den Schädel, bis die Hauer die Oberfläche furchen, scharrt mit den Vorderhufen, dass es spritzt, und seine kleinen roten Augen folgen dir, wohin du auch trittst, genau so lange, bis es losrennt. # anzeichen: schwein_ansturm
{ gelernt ? schwein_ansturm: Du kennst das jetzt. Solange es steht, folgen dir seine Augen; wenn es rennt, rennt es geradeaus und lenkt nicht mehr. }
+ [Im letzten Moment nach rechts springen #fliesst]
    Du wartest, bis es so nah ist, dass dir sein heißer, fauliger Atem ins Gesicht schlägt, und springst im letzten Moment nach rechts. Es donnert an dir vorbei in die Wand, und aus dem Gewölbe brechen Steine.
    -> t2
+ [Sofort nach links ausweichen #fliesst]
    Du weichst sofort nach links aus, noch bevor es rennt, und die roten Augen gehen mit dir. Der Schädel trifft dich an der Hüfte. Du gehst unter.
    ~ zuletzt = schwein_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {staerke >= 1} [Den Ansturm vorn mit der Schulter fangen #fliesst]
    Du fängst den Ansturm vorn mit der Schulter, die Füße in den Schlamm unter dem Wasser gestemmt, so wie man ein Tor gegen den Sturm hält. Die Wärme der Puppe sitzt in deinen Armen, und du hältst. Das Schwein schiebt und quiekt, und als es zurückweicht, um neu anzulaufen, liegt seine Flanke offen. # notiz: staerke_genutzt
    -> t2
+ [Stehen bleiben und nach vorn stechen #fliesst]
    Du bleibst stehen und stichst nach vorn, und genauso gut könntest du einer Lawine den Weg versperren. Die Hauer reißen dir den Schenkel auf. Du fliegst rückwärts ins Wasser.
    ~ zuletzt = schwein_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Es wendet sich schwerfällig im Wasser und reißt das Maul auf, und zwischen den Zähnen hängen noch Fetzen von dem, was es gefressen hat. Den Kopf bekommt es nach vorn und zur Seite herum, schnell genug; über dem Nacken aber, wo die Borsten am dichtesten stehen und der Rücken breit und flach aus dem Wasser ragt, erreicht es sich selbst nicht. # anzeichen: biss
{ gelernt ? biss: Im Wasser ist es schneller als du. Auf seinen eigenen Rücken kommt es nicht. }
+ [Auf seinen Rücken hinaufklettern #fliesst]
    Du ziehst dich an den Borsten hinauf auf seinen Rücken und krallst dich fest, während es sich bockend um sich selbst dreht, und stößt zu, zwischen die Schulterblätter, wieder und wieder, bis es unter dir zusammenbricht.
    -> sieg
+ [Rückwärts durchs Wasser weichen #fliesst]
    Du weichst rückwärts durchs Wasser, aber das Wasser ist zäh, und das Schwein ist schneller. Seine Zähne schließen sich um deinen Arm.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {ampulle > 0} [Zurückwaten und die Ampulle stoßen #fliesst]
    Du watest zurück, so weit es dich lässt, die Ampulle schon in der Faust.
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
~ echos = echos + 3
Das Schwein sinkt ins Wasser, und um es herum färbt sich das Wasser dunkel, langsam, so wie sich Tinte in einem Glas ausbreitet. Was dabei aus ihm aufsteigt, fährt dir warm unter die Haut und bleibt als Summen in den Fingerspitzen.
{ maedchen_tot and not band:
    ~ band = true
    Du ziehst das Band aus seinem Maul. Es ist nass und schwerer, als ein Band sein dürfte, rot bis an den Knoten, und das Weiß, das dort geblieben ist, ist so schmal, dass du den Daumen darauflegst.{maedchen_gesehen: Am Fensterriegel war es ganz weiß.} Du wickelst es dir um zwei Finger und steckst es ein. # notiz: rotes_band
}
-> leiter

= leiter
{ not kanal_leiter:
    ~ kanal_leiter = true
    Am Ende des Kanals führt eine eiserne Leiter hinauf zu einem Gitter, das von unten verriegelt ist. Du schiebst den rostigen Riegel zurück, das Gitter schwingt auf, und durch die Öffnung siehst du ein Stück Himmel, das du kennst: die Dächer von Zentral-Yharnam, nicht weit von der Laterne. Ein Weg zurück, der nicht über die Brücke führt. Du lässt das Gitter offen und steigst wieder hinab. # notiz: abkuerzung
}
-> k1_hub_c

= danach
Das Wasser riecht nach Eisen. Das Schwein liegt, wo es gefallen ist, halb unter der Oberfläche, und auf seinem Rücken sitzen schon die Krähen. Die Leiter am Ende des Kanals steht offen.
-> k1_hub_c

=== k1_c_eileen ===
// TITEL: Eileen über den Gräbern
// [ERWEITERT] Zweite und letzte Begegnung in Kapitel 1 (Festlegung G2). Sie beobachtet Gascoigne. Bereitet die Partnerschaft in Kapitel 2 vor (das Angebot kommt nur hier). Die Abzeichen an der Schnur sind unsere Erfindung.
// [KANON lore:figuren/eileen] Jägerin der Jäger; sie jagt Jäger, die dem Blut verfallen.
// Stimme Eileen: heiser, Sätze ohne Anlauf, Gegenfragen oder gar keine Antwort.
-> betreten("eileen_graeber") ->
~ eileen_stufe = 2
Auf dem Dach einer alten Totengräberhütte, zwischen moosigen Ziegeln und einem Schornstein, aus dem seit Jahren kein Rauch mehr steigt, sitzt {eileen_genannt:Eileen|die Frau im Federmantel} so reglos wie die Krähen, die unten auf den Grabsteinen hocken. Als du die letzten Ziegel hinaufkommst, rückt sie ein Stück zur Seite, ohne den Blick vom Friedhof zu nehmen. # bild: daecher_eileen # stimmung: ruhig
{ eileen < 0:
    Sie sagt lange nichts. Dann, ohne dich anzusehen: „Geh. Das hier ist nichts für einen, der nicht weiß, wann man den Mund hält.“ # notiz: eileen_kalt
    -> k1_hub_c
}
// [ERWEITERT] Einsicht kostet leise: Eileen merkt es.
{ einsicht >= 2:
    Sie mustert dich, länger als nötig, und tippt sich mit einem Finger gegen die Schläfe der Maske. „Du siehst schon zu viel“, sagt sie. „Merkt man an den Augen. Wird nicht besser.“ # notiz: einsicht_eileen
}
{ gascoigne2:
    Ihr Blick hängt am Tor mit dem Namen darüber. „Reingegangen“, sagt sie. „Nicht wieder rausgekommen.“ Sie zieht die Knie an. „Ich warte.“
- else:
    Mit dem Schnabel ihrer Maske zeigt sie hinunter ins Halbdunkel zwischen den Grabsteinen, wo sich ein großer Schatten in einem langen Mantel bewegt, gebückt, mit den Händen am Boden.{q_frau == 1: Den Gang kennst du vom Platz am Scheiterhaufen.} Der Wind kommt vom Friedhof herauf und bringt einen Geruch mit, der nicht nach Gräbern riecht, warm und ranzig. „Riechst du's?“, fragt sie. „Bis hier rauf.“
}
Sie greift nach der Schnur an ihrem Hals und dreht eines der Abzeichen ans Licht, ein schlichtes aus Eisen, an einer Ecke verbogen. „Der hier hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher.“ Sie lässt es zurückfallen und sagt nicht, drei Wochen vor was. # lore: blutrausch # notiz: wie_jaeger_kippen
{ eileen_frage_offen and (q_frau == 1 or gascoigne2):
    „Der Pater“, sagt sie. „Jetzt gesehen?“
    ~ eileen_frage_offen = false
}
* {q_frau == 1 or gascoigne2} [Sie bitten, ihn zu verschonen #fliesst]
    ~ eileen = eileen + 1
    { q_frau == 1:
        Du bittest sie, ihn zu verschonen, und erzählst ihr, was er auf dem Platz am Scheiterhaufen für dich getan hat.
    - else:
        Du bittest sie, ihn zu verschonen, obwohl du ihn kaum kennst. Zwischen den Gräbern hat er seinen eigenen Namen vor sich hin gesagt, um nachzusehen, ob er ihn noch hat.
    }
    Eileen schweigt so lange, dass unten eine Krähe zweimal den Grabstein wechselt. „Heute Nacht töte ich keinen“, sagt sie dann. „Aber ich bin hier.“ Nach einer Weile: „Hoffentlich lernst du nie, wozu.“ # notiz: eileen_bitte
* [Ihr anbieten, mit ihr zu jagen #fliesst]
    ~ eileen = eileen + 2
    Du bietest ihr an, mit ihr zu jagen. Du sagst ihr, dass du verstehst, was sie tut, dass einer es tun muss und dass sie es vielleicht nicht allein tun müsste. Zum ersten Mal dreht sie den Kopf nach dir, und hinter den gläsernen Augen der Maske ist für einen Atemzug nichts als Überraschung. „Nicht heute.“ Sie sieht wieder hinunter. „Drüben, im Kathedralenbezirk. Vor der Kapelle. Wenn du dann noch willst.“ # quest: eileen_angebot
* [Schweigend neben ihr sitzen bleiben #fliesst]
    ~ eileen = eileen + 1
    ~ eileen_name = true
    Du bleibst neben ihr sitzen und sagst nichts, zwei Jäger auf einem Dach über den Toten, während unten Wasser in ein offenes Grab tropft. Nach einer Weile bricht Eileen ein Stück Dörrfleisch in zwei Hälften und reicht dir eine, ohne hinzusehen. Der Handschuh an ihrer Hand hat keine Fingerkuppen mehr, und die Finger, die daraus hervorsehen, sind schmal und voller alter Narben. „Name?“, fragt sie, kauend. Du sagst ihn ihr. Sie wiederholt ihn nicht, aber sie nickt, als lege sie ihn irgendwo ab, wo sie ihn wiederfindet.
- Dann steht sie auf, in einem Rascheln von Federn, und ist über den First verschwunden, ohne dass sich ein Ziegel rührt. # stimmung: ruhig
-> k1_hub_c

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON RK1 §10] Der Name Oedon über dem Tor (im Original Name des Gebiets; Bedeutung bleibt offen, Wissenssperre).
// [ERWEITERT] Der Friedhof der Unterstadt, die Inschrift über dem Tor, der Stein auf der Brust der Toten, der Damenhandschuh auf dem Grabstein (Violas Spur, ohne Deutung; lore:figuren/maedchen-und-viola: Viola ist offenbar zum Grab gelangt), das frische Grab des Bäckerjungen. Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren.
// [KANON lore:figuren/gascoigne, lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat für den Kampf); sein Satz aus dem Rausch, dass Männer als Jäger fortgehen und als Bestien heimkommen (sinngemäß, eigene Worte).
// Stimme Gascoigne (kippend): ein Wort kehrt zu oft wieder, Höflichkeiten fallen weg, die Anrede rutscht.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Zwischen den letzten Häusern beginnt der Friedhof ohne Mauer und ohne Pforte, so, als habe die Stadt an dieser Stelle aufgehört, für die Lebenden zu bauen. Die Grabsteine stehen schief und moosig und so dicht, dass man nicht zwischen ihnen hindurchkommt, ohne auf einen Namen zu treten; dazwischen Engel mit abgeschlagenen Gesichtern und Holzkreuze, in die jemand Hufeisen genagelt hat. Auf vielen Gräbern liegt ein flacher Stein, genau dort, wo unter der Erde die Brust des Toten sein muss, damit einer liegen bleibt, den man begraben hat. # bild: graeber # stimmung: grauen
    Auf einem der Steine, einem kleinen mit einem Kranz aus gemeißeltem Efeu, liegt ein Damenhandschuh aus grauem Ziegenleder, glattgestrichen, die Finger nebeneinander, so ordentlich hingelegt, als wolle die Besitzerin gleich zurückkommen und ihn holen. Er ist trocken. Alles andere hier ist nass. # notiz: viola_handschuh
    Am Ende des Friedhofs steht ein schmiedeeisernes Tor in einem Bogen aus schwarzem Stein, und über dem Bogen ist ein einziges Wort gemeißelt: Oedon. Kein Vorname, keine Jahreszahl, kein Gebet.{ herkunft == "gelehrter": In keinem der Bücher über diese Stadt stand dieser Name, und du hast alle gelesen, die man draußen bekommt.} Du sprichst ihn leise aus, ohne es zu wollen. # lore: oedon
    { einsicht >= 1: Für einen Atemzug antwortet etwas. Keine Stimme, nur ein Druck hinter den Ohren wie vor einem Gewitter, das nicht vom Himmel kommt. }
}
// Wer Gascoigne schon am Grab gegenübergestanden hat, findet ihn hier nicht mehr.
{ gascoigne2 or k1_n2_gascoigne: -> still }
~ gascoigne2 = true
Zwischen den Gräbern kniet ein Mann, und er kniet nicht zum Beten. Vor ihm steckt ein neues Holzkreuz in frisch aufgeworfener Erde, auf dem Querbalken in Kreide: Jonas, Bäckerlehrling. Er hat beide Hände in diese Erde gegraben und wühlt darin, beinahe zärtlich, die Unterarme dunkel bis an die Ellbogen von Erde und Blut, und dabei lacht er leise über einen Witz, den nur er gehört hat.{q_frau == 1: Es ist Gascoigne.} # lore: blutrausch # stimmung: grauen
Dann erreicht dich sein Geruch, und er ist stärker als die Gräber: nasses Fell in einem verschlossenen Flur, warm und ranzig, so dicht, dass du durch den Mund atmest.{q_frau == 1: Auf dem Platz am Scheiterhaufen lag er noch leise unter dem Rauch. Jetzt liegt nichts mehr darüber.}
{ q_frau == 1:
    Er hebt den Kopf, als er dich hört, und eine lange Weile ist in seinem Gesicht gar nichts, kein Erkennen, nur der Verband und der offene Mund. Dann, einen Atemzug zu spät, lächelt er. {gascoigne_name:„Henryk. Nein. Nein, nein. Du bist … {name}. {name}. Natürlich.“|„Ah. Der Fremde. Der Fremde vom Feuer. Natürlich, natürlich.“}
- else:
    Er fährt herum, die Axt schon erhoben, und hält dich für eine Bestie, bis du sprichst. Dann lässt er die Axt sinken, sehr langsam. „Gascoigne“, sagt er, nicht zu dir, sondern zu sich selbst, wie man in der Tasche nach einem Schlüssel tastet, um sicher zu sein, dass er noch da ist. # lore: gascoigne
}
{ gascoigne_verraten:
    ~ gascoigne = gascoigne - 2
    Dann zieht er die Luft ein, einmal, zweimal, und das Lächeln verschwindet. „Federn“, sagt er. „Du riechst nach Krähe.“ Er wischt sich die Hände am Mantel ab, gründlich, Finger um Finger. „Die Krähe weiß, wo ich bin. Natürlich weiß sie es.“
}
* {q_frau == 1 or spieluhr or maedchen_gesehen} [Ihn an seine Tochter erinnern #fliesst]
    ~ gascoigne = gascoigne + 1
    -> tochter
* {eileen_stufe >= 1} [Ihn vor der Frau mit den Rabenfedern warnen #fliesst]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    Du warnst ihn vor der Frau mit den Rabenfedern und sagst ihm, dass sie ihn beobachtet. Er lacht, und es ist ein trauriges Lachen. „Eileen. Die Krähe. Die hat Henryk und mich schon lange im Auge. Lange, lange.“ Er wischt sich die Hände am Mantel ab. „Und sie hat recht, verdammt, sie hat ja recht.“ Er klopft dir auf die Schulter, zu fest, und die Graberde an seiner Hand bleibt auf deinem Mantel. „Stell dich nicht zwischen sie und mich. Hörst du? Nicht dazwischen.“ # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
* {q_frau == 1 or q_mutter >= 1} [Ihn fragen, wo seine Frau ist #fliesst]
    Du fragst ihn, wo seine Frau ist. Er sieht dich an, als verstehe er die Frage nicht, dann lächelt er. „Zu Hause. Ich hab sie heimgeschickt. Ist mir nachgekommen, hierher, in so eine Nacht, so eine Dummheit, so eine Dummheit, und ich hab sie heimgeschickt.“ Während er das sagt, reibt er die Hände aneinander, um die Graberde loszuwerden, und sie wird nicht weniger. # notiz: viola_luege # stimmung: grauen
    -> warnung
* {q_frau == 0 and not spieluhr and not maedchen_gesehen} [Ihn leise ansprechen #fliesst]
    Du sprichst ihn leise an, mit irgendetwas über die Nacht und die Gräber, und er hört zu, den Kopf schief gelegt, als lausche er einer anderen Stimme hinter deiner.
    -> warnung
* [Leise zurückweichen #fliesst]
    ~ gascoigne = gascoigne - 1
    Du weichst zurück, Schritt um Schritt, ohne ihn aus den Augen zu lassen. Er sieht dir nach, mit dem verbundenen Gesicht, und folgt dir nicht.
    -> k1_hub_c

= tochter
{
- spieluhr:
    Du erinnerst ihn an sie auf die einzige Weise, die du hast. Du nimmst die Spieluhr aus der Tasche und ziehst sie auf, und das Lied steigt zwischen den Gräbern auf, dünn und klar, und Gascoigne erstarrt. Seine Hände sinken in den Schoß. Unter dem Verband laufen ihm Tränen über die Wangen, und er wischt sie nicht fort; er summt mit, leise, jede Note. Als das Lied endet, flüstert er einen Namen, den du nicht verstehst, und dann: „Die Kleine. Die Kinder. Die Kleine.“ # lore: spieluhr # stimmung: schoen
    ~ gascoigne = gascoigne + 1
- maedchen_gesehen:
    Du erinnerst ihn an seine Tochter und erzählst ihm von dem Fenster am Brunnenplatz, von der kleinen Stimme hinter den Läden und der weißen Schleife am Riegel. Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
- else:
    Du erinnerst ihn an die Kleine, von der er am Scheiterhaufen gesprochen hat. Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
}
-> warnung

= warnung
Dann steht er auf, und er ist sehr groß, so nah, und von ihm geht eine Hitze aus, die du durch den Mantel spürst. Er deutet mit der Axt auf das Tor mit dem Namen darüber. „Bleib weg vom Grab. Da drin ist meine. Meine Bestie. Ich jag sie schon so lange. So lange.“ Er wiegt den Kopf hin und her. „Gehen alle als Jäger los, weißt du. Alle. Und was dann heimkommt, klopft anders an die Tür.“ Dann legt er den Kopf schief, als lausche er einer Frage, die niemand gestellt hat. „Ich weiß nur nicht mehr, wie sie aussieht.“ # notiz: gascoigne_warnung
Er geht durch das Tor, und der Nebel schließt sich hinter ihm, und erst jetzt merkst du, dass du die ganze Zeit durch den Mund geatmet hast.
-> k1_hub_c

= still
{ gascoigne2:
    Die Gräber schweigen. Am Holzkreuz des Bäckerlehrlings ist die Erde aufgewühlt, und von dort führen tiefe Handabdrücke durch den Schlamm bis zum Tor.
- else:
    Die Gräber schweigen. Zwischen den Steinen steckt ein frisches Holzkreuz, mit Kreide beschriftet: Jonas, Bäckerlehrling. Die Erde davor ist von Händen durchwühlt, tief hinab, und von dort führen breite Abdrücke durch den Schlamm bis zum Tor.
}
-> k1_hub_c
