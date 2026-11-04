// Notizbuch des Jägers: Einträge zu den Lore-Tags der Geschichte (# lore: id).
// Geschrieben in der Stimme des Jägers; Kanon sinngemäß, Offenes bleibt offen.
// Jeder Eintrag hat Stufen: [Bedingung, Text]. Gezeigt werden alle Stufen, deren Bedingung im Spielstand gilt,
// damit das Notizbuch nur weiß, was der Spieler auf seinem Weg erlebt hat (CLAUDE.md: nichts vorwegnehmen).
// Bedingungen: "" (immer), "var", "!var", "var>=2", "var==wert", mehrere mit "&&". Die letzte Stufe mit
// "einsicht>=…" ist die Stufe „Was ich ahne“.
window.NOTIZBUCH = {
  bluttransfusion: { titel: "Die Bluttransfusion", stufen: [
    ["", "In Yharnam heilt man mit Blut. Man unterschreibt, man legt sich hin, man empfängt. Es heilt, sagen sie. Was es sonst noch tut, sagt niemand."],
    ["gilbert_geschenk || k1_b_gilbert", "Gilbert hat es auch bekommen. Es hat ihm Zeit gekauft, sagt er, und nichts als Zeit."],
  ] },
  paleblood: { titel: "Bleiches Blut", stufen: [
    ["", "Der alte Mann in der Klinik hat es zu mir gesagt, als lese er es von meiner Stirn ab. Auf einem Zettel an der Klinikwand stand, ich solle es suchen, um die Jagd zu überwinden."],
    ["haltung_vertrag==wach", "In meinem Vertrag stand es auch, in der Zeile für den Grund meiner Reise. Die Schrift sah aus wie meine."],
    ["gilbert_bruecke", "Gilbert kennt das Wort nicht. Wenn es einer weiß, meint er, dann die Kirche."],
  ] },
  jaegertraum: { titel: "Der Jägertraum", stufen: [
    ["", "Ein Garten mit weißen Blumen unter einem Himmel ohne Sonne, ein Haus auf einem Hügel. Jeder Weg führt zurück zum Grabstein ohne Namen."],
    ["tode>=2", "Hierhin kehre ich zurück, wenn ich sterbe. Ich sterbe nicht. Ich erwache. Der Einstich in meinem Arm ist danach jedes Mal frisch."],
    ["tode>=3", "Die Tinte von der Unterschrift ist noch an meinen Fingern. Ich bin gestorben, und sie ist noch da."],
    ["einsicht>=2", "Was ich ahne: Man kommt nicht hierher, um sich auszuruhen. Man wird hier aufbewahrt."],
  ] },
  puppe: { titel: "Die Puppe", stufen: [
    ["!puppe_wach", "Eine Puppe in Menschengröße am Fuß einer Treppe im Traum, mit offenen Augen, die nichts sehen. Etwas an ihr wirkt, als warte sie."],
    ["puppe_wach", "Sie hat sich bewegt. Sie spricht, sanft und klar, und atmet zwischen den Sätzen nicht. Sie sagt, sie solle für mich sorgen. Ihre Stimme habe ich schon einmal gehört, in der Klinik, als das fremde Blut in mich lief."],
    ["k1_d_traum", "Sie nennt den Traum daheim. Ich habe ihr nicht widersprochen."],
  ] },
  boten: { titel: "Die Boten", stufen: [
    ["", "Kleine graue Wesen mit Gesichtern aus nassem Ton. Ich habe sie zuerst in meinem Fiebertraum in der Klinik gesehen. Im Garten kamen sie aus der Erde, als hätten sie auf mich gewartet."],
    ["traum_hub", "Wo eine Laterne brennt, kriechen sie aus dem Boden. Im Traum verkaufen sie mir Dinge für die Echos, die aus den Bestien aufsteigen."],
    ["puppe_wach", "Die Puppe nennt sie die Kleinen. Sie finden Jäger, sagt sie. Mich haben sie gefunden."],
  ] },
  laternen: { titel: "Die Laternen", stufen: [
    ["", "Wo ich eine Laterne entzünde, führt ein Weg zurück in den Traum und vom Traum zurück zu ihr. An einer Laterne kann ich nicht verloren gehen. Davonlaufen kann ich auch nicht."],
  ] },
  jagdnacht: { titel: "Die Jagdnacht", stufen: [
    ["", "In manchen Nächten jagt Yharnam. Die Bürger verriegeln die Türen, hängen Räucherwerk vor die Fenster, und die Jäger gehen hinaus."],
    ["k1_b_gilbert", "Was sie jagen, sagt Gilbert, haben sie gestern oft noch gegrüßt."],
    ["k1_d_rueckweg", "Die Sonne hängt seit Stunden über den Dächern und geht nicht unter. Die Nacht der Jagd hat noch nicht einmal angefangen."],
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
    ["k1_b_gilbert", "Gilbert hinter seinem Fenster ist einer von uns. Er hört es am Schritt."],
  ] },
  heilende_kirche: { titel: "Die Heilende Kirche", stufen: [
    ["", "Sie verwaltet das Blut in Yharnam, jede Transfusion. Ihr Blut, heißt es, kommt aus der großen Kathedrale über der Stadt."],
    ["k1_hub_c", "Das Tor zum Kathedralenbezirk ist verschlossen, mit Ketten so dick wie mein Arm."],
    ["k1_b_tueren", "Hinter einer Tür betet eine Frau, die Kirche habe ihnen das Räucherwerk gesegnet. Andere sagen, die Kirche lasse die Fremden mit ihrem Blut herein."],
  ] },
  bestienseuche: { titel: "Die Seuche", stufen: [
    ["", "Menschen werden zu Bestien. Niemand weiß, wen es als Nächstes trifft."],
    ["k1_c_kanal", "Unter der Stadt liegen die, die es getroffen hat, in Becken gestapelt. An einem Handgelenk hing noch ein Krankenhausband."],
  ] },
  kleriker_bestien: { titel: "Kleriker-Bestien", stufen: [
    ["", "Man sagt, aus den Kirchenleuten werden die schlimmsten Bestien, ausgerechnet aus denen, die beten und singen. Warum gerade sie, sagt niemand."],
    ["kleriker==besiegt", "Die Bestie auf der Brücke trug einen Priesterkragen und das Abzeichen der Kirchenjäger. Unter dem Fell hatte sie Narben von Nadeln, Reihe um Reihe."],
    ["gedaechtnis_kleriker && einsicht>=2", "Was ich ahne: Wer am meisten von ihrem heiligen Blut bekommt, dem geschieht es zuerst. Beweisen kann ich es nicht."],
  ] },
  blutgedaechtnis: { titel: "Das Gedächtnis des Blutes", stufen: [
    ["gedaechtnis_kleriker", "Ich habe durch fremde Augen gesehen, als ich das Blut der Bestie berührte: eine Kathedrale, einen Kragen, eine Stimme, die mitten im Lied kippt."],
    ["gehrman", "Gehrman sagt, man erzähle sich, das Blut erinnere sich. Er habe es nie wissen wollen."],
  ] },
  blutrausch: { titel: "Wie Jäger kippen", stufen: [
    ["", "Jäger, die zu tief ins Blut geraten, finden nicht mehr zurück. Man riecht es an ihnen."],
    ["eileen_stufe>=2", "Eileen hat ein Abzeichen von ihrer Schnur gezeigt: Der hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher."],
    ["gascoigne2", "Einer vergaß meinen Namen und fand ihn einen Atemzug zu spät wieder."],
  ] },
  jaeger_der_jaeger: { titel: "Die Jägerin der Jäger", stufen: [
    ["", "Eine Frau mit Federmantel und Schnabelmaske. An einer Schnur um ihren Hals klappern die Abzeichen von Jägern, die nicht mehr wussten, was sie jagen. Sie bringt sie heim, sagt sie."],
    ["eileen_name", "Sie heißt Eileen. Sie hat mir ein Stück Dörrfleisch gegeben und nach meinem Namen gefragt."],
  ] },
  parade: { titel: "Die Parade", stufen: [
    ["", "Mit der Feuerwaffe tötet man nicht. Man wartet, bis die Bestie ausholt und ihr ganzes Gewicht in den Schlag legt, und genau dann schießt man. Dann wankt sie."],
    ["parade_quelle==gascoigne", "Gascoigne hat es mir auf dem Platz gezeigt, mit dem Feuer im Rücken. Nicht davor, nicht danach."],
    ["parade_quelle==gehrman", "Gehrman hat es mir erklärt, und für einen Augenblick war er dabei nicht alt."],
  ] },
  gascoigne: { titel: "Pater Gascoigne", stufen: [
    ["", "Ein großer Mann mit verbundenen Augen und einem Priesterschal, eine Axt in der einen Hand, eine Donnerbüchse in der anderen. Er spricht mit einem fremden Rollen in der Stimme."],
    ["q_frau==1", "Am Scheiterhaufen hat er die Bürger beim Namen nach Hause geschickt. Er gab mir Branntwein, der nach Birne schmeckte, und bat mich, seiner Frau auszurichten, er komme bald."],
    ["gascoigne2", "Zwischen den Gräbern hat er in frischer Erde gewühlt und gelacht."],
    ["gascoigne_tot", "Ich habe ihn am Grab des Oedon getötet. Seine Kappe liegt noch dort."],
  ] },
  familie_gascoigne: { titel: "Das Mädchen am Brunnenplatz", stufen: [
    ["", "Ein Mädchen wartet hinter einem Fenster am Brunnenplatz auf Vater und Mutter. Die Mutter trägt eine große rote Brosche. Am Fensterriegel hängt ein rotes Band, damit sie den Weg findet."],
    ["spieluhr", "Im Deckel ihrer Spieluhr stehen zwei Namen: Viola. Gascoigne. Das V macht einen kleinen Kringel."],
    ["gascoigne_tot", "Auf einem Dach über dem Grab lag eine Frau mit der roten Brosche. Viola. Wer sie getötet hat, weiß ich nicht."],
  ] },
  spieluhr: { titel: "Die Spieluhr", stufen: [
    ["", "Papas Lied, sagt das Mädchen. Wenn Papa sie nicht mehr kennt, spielen sie es ihm, und dann kennt er sie wieder."],
    ["spieluhr_mal>=1", "Am Grab hat das Lied ihn festgehalten. Beim dritten Mal hat es ihn zerrissen."],
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
    ["", "Ein alter Mann im Rollstuhl im Traum, mit einem breitkrempigen Hut und einer Decke über den Knien. Er war einmal Jäger, lange bevor die Kirche welche hatte."],
    ["gehrman>=2", "Wenn man ihn fragt, wann die Nacht vorbei ist, sieht er auf die Decke über seinen Knien. Seine Hände halten die Lehnen fest."],
  ] },
};
