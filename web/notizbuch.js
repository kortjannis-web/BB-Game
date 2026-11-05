// Notizbuch des Jägers: Einträge zu den Lore-Tags der Geschichte (# lore: id).
// Geschrieben in der Stimme des Jägers: Ich, rückblickend im Präteritum, Stimme A (docs/stimme.md); Kanon sinngemäß, Offenes bleibt offen.
// Lektorat 2026-11-05: keine Spielsprache (Echos, kaufen), keine Formeln aus dem Erzähltext (süß und schwer, nasses Fell), keine Sätze aus
// Lore-Dateien. Die Fragen der Nacht bleiben im Präsens: Sie sind noch offen.
// Jeder Eintrag hat Stufen: [Bedingung, Text]. Gezeigt werden alle Stufen, deren Bedingung im Spielstand gilt,
// damit das Notizbuch nur weiß, was der Spieler auf seinem Weg erlebt hat (CLAUDE.md: nichts vorwegnehmen).
// Bedingungen: "" (immer), "var", "!var", "var>=2", "var==wert", mehrere mit "&&". Die letzte Stufe mit
// "einsicht>=…" ist die Stufe „Was ich ahnte“.
// Jede Stufe hängt an dem, was der Spieler wirklich gesehen oder gehört hat (Faktencheck 2026-11-05), nicht am bloßen
// Besuch eines Knotens, in dem es nur einer von mehreren Wegen zeigt.
// Unbekannte Namen zählen als Knotenbesuch und ergeben 0: Eine Stufe mit einem Merker, den die Ink-Dateien (noch) nicht
// setzen, bleibt verborgen. Erwartete Merker aus anderen Dateien: gilbert_jagd (Gilbert, Thema verriegelte Türen),
// gilbert_kleriker (Gilbert, Weg zur Kathedrale, Zweig mit dem Gerücht), frau_betet (Türen, die Betende).
window.NOTIZBUCH = {
  bluttransfusion: { titel: "Die Bluttransfusion", stufen: [
    ["", "In Yharnam heilte man mit Blut. Man unterschrieb einen Bogen, man ließ sich in einem Stuhl mit Riemen festschnallen, und dann empfing man. Es heile, sagten sie. Was es sonst noch tue, sagte keiner."],
    ["gilbert_geschenk", "Gilbert hatte es auch empfangen. Es habe ihm Aufschub gekauft, sagte er, nur Aufschub."],
  ] },
  paleblood: { titel: "Bleiches Blut", stufen: [
    ["", "Bleiches Blut. Der alte Mann in der Klinik sprach es aus, als lese er es mir von der Stirn ab."],
    ["k1_erwachen", "Neben dem Stuhl mit den Riemen lag ein Zettel in eiliger Hand, die letzte Zeile über den Rand gelaufen. Bleiches Blut solle man suchen, stand darin, wenn man über die Jagd hinausgelangen wolle. Wer das geschrieben hatte, wusste ich nicht."],
    ["haltung_vertrag==wach", "In meinem Vertrag stand es schon, ehe ich unterschrieb, in der Zeile für den Grund meiner Reise, und die Schrift sah der meinen ähnlich."],
    ["gilbert_bruecke", "Gilbert kannte das Wort nicht. Wenn es einer wisse, meinte er, dann die Kirche."],
  ] },
  jaegertraum: { titel: "Der Jägertraum", stufen: [
    ["", "Ein Garten voll weißer Blumen unter einem Himmel ohne Sonne, Grabsteine im Gras und auf dem Hügel ein Haus, in dem immer Licht brannte. Jeder Weg, den ich ging, führte zurück zum Grabstein ohne Namen."],
    ["tode>=2", "Dorthin kehrte ich zurück, wenn ich starb. Ich starb nicht; ich erwachte, und der Einstich in meiner Armbeuge war danach jedes Mal frisch."],
    ["tode>=3", "Die braune Tinte der Unterschrift blieb an meinen Fingern. Ich war gestorben, und sie war noch da."],
    ["puppe_gespraech>=3", "Für jeden Grabstein im Garten, sagte die Puppe, sei einmal einer gekommen wie ich. Es sei so lange her, dass sie die Gesichter verwechsle. Meines wolle sie sich merken."],
    ["einsicht>=2", "Was ich ahnte: Man kam nicht dorthin, um sich auszuruhen. Man wurde dort aufbewahrt."],
  ] },
  ende_der_nacht: { titel: "Das Blatt am Altar", stufen: [
    ["", "Im Haus auf dem Hügel lag hinten, wo der Feuerschein nicht mehr hinreichte, auf einem Altar ein Blatt. Wer es beschrieb, hatte die Feder so fest aufgedrückt, dass die Buchstaben auf der Rückseite erhaben standen: Aus diesem Traum kommt nur hinaus, wer der Seuche ihre Quelle verschließt. Bleibt die Quelle offen, bleibt die Nacht. Ein Name stand nicht darunter."],
    ["gehrman_nacht", "Gehrman sagte, hinaus komme man, wenn die Nacht vorbei sei. Er sagte es schnell, wie etwas Auswendiggelerntes; so habe man es ihm gesagt."],
    ["gehrman_wann", "Als ich fragte, wann sie vorbei sei, nahm er ein Werkzeug von der Bank und putzte es. Es war schon sauber."],
  ] },
  puppe: { titel: "Die Puppe", stufen: [
    ["!puppe_wach", "Am Fuß der Treppe im Garten stand eine Puppe in Menschengröße, die Hände vor dem Kleid gefaltet, das Gesicht so sorgfältig gemalt, dass an den Wimpern jeder Pinselstrich zu sehen war. Ihre Augen waren offen und sahen nichts."],
    ["puppe_wach", "Sie bewegte sich. Ein Lid hob sich, nur eines, der Kopf wandte sich mit einem Knirschen in der Halsfuge nach mir, und sie sprach, sanft und klar und ohne zwischen den Sätzen zu atmen. Man habe sie in den Garten gestellt, um mich zu behüten. Ihre ersten Worte schrieb ich mir auf, ohne zu wissen, warum: Da bist du ja."],
    ["puppe_daheim || k1_d_traum", "Sie nannte den Traum daheim. Ich widersprach ihr nicht."],
  ] },
  boten: { titel: "Die Boten", stufen: [
    ["", "Kleine graue Wesen, nicht größer als ein Kind, mit Gesichtern aus nassem Ton. Zuerst sah ich sie im Fieber der Klinik, wie sie mir über die Riemen auf die Brust krochen. Im Garten kamen sie aus der Erde und reichten mir Waffen."],
    ["k1_laterne_zentral", "Wo ich eine Laterne entzündete, brachen sie aus dem Boden und drängten sich an das Eisen, wo es warm war."],
    ["boten_laden", "Im Garten hockten sie in einem steinernen Becken voll trüben Wassers und gaben mir Dinge heraus, gegen das, was aus den Bestien in mich aufgestiegen war. Woher sie die Dinge hatten, fragte ich nicht."],
    ["brief_gezeigt", "Als sie das silberne Abzeichen von der Brücke sahen, tippte einer mit nassem Finger auf das Schwert darauf, tauchte unter und kam mit einem Brief wieder hoch. Das Papier war trocken."],
    ["puppe_gespraech", "Die Puppe nannte sie die Kleinen. Sie gruben nach Leuten wie mir, sagte sie, und mich hätten sie ausgegraben."],
  ] },
  laternen: { titel: "Die Laternen", stufen: [
    ["", "Von jeder Laterne, die ich entzündete, führte ein Weg in den Garten und von dort zurück, als wäre an ihr ein Faden festgeknotet. Verloren gehen konnte ich so nicht mehr. Davonlaufen auch nicht."],
  ] },
  jagdnacht: { titel: "Die Jagdnacht", stufen: [
    ["", "In manchen Nächten jagte Yharnam. Dann schoben die Bürger die Riegel vor, hängten Räucherwerk in die Fenster, und hinaus gingen die Jäger."],
    ["gilbert_jagd", "Was sie jagten, sagte Gilbert, hätten sie tags zuvor meist noch gegrüßt."],
    ["k1_d_rueckweg", "Auf dem Rückweg hing die Sonne noch über den Dächern, wo sie gehangen hatte, als ich aus der Klinik trat, und mein Schatten lag so lang auf dem Pflaster wie am Anfang."],
  ] },
  raeucherwerk: { titel: "Räucherwerk", stufen: [
    ["", "Vor den Fenstern hingen rote Lampen, und ihr Rauch setzte sich in die Kleider, bis man ihn nicht mehr roch. Er sollte die Bestien fernhalten. An der Zahl der Lampen, sagte man, lasse sich ablesen, wie viel Angst in einem Haus wohne."],
  ] },
  buergerjagd: { titel: "Die Jagd der Bürger", stufen: [
    ["", "Nicht nur die Jäger jagten. Wer von den Bürgern das Warten nicht mehr aushielt, ging mit Fackel und Mistgabel selbst hinaus, und was sie für eine Bestie hielten, verbrannten sie. Einen Fremden hielten sie leicht dafür."],
    ["mob_verbrannt", "Eine von ihnen hieß Martha. Sie hatte einem Jäger manchmal Brot gegeben."],
  ] },
  fremde: { titel: "Fremde", stufen: [
    ["", "Yharnam hasste Fremde. Man sagte, wir hätten die Seuche gebracht."],
    ["k1_b_gilbert", "Gilbert hinter seinem Gitter war einer von uns. Er roch es an mir, sagte er: Regen und Landstraße."],
  ] },
  heilende_kirche: { titel: "Die Heilende Kirche", stufen: [
    ["", "Sie verwaltete das Blut in Yharnam, jede Behandlung, jede Ampulle."],
    ["gilbert_bruecke", "Ihr Blut, sagte Gilbert, komme aus der großen Kathedrale über der Stadt, so wie Wasser aus einer Quelle."],
    ["k1_hub_c", "Über den Gräbern der Unterstadt stieg eine schmale Treppe die Felswand hinauf zu einem Tor. Dahinter, hieß es, liege der Bezirk der Kathedrale. Das Tor war zu."],
    ["frau_betet", "Hinter einer Tür betete eine Frau, und in ihrem Gebet hieß es, die Kirche habe ihnen das Räucherwerk gesegnet."],
    ["alte_frau", "Eine alte Frau hinter ihrer Tür sagte, die Kirche lasse die Fremden mit ihrem Blut herein."],
    ["k1_b_anschlag", "An einer Kapellentür hing ein Anschlag an die Gemeinde: Wer Fieber an sich spüre oder einen Durst, den kein Wasser stille, solle sich zur nächsten Stelle des Blutes begeben. Darunter stand in Kreide, klein und schief und halb weggewischt: Mein Bruder ist gegangen. Er hatte keinen Durst. Das Papier roch herb, nach Weihrauch."],
    ["kirchenbrief", "Ein Kirchendiener schrieb seiner Schwester von einer Kapelle oben im Bezirk, die jeden aufnehme, der noch sprechen könne, und von einer Vikarin, die am längsten bete. Seinen letzten Satz hatte er so fest ausgestrichen, dass die Feder das Papier zerriss. Lesbar waren zwei Wörter: Komm nicht."],
  ] },
  bestienseuche: { titel: "Die Seuche", stufen: [
    ["", "In Yharnam wurden Menschen zu Bestien, und niemand wusste, wen es als Nächsten traf."],
    ["k1_c_kanal", "Unter der Stadt lagen die, die es getroffen hatte, in einem Becken übereinander, und begraben hatte sie keiner. Um ein Handgelenk war noch ein Streifen Leinen geknotet, darauf eine Nummer in sauberer Tinte."],
  ] },
  kleriker_bestien: { titel: "Kleriker-Bestien", stufen: [
    ["gilbert_kleriker", "Man erzählte sich, aus Kirchenleuten würden die schlimmsten Bestien, ausgerechnet aus denen, die beten und singen. Warum gerade aus ihnen, sagte keiner."],
    ["k1_n1_kleriker", "Auf der großen Brücke hauste eine Bestie, so mager, dass sich unter dem Fell jede Rippe abzeichnete, mit einem Geweih, das gegen sich selbst gewachsen war, und einem Arm, doppelt so lang wie der andere."],
    ["kleriker==besiegt", "Im Fell der Bestie steckte ein silbernes Abzeichen mit einem Schwert, und um ihren Hals hing ein Streifen Stoff, der einmal weiß gewesen war, Kragen oder Verband. Über der Brust, wo das Fell dünn wurde, saßen Narben von Nadeln, Reihe um Reihe."],
    ["gedaechtnis_kleriker && einsicht>=2", "Was ich ahnte: Wem sie am meisten von ihrem heiligen Blut gaben, dem geschah es zuerst. Beweisen konnte ich es nicht."],
  ] },
  blutgedaechtnis: { titel: "Das Gedächtnis des Blutes", stufen: [
    ["gedaechtnis_kleriker", "Als ich das Blut der Bestie berührte, sah ich durch fremde Augen: eine Kathedrale voller Kerzen, einen weißen Kragen, eine Stimme, die mitten im Lied kippte."],
    ["gehrman_blut", "Gehrman sagte, man erzähle sich, das Blut erinnere sich. Wissen habe er es nie wollen."],
  ] },
  blutrausch: { titel: "Wie Jäger kippen", stufen: [
    ["", "Von Jägern, die zu tief ins Blut gerieten, hieß es, sie fänden nicht mehr zurück, und man rieche es an ihnen."],
    ["eileen_stufe>=2 && eileen>=0", "Die Frau im Federmantel nahm ein Abzeichen von ihrer Schnur und hielt es mir hin. Der habe an Stellen gelacht, wo keiner lacht, sagte sie. Drei Wochen vorher."],
    ["gascoigne2 && gascoigne_name", "Einer vergaß zwischen den Gräbern meinen Namen und fand ihn einen Atemzug zu spät wieder."],
    ["gascoigne2 && !gascoigne_name", "Einer kniete zwischen den Gräbern und wühlte mit bloßen Händen in frischer Erde."],
  ] },
  jaeger_der_jaeger: { titel: "Die Jägerin der Jäger", stufen: [
    ["", "Eine Frau mit Federmantel und Schnabelmaske. An einer Schnur um ihren Hals klapperten Abzeichen, Messing, Silber, Eisen, jedes abgegriffen."],
    ["eileen_genannt", "Sie hieß Eileen. Die Abzeichen an ihrer Schnur hatten Jägern gehört."],
    ["k1_b_eileen", "Sie warf mir zwei Marken aus Messing zu, mit einem Zeichen, das auf dem Kopf stand, wie man sie auch drehte. Wer eine zerdrücke, erwache im Garten, ohne vorher zu sterben; was er an Blut bei sich trage, bleibe zurück."],
    ["marke_benutzt", "Ich zerdrückte eine. Ich erwachte im Garten, und was die Toten der Nacht in mich gegeben hatten, war fort. Kein Fleck, nirgends."],
    ["eileen_name", "Sie gab mir ein Stück Dörrfleisch und fragte nach meinem Namen."],
  ] },
  parade: { titel: "Die Parade", stufen: [
    ["", "Mit der Feuerwaffe tötete man nicht. Man wartete, bis die Bestie ausholte und ihr ganzes Gewicht im Schlag lag, und genau dann schoss man. Dann wankte sie."],
    ["parade_quelle==gascoigne", "Gascoigne zeigte es mir auf dem Platz, mit dem Feuer im Rücken. Nicht davor, sagte er. Nicht danach."],
    ["parade_quelle==gehrman", "Gehrman erklärte es mir, und für drei Sätze klang er wie einer, der über Übungsplätze ruft."],
  ] },
  gascoigne: { titel: "Der Pater mit dem Verband", stufen: [
    ["", "Ein großer Mann mit verbundenen Augen und einem Priesterschal, in der Hand eine Axt."],
    ["q_frau==1 || gascoigne2", "Er hieß Gascoigne."],
    ["q_frau==1 && mob!=zerstreut", "Am Scheiterhaufen schickte er die Bürger beim Namen nach Hause, einen nach dem anderen, mit einem Rollen in der Stimme, das nicht aus diesen Gassen stammte."],
    ["q_frau==1", "Er bat mich, einer Frau mit einer großen roten Brosche auszurichten, er komme bald."],
    ["gascoigne2", "Zwischen den Gräbern traf ich ihn wieder. Er wühlte in frischer Erde."],
    ["gascoigne_tot", "Am Grab des Oedon tötete ich ihn. Sein Hut blieb auf einem Grabstein liegen, die Krempe nach oben."],
  ] },
  familie_gascoigne: { titel: "Das Fenster am Brunnenplatz", stufen: [
    ["maedchen_gesehen", "Hinter einem Fenster am Brunnenplatz wartete ein Mädchen auf Vater und Mutter. Ihre Schleife hatte sie an den Riegel gehängt, damit die Mama das Fenster finde."],
    ["spieluhr", "Im Deckel ihrer Spieluhr standen zwei Namen: Viola. Gascoigne. Das V machte einen kleinen Kringel."],
    ["frau_betet", "Hinter einer Tür in der Gasse mit den Räucherlampen sagte eine Betende, eine Dame mit einer großen roten Brosche habe nach dem Weg zu den Gräbern gefragt. Aufgemacht habe sie ihr nicht."],
    ["gascoigne_tot", "Auf einem Dach über dem Grab lag eine Frau mit der roten Brosche. Viola. Wer sie getötet hatte, erfuhr ich nicht."],
  ] },
  spieluhr: { titel: "Die Spieluhr", stufen: [
    ["", "Die Spieluhr sei von Papa, sagte das Mädchen. Wenn er fremd werde, ziehe sie sie auf, und hinterher sei er wieder Papa."],
    ["spieluhr_mal>=1", "Am Grab hielt ihn das Lied fest, solange es spielte."],
    ["spieluhr_mal>=3", "Beim dritten Mal zerriss es ihn."],
  ] },
  oedon: { titel: "Oedon", stufen: [
    ["", "Ein Name über einem Friedhof, ohne Vornamen, ohne Jahreszahl, ohne Gebet. Wer oder was Oedon war, wusste ich nicht."],
    ["einsicht>=1 && k1_c_graeber", "Als ich den Namen aussprach, kam ein Druck hinter den Ohren, wie vor einem Gewitter, das nicht vom Himmel kommt."],
  ] },
  einsicht: { titel: "Einsicht", stufen: [
    ["", "Auf der Brücke zählte ich die Gelenke eines Arms und kam beim zweiten Mal auf eine andere Zahl. Dabei öffnete sich hinter meiner Stirn ein Spalt, schmal wie der unter einer Tür, und seither sah ich Dinge, die vorher nicht da waren, oder die da waren, ohne dass ich sie sah. Ob sich so ein Spalt wieder schließen lässt, wusste ich nicht."],
    ["einsicht>=3", "Am Grab des Oedon fiel sein Schatten falsch, dem Licht entgegen. Ich erzählte es niemandem."],
  ] },
  gehrman: { titel: "Gehrman", stufen: [
    ["", "Ein alter Mann im Rollstuhl im Garten, mit einem breitkrempigen Hut und einer Decke über den Knien."],
    ["gehrman_jaeger", "Er war selbst einmal Jäger gewesen, als es noch wenige gab, und hatte ein paar an seiner Werkbank angelernt. Als er davon sprach, schloss sich seine Hand um einen Griff, den es nicht gab."],
    ["gehrman_wann", "Als ich ihn fragte, wann die Nacht vorbei sei, sah er ins Feuer und auf die Decke über seinen Knien und antwortete nicht."],
    ["gehrman_versprochen", "Er hatte einem Freund etwas versprochen. Er wisse noch, sagte er, dass er es versprochen habe."],
  ] },
  // Erwarteter Lore-Tag aus b_yharnam.ink (Faktencheck b_yharnam Nr. 6): der Zettel im dunklen Haus. Ohne den Tag bleibt der Eintrag unsichtbar.
  kirche_sperrt_bruecke: { titel: "Der Zettel im dunklen Haus", stufen: [
    ["", "Im dunklen Haus neben der Laterne, im ersten Stock, neben einem Rollstuhl mit einer Gestalt, die durch den offenen Mund atmete, lag ein Zettel. Ein Bürger hatte geschrieben, die Kirche habe die große Brücke gesperrt, als die Jagd begann, und die Leute sich selbst überlassen, während unten im Tal, wo die Stadt früher war, alles brannte."],
    ["k1_n1_kleriker.uebergang", "Am Ende der Brücke stand ein Tor zur Kathedrale hin, von drüben verriegelt."],
  ] },
};

// Personen: wie sie zu dir stehen, nur in Worten. "wenn": ob die Person überhaupt im Notizbuch steht;
// "stufen": die erste Stufe, deren Bedingung gilt, wird gezeigt.
window.PERSONEN = [
  { name: "Gilbert", wenn: "k1_b_gilbert", stufen: [
    ["versprechen_gilbert", "Ich versprach ihm, ihn zu holen, wenn es bei ihm so weit wäre."],
    ["gilbert>=2", "Er sammelte Namen hinter seinem Gitter. Meinen behielt er."],
    ["gilbert>=0", "Ein Fremder wie ich, krank und höflich. Er hörte, wer vorbeiging."],
    ["", "Ich wandte mich von ihm ab, ehe er ausgesprochen hatte. Danach hustete er gedämpft, wenn ich vorbeiging, und sah nicht auf."],
  ] },
  { name: "Gascoigne", wenn: "q_frau==1 || gascoigne2", stufen: [
    ["gascoigne_tot", "Tot, am Grab des Oedon. Sein Hut blieb auf dem Grabstein liegen."],
    ["gascoigne>=3 && q_frau==1", "Ein Freund, glaubte ich. Er gab mir aus seiner Blechflasche zu trinken, einen Branntwein, der nach Torf und Rauch schmeckte, nach einem Land, das nicht dieses war."],
    ["gascoigne>=1 && q_frau==1", "Er zeigte mir, wie man wartet. Unter dem Teer roch er nach noch etwas, und ich schrieb nicht auf, wonach."],
    ["gascoigne2 && q_frau==0", "Ein Pater, der zwischen den Gräbern in frischer Erde wühlte. Er musste sich seinen eigenen Namen vorsagen."],
    ["", "Er traute mir nicht. Vielleicht hatte er recht."],
  ] },
  { name: "Viola", wenn: "gascoigne_tot", stufen: [
    ["gruss_ausgerichtet", "Seine Frau. Tot auf einem Dach. Ich richtete ihr seinen Gruß trotzdem aus."],
    ["", "Seine Frau. Tot auf einem Dach, die rote Brosche über dem Herzen."],
  ] },
  { name: "Das Mädchen", wenn: "maedchen_gesehen || k1_b_maedchen", stufen: [
    ["maedchen_tot", "Tot. Im Maul eines Schweins hing ihr Band, rot und schwer. Am Riegel war es weiß gewesen."],
    ["maedchen_wo==fort", "Sie lief los. Wohin, wusste ich nicht."],
    ["q_mutter==4", "Sie wartete. Ich hatte ihr gesagt, ihre Mutter komme bald."],
    ["maedchen>=1", "Sie wartete hinter dem Fenster am Brunnenplatz. Warten könne sie gut, sagte sie."],
    ["k1_d_maedchen && !maedchen_tot", "Der Morgen komme immer, sagte sie, man müsse ihn nur abwarten."],
    ["", "Sie wartete hinter dem Fenster am Brunnenplatz, die weiße Schleife am Riegel."],
  ] },
  { name: "Die Frau im Federmantel", wenn: "eileen_stufe>=1", stufen: [
    ["eileen_partner", "Im Holz des Tores oben an der Treppe hinter dem Grab waren zwei frische Kerben, wie ein Schnabel aus Stahl sie schlägt. Ich glaubte, sie warte dort oben."],
    ["gascoigne_gewarnt", "Am Grab lag eine ihrer Federn, geknickt."],
    ["eileen>=2", "Sie ließ mich neben sich sitzen."],
    ["eileen>=0", "Sie beobachtete mich. Wie lange schon, wusste ich nicht."],
    ["", "Sie hielt mich für jemanden, der nicht weiß, wann man den Mund hält."],
  ] },
  { name: "Iosefka", wenn: "k1_iosefka", stufen: [
    ["iosefka>0", "Eine Ärztin hinter einer verriegelten Tür. Sie notierte sich, dass ich höflich war. Ihre Stimme würde ich wiedererkennen."],
    ["", "Eine Ärztin hinter einer verriegelten Tür. Sie notierte sich, dass ich gegen ihre Tür geschlagen hatte."],
  ] },
  { name: "Gehrman", wenn: "gehrman || gehrman_gesehen", stufen: [
    ["gehrman_bestien", "Der alte Mann in der Werkstatt im Traum. Freundlich. Als ich nach den Bestien fragte, hielten seine Hände die Lehnen, bis das Holz knackte."],
    ["gehrman", "Der alte Mann in der Werkstatt im Traum, freundlich und müde. Er sprach meist zum Feuer hin, und seine Pausen kamen, wo keiner sie erwartet."],
    ["", "Ein alter Mann im Rollstuhl am Weg im Garten. Sterben könne ich dort nicht, sagte er, nur aufwachen."],
  ] },
  { name: "Die Puppe", wenn: "puppe_wach", stufen: [
    ["staerke>=1", "Sie legte mir die Hand auf die Brust, und was aus mir in ihre Finger zog, kam schwerer zurück."],
    ["puppe_daheim || k1_d_traum", "Sie sprach sanft und atmete nicht. Den Traum nannte sie daheim."],
    ["puppe_gespraech.frage", "Sie sprach sanft und atmete nicht. Sie wollte wissen, wie es draußen riecht."],
    ["", "Sie sprach sanft, und zwischen den Sätzen atmete sie nicht."],
  ] },
];

// Fragen der Nacht: offene Fragen, nur wenn das Zugehörige erlebt wurde.
window.FRAGEN = [
  ["", "Was ist das bleiche Blut, das ich suchen soll?"],
  ["", "Wer war der alte Mann in der Klinik, und was habe ich unterschrieben?"],
  ["tode>=2", "Warum sterbe ich nicht?"],
  ["altar_blatt", "Wo hat die Seuche ihre Quelle?"],
  ["k1_d_rueckweg", "Warum sinkt die Sonne nicht?"],
  ["kleriker!=", "Warum werden ausgerechnet Kirchenleute zu Bestien?"],
  ["k1_c_graeber || k1_n2_gascoigne", "Wer oder was ist Oedon?"],
  ["gascoigne_tot", "Wer hat Viola getötet?"],
  ["grund==suche", "Wo ist der Mensch, den ich suche? Wo riecht es nach Weihrauch?"],
  ["gehrman_versprochen", "Wem hat Gehrman etwas versprochen?"],
  ["k1_b_eileen", "Woher kennt Eileen den Garten?"],
];
