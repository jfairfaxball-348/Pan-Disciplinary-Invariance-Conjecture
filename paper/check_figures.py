"""S034 standalone, stdlib-only check of the paper's diagrams and example data.

Checks the spider's and path's edges, their four-MIS overlap statistics,
the canonical cap quartet incidence and all 40320 labelling event counts.
Not a substitute for the immutable formal Lean theorem.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations, permutations, product
from math import comb, factorial

V = tuple(range(8))
SPIDER = {(0,1),(1,2),(0,3),(3,4),(0,5),(5,6),(0,7)}
PATH = {(i,i+1) for i in range(7)}

def maximal_independent_sets(edges):
    def independent(s):
        return all(not (a in s and b in s) for a,b in edges)
    return [frozenset(s) for k in range(9) for s in combinations(V,k)
            if independent(s) and all(not independent(set(s)|{v}) for v in V if v not in s)]

def stats(edges):
    mis = maximal_independent_sets(edges)
    four = [s for s in mis if len(s)==4]
    n0=sum(len(a&b)==0 for a,b in combinations(four,2))
    n2=sum(len(a&b)==2 for a,b in combinations(four,2))
    h=0
    for triple in combinations(four,3):
        if any(not a&b and len(c&a)==2 and len(c&b)==2
               for a,b in combinations(triple,2) for c in triple if c!=a and c!=b):
            h+=1
    return len(mis),len(four),n0,n2,h,four

def canonical_cap():
    return tuple((x,y,(x*x+y*y)%3) for x,y in product(range(3),repeat=2) if (x,y)!=(0,0))

def qsum(points):
    return tuple(sum(p[j] for p in points)%3 for j in range(3))

CAP=canonical_cap()
QUARTETS={frozenset(s) for s in combinations(range(8),4) if qsum([CAP[i] for i in s])==(0,0,0)}
assert len(CAP)==8 and len(set(CAP))==8
assert len(QUARTETS)==4
assert Counter(len(a&b) for a,b in combinations(QUARTETS,2))=={2:4,0:2}
assert all(qsum([CAP[i] for i in s])!=(0,0,0) for k in (1,2,3) for s in combinations(range(8),k))

EXPECTED={
 'spider': ((9,9,1,15,3), (23424,13440,3072,384)),
 'path': ((9,5,1,3,1), (31360,6528,2304,128))
}
for name,edges in [('spider',SPIDER),('path',PATH)]:
    assert len(edges)==7 and len({v for e in edges for v in e})==8
    total,m,n0,n2,h,four=stats(edges)
    counts=Counter(sum(frozenset(perm[i] for i in s) in QUARTETS for s in four)
                   for perm in permutations(V))
    obs=tuple(counts[i] for i in range(4))
    assert (total,m,n0,n2,h)==EXPECTED[name][0],(name,(total,m,n0,n2,h))
    assert obs==EXPECTED[name][1],(name,obs)
    assert sum(obs)==factorial(8)
    M1=Fraction(2*m,35); M2=Fraction(2*n0,35)+Fraction(n2,315); M3=Fraction(h,315)
    formula=(1-M1+M2-M3,M1-2*M2+3*M3,M2-3*M3,M3)
    assert tuple(Fraction(v,factorial(8)) for v in obs)==formula
    print(f'{name}: MIS={total}; m,n0,n2,h={m,n0,n2,h}; event fibres={obs}; P={formula}')
print('PASS: canonical quartet C4, 4 diagrams, exact 40320-bijection fibres and all fractions')
