import re, sys, glob, os, statistics as st, json
if __name__!="__main__": pass
K=sys.argv[1] if len(sys.argv)>1 else ""; INK=sys.argv[2] if len(sys.argv)>2 else ""
def ink_prosa(pfad):
    out=[]
    for z in open(pfad,encoding='utf8'):
        s=z.strip()
        if not s or s.startswith(('//','~','=','->','VAR','LIST','INCLUDE','#','}','- else','CONST')): continue
        if s.startswith(('*','+')):
            continue  # Optionen nicht als Prosa
        if s.startswith('-'): s=s.lstrip('- ').strip()
        if s.startswith('{') and s.endswith('}') and ':' in s: s=s[s.index(':')+1:-1]
        elif s.startswith('{') : 
            if ':' in s and not s.endswith(':'): s=s[s.index(':')+1:]
            else: continue
        s=re.sub(r'#.*$','',s); s=re.sub(r'\{[^}]*\}','',s); s=s.replace('<>','')
        if len(s.split())<3: continue
        out.append(s)
    return out
def saetze(txt):
    txt=re.sub(r'\s+',' ',txt)
    return [x for x in re.split(r'(?<=[.!?…])\s+(?=[„"A-ZÄÖÜ])',txt) if len(x.split())>0]
def woerter(t): return re.findall(r"[A-Za-zÄÖÜäöüß]+",t)
FUNK="indessen alsbald gar wohl jedoch sogleich dergestalt nunmehr ward ehe gleichwohl freilich zuweilen bisweilen mithin allein doch etwa denn sodann hernach wiewohl derweil abermals beinahe zumal".split()
SUB="dass daß weil als wenn indem nachdem obwohl obgleich während da ob damit bis bevor ehe sobald solange".split()
def mass(name,absaetze):
    txt=' '.join(absaetze); S=saetze(txt); L=[len(woerter(s)) for s in S if woerter(s)]; W=[w.lower() for w in woerter(txt)]; n=len(W)
    per=lambda c: round(1000*c/n,1)
    cnt=lambda pat: len(re.findall(pat,txt))
    first=[s.split()[0].strip('„"') for s in S if s.split()]
    # Absatzschluss: Länge des letzten Satzes je Absatz
    ende=[len(woerter(saetze(a)[-1])) for a in absaetze if saetze(a)]
    mattr=[]
    for i in range(0,max(1,min(n,20000)-500),250): 
        f=W[i:i+500]
        if len(f)==500: mattr.append(len(set(f))/500)
    return dict(text=name, woerter=n, satz_mittel=round(st.mean(L),1), satz_median=st.median(L), satz_sd=round(st.pstdev(L),1),
      kurz_le6=round(100*sum(l<=6 for l in L)/len(L)), lang_ge35=round(100*sum(l>=35 for l in L)/len(L)),
      wie_ein=per(cnt(r'\bwie (ein|eine|einer|eines|einem|einen|der|die|das|jemand)\b')), als_ob=per(cnt(r'\bals (ob|sei|wäre|habe|hätte|könne|würde)\b')),
      nicht_sondern=per(cnt(r'\bnicht\b[^.;:!?]{0,60}\bsondern\b')), doppelpunkt=per(txt.count(':')), semikolon=per(txt.count(';')),
      gedankenstrich=per(cnt(r' [–—-] ')), ausruf=per(txt.count('!')), frage=per(txt.count('?')),
      man=per(sum(w=='man' for w in W)), konj1=per(sum(w in ('sei','seien','habe','werde','möge','solle') for w in W)),
      alt_funktion=per(sum(w in FUNK for w in W)), nebensatz_je_satz=round(sum(w in SUB for w in W)/len(L),2), komma_je_satz=round(txt.count(',')/len(L),2),
      du_anfang=round(100*sum(f in ('Du','Dir','Dich','Dein','Deine','Deinen','Deiner','Deinem') for f in first)/len(first)),
      absatzende_satzlaenge=round(st.mean(ende),1) if ende else 0, mattr500=round(st.mean(mattr),3) if mattr else 0)
if __name__=="__main__":
    erg=[]
    for f in sorted(glob.glob(os.path.join(K,'*.txt'))):
        t=open(f,encoding='utf8',errors='ignore').read()
        # Kopf (Autor, Titel) und Gutenberg-Rest weg: grob ab dem ersten langen Absatz
        abs_=[re.sub(r'\s+',' ',a).strip() for a in re.split(r'\n\s*\n',t)]
        abs_=[a for a in abs_ if len(a.split())>=8]
        erg.append(mass(os.path.basename(f)[:-4],abs_))
    ink=[]
    for f in sorted(glob.glob(os.path.join(INK,'*.ink'))): ink+=ink_prosa(f)
    erg.append(mass('UNSER_KAPITEL1',ink))
    keys=list(erg[0].keys())
    print('\t'.join(keys))
    for e in erg: print('\t'.join(str(e[k]) for k in keys))
    json.dump(erg,open(os.path.join(os.path.dirname(K),'stilmass.json'),'w'),ensure_ascii=False,indent=1)
