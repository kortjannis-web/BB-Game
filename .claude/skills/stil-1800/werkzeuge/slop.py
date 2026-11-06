import re,sys,glob,os,math,collections
sys.path.insert(0, os.path.dirname(__file__))
K=sys.argv[1]; INK=sys.argv[2]
from stil import ink_prosa
def toks(t): return re.findall(r"[a-zäöüß]+", t.lower())
ref=[]; 
for f in glob.glob(os.path.join(K,'*.txt')): ref+=toks(open(f,encoding='utf8',errors='ignore').read())
uns=[]
for f in glob.glob(os.path.join(INK,'*.ink')): uns+=toks(' '.join(ink_prosa(f)))
def ng(ts,n): return collections.Counter(tuple(ts[i:i+n]) for i in range(len(ts)-n+1))
for n in (2,3):
    A=ng(uns,n); B=ng(ref,n); na=sum(A.values()); nb=sum(B.values())
    erg=[]
    for g,c in A.items():
        if c<5: continue
        b=B.get(g,0)
        lo=math.log((c+0.5)/na)-math.log((b+0.5)/nb)
        erg.append((lo,c,b,' '.join(g)))
    erg.sort(reverse=True)
    print(f"== {n}-Gramme: bei uns häufig, bei den Meistern selten (uns/Meister, Meisterkorpus {nb} Wörter)")
    print('; '.join(f"„{g}“ {c}/{b}" for lo,c,b,g in erg[:45]))
