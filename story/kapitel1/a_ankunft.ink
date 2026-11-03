// KAPITEL 1, TEIL A: ANKUNFT. Linear, mit Haltungen. Endet an der ersten Laterne.

=== k1_prolog ===
// TITEL: Prolog: Wer du bist
// [ERWEITERT] Eigene Szene vor dem Original. Den Namen setzt die Oberfläche (VAR name).
Eine Kutsche im Regen, Fieber, und am Horizont die Türme von Yharnam; man sagt, das Blut der Stadt heile alles. # bild: anreise
Woher kommst du?
* [Aus verarmtem Adel]
    ~ herkunft = "adel"
* [Aus dem Krieg]
    ~ herkunft = "soldat"
* [Aus den Hörsälen]
    ~ herkunft = "gelehrter"
* [Als Einziger, der übrig blieb]
    ~ herkunft = "ueberlebender"
* [Aus einem Fieber, das dich nicht loslässt]
    ~ herkunft = "kranker"
* [Vor dem Galgen davon]
    ~ herkunft = "gesuchter"
- Warum Yharnam?
* [Um selbst geheilt zu werden]
    ~ grund = "heilung_selbst"
* [Für jemanden, der zu Hause stirbt]
    ~ grund = "heilung_anderer"
* [Um jemanden zu finden, der hierher ging und nicht zurückkam]
    ~ grund = "suche"
* [Weil du etwas wiedergutmachen musst]
    ~ grund = "schuld"
- Die Kutsche hält vor einer Klinik, deren Fenster von innen verhängt sind.
-> k1_klinik

=== k1_klinik ===
// TITEL: Iosefkas Klinik: Transfusion
// [KANON] Der Blutminister, der Vertrag (im Original die Charaktererstellung), die Transfusion. Wortlaut nur sinngemäß.
Ein alter Mann im Rollstuhl fragt, ob du gekommen bist, um das Blut von Yharnam zu empfangen; dafür brauche es nur einen Vertrag. # bild: klinik_innen # lore: bluttransfusion
* [Unterschreiben, ohne zu lesen]
    ~ haltung_vertrag = "blind"
* [Lesen, dann unterschreiben]
    ~ haltung_vertrag = "wach"
    Zwischen den Zeilen ein Wort, das du nicht kennst: bleiches Blut. # lore: paleblood
* [Zögern, bis er lächelt und wartet]
    ~ haltung_vertrag = "zoegernd"
- Die Nadel; das Blut ist warm, dann kalt, dann fremd.
// [KANON] Fiebervision: eine Bestie steigt aus einer Blutlache, fängt Feuer; kleine graue Wesen kriechen über dich. PRÜFEN: Einzelheiten nur aus Erinnerung.
In der Vision steigt eine Bestie aus einer Blutlache und verbrennt, und kleine graue Wesen kriechen über deine Brust. # gedaechtnis: vision_klinik
-> k1_erwachen

=== k1_erwachen ===
// TITEL: Erwachen und erster Tod
// [KANON] Notiz über bleiches Blut an der Wand. Der erste Tod ist unausweichlich und zählt nicht.
Du erwachst allein; an der Wand ein Zettel in eiliger Schrift, etwas über bleiches Blut und das Ende der Jagd. # lore: paleblood
Zwischen den Liegen richtet sich etwas auf, groß, behaart, hungrig. # anzeichen: erster_tod
* [Nach etwas greifen, das als Waffe taugt]
* [Zur Tür rennen]
* [Still liegen bleiben]
- Es nützt nichts; sie ist über dir.
-> k1_traum_erst

=== k1_traum_erst ===
// TITEL: Erster Besuch im Jägertraum
// [KANON] Gehrman, leblose Puppe, Boten geben Wandelwaffe und Feuerwaffe. PRÜFEN: Reihenfolge.
~ ort = "traum"
Du erwachst zwischen weißen Blumen unter einem Himmel ohne Sonne; ein Haus ist verschlossen, ein Rollstuhl steht leer. # bild: traum # lore: jaegertraum
Auf einer Treppe steht eine Puppe in Menschengröße, reglos. # lore: puppe
Kleine graue Wesen heben dir Waffen entgegen. # lore: boten
* [Den Sägespalter: reißt, schnell, ausgeklappt weit]
    ~ waffe = "saege"
* [Die Jägeraxt: spaltet, wuchtig, langsam]
    ~ waffe = "axt"
* [Den Gewindestock: elegant, wird zur Peitsche]
    ~ waffe = "stock"
- Dazu eine Feuerwaffe.
* [Die Pistole: genau]
    ~ feuerwaffe = "pistole"
* [Die Donnerbüchse: streut, hält auf Abstand]
    ~ feuerwaffe = "donnerbuechse"
- Ein Grabstein trägt deinen Namen nicht, aber er führt zurück in die Klinik.
-> k1_klinik_kampf

=== k1_klinik_kampf ===
// TITEL: Lernkampf in der Klinik
// [KANON] Die Bestie in der Klinik. Erster Kampf, lehrt das Lesen der Anzeichen.
~ laterne = -> k1_klinik_kampf
-> betreten("klinik") ->
Die Bestie hockt zwischen den Liegen, als hätte sie auf dich gewartet. # kampf: klinik_bestie
- (t1)
Sie duckt sich tief, die Hinterläufe spannen sich. # anzeichen: sprung
{ gelernt ? sprung: Du kennst das: wer sich so duckt, springt. }
+ [Zur Seite ausweichen]
    Der Sprung geht ins Leere.
    -> t2
+ [Den Sprung mit der Waffe abfangen]
    Das Gewicht wirft dich um.
    ~ zuletzt = sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Sie richtet sich auf und holt mit beiden Armen weit aus. # anzeichen: schwer
+ [Unter dem Schlag hindurch nach vorn]
    Deine Waffe findet ihre Seite.
    -> t3
+ [Zurückweichen]
    Die Krallen streifen dich.
    ~ zuletzt = schwer
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t3
- (t3)
Sie taumelt und schnappt ein letztes Mal nach dir. # anzeichen: biss
+ [Feuerwaffe ins aufgerissene Maul]
    Sie bricht zusammen.
    -> sieg
+ [Zuschlagen, bevor sie beißt]
    Ihr Biss und dein Hieb treffen zugleich.
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
- (sieg)
~ echos = echos + 2
Die Bestie liegt still; hinter einer Tür auf dem Gang ruft eine Frauenstimme. # klang: stille
-> k1_iosefka

=== k1_iosefka ===
// TITEL: Iosefkas Tür
// [KANON] Iosefka öffnet nicht, um ihre Patienten zu schützen, schiebt aber eine Blutampulle hinaus.
// Später (Kapitel 2) steht hier eine Hochstaplerin; die Stimme jetzt ist der Maßstab, an dem man sie erkennt.
Eine Ärztin, Iosefka, spricht durch die verschlossene Tür: Sie kann niemanden einlassen, ihre Patienten gehen vor. # notiz: iosefka
* [Höflich bitten]
    ~ iosefka = iosefka + 1
    Sie entschuldigt sich, und du merkst dir ihre Stimme: müde, genau, ein wenig spöttisch. # notiz: iosefka_stimme
* [Gegen die Tür schlagen]
    ~ iosefka = iosefka - 1
    Sie wird kühl.
- Sie schiebt eine Blutampulle durch den Spalt; man stößt sie in den Schenkel, und das Blut heilt. # notiz: blutampulle
~ ampulle = 1
-> k1_laterne_zentral

=== k1_laterne_zentral ===
// TITEL: Laterne Zentral-Yharnam
// [KANON] Erste Laterne gleich vor der Klinik, neben Gilberts Fenster.
Vor der Klinik steht eine Laterne; als du sie berührst, flammt sie auf, und du weißt, dass sie dich in den Traum führt. # lore: laternen
~ laterne = -> k1_hub_b
-> k1_hub_b
