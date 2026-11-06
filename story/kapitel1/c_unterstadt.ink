// KAPITEL 1, AKT III: UNTERSTADT. Entscheidungsbuch (Umbau 2026-11-06): linear. Kanalisation-Mündung (Schwein, auf allen Wegen) → Ankunft und Laterne → zweite Traumszene → Gräber (Gascoigne kippt) → Eileen über den Gräbern → Tor → NADELÖHR 2 (Grab des Oedon).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbilder in Stimme A, Geschehen in B. Optionen fließen in den Satz (#fliesst).
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen ohne „Du“-Protokoll, Lernsätze als Erinnerung des Körpers, keine Ketten am Tor, Krähe statt Rabe, Totenbretter statt Holzkreuze (L4).
// [ERWEITERT] „Die Unterstadt“ als eigener Bereich mit Gassen, Friedhof und eigenem Knotenpunkt ist unsere Erfindung; im Original führen Kanalisation und Treppen von Zentral-Yharnam hinab zum Grab des Oedon (lore:orte/zentral-yharnam, RK1 §7, §9).
// [KANON lore:orte/zentral-yharnam] Zu Gascoigne kommt man über die Kanalisation; dort Ratten, Krähen, das Leichenbecken und das Riesenschwein; eine Leiter führt zurück nach oben.
// [KANON lore:gegenstaende/heilende-kirche] Das Tor zum Kathedralenbezirk öffnet erst der Schlüssel vom Grab des Oedon; es liegt oben an der Treppe hinter dem Friedhof, nicht mitten in der Unterstadt. Von hier unten sieht man nur den Bogen (k1_d_grab beschreibt das Tor aus der Nähe).
// [ERWEITERT] Der rote Lichtstreifen an der Hauswand, der nicht wandert (Leitmotiv Sonne, L6).
// Die Laterne am Eingang der Unterstadt führt in die zweite feste Traumszene (story/traum.ink). Wer stirbt, kehrt an den Anfang des Kampfes zurück (story/nachbild.ink).

=== k1_c_unterstadt ===
// TITEL: Unterstadt: Ankunft und Laterne
// Früher der Hub der Unterstadt; jetzt die einmalige Ankunft nach der Kanalisation, mit der Laterne, die in die zweite Traumszene führt.
-> betreten("unterstadt") ->
Am Fuß der Treppen stehen die Häuser aus einem dunkleren Stein, den der Regen vieler Generationen glatt geschliffen hat, und sie rücken so dicht zusammen, dass sich ihre Traufen über den Gassen berühren und es darunter niemals ganz Tag wird. Wasser läuft hier überall, in Rinnen, über die Stufen, aus den Fugen der Mauern, und sein Geräusch hört nicht auf, auch dann nicht, wenn du stehen bleibst und den Atem anhältst. An einer Treppe wächst ein einzelner Baum, verkrüppelt und schwarz, mit drei Blättern daran. # bild: unterstadt # stimmung: spannung
Hinter den letzten Dächern beginnt ein Friedhof, und jenseits davon, hoch über den Gräbern, steigt eine schmale Treppe an der Felswand empor bis zu einem Tor, von dem man hier unten nur den dunklen Bogen erkennt. Dahinter, sagt man in Yharnam, liege der Bezirk der Kathedrale, in dem die Heilende Kirche wohnt, und wer in der Unterstadt geboren ist, kennt diese Treppe sein Leben lang nur von unten. # lore: heilende_kirche
// [ERWEITERT] Einsicht kostet leise: Ab 2 hört man, was nicht da ist (einmal).
{ einsicht >= 2: Hinter einem Fenster ruft jemand deinen Namen, {name}, zweimal, leise und freundlich, so wie man zum Essen ruft. Das Fenster ist von außen zugenagelt, und die Nägel sind alt. }
// Die Laterne (feste Schwelle zum Traum, kein Speicherpunkt): Ihr kaltes Licht erinnert an den blassen Himmel des Traumes.
An einem eisernen Pfahl neben der Treppe steht eine Laterne, erloschen, das Glas von innen verrußt. Kaum berührt deine Hand das kalte Glas, flammt sie auf, und die Boten kriechen aus dem Boden und neigen die Köpfe, als grüßten sie dich. Ihr Licht ist kalt und weiß, und es erinnert dich an den elfenbeinfarbenen Himmel über dem Garten, so deutlich, dass du die Augen schließt. # lore: laternen
- (wahl)
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl
+ [Dich auf den Traum konzentrieren #fliesst]
    Du legst die Hand an das Glas und sammelst dich auf den Garten, auf das Gras im Nacken, auf den Geruch von Leinen. Das Licht trägt dich hinüber.
    -> k1_traum_zwei

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON lore:gegner/schwein, lore:figuren/maedchen-und-viola] Ratten, Krähen, Leichenbecken, das Riesenschwein. Ist das Mädchen draußen, frisst das Schwein es; es lässt dann ihr Band fallen, das am Kind weiß war und hier rot ist, getränkt (Festlegung G1).
// [ERWEITERT] Das Sprichwort vom Wasser; der Leinenstreifen mit der Nummer am Handgelenk eines Toten.
-> betreten("kanal") ->
{ k1_c_kanal == 1:
    Unter der Stadt fließt eine zweite Stadt, aus Wasser und Dunkelheit gebaut, mit Gewölben so hoch und breit wie das Schiff einer Kirche und Simsen zu beiden Seiten, auf denen früher einmal jemand gegangen sein muss. Das Wasser reicht dir bis an die Knie und ist so kalt, dass es nach wenigen Schritten nicht mehr schmerzt. Es trägt alles fort, was die Stadt nicht mehr haben will, und in den Gassen sagt man, es frage nicht, wem es gehört hat. # bild: kanal # stimmung: grauen
    Auf den Simsen sitzen Ratten mit Leibern so lang wie dein Unterarm und sehen dir zu, ohne zu fliehen. Krähen, die nicht auffliegen, hocken auf einem Haufen, den du für Lumpen hältst, bis eine von ihnen den Kopf hineinsteckt und an einem Faden zieht, der kein Faden ist. Weiter vorn weitet sich der Kanal zu einem Becken, und in dem Becken liegen die Toten, Dutzende, aufgequollen und bleich und so ineinander verschränkt, dass ein Arm aus dem Haufen ragt, den du keinem von ihnen zuordnen kannst. Um ein Handgelenk ist noch ein Streifen Leinen geknotet, darauf eine Nummer in sauberer, amtlicher Tinte. Begraben hat sie niemand. # lore: bestienseuche
    { herkunft == "ueberlebender": Zu Hause, im letzten Winter, lagen sie so in der Scheune hinter dem Gemeindehaus, als keiner mehr übrig war, der die anderen hätte begraben können. Dein Blick bleibt, wo er ist; er ist damals auch geblieben. }
}
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    ~ schwein = ""
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass, und das Wasser schlägt in kleinen Wellen gegen deine Knie. Ein Schwein, oder es war einmal eines: doppelt so groß wie ein Ochse, das Fell voller Geschwüre, die Hauer gelb und rissig. Es frisst. # bild: kanal_schwein # stimmung: grauen
    Neben ihm im Wasser treibt ein Kleid, das einmal hell war, und ein Schuh, nicht länger als deine Hand. Aus dem Maul, zwischen den Hauern, hängt ein Band. Es war einmal weiß. Jetzt ist es rot und schwer bis an den Knoten, und nur dort, wo es geknotet ist, hat sich ein Fingerbreit Weiß gehalten. # quest: maedchen_tot
    Deine Hand ist schon auf dem Weg zur Säge, bevor du sie losschickst.
}
{ schwein == "" and not maedchen_tot:
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass. Ein Schwein, doppelt so groß wie ein Ochse, die Hauer gelb und rissig, wühlt im Becken der Toten, und einmal kommt dabei ein Unterkiefer mit hoch; es kaut weiter, ohne den Kopf zu heben. # bild: kanal_schwein
}
+ [Dem Schwein entgegenwaten #fliesst]
    Das kalte Wasser schiebt sich gegen deine Knie, als wolle es dich zurückhalten, und die Säge liegt dir schwer in der Hand.
    -> kampf
+ [Dich an der Wand vorbeischleichen #fliesst]
    ~ schwein = "umgangen"
    Den Rücken am Schleim der Steine, fingerbreit um fingerbreit. Einmal hebt das Schwein den Kopf und schnüffelt in deine Richtung, und der Atem bleibt dir in der Brust stehen, bis es weiterfrisst.
    -> leiter

= kampf
~ kampfanfang = -> k1_c_kanal.kampf
# stimmung: kampf
- (t1)
Das Schwein hebt den Kopf aus dem Wasser und sieht dich an. Es senkt den Schädel, bis die Hauer die Oberfläche furchen, scharrt mit den Vorderhufen, dass es spritzt, und seine kleinen roten Augen folgen dir, wohin du auch trittst, genau so lange, bis es losrennt. # anzeichen: schwein_ansturm
{ gelernt ? schwein_ansturm: Deine Beine erinnern sich an das Gewicht dieses Schädels und halten still, solange die roten Augen dir folgen. }
+ [Im letzten Moment nach rechts springen #fliesst]
    Erst als dir sein heißer, fauliger Atem ins Gesicht schlägt, springst du. Es donnert an dir vorbei in die Wand, und aus dem Gewölbe brechen Steine.
    -> t2
+ [Sofort nach links ausweichen #fliesst]
    Die roten Augen gehen mit dir nach links, noch bevor es rennt, und der Schädel kommt hinterher. Er trifft dich an der Hüfte. Unter Wasser ist alles braun, und das Rauschen ist fort.
    ~ zuletzt = schwein_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {jagdnotizen} [Den Ansturm vorn mit der Schulter fangen #fliesst]
    Die Füße in den Schlamm unter dem Wasser gestemmt, so wie man ein Tor gegen den Sturm hält, nimmst du den Ansturm mit der Schulter. Das Heft des Toten sitzt in deinen Armen, und du hältst. Das Schwein schiebt und quiekt, und als es zurückweicht, um neu anzulaufen, liegt seine Flanke offen. # notiz: staerke_genutzt
    -> t2
+ [Stehen bleiben und nach vorn stechen #fliesst]
    Die Säge trifft den Schädel und gleitet ab, als hätte sie Stein getroffen. Die Hauer reißen dir den Schenkel auf, und du fliegst rückwärts ins Wasser.
    ~ zuletzt = schwein_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Es wendet sich schwerfällig im Wasser und reißt das Maul auf, und zwischen den Zähnen hängen noch Fetzen von dem, was es gefressen hat. Den Kopf bekommt es nach vorn und zur Seite herum, schnell genug; über dem Nacken aber, wo die Borsten am dichtesten stehen und der Rücken breit und flach aus dem Wasser ragt, erreicht es sich selbst nicht. # anzeichen: biss
{ gelernt ? biss: Dein Arm erinnert sich an die Zähne und zieht sich an den Leib, und dein Blick geht über das Maul hinweg zu dem breiten Rücken. }
+ [Auf seinen Rücken hinaufklettern #fliesst]
    Die Borsten sind hart wie Besenreisig und halten dein Gewicht. Oben krallst du dich fest, während es sich bockend um sich selbst dreht, und stößt zu, zwischen die Schulterblätter, wieder und wieder, bis es unter dir zusammenbricht.
    -> sieg
+ [Rückwärts durchs Wasser weichen #fliesst]
    Das Wasser ist zäh, und das Schwein ist schneller. Seine Zähne schließen sich um deinen Arm.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {ampulle > 0} [Zurückwaten und die Ampulle stoßen #fliesst]
    So weit zurück, wie das Wasser dich lässt, die Ampulle schon in der Faust.
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
Das Schwein sinkt, und um seinen Leib wird der Kanal dunkel, so wie sich Tinte in einem Glas ausbreitet. Was aus ihm aufsteigt, bleibt dir als Summen in den Fingerspitzen.
{ maedchen_tot and not band:
    ~ band = true
    Du ziehst ihm das Band aus dem Maul. Es kommt schwer heraus, vollgesogen, rot bis an den Knoten, und das Weiß, das dort geblieben ist, ist so schmal, dass dein Daumen es ganz bedeckt. Du wickelst es dir um zwei Finger und steckst es ein. # notiz: rotes_band
}
-> leiter

= leiter
// Am Ende des Kanals: der Weg führt in die Unterstadt (die Leiter nach oben ist entfallen, es gibt keinen Rückweg).
Am Ende des Kanals führen Stufen aus dem Wasser, schief und glitschig, in eine Gasse, in der das Licht eine Spur heller ist. Hinter dir rauscht das Wasser weiter, als wäre nichts gewesen.
-> k1_c_unterstadt

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
    -> k1_c_tor
}
// [ERWEITERT] Einsicht kostet leise: Eileen merkt es.
{ einsicht >= 2:
    Sie mustert dich, länger als nötig, und tippt sich mit einem Finger gegen die Schläfe der Maske. „Du siehst schon zu viel“, sagt sie. „Merkt man an den Augen. Wird nicht besser.“ # notiz: einsicht_eileen
}
{ gascoigne2:
    Ihr Blick hängt am Tor mit dem Namen darüber. „Reingegangen“, sagt sie. „Nicht wieder rausgekommen.“ Sie zieht die Knie an. „Ich warte.“
- else:
    Mit dem Schnabel ihrer Maske zeigt sie hinunter ins Halbdunkel zwischen den Grabsteinen, wo sich ein großer Schatten in einem langen Mantel bewegt, gebückt, mit den Händen am Boden.{q_frau == 1: Die Schultern kennst du vom Platz am Scheiterhaufen.} Der Wind kommt vom Friedhof herauf, und er bringt etwas mit, das nicht nach Gräbern riecht, warm und ranzig. „Riechst du's?“, fragt sie. „Bis hier rauf.“
}
Sie greift nach der Schnur an ihrem Hals und dreht eines der Abzeichen ans Licht, ein schlichtes aus Eisen, an einer Ecke verbogen. „Der hier hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher.“ Sie lässt es zurückfallen und sagt nicht, drei Wochen vor was. # lore: blutrausch # notiz: wie_jaeger_kippen
{ eileen_frage_offen and (q_frau == 1 or gascoigne2):
    „Der Pater“, sagt sie. „Jetzt gesehen?“
    ~ eileen_frage_offen = false
}
* {q_frau == 1 or gascoigne2} [Sie bitten, ihn zu verschonen #fliesst]
    ~ eileen = eileen + 1
    { q_frau == 1:
        „Lass ihn leben.“ Sie antwortet nicht, und so erzählst du ihr vom Platz am Scheiterhaufen und von dem Gruß, den er dir für seine Frau mitgegeben hat.
    - else:
        „Lass ihn leben.“ Du kennst ihn kaum; du weißt nur, dass er zwischen den Gräbern seinen eigenen Namen vor sich hin gesagt hat, um nachzusehen, ob er ihn noch hat.
    }
    Eileen schweigt so lange, dass unten eine Krähe zweimal den Grabstein wechselt. „Heute Nacht töte ich keinen“, sagt sie dann. „Aber ich bin hier.“ Nach einer Weile: „Hoffentlich lernst du nie, wozu.“ # notiz: eileen_bitte
* [Ihr anbieten, mit ihr zu jagen #fliesst]
    ~ eileen = eileen + 2
    „Du musst das nicht allein machen.“ Zum ersten Mal dreht sie den Schnabel nach dir, und die Abzeichen an ihrem Hals hängen still. „Nicht heute.“ Sie sieht wieder hinunter. „Drüben, im Kathedralenbezirk. Vor der Kapelle. Wenn du dann noch willst.“ # quest: eileen_angebot
* [Schweigend neben ihr sitzen bleiben #fliesst]
    ~ eileen = eileen + 1
    ~ eileen_name = true
    Unten tropft Wasser in ein offenes Grab, und eine Weile ist das alles. Dann bricht Eileen ein Stück Dörrfleisch in zwei Hälften und reicht dir eine, ohne hinzusehen. Der Handschuh an ihrer Hand hat keine Fingerkuppen mehr, und die Finger, die daraus hervorsehen, sind schmal und voller alter Narben. „Name?“, fragt sie, kauend. Du sagst ihn ihr. Sie wiederholt ihn nicht, aber sie nickt, als lege sie ihn irgendwo ab, wo sie ihn wiederfindet.
- Sie steht auf, in einem Rascheln von Federn, und ist über den First verschwunden, ohne dass sich ein Ziegel rührt. # stimmung: ruhig
-> k1_c_tor

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON RK1 §10] Der Name Oedon über dem Tor (im Original Name des Gebiets; Bedeutung bleibt offen, Wissenssperre).
// [ERWEITERT] Der Friedhof der Unterstadt, die Inschrift über dem Tor, der Stein auf der Brust der Toten, die Totenbretter (Brauch nach europäischem Volksgut statt christlicher Kreuze, L4), der Damenhandschuh auf dem Grabstein (Violas Spur, ohne Deutung; lore:figuren/maedchen-und-viola: Viola ist offenbar zum Grab gelangt), das frische Grab des Bäckerjungen. Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren.
// [ERWEITERT] Der fehlende Zahn im Kamm der Spieluhr: Gascoigne summt genau den Ton, der ausfällt (Saat für n2_gascoigne).
// [KANON lore:figuren/gascoigne, lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat für den Kampf); sein Satz aus dem Rausch, dass Männer als Jäger fortgehen und als Bestien heimkommen (sinngemäß, eigene Worte).
// Stimme Gascoigne (kippend): ein Wort kehrt zu oft wieder, Höflichkeiten fallen weg, die Anrede rutscht.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Zwischen den letzten Häusern beginnt der Friedhof ohne Mauer und ohne Pforte, so, als habe die Stadt an dieser Stelle aufgehört, für die Lebenden zu bauen. Die Grabsteine stehen schief und moosig und so dicht, dass man nicht zwischen ihnen hindurchkommt, ohne auf einen Namen zu treten; dazwischen steinerne Gestalten in Kapuzen, denen jemand die Gesichter abgeschlagen hat, und Totenbretter, auf denen die Verstorbenen bis zum Begräbnis lagen, beschriftet und aufrecht ins Kopfende gesteckt, manche mit einem Hufeisen daran. Auf vielen Gräbern liegt ein flacher Stein, genau dort, wo unter der Erde die Brust des Toten sein muss, damit einer liegen bleibt, den man begraben hat. # bild: graeber # stimmung: grauen
    Auf einem der Steine, einem kleinen mit einem Kranz aus gemeißeltem Efeu, liegt ein Damenhandschuh aus grauem Ziegenleder, glattgestrichen, die Finger nebeneinander, so ordentlich hingelegt, als wolle die Besitzerin gleich zurückkommen und ihn holen. Er ist trocken. Alles andere hier ist nass. # notiz: viola_handschuh
    Am Ende des Friedhofs steht ein schmiedeeisernes Tor in einem Bogen aus schwarzem Stein, und über dem Bogen ist ein einziges Wort gemeißelt: Oedon. Kein Vorname, keine Jahreszahl, kein Gebet.{ herkunft == "gelehrter": In keinem der Bücher über diese Stadt stand dieser Name, und du hast alle gelesen, die man draußen bekommt.} Deine Lippen formen ihn, ehe du es willst. # lore: oedon
    { einsicht >= 1: Für einen Atemzug antwortet etwas. Keine Stimme, nur ein Druck hinter den Ohren wie vor einem Gewitter, das nicht vom Himmel kommt. }
}
~ gascoigne2 = true
~ fr_frei_machen(fr_kippen)
Zwischen den Gräbern kniet ein Mann, und er kniet nicht zum Beten. Vor ihm steckt ein helles, neues Totenbrett in aufgeworfener Erde, mit Kreide beschriftet: Jonas, Bäckerlehrling. Er hat beide Hände in diese Erde gegraben und wühlt darin, beinahe zärtlich, die Unterarme dunkel bis an die Ellbogen von Erde und Blut, und dabei summt er, zwei Töne, immer dieselben zwei.{q_frau == 1: Es ist Gascoigne.} # lore: blutrausch # stimmung: grauen
Der Wind dreht, und sein Geruch kommt herüber, stärker als die Gräber: nasses Fell in einem verschlossenen Flur, Tage nach dem Regen.
{ q_frau == 1:
    Er hebt den Kopf, als er dich hört, und eine lange Weile ist in seinem Gesicht gar nichts, kein Erkennen, nur der Verband und der offene Mund. Dann, einen Atemzug zu spät, lächelt er. {gascoigne_name:„Henryk. Nein. Nein, nein. Du bist … {name}. {name}. Natürlich.“|„Ah. Der Fremde. Der Fremde vom Feuer. Natürlich, natürlich.“}
- else:
    Er fährt herum, die Axt schon erhoben, und hält dich für eine Bestie, bis du sprichst. Die Axt sinkt, sehr langsam. „Gascoigne“, sagt er, zu sich selbst, so wie man in der Tasche nach einem Schlüssel tastet, um sicher zu sein, dass er noch da ist. # lore: gascoigne
}
{ gascoigne_verraten:
    ~ gascoigne = gascoigne - 2
    Er zieht die Luft ein, einmal, zweimal, und das Lächeln verschwindet. „Federn“, sagt er. „Du riechst nach Krähe.“ Er wischt sich die Hände am Mantel ab, gründlich, Finger um Finger. „Die Krähe weiß, wo ich bin. Natürlich weiß sie es.“
}
* {q_frau == 1 or spieluhr or maedchen_gesehen} [Ihn an seine Tochter erinnern #fliesst]
    ~ gascoigne = gascoigne + 1
    -> tochter
* {eileen_stufe >= 1} [Ihn vor der Frau im Federmantel warnen #fliesst]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    „Die Frau im Federmantel. Sie sieht dir zu.“ Er lacht, ein kurzes Lachen durch die Nase. „Eileen. Die Krähe. Die hat Henryk und mich schon lange im Auge. Lange, lange.“ Sein verbundenes Gesicht wendet sich zu den Dächern hinauf, ohne zu suchen, als wüsste er, von wo man am besten sieht. „Und sie hat recht, verdammt, sie hat ja recht.“ Er klopft dir auf die Schulter, zu fest, und die Graberde an seiner Hand bleibt auf deinem Mantel. „Stell dich nicht zwischen sie und mich. Hörst du? Nicht dazwischen.“ # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
* {q_frau == 1 or q_mutter >= 1} [Ihn fragen, wo seine Frau ist #fliesst]
    „Wo ist deine Frau?“ Er sieht dich an, als verstehe er die Frage nicht, dann lächelt er. „Zu Hause. Ich hab sie heimgeschickt. Ist mir nachgekommen, hierher, in so eine Nacht, so eine Dummheit, so eine Dummheit, und ich hab sie heimgeschickt.“ Während er das sagt, reibt er die Hände aneinander, um die Graberde loszuwerden, und sie wird nicht weniger. # notiz: viola_luege # stimmung: grauen
    -> warnung
* {q_frau == 0 and not spieluhr and not maedchen_gesehen} [Ihn leise ansprechen #fliesst]
    Ein paar Worte über die Nacht und die Gräber, mehr fällt dir nicht ein, und er hört zu, den Kopf schief gelegt wie ein Hund, der hinter deiner Stimme eine zweite hört.
    -> warnung
* [Leise zurückweichen #fliesst]
    ~ gascoigne = gascoigne - 1
    Schritt um Schritt, ohne ihn aus den Augen zu lassen. Er sieht dir nach, mit dem verbundenen Gesicht, und folgt dir nicht.
    -> k1_c_eileen

= tochter
{
- spieluhr:
    Das Mädchen hat dir dafür etwas mitgegeben. Die Feder der Spieluhr schnurrt unter deinen Fingern, und das Lied steigt zwischen den Gräbern auf, so klein, dass das Wasser hinter den Häusern es beinahe zudeckt. Gascoigne erstarrt. Seine Hände sinken in den Schoß, schwarz von der Erde des Bäckerjungen. In der dritten Zeile fällt ein Ton aus, dort, wo dem Kamm ein Zahn fehlt, und genau diesen einen Ton summt er in die Lücke hinein, leise, und keinen anderen. Der Verband wird unter seinen Augen dunkel und feucht. Als das Lied endet, flüstert er einen Namen, den du nicht verstehst, und dann: „Die Kleine. Die Kinder. Die Kleine.“ # lore: spieluhr # stimmung: schoen
    ~ gascoigne = gascoigne + 1
- maedchen_gesehen:
    Vom Fenster am Brunnenplatz erzählst du ihm, von der kleinen Stimme hinter den Läden und der weißen Schleife am Riegel. Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
- else:
    „Die Kleine“, sagst du, „von der du am Feuer gesprochen hast.“ Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
}
-> warnung

= warnung
Er steht auf, und er ist sehr groß, so nah, und von ihm geht eine Hitze aus, die du durch den Mantel spürst. Mit der Axt deutet er auf das Tor mit dem Namen darüber. „Bleib weg vom Grab. Da drin ist meine. Meine Bestie. Ich jag sie schon so lange. So lange.“ Er wiegt den Kopf hin und her. „Gehen alle als Jäger los, weißt du. Alle. Und was dann heimkommt, klopft anders an die Tür.“ Dann legt er den Kopf schief, als lausche er einer Frage, die niemand gestellt hat. „Ich weiß nur nicht mehr, wie sie aussieht.“ # notiz: gascoigne_warnung
Er geht durch das Tor, und es schwingt hinter ihm zu und bleibt einen Spalt offen. Erst jetzt merkst du, dass du die ganze Zeit durch den Mund geatmet hast.
-> k1_c_eileen

=== k1_c_tor ===
// TITEL: Das Tor des Oedon
// Früher eine Option im Hub der Unterstadt; jetzt der feste Weg zum Nadelöhr. Letzte Gelegenheit, die Ampulle zu nutzen.
- (wahl)
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl
+ [Durch das Tor mit dem Namen gehen #fliesst]
    Das Tor mit dem Namen darüber gibt unter deiner Hand nach, ohne zu knarren, als habe es eben erst jemand geölt.
    -> k1_n2_gascoigne
