// KAPITEL 1, TEIL C: UNTERSTADT UND KANALISATION. Freie Reihenfolge. Führt zu NADELÖHR 2 (Grab des Oedon).
// [KANON] Zu Gascoigne kommt man über die Kanalisation; dort das Riesenschwein; eine Leiter führt zurück nach oben.
// Keine Laterne hier, außer an der Brücke (nur wenn die Kleriker-Bestie besiegt ist). Wer stirbt, läuft weit zurück.

=== k1_hub_c ===
// TITEL: Unterstadt (frei)
-> betreten("unterstadt") ->
{ k1_hub_c == 1:
    Jenseits der Brücke: ein Tor zum Kathedralenbezirk, verschlossen; Treppen hinab zu Kanälen und Gräbern. # bild: unterstadt # lore: heilende_kirche
}
- (wohin)
+ [Hinab in die Kanalisation] -> k1_c_kanal
+ {eileen_stufe >= 1 and eileen_stufe < 3} [Zu den Rabenfedern bei den Gräbern: Eileen] -> k1_c_eileen
+ [Zu den Gräbern] -> k1_c_graeber
+ {kanal_leiter} [Die Leiter hinauf nach Zentral-Yharnam] -> k1_hub_b
+ {ampulle > 0 and leben < LEBEN_MAX} [Die Blutampulle trinken] -> ampulle_ruhig -> wohin
+ {kleriker == "besiegt"} [An der Laterne an der Brücke in den Traum] -> traum_von_laterne
+ {kleriker != "besiegt"} [Zurück über die Brücke] -> k1_n1_kleriker
+ [Durch das Friedhofstor zum Grab des Oedon] -> k1_n2_gascoigne

=== k1_c_kanal ===
// TITEL: Kanalisation (Schwein, Leiter)
// [KANON] Ratten, Leichenbecken, das Riesenschwein. Wenn das Mädchen draußen ist, frisst das Schwein es; es trägt dann ihr rotes Band.
-> betreten("kanal") ->
{ maedchen_wo == "fort" and not maedchen_tot:
    ~ maedchen_tot = true
    Neben dem riesigen Schwein liegt etwas Kleines im Wasser; aus seinem Maul hängt ein rotes Band. # quest: maedchen_tot # bild: kanal_schwein
}
{ schwein != "": -> danach }
Knietiefes Wasser, Ratten so groß wie Hunde, ein Becken voller Toter; weiter hinten schmatzt etwas Großes. # bild: kanal # lore: bestienseuche
+ [Das Schwein stellen] -> kampf
+ [Am Rand vorbei zur Leiter schleichen]
    ~ schwein = "umgangen"
    -> leiter
+ [Zurück] -> k1_hub_c

= kampf
- (t1)
Es senkt den Kopf und scharrt im Wasser. # anzeichen: ansturm
+ [Zur Seite, im letzten Moment]
    Es rammt die Wand; Steine fallen.
    -> t2
+ [Stehen bleiben und zustechen]
    ~ zuletzt = ansturm
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Es dreht sich und reißt das Maul auf. # anzeichen: biss
+ [Auf den Rücken, dorthin, wo es nicht beißen kann]
    -> sieg
+ [Zurückweichen]
    ~ zuletzt = biss
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> t2
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(1) -> t2
- (sieg)
~ schwein = "tot"
~ echos = echos + 3
Das Schwein sinkt ins Wasser.
{ maedchen_tot:
    ~ band = true
    Du nimmst das rote Band an dich; es ist schwerer, als ein Band sein sollte. # notiz: rotes_band
}
-> leiter

= leiter
Eine Leiter führt hinauf zu einem Gitter, das sich nur von unten öffnen lässt; du schiebst den Riegel zurück. # notiz: abkuerzung
~ kanal_leiter = true
-> k1_hub_c

= danach
Das Wasser riecht nach Eisen; die Leiter steht offen.
-> k1_hub_c

=== k1_c_eileen ===
// TITEL: Eileen: gemeinsame Jagd
// [ERWEITERT] Partnerschaft: eine gemeinsame Jagd auf einen Jäger im Blutrausch. Im Original trifft man sie erst nach Gascoigne wieder.
-> betreten("eileen_graeber") ->
{ eileen < 0:
    Eileen sieht dich, dreht sich um und geht. # notiz: eileen_kalt
    ~ eileen_stufe = 3
    -> k1_hub_c
}
Eileen wartet zwischen den Gräbern; wer Jäger jagt, sagt sie, jagt meist allein. In einem Glockenturm haust einer, der nicht aufhört; sie könnte Hilfe brauchen. # quest: eileen_jagd # lore: jaeger_der_jaeger
+ [Mitgehen] -> jagd
+ [Später] -> k1_hub_c

= jagd
Ein Jäger im Glockenturm lacht über einer Leiche; sein Mantel ist steif vor Blut. # kampf: jaeger # lore: blutrausch
- (t1)
Er dreht die Klinge in der Hand und kommt tief, schneller als eine Bestie. # anzeichen: jaeger_klinge
+ [Eileen ein Zeichen geben und ihn in die Zange nehmen]
    Sie ist schon da, bevor du die Hand gesenkt hast.
    ~ eileen = eileen + 1
    -> t2
+ [Allein auf ihn zu]
    ~ zuletzt = jaeger_klinge
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
- (t2)
Er lacht und zielt mit der Pistole auf Eileen. # anzeichen: schuss
+ [Dich dazwischenwerfen]
    ~ zuletzt = schuss
    ~ treffer(1)
    { leben <= 0: -> tod }
    ~ eileen = eileen + 2
    Die Kugel trifft dich statt sie; Eileen sagt nichts, aber sie sieht dich anders an.
    -> sieg
+ [Selbst zuerst schießen]
    { parade:
        Er wankt; Eileen beendet es.
    - else:
        Du triffst zu spät; Eileen fängt sich die Kugel an der Schulter.
    }
    -> sieg
- (sieg)
~ eileen_stufe = 3
~ eileen_partner = true
~ echos = echos + 4
Eileen erzählt, wie ein Jäger kippt: zuerst der Geruch, dann das Lachen, dann vergisst er Namen. # lore: blutrausch # notiz: wie_jaeger_kippen
Sie bietet dir an, weiter gemeinsam zu jagen. # quest: eileen_partner
-> k1_hub_c

=== k1_c_graeber ===
// TITEL: Die Gräber (zweite Begegnung mit Gascoigne)
// [KANON] Der Friedhof und der Name Oedon (nur als Name; Bedeutung bleibt offen).
// [ERWEITERT] Gascoigne vor dem Kampf: er kippt; man kann ihn erreichen, warnen oder verlieren.
-> betreten("graeber") ->
{ k1_c_graeber == 1:
    Grabsteine, so dicht, dass man nicht zwischen ihnen gehen kann, ohne auf einen Namen zu treten; über dem Tor ein Name: Oedon. # lore: oedon
}
{ gascoigne2: -> still }
~ gascoigne2 = true
Gascoigne kniet zwischen den Gräbern; er riecht nach Blut und lacht leise über etwas, das du nicht siehst. # lore: blutrausch
{ q_frau == 1:
    Er erkennt dich, nach einem Moment zu lang.
- else:
    Er hält dich für eine Bestie, bis du sprichst; dann sagt er seinen Namen, Gascoigne, als müsse er ihn sich selbst sagen. # lore: gascoigne
}
* [Ihn an seine Tochter erinnern]
    ~ gascoigne = gascoigne + 1
    -> tochter
* {eileen_stufe >= 1} [Ihn vor der Frau mit den Rabenfedern warnen]
    ~ gascoigne_gewarnt = true
    ~ gascoigne = gascoigne + 1
    ~ eileen = eileen - 2
    Er lacht: Eileen, die Jägerin der Jäger; sie war schon hinter Henryk her, und sie hatte recht. # notiz: henryk # lore: jaeger_der_jaeger
    -> warnung
* [Fragen, wo seine Frau ist]
    Er habe sie nach Hause geschickt, sagt er; hier sei es zu gefährlich. Seine Hände sind rot bis zu den Ellbogen. # notiz: viola_luege
    -> warnung
* [Leise zurückweichen]
    -> k1_hub_c

= tochter
{ spieluhr:
    Du ziehst die Spieluhr auf; er weint, ohne es zu merken, und summt mit. # lore: spieluhr
    ~ gascoigne = gascoigne + 1
- else:
    Er sagt, seine Töchter schlafen; er jage, damit sie schlafen können.
}
-> warnung

= warnung
Er sagt, du sollst dich vom Grab fernhalten; dort sei die Bestie, die er jagt, und er wisse nicht mehr, wie sie aussieht. # notiz: gascoigne_warnung
-> k1_hub_c

= still
Die Gräber schweigen; frische Spuren führen zum Tor.
-> k1_hub_c
