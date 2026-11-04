// Spieloberfläche: zeigt die Geschichte Absatz für Absatz, die Entscheidungen, Vignette, Leiste und Notizbuch.
// Mit der Werkstatt (werkstatt.js): Im Modus "Bearbeiten" lässt sich jeder Absatz und jede Entscheidung ändern,
// streichen oder ergänzen. Die Änderungen sind Vorschläge; sie werden beim Weiterspielen schon so angezeigt.
// ?test=1   spielt eine im Browser kompilierte Fassung mit allen Quelltext-Vorschlägen (Mechanik)
// ?ab=knoten  beginnt direkt an einer Passage (zum Ausprobieren; eigener Spielstand)
(() => {
  const PARAM = new URLSearchParams(location.search);
  const TEST = PARAM.get("test") === "1";
  const AB = PARAM.get("ab");
  const PROBE = TEST || !!AB;
  const SPEICHER = PROBE ? "yharnam-spielstand-probe" : "yharnam-spielstand-v1";
  const W = window.WERKSTATT;
  const $ = (id) => document.getElementById(id);
  const text = $("text");
  const wahl = $("wahl");
  let story = null;
  let notizen = [];
  let letzterPfad = "";
  let letzteWahl = "";

  const speichern = () => {
    try {
      const absaetze = [...text.children]
        .filter((el) => !el.classList.contains("eingefuegt") && !el.classList.contains("ws-werkzeug") && el.tagName !== "TEXTAREA")
        .slice(-40)
        .map((el) => ({ tag: el.tagName, html: el.dataset.orig === undefined ? el.innerHTML : "", orig: el.dataset.orig, pfad: el.dataset.pfad, cls: el.className.replace(/\b(geaendert|gestrichen)\b/g, "").trim() }));
      localStorage.setItem(SPEICHER, JSON.stringify({ state: story.state.toJson(), notizen, absaetze, stimmung: document.body.dataset.stimmung, pfad: letzterPfad }));
    } catch {
      /* Speichern ist Komfort; ohne Speicher läuft das Spiel trotzdem. */
    }
  };
  const laden = () => {
    try {
      return JSON.parse(localStorage.getItem(SPEICHER) ?? "null");
    } catch {
      return null;
    }
  };

  const wert = (name) => story.variablesState[name];

  function leisteAktualisieren() {
    $("h-echos").textContent = wert("echos");
    $("h-einsicht").textContent = wert("einsicht");
    $("h-ampulle").textContent = wert("ampulle");
    const marken = wert("jaegermarken");
    $("h-marken-wrap").hidden = !marken;
    $("h-marken").textContent = marken;
    const leben = wert("leben");
    const v = $("vignette");
    if (leben <= 3 && leben >= 1) v.dataset.leben = String(leben);
    else delete v.dataset.leben;
  }

  function absatz(zeile, tags, pfad) {
    const p = document.createElement("p");
    p.textContent = zeile;
    p.dataset.orig = zeile;
    if (pfad) p.dataset.pfad = pfad;
    for (const tag of tags) {
      const [schluessel, ...rest] = tag.split(":");
      const k = schluessel.trim();
      const v = rest.join(":").trim();
      if (k === "stil") p.classList.add(v);
      if (k === "anzeichen") p.classList.add("anzeichen");
      if (k === "tod") p.classList.add("tod");
      if (k === "gedaechtnis") p.classList.add("gedaechtnis");
      if (k === "stimmung") document.body.dataset.stimmung = v;
      if (k === "lore" && window.NOTIZBUCH[v] && !notizen.includes(v)) notizen.push(v);
    }
    return p;
  }

  function weiter() {
    let erster = null;
    while (story.canContinue) {
      const pfad = story.state.currentPathString || letzterPfad;
      const zeile = story.Continue().trim();
      const tags = story.currentTags ?? [];
      const p = absatz(zeile, tags, pfad);
      if (pfad) letzterPfad = pfad;
      if (!zeile) continue;
      text.appendChild(p);
      erster ??= p;
    }
    ueberarbeitungAnwenden();
    leisteAktualisieren();
    zeigeWahl();
    baumLink();
    if (erster) erster.scrollIntoView({ behavior: "smooth", block: "start" });
    speichern();
  }

  // ------------------------------------------------------------ Vorschläge anzeigen
  function vorschlaege() {
    const T = new Map();
    const weg = new Set();
    const ein = new Map();
    const wahlNeu = new Map();
    const wahlWeg = new Set();
    for (const a of W?.liste() ?? []) {
      if (a.art === "text") T.set(a.vorher, a);
      if (a.art === "loeschen") weg.add(a.vorher);
      if (a.art === "einfuegen") ein.set(a.nach, [...(ein.get(a.nach) ?? []), a]);
      if (a.art === "wahl") wahlNeu.set(a.vorher, a);
      if (a.art === "wahl-loeschen") wahlWeg.add(a.vorher);
    }
    return { T, weg, ein, wahlNeu, wahlWeg };
  }

  function ueberarbeitungAnwenden() {
    const { T, weg, ein } = vorschlaege();
    for (const e of text.querySelectorAll("p.eingefuegt")) e.remove();
    for (const p of text.querySelectorAll("p[data-orig]")) {
      if (p.hidden) continue;
      const orig = p.dataset.orig;
      const t = T.get(orig);
      p.textContent = t ? t.nachher : orig;
      p.classList.toggle("geaendert", !!t);
      p.classList.toggle("gestrichen", weg.has(orig));
      let anker = p;
      for (const a of ein.get(orig) ?? []) {
        const n = document.createElement("p");
        n.className = `eingefuegt${p.classList.contains("alt") ? " alt" : ""}`;
        n.textContent = a.nachher;
        n.dataset.vorschlag = a.id;
        n.dataset.pfad = p.dataset.pfad ?? "";
        anker.after(n);
        anker = n;
      }
    }
  }

  // ------------------------------------------------------------ Bearbeiten
  const passageVon = async (el) => (W ? W.passageVonPfad(el?.dataset.pfad || letzterPfad) : null);
  const kontext = () => ({ letzteWahl: letzteWahl || undefined, leben: wert("leben"), ampulle: wert("ampulle"), einsicht: wert("einsicht"), testfassung: TEST || undefined });

  function werkzeugSchliessen() {
    for (const w of text.querySelectorAll(".ws-werkzeug, textarea.ws-editor")) w.remove();
    for (const p of text.querySelectorAll("p[hidden]")) p.hidden = false;
  }

  async function absatzBearbeiten(p) {
    if (!W) return;
    werkzeugSchliessen();
    const { knopf, sicherKnopf, autoHoehe } = W.hilfen;
    const eingefuegtId = p.dataset.vorschlag;
    const orig = p.dataset.orig;
    const vorhanden = eingefuegtId ? null : W.liste().find((a) => a.art === "text" && a.vorher === orig);
    const ta = autoHoehe(document.createElement("textarea"));
    ta.className = "ws-editor";
    ta.value = p.textContent;
    p.hidden = true;
    p.after(ta);
    const leiste = document.createElement("div");
    leiste.className = "ws-werkzeug";
    ta.after(leiste);
    ta.focus();
    const passage = await passageVon(p);
    const ort = async () => ({ pfad: p.dataset.pfad, ...((await W.finden(orig ?? "")) ?? {}) });

    const uebernehmen = async () => {
      const neu = ta.value.trim();
      if (eingefuegtId) {
        if (neu) W.aendern(eingefuegtId, { nachher: neu });
        else W.entfernen(eingefuegtId);
      } else if (neu === orig) {
        if (vorhanden) W.entfernen(vorhanden.id);
      } else if (!neu) {
        W.hinzufuegen({ art: "loeschen", passage, vorher: orig, ort: await ort(), kontext: kontext() });
      } else {
        W.hinzufuegen({ art: "text", passage, vorher: orig, nachher: neu, ort: await ort(), kontext: kontext() });
      }
      werkzeugSchliessen();
      ueberarbeitungAnwenden();
    };
    ta.addEventListener("keydown", (e) => {
      if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) uebernehmen();
      if (e.key === "Escape") werkzeugSchliessen();
    });
    leiste.append(knopf("Übernehmen", uebernehmen, "ws-haupt"));
    if (!eingefuegtId) {
      leiste.append(
        knopf("Absatz danach einfügen", async () => {
          const a = W.hinzufuegen({ art: "einfuegen", passage, nach: orig, nachher: "…", ort: await ort(), kontext: kontext() });
          werkzeugSchliessen();
          ueberarbeitungAnwenden();
          const n = text.querySelector(`p.eingefuegt[data-vorschlag="${a.id}"]`);
          if (n) absatzBearbeiten(n);
        }),
        p.classList.contains("gestrichen")
          ? knopf("Wieder aufnehmen", () => {
            const w = W.liste().find((a) => a.art === "loeschen" && a.vorher === orig);
            if (w) W.entfernen(w.id);
            werkzeugSchliessen();
            ueberarbeitungAnwenden();
          })
          : knopf("Streichen", async () => {
            W.hinzufuegen({ art: "loeschen", passage, vorher: orig, ort: await ort(), kontext: kontext() });
            werkzeugSchliessen();
            ueberarbeitungAnwenden();
          }),
      );
      if (vorhanden) leiste.append(sicherKnopf("Original zurück", "Wirklich?", () => {
        W.entfernen(vorhanden.id);
        werkzeugSchliessen();
        ueberarbeitungAnwenden();
      }));
    } else {
      leiste.append(knopf("Entfernen", () => {
        W.entfernen(eingefuegtId);
        werkzeugSchliessen();
        ueberarbeitungAnwenden();
      }));
    }
    leiste.append(
      knopf("Notiz", () => W.notizOeffnen({ passage, vorher: orig, kontext: kontext() })),
      knopf("Quelltext", () => W.quelltextOeffnen(passage)),
      knopf("Abbrechen", werkzeugSchliessen, "ws-leise"),
    );
  }

  text.addEventListener("click", (e) => {
    if (!W?.bearbeiten()) return;
    const p = e.target.closest("p");
    if (!p || p.hidden || (p.dataset.orig === undefined && !p.dataset.vorschlag)) return;
    absatzBearbeiten(p);
  });

  // ------------------------------------------------------------ Entscheidungen
  function zeigeWahl(ruhig = false) {
    wahl.innerHTML = "";
    wahl.classList.toggle("ruhig", ruhig);
    if (story.currentChoices.length === 0) {
      const ende = document.createElement("p");
      ende.className = "zwischentitel";
      ende.textContent = "Kapitel zwei folgt.";
      wahl.appendChild(ende);
      const neu = document.createElement("button");
      neu.textContent = "Von vorn beginnen";
      neu.onclick = () => {
        try {
          localStorage.removeItem(SPEICHER);
        } catch {
          /* nichts zu löschen */
        }
        location.href = location.pathname;
      };
      wahl.appendChild(neu);
      wahlWerkzeuge();
      return;
    }
    const { wahlNeu, wahlWeg } = vorschlaege();
    story.currentChoices.forEach((c, i) => {
      const zeile = document.createElement("div");
      zeile.className = "wahlzeile";
      const b = document.createElement("button");
      const r = wahlNeu.get(c.text);
      b.textContent = r ? r.nachher : c.text;
      if (r) b.classList.add("geaendert");
      if (wahlWeg.has(c.text)) b.classList.add("gestrichen");
      b.onclick = () => waehlen(i);
      b.style.animationDelay = `${i * 60}ms`;
      zeile.appendChild(b);
      if (W) {
        const s = document.createElement("button");
        s.type = "button";
        s.className = "stift";
        s.title = "Diese Entscheidung bearbeiten";
        s.setAttribute("aria-label", `Entscheidung „${c.text}“ bearbeiten`);
        s.textContent = "✎";
        s.onclick = () => wahlBearbeiten(zeile, c.text);
        zeile.appendChild(s);
      }
      wahl.appendChild(zeile);
    });
    wahlWerkzeuge();
  }

  async function wahlBearbeiten(zeile, original) {
    const { knopf, el } = W.hilfen;
    const passage = await passageVon(null);
    const vorhanden = W.liste().find((a) => a.art === "wahl" && a.vorher === original);
    const gestrichen = W.liste().find((a) => a.art === "wahl-loeschen" && a.vorher === original);
    zeile.hidden = true;
    const box = el("div", "ws-werkzeug wahl-editor");
    const input = el("input", "ws-editor");
    input.value = vorhanden?.nachher ?? original;
    box.appendChild(input);
    const fertig = () => {
      box.remove();
      zeigeWahl(true);
    };
    box.append(
      knopf("Übernehmen", () => {
        const neu = input.value.trim();
        if (!neu || neu === original) {
          if (vorhanden) W.entfernen(vorhanden.id);
        } else W.hinzufuegen({ art: "wahl", passage, vorher: original, nachher: neu, kontext: kontext() });
        fertig();
      }, "ws-haupt"),
      gestrichen
        ? knopf("Wieder aufnehmen", () => {
          W.entfernen(gestrichen.id);
          fertig();
        })
        : knopf("Streichen", () => {
          W.hinzufuegen({ art: "wahl-loeschen", passage, vorher: original, kontext: kontext() });
          fertig();
        }),
      knopf("Notiz", () => W.notizOeffnen({ passage, vorher: original, kontext: kontext() })),
      knopf("Abbrechen", fertig, "ws-leise"),
    );
    input.addEventListener("keydown", (e) => {
      if (e.key === "Enter") box.querySelector(".ws-haupt").click();
      if (e.key === "Escape") fertig();
    });
    zeile.after(box);
    input.focus();
  }

  // Im Bearbeiten-Modus unter den Entscheidungen: eigene Vorschläge und Werkzeuge für die Stelle.
  async function wahlWerkzeuge() {
    if (!W) return;
    const { knopf, el, autoHoehe } = W.hilfen;
    const passage = await passageVon(null);
    const box = el("div", "nur-bearbeiten wahl-extra");
    for (const a of W.liste().filter((x) => x.art === "wahl-neu" && x.passage === passage)) {
      const b = el("button", "vorschlag", `${a.text}  (dein Vorschlag${a.ziel ? ` → ${a.ziel}` : ""})`);
      b.type = "button";
      b.title = "Vorgeschlagene Entscheidung: zum Bearbeiten klicken";
      b.onclick = () => neueWahl(a);
      box.appendChild(b);
    }
    const leiste = el("div", "ws-werkzeug");
    leiste.append(
      knopf("+ Entscheidung vorschlagen", () => neueWahl()),
      knopf("Notiz zu dieser Stelle", () => W.notizOeffnen({ passage, kontext: kontext() })),
      knopf("Quelltext dieser Stelle", () => W.quelltextOeffnen(passage)),
    );
    box.appendChild(leiste);
    wahl.appendChild(box);

    function neueWahl(vorhanden) {
      box.querySelector(".neue-wahl")?.remove();
      const f = el("div", "ws-werkzeug neue-wahl");
      const t = el("input", "ws-editor");
      t.placeholder = "Text der Entscheidung, z. B. „Gilbert nach seiner Heimat fragen“";
      t.value = vorhanden?.text ?? "";
      const folge = autoHoehe(el("textarea", "ws-editor"));
      folge.placeholder = "Was passiert dann? So ausführlich du willst.";
      folge.value = vorhanden?.folge ?? "";
      const ziel = el("input", "ws-editor");
      ziel.placeholder = "Wohin geht es danach? (Passage, z. B. k1_hub_b, oder frei beschrieben)";
      ziel.value = vorhanden?.ziel ?? "";
      ziel.setAttribute("list", "ws-passagen");
      W.quelle().then((q) => {
        if ($("ws-passagen")) return;
        const dl = el("datalist");
        dl.id = "ws-passagen";
        for (const k of Object.keys(q.knoten)) dl.appendChild(Object.assign(el("option"), { value: k }));
        document.body.appendChild(dl);
      });
      f.append(t, folge, ziel,
        knopf("Speichern", () => {
          if (!t.value.trim()) return f.remove();
          const werte = { art: "wahl-neu", passage, text: t.value.trim(), nachher: t.value.trim(), folge: folge.value.trim() || undefined, ziel: ziel.value.trim() || undefined, kontext: kontext() };
          if (vorhanden) W.aendern(vorhanden.id, werte);
          else W.hinzufuegen(werte);
          zeigeWahl(true);
        }, "ws-haupt"),
        ...(vorhanden ? [knopf("Entfernen", () => {
          W.entfernen(vorhanden.id);
          zeigeWahl(true);
        })] : []),
        knopf("Abbrechen", () => f.remove(), "ws-leise"),
      );
      leiste.before(f);
      t.focus();
    }
  }

  function waehlen(i) {
    werkzeugSchliessen();
    for (const p of text.querySelectorAll("p:not(.alt)")) p.classList.add("alt");
    const gewaehlt = document.createElement("p");
    gewaehlt.className = "alt";
    letzteWahl = story.currentChoices[i].text;
    const angezeigt = vorschlaege().wahlNeu.get(letzteWahl)?.nachher ?? letzteWahl;
    gewaehlt.innerHTML = "<em></em>";
    gewaehlt.firstChild.textContent = `› ${angezeigt}`;
    text.appendChild(gewaehlt);
    text.appendChild(document.createElement("hr"));
    story.ChooseChoiceIndex(i);
    weiter();
  }

  // Link in den Erzählbaum, direkt zur aktuellen Passage.
  async function baumLink() {
    const a = $("link-baum");
    if (!a || !W) return;
    const basis = a.dataset.basis ?? (a.dataset.basis = a.getAttribute("href"));
    const id = await W.passageVonPfad(letzterPfad);
    a.href = id ? `${basis}#p=${encodeURIComponent(id)}` : basis;
  }

  function zeigeSpiel() {
    $("titel").hidden = true;
    text.hidden = false;
    wahl.hidden = false;
    $("leiste").hidden = false;
  }

  // Bestätigung in der Seite selbst: erster Klick fragt nach, zweiter Klick löscht.
  function neuBeginnen(e) {
    const knopf = e?.currentTarget;
    if (knopf && !knopf.dataset.sicher) {
      knopf.dataset.sicher = "1";
      knopf.dataset.text = knopf.textContent;
      knopf.textContent = "Wirklich? Noch einmal klicken";
      setTimeout(() => {
        delete knopf.dataset.sicher;
        knopf.textContent = knopf.dataset.text;
      }, 4000);
      return;
    }
    try {
      localStorage.removeItem(SPEICHER);
    } catch {
      /* ohne Speicher gibt es nichts zu löschen */
    }
    location.reload();
  }

  // Notizbuch-Stufen: "var", "!var", "var>=2", "var==wert", verknüpft mit && und ||. Unbekannte Namen gelten als Knoten (Besuche).
  function groesse(name) {
    try {
      const v = story.variablesState[name];
      if (v !== undefined && v !== null) return typeof v === "object" && "count" in v ? v.count : v;
    } catch {
      /* kein Merker dieses Namens */
    }
    try {
      return story.state.VisitCountAtPathString(name);
    } catch {
      return 0;
    }
  }
  function bedingungGilt(ausdruck) {
    if (!ausdruck) return true;
    return ausdruck.split("||").some((oder) => oder.split("&&").every((teil) => {
      const m = teil.trim().match(/^(!)?([\w.]+)\s*(>=|<=|==|!=|>|<)?\s*(.*)$/);
      if (!m) return false;
      const [, nicht, name, op, rechts] = m;
      const v = groesse(name);
      let ok;
      if (!op) ok = !!v;
      else {
        const r = rechts.trim() === "" ? "" : Number.isNaN(Number(rechts)) ? rechts.trim() : Number(rechts);
        ok = { ">=": v >= r, "<=": v <= r, "==": v == r, "!=": v != r, ">": v > r, "<": v < r }[op];
      }
      return nicht ? !ok : ok;
    }));
  }

  function notizbuchZeigen() {
    const box = $("notizen");
    box.innerHTML = "";
    if (!notizen.length) box.innerHTML = '<p class="leer">Noch leer. Yharnam wird es füllen.</p>';
    for (const id of notizen) {
      const e = window.NOTIZBUCH[id];
      const titel = Array.isArray(e) ? e[0] : e.titel;
      const stufen = Array.isArray(e) ? [["", e[1]]] : e.stufen;
      const texte = stufen.filter(([b]) => bedingungGilt(b)).map(([, t]) => t);
      if (!texte.length) continue;
      const a = document.createElement("article");
      a.appendChild(document.createElement("h3")).textContent = titel;
      for (const t of texte) a.appendChild(document.createElement("p")).textContent = t;
      box.appendChild(a);
    }
    $("notizbuch").showModal();
  }

  // ------------------------------------------------------------ Geschichte laden (normal oder Testfassung)
  function skriptLaden(src) {
    return new Promise((ok, fehler) => {
      const s = document.createElement("script");
      s.src = src;
      s.onload = ok;
      s.onerror = () => fehler(new Error(`${src} fehlt`));
      document.head.appendChild(s);
    });
  }
  async function geschichte() {
    if (!TEST) return (await fetch("story.json")).text();
    await skriptLaden("ink-full.js");
    const { dateien, fehler } = await W.quellenMitAenderungen();
    const ink = Object.fromEntries(Object.entries(dateien).filter(([n]) => n.startsWith("story/")).map(([n, t]) => [n.slice(6), t]));
    const meldungen = [];
    const handler = (m, typ) => typ === 2 && meldungen.push(m);
    const options = new inkjs.CompilerOptions("main.ink", [], false, handler, new inkjs.JsonFileHandler(ink));
    let json = null;
    try {
      json = new inkjs.Compiler(ink["main.ink"], options).Compile()?.ToJson();
    } catch (e) {
      meldungen.push(String(e?.message ?? e));
    }
    const band = document.createElement("div");
    band.className = "ws-testband";
    const aenderungen = W.liste().filter((a) => a.art === "quelle").length;
    band.innerHTML = `Testfassung mit ${aenderungen} Quelltext-Vorschlägen${fehler.length ? ` (nicht anwendbar: ${fehler.join(", ")})` : ""} · <a href="${location.pathname}">zurück zum Original</a>`;
    document.body.prepend(band);
    if (!json || meldungen.length) {
      const e = new Error("Deine Quelltext-Änderungen kompilieren nicht");
      e.details = meldungen;
      throw e;
    }
    return json;
  }

  async function start() {
    const json = await geschichte();
    story = new inkjs.Story(json);
    document.body.dataset.stimmung = "ruhig";
    const gespeichert = laden();
    if (gespeichert) $("fortsetzen").hidden = false;

    const beginnen = (name) => {
      story.variablesState["name"] = name;
      zeigeSpiel();
      if (AB) {
        try {
          story.ChoosePathString(AB);
          letzterPfad = AB;
        } catch {
          W?.hinweis(`Die Passage ${AB} lässt sich nicht direkt anspringen; es geht von vorn los.`, "fehler");
        }
      }
      weiter();
    };
    $("namensform").addEventListener("submit", (e) => {
      e.preventDefault();
      if (gespeichert && $("warnung").hidden) {
        $("warnung").hidden = false;
        return;
      }
      beginnen($("name").value.trim() || "Jäger");
    });
    $("fortsetzen").addEventListener("click", () => {
      story.state.LoadJson(gespeichert.state);
      notizen = gespeichert.notizen ?? [];
      letzterPfad = gespeichert.pfad ?? "";
      document.body.dataset.stimmung = gespeichert.stimmung ?? "ruhig";
      for (const a of gespeichert.absaetze ?? []) {
        const el = document.createElement(a.tag === "HR" ? "hr" : "p");
        if (a.orig !== undefined) {
          el.textContent = a.orig;
          el.dataset.orig = a.orig;
          if (a.pfad) el.dataset.pfad = a.pfad;
        } else el.innerHTML = a.html;
        el.className = a.cls;
        text.appendChild(el);
      }
      ueberarbeitungAnwenden();
      zeigeSpiel();
      leisteAktualisieren();
      zeigeWahl();
      baumLink();
      wahl.scrollIntoView({ block: "end" });
    });
    $("knopf-notizbuch").addEventListener("click", notizbuchZeigen);
    $("neu").addEventListener("click", neuBeginnen);
    // Probe ab einer Passage: ohne Titelbildschirm sofort hinein.
    if (AB) beginnen("Jäger");

    W?.beiAenderung(() => {
      if (!story || $("titel").hidden === false) return;
      ueberarbeitungAnwenden();
      if (!wahl.querySelector(".wahl-editor, .neue-wahl")) zeigeWahl(true);
    });
    W?.beiModus(() => {
      if (!$("titel").hidden) return;
      werkzeugSchliessen();
    });
  }

  start().catch((e) => {
    const box = document.createElement("div");
    box.style.cssText = "padding:2rem;max-width:44rem;margin:3rem auto";
    const p = document.createElement("p");
    p.textContent = `Die Geschichte konnte nicht geladen werden (${e.message}).`;
    box.appendChild(p);
    if (e.details?.length) {
      const pre = document.createElement("pre");
      pre.style.cssText = "white-space:pre-wrap;font-size:0.8rem;color:#e0b0a0";
      pre.textContent = e.details.join("\n");
      box.appendChild(pre);
      const hilfe = document.createElement("p");
      hilfe.innerHTML = 'Öffne die Werkstatt (unten rechts) und korrigiere den Quelltext, oder <a href="index.html">spiele das Original</a>.';
      box.appendChild(hilfe);
    }
    $("buehne").replaceChildren(box);
  });
})();
