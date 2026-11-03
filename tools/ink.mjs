// Gemeinsame Bausteine der Werkzeuge: alle .ink-Dateien laden, kompilieren, Story erzeugen.
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, relative } from "node:path";
import { createRequire } from "node:module";

const ink = createRequire(import.meta.url)("inkjs/full");
export const { Compiler, CompilerOptions, Story, JsonFileHandler } = ink;

export const STORY_DIR = new URL("../story/", import.meta.url).pathname;
export const MAIN = "main.ink";

/** Alle .ink-Dateien unter story/, als { "kapitel1/a.ink": "inhalt" }. */
export function inkFiles(dir = STORY_DIR) {
  const out = {};
  const walk = (d) => {
    for (const name of readdirSync(d)) {
      const path = join(d, name);
      if (statSync(path).isDirectory()) walk(path);
      else if (name.endsWith(".ink")) out[relative(STORY_DIR, path)] = readFileSync(path, "utf8");
    }
  };
  walk(dir);
  return out;
}

/** Kompiliert die Geschichte. Gibt { json, errors, warnings, files } zurück; zählt alle Besuche (für die Prüfungen). */
export function compile() {
  const files = inkFiles();
  const errors = [];
  const warnings = [];
  const handler = (message, type) => (type === 2 ? errors : warnings).push(message);
  const options = new CompilerOptions(MAIN, [], true, handler, new JsonFileHandler(files));
  let json = null;
  try {
    const story = new Compiler(files[MAIN], options).Compile();
    if (story && errors.length === 0) json = story.ToJson();
  } catch (e) {
    if (errors.length === 0) errors.push(String(e?.message ?? e));
  }
  return { json, errors, warnings, files };
}

/** Kleiner, reproduzierbarer Zufall. */
export function rng(seed) {
  let s = seed >>> 0 || 1;
  return () => ((s = (Math.imul(s, 1103515245) + 12345) >>> 0) / 4294967296);
}

/**
 * Spielt einen Durchlauf. choose(choices, story) gibt den Index zurück. Liefert den Endzustand und das Protokoll.
 * maxSteps verhindert Endlosschleifen; ein Lauf, der sie erreicht, gilt als "steckengeblieben".
 */
export function play(json, choose, maxSteps = 6000) {
  const story = new Story(json);
  const tags = [];
  const lines = [];
  let steps = 0;
  let stuck = false;
  for (;;) {
    while (story.canContinue) {
      const text = story.Continue();
      if (text.trim()) lines.push(text.trim());
      for (const tag of story.currentTags ?? []) tags.push(tag.trim());
    }
    if (story.currentChoices.length === 0) break;
    if (++steps > maxSteps) {
      stuck = true;
      break;
    }
    story.ChooseChoiceIndex(choose(story.currentChoices, story));
  }
  return { story, tags, lines, steps, stuck };
}

export const variable = (story, name) => story.variablesState[name];
export const visits = (story, path) => story.state.VisitCountAtPathString(path);
