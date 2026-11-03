// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei (bis die Leiter in der Kanalisation offen ist).
// Wege: allein kämpfen, mit Gascoigne kämpfen, ablenken, fliehen. Nur wer sie besiegt, bekommt die Laterne an der Brücke
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// [KANON] Die Bestie klettert herab auf die Brücke; riesiger Arm, Geweih, Kreischen; feueranfällig; man kann Gascoigne als Helfer rufen.
// [KANON] Ihre Beute (Jägerabzeichen) sagt sinngemäß: Gerade Kleriker wurden zu den abscheulichsten Bestien.
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis.

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
{ kleriker == "besiegt": -> uebergang }
{ k1_n1_kleriker == 1:
    Die große Brücke spannt sich über einen Abgrund, dessen Grund im Nebel verschwindet. Sie ist breit genug für vier Kutschen nebeneinander, und es stehen Kutschen auf ihr, umgestürzt, zerschlagen, die Pferde noch im Geschirr, aufgedunsen und starr. Zwischen den Rädern liegen Menschen. Niemand hat sie weggeräumt. Am anderen Ende ragt ein Turm in den Himmel, und dahinter, gewaltig und schwarz, die Silhouette der Kathedrale. # bild: bruecke # stimmung: grauen
    Es ist sehr still. Selbst die Glocken schweigen. Du gehst bis zur Mitte der Brücke, und da hörst du es: ein Kratzen, hoch über dir, Stein auf Stein, Horn auf Stein. Etwas klettert den Turm herab.
- else:
    Wieder die Brücke, wieder die toten Pferde. Und wieder das Kratzen am Turm, als hätte es nur darauf gewartet, dass du zurückkehrst. # bild: bruecke # stimmung: grauen
}
Es springt. Es landet so schwer zwischen den Kutschen, dass die Brücke unter deinen Füßen bebt und Steinbrocken in den Abgrund stürzen. # kampf: kleriker
Es ist größer als ein Haus, ausgemergelt bis auf die Knochen, und das Fell hängt in verfilzten Strähnen von ihm herab wie nasses Moos von einem toten Baum. Aus seinem Schädel wächst ein Geweih, verdreht und verknotet, als hätte es nicht wachsen wollen und es trotzdem getan. Sein linker Arm ist ein Unding, doppelt so lang wie der rechte, aufgebläht von Muskeln, an deren Ende Krallen sitzen wie Sicheln. Und um seinen Hals, in das Fell eingewachsen, hängen die Reste von etwas Weißem. Ein Kragen. Ein Priesterkragen.
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    Etwas geschieht in deinem Kopf, als du es ansiehst. Es ist, als öffne sich eine Tür, von der du nicht wusstest, dass es sie gibt, und durch den Spalt fällt ein Licht, das nicht hell ist, sondern nur wahr. Für einen Herzschlag verstehst du, dass die Welt größer ist, als du es für möglich gehalten hast, und dass das keine gute Nachricht ist. # notiz: erste_einsicht # stimmung: grauen
}
{ schreie >= 1: Es reißt das Maul auf und kreischt, und du erkennst den Laut wieder, den du über den Dächern gehört hast. Jetzt hat er einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Es hat dich nicht vergessen. Es dreht den Kopf, langsam, und sucht genau die Stelle, an der du stehst. }
+ {q_frau == 1 and not gascoigne_verraten} [Gascoigne rufen und gemeinsam kämpfen] -> mit_gascoigne
+ [Allein kämpfen] -> kampf
+ {kiesel > 0 or molotow > 0} [Etwas werfen, damit sie sich abwendet, und an ihr vorbei] -> ablenken
+ [Über das Geländer und durch die Gassen fliehen] -> fliehen
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= kampf
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den übergroßen linken Arm und schiebt den Kopf vor, schnüffelnd, als könne sie dich nicht sehen, nur riechen. Die Schulter des riesigen Armes hebt sich, langsam, und du siehst, wie sich unter dem Fell die Muskeln zu einem Knoten zusammenziehen. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Du kennst diesen Knoten. Der Arm kommt im Bogen, von links nach rechts, weit und tödlich, und er kommt flach. }
+ [Nach rechts, unter den Arm]
    Du läufst nicht weg, du läufst auf sie zu, nach rechts, dorthin, wo der Bogen beginnt. Der Arm fegt über deinen Kopf hinweg, so nah, dass der Luftzug dir die Haare zerzaust, und reißt eine Kutsche mit sich in den Abgrund. Du bist unter ihr, an ihrer Flanke, und deine Waffe gräbt sich in die Rippen.
    -> t2
+ [Nach hinten ausweichen]
    Du springst zurück, so weit du kannst. Es ist nicht weit genug. Der Bogen ist länger, als ein Arm sein dürfte, und die Krallen erwischen dich an der Hüfte und schleudern dich gegen ein Wagenrad.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Feuer in ihr Gesicht]
    Du reißt Gilberts Flammenwerfer hoch und hältst die Flamme in die schnüffelnde Schnauze. Das verfilzte Fell fängt sofort Feuer, als habe es darauf gewartet, und die Bestie wirft sich zurück, schlägt blind um sich, mit dem brennenden Kopf zwischen den Schultern. Feuer, hat Gilbert gesagt. Bestien fürchten Feuer. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis ihr Geweih den Nebel zu berühren scheint, und reißt das Maul auf. Du siehst ihren Hals sich weiten, siehst die Brust sich füllen. # anzeichen: kreischen
+ [Ohren zu, Abstand halten]
    Du presst die Hände auf die Ohren und gehst rückwärts. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen, und für einen Augenblick weißt du nicht mehr, wo oben ist. Aber du stehst.
    -> t3
+ [Jetzt angreifen, solange sie schreit]
    Du nutzt den Moment und greifst an. Der Schrei trifft dich aus nächster Nähe, und es ist, als schlage dir jemand mit einem Brett auf beide Ohren zugleich. Du taumelst, und ihr kleiner Arm erwischt dich, beinahe beiläufig.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
+ {molotow > 0} [Molotow ins offene Maul]
    ~ molotow = molotow - 1
    Du wirfst. Die Flasche fliegt in einem hohen Bogen und zerspringt genau zwischen den Zähnen. Das Feuer frisst sich in den Schlund, der Schrei bricht ab und wird zu einem nassen, gurgelnden Würgen, und die Bestie stürzt auf die Knie.
    -> phase2
+ {ampulle > 0} [Die Blutampulle trinken]
    Während sie schreit, ist Zeit. Du stößt dir die Ampulle in den Schenkel.
    -> ampulle_ruhig -> t3
- (t3)
Sie fällt auf alle viere zurück. Dann zieht sie sich zusammen, die Hinterläufe unter den Leib, den langen Arm nach vorn gestreckt, und du begreifst, dass sie gleich springen wird. # anzeichen: sprung
{ gelernt ? sprung: Wer sich so streckt, landet dort, wo du jetzt stehst. Genau dort. }
+ {parade} [Im Absprung schießen]
    Du wartest. Du wartest, wie Gascoigne es dir gezeigt hat, bis das ganze Gewicht in den Sprung geht, und dann schießt du. Die Bestie wankt mitten in der Luft, verliert die Richtung und schlägt vor dir auf die Brust. Bevor sie sich fangen kann, bist du über ihr und stößt zu, tief, mit beiden Händen, bis zum Heft. # notiz: viszeral
    -> phase2
+ [Seitlich wegrollen]
    Du rollst dich zur Seite. Sie landet dort, wo du eben noch gestanden hast, und das Pflaster zerspringt unter ihr.
    -> phase2
+ [Den Sprung abfangen]
    Du stellst dich ihr entgegen. Ein Fehler, von dem du schon während des Fehlers weißt, dass er einer ist. Das Gewicht begräbt dich, und die Brücke unter deinem Rücken ist kalt.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und etwas hat sich verändert. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste eines kahlen Baumes im Winter. Sie ist schneller jetzt. Wütender. Und es ist, als sei das, was von dem Menschen in ihr übrig war, endgültig verbrannt. # phase
- (t4)
Der verzweigte Arm schlägt um sich, links, rechts, links, ein Sturm aus Knochen und Krallen. # anzeichen: kleriker_hieb
+ [Zwischen den Hieben nach vorn, dorthin, wo der Arm nicht hinkommt]
    Zwischen zwei Schlägen ist ein Atemzug Zeit. Du nimmst ihn. Du bist an ihrer Brust, so nah, dass du ihren Herzschlag spürst, und dort, wo der lange Arm dich nicht erreichen kann, schlägst du zu, wieder und wieder, bis das Herz aufhört.
    -> sieg
+ [Rückwärts, bis die Kutschen dich decken]
    Du flüchtest dich hinter eine Kutsche. Sie zersplittert unter dem nächsten Schlag wie eine Streichholzschachtel, und ein Speichenrad trifft dich an der Schläfe.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t4
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke
- (sieg)
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ echos = echos + 6
Die Bestie bricht zusammen. Sie fällt nicht wie ein Tier, das stirbt, sondern wie ein Gebäude, das einstürzt: langsam erst, dann auf einmal, und ihr Geweih kratzt noch lange über das Pflaster, nachdem alles andere still ist. Dann ist auch das still. # stimmung: ruhig
Aus ihrem Leib steigt der Schimmer der Echos und fließt in dich hinein, mehr als je zuvor, so viel, dass dir schwindlig wird. Und zwischen den Fellsträhnen glänzt etwas: ein silbernes Abzeichen, ein Schwert auf einem Wappen, das Zeichen der Kirchenjäger. Auf der Rückseite, kaum noch lesbar, ist eingraviert, was die Kirche selbst von ihnen wusste: dass von all den Jägern der Kirche ausgerechnet die Kleriker zu den abscheulichsten Bestien wurden. # lore: kleriker_bestien # notiz: jaegerabzeichen
~ laterne = -> k1_hub_c
-> gedaechtnis

= mit_gascoigne
// [KANON-nah] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Du rufst seinen Namen über die Brücke, und noch bevor das Echo verklungen ist, ist er da, aus dem Nebel, als habe er die ganze Zeit dort gewartet. Gascoigne lacht. Es ist ein zu lautes Lachen für diesen Ort, ein Lachen, das zwischen den toten Pferden hin und her springt, und er stürzt sich auf die Bestie mit einer Freude, die dir Angst macht. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. # anzeichen: kleriker_hieb
+ [Ihm den Rücken decken]
    Du stellst dich neben ihn, Schulter an Schulter, und ihr nehmt den Schlag gemeinsam, du mit der Waffe, er mit der Axt. Dann treibt ihr sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er arbeitet wie eine Maschine. Er ist der beste Jäger, den du je gesehen hast.
    -> g2
+ [Die Gelegenheit nutzen und zuschlagen]
    Während sie nach ihm schlägt, bist du an ihrer Seite und triffst, tief. Gascoigne fängt den Arm mit der Axt ab und brüllt etwas, das du nicht verstehst, in einer Sprache, die nicht diese ist.
    -> g2
- (g2)
{ spieluhr:
    Und mitten im Kampf, zwischen zwei Axthieben, hörst du ihn summen. Eine Melodie, leise und zärtlich, die so gar nicht in diesen Lärm passen will. Es ist dieselbe Melodie, die die kleine Spieluhr in deiner Tasche spielt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
}
Die Bestie fällt. Gascoigne hört nicht auf. Er schlägt weiter, in den Kadaver hinein, und weiter, und das Geräusch ist nass und gleichmäßig wie das eines Metzgers, und er lacht dabei, leise, fast zärtlich, bis du ihn an der Schulter packst. # notiz: gascoigne_kippt # stimmung: grauen
* [Ihn beruhigen]
    ~ gascoigne = gascoigne + 1
    Du sagst seinen Namen. Dann noch einmal. Beim dritten Mal hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er lacht verlegen, und es ist wieder sein eigenes Lachen. Die Jagd, sagt er, gehe einem ins Blut, wenn man nicht aufpasse. Du solltest aufpassen. Er wischt die Klinge an seinem Mantel ab und geht, ohne sich umzudrehen.
* [Nichts sagen]
    Du sagst nichts. Nach einer Weile hört er von selbst auf, steht schwer atmend da und starrt auf das, was er angerichtet hat. Dann geht er, ohne ein Wort, in Richtung der Gräber.
- -> sieg

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Du wirfst einen Kieselstein, so weit du kannst, an der Bestie vorbei. Er klappert gegen eine Kutsche am anderen Ende der Brücke, hell und deutlich, und die Bestie fährt herum, mit einer Schnelligkeit, die du ihr nicht zugetraut hättest, und schnüffelt in die falsche Richtung.
- else:
    ~ molotow = molotow - 1
    Du wirfst den Molotow nicht auf sie, sondern daneben, auf die Kutschen am Rand. Das alte Holz fängt sofort Feuer, und die Bestie wendet sich kreischend dem Brand zu, als erinnere sie sich an etwas.
}
Du läufst. Geduckt, zwischen den toten Pferden, so leise, wie du es mit klopfendem Herzen vermagst. Hinter dir schlägt etwas so schwer ins Pflaster, dass dir die Zähne klappern, aber du drehst dich nicht um, nicht bis du die Treppen am anderen Ende erreichst. Dann erst siehst du zurück. Sie steht noch auf der Brücke, riesig im Nebel, und sie sieht dir nach. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
Du springst über das Geländer, auf ein tiefer gelegenes Dach, rutschst über nasse Ziegel und fällst in eine Gasse. Über dir hörst du sie, wie sie dir folgt, von Dach zu Dach, und die Ziegel regnen herab, wo sie aufsetzt. Einmal erwischt sie dich, als du um eine Ecke biegst, ein Hieb, der dich gegen eine Hauswand schleudert. # anzeichen: sprung # stimmung: kampf
~ zuletzt = sprung
~ treffer(2)
{ leben <= 0: -> tod }
Du rappelst dich auf, rennst weiter, eine Treppe hinab, noch eine, und dann gibt der Boden unter dir nach, und du stürzt in knietiefes, eiskaltes Wasser, das nach Fäulnis stinkt. Die Kanalisation. Über dir, am Rand des Schachtes, kreischt sie. Aber sie kommt dir nicht nach. # notiz: kleriker_lebt
~ kleriker = "geflohen"
-> k1_c_kanal

= marke
~ jaegermarken = jaegermarken - 1
Du zerdrückst die Marke in der Faust. Das Messing wird warm, dann heiß, und dann zerfällt die Brücke, die Bestie, der Nebel, wie ein Traum zerfällt, wenn man erwacht. # klang: marke
-> traum_von_laterne

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
Du stehst vor ihrem Kopf. Er ist so groß wie ein Fass, und aus dem verknoteten Geweih tropft noch Blut, langsam, einzeln, wie aus einem undichten Dach. Etwas in dir will ihn berühren. Etwas anderes in dir, älter und klüger, will das um keinen Preis.
+ [Den Kopf berühren]
    Deine Hand liegt auf dem nassen Fell, und das Blut ist warm, und dann bist du nicht mehr auf der Brücke. # stimmung: grauen
    Du siehst durch fremde Augen. Eine Kathedrale, hoch und hell, Kerzen zu Tausenden, und Gesang, so schön, dass er weh tut. Du kniest. Du trägst einen weißen Kragen. Eine Hand legt sich auf deinen Kopf, und eine Nadel geht in deinen Arm, und das Blut, das hineinfließt, ist heilig, heißt es, das Blut der Kirche, das reinste, das älteste. Es brennt. Es brennt jeden Tag ein bisschen mehr. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Dann ein anderer Tag. Du singst, und deine Stimme kippt mitten im Lied, und alle drehen sich zu dir um. Du weißt nicht, warum sie dich so ansehen. Du siehst deine Hände an. Sie sind zu groß. Und das Schlimmste ist nicht der Schmerz, nicht das Fell, nicht der Hunger. Das Schlimmste ist, dass ganz hinten, in einem Winkel, den das Blut nicht erreicht, noch jemand sitzt und nach einem Namen sucht. Seinem eigenen. Und ihn nicht findet. # lore: kleriker_bestien
    Du reißt die Hand zurück. Du kniest auf der Brücke, und dein Atem geht, als wärst du gerannt. Aber du weißt jetzt etwas, das man nicht aus Büchern lernt: woran man den Moment erkennt, in dem einer kippt. Die Stimme, die bricht. Der Blick auf die eigenen Hände. Und dass dahinter, wenn man ihn ruft, noch jemand antworten kann, für einen Atemzug. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Nicht berühren und weitergehen]
    Du lässt die Hand sinken. Was immer in diesem Blut ist, es gehört nicht dir. Du wendest dich ab, und es ist dir, als seufze hinter dir etwas, das längst tot sein sollte.
    -> uebergang

= uebergang
{ kleriker == "besiegt":
    Am Ende der Brücke, wo der Turm in den Fels übergeht, steht eine Laterne. Als du sie berührst, flammt sie auf, und die Boten kriechen aus dem Boden und neigen die Köpfe, als grüßten sie dich. # lore: laternen
}
Hinter der Brücke führen breite Treppen hinab, in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen Dächern, siehst du die Spitzen von Grabsteinen.
-> k1_hub_c
