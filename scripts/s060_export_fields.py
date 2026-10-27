#!/usr/bin/env python3
"""Diagnostic canonicalization of actual export fields; never a kernel verdict."""
import hashlib
import json
from pathlib import Path
import sys

TARGETS = ['PDIC.Vertex','PDIC.spiderAdj','PDIC.namedSpider','PDIC.GraphMIS','PDIC.CapPoint','PDIC.IsAdmissibleCap','PDIC.fourGraphMISFamily','PDIC.graphMIS_exact_probability_for_cap']

def digest(x):
    return hashlib.sha256(json.dumps(x,sort_keys=True,separators=(',',':')).encode()).hexdigest()

def read(path):
    names={0:('anonymous',)}; labels={0:''}; levels={0:digest(['zero'])}; expr={}; out={}
    with Path(path).open() as f:
        for line in f:
            r=json.loads(line)
            if 'in' in r:
                i=r['in'];tag='str' if 'str' in r else 'num';v=r[tag];p=v['pre'];part=v['str'] if tag=='str' else v['i']
                names[i]=(names[p],tag,part);labels[i]=(labels[p]+'.' if labels[p] else '')+str(part)
            elif 'il' in r:
                i=r['il'];tag=next(k for k in r if k!='il');v=r[tag]
                if tag=='param':v=names[v]
                elif isinstance(v,list):v=[levels[x] for x in v]
                else:v=levels[v]
                levels[i]=digest([tag,v])
            elif 'ie' in r:
                i=r['ie'];tag=next(k for k in r if k!='ie');v=r[tag]
                if tag=='sort':v=levels[v]
                elif tag=='const':v={'name':names[v['name']],'us':[levels[x] for x in v['us']]}
                elif tag in ['app','lam','forallE','letE','proj','mdata']:
                    v=dict(v)
                    for k in ['fn','arg','type','body','value','struct','expr']:
                        if k in v:v[k]=expr[v[k]]
                    for k in ['name','typeName']:
                        if k in v:v[k]=names[v[k]]
                    if tag=='mdata':v['data']={}
                expr[i]=digest([tag,v])
            else:
                for tag in ['def','opaque','thm','axiom']:
                    if tag not in r:continue
                    v=r[tag];label=labels[v['name']]
                    if label not in TARGETS:continue
                    z={k:x for k,x in v.items() if k not in ['name','type','value','levelParams','all']}
                    z.update(kind=tag,name=names[v['name']],type_hash=expr[v['type']],levelParams=[names[x] for x in v['levelParams']])
                    if 'value' in v:z['value_hash']=expr[v['value']]
                    z['all']=[names[x] for x in v.get('all',[v['name']])] if tag in ['def','thm'] else [names[v['name']]]
                    if tag=='opaque':z['isUnsafe']=v.get('isUnsafe',False)
                    out[label]=z
    assert set(out)==set(TARGETS),set(TARGETS)-set(out)
    return out

if __name__=='__main__':
    c,s=map(read,sys.argv[1:3]);rows={}
    for name in TARGETS:
        diff=[k for k in c[name].keys()|s[name].keys() if c[name].get(k)!=s[name].get(k)]
        rows[name]={'fields_equal':not diff,'different_fields':diff,'challenge':c[name],'solution':s[name]}
        print(name,'DIFFERING_FIELDS',diff)
        for k in diff:print(k,'CHALLENGE',c[name].get(k),'SOLUTION',s[name].get(k))
    Path('s060-export-fields/serialized-fields.json').write_text(json.dumps(rows,indent=2)+'\n')
    print('DIAGNOSTIC ONLY: official comparator and kernels remain mandatory')
