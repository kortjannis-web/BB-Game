// Werkstatt: Vorschläge des Nutzers sammeln, ansehen, testen und über GitHub einreichen.
// Gemeinsam für Spiel (index.html) und Erzählbaum (karte.html). Alles bleibt ein Vorschlag:
// Die Seite schreibt nie in die Geschichte selbst, sondern nur eine Datei nach vorschlaege/eingang/
// auf dem Zweig "vorschlaege". Claude liest sie dort, setzt jede Änderung einzeln um und antwortet
// in vorschlaege/antworten/. Ablauf und Format: docs/vorschlaege.md
(() => {
  const SPEICHER = "yharnam-werkstatt-v1";
  const EINSTELLUNGEN = "yharnam-werkstatt-github";
  const MODUS = "yharnam-werkstatt-modus";
  const STANDARD = { owner: "kortjannis-web", repo: "BB-Game", zweig: "vorschlaege", basis: "main", token: "" };
  const ARTEN = {
    text: "Text geändert",
    einfuegen: "Absatz eingefügt",
    loeschen: "Absatz gestrichen",
    wahl: "Entscheidung umbenannt",
    "wahl-ziel": "Entscheidung führt woandershin",
    "wahl-folge": "Folgetext einer Entscheidung",
    "wahl-neu": "Neue Entscheidung",
    "wahl-loeschen": "Entscheidung gestrichen",
    "passage-neu": "Neue Passage",
    "passage-loeschen": "Passage gestrichen",
    "passage-titel": "Passage umbenannt",
    quelle: "Quelltext (Mechanik) geändert",
    notiz: "Notiz",
    datei: "Datei angehängt",
  };

  // ------------------------------------------------------------ Speicher (immer in try/catch)
  const lesen = (k, f) => {
    try {
      return JSON.parse(localStorage.getItem(k) ?? "null") ?? f;
    } catch {
      return f;
    }
  };
  const schreiben = (k, v) => {
    try {
      localStorage.setItem(k, JSON.stringify(v));
      return true;
    } catch {
      return false;
    }
  };
  let daten = lesen(SPEICHER, { aenderungen: [], eingereicht: [], zaehler: 0 });
  daten.aenderungen ??= [];
  daten.eingereicht ??= [];
  daten.zaehler ??= 0;
  const einstellungen = () => ({ ...STANDARD, ...lesen(EINSTELLUNGEN, {}) });
  const hoerer = new Set();
  const melden = () => {
    schreiben(SPEICHER, daten);
    for (const f of hoerer) f(daten.aenderungen);
    zaehlerZeigen();
  };
  // Zwischen Spiel und Baum in zwei Tabs: Änderungen des anderen Tabs übernehmen.
  window.addEventListener("storage", (e) => {
    if (e.key !== SPEICHER) return;
    daten = lesen(SPEICHER, daten);
    for (const f of hoerer) f(daten.aenderungen);
    zaehlerZeigen();
  });

  /** Dieselbe Sache zweimal bearbeitet = eine Änderung (die letzte Fassung gilt, das erste "vorher" bleibt). */
  function schluessel(a) {
    if (a.art === "text" || a.art === "loeschen") return `${a.art}|${a.passage ?? ""}|${a.vorher}`;
    if (a.art === "wahl" || a.art === "wahl-ziel" || a.art === "wahl-loeschen" || a.art === "wahl-folge") return `${a.art}|${a.passage ?? ""}|${a.wahlText ?? a.vorher}|${a.vorher}`;
    if (a.art === "passage-neu") return `${a.art}|${a.passage}`;
    if (a.art === "passage-loeschen" || a.art === "passage-titel") return `${a.art}|${a.passage}`;
    if (a.art === "quelle") return `${a.art}|${a.datei}|${a.knoten ?? "*"}`;
    return null;
  }

  function hinzufuegen(a) {
    const s = schluessel(a);
    const alt = s && daten.aenderungen.find((x) => schluessel(x) === s);
    if (alt) {
      const vorher = alt.vorher;
      Object.assign(alt, a, { id: alt.id, vorher: vorher ?? a.vorher, zeit: new Date().toISOString() });
      // Zurück auf den Ausgangstext: dann ist es keine Änderung mehr.
      if ((a.art === "text" || a.art === "wahl" || a.art === "quelle" || a.art === "passage-titel" || a.art === "wahl-folge") && alt.nachher === alt.vorher) {
        daten.aenderungen = daten.aenderungen.filter((x) => x !== alt);
      }
      melden();
      return alt;
    }
    const neu = { id: `v${++daten.zaehler}`, zeit: new Date().toISOString(), seite: document.body.dataset.seite ?? "", ...a };
    daten.aenderungen.push(neu);
    melden();
    return neu;
  }
  function aendern(id, patch) {
    const a = daten.aenderungen.find((x) => x.id === id);
    if (a) Object.assign(a, patch, { zeit: new Date().toISOString() });
    melden();
    return a;
  }
  function entfernen(id) {
    daten.aenderungen = daten.aenderungen.filter((x) => x.id !== id);
    melden();
  }

  // ------------------------------------------------------------ Quelltexte
  let quellePromise = null;
  const quelle = () => (quellePromise ??= fetch("quelle.json").then((r) => r.json()));
  const knotenText = (q, id) => {
    const k = q.knoten[id];
    if (!k) return null;
    return q.dateien[k.datei].split("\n").slice(k.von - 1, k.bis).join("\n");
  };
  /** Quelltexte mit allen Quelltext-Vorschlägen (für das Testen im Browser). */
  async function quellenMitAenderungen() {
    const q = await quelle();
    const dateien = { ...q.dateien };
    const fehler = [];
    for (const a of daten.aenderungen.filter((x) => x.art === "quelle")) {
      if (!a.knoten) dateien[a.datei] = a.nachher;
      else if (dateien[a.datei]?.includes(a.vorher)) dateien[a.datei] = dateien[a.datei].replace(a.vorher, a.nachher);
      else fehler.push(a.knoten);
    }
    return { dateien, fehler };
  }
  /** Wo steht eine Zeile im Ink-Quelltext? Grobe Suche über die ersten Wörter. */
  async function finden(text) {
    const q = await quelle();
    const probe = text.replace(/\s+/g, " ").trim().slice(0, 48);
    if (probe.length < 8) return null;
    for (const [datei, inhalt] of Object.entries(q.dateien)) {
      if (!datei.endsWith(".ink")) continue;
      const i = inhalt.split("\n").findIndex((z) => z.includes(probe));
      if (i >= 0) return { datei, zeile: i + 1 };
    }
    return null;
  }
  /** Ink-Pfad (z. B. "k1_hub_b.wohin.0.c-2") auf den längsten bekannten Knoten/Stitch kürzen. */
  async function passageVonPfad(pfad) {
    if (!pfad) return null;
    const q = await quelle();
    const teile = pfad.split(".");
    for (let n = Math.min(2, teile.length); n > 0; n--) {
      const id = teile.slice(0, n).join(".");
      if (q.knoten[id]) return id;
    }
    return teile[0] || null;
  }

  // ------------------------------------------------------------ Modus (Lesen / Bearbeiten)
  const modusHoerer = new Set();
  let bearbeiten = lesen(MODUS, false) === true;
  function modusSetzen(an) {
    bearbeiten = !!an;
    schreiben(MODUS, bearbeiten);
    document.body.classList.toggle("bearbeiten", bearbeiten);
    for (const b of document.querySelectorAll("[data-werkstatt-modus]")) {
      b.setAttribute("aria-pressed", String(bearbeiten));
      b.textContent = bearbeiten ? "✎ Bearbeiten an" : "✎ Bearbeiten";
    }
    for (const f of modusHoerer) f(bearbeiten);
  }

  // ------------------------------------------------------------ Hilfen für die Oberfläche
  const el = (tag, cls, text) => {
    const e = document.createElement(tag);
    if (cls) e.className = cls;
    if (text !== undefined) e.textContent = text;
    return e;
  };
  const knopf = (text, onclick, cls = "") => {
    const b = el("button", cls, text);
    b.type = "button";
    b.onclick = onclick;
    return b;
  };
  /** Bestätigung in der Seite (kein confirm()): erster Klick fragt, zweiter führt aus. */
  function sicherKnopf(text, frage, aktion, cls = "") {
    const b = knopf(text, () => {
      if (!b.dataset.sicher) {
        b.dataset.sicher = "1";
        b.textContent = frage;
        setTimeout(() => {
          delete b.dataset.sicher;
          b.textContent = text;
        }, 4000);
        return;
      }
      aktion();
    }, cls);
    return b;
  }
  function hinweis(text, art = "") {
    let box = document.getElementById("ws-hinweis");
    if (!box) {
      box = el("div", "ws-hinweis");
      box.id = "ws-hinweis";
      box.setAttribute("role", "status");
      document.body.appendChild(box);
    }
    box.textContent = text;
    box.dataset.art = art;
    box.classList.add("sichtbar");
    clearTimeout(hinweis.t);
    hinweis.t = setTimeout(() => box.classList.remove("sichtbar"), 3200);
  }
  const autoHoehe = (t) => {
    const f = () => {
      t.style.height = "auto";
      t.style.height = `${t.scrollHeight + 2}px`;
    };
    t.addEventListener("input", f);
    requestAnimationFrame(f);
    return t;
  };
  function dialog(id, titel) {
    let d = document.getElementById(id);
    if (!d) {
      d = el("dialog", "ws-dialog");
      d.id = id;
      document.body.appendChild(d);
    }
    d.innerHTML = "";
    const kopf = el("div", "ws-kopf");
    kopf.appendChild(el("h2", "", titel));
    kopf.appendChild(knopf("×", () => d.close(), "ws-zu"));
    d.appendChild(kopf);
    return d;
  }
  const kurz = (s, n = 90) => (s && s.length > n ? `${s.slice(0, n - 1)}…` : s ?? "");

  // ------------------------------------------------------------ Quelltext-Editor (Mechanik, Ink)
  async function quelltextOeffnen(id, { datei: dateiWahl } = {}) {
    const q = await quelle();
    const d = dialog("ws-quelle", "Quelltext");
    d.classList.add("breit");
    const auswahl = el("select", "ws-auswahl");
    const optionen = [];
    for (const k of Object.keys(q.knoten)) optionen.push([`k:${k}`, `${k}  (${q.knoten[k].datei.replace("story/", "")})`]);
    for (const f of Object.keys(q.dateien)) optionen.push([`d:${f}`, `Ganze Datei: ${f}`]);
    for (const [v, t] of optionen) {
      const o = el("option", "", t);
      o.value = v;
      auswahl.appendChild(o);
    }
    const start = id && q.knoten[id] ? `k:${id}` : dateiWahl ? `d:${dateiWahl}` : optionen[0][0];
    auswahl.value = start;
    const info = el("p", "ws-info");
    const feld = el("textarea", "ws-code");
    feld.spellcheck = false;
    const warum = el("textarea", "ws-warum");
    warum.placeholder = "Warum? (optional, hilft mir, deine Absicht zu verstehen)";
    warum.rows = 2;
    const leiste = el("div", "ws-leiste");
    d.append(auswahl, info, feld, warum, leiste);

    let aktuell = null;
    function laden() {
      const [art, name] = [auswahl.value.slice(0, 1), auswahl.value.slice(2)];
      const datei = art === "k" ? q.knoten[name].datei : name;
      const knoten = art === "k" ? name : null;
      const vorher = knoten ? knotenText(q, knoten) : q.dateien[datei];
      const vorhanden = daten.aenderungen.find((a) => a.art === "quelle" && a.datei === datei && (a.knoten ?? null) === knoten);
      aktuell = { datei, knoten, vorher, vorhanden };
      feld.value = vorhanden?.nachher ?? vorher;
      warum.value = vorhanden?.kommentar ?? "";
      const z = knoten ? `Zeilen ${q.knoten[knoten].von}–${q.knoten[knoten].bis}` : "ganze Datei";
      const ink = datei.endsWith(".ink");
      info.textContent = `${datei} · ${z}${vorhanden ? " · enthält deinen Vorschlag" : ""}${ink ? "" : " · nur als Vorschlag, im Browser nicht testbar"}`;
      leiste.innerHTML = "";
      leiste.append(
        knopf("Als Vorschlag speichern", () => speichern(false), "ws-haupt"),
        ...(ink ? [knopf("Speichern und testen", () => speichern(true))] : []),
        ...(vorhanden ? [sicherKnopf("Vorschlag verwerfen", "Wirklich verwerfen?", () => {
          entfernen(vorhanden.id);
          laden();
          hinweis("Quelltext-Vorschlag verworfen.");
        })] : []),
        knopf("Schließen", () => d.close()),
      );
      autoHoehe(feld);
    }
    function speichern(testen) {
      const { datei, knoten, vorher } = aktuell;
      if (feld.value === vorher && !aktuell.vorhanden) {
        hinweis("Nichts geändert.");
        if (!testen) return;
      } else {
        hinzufuegen({ art: "quelle", datei, knoten, passage: knoten, vorher, nachher: feld.value, kommentar: warum.value.trim() || undefined });
        hinweis("Quelltext als Vorschlag gespeichert.");
      }
      if (testen) testen_(knoten);
      else laden();
    }
    // Tab im Code-Feld einfügen statt den Fokus zu verlieren.
    feld.addEventListener("keydown", (e) => {
      if (e.key !== "Tab" || e.shiftKey) return;
      e.preventDefault();
      const { selectionStart: a, selectionEnd: b } = feld;
      feld.setRangeText("    ", a, b, "end");
    });
    auswahl.onchange = laden;
    laden();
    d.showModal();
  }

  /** Spiel mit allen Quelltext-Vorschlägen öffnen, ab einer Passage (oder von vorn). */
  function testen_(ab) {
    const url = new URL("index.html", location.href);
    url.searchParams.set("test", "1");
    if (ab) url.searchParams.set("ab", ab);
    location.href = url.toString();
  }

  // ------------------------------------------------------------ Notiz und Datei anhängen
  function notizOeffnen(kontext = {}) {
    const d = dialog("ws-notiz", "Notiz an Claude");
    const t = autoHoehe(el("textarea", "ws-text"));
    t.rows = 5;
    t.placeholder = kontext.passage
      ? "Was fällt dir an dieser Stelle auf? Was soll anders sein, auch Mechanik, Tempo, Gefühl …"
      : "Was soll anders sein? Ideen, Mechanik, ganze Bereiche …";
    if (kontext.passage) d.appendChild(el("p", "ws-info", `Zu: ${kontext.titel ?? kontext.passage}`));
    d.appendChild(t);
    d.appendChild(el("div", "ws-leiste")).append(
      knopf("Notiz speichern", () => {
        if (!t.value.trim()) return d.close();
        hinzufuegen({ art: "notiz", ...kontext, nachher: t.value.trim() });
        hinweis("Notiz gespeichert.");
        d.close();
      }, "ws-haupt"),
      knopf("Abbrechen", () => d.close()),
    );
    d.showModal();
    t.focus();
  }
  function dateiAnhaengen() {
    const input = el("input");
    input.type = "file";
    input.accept = ".twee,.tw,.ink,.txt,.md,.json,.js,.css,.html";
    input.onchange = async () => {
      const f = input.files?.[0];
      if (!f) return;
      if (f.size > 900_000) return hinweis("Die Datei ist zu groß (höchstens etwa 900 KB).", "fehler");
      hinzufuegen({ art: "datei", name: f.name, nachher: await f.text() });
      hinweis(`${f.name} angehängt.`);
      oeffnen();
    };
    input.click();
  }

  // ------------------------------------------------------------ GitHub
  const b64 = (s) => {
    const bytes = new TextEncoder().encode(s);
    let bin = "";
    for (let i = 0; i < bytes.length; i += 0x8000) bin += String.fromCharCode(...bytes.subarray(i, i + 0x8000));
    return btoa(bin);
  };
  const ausB64 = (s) => new TextDecoder().decode(Uint8Array.from(atob(s.replace(/\s/g, "")), (c) => c.charCodeAt(0)));
  async function gh(pfad, { method = "GET", body } = {}) {
    const e = einstellungen();
    const r = await fetch(`https://api.github.com/repos/${e.owner}/${e.repo}${pfad}`, {
      method,
      headers: { Accept: "application/vnd.github+json", Authorization: `Bearer ${e.token}`, "X-GitHub-Api-Version": "2022-11-28", ...(body ? { "Content-Type": "application/json" } : {}) },
      body: body ? JSON.stringify(body) : undefined,
    });
    const json = await r.json().catch(() => ({}));
    if (!r.ok) throw Object.assign(new Error(json.message || `GitHub antwortet ${r.status}`), { status: r.status });
    return json;
  }
  async function zweigSicherstellen() {
    const e = einstellungen();
    try {
      await gh(`/git/ref/heads/${encodeURIComponent(e.zweig)}`);
    } catch (err) {
      if (err.status !== 404) throw err;
      const basis = await gh(`/git/ref/heads/${encodeURIComponent(e.basis)}`);
      await gh("/git/refs", { method: "POST", body: { ref: `refs/heads/${e.zweig}`, sha: basis.object.sha } });
    }
  }
  const dateiname = (titel) => {
    const d = new Date();
    const p = (n) => String(n).padStart(2, "0");
    const slug = (titel || "vorschlag").toLowerCase().replace(/ä/g, "ae").replace(/ö/g, "oe").replace(/ü/g, "ue").replace(/ß/g, "ss").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 40) || "vorschlag";
    return `${d.getFullYear()}-${p(d.getMonth() + 1)}-${p(d.getDate())}-${p(d.getHours())}${p(d.getMinutes())}-${slug}.json`;
  };
  function paket(titel, kommentar) {
    return {
      format: "yharnam-vorschlag-1",
      erstellt: new Date().toISOString(),
      titel: titel || "Vorschläge",
      kommentar: kommentar || undefined,
      geraet: navigator.userAgent,
      aenderungen: daten.aenderungen,
    };
  }
  async function einreichen(titel, kommentar) {
    const e = einstellungen();
    if (!e.token) throw new Error("Noch kein GitHub-Schlüssel eingetragen (unten bei Einstellungen).");
    if (!daten.aenderungen.length) throw new Error("Es gibt noch nichts einzureichen.");
    await zweigSicherstellen();
    const name = dateiname(titel);
    const inhalt = JSON.stringify(paket(titel, kommentar), null, 2);
    const r = await gh(`/contents/vorschlaege/eingang/${name}`, {
      method: "PUT",
      body: { message: `Vorschlag: ${titel || name} (${daten.aenderungen.length} Änderungen)`, content: b64(inhalt), branch: e.zweig },
    });
    daten.eingereicht.unshift({ name, titel: titel || "Vorschläge", zeit: new Date().toISOString(), anzahl: daten.aenderungen.length, url: r.content?.html_url, aenderungen: daten.aenderungen.map((a) => ({ id: a.id, art: a.art, kurz: kurz(a.nachher ?? a.text ?? a.titel ?? "", 70) })) });
    daten.aenderungen = [];
    melden();
    return name;
  }
  async function antwortenHolen() {
    const e = einstellungen();
    if (!e.token) return {};
    try {
      const liste = await gh(`/contents/vorschlaege/antworten?ref=${encodeURIComponent(e.zweig)}`);
      const out = {};
      await Promise.all(liste.filter((f) => f.name.endsWith(".json")).map(async (f) => {
        const datei = await gh(`/contents/${f.path}?ref=${encodeURIComponent(e.zweig)}`);
        try {
          out[f.name] = JSON.parse(ausB64(datei.content));
        } catch {
          /* unlesbare Antwort überspringen */
        }
      }));
      return out;
    } catch (err) {
      if (err.status === 404) return {};
      throw err;
    }
  }
  function herunterladen(titel, kommentar) {
    const blob = new Blob([JSON.stringify(paket(titel, kommentar), null, 2)], { type: "application/json" });
    const a = el("a");
    a.href = URL.createObjectURL(blob);
    a.download = dateiname(titel);
    document.body.appendChild(a);
    a.click();
    setTimeout(() => {
      URL.revokeObjectURL(a.href);
      a.remove();
    }, 1000);
  }

  // ------------------------------------------------------------ Das Werkstatt-Fenster
  function beschreibung(a) {
    const box = el("div", "ws-aenderung");
    const kopf = el("div", "ws-a-kopf");
    kopf.appendChild(el("b", "", ARTEN[a.art] ?? a.art));
    if (a.titel || a.passage) kopf.appendChild(el("span", "ws-ort", a.titel ?? a.passage));
    box.appendChild(kopf);
    const zeile = (cls, t) => t && box.appendChild(el("p", cls, kurz(t, 260)));
    if (a.art === "quelle") {
      box.appendChild(el("p", "ws-ort", `${a.datei}${a.knoten ? ` › ${a.knoten}` : ""}`));
      const plus = a.nachher.split("\n").length - a.vorher.split("\n").length;
      zeile("ws-nachher", `${a.nachher.split("\n").length} Zeilen (${plus >= 0 ? "+" : ""}${plus})`);
    } else if (a.art === "passage-neu") {
      zeile("ws-nachher", a.titel);
      zeile("ws-nachher", (a.zeilen ?? []).join(" "));
      if (a.choices?.length) zeile("ws-ort", a.choices.map((c) => `› ${c.text}`).join("  "));
    } else if (a.art === "datei") {
      zeile("ws-nachher", `${a.name}, ${a.nachher.length.toLocaleString("de-DE")} Zeichen`);
    } else {
      if (a.vorher && a.art !== "loeschen" && a.art !== "passage-loeschen") zeile("ws-vorher", a.vorher);
      if (a.art === "loeschen" || a.art === "wahl-loeschen") zeile("ws-vorher ws-weg", a.vorher ?? a.text);
      else zeile("ws-nachher", a.nachher ?? a.text);
      if (a.ziel) zeile("ws-ort", `→ ${a.ziel}`);
    }
    const kommentar = el("input", "ws-kommentar");
    kommentar.placeholder = "Warum? (optional)";
    kommentar.value = a.kommentar ?? "";
    kommentar.onchange = () => aendern(a.id, { kommentar: kommentar.value.trim() || undefined });
    const fuss = el("div", "ws-a-fuss");
    fuss.append(kommentar);
    if (a.art === "quelle") fuss.append(knopf("Öffnen", () => quelltextOeffnen(a.knoten, { datei: a.datei })));
    fuss.append(knopf("Entfernen", () => {
      entfernen(a.id);
      box.remove();
      fensterZaehler();
    }, "ws-leise"));
    box.appendChild(fuss);
    return box;
  }

  let fensterZaehler = () => {};
  function oeffnen() {
    const d = dialog("ws-fenster", "Werkstatt");
    d.classList.add("breit");
    const e = einstellungen();
    const anzahl = el("p", "ws-info");
    fensterZaehler = () => {
      anzahl.textContent = daten.aenderungen.length
        ? `${daten.aenderungen.length} Vorschläge gesammelt. Alles bleibt Vorschlag, bis ich es mir angesehen habe.`
        : "Noch keine Vorschläge. Schalte oben „✎ Bearbeiten“ ein und klicke beim Spielen oder im Erzählbaum auf einen Absatz, eine Entscheidung oder eine Passage.";
    };
    fensterZaehler();
    d.appendChild(anzahl);

    const liste = el("div", "ws-liste");
    for (const a of [...daten.aenderungen].reverse()) liste.appendChild(beschreibung(a));
    d.appendChild(liste);

    const extra = el("div", "ws-leiste");
    extra.append(
      knopf("Notiz schreiben", () => notizOeffnen()),
      knopf("Quelltext und Mechanik", () => quelltextOeffnen()),
      knopf("Datei anhängen (z. B. aus Twine)", dateiAnhaengen),
      knopf("Mit allen Vorschlägen testen", () => testen_()),
    );
    d.appendChild(extra);

    const form = el("div", "ws-einreichen");
    form.appendChild(el("h3", "", "Einreichen"));
    const titel = el("input", "ws-feld");
    titel.placeholder = "Kurzer Titel, z. B. „Gilbert lebendiger“";
    const kommentar = autoHoehe(el("textarea", "ws-feld"));
    kommentar.rows = 2;
    kommentar.placeholder = "Was war dir insgesamt wichtig? (optional)";
    const status = el("p", "ws-info");
    const senden = knopf("An GitHub senden", async () => {
      senden.disabled = true;
      status.textContent = "Wird gesendet …";
      try {
        const name = await einreichen(titel.value.trim(), kommentar.value.trim());
        hinweis("Eingereicht. Danke!");
        oeffnen();
        document.getElementById("ws-status-text").textContent = `Eingereicht als vorschlaege/eingang/${name} auf dem Zweig „${einstellungen().zweig}“.`;
      } catch (err) {
        status.textContent = `Nicht gesendet: ${err.message}. Die Vorschläge bleiben hier gespeichert.`;
        senden.disabled = false;
      }
    }, "ws-haupt");
    if (!daten.aenderungen.length) senden.disabled = true;
    const speichern = knopf("Als Datei speichern", () => herunterladen(titel.value.trim(), kommentar.value.trim()));
    // Wo weder GitHub noch Downloads erreichbar sind (z. B. im claude.ai-Artefakt): kopieren und in den Chat einfügen.
    const kopieren = knopf("Kopieren (für den Chat)", async () => {
      try {
        await navigator.clipboard.writeText(JSON.stringify(paket(titel.value.trim(), kommentar.value.trim()), null, 2));
        status.textContent = "Kopiert. Im Chat mit Claude einfügen; danach hier „Alle verwerfen“, wenn du magst.";
      } catch {
        status.textContent = "Kopieren hat der Browser nicht erlaubt.";
      }
    });
    form.append(titel, kommentar, el("div", "ws-leiste"), status);
    form.querySelector(".ws-leiste").append(senden, speichern, kopieren, ...(daten.aenderungen.length ? [sicherKnopf("Alle verwerfen", "Wirklich alle verwerfen?", () => {
      daten.aenderungen = [];
      melden();
      oeffnen();
    }, "ws-leise")] : []));
    status.id = "ws-status-text";
    d.appendChild(form);

    // Eingereichte Vorschläge und Claudes Antworten
    if (daten.eingereicht.length) {
      const hist = el("details", "ws-historie");
      hist.appendChild(el("summary", "", `Eingereicht (${daten.eingereicht.length}) und Antworten`));
      const box = el("div");
      hist.appendChild(box);
      hist.addEventListener("toggle", async () => {
        if (!hist.open || box.dataset.geladen) return;
        box.dataset.geladen = "1";
        box.textContent = "Antworten werden geladen …";
        let antworten = {};
        try {
          antworten = await antwortenHolen();
        } catch (err) {
          box.textContent = `Antworten nicht abrufbar (${err.message}).`;
        }
        box.textContent = "";
        for (const v of daten.eingereicht) {
          const a = antworten[v.name];
          const item = el("div", "ws-aenderung");
          const k = el("div", "ws-a-kopf");
          k.append(el("b", "", v.titel), el("span", "ws-ort", `${new Date(v.zeit).toLocaleString("de-DE")} · ${v.anzahl} Änderungen`));
          item.appendChild(k);
          item.appendChild(el("p", a ? "ws-nachher" : "ws-ort", a ? (a.zusammenfassung ?? "Bearbeitet.") : "Noch nicht bearbeitet."));
          if (a?.aenderungen) {
            const ul = el("ul", "ws-antworten");
            for (const [id, x] of Object.entries(a.aenderungen)) {
              const li = el("li");
              li.append(el("b", `ws-st ws-st-${(x.status ?? "").replace(/\W/g, "")}`, x.status ?? "?"), document.createTextNode(` ${id}: ${x.notiz ?? ""}`));
              ul.appendChild(li);
            }
            item.appendChild(ul);
          }
          box.appendChild(item);
        }
      });
      d.appendChild(hist);
    }

    // Einstellungen
    const ein = el("details", "ws-einstellungen");
    if (!e.token) ein.open = true;
    ein.appendChild(el("summary", "", e.token ? "GitHub-Verbindung (eingerichtet)" : "GitHub-Verbindung einrichten (einmalig)"));
    const erkl = el("div", "ws-info");
    erkl.innerHTML = `Damit die Seite deine Vorschläge ins Repository legen kann, braucht sie einen eigenen Schlüssel, der nur für dieses eine Repository gilt.
      <ol>
        <li><a target="_blank" rel="noopener" href="https://github.com/settings/personal-access-tokens/new?name=Yharnam-Werkstatt&description=Vorschl%C3%A4ge%20aus%20der%20Spiel-Werkstatt&target_name=${encodeURIComponent(e.owner)}&expires_in=366&contents=write">Fein abgestimmten Schlüssel auf GitHub anlegen</a>.</li>
        <li>Bei <i>Repository access</i> „Only select repositories“ und nur <b>${e.repo}</b> wählen.</li>
        <li>Bei <i>Permissions → Repository</i> nur <b>Contents: Read and write</b> setzen.</li>
        <li>Erzeugen, kopieren und hier einfügen. Er bleibt nur in diesem Browser.</li>
      </ol>`;
    ein.appendChild(erkl);
    const felder = el("div", "ws-felder");
    const feld = (name, wert, art = "text") => {
      const l = el("label", "", name);
      const i = el("input", "ws-feld");
      i.type = art;
      i.value = wert;
      i.autocomplete = "off";
      i.spellcheck = false;
      l.appendChild(i);
      felder.appendChild(l);
      return i;
    };
    const fToken = feld("Schlüssel", e.token, "password");
    fToken.placeholder = "github_pat_…";
    const fOwner = feld("Besitzer", e.owner);
    const fRepo = feld("Repository", e.repo);
    const fZweig = feld("Zweig für Vorschläge", e.zweig);
    ein.appendChild(felder);
    const pruefStatus = el("p", "ws-info");
    ein.appendChild(el("div", "ws-leiste")).append(
      knopf("Speichern und prüfen", async () => {
        const neu = { owner: fOwner.value.trim(), repo: fRepo.value.trim(), zweig: fZweig.value.trim() || "vorschlaege", token: fToken.value.trim() };
        if (!schreiben(EINSTELLUNGEN, neu)) return (pruefStatus.textContent = "Dieser Browser erlaubt keinen Speicher; der Schlüssel kann nicht gemerkt werden.");
        pruefStatus.textContent = "Prüfe …";
        try {
          const r = await gh("");
          pruefStatus.textContent = r.permissions?.push === false ? "Verbunden, aber ohne Schreibrecht. Bitte „Contents: Read and write“ setzen." : `Verbunden mit ${r.full_name}.`;
        } catch (err) {
          pruefStatus.textContent = `Keine Verbindung: ${err.message}`;
        }
      }),
      sicherKnopf("Schlüssel vergessen", "Wirklich vergessen?", () => {
        schreiben(EINSTELLUNGEN, { ...einstellungen(), token: "" });
        oeffnen();
      }, "ws-leise"),
    );
    ein.appendChild(pruefStatus);
    d.appendChild(ein);

    if (!d.open) d.showModal();
  }

  // ------------------------------------------------------------ Schwebender Knopf
  function zaehlerZeigen() {
    const z = document.getElementById("ws-zahl");
    if (z) {
      z.textContent = daten.aenderungen.length;
      z.hidden = !daten.aenderungen.length;
    }
  }
  function einbauen() {
    const b = knopf("", oeffnen, "ws-schwebe");
    b.id = "ws-knopf";
    b.title = "Werkstatt: deine Vorschläge";
    b.append(document.createTextNode("Werkstatt "), el("span", "ws-zahl"));
    b.querySelector(".ws-zahl").id = "ws-zahl";
    document.body.appendChild(b);
    for (const m of document.querySelectorAll("[data-werkstatt-modus]")) m.addEventListener("click", () => modusSetzen(!bearbeiten));
    modusSetzen(bearbeiten);
    zaehlerZeigen();
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", einbauen);
  else einbauen();

  window.WERKSTATT = {
    ARTEN,
    liste: () => daten.aenderungen,
    hinzufuegen,
    aendern,
    entfernen,
    beiAenderung: (f) => hoerer.add(f),
    beiModus: (f) => modusHoerer.add(f),
    bearbeiten: () => bearbeiten,
    modusSetzen,
    quelle,
    knotenText,
    quellenMitAenderungen,
    finden,
    passageVonPfad,
    quelltextOeffnen,
    notizOeffnen,
    testen: testen_,
    oeffnen,
    hinweis,
    hilfen: { el, knopf, sicherKnopf, autoHoehe, kurz },
  };
})();
