// KAPITEL 1, TEIL C: UNTERSTADT UND KANALISATION. Freie Reihenfolge. Führt zu NADELÖHR 2 (Grab des Oedon).
// [KANON] Zu Gascoigne kommt man über die Kanalisation; dort das Riesenschwein; eine Leiter führt zurück nach oben.
// Keine Laterne hier, außer an der Brücke (nur wenn die Kleriker-Bestie besiegt ist). Wer stirbt, läuft weit zurück.

=== k1_hub_c ===
// TITEL: Unterstadt (frei)
-> betreten("unterstadt") ->
{ k1_hub_c == 1:
    Die Unterstadt ist älter als alles, was du bisher gesehen hast. Die Häuser sind aus einem dunkleren Stein gebaut, glatt geschliffen von Jahrhunderten Regen, und sie stehen so dicht, dass sich ihre Dachtraufen über den Gassen berühren und darunter eine ewige Dämmerung herrscht. Wasser läuft überall, in Rinnen, über Treppenstufen, aus Mauerritzen, und das Geräusch hört nie auf. An einer Treppe wächst ein einzelner Baum, verkrüppelt, mit drei Blättern. # bild: unterstadt # stimmung: spannung
    Oben, über dir, siehst du ein gewaltiges Tor, das hinauf zum Kathedralenbezirk führt, zum Sitz der Heilenden Kirche. Es ist verschlossen, mit Ketten so dick wie dein Arm. Wer hindurch will, braucht einen Schlüssel, und niemand hier unten sieht aus, als würde er dir einen geben. # lore: heilende_kirche
- else:
    {~Das Wasser in den Rinnen rauscht, und irgendwo tropft es in einen Eimer, der längst übergelaufen ist.|In der Unterstadt ist es noch dunkler geworden, oder deine Augen sind müder.|Ein Fenster schlägt, auf, zu, auf, zu, und niemand schließt es.}
}
// [ERWEITERT] Einsicht kostet leise: Ab 2 hört man, was nicht da ist (einmal).
{ k1_hub_c > 1 and einsicht >= 2: {Hinter einem Fenster ruft jemand deinen Namen, {name}, zweimal, leise und freundlich, wie man jemanden zum Essen ruft. Das Fenster ist von außen zugenagelt, und die Nägel sind alt.|} }
- (wohin)
+ [Hinab in die Kanalisation] -> k1_c_kanal
+ {eileen_stufe == 1} [Die Rabenfedern auf dem Dach über den Gräbern] -> k1_c_eileen
+ [Zu den Gräbern] -> k1_c_graeber
+ {kanal_leiter} [Die Leiter hinauf nach Zentral-Yharnam] -> k1_hub_b
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen] -> ampulle_ruhig -> wohin
+ {kleriker == "besiegt"} [An der Laterne an der Brücke in den Traum]
    ~ laterne = -> k1_hub_c
    -> traum_von_laterne
+ {kleriker == "besiegt"} [Über die große Brücke zurück nach Zentral-Yharnam]
    Auf der Brücke liegt die Bestie noch, wo sie gefallen ist. Die Ratten haben angefangen, und das Geweih ragt über die Kutschen wie die Krone eines umgestürzten Baumes. Du gehst vorbei, ohne stehen zu bleiben.
    -> k1_hub_b
+ {kleriker != "besiegt"} [Zurück über die Brücke]
    ~ bruecke_von = "unten"
    -> k1_n1_kleriker
+ [{k1_c_graeber:Durch das Tor mit dem Namen Oedon|Durch das Tor hinter dem Friedhof}] -> k1_n2_gascoigne

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON] Ratten, Leichenbecken, das Riesenschwein. Wenn das Mädchen draußen ist, frisst das Schwein es; es trägt dann ihr rotes Band.
-> betreten("kanal") ->
{ k1_c_kanal == 1:
    Unter der Stadt fließt eine zweite Stadt, aus Wasser und Dunkelheit. Die Kanäle sind breit und gewölbt wie die Schiffe einer Kirche, und das Wasser reicht dir bis an die Knie. Es ist kalt, so kalt, dass es nach wenigen Schritten nicht mehr wehtut, und es riecht nach allem, was eine Stadt nicht mehr haben will. # bild: kanal # stimmung: grauen
    Ratten, so groß wie Hunde, sehen dir von den Simsen aus zu, ohne zu fliehen. Krähen, die nicht fliegen, hocken auf etwas, das du erst für einen Haufen Lumpen hältst. Und dann kommst du an ein Becken, in dem sich die Toten stapeln, Dutzende, aufgequollen, bleich, ineinander verschränkt, als hätten sie sich im Sterben aneinander festgehalten. An einem Handgelenk hängt noch ein Krankenhausband aus Leinen. Niemand hat sie begraben. # lore: bestienseuche
    { herkunft == "ueberlebender": Du hast so etwas schon einmal gesehen, zu Hause, im letzten Winter, als keiner mehr übrig war, der die anderen hätte begraben können. Du drehst dich nicht weg. Du hast es damals auch nicht getan. }
}
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    { schwein == "tot":
        Das Schwein ist wieder da. Du hast es getötet, und trotzdem steht es da, als hätte die Nacht es neu geboren, so wie sie dich neu gebiert, jedes Mal.
    }
    ~ schwein = ""
    Weiter hinten, im Halbdunkel, schmatzt etwas. Etwas Großes, Schweres, das im Wasser wühlt. Es ist ein Schwein, oder es war einmal eines, doppelt so groß wie ein Ochse, mit einem Fell voller Geschwüre und Hauern, gelb wie alte Zähne. Es frisst. # bild: kanal_schwein # stimmung: grauen
    Neben ihm im Wasser liegt etwas Kleines. Ein Kleid, das einmal hell war. Ein Schuh. Und aus dem Maul des Schweins hängt, zwischen den Hauern, ein rotes Band. {maedchen_gesehen:Du hast es schon einmal gesehen, um einen Fensterriegel geknotet, damit eine Mutter den Weg nach Hause findet.|Ein Haarband, wie Mädchen es tragen.} # quest: maedchen_tot
    Deine Hand ist schon auf dem Weg zu ihm, bevor du sie losschickst.
}
{ schwein == "tot": -> danach }
{ schwein == "umgangen":
    Das Schwein wühlt noch immer im Wasser, dort, wo du dich an ihm vorbeigeschoben hast. Es hebt den Kopf, als du kommst, und lässt ihn wieder sinken. # bild: kanal_schwein
}
{ schwein == "" and not maedchen_tot:
    Weiter hinten, im Halbdunkel, schmatzt etwas Großes. Ein Schwein, doppelt so groß wie ein Ochse, mit Hauern, gelb wie alte Zähne, wühlt im Wasser nach etwas, das du nicht sehen willst. # bild: kanal_schwein
}
+ [Das Schwein stellen] -> kampf
+ {schwein != "umgangen"} [Am Rand vorbei zur Leiter schleichen]
    ~ schwein = "umgangen"
    Du drückst dich an die schleimige Wand und schiebst dich Fingerbreit um Fingerbreit vorwärts. Das Schwein hebt einmal den Kopf und schnüffelt. Du hörst auf zu atmen. Dann frisst es weiter.
    -> leiter
+ {schwein == "umgangen"} [Wieder vorbei, zur Leiter] -> leiter
+ [Zurück] -> k1_hub_c

= kampf
# stimmung: kampf
- (t1)
Das Schwein hebt den Kopf. Es sieht dich, und es senkt den Schädel, scharrt mit den Vorderhufen im Wasser, dass es spritzt, und die kleinen roten Augen werden starr. # anzeichen: schwein_ansturm
+ [Zur Seite, im letzten Moment]
    Es rennt. Du wartest, bis es so nah ist, dass du seinen heißen, fauligen Atem spürst, und springst zur Seite. Es donnert an dir vorbei und rammt die Wand mit solcher Wucht, dass Steine aus dem Gewölbe brechen.
    -> t2
+ {staerke >= 1} [Den Ansturm mit der Schulter abfangen]
    Du stemmst die Füße in den Schlamm unter dem Wasser und nimmst den Schädel mit der Schulter, so wie man ein Tor zuhält. Die Wärme der Puppe sitzt in deinen Armen, und du hältst. Das Schwein schiebt, quiekt, und als es zurückweicht, um Anlauf zu nehmen, ist seine Flanke offen. # notiz: staerke_genutzt
    -> t2
+ [Stehen bleiben und zustechen]
    Du stemmst dich gegen den Ansturm. Es ist, als stelle man sich einer Lawine entgegen. Die Hauer reißen dir den Schenkel auf, und du fliegst ins Wasser.
    ~ zuletzt = schwein_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Es dreht sich, schwerfällig, und reißt das Maul auf. Darin stecken noch Fetzen von dem, was es gefressen hat. # anzeichen: biss
+ [Auf den Rücken, dorthin, wo es nicht beißen kann]
    Du kletterst ihm auf den Rücken, krallst dich in das borstige Fell, und während es sich bockend um sich selbst dreht, stößt du zu, zwischen die Schulterblätter, bis es zusammenbricht.
    -> sieg
+ [Zurückweichen]
    Du weichst zurück, aber das Wasser ist tief und zäh, und es ist schneller als du. Seine Zähne schließen sich um deinen Arm.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
~ echos = echos + 3
Das Schwein sinkt ins Wasser, und das Wasser färbt sich, langsam, wie Tinte in einem Glas.
{ maedchen_tot and not band:
    ~ band = true
    Du ziehst das rote Band aus seinem Maul. Es ist nass und schwerer, als ein Band sein sollte, und dunkler, als es {maedchen_gesehen:am Fensterriegel war|sein sollte}. Du wickelst es dir um zwei Finger und steckst es ein. # notiz: rotes_band
}
-> leiter

= leiter
{ not kanal_leiter:
    Am Ende des Kanals führt eine eiserne Leiter nach oben, zu einem Gitter. Es ist von unten verriegelt. Du schiebst den rostigen Riegel zurück, und das Gitter schwingt auf, und durch die Öffnung siehst du ein Stück Himmel, das du kennst: die Dächer von Zentral-Yharnam, ganz in der Nähe der Laterne. Ein Weg zurück, der nicht über die Brücke führt. # notiz: abkuerzung
    ~ kanal_leiter = true
}
-> k1_hub_c

= danach
Das Wasser riecht nach Eisen. Das Schwein liegt, wo es liegt, und die Ratten haben schon angefangen. Die Leiter am Ende des Kanals steht offen.
-> k1_hub_c

=== k1_c_eileen ===
// TITEL: Eileen über den Gräbern
// [ERWEITERT] Zweite und letzte Begegnung in Kapitel 1. Sie beobachtet Gascoigne. Bereitet die Partnerschaft in Kapitel 2 vor (das Angebot kommt nur hier).
-> betreten("eileen_graeber") ->
~ eileen_stufe = 2
Auf dem Dach einer alten Totengräberhütte sitzt {eileen_genannt:Eileen|die Frau im Federmantel}, so reglos wie eine der Krähen, die auf dem Friedhof unter ihr hocken. Als du zu ihr hinaufkletterst, rückt sie ein Stück zur Seite, ohne den Blick abzuwenden. # bild: daecher_eileen # stimmung: ruhig
{ eileen < 0:
    Sie sagt lange nichts. Dann: „Geh. Das hier ist nichts für jemanden, der nicht weiß, wann man den Mund hält.“ # notiz: eileen_kalt
    -> k1_hub_c
}
// [ERWEITERT] Einsicht kostet leise: Eileen merkt es.
{ einsicht >= 2:
    Sie mustert dich, länger als nötig, und tippt sich mit einem Finger gegen die Schläfe der Maske. „Du siehst schon zu viel“, sagt sie. „Merkt man an den Augen. Wird nicht besser.“ # notiz: einsicht_eileen
}
{ gascoigne2:
    Ihr Blick hängt am Tor mit dem Namen darüber. „Reingegangen“, sagt sie. „Nicht wieder rausgekommen. Ich warte.“
- else:
    Sie zeigt mit dem Schnabel ihrer Maske nach unten, ins Halbdunkel zwischen den Grabsteinen. Dort bewegt sich ein großer Schatten in einem langen Mantel.{q_frau == 1: Du kennst diesen Gang. Du hast ihn auf dem Platz am Scheiterhaufen gesehen.}
}
Sie greift nach der Schnur an ihrem Hals und dreht eines der Abzeichen ans Licht, ein schlichtes aus Eisen. „Der hier hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher.“ Sie lässt es zurückfallen. Mehr sagt sie nicht. # lore: blutrausch # notiz: wie_jaeger_kippen
{ eileen_frage_offen and (q_frau == 1 or gascoigne2):
    „Der Pater“, sagt sie. „Jetzt gesehen?“
    ~ eileen_frage_offen = false
}
* {q_frau == 1 or gascoigne2} [Sie bitten, ihn zu verschonen]
    ~ eileen = eileen + 1
    { q_frau == 1:
        Du bittest sie und sagst ihr, was er für dich getan hat.
    - else:
        Du bittest sie trotzdem. Er hat seinen Namen zu sich selbst gesagt, zwischen den Gräbern, wie einen Gegenstand, den man in der Tasche ertastet.
    }
    Eileen schweigt lange. „Heute Nacht töte ich niemanden“, sagt sie. „Aber ich bin hier.“ Eine Pause. „Hoffentlich lernst du nie, wozu.“ # notiz: eileen_bitte
* [Ihr anbieten, mit ihr zu jagen]
    ~ eileen = eileen + 2
    Du sagst ihr, dass du verstehst, was sie tut. Dass jemand es tun muss. Dass sie es vielleicht nicht allein tun müsste. Zum ersten Mal dreht sie den Kopf zu dir, und hinter den gläsernen Augen der Maske ist für einen Augenblick nichts als Überraschung. „Nicht heute. Drüben, im Kathedralenbezirk, vor der Kapelle. Wenn du dann noch willst.“ # quest: eileen_angebot
* [Schweigend neben ihr sitzen]
    ~ eileen = eileen + 1
    ~ eileen_name = true
    Ihr sitzt nebeneinander und schweigt, zwei Jäger auf einem Dach über den Toten. Unten tropft Wasser in ein Grab. Nach einer Weile zieht Eileen einen Handschuh aus, bricht ein Stück Dörrfleisch in zwei Hälften und reicht dir eine, ohne hinzusehen. Ihre Hand ist schmal und voller alter Narben. „Name?“, fragt sie, kauend. Du sagst ihn ihr. Sie wiederholt ihn nicht. Aber sie nickt, als hätte sie ihn irgendwo abgelegt, wo sie ihn wiederfindet.
- Dann steht sie auf, ein Rascheln von Federn, und ist fort. # stimmung: ruhig
-> k1_hub_c

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON] Der Friedhof und der Name Oedon (im Original Name des Gebiets; Bedeutung bleibt offen).
// [ERWEITERT] Die Inschrift über dem Tor. Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren. Das frische Grab des Bäckerjungen.
// Stimme Gascoigne (kippend): ein Wort kehrt zu oft wieder, Höflichkeiten fallen weg, die Anrede rutscht.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Die Gräber beginnen ohne Warnung, zwischen den Häusern, als sei die Stadt hier einfach in einen Friedhof übergegangen. Grabsteine, schief und moosig, so dicht, dass man nicht zwischen ihnen gehen kann, ohne auf einen Namen zu treten. Engel mit abgeschlagenen Gesichtern. Holzkreuze, in die jemand Hufeisen genagelt hat, und auf vielen Gräbern ein Stein auf der Brust des Toten, damit er liegen bleibt. # bild: graeber # stimmung: grauen
    Über einem schmiedeeisernen Tor am Ende des Friedhofs steht ein einziges Wort in den Stein gemeißelt: Oedon. Kein Vorname, keine Jahreszahl, kein Gebet.{ herkunft == "gelehrter": In keinem der schlecht gebundenen Bücher über diese Stadt stand dieser Name, und du hast sie alle gelesen.} Du sprichst es leise aus. # lore: oedon
    { einsicht >= 1: Für einen Augenblick antwortet etwas. Keine Stimme: ein Druck hinter den Ohren, wie vor einem Gewitter, das nicht vom Himmel kommt. }
}
{ gascoigne2: -> still }
~ gascoigne2 = true
Zwischen den Gräbern kniet ein Mann. Es ist Gascoigne, und er kniet nicht, um zu beten. Vor ihm steckt ein neues Holzkreuz in frisch aufgeworfener Erde, und auf dem Querbalken steht in Kreide: Jonas, Bäckerlehrling. Er hat die Hände in diese Erde gegraben und wühlt darin, langsam, beinahe zärtlich. Seine Unterarme sind dunkel davon, Erde und Blut, und er lacht leise über etwas, das du nicht siehst. Der Geruch, der von ihm ausgeht, ist so stark, dass du durch den Mund atmest. # lore: blutrausch # stimmung: grauen
{ q_frau == 1:
    Er hebt den Kopf, als er dich hört, und für einen langen Moment ist in seinem Gesicht nichts. Kein Erkennen. Dann, einen Atemzug zu spät, lächelt er. {gascoigne_name:„Henryk. Nein. Nein, nein. Du bist … {name}. {name}. Natürlich.“|„Ah. Der Fremde. Der Fremde vom Feuer. Natürlich, natürlich.“}
- else:
    Er fährt herum, die Axt schon erhoben, und hält dich für eine Bestie, bis du sprichst. Dann lässt er die Axt sinken, langsam. „Gascoigne“, sagt er, nicht zu dir, sondern zu sich selbst, wie man sich einen Gegenstand in der Tasche ertastet, um sicher zu sein, dass er noch da ist. # lore: gascoigne
}
{ gascoigne_verraten:
    ~ gascoigne = gascoigne - 2
    Dann zieht er die Luft ein, einmal, zweimal, und das Lächeln verschwindet. „Federn“, sagt er. „Du riechst nach Krähe.“ Er wischt sich die Hände am Mantel ab, langsam, gründlich. „Die Krähe weiß, wo ich bin. Natürlich weiß sie es.“
}
* {q_frau == 1 or spieluhr or maedchen_gesehen} [Ihn an seine Tochter erinnern]
    ~ gascoigne = gascoigne + 1
    -> tochter
* {eileen_stufe >= 1} [Ihn vor der Frau mit den Rabenfedern warnen]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    Du erzählst ihm von der Frau mit den Rabenfedern. Er lacht, und es ist ein trauriges Lachen. „Eileen. Die Krähe. Die hat Henryk und mich schon lange im Auge. Lange, lange. Und sie hat recht, verdammt, sie hat ja recht.“ Er klopft dir auf die Schulter, zu fest. „Stell dich nicht zwischen sie und mich. Hörst du? Nicht dazwischen.“ # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
* {q_frau == 1 or q_mutter >= 1} [Fragen, wo seine Frau ist]
    Er sieht dich an, als verstehe er die Frage nicht. Dann lächelt er. „Zu Hause. Ich hab sie heimgeschickt. Sie ist mir nachgekommen, hierher, in so eine Nacht, so eine Dummheit, so eine Dummheit, und ich hab sie heimgeschickt.“ Während er das sagt, reibt er die Hände aneinander, als wolle er die Graberde loswerden, und sie wird nicht weniger. # notiz: viola_luege # stimmung: grauen
    -> warnung
* {q_frau == 0 and not spieluhr and not maedchen_gesehen} [Ihn ansprechen]
    Du sagst etwas, irgendetwas, über die Nacht und die Gräber. Er hört zu, den Kopf schief, als lausche er einer anderen Stimme hinter deiner.
    -> warnung
* [Leise zurückweichen]
    ~ gascoigne = gascoigne - 1
    Du gehst rückwärts, Schritt für Schritt, ohne ihn aus den Augen zu lassen. Er sieht dir nach. Er folgt dir nicht.
    -> k1_hub_c

= tochter
{
- spieluhr:
    Du nimmst die Spieluhr aus der Tasche und ziehst sie auf. Das Lied steigt zwischen den Gräbern auf, dünn und klar, und Gascoigne erstarrt. Seine Hände sinken in den Schoß. Unter dem Verband laufen ihm Tränen über die Wangen, und er wischt sie nicht weg. Er summt mit, leise, jede Note. Als das Lied endet, flüstert er einen Namen, den du nicht verstehst, und dann: „Die Kleine. Die Kinder. Die Kleine.“ # lore: spieluhr # stimmung: schoen
    ~ gascoigne = gascoigne + 1
- maedchen_gesehen:
    Du erzählst ihm von dem Fenster am Brunnenplatz, von der kleinen Stimme hinter den Läden und dem roten Band am Riegel. Er nickt langsam, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
- else:
    Du erinnerst ihn an die Kleine, von der er am Scheiterhaufen gesprochen hat. Er nickt langsam, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
}
-> warnung

= warnung
Dann steht er auf. Er ist sehr groß, so nah, und von ihm geht eine Hitze aus wie von einem Ofen. Er deutet mit der Axt auf das Tor mit dem Namen darüber. „Bleib weg vom Grab. Da drin ist meine. Meine Bestie. Ich jag sie schon so lange. So lange.“ Er legt den Kopf schief, als lausche er einer Frage, die niemand gestellt hat. „Ich weiß nur nicht mehr, wie sie aussieht.“ # notiz: gascoigne_warnung
Dann geht er durch das Tor, und der Nebel schließt sich hinter ihm.
-> k1_hub_c

= still
Die Gräber schweigen. Am Holzkreuz des Bäckerlehrlings ist die Erde aufgewühlt, und von dort führen tiefe Handabdrücke durch den Schlamm bis zum Tor.
-> k1_hub_c
