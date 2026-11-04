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
    Kein Rad knarrt, kein Pferd schnaubt. Selbst die Glocken schweigen. Du gehst bis zur Mitte der Brücke, und da hörst du es: ein Kratzen, hoch über dir, Stein auf Stein, Horn auf Stein. Etwas klettert den Turm herab.
- else:
    Wieder die Brücke, wieder die toten Pferde. Und wieder das Kratzen am Turm, Horn auf Stein. # bild: bruecke # stimmung: grauen
}
Es springt. Es landet so schwer zwischen den Kutschen, dass die Brücke unter deinen Füßen bebt und Steinbrocken in den Abgrund stürzen. # kampf: kleriker
Es ist größer als ein Haus, ausgemergelt bis auf die Knochen, und das Fell hängt in verfilzten Strähnen von ihm herab wie nasses Moos von einem toten Baum. Aus seinem Schädel wächst ein Geweih, verdreht und verknotet, als hätte es nicht wachsen wollen und es trotzdem getan. Sein linker Arm ist ein Unding, doppelt so lang wie der rechte, aufgebläht von Muskeln, an deren Ende Krallen sitzen wie Sicheln. Und um seinen Hals, in das Fell eingewachsen, hängen die Reste von etwas Weißem. Ein Kragen. Ein Priesterkragen.
{ k1_n1_kleriker == 1:
    ~ einsicht = einsicht + 1
    Dein Blick bleibt an dem langen Arm hängen und will nicht los. Du zählst die Gelenke, ohne es zu wollen: Schulter, Ellbogen, noch ein Ellbogen, noch einer. Du zählst noch einmal und kommst auf eine andere Zahl. Hinter deiner Stirn öffnet sich etwas, ein Spalt, so schmal wie der unter einer Tür, und durch diesen Spalt siehst du, dass der Arm noch wächst, jetzt, während du hinsiehst. Einsicht. Das Wort ist einfach da, wie ein Geschmack im Mund. # notiz: erste_einsicht # lore: einsicht # stimmung: grauen
}
{ schreie >= 1: Es reißt das Maul auf und kreischt, und du erkennst den Laut wieder, den du über den Dächern gehört hast. Jetzt hat er einen Körper. }
{ kleriker == "abgelenkt" or kleriker == "geflohen": Es hat dich nicht vergessen. Es dreht den Kopf, langsam, und sucht genau die Stelle, an der du stehst. }
+ {q_frau == 1} [Nach Gascoigne rufen] -> rufen
+ [Die Säge ausklappen und ihr allein entgegengehen] -> kampf
+ {kiesel > 0 or molotow > 0} [Sie mit einem Wurf ablenken und vorbeischleichen] -> ablenken
+ [Über das Geländer springen und fliehen] -> fliehen
+ {jaegermarken > 0} [Die Jägermarke in der Faust zerdrücken] -> marke

= rufen
{ gascoigne_verraten:
    Du rufst seinen Namen über die Brücke. Das Echo kommt zurück, einmal, zweimal, und niemand sonst. Erst jetzt siehst du die Federn auf dem Pflaster am Brückenkopf, schwarz, ein ganzer Kreis davon, und dazwischen dunkle Tropfen. Wer hier gewartet hat, hat auf etwas anderes gewartet als auf dich. # notiz: federn_bruecke
    -> kampf
}
{ gascoigne2:
    Du rufst seinen Namen über die Brücke. Nur der Nebel antwortet.{k1_c_graeber.warnung: Wo er jetzt ist, hast du gesehen: hinter einem Tor mit einem Namen darüber.}
    -> kampf
}
-> mit_gascoigne

= kampf
// Sieben Takte in zwei Phasen (Entscheidung des Nutzers 2026-11-04: Bosskämpfe 6 bis 8 Takte).
// Tempo gemischt: das Anzeichen ruhig und genau, die Folge kurz und hart. Möglichkeiten nennen die Richtung.
# stimmung: kampf
- (t1)
Die Bestie stützt sich auf den übergroßen linken Arm und schiebt den Kopf vor, schnüffelnd, als könne sie dich nicht sehen, nur riechen. Die Schulter des riesigen Armes hebt sich, langsam, und unter dem Fell ziehen sich die Muskeln zu einem Knoten zusammen. Der lange Arm steht dir zur Rechten, und unter ihm, zwischen Ellbogen und Pflaster, bleibt ein Spalt. # anzeichen: kleriker_hieb
{ gelernt ? kleriker_hieb: Du kennst diesen Knoten. Der Arm kommt flach aus deiner Rechten und reicht weiter, als du springen kannst. Nur unter ihm ist Platz. }
+ [Nach rechts, unter den Arm]
    Du läufst hinein, nicht weg. Nach rechts, wo der Bogen beginnt. Luftzug über dem Scheitel. Hinter dir kippt eine Kutsche in den Abgrund. Dann bist du an ihrer Flanke, und die Säge beißt in Rippen.
    -> t2
+ [Mit einem Satz zurückspringen]
    Du springst zurück. Zu kurz. Der Bogen ist länger, als ein Arm sein dürfte. Krallen an der Hüfte, dann ein Wagenrad im Rücken.
    ~ zuletzt = kleriker_hieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ [Nach links, aus dem Bogen]
    Der Bogen endet nicht, wo du ihn enden siehst. Die Krallen holen dich ein, am Ende ihrer Bahn, schwächer, aber sie holen dich ein.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Gilberts Flamme in ihre Schnauze halten]
    Du reißt Gilberts Flammenwerfer hoch. Die Flamme fährt in die schnüffelnde Schnauze, das verfilzte Fell fängt sofort. Sie wirft sich zurück und schlägt blind um sich, den brennenden Kopf zwischen den Schultern. Gilbert hatte recht. # notiz: kleriker_feuer
    -> t2
- (t2)
Sie richtet sich auf, höher und höher, bis ihr Geweih im Nebel verschwindet, und reißt das Maul auf. Ihr Hals weitet sich wie ein Blasebalg, die Rippen treten unter dem Fell hervor, und für einen Herzschlag ist es auf der Brücke so still, dass du die Tropfen hörst, die von ihrem Geweih fallen. # anzeichen: kreischen
{ gelernt ? kreischen: Diese Stille kennst du. Sie holt Luft für den Schrei, und wer dann in ihrer Nähe steht, hört eine Weile gar nichts mehr. }
+ [In den Schrei hinein zuschlagen]
    Du greifst an. Der Schrei trifft dich aus nächster Nähe, als schlüge eine Glocke dicht neben deinem Kopf. Du taumelst. Ihr kleiner Arm erwischt dich, beinahe beiläufig.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
+ [Die Ohren zuhalten und zurückweichen]
    Hände auf die Ohren, rückwärts. Der Schrei geht trotzdem durch dich hindurch, durch Haut und Knochen. Einen Augenblick lang weißt du nicht, wo oben ist. Aber du stehst.
    -> t3
+ {molotow > 0} [Den Molotow in ihr offenes Maul werfen]
    ~ molotow = molotow - 1
    Die Flasche fliegt im hohen Bogen und zerspringt zwischen den Zähnen. Feuer im Schlund. Der Schrei bricht ab und wird zu einem nassen, gurgelnden Würgen, und sie stürzt auf die Knie. Du bist an ihr, bevor sie wieder hochkommt, und die Säge reißt ihr die Flanke auf.
    -> t4
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    Während sie schreit, ist Zeit. Du stößt dir die Ampulle in den Schenkel.
    -> ampulle_ruhig -> t3
- (t3)
// [ERWEITERT] Der Wurf mit der Kutsche.
Sie fällt auf alle viere zurück und tastet mit dem langen Arm zwischen die Kutschen, wie eine Hand, die im Dunkeln nach einem Becher sucht. Die Krallen schließen sich um eine Achse. Langsam, fast andächtig, hebt sie die ganze Kutsche vom Pflaster, und der Arm wandert damit nach hinten, weit über ihre Schulter, bis das Holz knarrt. Ihr Kopf zeigt auf dich. # anzeichen: wurf
{ gelernt ? wurf: Was über diese Schulter geht, kommt hoch und schwer zurück, und es kommt genau dorthin, wohin ihr Kopf zeigt. Deckung gibt es dagegen keine. }
+ [Hinter die nächste Kutsche ducken]
    Du kauerst dich hinter eine Kutsche. Die zweite trifft die erste. Beide über dir. Splitter, Eisen, das Gewicht eines toten Pferdes auf deinem Bein.
    ~ zuletzt = wurf
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4
+ [Quer über die Brücke rennen]
    Hinter dir schlägt die Kutsche auf, dort, wo du standest. Holz, Glas, ein Pferdebein, das durch die Luft wirbelt. Dann Stille. Du lebst.
    -> t4
+ [Unter dem erhobenen Arm auf sie zu]
    Die Kutsche fliegt über dich hinweg und zerschellt hinter dir. Ein Hieb in den Bauch, wo das Fell dünn ist. Sie heult. Aber der kleine Arm findet dich auf dem Rückweg und schlägt dich zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t4
- (t4)
Sie zieht sich zusammen, die Hinterläufe unter den Leib, den langen Arm nach vorn gestreckt, und ihr ganzes Gewicht sackt nach hinten, wie bei einer Feder, die man spannt, bis sie zittert. Die Krallen des langen Armes graben sich in die Fugen zwischen den Pflastersteinen. # anzeichen: sprung
{ gelernt ? sprung: Wer sich so streckt, landet dort, wo du jetzt stehst. Genau dort. }
+ {parade} [Im Absprung schießen]
    Du wartest, {parade_quelle == "gascoigne":wie Gascoigne es dir auf dem Platz gezeigt hat|wie der alte Mann im Traum es beschrieben hat}, bis das ganze Gewicht im Sprung liegt. Dann schießt du. Sie wankt mitten in der Luft und schlägt vor dir auf die Brust. Du bist über ihr, bevor sie sich fängt, und stößt zu, tief, mit beiden Händen. # notiz: viszeral
    -> phase2
+ [Zur Seite rollen]
    Du rollst zur Seite. Sie landet, wo du standest. Das Pflaster springt in Platten auf.
    -> phase2
+ [Den Sprung mit der Säge abfangen]
    Du stellst dich ihr entgegen, und schon dabei weiß dein Rücken, dass es falsch ist. Das Gewicht begräbt dich. Die Brücke unter deinen Schulterblättern ist kalt.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> phase2
- (phase2)
Die Bestie kommt wieder hoch, und etwas hat sich verändert. Der lange Arm reißt auf, von der Schulter bis zum Handgelenk, und aus der Wunde wachsen Knochen, weiß und verzweigt wie die Äste eines kahlen Baumes im Winter. Der nächste Schritt kommt, bevor der Staub vom letzten liegt. Und der Kragen um ihren Hals ist verschwunden, verbrannt oder verschluckt. # phase
- (t5)
Der verzweigte Arm schlägt um sich, links, rechts, links, ein Sturm aus Knochen und Krallen. Zwischen den Schlägen schwingt er jedes Mal ein Stück weiter aus, als ziehe ihn sein eigenes Gewicht, und für die Länge eines Atemzugs ist ihre Brust offen. # anzeichen: knochensturm
{ gelernt ? knochensturm: Links, rechts, links, und dann die Lücke. Der Sturm reicht weit, aber nicht bis an ihre Brust. }
+ [Rückwärts hinter die Kutschen]
    Du flüchtest hinter eine Kutsche. Sie birst unter dem nächsten Schlag in Latten und Glas. Ein Speichenrad an der Schläfe.
    ~ zuletzt = knochensturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    Als du wieder stehst, ist sie dir nachgekommen, bis ans Geländer.
    -> t6
+ {staerke >= 1} [Den Knochenarm abfangen und festhalten]
    Du fängst nicht den Hieb, du fängst den Arm. Knochen gegen die Brust, beide Arme darum, und du hältst, mit der Wärme der Puppe in den Schultern. Sie zerrt, einmal, zweimal. Lange genug. Die Säge fährt in die Achsel, bis zum Anschlag. Sie reißt sich los und taumelt rückwärts gegen das Geländer, und der Knochenarm hängt schlaff. # notiz: staerke_genutzt
    -> t6
+ [Zwischen den Hieben nach vorn, an ihre Brust]
    Ein Atemzug Zeit. Du nimmst ihn. An ihrer Brust, so nah, dass du den Herzschlag durch das Fell spürst. Hier erreicht der Arm dich nicht. Du schlägst zu, wieder und wieder. Sie taumelt rückwärts gegen das Geländer.
    -> t6
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(2) -> t5
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke
- (t6)
// [ERWEITERT] Der Ansturm mit dem Geweih.
Am Geländer senkt sie den Kopf, bis das verknotete Geweih auf der Höhe deiner Brust steht. Die Hinterläufe scharren über das Pflaster, einmal, zweimal, und mit jedem Scharren rückt sie ein Stück zur Seite, bis sie dich genau vor den Hörnern hat. Ihre Augen sind halb geschlossen, als ziele sie mit etwas anderem als mit ihnen. Als du einen halben Schritt zur Seite machst, scharrt sie und rückt nach. # anzeichen: ansturm
{ gelernt ? ansturm: Wer vor diesem Geweih davonläuft, läuft in ihrer Richtung. Sie ist schneller. Nur im letzten Augenblick zur Seite, nicht früher. }
+ [Über die Brücke davonrennen]
    Du rennst. Hinter dir das Trommeln ihrer Läufe, näher, näher. Das Geweih erwischt dich im Rücken und wirft dich über eine Kutsche hinweg.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Sofort zur Seite springen]
    Du springst zur Seite, sobald sie losläuft. Sie scharrt nicht mehr. Sie lenkt nur. Das Geweih trifft dich in der Hüfte, mitten im Sprung.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ [Warten, bis das Geweih dich fast berührt]
    Du bleibst stehen. Das Geweih wächst vor dir, ein Wald aus Horn. Jetzt. Ein Schritt nach links. Sie rast vorbei, und das Geländer, gegen das sie prallt, bricht in Stücken in den Abgrund. Sie hängt halb darüber, die Hinterläufe in der Luft.
    -> t7
+ [Dem Geweih entgegenstürmen]
    Du gehst ihr entgegen. Die Säge trifft Horn, prallt ab. Das Geweih nicht. Es hebt dich hoch und lässt dich fallen.
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t7
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen]
    -> ampulle_gefahr(2) -> t6
- (t7)
// [ERWEITERT] Die falsche Ruhe: Sie liegt still, aber der kleine Arm lauert.
Sie liegt auf der Seite, den Knochenarm unter sich begraben, und ihr Atem geht rasselnd und flach, wie bei einem Tier, das man auf der Straße angefahren hat. Der Kopf liegt auf dem Pflaster, ganz nah, das Auge geschlossen. Nur der kleine Arm, der rechte, liegt nicht still. Seine Finger öffnen und schließen sich, langsam, wie bei einem Kind, das im Schlaf nach etwas greift. # anzeichen: letzter_griff
{ gelernt ? letzter_griff: Die Finger. Sie greifen nicht im Schlaf. Sie warten darauf, dass jemand sich über den Kopf beugt. }
+ [Die Säge sofort in ihren Kopf stoßen]
    Du beugst dich über den Kopf. Die kleine Hand schließt sich um deinen Knöchel und reißt dich von den Füßen. Ihr Auge ist offen. Erst als deine Säge in diesem Auge steckt, lässt die Hand los.
    ~ zuletzt = letzter_griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ [Den Stiefel auf die kleine Hand setzen]
    Die Finger schnappen zu, um nichts. Dann stößt du die Säge hinter das Ohr, wo der Schädel dünn ist. Einmal. Es genügt.
    -> sieg
+ {ampulle > 0} [Die Ampulle in den Schenkel stoßen, solange sie liegt]
    Sie liegt. Du nimmst dir die Zeit.
    -> ampulle_ruhig -> t7
- (sieg)
Die Bestie stirbt. Sie stirbt wie ein Gebäude, das einstürzt: langsam erst, dann auf einmal, und ihr Geweih kratzt noch lange über das Pflaster, nachdem alles andere still ist. Dann ist auch das still. # stimmung: ruhig
Von jenseits des Turms, aus der Richtung der Kathedrale, setzt ein Gesang ein. Viele Stimmen, fern und gedämpft, als sängen sie hinter geschlossenen Türen, und sie singen langsam, in einer Tonart, die nicht ganz aufgeht. Sie hören auf, als du hinsiehst. # klang: choral
Die Zähne deiner Klinge haben sich in ihrem Fell festgefressen. Du musst den Fuß auf ihre Brust stellen, um sie herauszuziehen.
-> beute

= beute
~ kleriker = "besiegt"
~ einsicht = einsicht + 1
~ echos = echos + 6
Aus ihrem Leib steigt der Schimmer der Echos und fließt in dich hinein, mehr als je zuvor, so viel, dass dir schwindlig wird. Unter dem Fell, über der Brust, wo es dünner wird, siehst du Narben. Kleine, runde, in ordentlichen Reihen, Dutzende, Hunderte, wie die Stiche einer Nadel. Du reibst dir die Armbeuge, ohne es zu merken. # notiz: nadelnarben
Zwischen den Fellsträhnen glänzt etwas: ein silbernes Abzeichen, ein Schwert auf einem Wappen. Das Zeichen der Kirchenjäger.{ k1_b_gilbert.themen: Du denkst an Gilberts Gerücht, dass aus Kirchenleuten die schlimmsten Bestien werden.| Ein Priesterkragen, und dazu das Abzeichen eines Kirchenjägers.} Beweisen kann es dir niemand. Das Abzeichen wiegt trotzdem schwer. # lore: kleriker_bestien # notiz: jaegerabzeichen
-> gedaechtnis

= mit_gascoigne
// [KANON-nah] Im Original als Helfer rufbar. [ERWEITERT] Gespräch, Lied, er kann nicht aufhören.
~ gascoigne = gascoigne + 1
# stimmung: kampf
Du rufst seinen Namen über die Brücke, und noch bevor das Echo verklungen ist, ist er da, aus dem Nebel, als habe er die ganze Zeit dort gestanden. Gascoigne lacht. Es ist ein zu lautes Lachen für diesen Ort, und es springt zwischen den toten Pferden hin und her, und er stürzt sich auf die Bestie, mit offenem Mund, die Zähne bloß. Du hast einen Hund so laufen sehen, einmal, auf einen Fuchs zu. # notiz: gascoigne_wild
- (g1)
Die Bestie hat nur noch Augen für ihn. Ihr langer Arm hebt sich, der Muskelknoten an der Schulter zieht sich zusammen, und sie holt nach ihm aus. # anzeichen: kleriker_hieb
+ [Zurückbleiben und zusehen]
    Du bleibst stehen und siehst zu. Er nimmt den Schlag allein, und er fliegt, und auf dem Rückweg erwischt der Arm auch dich, weil du stehst, wo er gelandet ist.
    ~ zuletzt = kleriker_hieb
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_schrei
+ [Ihm den Rücken decken]
    Du stellst dich neben ihn, Schulter an Schulter, und ihr nehmt den Schlag gemeinsam, du mit der Säge, er mit der Axt. Dann treibt ihr sie Schritt für Schritt zurück, bis das Geländer in ihrem Rücken knirscht. Er hält den Takt, Hieb, Schritt, Hieb, ohne den Kopf zu wenden, und dir fällt auf, dass er dabei atmet wie ein Mann beim Holzhacken, ruhig, gleichmäßig.
    -> g_schrei
+ [Ihr in die Flanke fallen]
    Während sie nach ihm schlägt, bist du an ihrer Seite und triffst, tief. Gascoigne fängt den Arm mit der Axt ab und brüllt etwas, das du nicht verstehst, kehlig und rund, in einer Sprache, die nicht die dieser Stadt ist.
    -> g_schrei
- (g_schrei)
Am Geländer richtet sie sich auf, das Maul weit offen, und die Rippen treten unter dem Fell hervor wie die Spanten eines Bootes. Gascoigne achtet nicht darauf. Er will nur an ihren Hals. # anzeichen: kreischen
+ [Ihn am Kragen zurückreißen]
    ~ gascoigne = gascoigne + 1
    Du packst ihn am Kragen und ziehst. Der Schrei geht über euch hinweg. Er schüttelt den Kopf wie ein Hund, der aus dem Wasser kommt, und dreht dir den Verband zu. „Danke“, sagt er. Dann noch einmal, leiser, als müsse er sich das Wort merken: „Danke.“
    -> g_wurf
+ [Mit ihm in den Schrei hinein]
    Ihr lauft beide hinein. Der Schrei trifft euch zugleich, und das Pflaster kippt unter dir. Er steht als Erster wieder, lachend, mit blutenden Ohren.
    ~ zuletzt = kreischen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g_wurf
- (g_wurf)
// [ERWEITERT] Sie wirft nach ihm, nicht nach dir.
Sie tastet mit dem langen Arm zwischen die Kutschen und hebt eine vom Pflaster, langsam, das Holz knarrt. Der Arm wandert über ihre Schulter, und ihr Kopf zeigt nicht auf dich. Er zeigt auf Gascoigne, der zwischen zwei Pferdeleibern kniet und seine Donnerbüchse lädt, mit dem Rücken zu ihr. # anzeichen: wurf
+ [Ihm eine Warnung zurufen]
    Du rufst seinen Namen. Er dreht den Kopf zu dir, nicht zu ihr. Die Kutsche trifft ihn in den Rücken und wirft ihn gegen dich, und ihr geht beide zu Boden.
    ~ zuletzt = wurf
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> g2
+ [Ihn aus der Bahn stoßen]
    ~ gascoigne = gascoigne + 1
    Du rennst und rammst ihm die Schulter in die Seite. Ihr rollt über das Pflaster. Die Kutsche schlägt dort ein, wo er gekniet hat, und ein Rad springt über euch hinweg in den Abgrund. Er liegt auf dem Rücken und lacht, bis er husten muss. „So“, sagt er. „So. Das war knapp.“
    -> g2
- (g2)
{ spieluhr:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er. Eine Melodie, leise und zärtlich, die nicht in diesen Lärm passt. Es ist dieselbe Melodie, die die Spieluhr in deiner Tasche spielt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
- else:
    Und mitten im Kampf, zwischen zwei Axthieben, summt er, leise und zärtlich, ein Kinderlied, das nicht in diesen Lärm passt. Er weiß nicht, dass er summt. # notiz: gascoigne_lied
}
Die Bestie fällt. Gascoigne hört nicht auf. Er schlägt weiter, in den Kadaver hinein, und weiter, nass und gleichmäßig, und er lacht dabei, leise, fast zärtlich, bis du ihn an der Schulter packst. # notiz: gascoigne_kippt # stimmung: grauen
* [„Gascoigne. Gascoigne!“]
    ~ gascoigne = gascoigne + 1
    Erst beim dritten Mal hält er inne, blinzelt hinter dem Verband und senkt die Axt. Er lacht verlegen, und es ist wieder sein eigenes Lachen. „Ruhig. Ruhig. Das geht einem ins Blut, wenn man nicht aufpasst.“ Er wischt die Klinge am Mantel ab. „Pass du besser auf als ich.“ Dann geht er, die Treppe hinab, in Richtung der Gräber.
* [„Was hast du da gesummt?“]
    ~ gascoigne = gascoigne + 1
    ~ gascoigne_lied = true
    Er hört auf zu schlagen und wendet dir das Gesicht zu, als hättest du ihn geweckt. „Gesummt?“ Er denkt nach. „Das Lied von der Kleinen. Sie heißt …“ Er bricht ab. Sein Mund bleibt offen. „Sie heißt“, sagt er noch einmal, und dann nichts mehr. Er senkt die Axt sehr langsam, als wäre sie schwerer geworden. Ohne ein weiteres Wort geht er die Treppe hinab.
* [„Hast du ihn gekannt?“]
    ~ gascoigne = gascoigne + 1
    Seine Hand findet im Fell den Rest des Kragens und bleibt darauf liegen. „Ich glaub, der hat uns getraut. Viola und mich. Unten in der Kapelle am Fluss.“ Er schweigt. „Oder ich verwechsle ihn. Die singen hier alle gleich.“ Dann geht er, die Treppe hinab, ohne sich umzudrehen.
* [Schweigen und warten, bis er aufhört]
    ~ gascoigne = gascoigne - 1
    Nach einer Weile hört er von selbst auf, steht schwer atmend da und starrt auf das, was er angerichtet hat. Dann geht er, ohne ein Wort, in Richtung der Gräber.
- -> beute

= ablenken
{ kiesel > 0:
    ~ kiesel = kiesel - 1
    Du wirfst einen Kieselstein hinter dich, zurück zu dem Ende der Brücke, von dem du gekommen bist. Er klappert gegen eine Kutsche, hell und deutlich, und die Bestie fährt herum, schneller, als du es ihr zugetraut hättest, und schnüffelt dem Klang nach.
- else:
    ~ molotow = molotow - 1
    Du wirfst den Molotow neben sie, auf die Kutschen am Rand. Das alte Holz fängt sofort Feuer, und die Bestie wendet sich kreischend dem Brand zu, als erinnere sie sich an etwas.
}
Du läufst. Geduckt, zwischen den toten Pferden, so leise, wie es mit klopfendem Herzen geht. Hinter dir schlägt etwas so schwer ins Pflaster, dass dir die Zähne klappern, aber du drehst dich nicht um, nicht bis du die Treppen am anderen Ende erreichst. Dann erst siehst du zurück. Sie steht noch auf der Brücke, riesig im Nebel, und sieht dir nach. # notiz: kleriker_lebt
~ kleriker = "abgelenkt"
-> uebergang

= fliehen
~ ort = "gassen"
Du springst über das Geländer, auf ein tiefer gelegenes Dach, rutschst über nasse Ziegel und fällst in eine Gasse. Über dir hörst du sie, wie sie dir folgt, von Dach zu Dach, und die Ziegel regnen herab, wo sie aufsetzt. Einmal erwischt sie dich, als du um eine Ecke biegst, ein Hieb, der dich gegen eine Hauswand schleudert. # stimmung: kampf
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
    Er sah durch diese Augen eine Kathedrale, hoch und hell, Kerzen zu Tausenden, und hörte einen Gesang, so schön, dass es wehtat. Er kniete. Er trug einen weißen Kragen. Eine Hand legte sich auf seinen Kopf, und eine Nadel ging in seinen Arm, und das Blut, das hineinfloss, war heilig, hieß es, das Blut der Kirche, das reinste. Es war warm. Er dankte dafür. # gedaechtnis: kleriker # lore: blutgedaechtnis
    Dann ein anderer Tag. Er sang, und seine Stimme kippte mitten im Lied, und alle drehten sich zu ihm um. Er sah auf seine Hände. Sie waren zu groß. Und ganz hinten, in einem Winkel, den das Blut noch nicht erreichte, saß noch jemand und suchte nach einem Namen. Seinem eigenen. Und fand ihn nicht.
    Du reißt die Hand zurück. Du kniest auf der Brücke, und dein Atem geht, als wärst du gerannt. Die Bilder bleiben, als hättest du sie auswendig gelernt: die Stimme, die mitten im Lied kippt. Der Blick auf die eigenen Hände. Und ganz hinten einer, der nach seinem Namen sucht. Hätte ihn jemand gerufen, bei diesem Namen, in diesem Augenblick. # notiz: rest_mensch
    ~ gedaechtnis_kleriker = true
    -> uebergang
+ [Die Hand zurückziehen]
    Du lässt die Hand sinken. Was immer in diesem Blut ist, es gehört nicht dir. Hinter dir seufzt etwas, das längst tot sein sollte, oder es ist nur der Wind im Geweih.
    -> uebergang

= uebergang
{ kleriker == "besiegt" and not bruecke_laterne:
    ~ bruecke_laterne = true
    Am Ende der Brücke, wo der Turm in den Fels übergeht, steht eine Laterne. Als du sie berührst, flammt sie auf, und die Boten kriechen aus dem Boden und neigen die Köpfe, als grüßten sie dich. # lore: laternen
}
{ bruecke_von == "unten":
    ~ bruecke_von = "oben"
    Am Ende der Brücke führen die Treppen hinauf, zurück nach Zentral-Yharnam, zum Räucherwerk und zu den Glocken.
    -> k1_hub_b
}
Hinter der Brücke führen breite Treppen hinab, in einen tieferen, älteren Teil der Stadt, wo die Häuser enger stehen und die Luft nach Wasser und Moder riecht. Weiter unten, zwischen Dächern, ragen die Spitzen von Grabsteinen.
-> k1_hub_c
