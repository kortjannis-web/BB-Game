// KAPITEL 1, TEIL C: UNTERSTADT UND KANALISATION. Freie Reihenfolge. Führt zu NADELÖHR 2 (Grab des Oedon).
// [KANON] Zu Gascoigne kommt man über die Kanalisation; dort das Riesenschwein; eine Leiter führt zurück nach oben.
// Keine Laterne hier, außer an der Brücke (nur wenn die Kleriker-Bestie besiegt ist). Wer stirbt, läuft weit zurück.

=== k1_hub_c ===
// TITEL: Unterstadt (frei)
-> betreten("unterstadt") ->
{ k1_hub_c == 1:
    Die Unterstadt ist älter als alles, was du bisher gesehen hast. Die Häuser sind aus einem dunkleren Stein gebaut, glatt geschliffen von Jahrhunderten Regen, und sie stehen so dicht, dass sich ihre Dachtraufen über den Gassen berühren und darunter eine ewige Dämmerung herrscht. Wasser läuft überall, in Rinnen, über Treppenstufen, aus Mauerritzen, und das Geräusch hört nie auf. # bild: unterstadt # stimmung: spannung
    Oben, über dir, siehst du ein gewaltiges Tor, das hinauf zum Kathedralenbezirk führt, zum Sitz der Heilenden Kirche. Es ist verschlossen, mit Ketten so dick wie dein Arm. Wer hindurch will, braucht einen Schlüssel, und du ahnst, dass niemand ihn dir freiwillig geben wird. # lore: heilende_kirche
- else:
    {~Das Wasser in den Rinnen rauscht, und irgendwo tropft es in einen Eimer, der längst übergelaufen ist.|In der Unterstadt ist es noch dunkler geworden, oder deine Augen sind müder.|Ein Fenster schlägt im Wind, auf, zu, auf, zu, und niemand schließt es.}
}
- (wohin)
+ [Hinab in die Kanalisation] -> k1_c_kanal
+ {eileen_stufe == 1} [Die Rabenfedern auf dem Dach über den Gräbern] -> k1_c_eileen
+ [Zu den Gräbern] -> k1_c_graeber
+ {kanal_leiter} [Die Leiter hinauf nach Zentral-Yharnam] -> k1_hub_b
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Blutampulle trinken] -> ampulle_ruhig -> wohin
+ {kleriker == "besiegt"} [An der Laterne an der Brücke in den Traum] -> traum_von_laterne
+ {kleriker != "besiegt"} [Zurück über die Brücke] -> k1_n1_kleriker
+ [Durch das Friedhofstor zum Grab des Oedon] -> k1_n2_gascoigne

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON] Ratten, Leichenbecken, das Riesenschwein. Wenn das Mädchen draußen ist, frisst das Schwein es; es trägt dann ihr rotes Band.
-> betreten("kanal") ->
{ k1_c_kanal == 1:
    Unter der Stadt fließt eine zweite Stadt, aus Wasser und Dunkelheit. Die Kanäle sind breit und gewölbt wie die Schiffe einer Kirche, und das Wasser reicht dir bis an die Knie. Es ist kalt, so kalt, dass es nach wenigen Schritten nicht mehr wehtut, und es riecht nach allem, was eine Stadt nicht mehr haben will. # bild: kanal # stimmung: grauen
    Ratten, so groß wie Hunde, sehen dir von den Simsen aus zu, ohne zu fliehen. Krähen, die nicht fliegen, hocken auf etwas, das du erst für einen Haufen Lumpen hältst. Und dann kommst du an ein Becken, in dem sich die Toten stapeln, Dutzende, aufgequollen, bleich, ineinander verschränkt, als hätten sie sich im Sterben aneinander festgehalten. Niemand hat sie begraben. Niemand wird es tun. Die Seuche hat hier unten ihr eigenes Massengrab. # lore: bestienseuche
}
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    { schwein == "tot":
        ~ schwein = ""
        Das Schwein ist wieder da. Du hast es getötet, du weißt es, und trotzdem steht es da, als hätte die Nacht es neu geboren, so wie sie dich neu gebiert, jedes Mal.
    }
    Weiter hinten, im Halbdunkel, schmatzt etwas. Etwas Großes, Schweres, das im Wasser wühlt. Es ist ein Schwein, oder es war einmal eines, doppelt so groß wie ein Ochse, mit einem Fell voller Geschwüre und Hauern, gelb wie alte Zähne. Es frisst. # bild: kanal_schwein # stimmung: grauen
    Neben ihm im Wasser liegt etwas Kleines. Ein Kleid, das einmal hell war. Ein Schuh. Und aus dem Maul des Schweins hängt, zwischen den Hauern, ein rotes Band, wie Mädchen es sich ins Haar binden. # quest: maedchen_tot
    Du denkst an die Stimme hinter den Fensterläden. An das Räucherwerk, das sie angezündet hat, weil Mama es so gesagt hatte. An den Satz, den du ihr gesagt hast, weil es leichter war. Es gibt kein Wort für das, was du in diesem Moment fühlst, und du wirst den Rest dieser Nacht vergeblich danach suchen.
}
{ schwein != "": -> danach }
{ not maedchen_tot:
    Weiter hinten, im Halbdunkel, schmatzt etwas Großes. Ein Schwein, doppelt so groß wie ein Ochse, mit Hauern, gelb wie alte Zähne, wühlt im Wasser nach etwas, das du nicht sehen willst. # bild: kanal_schwein
}
+ [Das Schwein stellen] -> kampf
+ [Am Rand vorbei zur Leiter schleichen]
    ~ schwein = "umgangen"
    Du drückst dich an die schleimige Wand und schiebst dich Zentimeter um Zentimeter vorwärts. Das Schwein hebt einmal den Kopf, schnüffelt, und dein Herz bleibt stehen. Dann frisst es weiter.
    -> leiter
+ [Zurück] -> k1_hub_c

= kampf
# stimmung: kampf
- (t1)
Das Schwein hebt den Kopf. Es sieht dich, und es senkt den Schädel, scharrt mit den Vorderhufen im Wasser, dass es spritzt, und die kleinen roten Augen werden starr. # anzeichen: ansturm
+ [Zur Seite, im letzten Moment]
    Es rennt. Du wartest, bis es so nah ist, dass du seinen heißen, fauligen Atem spürst, und springst zur Seite. Es donnert an dir vorbei und rammt die Wand mit solcher Wucht, dass Steine aus dem Gewölbe brechen.
    -> t2
+ [Stehen bleiben und zustechen]
    Du stemmst dich gegen den Ansturm. Es ist, als stelle man sich einer Lawine entgegen. Die Hauer reißen dir den Schenkel auf, und du fliegst ins Wasser.
    ~ zuletzt = ansturm
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
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
~ echos = echos + 3
Das Schwein sinkt ins Wasser, und das Wasser färbt sich, langsam, wie Tinte in einem Glas.
{ maedchen_tot:
    ~ band = true
    Du ziehst das rote Band aus seinem Maul. Es ist nass und schwerer, als ein Band sein sollte, und die Farbe ist dunkler, als sie gewesen sein muss, als sie es sich am Morgen ins Haar band. Du steckst es ein. Du weißt nicht, warum. Vielleicht, weil sonst niemand es tun würde. # notiz: rotes_band
}
-> leiter

= leiter
Am Ende des Kanals führt eine eiserne Leiter nach oben, zu einem Gitter. Es ist von unten verriegelt. Du schiebst den rostigen Riegel zurück, und das Gitter schwingt auf, und durch die Öffnung siehst du ein Stück Himmel, das du kennst: die Dächer von Zentral-Yharnam, ganz in der Nähe der Laterne. Ein Weg zurück, der nicht über die Brücke führt. Zum ersten Mal in dieser Nacht fühlt sich die Stadt ein klein wenig kleiner an. # notiz: abkuerzung
~ kanal_leiter = true
-> k1_hub_c

= danach
Das Wasser riecht nach Eisen. Das Schwein liegt, wo es liegt, und die Ratten haben schon angefangen. Die Leiter am Ende des Kanals steht offen.
-> k1_hub_c

=== k1_c_eileen ===
// TITEL: Eileen über den Gräbern
// [ERWEITERT] Zweite Begegnung ohne Kampf. Sie beobachtet Gascoigne. Bereitet die Partnerschaft in Kapitel 2 vor.
-> betreten("eileen_graeber") ->
~ eileen_stufe = 2
Auf dem Dach einer alten Totengräberhütte sitzt Eileen, so reglos wie eine der Krähen, die auf dem Friedhof unter ihr hocken. Sie beobachtet etwas zwischen den Gräbern. Als du zu ihr hinaufkletterst, rückt sie ein Stück zur Seite, ohne den Blick abzuwenden. # bild: daecher_eileen # stimmung: ruhig
{ eileen < 0:
    Sie sagt nichts. Nach einer Weile sagt sie, du sollst gehen; dies hier sei keine Arbeit für jemanden, der nicht weiß, wann man schweigt. # notiz: eileen_kalt
    -> k1_hub_c
}
Sie zeigt mit dem Schnabel ihrer Maske nach unten, ins Halbdunkel zwischen den Grabsteinen. Ein Jäger kippt nicht auf einmal, sagt sie leise. Zuerst kommt der Geruch, der nicht mehr aus dem Mantel geht. Dann das Lachen an Stellen, an denen niemand lacht. Und dann vergisst er Namen, zuerst die von Fremden, dann die von Freunden, und zuletzt seinen eigenen. Wer Jäger jagt, sagt sie, wartet meistens auf den dritten Schritt. # lore: blutrausch # lore: jaeger_der_jaeger # notiz: wie_jaeger_kippen
Unten, zwischen den Gräbern, bewegt sich ein großer Schatten in einem langen Mantel. Du weißt, wer es ist, bevor du ihn erkennst.
* [Sie bitten, ihn zu verschonen]
    ~ eileen = eileen + 1
    Du bittest sie. Du sagst ihr, was er für dich getan hat. Eileen schweigt lange. Dann sagt sie, dass sie nicht vorhabe, heute Nacht irgendjemanden zu töten. Aber sie werde hier sein. Und sie wünsche dir, dass du nie lernen müssest, warum. # notiz: eileen_bitte
* [Ihr anbieten, mit ihr zu jagen]
    ~ eileen = eileen + 2
    Du sagst ihr, dass du verstehst, was sie tut. Dass jemand es tun muss. Dass sie es vielleicht nicht allein tun müsste. Sie dreht zum ersten Mal den Kopf zu dir, und durch die gläsernen Augen der Maske glaubst du, so etwas wie Überraschung zu sehen. Nicht heute, sagt sie. Aber drüben, im Kathedralenbezirk, vor der Kapelle. Wenn du dann noch willst. # quest: eileen_angebot
* [Schweigend neben ihr sitzen]
    Ihr sitzt nebeneinander und schweigt, zwei Jäger auf einem Dach über den Toten. Es ist die friedlichste Viertelstunde dieser Nacht.
- Dann steht sie auf, ein Rascheln von Federn, und ist fort. # stimmung: ruhig
-> k1_hub_c

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON] Der Friedhof und der Name Oedon (nur als Name; Bedeutung bleibt offen).
// [ERWEITERT] Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Die Gräber beginnen ohne Warnung, zwischen den Häusern, als sei die Stadt hier einfach in einen Friedhof übergegangen. Grabsteine, schief und moosig, so dicht, dass man nicht zwischen ihnen gehen kann, ohne auf einen Namen zu treten. Engel mit abgeschlagenen Gesichtern. Kreuze, die keine Kreuze sind, sondern etwas Älteres, mit zu vielen Armen. # bild: graeber # stimmung: grauen
    Über einem schmiedeeisernen Tor am Ende des Friedhofs steht ein einziges Wort in den Stein gemeißelt: Oedon. Kein Vorname, keine Jahreszahl, kein Gebet. Nur dieses Wort, das sich anfühlt, als sei es nicht für menschliche Münder gemacht. Du sprichst es leise aus, und für einen Augenblick ist dir, als antworte etwas, nicht mit einer Stimme, sondern mit einem Druck hinter den Ohren, wie vor einem Gewitter. # lore: oedon
}
{ gascoigne2: -> still }
~ gascoigne2 = true
Zwischen den Gräbern kniet ein Mann. Es ist Gascoigne, und er kniet nicht, um zu beten. Er hat die Hände in die Erde eines frischen Grabes gegraben und wühlt darin, langsam, beinahe liebevoll. Er riecht nach Blut, so stark, dass es dir den Atem nimmt, und er lacht leise über etwas, das du nicht siehst. # lore: blutrausch # stimmung: grauen
{ q_frau == 1:
    Er hebt den Kopf, als er dich hört, und für einen langen, schrecklichen Moment ist in seinem Gesicht nichts. Kein Erkennen. Dann, nach einem Augenblick zu lang, lächelt er. Ah, sagt er. Du. Der Fremde vom Scheiterhaufen. Natürlich.
- else:
    Er fährt herum, die Axt schon erhoben, und hält dich für eine Bestie, bis du sprichst. Dann lässt er die Axt sinken, langsam, und sagt seinen Namen, Gascoigne, als müsse er ihn sich selbst sagen, um ihn nicht zu vergessen. # lore: gascoigne
}
* [Ihn an seine Tochter erinnern]
    ~ gascoigne = gascoigne + 1
    -> tochter
* {eileen_stufe >= 1} [Ihn vor der Frau mit den Rabenfedern warnen]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    Du erzählst ihm von der Frau mit den Rabenfedern. Er lacht, und es ist ein trauriges Lachen. Eileen, sagt er. Die Jägerin der Jäger. Sie sei schon hinter Henryk her gewesen, seinem alten Partner, damals, und sie habe recht gehabt, verdammt noch mal, sie habe recht gehabt. Er klopft dir auf die Schulter. Danke, sagt er. Aber du solltest dich nicht zwischen ihn und sie stellen. # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
* [Fragen, wo seine Frau ist]
    Er sieht dich an, als verstehe er die Frage nicht. Dann lächelt er. Zu Hause, sagt er. Er habe sie nach Hause geschickt. Sie sei ihm nachgekommen, hierher, in diese Nacht, so eine Dummheit, und er habe sie nach Hause geschickt, weil es hier zu gefährlich sei. Während er das sagt, wischt er sich die Hände an seinem Mantel ab, langsam, gründlich, und sie sind rot bis zu den Ellbogen. # notiz: viola_luege # stimmung: grauen
    -> warnung
* [Leise zurückweichen]
    Du gehst rückwärts, Schritt für Schritt, ohne ihn aus den Augen zu lassen. Er sieht dir nach. Er folgt dir nicht. Noch nicht.
    -> k1_hub_c

= tochter
{ spieluhr:
    Du nimmst die Spieluhr aus der Tasche und ziehst sie auf. Das Lied steigt zwischen den Gräbern auf, dünn und klar, und Gascoigne erstarrt. Seine Hände sinken in den Schoß. Hinter dem Verband laufen ihm Tränen über die Wangen, und er merkt es nicht. Er summt mit, leise, jede Note, als hätte er nie etwas anderes gesungen. Als das Lied endet, flüstert er einen Namen. Dann noch einen. # lore: spieluhr # stimmung: schoen
    ~ gascoigne = gascoigne + 1
- else:
    Du erzählst ihm von dem Fenster am Brunnenplatz, von der kleinen Stimme hinter den Läden. Er nickt langsam. Seine Töchter schlafen, sagt er. Er jage, damit sie schlafen können. Das habe er immer getan. Dafür sei er Jäger geworden.
}
-> warnung

= warnung
Dann steht er auf. Er ist sehr groß, so nah, und du spürst die Hitze, die von ihm ausgeht, wie von einem Ofen. Halte dich fern vom Grab, sagt er und deutet mit der Axt auf das Tor mit dem Namen Oedon. Dort sei die Bestie, die er jage. Er jage sie schon so lange. Er wisse nur nicht mehr, sagt er, und es klingt beinahe verwundert, wie sie aussehe. # notiz: gascoigne_warnung
Dann geht er durch das Tor, und der Nebel schließt sich hinter ihm.
-> k1_hub_c

= still
Die Gräber schweigen. Im frischen Erdreich, dort, wo er gekniet hat, sind tiefe Spuren von Händen, und sie führen zum Tor.
-> k1_hub_c
