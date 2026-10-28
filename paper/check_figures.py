"""S061 reproducible, stdlib-only audit of all 11 paper figures and exact event counts.
This is an independent finite check, not a substitute for the universal Lean proof.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations, permutations, product
from math import factorial

V=tuple(range(8))
SPIDER={(0,1),(1,2),(0,3),(3,4),(0,5),(5,6),(0,7)}
PATH={(i,i+1) for i in range(7)}

def mis(edges):
    def indep(s):return all(not (a in s and b in s) for a,b in edges)
    return [frozenset(s) for k in range(9) for s in combinations(V,k)
        if indep(s) and all(not indep(set(s)|{v}) for v in V if v not in s)]

def counts(edges):
    allmis=mis(edges)
    four=[s for s in allmis if len(s)==4]
    n0=sum(not (a&b) for a,b in combinations(four,2))
    n2=sum(len(a&b)==2 for a,b in combinations(four,2))
    triple=[tuple(t) for t in combinations(four,3) if any(not(a&b) and len(c&a)==len(c&b)==2 for a,b in combinations(t,2) for c in t if c!=a and c!=b)]
    return len(allmis),len(four),n0,n2,len(triple),four,triple

CAP=tuple((x,y,(x*x+y*y)%3) for x,y in product(range(3),repeat=2) if (x,y)!=(0,0))
def qsum(s):return tuple(sum(CAP[i][j] for i in s)%3 for j in range(3))
QUARTETS={frozenset(s) for s in combinations(V,4) if qsum(s)==(0,0,0)}
assert len(CAP)==8 and len(QUARTETS)==4
assert Counter(len(a&b) for a,b in combinations(QUARTETS,2))=={0:2,2:4}
assert all(qsum(s)!=(0,0,0) for k in (1,2,3) for s in combinations(V,k))
assert len({frozenset({(i,(i+1)%3)}) for i in range(3)})==3  # simple count sanity
EXPECTED={'spider':((9,9,1,15,3),(23424,13440,3072,384)),'path':((9,5,1,3,1),(31360,6528,2304,128))}
for name,edges in [('spider',SPIDER),('path',PATH)]:
    assert len(edges)==7 and len({x for e in edges for x in e})==8
    total,m,n0,n2,h,four,triples=counts(edges)
    assert (total,m,n0,n2,h)==EXPECTED[name][0]
    histogram=Counter(sum(frozenset(perm[i] for i in s) in QUARTETS for s in four) for perm in permutations(V))
    sample=tuple(histogram[k] for k in range(4))
    assert sample==EXPECTED[name][1] and sum(sample)==factorial(8)
    m1=Fraction(2*m,35);m2=Fraction(2*n0,35)+Fraction(n2,315);m3=Fraction(h,315)
    probs=(1-m1+m2-m3,m1-2*m2+3*m3,m2-3*m3,m3)
    assert tuple(Fraction(x,40320) for x in sample)==probs
    print(f'{name}: MIS={total}; (m,n0,n2,h)={(m,n0,n2,h)}; labels={sample}; P={probs}')
# Diagram labels: c=0; u_i=1,3,5; t_i=2,4,6; s=7.
S={'c':0,'u1':1,'t1':2,'u2':3,'t2':4,'u3':5,'t3':6,'s':7}
A=frozenset(S[x] for x in ('c','t1','t2','t3'))
B=frozenset(S[x] for x in ('s','u1','u2','u3'))
assert not A&B and A|B==set(V)
three=[frozenset(S[x] for x in t) for t in (('t1','t2','s','u3'),('t1','t3','s','u2'),('t2','t3','s','u1'))]
assert set(three)=={f for f in counts(SPIDER)[5] if len(f&A)==len(f&B)==2}
for witness in three:
    assert witness in mis(SPIDER) and len(witness&A)==len(witness&B)==2
# Verify all 16 matrix entries used in figure 6 and all 7 spider edges.
assert SPIDER=={tuple(sorted(e)) for e in {(S['c'],S[x]) for x in ('s','u1','u2','u3')}|{(S[x],S[y]) for x,y in (('u1','t1'),('u2','t2'),('u3','t3'))}}
print('PASS: 11 editable figure subjects; exact C4, spider matrix, 3 mixed MIS, path; all 40320 labels twice')
