import re,sys
ana=open(sys.argv[1],encoding='utf8').read(); kor=' '.join(open(f,encoding='utf8').read() for f in sys.argv[2:])
norm=lambda s: re.sub(r'\s+',' ',s.replace('»','"').replace('«','"').replace('„','"').replace('“','"').replace('”','"').replace('’',"'")).strip()
K=norm(kor)
# Zitatblöcke und lange Anführungen
kand=[]
for blk in re.findall(r'(?:^>.*\n?)+',ana,flags=re.M):
    t=norm(re.sub(r'^>\s?','',blk,flags=re.M))
    for teil in re.split(r'\[…\]|\[\.\.\.\]|…|\.\.\.',t):
        teil=teil.strip(' "*_')
        if len(teil.split())>=6: kand.append(teil)
for q in re.findall(r'[„»"]([^„“»«"]{30,400})[“«"]',ana):
    for teil in re.split(r'\[…\]|\[\.\.\.\]|…|\.\.\.',norm(q)):
        teil=teil.strip(' .,*_')
        if len(teil.split())>=6: kand.append(teil)
ok=fehl=0; falsch=[]
for q in set(kand):
    # tolerant: Satzzeichen am Rand, Groß/klein am Anfang
    probe=q.rstrip('.,;:!?')
    if probe in K or probe[1:] in K: ok+=1
    else:
        # erlaubt: Spiel-/Übertragungssätze (Du-Form) sind keine Zitate
        if re.search(r'\b(du|dir|dich|dein|deine|Yharnam|Gascoigne|Gilbert|Kutscher|Säge|Jäger|Fremder|Ihnen|Birnbaum|Klinik|Kirche)\b',probe): continue
        fehl+=1; falsch.append(probe[:140])
print(f"geprüft {ok+fehl}, gefunden {ok}, nicht gefunden {fehl}")
for f in falsch[:15]: print('  -',f)
