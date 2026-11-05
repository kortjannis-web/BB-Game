// Notizbuch des Jägers: Einträge zu den Lore-Tags der Geschichte (# lore: id).
// Geschrieben in der Stimme des Jägers; Kanon sinngemäß, Offenes bleibt offen.
// Jeder Eintrag hat Stufen: [Bedingung, Text]. Gezeigt werden alle Stufen, deren Bedingung im Spielstand gilt,
// damit das Notizbuch nur weiß, was der Spieler auf seinem Weg erlebt hat (CLAUDE.md: nichts vorwegnehmen).
// Bedingungen: "" (immer), "var", "!var", "var>=2", "var==wert", mehrere mit "&&". Die letzte Stufe mit
// "einsicht>=…" ist die Stufe „Was ich ahne“.
// Jede Stufe hängt an dem, was der Spieler wirklich gesehen oder gehört hat (Faktencheck 2026-11-05), nicht am bloßen
// Besuch eines Knotens, in dem es nur einer von mehreren Wegen zeigt.
// Unbekannte Namen zählen als Knotenbesuch und ergeben 0: Eine Stufe mit einem Merker, den die Ink-Dateien (noch) nicht
// setzen, bleibt verborgen. Erwartete Merker aus anderen Dateien: gilbert_jagd (Gilbert, Thema verriegelte Türen),
// gilbert_kleriker (Gilbert, Weg zur Kathedrale, Zweig mit dem Gerücht), frau_betet (Türen, die Betende).
window.NOTIZBUCH = {
  bluttransfusion: { titel: "Die Bluttransfusion", stufen: [
    ["", "In Yharnam heilt man mit Blut. Man unterschreibt, und dann empfängt man. Es heilt, sagen sie. Was es sonst noch tut, sagt niemand."],
    ["gilbert_geschenk", "Gilbert hat es auch bekommen. Es hat ihm Aufschub gekauft, sagt er, nur Aufschub."],
  ] },
  paleblood: { titel: "Bleiches Blut", stufen: [
    ["", "Der alte Mann in der Klinik hat es zu mir gesagt, als lese er es von meiner Stirn ab."],
    ["k1_erwachen", "Auf einem Zettel an der Klinikwand stand, ich solle es suchen, um die Jagd zu überwinden."],
    ["haltung_vertrag==wach", "In meinem Vertrag stand es auch, in der Zeile für den Grund meiner Reise. Die Schrift sah aus wie meine."],
    ["gilbert_bruecke", "Gilbert kennt das Wort nicht. Wenn es einer weiß, meint er, dann die Kirche."],
  ] },
  jaegertraum: { titel: "Der Jägertraum", stufen: [
    ["", "Ein Garten mit weißen Blumen unter einem Himmel ohne Sonne, ein Haus auf einem Hügel. Jeder Weg führt zurück zum Grabstein ohne Namen."],
    ["tode>=2", "Hierhin kehre ich zurück, wenn ich sterbe. Ich sterbe nicht. Ich erwache. Der Einstich in meinem Arm ist danach jedes Mal frisch."],
    ["tode>=3", "Die Tinte von der Unterschrift ist noch an meinen Fingern. Ich bin gestorben, und sie ist noch da."],
    ["puppe_gespraech>=3", "Für jeden Grabstein im Garten ist einmal einer gekommen wie ich, sagt die Puppe. Es ist so lange her, dass sie die Gesichter verwechselt."],
    ["einsicht>=2", "Was ich ahne: Man kommt nicht hierher, um sich auszuruhen. Man wird hier aufbewahrt."],
  ] },
  ende_der_nacht: { titel: "Das Blatt am Altar", stufen: [
    ["", "Im Haus auf dem Hügel, auf einem Altar im hinteren Raum, liegt ein Blatt in einer alten, eiligen Hand: Aus diesem Traum kommt nur hinaus, wer der Seuche ihre Quelle verschließt. Bleibt die Quelle offen, bleibt die Nacht. Kein Name darunter."],
    ["gehrman_nacht", "Gehrman sagt, hinaus komme man, wenn die Nacht vorbei ist. So habe man es ihm gesagt."],
    ["gehrman_wann", "Als ich fragte, wann sie vorbei ist, hat er ein Werkzeug geputzt, das schon sauber war."],
  ] },
  puppe: { titel: "Die Puppe", stufen: [
    ["!puppe_wach", "Eine Puppe in Menschengröße am Fuß einer Treppe im Traum, mit offenen Augen, die nichts sehen. Etwas an ihr wirkt, als warte sie."],
    ["puppe_wach", "Sie hat sich bewegt. Sie spricht, sanft und klar, und atmet zwischen den Sätzen nicht. Sie sagt, sie solle auf mich achtgeben. Ihre Stimme kommt mir bekannt vor. Ich weiß nicht mehr, woher."],
    ["puppe_daheim || k1_d_traum", "Sie nennt den Traum daheim. Ich habe ihr nicht widersprochen."],
  ] },
  boten: { titel: "Die Boten", stufen: [
    ["", "Kleine graue Wesen mit Gesichtern aus nassem Ton. Ich habe sie zuerst in meinem Fiebertraum in der Klinik gesehen. Im Garten kamen sie aus der Erde, als hätten sie auf mich gewartet."],
    ["k1_laterne_zentral", "Wo eine Laterne brennt, kriechen sie aus dem Boden."],
    ["boten_laden", "Im Traum hocken sie in einem steinernen Becken und verkaufen mir Dinge für die Echos, die aus den Bestien aufsteigen."],
    ["brief_gezeigt", "Für das silberne Abzeichen von der Brücke haben sie etwas aus dem Wasser geholt, das sie mir vorher nicht gezeigt hatten."],
    ["puppe_gespraech", "Die Puppe nennt sie die Kleinen. Sie graben nach Leuten wie mir, sagt sie. Mich haben sie ausgegraben."],
  ] },
  laternen: { titel: "Die Laternen", stufen: [
    ["", "Wo ich eine Laterne entzünde, führt ein Weg zurück in den Traum und vom Traum zurück zu ihr. An einer Laterne kann ich nicht verloren gehen. Davonlaufen kann ich auch nicht."],
  ] },
  jagdnacht: { titel: "Die Jagdnacht", stufen: [
    ["", "In manchen Nächten jagt Yharnam. Die Bürger verriegeln die Türen, hängen Räucherwerk vor die Fenster, und die Jäger gehen hinaus."],
    ["gilbert_jagd", "Was sie jagen, sagt Gilbert, haben sie gestern oft noch gegrüßt."],
    ["k1_d_rueckweg", "Die Sonne hängt seit Stunden über den Dächern. Ich habe gewartet, dass sie sinkt. Sie sank nicht. Die Nacht der Jagd hat noch nicht einmal angefangen."],
  ] },
  raeucherwerk: { titel: "Räucherwerk", stufen: [
    ["", "Rote Lampen vor den Fenstern, süßer, schwerer Rauch. Er soll die Bestien fernhalten. An der Zahl der Lampen sieht man, wie groß die Angst in einem Haus ist."],
  ] },
  buergerjagd: { titel: "Die Jagd der Bürger", stufen: [
    ["", "Nicht nur Jäger jagen. Die Bürger selbst gehen mit Fackeln und Mistgabeln hinaus und verbrennen auf dem Scheiterhaufen, was sie für eine Bestie halten. Fremde halten sie fast immer dafür."],
    ["mob_verbrannt", "Eine von ihnen hieß Martha. Sie hat einem Jäger manchmal Brot gegeben."],
  ] },
  fremde: { titel: "Fremde", stufen: [
    ["", "Yharnam hasst Fremde. Man sagt, wir hätten die Seuche gebracht."],
    ["k1_b_gilbert", "Gilbert hinter seinem Fenster ist einer von uns. Er riecht es an mir, Regen und Landstraße."],
  ] },
  heilende_kirche: { titel: "Die Heilende Kirche", stufen: [
    ["", "Sie verwaltet das Blut in Yharnam, jede Behandlung, jede Ampulle."],
    ["gilbert_bruecke", "Ihr Blut, sagt Gilbert, kommt aus der großen Kathedrale über der Stadt, so wie Wasser aus einer Quelle."],
    ["k1_hub_c", "Das Tor zum Kathedralenbezirk ist verschlossen, mit Ketten so dick wie mein Arm."],
    ["frau_betet", "Hinter einer Tür betet eine Frau, die Kirche habe ihnen das Räucherwerk gesegnet."],
    ["alte_frau", "Eine alte Frau hinter ihrer Tür sagt, die Kirche lasse die Fremden mit ihrem Blut herein."],
    ["k1_b_anschlag", "An einer Kapellentür ein Anschlag: Wer Fieber hat oder Durst, den kein Wasser stillt, solle zur nächsten Stelle des Blutes gehen. Darunter in Kreide: Mein Bruder ist gegangen. Er hatte keinen Durst. Das Papier roch nach Weihrauch."],
    ["kirchenbrief", "Ein Kirchendiener schreibt seiner Schwester von einer Kapelle oben im Bezirk, die jeden aufnimmt, der noch sprechen kann, und von einer Vikarin, die am längsten betet. Seinen letzten Satz hat er ausgestrichen. Lesbar sind nur zwei Wörter: Komm nicht."],
  ] },
  bestienseuche: { titel: "Die Seuche", stufen: [
    ["", "Menschen werden zu Bestien. Niemand weiß, wen es als Nächstes trifft."],
    ["k1_c_kanal", "Unter der Stadt liegen die, die es getroffen hat, in Becken gestapelt. An einem Handgelenk hing noch ein Krankenhausband."],
  ] },
  kleriker_bestien: { titel: "Kleriker-Bestien", stufen: [
    ["gilbert_kleriker", "Man sagt, aus den Kirchenleuten werden die schlimmsten Bestien, ausgerechnet aus denen, die beten und singen. Warum gerade sie, sagt niemand."],
    ["k1_n1_kleriker", "Auf der großen Brücke haust eine Bestie, größer als ein Haus, mit einem verknoteten Geweih und einem Arm, doppelt so lang wie der andere."],
    ["kleriker==besiegt", "Im Fell der Bestie steckte das Abzeichen der Kirchenjäger, ein silbernes Schwert, dazu ein weißer Fetzen, Kragen oder Verband. Unter dem Fell hatte sie Narben von Nadeln, Reihe um Reihe."],
    ["gedaechtnis_kleriker && einsicht>=2", "Was ich ahne: Wer am meisten von ihrem heiligen Blut bekommt, dem geschieht es zuerst. Beweisen kann ich es nicht."],
  ] },
  blutgedaechtnis: { titel: "Das Gedächtnis des Blutes", stufen: [
    ["gedaechtnis_kleriker", "Ich habe durch fremde Augen gesehen, als ich das Blut der Bestie berührte: eine Kathedrale, einen Kragen, eine Stimme, die mitten im Lied kippt."],
    ["gehrman_blut", "Gehrman sagt, man erzähle sich, das Blut erinnere sich. Er habe es nie wissen wollen."],
  ] },
  blutrausch: { titel: "Wie Jäger kippen", stufen: [
    ["", "Jäger, die zu tief ins Blut geraten, finden nicht mehr zurück. Man riecht es an ihnen."],
    ["eileen_stufe>=2 && eileen>=0", "Die Frau im Federmantel hat ein Abzeichen von ihrer Schnur gezeigt: Der hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher."],
    ["gascoigne2 && gascoigne_name", "Einer vergaß meinen Namen und fand ihn einen Atemzug zu spät wieder."],
    ["gascoigne2 && !gascoigne_name", "Einer kniete zwischen den Gräbern, wühlte in frischer Erde und lachte über etwas, das ich nicht sah."],
  ] },
  jaeger_der_jaeger: { titel: "Die Jägerin der Jäger", stufen: [
    ["", "Eine Frau mit Federmantel und Schnabelmaske. An einer Schnur um ihren Hals klappern Abzeichen, Messing, Silber, Eisen, jedes abgegriffen."],
    ["eileen_genannt", "Sie heißt Eileen. Die Abzeichen an ihrer Schnur gehörten Jägern."],
    ["k1_b_eileen", "Sie hat mir zwei Marken aus Messing zugeworfen. Wer eine zerdrückt, wacht im Garten auf, ohne vorher zu sterben."],
    ["marke_benutzt", "Ich habe eine zerdrückt. Ich bin im Garten erwacht, und was ich an Echos bei mir trug, war fort. Kein Fleck, nirgends."],
    ["eileen_name", "Sie hat mir ein Stück Dörrfleisch gegeben und nach meinem Namen gefragt."],
  ] },
  parade: { titel: "Die Parade", stufen: [
    ["", "Mit der Feuerwaffe tötet man nicht. Man wartet, bis die Bestie ausholt und ihr ganzes Gewicht in den Schlag legt, und genau dann schießt man. Dann wankt sie."],
    ["parade_quelle==gascoigne", "Gascoigne hat es mir auf dem Platz gezeigt, mit dem Feuer im Rücken. Nicht davor, nicht danach."],
    ["parade_quelle==gehrman", "Gehrman hat es mir erklärt, und für einen Augenblick klang er dabei wie einer, der auf Übungsplätzen ruft."],
  ] },
  gascoigne: { titel: "Der Pater mit dem Verband", stufen: [
    ["", "Ein großer Mann mit verbundenen Augen und einem Priesterschal, eine Axt in der Hand."],
    ["q_frau==1 || gascoigne2", "Er heißt Gascoigne."],
    ["q_frau==1 && mob!=zerstreut", "Am Scheiterhaufen trug er dazu eine Donnerbüchse und hat die Bürger beim Namen nach Hause geschickt, mit einem Rollen in der Stimme, das nicht aus diesen Gassen stammt."],
    ["q_frau==1", "Er bat mich, einer Frau mit einer großen roten Brosche auszurichten, er komme bald."],
    ["gascoigne2", "Zwischen den Gräbern hat er in frischer Erde gewühlt und gelacht."],
    ["gascoigne_tot", "Ich habe ihn am Grab des Oedon getötet. Sein Hut liegt noch dort, auf einem Grabstein."],
  ] },
  familie_gascoigne: { titel: "Das Fenster am Brunnenplatz", stufen: [
    ["maedchen_gesehen", "Ein Mädchen wartet hinter einem Fenster am Brunnenplatz auf Vater und Mutter. Am Fensterriegel hängt eine weiße Schleife, damit die Mutter das Fenster findet."],
    ["spieluhr", "Im Deckel ihrer Spieluhr stehen zwei Namen: Viola. Gascoigne. Das V macht einen kleinen Kringel."],
    ["frau_betet", "Hinter einer Tür in der Gasse mit den Räucherlampen sagte eine Betende, eine Dame mit einer großen roten Brosche habe nach dem Weg zu den Gräbern gefragt. Sie hat ihr nicht aufgemacht."],
    ["gascoigne_tot", "Auf einem Dach über dem Grab lag eine Frau mit der roten Brosche. Viola. Wer sie getötet hat, weiß ich nicht."],
  ] },
  spieluhr: { titel: "Die Spieluhr", stufen: [
    ["", "Die Spieluhr ist von Papa, sagt das Mädchen. Wenn er fremd wird, zieht sie sie auf, und hinterher ist er wieder Papa."],
    ["spieluhr_mal>=1", "Am Grab hat das Lied ihn festgehalten."],
    ["spieluhr_mal>=3", "Beim dritten Mal hat es ihn zerrissen."],
  ] },
  oedon: { titel: "Oedon", stufen: [
    ["", "Ein Name über einem Friedhof, ohne Vornamen, ohne Jahreszahl, ohne Gebet. Wer oder was Oedon ist, weiß ich nicht."],
    ["einsicht>=1 && k1_c_graeber", "Als ich den Namen aussprach, kam ein Druck hinter den Ohren, wie vor einem Gewitter, das nicht vom Himmel kommt."],
  ] },
  einsicht: { titel: "Einsicht", stufen: [
    ["", "Auf der Brücke hat sich etwas hinter meiner Stirn geöffnet, ein Spalt wie unter einer Tür. Seitdem sehe ich Dinge, die vorher nicht da waren, oder die da waren und die ich nicht sah. Ich weiß nicht, ob man so einen Spalt wieder schließen kann."],
    ["einsicht>=3", "Am Grab des Oedon lag sein Schatten falsch, dem Licht entgegen. Ich habe es niemandem erzählt."],
  ] },
  gehrman: { titel: "Gehrman", stufen: [
    ["", "Ein alter Mann im Rollstuhl im Traum, mit einem breitkrempigen Hut und einer Decke über den Knien."],
    ["gehrman_jaeger", "Er war selbst einmal Jäger, als es noch wenige gab. Ein paar hat er an seiner Werkbank angelernt."],
    ["gehrman_wann", "Wenn man ihn fragt, wann die Nacht vorbei ist, sieht er auf die Decke über seinen Knien."],
    ["gehrman_versprochen", "Er hat einem Freund etwas versprochen. Er weiß noch, dass er es versprochen hat."],
  ] },
  // Erwarteter Lore-Tag aus b_yharnam.ink (Faktencheck b_yharnam Nr. 6): der Zettel im dunklen Haus. Ohne den Tag bleibt der Eintrag unsichtbar.
  kirche_sperrt_bruecke: { titel: "Der Zettel im dunklen Haus", stufen: [
    ["", "Im dunklen Haus neben der Laterne, im ersten Stock, neben einem Rollstuhl mit einer Gestalt, die durch den offenen Mund atmet und lacht, lag ein Zettel. Ein Bürger hat geschrieben, die Kirche habe die große Brücke gesperrt, als die Jagd begann, und die Leute sich selbst überlassen, während unten im Tal, wo die Stadt früher war, alles brannte."],
    ["k1_n1_kleriker.uebergang", "Am Ende der Brücke steht ein Tor zur Kathedrale hin, von drüben verriegelt."],
  ] },
};

// Personen: wie sie zu dir stehen, nur in Worten. "wenn": ob die Person überhaupt im Notizbuch steht;
// "stufen": die erste Stufe, deren Bedingung gilt, wird gezeigt.
window.PERSONEN = [
  { name: "Gilbert", wenn: "k1_b_gilbert", stufen: [
    ["versprechen_gilbert", "Ich habe ihm versprochen, ihn zu holen, wenn es bei ihm so weit ist."],
    ["gilbert>=2", "Er sammelt Namen hinter seinem Gitter. Meinen hat er behalten."],
    ["gilbert>=0", "Ein Fremder wie ich, krank, höflich. Er hört, wer vorbeigeht."],
    ["", "Ich habe ihn angefahren. Er hustet, wenn ich vorbeigehe, und sieht nicht auf."],
  ] },
  { name: "Gascoigne", wenn: "q_frau==1 || gascoigne2", stufen: [
    ["gascoigne_tot", "Tot. Am Grab des Oedon. Sein Hut liegt noch auf dem Grabstein."],
    ["gascoigne>=3 && q_frau==1", "Ein Freund, glaube ich. Er hat mir Branntwein gegeben, der nach Torf und Rauch schmeckt, nach einem Land, das nicht dieses ist."],
    ["gascoigne>=1 && q_frau==1", "Er hat mir gezeigt, wie man wartet. Unter Teer und Branntwein riecht er nach nassem Fell."],
    ["gascoigne2 && q_frau==0", "Ein Pater, der zwischen den Gräbern in frischer Erde wühlt. Er musste sich seinen eigenen Namen vorsagen."],
    ["", "Er traut mir nicht. Vielleicht hat er recht."],
  ] },
  { name: "Viola", wenn: "gascoigne_tot", stufen: [
    ["gruss_ausgerichtet", "Seine Frau. Tot auf einem Dach. Ich habe ihr seinen Gruß noch ausgerichtet."],
    ["", "Seine Frau. Tot auf einem Dach, die rote Brosche über dem Herzen."],
  ] },
  { name: "Das Mädchen", wenn: "maedchen_gesehen || k1_b_maedchen", stufen: [
    ["maedchen_tot", "Tot. Im Maul eines Schweins hing ihr Band, rot und schwer. Am Riegel war es weiß."],
    ["maedchen_wo==fort", "Sie ist losgelaufen. Ich weiß nicht, wohin."],
    ["q_mutter==4", "Sie wartet. Ich habe ihr gesagt, ihre Mutter komme bald."],
    ["maedchen>=1", "Sie wartet hinter dem Fenster am Brunnenplatz. Sie kann gut warten, sagt sie."],
    ["", "Sie wartet hinter dem Fenster am Brunnenplatz, die weiße Schleife am Riegel."],
  ] },
  { name: "Die Frau im Federmantel", wenn: "eileen_stufe>=1", stufen: [
    ["eileen_genannt && eileen_partner", "Eileen. Sie erwartet mich vor der Kapelle im Kathedralenbezirk."],
    ["eileen_partner", "Sie erwartet mich vor der Kapelle im Kathedralenbezirk."],
    ["gascoigne_gewarnt", "Sie hat mir den Rücken zugekehrt."],
    ["eileen>=2", "Sie hat mich neben sich sitzen lassen."],
    ["eileen>=0", "Sie beobachtet mich. Ich weiß nicht, wie lange schon."],
    ["", "Sie hält mich für jemanden, der nicht weiß, wann man den Mund hält."],
  ] },
  { name: "Iosefka", wenn: "k1_iosefka", stufen: [
    ["iosefka>0", "Eine Ärztin hinter einer verriegelten Tür. Sie hat sich notiert, dass ich höflich war. Ich würde ihre Stimme wiedererkennen."],
    ["", "Eine Ärztin hinter einer verriegelten Tür. Sie hat sich notiert, dass ich gegen ihre Tür geschlagen habe."],
  ] },
  { name: "Gehrman", wenn: "gehrman || gehrman_gesehen", stufen: [
    ["gehrman_bestien", "Der alte Mann in der Werkstatt im Traum. Freundlich. Als ich nach den Bestien fragte, hielten seine Hände die Lehnen zu fest."],
    ["gehrman", "Der alte Mann in der Werkstatt im Traum. Freundlich und müde, und er macht Pausen, wo man keine erwartet."],
    ["", "Ein alter Mann im Rollstuhl am Weg im Traum. Sterben könne ich hier nicht, sagt er, nur aufwachen."],
  ] },
  { name: "Die Puppe", wenn: "puppe_wach", stufen: [
    ["staerke>=1", "Sie hat mir eine Hand auf die Brust gelegt, und was aus mir in ihre Finger floss, kam verwandelt zurück."],
    ["puppe_daheim || k1_d_traum", "Sie spricht sanft und atmet nicht. Sie nennt den Traum daheim."],
    ["puppe_gespraech.frage", "Sie spricht sanft und atmet nicht. Sie wollte wissen, wie es draußen riecht."],
    ["", "Sie spricht sanft und atmet nicht zwischen den Sätzen."],
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
