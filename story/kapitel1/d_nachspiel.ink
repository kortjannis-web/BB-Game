// KAPITEL 1, TEIL D: NACHSPIEL. Die Brosche, Eileens Spuren, das Mädchen, Gilbert, der Traum.
// Handgearbeitet 2026-11-05 nach docs/stimme.md und docs/umsetzung-faktencheck.md (Befunde d_nachspiel 1 bis 11, Übergreifend 5, 9, 10):
// Orte und Aufzeichnungen in Stimme A, Geschehen in Stimme B. Alle Optionen fließen in den Satz (#fliesst).
// Feinschliff 2026-11-05 nach docs/lektorat-kapitel1.md und docs/umsetzung-lektorat.md (L1 bis L6): Fortsetzungen beginnen mit dem, was geschieht; Spieluhr mit eigenem Ton (der fehlende Ton).
// Überarbeitung 2026-11-06, Text für Text nach docs/ueberarbeitung-kapitel1.md (Ü1 bis Ü12) und Skill stil-1800 (Momente fund, rueckkehr, gespraech, abschied, traum, kapitelende, dokument, option):
//   Ü1 Mond statt Sonne (Heimweg: der Mond füllt die halbe Gasse aus; Chronik: der Mond als Siegel; der Traum ohne Gestirn); jede Option mit // WARUM;
//   Logik: Eileens Kerben werden erst unten erinnert (vom Sims aus kommt man nicht ans Tor), Gilberts „von der anderen Seite“ nur, wenn man das Tor gesehen hat, Nichtgewähltes in der Chronik nur, was stimmt;
//   das Kapitel endet auf dem letzten Satz des Tagebuchs: wörtliches Echo des Prologs („Es begann mit einer Kutsche und mit einem Vertrag“), Öffnung in die Dauer (stil-1800 WE-07).
// Lore: lore/kapitel/kapitel1.md (Wissenssperre), lore/figuren/maedchen-und-viola.md, lore/figuren/gilbert.md, lore/figuren/eileen.md, lore/figuren/puppe.md, lore/orte/oedon-grab-und-kapelle.md, lore/gegenstaende/heilende-kirche.md.

=== k1_d_grab ===
// TITEL: Viola und die Brosche
// [KANON lore:gegenstaende/heilende-kirche] Nach Gascoignes Tod: Laterne am Grab und der Schlüssel zum Tor, das die Gruft des Oedon versperrt; dahinter liegt der Kathedralenbezirk (Kapitel 2). Den Schlüssel trägt Gascoigne bei sich.
// [KANON lore:figuren/maedchen-und-viola] Violas Leiche auf einem Absatz oberhalb der Kampfstelle, bei ihr die rote Brosche mit ihrem Namen.
// [OFFEN] Wer Viola getötet hat, sagt das Spiel nicht. Der Text lässt beide Lesarten offen (die Wunden; ihr Blick hinab auf die Kampfstelle).
// [ERWEITERT] Das Zeichen auf dem Schlüssel und am Schloss des Tores (zeigen statt sagen, wohin der Schlüssel führt); die Ketten über dem Tor (von unten in k1_hub_c nur als Bogen zu sehen); die Treppe, die am Tor vorbei auf das Dach führt.
// [ERWEITERT] Ihr zweiter Handschuh: Ernte des Damenhandschuhs aus grauem Ziegenleder auf dem Grabstein in k1_c_graeber, ohne Deutung. Das Umschlagtuch, mit dem man sie zudeckt (statt des eigenen Mantels, Lektorat 1.1 f).
// [ERWEITERT] Der Kringel am V: dieselbe Hand wie auf dem Zettel im Deckel der Spieluhr (k1_b_maedchen); nur gezeigt, der Leser zieht den Schluss.
// Ü1: Hier regnet es (Ende n2_gascoigne: „es regnet hinein“); der Mond erscheint erst auf dem Heimweg wieder, auf seiner letzten Stufe.
An der Friedhofsmauer brennt eine Laterne, die vorhin nicht brannte. Ihr Schein reicht bis zu dem, was von {kennt_gascoigne():Gascoigne|dem Mann mit dem Verband} übrig ist, und dort, wo der Mantel am Saum aufgerissen ist, liegt ein eiserner Schlüssel im nassen Gras, lang und grob geschmiedet, aus dem Futter gerutscht. In den Griff ist ein Zeichen geprägt: ein Kreis, durch den drei Striche laufen, die sich in der Mitte nicht treffen. Als du ihn aufhebst, zieht er dir den Arm nach unten. # lore: laternen # notiz: oedon_schluessel # bild: grab_oedon # stimmung: ruhig
Hinter der Stelle, an der ihr gekämpft habt, steigt eine steinerne Treppe an der Friedhofsmauer hinauf, schmal und in der Mitte ausgetreten, wie man sie in alten Städten für Totengräber und Glöckner baut und für niemanden sonst. Oben endet sie an einem Tor aus grauen, verzogenen Bohlen, über die man Ketten gelegt hat, Lage um Lage, und wo die Ketten sich kreuzen, hält ein Schloss sie zusammen, in dessen Eisen dasselbe Zeichen geschlagen ist, der Kreis und die drei Striche. Über das Tor hinweg steigt die Stadt weiter an, Dach über Dach, bis zu den Türmen, von denen vorhin der Gesang herabkam.
Du steigst hinauf, Stufe um Stufe, langsamer, als die Beine müssten. Kurz unter dem Tor zweigt ein Sims ab, hinaus auf ein flaches Dach über dem Friedhof, und über die Kante des Daches hängt ein Saum aus dunklem Stoff, so schwer vom Regen, dass der Wind ihn nicht bewegt.
Auf dem Dach liegt eine Frau. # notiz: gascoigne_schicksal # lore: familie_gascoigne # stimmung: grauen
Sie liegt auf der Seite, das Gesicht abgewandt, das Haar über den Stein gebreitet, und vom Sims aus könnte man meinen, sie habe sich nur hingelegt, um auszuruhen. An der linken Hand trägt sie einen Handschuh aus grauem Ziegenleder. Die rechte ist nackt. Über dem Herzen steckt eine große Brosche, rot wie ein frischer Tropfen, und in die goldene Fassung ist ein Name graviert: Viola. Das V macht einen kleinen Kringel nach links.
Die Wunden sind breit und tief, zu breit für eine Klinge, zu ordentlich für Zähne.
// G1: Die Erinnerung ist weiß, erst der Fund beim Schwein ist rot.
{ q_mutter >= 1: Ein Fenster am Brunnenplatz, ein weißes Band am Riegel, eine kleine Stimme, die alles richtig gemacht hat. }
// WARUM: Der Spieler hält das Wort, das er Gascoigne am Scheiterhaufen gegeben hat, auch wenn niemand mehr zuhört; Treue über den Tod hinaus. Öffnet am Fenster des Mädchens einen Satz, der das Weinen nicht aufhält (gruss_ausgerichtet).
* {q_frau == 1} [Ihr ausrichten, was er dir aufgetragen hat #fliesst]
    ~ gruss_ausgerichtet = true
    Neben ihr auf den Knien, so nah an ihrem Ohr, wie man es bei Schlafenden tut: „Er kommt bald. Du sollst bei der Kleinen bleiben.“ Der Wind hebt eine Strähne ihres Haares und legt sie wieder hin.
    -> brosche_wahl
// WARUM: Zärtlichkeit gegenüber einer Fremden; wer ihr ins Gesicht sieht, findet die offene Frage des Kanons: Ihr letzter Blick geht hinab auf die Kampfstelle.
* [Ihr das Haar aus dem Gesicht streichen #fliesst]
    Das Haar klebt ihr an der Wange, kalt und schwer vom Regen, und ein paar Strähnen bleiben an deinem Handschuh hängen. Ihre Augen sind halb offen. Sie sehen über die Dachkante hinab, dorthin, wo ihr gekämpft habt.
    -> brosche_wahl
// WARUM: Scheu und Schuld: Man wagt nicht, sie anzufassen. Zeigt das Blut an der eigenen Säge neben ihrer nackten Hand, ohne zu sagen, wessen Blut es ist.
* [Stumm neben ihr stehen bleiben #fliesst]
    Die Säge hängt dir noch in der Hand. Das Wasser läuft dir aus dem Haar in den Kragen, und von den Zähnen der Säge tropft es auf den Stein neben ihrer nackten Hand, dunkler als Regen.
    -> brosche_wahl

= brosche_wahl
// WARUM: Der Beweis für das Kind. Wer ihn nimmt, kann ihr am Fenster die Wahrheit in die Hand legen (Kanon: dann geht sie fort und stirbt) oder ihn behalten; wer an ihre Warnung „dann geh ich selber“ denkt, sieht die Gefahr schon hier.
* [Die Brosche an dich nehmen #fliesst]
    ~ brosche = true
    Die Nadel sitzt fest im nassen Kleid und gibt erst nach, als du den Stoff mit zwei Fingern hältst, behutsam, als könne sie es noch spüren. In deiner Hand ist die Brosche warm, und dann nicht mehr. # notiz: brosche
// WARUM: Ehrfurcht vor der Toten; die Brosche bleibt bei ihr. Am Fenster bleibt dann nur die Wahrheit mit leeren Händen, die das Kind halb glaubt, oder eine Lüge.
* [Sie ihr lassen und sie zudecken #fliesst]
    Ihr Umschlagtuch ist ihr von den Schultern geglitten und liegt zusammengeschoben unter ihrem Arm. Du ziehst es hoch bis an ihr Kinn, über die Brosche, und das Rot verschwindet unter der nassen Wolle. Auf dem ganzen Dach leuchtet nichts mehr.
- -> abstieg

= abstieg
// Vom Sims aus liegt das Tor ein paar Stufen höher; man sieht es im Vorbeigehen, betritt es aber nicht (der Schlüssel gehört Kapitel 2).
Zurück auf der Treppe, ein paar Stufen unter dem Tor, siehst du noch einmal hinauf. Das Schloss hängt still in seinen Ketten. Auf dem Weg hinab schlägt dir der Schlüssel in der Tasche bei jeder Stufe gegen das Bein.
{ eileen_stufe >= 1 and eileen >= 0: -> eileen_spuren }
-> k1_d_heimweg

= eileen_spuren
// [ERWEITERT] Keine dritte Begegnung (G2, Entscheidung des Nutzers: zwei in Kapitel 1). Eileen war hier, während du auf dem Dach warst; zu sehen ist nur, was sie zurückgelassen hat, und der Spieler liest es selbst.
// Dank (verraten): Abzeichen und eine heile Feder. Bruch (gewarnt): eine geknickte Feder. Partnerschaft: zwei Kerben am Tor; das Angebot selbst kommt nur aus k1_c_eileen.
// [KANON lore:figuren/eileen] Die Abzeichen an der Schnur um ihren Hals (k1_b_eileen): Ernte des Messingabzeichens.
// Die Feder ist trocken wie Violas Handschuh an den Gräbern: eben erst hingelegt.
// stil-1800 SZ-03 (der Eindruck, den man rückwirkend bemerkt): Die Kerben hat man oben gesehen, ohne darauf zu achten; erst unten kommen sie zurück.
{ not gascoigne_gewarnt and eileen >= 2:
    ~ eileen_partner = true
    Erst unten kommt dir zurück, was du oben im Holz des Tores gesehen hast, ohne darauf zu achten: zwei frische Kerben in der Höhe eines Gesichts, eine dicht neben der anderen, schmal und spitz, wie ein Schnabel aus Stahl sie schlägt, und darunter auf der Stufe ein paar helle Späne. # quest: eileen_partner
}
{
- gascoigne_gewarnt:
    Unten bei dem Toten liegt eine schwarze Feder auf seiner Brust. Sie ist in der Mitte geknickt, so dass die Spitze zur Seite hängt. Als du hinaufgestiegen bist, lag dort nichts. # notiz: eileen_bruch
- gascoigne_verraten:
    Unten bei dem Toten liegt ein schlichtes Abzeichen aus Messing an einem kurzen Stück Schnur, sauber abgeschnitten, und daneben eine schwarze Feder, glatt und unversehrt. Vorhin lag beides nicht dort, und das Gras ringsum ist nicht zertreten. # notiz: eileen_dank
- else:
    Zwischen den Gräbern liegt eine schwarze Feder im nassen Gras, glatt und unversehrt. Sie ist noch trocken.
}
-> k1_d_heimweg

=== k1_d_heimweg ===
// TITEL: Heimweg (Akt IV, linear)
// Umbau 2026-11-06: kein Hub mehr. Reihenfolge: Mädchen (wenn sie noch wartet) → Kanalisation (wenn sie fort ist, nach der Brosche) → Gilbert (wenn du ihm den Bericht versprochen hast) → die erste Laterne in Zentral-Yharnam (Kapitelende). Eileens Spuren liegen am Grab, gleich nach Viola.
// [ERWEITERT, bewusste Abweichung vom Kanon auf Wunsch des Nutzers 2026-11-06, Ü1] Bei uns ist ab der Klinik Nacht, mit einem übergroßen, bleichen Mond, der nicht wandert und mit jeder Erwähnung näher kommt; hier seine letzte Stufe in Kapitel 1: Er füllt die halbe Gasse aus. Nie rot (der Blutmond gehört späteren Kapiteln).
// [KANON lore:kapitel/kapitel1, LK 9.7] Im Spiel ist Kapitel 1 die Mondphase Abend; der Sonnenuntergang beginnt erst nach Gascoigne beim Betreten der Oedon-Kapelle (Kapitel 2), die Nacht nach Amelia, der Blutmond nach Rom. Unsere Nacht von Anfang an weicht davon ab (siehe oben).
// [ERWEITERT] Die Stadt riecht etwas an dir (Echo auf Gascoignes „An dir noch nicht“); nur gezeigt, nie erklärt. Torf und Rauch: Gascoignes Geruch (Ü11), Saat für „Du riechst nach Papa“ am Fenster.
// [ERWEITERT] Einsicht: Der falsche Schatten fällt dem Mond entgegen (Ü1).
-> betreten("rueckweg") ->
{ k1_d_heimweg == 1:
    Der Rückweg führt durch dieselben Straßen, über dasselbe Pflaster und an denselben verriegelten Türen vorbei, und doch hat sich die Stadt verschoben, während du unten warst, so wie ein Zimmer, in dem jemand die Stühle gerückt hat, solange man schlief. Die Glocken schweigen.{k1_b_tueren: In der Gasse mit den Räucherlampen sind zwei Lampen ausgegangen, und keiner füllt sie nach; an der Tür, hinter der vorhin mehrere Stimmen lachten, lacht keine mehr.}{ alte_frau: Der Hund der alten Frau liegt vor ihrer Tür und hebt nicht einmal den Kopf.} # bild: zentral_yharnam # stimmung: grauen
    Hinter einer Tür, an der du vorbeigehst, zieht jemand die Luft ein, zweimal, tief durch die Nase. Schritte entfernen sich ins Innere des Hauses, und weiter hinten fällt eine zweite Tür zu. Am eigenen Ärmel riechst du Regen und Eisen, darunter Torf und Rauch, die nicht von dir sind, und unter allem etwas Warmes, das vorhin noch nicht da war.
    Am Ende der Gasse steht der Mond. Er steht an derselben Stelle über den Giebeln wie vor der Klinik, aber er ist herangekommen und füllt die halbe Gasse aus, bleich wie ein ausgekochter Knochen, so nah, dass du nicht mehr sagen kannst, ob er hinter den Dächern steht oder schon zwischen ihnen. Dein Schatten liegt lang hinter dir auf dem Pflaster und reicht bis an die Tür, hinter der eben jemand die Luft eingezogen hat.
    { kleriker == "abgelenkt" or kleriker == "geflohen": Von der Brücke herüber kommt ein Kreischen, lang und hoch, und reißt ab. Kein Hund in der ganzen Straße antwortet darauf. }
    { einsicht >= 3: Unter einer Traufe hängen lange, dünne Glieder an der Hauswand, mehrfach geknickt, und eines davon öffnet sich, als du vorbeigehst, so langsam, wie ein Schläfer im Traum die Hand öffnet. Sein Schatten fällt nicht vom Mond fort, sondern ihm entgegen, die Gasse hinauf. Hinter dir, als du weitergehst, tropft es. }
    { schuetze_verschont:
        Hinter dir in einer Gasse scharrt es, schwer und schnell, und noch bevor du dich umdrehst, kracht oben auf einem Dach ein Schuss. Vor deine Füße rollt ein Leib mit Fell und zu langen Armen und bleibt liegen, die Klauen im Pflaster. Hinter dem Schornstein sitzt der Alte mit der Schlafmütze, ein neues Gewehr über den Knien, kichert und legt einen Kiesel zu den anderen. # klang: schuss
    }
}
-> k1_d_heimweg_a

=== k1_d_heimweg_a ===
// Erste Station: das Fenster des Mädchens.
{ maedchen_wo == "zuhause" and q_mutter < 3: -> k1_d_maedchen }
-> k1_d_heimweg_b

=== k1_d_heimweg_b ===
// Zweite Station: die Kanalisation, wenn sie nach der Brosche fortgegangen ist (Kanon-Tragödie).
{ maedchen_wo == "fort" and not maedchen_tot: -> k1_d_kanal }
-> k1_d_heimweg_c

=== k1_d_heimweg_c ===
// Dritte Station: Gilbert.
{ q_gilbert == 1: -> k1_d_gilbert }
-> k1_d_heimweg_d

=== k1_d_heimweg_d ===
// Letzte Station: die erste Laterne in Zentral-Yharnam (k1_b_ankunft: „Gleich neben deiner Laterne“; Gilberts Fenster liegt bei ihr, lore:figuren/gilbert). Das Kapitel schließt, wo die Stadt begann. Die Ampulle kann man noch nutzen.
// [ERWEITERT] Bisher hieß es im Kommentar „Laterne am Grab“, im Text „eine Laterne am Weg“; der Heimweg führt aber in die Stadt zurück. Die Laterne am Grab bleibt Zeichen der Sicherheit nach dem Kampf (k1_d_grab).
Wo die Gasse auf die Straße mündet, an der Gilberts Fenster liegt, brennt die Laterne, an der du in die Stadt gekommen bist. Ihr Glas ist vom Regen beschlagen, und hinter dem Beschlag steht die Flamme still.
- (wahl)
// WARUM: Vorsicht vor dem Heimgehen: wer verletzt ist, kann sich in Ruhe heilen (kein Gegner, kein Risiko). Im Traum wird ohnehin alles wieder voll; die Option prüft nur, ob man der Ampulle traut.
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Ampulle in den Schenkel stoßen #fliesst] -> ampulle_ruhig -> wahl
// WARUM: Der Schritt in den Traum und an das Kapitelende; kein Fehler möglich, nur das Ende der Nacht in der Stadt.
+ [Die Hand an ihr Glas legen #fliesst] -> k1_d_traum

=== k1_d_maedchen ===
// TITEL: WEICHE: Was sagst du dem Mädchen?
// [KANON lore:figuren/maedchen-und-viola] Gibt man ihr die Brosche, weiß sie, dass die Mutter tot ist: Sie fragt, ob es wirklich die Mama war, und bittet, sie nicht allein zu lassen (LK §24.14, eigene Worte); später verlässt sie das Haus und stirbt in der Kanalisation durch das Schwein.
// [KANON] Behält man die Brosche, bleibt sie und sagt, der Morgen komme immer (sinngemäß, eigene Worte). Ab Kapitel 2 kann man sie zur Kapelle oder zur Klinik schicken (beides endet schlimm). Kein Ausgang rettet sie.
// [KANON lore:figuren/maedchen-und-viola] Die Spieluhr bekommt man auch nach Gascoignes Tod noch (LK §17.5, RK1 §6). Sie erkennt den Jäger am Geruch, nicht an der Stimme. Im Deckel ein Zettel mit den Namen Viola und Gascoigne.
// [ERWEITERT] Sie riecht ihren Vater an dir („nach Papa“; beim ersten Mal in k1_b_maedchen „wie Papa, wenn er spät heimkommt“); der Text erklärt es nicht. Die Saat liegt im Heimweg (Torf und Rauch am Ärmel).
// [ERWEITERT] Der Ton, der in der Melodie fehlt (Leitmotiv Spieluhr, Lektorat 1.3); das Kind summt ihn mit.
// [ERWEITERT] Wer ihre Warnung („dann geh ich selber“) ernst nimmt, behält die Brosche und gewinnt Zeit. Die Wahrheit ohne Brosche glaubt sie nur halb.
// Ü1: „Mama sagt, der Morgen kommt immer“ in einer Nacht, deren Mond nicht wandert; danach steht der Mond still über den Giebeln, ohne Kommentar.
// PRÜFEN: k1_b_maedchen setzt das Fenster in den ersten Stock, und doch gehen Spieluhr und Brosche durch die Läden von Hand zu Hand. Hier wird die Höhe nicht genannt; das Kind sagt nur „Bleib da stehen“.
// G1: Am Fenster ist das Band weiß.
// Stimme: schnell, ernst, zählt auf, was sie alles richtig gemacht hat.
{ maedchen_gesehen:
    Auf dem Brunnenplatz bewegt sich nichts als das weiße Band am Riegel, das im Zug gegen die Läden schlägt, und im Fenster ist das Räucherwerk bis auf einen Fingerbreit heruntergebrannt. Noch bevor du unter dem Fenster stehst, sind die vier kleinen Finger zwischen den Läden. „Du riechst nach Papa“, sagt sie. Ihre Stimme ist leiser als beim ersten Mal. # bild: brunnenplatz # stimmung: ruhig
    Deine Hand legt sich flach auf den Ärmel.
    { q_mutter == 0: „Hast du meine Mama gesehen?“ | „Hast du Mama gefunden?“ }
- else:
    ~ maedchen_gesehen = true
    Hinter einem Tor liegt ein kleiner Platz mit einem versiegten Brunnen, und aus einem der Fenster kommt die Melodie einer Spieluhr, {k1_n1_kleriker.mit_gascoigne:ein Lied, das du heute Nacht schon einmal gehört hast, gesummt, zwischen Axthieben|ein Lied, dessen erste Töne Gascoigne dir am Scheiterhaufen vorgesummt hat, und es macht dir den Hals eng}; an derselben Stelle fehlt darin jedes Mal ein Ton. Um den Fensterriegel ist ein weißes Band geknotet, eine große Schleife, wie kleine Mädchen sie im Haar tragen. # bild: brunnenplatz # stimmung: ruhig # lore: familie_gascoigne
    Die Melodie bricht ab. Hinter den Läden zieht jemand die Luft ein, kurz und prüfend, und im Spalt erscheinen vier kleine Finger, dann zwei sehr ernste Augen. „Du riechst nach Papa.“
    Deine Hand legt sich flach auf den Ärmel.
    Sie holt Luft. „Hast du meine Mama gesehen? Sie hat eine große rote Brosche, die sieht man von Weitem. Papa ist auf die Jagd gegangen und nicht wiedergekommen, und Mama ist ihn suchen gegangen, und ich hab die Tür zugemacht, so wie sie gesagt hat.“
}
{ not spieluhr:
    ~ spieluhr = true
    Am Fensterbrett schabt Holz, und durch den Spalt schiebt sich eine kleine Spieluhr, kaum größer als deine Handfläche. „Die ist von Papa. Wenn du ihn triffst, zieh sie auf. Dann weiß er wieder, wer er ist.“ Sie ist noch warm von ihren Fingern. Unter dem Deckel klebt ein Zettel mit zwei Namen, Viola und Gascoigne, und das V macht einen kleinen Kringel nach links. # lore: spieluhr
}
{ versprechen_gascoigne: -> vater }
-> weiche

= vater
// [ERWEITERT] Nur, wenn Gascoigne im Moment der Klarheit um etwas gebeten hat („Sag ihr, das Lied weiß ich noch“).
// WARUM: Der Spieler löst sein letztes Versprechen an Gascoigne ein und gibt dem Kind das Einzige, was vom Vater blieb; die wärmste Stelle des Akts, ohne die Wahrheit über die Mutter vorwegzunehmen.
* [Ihr sagen, ihr Vater wusste das Lied #fliesst]
    ~ maedchen = maedchen + 2
    „Dein Papa wusste das Lied noch“, sagst du, „als er sonst nichts mehr wusste. Er hat an dich gedacht.“ Hinter den Läden kommt lange nichts, so lange, dass du glaubst, sie sei gegangen. Dann summt sie die Melodie, Note für Note, ein wenig zu langsam, so wie man summt, damit ein anderer mitkommen kann, und wo der Spieluhr der Ton fehlt, summt sie ihn. # notiz: maedchen_lied # stimmung: schoen
// WARUM: Schonung oder Feigheit, beides ist möglich: Durch einen Fensterspalt sagt man einem Kind nicht, dass sein Vater tot ist. Kein Fehler, aber das Lied bleibt ungesummt.
* [Seine Worte für dich behalten #fliesst]
    Sie bleiben, wo sie sind, hinter deinen Zähnen. Durch einen Fensterspalt reicht man so etwas nicht.
- -> weiche

= weiche
// WARUM: Die Wahrheit mit Beweis. Für Aufmerksame als falsch erkennbar: Sie hat beim ersten Mal gesagt, sie gehe selbst suchen, und sie bittet jetzt, nicht allein gelassen zu werden; die zwei Riegel sind die Folge (Kanon: Sie stirbt in der Kanalisation).
* {brosche} [Ihr die Brosche geben #fliesst]
    ~ q_mutter = 3
    ~ maedchen_wo = "fort"
    Durch den Spalt zwischen den Läden passt sie gerade so; das Gold schabt am Holz, und eine kleine Hand nimmt sie dir ab. Lange kommt nichts. Dann, so leise, dass du näher an die Läden treten musst: „War das wirklich Mama?“ Du nickst, obwohl sie es durch die Läden nicht sehen kann. „Geh nicht weg“, sagt sie. „Bleib da stehen, ja? Nicht du auch noch.“ # quest: maedchen_fort # stimmung: grauen
    Sie weint, so gleichmäßig wie jemand, der es in vielen Nächten allein geübt hat.{ gruss_ausgerichtet: „Ich habe es ihr noch gesagt“, sagst du. „Dass er bald kommt.“ Das Weinen hört nicht auf.} Als es endlich aufhört, antwortet sie nicht mehr, auch nicht, als du an die Läden klopfst. Du bist noch keine zwanzig Schritte über den Platz, da hörst du hinter dir einen Riegel zurückgleiten, dann einen zweiten.
// WARUM: Ehrlichkeit ohne Beweis; sie glaubt es nur halb und bleibt im Haus, aber sie zündet das Räucherwerk neu an, als warte sie trotzdem. Hält sie am Leben, ohne sie zu belügen.
* {not brosche} [Ihr die Wahrheit sagen, mit leeren Händen #fliesst]
    ~ q_mutter = 7
    So einfach, wie es geht: „Deine Mama kommt nicht wieder.“ „Das stimmt nicht“, sagt sie sofort. „Das sagst du nur.“ Nach einer langen Weile, sehr leise: „Woher weißt du das?“ Du hast nichts in der Hand, das du ihr durch den Spalt reichen könntest. Die Finger ziehen sich zurück, aber die Haustür bleibt zu. Hinter den Läden schlägt sie Feuer, Stahl auf Stein, einmal und noch einmal, weil der Zunder nicht fängt, und bald riecht es wieder nach Räucherwerk. # quest: maedchen_wartet
// WARUM: Die barmherzige Lüge, wie der Kanon sie vorsieht (Brosche behalten, sie wartet); sie hält das Kind im Haus und lässt den Spieler mit der Lüge leben (Tagebuch). Mit der ewigen Nacht bekommt „der Morgen kommt immer“ sein Gewicht.
* [Ihr sagen, ihre Mutter komme bald #fliesst]
    ~ q_mutter = 4
    „Bald. Sie musste unterwegs nur noch etwas erledigen.“ Sie glaubt dir sofort. „Dann warte ich“, sagt sie. „Mama sagt, der Morgen kommt immer. Man muss nur lang genug wach bleiben.“ Über den Giebeln steht der Mond, bleich und reglos. # quest: maedchen_wartet
// WARUM: Ausweichen; der Spieler sagt nichts und lässt sie im Ungewissen. Sie bleibt, aber sie hört auf zu summen.
* [Unter dem Fenster stumm bleiben #fliesst]
    ~ q_mutter = 5
    Sie fragt nicht noch einmal. Die Finger verschwinden aus dem Spalt, und hinter den Läden kommt kein Summen mehr und kein Schritt; nur das Räucherwerk im Fenster glimmt weiter, dünner als vorhin. # quest: maedchen_wartet
- -> k1_d_heimweg_b

=== k1_d_kanal ===
// TITEL: Rückweg durch die Kanalisation
// Wer sie fortgeschickt hat (früh zur Klinik oder jetzt mit der Brosche), findet hier, was das Schwein getan hat.
// [KANON lore:figuren/maedchen-und-viola] Das Band ist durchtränkt von Blut (G1: erst hier rot). Was mit dem Kind geschah, sagt niemand; der Jäger sieht nur, was im Wasser treibt. Dass das Kind im Kanal starb, ist [Deutung] der Fans; der Text zeigt nur Schuh, Stoff und Band.
// [ERWEITERT] Im Kanon führt der Weg zur Klinik nicht zum Schwein (das Band erscheint dann nicht, das Kind endet später als Himmelswesen). Bei uns erreicht sie die Klinik nie: Sie bleibt an der Treppe zu den Kanälen stehen (k1_b_maedchen, fort). PRÜFEN beim Nutzer, ob diese Abweichung so bleiben soll.
// [ERWEITERT] Der Knoten ist noch weiß: Ernte des weißen Bandes am Riegel (G1, Ü11).
// [KANON lore:gegner/schwein] Das Schwein kehrt an seinen Ort zurück; ob es dasselbe ist, bleibt offen.
~ maedchen_tot = true
Unten riecht das Wasser nach Eisen und nach Stall. Von weiter vorn, wo der Gang sich biegt, kommt ein Geräusch, gleichmäßig und nass, das Mahlen eines vollen Mauls, und es setzt nicht aus, als deine Stiefel ins Wasser treten. # bild: kanal_schwein # stimmung: grauen
{schwein == "tot":Im Wasser steht wieder ein Schwein, doppelt so groß wie ein Ochse, dort, wo das andere stand, das du erschlagen hast, oder es ist dasselbe.|Im Kanal steht ein Schwein, doppelt so groß wie ein Ochse, bis an die Knie im Wasser.} Es frisst, und neben ihm treibt ein heller Stoff, ein kleiner Schuh. Aus seinem Maul hängt zwischen den gelben Hauern ein Band, rot und schwer, nur der Knoten ist noch weiß. # quest: maedchen_tot
{ q_mutter == 3:
    Im Wasser suchst du nach dem Gold der Fassung und findest es nicht.
- else:
    Die Treppe, an der vorhin ein kleiner Schatten stehen geblieben ist, führt hier herab.
}
// WARUM: Das Band mitnehmen heißt, die Folge der eigenen Wahl bei sich zu tragen (Chronik und Tagebuch nennen es; im Kanon trägt man es später zur Schwester).
* [Das Band an dich nehmen #fliesst]
    ~ band = true
    Es kommt leicht. Das Schwein gibt es her, satt und gleichgültig, ohne den Kopf zu heben. Nass, wie es ist, lässt sich das Band nicht glattstreichen; du steckst es zu dem Schlüssel{spieluhr: und der Spieluhr}. # notiz: rotes_band
// WARUM: Abwenden; man lässt dem Schwein, was es hat. Kein Fehler, aber das Schmatzen geht mit bis an die Stufen.
* [Ohne das Band weitergehen #fliesst]
    Hinter dir schmatzt es weiter, bis zu den Stufen und auch noch, als du auf ihnen stehst.
- -> k1_d_heimweg_c

=== k1_d_gilbert ===
// TITEL: Gilbert hören lassen, was hinter der Brücke liegt
// [ERWEITERT] Sein Versprechen bereitet seine Verwandlung in einem späteren Kapitel vor (Kanon: nach Rom, unter dem Blutmond). Hier nichts davon verbrauchen: kein Mond, kein Rot, nur die Bitte.
// [KANON lore:welt/notizen] G7: Die Kirche hat die Große Brücke gesperrt; bei uns ein Tor am Brückenende, von der anderen Seite verriegelt. Gilberts Deutung bleibt seine Meinung.
// Logik: Wer vor der Bestie in den Kanal geflohen ist, hat das Tor nie gesehen (n1_kleriker: bruecken_tor nur nach Sieg oder Ablenkung); dann reagiert Gilbert auf den Sturz statt auf das Tor.
// [KANON lore:figuren/gilbert] Er kann nicht aufstehen (LK §24.12): Er sitzt am Gitter.
// [ERWEITERT] Der Abschiedssatz geht einen Schritt weiter als „Aufschub“ in k1_b_gilbert: Er würde das Blut wieder nehmen (der Birnbaum als Maß).
// Stimme Gilbert: höflich, siezt, selbstironisch, fragt zurück; der Husten schneidet ihm die Sätze ab.
~ q_gilbert = 2
~ gilbert = gilbert + 1
Als du in die Gasse biegst, sitzt Gilbert schon am Gitter, den Stuhl so dicht ans Fenster gerückt, dass seine Knie gegen die Wand stoßen. Sein Husten kommt jetzt von tiefer, mit einem Reißen am Ende, und danach braucht er lange, bis er wieder sprechen kann. Mit dem Daumen hält er den Ring fest, damit er ihm nicht vom Finger rutscht. „Erzählen Sie“, sagt er. „Bitte. Was liegt dahinter?“ # bild: gilbert # stimmung: ruhig # quest: gilbert_bericht
Es wird ein kurzer Bericht, von der Brücke bis hinab in die Unterstadt, in der das Wasser nie aufhört zu laufen{k1_c_graeber:, bis zu den Gräbern und dem Namen über dem Tor}. {kleriker == "geflohen":Als du erzählst, wie du von der Brücke in den Kanal gestürzt bist, lacht er, und das Lachen wird zu einem Husten. „Hinunter statt hinüber“, sagt er, als er wieder Luft hat. „Das scheint in dieser Stadt der übliche Weg zu sein.“|Er hört zu, die Stirn ans Gitter gelehnt. Beim Tor am Ende der Brücke hebt er den Kopf. „Von der anderen Seite verriegelt?“, wiederholt er. „Dann wollte dort oben jemand nicht, dass man hinaufkommt. Oder dass von dort etwas herunterkommt.“} Er hustet. „Und die Glocken? Klingen sie da unten anders?“
„Da unten hört man sie nicht“, sagst du. Er nickt, und eine Weile ist nur sein Atem zu hören, nass und tief, mit dem Haken darin.
// WARUM: Vertrauen: Der Spieler teilt das Schwerste mit dem einzigen Menschen, der danach fragt. Öffnet Gilberts Bitte (Saat für ein späteres Kapitel).
* [Ihm vom Kampf am Grab erzählen #fliesst]
    Der Kampf am Grab, {kennt_gascoigne():Gascoigne, der Pater mit dem Verband,|der Mann mit dem Verband und dem Priesterschal} und was am Ende aus ihm geworden ist: Gilbert unterbricht dich kein einziges Mal, und danach sagt er lange nichts. „Und wenn es bei mir so weit ist?“, fragt er schließlich, und er lächelt schief, so wie beim ersten Mal am Gitter. „Holen Sie mich dann? Ich hätte gern, dass es jemand ist, der meinen Namen weiß.“
    // WARUM: Ein Versprechen an einen Sterbenden, das eine spätere Nacht einfordern wird; Treue mit Preis.
    ** [Es ihm versprechen #fliesst]
        ~ versprechen_gilbert = true
        „Ich hole Sie.“ Durch die Stäbe reicht er dir die Hand, die mit dem zu weiten Ring; sie ist heiß und so leicht, dass du sie kaum spürst, und er hält deine einen Atemzug länger, als ein Händedruck dauert. „Danke“, sagt er. # notiz: versprechen_gilbert
    // WARUM: Ehrlichkeit statt Trost: Man verspricht nichts, was man vielleicht nicht halten kann. Gilbert nimmt es an.
    ** [Ihm nichts versprechen #fliesst]
        Er wartet, und als nichts kommt, nickt er langsam, die Stirn am Eisen. „Ehrlich wenigstens“, sagt er. „Das ist in dieser Stadt schon viel.“
// WARUM: Schonung eines Kranken, dem dasselbe bevorstehen könnte; Gilbert hört die Lücke und fragt nicht nach. Keine Bitte, kein Versprechen.
* [Ihm das Grab ersparen #fliesst]
    Was am Grab geschehen ist, bleibt draußen vor dem Gitter. Gilbert merkt die Lücke; er neigt den Kopf, so wie man nach einem Geräusch horcht, das ausgeblieben ist, und fragt nicht nach.
- „Seien Sie vorsichtig mit dem, was die Kirche da oben verspricht“, sagt er zum Abschied. „Ich habe ihr Blut auch genommen, wissen Sie. Und wenn sie mir heute Nacht noch eine Ampulle durchs Gitter reichte, ich nähme sie.“ Er hustet, und als er wieder kann, sieht er an dir vorbei in die Gasse. „Daran denke ich jetzt öfter als an den Birnbaum.“ # lore: heilende_kirche
-> k1_d_heimweg_d

=== k1_d_traum ===
// TITEL: Kapitelende im Traum
// [KANON lore:figuren/puppe] Die Puppe ist mit der ersten Einsicht erwacht (spätestens jetzt). Ihr Gruß spricht sinngemäß von daheim (eigener Wortlaut).
// Ü1: Der Jägertraum hat in Kapitel 1 keinen Mond; der Mond der Stadt verblasst beim Übergang, darüber ein Himmel von der Farbe alten Elfenbeins, ohne Gestirn.
// Befund 5 und 10: Keine Bilanz, die erklärt, was die Szenen gezeigt haben. Die Chronik nennt die Tatsache (A, knapp, ohne Urteil); das Tagebuch sagt nur, was die Chronik nicht sagen kann: was die Nacht dem Ich getan hat (Lektorat k1_d_traum Nr. 3).
// Kapitelende: Chronik vor den Aufzeichnungen, damit das Kapitel auf dem letzten Satz des Tagebuchs endet. Keine ausgesprochenen Fragen (Lektorat Nr. 5, 6): der Mond als Siegel und „ich wusste nicht, worum ich bat“ (Saat: Der Mond sinkt nicht, er kommt näher; der Blutmond späterer Kapitel wird nicht genannt).
// stil-1800 WE-07: Der letzte Satz kehrt wörtlich zum Prolog zurück („Es begann mit einer Kutsche und mit einem Vertrag“, k1_prolog) und öffnet in die Dauer: Es ist noch Nacht, während der Jäger schreibt. PRÜFEN: Das Echo hängt am Wortlaut des Prologs; ändert er sich, hier nachziehen.
~ ort = "traum"
~ leben = LEBEN_MAX
~ ampulle = 1
Unter deiner Hand wird das Glas warm. Der Mond über den Giebeln wird blasser und blasser, und als er fort ist, steht über dir der Himmel des Traumes, von der Farbe alten Elfenbeins und ohne ein einziges Gestirn. Weiße Blumen, so weit der Hang reicht. Das Haus auf dem Hügel mit seinen erleuchteten Fenstern. In deinen Ohren läuft die Stadt noch eine Weile weiter, das Wasser in den Rinnen, die Riegel, der Gesang hinter der Mauer, und hört dann auf, eines nach dem anderen. # bild: traum # stimmung: ruhig
{ not puppe_wach:
    -> puppe_erwacht ->
    Sie löst sich vom Fuß der Treppe und geht ein paar Schritte, vorsichtig, wie jemand, der das Gehen erst wieder lernt. Ihr Blick bleibt an deinen Händen hängen, an der braunen Tinte an deinen Fingerkuppen. „Daheim“, sagt sie und probiert, wie das Wort schmeckt. # lore: puppe
- else:
    Die Puppe kommt dir entgegen, mit kleinen, vorsichtigen Schritten, und als sie vor dir steht, neigt sie den Kopf und sieht dir ins Gesicht. Auf dem Lack ihrer Wange liegt der Widerschein der erleuchteten Fenster. „Daheim“, sagt sie, als sei das die Antwort auf eine Frage, die du nicht gestellt hast. Was geschehen ist, fragt sie nicht. Ihr Blick bleibt an deinen Händen hängen, an der braunen Tinte an deinen Fingerkuppen, die nicht abgeht. # lore: puppe
}
Das Wort bleibt zwischen euch liegen. Keiner von euch hebt es auf.
Du setzt dich auf die Stufen vor dem Haus, und sie setzt sich neben dich, die Hände im Schoß gefaltet. Die Kälte des Daches geht dir aus den Fingern; der Schlüssel in deiner Tasche bleibt kalt. Als du ihn herausnimmst, sieht die Puppe lange auf das Zeichen im Griff, den Kreis und die drei Striche, die sich nicht treffen. „Wohin führt er?“, fragt sie. „Erzählst du es mir, wenn du dort warst?“
Eine Weile sitzt ihr nur da, eine Puppe und ein Jäger, und unten am Hang neigen sich die Blumen zweimal unter einem Wind, der bis zu den Stufen nicht heraufkommt. Erst danach spricht sie. „Sei vorsichtig. Du kommst immer zurück. Aber jedes Mal ein wenig anders.“
{ altar_blatt and not blatt_erinnert:
    ~ blatt_erinnert = true
    Zwischen den Blumen kehrt das Blatt vom Altar zu dir zurück, nicht als Bild, nur als ein Satz, so fest in dich eingedrückt wie die Buchstaben in sein Papier: Bleibt die Quelle offen, bleibt die Nacht. # lore: ende_der_nacht
}
-> traum_fragmente ->
CHRONIK DER NACHT # stil: zwischentitel
// [ERWEITERT] Was du entschieden hast, eine Zeile je Figur, nur für das, was auf diesem Weg geschah, und nur, was du gesehen oder gehört hast. Stimme A, Du und Perfekt, knapp, ohne Urteil.
// Befund 11: Was nachwirkt, trägt den Tag `# stil: nachwirkt` (Zeichen der Oberfläche) statt eines Spielbegriffs im Text.
// Die Blechflasche gibt es nur, wenn der Mob nicht zerstreut wurde (k1_b_scheiterhaufen); das Warten hat er in beiden Zweigen gezeigt.
// Stilprüfer: Die Namen am Zeilenanfang („Gascoigne.“) zählen als Ein-Wort-Sätze und drücken den Schnitt des Knotens; das ist die Form der Chronik, die Sätze dahinter sind auf Länge gebaut.
{
- gascoigne_moment: Gascoigne. Für einen Atemzug war er wieder da, und mit seiner alten Stimme hat er dich um das Ende gebeten. # stil: chronik
- im_lied_getroffen: Gascoigne. Du hast zugeschlagen, während er dem Lied seiner Tochter zuhörte. # stil: chronik
- gascoigne_verraten: Gascoigne. Du hast {eileen_genannt:Eileen|der Frau im Federmantel} gesagt, wo er war. Am Grab hast du ihn dann selbst gefunden. # stil: chronik
- q_frau == 1: Gascoigne. {mob != "zerstreut":Er hat dir aus seiner Blechflasche zu trinken gegeben.|Er hat dir gezeigt, wie man wartet, bis eine Bestie ausholt.} Am Grab hast du ihn getötet. # stil: chronik
- kennt_gascoigne(): Gascoigne. Ein Pater, den du erst kennengelernt hast, als er niemanden mehr kannte. # stil: chronik
- else: Der Mann mit dem Verband. Seinen Namen kennst du nicht. Sein Hut liegt noch auf dem Grabstein, und es regnet hinein. # stil: chronik
}
{
- maedchen_tot: Das Mädchen. Ein Band im Maul eines Schweins, rot bis auf den Knoten, der noch weiß war.{band: Du trägst es bei dir.} # stil: chronik
- q_mutter == 4: Das Mädchen. Du hast ihr gesagt, ihre Mutter komme bald. Sie wartet auf den Morgen. # stil: chronik # stil: nachwirkt
- q_mutter == 5: Das Mädchen. Du hast geschwiegen, und sie hat nicht noch einmal gefragt. # stil: chronik # stil: nachwirkt
- q_mutter == 7: Das Mädchen. Du hast ihr die Wahrheit gesagt, mit leeren Händen. Hinter den Läden hat sie das Räucherwerk neu angezündet. # stil: chronik # stil: nachwirkt
- q_mutter == 3: Das Mädchen. Sie hat die Brosche ihrer Mutter durch den Spalt genommen. Hinter dir gingen zwei Riegel. # stil: chronik # stil: nachwirkt
- maedchen_wo == "fort": Das Mädchen. Du hast sie zur Klinik geschickt. An der Ecke blieb sie stehen und sah die Treppe zu den Kanälen hinunter. # stil: chronik # stil: nachwirkt
- maedchen_gesehen: Das Mädchen. Sie wartet hinter dem Fenster am Brunnenplatz, das weiße Band am Riegel. # stil: chronik # stil: nachwirkt
}
{
- eileen_partner: {eileen_genannt:Eileen|Die Frau im Federmantel}. Am Tor über dem Grab waren zwei frische Kerben im Holz, eine dicht neben der anderen. # stil: chronik # stil: nachwirkt
- eileen < 0: {eileen_genannt:Eileen|Die Frau im Federmantel}. Sie hat dich vom Dach über den Gräbern fortgeschickt. # stil: chronik # stil: nachwirkt
- gascoigne_gewarnt and gascoigne_verraten: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast ihr den Pater verraten und ihn dann vor ihr gewarnt. Bei dem Toten lag eine geknickte Feder. # stil: chronik # stil: nachwirkt
- gascoigne_gewarnt: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast den Pater vor ihr gewarnt. Bei dem Toten lag eine geknickte Feder. # stil: chronik # stil: nachwirkt
- gascoigne_verraten: {eileen_genannt:Eileen|Die Frau im Federmantel}. Du hast ihr gesagt, wo der Pater war. Bei dem Toten lag ein Abzeichen aus Messing. # stil: chronik
- eileen_stufe >= 1: {eileen_genannt:Eileen|Die Frau im Federmantel}. Ihr habt euch gesehen, und zwischen den Gräbern lag eine Feder. Mehr nicht. # stil: chronik
}
{
- versprechen_gilbert: Gilbert. Du hast versprochen, ihn zu holen, wenn es bei ihm so weit ist. # stil: chronik # stil: nachwirkt
- q_gilbert == 2: Gilbert. Du hast ihm erzählt, was hinter der Brücke liegt. # stil: chronik
- gilbert < 0: Gilbert. Du hast dich von ihm abgewandt, und sein Husten ist dir bis an die nächste Ecke nachgegangen. # stil: chronik
- k1_b_gilbert: Gilbert. Er wartet hinter seinem Gitter und sammelt Namen. # stil: chronik
}
{ schwein == "umgangen":
    Das Schwein in der Kanalisation. Du hast dich an ihm vorbeigeschoben, und es hat nicht einmal den Kopf gehoben. # stil: chronik
}
{ gascoigne_lied:
    Gascoigne. Du hast ihn auf der Brücke gefragt, was er summt. Er hat es dir nicht sagen können. # stil: chronik
}
{ alte_frau_versprochen:
    Die alte Frau mit dem Hund. Du hast ihr einen sicheren Ort versprochen. # stil: chronik # stil: nachwirkt
}
{
- kleriker == "besiegt": Die Bestie auf der Brücke. Sie ist tot, und ihr Geweih liegt noch zwischen den Kutschen. # stil: chronik
- kleriker != "": Die Bestie auf der Brücke. Sie lebt, und auf dem Rückweg hast du sie noch kreischen hören. # stil: chronik # stil: nachwirkt
}
{
- schuetze_verschont: Der Alte mit den Kieseln. Du hast ihn leben lassen, und er hat dir den Rücken freigeschossen. # stil: chronik
- schuetze == "erledigt": Der Alte mit den Kieseln. Sein Haar war gekämmt wie für den Sonntag. # stil: chronik
- schuetze_gesehen: Der Alte mit den Kieseln. Du hast ihn auf seinem Dach gesehen und bist an ihm vorbeigegangen. # stil: chronik
}
{
- mob == "umgangen": Der Platz am Scheiterhaufen. Du hast dich an den Wänden entlanggedrückt, bis ein Kind auf dich zeigte. # stil: chronik
- mob == "durchbrochen": Der Platz am Scheiterhaufen. Du hast dich durch den Kreis geschlagen, und der Riese hat seine eigenen Leute niedergetrampelt. # stil: chronik
}
{ mob_verbrannt:
    Martha. Sie hat einem Jäger manchmal Brot gegeben, wenn er spät kam, und du hast sie verbrannt. # stil: chronik
}
{ iosefka != 0:
    Iosefka. {iosefka > 0:Sie hat sich notiert, dass du höflich warst.|Sie hat sich notiert, dass du gegen ihre Tür geschlagen hast.} # stil: chronik # stil: nachwirkt
}
// Was du nicht erlebt hast (Spuren des Nichtgewählten, Fassung 2): eine Zeile je ausgelassener Station. Jede Zeile muss auf allen Wegen stimmen, die zu ihr führen.
// Das Mädchen ohne den Brunnenplatz auf dem Hinweg: Der Heimweg führt immer zu ihr (k1_d_heimweg_a); also nennt die Zeile nicht, dass man sie nie fand, sondern wann.
{ not k1_b_tueren:
    Eine Gasse mit roten Lampen und eine Tür, vor der ein Hund lag. Du bist nicht hingegangen. # stil: chronik
}
{ not k1_b_anschlag:
    Eine schmale Kapelle, ein Anschlag an der Tür. Du hast ihn nie gelesen. # stil: chronik
}
{ not k1_b_haus:
    Ein Haus mit offener Tür. Du bist draußen geblieben. # stil: chronik
}
{ not k1_b_maedchen:
    Eine Melodie hinter einer Mauer. Als du ihr endlich gefolgt bist, lag das Grab schon hinter dir. # stil: chronik
}
{ not k1_b_daecher:
    Ein Schuss über den Dächern. Wer ihn abgegeben hat, hast du nie gesehen. # stil: chronik
}
{ not k1_b_dachweg:
    Eine Leiter an einer Hauswand. Sie führt noch immer hinauf. # stil: chronik
}
// Aufzeichnungen: Stimme A, Ich, rückblickend (wie der Prolog). Befund 7: Die anderen sterben. Keine ausgesprochenen Fragen; die offene Frage steckt im Mond, im Gesang und in der Nacht, die beim Schreiben noch andauert.
// Was die Nacht dem Ich getan hat, je Zweig: das Ausliefern zweimal, die Stimme beim Reinigen der Säge, das gelernte Warten gegen den Lehrer, der Name, der irgendwo stehen soll, die Hand, die sich bei einer Spieluhr hebt.
// Vorausdeutung (stil-1800 ST-07): Die Schrift ist auf diesen Seiten noch ruhig; der Prolog sagt, dass sie später zerfällt.
Aus den Aufzeichnungen, die man später fand; die Schrift ist auf diesen Seiten noch ruhig: # stil: tagebuch
{
- gascoigne_verraten:
    „In dieser ersten Nacht habe ich einen Mann zweimal ausgeliefert, einmal mit dem Mund und einmal mit der Säge. Man sagte mir, das sei die Jagd. # stil: tagebuch
- gascoigne_moment:
    „In dieser ersten Nacht habe ich einen Freund gewonnen und ihn mit eigener Hand erschlagen. Er bat mich darum, mit seiner alten Stimme, und seither höre ich sie, sooft ich die Säge reinige. Man sagte mir, das sei die Jagd. # stil: tagebuch
- q_frau == 1 and gascoigne >= 2:
    „In dieser ersten Nacht habe ich einen Freund gewonnen und ihn mit eigener Hand erschlagen. Er hatte mir auf einem Platz voller Rauch gezeigt, wie man wartet, bis eine Bestie ausholt. Am Grab habe ich gewartet, bis er ausholte. Man sagte mir, das sei die Jagd. # stil: tagebuch
- else:
    { kennt_gascoigne():
        „In dieser ersten Nacht habe ich einen Pater getötet, der seinen eigenen Namen vergessen hatte. Ich schreibe ihn hierher, damit er irgendwo steht: Gascoigne. Man sagte mir, das sei die Jagd. # stil: tagebuch
    - else:
        „In dieser ersten Nacht habe ich einen Mann mit verbundenen Augen getötet, der einen Priesterschal trug. Seinen Namen weiß ich bis heute nicht. Man sagte mir, das sei die Jagd. # stil: tagebuch
    }
}
{ im_lied_getroffen:
    Wenn ich seither hinter einem Fenster eine Spieluhr höre, hebt sich meine rechte Hand, ehe ich es weiß. # stil: tagebuch
}
{ maedchen_tot:
    Ein rotes Band.{maedchen_gesehen: Es war weiß, als ich es zum ersten Mal sah.} Mehr schreibe ich darüber nicht. # stil: tagebuch
}
{ q_mutter == 3 and not maedchen_tot:
    Einem Kind habe ich die Brosche seiner Mutter gegeben. Es bat mich, stehen zu bleiben, und ich blieb, bis es aufhörte zu weinen, und keinen Atemzug länger. # stil: tagebuch
}
{ q_mutter == 4:
    Einem Kind habe ich gesagt, seine Mutter komme bald. Es glaubte mir so schnell, dass ich mich heute frage, wie oft man ihm das schon gesagt hatte. # stil: tagebuch
}
{ grund == "heilung_selbst":
    Das Fieber, mit dem ich gekommen war, war fort. Ich bemerkte es erst auf dem Friedhof, zwischen zwei Gräbern, und ich weiß noch, dass ich mich nicht freute. # stil: tagebuch
}
{ grund == "luege":
    Den Sterbenden, von dem ich dem Kutscher erzählt hatte, konnte ich in der Klinik nicht eintragen. Es hatte ihn nie gegeben, und die Tinte wusste es, ehe ich die Feder ansetzte. # stil: tagebuch
}
{ grund == "schweigen":
    Dem Kutscher habe ich auf seine Frage nichts geantwortet. Es ist die einzige Antwort jener Tage, die ich nicht zurücknehmen möchte. # stil: tagebuch
}
{
- haltung_vertrag == "blind":
    Den Bogen in der Klinik habe ich nicht gelesen. Ich habe unterschrieben, und die Feder war das einzige Geräusch im Saal. # stil: tagebuch
- haltung_vertrag == "zoegernd":
    Die Feder hat über dem Bogen gezögert, und ein Tropfen ist ins Papier gelaufen. Ich habe trotzdem unterschrieben. # stil: tagebuch
}
Was auf dem Bogen stand, kann ich nicht sagen; nur dass die Tinte nicht von den Fingern ging. Ich habe in dieser Nacht gelernt, dass ich in Yharnam nicht sterbe. Die anderen schon. # stil: tagebuch
Oft sah ich in dieser Nacht nach dem Mond, vor der Klinik, auf der Brücke, zwischen den Gräbern, und nie stand er an einer anderen Stelle; er kam nur näher, bis er auf dem Heimweg die halbe Gasse ausfüllte, bleich und so fest an seinem Ort wie das Siegel auf einem Brief, den noch niemand geöffnet hat. Ich wünschte mir damals, er möge endlich sinken. Ich wusste nicht, worum ich bat. # stil: tagebuch
Ich trug einen Schlüssel bei mir, der zu schwer war für einen Schlüssel, und ich ging hinauf, dorthin, wo der Gesang herkam. Es begann mit einer Kutsche und mit einem Vertrag, und während ich dies niederschreibe, ist es noch immer Nacht.“ # stil: tagebuch
ENDE DES ERSTEN KAPITELS # stil: titel # kapitel: ende
-> END
