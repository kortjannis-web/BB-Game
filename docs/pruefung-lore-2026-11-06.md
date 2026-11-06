# Unabhängige Prüfung Lore, Logik, Übergänge nach der Überarbeitung (2026-11-06)

Grundlage: `docs/kapitel1-buch.md` nach dem Zusammenführen. Unabhängiger Prüfer, nichts geändert. Zeilen: `story/…`, Notizbuch `web/notizbuch.js`.

**Technisch vorab:** `q_frau` wird in `gascoigne_greift_ein` (b_yharnam:444) auf jedem Weg 1; alle `q_frau == 0`-Zweige sind tot, `kennt_gascoigne()` ist immer wahr. `gascoigne2` wird beim Betreten der Gräber gesetzt (c_unterstadt:192).

## Befunde nach Schwere
1. **frag_nacht (nachbild:213):** „Von einem Morgen hat … keiner gesprochen, außer dem alten Mann in der Klinik“: auf allen Wegen falsch (Blutminister nie; das Mädchen b:553 und der Kutscher a_ankunft:30 schon). → „Vom Morgen spricht in dieser Stadt nur ein Kind …“ (bedingt auf `maedchen_gesehen`) oder streichen.
2. **Chronik (d:378):** „Ich bemerkte es erst auf dem Friedhof“ widerspricht dem Erwachen („Das Fieber ist fort“, a_ankunft:126). → „Ich hatte es schon in der Klinik bemerkt; begriffen habe ich es erst auf dem Friedhof …“
3. **Regen ohne Saat (n2:368; d:22/35/116/274):** Am Grab regnet es plötzlich (Hut, „schwer vom Regen“), der Regen beginnt nirgends. → in `sieg` vor dem Choral die ersten Tropfen aus dem Dunst um den Mond.
4. **k1_d_gilbert (d:221):** „Da unten hört man sie nicht“ widerspricht c_unterstadt:17. → „Nur den tiefen Teil. Den Rest deckt das Wasser zu.“
5. **Fenster des Mädchens (b:551, d Brosche):** „im ersten Stock“, aber Spieluhr und Brosche gehen von Hand zu Hand. → Fenster zu ebener Erde, halb unter einem Vordach.
6. **Mädchen → Kanal (d:170/192):** Keine zwanzig Schritte nach ihrem Weggehen liegt sie schon gefressen im Kanal. → Zeitsprung erzählen oder im Kanal nur Schuh und nasses Band, Spuren statt sofortiger Tod.
7. **Brosche (d:141, Zweig sonst):** Wer den Brunnenplatz ausgelassen hat, hört nie „… geh ich selber“; die falsche Wahl ist dann nicht erkennbar. → Satz „… und wenn sie nicht kommt, geh ich sie suchen“ in diesen Zweig.
8. **Gascoigne rufen (n1:67 vs. b:513–522):** Option immer da (`q_frau == 1`), „Ruf mich“ sagt er nur bei `gascoigne >= 0`. → Bedingung angleichen (`gascoigne >= 0`).
9. **sieg (n2:367):** „setzt der Gesang wieder ein“: auf manchen Wegen das erste Mal. → „wieder“ bedingt.
10. **Notizbuch Laternen (notizbuch.js:49):** „kalt und weiß“, die Klinik-Laterne flackerte; weiß war die der Unterstadt.
11. **Notizbuch Gascoigne (:160):** „Unter dem Teer roch er …“ → „Unter Torf und Rauch …“.
12. **Notizbuch Eileen (:99):** „sagte nichts“, sie sagt aber etwas (Puppe). → anpassen.
13. **Notizbuch Kleriker (:83, kleriker==besiegt):** Stoffstreifen um den Hals, der beim Sieg allein fort ist (n1:184). → auf den Weg mit Gascoigne beschränken oder „hatte gehangen“.
14. **Notizbuch Mädchen (:172):** „Warten könne sie gut“ sagt sie nirgends → „Sie bleibe wach, sagte sie.“
15. **frag_nacht (nachbild:213):** „bleich wie altes Wachs, mit einem Hof im Dunst“ weicht von der Klinik ab (Knochen) und wiederholt den Hof.
16. **Mond-Formeln (Ü1 „nie dieselbe Formel“):** Knochen 4× (a_ankunft:280 gewaschen; b:651 und d:89 „ausgekochter Knochen“ wortgleich; n1:51 und n2:46 „knochenbleich“ wortgleich); Hof 4× (a_ankunft:280, b:651, c_unterstadt:187, nachbild:213); Narben 3× (c_unterstadt:187, system:82, nachbild:122). → Knochen und Hof nur vor der Klinik; Narben nur an den Gräbern (c_unterstadt); Brücke, Grab, Heimweg je eigenes Bild.
17. **Mond fällt zurück (d:178):** „Über den Giebeln steht der Mond, bleich und reglos“ nach „füllt die halbe Gasse“. → „… so groß, dass das Fenster in seinem Licht steht.“ Notizbuch :173 mit der Szene abgleichen.
18. **Zwei Kanaleingänge (b:133 vs. n1:427):** zweimal „ein gemauerter Bogen“. → den zweiten als tiefere Mündung benennen.
19. **fliehen (n1:396 vs. :49/:53):** „unter dir liegt ein tieferes Dach“, obwohl die Brücke über bodenlosem Nebel steht. → Sprung am Brückenkopf, wo Dächer bis ans Geländer reichen.
20. **Laterne, Klinik, dunkles Haus, Gilbert (b:32, a_ankunft:280/281, b:171):** alles „neben der Laterne“; das dunkle Haus wirkt wie die Klinik. → „Zwei Häuser weiter steht eine Tür offen“; Gilbert eindeutig gleich neben der Laterne.
21. **k1_d_maedchen (d:148):** „Wenn du ihn triffst, zieh sie auf …“: Der Jäger hat Papa eben getötet, der Text reagiert nicht. → eine Regung des Jägers (die Hand, die die Uhr nicht nehmen will).
22. **tochter (c_unterstadt:237):** Erzählt vom Mädchen am Fenster, obwohl der Jäger auf manchem Weg ihr rotes Band trägt (`maedchen_tot`). → Zweig `maedchen_tot` mit Stocken oder Lüge.
23. **p3 Griff (n2:347 vs. traum:195):** „Klauen nach beiden Seiten aufbrechen … Finger um Finger“ statt Gehrmans Bewegung (nach außen, gegen die Daumen, an den Handgelenken); Bedingung `kleriker == "besiegt"` nimmt Geübten ohne Sieg die Ernte. → Text an Gehrmans Lehre angleichen, Bedingung prüfen.
24. **p3 Sprung (n2:261/273):** „Der Schatten lügt.“, richtig ist aber „dem Schatten nach“. → Schatten und Optionen so ordnen, dass der Satz stimmt.
25. **Falscher Schatten ohne Einsicht (n2:49 vs. notizbuch.js:132, Ü1):** immer gezeigt. → unter `{einsicht >= 1}`.
26. **Gräber (c_unterstadt:210):** „Die Frau im Federmantel sieht dir zu“, bevor Eileen erscheint. → Zeichen vorher oder Wortlaut ändern.
27. **Eileen-Weiche (b:722):** falsche Wahl nur auf einem Pfad erkennbar. → „Jäger jag ich“ o. ä. vor die Pater-Frage.
28. **beute (n1:275):** roter Dunst, „als er in dir ist“: sichtbar Blutechos (gestrichen). → streichen oder als Blutrausch ohne Aufnehmen.
29. **Spielsprache (b:44/46/97/99):** „Zweien davon kannst du nachgehen …“ → in der Welt begründen.
30. **k1_d_gilbert (d:235):** „öfter als an den Birnbaum“, Birnbaum nur bei einer freiwilligen Frage. → bedingt.
31. **Chronik (d:342):** „Wer ihn abgegeben hat, hast du nie gesehen“, auf dem Dachweg sieht man den Schützen. → bedingt.
32. **Kleriker t1 (n1:62):** „von den Dächern her“ → „aus den Gassen her“.
33. **beute (n1:278):** „wie es in Yharnam die Jäger der Kirche tragen“: Erzähler weiß es ohne Quelle. → bedingt auf Gilberts Gerücht.
34. **Formel** „mit einem Rollen, das nicht aus diesen Gassen stammt“ 4× (b:450, n1:170, n2:69, notizbuch.js:110) → einmal, dann „sein Rollen“.
35. **Formel** „zieht die Luft ein, lange, durch die Nase“ ~9× → Gascoigne eigenes Kennzeichen (kurze Rucke), sonst variieren.
36. **Formel** „wie Farbe in Wasser“ (a_ankunft:174, nachbild:153); Hunger „nicht nach Brot“ (a_ankunft:126, frag_blut).
37. **„Gute Jagd“ 5×** (Gilbert, Gehrman, Mann an der Tür, Gascoigne 2×) nimmt Gascoignes Tod die Wucht. → bei Gilbert oder an der Tür ersetzen.
38. **Choral uneinheitlich (Ü11; b:419, n1:265):** Scheiterhaufen ohne Abbruch, Brücke „endet ordnungsgemäß“ nach der dritten Zeile, Grab bricht ab. → überall nach der dritten Zeile; das Abbrechen am Grab steigern.
39. **Wörtliches Zitat (a_ankunft:112):** „Ihr habt einen gefunden. Einen Jäger.“ ist fast die Originalzeile. → umformen (CLAUDE.md: keine wörtlichen Zitate).
40. **Nahe am Original (n2:145):** „Riechst du's? Das Blut … summt mir was vor … würgt“. → umstellen, sinngemäß halten.
41. **Mädchen (b:550):** „So hat Gascoigne sie gesummt, nur tiefer“, am Scheiterhaufen summt er „hoch“. → angleichen.
42. **Mädchen-Option (b:567):** „Lauf zu der Ärztin in der Klinik“: dass Iosefka Ärztin ist, sagt niemand. → Iosefka einen Halbsatz geben.
43. **Grammatik:** nachbild:103 „bis sie losrannte“ (Schwein → es); traum:87 Leerzeichen nach Doppelpunkt.
44. **Tote Zweige mit falschem Text:** c_unterstadt:221 (q_frau == 0), n2:69 („Noch einer“), Chronik-Zweige „Seinen Namen kennst/weiß ich nicht“ (d:274), n1 `rufen` mit `gascoigne2`, Eileen über den Gräbern `sonst`, Gilbert D `sonst`, `puppe_gespraech.frage`, Frage „Wo riecht es nach Weihrauch?“ (grund==suche, gestrichen). → löschen oder als tot markieren.
45. **Saat ohne Ernte:** Wendels Mantel, Saum „glatt abgetrennt“ (b:359); Gilberts Flammenwerfer „nie benutzt“ bei rußschwarzer Düse (b:241). → Zeile in Chronik/Notizbuch oder in `lore/offen.md` als Saat für Kapitel 2.
46. **Blutgedächtnis nach Gascoignes Hilfe (n1:409):** Kopf unversehrt, obwohl Gascoigne hineingehackt hat. → bedingt.
47. **Notizbuch Parade (:104):** „mit dem Feuer im Rücken“ vs. Szene „Gesicht dem Feuer zugewandt“. → „am Feuer“.
48. **PRÜFEN (nachbild:47):** `{ neu_gelernt: … # notiz: gelernt }` Tag in einer Inline-Bedingung; prüfen, ob inkjs ihn als Text ausgibt.
49. **Heimweg (d:116):** Laterne „wo die Gasse auf die Straße mündet, an der Gilberts Fenster liegt“, gleich nach Gilberts Fenster: räumlich doppelt. → „Ein paar Schritte weiter …“
50. **Nähte:** „Pforte“ vs. „Tor“ (b:105/550); „Ein Tor findet sich im Zaun nicht“ ohne vorher erwähnten Zaun (a_ankunft:158).

## Mond-Stufen (Urteil)
Nie rot, kein Mond im Traum, wandert nicht: eingehalten; Steigerung im Ganzen richtig. Schwach: Wortwiederholungen (Knochen 4×, Hof 4×, Narben 3×), Rückfall d:178, zu kleiner Schritt von den Gräbern (c_unterstadt:187) zum Grab des Oedon (n2:46). Stark: b:132 „Gewandert ist er nicht. Er ist größer geworden.“ (Messung statt Behauptung).

Reihenfolge der Stufen: Prolog (Sonne sinkt) → Erwachen (Streifen kaltes Licht) → vor der Klinik (über den Giebeln, liegt fast auf den Firsten) → Ankunft (links vom höchsten Turm, eine Handbreit Himmel) → Dachweg (tiefer, größer) → nach Viertel 2 (kaum ein Finger bis zum Turm) → Brücke (Türme schwarz vor seiner Scheibe) → Unterstadt (verdeckt, ein Viereck an der Wand) → Traum (kein Mond) → Gräber (Narben) → Grab des Oedon (muss deutlich größer sein) → Heimweg (halbe Gasse) → Kapitelende (blasser, dann Traum).
