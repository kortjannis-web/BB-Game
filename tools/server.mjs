// Kleiner Server für den Ordner web/. Aufruf: npm run spielen, dann http://localhost:8080 öffnen.
import { createServer } from "node:http";
import { readFile } from "node:fs/promises";
import { extname, join, normalize } from "node:path";

const ROOT = new URL("../web/", import.meta.url).pathname;
const PORT = Number(process.env.PORT ?? 8080);
const TYPES = { ".html": "text/html; charset=utf-8", ".js": "text/javascript; charset=utf-8", ".css": "text/css; charset=utf-8", ".json": "application/json; charset=utf-8", ".svg": "image/svg+xml" };

createServer(async (req, res) => {
  const path = normalize(decodeURIComponent(new URL(req.url, "http://x").pathname)).replace(/^(\.\.[/\\])+/, "");
  const file = join(ROOT, path.endsWith("/") ? `${path}index.html` : path);
  if (!file.startsWith(ROOT)) return res.writeHead(403).end();
  try {
    const data = await readFile(file);
    res.writeHead(200, { "content-type": TYPES[extname(file)] ?? "application/octet-stream" }).end(data);
  } catch {
    res.writeHead(404).end("Nicht gefunden");
  }
}).listen(PORT, () => console.log(`Das Spiel läuft auf http://localhost:${PORT}`));
