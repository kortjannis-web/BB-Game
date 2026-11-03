// Spieloberfläche: zeigt die Geschichte Absatz für Absatz, die Entscheidungen, Vignette, Leiste und Notizbuch.
(() => {
  const SPEICHER = "yharnam-spielstand-v1";
  const $ = (id) => document.getElementById(id);
  const text = $("text");
  const wahl = $("wahl");
  let story = null;
  let notizen = [];

  const speichern = () => {
    try {
      const absaetze = [...text.children].slice(-40).map((el) => ({ tag: el.tagName, html: el.innerHTML, cls: el.className }));
      localStorage.setItem(SPEICHER, JSON.stringify({ state: story.state.toJson(), notizen, absaetze, stimmung: document.body.dataset.stimmung }));
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

  function absatz(zeile, tags) {
    const p = document.createElement("p");
    p.textContent = zeile;
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
      const zeile = story.Continue().trim();
      const tags = story.currentTags ?? [];
      const p = absatz(zeile, tags);
      if (!zeile) {
        continue;
      }
      text.appendChild(p);
      erster ??= p;
    }
    leisteAktualisieren();
    zeigeWahl();
    if (erster) erster.scrollIntoView({ behavior: "smooth", block: "start" });
    speichern();
  }

  function zeigeWahl() {
    wahl.innerHTML = "";
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
        location.reload();
      };
      wahl.appendChild(neu);
      return;
    }
    story.currentChoices.forEach((c, i) => {
      const b = document.createElement("button");
      b.textContent = c.text;
      b.onclick = () => waehlen(i);
      b.style.animationDelay = `${i * 60}ms`;
      wahl.appendChild(b);
    });
  }

  function waehlen(i) {
    for (const p of text.querySelectorAll("p:not(.alt)")) p.classList.add("alt");
    const gewaehlt = document.createElement("p");
    gewaehlt.className = "alt";
    gewaehlt.innerHTML = `<em>› ${story.currentChoices[i].text}</em>`;
    text.appendChild(gewaehlt);
    text.appendChild(document.createElement("hr"));
    story.ChooseChoiceIndex(i);
    weiter();
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

  function notizbuchZeigen() {
    const box = $("notizen");
    box.innerHTML = "";
    if (!notizen.length) box.innerHTML = '<p class="leer">Noch leer. Yharnam wird es füllen.</p>';
    for (const id of notizen) {
      const [titel, inhalt] = window.NOTIZBUCH[id];
      const a = document.createElement("article");
      a.innerHTML = "<h3></h3><p></p>";
      a.querySelector("h3").textContent = titel;
      a.querySelector("p").textContent = inhalt;
      box.appendChild(a);
    }
    $("notizbuch").showModal();
  }

  async function start() {
    const json = await (await fetch("story.json")).text();
    story = new inkjs.Story(json);
    document.body.dataset.stimmung = "ruhig";
    const gespeichert = laden();
    if (gespeichert) $("fortsetzen").hidden = false;

    $("namensform").addEventListener("submit", (e) => {
      e.preventDefault();
      if (gespeichert && $("warnung").hidden) {
        $("warnung").hidden = false;
        return;
      }
      const name = $("name").value.trim() || "Jäger";
      story.variablesState["name"] = name;
      zeigeSpiel();
      weiter();
    });
    $("fortsetzen").addEventListener("click", () => {
      story.state.LoadJson(gespeichert.state);
      notizen = gespeichert.notizen ?? [];
      document.body.dataset.stimmung = gespeichert.stimmung ?? "ruhig";
      for (const a of gespeichert.absaetze ?? []) {
        const el = document.createElement(a.tag === "HR" ? "hr" : "p");
        el.innerHTML = a.html;
        el.className = a.cls;
        text.appendChild(el);
      }
      zeigeSpiel();
      leisteAktualisieren();
      zeigeWahl();
      wahl.scrollIntoView({ block: "end" });
    });
    $("knopf-notizbuch").addEventListener("click", notizbuchZeigen);
    $("neu").addEventListener("click", neuBeginnen);
  }

  start().catch((e) => {
    document.body.innerHTML = `<p style="padding:2rem">Die Geschichte konnte nicht geladen werden (${e.message}). Bitte mit <code>npm run spielen</code> starten.</p>`;
  });
})();
