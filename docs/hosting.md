# Das Spiel unter einer eigenen Adresse

Das Spiel ist eine fertige statische Seite (Ordner `web/`). Damit es unter einer festen Adresse im Browser läuft und sich bei jeder Änderung auf `main` von selbst erneuert, wird es mit GitHub verbunden gehostet.

**Warum nicht GitHub Pages?** Das Repository ist privat; GitHub Pages für private Repositories gibt es nur mit einem bezahlten GitHub-Plan. Netlify ist kostenlos, liest private Repositories und baut bei jedem Push neu. Die Einstellungen stehen schon in `netlify.toml`.

## Einrichten (einmalig, etwa 3 Minuten)

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
- **GitHub Pages**: nur wenn das Repository öffentlich wird oder ein bezahlter Plan da ist. Dann *Settings → Pages → Source: GitHub Actions* und einen Workflow, der `npm run bauen` ausführt und `web/` hochlädt.
- **claude.ai-Artefakte** bleiben zusätzlich bestehen (`web/artefakte.json`). Dort funktioniert die Werkstatt ebenfalls; ob das Senden an GitHub aus dem Artefakt heraus erlaubt ist, hängt von claude.ai ab. Sonst **Als Datei speichern**.
