// Das ganze Buch: Bearbeiten wie im Spiel (Wunsch des Nutzers 2026-11-06).
// Alles wird ein Vorschlag in der gemeinsamen Werkstatt (web/werkstatt.js), eingereicht auf dem Zweig "vorschlaege"
// und von Claude umgesetzt (docs/vorschlaege.md). Die Seite schreibt nie in die Geschichte selbst.
// Was man hier tun kann:
//   Absatz anklicken: umschreiben, streichen, Absatz danach einfügen, Notiz zu diesem Absatz
//   Text markieren (auch über mehrere Absätze): Notiz zur Markierung
//   Entscheidung: Möglichkeit umbenennen, streichen, Notiz; neue Möglichkeit hinzufügen
//   Abschnitt (Knoten): Notiz zum Abschnitt, Absatz am Anfang/Ende, neue Entscheidung, neuer Abschnitt danach,
//   Titel ändern, ganzen Abschnitt streichen, Quelltext (Ink, mit Speichern und Testen)
// Absätze tragen data-orig (Text, wie er im Ink-Quelltext steht) und data-zeile; Abschnitte data-passage und data-datei.
// Speicherzugriffe laufen nur über die Werkstatt (dort in try/catch). Kein confirm()/alert() (Artefakt).
(() => {
  const W = window.WERKSTATT;
  if (!W) return;
  const { el, knopf, sicherKnopf, autoHoehe } = W.hilfen;
  const main = document.querySelector("main");
  const abschnitt = (e) => e?.closest("section[data-passage]");
  const passageVon = (e) => abschnitt(e)?.dataset.passage;
  const titelVon = (e) => abschnitt(e)?.querySelector("h3 .titel")?.textContent;
  const ortVon = (e) => {
    const s = abschnitt(e);
    const z = e?.dataset?.zeile ?? e?.closest?.("[data-zeile]")?.dataset.zeile;
    return s ? { datei: s.dataset.datei, zeile: z ? Number(z) : Number(s.dataset.zeile) } : undefined;
  };
  const kontext = () => ({ seite: "buch" });
  const fluechtig = ".eingefuegt, .kommentar, .buch-werkzeug, textarea.buch-editor, .option.neu, .neuer-abschnitt";

  // ------------------------------------------------------------ Vorschläge im Text zeigen
  function sprechblase(eintraege, verlauf) {
    if (!eintraege.length && !verlauf.length) return null;
    const box = el("div", "kommentar");
    const zeile = (wer, txt, cls) => {
      const z = el("p", cls);
      z.append(el("span", "wer", wer), document.createTextNode(` ${txt}`));
      box.appendChild(z);
      return z;
    };
    for (const a of verlauf) {
      zeile("Du:", a.frage ?? "", "frage");
      zeile(`Claude${a.status ? ` (${a.status})` : ""}:`, a.antwort ?? "", "claude");
    }
    for (const a of eintraege) {
      if (a.markiert) box.appendChild(el("p", "zitat", `„${W.hilfen.kurz(a.markiert, 220)}“`));
      const z = zeile("💬 Notiz:", a.nachher ?? "", "frage offen");
      z.title = "Antippen zum Ändern oder Löschen";
      z.onclick = (ev) => {
        ev.stopPropagation();
        W.notizOeffnen({ passage: a.passage, titel: a.titel, vorher: a.vorher, markiert: a.markiert, bis: a.bis, ort: a.ort, kontext: a.kontext }, a);
      };
    }
    return box;
  }
  const mitKind = (e, ...k) => {
    e.append(...k);
    return e;
  };
  const passt = (orig, x) => x && orig && (orig === x || orig.startsWith(x));

  function anwenden() {
    for (const e of main.querySelectorAll(fluechtig)) e.remove();
    const liste = W.liste();
    const antworten = W.antworten?.() ?? [];
    const T = new Map();
    const weg = new Set();
    const ein = new Map();
    const notizNach = new Map(); // Absatz (vorher oder bis) -> Notizen
    const wahlNeu = new Map();
    const wahlWeg = new Set();
    for (const a of liste) {
      if (a.art === "text") T.set(a.vorher, a);
      if (a.art === "loeschen") weg.add(a.vorher);
      if (a.art === "einfuegen") ein.set(a.nach, [...(ein.get(a.nach) ?? []), a]);
      if (a.art === "notiz" && a.vorher) {
        const k = a.bis ?? a.vorher;
        notizNach.set(k, [...(notizNach.get(k) ?? []), a]);
      }
      if (a.art === "wahl") wahlNeu.set(a.vorher, a);
      if (a.art === "wahl-loeschen") wahlWeg.add(a.vorher);
    }
    // Absätze
    for (const p of main.querySelectorAll("p[data-orig]")) {
      const orig = p.dataset.orig;
      p.dataset.html ??= p.innerHTML;
      const t = T.get(orig);
      if (t) p.textContent = t.nachher;
      else p.innerHTML = p.dataset.html;
      p.classList.toggle("geaendert", !!t);
      p.classList.toggle("gestrichen", weg.has(orig));
      let anker = p;
      for (const a of ein.get(orig) ?? []) {
        const n = el("p", "eingefuegt", a.nachher);
        n.dataset.vorschlag = a.id;
        anker.after(n);
        anker = n;
        const b = sprechblase(notizNach.get(`#${a.id}`) ?? [], []);
        if (b) {
          anker.after(b);
          anker = b;
        }
      }
      const box = sprechblase(notizNach.get(orig) ?? [], antworten.filter((x) => passt(orig, x.vorher) || passt(orig, x.nachher)));
      if (box) anker.after(box);
    }
    // Entscheidungen
    for (const o of main.querySelectorAll(".option[data-wahl]")) {
      const orig = o.dataset.wahl;
      const textEl = o.querySelector(":scope > .option-text");
      textEl.dataset.html ??= textEl.innerHTML;
      const neu = wahlNeu.get(orig);
      if (neu) {
        textEl.innerHTML = "";
        textEl.append(el("span", "nr", textEl.dataset.html.match(/<span class="nr">([^<]*)<\/span>/)?.[1] ?? "·"), document.createTextNode(` ${neu.nachher}`));
      } else textEl.innerHTML = textEl.dataset.html;
      o.classList.toggle("geaendert", !!neu);
      o.classList.toggle("gestrichen", wahlWeg.has(orig));
      const box = sprechblase(notizNach.get(`wahl:${orig}`) ?? [], antworten.filter((x) => passt(orig, x.vorher)));
      if (box) textEl.after(box);
    }
    for (const w of main.querySelectorAll(".wahl[data-zeile]")) {
      const passage = passageVon(w);
      const z = w.dataset.zeile;
      for (const a of liste.filter((x) => x.art === "wahl-neu" && x.passage === passage && String(x.wahlZeile) === z)) {
        const o = el("div", "option neu");
        const t = el("div", "option-text");
        t.append(el("span", "nr", "+"), document.createTextNode(` ${a.text}`));
        t.onclick = () => W.bearbeiten() && neueMoeglichkeit(w, a);
        o.append(t);
        if (a.folge) o.append(mitKind(el("div", "antwort"), el("p", "", a.folge)));
        if (a.ziel) o.append(el("p", "sprung", `→ ${a.ziel}`));
        w.querySelector(":scope > .wahl-werkzeug")?.before(o) ?? w.append(o);
      }
    }
    // Abschnitte
    for (const s of main.querySelectorAll("section[data-passage]")) {
      const passage = s.dataset.passage;
      const titel = s.querySelector("h3 .titel");
      titel.dataset.orig ??= titel.textContent;
      const umb = liste.find((a) => a.art === "passage-titel" && a.passage === passage);
      titel.textContent = umb ? umb.nachher : titel.dataset.orig;
      s.classList.toggle("gestrichen", liste.some((a) => a.art === "passage-loeschen" && a.passage === passage));
      const werkzeug = s.querySelector(":scope > .abschnitt-werkzeug");
      const notizen = liste.filter((a) => a.art === "notiz" && a.passage === passage && !a.vorher);
      const box = sprechblase(notizen, []);
      if (box) werkzeug.after(box);
      // Am Anfang und am Ende angehängte Absätze und Entscheidungen
      for (const a of liste.filter((x) => x.art === "einfuegen" && x.passage === passage && (x.nach === "#anfang" || x.nach === "#ende"))) {
        const n = el("p", "eingefuegt", a.nachher);
        n.dataset.vorschlag = a.id;
        if (a.nach === "#anfang") (box ?? werkzeug).after(n);
        else s.append(n);
      }
      for (const a of liste.filter((x) => x.art === "wahl-neu" && x.passage === passage && x.wahlZeile === undefined)) {
        const w = el("div", "wahl neu");
        w.classList.add("option", "neu");
        w.append(el("div", "wahl-kopf", "Neue Entscheidung (Vorschlag)"));
        const t = el("div", "option-text");
        t.append(el("span", "nr", "+"), document.createTextNode(` ${a.text}`));
        t.onclick = () => W.bearbeiten() && neueMoeglichkeit(null, a, s);
        w.append(t);
        if (a.folge) w.append(mitKind(el("div", "antwort"), el("p", "", a.folge)));
        if (a.ziel) w.append(el("p", "sprung", `→ ${a.ziel}`));
        s.append(w);
      }
      // Neue Abschnitte, angelegt von hier
      for (const a of liste.filter((x) => x.art === "passage-neu" && x.nahe === passage)) {
        const n = el("div", "neuer-abschnitt");
        n.append(el("h3", "", `${a.titel} (neuer Abschnitt, Vorschlag)`));
        for (const z of a.zeilen ?? []) n.append(el("p", "", z));
        for (const c of a.choices ?? []) n.append(el("p", "sprung", `▸ ${c.text}`));
        n.append(mitKind(el("div", "buch-werkzeug"), knopf("Ändern", () => neuerAbschnitt(s, a)), knopf("Entfernen", () => {
          W.entfernen(a.id);
          anwenden();
        })));
        s.after(n);
      }
    }
  }

  // ------------------------------------------------------------ Werkzeuge
  function schliessen() {
    for (const w of main.querySelectorAll(".buch-werkzeug:not(.neuer-abschnitt .buch-werkzeug), textarea.buch-editor")) w.remove();
    for (const p of main.querySelectorAll("p[hidden], .option-text[hidden]")) p.hidden = false;
  }
  function editor(nach, wert, knoepfe, versteck) {
    schliessen();
    const ta = autoHoehe(el("textarea", "buch-editor"));
    ta.value = wert;
    if (versteck) versteck.hidden = true;
    nach.after(ta);
    const leiste = el("div", "buch-werkzeug");
    ta.after(leiste);
    leiste.append(...knoepfe(ta), knopf("Abbrechen", () => {
      schliessen();
      anwenden();
    }));
    ta.focus();
    ta.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        schliessen();
        anwenden();
      }
      if (e.key === "Enter" && (e.ctrlKey || e.metaKey)) leiste.querySelector(".haupt")?.click();
    });
    return ta;
  }

  function absatzBearbeiten(p) {
    const eingefuegtId = p.dataset.vorschlag;
    const orig = p.dataset.orig;
    const passage = passageVon(p);
    const titel = titelVon(p);
    const ort = ortVon(p);
    const vorhanden = eingefuegtId ? null : W.liste().find((a) => a.art === "text" && a.vorher === orig);
    const eingefuegt = eingefuegtId ? W.liste().find((a) => a.id === eingefuegtId) : null;
    editor(p, eingefuegt ? eingefuegt.nachher : vorhanden ? vorhanden.nachher : orig, (ta) => {
      const fertig = () => {
        schliessen();
        anwenden();
      };
      const uebernehmen = knopf("Übernehmen", () => {
        const neu = ta.value.trim();
        if (eingefuegtId) {
          if (neu) W.aendern(eingefuegtId, { nachher: neu });
          else W.entfernen(eingefuegtId);
        } else if (neu === orig) {
          if (vorhanden) W.entfernen(vorhanden.id);
        } else if (!neu) W.hinzufuegen({ art: "loeschen", passage, titel, vorher: orig, ort, kontext: kontext() });
        else W.hinzufuegen({ art: "text", passage, titel, vorher: orig, nachher: neu, ort, kontext: kontext() });
        fertig();
      }, "haupt");
      const out = [uebernehmen];
      const nachSchluessel = eingefuegtId ? eingefuegt?.nach : orig;
      out.push(knopf("Absatz danach einfügen", () => {
        const a = W.hinzufuegen({ art: "einfuegen", passage, titel, nach: nachSchluessel, nachher: "…", ort, kontext: kontext() });
        fertig();
        const n = main.querySelector(`p.eingefuegt[data-vorschlag="${a.id}"]`);
        if (n) absatzBearbeiten(n);
      }));
      if (eingefuegtId) out.push(knopf("Entfernen", () => {
        W.entfernen(eingefuegtId);
        fertig();
      }));
      else if (p.classList.contains("gestrichen")) out.push(knopf("Wieder aufnehmen", () => {
        const w = W.liste().find((a) => a.art === "loeschen" && a.vorher === orig);
        if (w) W.entfernen(w.id);
        fertig();
      }));
      else out.push(knopf("Streichen", () => {
        W.hinzufuegen({ art: "loeschen", passage, titel, vorher: orig, ort, kontext: kontext() });
        fertig();
      }));
      if (vorhanden) out.push(sicherKnopf("Original zurück", "Wirklich?", () => {
        W.entfernen(vorhanden.id);
        fertig();
      }));
      out.push(
        knopf("💬 Notiz zu diesem Absatz", () => {
          schliessen();
          W.notizOeffnen({ passage, titel, vorher: eingefuegtId ? `#${eingefuegtId}` : orig, ort, kontext: kontext() });
        }),
        knopf("Quelltext", () => W.quelltextOeffnen(passage)),
      );
      return out;
    }, p);
  }

  function moeglichkeitBearbeiten(o) {
    const orig = o.dataset.wahl;
    const passage = passageVon(o);
    const titel = titelVon(o);
    const ort = ortVon(o);
    const textEl = o.querySelector(":scope > .option-text");
    const vorhanden = W.liste().find((a) => a.art === "wahl" && a.vorher === orig);
    editor(textEl, vorhanden ? vorhanden.nachher : orig, (ta) => {
      ta.rows = 2;
      const fertig = () => {
        schliessen();
        anwenden();
      };
      const out = [knopf("Übernehmen", () => {
        const neu = ta.value.trim();
        if (!neu) W.hinzufuegen({ art: "wahl-loeschen", passage, titel, vorher: orig, ort, kontext: kontext() });
        else if (neu === orig) {
          if (vorhanden) W.entfernen(vorhanden.id);
        } else W.hinzufuegen({ art: "wahl", passage, titel, vorher: orig, nachher: neu, ort, kontext: kontext() });
        fertig();
      }, "haupt")];
      if (o.classList.contains("gestrichen")) out.push(knopf("Wieder aufnehmen", () => {
        const w = W.liste().find((a) => a.art === "wahl-loeschen" && a.vorher === orig);
        if (w) W.entfernen(w.id);
        fertig();
      }));
      else out.push(knopf("Möglichkeit streichen", () => {
        W.hinzufuegen({ art: "wahl-loeschen", passage, titel, vorher: orig, ort, kontext: kontext() });
        fertig();
      }));
      out.push(
        knopf("💬 Notiz zu dieser Möglichkeit", () => {
          schliessen();
          W.notizOeffnen({ passage, titel, vorher: `wahl:${orig}`, wahlText: orig, ort, kontext: kontext() });
        }),
        knopf("Quelltext", () => W.quelltextOeffnen(passage)),
      );
      return out;
    }, textEl);
  }

  // Neue Möglichkeit in einer Entscheidung (wahl gesetzt) oder neue Entscheidung am Ende eines Abschnitts (s gesetzt)
  function neueMoeglichkeit(wahlEl, vorhanden = null, s = null) {
    const sec = s ?? abschnitt(wahlEl);
    const passage = sec.dataset.passage;
    const titel = titelVon(sec);
    const d = document.createElement("dialog");
    d.className = "ws-dialog";
    d.append(el("h2", "", wahlEl ? "Neue Möglichkeit" : "Neue Entscheidung am Ende des Abschnitts"));
    d.append(el("p", "ws-info", "Der sichtbare Anfang der Wahl, dann was folgt (fließt als Satz weiter), und wohin es führt (optional: Name eines Abschnitts oder in Worten)."));
    const t = el("input", "ws-feld");
    t.placeholder = "Sichtbarer Anfang, z. B. „Ihm deinen Namen nennen“";
    const folge = autoHoehe(el("textarea", "ws-text"));
    folge.placeholder = "Was dann geschieht …";
    folge.rows = 4;
    const ziel = el("input", "ws-feld");
    ziel.placeholder = "Wohin danach? (optional)";
    if (vorhanden) {
      t.value = vorhanden.text ?? "";
      folge.value = vorhanden.folge ?? "";
      ziel.value = vorhanden.ziel ?? "";
    }
    d.append(t, folge, ziel);
    const leiste = el("div", "ws-leiste");
    leiste.append(
      knopf("Speichern", () => {
        const text = t.value.trim();
        if (!text) return d.close();
        const werte = { text, nachher: text, folge: folge.value.trim() || undefined, ziel: ziel.value.trim() || undefined };
        if (vorhanden) W.aendern(vorhanden.id, werte);
        else W.hinzufuegen({ art: "wahl-neu", passage, titel, ...werte, wahlZeile: wahlEl ? Number(wahlEl.dataset.zeile) : undefined, nachWahl: wahlEl ? [...wahlEl.querySelectorAll(":scope > .option[data-wahl]")].pop()?.dataset.wahl : undefined, ort: ortVon(wahlEl ?? sec), kontext: kontext() });
        d.close();
        anwenden();
      }, "ws-haupt"),
      ...(vorhanden ? [knopf("Entfernen", () => {
        W.entfernen(vorhanden.id);
        d.close();
        anwenden();
      })] : []),
      knopf("Abbrechen", () => d.close()),
    );
    d.append(leiste);
    d.addEventListener("close", () => d.remove());
    document.body.append(d);
    d.showModal();
    t.focus();
  }

  function neuerAbschnitt(s, vorhanden = null) {
    const passage = s.dataset.passage;
    const d = document.createElement("dialog");
    d.className = "ws-dialog";
    d.append(el("h2", "", vorhanden ? "Neuer Abschnitt ändern" : `Neuer Abschnitt nach „${titelVon(s)}“`));
    d.append(el("p", "ws-info", "Titel, Text (Absätze durch Leerzeilen trennen) und, wenn du willst, Entscheidungen (eine je Zeile). Claude baut daraus einen Knoten und verbindet ihn."));
    const titel = el("input", "ws-feld");
    titel.placeholder = "Titel des Abschnitts";
    const text = autoHoehe(el("textarea", "ws-text"));
    text.rows = 8;
    text.placeholder = "Text …";
    const wahlen = autoHoehe(el("textarea", "ws-text"));
    wahlen.rows = 3;
    wahlen.placeholder = "Entscheidungen, eine je Zeile (optional)";
    if (vorhanden) {
      titel.value = vorhanden.titel ?? "";
      text.value = (vorhanden.zeilen ?? []).join("\n\n");
      wahlen.value = (vorhanden.choices ?? []).map((c) => c.text).join("\n");
    }
    d.append(titel, text, wahlen);
    const leiste = el("div", "ws-leiste");
    leiste.append(
      knopf("Speichern", () => {
        const werte = {
          titel: titel.value.trim() || "Neuer Abschnitt",
          zeilen: text.value.split(/\n\s*\n/).map((z) => z.trim()).filter(Boolean),
          choices: wahlen.value.split("\n").map((z) => z.trim()).filter(Boolean).map((z) => ({ text: z })),
        };
        if (vorhanden) W.aendern(vorhanden.id, werte);
        else W.hinzufuegen({ art: "passage-neu", passage: `neu_${Date.now().toString(36)}`, nahe: passage, ...werte, ort: ortVon(s), kontext: kontext() });
        d.close();
        anwenden();
      }, "ws-haupt"),
      knopf("Abbrechen", () => d.close()),
    );
    d.append(leiste);
    d.addEventListener("close", () => d.remove());
    document.body.append(d);
    d.showModal();
    titel.focus();
  }

  function titelAendern(s) {
    const passage = s.dataset.passage;
    const h = s.querySelector("h3 .titel");
    const vorhanden = W.liste().find((a) => a.art === "passage-titel" && a.passage === passage);
    editor(s.querySelector("h3"), h.textContent, (ta) => {
      ta.rows = 1;
      return [knopf("Übernehmen", () => {
        const neu = ta.value.trim();
        if (!neu || neu === h.dataset.orig) {
          if (vorhanden) W.entfernen(vorhanden.id);
        } else W.hinzufuegen({ art: "passage-titel", passage, vorher: h.dataset.orig, nachher: neu, ort: ortVon(s), kontext: kontext() });
        schliessen();
        anwenden();
      }, "haupt")];
    });
  }

  // Werkzeugleisten an Abschnitten und Entscheidungen (sichtbar nur beim Bearbeiten, per CSS)
  for (const s of main.querySelectorAll("section[data-passage]")) {
    const passage = s.dataset.passage;
    const leiste = el("div", "abschnitt-werkzeug");
    leiste.append(
      knopf("💬 Notiz zum Abschnitt", () => W.notizOeffnen({ passage, titel: titelVon(s), ort: ortVon(s), kontext: kontext() })),
      knopf("+ Absatz am Anfang", () => {
        const a = W.hinzufuegen({ art: "einfuegen", passage, titel: titelVon(s), nach: "#anfang", nachher: "…", ort: ortVon(s), kontext: kontext() });
        anwenden();
        const n = main.querySelector(`p.eingefuegt[data-vorschlag="${a.id}"]`);
        if (n) absatzBearbeiten(n);
      }),
      knopf("+ Absatz am Ende", () => {
        const a = W.hinzufuegen({ art: "einfuegen", passage, titel: titelVon(s), nach: "#ende", nachher: "…", ort: ortVon(s), kontext: kontext() });
        anwenden();
        const n = main.querySelector(`p.eingefuegt[data-vorschlag="${a.id}"]`);
        if (n) absatzBearbeiten(n);
      }),
      knopf("+ Entscheidung am Ende", () => neueMoeglichkeit(null, null, s)),
      knopf("+ Neuer Abschnitt danach", () => neuerAbschnitt(s)),
      knopf("Titel ändern", () => titelAendern(s)),
      knopf("Quelltext", () => W.quelltextOeffnen(passage)),
    );
    leiste.append(knopf(s.classList.contains("gestrichen") ? "Wieder aufnehmen" : "Abschnitt streichen", (e) => {
      const w = W.liste().find((a) => a.art === "passage-loeschen" && a.passage === passage);
      if (w) W.entfernen(w.id);
      else W.hinzufuegen({ art: "passage-loeschen", passage, titel: titelVon(s), ort: ortVon(s), kontext: kontext() });
      e.currentTarget.textContent = w ? "Abschnitt streichen" : "Wieder aufnehmen";
      anwenden();
    }));
    s.querySelector("h3").after(leiste);
  }
  for (const w of main.querySelectorAll(".wahl[data-zeile]")) {
    const leiste = el("div", "wahl-werkzeug");
    leiste.append(knopf("+ Möglichkeit hinzufügen", () => neueMoeglichkeit(w)));
    w.append(leiste);
  }

  // ------------------------------------------------------------ Klicks und Markierungen
  main.addEventListener("click", (e) => {
    if (!W.bearbeiten()) return;
    if (e.target.closest("button, a, textarea, input, .kommentar, .buch-werkzeug")) return;
    const ot = e.target.closest(".option[data-wahl] > .option-text");
    if (ot && !window.getSelection()?.toString()) return moeglichkeitBearbeiten(ot.parentElement);
    const p = e.target.closest("p[data-orig], p.eingefuegt");
    if (p && !p.hidden && !window.getSelection()?.toString()) absatzBearbeiten(p);
  });

  // Text markieren: Notiz zur Markierung (auch über mehrere Absätze)
  let markierKnopf = null;
  const markierWeg = () => {
    markierKnopf?.remove();
    markierKnopf = null;
  };
  const absatzVon = (n) => (n?.nodeType === 3 ? n.parentElement : n)?.closest?.("p[data-orig], p.eingefuegt, .option[data-wahl]");
  document.addEventListener("mouseup", () => setTimeout(markieren, 0));
  document.addEventListener("touchend", () => setTimeout(markieren, 250));
  function markieren() {
    if (!W.bearbeiten()) return markierWeg();
    const sel = window.getSelection();
    const text = sel?.toString().trim();
    if (!text || !sel.rangeCount) return markierWeg();
    const r = sel.getRangeAt(0);
    if (!main.contains(r.commonAncestorContainer)) return markierWeg();
    const von = absatzVon(r.startContainer) ?? absatzVon(r.startContainer.parentElement?.closest("section")?.querySelector("p[data-orig]"));
    const bis = absatzVon(r.endContainer) ?? von;
    if (!von) return markierWeg();
    const schluessel = (x) => (x.dataset.wahl !== undefined ? `wahl:${x.dataset.wahl}` : x.dataset.orig ?? `#${x.dataset.vorschlag}`);
    const rect = r.getBoundingClientRect();
    markierWeg();
    markierKnopf = el("button", "", "💬 Notiz zur Markierung");
    markierKnopf.id = "markier-knopf";
    markierKnopf.type = "button";
    markierKnopf.style.left = `${Math.max(8, rect.left + window.scrollX)}px`;
    markierKnopf.style.top = `${rect.bottom + window.scrollY + 6}px`;
    markierKnopf.onmousedown = (ev) => ev.preventDefault();
    markierKnopf.onclick = () => {
      const passage = passageVon(von);
      const ende = bis && bis !== von ? schluessel(bis) : undefined;
      W.notizOeffnen({ passage, titel: titelVon(von), vorher: schluessel(von), bis: ende, bisPassage: ende ? passageVon(bis) : undefined, markiert: text, ort: ortVon(von), kontext: kontext() });
      markierWeg();
      sel.removeAllRanges();
    };
    document.body.append(markierKnopf);
  }

  W.beiAenderung(() => anwenden());
  W.beiModus(() => {
    schliessen();
    markierWeg();
  });
  anwenden();
})();
