// DER JÄGERTRAUM: Hub zwischen den Jagden. Gehrman, die Puppe, die Boten.
// [KANON] Traum als sicherer Ort, Rückkehr über Laternen, Puppe erwacht mit Einsicht. PRÜFEN: Einzelheiten.

=== traum_von_laterne ===
// TITEL: Laterne: in den Traum
~ leben = LEBEN_MAX
-> traum_hub

=== traum_erwachen ===
// TITEL: Erwachen nach dem Tod
{ tode:
- 1: Du erwachst zwischen weißen Blumen; Gehrman sagt, der Traum lasse dich nicht sterben, nur aufwachen. # lore: jaegertraum
- 2: Wieder die Blumen; die Puppe (falls wach) kniet neben dir.
- else: Die Blumen kennen dich inzwischen.
}
{ LIST_COUNT(gelernt) > 0: Im Halbschlaf siehst du noch einmal, was dich getötet hat, und diesmal siehst du es kommen. # notiz: gelernt }
-> traum_hub

=== traum_hub ===
// TITEL: Jägertraum
~ ort = "traum"
~ ampulle = 1
{ einsicht >= 1 and not puppe_wach:
    -> puppe_erwacht ->
}
- (wahl)
+ {puppe_wach} [Mit der Puppe sprechen]
    { tode >= 2: Sie sagt, sie habe gezählt, wie oft du zurückgekehrt bist, und es mache ihr Angst. - else: Sie fragt, wie die Jagd sei, und hört zu, als wäre jedes Wort neu. }
    -> wahl
+ [Zu Gehrman in die Werkstatt] -> gehrman -> wahl
+ [Zum Bad der Boten] -> boten_laden -> wahl
+ [Zurück zur Laterne] -> laterne

=== puppe_erwacht ===
// TITEL: Die Puppe erwacht
// [KANON] Mit dem ersten Punkt Einsicht bewegt sich die Puppe und spricht (Recherche: sicher).
~ puppe_wach = true
Die Puppe auf der Treppe hebt den Kopf, blinzelt und begrüßt dich als ihren Jäger. # lore: puppe # gedaechtnis: puppe_erwacht
->->

=== gehrman ===
// TITEL: Gehrman
// [KANON] Gehrman, der erste Jäger, Berater im Traum. [ERWEITERT] Gesprächsthemen als Lore-Quelle.
- (thema)
* [Was dieser Ort ist]
    Ein Traum für Jäger, sagt er; man kehrt zurück, solange die Nacht dauert. # lore: jaegertraum
    -> thema
* [Wozu die Laternen dienen]
    Sie verbinden die Stadt mit dem Traum; wer eine entzündet, findet den Weg hierher zurück. # lore: laternen
    -> thema
* [Wie man mit der Feuerwaffe kämpft]
    Nicht zum Töten, sagt er: Ein Schuss im Moment des Ausholens bringt die Bestie ins Wanken. # lore: parade
    ~ parade = true
    -> thema
* {einsicht >= 1} [Warum das Blut Bilder zeigt]
    Das Blut erinnert sich, murmelt er, und manchmal teilt es seine Erinnerungen mit dem, der es vergießt. # lore: blutgedaechtnis
    -> thema
* [Woher die Bestien kommen]
    Er weicht aus: Die Jagd sei nicht dazu da, verstanden zu werden. # lore: bestienseuche
    -> thema
+ [Gehen] ->->

=== boten_laden ===
// TITEL: Bad der Boten
// [KANON] Die Boten verkaufen gegen Blutechos. PRÜFEN: welche Waren im ersten Abschnitt.
- (wahl)
Die Boten heben kleine graue Hände; du hast {echos} Echos. # lore: boten
+ {echos >= 3 and molotow < 3} [Molotow kaufen (3 Echos)]
    ~ echos = echos - 3
    ~ molotow = molotow + 1
    -> wahl
+ {echos >= 1 and kiesel < 3} [Kieselstein kaufen (1 Echo)]
    ~ echos = echos - 1
    ~ kiesel = kiesel + 1
    -> wahl
+ [Genug] ->->
