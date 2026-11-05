# Das Spiel unter einer eigenen Adresse

Das Spiel ist eine fertige statische Seite (Ordner `web/`). Damit es unter einer festen Adresse im Browser läuft und sich bei jeder Änderung auf `main` von selbst erneuert, wird es mit GitHub verbunden gehostet.

**Aktuell:** GitHub Pages, https://kortjannis-web.github.io/BB-Game/ (umgestellt 2026-11-05; das Repository ist öffentlich).

**Warum die Umstellung:** Netlify (eingerichtet 2026-11-04) rechnet nach Credits ab, jeder Deploy kostet welche. Nach wenigen Tagen mit vielen Merges waren die Credits aufgebraucht: Production-Deploys pausiert, die Seite hing an 30 Not-Credits und wäre gesperrt worden. GitHub Pages ist kostenlos, ohne Credits und ohne zweites Konto. Der Preis: Das Repository ist öffentlich.

Es gibt zwei Wege, beide mit GitHub verbunden, beide bauen bei jedem Push auf `main` von selbst neu. Die Werkstatt funktioniert auf beiden gleich.

| | GitHub Pages | Netlify |
|---|---|---|
| Adresse | `https://kortjannis-web.github.io/BB-Game/` | frei wählbar, z. B. `https://yharnam-nacht.netlify.app` |
| Repository bleibt privat | nur mit bezahltem GitHub-Plan (Pro) | ja, kostenlos |
| Zusätzliches Konto | nein | ja (Anmeldung mit GitHub) |
| Einstellung im Repo | `.github/workflows/pages.yml` | `netlify.toml` |

Die Seite selbst ist bei beiden für jeden mit der Adresse erreichbar; Einreichen kann trotzdem nur, wer einen GitHub-Schlüssel hat.

## GitHub Pages (nur GitHub) — in Gebrauch

Einmalig, nachdem das Repository öffentlich ist:
1. *Settings → Pages → Build and deployment → Source: **GitHub Actions***.
2. *Actions → Spiel veröffentlichen (GitHub Pages) → Run workflow* (oder ein Push auf `main`). Nach etwa einer Minute ist die Seite unter https://kortjannis-web.github.io/BB-Game/ erreichbar.

Der Workflow `.github/workflows/pages.yml` baut mit `npm run bauen`, entfernt die Artefakt-Fragmente (`web/artefakt/`, nur für claude.ai) und veröffentlicht `web/`. Solange das Repository privat ist und `PAGES` nicht auf `an` steht, überspringt er sich still.

**Was „öffentlich“ bedeutet**
- Quelltext, Geschichte, Lore-Archiv, `quellen/` und der Zweig `vorschlaege` samt Vorschlägen sind für jeden lesbar. Es stehen keine Schlüssel im Repository (am 2026-11-05 geprüft); der GitHub-Schlüssel der Werkstatt liegt nur im Browser des Nutzers.
- Das Spiel ist ein privates, nicht kommerzielles Fanprojekt. Keine wörtlichen Zitate aus dem Spiel; die Quellen des Nutzers unter `quellen/` bleiben trotzdem im Blick, falls dort fremde Texte liegen.
- Einreichen über die Werkstatt kann weiterhin nur, wer einen GitHub-Schlüssel mit Schreibrecht hat.

**Suchmaschinen:** Auf GitHub Pages wirken `web/_headers` und `web/robots.txt` nicht (sie lägen im Unterpfad `/BB-Game/`, nicht an der Wurzel). Es schützt allein der Meta-Tag `noindex, nofollow` in `index.html` und `karte.html`. Wer die Adresse kennt, kann spielen.

**Eigene Domain** (optional): *Settings → Pages → Custom domain*.

## Netlify (abgelöst, nur Rückfall)

Netlify bleibt als Rückfall beschrieben, ist aber wegen der Credits keine gute Dauerlösung. Wer es nicht mehr braucht: in Netlify *Site configuration → Build & deploy → Continuous deployment → Unlink repository* oder die Site löschen, damit keine Builds mehr Credits verbrauchen.

1. Auf <https://app.netlify.com/signup> mit **„Sign up with GitHub“** anmelden.
2. **Add new site → Import an existing project → GitHub**. Netlify fragt nach Zugriff: nur **BB-Game** freigeben.
3. Repository **BB-Game** wählen. Netlify liest `netlify.toml`: Build command `npm run bauen`, Publish directory `web`, Zweig `main`. Nichts ändern, **Deploy** klicken.
4. Unter **Site configuration → Change site name** einen Namen wählen, z. B. `yharnam-nacht`. Die Adresse ist dann `https://yharnam-nacht.netlify.app`.
5. Die Adresse Claude sagen; sie kommt oben in `README.md` und in `CLAUDE.md`.

Danach gilt: Alles, was auf `main` landet, ist nach etwa einer Minute online. Arbeitszweige werden nicht veröffentlicht, der Zweig `vorschlaege` auch nicht.

**Eigene Domain** (optional): *Domain management → Add a domain*, z. B. `yharnam.deinname.de`; Netlify zeigt, welchen DNS-Eintrag man beim Domain-Anbieter setzt. HTTPS kommt automatisch.

**Privat halten:** Die Seite ist für Suchmaschinen gesperrt (`web/_headers`, `web/robots.txt`). Wer die Adresse kennt, kann sie öffnen. Ein Passwortschutz kostet bei Netlify Geld; meist reicht eine unauffällige Adresse. Einreichen kann ohnehin nur, wer einen GitHub-Schlüssel für das Repository hat.

## Alternativen

- **Cloudflare Pages** (kostenlos): *Workers & Pages → Create → Pages → Connect to Git*, Build command `npm run bauen`, Output `web`. Adresse `…pages.dev`. Wer Cloudflare sowieso nutzt, kann einen Passwortschutz (Cloudflare Access) gratis davorsetzen.
- **claude.ai-Artefakte** bleiben zusätzlich bestehen (`web/artefakte.json`). Dort funktioniert die Werkstatt ebenfalls; ob das Senden an GitHub aus dem Artefakt heraus erlaubt ist, hängt von claude.ai ab. Sonst **Als Datei speichern**.
