# Karte Kapitel 1 (automatisch erzeugt)

Erzeugt mit `npm run karte` aus den Ink-Dateien. Nicht von Hand bearbeiten.
Ausgeblendet sind Bausteine, die überall vorkommen (Tod, Ampulle, Laterne, Traum-Laden).

```mermaid
flowchart TD
  subgraph kapitel1_a_ankunft_ink["A Ankunft"]
    k1_prolog["Prolog: Wer du bist"]
    k1_klinik["Iosefkas Klinik: Transfusion"]
    k1_erwachen["Erwachen und erster Tod"]
    k1_traum_erst["Erster Besuch im Jägertraum"]
    k1_klinik_kampf["Lernkampf in der Klinik"]
    k1_iosefka["Iosefkas Tür"]
    k1_laterne_zentral["Laterne Zentral-Yharnam"]
  end
  subgraph kapitel1_b_yharnam_ink["B Zentral-Yharnam (frei)"]
    k1_hub_b["Zentral-Yharnam (frei)"]
    k1_b_gilbert["Gilbert"]
    k1_b_tueren["Türen mit Räucherlampen"]
    k1_b_scheiterhaufen["Scheiterhaufen und Mob, erste Begegnung mit Gascoigne"]
    k1_b_maedchen["Das Mädchen am Fenster"]
    k1_b_daecher["Die Gasse unter den Dächern (Schütze)"]
    k1_b_eileen["Eileen die Krähe (Dach)"]
  end
  subgraph kapitel1_n1_kleriker_ink["NADELÖHR 1 Kleriker-Bestie"]
    k1_n1_kleriker["NADELÖHR 1: Kleriker-Bestie"]
  end
  subgraph kapitel1_c_unterstadt_ink["C Unterstadt (frei)"]
    k1_hub_c["Unterstadt (frei)"]
    k1_c_kanal["Kanalisation (Schwein, Leiter)"]
    k1_c_eileen["Eileen: gemeinsame Jagd"]
    k1_c_graeber["Die Gräber (zweite Begegnung mit Gascoigne)"]
  end
  subgraph kapitel1_n2_gascoigne_ink["NADELÖHR 2 Gascoigne"]
    k1_n2_gascoigne["NADELÖHR 2: Gascoigne"]
  end
  subgraph kapitel1_d_nachspiel_ink["D Nachspiel"]
    k1_d_grab["Viola und die Brosche"]
    k1_d_rueckweg["Rückweg durch die Stadt (frei)"]
    k1_d_maedchen["WEICHE: Was sagst du dem Mädchen?"]
    k1_d_kanal["Rückweg durch die Kanalisation"]
    k1_d_gilbert["Gilbert hören lassen, was hinter der Brücke liegt"]
    k1_d_traum["Kapitelende im Traum"]
  end
  subgraph traum_ink["Jägertraum"]
    traum_erwachen["Erwachen nach dem Tod"]
    traum_hub["Jägertraum"]
  end
  k1_b_daecher --> k1_hub_b
  k1_b_eileen --> k1_hub_b
  k1_b_gilbert --> k1_hub_b
  k1_b_maedchen --> k1_hub_b
  k1_b_scheiterhaufen --> k1_hub_b
  k1_b_tueren --> k1_hub_b
  k1_c_eileen --> k1_hub_c
  k1_c_graeber --> k1_hub_c
  k1_c_kanal --> k1_hub_c
  k1_d_gilbert --> k1_d_rueckweg
  k1_d_grab --> k1_d_rueckweg
  k1_d_kanal --> k1_d_rueckweg
  k1_d_maedchen --> k1_d_rueckweg
  k1_d_rueckweg --> k1_d_gilbert
  k1_d_rueckweg --> k1_d_kanal
  k1_d_rueckweg --> k1_d_maedchen
  k1_d_rueckweg --> k1_d_traum
  k1_erwachen --> k1_traum_erst
  k1_hub_b --> k1_b_daecher
  k1_hub_b --> k1_b_eileen
  k1_hub_b --> k1_b_gilbert
  k1_hub_b --> k1_b_maedchen
  k1_hub_b --> k1_b_scheiterhaufen
  k1_hub_b --> k1_b_tueren
  k1_hub_b --> k1_hub_c
  k1_hub_b --> k1_n1_kleriker
  k1_hub_c --> k1_c_eileen
  k1_hub_c --> k1_c_graeber
  k1_hub_c --> k1_c_kanal
  k1_hub_c --> k1_hub_b
  k1_hub_c --> k1_n1_kleriker
  k1_hub_c --> k1_n2_gascoigne
  k1_iosefka --> k1_laterne_zentral
  k1_klinik_kampf --> k1_iosefka
  k1_klinik --> k1_erwachen
  k1_laterne_zentral --> k1_hub_b
  k1_n1_kleriker --> k1_c_kanal
  k1_n1_kleriker --> k1_hub_c
  k1_n2_gascoigne --> k1_d_grab
  k1_prolog --> k1_klinik
  k1_traum_erst --> k1_klinik_kampf
  tod --> traum_erwachen
  traum_erwachen --> traum_hub
  traum_von_laterne --> traum_hub
```
