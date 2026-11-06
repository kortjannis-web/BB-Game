// KAPITEL 1, NADELÖHR 2: VATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbild in A, Kampf in B (Anzeichen ruhig und genau, Folge kurz und hart). Optionen fließen in den Satz (#fliesst) und nennen die Richtung.
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen ohne „Du“-Protokoll, Lernsätze als Erinnerung des Körpers, „er“ bis zum Tod, Verwandlung als langsamer Vorgang, Moment der Klarheit ohne Erklärung.
// Überarbeitung 2026-11-06 nach docs/ueberarbeitung-kapitel1.md (Ü1 bis Ü12) und stil-1800 (Momente anzeichen, kampf, grauen, tod): Mond statt Sonne, Choral nach der dritten Zeile, WARUM über jeder Option, Anzeichen geschärft, wo eine falsche Wahl vorher nicht lesbar war (t2: das lockere Handgelenk; t3b: genau eine Stiellänge Abstand). Takte, Variablen, Bedingungen und Zahl der Möglichkeiten unverändert; neu sind nur Textfärbungen mit vorhandenen Variablen (gascoigne_verraten, gascoigne_lied, mantel_erkannt, gascoigne_name).
// [ERWEITERT, Entscheidung des Nutzers Ü1] Nacht von Anfang an. Im Kanon ist bis Gascoigne Abend, der Sonnenuntergang folgt erst danach (lore/kapitel/kapitel1.md); darum hier kein Sonnenuntergang nach dem Kampf. Der Mond über dem Grab: nie rot, ohne Farbwort (N2), deutlich größer als über den Gräbern: Er sitzt auf der Mauerkrone, die ihm ein Drittel abschneidet, und ragt an beiden Enden über sie hinaus (Stufe zwischen den Gräbern und dem Heimweg); er wandert nicht. Der falsche Schatten fällt ihm entgegen (nur mit Einsicht, L25). Nach dem Tod Gascoignes zieht Dunst vor ihn, und es beginnt zu regnen (L3, Saat für den Hut im Regen und d_nachspiel).
// Nachbesserung 2026-11-06 (N1 bis N9, Prüfberichte S und L): Lernsätze als Erinnerungsbild im Präteritum, Formeln ausgedünnt, Witterung als Kennzeichen (kurze Rucke, in Phase 2 ein einziger gieriger Zug),
//   „sein Rollen“ statt der vollen Formel (N7), Satz vom süßen Blut weiter weg vom Original (N8), tote Zweige ohne q_frau/gascoigne2 gelöscht (L44), Schatten und Optionen in t4 stimmig (L24),
//   der Griff nach Gehrmans Lehre und ohne die Bedingung kleriker == "besiegt" (L23), Choral am Grab gesteigert (N6), „wieder“ nur, wenn der Choral schon zu hören war (L9).
// [KANON lore:figuren/gascoigne, RK1 §11] Er hackt auf eine Leiche ein. Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine. Im Rausch: was sich bewegt, ist Bestie, und was sich nicht bewegt, dem traut er auch nicht. Beim Übergang in die zweite Phase riecht er süßes Blut, es singt ihm, und ihm wird übel davon. Alles sinngemäß, eigene Worte; das Bild (angebrannter Kandis, ein Lied, das er kennt) ist unser.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig, schneller, springt viel; kleiner als die Kleriker-Bestie). PRÜFEN: Dass er die Donnerbüchse in der zweiten Phase wegwirft, ist unsere Zuspitzung; ob er sie im Original danach noch benutzt, ist nicht am Spiel geprüft.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] „Vater“ ist ein Titel für Geistliche in einem fremden Land (seine Geste am Ende des Moments der Klarheit ist die eines Paters).
// Acht Takte (Festlegung G9, Entscheidung des Nutzers 6 bis 8): Phase 1 t1, t2, t2b; Phase 2 t3, t3b; Phase 3 t4, t4b, t5. Die Spieluhr (uhr) ist kein eigener Takt.
// [KANON lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat an den Gräbern). Um den Hals trägt er einen schmutzigen Schal, der als heiliges Tuch der Kirche gilt (RK1 §11, wahrscheinlich): Daran hängt der Weihrauch, nicht an seinem Atem.
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn in Menschen- und in Bestienform stocken; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [ERWEITERT] Dem Kamm der Spieluhr fehlt ein Zahn; in der dritten Zeile fällt ein Ton aus. An den Gräbern summt Gascoigne genau diesen Ton, im Kampf presst er die Hände an den Kopf, die Bestie winselt ihn, im Moment der Klarheit fällt sein Name in die Lücke, im Tod hört er dort auf. Der Choral bricht nach der dritten Zeile ab (Ü11), im Atemholen für die vierte.
// [ERWEITERT] Der Hut mit der breiten Krempe liegt auf einem Grabstein; im Kanon trägt er ihn im Kampf. Der Ring, der ihm in den Finger gewachsen ist (Gegenbild zu Gilberts zu weitem Ring). Die Blechflasche vom Scheiterhaufen (Torf und Rauch, Ü11) als letztes Ding von ihm.
// [ERWEITERT] Nach dem Sieg riecht der Dunst aus seinen Wunden süß, so, wie er es im Rausch beschrieben hat; die Hand an der Armbeuge. Ersetzt die Aufnahme der Blutechos (entfallen 2026-11-06); Saat für den eigenen Blutdurst, ohne Deutung.
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 3), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie, und nur, wenn man ihn ruft.
// Eileen hilft in Kapitel 1 nicht im Kampf; die Partnerschaft beginnt in Kapitel 2.
// Rede: Hier bricht seine Stimme wörtlich durch, kurz und kippend; im Moment der Klarheit nur noch Reste, zuletzt sein „So.“ (der Kehrreim vom Scheiterhaufen, der jetzt „Tu es“ heißt). Seine Lehre „Nicht davor. Nicht danach.“ kehrt in t1 als deine Erinnerung wieder.
// Geruch (L5): An den Gräbern einmal „nasses Fell“, am Grab unbenannt (der Körper atmet schon durch den Mund), Ernte erst im Griff (t5).

// Stand beim ersten Betreten (Neustart nach dem Tod stellt ihn wieder her)
VAR n2_gascoigne = 0
VAR n2_molotow = 0
VAR uhr_bestie = false        // die Spieluhr in diesem Anlauf schon der Bestie vorgespielt (einmal je Anlauf)

=== k1_n2_gascoigne ===
// TITEL: NADELÖHR 2: Gascoigne
-> betreten("grab") ->
~ kampfanfang = -> k1_n2_gascoigne
{ k1_n2_gascoigne == 1:
    ~ n2_gascoigne = gascoigne
    ~ n2_molotow = molotow
- else:
    ~ gascoigne = n2_gascoigne
    ~ molotow = n2_molotow
}
// Der Kampf beginnt von vorn: Was in einem früheren Anlauf geschah, gilt nicht.
~ gascoigne_moment = false
~ versprechen_gascoigne = false
~ im_lied_getroffen = false
~ spieluhr_mal = 0
~ uhr_bestie = false
~ g_phase = 1
~ moment_moeglich = gascoigne >= 3 and spieluhr and gedaechtnis_kleriker
{ k1_n2_gascoigne == 1:
    ~ einsicht = einsicht + 1
    Hinter dem Tor hört das Wasser auf. Den ganzen Weg durch die Unterstadt ist es neben dir hergelaufen, in den Rinnen, über die Stufen, aus den Fugen der Mauern, und erst jetzt, da es fehlt, merkst du, wie laut es war. Hier riecht es nach umgegrabener Erde und kaltem Eisen. Der Friedhof steigt in breiten Stufen an, Grab über Grab, und der Nebel liegt flach zwischen den Steinen; nur ihre Köpfe ragen heraus, eine Gemeinde, die auf den Beginn der Predigt wartet. Über der obersten Mauer steht der Mond. Vor dem Tor hing er noch frei über den hintersten Gräbern; jetzt sitzt er auf der Mauerkrone, die ihm das untere Drittel abschneidet, und ragt an beiden Enden über sie hinaus. In seinem Licht lassen sich auf den nächsten Steinen die Namen lesen, bis in das Moos in den Kerben.{not k1_c_graeber: Über dem Tor, durch das du gekommen bist, steht ein einziges Wort im Stein: Oedon.} # bild: grab_oedon # stimmung: grauen # lore: oedon
    Weiter oben schlägt es. Schwer und gleichmäßig kommt es herunter, und zwischen zwei Schlägen schmatzt es jedes Mal leise und nass. Ab und zu fährt die Klinge ganz hindurch und trifft auf Stein; dann klingt es hell und kurz, und der Ton läuft über die Gräber davon, bis der Nebel ihn schluckt.
    Er steht auf der obersten Stufe, mit dem Rücken zu dir, der lange Mantel nass bis an die Knie, und die Axt hebt sich und fällt. Seinen Hut hat er auf einen Grabstein gelegt, die breite Krempe nach oben, genau in die Mitte des Steins gerückt. Was zu seinen Füßen liegt, trägt noch einen Stiefel, und die Schnalle daran ist blank geputzt. Der Wind kommt von oben herab, und du atmest schon durch den Mund. Du nimmst die Feuerwaffe in die Hand; ihr Griff ist warm. # kampf: gascoigne
    // L25: Der falsche Schatten ist ein Zeichen der Einsicht (Ü1, Notizbuch „einsicht>=3“ am Kapitelende). Hier ist die Bedingung auf jedem Weg erfüllt (Anblick der Kleriker-Bestie und Ankunft je +1), sie bindet das Bild aber an die Mechanik.
    { einsicht >= 1:
        Sein Schatten liegt auf dem Nebel, und er liegt falsch. Statt die Stufen herab zu dir fällt er hinauf, dem Mond entgegen. In deinem Rücken, woher das Licht dann kommen müsste, ist nur das Tor und das Dunkel der Unterstadt. # lore: einsicht
    }
- else:
    Wieder verstummt hinter dem Tor das Wasser. Oben auf der letzten Stufe hebt sich die Axt und fällt, im selben Takt wie beim ersten Mal; kein Schlag kommt früher, weil du zurück bist. Der Hut liegt auf seinem Grabstein, die Krempe nach oben, und der Mond sitzt auf der Mauerkrone, um nichts gewandert. # bild: grab_oedon # stimmung: grauen # kampf: gascoigne
}
// L44: Die Zweige für einen Jäger, der Gascoigne nie begegnet ist („Noch einer“), sind gelöscht. Das Grab wird nur über k1_c_tor betreten, k1_c_tor nur aus k1_c_eileen,
//   k1_c_eileen nur aus k1_c_graeber, und dort wird gascoigne2 auf jedem Weg gesetzt (c_unterstadt); q_frau ist ohnehin immer 1 (b_yharnam, gascoigne_greift_ein).
{ k1_n2_gascoigne > 1:
    Die Axt bleibt oben stehen. Er dreht sich um, die Schulter zuerst, dann die Hüfte, genau wie beim ersten Mal, und wittert in kurzen Rucken. Nichts in seinem Gesicht weiß davon, dass er dich hier schon einmal ins Gras gelegt hat. „{gascoigne_name:{name}|Fremder}“, sagt er, derselbe Gruß wie zuvor. „Dann siehst du's auch.“
    -> p1
}
Die Axt bleibt oben stehen. Er dreht sich um, die Schulter zuerst, dann die Hüfte. Der Verband über seinen Augen ist steif geworden und dunkel bis zum Knoten, und trotzdem findet sein Gesicht dich sofort. An den Gräbern hat er einen Atemzug zu lang gebraucht. Jetzt lächelt er, bevor du stehst.
„{gascoigne_name:{name}|Fremder}.“ Es klingt wie ein Gruß an der Haustür, mit seinem Rollen, das du vom Scheiterhaufen kennst. „Gut. Gut, dass du kommst. Dann siehst du's auch.“{ gascoigne_verraten: Er hebt das Gesicht zu den Dächern über der Mauer. „Allein?“, fragt er. „Keine Federn diesmal?“ Auf die Antwort wartet er nicht.}
// [ERWEITERT] Der Bäckerjunge (Jonas) ist erfunden und liegt im frischen Grab an den Gräbern; Martha, Hennings und der alte Brack stammen aus der Szene am Scheiterhaufen.
// [KANON lore:figuren/gascoigne] Eröffnung sinngemäß: überall Bestien, früher oder später auch du.
Er deutet mit der Axt hinab auf die Dächer, und von der Schneide tropft es in den Nebel. { mob_verbrannt: „Martha. Die hast du mir abgenommen. Hennings. Der alte Brack. Der Bäckerjunge.“ Er wartet, als müsse er nachzählen. „Alle.|„Martha. Hennings. Der alte Brack. Der Bäckerjunge. Alle.} Hinter jeder Tür, unter jedem Hut. Ich riech's durch das Räucherwerk.“
Er hebt das Kinn und zieht die Luft ein, einmal, zweimal, in kurzen, prüfenden Rucken, und sein Kopf folgt dabei deinem Atem. „An dir noch nicht.“ Es klingt, als gratuliere er dir. „Noch nicht, {gascoigne_name:{name}|Fremder}. Ist nur eine Frage der Nächte.“
-> p1

= p1
# stimmung: kampf
- (t1)
{ t1 == 1:
    Er hebt die Donnerbüchse. Der Trichter des Laufs schwenkt über die Steine, findet dich und bleibt stehen; das Gewicht liegt auf seinem hinteren Fuß, und die Axt hängt locker an seiner Seite. Links von dir steht ein Grabstein, breit genug für zwei.{ parade_quelle == "gascoigne": Diese Haltung kennst du. Auf dem Platz am Scheiterhaufen hat er sie dir vorgemacht, für den Augenblick, in dem eine Bestie ausholt. Nicht davor, nicht danach. Jetzt wartet er darauf, dass du ausholst.| Er wartet darauf, dass du dich rührst.} # anzeichen: gascoigne_schuss
- else:
    Wieder hebt er die Donnerbüchse. Der Trichter findet dich und bleibt stehen, sein Finger liegt am Abzug, und links von dir wartet derselbe breite Grabstein. # anzeichen: gascoigne_schuss
}
{ gelernt ? gascoigne_schuss: Zuletzt bist du geradewegs in diese Ladung gelaufen, und die Körner brannten dir in der Brust. Der Stein zur Linken stand die ganze Zeit da. }
// WARUM: Falsch, für Aufmerksame erkennbar: Der Lauf zielt schon ruhig auf dich, und das Anzeichen bietet den breiten Stein zur Linken als Deckung an. Wer losstürmt, läuft in die Ladung.
+ [Geradeaus auf ihn zustürmen #fliesst]
    Zwei Reihen Gräber weit kommst du. Dann spuckt der Trichter Feuer, eine Handvoll glühender Körner schlägt dir in die Brust und wirft dich rückwärts über einen Stein.
    ~ zuletzt = gascoigne_schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Richtig für den, der die Parade gelernt hat: Erst kommt der Schuss, dann setzt er mit der Axt nach; wer in diesen Hieb schießt, bringt ihn ins Wanken und überspringt den nächsten Takt. Es ist seine eigene Lehre vom Scheiterhaufen, gegen ihn gewendet.
+ {parade} [Unter der Ladung weg, dann schießen #fliesst]
    Still hältst du, bis der Trichter Feuer spuckt; dann wirfst du dich flach, und die Ladung fährt über dich hinweg. Er setzt mit der Axt nach, das ganze Gewicht im Schlag, und in diesen Schlag hinein drückst du ab. { parade_quelle == "gascoigne": Er wankt, genau so, wie er es dir auf dem Platz vorgemacht hat, und für einen Herzschlag zieht sich sein Mund zu etwas zusammen, das Stolz sein könnte. Die Säge ist in ihm, bevor er sich fängt. | Er wankt, und die Säge ist in ihm, bevor er sich fängt. } # notiz: seine_lehre
    -> t2b
// WARUM: Sicher, aber ohne Gewinn: Der breite Stein, den das Anzeichen eigens nennt, fängt die Ladung. Dafür hört man seinen Satz aus dem Rausch (Kanon, sinngemäß): Was sich bewegt, ist Bestie, und was still hält, dem traut er auch nicht.
+ [Links hinter den Grabstein #fliesst]
    Der Stein nimmt die Ladung für dich. Splitter regnen dir in den Nacken, Bruchstücke eines Namens, den nun niemand mehr lesen wird, und über den Stein hinweg hörst du ihn lachen. „Was zappelt, ist Bestie“, ruft er. „Und was sich hinterm Stein still hält, das hau ich trotzdem. Sicher ist sicher. Sicher ist sicher.“
    -> t2
// WARUM: Das Lied seiner Tochter (Kanon): Es lässt ihn stocken und öffnet Atem, Gnade oder den Moment der Klarheit; beim dritten Mal treibt es ihn in die Verwandlung. Keine falsche Wahl, aber eine mit Gewicht.
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
- (t2)
Er lässt die Donnerbüchse sinken und kommt über die Gräber, in Schritten, die länger sind als deine. Die Axt nimmt er tief hinter die Hüfte, die Schneide flach, genau auf der Höhe der Grabsteinköpfe; nur das Handgelenk hält sie, locker, als prüfe er ihr Gewicht. Zwei Schritte vor dir dreht sich seine Schulter ein. # anzeichen: gascoigne_bogen
{ gelernt ? gascoigne_bogen: Zuletzt kam die Schneide in Höhe der Grabsteinköpfe. Darunter war sie nie. }
// WARUM: Falsch, erkennbar: Das Anzeichen sagt, dass seine Schritte länger sind als deine; zwischen den Gräbern holt er jeden ein, der weicht.
+ [Rückwärts zwischen die Gräber weichen #fliesst]
    Er folgt dir, und zwischen zwei Steinen geht dir der Platz aus. Die Axt holt dich ein und beißt dir in die Schulter.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
// WARUM: Falsch, erkennbar am lockeren Handgelenk im Anzeichen: Er kann die Schneide noch heben, und wer springt, hängt wehrlos in der Luft.
+ [Über die flache Axt springen #fliesst]
    Im Sprung siehst du die Schneide steigen; er hat sie angehoben, eine Handbreit nur. Sie nimmt dir die Beine weg, und das Gras schlägt dir ins Gesicht.
    ~ zuletzt = gascoigne_bogen
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2b
// WARUM: Richtig: Der Hieb kommt flach in Höhe der Grabsteinköpfe; darunter ist Platz, und nah an ihm ist er offen.
+ [Unter dem Bogen durch und zuschlagen #fliesst]
    Tief, beinahe auf den Knien: Die Axt pfeift dir über den Scheitel, und dann bist du an ihm, so nah, dass dir der nasse Saum seines Mantels über die Wange streicht. Die Säge findet seine Seite. Er grunzt und sieht an sich hinab.
    -> t2b
// WARUM: Falsch zur falschen Zeit: Er ist mitten im Angriff; die Ampulle heilt, aber der Hieb trifft beim Stoßen, und der Takt beginnt von vorn. Die ruhige Gelegenheit kommt mit dem Lied.
+ {ampulle > 0} [Zurückspringen und die Ampulle stoßen #fliesst]
    Zwei Sätze zurück, die Ampulle schon in der Faust.
    -> ampulle_gefahr(2) -> t2
- (t2b)
// [ERWEITERT] Der Schuss aus nächster Nähe: Er lässt dich herankommen.
Er weicht nicht. Er lässt die Axt in der Rechten sinken, ganz, bis die Schneide im Gras liegt, und dreht dir die linke Schulter zu, als wolle er dich umarmen. Die Donnerbüchse hängt an seiner linken Hüfte, der Trichter zeigt zu Boden. Nur sein Daumen bewegt sich. Er spannt den Hahn, und das Klicken ist das lauteste Geräusch auf dem Friedhof. # anzeichen: donner_nah
{ gelernt ? donner_nah: Zuletzt kam auf dieses Klicken der Trichter hoch, mitten in dein Gesicht. Die Axt lag dabei rechts im Gras, nutzlos. }
// WARUM: Falsch, erkennbar: Die offene Brust ist eine Einladung, und der gespannte Hahn an der linken Hüfte zeigt, dass der Schuss aus nächster Nähe kommt.
+ [Von vorn in die offene Brust #fliesst]
    Die Säge trifft, und im selben Augenblick kommt der Trichter hoch. Der Schuss reißt dich von den Füßen, und als du wieder sehen kannst, liegst du auf dem Rücken, Glut im Gesicht und Erde zwischen den Zähnen.
    ~ zuletzt = donner_nah
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p2
// WARUM: Richtig: Die Büchse hängt links, die Axt liegt rechts nutzlos im Gras; rechts herum bist du aus dem Lauf, ehe er ihn heben kann.
+ [Rechts um ihn herum, hinter ihn #fliesst]
    Um seine Schulter herum, zwei Schritte, drei, und der Schuss fährt dorthin, wo du eben noch standest, zwischen die Gräber. Dein Hieb trifft ihn dicht unter dem Mantelkragen. Er brüllt.
    -> p2
// WARUM: Das Lied seiner Tochter (Kanon): Es lässt ihn stocken und öffnet Atem, Gnade oder den Moment der Klarheit; beim dritten Mal treibt es ihn in die Verwandlung. Keine falsche Wahl, aber eine mit Gewicht.
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= p2
~ g_phase = 2
Er tritt zurück, und mit einem Ruck der Handgelenke klappt er die Axt aus: Der Stiel fährt heraus, doppelt so lang wie zuvor, und er packt ihn mit beiden Händen. Die Donnerbüchse wirft er weg, achtlos, zwischen die Gräber, und sieht ihr nicht nach. Er lacht dabei, tief in der Kehle, und er lacht auch beim Einatmen, nach innen, mit dem Geräusch eines Blasebalgs, der einen Riss hat. # phase # stimmung: kampf
// N8 (L40): Kanon sinngemäß (das Blut ist süß, es singt ihm, ihm wird übel davon), Wortlaut und Reihenfolge eigen: zuerst das Bild, dann das Blut, das Lied im Geruch, der Magen als Tat.
Mitten darin hält er inne. Er hebt das Gesicht und wittert, ein einziger tiefer Zug, gierig, ohne die kurzen Rucke von vorhin, und das Lachen bricht ab. „Kandis“, sagt er, und seine Stimme ist ganz weich geworden. „Kandis in der Pfanne, kurz bevor er schwarz wird. So riecht das Blut hier oben{gascoigne_name:, {name}}. Und ein Lied steckt darin, eins, das ich kenn. Ich kenn's doch …“ Er krümmt sich über den langen Stiel, eine Hand vor dem Mund, und sein Magen hebt sich; durch die Finger hindurch lacht er weiter.
- (t3)
Er fasst den Stiel ganz am Ende und beginnt sich zu drehen. Die Schneide zieht einen Kreis, weiter, als seine Arme reichen, und wo sie einen Grabstein streift, fliegt der Kopf des Steins davon. Nur innen, dicht an seinem Körper, schwingt der Stiel leer durch die Luft. # anzeichen: axt_lang
{ gelernt ? axt_lang: Zuletzt kam die Schneide durch den Stein, hinter dem du standest. Nah an ihm schwang nur der Stiel. }
// WARUM: Falsch, erkennbar: Im Anzeichen fliegen die Köpfe der Grabsteine davon; kein Stein hält diese Schneide.
+ [Zurück hinter einen hohen Stein #fliesst]
    Einen Atemzug lang ist es hinter dem Stein ruhig. Dann geht die Axt durch ihn hindurch, und durch dich.
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t3b
// WARUM: Richtig für den, der im Hof des Traumes geübt hat: Mitten im Kreis ist die Wucht abzufangen. Die Möglichkeit gibt es nur mit der Übung (geuebt), und er erkennt an dir etwas wieder.
+ {geuebt} [Die lange Axt vorn abfangen #fliesst]
    Die Säge quer, beide Hände, die Füße in den Boden, wie Gehrman es dich am Pfahl im Hof gelehrt hat: Stahl schlägt auf Stahl, mitten in ihrem Kreis, der Schlag fährt dir bis in die Zähne, und deine Arme halten. Einen Atemzug lang steht ihr so, Klinge an Klinge, und er neigt den Kopf, als erkenne er an dir etwas wieder. Dann reißt er sich los. # notiz: uebung_genutzt
    -> t3b
// WARUM: Richtig, erkennbar: Das Anzeichen sagt, dass der Stiel innen leer schwingt; nah an ihm ist der einzige Ort ohne Schneide.
+ [Vorwärts, ganz nah an ihn heran #fliesst]
    In den Kreis hinein, gegen alles, was deine Beine wollen, bis du seinen Atem riechst, Eisen und angebrannten Zucker. So nah trifft die lange Klinge nicht. So nah triffst du.
    -> t3b
// WARUM: Das Lied seiner Tochter (Kanon): Es lässt ihn stocken und öffnet Atem, Gnade oder den Moment der Klarheit; beim dritten Mal treibt es ihn in die Verwandlung. Keine falsche Wahl, aber eine mit Gewicht.
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr
// WARUM: Falsch zur falschen Zeit: Der Kreis wandert mit dir; wer im Weichen die Ampulle setzt, wird dabei getroffen und muss den Takt noch einmal bestehen.
+ {ampulle > 0} [Rückwärts gehen und die Ampulle stoßen #fliesst]
    Rückwärts, die Ampulle schon in der Hand, und der Kreis der Axt wandert mit dir.
    -> ampulle_gefahr(2) -> t3
- (t3b)
// [ERWEITERT] Der Hieb von oben: Er stemmt die lange Axt in die Höhe und zählt stumm bis drei. Ü1: Die Schneide steht vor dem Mond.
Mit dem Stiel stößt er dich von sich, nicht fest, nur so weit, wie der Stiel lang ist. Dann hebt er die lange Axt über den Kopf, beide Hände am Ende des Stiels, und hält sie dort, und hoch über ihm steht die Schneide vor dem Mond und zittert. Er lacht nicht mehr. Wohin du auch trittst, sein Kopf wandert mit dir, gleichmäßig und genau. # anzeichen: axt_wirbel
Stumm zählen seine Lippen. Eins.
{ gelernt ? axt_wirbel: Zuletzt hat dich diese Axt gefunden, ehe er bei drei war. }
// WARUM: Falsch, erkennbar: Sein Kopf wandert mit jedem deiner Schritte mit; wer früh läuft, gibt ihm nur Zeit zu zielen.
+ [Sofort nach hinten weglaufen #fliesst]
    Bei eins hast du ihm schon den Rücken zugedreht. Sein Kopf folgt dir, und die Schneide folgt seinem Kopf; sie trifft dich zwischen die Schulterblätter.
    ~ zuletzt = axt_wirbel
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
// WARUM: Richtig, erkennbar am Zählen: Er schlägt erst bei drei; wer erst dann ausweicht, lässt ihn in den Stein schlagen.
+ [Bis drei warten, dann nach links #fliesst]
    Zwei. Seine Lippen formen die Drei, und erst jetzt wirfst du dich nach links. Die Axt fährt in den Grabstein neben dir und bleibt darin stecken, und während er am Stiel zerrt, schlägst du ihm in die Kniekehle, bis er auf ein Knie sinkt.
    -> p3
// WARUM: Falsch, für Aufmerksame erkennbar: Er hat dich genau eine Stiellänge weggestoßen; wer hineinläuft, steht unter dem Stiel, und er muss ihn nur fallen lassen.
+ [Vorn hinein, solange die Arme oben sind #fliesst]
    Unter den erhobenen Armen ist er offen, und die Säge geht tief. Er zählt nicht weiter. Er lässt einfach los, und der Stiel kracht dir auf den Schädel.
    ~ zuletzt = axt_wirbel
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p3
// WARUM: Das Lied seiner Tochter (Kanon): Es lässt ihn stocken und öffnet Atem, Gnade oder den Moment der Klarheit; beim dritten Mal treibt es ihn in die Verwandlung. Keine falsche Wahl, aber eine mit Gewicht.
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen und hochhalten #fliesst] -> uhr

= uhr
~ spieluhr_mal = spieluhr_mal + 1
{ spieluhr_mal:
- 1: Die Feder knirscht unter deinem Daumen, eine Umdrehung, zwei, und das Lied steigt über die Gräber. Gascoigne erstarrt mitten in der Bewegung. In der dritten Zeile, wo dem Kamm ein Zahn fehlt, fällt ein Ton aus, und in diese Lücke hinein lässt er los, was er in den Händen hält, und presst beide Hände an den Kopf, fest, mit gespreizten Fingern.{ gascoigne_lied: Seine Lippen formen zwei Wörter, „Sie heißt“, und weiter kommen sie nicht, wie auf der Brücke.} Aus seiner Kehle kommt der Laut eines Mannes, der im Schlaf etwas Schweres hebt. # klang: spieluhr # lore: spieluhr
- 2: Noch einmal die Feder, noch einmal das Lied, und zwischen den Steinen klingt es jetzt blechern; die Mauer gibt es einen halben Takt zu spät zurück, so dass zwei Lieder über die Gräber laufen und eines davon falsch. Er dreht den Kopf, suchend, nach links, nach rechts. „Viola?“, sagt er. „Viola, wo …“ Er findet sie nicht, und die Hände an seinem Kopf zittern. # klang: spieluhr
- else: Beim dritten Aufziehen hakt die Feder, ehe sie das Lied freigibt, und es kommt nicht mehr bis zur Lücke. Er krümmt sich darunter wie unter einem Schlag und schreit, und der Schrei geht über in ein Brüllen, das aus einem größeren Brustkorb kommt, als er ihn hat. # klang: spieluhr # notiz: spieluhr_dritte # stimmung: grauen
    -> p3
}
// WARUM: Im Kampf kein Fehler, aber eine Tat mit Gewicht: Wer zuschlägt, während er dem Lied seiner Tochter zuhört, trägt das bis in die Chronik am Kapitelende (im_lied_getroffen). Gewonnen ist damit nur ein Treffer.
+ [Von vorn zuschlagen, solange er zuhört #fliesst]
    ~ im_lied_getroffen = true
    Er wehrt sich nicht. Gekrümmt steht er da und nimmt den Hieb, und die Hände bleiben, wo sie sind, an seinem Kopf. Das Lied spielt weiter, bis die Feder abgelaufen ist.
    -> weiter_nach_lied
// WARUM: Richtig für den Verwundeten: Solange das Lied spielt, greift er nicht an; die Ampulle heilt ohne Gefahr.
+ {ampulle > 0} [Hinter einem Stein die Ampulle stoßen #fliesst]
    Du gehst hinter dem nächsten Stein in die Knie. Er hört nur das Lied, und du hast Zeit.
    -> ampulle_ruhig -> weiter_nach_lied
// WARUM: Die Haltung des Schonens: Du lässt ihm das Lied bis zum Ende. Nichts gewonnen, nichts verloren, aber du hast nicht in sein Zuhören geschlagen.
+ [Einen Schritt zurück, das Lied abwarten #fliesst]
    Das Lied läuft aus, und mit dem letzten Ton lässt er die Hände sinken und greift wieder nach der Axt, zögernder als vorher, und sieht sich um, als wisse er nicht, wo er ist.
    -> weiter_nach_lied
// WARUM: Öffnet den Moment der Klarheit, wenn die Freundschaft trägt (gascoigne >= 3), die Spieluhr da ist und du im Blutgedächtnis der Kleriker-Bestie gesehen hast, wie eine Stimme mitten im Lied kippt; das ist das Zeichen zum Rufen. Sonst bleibt es ein halber Augenblick, in dem er dich für Henryk hält.
+ [Ihn leise beim Namen rufen #fliesst]
    { moment_moeglich and not gascoigne_moment: -> moment }
    Bei deiner Stimme hebt sich sein Kopf, und einen halben Atemzug lang sucht etwas in seinem Gesicht nach dir. „Henryk?“, sagt er. Es ist fort, so schnell, wie ein Docht ausgeht, und die Axt ist wieder oben. # notiz: halber_moment
    -> weiter_nach_lied

= weiter_nach_lied
{ g_phase == 2:
    -> t3
- else:
    -> t2
}

= moment
// Die bessere Entscheidung, die das Blutgedächtnis möglich macht. Der Text zeigt nur das Echo der kippenden Stimme; er erklärt nicht, warum es hilft.
~ gascoigne_moment = true
Das Lied läuft wieder auf die Lücke zu. Seine Lippen gehen mit, und kurz davor kippt ihm die Stimme, mitten im Summen, so wie auf der Brücke ein anderes Lied in einer anderen Kehle gekippt ist. In die Lücke, wo der Ton fehlt, sagst du seinen Namen, leise, so wie er im Deckel steht. # gedaechtnis: gascoigne_klarheit # stimmung: schoen
Gascoigne hebt den Kopf. Für einen Atemzug, einen einzigen, ist er da. Er steht gerade, die Axt hängt ihm locker in der Hand wie ein Werkzeug nach Feierabend, und er neigt den Kopf zur Seite.
„Viola“, sagt er. Nicht zu dir.
Dann spricht er, und es ist die Stimme vom Platz am Scheiterhaufen, tief, mit seinem Rollen, nur in Stücken: „Ich weiß. Was ich bin. Lang schon.“ Er atmet. „Mach's. Bevor ich wieder geh.“ Er atmet noch einmal, und es klingt schon nicht mehr ganz nach ihm. „So.“
// WARUM: Die wärmste Antwort, und eine Schuld: Du versprichst, nach dem Mädchen zu sehen (versprechen_gascoigne); die Weiche beim Mädchen liest es.
+ [Ihm versprechen, nach der Kleinen zu sehen #fliesst]
    ~ versprechen_gascoigne = true
    „Ich sehe nach der Kleinen. Das verspreche ich dir.“ Schon beim ersten Wort nickt er, und unter dem Verband laufen Tränen hervor, und er lässt sie laufen. „Sag ihr …“ Er sucht. „Das Lied. Sag ihr, das Lied weiß ich noch. Nur alles andere nicht.“
// WARUM: Die Frage, die das Mädchen dir mitgegeben hat. Er weiß es nicht mehr, und was er nicht weiß, bleibt offen (wer Viola getötet hat, sagt das Spiel nicht).
+ [„Wo ist Viola?“ #fliesst]
    „Wo ist Viola?“ Bei ihrem Namen öffnet sich sein Mund und schließt sich wieder. „Weiß nicht“, sagt er. „Weiß es nicht mehr.“ Seine Hände suchen an seinem Mantel nach einer Tasche, einem Knopf, und finden nichts. # notiz: viola_frage
// WARUM: Die Antwort auf seine Bitte ohne ein Wort: ehrlich und hart, ohne Versprechen, das später etwas schuldet. Er antwortet mit der Geste eines Paters.
+ [Schweigend die Säge heben #fliesst]
    Die Säge steht zwischen euch. Er kann sie nicht sehen, und doch breitet er die Arme aus, nur ein wenig, die Handflächen nach vorn, wie ein Pater am Ende der Andacht seine Gemeinde entlässt.
- Dann kippt er.
-> p3

= p3
~ g_phase = 3
Zuerst sind es die Hände. Er hält sie vor sich, die Finger gespreizt, und senkt den verbundenen Kopf über sie, wie einer, der vor dem Essen nachsieht, ob sie sauber sind. Sie werden länger, Glied um Glied, und jedes Glied knackt, bevor es nachgibt. Aus den Fingerkuppen schieben sich Nägel, schwarz und dick, und die Haut darüber reißt nicht; sie weicht nur zurück. # phase # stimmung: grauen
An den Schultern platzen die Nähte seines Mantels, eine nach der anderen, mit kleinen trockenen Lauten, und durch die Risse drängt Haar, grob und schwarz wie die Borsten eines Ebers. Sein Rücken krümmt sich unter dem, was da wächst, und richtet sich nicht wieder ganz auf. Gebückt, wie er jetzt steht, reicht sein Schatten über drei Gräber, und noch immer fällt er dem Mond entgegen.
Er will noch etwas sagen. {gascoigne_name:Die erste Silbe ist noch dein Name|Die erste Silbe ist noch die von „Fremder“}, die zweite gehört schon dem Kiefer, der sich dabei nach vorn schiebt, Zahn um Zahn, bis der Mund nicht mehr in das Gesicht passt, aus dem er spricht. Der Verband reißt über der Nasenwurzel. Was darunter ist, hältst du keinen Atemzug lang aus, und dein Blick flieht von selbst nach unten, zu seinem Hals.
Dort sitzt der Schal, wie er immer saß, ordentlich geknotet, an einem Hals, der zu dick für ihn geworden ist.
Der Knoten hält.
- (t4)
Mit einem Satz ist er rechts von dir auf einem Grabstein und kauert dort, Hände und Füße dicht beisammen auf dem schmalen Kopf des Steins, und unter dem Haar ziehen sich die Hinterläufe zusammen. Sein Kopf zielt auf die Stelle, an der du jetzt stehst, und bleibt dort, auch als du das Gewicht verlagerst. Dann springt er, von rechts, über drei Gräber hinweg, die Klauen voran, und sein Heulen klettert an den Grabsteinen hoch und kommt oben von der Mauer zurück. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Zuletzt kamen seine Klauen von rechts, auf die Stelle, an der du standest. }
// [ERWEITERT] Einsicht kostet: Wer zu viel sieht, sieht auch den falschen Schatten (angekündigt bei der Ankunft). Der Schatten kommt von links, von der Seite des Mondes, auf dich zu und lügt; wer vor ihm nach rechts ausweicht, läuft der Bestie entgegen. Der richtige Weg bleibt links, dem Schatten entgegen, für alle (L24: „Der Schatten lügt“ passt nur so).
{ einsicht >= 3: Sein Schatten aber fliegt dir von links entgegen, von der Seite des Mondes her, die Klauen voran, und er selbst ist noch in der Luft. }
// WARUM: Richtig: In Bestiengestalt ist er feueranfällig (Kanon); Gilberts Flamme trifft ihn mitten im Sprung.
+ {feuer} [Gilberts Flamme hoch in den Sprung halten #fliesst]
    Mitten im Sprung fährt ihm Gilberts Flamme entgegen, und das Haar auf seiner Brust fängt Feuer. Er heult und wälzt sich zwischen den Gräbern, und es riecht nach versengtem Haar und nach Fett.
    -> t4b
// WARUM: Richtig: Feuer ist seine Schwäche als Bestie (Kanon); die Flasche ist danach verbraucht.
+ {molotow > 0} [Die Brandflasche hoch gegen ihn werfen #fliesst]
    ~ molotow = molotow - 1
    Das Glas zerspringt an seiner Brust, und das Feuer läuft ihm über das Haar wie Wasser über einen Stein. Brennend kommt er auf, eine Armlänge neben dir, und wälzt sich im nassen Gras.
    -> t4b
// WARUM: Falsch, und nur wer viel Einsicht hat, sieht diese Falle: Der Schatten kommt von links, von der Seite des Mondes, und lügt; das Anzeichen sagt klar, dass er von rechts springt.
+ {einsicht >= 3} [Vor dem Schatten nach rechts weichen #fliesst]
    Der Schatten lügt. Er landet genau dort, wo du aufkommst, mit beiden Klauen voran.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
// WARUM: Richtig, erkennbar: Er springt von rechts auf die Stelle, an der du stehst; links aus seiner Bahn fällt er ins Leere. Wer den falschen Schatten sieht, muss ihm dafür entgegengehen.
+ [{einsicht >= 3:Nach links, dem Schatten entgegen|Nach links aus seiner Bahn} #fliesst]
    Er schlägt hinter dir auf; ein Grabstein springt aus der Erde und rollt dir gegen die Fersen.
    -> t4b
// WARUM: Falsch, erkennbar: Er springt mit dem ganzen Gewicht über drei Gräber; was so fliegt, fängt keine Säge.
+ [Den Sprung von vorn abfangen #fliesst]
    Säge gegen Klauen, und die Klauen sind schwerer. Er reißt dich um, und unter dir ist die Erde des Grabes kalt.
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t4b
// WARUM: Falsch zur falschen Zeit: Er ist schon im Sprung; wer jetzt die Ampulle setzt, wird beim Stoßen getroffen und muss den Sprung noch einmal bestehen.
+ {ampulle > 0} [Über ein Grab zurück, die Ampulle stoßen #fliesst]
    Ein Satz zurück über den Hügel eines Grabes, die Ampulle schon zwischen den Fingern.
    -> ampulle_gefahr(2) -> t4
- (t4b)
// [ERWEITERT] Kreis und Stille in einem Takt (Festlegung G9): Er umkreist dich heulend; wenn das Heulen aussetzt, springt er von dort, wo die Stille anfing.
Er greift nicht gleich wieder an. Auf allen vieren läuft er im Kreis um dich herum über die Gräber, und wo seine Klauen aufsetzen, reißt die Erde in Furchen auf. Dabei heult er ohne Pause, ein langer Ton, den die Mauer zurückgibt, so dass er von zwei Seiten zugleich kommt: links, dann hinten, dann rechts, dann wieder hinten. # anzeichen: bestie_kreis
Hinter dir bricht das Heulen ab, mitten im Atem.
{ gelernt ? bestie_kreis: Zuletzt hat das Heulen an derselben Stelle aufgehört, und von dort kam er. }
// [ERWEITERT] Einsicht kostet: Wer zu viel hört, hört das Heulen weiter, auch als es schon aufgehört hat.
{ einsicht >= 3: In deinem Kopf aber hört es nicht auf. Es läuft weiter, rund um dich, und jetzt kommt es von vorn. }
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr lässt ihn auch in Bestienform stocken. Einmal je Anlauf.
// WARUM: Richtig im Kampf, mit Gewicht: Die Spieluhr lässt auch die Bestie stocken (Kanon), einmal je Anlauf, und die Option sagt offen, dass du in sein Lauschen schlägst (im_lied_getroffen).
+ {spieluhr and not uhr_bestie} [Nach hinten herumfahren, Spieluhr und Säge #fliesst]
    ~ uhr_bestie = true
    ~ im_lied_getroffen = true
    Die Feder ist schon gespannt, als du herumkommst, und das Lied fällt in die Stille wie ein Stein in einen Brunnen. Er bleibt stehen, mitten im Ansatz zum Sprung, und senkt den Kopf zur Melodie, tief, bis die Schnauze das Gras berührt. An der Stelle, wo der Ton fehlt, winselt er, hoch und dünn, genau einen Ton lang. Er rührt sich nicht, als du zuschlägst. # klang: spieluhr # stimmung: grauen
    -> t5
// WARUM: Falsch, die Falle der Einsicht: Das Heulen im Kopf kommt von vorn, das wirkliche hat hinter dir aufgehört.
+ {einsicht >= 3} [Vor dem Heulen nach hinten weichen #fliesst]
    Von vorn kommt nichts. Von hinten kommt er, und du läufst ihm rückwärts in die Klauen.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
// WARUM: Falsch, erkennbar: Das Heulen ist hinter dir abgebrochen, von dort springt er; wer davonläuft, zeigt ihm den Rücken.
+ [Nach vorn davonlaufen #fliesst]
    Drei Schritte, vier, und sein Gewicht landet dir im Rücken und drückt dich mit dem Gesicht in die Graberde.
    ~ zuletzt = bestie_kreis
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
// WARUM: Richtig: Wo das Heulen abbricht, setzt er zum Sprung an; wer sich dorthin dreht und unter ihn geht, lässt ihn in die Säge fallen.
+ [Nach hinten herumfahren, unter ihn #fliesst]
    Er ist schon in der Luft, als du herumkommst, und sein Leib löscht den Mond aus. Tief in die Knie, die Säge hoch, und er reißt sich selbst den Bauch daran auf.
    -> t5
// WARUM: Halb richtig und doch falsch: Die Richtung stimmt, aber wer nur horcht, hört nichts mehr; er springt in die Stille.
+ [Stehen bleiben, nach hinten horchen #fliesst]
    Der Friedhof gibt keinen Laut. Ein Atemzug, zwei; dann trifft dich seine Schulter von hinten, und du fliegst gegen einen Stein.
    ~ zuletzt = bestie_kreis
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t5
// WARUM: Falsch zur falschen Zeit: Er umkreist dich, kein Stein ist hier Deckung, und beim Stoßen trifft er; der Takt beginnt von vorn.
+ {ampulle > 0} [Rechts hinter einen Stein, die Ampulle #fliesst]
    Der Stein zur Rechten ist breit genug für deine Schultern und für nichts sonst; die Ampulle hast du schon in der Faust.
    -> ampulle_gefahr(2) -> t4b
- (t5)
Er packt dich. Beide Klauen schließen sich um deine Schultern, und er hebt dich hoch, bis sein Gesicht vor deinem ist und dir sein Atem entgegenschlägt, Blut und Eisen und nasses Fell. Der Schal an seinem Hals schwingt dicht vor deinen Augen, noch immer geknotet, und aus dem schmutzigen Stoff steigt, ganz schwach, ein herber, harziger Geruch, der nicht hierher gehört: Weihrauch. Die Klauen haben sich in {mantel_erkannt:Wendels|deinen} Mantel gekrallt, nicht in dich, und das Leder knarrt an den Nähten. Seine Daumen liegen vorn, an deinen Schlüsselbeinen. # anzeichen: griff
{ gelernt ? griff: Zuletzt hast du in diesen Griff gestochen, und die Klauen fanden durch das Leder dein Fleisch. }
// WARUM: Falsch, aber nicht tödlich: Wer in den Griff sticht, gewinnt, doch die Klauen, die nur im Mantel saßen, finden dabei dein Fleisch.
+ [Von vorn in seinen Griff stechen #fliesst]
    Seine Klauen graben sich in dein Fleisch und deine Säge in seines, und einen langen Augenblick haltet ihr einander fest. Dann gibt er nach.
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
// WARUM: Richtig für den, der im Hof des Traumes geübt hat: Gehrmans Lehre, wer packt, ist zum Daumen hin offen; die Daumen liegen laut Anzeichen vorn. L23: Die frühere Bedingung kleriker == "besiegt" ist entfallen, denn die Übung im Traum hängt nicht an der Brücke.
+ {geuebt} [Seine Arme nach außen aufbrechen #fliesst]
    Zwischen seinen Armen hindurch stößt du die Unterarme nach außen, gegen seine Daumen, beide zugleich, mit einem Ruck, so wie Gehrman es dich vor seinem Stuhl hat tun lassen. Die Klauen springen auf. Er heult, hoch und kurz, und dann bist du frei, und seine Brust ist offen. # notiz: uebung_genutzt
    -> sieg
// WARUM: Richtig, erkennbar: Die Klauen sitzen im Mantel, nicht in dir, und das Leder gibt an den Nähten nach; wer sich schwer macht, fällt heraus.
+ [Nach unten aus seinem Griff fallen #fliesst]
    Du machst dich schwer und rutschst nach unten weg, und seine Klauen schließen sich um Leder und Luft. Abrollen, hoch, und während er sich nach dir umdreht, liegt seine Brust offen. Die Säge geht hinein, so tief sie geht, und du lässt nicht los.
    -> sieg

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
# stimmung: ruhig
{ gascoigne_moment:
    Er sinkt zwischen den Gräbern zusammen, und als er stirbt, weicht das Haar ein Stück zurück, bis an den Hals, und das Gesicht darunter ist beinahe wieder seines. Seine Lippen bewegen sich. Es sind die ersten Töne des Liedes, ohne Stimme, und an der Stelle, wo der Ton fehlt, hören sie auf. # notiz: gascoigne_ende_mensch
- else:
    Er fällt zwischen die Gräber und rührt sich nicht mehr. Der Schal sitzt noch, geknotet, und eine Hand liegt offen auf der Erde, halb Klaue, halb Hand; an einem der Finger steckt ein schmaler Ring, tief eingewachsen, das Fleisch darüber zusammengeschlagen. # notiz: gascoigne_ende_bestie
}
Eine Weile wartest du, dass etwas geschieht. Es geschieht nichts. Er ist tot. Er bleibt tot. Er wacht nicht zwischen weißen Blumen auf.
Neben seiner Schulter liegt eine flache Blechflasche im Gras, verbeult, der Verschluss aufgesprungen, und was ausläuft, riecht nach Torf und Rauch. Darüber aber, aus seinen Wunden, steigt ein Dunst in die kalte Luft, und der riecht süß, nach Kandis in der Pfanne. Du atmest ihn ein. Du atmest ihn noch einmal ein, tiefer.
Deine Hand liegt an deiner Armbeuge, dort, wo der Einstich pocht, und sie bleibt lange dort.
// L3: Der Regen beginnt hier, vor dem Choral (Ernte: der Hut im Regen, d_nachspiel). Dunst vor dem Mond, ohne Hof (N2).
Über der Mauer ist Dunst vor den Mond gezogen, und er steht matt dahinter. Aus dem Dunst fallen die ersten Tropfen, schwer und einzeln, auf die Steine, auf seinen Mantel, auf deine Hände.
// L9: „wieder“ nur, wenn der Choral schon zu hören war (am Scheiterhaufen, wenn Martha verbrannt ist; auf der Brücke nach dem Sieg ohne Gascoigne). N6: Das Abbrechen ist hier gesteigert: alle Stimmen zugleich, eine atmet noch ein.
Oben im Bezirk der Kathedrale, hinter der Mauer, { mob_verbrannt or k1_n1_kleriker.kampf.sieg: setzt der Gesang wieder ein|setzt ein Gesang ein}, viele Stimmen, gemessen und rein. Drei Zeilen singen sie zu Ende. Im Atemholen für die vierte bricht er ab, alle Stimmen im selben Augenblick, und in die Stille danach atmet weit oben noch eine einzelne ein, hörbar, und singt nicht.{ gedaechtnis_kleriker: Wie die vierte klingt, weißt du. Du hast sie schon einmal brechen hören.} # klang: choral
Auf dem Grabstein liegt noch sein Hut, die Krempe nach oben, und es regnet hinein.
-> k1_d_grab
