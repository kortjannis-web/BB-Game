// Erzählbaum: zeigt web/twine.json (erzeugt aus den Ink-Dateien) wie eine Twine-Karte.
(() => {
  const $ = (id) => document.getElementById(id);
  const B = 240;
  const H = 112;
  const NADELOEHRE = new Set(["k1_n1_kleriker", "k1_n2_gascoigne"]);
  const leinwand = $("leinwand");
  const welt = $("welt");
  let D = null;
  let mitBausteinen = false;
  let L = null;
  let sichtbar = new Map();
  let kanten = [];
  let ansicht = { x: 0, y: 0, s: 0.6 };
  let gewaehlt = null;
  let treffer = [];
  let trefferIdx = -1;
  // Werkstatt: A ist die Ansicht mit allen Vorschlägen (Entwürfe, Änderungen, Streichungen) über den Daten D.
  const W = window.WERKSTATT;
  let A = null;
  let P = {};
  let stilleAenderung = false;
  const nachId = (id) => A?.byId.get(id) ?? D.passagen.find((x) => x.id === id);

  const farbe = (g) => getComputedStyle(document.documentElement).getPropertyValue(`--${g}`).trim() || "#888";
  const auszug = (p) => {
    const z = p.zeilen.find((s) => s.text && s.status !== "weg");
    if (z) return z.text;
    if (p.choices.length) return p.choices.map((c) => `› ${c.textNeu ?? c.text}`).join("  ");
    return p.art === "sammel" ? "(Übergang ohne eigenen Text)" : "";
  };
  const el = (tag, cls, text) => {
    const e = document.createElement(tag);
    if (cls) e.className = cls;
    if (text !== undefined) e.textContent = text;
    return e;
  };

  // ------------------------------------------------------------ Zeichnen
  function zeichnen() {
    L = mitBausteinen ? D.layout.voll : D.layout.story;
    A = aufbereiten();
    P = A.pos;
    sichtbar = new Map(A.passagen.filter((p) => P[p.id] && (mitBausteinen || !p.baustein)).map((p) => [p.id, p]));
    const box = $("knoten");
    box.innerHTML = "";
    for (const p of sichtbar.values()) {
      const [x, y] = P[p.id];
      const k = el("div", "k");
      k.dataset.id = p.id;
      k.style.left = `${x - B / 2}px`;
      k.style.top = `${y - H / 2}px`;
      k.style.setProperty("--farbe", `var(--${p.gruppe})`);
      if (p.id === D.start) k.classList.add("start");
      if (NADELOEHRE.has(p.id)) k.classList.add("nadeloehr");
      if (p.id === "END") k.classList.add("ende");
      if (p.baustein) k.classList.add("baustein");
      if (p.entwurf) k.classList.add("entwurf");
      if (p.weg) k.classList.add("weg");
      if (p.marken.size) k.classList.add("vorgeschlagen");
      const abz = p.entwurf ? "ENTWURF" : p.weg ? "GESTRICHEN" : p.id === D.start ? "START" : NADELOEHRE.has(p.id) ? "NADELÖHR" : p.id === "END" ? "ENDE" : "";
      if (abz) k.appendChild(el("span", "abzeichen", abz));
      k.appendChild(el("h3", "", p.titel));
      k.appendChild(el("p", "", auszug(p)));
      const f = el("footer");
      f.appendChild(el("span", "", `${p.choices.length} Wahl`));
      f.appendChild(el("span", "", `${p.woerter} Wörter`));
      if (p.herkunft.some((h) => h.includes("PRÜFEN"))) f.appendChild(el("span", "", "PRÜFEN"));
      if (p.marken.size) f.appendChild(el("span", "marke-vorschlag", `✎ ${p.marken.size}`));
      k.appendChild(f);
      box.appendChild(k);
    }

    const svg = $("linien");
    svg.setAttribute("width", L.breite);
    svg.setAttribute("height", L.hoehe);
    const g = $("kanten");
    g.innerHTML = "";
    kanten = A.kanten.filter((k) => sichtbar.has(k.von) && sichtbar.has(k.nach) && (mitBausteinen || k.art !== "tod"));
    for (const k of kanten) {
      const [sx, sy] = P[k.von];
      const [tx, ty] = P[k.nach];
      const pfad = document.createElementNS("http://www.w3.org/2000/svg", "path");
      let d;
      if (ty - H / 2 > sy + H / 2 + 8) {
        const y1 = sy + H / 2;
        const y2 = ty - H / 2;
        const m = (y2 - y1) * 0.5;
        d = `M${sx},${y1} C${sx},${y1 + m} ${tx},${y2 - m} ${tx},${y2}`;
        pfad.setAttribute("class", k.art);
      } else {
        // Rückweg (nach oben oder seitlich): außen herum, damit er sich von den Wegen nach unten abhebt
        const seite = tx >= sx ? 1 : -1;
        const x1 = sx + (seite * B) / 2;
        const x2 = tx + (seite * B) / 2;
        const bogen = 60 + Math.min(260, Math.abs(ty - sy) * 0.12);
        d = `M${x1},${sy} C${x1 + seite * bogen},${sy} ${x2 + seite * bogen},${ty} ${x2},${ty}`;
        pfad.setAttribute("class", `${k.art} rueck`);
      }
      pfad.setAttribute("d", d);
      if (k.entwurf) pfad.classList.add("entwurf");
      pfad.dataset.von = k.von;
      pfad.dataset.nach = k.nach;
      const p = sichtbar.get(k.von);
      const titel = document.createElementNS("http://www.w3.org/2000/svg", "title");
      titel.textContent = k.wahl !== undefined && p.choices[k.wahl] ? `› ${p.choices[k.wahl].textNeu ?? p.choices[k.wahl].text}` : { weiter: "weiter", bedingt: "bedingt", tod: "Tod", tunnel: "Baustein" }[k.art] ?? k.art;
      pfad.appendChild(titel);
      g.appendChild(pfad);
    }

    const s = D.stats;
    const n = W?.liste().length ?? 0;
    $("statistik").textContent = `${s.passagen} Passagen · ${s.entscheidungen} Entscheidungen · ${s.kanten} Verbindungen · ${s.woerter.toLocaleString("de-DE")} Wörter · sichtbar ${sichtbar.size}${n ? ` · ${n} Vorschläge` : ""}`;
    if (gewaehlt && !sichtbar.has(gewaehlt)) waehlen(null);
    else if (gewaehlt) markieren(gewaehlt);
    suchen();
    minikarte();
  }

  // ------------------------------------------------------------ Ansicht: verschieben und zoomen
  function anwenden() {
    welt.style.transform = `translate(${ansicht.x}px, ${ansicht.y}px) scale(${ansicht.s})`;
    minikarte();
  }
  function zoomUm(faktor, cx, cy) {
    const s = Math.min(2.2, Math.max(0.06, ansicht.s * faktor));
    const f = s / ansicht.s;
    ansicht.x = cx - (cx - ansicht.x) * f;
    ansicht.y = cy - (cy - ansicht.y) * f;
    ansicht.s = s;
    anwenden();
  }
  function alles() {
    const r = leinwand.getBoundingClientRect();
    ansicht.s = Math.min(r.width / L.breite, r.height / L.hoehe) * 0.96;
    ansicht.x = (r.width - L.breite * ansicht.s) / 2;
    ansicht.y = (r.height - L.hoehe * ansicht.s) / 2;
    anwenden();
  }
  function zuKnoten(id, s = Math.max(ansicht.s, 0.75)) {
    const pos = P[id];
    if (!pos) return;
    const r = leinwand.getBoundingClientRect();
    const tafelBreite = !$("tafel").hidden && r.width > 640 ? Math.min(430, r.width) : 0;
    const tafelHoehe = !$("tafel").hidden && r.width <= 640 ? r.height * 0.62 : 0;
    ansicht.s = s;
    ansicht.x = (r.width - tafelBreite) / 2 - pos[0] * s;
    ansicht.y = (r.height - tafelHoehe) / 2 - pos[1] * s;
    anwenden();
  }

  const zeiger = new Map();
  let zug = null;
  leinwand.addEventListener("pointerdown", (e) => {
    if (e.target.id === "minikarte") return;
    leinwand.setPointerCapture(e.pointerId);
    zeiger.set(e.pointerId, { x: e.clientX, y: e.clientY });
    zug = { x: e.clientX, y: e.clientY, bewegt: false, ziel: e.target.closest(".k")?.dataset.id ?? null };
    // Im Bearbeiten-Modus lassen sich Entwürfe (neue Passagen) mit der Maus verschieben.
    const entwurf = W?.bearbeiten() && zug.ziel && A.byId.get(zug.ziel)?.entwurf;
    if (entwurf) zug.schieben = { id: zug.ziel, knoten: e.target.closest(".k"), start: [...P[zug.ziel]] };
    leinwand.classList.add("ziehen");
  });
  leinwand.addEventListener("pointermove", (e) => {
    if (!zeiger.has(e.pointerId)) return;
    const alt = zeiger.get(e.pointerId);
    if (zeiger.size === 2) {
      const [a, b] = [...zeiger.values()];
      const vorher = Math.hypot(a.x - b.x, a.y - b.y);
      zeiger.set(e.pointerId, { x: e.clientX, y: e.clientY });
      const [c, d] = [...zeiger.values()];
      const nachher = Math.hypot(c.x - d.x, c.y - d.y);
      const r = leinwand.getBoundingClientRect();
      if (vorher > 0) zoomUm(nachher / vorher, (c.x + d.x) / 2 - r.left, (c.y + d.y) / 2 - r.top);
      if (zug) zug.bewegt = true;
      return;
    }
    if (zug && Math.hypot(e.clientX - zug.x, e.clientY - zug.y) > 5) zug.bewegt = true;
    if (zug?.schieben) {
      const sch = zug.schieben;
      const nx = sch.start[0] + (e.clientX - zug.x) / ansicht.s;
      const ny = sch.start[1] + (e.clientY - zug.y) / ansicht.s;
      sch.ziel = [Math.round(nx), Math.round(ny)];
      sch.knoten.style.left = `${sch.ziel[0] - B / 2}px`;
      sch.knoten.style.top = `${sch.ziel[1] - H / 2}px`;
      zeiger.set(e.pointerId, { x: e.clientX, y: e.clientY });
      return;
    }
    ansicht.x += e.clientX - alt.x;
    ansicht.y += e.clientY - alt.y;
    zeiger.set(e.pointerId, { x: e.clientX, y: e.clientY });
    anwenden();
  });
  const loslassen = (e) => {
    zeiger.delete(e.pointerId);
    if (zeiger.size === 0) {
      leinwand.classList.remove("ziehen");
      if (zug?.schieben?.ziel && zug.bewegt) entwurfVerschieben(zug.schieben.id, zug.schieben.ziel);
      else if (zug && !zug.bewegt) waehlen(zug.ziel);
      zug = null;
    }
  };
  leinwand.addEventListener("pointerup", loslassen);
  leinwand.addEventListener("pointercancel", loslassen);
  leinwand.addEventListener("wheel", (e) => {
    e.preventDefault();
    const r = leinwand.getBoundingClientRect();
    zoomUm(Math.exp(-e.deltaY * (e.ctrlKey ? 0.01 : 0.0015)), e.clientX - r.left, e.clientY - r.top);
  }, { passive: false });

  // ------------------------------------------------------------ Minikarte
  function minikarte() {
    const c = $("minikarte");
    if (!L || !c.offsetWidth) return;
    const dpr = window.devicePixelRatio || 1;
    c.width = c.offsetWidth * dpr;
    c.height = c.offsetHeight * dpr;
    const ctx = c.getContext("2d");
    const m = Math.min(c.width / L.breite, c.height / L.hoehe);
    const ox = (c.width - L.breite * m) / 2;
    const oy = (c.height - L.hoehe * m) / 2;
    ctx.clearRect(0, 0, c.width, c.height);
    for (const p of sichtbar.values()) {
      const [x, y] = P[p.id];
      ctx.fillStyle = farbe(p.gruppe);
      ctx.globalAlpha = gewaehlt && p.id !== gewaehlt ? 0.55 : 1;
      ctx.fillRect(ox + (x - B / 2) * m, oy + (y - H / 2) * m, Math.max(2, B * m), Math.max(1.5, H * m));
    }
    ctx.globalAlpha = 1;
    const r = leinwand.getBoundingClientRect();
    ctx.strokeStyle = "#e0c27a";
    ctx.lineWidth = 1.5 * dpr;
    ctx.strokeRect(ox + (-ansicht.x / ansicht.s) * m, oy + (-ansicht.y / ansicht.s) * m, (r.width / ansicht.s) * m, (r.height / ansicht.s) * m);
    c.onclick = (e) => {
      const rc = c.getBoundingClientRect();
      const wx = ((e.clientX - rc.left) * dpr - ox) / m;
      const wy = ((e.clientY - rc.top) * dpr - oy) / m;
      ansicht.x = r.width / 2 - wx * ansicht.s;
      ansicht.y = r.height / 2 - wy * ansicht.s;
      anwenden();
    };
  }

  // ------------------------------------------------------------ Auswahl und Detailtafel
  function markieren(id) {
    leinwand.classList.toggle("gedimmt", !!id);
    for (const k of document.querySelectorAll(".k")) k.classList.remove("gewaehlt", "nachbar", "quelle");
    for (const p of document.querySelectorAll("#kanten path")) p.classList.remove("aus", "ein");
    if (!id) return;
    document.querySelector(`.k[data-id="${CSS.escape(id)}"]`)?.classList.add("gewaehlt");
    for (const p of document.querySelectorAll("#kanten path")) {
      if (p.dataset.von === id) {
        p.classList.add("aus");
        document.querySelector(`.k[data-id="${CSS.escape(p.dataset.nach)}"]`)?.classList.add("nachbar");
      }
      if (p.dataset.nach === id) {
        p.classList.add("ein");
        document.querySelector(`.k[data-id="${CSS.escape(p.dataset.von)}"]`)?.classList.add("quelle");
      }
    }
  }

  function springeKnopf(id, text) {
    const b = el("button", "springe", text ?? sichtbar.get(id)?.titel ?? nachId(id)?.titel ?? id);
    b.type = "button";
    b.onclick = () => {
      if (!sichtbar.has(id)) {
        mitBausteinen = true;
        $("bausteine").checked = true;
        zeichnen();
      }
      waehlen(id);
      zuKnoten(id);
    };
    return b;
  }

  function waehlen(id) {
    gewaehlt = id;
    markieren(id);
    minikarte();
    const tafel = $("tafel");
    if (!id) {
      tafel.hidden = true;
      return;
    }
    const p = nachId(id);
    if (!p) return waehlen(null);
    try {
      history.replaceState(null, "", `#p=${encodeURIComponent(id)}`);
    } catch {
      /* in eingebetteten Seiten nicht erlaubt */
    }
    if (W?.bearbeiten()) return tafelBearbeiten(p);
    const inhalt = $("tafel-inhalt");
    inhalt.innerHTML = "";
    inhalt.style.setProperty("--farbe", `var(--${p.gruppe})`);
    inhalt.appendChild(el("h2", "", p.titel));
    inhalt.appendChild(el("div", "id", p.id));
    inhalt.appendChild(el("span", "teil", `${p.gruppe} · ${D.teile[p.gruppe] ?? ""}`));
    for (const h of p.herkunft) inhalt.appendChild(el("p", `herkunft${h.includes("PRÜFEN") ? " pruefen" : ""}`, h));
    inhalt.appendChild(tafelWerkzeuge(p));
    if (p.weg) inhalt.appendChild(el("p", "vorschlag-hinweis weg", "Du schlägst vor, diese Passage zu streichen."));
    for (const n of p.notizen) inhalt.appendChild(el("p", "vorschlag-hinweis", `Deine Notiz: ${n}`));

    if (p.zeilen.length) {
      inhalt.appendChild(el("h4", "", "Text"));
      const t = el("div", "text");
      for (const z of p.zeilen) {
        if (!z.text && !z.bed) continue;
        if (z.bed) t.appendChild(el("p", "bed", z.bed));
        if (z.text) t.appendChild(el("p", z.status ?? "", z.text));
      }
      inhalt.appendChild(t);
    }
    if (p.logik.length) {
      inhalt.appendChild(el("h4", "", "Logik"));
      for (const l of p.logik) inhalt.appendChild(el("p", "logik", l));
    }
    if (p.choices.length) {
      inhalt.appendChild(el("h4", "", `Entscheidungen (${p.choices.length})`));
      const ol = el("ol");
      for (const c of p.choices) {
        const li = el("li", c.weg ? "weg" : c.entwurf ? "neu" : c.textNeu ? "geaendert" : "");
        li.appendChild(el("span", "wahl", c.textNeu ?? c.text));
        if (c.bedingung) li.appendChild(el("span", "bedingung", `nur wenn ${c.bedingung}`));
        if (c.wiederholbar) li.appendChild(el("span", "bedingung", "wiederholbar"));
        for (const f of c.folgen) li.appendChild(el("p", `folge ${f.status ?? ""}`, f.text));
        if (c.logik?.length) li.appendChild(el("p", "logik", c.logik.join(" · ")));
        const ziel = c.zielNeu ?? c.ziel;
        if (ziel && nachId(ziel)) li.appendChild(springeKnopf(ziel, `→ ${nachId(ziel)?.titel ?? ziel}`));
        else if (ziel) li.appendChild(el("span", "bedingung", `→ ${ziel}`));
        ol.appendChild(li);
      }
      inhalt.appendChild(ol);
    }
    weiterUndHerkunft(inhalt, id);
    tafel.hidden = false;
    tafel.scrollTop = 0;
  }

  function weiterUndHerkunft(inhalt, id) {
    const weiter = A.kanten.filter((k) => k.von === id && k.wahl === undefined);
    if (weiter.length) {
      inhalt.appendChild(el("h4", "", "Weiter"));
      const box = el("div", "liste");
      for (const k of weiter) box.appendChild(springeKnopf(k.nach, `${{ weiter: "→", bedingt: "⇢ bedingt", tod: "✝ Tod", tunnel: "↺ Baustein" }[k.art] ?? "→"} ${nachId(k.nach)?.titel ?? k.nach}`));
      inhalt.appendChild(box);
    }
    const ein = [...new Set(A.kanten.filter((k) => k.nach === id).map((k) => k.von))];
    if (ein.length) {
      inhalt.appendChild(el("h4", "", `Kommt von (${ein.length})`));
      const box = el("div", "liste");
      for (const v of ein) box.appendChild(springeKnopf(v));
      inhalt.appendChild(box);
    }
  }


  // ------------------------------------------------------------ Werkstatt: Vorschläge über die Daten legen
  // Jede Zeile wird zu { text, orig, bed, status }, status: geaendert | neu | weg. Entwürfe sind neue Passagen.
  const zeileZerlegen = (z) => {
    const m = z.startsWith("⟨") ? z.match(/^(⟨[^⟩]*⟩)\s*(.*)$/) : null;
    return m ? { bed: m[1], text: m[2], orig: m[2] } : { text: z, orig: z };
  };
  const passt = (z, vorher) => z.orig && vorher && (z.orig === vorher || z.orig.replace(/\s+/g, " ").trim() === vorher.replace(/\s+/g, " ").trim());

  function aufbereiten() {
    const liste = W?.liste() ?? [];
    const passagen = D.passagen.map((p) => ({
      ...p,
      zeilen: p.zeilen.filter(Boolean).map(zeileZerlegen),
      choices: p.choices.map((c) => ({ ...c, folgen: c.folgen.map((f) => ({ text: f, orig: f })) })),
      marken: new Set(),
      notizen: [],
    }));
    const byId = new Map(passagen.map((p) => [p.id, p]));
    const kanten = [...D.kanten];
    const pos = { ...L.pos };
    const wo = (a) => {
      const p = byId.get(a.passage);
      if (p && (!a.vorher || p.zeilen.some((z) => passt(z, a.vorher)) || p.choices.some((c) => passt({ orig: c.text }, a.vorher) || c.folgen.some((f) => passt(f, a.vorher))))) return p;
      // Aus dem Spiel kommt nur der Ink-Pfad; die Zeile selbst sagt genauer, wo sie steht.
      if (a.vorher) for (const q of passagen) if (q.zeilen.some((z) => passt(z, a.vorher)) || q.choices.some((c) => passt({ orig: c.text }, a.vorher) || c.folgen.some((f) => passt(f, a.vorher)))) return q;
      return p ?? null;
    };

    // Zuerst neue Passagen, damit Entscheidungen auf sie zeigen können.
    for (const a of liste.filter((x) => x.art === "passage-neu")) {
      const von = byId.get(a.nahe);
      const p = {
        id: a.passage, titel: a.titel || "Neue Passage", gruppe: von?.gruppe ?? "B", art: "entwurf", baustein: false, entwurf: a.id,
        zeilen: (a.zeilen ?? []).map((t) => ({ text: t, orig: t, status: "neu" })),
        choices: (a.choices ?? []).map((c) => ({ text: c.text, ziel: c.ziel || null, folgen: (c.folgen ?? []).map((f) => ({ text: f, orig: f, status: "neu" })), logik: [], entwurf: a.id })),
        logik: [], tags: [], herkunft: [], marken: new Set(["neu"]), notizen: [], woerter: 0, kommentar: a.kommentar,
      };
      p.woerter = [...p.zeilen.map((z) => z.text), ...p.choices.flatMap((c) => c.folgen.map((f) => f.text))].join(" ").split(/\s+/).filter((w) => /\p{L}/u.test(w)).length;
      passagen.push(p);
      byId.set(p.id, p);
      const basis = (von && pos[von.id]) ?? a.pos ?? [L.breite / 2, 80];
      pos[p.id] = von && pos[von.id] ? [basis[0] + (a.versatz?.[0] ?? 0), basis[1] + (a.versatz?.[1] ?? H + 70)] : a.pos ?? basis;
    }
    for (const a of liste) {
      if (a.art === "passage-neu") continue;
      const p = wo(a);
      if (!p) continue;
      if (a.art === "text") {
        const z = p.zeilen.find((x) => passt(x, a.vorher));
        const f = !z && p.choices.flatMap((c) => c.folgen).find((x) => passt(x, a.vorher));
        const ziel = z || f;
        if (ziel) Object.assign(ziel, { text: a.nachher, status: "geaendert", vorschlag: a.id });
        p.marken.add(a.id);
      } else if (a.art === "loeschen") {
        const z = p.zeilen.find((x) => passt(x, a.vorher)) || p.choices.flatMap((c) => c.folgen).find((x) => passt(x, a.vorher));
        if (z) Object.assign(z, { status: "weg", vorschlag: a.id });
        p.marken.add(a.id);
      } else if (a.art === "einfuegen") {
        const i = p.zeilen.findIndex((x) => passt(x, a.nach));
        const neu = { text: a.nachher, orig: null, status: "neu", vorschlag: a.id };
        if (i >= 0) {
          let j = i + 1;
          while (p.zeilen[j]?.status === "neu") j++;
          p.zeilen.splice(j, 0, neu);
        } else p.zeilen.push(neu);
        p.marken.add(a.id);
      } else if (a.art === "wahl" || a.art === "wahl-loeschen" || a.art === "wahl-ziel") {
        const c = p.choices.find((x) => x.text === a.vorher || x.text === a.wahlText);
        if (!c) continue;
        if (a.art === "wahl") c.textNeu = a.nachher;
        if (a.art === "wahl-loeschen") c.weg = a.id;
        if (a.art === "wahl-ziel") {
          c.zielNeu = a.nachher;
          if (byId.has(a.nachher)) kanten.push({ von: p.id, nach: a.nachher, art: "wahl", wahl: p.choices.indexOf(c), entwurf: true });
        }
        p.marken.add(a.id);
      } else if (a.art === "wahl-folge") {
        const c = p.choices.find((x) => x.text === a.wahlText);
        const f = c?.folgen.find((x) => passt(x, a.vorher));
        if (f) Object.assign(f, { text: a.nachher, status: a.nachher ? "geaendert" : "weg", vorschlag: a.id });
        else if (c) c.folgen.push({ text: a.nachher, orig: null, status: "neu", vorschlag: a.id });
        p.marken.add(a.id);
      } else if (a.art === "wahl-neu") {
        const c = { text: a.text, ziel: a.ziel || null, folgen: a.folge ? [{ text: a.folge, orig: null, status: "neu" }] : [], logik: [], entwurf: a.id };
        p.choices.push(c);
        if (a.ziel && byId.has(a.ziel)) kanten.push({ von: p.id, nach: a.ziel, art: "wahl", wahl: p.choices.length - 1, entwurf: true });
        p.marken.add(a.id);
      } else if (a.art === "passage-loeschen") {
        p.weg = a.id;
        p.marken.add(a.id);
      } else if (a.art === "passage-titel") {
        p.titel = a.nachher;
        p.marken.add(a.id);
      } else if (a.art === "notiz") {
        p.notizen.push(a.nachher);
        p.marken.add(a.id);
      } else if (a.art === "quelle" && a.knoten) {
        const q = byId.get(a.knoten);
        if (q) q.marken.add(a.id);
      }
    }
    // Entscheidungen der Entwürfe als Linien
    for (const p of passagen.filter((x) => x.entwurf)) {
      p.choices.forEach((c, i) => c.ziel && byId.has(c.ziel) && kanten.push({ von: p.id, nach: c.ziel, art: "wahl", wahl: i, entwurf: true }));
    }
    return { passagen, byId, kanten, pos };
  }

  const anspringbar = (p) => p && !p.entwurf && p.art !== "virtuell" && p.art !== "ende" && !p.id.includes("~");
  const spielAdresse = (param) => {
    const basis = $("link-spiel").dataset.basis ?? ($("link-spiel").dataset.basis = $("link-spiel").getAttribute("href"));
    return `${basis}${basis.includes("?") ? "&" : "?"}${param}`;
  };

  function tafelWerkzeuge(p) {
    const box = el("div", "tafel-werkzeuge");
    if (anspringbar(p)) {
      const a = el("a", "springe", "▶ Ab hier spielen");
      a.href = spielAdresse(`ab=${encodeURIComponent(p.id)}`);
      box.appendChild(a);
      if (W?.liste().some((x) => x.art === "quelle")) {
        const t = el("a", "springe", "▶ Ab hier mit deinen Quelltext-Änderungen");
        t.href = spielAdresse(`test=1&ab=${encodeURIComponent(p.id)}`);
        box.appendChild(t);
      }
    }
    if (W && !p.entwurf && p.art !== "virtuell" && p.art !== "ende") {
      const q = el("button", "springe", "{ } Quelltext");
      q.type = "button";
      q.onclick = () => W.quelltextOeffnen(p.id.split(".").slice(0, 2).join(".").replace(/\.~\d+$/, ""));
      box.appendChild(q);
    }
    return box;
  }

  // Änderungen aus der Tafel: Karte neu zeichnen, die Tafel selbst (mit dem Fokus darin) in Ruhe lassen.
  const still = (f) => {
    stilleAenderung = true;
    try {
      return f();
    } finally {
      stilleAenderung = false;
    }
  };
  const entwurfVon = (p) => W.liste().find((a) => a.id === p.entwurf);

  function tafelBearbeiten(p) {
    const { knopf, sicherKnopf, autoHoehe } = W.hilfen;
    const tafel = $("tafel");
    const inhalt = $("tafel-inhalt");
    const scroll = tafel.scrollTop;
    const zuvor = tafel.hidden ? null : inhalt.dataset.fuer;
    inhalt.innerHTML = "";
    inhalt.dataset.fuer = p.id;
    inhalt.style.setProperty("--farbe", `var(--${p.gruppe})`);
    const entwurf = p.entwurf ? entwurfVon(p) : null;
    const neuZeichnen = () => waehlen(p.id);
    const feld = (wert, platzhalter, zeilen = 2) => {
      const t = autoHoehe(el("textarea", "ws-editor"));
      t.value = wert ?? "";
      t.rows = zeilen;
      t.placeholder = platzhalter ?? "";
      return t;
    };
    const kontext = { titel: p.titel, quelle: "baum" };

    // Titel
    if (entwurf) {
      const t = el("input", "ws-editor titel-feld");
      t.value = entwurf.titel ?? "";
      t.placeholder = "Titel der neuen Passage";
      t.onchange = () => still(() => W.aendern(entwurf.id, { titel: t.value.trim() || "Neue Passage" }));
      inhalt.appendChild(t);
    } else {
      const t = el("input", "ws-editor titel-feld");
      t.value = p.titel;
      t.onchange = () => still(() => W.hinzufuegen({ art: "passage-titel", passage: p.id, vorher: D.passagen.find((x) => x.id === p.id)?.titel, nachher: t.value.trim(), ...kontext }));
      inhalt.appendChild(t);
    }
    inhalt.appendChild(el("div", "id", p.entwurf ? `${p.id} · Entwurf, noch nicht im Spiel` : p.id));
    inhalt.appendChild(el("span", "teil", `${p.gruppe} · ${D.teile[p.gruppe] ?? ""}`));
    for (const h of p.herkunft) inhalt.appendChild(el("p", `herkunft${h.includes("PRÜFEN") ? " pruefen" : ""}`, h));
    inhalt.appendChild(tafelWerkzeuge(p));

    // Text
    inhalt.appendChild(el("h4", "", "Text"));
    const textBox = el("div", "text bearbeitbar");
    if (entwurf) {
      const zeilen = [...(entwurf.zeilen ?? [])];
      const speichern = () => still(() => W.aendern(entwurf.id, { zeilen: zeilen.filter((z) => z.trim()) }));
      zeilen.forEach((z, i) => {
        const t = feld(z, "Absatz");
        t.onchange = () => {
          zeilen[i] = t.value;
          speichern();
        };
        textBox.appendChild(t);
      });
      textBox.appendChild(knopf("+ Absatz", () => {
        W.aendern(entwurf.id, { zeilen: [...zeilen.filter((z) => z.trim()), "…"] });
      }, "klein"));
    } else {
      for (const z of p.zeilen) {
        if (z.bed) textBox.appendChild(el("p", "bed", z.bed));
        if (!z.text && !z.orig && z.status !== "neu") continue;
        if (z.status === "neu") {
          const t = feld(z.text, "Neuer Absatz");
          t.classList.add("neu");
          t.onchange = () => still(() => (t.value.trim() ? W.aendern(z.vorschlag, { nachher: t.value.trim() }) : W.entfernen(z.vorschlag)));
          textBox.appendChild(t);
          continue;
        }
        const t = feld(z.status === "weg" ? z.orig : z.text);
        if (z.status) t.classList.add(z.status);
        t.onchange = () => still(() => {
          const neu = t.value.trim();
          const alt = W.liste().find((a) => (a.art === "text" || a.art === "loeschen") && a.vorher === z.orig && (a.passage === p.id || !byIdHat(a.passage)));
          if (neu === z.orig) {
            if (alt) W.entfernen(alt.id);
          } else if (!neu) W.hinzufuegen({ art: "loeschen", passage: p.id, vorher: z.orig, ...kontext });
          else W.hinzufuegen({ art: "text", passage: p.id, vorher: z.orig, nachher: neu, ...kontext });
        });
        const reihe = el("div", "zeile-werkzeug");
        reihe.append(
          knopf("+ Absatz danach", () => W.hinzufuegen({ art: "einfuegen", passage: p.id, nach: z.orig, nachher: "…", ...kontext }), "klein"),
          z.status === "weg"
            ? knopf("Wieder aufnehmen", () => W.entfernen(z.vorschlag), "klein")
            : knopf("Streichen", () => W.hinzufuegen({ art: "loeschen", passage: p.id, vorher: z.orig, ...kontext }), "klein"),
        );
        textBox.append(t, reihe);
      }
      if (!p.zeilen.some((z) => z.orig)) textBox.appendChild(knopf("+ Absatz", () => W.hinzufuegen({ art: "einfuegen", passage: p.id, nach: "", nachher: "…", ...kontext }), "klein"));
    }
    inhalt.appendChild(textBox);
    if (p.logik.length) {
      inhalt.appendChild(el("h4", "", "Logik"));
      for (const l of p.logik) inhalt.appendChild(el("p", "logik", l));
    }

    // Entscheidungen
    inhalt.appendChild(el("h4", "", `Entscheidungen (${p.choices.length})`));
    const ol = el("ol", "bearbeitbar");
    const zielFeld = (wert, onchange) => {
      const i = el("input", "ws-editor ziel");
      i.value = wert ?? "";
      i.placeholder = "→ wohin? (Passage oder frei beschrieben)";
      i.setAttribute("list", "passagen-liste");
      i.onchange = () => onchange(i.value.trim());
      return i;
    };
    p.choices.forEach((c, ci) => {
      const li = el("li", c.weg ? "weg" : c.entwurf ? "neu" : c.textNeu ? "geaendert" : "");
      if (c.entwurf) {
        // vorgeschlagene Entscheidung: in einem Entwurf (a.choices) oder an einer bestehenden Passage (wahl-neu)
        const a = W.liste().find((x) => x.id === c.entwurf);
        const ausEntwurf = a?.art === "passage-neu";
        const idx = ausEntwurf ? ci - 0 : null;
        const setze = (patch) => still(() => {
          if (ausEntwurf) {
            const choices = (a.choices ?? []).map((x, j) => (j === idx ? { ...x, ...patch } : x));
            W.aendern(a.id, { choices });
          } else W.aendern(a.id, { ...patch, ...(patch.text ? { nachher: patch.text } : {}), ...(patch.folgen ? { folge: patch.folgen.join("\n\n") } : {}) });
        });
        const t = el("input", "ws-editor wahl-feld");
        t.value = c.text;
        t.onchange = () => setze({ text: t.value.trim() });
        const f = feld(c.folgen.map((x) => x.text).join("\n\n"), "Was passiert dann? (optional)");
        f.onchange = () => setze({ folgen: f.value.trim() ? [f.value.trim()] : [] });
        li.append(t, f, zielFeld(c.ziel, (v) => setze({ ziel: v || null })));
        li.appendChild(knopf("Entscheidung entfernen", () => {
          if (ausEntwurf) W.aendern(a.id, { choices: (a.choices ?? []).filter((_, j) => j !== idx) });
          else W.entfernen(a.id);
        }, "klein"));
      } else {
        const t = el("input", "ws-editor wahl-feld");
        t.value = c.textNeu ?? c.text;
        t.onchange = () => still(() => {
          const neu = t.value.trim();
          const alt = W.liste().find((a) => a.art === "wahl" && a.vorher === c.text && a.passage === p.id);
          if (!neu || neu === c.text) alt && W.entfernen(alt.id);
          else W.hinzufuegen({ art: "wahl", passage: p.id, vorher: c.text, nachher: neu, ...kontext });
        });
        li.appendChild(t);
        if (c.bedingung) li.appendChild(el("span", "bedingung", `nur wenn ${c.bedingung}`));
        for (const fo of c.folgen) {
          const f = feld(fo.status === "weg" ? fo.orig : fo.text);
          if (fo.status) f.classList.add(fo.status);
          f.onchange = () => still(() => {
            const neu = f.value.trim();
            if (fo.vorschlag && (neu === fo.orig || (!fo.orig && !neu))) W.entfernen(fo.vorschlag);
            else if (fo.vorschlag && !fo.orig) W.aendern(fo.vorschlag, { nachher: neu });
            else if (neu !== fo.orig) W.hinzufuegen({ art: "wahl-folge", passage: p.id, wahlText: c.text, vorher: fo.orig, nachher: neu, ...kontext });
          });
          li.appendChild(f);
        }
        if (c.logik?.length) li.appendChild(el("p", "logik", c.logik.join(" · ")));
        li.appendChild(zielFeld(c.zielNeu ?? c.ziel, (v) => still(() => {
          const alt = W.liste().find((a) => a.art === "wahl-ziel" && a.wahlText === c.text && a.passage === p.id);
          if (!v || v === c.ziel) alt && W.entfernen(alt.id);
          else W.hinzufuegen({ art: "wahl-ziel", passage: p.id, wahlText: c.text, vorher: c.ziel, nachher: v, ...kontext });
        })));
        const reihe = el("div", "zeile-werkzeug");
        reihe.append(
          knopf("+ Folgetext", () => W.hinzufuegen({ art: "wahl-folge", passage: p.id, wahlText: c.text, vorher: "", nachher: "…", ...kontext }), "klein"),
          c.weg ? knopf("Wieder aufnehmen", () => W.entfernen(c.weg), "klein") : knopf("Streichen", () => W.hinzufuegen({ art: "wahl-loeschen", passage: p.id, vorher: c.text, ...kontext }), "klein"),
        );
        const ziel = c.zielNeu ?? c.ziel;
        if (ziel && A.byId.has(ziel)) reihe.appendChild(springeKnopf(ziel, `→ ${A.byId.get(ziel).titel}`));
        li.appendChild(reihe);
      }
      ol.appendChild(li);
    });
    inhalt.appendChild(ol);
    const unten = el("div", "zeile-werkzeug");
    unten.append(
      knopf("+ Entscheidung", () => {
        if (entwurf) W.aendern(entwurf.id, { choices: [...(entwurf.choices ?? []), { text: "Neue Entscheidung", ziel: null, folgen: [] }] });
        else W.hinzufuegen({ art: "wahl-neu", passage: p.id, text: "Neue Entscheidung", nachher: "Neue Entscheidung", ...kontext });
      }, "klein"),
      knopf("+ Neue Passage von hier", () => neuePassage(p), "klein"),
    );
    inhalt.appendChild(unten);

    // Notizen, Streichen
    inhalt.appendChild(el("h4", "", "Mehr"));
    for (const a of W.liste().filter((x) => x.art === "notiz" && x.passage === p.id)) {
      const t = feld(a.nachher, "Notiz");
      t.onchange = () => still(() => (t.value.trim() ? W.aendern(a.id, { nachher: t.value.trim() }) : W.entfernen(a.id)));
      inhalt.appendChild(t);
    }
    const mehr = el("div", "zeile-werkzeug");
    mehr.append(knopf("Notiz zu dieser Passage", () => W.hinzufuegen({ art: "notiz", passage: p.id, titel: p.titel, nachher: "…" }), "klein"));
    if (entwurf) mehr.append(sicherKnopf("Entwurf verwerfen", "Wirklich verwerfen?", () => {
      // Entscheidungen, die auf den Entwurf zeigen, gehören dazu.
      for (const a of W.liste().filter((x) => x.art === "wahl-neu" && x.ziel === p.id)) W.entfernen(a.id);
      W.entfernen(entwurf.id);
      waehlen(entwurf.nahe && A.byId.has(entwurf.nahe) ? entwurf.nahe : null);
    }, "klein"));
    else if (p.art !== "virtuell" && p.art !== "ende") {
      mehr.append(p.weg
        ? knopf("Passage wieder aufnehmen", () => W.entfernen(p.weg), "klein")
        : sicherKnopf("Ganze Passage streichen", "Wirklich streichen?", () => W.hinzufuegen({ art: "passage-loeschen", passage: p.id, titel: p.titel }), "klein"));
    }
    inhalt.appendChild(mehr);
    if (p.weg) inhalt.insertBefore(el("p", "vorschlag-hinweis weg", "Du schlägst vor, diese Passage zu streichen."), textBox.previousSibling);
    weiterUndHerkunft(inhalt, p.id);
    passagenListe();
    tafel.hidden = false;
    tafel.scrollTop = zuvor === p.id ? scroll : 0;
  }
  const byIdHat = (id) => A.byId.has(id);

  function passagenListe() {
    let dl = $("passagen-liste");
    if (!dl) {
      dl = el("datalist");
      dl.id = "passagen-liste";
      document.body.appendChild(dl);
    }
    dl.innerHTML = "";
    for (const p of A.passagen) {
      if (p.art === "virtuell") continue;
      const o = el("option");
      o.value = p.id;
      o.label = p.titel;
      dl.appendChild(o);
    }
  }

  function neuePassage(von) {
    const id = `neu_${Date.now().toString(36)}`;
    const geschwister = W.liste().filter((a) => a.art === "passage-neu" && a.nahe === von?.id).length;
    let pos;
    if (!von) {
      const r = leinwand.getBoundingClientRect();
      pos = [Math.round((r.width / 2 - ansicht.x) / ansicht.s), Math.round((r.height / 2 - ansicht.y) / ansicht.s)];
    }
    W.hinzufuegen({ art: "passage-neu", passage: id, titel: "Neue Passage", zeilen: ["…"], choices: [], nahe: von?.id, versatz: von ? [geschwister * (B + 30), H + 70] : undefined, pos });
    if (von) {
      const e = von.entwurf && entwurfVon(von);
      if (e) W.aendern(e.id, { choices: [...(e.choices ?? []), { text: "Weiter", ziel: id, folgen: [] }] });
      else W.hinzufuegen({ art: "wahl-neu", passage: von.id, text: "Neue Entscheidung", nachher: "Neue Entscheidung", ziel: id, titel: von.titel, quelle: "baum" });
    }
    waehlen(id);
    zuKnoten(id);
    W.hinweis("Neue Passage angelegt. Text und Entscheidungen rechts; auf der Karte lässt sie sich verschieben.");
  }

  function entwurfVerschieben(id, ziel) {
    const a = W.liste().find((x) => x.art === "passage-neu" && x.passage === id);
    if (!a) return;
    const von = a.nahe && P[a.nahe];
    still(() => W.aendern(a.id, von ? { versatz: [ziel[0] - von[0], ziel[1] - von[1]] } : { pos: ziel }));
  }

  function ausHash() {
    const m = location.hash.match(/^#p=(.+)$/);
    if (!m) return;
    const id = decodeURIComponent(m[1]);
    const p = nachId(id);
    if (!p) return;
    if (!sichtbar.has(id)) {
      mitBausteinen = true;
      $("bausteine").checked = true;
      zeichnen();
    }
    waehlen(id);
    zuKnoten(id);
  }
  $("neu-passage").onclick = () => neuePassage(gewaehlt ? nachId(gewaehlt) : null);

  // ------------------------------------------------------------ Suche
  function suchen() {
    const q = $("suche").value.trim().toLowerCase();
    for (const k of document.querySelectorAll(".k.fund")) k.classList.remove("fund");
    if (!q) {
      treffer = [];
      $("treffer").textContent = "";
      return;
    }
    treffer = [...sichtbar.values()]
      .filter((p) => [p.titel, p.id, ...p.zeilen.map((z) => z.text), ...p.choices.flatMap((c) => [c.textNeu ?? c.text, ...c.folgen.map((f) => f.text)])].join(" ").toLowerCase().includes(q))
      .map((p) => p.id);
    for (const id of treffer) document.querySelector(`.k[data-id="${CSS.escape(id)}"]`)?.classList.add("fund");
    $("treffer").textContent = `${treffer.length} Treffer`;
    trefferIdx = -1;
  }
  $("suche").addEventListener("input", suchen);
  $("suche").addEventListener("keydown", (e) => {
    if (e.key !== "Enter" || !treffer.length) return;
    trefferIdx = (trefferIdx + 1) % treffer.length;
    $("treffer").textContent = `${trefferIdx + 1} / ${treffer.length}`;
    waehlen(treffer[trefferIdx]);
    zuKnoten(treffer[trefferIdx]);
  });

  // ------------------------------------------------------------ Steuerung
  $("bausteine").addEventListener("change", (e) => {
    mitBausteinen = e.target.checked;
    zeichnen();
    gewaehlt ? zuKnoten(gewaehlt) : alles();
  });
  $("z-fit").onclick = alles;
  $("z-start").onclick = () => {
    waehlen(D.start);
    zuKnoten(D.start, 0.9);
  };
  $("z-plus").onclick = () => {
    const r = leinwand.getBoundingClientRect();
    zoomUm(1.25, r.width / 2, r.height / 2);
  };
  $("z-minus").onclick = () => {
    const r = leinwand.getBoundingClientRect();
    zoomUm(0.8, r.width / 2, r.height / 2);
  };
  $("tafel-zu").onclick = () => {
    waehlen(null);
    try {
      history.replaceState(null, "", location.pathname + location.search);
    } catch {
      /* egal */
    }
  };
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") waehlen(null);
  });
  window.addEventListener("resize", minikarte);
  // Die Detailtafel beginnt unter der Kopfleiste, damit Bearbeiten, Suche und Spielen erreichbar bleiben.
  const kopfMessen = () => document.documentElement.style.setProperty("--kopf-hoehe", `${$("kopf").getBoundingClientRect().height}px`);
  kopfMessen();
  if (window.ResizeObserver) new ResizeObserver(kopfMessen).observe($("kopf"));

  function legende() {
    const ul = $("legende");
    for (const [g, name] of Object.entries(D.teile)) {
      const li = el("li");
      const i = el("i");
      i.style.background = `var(--${g})`;
      li.append(i, document.createTextNode(name));
      ul.appendChild(li);
    }
    for (const [cls, name] of [["wahl", "Entscheidung"], ["weiter", "weiter"], ["bedingt", "bedingt"], ["tod", "Tod"]]) {
      const li = el("li", `linie ${cls}`);
      li.append(el("i"), document.createTextNode(name));
      ul.appendChild(li);
    }
  }

  fetch("twine.json")
    .then((r) => r.json())
    .then((daten) => {
      D = daten;
      legende();
      zeichnen();
      // Start oben, gut lesbar: so beginnt man in Twine.
      const r = leinwand.getBoundingClientRect();
      const [sx, sy] = P[D.start];
      ansicht.s = r.width < 640 ? 0.55 : 0.8;
      ansicht.x = r.width / 2 - sx * ansicht.s;
      ansicht.y = 40 - (sy - H / 2) * ansicht.s;
      anwenden();
      ausHash();
      window.addEventListener("hashchange", ausHash);
      W?.beiAenderung(() => {
        zeichnen();
        if (stilleAenderung) return;
        if (gewaehlt) waehlen(gewaehlt);
      });
      W?.beiModus(() => {
        $("neu-passage").hidden = !W.bearbeiten();
        if (gewaehlt) waehlen(gewaehlt);
      });
      $("neu-passage").hidden = !W?.bearbeiten();
    })
    .catch((e) => {
      $("statistik").textContent = `Die Daten konnten nicht geladen werden (${e.message}).`;
    });
})();
