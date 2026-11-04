// KAPITEL 1, NADELÖHR 1: DIE KLERIKER-BESTIE AUF DER GROSSEN BRÜCKE.
// Jeder Weg in die Unterstadt führt hier vorbei (bis die Leiter in der Kanalisation offen ist).
// Wege: allein kämpfen, mit Gascoigne kämpfen, ablenken, fliehen. Nur wer sie besiegt, bekommt die Laterne an der Brücke
// und das Blutgedächtnis, das bei Gascoigne eine bessere Entscheidung möglich macht.
// [KANON] Die Bestie klettert herab auf die Brücke; riesiger Arm, Geweih, Kreischen; feueranfällig; man kann Gascoigne als Helfer rufen.
// [KANON] Ihre Beute ist das Abzeichen der Kirchenjäger; der Itemtext sagt sinngemäß, dass gerade Kleriker die schlimmsten Bestien wurden (hier nur als Gerücht).
// [ERWEITERT] Ablenken, Fliehen, das Blutgedächtnis, das Lied auf der Brücke.

=== k1_n1_kleriker ===
// TITEL: NADELÖHR 1: Kleriker-Bestie
-> betreten("bruecke") ->
{ kleriker == "besiegt": -> uebergang }
{ k1_n1_kleriker == 1:
    Die große Brücke spannt sich über einen Abgrund, dessen Grund im Nebel verschwindet. Sie ist breit genug für vier Kutschen nebeneinander, und es stehen Kutschen auf ihr, umgestürzt, zerschlagen, die Pferde noch im Geschirr, aufgedunsen und starr. Zwischen den Rädern liegen Menschen. Niemand hat sie weggeräumt. Am anderen Ende ragt ein Turm in den Himmel, und dahinter, gewaltig und schwarz, die Silhouette der Kathedrale. Die Sonne hängt hinter dem Turm, so tief wie vor der Klinik, nicht einen Fingerbreit tiefer. # bild: bruecke # stimmung: grauen
    Es ist sehr still. Selbst die Glocken schweigen. Du gehst bis zur Mitte der Brücke, und da hörst du es: ein Kratzen, hoch über dir, Stein auf Stein, Horn auf Stein. Etwas klettert den Turm herab.
- else:
    Wieder die Brücke, wieder die toten Pferde. Und wieder das Kratzen am Turm, Horn auf Stein. # bild: bruecke # stimmung: grauen
}
Es springt. Es landet so schwer zwischen den Kutschen, dass die Brücke unter deinen Füßen bebt und Steinbrocken in den Abgrund stürzen. # kampf: kleriker
Es ist größer als ein Haus, ausgemergelt bis auf die Knochen, und das Fell hängt in verfilzten Strähnen von ihm herab wie nasses Moos von einem toten Baum. Aus seinem Schädel wächst ein Geweih, verdreht und verknotet, als hätte es nicht wachsen wollen und es trotzdem getan. Sein linker Arm ist ein Unding, doppelt so lang wie der rechte, aufgebläht von Muskeln, an deren Ende Krallen sitzen wie Sicheln. Und um seinen Hals, in das Fell eingewachsen, hängen die Reste von etwas Weißem. Ein Kragen. Ein Priesterkragen.
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    Dein Blick bleibt an dem langen Arm hängen und will nicht los. Du zählst die Gelenke, ohne es zu wollen: Schulter, Ellbogen, noch ein Ellbogen, noch einer. Du zählst noch einmal und kommst auf eine andere Zahl. Hinter deiner Stirn öffnet sich etwas, ein Spalt, so schmal wie der unter einer Tür, und durch diesen Spalt siehst du, dass der Arm nicht gewachsen ist, sondern noch wächst, jetzt, während du hinsiehst. Einsicht, denkst du, und weißt nicht, woher das Wort kommt. # notiz: erste_einsicht # lore: einsicht # stimmung: grauen
}
{ schreie >= 1: Es reißt das Maul auf und kreischt, und du erkennst den Laut wieder, den du über den Dächern gehört hast. Jetzt hat er einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Es hat dich nicht vergessen. Es dreht den Kopf, langsam, und sucht genau die Stelle, an der du stehst. }
+ {q_frau == 1} [Gascoigne rufen und gemeinsam kämpfen] -> rufen
+ [Allein kämpfen] -> kampf
+ {kiesel > 0 or molotow > 0} [Etwas werfen, damit sie sich abwendet, und an ihr vorbei] -> ablenken
+ [Über das Geländer und durch die Gassen fliehen] -> fliehen
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= rufen
{ gascoigne_verraten:
    Du rufst seinen Namen über die Brücke. Das Echo kommt zurück, einmal, zweimal, und niemand sonst. Erst jetzt siehst du die Federn auf dem Pflaster am Brückenkopf, schwarz, ein ganzer Kreis davon, und dazwischen dunkle Tropfen. Wer hier gewartet hat, hat auf etwas anderes gewartet als auf dich. # notiz: federn_bruecke
    -> kampf
}
{ gascoigne2:
    Du rufst seinen Namen über die Brücke. Nur der Nebel antwortet. Wo er jetzt ist, hast du gesehen: hinter einem Tor mit einem Namen darüber.
    -> kampf
}
-> mit_gascoigne

= kampf
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den übergroßen linken Arm und schiebt den Kopf vor, schnüffelnd, als könne sie dich nicht sehen, nur riechen. Die Schulter des riesigen Armes hebt sich, langsam, und unter dem Fell ziehen sich die Muskeln zu einem Knoten zusammen. # anzeichen: kleriker_hieb
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
    Du reißt Gilberts Flammenwerfer hoch und hältst die Flamme in die schnüffelnde Schnauze. Das verfilzte Fell fängt sofort Feuer, und die Bestie wirft sich zurück, schlägt blind um sich, mit dem brennenden Kopf zwischen den Schultern. Gilbert hatte recht. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis ihr Geweih den Nebel zu berühren scheint, und reißt das Maul auf. Ihr Hals weitet sich, die Brust füllt sich. # anzeichen: kreischen
+ [Ohren zu, Abstand halten]
    Du presst die Hände auf die Ohren und gehst rückwärts. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen, und für einen Augenblick weißt du nicht mehr, wo oben ist. Aber du stehst.
    -> t3
+ [Jetzt angreifen, solange sie schreit]
    Du nutzt den Moment und greifst an. Der Schrei trifft dich aus nächster Nähe, als schlage dir jemand mit einem Brett auf beide Ohren zugleich. Du taumelst, und ihr kleiner Arm erwischt dich, beinahe beiläufig.
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
Sie fällt auf alle viere zurück. Dann zieht sie sich zusammen, die Hinterläufe unter den Leib, den langen Arm nach vorn gestreckt, wie eine Feder, die gleich losschnellt. # anzeichen: sprung
{ gelernt ? sprung: Wer sich so streckt, landet dort, wo du jetzt stehst. Genau dort. }
+ {parade} [Im Absprung schießen]
    Du wartest, {parade_quelle == "gascoigne":wie Gascoigne es dir auf dem Platz gezeigt hat|wie der alte Mann im Traum es beschrieben hat}, bis das ganze Gewicht in den Sprung geht, und dann schießt du. Die Bestie wankt mitten in der Luft, verliert die Richtung und schlägt vor dir auf die Brust. Bevor sie sich fangen kann, bist du über ihr und stößt zu, tief, mit beiden Händen. # notiz: viszeral
    -> phase2
+ [Seitlich wegrollen]
    Du rollst dich zur Seite. Sie landet dort, wo du eben noch gestanden hast, und das Pflaster zerspringt unter ihr.
    -> phase2
+ [Den Sprung abfangen]
    Du stellst dich ihr entgegen, und schon während du es tust, weiß dein Rücken, dass es falsch ist. Das Gewicht begräbt dich, und die Brücke unter deinen Schulterblättern ist kalt.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und etwas hat sich verändert. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste eines kahlen Baumes im Winter. Sie ist schneller jetzt. Und der Kragen um ihren Hals ist verschwunden, verbrannt oder verschluckt. # phase
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
{ waffe:
- "saege": Die Zähne deiner Klinge haben sich in ihrem Fell festgefressen. Du musst den Fuß auf ihre Brust stellen, um sie herauszuziehen.
- "axt": Die Axt steckt so tief in ihrem Hals, dass du sie mit beiden Händen und deinem ganzen Gewicht lösen musst.
- "stock": Die Stahlpeitsche rollt sich von ihrem Arm, Glied um Glied, und jedes Glied ist rot.
}
Aus ihrem Leib steigt der Schimmer der Echos und fließt in dich hinein, mehr als je zuvor, so viel, dass dir schwindlig wird. Unter dem Fell, über der Brust, wo es dünner wird, siehst du Narben. Kleine, runde, in ordentlichen Reihen, Dutzende, Hunderte, wie die Stiche einer Nadel. Du reibst dir die Armbeuge, ohne es zu merken. # notiz: nadelnarben
Zwischen den Fellsträhnen glänzt etwas: ein silbernes Abzeichen, ein Schwert auf einem Wappen. Das Zeichen der Kirchenjäger. Du denkst an das, was man sich in dieser Stadt zuflüstert, dass aus Kirchenleuten die schlimmsten Bestien werden. Beweisen kann es dir niemand. Das Abzeichen wiegt trotzdem schwer. # lore: kleriker_bestien # notiz: jaegerabzeichen
-> gedaechtnis

= mit_gascoigne
// [KANON-nah] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Du rufst seinen Namen über die Brücke, und noch bevor das Echo verklungen ist, ist er da, aus dem Nebel, als habe er die ganze Zeit dort gestanden. Gascoigne lacht. Es ist ein zu lautes Lachen für diesen Ort, und es springt zwischen den toten Pferden hin und her, und er stürzt sich auf die Bestie, mit offenem Mund, die Zähne bloß. Du hast einen Hund so laufen sehen, einmal, auf einen Fuchs zu. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. # anzeichen: kleriker_hieb
+ [Ihm den Rücken decken]
    Du stellst dich neben ihn, Schulter an Schulter, und ihr nehmt den Schlag gemeinsam, du mit der Waffe, er mit der Axt. Dann treibt ihr sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er hält den Takt, Hieb, Schritt, Hieb, ohne hinzusehen, und dir fällt auf, dass er dabei atmet wie ein Mann beim Holzhacken, ruhig, gleichmäßig.
    -> g2
+ [Die Gelegenheit nutzen und zuschlagen]
    Während sie nach ihm schlägt, bist du an ihrer Seite und triffst, tief. Gascoigne fängt den Arm mit der Axt ab und brüllt etwas, das du nicht verstehst, kehlig und rund, in einer Sprache, die nicht die dieser Stadt ist.
    -> g2
- (g2)
{ spieluhr:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er. Eine Melodie, leise und zärtlich, die nicht in diesen Lärm passt. Es ist dieselbe Melodie, die die Spieluhr in deiner Tasche spielt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
- else:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er, leise und zärtlich, ein Kinderlied, das nicht in diesen Lärm passt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
}
Die Bestie fällt. Gascoigne hört nicht auf. Er schlägt weiter, in den Kadaver hinein, und weiter, nass und gleichmäßig, und er lacht dabei, leise, fast zärtlich, bis du ihn an der Schulter packst. # notiz: gascoigne_kippt # stimmung: grauen
* [Ihn beim Namen rufen, bis er aufhört]
    ~ gascoigne = gascoigne + 1
    Du sagst seinen Namen. Dann noch einmal. Beim dritten Mal hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er lacht verlegen, und es ist wieder sein eigenes Lachen. „Ruhig. Ruhig. Das geht einem ins Blut, wenn man nicht aufpasst.“ Er wischt die Klinge am Mantel ab. „Pass du besser auf als ich.“
* [Ihn nach dem Lied fragen]
    ~ gascoigne = gascoigne + 1
    ~ gascoigne_lied = true
    Du fragst ihn, was er da gesummt hat. Er hört auf zu schlagen und sieht dich an, als hättest du ihn geweckt. „Gesummt?“ Er denkt nach. „Das Lied von der Kleinen. Sie heißt …“ Er bricht ab. Sein Mund bleibt offen. „Sie heißt“, sagt er noch einmal, und dann nichts mehr. Er senkt die Axt sehr langsam, als wäre sie schwerer geworden.
* [Fragen, wer sie war]
    ~ gascoigne = gascoigne + 1
    Er sieht auf den Kadaver hinunter, auf das, was vom Kragen übrig ist. „Ich glaub, der hat uns getraut. Viola und mich. Unten in der Kapelle am Fluss.“ Er schweigt. „Oder einer, der genauso gesungen hat. Hier singen viele gleich.“
* [Nichts sagen]
    ~ gascoigne = gascoigne - 1
    Du sagst nichts. Nach einer Weile hört er von selbst auf, steht schwer atmend da und starrt auf das, was er angerichtet hat. Dann geht er, ohne ein Wort, in Richtung der Gräber.
- -> sieg

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Du wirfst einen Kieselstein, so weit du kannst, an der Bestie vorbei. Er klappert gegen eine Kutsche am anderen Ende der Brücke, hell und deutlich, und die Bestie fährt herum, schneller, als du es ihr zugetraut hättest, und schnüffelt in die falsche Richtung.
- else:
    ~ molotow = molotow - 1
    Du wirfst den Molotow nicht auf sie, sondern daneben, auf die Kutschen am Rand. Das alte Holz fängt sofort Feuer, und die Bestie wendet sich kreischend dem Brand zu, als erinnere sie sich an etwas.
}
Du läufst. Geduckt, zwischen den toten Pferden, so leise, wie es mit klopfendem Herzen geht. Hinter dir schlägt etwas so schwer ins Pflaster, dass dir die Zähne klappern, aber du drehst dich nicht um, nicht bis du die Treppen am anderen Ende erreichst. Dann erst siehst du zurück. Sie steht noch auf der Brücke, riesig im Nebel, und sieht dir nach. # notiz: kleriker_lebt
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
{ not marke_benutzt:
    ~ marke_benutzt = true
    // [ERWEITERT] Die Marke führt nur hinein. PRÜFEN: Kanon der Jägermarke.
    Im Fallen denkst du: Das war ein Weg hinein. Einen Weg hinaus hat dir niemand in die Hand gedrückt.
}
-> traum_von_laterne

= gedaechtnis
// [ERWEITERT] BLUTGEDÄCHTNIS: die Mechanik, über die das Spiel Vorgeschichte und Vorteile verschenkt.
Du stehst vor ihrem Kopf. Er ist so groß wie ein Fass, und aus dem verknoteten Geweih tropft noch Blut, langsam, einzeln, wie aus einem undichten Dach. Du denkst an die Klinik, an das, was du gesehen hast, als fremdes Blut in deinen Arm floss. Deine Hand will dorthin, wie eine Zunge zu einem wackelnden Zahn will. Deine Schultern wollen weg.
+ [Den Kopf berühren]
    Deine Hand liegt auf dem nassen Fell, und das Blut ist warm, und dann bist du nicht mehr auf der Brücke. # stimmung: grauen
    Er sah durch diese Augen eine Kathedrale, hoch und hell, Kerzen zu Tausenden, und hörte einen Gesang, so schön, dass es wehtat. Er kniete. Er trug einen weißen Kragen. Eine Hand legte sich auf seinen Kopf, und eine Nadel ging in seinen Arm, und das Blut, das hineinfloss, war heilig, hieß es, das Blut der Kirche, das reinste. Es brannte. Es brannte jeden Tag ein bisschen mehr. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Dann ein anderer Tag. Er sang, und seine Stimme kippte mitten im Lied, und alle drehten sich zu ihm um. Er sah auf seine Hände. Sie waren zu groß. Und ganz hinten, in einem Winkel, den das Blut noch nicht erreichte, saß noch jemand und suchte nach einem Namen. Seinem eigenen. Und fand ihn nicht.
    Du reißt die Hand zurück. Du kniest auf der Brücke, und dein Atem geht, als wärst du gerannt. Aber jetzt weißt du, woran man den Augenblick erkennt, in dem einer kippt: die Stimme, die bricht. Der Blick auf die eigenen Hände. Und dass dahinter, wenn man ihn ruft, noch jemand antworten kann, für einen Atemzug. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Nicht berühren und weitergehen]
    Du lässt die Hand sinken. Was immer in diesem Blut ist, es gehört nicht dir. Hinter dir seufzt etwas, das längst tot sein sollte, oder es ist nur der Wind im Geweih.
    -> uebergang

= uebergang
{ kleriker == "besiegt" and not bruecke_laterne:
    ~ bruecke_laterne = true
    Am Ende der Brücke, wo der Turm in den Fels übergeht, steht eine Laterne. Als du sie berührst, flammt sie auf, und die Boten kriechen aus dem Boden und neigen die Köpfe, als grüßten sie dich. # lore: laternen
}
Hinter der Brücke führen breite Treppen hinab, in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen Dächern, ragen die Spitzen von Grabsteinen.
-> k1_hub_c
