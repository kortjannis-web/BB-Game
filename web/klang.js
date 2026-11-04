// Ton: Atmosphäre und Geräusche, fast alles im Browser erzeugt (WebAudio), dazu wenige CC0-Aufnahmen
// von Kenney (web/klang/, Lizenz in LICENSE-kenney.txt). Leise, abschaltbar, startet erst nach einem Klick
// (Browser erlauben vorher keinen Ton). Die Spieluhr-Melodie ist eine eigene Komposition.
// Schnittstelle: window.KLANG.tag(schluessel, wert), .leben(n), .treffer(), .heilung(), .notizbuch()
(() => {
  const SPEICHER = "yharnam-ton";
  let an = true;
  try {
    an = localStorage.getItem(SPEICHER) !== "aus";
  } catch {
    /* ohne Speicher bleibt der Ton an */
  }
  let ctx = null;
  let master = null;
  let atmo = null;
  let stimmung = "ruhig";
  let herz = null;
  let lebenJetzt = 5;
  const puffer = {};
  const DATEIEN = { slice: "klang/slice.mp3", block: "klang/block.mp3", door: "klang/door.mp3", doorCreak: "klang/doorCreak.mp3", footsteps: "klang/footsteps.mp3", paper: "klang/paper.mp3", combatStart: "klang/combatStart.mp3" };

  function starten() {
    if (ctx || !an) return;
    try {
      ctx = new (window.AudioContext || window.webkitAudioContext)();
    } catch {
      return;
    }
    master = ctx.createGain();
    master.gain.value = 0.55;
    master.connect(ctx.destination);
    for (const [name, url] of Object.entries(DATEIEN)) {
      fetch(url)
        .then((r) => r.arrayBuffer())
        .then((b) => ctx.decodeAudioData(b))
        .then((d) => (puffer[name] = d))
        .catch(() => {});
    }
    atmosphaere(stimmung);
    herzschlag();
  }
  // Der erste Klick irgendwo startet den Ton.
  window.addEventListener("pointerdown", () => {
    starten();
    if (ctx?.state === "suspended") ctx.resume();
  }, { once: false });

  const jetzt = () => ctx.currentTime;
  function rauschen(dauer = 2) {
    const n = Math.floor(ctx.sampleRate * dauer);
    const b = ctx.createBuffer(1, n, ctx.sampleRate);
    const d = b.getChannelData(0);
    for (let i = 0; i < n; i++) d[i] = Math.random() * 2 - 1;
    return b;
  }
  function datei(name, lautstaerke = 0.6) {
    if (!ctx || !puffer[name]) return;
    const s = ctx.createBufferSource();
    s.buffer = puffer[name];
    const g = ctx.createGain();
    g.gain.value = lautstaerke;
    s.connect(g).connect(master);
    s.start();
  }
  function ton(freq, start, dauer, { typ = "sine", laut = 0.2, ziel = master, angriff = 0.005 } = {}) {
    const o = ctx.createOscillator();
    const g = ctx.createGain();
    o.type = typ;
    o.frequency.value = freq;
    g.gain.setValueAtTime(0, start);
    g.gain.linearRampToValueAtTime(laut, start + angriff);
    g.gain.exponentialRampToValueAtTime(0.0001, start + dauer);
    o.connect(g).connect(ziel);
    o.start(start);
    o.stop(start + dauer + 0.05);
    return o;
  }

  // ------------------------------------------------------------ Atmosphäre je Stimmung
  function atmosphaere(art) {
    if (!ctx) return;
    const alt = atmo;
    if (alt) {
      alt.gain.gain.setTargetAtTime(0, jetzt(), 1.2);
      setTimeout(() => alt.stopp(), 5000);
    }
    const gain = ctx.createGain();
    gain.gain.value = 0;
    gain.connect(master);
    const quellen = [];
    const timer = [];
    // Wind: gefiltertes Rauschen, dessen Filter langsam wandert
    const wind = ctx.createBufferSource();
    wind.buffer = rauschen(4);
    wind.loop = true;
    const filter = ctx.createBiquadFilter();
    filter.type = "bandpass";
    filter.frequency.value = art === "grauen" ? 260 : 420;
    filter.Q.value = 0.8;
    const lfo = ctx.createOscillator();
    lfo.frequency.value = 0.07;
    const lfoGain = ctx.createGain();
    lfoGain.gain.value = 180;
    lfo.connect(lfoGain).connect(filter.frequency);
    const windGain = ctx.createGain();
    windGain.gain.value = { ruhig: 0.05, schoen: 0.03, spannung: 0.07, kampf: 0.06, grauen: 0.09 }[art] ?? 0.05;
    wind.connect(filter).connect(windGain).connect(gain);
    wind.start();
    lfo.start();
    quellen.push(wind, lfo);
    // Grundton: tiefe, leicht verstimmte Sinustöne
    const grund = { ruhig: [55, 55.4], schoen: [73.4, 110], spannung: [49, 51.9], kampf: [41.2, 43.7], grauen: [46.2, 49] }[art] ?? [55, 55.4];
    for (const f of grund) {
      const o = ctx.createOscillator();
      o.frequency.value = f;
      const g = ctx.createGain();
      g.gain.value = art === "kampf" ? 0.05 : 0.035;
      o.connect(g).connect(gain);
      o.start();
      quellen.push(o);
    }
    // Ferne Glocken in ruhigen und angespannten Stimmungen, selten und unregelmäßig
    if (art === "ruhig" || art === "spannung") {
      const glocke = () => {
        const t = jetzt() + 0.1;
        const f = [196, 174.6, 220][Math.floor(Math.random() * 3)];
        for (const [m, l] of [[1, 0.05], [2.76, 0.02], [5.4, 0.01]]) ton(f * m, t, 6, { laut: l, ziel: gain, angriff: 0.01 });
      };
      timer.push(setInterval(() => Math.random() < 0.35 && glocke(), 9000));
    }
    // Im Kampf ein langsamer, dumpfer Puls
    if (art === "kampf") {
      timer.push(setInterval(() => {
        const t = jetzt();
        const o = ton(70, t, 0.35, { laut: 0.12, ziel: gain });
        o.frequency.exponentialRampToValueAtTime(40, t + 0.3);
      }, 1100));
    }
    gain.gain.setTargetAtTime(1, jetzt(), 2);
    atmo = {
      gain,
      stopp() {
        for (const q of quellen) try { q.stop(); } catch { /* schon gestoppt */ }
        for (const t of timer) clearInterval(t);
        gain.disconnect();
      },
    };
  }

  // ------------------------------------------------------------ Herzschlag bei wenig Leben
  function herzschlag() {
    if (herz) clearTimeout(herz);
    const schlag = () => {
      if (ctx && an && lebenJetzt <= 2 && lebenJetzt > 0) {
        const t = jetzt();
        for (const [d, l] of [[0, 0.22], [0.22, 0.15]]) {
          const o = ton(60, t + d, 0.25, { laut: l });
          o.frequency.exponentialRampToValueAtTime(35, t + d + 0.2);
        }
      }
      herz = setTimeout(schlag, lebenJetzt <= 1 ? 850 : 1200);
    };
    schlag();
  }

  // ------------------------------------------------------------ Einzelne Klänge
  const KLAENGE = {
    // Eigene Spieluhr-Melodie (d-Moll, Dreiertakt): Spieluhr-Klang aus Sinus und hellen Obertönen mit schnellem Abklingen.
    spieluhr() {
      const noten = [
        [74, 1], [77, 1], [81, 1], [79, 2], [77, 1],
        [76, 1], [74, 1], [72, 1], [74, 3],
        [69, 1], [72, 1], [77, 1], [76, 2], [74, 1],
        [73, 1], [74, 1], [76, 1], [74, 3],
      ];
      let t = jetzt() + 0.05;
      const schlag = 0.42;
      for (const [midi, laenge] of noten) {
        const f = 440 * Math.pow(2, (midi - 69) / 12);
        ton(f, t, 1.6, { laut: 0.09 });
        ton(f * 2, t, 0.6, { laut: 0.03 });
        ton(f * 4.2, t, 0.25, { laut: 0.012 });
        t += schlag * laenge * (1 + (Math.random() - 0.5) * 0.04);
      }
    },
    kleriker_schrei() {
      const t = jetzt();
      const n = ctx.createBufferSource();
      n.buffer = rauschen(2.5);
      const bp = ctx.createBiquadFilter();
      bp.type = "bandpass";
      bp.Q.value = 9;
      bp.frequency.setValueAtTime(900, t);
      bp.frequency.linearRampToValueAtTime(1900, t + 0.8);
      bp.frequency.linearRampToValueAtTime(700, t + 2.3);
      const g = ctx.createGain();
      g.gain.setValueAtTime(0, t);
      g.gain.linearRampToValueAtTime(0.18, t + 0.3);
      g.gain.exponentialRampToValueAtTime(0.0001, t + 2.4);
      n.connect(bp).connect(g).connect(master);
      n.start(t);
      const o = ton(520, t, 2.2, { typ: "sawtooth", laut: 0.025, angriff: 0.3 });
      o.frequency.linearRampToValueAtTime(760, t + 0.9);
      o.frequency.linearRampToValueAtTime(410, t + 2.1);
    },
    schuss() {
      const t = jetzt();
      const n = ctx.createBufferSource();
      n.buffer = rauschen(0.6);
      const lp = ctx.createBiquadFilter();
      lp.type = "lowpass";
      lp.frequency.setValueAtTime(3500, t);
      lp.frequency.exponentialRampToValueAtTime(200, t + 0.5);
      const g = ctx.createGain();
      g.gain.setValueAtTime(0.5, t);
      g.gain.exponentialRampToValueAtTime(0.0001, t + 0.55);
      n.connect(lp).connect(g).connect(master);
      n.start(t);
    },
    echos() {
      const t = jetzt();
      [880, 1108.7, 1318.5, 1760].forEach((f, i) => ton(f, t + i * 0.07, 1.2, { laut: 0.03 }));
    },
    ampulle() {
      const t = jetzt();
      const o = ton(90, t, 0.4, { laut: 0.15 });
      o.frequency.exponentialRampToValueAtTime(50, t + 0.3);
      const w = ton(220, t + 0.1, 1.1, { laut: 0.04, angriff: 0.3 });
      w.frequency.exponentialRampToValueAtTime(440, t + 1);
    },
    // Ferner Choral von der Kathedrale: vier Stimmen (Sägezahn durch Vokalfilter „a“), langsam an- und abschwellend, dumpf wie durch Mauern.
    choral() {
      const t = jetzt();
      const dumpf = ctx.createBiquadFilter();
      dumpf.type = "lowpass";
      dumpf.frequency.value = 1400;
      const g = ctx.createGain();
      g.gain.setValueAtTime(0, t);
      g.gain.linearRampToValueAtTime(0.05, t + 1.8);
      g.gain.setValueAtTime(0.05, t + 4.2);
      g.gain.linearRampToValueAtTime(0, t + 7);
      dumpf.connect(g).connect(master);
      const akkorde = [[50, 57, 62, 65], [48, 55, 60, 63], [50, 57, 62, 66]];
      akkorde.forEach((akk, i) => {
        for (const midi of akk) {
          const f = 440 * Math.pow(2, (midi - 69) / 12);
          for (const formant of [700, 1150]) {
            const o = ctx.createOscillator();
            o.type = "sawtooth";
            o.frequency.value = f * (1 + (Math.random() - 0.5) * 0.006);
            const bp = ctx.createBiquadFilter();
            bp.type = "bandpass";
            bp.frequency.value = formant;
            bp.Q.value = 6;
            const s = ctx.createGain();
            const a = t + i * 2.3;
            s.gain.setValueAtTime(0, a);
            s.gain.linearRampToValueAtTime(0.25, a + 0.8);
            s.gain.linearRampToValueAtTime(0, a + 2.6);
            o.connect(bp).connect(s).connect(dumpf);
            o.start(a);
            o.stop(a + 2.7);
          }
        }
      });
    },
    // Ferne Kirchenglocke: unharmonische Teiltöne, langes Ausklingen.
    glocke() {
      const t = jetzt();
      for (const [faktor, l, d] of [[0.5, 0.05, 5], [1, 0.07, 4], [1.19, 0.035, 3], [1.5, 0.03, 2.5], [2.0, 0.02, 2], [2.66, 0.012, 1.4]]) {
        ton(196 * faktor, t, d, { laut: l, angriff: 0.004 });
      }
    },
    marke() {
      const t = jetzt();
      for (const [f, l] of [[523.3, 0.06], [784, 0.04], [1046.5, 0.02]]) ton(f, t, 2.2, { laut: l });
    },
    tod() {
      const t = jetzt();
      const o = ton(55, t, 3, { laut: 0.3, angriff: 0.02 });
      o.frequency.exponentialRampToValueAtTime(30, t + 2.5);
      datei("block", 0.3);
    },
  };

  window.KLANG = {
    tag(k, v) {
      if (!ctx || !an) return;
      if (k === "stimmung" && v !== stimmung) {
        stimmung = v;
        atmosphaere(v);
      } else if (k === "klang" && KLAENGE[v]) KLAENGE[v]();
      else if (k === "klang" && v.startsWith("kleriker")) KLAENGE.kleriker_schrei();
      else if (k === "kampf") datei("combatStart", 0.35);
      else if (k === "tod") KLAENGE.tod();
      else if (k === "bild") datei("footsteps", 0.25);
    },
    stimmungMerken(v) {
      stimmung = v || "ruhig";
    },
    leben(n) {
      lebenJetzt = n;
    },
    treffer() {
      if (ctx && an) datei("slice", 0.45);
    },
    heilung() {
      if (ctx && an) KLAENGE.ampulle();
    },
    notizbuch() {
      if (ctx && an) datei("paper", 0.5);
    },
    an: () => an,
    // Wahl auf der Titelseite: Ton an oder aus, gemerkt für spätere Besuche.
    setzen(wert) {
      if (Boolean(wert) !== an) this.umschalten();
      return an;
    },
    umschalten() {
      an = !an;
      try {
        localStorage.setItem(SPEICHER, an ? "an" : "aus");
      } catch {
        /* nur für diese Sitzung */
      }
      if (!an && ctx) {
        ctx.close();
        ctx = null;
        atmo = null;
      } else if (an) starten();
      return an;
    },
  };
})();
