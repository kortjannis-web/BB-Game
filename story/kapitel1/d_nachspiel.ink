// KAPITEL 1, TEIL D: NACHSPIEL. Die Brosche, Eileens Spuren, das Mädchen, Gilbert, der Traum.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/umsetzung-faktencheck.md (Befunde d_nachspiel 1 bis 11, Übergreifend 5, 9, 10):
// Orte und Aufzeichnungen in Stimme A, Geschehen in Stimme B. Alle Optionen fließen in den Satz (#fliesst).
// Lore: lore/kapitel/kapitel1.md (Wissenssperre), lore/figuren/maedchen-und-viola.md, lore/orte/oedon-grab-und-kapelle.md, lore/gegenstaende/heilende-kirche.md.

=== k1_d_grab ===
// TITEL: Viola und die Brosche
// [KANON lore:gegenstaende/heilende-kirche] Nach Gascoignes Tod: Laterne am Grab und der Schlüssel zum Tor, das die Gruft des Oedon versperrt; dahinter liegt der Kathedralenbezirk (Kapitel 2).
// [KANON lore:figuren/maedchen-und-viola] Violas Leiche auf einem Absatz oberhalb der Kampfstelle, bei ihr die rote Brosche mit ihrem Namen.
// [OFFEN] Wer Viola getötet hat, sagt das Spiel nicht. Der Text lässt beide Lesarten offen.
// [ERWEITERT] Das Zeichen auf dem Schlüssel und über dem Tor (Befund 8: zeigen statt sagen, wohin der Schlüssel führt); die Treppe, die am Tor vorbei auf das Dach führt.
~ laterne = -> k1_d_rueckweg
An der Friedhofsmauer flammt eine Laterne auf, und niemand hat sie angezündet. Ihr Licht reicht bis zu dem, was von {kennt_gascoigne():Gascoigne|dem Mann mit dem Verband} übrig ist, und daneben im nassen Gras liegt ein eiserner Schlüssel, lang und grob geschmiedet. In seinen Griff ist ein Zeichen geprägt: ein Kreis, durch den drei Striche laufen, die sich in der Mitte nicht treffen. Als du ihn aufhebst, zieht er dir den Arm nach unten. Er wiegt mehr, als ein Schlüssel wiegen dürfte. # lore: laternen # notiz: oedon_schluessel # bild: grab_oedon # stimmung: ruhig
Hinter der Stelle, an der ihr gekämpft habt, steigt eine steinerne Treppe die Friedhofsmauer hinauf, schmal und in der Mitte ausgetreten, wie man sie in alten Städten für Totengräber und Glöckner baut und für niemanden sonst. Oben endet sie an einem Tor aus schwarzer Eiche, mit Eisen beschlagen, und über seinem Sturz ist dasselbe Zeichen in den Stein gehauen, der Kreis und die drei Striche. Jenseits des Tores zieht sich die Stadt weiter hinauf, Dach über Dach, bis zu den Türmen, von denen vorhin der Gesang herabkam.
Kurz unter dem Tor führt ein Sims hinaus auf ein flaches Dach über dem Friedhof. Du steigst hinauf, Stufe um Stufe, langsamer, als deine Beine könnten.
Auf dem Dach liegt eine Frau. Sie liegt auf der Seite, das Gesicht abgewandt, das Haar über den Stein gebreitet, und von der Treppe aus könnte man meinen, sie habe sich nur hingelegt, um auszuruhen. Ihr Kleid ist dunkel und nass. Über dem Herzen steckt eine große Brosche, rot wie ein frischer Tropfen, und in die goldene Fassung ist ein Name graviert: Viola. Das V macht einen kleinen Kringel nach links. # notiz: gascoigne_schicksal # lore: familie_gascoigne # stimmung: grauen
{ spieluhr: Du kennst diesen Kringel. Er steht im Deckel der Spieluhr in deiner Tasche. }
Die Wunden sind breit und tief, zu breit für eine Klinge, zu ordentlich für Zähne.
// G1: Die Erinnerung ist weiß, erst der Fund beim Schwein ist rot.
{ q_mutter >= 1: Ein Fenster am Brunnenplatz, ein weißes Band am Riegel, eine kleine Stimme, die alles richtig gemacht hat. }
* {q_frau == 1} [Ihr ausrichten, was er dir aufgetragen hat #fliesst]
    ~ gruss_ausgerichtet = true
    Du kniest dich neben sie und richtest ihr aus, was er dir aufgetragen hat, leise, so nah an ihrem Ohr, wie man es bei Schlafenden tut. „Er kommt bald. Du sollst bei der Kleinen bleiben.“ Der Wind hebt eine Strähne ihres Haares und legt sie wieder hin.
    -> brosche_wahl
* [Ihr das Haar aus dem Gesicht streichen #fliesst]
    Du streichst ihr das Haar aus dem Gesicht. Es ist kalt und schwer vom Regen. Ihre Augen sind halb offen, und du schließt sie nicht.
    -> brosche_wahl
* [Stumm neben ihr stehen bleiben #fliesst]
    Du bleibst stumm neben ihr stehen, die Säge noch in der Hand, bis dir das Wasser aus dem Haar in den Kragen läuft.
    -> brosche_wahl

= brosche_wahl
* [Die Brosche an dich nehmen #fliesst]
    ~ brosche = true
    Du nimmst die Brosche an dich und löst sie so behutsam von ihrem Kleid, als könne sie es noch spüren. In deiner Hand ist sie warm, und dann nicht mehr. # notiz: brosche
* [Sie ihr lassen und sie zudecken #fliesst]
    Du lässt ihr die Brosche. Du nimmst den Mantel von den Schultern und legst ihn über sie, bis zum Kinn. Ohne ihn ist es kalt auf dem Dach.
- -> abstieg

= abstieg
Auf dem Weg hinab kommst du wieder am Tor vorbei. Der Schlüssel schlägt dir bei jeder Stufe gegen das Bein, schwer und kalt durch den Stoff.
{ eileen_stufe >= 1 and eileen >= 0: -> eileen_spuren }
-> k1_d_rueckweg

= eileen_spuren
// [ERWEITERT] Keine dritte Begegnung (G2, Entscheidung des Nutzers: zwei in Kapitel 1). Eileen war hier, während du auf dem Dach warst; zu sehen ist nur, was sie zurückgelassen hat, und der Spieler liest es selbst.
// Dank (verraten): Abzeichen und eine heile Feder. Bruch (gewarnt): eine geknickte Feder. Partnerschaft: zwei Kerben am Tor; das Angebot selbst kommt nur aus k1_c_eileen.
{ not gascoigne_gewarnt and eileen >= 2:
    ~ eileen_partner = true
    Im Holz des Tores sind zwei frische Kerben, in der Höhe eines Gesichts, eine dicht neben der anderen, schmal und spitz, wie ein Schnabel aus Stahl sie schlägt. Vorhin waren sie nicht da. Auf der Schwelle liegen noch die hellen Späne. # quest: eileen_partner
}
{
- gascoigne_gewarnt:
    Unten bei dem Toten liegt eine schwarze Feder auf seiner Brust. Sie ist in der Mitte geknickt, so dass die Spitze zur Seite hängt, und auf dem Weg hinauf lag sie nicht dort. # notiz: eileen_bruch
- gascoigne_verraten:
    Unten bei dem Toten liegt ein schlichtes Abzeichen aus Messing an einem kurzen Stück Schnur, sauber abgeschnitten, und daneben eine schwarze Feder, glatt und unversehrt. Auf dem Weg hinauf lag beides nicht dort. # notiz: eileen_dank
- else:
    Zwischen den Gräbern liegt eine schwarze Feder im nassen Gras, glatt und unversehrt. Auf dem Weg hinauf lag sie nicht dort.
}
-> k1_d_rueckweg

=== k1_d_rueckweg ===
// TITEL: Rückweg durch die Stadt (frei)
// [KANON lore:kapitel/kapitel1] Mondphase Abend; der Sonnenuntergang beginnt erst nach Gascoigne beim Betreten der Oedon-Kapelle (Kapitel 2). Der Blutmond kommt viel später (nicht hier verbrauchen).
// [ERWEITERT] Die Sonne, die nicht sinkt: nur Wahrnehmung, keine Gewissheit des Erzählers (G5, Übergreifend 9).
-> betreten("rueckweg") ->
{ k1_d_rueckweg == 1:
    Der Rückweg führt durch dieselben Straßen, über dasselbe Pflaster und an denselben verriegelten Türen vorbei, und doch hat sich die Stadt verschoben, während du unten warst, so wie ein Zimmer, in dem jemand die Stühle gerückt hat, solange man schlief. Die Glocken schweigen.{k1_b_tueren: In der Gasse mit den Räucherlampen hat das Lachen hinter der Tür aufgehört.}{ alte_frau: Der Hund der alten Frau liegt vor ihrer Tür und hebt nicht einmal den Kopf.} # bild: zentral_yharnam # stimmung: grauen
    Über den Giebeln hängt die Sonne, tief und rot. Sie hing dort, als du aus der Klinik tratst, sie hing dort über der Brücke und über dem Friedhof, und dein Schatten liegt noch so lang auf dem Pflaster wie zu Beginn. Du bleibst stehen und wartest, dass sie sinkt. Sie sinkt nicht. Die Nacht der Jagd hat noch nicht einmal richtig angefangen.
    { kleriker == "abgelenkt" or kleriker == "geflohen": Von der Brücke herüber kommt ein Kreischen, lang und hoch, und reißt ab. Sie ist noch da. }
    { einsicht >= 3: An einer Hauswand hängen lange, dünne Glieder, gefaltet wie Finger, und sie bewegen sich. Du blinzelst, und es ist eine Dachrinne. }
    { schuetze_verschont:
        Hinter dir in einer Gasse scharrt es, schwer und schnell, und noch bevor du dich umdrehst, kracht oben auf einem Dach ein Schuss. Vor deine Füße fällt ein Leib aus Fell und Klauen und rührt sich nicht mehr. Hinter dem Schornstein sitzt der Alte mit der Schlafmütze, ein neues Gewehr über den Knien. Er kichert und legt einen Kiesel zu den anderen. # klang: schuss
    }
}
- (wohin)
+ {maedchen_wo == "zuhause" and q_mutter < 3} [Zum Brunnenplatz, wo das Mädchen wartet #fliesst] -> k1_d_maedchen
+ {q_gilbert == 1} [Zu Gilberts Fenster gehen #fliesst] -> k1_d_gilbert
+ {maedchen_wo == "fort" and not maedchen_tot} [Durch die Kanalisation zurück #fliesst] -> k1_d_kanal
+ [Die Laterne am Grab berühren #fliesst] -> k1_d_traum

=== k1_d_maedchen ===
// TITEL: WEICHE: Was sagst du dem Mädchen?
// [KANON lore:figuren/maedchen-und-viola] Gibt man ihr die Brosche, weiß sie, dass die Mutter tot ist: Sie fragt, ob es wirklich die Mama war, und bittet, sie nicht allein zu lassen (LK §24.14, eigene Worte); später verlässt sie das Haus und stirbt in der Kanalisation durch das Schwein.
// [KANON] Behält man die Brosche, bleibt sie und sagt, der Morgen komme immer (eigene Worte). Ab Kapitel 2 kann man sie zur Kapelle oder zur Klinik schicken (beides endet schlimm). Kein Ausgang rettet sie.
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr bekommt man auch nach Gascoignes Tod noch (LK §17.5, RK1 §6). Sie erkennt den Jäger am Geruch.
// [ERWEITERT] Wer ihre Warnung („dann geh ich selber“) ernst nimmt, behält die Brosche und gewinnt Zeit. Die Wahrheit ohne Brosche glaubt sie nur halb.
// G1: Am Fenster ist das Band weiß.
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat.
{ maedchen_gesehen:
    Der Brunnenplatz liegt still, und im Fenster ist das Räucherwerk fast heruntergebrannt. Das weiße Band hängt noch am Riegel. Du stehst unter dem Fenster im ersten Stock, und bevor du klopfen kannst, sind die vier kleinen Finger schon zwischen den Läden. Vielleicht hört sie es an deinen Schritten: Ihre Stimme ist leiser als beim ersten Mal. # bild: brunnenplatz # stimmung: ruhig
    { q_mutter == 0: „Hast du meine Mama gesehen?“ | „Hast du Mama gefunden?“ }
- else:
    ~ maedchen_gesehen = true
    Hinter einem Tor liegt ein kleiner Platz mit einem versiegten Brunnen, und aus einem Fenster im ersten Stock spielt eine Spieluhr, dünn und klar, {k1_n1_kleriker.mit_gascoigne:ein Lied, das du heute Nacht schon einmal gehört hast, gesummt, zwischen Axthieben|ein Lied, das du nicht kennst und das dir doch den Hals eng macht}. Um den Fensterriegel ist ein weißes Band geknotet, eine große Schleife, wie kleine Mädchen sie im Haar tragen. # bild: brunnenplatz # stimmung: ruhig # lore: familie_gascoigne
    Die Melodie bricht ab. Zwischen den Läden erscheinen vier kleine Finger, dann zwei sehr ernste Augen. „Du riechst nach Jagd. So wie Papa, wenn er heimkommt.“ Sie holt Luft. „Hast du meine Mama gesehen? Sie hat eine große rote Brosche, die sieht man von Weitem. Papa ist auf die Jagd gegangen und nicht wiedergekommen, und Mama ist ihn suchen gegangen, und ich hab die Tür zugemacht, so wie sie gesagt hat.“
}
{ not spieluhr:
    ~ spieluhr = true
    Am Fensterbrett schabt Holz, und durch den Spalt schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche. „Die ist von Papa. Wenn du ihn findest, zieh sie auf. Dann weiß er wieder, wer er ist.“ Sie ist noch warm von ihren Fingern. Im Deckel stehen zwei Namen, Viola und Gascoigne, und das V macht einen kleinen Kringel nach links. # lore: spieluhr
}
{ versprechen_gascoigne: -> vater }
-> weiche

= vater
// [ERWEITERT] Nur, wenn Gascoigne im Moment der Klarheit um etwas gebeten hat.
Und dann ist da das Versprechen, das du einem Mann gegeben hast, der für einen Atemzug wieder er selbst war.
* [Ihr sagen, ihr Vater wusste das Lied #fliesst]
    ~ maedchen = maedchen + 2
    Du sagst ihr, dass ihr Vater das Lied noch wusste, als er sonst nichts mehr wusste, und dass er an sie gedacht hat. Hinter den Läden wird es so still, dass du glaubst, sie sei gegangen. Dann summt sie die Melodie, leise, Note für Note, und du stehst unter dem Fenster und hörst zu, bis sie fertig ist. # notiz: maedchen_lied # stimmung: schoen
* [Es für dich behalten #fliesst]
    Du behältst es für dich. Es ist zu schwer, um es durch einen Fensterspalt zu reichen.
- -> weiche

= weiche
* {brosche} [Ihr die Brosche geben #fliesst]
    ~ q_mutter = 3
    ~ maedchen_wo = "fort"
    Du gibst ihr die Brosche. Du schiebst sie durch den Spalt zwischen den Läden, eine kleine Hand nimmt sie, und lange ist es still. Dann fragt sie, so leise, dass du dich zum Fenster hinaufbeugen musst: „War das wirklich Mama?“ Du nickst, obwohl sie es durch die Läden nicht sehen kann. „Geh nicht weg“, sagt sie. „Bleib da unten stehen, ja? Nicht du auch noch.“ # quest: maedchen_fort # stimmung: grauen
    Dann weint sie, leise und gleichmäßig, ohne zu schluchzen.{ gruss_ausgerichtet: „Ich habe es ihr noch gesagt“, sagst du. „Dass er bald kommt.“ Das Weinen hört nicht auf.} Als es endlich aufhört, antwortet sie nicht mehr, auch nicht, als du an die Läden klopfst. Du bist noch keine zwanzig Schritte über den Platz, da hörst du hinter dir einen Riegel gehen, dann einen zweiten.
* {not brosche} [Ihr die Wahrheit sagen, ohne Beweis #fliesst]
    ~ q_mutter = 7
    Du sagst ihr die Wahrheit, ohne Beweis, so einfach, wie es geht: Ihre Mutter kommt nicht wieder. „Das stimmt nicht“, sagt sie sofort. „Das sagst du nur.“ Nach einer langen Weile, sehr leise: „Woher weißt du das?“ Du hast nichts in der Hand, das du ihr durch den Spalt reichen könntest. Die Finger ziehen sich zurück, aber die Haustür bleibt zu. Hinter den Läden schlägt sie Feuer, Stahl auf Stein, einmal und noch einmal, weil der Zunder nicht fängt, und bald riecht es wieder nach Räucherwerk. # quest: maedchen_wartet
* [Ihr sagen, ihre Mutter komme bald #fliesst]
    ~ q_mutter = 4
    Du sagst ihr, ihre Mutter komme bald, sie habe unterwegs nur noch etwas erledigen müssen. Sie glaubt dir sofort. „Dann warte ich“, sagt sie. „Mama sagt, der Morgen kommt immer. Man muss nur lang genug wach bleiben.“ Über den Giebeln hängt die Sonne, rot und reglos. # quest: maedchen_wartet
* [Unter dem Fenster stumm bleiben #fliesst]
    ~ q_mutter = 5
    Du bleibst stumm unter dem Fenster stehen, und sie fragt nicht noch einmal. Die Finger verschwinden aus dem Spalt. Hinter den Läden bleibt es still, kein Summen, kein Schritt, nur das Räucherwerk, das im Fenster weiterraucht. # quest: maedchen_wartet
- -> k1_d_rueckweg

=== k1_d_kanal ===
// TITEL: Rückweg durch die Kanalisation
// Wer sie fortgeschickt hat (früh zur Klinik oder jetzt mit der Brosche), findet hier, was das Schwein getan hat.
// [KANON lore:figuren/maedchen-und-viola] Das Band ist durchtränkt von Blut (G1: erst hier rot). Was mit dem Kind geschah, sagt niemand; der Jäger denkt es nur.
~ maedchen_tot = true
Du nimmst den Weg durch die Kanalisation, weil er kürzer ist. Unten riecht das Wasser nach Eisen und nach Stall. # bild: kanal_schwein # stimmung: grauen
{k1_c_kanal:Das Schwein ist wieder da, wie alles in dieser Nacht wiederkommt.|Im Kanal steht ein Schwein, doppelt so groß wie ein Ochse.} Es steht bis an die Knie im Wasser und frisst, und neben ihm treibt ein heller Stoff, ein kleiner Schuh. Aus seinem Maul hängt zwischen den gelben Hauern ein Band, rot und schwer bis auf den Knoten.{ maedchen_gesehen: Du hast es weiß gesehen, um einen Fensterriegel geknotet, damit eine Mutter den Weg nach Hause findet.} # quest: maedchen_tot
{ q_mutter == 3:
    Du denkst an die kleine Hand, die die Brosche durch den Spalt genommen hat. Im Wasser suchst du nach dem Gold der Fassung und findest es nicht.
- else:
    Du denkst an die Treppe zu den Kanälen, an der ein kleiner Schatten stehen blieb.
}
* [Das Band an dich nehmen #fliesst]
    ~ band = true
    Du nimmst das Band an dich. Du ziehst es dem Schwein aus dem Maul, und es lässt es dir, satt und gleichgültig. Das Band ist nass und schwerer, als ein Band sein dürfte. Du steckst es zu dem Schlüssel{spieluhr: und der Spieluhr}. # notiz: rotes_band
* [Ohne das Band weitergehen #fliesst]
    Du gehst ohne das Band weiter und drehst dich nicht um. Das Schmatzen begleitet dich bis zur Leiter.
- -> k1_d_rueckweg

=== k1_d_gilbert ===
// TITEL: Gilbert hören lassen, was hinter der Brücke liegt
// [ERWEITERT] Sein Versprechen bereitet seinen Blutmond in einem späteren Kapitel vor.
// [KANON lore:welt/notizen] G7: Die Kirche hat die Große Brücke gesperrt; bei uns ein Tor am Brückenende, von der anderen Seite verriegelt. Gilberts Deutung bleibt seine Meinung.
// Stimme Gilbert: höflich, siezt, selbstironisch, fragt zurück; der Husten schneidet ihm die Sätze ab.
~ q_gilbert = 2
~ gilbert = gilbert + 1
Gilbert steht schon am Gitter, als du in die Gasse biegst. Sein Husten ist schlimmer geworden, tiefer, ein Reißen, nach dem er lange braucht, bis er wieder sprechen kann. „Erzählen Sie“, sagt er. „Bitte. Was liegt dahinter?“ # bild: gilbert # stimmung: ruhig # quest: gilbert_bericht
Du erzählst ihm von dem Tor am Ende der Brücke, das jemand von der anderen Seite verriegelt hat, von den Treppen hinab und von der Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, von den Gräbern und dem Namen über dem Tor}. Er hört zu, die Stirn ans Gitter gelehnt. „Von der anderen Seite“, wiederholt er. „Dann wollte dort oben jemand nicht, dass man hinaufkommt. Oder dass von dort etwas herunterkommt.“ Er hustet. „Und die Glocken? Klingen sie da unten anders?“ Du sagst ihm, dass man sie da unten gar nicht hört. Er nickt, als habe er es geahnt.
* [Ihm vom Kampf am Grab erzählen #fliesst]
    Du erzählst ihm vom Kampf am Grab, von {kennt_gascoigne():Gascoigne, dem Pater mit dem Verband,|dem Mann mit dem Verband und dem Priesterschal} und davon, was am Ende aus ihm geworden ist. Gilbert sagt lange nichts. Dann: „Und wenn es bei mir so weit ist?“ Er lächelt schief, so wie beim ersten Mal am Gitter. „Holen Sie mich dann? Ich hätte gern, dass es jemand ist, der meinen Namen weiß.“
    ** [Es ihm versprechen #fliesst]
        ~ versprechen_gilbert = true
        Du versprichst es ihm. „Danke“, sagt er, und dann noch einmal: „Danke.“ Er hustet, und diesmal klingt es beinahe wie ein Lachen. # notiz: versprechen_gilbert
    ** [Ihm nichts versprechen #fliesst]
        Du versprichst ihm nichts. Er nickt. „Ehrlich. Das ist auch was.“
* [Ihm das Grab ersparen #fliesst]
    Du ersparst ihm das Grab und erzählst nichts von dem, was dort geschehen ist. Gilbert merkt die Lücke; du siehst es daran, wie er den Kopf neigt. Er fragt nicht nach.
- „Seien Sie vorsichtig mit dem, was die Kirche da oben verspricht“, sagt er zum Abschied. „Ich habe ihr Blut auch genommen. Es hat mir Zeit geschenkt. Ich weiß nur nicht mehr, ob das ein Geschenk war.“ # lore: heilende_kirche
-> k1_d_rueckweg

=== k1_d_traum ===
// TITEL: Kapitelende im Traum
// [KANON] Die Puppe ist mit der ersten Einsicht erwacht (spätestens jetzt). Ihr Gruß spricht sinngemäß von daheim (eigener Wortlaut).
// Befund 5 und 10: Keine Bilanz, die erklärt, was die Szenen gezeigt haben. Die Bedeutung trägt das Tagebuch; die offenen Fragen stehen im Notizbuch und als zwei Fragen in der Ich-Stimme.
// Kapitelende: Chronik vor den Aufzeichnungen, damit das Kapitel auf dem letzten Satz des Tagebuchs endet (Bild und Frage für Kapitel 2: hinauf, wo der Gesang herkam).
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Du berührst die Laterne, und die rote Sonne über den Giebeln weicht dem elfenbeinfarbenen Himmel des Traumes. Weiße Blumen, so weit der Hang reicht. Das Haus auf dem Hügel mit seinen erleuchteten Fenstern. Und eine Stille, so vollkommen, dass du erst jetzt hörst, wie laut die Stadt gewesen ist. # bild: traum # stimmung: ruhig
{ not puppe_wach:
    -> puppe_erwacht ->
    Sie löst sich vom Fuß der Treppe und geht ein paar Schritte, vorsichtig, wie jemand, der das Gehen erst wieder lernt. Ihr Blick bleibt an deinen Händen hängen, an der braunen Tinte an deinen Fingerkuppen. „Daheim“, sagt sie leise und probiert, wie das Wort schmeckt. # lore: puppe
- else:
    Die Puppe kommt dir entgegen, mit kleinen, vorsichtigen Schritten, und als sie vor dir steht, neigt sie den Kopf und sieht dir ins Gesicht. In ihren gläsernen Augen spiegelt sich das Haus. „Daheim“, sagt sie, als sei das die Antwort auf eine Frage, die du nicht gestellt hast. Sie fragt nicht, was geschehen ist. Ihr Blick bleibt an deinen Händen hängen, an der braunen Tinte an deinen Fingerkuppen, die nicht abgeht. # lore: puppe
}
Das Wort bleibt zwischen euch liegen. Keiner von euch hebt es auf.
Du setzt dich auf die Stufen vor dem Haus, und sie setzt sich neben dich, die Hände im Schoß gefaltet. Hier schließen sich die Wunden, die Ampulle ist wieder voll, und die Kälte des Daches geht dir aus den Fingern; nur der Schlüssel in deiner Tasche wird nicht leichter. Als du ihn herausnimmst, sieht die Puppe lange auf das Zeichen im Griff, den Kreis und die drei Striche, die sich nicht treffen. „Wohin führt er?“, fragt sie. „Erzählst du es mir, wenn du dort warst?“
Eine Weile sitzt ihr nur da, eine Puppe und ein Jäger, und seht über die Blumen. „Sei vorsichtig“, sagt sie nach einer langen Zeit, als hätte sie es sich lange überlegt. „Du kommst immer zurück. Aber jedes Mal ein wenig anders.“
CHRONIK DER NACHT # stil: zwischentitel
// [ERWEITERT] Was du entschieden hast, eine Zeile je Figur, nur für das, was auf diesem Weg geschah, und nur, was du gesehen hast.
// Befund 11: Was nachwirkt, trägt den Tag `# stil: nachwirkt` (Zeichen der Oberfläche) statt eines Spielbegriffs im Text.
{
- gascoigne_moment: Gascoigne. Für einen Atemzug war er wieder er selbst, und dann hast du ihn getötet, auf seine Bitte. # stil: chronik
- im_lied_getroffen: Gascoigne. Du hast zugeschlagen, während er dem Lied seiner Tochter zuhörte. # stil: chronik
- gascoigne_verraten: Gascoigne. Du hast {eileen_genannt:Eileen|der Frau im Federmantel} gesagt, wo er war. Am Grab hast du ihn selbst gefunden. # stil: chronik
- q_frau == 1: Gascoigne. Er hat dir aus seiner Blechflasche zu trinken gegeben und dich das Warten gelehrt. Am Grab hast du ihn getötet. # stil: chronik
- kennt_gascoigne(): Gascoigne. Ein Pater, den du erst kennengelernt hast, als er niemanden mehr kannte. # stil: chronik
- else: Der Mann mit dem Verband. Seinen Namen kennst du nicht, und sein Hut liegt noch auf einem Grabstein. # stil: chronik
}
{
- maedchen_tot: Das Mädchen. Ein Band im Maul eines Schweins, rot bis auf den Knoten.{band: Du trägst es bei dir.} # stil: chronik
- q_mutter == 4: Das Mädchen. Du hast ihr gesagt, ihre Mutter komme bald. Sie wartet auf den Morgen. # stil: chronik # stil: nachwirkt
- q_mutter == 5: Das Mädchen. Du hast geschwiegen, und sie hat nicht noch einmal gefragt. # stil: chronik # stil: nachwirkt
- q_mutter == 7: Das Mädchen. Du hast ihr die Wahrheit gesagt, mit leeren Händen. Hinter den Läden hat sie das Räucherwerk neu angezündet. # stil: chronik # stil: nachwirkt
- q_mutter == 3: Das Mädchen. Sie hat die Brosche ihrer Mutter durch den Spalt genommen. Hinter dir gingen zwei Riegel. # stil: chronik # stil: nachwirkt
- maedchen_wo == "fort": Das Mädchen. Du hast sie zur Klinik geschickt. An der Ecke blieb sie stehen und sah die Treppe zu den Kanälen hinunter. # stil: chronik # stil: nachwirkt
- maedchen_gesehen: Das Mädchen. Sie wartet hinter dem Fenster am Brunnenplatz, das weiße Band am Riegel. # stil: chronik # stil: nachwirkt
}
{
- eileen_partner: {eileen_genannt:Eileen|Die Frau im Federmantel}. Am Tor über dem Grab waren zwei frische Kerben im Holz, eine dicht neben der anderen. # stil: chronik # stil: nachwirkt
- eileen < 0: {eileen_genannt:Eileen|Die Frau im Federmantel}. Sie hat dich vom Dach über den Gräbern geschickt. # stil: chronik # stil: nachwirkt
- gascoigne_gewarnt and gascoigne_verraten: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast ihr den Pater verraten und ihn dann vor ihr gewarnt. Bei dem Toten lag eine geknickte Feder. # stil: chronik # stil: nachwirkt
- gascoigne_gewarnt: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast den Pater vor ihr gewarnt. Bei dem Toten lag eine geknickte Feder. # stil: chronik # stil: nachwirkt
- gascoigne_verraten: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast ihr gesagt, wo der Pater war. Bei dem Toten lag ein Abzeichen aus Messing. # stil: chronik
- eileen_stufe >= 1: {eileen_genannt:Eileen|Die Frau im Federmantel}. Ihr habt euch gesehen. Mehr nicht. # stil: chronik
}
{
- versprechen_gilbert: Gilbert. Du hast versprochen, ihn zu holen, wenn es bei ihm so weit ist. # stil: chronik # stil: nachwirkt
- q_gilbert == 2: Gilbert. Du hast ihm erzählt, was hinter der Brücke liegt. # stil: chronik
- gilbert < 0: Gilbert. Du hast dich von ihm abgewandt, und nun hustet er, wenn du vorbeigehst, und sieht nicht auf. # stil: chronik
- k1_b_gilbert: Gilbert. Er wartet hinter seinem Gitter und sammelt Namen. # stil: chronik
}
{ alte_frau_versprochen:
    Die alte Frau mit dem Hund. Du hast ihr einen sicheren Ort versprochen. # stil: chronik # stil: nachwirkt
}
{
- kleriker == "besiegt": Die Bestie auf der Brücke. Sie ist tot, und wo sie lag, brennt jetzt eine Laterne. # stil: chronik
- kleriker != "": Die Bestie auf der Brücke. Sie lebt, und auf dem Rückweg hast du sie noch kreischen hören. # stil: chronik # stil: nachwirkt
}
{
- schuetze_verschont: Der Alte mit den Kieseln. Du hast ihn leben lassen, und er hat dir den Rücken freigeschossen. # stil: chronik
- schuetze == "erledigt": Der Alte mit den Kieseln. Sein Haar war gekämmt wie für den Sonntag. # stil: chronik
}
{ mob_verbrannt:
    Martha. Sie hat einem Jäger manchmal Brot gegeben, wenn er spät kam, und du hast sie verbrannt. # stil: chronik
}
{ iosefka != 0:
    Iosefka. {iosefka > 0:Sie hat sich notiert, dass du höflich warst.|Sie hat sich notiert, dass du gegen ihre Tür geschlagen hast.} # stil: chronik # stil: nachwirkt
}
// Aufzeichnungen: Stimme A, Ich, rückblickend (wie der Prolog). Befund 7: Die anderen sterben. Befund 5: zwei offene Fragen in der Ich-Stimme. G8: Branntwein nach Torf und Rauch.
Aus den Aufzeichnungen, die man später fand: # stil: tagebuch
{
- gascoigne_verraten:
    „In dieser ersten Nacht habe ich einer Jägerin verraten, wo ein Mann zu finden war, und dann habe ich ihn selbst gefunden. Man sagte mir, das sei die Jagd. # stil: tagebuch
- gascoigne_moment:
    „In dieser ersten Nacht habe ich einen Freund gewonnen und ihn mit eigener Hand erschlagen. Für einen Atemzug war er wieder er selbst und sprach den Namen seiner Frau, und ich habe diesen Atemzug genommen und ihn trotzdem getötet, weil er mich darum bat. Man sagte mir, das sei die Jagd. # stil: tagebuch
- q_frau == 1 and gascoigne >= 2:
    „In dieser ersten Nacht habe ich einen Freund gewonnen und ihn mit eigener Hand erschlagen. Er hatte mir aus seiner Blechflasche zu trinken gegeben, einen Branntwein, der nach Torf und Rauch schmeckte, nach einem Land, das nicht dieses war. Man sagte mir, das sei die Jagd. # stil: tagebuch
- else:
    { kennt_gascoigne():
        „In dieser ersten Nacht habe ich einen Pater getötet, der seinen eigenen Namen vergessen hatte. Er hieß Gascoigne. Man sagte mir, das sei die Jagd. # stil: tagebuch
    - else:
        „In dieser ersten Nacht habe ich einen Mann mit verbundenen Augen getötet, der einen Priesterschal trug. Seinen Namen weiß ich bis heute nicht. Sein Hut lag noch auf einem Grabstein, als ich ging. Man sagte mir, das sei die Jagd. # stil: tagebuch
    }
}
{ im_lied_getroffen:
    Ich habe zugeschlagen, während er dem Lied seiner Tochter zuhörte. Ich weiß nicht, ob man mir das vergeben kann; ich weiß nur, wer es nicht mehr kann. # stil: tagebuch
}
{ maedchen_tot:
    Ein rotes Band.{maedchen_gesehen: Es war weiß, als ich es zum ersten Mal sah.} Ich schreibe nicht mehr darüber. # stil: tagebuch
}
{ q_mutter == 3 and not maedchen_tot:
    Einem Kind habe ich die Brosche seiner Mutter gegeben. Es bat mich, nicht wegzugehen. Als ich ging, hörte ich hinter mir zwei Riegel. # stil: tagebuch
}
{ q_mutter == 4:
    Einem Kind habe ich gesagt, seine Mutter komme bald. Es glaubte mir. Es sagte, der Morgen komme immer, man müsse nur lange genug wach bleiben. # stil: tagebuch
}
{ grund == "heilung_selbst":
    Das Fieber, mit dem ich gekommen war, war fort. Ich bemerkte es erst auf dem Friedhof, zwischen zwei Gräbern, und ich weiß noch, dass ich mich nicht freute. # stil: tagebuch
}
{ grund == "heilung_anderer":
    Den Brief nach Hause, den ich versprochen hatte, schrieb ich in dieser Nacht nicht. Ich wusste nicht, was darin stehen sollte. # stil: tagebuch
}
{ grund == "schuld":
    Man sagt, Yharnam mache aus einem Menschen etwas Neues. Ich fing an zu verstehen, dass dabei nie jemand das Wort besser gebraucht hatte. # stil: tagebuch
}
{ grund == "suche":
    Weihrauch. Ich wusste jetzt, wo man ihn riecht: oben, bei der Kathedrale. # stil: tagebuch
}
Ich habe in dieser Nacht gelernt, dass ich in Yharnam nicht sterbe. Die anderen schon. Ich erinnere mich, unterschrieben zu haben, und nicht mehr, was; die Tinte ging nicht von den Fingern. Zwei Fragen schrieb ich mir damals an den Rand: Wann endet eine Nacht, in der die Sonne nicht sinkt? Und wer singt dort oben hinter der Mauer, und warum singt keiner die Zeile zu Ende? # stil: tagebuch
Ich trug einen Schlüssel bei mir, der zu schwer war für einen Schlüssel, und ich ging hinauf, dorthin, wo der Gesang herkam. Die Puppe hatte gesagt, ich solle vorsichtig sein. Ich war es nicht.“ # stil: tagebuch
ENDE DES ERSTEN KAPITELS # stil: titel # kapitel: ende
-> END
