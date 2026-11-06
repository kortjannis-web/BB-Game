import re,sys,glob,os,collections,math,json
sys.path.insert(0, os.path.dirname(__file__))
from stil import ink_prosa
K=sys.argv[1]; INK=sys.argv[2]; OUT=sys.argv[3]
norm=lambda w: w.replace('daß','dass').replace('Thä','Tä').replace('thä','tä').replace('Thü','Tü').replace('Thu','Tu').replace('thu','tu').replace('Thei','Tei')
werke={}
for f in sorted(glob.glob(os.path.join(K,'*.txt'))):
    t=open(f,encoding='utf8',errors='ignore').read()
    werke[os.path.basename(f)[:-4]]=[norm(w) for w in re.findall(r"[A-Za-zÄÖÜäöüß]+",t)]
uns=[]
for f in glob.glob(os.path.join(INK,'*.ink')): uns+=re.findall(r"[A-Za-zÄÖÜäöüß]+",' '.join(ink_prosa(f)))
U=collections.Counter(w.lower() for w in uns); nu=sum(U.values())
M=collections.Counter(); disp=collections.defaultdict(set); form=collections.defaultdict(collections.Counter)
for n,ws in werke.items():
    for w in ws:
        k=w.lower(); M[k]+=1; disp[k].add(n); form[k][w]+=1
nm=sum(M.values())
rang={w:i for i,(w,_) in enumerate(M.most_common())}
kand=[]
for w,c in M.items():
    if c<4 or len(disp[w])<3 or len(w)<4: continue
    if rang[w]<250: continue                      # Funktionswörter und Allerweltswörter raus
    u=U.get(w,0)
    lo=math.log((c/nm)/((u+0.5)/nu))
    kand.append((lo,w,c,u,len(disp[w]),form[w].most_common(1)[0][0]))
kand.sort(reverse=True)
json.dump([dict(wort=f,haeufig_meister=c,haeufig_uns=u,werke=d,keyness=round(lo,2)) for lo,w,c,u,d,f in kand],open(OUT,'w'),ensure_ascii=False,indent=0)
print(len(werke),'Werke,',nm,'Wörter Meister;',nu,'Wörter uns;',len(kand),'Kandidaten')
print(', '.join(f for lo,w,c,u,d,f in kand[:150]))
