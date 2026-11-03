// KAPITEL 1: alle Merker. Was hier steht, prägt Kapitel 1 und spätere Kapitel.

// --- Wer du bist ------------------------------------------------------------
VAR name = "Jäger"          // setzt die Oberfläche bei der Namenswahl
VAR herkunft = ""           // adel, soldat, gelehrter, ueberlebender, kranker, gesuchter
VAR grund = ""              // heilung_selbst, heilung_anderer, suche, schuld
VAR haltung_vertrag = ""    // blind, wach, zoegernd
VAR waffe = ""              // saege, axt, stock
VAR feuerwaffe = ""         // pistole, donnerbuechse

// --- Gegenstände ----------------------------------------------------------------
VAR molotow = 0
VAR kiesel = 0
VAR feuer = false           // Gilberts Flammenwerfer
VAR spieluhr = false
VAR brosche = false
VAR band = false            // das rote Band des Mädchens

// --- Beziehungen (etwa -2 bis +4) ------------------------------------------------
VAR gilbert = 0
VAR gascoigne = 0
VAR eileen = 0
VAR maedchen = 0
VAR iosefka = 0

// --- Quests und Weichen --------------------------------------------------------------
VAR q_gilbert = 0           // 0 nichts, 1 Bitte angenommen, 2 Bericht gegeben
VAR q_frau = 0              // 0 nichts, 1 Gascoigne bat, seiner Frau etwas auszurichten
VAR q_mutter = 0            // 0 nichts, 1 Suche angenommen, 3 Wahrheit gesagt, 4 gelogen, 5 geschwiegen, 6 nach Gascoigne fortgeschickt
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
VAR kanal_leiter = false
VAR eileen_stufe = 0        // 0 nicht getroffen, 1 getroffen, 3 gemeinsam gejagt
VAR eileen_partner = false
VAR gascoigne2 = false
VAR gascoigne_verraten = false
VAR gascoigne_gewarnt = false
VAR moment_moeglich = false
VAR gascoigne_moment = false
VAR versprechen_gascoigne = false
VAR jaegermarken = 0         // Eileens Marken: zurück in den Traum, ohne zu sterben
VAR spieluhr_mal = 0         // wie oft im Kampf gegen Gascoigne gespielt (beim dritten Mal wird er zur Bestie)
VAR gascoigne_tot = false
