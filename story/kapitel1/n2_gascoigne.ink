// KAPITEL 1, NADELÖHR 2: PATER GASCOIGNE AM GRAB DES OEDON. Pflicht.
// [KANON] Er hackt auf eine Leiche ein; Eröffnung sinngemäß: überall Bestien, früher oder später wirst du selbst eine.
// [KANON] Drei Phasen: Axt und Donnerbüchse (parierbar), lange Axt, Bestie (feueranfällig).
// [KANON] Die Spieluhr lässt ihn innehalten; nach dem dritten Mal verwandelt er sich, egal wie viel Leben er hat.
// [ERWEITERT] Moment der Klarheit: nur mit Freundschaft (gascoigne >= 2), Spieluhr und dem Blutgedächtnis der Kleriker-Bestie.
// [ERWEITERT] Eileen als Partnerin hilft in der Bestienphase (nicht, wenn man Gascoigne vor ihr gewarnt hat).

=== k1_n2_gascoigne ===
// TITEL: NADELÖHR 2: Gascoigne
-> betreten("grab") ->
~ spieluhr_gespielt = false
~ spieluhr_mal = 0
~ moment_moeglich = gascoigne >= 2 and spieluhr and gedaechtnis_kleriker
~ eileen_hilft = eileen_partner and not gascoigne_gewarnt
{ k1_n2_gascoigne == 1:
    ~ einsicht = einsicht + 1
}
Das Grab des Oedon, ein Name ohne Gesicht über einem Friedhof; zwischen den Gräbern beugt sich ein Mann über einen Leichnam und hackt, wieder und wieder. # bild: grab_oedon # kampf: gascoigne # lore: oedon
{ gascoigne >= 1:
    Er dreht sich um; es ist Gascoigne, und er sagt deinen Namen, {name}, als wäre es ein Fluch.
- else:
    Er dreht sich um, die Augen verbunden, und sagt, überall seien Bestien, und früher oder später werde man selbst eine. # lore: gascoigne
}
-> p1

= p1
- (t1)
Er reißt die Donnerbüchse hoch. # anzeichen: schuss
{ gelernt ? schuss: Du kennst das: erst der Schuss, dann die Axt. }
+ [Hinter einen Grabstein]
    Die Kugeln schlagen Stein aus dem Grab.
    -> t2
+ {parade} [Selbst schießen, im Moment seines Ausholens]
    Er wankt, wie er es dir beigebracht hat; du stößt zu. # notiz: seine_lehre
    -> t2
+ [Auf ihn zu]
    ~ zuletzt = schuss
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t2
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
- (t2)
Die Axt im weiten Bogen. # anzeichen: schwer
+ [Unter dem Bogen durch und zuschlagen]
    -> p2
+ [Zurückweichen]
    ~ zuletzt = schwer
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> p2
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t2
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= p2
Er klappt die Axt zur langen Form aus; sein Lachen wird zu etwas anderem. # phase
- (t3)
Die lange Axt fegt über die Gräber. # anzeichen: axt_lang
{ gelernt ? axt_lang: Du weißt: die lange Axt reicht weiter, als die Arme sind. }
+ [Ganz nah heran, wo die lange Axt nicht hinkommt]
    -> p3
+ [Zurück hinter die Gräber]
    ~ zuletzt = axt_lang
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> p3
+ {spieluhr and spieluhr_mal < 3} [Die Spieluhr aufziehen] -> uhr
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t3

= uhr
~ spieluhr_mal = spieluhr_mal + 1
Das Lied: Er hält inne und presst die Hände an den Kopf. # klang: spieluhr # lore: spieluhr
{ moment_moeglich and not gascoigne_moment: -> moment }
{ spieluhr_mal >= 3:
    Beim dritten Mal bricht etwas in ihm, und er wird, was er gejagt hat. # notiz: spieluhr_dritte
    -> p3
}
Du nutzt den Moment und triffst ihn tief.
-> p2

= moment
// Die bessere Entscheidung, die das Blutgedächtnis möglich macht.
~ gascoigne_moment = true
Du erkennst den Rest Mensch, genau wie in der Erinnerung der Bestie auf der Brücke. Einen Atemzug lang ist er da: Er nennt den Namen seiner Frau und bittet dich, es zu beenden, bevor er wieder geht. # gedaechtnis: gascoigne_klarheit
* [Ihm versprechen, nach seiner Tochter zu sehen]
    ~ versprechen_gascoigne = true
    Er nickt.
* [Ihn fragen, was mit Viola geschehen ist]
    Er weiß es nicht mehr, und das ist das Schlimmste, das er sagt. # notiz: viola_frage
* [Schweigen und die Waffe heben]
- Dann kippt er.
-> p3

= p3
Das Fell bricht durch den Mantel; eine Bestie mit Priesterschal. # phase # anzeichen: bestie_sprung
{ eileen_hilft:
    Rabenfedern zwischen den Gräbern: Eileen ist da. # notiz: eileen_hilft
}
- (t4)
Sie springt über drei Gräber hinweg auf dich zu. # anzeichen: bestie_sprung
{ gelernt ? bestie_sprung: Du weißt, wohin sie springt. }
+ {feuer or molotow > 0} [Feuer]
    { feuer:
        Das Feuer frisst sich ins Fell; sie heult.
    - else:
        ~ molotow = molotow - 1
        Der Molotow zerspringt an ihrer Brust.
    }
    -> t5
+ [Seitlich weg]
    -> t5
+ [Den Sprung abfangen]
    ~ zuletzt = bestie_sprung
    ~ treffer(2)
    { leben <= 0: -> tod }
    -> t5
+ {eileen_hilft} [Sie zu Eileen locken]
    Eileen trifft sie von hinten; du von vorn.
    -> t5
+ {ampulle > 0} [Die Blutampulle trinken]
    -> ampulle_gefahr(2) -> t4
- (t5)
Sie packt dich mit beiden Klauen. # anzeichen: griff
+ [Dich fallen lassen und wegrollen]
    -> sieg
+ [Zustechen, solange sie dich hält]
    ~ zuletzt = griff
    ~ treffer(1)
    { leben <= 0: -> tod }
    -> sieg
+ {jaegermarken > 0} [Eine Jägermarke zerdrücken] -> marke

= marke
~ jaegermarken = jaegermarken - 1
Du zerdrückst die Marke; das Grab und das Heulen zerfallen. # klang: marke
-> traum_von_laterne

= sieg
~ gascoigne_tot = true
~ einsicht = einsicht + 1
~ echos = echos + 10
{ gascoigne_moment:
    Er stirbt als Mensch; zuletzt sagt er etwas, das wie der Name eines Liedes klingt. # notiz: gascoigne_ende_mensch
- else:
    Die Bestie fällt zwischen die Gräber, und erst jetzt erkennst du den Priesterschal wieder. # notiz: gascoigne_ende_bestie
}
-> k1_d_grab
