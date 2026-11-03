// KAPITEL 1, TEIL B: ZENTRAL-YHARNAM. Freie Reihenfolge. Führt zu NADELÖHR 1 (Brücke).

=== k1_hub_b ===
// TITEL: Zentral-Yharnam (frei)
-> betreten("zentral") ->
{ k1_hub_b == 1:
    Rauch über den Dächern, Glocken, Fackeln weiter unten; vor manchen Fenstern glimmen rote Räucherlampen gegen die Bestien. # bild: zentral_yharnam # lore: jagdnacht # lore: raeucherwerk
}
// Das Kreischen der Kleriker-Bestie, zweimal, bevor man ihr begegnet.
{ kleriker == "" and (k1_hub_b == 3 or k1_hub_b == 6):
    -> schrei ->
}
- (wohin)
+ [Gilberts Fenster neben der Laterne] -> k1_b_gilbert
+ [Die Türen mit den Räucherlampen] -> k1_b_tueren
+ [Die Hauptstraße mit dem Scheiterhaufen] -> k1_b_scheiterhaufen
+ [Der Brunnenplatz, wo eine Spieluhr spielt] -> k1_b_maedchen
+ [Die Gasse unter den Dächern] -> k1_b_daecher
+ [Die Dachbalken über dem Kanaleingang] -> k1_b_eileen
+ {kanal_leiter} [Durch die Kanalisation in die Unterstadt] -> k1_hub_c
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Blutampulle trinken] -> ampulle_ruhig -> wohin
+ [An der Laterne in den Traum] -> traum_von_laterne
+ [Zur großen Brücke] -> k1_n1_kleriker

=== schrei ===
// TITEL: Kreischen von der Brücke
~ schreie = schreie + 1
{ schreie:
- 1: Von der Brücke her ein Kreischen, zu hoch für ein Tier und zu lang für einen Menschen. # klang: kleriker_schrei
- 2: Wieder das Kreischen, näher; hinter einer Tür beginnt jemand zu beten. # klang: kleriker_schrei
}
->->

=== k1_b_gilbert ===
// TITEL: Gilbert
// [KANON] Kranker Fremder hinter dem Fenster bei der ersten Laterne; verweist auf die Heilende Kirche und die Brücke; wird nach dem Blutmond zur Bestie.
// [ERWEITERT] Mehr Gespräch, seine Bitte. Sein Feuer gibt er hier schon (im Original später). PRÜFEN: Zeitpunkt der Übergabe.
-> betreten("gilbert") ->
{ k1_b_gilbert == 1:
    Hinter einem vergitterten Fenster hustet ein Mann; er ist fremd wie du, sagt er, und das Blut kaufe ihm nur Zeit. # lore: fremde # lore: bluttransfusion
}
-> themen

= themen
* [Wer er ist]
    Gilbert, ein Fremder mit einer Krankheit, die keiner heilt; er rät dir, die Stadt bald zu verlassen. -> haltung
* [Was diese Nacht ist]
    Eine Jagdnacht: Die Bürger verriegeln sich oder jagen selbst, und was ihnen begegnet, war oft ihr Nachbar. # lore: jagdnacht # lore: bestienseuche # lore: buergerjagd
    -> themen
* [Was bleiches Blut ist]
    Er kennt das Wort nicht; alles Wissen über Blut habe die Heilende Kirche, oben im Kathedralenbezirk. # lore: heilende_kirche # lore: paleblood
    ~ gilbert_bruecke = true
    -> themen
* {gilbert_bruecke} [Wie man zur Kirche kommt]
    Nur über die große Brücke; aber auf der Brücke haust etwas, das früher in der Kirche diente. # lore: kleriker_bestien
    -> themen
* {q_gilbert == 1 and k1_hub_c} [Ihm erzählen, was hinter der Brücke liegt]
    ~ q_gilbert = 2
    ~ gilbert = gilbert + 1
    Er hört zu, ohne zu husten, und dankt dir, als hättest du ihm etwas geschenkt. # quest: gilbert_bericht
    -> themen
+ [Gehen] -> k1_hub_b

= haltung
* [Ihm deinen Namen sagen und zuhören]
    ~ gilbert = gilbert + 1
    Er wiederholt deinen Namen, {name}, leise, als wolle er ihn behalten.
* [Knapp bleiben]
* [Ihn anfahren, er solle dich in Ruhe lassen]
    ~ gilbert = gilbert - 2
    Er schweigt lange.
- { gilbert >= 0: -> geschenk }
-> themen

= geschenk
~ feuer = true
Er schiebt dir etwas Schweres durch das Gitter: Feuer gegen Bestien; er selbst habe es nie benutzt. # notiz: bestien_feuer
{ gilbert >= 1:
    Und er bittet dich, ihm zu erzählen, was hinter der Brücke liegt; er wird es nicht mehr sehen. # quest: gilbert_bericht
    ~ q_gilbert = 1
}
-> themen

=== k1_b_tueren ===
// TITEL: Türen mit Räucherlampen
// [KANON] Bürger hinter Türen: Fremdenhass, Angst, manche feiern. Die einsame alte Frau mit dem Hund am Weg zur Kanalisation.
-> betreten("tueren") ->
Hinter jeder Tür mit roter Lampe eine Stimme: Fremde haben die Seuche gebracht; wer öffnet schon in einer Jagdnacht. # lore: fremde # lore: raeucherwerk
* [Bei der alten Frau mit dem Hund klopfen]
    Sie schimpft auf Fremde, dann auf die Kirche, dann weint sie; Räucherwerk halte die Bestien fern, sagt sie, sonst nichts. # lore: raeucherwerk
    ~ alte_frau = true
    -> frau
* [Einer Stimme drohen, bis sie redet]
    Sie verrät, dass die Bürger selbst jagen und am Scheiterhaufen jeden Fremden verbrennen, und verflucht dich. # lore: buergerjagd
    -> k1_hub_b
+ [Zurück] -> k1_hub_b

= frau
// [KANON] Sie fragt später nach einem sicheren Ort (Kapelle oder Klinik, erst ab Kapitel 2).
* [Ihr versprechen, einen sicheren Ort zu suchen]
    Sie lacht verächtlich, aber sie merkt es sich. # quest: alte_frau_ort
* [Gehen]
- -> k1_hub_b

=== k1_b_scheiterhaufen ===
// TITEL: Scheiterhaufen und Mob, erste Begegnung mit Gascoigne
// [KANON] Scheiterhaufen mit brennender Bestie, Mob aus bewaffneten Bürgern; ein Riese mit Ziegelstein hämmert an eine Tür.
// [ERWEITERT] Gascoigne greift ein; Beginn der Freundschaft; er lehrt die Parade und bittet um einen Gruß an seine Frau.
-> betreten("scheiterhaufen") ->
{ mob != "": -> danach }
Auf dem Platz brennt eine Bestie auf einem Scheiterhaufen; ein Dutzend Bürger mit Fackeln und Mistgabeln dreht sich zu dir um, und ein Riese hämmert mit einem Ziegel gegen eine Tür. # bild: scheiterhaufen # lore: buergerjagd # kampf: mob
+ [Stehen bleiben und kämpfen] -> kampf
+ [In den Schatten um den Platz herum]
    ~ mob = "umgangen"
    Fast; einer sieht dich und schreit. -> gascoigne_greift_ein
+ [Zurück] -> k1_hub_b

= kampf
- (t1)
Sie kommen von zwei Seiten, einer holt mit der Mistgabel aus. # anzeichen: mob
+ [Zurückweichen, bis sie hintereinander stehen]
    Sie behindern sich gegenseitig.
    -> t2
+ [Mitten hinein]
    ~ zuletzt = mobhieb
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {feuer} [Feuer in die Menge]
    Sie weichen schreiend zurück.
    ~ mob = "zerstreut"
    -> gascoigne_greift_ein
- (t2)
Mehr kommen; der Riese lässt die Tür und dreht sich zu dir. # anzeichen: ansturm
+ [Dort durchbrechen, wo der Kreis am dünnsten ist]
    ~ zuletzt = ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ [Stehen und weiterkämpfen]
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    ~ mob = "durchbrochen"
    -> gascoigne_greift_ein
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(1) -> t2

= gascoigne_greift_ein
~ q_frau = 1
Ein Mann mit verbundenen Augen, Priesterschal und Axt tritt zwischen dich und die Bürger; er ruft sie beim Namen, und sie gehen. # lore: gascoigne
Er heißt Gascoigne, ein Pater aus der Fremde, Jäger seit Jahren. # notiz: gascoigne_pater
* [Ihm danken]
    ~ gascoigne = gascoigne + 1
* [Fragen, warum er einem Fremden hilft]
    Weil er selbst einer war, sagt er, und es manchmal vergisst.
    ~ gascoigne = gascoigne + 1
* [Sagen, du hättest es allein geschafft]
    Er lacht, nicht unfreundlich.
- Er zeigt dir, wie man mit der Feuerwaffe im Augenblick des Ausholens schießt, damit eine Bestie wankt. # lore: parade
~ parade = true
Wenn du eine Frau mit einer roten Brosche siehst, sagt er, richte ihr aus, er komme bald nach Hause. # quest: gascoigne_frau
* [Versprechen, es auszurichten]
    ~ gascoigne = gascoigne + 1
* [Nicken]
- Und wenn du zur Brücke gehst, ruf ihn; dort sei eine, die er lange kenne. # quest: gascoigne_bruecke
-> k1_hub_b

= danach
{ mob:
- "zerstreut": Asche und verlassene Fackeln; der Riese ist fort.
- else: Der Mob hat sich verlaufen; die Bestie auf dem Scheiterhaufen ist nur noch Kohle.
}
-> k1_hub_b

=== k1_b_maedchen ===
// TITEL: Das Mädchen am Fenster
// [KANON] Gascoignes Tochter, Mutter (Viola) ging den Vater suchen; Spieluhr: Papas Lied, wenn er sie vergisst. Name der Mutter steht im Deckel.
// [ERWEITERT] Man kann sie schon jetzt fortschicken: falsche Entscheidung, Folge in der Kanalisation.
-> betreten("maedchen") ->
{ maedchen_wo == "fort": -> leer }
{ k1_b_maedchen > 1: -> wieder }
Hinter einem Fenster flüstert ein Mädchen: Papa ist von der Jagd nicht heimgekommen, und Mama ist ihn suchen gegangen. # lore: familie_gascoigne
Wenn Mama nicht bald kommt, sagt sie, geht sie selbst. # notiz: maedchen_warnung
* [Versprechen, die Mutter zu finden]
    ~ maedchen = maedchen + 1
    ~ q_mutter = 1
    -> spieluhr_geben
* [Fragen, woran du die Mutter erkennst]
    Eine große rote Brosche.
    ~ q_mutter = 1
    -> spieluhr_geben
* [Ihr raten, zu Iosefkas Klinik zu laufen, dort sei es sicher]
    -> fort

= spieluhr_geben
Sie schiebt dir eine kleine Spieluhr durch den Spalt: Papas Lied; wenn er sie vergisst, spielen sie es, und er weiß wieder, wer sie sind. # lore: spieluhr
~ spieluhr = true
Im Deckel zwei verblasste Namen: Viola und Gascoigne. # lore: familie_gascoigne
{ q_frau == 1: Du denkst an den Pater mit dem Priesterschal und an die rote Brosche. }
-> k1_hub_b

= fort
// Falsche Entscheidung: Iosefka öffnet niemandem (das hat sie gesagt), und die Nacht ist voller Bestien.
~ maedchen_wo = "fort"
~ maedchen = maedchen - 1
Sie zögert, dann hörst du die Haustür; sie läuft in die Nacht, ohne dir die Spieluhr zu geben. # quest: maedchen_fort
-> k1_hub_b

= wieder
{ q_mutter == 1: Sie fragt, ob du Mama gefunden hast. - else: Sie fragt wieder nach ihrer Mutter. }
+ [Noch nicht] -> k1_hub_b
+ {not spieluhr} [Ihr versprechen, die Mutter zu suchen]
    ~ q_mutter = 1
    -> spieluhr_geben

= leer
Das Fenster ist dunkel; niemand antwortet, und die Haustür steht offen. -> k1_hub_b

=== k1_b_daecher ===
// TITEL: Die Gasse unter den Dächern (Schütze)
// [KANON] Bürger mit Gewehren auf erhöhten Stellen in Zentral-Yharnam. Der Schuss von hinten ist ein Gefühl aus dem Spiel.
-> betreten("daecher") ->
{ schuetze == "erledigt":
    Die Dachrinne ist leer; nur Patronenhülsen.
    -> k1_hub_b
}
Eine enge Gasse, über dir Dachrinnen und zerbrochene Läden.
+ {not schuetze_gesehen} [Langsam, die Dächer im Blick]
    Hinter einem Schornstein: ein alter Mann mit einem Gewehr, länger als er selbst. # anzeichen: schuss
    ~ schuetze_gesehen = true
    -> oben
+ {not schuetze_gesehen} [Schnell hindurch]
    Ein Knall von hinten; die Kugel trifft dich in die Schulter, bevor du ihn siehst. # klang: schuss
    ~ zuletzt = schuss
    ~ schuetze_gesehen = true
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> oben
+ {schuetze_gesehen} [Wieder zu dem Alten mit dem Gewehr] -> oben
+ [Umkehren] -> k1_hub_b

= oben
+ [Hinaufklettern und ihn stellen]
    Er lädt zu langsam nach. Bei ihm: Kieselsteine und ein Molotow.
    ~ schuetze = "erledigt"
    ~ kiesel = kiesel + 2
    ~ molotow = molotow + 1
    ~ echos = echos + 1
    -> k1_hub_b
+ [In Deckung zurück zur Straße] -> k1_hub_b

=== k1_b_eileen ===
// TITEL: Eileen die Krähe (Dach)
// [KANON] Eileen auf einem Dach über dem Kanaleingang, Jägerin der Jäger, gibt Jägermarken.
// [ERWEITERT] Tieferes Gespräch, sie kennt Gascoigne und seinen alten Partner; Grundlage der Partnerschaft.
-> betreten("eileen") ->
{ eileen_stufe >= 1:
    Eileen ist nicht mehr auf dem Dach; ein Rabenfeder liegt dort, wo sie saß.
    -> k1_hub_b
}
~ eileen_stufe = 1
Hinter Fässern auf den Dachbalken sitzt eine Frau in einem Mantel aus Rabenfedern, eine Schnabelmaske im Gesicht; sie jagt nicht Bestien, sagt sie, sondern Jäger, die sich im Blut verlieren. # lore: jaeger_der_jaeger # lore: blutrausch
* [Ihr Respekt zollen]
    ~ eileen = eileen + 1
* [Misstrauisch bleiben]
* [Ihr sagen, sie solle sich um ihren Kram kümmern]
    ~ eileen = eileen - 1
- Sie gibt dir Jägermarken: Wer eine zerdrückt, wacht im Traum auf, ohne zu sterben. # notiz: jaegermarke
~ jaegermarken = 2
Dann fragt sie, ob du einem Pater mit verbundenen Augen begegnet bist.
* {q_frau == 1} [Ja, und er hat dir geholfen; du verteidigst ihn]
    ~ gascoigne = gascoigne + 1
    Dann hoffe, dass er es bleibt, sagt sie; sein alter Partner habe es nicht geschafft. # notiz: henryk
* {q_frau == 1} [Ja; du sagst ihr, wo du ihn gesehen hast]
    ~ gascoigne_verraten = true
    ~ eileen = eileen + 1
    Sie nickt und verschwindet über die Dächer. # notiz: verrat_gascoigne
* [Nein]
- Wenn du sie wiederfinden willst: unten, jenseits der Brücke, bei den Gräbern. # quest: eileen_treffen
-> k1_hub_b
