# Karte Kapitel 1 (automatisch erzeugt)

Erzeugt mit `npm run karte` aus den Ink-Dateien. Nicht von Hand bearbeiten.
Ausgeblendet sind Bausteine, die überall vorkommen (Tod, Ampulle, Nachbild, Fragmente).

```mermaid
flowchart TD
  subgraph kapitel1_a_ankunft_ink["A Ankunft"]
    k1_prolog["Prolog: Wer du bist"]
    k1_klinik["Iosefkas Klinik: Transfusion"]
    k1_erwachen["Erwachen und erster Tod"]
    k1_traum_erst["Erster Besuch im Jägertraum"]
    k1_klinik_kampf["Lernkampf in der Klinik"]
    k1_iosefka["Iosefkas Tür"]
    k1_laterne_zentral["Laterne vor der Klinik (Ende von Akt I)"]
  end
  subgraph kapitel1_b_yharnam_ink["B Zentral-Yharnam (frei)"]
    k1_b_ankunft["Zentral-Yharnam: Ankunft (Akt II)"]
    k1_viertel1["Erstes Viertel (zwei von drei)"]
    k1_nach_viertel1["k1_nach_viertel1"]
    k1_nach_scheiterhaufen["k1_nach_scheiterhaufen"]
    k1_viertel2["Zweites Viertel (zwei von drei)"]
    k1_nach_viertel2["k1_nach_viertel2"]
    k1_vor_bruecke["k1_vor_bruecke"]
    k1_b_gilbert["Gilbert"]
    k1_b_tueren["Türen mit Räucherlampen"]
    k1_b_anschlag["Der Anschlag an der Kapellentür"]
    k1_b_haus["Das dunkle Haus (Zettel über die Brücke)"]
    k1_b_scheiterhaufen["Scheiterhaufen und Mob, erste Begegnung mit Gascoigne"]
    k1_b_maedchen["Das Mädchen am Fenster"]
    k1_b_daecher["Die Gasse unter den Dächern (Schütze)"]
    k1_b_dachweg["Der Dachweg"]
    k1_b_eileen["Eileen die Krähe (Dach)"]
  end
  subgraph kapitel1_n1_kleriker_ink["NADELÖHR 1 Kleriker-Bestie"]
    k1_n1_kleriker["NADELÖHR 1: Kleriker-Bestie"]
  end
  subgraph kapitel1_c_unterstadt_ink["C Unterstadt (frei)"]
    k1_c_unterstadt["Unterstadt: Ankunft und Laterne"]
    k1_c_kanal["Kanalisation (Schwein, Leiter)"]
    k1_c_eileen["Eileen über den Gräbern"]
    k1_c_graeber["Die Gräber (zweite Begegnung mit Gascoigne)"]
    k1_c_tor["Das Tor des Oedon"]
  end
  subgraph kapitel1_n2_gascoigne_ink["NADELÖHR 2 Gascoigne"]
    k1_n2_gascoigne["NADELÖHR 2: Gascoigne"]
  end
  subgraph kapitel1_d_nachspiel_ink["D Nachspiel"]
    k1_d_grab["Viola und die Brosche"]
    k1_d_heimweg["Heimweg (Akt IV, linear)"]
    k1_d_heimweg_a["k1_d_heimweg_a"]
    k1_d_heimweg_b["k1_d_heimweg_b"]
    k1_d_heimweg_c["k1_d_heimweg_c"]
    k1_d_heimweg_d["k1_d_heimweg_d"]
    k1_d_maedchen["WEICHE: Was sagst du dem Mädchen?"]
    k1_d_kanal["Rückweg durch die Kanalisation"]
    k1_d_gilbert["Gilbert hören lassen, was hinter der Brücke liegt"]
    k1_d_traum["Kapitelende im Traum"]
  end
  subgraph traum_ink["Jägertraum"]
    k1_traum_zwei["Zweite Traumszene: die Laterne am Eingang der Unterstadt"]
    puppe_gespraech["Gespräch mit der Puppe"]
  end
  k1_b_ankunft --> k1_viertel1
  k1_b_anschlag --> k1_viertel1
  k1_b_dachweg --> k1_viertel2
  k1_b_daecher --> k1_viertel2
  k1_b_eileen --> k1_vor_bruecke
  k1_b_gilbert --> k1_b_ankunft
  k1_b_haus --> k1_viertel1
  k1_b_maedchen --> k1_viertel2
  k1_b_scheiterhaufen --> k1_nach_scheiterhaufen
  k1_b_tueren --> k1_viertel1
  k1_c_eileen --> k1_c_tor
  k1_c_graeber --> k1_c_eileen
  k1_c_kanal --> k1_c_unterstadt
  k1_c_tor --> k1_n2_gascoigne
  k1_c_unterstadt --> k1_traum_zwei
  k1_d_gilbert --> k1_d_heimweg_d
  k1_d_grab --> k1_d_heimweg
  k1_d_heimweg_a --> k1_d_heimweg_b
  k1_d_heimweg_a --> k1_d_maedchen
  k1_d_heimweg_b --> k1_d_heimweg_c
  k1_d_heimweg_b --> k1_d_kanal
  k1_d_heimweg_c --> k1_d_gilbert
  k1_d_heimweg_c --> k1_d_heimweg_d
  k1_d_heimweg_d --> k1_d_traum
  k1_d_heimweg --> k1_d_heimweg_a
  k1_d_kanal --> k1_d_heimweg_c
  k1_d_maedchen --> k1_d_heimweg_b
  k1_erwachen --> k1_traum_erst
  k1_iosefka --> k1_laterne_zentral
  k1_klinik_kampf --> k1_iosefka
  k1_klinik --> k1_erwachen
  k1_laterne_zentral --> k1_b_gilbert
  k1_n1_kleriker --> k1_c_kanal
  k1_n2_gascoigne --> k1_d_grab
  k1_nach_scheiterhaufen --> k1_viertel2
  k1_nach_viertel1 --> k1_b_scheiterhaufen
  k1_nach_viertel2 --> k1_b_eileen
  k1_prolog --> k1_klinik
  k1_traum_erst --> k1_klinik_kampf
  k1_traum_zwei --> k1_c_graeber
  k1_traum_zwei --> puppe_gespraech
  k1_viertel1 --> k1_b_anschlag
  k1_viertel1 --> k1_b_haus
  k1_viertel1 --> k1_b_tueren
  k1_viertel1 --> k1_nach_viertel1
  k1_viertel2 --> k1_b_dachweg
  k1_viertel2 --> k1_b_daecher
  k1_viertel2 --> k1_b_maedchen
  k1_viertel2 --> k1_nach_viertel2
  k1_vor_bruecke --> k1_n1_kleriker
  naechstes_fragment --> frag_blut
  naechstes_fragment --> frag_ich
  naechstes_fragment --> frag_kippen
  naechstes_fragment --> frag_kirche
  naechstes_fragment --> frag_menschen
  naechstes_fragment --> frag_nacht
```
