// NACHBILD: der Tod als kurzer Rückblick im Traum (Entscheidung des Nutzers 2026-11-06, Entwurf von Claude).
//   1. Körper: wenige Sätze, wie man im Traumgarten erwacht.
//   2. Innerer Monolog: was der Jäger nach diesem Tod denkt, erinnert, ahnt; je Todesort mehrere Fassungen ({ cycle: }, beim nächsten Tod am selben Ort die nächste),
//      darin Sätze je nach Entscheidung des Spielers; danach höchstens ein bis zwei Zusätze. Körpererinnerung statt Rat: Der Monolog darf auf das richtige Anzeichen
//      zurückdeuten, nie wie eine Anleitung.
//   3. Story-Fragment: Der Jäger setzt etwas zusammen. Es wird freigeschaltet (`fr_frei += …`) und beim nächsten Tod gespielt, immer NACH dem Monolog.
//      Was kein Tod abgerufen hat, kommt in der nächsten festen Traumszene (`traum_fragmente`).
//   4. Zurück an den Anfang des Kampfes oder Moments (`kampfanfang`). Kein Hub, keine Laterne, kein Handel.
// Ausgeschrieben 2026-11-06 (Überarbeitung Kapitel 1, Ü10) mit stil-1800 (Momente erwachen, tod, traum; Musterstellen Kleist, Hoffmann, Büchner, Rilke).
// ENTWURF, Stufe 1: nicht vom Nutzer bestätigt.
// Fragmente sind Deutungen des Jägers, nie Tatsachen des Erzählers (CLAUDE.md: [Deutung] nur als Meinung). Wissenssperre Kapitel 1 beachten.
// Der Jägertraum hat in Kapitel 1 keinen Mond (Ü1): Himmel von der Farbe alten Elfenbeins, ohne Gestirn.
// Der Tod (system.ink) löscht `zuletzt`, ehe das Nachbild beginnt; welches Anzeichen getötet hat, weiß der Monolog nicht. Darum geht jede Fassung eines Ortes
//   einem anderen Anzeichen nach, in der Reihenfolge, in der man dort meist stirbt.

// --- Fragmente --------------------------------------------------------------------
LIST fragmente = fr_blut, fr_menschen, fr_kirche, fr_nacht, fr_ich, fr_kippen
VAR fr_frei = ()       // freigeschaltet
VAR fr_gespielt = ()   // schon abgespielt

=== function fr_frei_machen(f)
~ fr_frei += f

=== function fr_offen()
~ return LIST_COUNT(fr_frei - fr_gespielt) > 0

=== nachbild ===
// TITEL: Nachbild: Tod und Rückkehr
# bild: traum
// [KANON lore:figuren/gehrman] Erster Rat sinngemäß: Hier ist Zuflucht, man gewöhnt sich daran. Wortlaut eigen. Die Geste mit der Decke kehrt in der Werkstatt wieder (traum.ink).
{ tode:
- 2:
    Weiße Blumen, dicht vor deinem Gesicht; an jedem Blütenblatt siehst du die feinen Adern, und sie riechen nach Leinen von der Bleiche. Du warst tot. Du befühlst dir Stirn und Brust, wie man nach einem Sturz die Glieder abzählt, und findest alles, wo es war.
    { gehrman == 0:
        ~ gehrman_gesehen = true
        Am Weg sitzt ein alter Mann im Rollstuhl, eine Decke über den Knien, und sieht dir beim Aufstehen zu, ohne sich zu wundern. „Hier stirbt man nicht“, sagt er. „Hier wacht man auf.“ Er streicht die Decke glatt, an einer Stelle, die schon glatt ist. „Daran gewöhnt man sich. An das meiste.“ # lore: gehrman
    }
- 3:
    Wieder die Blumen, wieder das Gras im Nacken. Diesmal zittern deine Hände nicht einmal mehr. Die braune Tinte an deinen Fingerkuppen ist noch da. Du bist gestorben, und sie ist noch da.
    { puppe_wach:
        ~ puppe_daheim = true
        Die Puppe kniet neben dir im Gras und hält deine Hand, mit Fingern, die kühl sind und sehr glatt und nicht drücken. „Hier geschieht dir nichts“, sagt sie. „Du bist daheim.“
    }
- else:
    {~Die Blumen kennen dich inzwischen. Wo du liegst, sind sie schon niedergedrückt, eine Mulde in deiner Form.|Diesmal erwachst du mitten in einem Wort, das du in der Stadt nicht mehr zu Ende gebracht hast. Hier hört es niemand.|Über dir steht der Himmel des Traumes, alt wie Elfenbein und leer. Deine Augen suchen darin den Mond der Stadt und finden nichts, woran sie sich halten könnten.|Gras im Nacken, Blumen unter den Händen. Du tastest nach der Wunde und findest den Mantel heil und darunter glatte Haut, auf der nichts mehr zu lesen ist.|Neben deinem Kopf hockt ein Bote im Gras, den Kopf schief, und sieht dir zu, so geduldig, wie man an einem Bett wacht, in dem einer schläft, den man nicht wecken darf.}
}
{ neu_gelernt: Noch im Liegen zuckt dein Körper, ein einziges Mal, genau in die Richtung, in die er vorhin hätte zucken sollen. # notiz: gelernt }
{ altar_blatt and not blatt_erinnert:
    ~ blatt_erinnert = true
    Zwischen den Blumen kehrt das Blatt vom Altar zu dir zurück, nicht als Bild, nur als ein Satz, so fest in dich eingedrückt wie die Buchstaben in sein Papier: Bleibt die Quelle offen, bleibt die Nacht. # lore: ende_der_nacht
}
// --- Innerer Monolog ---
// Kurze, klare Sätze (bestätigt 2026-11-06), Stimme B, gedämpft: Erinnerung in Perfekt und Präteritum, Gedanke im Präsens. Je Fassung ein Ding aus der Szene, eine Regung, ein Gedanke.
{ ort:
- "klinik":
    // Anzeichen der Reihe nach: klinik_sprung (Lücke links), Hornknopf (kein Anzeichen, der Mensch darin), klinik_schwer (unter den Armen hindurch).
    { cycle:
    - Es hat sich geduckt, bevor es kam, tief, das ganze Gewicht nach hinten auf die Hinterläufe, bis die Dielen ächzten. Das hast du gesehen und bist trotzdem stehen geblieben, genau dort, wo sein Blick hing. Links, zwischen zwei Liegen, war eine Lücke frei. Hier im Gras siehst du sie deutlicher als vorhin, als sie dich noch hätte retten können.
    - An seiner Brust glänzte ein Hornknopf, und an dem Knopf hingen noch zwei Fäden. Irgendwer hat ihn angenäht, an einem gewöhnlichen Abend, die Nadel zwischen den Lippen, das Licht schräg über dem Tisch. Daran denkst du zuerst. Erst danach kommen die Krallen.
    - Zwei Schritte bist du zurückgewichen, so wie man vor einem Hund zurückweicht, und die Arme haben trotzdem gereicht. Über deiner Brust brennen noch drei Linien, und wenn du hinsiehst, ist die Haut glatt. Unter den erhobenen Armen war Platz für einen Menschen, und du hast ihn leer gelassen.
    }
- "scheiterhaufen":
    // Anzeichen: mobhieb (die enge Gasse hinten), riese_ansturm (die Lücke links am Laternenpfahl); dazu die Menschen im Mob (Volksgrauen, Stufe 1).
    { cycle:
    - Eine Gabel mit drei Zinken, und an der mittleren hing noch ein Halm Stroh. Der Mann dahinter trug eine Schürze, wie man sie im Stall trägt, und seine Hände waren rissig von der Arbeit. Ihr seid euch nie zuvor begegnet. Er hat gerufen, du sollst brennen, und er hat jedes Wort geglaubt.
    - In deinem Rücken lag die Gasse, aus der du gekommen warst; zwei Mann gehen darin nicht nebeneinander. Dort hätten sie nur einzeln zu dir gekonnt, einer nach dem anderen, und die Hinteren hätten den Vorderen im Weg gestanden. Du bist stattdessen vorgegangen, mitten unter sie, als ließe sich eine Menge überreden.
    - Der Riese hat geweint, als er lief. Vorher hat er gegen eine Tür geschlagen und von einer Schwester gemurmelt, der kalt ist, und dann hat er dir die Schuld an allem gegeben, mit der Stimme eines Jungen. Links, beim Laternenpfahl, stand der Kreis nur einen Mann tief. Ein Ellbogen hätte dich dort getroffen, ein Stiefel vielleicht. Kein Ziegel.
    - Als du lagst, haben sie weitergemacht, eine Weile noch, gründlich, so wie man eine Glut austritt, damit sie nicht wieder aufflammt. Gerufen hat dabei keiner mehr. Von allem bleibt dir das am längsten: diese Stille bei der Arbeit.
    }
    // Zusätze wechseln sich ab (der erste Tod hier bringt den ersten, der nächste den zweiten), damit kein Satz bei jedem Tod wiederkehrt.
    { feuer: {&Auf deinem Rücken hing die ganze Zeit Gilberts Tank, schwer und kalt, und deine Hand ist nicht zur Düse gegangen. Vielleicht wollte sie nicht, bei so vielen Gesichtern.|} }
    { herkunft == "gesuchter": {&|Die Frau in der zweiten Reihe hat dich angesehen wie ein Gesicht auf einem Anschlag. Diesen Blick kennst du. Du bist ihm bis in diese Stadt davongefahren.} }
- "haus":
    // Anzeichen: schuss (der Schrank rechts; das Zittern, dann die Ruhe des Laufs).
    // [Deutung, nur als Ahnung, nie aussprechen] Der Rollstuhl gleicht dem des Mannes in der Klinik (RK1 §1): die knarrenden Räder.
    { cycle:
    - Rechts stand ein Schrank, die Tür aus Eiche, dick wie dein Handgelenk. So eine Tür hält eine Kugel auf. Du hast ihn gesehen, gleich beim Hereinkommen, und bist an ihm vorbeigegangen.
    - Sein Lauf hat gezittert, und dann nicht mehr. Erst zittert die Hand, dann liegt sie ruhig wie die eines Uhrmachers über seiner Arbeit. Zwischen beidem lag ein Atemzug, und du hast ihn mit Gehen verbracht, geradeaus, auf ihn zu.
    - Jemand hat ihn die Treppe hinaufgezogen, am Seil, bis das Seil an einer Stelle blank war. Jemand hat ihm die Decke über die Knie gelegt und die Pistole darunter. Wer, weißt du nicht. Die Räder seines Stuhls knarren dir im Ohr nach, und irgendwo hast du solche Räder schon einmal knarren hören.
    }
- "daecher":
    // Anzeichen: schuss (frisches Pulver, der Blick zu den Dächern). Gesehen hat man nur, was vor dem Treffer steht: den Alten hinter dem Schornstein, die zählenden Lippen.
    { cycle:
    - Der Schuss kam von hinten. Du hast in die Gasse gesehen, geradeaus, wie man durch Gassen geht, und nicht hinauf zu den Dächern. Dabei roch es nach Pulver, frisch, so wie es nur riecht, wenn eben erst jemand geladen hat. Gerochen hast du es. Hinaufgesehen hast du nicht.
    - Ein alter Mann hinter einem Schornstein. Beim Nachladen haben seine Hände gezittert, und seine Lippen haben dabei gezählt, so wie Kinder beim Versteckspiel zählen. Was er zählt, kannst du nicht sagen. Bei welcher Zahl er jetzt angekommen ist, willst du nicht wissen.
    - So still war die Gasse: keine Taube, kein Tropfen aus den Rinnen, an der Leine nur die eine hölzerne Klammer. Eine solche Stille hat einen Grund, und du hast ihn nicht gesucht. Er hockte über dir und wartete, bis du an der Stelle warst, auf die sein Lauf die ganze Zeit gezeigt hatte.
    }
- "bruecke":
    // Anzeichen der Reihe nach: kleriker_hieb (unter den Arm), kreischen (die Stille davor), wurf (der Kopf zeigt die Bahn), sprung (Gewicht nach hinten; Parade),
    //   Einsicht (das Zählen), ansturm (bis zuletzt warten), letzter_griff (die kleine Hand).
    //   Nachbesserung 2026-11-06 (L44): Der Zweig „ohne parade“ war tot und ist gelöscht; `parade` steht nach dem Scheiterhaufen auf jedem Weg (b_yharnam, gascoigne_greift_ein, Sammelpunkt nach dem Namen).
    { cycle:
    - Der lange Arm kam von rechts, flach und weiter, als ein Sprung trägt. Fort von ihm wolltest du, so wie man vor einem Feuer zurückweicht. Unter ihm aber, zwischen Ellbogen und Pflaster, blieb ein Spalt, eine Schulter hoch. Im Fallen hast du ihn noch gesehen, und er war breiter, als du gedacht hattest.{ feuer: Und an deinem Rücken hing Gilberts Tank, und ihre schnüffelnde Schnauze war so nah.}
    - Vor dem Schrei wurde es still. Die Kutschen hörten auf zu knarren, der Wind in den Nüstern der toten Pferde schwieg, und nur das Tropfen vom Geweih blieb übrig. Diese Stille hast du für eine Pause gehalten. Sie war das Luftholen.
    - Sie hat die Kutsche gehoben, beinahe andächtig, und ihr Kopf hat dabei die ganze Zeit auf dich gezeigt. Dorthin flog das Holz, genau dorthin. Eine Kutsche hält keine zweite auf; das hast du erst gelernt, als die Splitter kamen.
    - Bevor sie sprang, sackte ihr ganzes Gewicht nach hinten, bis die Läufe darunter zitterten, und ihr Kopf hielt still, genau auf dich. „Nicht davor“, hat Gascoigne am Feuer gesagt. „Nicht danach.“ Du hörst seine Stimme und siehst dich im Gras nach ihm um.
    - Du hast die Gelenke ihres Arms gezählt, zweimal, und zweimal kam eine andere Zahl heraus. Seither zählst du nicht mehr. Nur manchmal, wenn du nicht achtgibst, sind deine Lippen schon bei drei.{ haus_zettel: Über ihre Brücke wachen sie, hat einer auf den Zettel im dunklen Haus geschrieben. Jetzt weißt du, was hier wacht.}
    - Sooft du gewichen bist, hat sie gescharrt und ist nachgerückt. Erst als du das alte Blut in den Gabeln des Horns sehen konntest, hätte sie nicht mehr lenken können. So nah. Ihren Atem hattest du schon auf der Zunge, als du endlich gesprungen bist.{ jagdnotizen: Spät, steht im Heft des Toten neben dem gesenkten Geweih, dreimal unterstrichen.}
    - Zuletzt lag sie still, bis auf die kleine Hand, die sich öffnete und schloss, auf und zu, wie die Hand eines Kindes im Schlaf. Du hast geglaubt, sie träume. Sie hat gewartet, dass sich einer über sie beugt.
    }
- "kanal":
    // Anzeichen: schwein_ansturm (die roten Augen folgen; im letzten Moment), biss (der Rücken, den es nicht erreicht); dazu die Toten im Becken mit der Nummer.
    { cycle:
    - Das Wasser hat deine Knie festgehalten wie Hände, die nicht loslassen wollen. Das Schwein stand im selben Wasser und hat es nicht gespürt. Seine kleinen roten Augen sind dir gefolgt, wohin du auch tratst. Sie haben gewartet, dass du dich zuerst bewegst, und erst dann ist es losgerannt.
    - Sein Kopf kam herum, schnell genug, nach vorn und zur Seite. Über den Nacken aber, wo die Borsten am dichtesten stehen und der Rücken breit aus dem Wasser ragt, reichte er nicht hin. Kein Tier kommt sich selbst zwischen die Schulterblätter. Die Borsten waren eine Armlänge vor dir, schwarz und nass, und du hast nicht zugegriffen.
    - Zwischen den Toten im Becken hat es geschmatzt, schwer und nass, und an der Wand war Platz, glitschig und schmal, eine Schulter breit. Du hättest dich vorbeischieben können. { maedchen_tot: Nach dem Band hast du es nicht mehr gewollt.| Warum du es nicht getan hast, weißt du nicht mehr genau.}
    - Um ein Handgelenk im Becken war ein Streifen Leinen geknotet, darauf eine Nummer in sauberer Tinte. Jemand hat sie gezählt, ehe man sie hier hinunterließ, ordentlich, einen nach dem anderen. Wer die Tinte hält, fragst du dich, und ob er dich schon gezählt hat.
    }
    // Falsche Entscheidung am Brunnenplatz, erkennbar an Iosefkas eigenen Worten (a_ankunft): Sie öffnet niemandem.
    // Nur beim ersten Tod im Kanal (Zahl der Besuche des Kampfes), damit der Vorwurf nicht bei jedem Tod wiederkehrt.
    { maedchen_wo == "fort" and k1_c_kanal.kampf == 1: Lauf zu der Ärztin, hast du ihr gesagt, dort bist du sicher. Die Ärztin öffnet in dieser Nacht niemandem. Durch ihre eigene Tür hat sie es dir gesagt. }
- "grab":
    // Anzeichen der Reihe nach: gascoigne_schuss (der Grabstein links), gascoigne_bogen (die Höhe der Grabsteinköpfe), Lachen und Name (das Kippen),
    //   axt_lang (innen schwingt der Stiel leer), axt_wirbel (von oben, dreimal), die Verwandlung, der Mond über dem Grab (N2: keine Narben, kein Hof; seine Wirkung: das Licht, die Schatten).
    // [ERWEITERT] Der Grabstein „breit genug für zwei“: leise Saat für Viola (d_nachspiel), ohne Deutung und ohne Gedanken dazu (S24).
    { cycle:
    - Den Trichter seiner Büchse hast du von vorn gesehen und dahinter sein Gesicht, so ruhig, wie er auf dem Platz {mob == "zerstreut":neben der Toten gekniet hat|die Leute nach Hause geschickt hat}. Links stand ein Grabstein, breit genug für zwei, und du bist davor stehen geblieben statt dahinter.{ feuerwaffe == "donnerbuechse": Ihr tragt dieselbe Waffe, er und du. Er trägt sie schon länger.}
    - Die Axt kam tief und flach, genau auf der Höhe der Grabsteinköpfe, und seine Schulter hatte sich schon zwei Schritte vorher eingedreht. So dreht sich ein Holzfäller ein, ehe er in den Stamm schlägt. Auf dem Platz hast du ihn nur stehen sehen. Jetzt weißt du, wie er arbeitet.
    - Er hat gelacht, bevor die Axt kam, tief in der Kehle, und dann auch beim Einatmen, nach innen. Am Feuer hat er anders gelacht. Du versuchst, dich an jenes Lachen zu erinnern, und bekommst es nur noch halb zusammen.{ gascoigne_name: Deinen Namen hat er zwischen den Gräbern einen Atemzug zu spät gefunden. Ob er ihn jetzt noch wüsste, fragst du lieber nicht.}
    - Die lange Axt zog einen Kreis, weiter, als seine Arme reichen, und köpfte die Grabsteine, die ihr im Weg standen. Nur innen, dicht an ihm, schwang der Stiel leer. Neben ihm war es sicherer als fern von ihm. Am Feuer war es nicht anders.
    - Hoch über ihm hat die Schneide gezittert, und sein Kopf ist mit dir gewandert, wohin du auch tratst, gleichmäßig wie ein Pendel.{ jagdnotizen: Ein Strich von oben nach unten, drei Kerben, die dritte tiefer: So hat es der Tote in sein Heft gezeichnet, und erst jetzt verstehst du das Bild.| Von oben ist sie gekommen, gerade, mehr als einmal, und jedes Mal tiefer ins Gras.}
    - Zuerst waren es die Hände. Er hat sie vor sich gehalten und angesehen, und dann sind sie gewachsen, Glied um Glied, und jedes Glied hat geknackt, bevor es nachgab. Du hast zugesehen, so wie man {gascoigne >= 2:einem Freund|einem Mann} zusieht, der einem etwas zeigen will. Erst als die Nägel kamen, hast du verstanden, was.
    - Über dem Grab hing der Mond. Sein Licht lag auf euch beiden gleich, auf dem Jäger und auf dem Pater, und eure Schatten rangen schon zwischen den Steinen, ehe ihr es tatet. Der Mond hat sich dabei nicht gerührt, so wenig wie die Leute hinter ihren Läden in der Stadt.
    }
    // [ERWEITERT] Gascoigne summt zwischen den Gräbern den Ton, der der Spieluhr fehlt (c_unterstadt); hier als Erinnerung, nur solange die Uhr in diesem Versuch noch nicht gespielt hat.
    { spieluhr and spieluhr_mal == 0: {&In deiner Tasche liegt die Spieluhr. Einer der zwei Töne, die er zwischen den Gräbern gesummt hat, ist der, der ihr fehlt.||Die Spieluhr in deiner Tasche hat keinen Laut gegeben, die ganze Zeit.} }
    // Höchstens ein Zusatz aus dem, was der Jäger ihm angetan oder verschwiegen hat, das Schwerste zuerst; nur beim ersten Tod am Grab (Zahl der Besuche des Kampfes).
    { k1_n2_gascoigne == 1:
        {
        - gascoigne_verraten: Den Weg zu ihm hast du der Frau im Federmantel gezeigt, mit ausgestrecktem Arm, über die Dächer. Ob sie ihn vor dir gefunden hat, weißt du nicht.
        - mantel_gelogen: Wendel lag nie irgendwo, hat er gesagt, als du ihn wegen des Mantels belogen hast. Den Rücken hat er dir trotzdem zugewandt, nur einen halben Schritt später.
        - band: In deiner Tasche liegt das rote Band aus dem Kanal. Er hat es nicht gerochen, oder er hat es gerochen und nichts gesagt.
        - mob_verbrannt: Er hat Marthas Hand genommen, obwohl sie schwarz war. Daran denkst du, als läge die Hand noch zwischen euch.
        - gascoigne >= 2: Das Warten hat er dir beigebracht, am Feuer. Jetzt wartet er auf dich.
        }
    }
- else:
    // Vor allem die Flucht von der Brücke (ort = "gassen").
    { cycle:
    - Über die Dächer ist sie dir nachgekommen, von First zu First, und wo sie aufsetzte, regneten Ziegel in die Gasse. Du hast geglaubt, wer flieht, sei schneller als das, wovor er flieht. Zuletzt fielen die Ziegel schon vor dir.
    - Du liegst, wo du gelaufen bist, an einer Ecke, deren Namen du nicht kennst. Hinter den Läden ringsum hat man den Fall gehört und die Riegel noch einmal geprüft. Ein Licht hat dort keiner angezündet.
    - Zuletzt hast du gedacht, dass niemand weiß, wo du liegst. Gilbert vielleicht, wenn der Wind ihm den Fall bis an sein Gitter getragen hat. Er hört viel, hinter seinem Gitter.
    }
}
{ ampulle > 0: {&An deinem Gürtel hängt die Ampulle, noch voll. Bis zuletzt hast du sie nicht angerührt.||Die Ampulle am Gürtel ist voll. Mit ihr bist du gestorben wie mit einem Sonntagsrock im Schrank, den man für einen besseren Tag schont.|} }
{ tode >= 6: {&Wie oft noch. Die Frage kommt ohne Schrecken, so beiläufig wie die nach dem Wetter.|Wie oft noch, denkst du, und irgendwo im Garten merkt es sich einer für dich.} }
// --- Story-Fragment, immer als Letztes ---
{ fr_offen():
    -> naechstes_fragment ->
}
{ ampulle == 0: {&Am Gürtel hängt die Ampulle wieder, voll und dunkel.|An deinem Gürtel stößt die Ampulle gegen die Schnalle, und sie ist wieder voll.} }
~ ampulle = 1
~ leben = LEBEN_MAX
{&Dann wird das Gras unter deinen Händen zu Stein, nass und kalt, und der Geruch der Stadt ist vor ihr da, Eisen und Rauch.|Die weißen Blumen werden grau, eine nach der anderen, bis sie nur noch Asche im Rinnstein sind, und um dich ist wieder die Stadt mit ihrem Lärm.|Du schließt die Augen im Garten und öffnest sie in der Stadt, und dazwischen ist kein Weg gewesen, kein Schritt. Nur der Einstich in deiner Armbeuge ist wieder frisch.}
-> kampfanfang

=== naechstes_fragment ===
// Das niedrigste freigeschaltete, noch nicht gespielte Fragment.
~ temp f = LIST_MIN(fr_frei - fr_gespielt)
~ fr_gespielt += f
{
- f ? fr_blut: -> frag_blut ->
- f ? fr_menschen: -> frag_menschen ->
- f ? fr_kirche: -> frag_kirche ->
- f ? fr_ich: -> frag_ich ->
- f ? fr_nacht: -> frag_nacht ->
- f ? fr_kippen: -> frag_kippen ->
}
->->

// In den festen Traumszenen: alles, was kein Tod abgerufen hat, als Gedanken, ehe die Szene beginnt (Traum 2 beim Ankommen, Traum 3 auf den Stufen bei der Puppe).
=== traum_fragmente ===
{ not fr_offen(): ->-> }
Was diese Nacht dir in die Hände gegeben hat, legst du dir zurecht, Stück neben Stück, so wie man Scherben auf einem Tisch ordnet, ehe man weiß, zu welchem Gefäß sie gehören. # stimmung: ruhig
- (schleife)
-> naechstes_fragment ->
{ fr_offen(): -> schleife }
->->

// Die Fragmente: Stimme B, gedämpft, Du-Präsens; jedes steht für sich (sie folgen in den Traumszenen unmittelbar aufeinander).
// Jedes setzt Dinge zusammen, die der Spieler auf seinem Weg gesehen hat; was nur auf manchen Wegen vorkommt, steht in einer Bedingung.

=== frag_blut ===
// Freigeschaltet bei Gilbert (immer).
// [KANON lore:gegenstaende/yharnam-und-blut] Wer Blut empfing, verlangt nach mehr (hier gezeigt an der Ader, die pocht, wenn er an die Ampulle denkt; kein Hunger-Satz, der das Erwachen wiederholt, S9/S55). [KANON lore:figuren/gilbert] Das Blut hat ihm Zeit gekauft (bei uns früher: [ERWEITERT]).
// [ERWEITERT] Die dunkle Ader vom Einstich aus: das Neue, das der Jäger erst im Traum an sich sieht. Gilberts zu weiter Ring (b_yharnam, erste Begegnung, auf jedem Weg): was der Aufschub kostet, als Bild, ohne Fazit (S31, S32).
Im Gras siehst du dir die Armbeuge an. Vom Einstich aus läuft eine Ader zum Ellbogen hinauf, dunkler als die anderen, als hätte jemand sie mit der braunen Tinte nachgezogen, und wenn du an die Ampulle an deinem Gürtel denkst, pocht sie. { gilbert_geschenk: Gilbert hat dasselbe Blut genommen, lange vor dir. Aufschub habe es ihm gekauft, sagt er, nur Aufschub, und dann hat ihm der Husten den Satz abgeschnitten.| Gilbert hustet hinter seinem Gitter, nass und tief, und dein Einstich hat im Takt dieses Hustens gepocht.} An seiner Hand am Gitter ist der Ring zu weit geworden. Zwischen Gold und Haut passt ein Strohhalm, und am Finger hält ihn nur noch der Knöchel. # notiz: fragment_blut
->->

=== frag_menschen ===
// Freigeschaltet bei Gilberts Bericht über die Jagdnacht oder am Scheiterhaufen.
// [KANON lore:kern] Die Seuche macht aus Menschen Bestien; die Bürger jagen selbst und halten Fremde für die Überträger. Der Hornknopf (a_ankunft) und die Bäckerei (b_yharnam, k1_nach_scheiterhaufen) sind [ERWEITERT].
// [Deutung des Jägers] Jede Jagd eine Jagd auf Nachbarn; nicht ausgesprochen, sondern im Hornknopf am Ende (S31, S32). Die Frage, woran man es an sich selbst erkennt, gehört frag_kippen.
In dieser Stadt sitzt hinter jeder verriegelten Tür einer und wartet, dass jemand heimkommt. { gilbert_jagd: Was sie da draußen jagen, sagt Gilbert, haben sie gestern meist noch gegrüßt.} { k1_b_scheiterhaufen: Die mit den Fackeln wissen so wenig wie du, wen sie vor sich haben. Am Feuer haben sie in dir gesehen, was du in der Klinik gesehen hast, und sie haben es geglaubt.| Wer das Warten nicht mehr aushält, nimmt Fackel und Mistgabel, so erzählt Gilbert, und geht selbst hinaus.} { mob_verbrannt: Martha hatte Mehl an den Ärmeln. An der Bäckerei bei der Ecke zum Markt hängt jetzt ein schwarzes Tuch um die Klinke.} An der Brust der Bestie in der Klinik glänzte ein Hornknopf, und an dem Knopf hingen noch zwei Fäden. Ein Tier trägt keine Knöpfe. # notiz: fragment_menschen
->->

=== frag_kirche ===
// Freigeschaltet am Anschlag oder im dunklen Haus (auf jeder Route mindestens eines von beiden). Deutung des Jägers, nicht des Erzählers.
// [KANON lore:welt/notizen Nr. 2] Die Kirche sperrte die Brücke, als die Jagd begann. [KANON lore:fraktionen/heilende-kirche] Die Kirche verwaltet das Blut; dass es aus der Kathedrale kommt, ist in Kapitel 1 Gerücht (Gilbert).
// [Deutung des Jägers, Wissenssperre] Das Wort „Quelle“ zweimal (Gilbert, das Blatt am Altar): nur nebeneinandergelegt, kein Schluss ausgesprochen. Der Leser zieht ihn, oder nicht.
{ k1_b_anschlag: An der Kapellentür klebt ein Datum über dem anderen, jeder Streifen ein wenig gelber als der darüber. Wer so sorgfältig nachklebt, ist von der Jagd nicht überrascht worden. Fürchtet nicht das Blut, steht darüber, fürchtet, was ohne das Blut aus euch würde.} { haus_zettel: Im dunklen Haus hat einer aufgeschrieben, die Kirche habe ihre Brücke gesperrt, als es unten im Tal brannte. Sie wachen über euch, steht an den Türen. Über ihre Brücke wachen sie.} { gilbert_bruecke: Ihr Blut kommt aus der Kathedrale, sagt Gilbert, so wie Wasser aus einer Quelle.}{ altar_blatt and gilbert_bruecke: Quelle steht auch auf dem Blatt am Altar. Zweimal ist dir das Wort in dieser Nacht begegnet, und du legst die beiden Stellen nebeneinander und lässt sie dort liegen.} Von der Kathedrale selbst hast du aus den Gassen nur den höchsten Turm gesehen, schmal und schwarz über allen Dächern, wie ein Finger, den einer an die Lippen legt. # notiz: fragment_kirche
->->

=== frag_ich ===
// Freigeschaltet bei der Kleriker-Bestie (nur nach dem Sieg). Noch keine Auflösung (Wissenssperre): dass Blut Geistliche zu Bestien macht, bleibt Gerücht und Ahnung.
// [KANON lore:bosse/kleriker-bestie] Belege, die andeuten, nicht beweisen: Nadelnarben (n1_kleriker, beute), das Blutgedächtnis mit der Nadel vor dem Altar, Gilberts Gerücht.
In der Haut der Bestie saßen Narben von Nadeln, klein und rund und in ordentlichen Reihen, wie die Stiche in einem Mustertuch. So ordentlich sticht nur, wer es oft tut und auf Anweisung. In deiner Armbeuge sitzt ein einzelner Stich, und du spürst ihn bei jedem Herzschlag. { gedaechtnis_kleriker: In ihrem Blut hast du einen Mann mit weißem Kragen gesehen, dem man vor dem Altar die Nadel in den Arm setzte, und er hat dafür gedankt.} { gilbert_kleriker: Aus Kirchenleuten, sagt man, werden die schlimmsten.} Bei dir ist es ein Stich, bei ihr waren es Hunderte. Irgendwo dazwischen liegt eine Zahl, bei der es anfängt. In deiner Armbeuge ist Platz für viele. # notiz: fragment_ich
->->

=== frag_nacht ===
// Freigeschaltet am Ende des zweiten Viertels, vor Eileen und der Brücke; gespielt frühestens auf der Brücke, spätestens in Traum 2. Darum nichts aus dem Traum (Gehrman) und nichts vom Heimweg.
// [ERWEITERT, Entscheidung des Nutzers Ü1] Der Mond wandert nicht, wird aber größer und näher; nie rot. Hier nur seine Lage (N2: keine Farbe, kein Hof, keine Narben).
// Die Stadt spricht nicht vom Morgen; nur das Mädchen am Brunnenplatz („Mama sagt, der Morgen kommt immer“, b_yharnam), darum bedingt auf `maedchen_gesehen` (L1, S40).
//   Der Kutscher spricht vom Morgen vor der Stadt, der Blutminister nicht mehr (a_ankunft).
Als du aus der Klinik tratst, stand der Mond über den Giebeln und lag beinahe auf den Firsten. Seither hast du ihn an Schornsteinen gemessen, an Dachfirsten, an der Spitze eines Laternenpfahls, und er ist nicht von der Stelle gerückt. Nur größer ist er geworden, und näher, allmählich; man merkt es bloß, wenn man eine Weile nicht hingesehen hat.{ maedchen_gesehen: Vom Morgen spricht in dieser Stadt nur ein Kind hinter einem Fenster am Brunnenplatz, und auch das nur, weil seine Mama es gesagt hat.} Kein Wächter ruft die Stunden aus, keine Uhr schlägt sie; nur die Glocken läuten, und sie läuten, wann sie wollen. # notiz: fragment_nacht
->->

=== frag_kippen ===
// Freigeschaltet an den Gräbern (immer).
// [KANON lore:figuren/gascoigne] Er verliert sich ins Blut; vergisst Namen (c_unterstadt: Henryk statt deines Namens). [KANON lore:figuren/eileen] Jägerin der Jäger, die Abzeichen.
// [Deutung des Jägers] Das Kippen geht schrittweise; ob man es an sich selbst merkt, bleibt offen.
Zwischen den Gräbern hat Gascoigne mit bloßen Händen in frischer Erde gewühlt, beinahe zärtlich, und dabei zwei Töne gesummt, immer dieselben zwei. { gascoigne_name: Deinen Namen hat er gefunden, einen Atemzug zu spät, und vorher einen anderen gesagt.| Dich hat er den Fremden vom Feuer genannt, zweimal hintereinander, und dann noch einmal.} { mob == "zerstreut": Am Feuer wusste er noch, wie die Tote hieß.| Am Feuer kannte er noch jeden beim Namen, Martha, Hennings, Brack.} Es geht also nicht auf einmal. Es geht wie in einem Haus, in dem man abends ein Zimmer nach dem anderen zusperrt, bis nur noch eines warm ist. { eileen_genannt: An Eileens Schnur klappern die Abzeichen von Jägern, die nicht mehr wussten, was sie jagten.} Ob man es selbst merkt, fragst du dich, wenn man an den falschen Stellen zu lachen beginnt, oder ob es einem erst ein anderer sagen muss. # notiz: fragment_kippen
->->
