// KAPITEL 1, TEIL D: NACHSPIEL. Die Brosche, Eileens stumme Geste, das Mädchen, Gilbert, der Traum.

=== k1_d_grab ===
// TITEL: Viola und die Brosche
// [KANON] Nach Gascoignes Tod: Laterne am Grab, Schlüssel zum Kathedralenbezirk; Violas Leiche auf einem Dach über der Arena, bei ihr die rote Brosche mit ihrem Namen.
// [OFFEN] Wer Viola getötet hat, sagt das Spiel nicht. Der Text lässt beide Lesarten offen.
~ laterne = -> k1_d_rueckweg
An der Mauer des Friedhofs flammt eine Laterne auf, von selbst. Neben dem, was von Gascoigne übrig ist, liegt ein schwerer eiserner Schlüssel mit einem eingeprägten Zeichen, das du schon über dem Tor gesehen hast. Er wird das Tor zum Kathedralenbezirk öffnen. Er wiegt mehr, als ein Schlüssel wiegen sollte. # lore: laternen # notiz: oedon_schluessel # bild: grab_oedon # stimmung: ruhig
Am Ende des Friedhofs führt eine schmale Treppe hinauf auf ein flaches Dach. Du steigst hinauf, Stufe um Stufe, langsamer, als deine Beine könnten.
Oben auf dem Dach liegt eine Frau. Sie liegt auf der Seite, als habe sie sich hingelegt, um auszuruhen, das Gesicht abgewandt, das Haar über den Stein gebreitet. Ihr Kleid ist dunkel und nass. Und an ihrer Brust, über dem Herzen, steckt eine große Brosche, rot wie ein Tropfen frischen Blutes, und in die goldene Fassung ist ein Name graviert: Viola. Das V macht einen kleinen Kringel nach links. # notiz: gascoigne_schicksal # lore: familie_gascoigne # stimmung: grauen
{ spieluhr: Du kennst diesen Kringel. Er steht im Deckel der Spieluhr in deiner Tasche. }
Die Wunden sind breit und tief, zu breit für eine Klinge, zu ordentlich für Zähne. Was sie bedeuten, sagen sie dir nicht.
{ q_mutter >= 1: Du denkst an ein Fenster am Brunnenplatz und an eine kleine Stimme, die gut im Warten ist. }
* {q_frau == 1} [Ihr ausrichten, was er dir aufgetragen hat]
    ~ gruss_ausgerichtet = true
    Du kniest dich neben sie. „Er kommt bald“, sagst du leise. „Er hat gesagt, du sollst bei der Kleinen bleiben.“ Der Wind hebt eine Strähne ihres Haares und legt sie wieder hin.
    -> brosche_wahl
* [Schweigen]
    -> brosche_wahl

= brosche_wahl
* [Die Brosche an dich nehmen]
    ~ brosche = true
    Du löst die Brosche von ihrem Kleid, so behutsam, als könne sie es noch spüren. Sie ist warm von deiner Hand, und dann nicht mehr. # notiz: brosche
* [Sie ihr lassen]
    Du lässt ihr die Brosche. Sie gehört zu ihr. Du legst ihr deinen Mantel über die Schultern, weil es kalt ist auf dem Dach und weil du sonst nichts tun kannst.
- { eileen_stufe >= 1 and eileen >= 0: -> eileen_danach }
-> k1_d_rueckweg

= eileen_danach
// [ERWEITERT] Keine dritte Begegnung (Entscheidung des Nutzers: zwei in Kapitel 1). Eileen ist nur zu sehen; ihr Urteil steckt in einer Geste.
Als du vom Dach herabsteigst, steht Eileen zwischen den Gräbern, ein Stück entfernt, bei dem, was von Gascoigne übrig ist. Sie hat die Schnabelmaske gesenkt, als neige sie den Kopf an einem Grab. Sie kommt nicht näher. # stimmung: ruhig
{
- gascoigne_verraten and gascoigne_gewarnt:
    Sie hebt den Kopf, sieht dich an, und dreht dir dann langsam den Rücken zu. So bleibt sie stehen, bis du gegangen bist. Wer erst verrät und dann warnt, hat beide verloren. # notiz: eileen_bruch
- gascoigne_gewarnt:
    Sie sieht dich an, lange, durch die gläsernen Augen der Maske. Dann geht sie, ohne Gruß. Auf dem Grabstein, an dem sie stand, liegt nichts. # notiz: eileen_bruch
- gascoigne_verraten:
    Sie löst ein Abzeichen von ihrer Schnur, ein schlichtes aus Messing, und legt es zu dem Toten. Dann nickt sie dir zu, knapp, förmlich, und du weißt nicht, ob es Dank ist. # notiz: eileen_dank
- else:
    Sie löst ein Abzeichen von ihrer Schnur und legt es zu dem Toten. Dann nickt sie dir zu.
}
{ not gascoigne_gewarnt and eileen >= 2:
    ~ eileen_partner = true
    Bevor sie geht, hebt sie den Schnabel in Richtung des verschlossenen Tores hinauf zum Kathedralenbezirk und tippt zweimal gegen die Maske. Dann ist sie fort. # quest: eileen_partner
}
-> k1_d_rueckweg

=== k1_d_rueckweg ===
// TITEL: Rückweg durch die Stadt (frei)
// [KANON · wahrscheinlich] Kapitel 1 spielt in der Abenddämmerung; der Blutmond kommt erst viel später (nicht hier verbrauchen). PRÜFEN: Tageszeit im Original.
-> betreten("rueckweg") ->
{ k1_d_rueckweg == 1:
    Der Weg zurück führt durch dieselben Straßen, und sie sind nicht mehr dieselben. Die Glocken schweigen. Das Lachen hinter der Tür in der Gasse mit den Räucherlampen hat aufgehört.{ alte_frau: Der Hund der alten Frau liegt vor ihrer Tür und hebt nicht einmal den Kopf.} # bild: zentral_yharnam # stimmung: grauen
    Über den Giebeln hängt die Sonne, tief und rot, genau dort, wo sie hing, als du aus der Klinik getreten bist. Du hast es den ganzen Abend gesehen, an der Brücke, über dem Friedhof, und es dir nicht eingestanden: Sie hat sich nicht bewegt. Sie wird nicht untergehen. Die Nacht der Jagd hat noch nicht einmal richtig angefangen.
    { kleriker == "abgelenkt" or kleriker == "geflohen": Von der Brücke herüber kommt ein Kreischen. Sie ist noch da. Sie wartet. }
    { einsicht >= 3: An einer Hauswand hängt etwas, das sich bewegt und kein Schatten ist, lang und dünn wie gefaltete Finger. Du blinzelst, und es ist eine Dachrinne. }
    { schuetze_verschont:
        Hinter dir, in einer Gasse, scharrt etwas, schwer und schnell, und noch bevor du dich umdrehst, kracht oben auf einem Dach ein Schuss. Etwas Großes fällt dir vor die Füße, Fell und Klauen, und rührt sich nicht mehr. Oben hinter dem Schornstein sitzt der Alte mit der Schlafmütze. Er hat sich ein neues Gewehr besorgt. Er kichert und legt einen Kiesel zu den anderen. # klang: schuss
    }
}
- (wohin)
+ {maedchen_wo == "zuhause" and q_mutter < 3} [Der Brunnenplatz, wo das Mädchen wartet] -> k1_d_maedchen
+ {q_gilbert == 1} [Zu Gilbert] -> k1_d_gilbert
+ {maedchen_wo == "fort" and not maedchen_tot} [Durch die Kanalisation zurück] -> k1_d_kanal
+ [Zur Laterne am Grab: in den Traum] -> k1_d_traum

=== k1_d_maedchen ===
// TITEL: WEICHE: Was sagst du dem Mädchen?
// [KANON] Gibt man ihr die Brosche, weiß sie, dass die Mutter tot ist; sie verlässt später das Haus und stirbt in der Kanalisation durch das Schwein.
// [KANON] Behält man die Brosche, bleibt sie; ab Kapitel 2 kann man sie zur Kapelle oder zur Klinik schicken (beides endet schlimm). Kein Ausgang rettet sie.
// [ERWEITERT] Wer ihre Warnung („dann geh ich selber“) ernst nimmt, behält die Brosche und gewinnt Zeit. Die Wahrheit ohne Brosche glaubt sie nur halb.
{ maedchen_gesehen:
    Der Brunnenplatz liegt still. Das rote Band hängt noch am Riegel. Du stehst unter dem Fenster im ersten Stock, und bevor du klopfen kannst, sind die vier kleinen Finger schon zwischen den Läden. Sie hört an deinen Schritten, dass etwas anders ist. # bild: brunnenplatz # stimmung: ruhig
    { q_mutter == 0: „Hast du meine Mama gesehen?“ | „Hast du Mama gefunden?“ }
- else:
    ~ maedchen_gesehen = true
    Auf einem kleinen Platz mit einem versiegten Brunnen spielt eine Spieluhr, dünn und klar, ein Lied, das du heute Nacht schon einmal gehört hast: gesummt, zwischen Axthieben. An einem Fensterriegel im ersten Stock ist ein rotes Band festgeknotet. Du weißt, wessen Fenster das ist, bevor die Stimme fragt. # bild: brunnenplatz # stimmung: ruhig # lore: familie_gascoigne
    „Bist du ein Jäger? Hast du meine Mama gesehen? Sie hat eine große rote Brosche. Und Papa? Papa ist auch Jäger.“
}
{ versprechen_gascoigne: -> vater }
-> weiche

= vater
// [ERWEITERT] Nur, wenn Gascoigne im Moment der Klarheit um etwas gebeten hat.
Und dann ist da das Versprechen, das du einem Mann gegeben hast, der für einen Atemzug wieder er selbst war.
* [Ihr sagen, ihr Vater habe das Lied nicht vergessen]
    ~ maedchen = maedchen + 2
    Du sagst ihr, dass du ihren Vater getroffen hast. Dass er an sie gedacht hat. Dass er das Lied noch wusste. Hinter den Läden ist es still, so still, dass du glaubst, sie sei gegangen. Dann summt sie die Melodie, leise, Note für Note, und du stehst unter dem Fenster und hörst zu, bis sie fertig ist. # notiz: maedchen_lied # stimmung: schoen
* [Es für dich behalten]
    Du behältst es für dich. Es ist zu schwer, um es durch einen Fensterspalt zu reichen.
- -> weiche

= weiche
* {brosche} [Ihr die Brosche geben und die Wahrheit sagen]
    ~ q_mutter = 3
    ~ maedchen_wo = "fort"
    Du schiebst die Brosche durch den Spalt zwischen den Läden. Eine kleine Hand nimmt sie. Lange ist es still. Dann weint sie, nicht laut, nicht wie ein Kind, das sich das Knie aufgeschlagen hat, sondern leise und gleichmäßig. { gruss_ausgerichtet: „Ich habe es ihr noch gesagt“, sagst du. „Dass er bald kommt.“ Das Weinen hört nicht auf. } # quest: maedchen_fort # stimmung: grauen
    Sie sagt nichts mehr zu dir. Als du später noch einmal über den Platz gehst, steht die Haustür offen, und das Band ist nicht mehr am Riegel.
* {not brosche} [Ihr die Wahrheit sagen, ohne Beweis]
    ~ q_mutter = 7
    Du sagst ihr, dass ihre Mutter nicht wiederkommt. Du sagst es so einfach, wie es geht. „Das stimmt nicht“, sagt sie sofort. „Das sagst du nur.“ Dann, nach einer langen Weile, sehr leise: „Woher weißt du das?“ Du hast nichts in der Hand, das du ihr durch den Spalt reichen könntest. Sie zieht die Finger zurück. Aber die Haustür bleibt zu. Sie wartet weiter, halb im Glauben, halb im Trotz. # quest: maedchen_wartet
* [Lügen: Ihre Mutter kommt bald]
    ~ q_mutter = 4
    Du sagst ihr, ihre Mutter komme bald. Sie habe nur noch etwas erledigen müssen. Die Lüge kommt dir leicht über die Lippen. Sie glaubt dir. „Dann warte ich“, sagt sie. „Ich kann gut warten.“ {not spieluhr: Hinter den Läden fängt die Spieluhr wieder an zu spielen.} # quest: maedchen_wartet
* [Schweigen]
    ~ q_mutter = 5
    Du sagst nichts. Du stehst nur da. Und sie fragt nicht weiter. Die Finger verschwinden aus dem Spalt, und hinter den Läden bleibt es still, keine Spieluhr, kein Summen, nichts. # quest: maedchen_wartet
- -> k1_d_rueckweg

=== k1_d_kanal ===
// TITEL: Rückweg durch die Kanalisation
// Wer sie fortgeschickt hat (früh zur Klinik oder jetzt mit der Brosche), findet hier, was das Schwein getan hat.
~ maedchen_tot = true
Du nimmst den Weg durch die Kanalisation, weil er kürzer ist. # bild: kanal_schwein # stimmung: grauen
Das Schwein ist wieder da, wie alles in dieser Nacht wiederkommt. Es wühlt im Wasser, und neben ihm liegt etwas Kleines, ein heller Stoff, ein Schuh. Aus seinem Maul, zwischen den gelben Hauern, hängt ein rotes Band. { maedchen_gesehen: Am Fensterriegel hat es geknotet gehangen, damit eine Mutter den Weg nach Hause findet. } # quest: maedchen_tot
{ q_mutter == 3:
    Sie ist gegangen, ihre Mutter zu suchen. Mit der Brosche in der Hand. So, wie sie es gesagt hat.
- else:
    Sie ist zur Klinik gelaufen, weil du es ihr gesagt hast, und dann die Treppe hinunter, der Mutter nach.
}
* [Das Band an dich nehmen]
    ~ band = true
    Du ziehst das Band aus dem Maul des Schweins, und es lässt es dir, satt und gleichgültig. Das Band ist nass und schwer und dunkler, als es heute Morgen gewesen sein kann. Du steckst es zu dem Schlüssel{spieluhr: und der Spieluhr}. # notiz: rotes_band
* [Weitergehen]
    Du gehst weiter, ohne dich umzudrehen. Das Schmatzen begleitet dich bis zur Leiter.
- -> k1_d_rueckweg

=== k1_d_gilbert ===
// TITEL: Gilbert hören lassen, was hinter der Brücke liegt
// [ERWEITERT] Sein Versprechen bereitet seinen Blutmond in einem späteren Kapitel vor.
~ q_gilbert = 2
~ gilbert = gilbert + 1
Gilbert ist am Fenster. Er hustet schlimmer als zuvor, ein tiefer, reißender Husten, nach dem er lange braucht, um wieder sprechen zu können. „Erzählen Sie“, sagt er. „Bitte. Was liegt dahinter?“ # bild: gilbert # stimmung: ruhig # quest: gilbert_bericht
Du erzählst ihm von den Treppen, der Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, von den Gräbern und dem Namen über dem Tor}. Er hört zu, die Stirn ans Gitter gelehnt. „Und die Glocken?“, fragt er. „Klingen sie dort unten anders?“ Du sagst ihm, dass sie dort gar nicht klingen. Er nickt, als hätte er das geahnt.
* [Ihm von Gascoigne erzählen]
    Du erzählst ihm von dem Pater mit dem Verband und davon, was am Ende aus ihm geworden ist. Gilbert sagt lange nichts. Dann: „Und wenn es bei mir so weit ist?“ Er lächelt schief, das Lächeln vom ersten Abend. „Holen Sie mich dann? Ich hätte gern, dass es jemand ist, der meinen Namen weiß.“
    ** [Es ihm versprechen]
        ~ versprechen_gilbert = true
        Du versprichst es. „Danke“, sagt er, und dann noch einmal: „Danke.“ Er hustet, und diesmal klingt es beinahe wie ein Lachen. # notiz: versprechen_gilbert
    ** [Nichts versprechen]
        Du versprichst nichts. Er nickt. „Ehrlich. Das ist auch was.“
* [Ihn schonen]
    Von Gascoigne erzählst du nichts. Gilbert merkt, dass da eine Lücke ist, das siehst du an der Art, wie er den Kopf neigt. Er fragt nicht nach.
- Dann bittet er dich, vorsichtig zu sein mit dem, was die Kirche da oben verspricht. „Ich habe ihr Blut auch genommen. Es hat mir Zeit geschenkt. Ich weiß nur nicht mehr, ob das ein Geschenk war.“ # lore: heilende_kirche
-> k1_d_rueckweg

=== k1_d_traum ===
// TITEL: Kapitelende im Traum
// [KANON] Die Puppe ist mit der ersten Einsicht erwacht (spätestens jetzt). Ihr Gruß spricht sinngemäß von daheim (eigener Wortlaut).
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Du berührst die Laterne, und die stehende Sonne weicht dem elfenbeinfarbenen Himmel des Traumes. Die weißen Blumen. Das Haus auf dem Hügel mit seinen erleuchteten Fenstern. Und eine Stille, so vollkommen, dass du erst jetzt merkst, wie laut die Stadt gewesen ist. # bild: traum # stimmung: ruhig
{ not puppe_wach:
    -> puppe_erwacht ->
}
Die Puppe kommt dir entgegen. Sie geht langsam, mit kleinen, vorsichtigen Schritten, und als sie vor dir steht, neigt sie den Kopf und sieht dir ins Gesicht. In ihren gläsernen Augen spiegelt sich das Haus. „Da bist du wieder“, sagt sie. „Daheim.“ Sie fragt nicht, was geschehen ist. Ihr Blick bleibt an deinen Händen hängen, an der braunen Tinte an deinen Fingerkuppen, die nicht abgeht. # lore: puppe
Du willst sie verbessern. Das hier ist nicht daheim. Du sagst es nicht.
Du setzt dich auf die Stufen vor dem Haus. Sie setzt sich neben dich, die Hände im Schoß gefaltet. Eine Weile sitzt ihr nur da, eine Puppe und ein Jäger, und seht über die Blumen. „Sei vorsichtig, guter Jäger“, sagt sie nach einer langen Zeit, als hätte sie es sich lange überlegt. „Du kommst immer zurück. Aber jedes Mal ein wenig anders.“
// Kapitelbilanz: Was du jetzt weißt, was offen bleibt (die Oberfläche zeigt dazu das Notizbuch).
WAS DU JETZT WEISST # stil: zwischentitel
Dass Yharnam mit Blut heilt und dass die Stadt trotzdem Bestien verbrennt, die gestern noch Nachbarn waren. Dass die Jagd nicht nur Bestien frisst, sondern auch die, die jagen. # stil: bilanz
{ q_frau == 1 or gascoigne2:
    Dass selbst ein Pater, ein Vater{q_frau == 1:, ein Freund} nicht sicher ist vor dem, was in seinen Adern fließt. # stil: bilanz
}
{ gedaechtnis_kleriker:
    Dass das Blut sich erinnert. Und du ahnst, nach dem, was du durch fremde Augen gesehen hast, warum es gerade die trifft, die der Kirche am nächsten sind. Beweisen kannst du es nicht. # stil: bilanz
}
{ gascoigne_moment:
    Dass man einen Menschen in der Bestie noch einmal erreichen kann, für einen einzigen Atemzug, wenn man weiß, wonach man rufen muss. # stil: bilanz
}
{ maedchen_tot:
    Dass manches nicht im Traum vergeht, wenn man erwacht. # stil: bilanz
}
WAS OFFEN BLEIBT # stil: zwischentitel
Was ist das bleiche Blut, das du suchen sollst? Wer war der alte Mann in der Klinik, und was hast du unterschrieben? Wer hält diesen Traum, und warum ausgerechnet dich? # stil: bilanz
{k1_c_graeber:Wer oder was ist Oedon, dessen Name über einem Friedhof steht? }Wer hat Viola getötet?{kleriker != "": Warum werden ausgerechnet Kirchenleute zu Bestien?} # stil: bilanz
Und wann endet diese Nacht, deren Sonne nicht untergeht, und was wird aus dir, wenn sie endet? # stil: bilanz
Aus den Aufzeichnungen, die man später fand: # stil: tagebuch
{
- gascoigne_verraten:
    „Ich habe in dieser ersten Nacht einem Mann verraten, wo er zu finden ist, und dann habe ich ihn selbst gefunden. Man sagt mir, das sei die Jagd. # stil: tagebuch
- gascoigne_moment:
    „Ich habe in dieser ersten Nacht einen Freund gewonnen und ihn mit eigener Hand erschlagen. Für einen Atemzug war er wieder er selbst, und ich habe diesen Atemzug genommen und ihn trotzdem getötet. Man sagt mir, das sei die Jagd. # stil: tagebuch
- q_frau == 1 and gascoigne >= 2:
    „Ich habe in dieser ersten Nacht einen Freund gewonnen und ihn mit eigener Hand erschlagen. Er hat mir Branntwein gegeben, der nach Birne schmeckte. Man sagt mir, das sei die Jagd. # stil: tagebuch
- else:
    „Ich habe in dieser ersten Nacht einen Pater getötet, der seinen eigenen Namen vergessen hatte. Ich wusste nicht, wer er war, bis ich die Kappe auf dem Grabstein sah. Man sagt mir, das sei die Jagd. # stil: tagebuch
}
{ im_lied_getroffen:
    Ich habe zugeschlagen, während er dem Lied seiner Tochter zuhörte. Ich weiß nicht, ob man mir das vergeben kann; ich weiß nur, wer es nicht mehr kann. # stil: tagebuch
}
{ maedchen_tot:
    Ein rotes Band. Ich schreibe nicht mehr darüber. # stil: tagebuch
}
{ q_mutter == 4:
    Einem Kind habe ich gesagt, seine Mutter komme bald. Es wartet. # stil: tagebuch
}
{ grund == "heilung_anderer":
    Den Brief nach Hause, den ich versprochen habe, habe ich noch nicht geschrieben. Ich weiß nicht, was darin stehen soll. # stil: tagebuch
}
{ grund == "schuld":
    Man sagt, Yharnam mache aus einem Menschen etwas Neues. Ich fange an zu verstehen, dass niemand gesagt hat, etwas Besseres. # stil: tagebuch
}
{ grund == "suche":
    Weihrauch. Ich weiß jetzt, wo man ihn riecht. Morgen gehe ich dorthin. # stil: tagebuch
}
Ich habe gelernt, dass man in Yharnam nicht stirbt, sondern nur erwacht, immer wieder. Ich erinnere mich, unterschrieben zu haben. Ich erinnere mich nicht mehr, was. Die Tinte ist noch an meinen Fingern. Morgen gehe ich hinauf, zur Kathedrale. Die Puppe sagt, ich solle vorsichtig sein.“ # stil: tagebuch
ENDE DES ERSTEN KAPITELS # stil: titel # kapitel: ende
-> END
