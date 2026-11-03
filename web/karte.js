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

  const farbe = (g) => getComputedStyle(document.documentElement).getPropertyValue(`--${g}`).trim() || "#888";
  const auszug = (p) => {
    const z = p.zeilen.find((s) => s && !s.startsWith("⟨"));
    if (z) return z;
    if (p.choices.length) return p.choices.map((c) => `› ${c.text}`).join("  ");
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
    sichtbar = new Map(D.passagen.filter((p) => L.pos[p.id] && (mitBausteinen || !p.baustein)).map((p) => [p.id, p]));
    const box = $("knoten");
    box.innerHTML = "";
    for (const p of sichtbar.values()) {
      const [x, y] = L.pos[p.id];
      const k = el("div", "k");
      k.dataset.id = p.id;
      k.style.left = `${x - B / 2}px`;
      k.style.top = `${y - H / 2}px`;
      k.style.setProperty("--farbe", `var(--${p.gruppe})`);
      if (p.id === D.start) k.classList.add("start");
      if (NADELOEHRE.has(p.id)) k.classList.add("nadeloehr");
      if (p.id === "END") k.classList.add("ende");
      if (p.baustein) k.classList.add("baustein");
      const abz = p.id === D.start ? "START" : NADELOEHRE.has(p.id) ? "NADELÖHR" : p.id === "END" ? "ENDE" : p.art === "stitch" ? "" : "";
      if (abz) k.appendChild(el("span", "abzeichen", abz));
      k.appendChild(el("h3", "", p.titel));
      k.appendChild(el("p", "", auszug(p)));
      const f = el("footer");
      f.appendChild(el("span", "", `${p.choices.length} Wahl`));
      f.appendChild(el("span", "", `${p.woerter} Wörter`));
      if (p.herkunft.some((h) => h.includes("PRÜFEN"))) f.appendChild(el("span", "", "PRÜFEN"));
      k.appendChild(f);
      box.appendChild(k);
    }

    const svg = $("linien");
    svg.setAttribute("width", L.breite);
    svg.setAttribute("height", L.hoehe);
    const g = $("kanten");
    g.innerHTML = "";
    kanten = D.kanten.filter((k) => sichtbar.has(k.von) && sichtbar.has(k.nach) && (mitBausteinen || k.art !== "tod"));
    for (const k of kanten) {
      const [sx, sy] = L.pos[k.von];
      const [tx, ty] = L.pos[k.nach];
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
      pfad.dataset.von = k.von;
      pfad.dataset.nach = k.nach;
      const p = sichtbar.get(k.von);
      const titel = document.createElementNS("http://www.w3.org/2000/svg", "title");
      titel.textContent = k.wahl !== undefined && p.choices[k.wahl] ? `› ${p.choices[k.wahl].text}` : { weiter: "weiter", bedingt: "bedingt", tod: "Tod", tunnel: "Baustein" }[k.art] ?? k.art;
      pfad.appendChild(titel);
      g.appendChild(pfad);
    }

    const s = D.stats;
    $("statistik").textContent = `${s.passagen} Passagen · ${s.entscheidungen} Entscheidungen · ${s.kanten} Verbindungen · ${s.woerter.toLocaleString("de-DE")} Wörter · sichtbar ${sichtbar.size}`;
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
    const pos = L.pos[id];
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
    ansicht.x += e.clientX - alt.x;
    ansicht.y += e.clientY - alt.y;
    zeiger.set(e.pointerId, { x: e.clientX, y: e.clientY });
    if (zug && Math.hypot(e.clientX - zug.x, e.clientY - zug.y) > 5) zug.bewegt = true;
    anwenden();
  });
  const loslassen = (e) => {
    zeiger.delete(e.pointerId);
    if (zeiger.size === 0) {
      leinwand.classList.remove("ziehen");
      if (zug && !zug.bewegt) waehlen(zug.ziel);
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
      const [x, y] = L.pos[p.id];
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
    const b = el("button", "springe", text ?? sichtbar.get(id)?.titel ?? D.passagen.find((p) => p.id === id)?.titel ?? id);
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
    const p = D.passagen.find((x) => x.id === id);
    const inhalt = $("tafel-inhalt");
    inhalt.innerHTML = "";
    inhalt.style.setProperty("--farbe", `var(--${p.gruppe})`);
    inhalt.appendChild(el("h2", "", p.titel));
    inhalt.appendChild(el("div", "id", p.id));
    inhalt.appendChild(el("span", "teil", `${p.gruppe} · ${D.teile[p.gruppe] ?? ""}`));
    for (const h of p.herkunft) inhalt.appendChild(el("p", `herkunft${h.includes("PRÜFEN") ? " pruefen" : ""}`, h));

    if (p.zeilen.length) {
      inhalt.appendChild(el("h4", "", "Text"));
      const t = el("div", "text");
      for (const z of p.zeilen) {
        if (!z) continue;
        const bed = z.startsWith("⟨");
        const m = bed ? z.match(/^(⟨[^⟩]*⟩)\s*(.*)$/) : null;
        if (m) {
          t.appendChild(el("p", "bed", m[1]));
          if (m[2]) t.appendChild(el("p", "", m[2]));
        } else t.appendChild(el("p", "", z));
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
        const li = el("li");
        li.appendChild(el("span", "wahl", c.text));
        if (c.bedingung) li.appendChild(el("span", "bedingung", `nur wenn ${c.bedingung}`));
        if (c.wiederholbar) li.appendChild(el("span", "bedingung", "wiederholbar"));
        for (const f of c.folgen) li.appendChild(el("p", "folge", f));
        if (c.logik.length) li.appendChild(el("p", "logik", c.logik.join(" · ")));
        if (c.ziel) li.appendChild(springeKnopf(c.ziel, `→ ${D.passagen.find((x) => x.id === c.ziel)?.titel ?? c.ziel}`));
        ol.appendChild(li);
      }
      inhalt.appendChild(ol);
    }
    const weiter = D.kanten.filter((k) => k.von === id && k.wahl === undefined);
    if (weiter.length) {
      inhalt.appendChild(el("h4", "", "Weiter"));
      const box = el("div", "liste");
      for (const k of weiter) box.appendChild(springeKnopf(k.nach, `${{ weiter: "→", bedingt: "⇢ bedingt", tod: "✝ Tod", tunnel: "↺ Baustein" }[k.art] ?? "→"} ${D.passagen.find((x) => x.id === k.nach)?.titel ?? k.nach}`));
      inhalt.appendChild(box);
    }
    const ein = [...new Set(D.kanten.filter((k) => k.nach === id).map((k) => k.von))];
    if (ein.length) {
      inhalt.appendChild(el("h4", "", `Kommt von (${ein.length})`));
      const box = el("div", "liste");
      for (const v of ein) box.appendChild(springeKnopf(v));
      inhalt.appendChild(box);
    }
    tafel.hidden = false;
    tafel.scrollTop = 0;
  }

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
      .filter((p) => [p.titel, p.id, ...p.zeilen, ...p.choices.flatMap((c) => [c.text, ...c.folgen])].join(" ").toLowerCase().includes(q))
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
  $("tafel-zu").onclick = () => waehlen(null);
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") waehlen(null);
  });
  window.addEventListener("resize", minikarte);

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
      const [sx, sy] = L.pos[D.start];
      ansicht.s = r.width < 640 ? 0.55 : 0.8;
      ansicht.x = r.width / 2 - sx * ansicht.s;
      ansicht.y = 40 - (sy - H / 2) * ansicht.s;
      anwenden();
    })
    .catch((e) => {
      $("statistik").textContent = `Die Daten konnten nicht geladen werden (${e.message}).`;
    });
})();
