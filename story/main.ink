// BB-Game: Hauptdatei. Bindet alle Teile ein und startet das Spiel.
// Konventionen (siehe CLAUDE.md):
//   # lore: id      Kern-Lore; muss an mindestens zwei Stellen erreichbar sein (Prüfer)
//   # notiz: id     Notizbuch-Eintrag ohne Pflicht
//   # quest: id     Quest beginnt oder ändert sich
//   # anzeichen: id Ansage eines Gegners im Kampf
//   # kampf: id     Kampf beginnt   # phase   Bosswechsel
//   # tod: ort      Spieler stirbt (vom Prüfer gezählt)
//   # bild: id      Ortsbild        # klang: id   Geräusch
//   # gedaechtnis: id  Blutgedächtnis (Vision)
//   # kapitel: ende    Kapitelende
//   // TITEL: ...   Name des Knotens auf der Karte
//   // [KANON] / [ERWEITERT] / Prüfmarke "PRUEFEN:" (mit Ü)   Herkunft des Inhalts und offene Kanon-Prüfung
// Alle Texte sind Platzhalter (ein Satz), bis die Struktur abgenommen ist.

INCLUDE system.ink
INCLUDE traum.ink
INCLUDE nachbild.ink
INCLUDE kapitel1/zustand.ink
INCLUDE kapitel1/a_ankunft.ink
INCLUDE kapitel1/b_yharnam.ink
INCLUDE kapitel1/n1_kleriker.ink
INCLUDE kapitel1/c_unterstadt.ink
INCLUDE kapitel1/n2_gascoigne.ink
INCLUDE kapitel1/d_nachspiel.ink

-> k1_prolog
