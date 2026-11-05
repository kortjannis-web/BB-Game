"""Einmalig (2026-11-05): Teil B der Lore-Quelle (quellen/lore-komplett.md, Kapitel 17 bis 28) in das Archiv lore/ einsortieren.
Hängt Abschnitte an vorhandene Dateien an oder legt neue an. Idempotent: Abschnitte, die schon eingefügt sind
(erkennbar an der Marke „LK §<nr>“), werden nicht doppelt angehängt.
Aufruf: python3 tools/lore-teil-b.py
"""
import os
import re

WURZEL = os.path.join(os.path.dirname(__file__), "..")
QUELLE = os.path.join(WURZEL, "quellen", "lore-komplett.md")
zeilen = open(QUELLE, encoding="utf-8").read().split("\n")

# Abschnitte mit Nummer (## 17., ### 17.1, #### Gilbert innerhalb 24.12)
abschnitte = []
aktuell_nr = None
for i, z in enumerate(zeilen):
    m = re.match(r"^(#{2,4}) (.+)$", z)
    if not m:
        continue
    ebene, titel = len(m.group(1)), m.group(2).strip()
    n = re.match(r"^(\d+(?:\.\d+)*)\.?\s", titel)
    if ebene <= 3 and n:
        aktuell_nr = n.group(1)
        abschnitte.append({"id": aktuell_nr, "ebene": ebene, "titel": titel, "von": i})
    elif ebene == 4 and aktuell_nr == "24.12":
        abschnitte.append({"id": "24.12/" + titel, "ebene": 4, "titel": titel, "von": i})
for k, a in enumerate(abschnitte):
    bis = len(zeilen)
    for b in abschnitte[k + 1:]:
        if b["ebene"] <= a["ebene"] or (a["ebene"] == 2 and b["ebene"] == 2):
            bis = b["von"]
            break
    # Bei ## nur bis zum ersten ### (Einleitung des Kapitels), es sei denn, das Kapitel hat keine Unterabschnitte
    if a["ebene"] == 2:
        unter = [b for b in abschnitte[k + 1:] if b["von"] < bis and b["ebene"] == 3]
        if unter:
            bis = unter[0]["von"]
    a["bis"] = bis


def text(nr):
    a = next(x for x in abschnitte if x["id"] == nr)
    t = "\n".join(zeilen[a["von"] + 1:a["bis"]]).strip()
    t = re.sub(r"(\n---)+\s*$", "", t).strip()
    return a["titel"], t


ZIELE = {
    # 17 Mädchen
    "17": ("figuren/maedchen-und-viola.md", "Das Mädchen, die ältere Schwester und Viola", "1"),
    "17.1": "figuren/maedchen-und-viola.md", "17.2": "figuren/maedchen-und-viola.md", "17.3": "figuren/maedchen-und-viola.md",
    "17.4": "figuren/maedchen-und-viola.md", "17.5": "figuren/maedchen-und-viola.md", "17.6": "figuren/maedchen-und-viola.md",
    "24.14": "figuren/maedchen-und-viola.md",
    # 18 Gehrman und Puppe
    "18.1": "figuren/gehrman.md", "18.2": "figuren/puppe.md", "24.13": ["figuren/gehrman.md", "figuren/puppe.md"],
    # 19 Feuerwaffen
    "19": "gegenstaende/jaeger-und-werkstatt.md",
    # 20 Gegner
    "20": ("gegner/README.md", "Gewöhnliche Gegner: Überblick", "alle"),
    "20.1": ("gegner/jagdmeute.md", "Die Jagdmeute (Bürger mit Fackeln und Mistgabeln)", "1"),
    "20.2": ("gegner/rollstuhl-mob.md", "Der Rollstuhl-Mob", "1, 2"),
    "20.3": ("gegner/ziegel-troll.md", "Der Ziegel-Troll (der Riese mit dem Ziegel)", "1"),
    "20.4": ("gegner/wolfsbestien.md", "Wolfsbestien (Scourge Beast)", "1"),
    "20.5": ("gegner/hunde.md", "Die Hundemeute", "1"),
    "20.6": ("gegner/kapellen-riese.md", "Der Riese (Kapellen-Riese)", "2"),
    "20.7": ("gegner/schwein.md", "Das Schwein (Maneater Boar)", "1"),
    "20.8": ("gegner/kraehen.md", "Die Krähen", "1"),
    "20.9": ("gegner/weitere.md", "Weitere häufige Gegner", "alle"),
    # 21 Notizen
    "21": ("welt/notizen.md", "Notizzettel nach Orten", "alle"),
    "21.1": "welt/notizen.md", "21.2": "welt/notizen.md", "21.3": "welt/notizen.md", "21.4": "welt/notizen.md",
    "21.5": "welt/notizen.md", "21.6": "welt/notizen.md", "21.7": "welt/notizen.md", "21.8": "welt/notizen.md",
    "21.9": "welt/notizen.md", "21.10": "welt/notizen.md",
    # 22 Stimmen
    "22": ("figuren/buerger.md", "Stimmen hinter Türen und Fenstern (die Bürger)", "1, 2"),
    "22.1": "figuren/buerger.md", "22.2": "figuren/buerger.md", "22.3": "figuren/buerger.md", "22.12": "figuren/buerger.md",
    "22.4": "figuren/skeptischer-mann.md", "22.5": "figuren/einsame-alte-frau.md", "22.6": "orte/iosefkas-klinik.md",
    "22.7": "orte/alt-yharnam.md", "22.8": "orte/fischerdorf.md", "22.9": "orte/forschungshalle.md",
    "22.10": "figuren/amelia.md", "22.11": "orte/byrgenwerth.md",
    # 24 Dialoge
    "24": ("welt/dialogskript.md", "Das Dialogskript: Herkunft und Überblick", "alle"),
    "23": "welt/dialogskript.md",
    "24.1": "deutungen/cut-content.md", "24.2": "deutungen/cut-content.md", "24.7": "deutungen/cut-content.md", "24.8": "deutungen/cut-content.md",
    "24.3": ["figuren/laurence.md", "figuren/willem.md"], "24.4": "figuren/micolash.md", "24.5": ["figuren/maria.md", "figuren/ludwig.md"],
    "24.6": "figuren/annalise.md", "24.9": ["figuren/adeline.md", "figuren/adella.md"], "24.10": "figuren/yamamura.md",
    "24.11": "figuren/gascoigne.md", "24.12": "welt/dialogskript.md", "24.15": ["orte/byrgenwerth.md", "figuren/buerger.md"],
    "24.12/Gilbert": "figuren/gilbert.md", "24.12/Iosefka (echt) – an der Klinikstür": "figuren/iosefka.md",
    "24.12/Falsche Iosefka (Impostor Iosefka)": "figuren/iosefka.md", "24.12/Eileen die Krähe": "figuren/eileen.md",
    "24.12/Djura": "figuren/djura.md", "24.12/Brador (DLC)": "figuren/brador.md", "24.12/Blutminister (Eröffnungsszene)": "figuren/blutminister.md",
    "24.12/Simon (DLC)": "figuren/simon.md", "24.12/Valtr (DLC-verknüpft)": "figuren/valtr.md", "24.12/Patches": "figuren/patches.md",
    "24.12/Der Verdächtige Bettler": "figuren/verdaechtiger-bettler.md", "24.12/Arianna": "figuren/arianna.md",
    "24.12/Der Kapellenbewohner (Oedon-Kapelle)": "figuren/kapellenbewohner.md", "24.12/Alfred – Ergänzungen": "figuren/alfred.md",
    # 25 Artbook
    "25": ("welt/aussehen.md", "Wie die Welt aussieht (nach dem offiziellen Artbook)", "alle"),
    "25.1": "welt/aussehen.md", "25.14": "welt/aussehen.md", "25.17": "welt/aussehen.md", "25.18": "welt/aussehen.md",
    "25.2": "orte/jaegertraum.md", "25.3": "orte/iosefkas-klinik.md", "25.4": "orte/zentral-yharnam.md",
    "25.5": "orte/kathedralbezirk.md", "25.6": ["orte/kathedralbezirk.md", "orte/obere-kathedrale.md"], "25.7": "orte/alt-yharnam.md",
    "25.8": "orte/hemwick.md", "25.9": "orte/verbotener-wald.md", "25.10": ["orte/byrgenwerth.md", "orte/albtraum-grenzland.md"],
    "25.11": "orte/yahargul.md", "25.12": ["orte/albtraum-von-mensis.md", "orte/albtraum-grenzland.md"], "25.13": "orte/cainhurst.md",
    "25.15": ["orte/jaegeralbtraum.md", "orte/forschungshalle.md"], "25.16": "orte/fischerdorf.md",
    # 26 offen: von Hand in lore/offen.md
    # 27 Japanisch
    "27": ("welt/japanische-originaltexte.md", "Japanische Originaltexte der Gegenstände (Namen, Begriffe, Abweichungen)", "Nachschlagen"),
    "27.1": "welt/japanische-originaltexte.md", "27.2": "welt/japanische-originaltexte.md", "27.3": "welt/japanische-originaltexte.md",
    "27.4": "welt/japanische-originaltexte.md", "27.5": "welt/japanische-originaltexte.md", "27.6": "welt/japanische-originaltexte.md",
    "27.7": "welt/japanische-originaltexte.md", "27.8": "welt/japanische-originaltexte.md",
    # 28 Original-Entwurf
    "28": ("deutungen/original-entwurf.md", "Der Original-Entwurf und gestrichene Figuren (kein Kanon)", "Anregung"),
    "28.1": "deutungen/original-entwurf.md", "28.2": "deutungen/original-entwurf.md", "28.3": "deutungen/original-entwurf.md",
    "28.4": "deutungen/original-entwurf.md", "28.5": "deutungen/original-entwurf.md", "28.6": "deutungen/original-entwurf.md",
    "28.7": "deutungen/original-entwurf.md", "28.8": "deutungen/original-entwurf.md", "28.9": "deutungen/original-entwurf.md",
    "28.10": "deutungen/original-entwurf.md",
}

neu_angelegt, angehaengt = [], 0
for nr, ziel in ZIELE.items():
    if nr not in [a["id"] for a in abschnitte]:
        raise SystemExit(f"Abschnitt fehlt in der Quelle: {nr}")
    titel, inhalt = text(nr)
    if isinstance(ziel, tuple):
        pfad, kopf, kap = ziel
        ziele = [pfad]
        voll = os.path.join(WURZEL, "lore", pfad)
        if not os.path.exists(voll):
            os.makedirs(os.path.dirname(voll), exist_ok=True)
            open(voll, "w", encoding="utf-8").write(
                f"# {kopf}\n\n> Quelle: `quellen/lore-komplett.md` (LK), Teil B, Kapitel {nr.split('.')[0]}. Wichtig für Kapitel: {kap}. "
                "Kennzeichnung der Quelle: ohne Zusatz = im Spiel belegt, **[Theorie]**/**[Deutung]** = Deutung, *sinngemäß* = Inhalt, nicht Wortlaut. "
                "Für das Spiel gilt: Deutung nie als Tatsache erzählen; nichts wörtlich übernehmen. Wurzel und Lesepfade: `lore/README.md`.\n")
            neu_angelegt.append(pfad)
    else:
        ziele = ziel if isinstance(ziel, list) else [ziel]
    for pfad in ziele:
        voll = os.path.join(WURZEL, "lore", pfad)
        bestand = open(voll, encoding="utf-8").read()
        marke = f"(LK §{nr})"
        if marke in bestand:
            continue
        ueberschrift = titel if "/" not in nr else f"{nr.split('/')[1]}: Dialoge aus dem Skript"
        block = f"\n## {re.sub(r'^[\d.]+\s*', '', ueberschrift)} {marke}\n\n{inhalt}\n" if inhalt else ""
        if block:
            open(voll, "a", encoding="utf-8").write(block)
            angehaengt += 1

print(f"Neu angelegt: {len(neu_angelegt)} Dateien ({', '.join(neu_angelegt)}); angehängt: {angehaengt} Abschnitte.")
