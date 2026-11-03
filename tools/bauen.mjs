// Bauen: kompiliert die Geschichte für den Browser nach web/story.json und legt die inkjs-Laufzeit daneben.
// Aufruf: npm run bauen
import { copyFileSync, writeFileSync } from "node:fs";
import { compile } from "./ink.mjs";

const { json, errors } = compile();
if (!json) {
  console.log("Kompiliert nicht:", errors);
  process.exit(1);
}
const web = new URL("../web/", import.meta.url);
writeFileSync(new URL("story.json", web), json);
copyFileSync(new URL("../node_modules/inkjs/dist/ink.js", import.meta.url), new URL("ink.js", web));
console.log(`Gebaut: web/story.json (${Math.round(json.length / 1024)} KB) und web/ink.js`);
