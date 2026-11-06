# Übergabe: Umbau von Kapitel 1 zum Entscheidungsbuch (ERLEDIGT am 2026-11-06, siehe `docs/stand.md` und `docs/kapitel1-struktur.md`)

Stand 2026-11-06. Dieser Auftrag wird in einem **eigenen Chat** erledigt. Der alte Chat war sehr lang. Was ein neuer Chat braucht, steht im Repository, nicht im Gedächtnis eines Chats.

## Ziel
Kapitel 1 soll vom Level (zwei Drehscheiben, Hin und Her, Rückwege zur Laterne) zum **Entscheidungsbuch** werden: Es geht immer voran, jeder Ort kommt einmal, Routen und Fäden laufen an Nadelöhren zusammen. Entscheidungen wirken spürbar und bleiben gespeichert. Das Gefühl: „Mein Strang ist der einzig wahre.“

## Lesen, in dieser Reihenfolge
1. `CLAUDE.md` (Regeln, verbindliche Entscheidungen des Nutzers)
2. `docs/stand.md`
3. **`docs/struktur-entscheidungsbuch.md`** (Fassung 2: Modell, Tod-Mechanik, Skizze, Befunde der unabhängigen Prüfung in Abschnitt 7)
4. `docs/kapitel1-struktur.md` (heutiger Bau: Fäden, Weichen, Variablen)
5. `story/kapitel1/*.ink`, `story/system.ink` (Drehscheiben `k1_hub_b`, `k1_hub_c`; Tod und Laterne)
6. `docs/vorschlaege.md` (Werkstatt, Kommentare, Erklärblock, Bewertungen)

## Vor dem Bauen: Antworten des Nutzers einholen
Die Fragen aus `docs/struktur-entscheidungsbuch.md` als Häppchen stellen, falls noch offen:
1. Ist Fassung 2 die Richtung (feste Begegnungen mit Gilbert, Gascoigne und Eileen; freie Wege dazwischen)?
2. Kartenmodell: zwei von drei Stationen je Viertel, oder andere Zahlen?
3. Tod: zurück an den Anfang des Kampfes, Fleck am Takt, Laternen je Akt?
4. Die grüne Markierung des Gelesenen bleibt wie gewünscht, auch wenn sie andere Wege verrät?

## Arbeitsschritte
1. **Gerüst zuerst** (Regel „erst Struktur, dann Text“):
   - Akte, Viertel, Stationen, je ein Satz als Platzhalter.
   - **Fadentabelle**: welcher Faden auf welcher Route, welche Folge welcher Art (Färbung, Besetzung, Zugang, Kampf).
   - **Echo-Tabelle**: welche Variable wird wo gelesen.

   Dem Nutzer als Häppchen vorlegen und abnehmen lassen.
2. **Ink umbauen:**
   - Drehscheiben werden zu Routenwahlen nach dem Kartenmodell.
   - Laternen je Akt.
   - Der Tod führt an den Anfang des Kampfes zurück; dabei festschreiben, was ein Tod überdauert (gelernt, tode, Entscheidungen vorher).
   - Bestehende Szenen werden zu Stationen.
   - Neue Stationen als Platzhalter: Spuren des Nichtgewählten, die zweite Form von Eileens erster Begegnung, das Schwein bei Sieg an der Kanalmündung.
3. **Prüfer und Szenarien anpassen:**
   - Lore muss **auf jeder Route** erreichbar sein.
   - Echo-Regel: Jede gesetzte Variable wird später gelesen. Die Liste der Lücken gibt `node tools/entscheidungen.mjs` aus (Feld `ohneEcho`, heute 17).
   - Je Route und Faden ein Szenario: Moment der Klarheit, Verrat an Gascoigne, Feuer gegen den Mob, Band beim Schwein, Kanon-Tragödie.
4. **Begründungen:** Jede Option bekommt `// WARUM: …` direkt über sich (`docs/vorschlaege.md`, 6c). Das geschieht **erst nach dem Umbau**, weil sich die Entscheidungen dabei ändern. Bis dahin zeigt der Block „Claude erklärt“ „Begründung folgt“.
5. **Keine neue Prosa:** Texte werden nur so weit angepasst, wie die neue Reihenfolge es verlangt (Übergänge, Verweise). Neu geschrieben wird erst mit dem fertigen Skill `stil-1800` (Anweisung des Nutzers 2026-11-06).
6. `npm run check` grün, `docs/stand.md` und `docs/qualitaet.md` nachziehen, mergen.

## Was parallel im anderen Chat weiterläuft
Der Skill `stil-1800` (`.claude/skills/stil-1800/`): Analysen, Anthologie, Wortkammer, Prinzipien-Netz. Er berührt die Ink-Dateien nicht. Konflikte gibt es nur, falls beide Chats gleichzeitig `docs/stand.md` ändern; dann zusammenführen statt überschreiben.

## Startsatz für den neuen Chat
> Lies `docs/uebergabe-umbau-kapitel1.md` und arbeite den Auftrag ab. Stell mir zuerst die offenen Fragen als Häppchen.
