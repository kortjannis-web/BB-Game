# Werkzeuge des Skills stil-1800

Aufruf aus diesem Ordner, Korpus in `../korpus/`, Spieltexte in `story/kapitel1/`:

- `python3 stil.py ../korpus /home/user/BB-Game/story/kapitel1` misst Stilwerte (Satzlänge und Streuung, Nebensätze, Erzählerwörter, Vergleiche, Pointen am Absatzende) je Werk und für unsere Prosa.
- `python3 wortkammer.py ../korpus /home/user/BB-Game/story/kapitel1 ../wortkammer/kandidaten.json` sucht Wortkandidaten: Wörter, die bei den Meistern in mindestens drei Werken stehen und bei uns selten sind.
- `python3 slop.py ../korpus /home/user/BB-Game/story/kapitel1` ist ein erster Slop-Detektor: Zwei- und Dreiwortfolgen, die bei uns überhäufig und bei den Meistern selten sind. Er schlägt noch bei Du-Form und Präsens („sagt er“) und bei Stoffwörtern („die Säge“) an. Wird im Prüfer v2 bereinigt.
