// KAPITEL 1, AKT III: UNTERSTADT. Entscheidungsbuch (Umbau 2026-11-06): linear. Kanalisation-Mündung (Schwein, auf allen Wegen) → Ankunft und Laterne → zweite Traumszene → Gräber (Gascoigne kippt) → Eileen über den Gräbern → Tor → NADELÖHR 2 (Grab des Oedon).
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/faktencheck-kapitel1.md: Ortsbilder in Stimme A, Geschehen in B. Optionen fließen in den Satz (#fliesst).
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen ohne „Du“-Protokoll, Lernsätze als Erinnerung des Körpers, keine Ketten am Tor, Krähe statt Rabe, Totenbretter statt Holzkreuze (L4).
// Überarbeitung Text für Text 2026-11-06 (docs/ueberarbeitung-kapitel1.md, Ü1 bis Ü12, Skill stil-1800): Nacht und Mond statt Sonne; Unterstadt als Ankunft aus dem Kanal; Tor ausgeschrieben (Ü10); Übergang Gräber → Dach; Optionen als Rede oder Tat, jede mit WARUM.
// [ERWEITERT] „Die Unterstadt“ als eigener Bereich mit Gassen, Friedhof und eigenem Knotenpunkt ist unsere Erfindung; im Original führen Kanalisation und Treppen von Zentral-Yharnam hinab zum Grab des Oedon (lore:orte/zentral-yharnam, RK1 §7, §9).
// [KANON lore:orte/zentral-yharnam] Zu Gascoigne kommt man über die Kanalisation; dort Ratten, Krähen, das Leichenbecken und das Riesenschwein; eine Leiter führt zurück nach oben.
// [KANON lore:gegenstaende/heilende-kirche] Das Tor zum Kathedralenbezirk öffnet erst der Schlüssel vom Grab des Oedon; es liegt oben an der Treppe hinter dem Friedhof, nicht mitten in der Unterstadt. Von hier unten sieht man nur den Bogen (k1_d_grab beschreibt das Tor aus der Nähe).
// [ERWEITERT] Ü1: Der rote Lichtstreifen der Sonne ist weggefallen. An seine Stelle tritt ein Streifen Mondlicht an einer Hauswand der Unterstadt, der nicht wandert; geerntet beim Zurückkommen aus dem Traum (k1_c_graeber). Über den Gräbern steht der Mond zum ersten Mal frei, so nah, dass man seine Narben sieht; bleich, nie rot.
// Die Laterne am Eingang der Unterstadt führt in die zweite feste Traumszene (story/traum.ink). Wer stirbt, kehrt an den Anfang des Kampfes zurück (story/nachbild.ink).

=== k1_c_unterstadt ===
// TITEL: Unterstadt: Ankunft und Laterne
// Früher der Hub der Unterstadt; jetzt die einmalige Ankunft nach der Kanalisation, mit der Laterne, die in die zweite Traumszene führt.
// Ü10 ausgeschrieben 2026-11-06: Ankunft aus dem Kanal statt von den Treppen; der Name des Viertels als Wort der Leute (Regel 7 des Nutzers); Mondlicht nur als Streifen; Glocken von oben (Saat für Gilberts Frage im Heimweg); Menschen hinter den Läden (Jagdnacht); die Laterne erntet „Noch nicht“ von der Laterne vor der Klinik.
-> betreten("unterstadt") ->
Hier unten, in dem, was man oben in Yharnam die Unterstadt nennt, sind die Häuser aus einem dunkleren Stein gebaut, den der Regen vieler Generationen glatt geschliffen hat, und sie rücken so dicht zusammen, dass sich ihre Traufen über den Gassen berühren. Vom Mond findet nur ein einziger Streifen herunter, durch einen Spalt zwischen zwei Dächern, und liegt hoch oben an einer Hauswand, ein bleiches Viereck mit scharfen Kanten, in dem jeder Riss im Putz zu sehen ist. Wasser läuft hier überall, in Rinnen, über die Stufen, aus den Fugen der Mauern, und sein Geräusch hört nicht auf, auch dann nicht, wenn du stehen bleibst und den Atem anhältst. An einer Hausecke wächst ein einzelner Baum, verkrüppelt und schwarz, mit drei Blättern daran. # bild: unterstadt # stimmung: spannung
Wo die Gasse in Stufen abfällt, sieht man über die letzten Dächer hinweg auf einen Friedhof, und jenseits davon, hoch über den Gräbern, steigt eine schmale Treppe an der Felswand empor bis zu einem Tor, von dem man hier unten nur den dunklen Bogen erkennt. Dahinter, sagt man in Yharnam, liege der Bezirk der Kathedrale, in dem die Heilende Kirche wohnt, und wer in der Unterstadt geboren ist, kennt diese Treppe sein Leben lang nur von unten. Bisweilen kommen von dort oben Glocken herab; hier unten langt von jedem Schlag nur der tiefe Teil an, und das Wasser deckt den Rest zu. # lore: heilende_kirche
Leer sind die Häuser nicht. Wo ein Laden nicht dicht schließt, kriecht der süße, stickige Rauch des Räucherwerks heraus, und hinter einer Tür, an der du vorbeigehst, schabt ein Riegel einmal hin und wieder zurück, so wie man nachsieht, ob er noch hält.
// [ERWEITERT] Einsicht kostet leise: Ab 2 hört man, was nicht da ist (einmal).
{ einsicht >= 2: Hinter einem Fenster ruft jemand deinen Namen, {name}, zweimal, leise und freundlich, so wie man zum Essen ruft. Das Fenster ist von außen zugenagelt, und die Nägel sind alt. }
// Die Laterne (feste Schwelle zum Traum, kein Speicherpunkt). Vor der Klinik flackerte ihr Licht und trug nirgendwohin („Noch nicht“, a_ankunft); hier steht es still, in der Farbe des Traumhimmels.
Unten an den Stufen steht auch hier eine Laterne auf ihrem eisernen Pfahl, das Glas verrußt. Kaum streifen deine Finger das Eisen, flammt sie auf, und die Erde um den Pfahl wölbt sich: Die Boten kriechen heraus, ein halbes Dutzend, mehr als vor der Klinik, und neigen die tönernen Köpfe vor dir, alle zugleich. Diesmal flackert nichts. Kalt und weiß und still steht die Flamme hinter dem Glas, in der Farbe des Himmels über dem Garten, und mitten im Moder der Unterstadt riecht es nach Leinen. # lore: laternen
- (wahl)
// WARUM: Heilt in Ruhe, ohne Gegenschlag. Nötig ist es hier nicht, weil der Traum gleich danach Leben und Ampulle ohnehin auffüllt; die Option bleibt für den vorsichtigen Spieler und verrät die Regel nicht.
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl
// WARUM: Der einzige Weg weiter: Die Laterne führt in die zweite Traumszene (Gehrman, Übung im Hof). Keine Falle; der Spieler gibt sich dem Licht hin, das vor der Klinik noch „nirgendwohin“ trug.
+ [Die Hand flach auf das Glas legen #fliesst]
    Flach liegt deine Hand auf dem kalten Glas, und hinter den geschlossenen Lidern suchst du den Garten: das Gras im Nacken, den Geruch von Leinen, das Licht, das oben im Haus immer brennt.
    -> k1_traum_zwei

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON lore:gegner/schwein, lore:figuren/maedchen-und-viola] Ratten, Krähen, Leichenbecken, das Riesenschwein. Ist das Mädchen draußen, frisst das Schwein es; es lässt dann ihr Band fallen, das am Kind weiß war und hier rot ist, getränkt (Festlegung G1).
// [ERWEITERT] Das Sprichwort vom Wasser (Ernte am Ausgang); der Leinenstreifen mit der Nummer am Handgelenk eines Toten (Stimme C im Ding: gezählt, nicht begraben); das Licht durch die Roste (Ü1: Mondlicht ohne Stufe, der Mond selbst bleibt oben).
// „Die Leiche beim Schwein“ (Spielgefühl des Originals, Entscheidung des Nutzers): das Ohr zuerst (Schmatzen, dann das Klirren), dann das Tier, dann was es frisst. [ERWEITERT] Der Tote mit Schürze und Schlüsselbund: das Ungeheuer an einer bürgerlichen Adresse (stil-1800 SZ-06). Keine Erklärung; beim Mädchen trägt nur der Fingerbreit Weiß am Knoten die Verbindung zur Schleife am Fenster (Lektorat k1_c_kanal 2).
-> betreten("kanal") ->
{ k1_c_kanal == 1:
    Unter der Stadt fließt eine zweite Stadt, aus Wasser und Dunkelheit gebaut, mit Gewölben so hoch und breit wie das Schiff einer Kirche und Simsen zu beiden Seiten, auf denen früher einmal jemand gegangen sein muss. Licht kommt nur durch die Roste oben im Scheitel, in bleichen Gittern, die auf dem Wasser liegen und mit jeder Welle zerbrechen. Das Wasser reicht dir bis an die Knie und ist so kalt, dass es nach wenigen Schritten nicht mehr schmerzt. Es trägt alles fort, was die Stadt nicht mehr haben will, und in den Gassen sagt man, es frage nicht, wem es gehört hat. # bild: kanal # stimmung: grauen
    Auf den Simsen sitzen Ratten mit Leibern so lang wie dein Unterarm und sehen dir zu, ohne zu fliehen. Krähen, die nicht auffliegen, hocken auf einem Haufen, den du für Lumpen hältst, bis eine von ihnen den Kopf hineinsteckt und an einem Faden zieht, der kein Faden ist. Dahinter öffnet sich der Kanal zu einem Becken, und in dem Becken liegen die Toten, Dutzende, aufgequollen, die Haut weiß und weich vom Wasser, und so ineinander verschränkt, dass ein Arm aus dem Haufen ragt, den du keinem von ihnen zuordnen kannst. Um ein Handgelenk ist noch ein Streifen Leinen geknotet, darauf in sauberer Kanzleischrift eine Nummer. Wer sie hergebracht hat, hat sie gezählt, nicht begraben. # lore: bestienseuche
    { herkunft == "ueberlebender": Zu Hause, im letzten Winter, lagen sie so in der Scheune hinter dem Gemeindehaus, als keiner mehr übrig war, der die anderen hätte begraben können. Dein Blick bleibt, wo er ist; er ist damals auch geblieben. }
}
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    ~ schwein = ""
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass, mit kurzen Pausen, in denen etwas knackt, und jedes Mal laufen kleine Wellen bis an deine Knie. Ein Schwein, oder es war einmal eines: doppelt so groß wie ein Ochse, das Fell voller Geschwüre, die Hauer gelb und rissig. Es hat den Kopf gesenkt und frisst. # bild: kanal_schwein # stimmung: grauen
    Neben ihm treibt ein Kleid im Wasser, das hell gewesen sein muss, und ein Schuh, nicht länger als deine Hand. Zwischen den Hauern hängt ein Band heraus, so lang, dass sein Ende auf dem Wasser liegt. Es ist rot und schwer bis an den Knoten; nur dort, wo es geknotet ist, hat sich ein Fingerbreit Weiß gehalten. # quest: maedchen_tot
    Deine Hand ist schon auf dem Weg zur Säge, bevor du sie losschickst.
}
{ schwein == "" and not maedchen_tot:
    Weiter hinten im Halbdunkel schmatzt es, schwer und nass, und dazwischen klirrt es hell, in kleinen Abständen, ein Ton, der nicht in ein Gewölbe voller Wasser gehört. Bis an den Bauch steht ein Schwein im Becken der Toten, doppelt so groß wie ein Ochse, die Hauer gelb und rissig, und frisst an dem, der zuoberst liegt. Es ist ein Mann in einer ledernen Schürze, das Gesicht nach unten, und an den Bändern der Schürze hängt noch sein Schlüsselbund; bei jedem Ruck des Schädels schlagen die Schlüssel aneinander. Irgendwo in der Stadt gibt es eine Tür, die jetzt niemand mehr aufschließt. # bild: kanal_schwein
}
// WARUM: Der Spieler stellt sich dem Tier. Drei Takte mit Gefahr; nur wer siegt, bekommt das Band, wenn das Mädchen hier liegt. Nicht falsch, aber teurer als der Weg an der Wand.
+ [Dem Schwein entgegenwaten #fliesst]
    Durch das Wasser, das sich gegen deine Knie stemmt, watest du ihm entgegen, und die Säge liegt dir schwer in der Hand.
    -> kampf
// WARUM: Vorsicht statt Kampf: kein Schaden, aber das Schwein lebt weiter (Echo in der Chronik), und wer das Band gesehen hat, lässt es in seinem Maul zurück.
+ [Dich an der Wand vorbeischleichen #fliesst]
    ~ schwein = "umgangen"
    An der Wand entlang, den Rücken am Schleim der Steine, eine Handbreit nach der anderen. Einmal hebt das Schwein den Kopf und zieht schnaufend die Luft ein, dorthin, wo du stehst, und dein Atem bleibt in der Brust, bis es wieder frisst.
    -> leiter

= kampf
~ kampfanfang = -> k1_c_kanal.kampf
# stimmung: kampf
- (t1)
// Anzeichen (Ü8): Die Augen folgen jedem Schritt bis zum Anlauf (früh ausweichen ist falsch, spät springen richtig); der Schädel ist das Härteste an ihm (von vorn stechen ist falsch).
Das Schwein hebt den Kopf aus dem Wasser und sieht dich an. Sein Schädel ist breit und flach wie eine Pflugschar; es senkt ihn, bis die Hauer die Oberfläche furchen, scharrt mit den Vorderhufen, dass es spritzt, und seine kleinen roten Augen folgen dir, wohin du auch trittst, genau so lange, bis es losrennt. # anzeichen: schwein_ansturm
{ gelernt ? schwein_ansturm: Deine Beine erinnern sich an das Gewicht dieses Schädels und halten still, solange die roten Augen dir folgen. }
// WARUM: Die richtige Antwort: Das Anzeichen sagt, dass die Augen nur bis zum Anlauf folgen. Wer bis zuletzt wartet, lässt es an sich vorbeirennen.
+ [Im letzten Moment nach rechts springen #fliesst]
    Erst als dir sein Atem heiß und faulig ins Gesicht schlägt, springst du nach rechts. Es donnert an dir vorbei gegen die Wand, und aus dem Gewölbe brechen Steine und klatschen ins Wasser.
    -> t2
// WARUM: Falsch und vorher erkennbar: Die Augen gehen mit, wohin du auch trittst, solange es noch nicht rennt.
+ [Sofort nach links ausweichen #fliesst]
    Nach links, sofort, und die roten Augen gehen mit, noch ehe es anläuft; der Schädel kommt hinterher und trifft dich an der Hüfte. Unter Wasser ist alles braun, und das Rauschen ist fort.
    ~ zuletzt = schwein_ansturm
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Belohnt, wer auf dem Dachweg das Jagdheft des Toten genommen hat: eine dritte sichere Antwort, in der das gezeichnete Wissen in den Körper geht.
+ {jagdnotizen} [Den Ansturm vorn mit der Schulter fangen #fliesst]
    Die Füße in den Schlamm unter dem Wasser gestemmt, die Schulter vor, so wie man ein Tor gegen den Sturm hält; so hat es der Tote auf dem Dach in sein Heft gezeichnet, Pfeil gegen Pfeil. Der Schädel trifft, das Wasser schäumt dir bis an die Brust, und du hältst. Das Schwein schiebt und quiekt, und als es zurückweicht, um neu anzulaufen, liegt seine Flanke offen. # notiz: staerke_genutzt
    -> t2
// WARUM: Mut am falschen Ort und erkennbar: Das Anzeichen zeigt den Schädel als Pflugschar, das Härteste, was auf dich zukommt.
+ [Stehen bleiben und nach vorn stechen #fliesst]
    Stehen bleiben, die Säge nach vorn: Sie trifft den Schädel und gleitet ab wie von Stein. Die Hauer reißen dir den Schenkel auf, und du fliegst rückwärts ins Wasser.
    ~ zuletzt = schwein_ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
// Anzeichen: Maul und Kopf reichen nach vorn und zur Seite, nicht über den Nacken (zurückweichen ist falsch, auf den Rücken richtig).
Schwerfällig wendet es sich im Wasser und reißt das Maul auf, und zwischen den Zähnen hängen noch Fetzen von dem, was es gefressen hat. Nach vorn und zur Seite bekommt es den Kopf herum, schnell genug; über den Nacken aber, wo die Borsten am dichtesten stehen und der Rücken breit und flach aus dem Wasser ragt, reicht sein Maul nicht hinauf. # anzeichen: biss
{ gelernt ? biss: Dein Arm erinnert sich an die Zähne und zieht sich an den Leib, und dein Blick geht über das Maul hinweg zu dem breiten Rücken. }
// WARUM: Die richtige Antwort: Das Anzeichen nennt die eine Stelle, die das Maul nicht erreicht.
+ [Auf seinen Rücken hinaufklettern #fliesst]
    An den Borsten hinauf, die hart sind wie Besenreisig und dein Gewicht halten; oben krallst du dich fest, während es sich bockend im Kreis dreht, und stößt die Säge zwischen die Schulterblätter, wieder und wieder, bis es unter dir in die Knie bricht.
    -> sieg
// WARUM: Falsch und erkennbar: Rückwärts bleibst du vor dem Maul, und das Wasser reicht dir bis an die Knie.
+ [Rückwärts durchs Wasser weichen #fliesst]
    Rückwärts, doch das Wasser ist zäh und das Schwein schneller. Seine Zähne schließen sich um deinen Arm.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
// WARUM: Heilt, aber im falschen Augenblick: Vor dem offenen Maul trifft es dich beim Setzen der Nadel (Regel der Ampulle).
+ {ampulle > 0} [Zurückwaten und die Ampulle stoßen #fliesst]
    So weit zurück, wie das Wasser dich lässt, die Ampulle schon in der Faust.
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
// Nach dem Sieg der nüchterne Fall (stil-1800 AB-02) statt des Aufsteigens der Echos (Blutechos entfallen, 2026-11-06).
Das Schwein sinkt auf die Seite, und um seinen Leib wird das Wasser dunkel, wie Tinte, die sich in einem Glas ausbreitet. Dann ist nur noch das Rauschen da. Auf dem Sims putzt sich eine Ratte.
{ maedchen_tot and not band:
    ~ band = true
    Zwischen den Hauern ziehst du das Band hervor. Es gibt nur zögernd nach, vollgesogen und schwer, rot bis an den Knoten, und das Weiß, das dort geblieben ist, deckt dein Daumen ganz. Du wickelst es dir um zwei Finger und steckst es ein. # notiz: rotes_band
}
-> leiter

= leiter
// Am Ende des Kanals: der Weg führt in die Unterstadt (die Leiter nach oben ist entfallen, es gibt keinen Rückweg). Der letzte Satz erntet das Sprichwort vom Wasser.
Wo der Kanal endet, steigen Stufen aus dem Wasser, schief und grün vom Schleim, hinauf in eine Gasse. Hinter dir rauscht das Wasser im selben Ton weiter und trägt fort, was man ihm gibt, ohne zu fragen.
-> k1_c_unterstadt

=== k1_c_eileen ===
// TITEL: Eileen über den Gräbern
// [ERWEITERT] Zweite und letzte Begegnung in Kapitel 1 (Festlegung G2). Sie beobachtet Gascoigne. Bereitet die Partnerschaft in Kapitel 2 vor (das Angebot kommt nur hier). Die Abzeichen an der Schnur sind unsere Erfindung.
// [KANON lore:figuren/eileen] Jägerin der Jäger; sie jagt Jäger, die dem Blut verfallen.
// Stimme Eileen: heiser, Sätze ohne Anlauf, Gegenfragen oder gar keine Antwort.
// Ü10 2026-11-06: Übergang vom Friedhof aufs Dach (vorher fehlte der Anlass). Ernte aus k1_c_graeber: Der schmale „Schornstein“ vor dem Mond war sie.
// Toter Zweig (bewusst, Ü9): Diese Szene folgt immer auf k1_c_graeber, darum ist gascoigne2 hier immer wahr; der else-Zweig und eileen_frage_offen (nie gesetzt) werden nicht erreicht.
-> betreten("eileen_graeber") ->
~ eileen_stufe = 2
Ein Stück Ziegel rutscht vom Dach der Totengräberhütte und schlägt neben dir ins Gras. Oben hat sich der schmalere der beiden Schornsteine bewegt. Über eine Regentonne und das morsche Vordach steigst du hinauf, und dort, zwischen moosigen Ziegeln, neben dem Schornstein, aus dem seit Jahren kein Rauch mehr kommt, sitzt {eileen_genannt:Eileen|die Frau im Federmantel} so reglos wie die Krähen unten auf den Grabsteinen. Als du die letzten Ziegel hinaufkommst, rückt sie ein Stück zur Seite, ohne den Schnabel vom Friedhof zu nehmen. # bild: daecher_eileen # stimmung: ruhig
{ eileen < 0:
    Sie sagt lange nichts. Dann, ohne dich anzusehen: „Geh. Das hier ist nichts für einen, der nicht weiß, wann man den Mund hält.“ # notiz: eileen_kalt
    -> k1_c_tor
}
// [ERWEITERT] Einsicht kostet leise: Eileen merkt es.
{ einsicht >= 2:
    Sie mustert dich, länger als nötig, und tippt sich mit einem Finger gegen die Schläfe der Maske. „Du siehst schon zu viel“, sagt sie. „Merkt man an den Augen. Wird nicht besser.“ # notiz: einsicht_eileen
}
{ gascoigne2:
    Ihr Schnabel zeigt auf das Tor mit dem Namen darüber. „Reingegangen“, sagt sie. „Nicht wieder rausgekommen.“ Sie zieht die Knie an. „Ich warte.“
- else:
    Mit dem Schnabel ihrer Maske zeigt sie hinunter ins Halbdunkel zwischen den Grabsteinen, wo sich ein großer Schatten in einem langen Mantel bewegt, gebückt, mit den Händen am Boden.{q_frau == 1: Die Schultern kennst du vom Platz am Scheiterhaufen.} Der Wind kommt vom Friedhof herauf, und er bringt etwas mit, das nicht nach Gräbern riecht, warm und ranzig. „Riechst du's?“, fragt sie. „Bis hier rauf.“
}
Sie greift nach der Schnur an ihrem Hals und dreht eines der Abzeichen ins Mondlicht, ein schlichtes aus Eisen, an einer Ecke verbogen. „Der hier hat an Stellen gelacht, wo keiner lacht. Drei Wochen vorher.“ Sie lässt es zurückfallen und sagt nicht, drei Wochen vor was. # lore: blutrausch # notiz: wie_jaeger_kippen
{ eileen_frage_offen and (q_frau == 1 or gascoigne2):
    „Der Pater“, sagt sie. „Jetzt gesehen?“
    ~ eileen_frage_offen = false
}
// WARUM: Fürsprache für den Freund. Eileen gibt kein Versprechen für immer, nur für diese Nacht (Kanon: Gascoigne stirbt durch die Hand des Jägers, nicht durch ihre); stärkt das Vertrauen leise (+1).
* {q_frau == 1 or gascoigne2} [„Lass ihn leben.“ #fliesst]
    ~ eileen = eileen + 1
    { q_frau == 1:
        „Lass ihn leben.“ Sie antwortet nicht, und so erzählst du ihr vom Platz am Scheiterhaufen und von dem Gruß, den er dir für seine Frau mitgegeben hat.
    - else:
        „Lass ihn leben.“ Du kennst ihn kaum; du weißt nur, dass er zwischen den Gräbern seinen eigenen Namen vor sich hin gesagt hat, um nachzusehen, ob er ihn noch hat.
    }
    Eileen schweigt so lange, dass unten eine Krähe zweimal den Grabstein wechselt. „Heute Nacht töte ich keinen“, sagt sie dann. „Aber ich bin hier.“ Nach einer Weile: „Hoffentlich lernst du nie, wozu.“ # notiz: eileen_bitte
// WARUM: Das Angebot der Partnerschaft. Nur hier kommt es zustande (+2); trägt in Kapitel 2, wenn man Gascoigne nicht vor ihr gewarnt hat (Kerben am Tor, k1_d_grab).
* [„Du musst das nicht allein machen.“ #fliesst]
    ~ eileen = eileen + 2
    „Du musst das nicht allein machen.“ Zum ersten Mal dreht sie den Schnabel nach dir, und die Abzeichen an ihrem Hals hängen still. „Nicht heute.“ Sie sieht wieder hinunter. „Oben. Im Bezirk der Kathedrale, vor der Kapelle. Wenn du dann noch willst.“ # quest: eileen_angebot
// WARUM: Die Antwort in ihrer eigenen Sprache: Schweigen. Sie teilt ihr Essen und fragt nach dem Namen (eileen_name); leise Nähe (+1) ohne Versprechen.
* [Schweigend neben ihr sitzen bleiben #fliesst]
    ~ eileen = eileen + 1
    ~ eileen_name = true
    Unten tropft Wasser in ein offenes Grab, und eine Weile ist das alles. Dann bricht Eileen ein Stück Dörrfleisch in zwei Hälften und reicht dir eine, ohne hinzusehen. Der Handschuh an ihrer Hand hat keine Fingerkuppen mehr, und die Finger, die daraus hervorsehen, sind schmal und voller alter Narben. „Name?“, fragt sie, kauend. Du sagst ihn ihr. Sie wiederholt ihn nicht, aber sie nickt, als lege sie ihn irgendwo ab, wo sie ihn wiederfindet.
- Sie steht auf, in einem Rascheln von Federn, und ist über den First verschwunden, ohne dass sich ein Ziegel rührt. # stimmung: ruhig
-> k1_c_tor

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON RK1 §10] Der Name Oedon über dem Tor (im Original Name des Gebiets; Bedeutung bleibt offen, Wissenssperre).
// [ERWEITERT] Der Friedhof der Unterstadt, die Inschrift über dem Tor, der Stein auf der Brust der Toten, die Totenbretter (Brauch nach europäischem Volksgut statt christlicher Kreuze, L4), der Damenhandschuh auf dem Grabstein (Violas Spur, ohne Deutung; lore:figuren/maedchen-und-viola: Viola ist offenbar zum Grab gelangt), das frische Grab des Bäckerjungen. Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren.
// [ERWEITERT] Der fehlende Zahn im Kamm der Spieluhr: Gascoigne summt genau den Ton, der ausfällt (Saat für n2_gascoigne).
// [KANON lore:figuren/gascoigne, lore:gegenstaende/jaeger-und-werkstatt] Seine Kleidung ist von Bestiengestank durchdrungen (Saat für den Kampf); sein Satz aus dem Rausch, dass Männer als Jäger fortgehen und als Bestien heimkommen (sinngemäß, eigene Worte).
// [ERWEITERT] Ü1: Der Mond steht hier zum ersten Mal frei über der Stadt, so nah, dass man seine Narben sieht (Stufe 3 von 4: Klinik, Brücke, Gräber, Heimweg). Die Schatten fallen vom Mond weg, auf den Jäger zu. Vor dem Mond die Hütte mit zwei „Schornsteinen“: der schmale ist Eileen (Saat für den Hinweis vor der Warnung, Ernte in k1_c_eileen).
// Stimme Gascoigne (kippend): ein Wort kehrt zu oft wieder (natürlich, lange, so eine Dummheit), Höflichkeiten fallen weg, die Anrede rutscht (Henryk statt deines Namens).
// Toter Zweig (bewusst, Ü9): q_frau ist seit dem Umbau immer 1 (Scheiterhaufen fest); der else-Zweig der Begrüßung und „Ihn leise ansprechen“ werden nicht erreicht.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Der Streifen Mondlicht hängt noch an derselben Hauswand, scharf begrenzt, keinen Fingerbreit gewandert, so lange du auch fort warst. # bild: graeber # stimmung: grauen
    Wo die Gassen enden, beginnt der Friedhof, ohne Mauer und ohne Pforte, als habe die Stadt an dieser Stelle aufgehört, für die Lebenden zu bauen. Die Grabsteine stehen schief und moosig und so dicht, dass man nicht zwischen ihnen hindurchkommt, ohne auf einen Namen zu treten; dazwischen steinerne Gestalten in Kapuzen, denen jemand die Gesichter abgeschlagen hat, und Totenbretter, auf denen die Verstorbenen bis zum Begräbnis lagen und die man danach beschriftet ins Kopfende steckt, manche mit einem Hufeisen daran. Auf vielen Gräbern liegt ein flacher Stein, genau dort, wo unter der Erde die Brust des Toten sein muss; so hält man es hier, damit liegen bleibt, wer begraben ist.
    Über dem Friedhof decken keine Traufen mehr den Himmel zu, und da steht der Mond, tief über den hintersten Gräbern, so groß und so nah, dass du auf seinem bleichen Gesicht die Narben erkennst, wulstige alte Ränder, wie die Pocken sie in einer Wange zurücklassen. Um ihn liegt ein Hof im Dunst. Jeder Grabstein wirft einen Schatten, schwarz und scharf, und alle Schatten zeigen auf dich. Am Rand, vor dem hellen Rund, steht die Hütte des Totengräbers, und auf ihrem Dach ragen zwei Schornsteine auf, ein breiter und ein schmaler.
    Auf einem der Steine, einem kleinen mit einem Kranz aus gemeißeltem Efeu, liegt ein Damenhandschuh aus grauem Ziegenleder, glattgestrichen, die Finger nebeneinander, so ordentlich hingelegt, als wolle die Besitzerin gleich zurückkommen und ihn holen. Er ist trocken. Alles andere hier ist nass. # notiz: viola_handschuh
    Am Ende des Friedhofs steht ein schmiedeeisernes Tor in einem Bogen aus schwarzem Stein, und über dem Bogen ist ein einziges Wort gemeißelt: Oedon. Kein Vorname, keine Jahreszahl, kein Gebet.{ herkunft == "gelehrter": In keinem der Bücher über diese Stadt stand dieser Name, und du hast alle gelesen, die man draußen bekommt.} Deine Lippen formen den Namen, ehe du es willst. # lore: oedon
    { einsicht >= 1: Für einen Atemzug antwortet etwas. Keine Stimme, nur ein Druck hinter den Ohren wie vor einem Gewitter, das nicht vom Himmel kommt. }
}
~ gascoigne2 = true
~ fr_frei_machen(fr_kippen)
Zwischen den Gräbern kniet ein Mann, und er kniet nicht zum Beten. Vor ihm steckt ein helles, neues Totenbrett in aufgeworfener Erde, mit Kreide beschriftet: Jonas, Bäckerlehrling. Beide Hände hat er in diese Erde gegraben, und er wühlt darin, beinahe zärtlich, die Unterarme dunkel bis an die Ellbogen von Erde und Blut; dabei summt er, zwei Töne, immer dieselben zwei. An seiner linken Hand glänzt zwischen der Erde ein schmaler Ring, und das Fleisch des Fingers wölbt sich zu beiden Seiten darüber.{q_frau == 1: Um seinen Hals hängt ein Priesterschal, den du kennst, und seine Enden sind schwarz geworden und steif.} # lore: blutrausch # stimmung: grauen
Der Wind dreht, und sein Geruch kommt herüber, stärker als die Gräber: nasses Fell in einem verschlossenen Flur, Tage nach dem Regen.
{ q_frau == 1:
    Er hebt den Kopf, als er dich hört, und eine lange Weile ist in seinem Gesicht gar nichts, kein Erkennen, nur der Verband und der offene Mund. Dann, einen Atemzug zu spät, lächelt er. {gascoigne_name:„Henryk. Nein. Nein, nein. Du bist … {name}. {name}. Natürlich.“|„Ah. Der Fremde. Der Fremde vom Feuer. Natürlich, natürlich.“}
- else:
    Er fährt herum, die Axt schon erhoben, und hält dich für eine Bestie, bis du sprichst. Die Axt sinkt, sehr langsam. „Gascoigne“, sagt er, zu sich selbst, so wie man in der Tasche nach einem Schlüssel tastet, um sicher zu sein, dass er noch da ist. # lore: gascoigne
}
{ gascoigne_verraten:
    ~ gascoigne = gascoigne - 2
    Er zieht die Luft ein, einmal, zweimal, und das Lächeln verschwindet. „Federn“, sagt er. „Du riechst nach Krähe.“ Er wischt sich die Hände am Mantel ab, gründlich, Finger um Finger. „Die Krähe weiß, wo ich bin. Natürlich weiß sie es.“
}
// WARUM: Der Weg der Freundschaft: das Kind gegen das Blut. Mit der Spieluhr die stärkste Antwort (zweimal +1) und die Saat für den Moment der Klarheit am Grab; ohne sie nur ein Wort, das er überhört.
* {q_frau == 1 or spieluhr or maedchen_gesehen} [Ihn an seine Tochter erinnern #fliesst]
    ~ gascoigne = gascoigne + 1
    -> tochter
// WARUM: Treue zu Gascoigne gegen Eileen. Er dankt es dir (+1), aber Eileen sieht es vom Dach (der schmale Schornstein vor dem Mond) und schließt dich aus (−2, keine Partnerschaft). Für Aufmerksame erkennbar: Eileen hat gesagt, dass sie Jäger jagt, und er selbst warnt davor, sich dazwischenzustellen.
* {eileen_stufe >= 1} [„Die Frau im Federmantel sieht dir zu.“ #fliesst]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    „Die Frau im Federmantel sieht dir zu.“ Er lacht, ein kurzes Lachen durch die Nase. „Eileen. Die Krähe. Die hat Henryk und mich schon lange im Auge. Lange, lange.“ Sein verbundenes Gesicht wendet sich zum Dach der Totengräberhütte hinauf, ohne zu suchen, geradewegs zu den zwei Schornsteinen vor dem Mond. „Und sie hat recht, verdammt, sie hat ja recht.“ Er klopft dir auf die Schulter, zu fest, und die Graberde an seiner Hand bleibt auf deinem Mantel. „Stell dich nicht zwischen sie und mich. Hörst du? Nicht dazwischen.“ # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
// WARUM: Die Frage nach Viola. Sie öffnet seine Lüge (heimgeschickt) neben dem trockenen Damenhandschuh; für die Freundschaft neutral, für den Aufmerksamen die Spur zu dem, was am Grab liegt.
* {q_frau == 1 or q_mutter >= 1} [„Wo ist deine Frau, Gascoigne?“ #fliesst]
    „Wo ist deine Frau, Gascoigne?“ Er wendet dir den Verband zu, als verstehe er die Frage nicht, dann lächelt er. „Zu Hause. Ich hab sie heimgeschickt. Ist mir nachgekommen, hierher, in so eine Nacht, so eine Dummheit, so eine Dummheit, und ich hab sie heimgeschickt.“ Während er das sagt, reibt er die Hände aneinander, um die Graberde loszuwerden, und sie wird nicht weniger. # notiz: viola_luege # stimmung: grauen
    -> warnung
// WARUM: Rückfall für einen Spieler ohne jedes Wissen über seine Familie (toter Zweig seit dem Umbau, q_frau ist immer 1).
* {q_frau == 0 and not spieluhr and not maedchen_gesehen} [Ihn leise ansprechen #fliesst]
    Ein paar Worte über die Nacht und die Gräber, mehr fällt dir nicht ein, und er hört zu, den Kopf schief gelegt wie ein Hund, der hinter deiner Stimme eine zweite hört.
    -> warnung
// WARUM: Selbstschutz statt Nähe. Kostet Freundschaft (−1), und er geht ohne Warnung durchs Tor. Kein Fehler, der bestraft wird, aber der kalte Weg.
* [Leise zurückweichen #fliesst]
    ~ gascoigne = gascoigne - 1
    Leise zurück, Schritt um Schritt, ohne ihn aus den Augen zu lassen. Er wendet dir den Verband nach und folgt dir nicht. Dann steht er auf, geht durch das Tor mit dem Namen darüber, und es schwingt hinter ihm zu und bleibt einen Spalt offen.
    -> k1_c_eileen

= tochter
{
- spieluhr:
    Die Spieluhr des Mädchens liegt dir schon in der Hand. Die Feder schnurrt unter deinen Fingern, und das Lied steigt zwischen den Gräbern auf, so klein, dass das Wasser hinter den Häusern es beinahe zudeckt. Gascoigne erstarrt. Seine Hände sinken in den Schoß, schwarz von der Erde des Bäckerjungen. In der dritten Zeile fällt ein Ton aus, dort, wo dem Kamm ein Zahn fehlt, und genau diesen einen Ton summt er in die Lücke, leise, und keinen anderen. Unter den Augen wird der Verband dunkel und feucht. Als das Lied endet, flüstert er einen Namen, den du nicht verstehst, und dann: „Die Kleine. Die Kinder. Die Kleine.“ # lore: spieluhr # stimmung: schoen
    ~ gascoigne = gascoigne + 1
    { band: In deiner Tasche liegt das Band, so wie du es aufgewickelt hast, und ist durch den Stoff hindurch kalt. }
- maedchen_gesehen:
    Vom Fenster am Brunnenplatz erzählst du ihm, von der kleinen Stimme hinter den Läden und der weißen Schleife am Riegel. Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
- else:
    „Die Kleine“, sagst du, „von der du am Feuer gesprochen hast.“ Er nickt, immer weiter, viel zu lange. „Die schläft“, sagt er. „Ich jag, damit sie schläft. Dafür. Nur dafür.“
}
-> warnung

= warnung
Er steht auf, einen Kopf größer als du, und so nah geht von ihm eine Hitze aus, die du durch den Mantel spürst. Mit der Axt deutet er auf das Tor mit dem Namen darüber. „Bleib weg vom Grab. Da drin ist meine. Meine Bestie. Ich jag sie schon so lange. So lange.“ Er wiegt den Kopf hin und her. „Gehen alle als Jäger los, weißt du. Alle. Und was dann heimkommt, klopft anders an die Tür.“ Dann legt er den Kopf schief, als lausche er einer Frage, die niemand gestellt hat. „Ich weiß nur nicht mehr, wie sie aussieht.“ # notiz: gascoigne_warnung
Er geht durch das Tor, und es schwingt hinter ihm zu und bleibt einen Spalt offen. Erst jetzt merkst du, dass du die ganze Zeit durch den Mund geatmet hast.
-> k1_c_eileen

=== k1_c_tor ===
// TITEL: Das Tor des Oedon
// Früher eine Option im Hub der Unterstadt; jetzt der feste Weg zum Nadelöhr. Letzte Gelegenheit, die Ampulle zu nutzen.
// Ü10 ausgeschrieben 2026-11-06 (vorher ohne Erzähltext): das aufgewühlte Grab des Bäckerjungen, Gascoignes Handabdrücke am Eisen (Ernte der Hände voll Erde und Blut), Stille hinter dem Tor, das Wasser im Rücken (Saat für „Hinter dem Tor hört das Wasser auf“ in n2_gascoigne). Kein Mond (Ü1: keine Stufe doppelt).
Vom Dach hinunter ist es leichter als hinauf. Der Friedhof liegt da, wie er lag, die Steine, die Bretter, die Schatten, die alle auf dich zeigen; nur auf dem Brett des Bäckerjungen ist die Kreide verwischt, mitten durch den Namen, von einer Hand, die sich beim Aufstehen daran gehalten hat. # bild: graeber # stimmung: spannung
Am Ende der Reihen wartet das Tor in seinem schwarzen Bogen, einen Spalt weit offen, so wie er es gelassen hat. An den Stäben, in der Höhe einer Schulter, kleben die Abdrücke zweier großer Hände, dunkel von Graberde und von etwas, das nicht trocknet. Durch den Spalt kommt kein Laut. Hinter dir läuft das Wasser der Unterstadt, wie es die ganze Nacht gelaufen ist, und jenseits der Stäbe steigen Stufen ins Dunkle; auf der untersten liegt ein Klumpen Erde, von einem Stiefel gefallen.
- (wahl)
// WARUM: Letzte ruhige Gelegenheit vor Gascoigne: Wer verletzt ist, heilt hier ohne Gegenschlag; im Kampf kostet dieselbe Ampulle einen Treffer.
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl
// WARUM: Der Weg ins Nadelöhr; es gibt kein Zurück. Die Hand auf seinen Abdrücken ist die letzte Berührung vor dem Kampf.
+ [Durch das Tor mit dem Namen gehen #fliesst]
    Deine Hand legt sich, wo seine lag, und das Tor mit dem Namen darüber gibt nach, lautlos in den Angeln.
    -> k1_n2_gascoigne
