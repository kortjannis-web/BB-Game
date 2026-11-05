# Feinschliff Kapitel 1 nach dem Lektorat: gemeinsame Regeln (2026-11-05)

Gilt für alle, die `docs/lektorat-kapitel1.md` umsetzen. Ziel des Nutzers: **immersiv, der Situation angemessen, im Stil H. P. Lovecrafts, hautnah erlebt, schön und eloquent, wie ein gutes Buch.** Er testet am Ende selbst. Sorgfalt vor Tempo.

## Vor dem Schreiben lesen
`CLAUDE.md`, `docs/stimme.md`, `docs/nutzerstil.md`, `.claude/skills/erzaehlkunst-deutsch/SKILL.md` (auch `references/regeln.md` und `references/wortschatz.md`), `.claude/skills/hpl-horror/SKILL.md` mit `references/lovecraft.md`, `references/gotik-volkskunde.md`, `references/bb-game.md`, dann `docs/lektorat-kapitel1.md` (kapitelweiter Teil und der Teil der eigenen Knoten), `lore/kern.md`, `lore/kapitel/kapitel1.md` (Wissenssperre) und die Lore-Dateien der eigenen Szenen.

**Maßstab für den Ton:** `k1_b_gilbert` (in `b_yharnam.ink`) und `k1_prolog`, `k1_klinik` (in `a_ankunft.ink`). Lies sie, bevor du schreibst, damit alle Szenen mit einer Stimme sprechen.

## Was zu tun ist
1. **Alle Befunde des Lektorats für die eigenen Knoten umsetzen**, dazu die kapitelweiten, soweit sie die eigene Datei betreffen (überstrapazierte Wörter und Bilder, Tonbrüche, Leitmotive).
2. **Jeden Absatz der eigenen Datei einzeln lesen und verbessern**, auch wo das Lektorat nichts sagt. Fragen je Absatz: Riecht, hört, spürt man den Ort? Gibt es das eine Ding, das nur hier vorkommt? Zeigt der Körper das Gefühl? Steht das Ungeheure ruhig da? Wechseln lange und kurze Sätze? Bringt der Absatz etwas Neues? Wie würde ein gutes Buch das schreiben?
3. **Lovecraft als Bauplan, nicht als Adjektive:** Erwartung vor Erscheinung, das eine Detail, das nicht stimmt, Indizien statt Erklärung, Maßstab und Gleichgültigkeit nur als Vorschein (Kapitel 1 ist Stufe 1 bis 2 der Treppe, mit Einsicht ein Spalt zu Stufe 3). Keine Adjektivhaufen („namenlos, unaussprechlich“).
4. **Hautnah:** Du-Form, Präsens; Wahrnehmung und Körper des Du, nie ein benanntes Gefühl, nie eine Entscheidung, die der Spieler nicht getroffen hat.
5. **Nichts an der Logik ändern:** Knoten, Stitches, Labels, Variablen, Bedingungen, Tags, Optionsreihenfolge und -zahl bleiben, es sei denn, das Lektorat nennt einen Logikfehler. Optionstexte nur behutsam verbessern (sie fließen in den Satz, `#fliesst`; Kampfoptionen nennen die Richtung).
6. **Länge folgt dem Gewicht:** Wichtige Momente dürfen Raum nehmen, Übergänge und Wiederholungen werden knapper. Kein Text wird nur länger, um schöner zu klingen.

## Festlegungen für das ganze Kapitel (nach dem Lektorat)
- **L1 Fortsetzung nach einer Wahl:** Der Text nach einer `#fliesst`-Wahl muss die Wahl weder wiederholen noch umstellen. Er beginnt mit dem, was geschieht: die Welt als Subjekt, die Folge, der Körper, eine Antwort („Die Krallen gehen über dich hinweg und reißen das Rad aus der Kutsche.“). Weder protokollartig mit „Du …“ noch mit dem umgestellten Tick („Nach links wirfst du dich“). Die Wahl darf im Satz anklingen, wenn es natürlich klingt; die Anfänge wechseln.
- **L2 Spielsprache:** Im Erzähltext keine „Echos“, kein „kaufen“, keine Preise; nur die Optionen im Laden dürfen den Preis knapp nennen („Die Brandflasche gegen drei Echos tauschen“). Der **Molotow heißt im Text „Brandflasche“** (Variable `molotow` bleibt). Keine Sätze aus Lore-Dateien in der Prosa.
- **L3 Lernsätze** (Bedingung `gelernt ? …`): nicht „Du kennst das jetzt“, sondern als Erinnerung des Körpers, jedes Mal anders („Deine Hüfte erinnert sich an diesen Bogen, bevor dein Kopf es tut.“), kurz.
- **L4 Keine christlichen Formeln:** Yharnam hat die Heilende Kirche, nicht die Kirche unserer Welt. Statt „Gott segne Sie“ etwa „Das Blut behüte Sie“; statt „bekreuzigt sich“ eine Geste der Kirche (die Hand auf die Armbeuge, wo die Nadel war); statt „Messe“ „Andacht“ oder „Kommunion“.
- **L5 Wiederholungen** (Zählung im Lektorat): „als … dürfte / sein sollte“ höchstens einmal je Datei; „als habe er auf diesen Augenblick gewartet“ ganz streichen; Nebel nur, wo er etwas tut; Gascoignes „nasses Fell“ höchstens zweimal im ganzen Kapitel; Satzanfang „Dann“ sparsam.
- **L6 Leitmotive:** Die Sonne steigt als Motiv (jedes Mal ein anderes, genaueres Zeichen, dass sie nicht sinkt: ein Schatten, der nicht wandert, eine Uhr, ein Fenster), nie dieselbe Formel. Der Choral kommentiert sich nicht selbst. Die Spieluhr hat einen eigenen, jedes Mal anderen Ton (nicht „dünn und klar“).

## Regeln für den Text
Keine Gedankenstriche; höchstens ein Vergleich je Absatz, aus der Welt Yharnams; keine Gegenwartswörter; keine Füllwörter („etwas“, „irgendwie“, „scheinen“); keine Erzählerurteile; keine Spielbegriffe im Erzähltext außer „Boten“; Rede in „…“, Figuren klingen verschieden (Stimmprofile in `references/bb-game.md`); Kirche in Stimme C. Keine wörtlichen Zitate aus dem Spiel. Kanon vor Erfindung, Marken `// [KANON]`, `// [ERWEITERT]`, `PRÜFEN:` erhalten.

## Technische Regeln
- Nur die eigenen Dateien ändern. Keine neuen Variablen nötig; falls doch, oben in der eigenen Datei.
- `# lore:`-Tags erhalten (jede Kern-Lore an zwei erreichbaren Stellen).
- Ändert sich ein Optionstext, den `tools/szenarien.mjs` als Wunsch oder Verbot nennt, genau diese Einträge anpassen.
- Vor dem Commit: `npm install` (einmal), `npm run check` grün, `node tools/stil.mjs` ohne neue Warnungen in der eigenen Datei. Nur die Quelldateien committen, nicht `web/*.json`, `*.twee`, `docs/karte-kapitel1.md`. Endzeilen der Commit-Nachricht: `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>` und `Claude-Session: https://claude.ai/code/session_015KuBTB7CiFKbMaNNJHMa9Z`. Nicht pushen, nicht mergen.
- Abschlussbericht (höchstens 20 Zeilen): was umgesetzt, wo abgewichen und warum, geänderte Szenarien, Bedarf in anderen Dateien, drei Stellen, auf die du am meisten stolz bist (Knoten und Anker), was ungeprüft ist.
