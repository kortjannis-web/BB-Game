// KAPITEL 1: alle Merker. Was hier steht, prägt Kapitel 1 und spätere Kapitel.

=== function kennt_gascoigne ===
~ return q_frau == 1 or gascoigne2 or spieluhr

// --- Wer du bist ------------------------------------------------------------
VAR name = "Jäger"          // setzt die Oberfläche bei der Namenswahl
VAR herkunft = ""           // adel, soldat, gelehrter, ueberlebender, kranker, gesuchter
VAR grund = ""              // heilung_selbst, luege (erfundener Sterbender, der Vertrag entlarvt es), schweigen (Gründe „suche“ und „schuld“ vom Nutzer gestrichen, 2026-11-06)
VAR haltung_vertrag = ""    // blind, wach, zoegernd
VAR waffe = ""              // saege (Entscheidung des Nutzers: keine Waffenwahl)
VAR feuerwaffe = ""         // pistole, donnerbuechse

// --- Gegenstände ----------------------------------------------------------------
VAR molotow = 0
VAR kiesel = 0
VAR feuer = false           // Gilberts Flammenwerfer
VAR spieluhr = false
VAR brosche = false
VAR band = false            // das Band des Mädchens (am Fenster weiß, beim Schwein rot getränkt)

// --- Beziehungen (etwa -2 bis +4) ------------------------------------------------
VAR gilbert = 0
VAR gascoigne = 0
VAR eileen = 0
VAR maedchen = 0
VAR iosefka = 0

// --- Quests und Weichen --------------------------------------------------------------
VAR q_gilbert = 0           // 0 nichts, 1 Bitte angenommen, 2 Bericht gegeben
VAR q_frau = 0              // 0 nichts, 1 Gascoigne bat, seiner Frau etwas auszurichten
VAR q_mutter = 0            // 0 nichts, 1 Suche angenommen, 3 Wahrheit mit Brosche, 4 gelogen, 5 geschwiegen, 7 Wahrheit ohne Brosche
VAR maedchen_wo = "zuhause" // zuhause, fort
VAR maedchen_tot = false
VAR mob = ""                // "", zerstreut, umgangen, durchbrochen
VAR schuetze = ""           // "", erledigt
VAR schuetze_gesehen = false
VAR schreie = 0
VAR gilbert_bruecke = false
VAR alte_frau = false
VAR kleriker = ""           // "", besiegt, abgelenkt, geflohen
VAR gedaechtnis_kleriker = false
VAR schwein = ""            // "", tot, umgangen
VAR eileen_stufe = 0        // 0 nicht getroffen, 1 getroffen, 3 gemeinsam gejagt
VAR eileen_partner = false
VAR gascoigne2 = false
VAR gascoigne_verraten = false
VAR gascoigne_gewarnt = false
VAR moment_moeglich = false
VAR gascoigne_moment = false
VAR versprechen_gascoigne = false
VAR spieluhr_mal = 0         // wie oft im Kampf gegen Gascoigne gespielt (beim dritten Mal wird er zur Bestie)
VAR gascoigne_tot = false
VAR gascoigne_name = false   // hat er deinen Namen von dir (Scheiterhaufen)
VAR parade_quelle = ""       // gascoigne, gehrman: wer dir das Parieren gezeigt hat
VAR mob_verbrannt = false    // Menschen mit Gilberts Feuer verbrannt (Martha)
VAR gascoigne_lied = false   // auf der Brücke nach seinem Lied gefragt
VAR im_lied_getroffen = false // im Kampf zugeschlagen, während die Spieluhr spielte
VAR gruss_ausgerichtet = false // Violas Leiche den Gruß ihres Mannes ausgerichtet
VAR alte_frau_versprochen = false
VAR versprechen_gilbert = false // Gilbert versprochen, ihn zu holen, wenn es so weit ist
VAR gilbert_geschenk = false
VAR eileen_frage_offen = false  // Eileen wartet noch auf eine Antwort über den Pater
VAR eileen_name = false         // Eileen kennt deinen Namen
VAR schuetze_verschont = false
VAR maedchen_gesehen = false    // die weiße Schleife am Fenster gesehen
VAR g_phase = 1               // Phase im Kampf gegen Gascoigne (überdauert keinen Tod, wird beim Betreten gesetzt)
VAR eileen_genannt = false
VAR gehrman_gesehen = false
VAR gehrman_blut = false
VAR gehrman_nacht = false
VAR gehrman_jaeger = false
VAR neu_gelernt = false
VAR mantel = false            // Wendels Mantel, gefunden im dunklen Haus
VAR mantel_erkannt = false    // Gascoigne oder Eileen haben den Mantel erkannt
VAR mantel_gelogen = false    // Gascoigne angelogen, woher der Mantel stammt
VAR jagdnotizen = false       // Jagdheft eines toten Jägers, gefunden auf dem Dachweg
VAR kirchenbrief = false      // Brief mit Kirchensiegel, gefunden im Fell der Kleriker-Bestie
// Akt II: wie viele Stationen des Viertels schon besucht sind (zwei von drei)
VAR v1_zahl = 0
VAR v2_zahl = 0
