// NACHBILD: der Tod als kurzer Rückblick im Traum (Entscheidung des Nutzers 2026-11-06, Entwurf von Claude).
//   1. Körper: wenige Sätze, wie man im Traumgarten erwacht.
//   2. Innerer Monolog: kurze, klare Sätze in der Du-Form, je Todesort zwei bis drei, dazu Zusätze je nach Entscheidung des Spielers.
//   3. Story-Fragment: Der Jäger setzt etwas zusammen. Es wird freigeschaltet (`fr_frei += …`) und beim nächsten Tod gespielt, immer NACH dem Monolog.
//      Was kein Tod abgerufen hat, kommt als Gedanke beim Einschlafen in der nächsten festen Traumszene (`traum_fragmente`).
//   4. Zurück an den Anfang des Kampfes oder Moments (`kampfanfang`). Kein Hub, keine Laterne, kein Handel.
// Alle Texte dieser Datei sind PLATZHALTER (knappe Sätze, die sagen, was da ist). Neu geschrieben wird mit dem Skill stil-1800.
// Fragmente sind Deutungen des Jägers, nie Tatsachen des Erzählers (CLAUDE.md: [Deutung] nur als Meinung). Wissenssperre Kapitel 1 beachten.

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
{ tode:
- 2:
    Weiße Blumen, dicht vor deinem Gesicht, so genau, dass du an jedem Blatt die feinen Adern siehst. Du warst tot. Dein Körper weiß es, so wie er einen Sturz noch kennt, wenn der Boden längst stillhält.
    { gehrman == 0:
        ~ gehrman_gesehen = true
        Am Weg sitzt ein alter Mann im Rollstuhl und sieht dir beim Aufstehen zu, ohne sich zu wundern. „Sterben kannst du hier nicht“, sagt er. „Nur aufwachen. Daran gewöhnt man sich. Mehr oder weniger.“ # lore: gehrman
    }
- 3:
    Wieder die Blumen, wieder das Gras im Nacken. Diesmal zittern deine Hände nicht einmal mehr. Die braune Tinte an deinen Fingerkuppen ist noch da. Du bist gestorben, und sie ist noch da.
    { puppe_wach:
        ~ puppe_daheim = true
        Die Puppe kniet neben dir im Gras und hält deine Hand. „Hier geschieht dir nichts“, sagt sie. „Hier bist du … daheim.“
    }
- else:
    {~Die Blumen kennen dich inzwischen. Wo du liegst, sind sie schon niedergedrückt, eine Mulde in deiner Form.|Diesmal erwachst du mitten in einem Wort, das du in der Stadt nicht mehr zu Ende gebracht hast. Hier hört es niemand.|Über dir liegt der Himmel des Traumes, elfenbeinfarben, und er hat sich nicht verändert, seit du zum ersten Mal hier lagst.|Gras im Nacken, Blumen unter den Händen, und an deinem Gürtel das vertraute Gewicht.}
}
{ neu_gelernt: Im Halbschlaf zuckt dein Körper, ein einziges Mal, genau so, wie er vorhin hätte zucken sollen. # notiz: gelernt }
{ altar_blatt and not blatt_erinnert:
    ~ blatt_erinnert = true
    Zwischen den Blumen kehrt das Blatt vom Altar zu dir zurück, nicht als Bild, nur als ein Satz, so fest in dich eingedrückt wie die Buchstaben in sein Papier: Bleibt die Quelle offen, bleibt die Nacht. # lore: ende_der_nacht
}
// --- Innerer Monolog (Platzhalter) ---
{ ort:
- "klinik":
    {&Die Diele knarrt vor dem Sprung. Das war die erste Lektion. Du hast sie nicht gleich verstanden.|Das Ding in der Klinik hatte einmal ein Hemd an. Du denkst daran, bevor du an den Kampf denkst.|Der Schlag kommt schwer, aber er kommt langsam. Das nächste Mal weißt du, wohin.}
- "scheiterhaufen":
    {&Sie sind Menschen. Menschen mit Gabeln und Fackeln. Das macht es nicht leichter.|Der Riese weint beim Rennen. Du merkst dir, wo die Lücke im Kreis war.|Der Mob kommt von zwei Seiten, aber nicht gleich schnell. Die enge Gasse hinter dir ist kein Fehler.}
    { feuer: Das Feuer in deiner Hand hast du vergessen. Oder du wolltest es vergessen. }
    { mob_verbrannt: Eine Frau mit Mehl an den Ärmeln. Du siehst sie noch. }
- "haus":
    {&Der Mann lacht beim Einatmen. Zwischen zwei Atemzügen ist Zeit.|Rechts steht der Schrank, schwer genug für eine Kugel. Du hättest ihn zuerst gesehen, wenn du hingesehen hättest.}
- "daecher":
    {&Der Schuss kam von hinten. Du hast nicht nach oben gesehen.|Ein alter Mann mit einer Schlafmütze. Er zählt Steine, und er trifft trotzdem.}
- "bruecke":
    {&Der lange Arm kam aus der Richtung, in die du gesehen hast. Du hast zu spät hingesehen. Das nächste Mal früher.|Das Kreischen kommt vor dem Schlag, nicht danach. Du hast die Ohren zu spät zugehalten.|Es ist größer, als ein Ding sein sollte, und es wächst, wenn du es zählst. Du hörst auf zu zählen.}
    { parade_quelle == "gascoigne": Warten, bis sie ausholt, hat er dir beigebracht. Du hast nicht gewartet. }
    { feuer: Das Feuer ist in der Tasche geblieben. Dumm. }
    { kleriker == "abgelenkt" or kleriker == "geflohen": Beim ersten Mal bist du gerannt. Sie hat es nicht vergessen. }
    { haus_zettel: Die Kirche hat diese Brücke gesperrt und das da oben gelassen. Das behältst du. }
- "kanal":
    {&Im Wasser kannst du nicht ausweichen. Das Wasser hält deine Beine fest und lässt die Sau los.|Zwischen den Toten schmatzt es. Du hättest dich an der Wand vorbeischieben können. Du wolltest nicht.}
    { maedchen_wo == "fort": Das Band in ihrem Maul. Du hast sie fortgeschickt. Das ist dein Teil daran. }
- "grab":
    {&Er hat gelacht, bevor die Axt kam. Er lacht an den falschen Stellen.|Der Griff kommt aus der Drehung. Du hättest vorher nach unten gehen müssen.|Die Axt wird länger, wenn er sie schwingt. Das Zählen hilft nicht.}
    { spieluhr: Die Spieluhr in deiner Tasche. Er hört ihr zu. Das ist die Lücke. }
    { gascoigne >= 2: Das Warten hat er dir beigebracht. Jetzt wartet er auf dich. }
    { gascoigne_verraten: Die Frau im Federmantel wartet auf dem Dach. Du hast ihr den Weg gezeigt. }
    { feuerwaffe == "donnerbuechse": Dein Trichter und seiner. Ihr tragt dieselbe Waffe, und er kann besser damit umgehen. }
    { mantel_gelogen: Du hast ihn wegen des Mantels belogen. Er hat nichts gesagt. Er hat es gerochen. }
- else:
    {&Flucht ist auch eine Entscheidung. Sie war nicht billig.|Du liegst, wo du gelaufen bist. Das merkst du dir.}
}
{ tode >= 6: Wie oft noch. Du fragst nicht, wer zählt. }
// --- Story-Fragment, immer als Letztes ---
{ fr_offen():
    -> naechstes_fragment ->
}
{ ampulle == 0: An deinem Gürtel hängt die Ampulle wieder. }
~ ampulle = 1
~ leben = LEBEN_MAX
Dann zupft etwas an deinem Ärmel, und die Stadt kehrt zurück: der Geruch zuerst, dann die Geräusche, zuletzt die Kälte.
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

// In den festen Traumszenen: alles, was kein Tod abgerufen hat, als Gedanken beim Einschlafen.
=== traum_fragmente ===
{ not fr_offen(): ->-> }
Beim Einschlafen setzt du zusammen, was du in dieser Nacht gesehen hast, wie man Scherben auf einen Tisch legt. # stimmung: ruhig
- (schleife)
-> naechstes_fragment ->
{ fr_offen(): -> schleife }
->->

=== frag_blut ===
// PLATZHALTER. Freigeschaltet bei Gilbert.
Das Blut der Klinik hat dir das Fieber genommen, von einem Tag auf den anderen. Hinter dem Gitter hustet ein Mann, der dasselbe Blut genommen hat. Was hat es dafür bekommen? # notiz: fragment_blut
->->

=== frag_menschen ===
// PLATZHALTER. Freigeschaltet bei Gilberts Bericht über die Jagdnacht oder am Scheiterhaufen.
Wenn die Bestien einmal Menschen waren, ist jede Jagd ein Mord an Nachbarn. Und die Nachbarn tragen Fackeln, und sie trauen dir nicht. # notiz: fragment_menschen
->->

=== frag_kirche ===
// PLATZHALTER. Freigeschaltet am Anschlag oder im dunklen Haus. Deutung des Jägers, nicht des Erzählers.
Die Kirche gibt das Blut aus. Die Kirche hängt Anschläge an die Türen. Die Kirche sperrt die Brücke. Sie weiß mehr, als sie schreibt, und was hat sie getan, dass sie es so weit hat kommen lassen? # notiz: fragment_kirche
->->

=== frag_ich ===
// PLATZHALTER. Freigeschaltet bei der Kleriker-Bestie. Noch keine Auflösung (Wissenssperre).
In der Haut der Bestie sitzen Nadelnarben, Reihe an Reihe. Du reibst dir die Armbeuge. Was passiert mit dir, wenn du genug davon hast? # notiz: fragment_ich
->->

=== frag_nacht ===
// PLATZHALTER. Freigeschaltet vor der Brücke. Die Sonne hängt, wo sie hing.
Die Sonne hängt dort, wo sie hing. Niemand in dieser Stadt spricht von einem Morgen. Du kannst nicht sagen, wie lange die Nacht schon dauert. Gibt es hier jemals einen Tag? # notiz: fragment_nacht
->->

=== frag_kippen ===
// PLATZHALTER. Freigeschaltet an den Gräbern.
Gascoigne lacht an den falschen Stellen und weiß seinen eigenen Namen nicht mehr. In deiner Armbeuge pocht es im Takt von Gilberts Husten. Wie lange noch, bis du lachst? # notiz: fragment_kippen
->->
