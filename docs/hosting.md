# Das Spiel unter einer eigenen Adresse

Das Spiel ist eine fertige statische Seite (Ordner `web/`). Damit es unter einer festen Adresse im Browser läuft und sich bei jeder Änderung auf `main` von selbst erneuert, wird es mit GitHub verbunden gehostet.

**Aktuell:** Netlify, https://yahrnams-neverending-night.netlify.app/ (eingerichtet 2026-11-04).

Es gibt zwei Wege, beide mit GitHub verbunden, beide bauen bei jedem Push auf `main` von selbst neu. Die Werkstatt funktioniert auf beiden gleich.

| | GitHub Pages | Netlify |
|---|---|---|
| Adresse | `https://kortjannis-web.github.io/BB-Game/` | frei wählbar, z. B. `https://yharnam-nacht.netlify.app` |
| Repository bleibt privat | nur mit bezahltem GitHub-Plan (Pro) | ja, kostenlos |
| Zusätzliches Konto | nein | ja (Anmeldung mit GitHub) |
| Einstellung im Repo | `.github/workflows/pages.yml` | `netlify.toml` |

Die Seite selbst ist bei beiden für jeden mit der Adresse erreichbar; Einreichen kann trotzdem nur, wer einen GitHub-Schlüssel hat.

## GitHub Pages (nur GitHub)

Das Repository ist privat. GitHub Pages gibt es für private Repositories nur im bezahlten Plan; im kostenlosen Plan nur für öffentliche.
- **Repository öffentlich machen:** *Settings → General → Danger Zone → Change visibility → Public*. Dann ist auch der Quelltext samt Geschichte und Vorschlägen öffentlich lesbar (der GitHub-Schlüssel nicht, der bleibt im Browser).
- **Oder privat lassen mit GitHub Pro:** Plan wechseln, dann unter *Settings → Secrets and variables → Actions → Variables* eine Variable `PAGES` mit dem Wert `an` anlegen.

Danach einmalig: *Settings → Pages → Build and deployment → Source: GitHub Actions*. Beim nächsten Push auf `main` (oder unter *Actions → Spiel veröffentlichen → Run workflow*) ist das Spiel nach etwa einer Minute online. Solange keine der beiden Bedingungen erfüllt ist, überspringt der Workflow sich still und schickt keine Fehlermails.

## Netlify (Repository bleibt privat, kostenlos)

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
