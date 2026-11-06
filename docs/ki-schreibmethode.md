# Wie eine KI zur Meisterin des Erzählens wird: Recherche und Methode (2026-11-06)

Frage des Nutzers: „Wie macht man KIs zu Buch-Experten? Wie schreiben Claude oder eine KI krasse Texte, krasse Bücher und Plots?“ Gesucht wurden Erfahrungsberichte von Autorinnen und Autoren, Anleitungen und Forschung. Die Quellen stehen am Ende. Vorbehalt: Viele Praktikerquellen sind Blogs, die Forschung ist belastbarer.

## Was die Recherche zeigt

1. **Vorbilder schlagen Regeln.** Claude ahmt einen Stil viel besser nach, als es Regeln über diesen Stil umsetzt. Empfohlen werden 3 bis 5 *verschiedene* Beispiele des Zielstils im Kontext, klar als Beispiele markiert. Autorinnen berichten dasselbe: 300 bis 500 Wörter Vorbildprosa in den Kontext legen, dann schreiben lassen.
2. **Verbote können nach hinten losgehen.** Wer ein Wort verbietet, nennt es und lenkt die Aufmerksamkeit darauf (Rosa-Elefant-Effekt, Preprint „Semantic Gravity Wells“, 2026). Das deckt sich mit unserem Befund: Das Verbot von „nicht X, sondern Y“ hat den Tic nur in eine „ohne …, ohne …“-Litanei verschoben. Folge für uns: positive Beschreibungen und Vorbilder beim Schreiben; Verbote gehören in den Prüfer *danach*, nicht in den Schreibauftrag.
3. **Slop ist messbar.** Die Antislop-Forschung (Paech u. a., 2025) findet Muster, die in KI-Texten über 1.000-mal häufiger sind als in Menschentexten. Ihr Werkzeug *slop-score* zählt überhäufige Wörter, die Wendung „nicht nur X, sondern Y“ und überhäufige Dreiwortfolgen. Für uns heißt das: einen **deutschen Slop-Detektor** bauen, der Wortfolgen findet, die bei uns häufig und bei den Meistern selten sind.
4. **KI-Geschichten sind messbar schwächer, und KI-Urteile über Texte taugen nichts.** Im Torrance-Test für kreatives Schreiben (Chakrabarty u. a., CHI 2024: 14 Prüffragen zu Flüssigkeit, Flexibilität, Originalität und Ausarbeitung) bestehen KI-Geschichten drei- bis zehnmal seltener als Geschichten von Profis. Keine KI-Bewertung stimmte mit den Urteilen der Fachleute überein. Folge: **Mein Urteil über meine eigenen Texte zählt nicht.** Es zählen konkrete Prüffragen, unabhängige, strenge Kritiker und vor allem dein Urteil.
5. **KI macht Geschichten einander ähnlicher.** In einer Studie (Doshi und Hauser, Science Advances 2024) wurden einzelne Geschichten mit KI-Ideen besser bewertet, alle zusammen aber gleichförmiger. Folge für Plots: Für Schlüsselmomente erzeuge ich mehrere bewusst verschiedene Varianten, nie nur die erste Idee, und du wählst. Die besten Wendungen bringst du ein.
6. **Arbeitsteilung schlägt einen einzigen Durchgang.** Bei *Agents' Room* (Google DeepMind, ICLR 2025) planen spezialisierte Agenten Figuren, Konflikt, Schauplatz und Handlung. Andere schreiben die Teile, eine Leitung führt alles zusammen. Menschliche Leser zogen diese Geschichten den Ergebnissen aus einem Durchgang vor.
7. **Erfahrungen aus der Praxis.**
   - Eine „Bibel“ (Welt, Figuren, Stimmen) gehört in jede Schreibsitzung.
   - Gliederungen gelten als Entwurf, nicht als Vertrag.
   - Nach jedem Kapitel prüft ein Kritiker Widersprüche, Zeitlinie, Lore, wiederholte Formulierungen und typische KI-Spuren.
   - Wenn der Mensch den Anfang einer Passage schreibt, trifft die KI den Ton besser.
   - Kritik von Sprachmodellen schmeichelt gern. Darum muss sie ausdrücklich streng angelegt sein und unabhängig gegengeprüft werden.

## Unsere Methode (Vorschlag)

| Baustein | Was genau |
|---|---|
| **A. Vorbild-Bibliothek** | Die Kernliste (`docs/schreibkunst-lektuere.md`), Wort für Wort analysiert. Die Stellen werden nach Szenenart geordnet: Ankunft an einem Ort, Begegnung, Gespräch, Kampf, Gerücht, Dokument, Traum, Tod. Vor jeder Szene lege ich 2 bis 3 passende Meisterstellen in den Kontext, und zwar verschiedene. |
| **B. Positiver Schreibauftrag** | Der neue Skill `stil-1800` beschreibt, *was* zu tun ist (Erzählerhaltung, Periode, Gelenke, Wortkammer, Bild), mit Originalbelegen. Die langen Verbotslisten kommen aus dem Schreibauftrag heraus und in den Prüfer. |
| **C. Deutscher Slop-Detektor (Prüfer v2)** | Er misst die Stilwerte jeder Szene gegen den Korridor der Meister (Satzlänge, Streuung, Nebensätze, Erzählerwörter, Pointenschlüsse). Er sucht Wortfolgen, die bei uns überhäufig und bei den Meistern selten sind, und Wiederholungen über Szenen hinweg (Requisiten-Echo). Läuft in `npm run check`. |
| **D. Bibel** | `lore/weltbild.md` (wie Yharnam aussieht, klingt und riecht, dazu dein Kanon wie Mond und Nacht). Eine **Figurenbibel** mit der Stimme jeder Figur: Satzlänge, Wortschatz, Anrede, Marotte. Sie soll verhindern, dass alle in denselben Kalendersprüchen reden. |
| **E. Arbeitsteilung je Szene** | Plan (Szenenbogen, Lore, Figuren), dann Entwurf mit Vorbildern, dann drei unabhängige, strenge Kritiker: Stil blind, Lore-Kenner, Logik und Plot. Danach Überarbeitung, erst dann zu dir. |
| **F. Varianten statt erster Idee** | Für Schlüsselmomente (Wendung, Bosskampf, Tod einer Figur) zwei bis drei verschiedene Fassungen als Häppchen; du wählst. |
| **G. Dein Ton als Anker** | Wo du willst, schreibst du den ersten Satz oder Absatz einer Schlüsselszene, und ich setze ihn fort. Deine Werkstatt-Änderungen bleiben die stärkste Quelle (`docs/nutzerstil.md`). |
| **H. Ehrliche Messlatte** | Die 14 Prüffragen des Torrance-Tests und die Meisterwerte statt meines Eigenlobs. Fertig ist ein Stück erst, wenn du Stufe 4 vergibst. |

## Quellen

- Kelly Balthrop, Writing Fiction with Claude: <https://wbalthrop.substack.com/p/writing-fiction-with-claude>
- Justis Mills, ok ai can write pretty good fiction: <https://justismills.substack.com/p/ok-ai-can-write-pretty-good-fiction>
- Prompting-Strategien für kreatives Schreiben: <https://knowledgeworkersguide.substack.com/p/four-prompting-strategies-to-enslave>
- Erfahrungsbericht einer Autorin mit Claude: <https://tech.yahoo.com/general/articles/im-published-author-tested-claude-043000890.html>
- Antislop (Paech u. a.): <https://arxiv.org/abs/2510.15061>; slop-score: <https://github.com/sam-paech/slop-score>; EQ-Bench Creative Writing: <https://eqbench.com/creative_writing.html>; Slop Guard: <https://eric-tramel.github.io/blog/2026-02-18-slop-guard>
- Chakrabarty u. a., Art or Artifice? (CHI 2024): <https://arxiv.org/pdf/2309.14556>
- Doshi und Hauser, Science Advances 2024: <https://pmc.ncbi.nlm.nih.gov/articles/PMC11244532>
- Agents' Room (ICLR 2025): <https://arxiv.org/pdf/2410.02603>
- Beispiele statt Anweisungen: <https://buttondown.com/redpen/archive/examples-beat-instructions-the-show-dont-tell-5437/>; Few-Shot mit Claude: <https://www.guvi.in/blog/few-shot-prompting-with-claude/>
- Negative Anweisungen: <https://arxiv.org/html/2601.08070v1>, <https://eval.16x.engineer/blog/the-pink-elephant-negative-instructions-llms-effectiveness-analysis>
- Arbeitsabläufe mit Bibel und Kritik: <https://github.com/deland78/claude-writing-skills>, <https://dev.to/jsph/how-to-build-an-llm-editorial-pipeline-for-fiction-writing-bfg>, <https://sudowrite.com/blog/sudowrite-complete-workflow/>
