// KAPITEL 1, TEIL D: NACHSPIEL. Die Brosche, Eileen, das Mädchen, Gilbert, der Traum.

=== k1_d_grab ===
// TITEL: Viola und die Brosche
// [KANON] Nach Gascoignes Tod: Laterne am Grab, Schlüssel zum Kathedralenbezirk; Violas Leiche auf einem Dach über der Arena, bei ihr die rote Brosche mit ihrem Namen.
// [OFFEN] Wer Viola getötet hat, sagt das Spiel nicht.
~ laterne = -> k1_d_rueckweg
An der Mauer des Friedhofs flammt eine Laterne auf, von selbst, als habe sie auf diesen Augenblick gewartet. Neben dem, was von Gascoigne übrig ist, liegt ein schwerer eiserner Schlüssel mit einem eingeprägten Zeichen, das du schon über dem Tor gesehen hast. Er wird das Tor zum Kathedralenbezirk öffnen, das weißt du. Er wiegt mehr, als ein Schlüssel wiegen sollte. # lore: laternen # notiz: oedon_schluessel # bild: grab_oedon # stimmung: ruhig
Am Ende des Friedhofs führt eine schmale Treppe hinauf auf ein flaches Dach. Du weißt nicht, warum du hinaufsteigst. Vielleicht, weil du es schon ahnst.
Oben auf dem Dach liegt eine Frau. Sie liegt auf der Seite, als habe sie sich hingelegt, um auszuruhen, das Gesicht dir abgewandt, das Haar über den Stein gebreitet. Ihr Kleid ist dunkel und nass. Und an ihrer Brust, über dem Herzen, steckt eine große Brosche, rot wie ein Tropfen frischen Blutes, und in die goldene Fassung ist ein Name eingraviert, in einer feinen, liebevollen Schrift: Viola. # notiz: gascoigne_schicksal # lore: familie_gascoigne # stimmung: grauen
{ q_frau == 1:
    Du hörst seine Stimme, ruhig und warm, auf dem Platz am Scheiterhaufen: Wenn du einer Frau begegnest, mit einer großen roten Brosche, dann richte ihr aus, er komme bald nach Hause. Du stehst auf dem Dach und richtest es ihr nicht aus. Es gibt niemanden mehr, dem man es ausrichten könnte.
}
{ q_mutter >= 1:
    Und du denkst an ein Fenster am Brunnenplatz, an eine kleine Stimme, die gut im Warten ist.
}
Wer sie getötet hat, sagt dir niemand. Die Wunden sagen es dir auch nicht, oder du weigerst dich, sie zu lesen.
* [Die Brosche an dich nehmen]
    ~ brosche = true
    Du löst die Brosche von ihrem Kleid, so behutsam, als könne sie es noch spüren. Sie ist warm von deiner Hand, und dann nicht mehr. # notiz: brosche
* [Sie ihr lassen]
    Du lässt ihr die Brosche. Sie gehört zu ihr. Du legst ihr deinen Mantel über die Schultern, weil es kalt ist auf dem Dach, und weil du nichts anderes tun kannst.
- { eileen_stufe >= 1: -> eileen_danach }
-> k1_d_rueckweg

= eileen_danach
// [ERWEITERT] Eileens Urteil richtet sich nach dem, was man über Gascoigne gesagt und getan hat. Die Partnerschaft beginnt in Kapitel 2.
Als du vom Dach herabsteigst, steht Eileen zwischen den Gräbern, bei dem, was von Gascoigne übrig ist. Sie hat die Schnabelmaske gesenkt, als neige sie den Kopf an einem Grab. # stimmung: ruhig
{ gascoigne_verraten:
    Sie dankt dir für deinen Hinweis, leise und förmlich. Es ist das Richtige gewesen, sagt sie. Du wartest darauf, dass es dich tröstet. Es tröstet dich nicht. # notiz: eileen_dank
}
{ gascoigne_gewarnt:
    Sie weiß, dass du ihn gewarnt hast. Sie sagt es nicht. Sie sieht dich nur an, lange, durch die gläsernen Augen der Maske, und dann geht sie, ohne Gruß, und du weißt, dass du etwas verloren hast, von dem du nicht wusstest, dass du es hattest. # notiz: eileen_bruch
}
{ not gascoigne_gewarnt and eileen >= 2:
    ~ eileen_partner = true
    Er sei einer der Guten gewesen, sagt sie dann. Einer der Besten. Und dass das am Ende nichts zähle, nicht für die Jagd, nicht für das Blut. Bevor sie geht, sagt sie dir, wo du sie findest: oben im Kathedralenbezirk, vor der Kapelle. Dort warte Arbeit. Gascoignes alter Partner, Henryk, sei noch da draußen, und es sei nur eine Frage der Zeit. Es klingt nicht wie eine Bitte. Es klingt wie ein Angebot. # quest: eileen_partner
}
{ not gascoigne_gewarnt and eileen < 2 and not gascoigne_verraten:
    Sie nickt dir zu, knapp, wie man einem Kollegen zunickt. Dann ist sie fort.
}
-> k1_d_rueckweg

=== k1_d_rueckweg ===
// TITEL: Rückweg durch die Stadt (frei)
-> betreten("rueckweg") ->
{ k1_d_rueckweg == 1:
    Der Weg zurück führt durch dieselben Straßen, und sie sind nicht mehr dieselben. Der Himmel über Yharnam hat eine Farbe angenommen, für die du kein Wort hast, ein Rot, das kein Abendrot ist, und der Mond steht tiefer, als er sollte, und größer. Die Glocken schweigen. Die Nacht ist weiter fortgeschritten, als es die Zeit erlaubt. # bild: zentral_yharnam # stimmung: grauen
}
- (wohin)
+ {maedchen_wo == "zuhause" and q_mutter < 3} [Zum Fenster des Mädchens] -> k1_d_maedchen
+ {q_gilbert == 1} [Zu Gilbert] -> k1_d_gilbert
+ {maedchen_wo == "fort" and not maedchen_tot} [Durch die Kanalisation zurück] -> k1_d_kanal
+ [Zur Laterne am Grab: in den Traum] -> k1_d_traum

=== k1_d_maedchen ===
// TITEL: WEICHE: Was sagst du dem Mädchen?
// [KANON] Gibt man ihr die Brosche, weiß sie, dass die Mutter tot ist; sie verlässt später das Haus und stirbt in der Kanalisation durch das Schwein.
// [KANON] Behält man die Brosche, bleibt sie; ab Kapitel 2 kann man sie zur Kapelle oder zur Klinik schicken (beides endet schlimm). Kein Ausgang rettet sie.
// [ERWEITERT] Wer ihre Warnung ("dann gehe ich selbst") ernst nimmt, behält die Brosche und gewinnt Zeit.
Der Brunnenplatz liegt still. Du stehst unter dem Fenster im ersten Stock, und bevor du anklopfen kannst, hörst du sie schon hinter den Läden. Sie hört an deinen Schritten, dass etwas anders ist. Kinder hören so etwas. # bild: brunnenplatz # stimmung: ruhig
{ q_mutter == 0:
    Sie fragt, ob du ihre Mutter gesehen hast. Eine Frau mit einer großen roten Brosche. Sie habe gehen müssen, Papa suchen, und sei nicht wiedergekommen.
- else:
    Hast du Mama gefunden, fragt sie.
}
Du denkst an das, was sie beim ersten Mal gesagt hat, mit diesem Trotz in der Stimme: Wenn Mama nicht bald kommt, dann gehe sie selbst.
* {brosche} [Ihr die Brosche geben und die Wahrheit sagen]
    ~ q_mutter = 3
    ~ maedchen_wo = "fort"
    Du schiebst die Brosche durch den Spalt zwischen den Läden. Eine kleine Hand nimmt sie. Lange ist es still. Dann weint sie, nicht laut, nicht wie ein Kind weint, das sich das Knie aufgeschlagen hat, sondern leise und gleichmäßig, wie jemand, der begriffen hat, dass das Weinen nichts ändern wird. # quest: maedchen_fort # stimmung: grauen
    Sie sagt nichts mehr zu dir. Als du später noch einmal über den Platz gehst, steht die Haustür offen.
* [Lügen: Ihre Mutter kommt bald]
    ~ q_mutter = 4
    Du sagst ihr, ihre Mutter komme bald. Sie habe nur noch etwas erledigen müssen. Die Lüge kommt dir leicht über die Lippen, leichter, als dir lieb ist. Und sie glaubt dir, weil sie dir glauben will, und weil Kinder in einer solchen Nacht nichts dringender brauchen als eine Lüge, an der sie sich festhalten können. Sie bleibt. Sie wartet. Sie ist gut im Warten. # quest: maedchen_wartet
* [Schweigen]
    ~ q_mutter = 5
    Du sagst nichts. Du stehst nur da. Und sie fragt nicht weiter. Vielleicht weiß sie es. Vielleicht wissen Kinder so etwas, bevor man es ihnen sagt. Hinter den Läden beginnt sie leise, die Spieluhr zu summen, auch wenn sie die Spieluhr nicht mehr hat. # quest: maedchen_wartet
- { versprechen_gascoigne and maedchen_wo == "zuhause": -> vater }
-> k1_d_rueckweg

= vater
// [ERWEITERT] Nur, wenn Gascoigne im Moment der Klarheit um etwas gebeten hat.
Und dann ist da noch das Versprechen, das du einem Mann gegeben hast, der für einen Atemzug wieder er selbst war.
* [Ihr sagen, ihr Vater habe zuletzt an sie gedacht]
    ~ maedchen = maedchen + 2
    Du sagst ihr, dass du ihren Vater getroffen hast. Dass er an sie gedacht hat. Dass er das Lied nicht vergessen hat. Hinter den Läden ist es still, so still, dass du glaubst, sie sei gegangen. Dann summt sie die Melodie, leise, Note für Note, und du stehst unter dem Fenster und hörst zu, bis sie fertig ist. Es ist das Einzige in dieser Nacht, das du richtig gemacht hast, und du bist nicht einmal sicher, ob es richtig war. # notiz: maedchen_lied # stimmung: schoen
* [Es für dich behalten]
    Du behältst es für dich. Manche Dinge sind zu schwer, um sie durch einen Fensterspalt zu reichen.
- -> k1_d_rueckweg

=== k1_d_kanal ===
// TITEL: Rückweg durch die Kanalisation
// Wer ihr die Brosche gab, findet hier, was das Schwein getan hat.
~ maedchen_tot = true
Du nimmst den Weg durch die Kanalisation, weil er kürzer ist. Später wirst du dir sagen, dass es nur deshalb war. # bild: kanal_schwein # stimmung: grauen
Das Schwein ist wieder da, wie alles in dieser Nacht wiederkommt. Es wühlt im Wasser, und neben ihm liegt etwas Kleines, ein heller Stoff, ein Schuh. Aus seinem Maul, zwischen den gelben Hauern, hängt ein rotes Band, wie Mädchen es sich ins Haar binden. # quest: maedchen_tot
Sie ist gegangen, ihre Mutter zu suchen. So wie sie es gesagt hat. Du hast es gehört. Du hast ihr trotzdem die Brosche gegeben.
* [Das Band an dich nehmen]
    ~ band = true
    Du ziehst das Band aus dem Maul des Schweins, und es lässt es dir, satt und gleichgültig. Das Band ist nass und schwer und dunkler, als es am Morgen gewesen sein muss. Du steckst es zu dem Schlüssel und der Spieluhr, und deine Tasche wiegt jetzt mehr als alles, was du je getragen hast. # notiz: rotes_band
* [Weitergehen]
    Du gehst weiter. Du siehst nicht zurück. Es ist das Feigste, was du in dieser Nacht tust, und du weißt es.
- -> k1_d_rueckweg

=== k1_d_gilbert ===
// TITEL: Gilbert hören lassen, was hinter der Brücke liegt
~ q_gilbert = 2
~ gilbert = gilbert + 1
Gilbert ist am Fenster. Er hustet schlimmer als zuvor, ein tiefer, reißender Husten, nach dem er lange braucht, um wieder sprechen zu können. Aber er will hören, was hinter der Brücke liegt, und so erzählst du es ihm: die Treppen, die Unterstadt, die Gräber, den Namen über dem Tor. Von Gascoigne erzählst du nicht. # bild: gilbert # stimmung: ruhig # quest: gilbert_bericht
Er hört zu, die Stirn ans Gitter gelehnt. Als du fertig bist, schweigt er lange. Dann bittet er dich, vorsichtig zu sein mit dem, was die Kirche dort oben verspricht. Er habe ihr Blut auch genommen, sagt er. Es habe ihm Zeit geschenkt. Aber er wisse nicht mehr, ob das ein Geschenk war. # lore: heilende_kirche
-> k1_d_rueckweg

=== k1_d_traum ===
// TITEL: Kapitelende im Traum
// [KANON] Die Puppe ist mit der ersten Einsicht erwacht (spätestens jetzt).
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Du berührst die Laterne, und die rote Nacht weicht dem elfenbeinfarbenen Himmel des Traumes. Die weißen Blumen. Das Haus auf dem Hügel, dessen Tür jetzt offen steht. Und eine Stille, so vollkommen, dass du erst jetzt merkst, wie laut die Nacht gewesen ist. # bild: traum # stimmung: ruhig
{ not puppe_wach:
    -> puppe_erwacht ->
}
Die Puppe kommt dir entgegen. Sie geht langsam, mit kleinen, vorsichtigen Schritten, und als sie vor dir steht, neigt sie den Kopf und sieht dir ins Gesicht, und in ihren gläsernen Augen ist etwas, das du für Sorge halten würdest, wenn sie ein Mensch wäre. Willkommen zurück, guter Jäger, sagt sie. Sie frage nicht, was geschehen sei. Sie sehe es. # lore: puppe
Du setzt dich auf die Stufen vor dem Haus. Sie setzt sich neben dich. Und eine Weile sitzt ihr nur da, eine Puppe und ein Jäger, und seht über die Blumen, die sich bewegen, obwohl kein Wind geht.
// Kapitelbilanz: Was du jetzt weißt, was offen bleibt (die Oberfläche zeigt dazu das Notizbuch).
WAS DU JETZT WEISST # stil: zwischentitel
Dass Yharnam mit Blut heilt, und dass dasselbe Blut Bestien macht. Dass die Jagd nicht nur Bestien frisst, sondern auch die, die jagen. Dass selbst ein Pater, ein Vater, ein Freund nicht sicher ist vor dem, was in seinen Adern fließt. # stil: bilanz
{ gedaechtnis_kleriker:
    Und dass das Blut sich erinnert. Dass die Kirche ausgerechnet die verwandelt, die ihr am nächsten sind, die beten und singen und am meisten von ihrem heiligen Blut empfangen. # stil: bilanz
}
{ gascoigne_moment:
    Und dass man einen Menschen in der Bestie noch einmal erreichen kann, für einen einzigen Atemzug, wenn man weiß, wonach man rufen muss. # stil: bilanz
}
{ maedchen_tot:
    Und dass manche Fehler nicht im Traum vergehen, wenn man erwacht. # stil: bilanz
}
WAS OFFEN BLEIBT # stil: zwischentitel
Was ist das bleiche Blut, das du suchen sollst? Wer hält diesen Traum, und warum ausgerechnet dich? Wer oder was ist Oedon, dessen Name über einem Friedhof steht und nach Gewitter schmeckt? Und wer hat Viola getötet? # stil: bilanz
Aus den Aufzeichnungen, die man später fand: # stil: tagebuch
„Ich habe in dieser ersten Nacht einen Freund gewonnen und ihn mit eigener Hand erschlagen. Man sagt mir, das sei die Jagd. Ich habe gelernt, dass man in Yharnam nicht stirbt, sondern nur erwacht, immer wieder, und ich beginne zu fürchten, dass genau darin die eigentliche Strafe liegt. Morgen gehe ich hinauf, zur Kathedrale. Die Puppe sagt, ich solle vorsichtig sein. Sie sagt es jedes Mal.“ # stil: tagebuch
ENDE DES ERSTEN KAPITELS # stil: titel # kapitel: ende
-> END
