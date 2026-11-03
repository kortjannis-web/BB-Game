// KAPITEL 1, TEIL D: NACHSPIEL. Die Brosche, Eileen, das Mädchen, Gilbert, der Traum.

=== k1_d_grab ===
// TITEL: Viola und die Brosche
// [KANON] Nach Gascoignes Tod: Laterne am Grab, Schlüssel zum Kathedralenbezirk; Violas Leiche auf einem Dach über der Arena, bei ihr die rote Brosche mit ihrem Namen.
// [OFFEN] Wer Viola getötet hat, sagt das Spiel nicht.
~ laterne = -> k1_d_rueckweg
Am Grab flammt eine Laterne auf; bei Gascoigne ein Schlüssel. # lore: laternen # notiz: oedon_schluessel
Oben auf einem Dach über den Gräbern liegt eine Frau; an ihrem Kleid eine große rote Brosche, eingraviert mit einem Namen: Viola. # notiz: gascoigne_schicksal # lore: familie_gascoigne
{ q_frau == 1: Er hatte dich gebeten, ihr auszurichten, er komme bald nach Hause. }
* [Die Brosche an dich nehmen]
    ~ brosche = true
* [Sie ihr lassen]
- { eileen_stufe >= 1: -> eileen_danach }
-> k1_d_rueckweg

= eileen_danach
// [ERWEITERT] Eileens Urteil richtet sich nach dem, was man über Gascoigne gesagt und getan hat.
{ gascoigne_verraten:
    Eileen kommt über die Dächer; sie dankt dir für den Hinweis, und es tröstet dich nicht. # notiz: eileen_dank
}
{ gascoigne_gewarnt:
    Eileen steht am Tor; sie weiß, dass du ihn gewarnt hast, und geht ohne Gruß. # notiz: eileen_bruch
    ~ eileen_partner = false
}
{ eileen_partner:
    Eileen fragt, ob ihr weiter gemeinsam jagt, drüben im Kathedralenbezirk; dort wartet Gascoignes alter Partner. # quest: eileen_henryk
}
-> k1_d_rueckweg

=== k1_d_rueckweg ===
// TITEL: Rückweg durch die Stadt (frei)
-> betreten("rueckweg") ->
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
Das Mädchen am Fenster; sie hört an deinen Schritten, dass etwas anders ist.
{ q_mutter == 0: Sie fragt, ob du ihre Mutter gesehen hast, eine Frau mit roter Brosche. }
* {brosche} [Ihr die Brosche geben und die Wahrheit sagen]
    ~ q_mutter = 3
    ~ maedchen_wo = "fort"
    Sie nimmt die Brosche, weint, dann ist es still hinter dem Fenster; später steht die Haustür offen. # quest: maedchen_fort
* [Lügen: Ihre Mutter kommt bald]
    ~ q_mutter = 4
    Sie glaubt dir, weil sie will. # quest: maedchen_wartet
* [Schweigen]
    ~ q_mutter = 5
    Sie fragt nicht weiter; vielleicht weiß sie es. # quest: maedchen_wartet
- { versprechen_gascoigne and maedchen_wo == "zuhause": -> vater }
-> k1_d_rueckweg

= vater
// [ERWEITERT] Nur, wenn Gascoigne im Moment der Klarheit um etwas gebeten hat.
* [Ihr sagen, ihr Vater habe zuletzt an sie gedacht]
    ~ maedchen = maedchen + 2
    Sie summt das Lied der Spieluhr, leise, hinter dem Fenster. # notiz: maedchen_lied
* [Es für dich behalten]
- -> k1_d_rueckweg

=== k1_d_kanal ===
// TITEL: Rückweg durch die Kanalisation
// Wer das Mädchen fortgeschickt hat oder ihr die Brosche gab, findet hier, was das Schwein getan hat.
~ maedchen_tot = true
Neben dem Schwein liegt etwas Kleines im Wasser; aus seinem Maul hängt ein rotes Band. # quest: maedchen_tot # bild: kanal_schwein
* [Das Band an dich nehmen]
    ~ band = true
* [Weitergehen]
- -> k1_d_rueckweg

=== k1_d_gilbert ===
// TITEL: Gilbert hören lassen, was hinter der Brücke liegt
~ q_gilbert = 2
~ gilbert = gilbert + 1
Gilbert hustet schlimmer als zuvor; er hört zu, als du von der Brücke und den Gräbern erzählst, und bittet dich, vorsichtig zu sein mit dem, was die Kirche verspricht. # quest: gilbert_bericht # lore: heilende_kirche
-> k1_d_rueckweg

=== k1_d_traum ===
// TITEL: Kapitelende im Traum
// [KANON] Die Puppe ist mit der ersten Einsicht erwacht (spätestens jetzt).
~ ort = "traum"
{ not puppe_wach:
    -> puppe_erwacht ->
}
Die Puppe wartet auf der Treppe; sie fragt, wie die Nacht war, und hört zu, ohne zu urteilen. # lore: puppe
// Kapitelbilanz: Was du jetzt weißt, was offen bleibt (die Oberfläche zeigt dazu das Notizbuch).
Was du jetzt weißt: Die Stadt heilt mit Blut, und das Blut macht Bestien; Jäger kippen, und nicht einmal ein Priester ist sicher.
{ gedaechtnis_kleriker: Und das Blut erinnert sich: Die Kirche verwandelt die, die ihr am nächsten sind. }
{ gascoigne_moment: Und dass man einen Menschen in der Bestie noch einmal erreichen kann, für einen Atemzug. }
Was offen bleibt: Was ist bleiches Blut? Wer hält diesen Traum? Wer oder was ist Oedon? Wer hat Viola getötet? # kapitel: ende
-> END
