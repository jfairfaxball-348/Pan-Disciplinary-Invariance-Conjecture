#!/usr/bin/env python3
"""S002 independent exact checks; not a Lean proof or priority certificate."""
from collections import Counter, defaultdict
from fractions import Fraction as F
from functools import lru_cache
from itertools import combinations

V=range(8)
FOUR=[sum(1<<v for v in s) for s in combinations(V,4)]

def neighbours(edges):
    adj=[0]*8
    for u,v in edges:
        adj[u]|=1<<v; adj[v]|=1<<u
    return tuple(adj)

def independent(s,adj):
    return all(not (adj[v]&s) for v in V if s>>v&1)

def maximal(s,adj):
    return all(adj[v]&s for v in V if not s>>v&1)

def mis4(adj):
    return {s for s in FOUR if independent(s,adj) and maximal(s,adj)}

@lru_cache(None)
def greedy(adj,active):
    if not active:return {0:F(1)}
    out=defaultdict(F)
    for v in V:
        if active>>v&1:
            for s,p in greedy(adj,active & ~(adj[v]|(1<<v))).items():
                out[s|(1<<v)]+=p/active.bit_count()
    return dict(out)

def quartet_assignments():
    # Each of the four atoms A1,A2,B1,B2 is a labelled 2-set.
    # 8!/(2!)^4 = 2520 equiprobable assignments.
    for a1 in combinations(V,2):
        rem1=set(V)-set(a1)
        for a2 in combinations(sorted(rem1),2):
            rem2=rem1-set(a2)
            for b1 in combinations(sorted(rem2),2):
                b2=rem2-set(b1)
                bits=lambda xs:sum(1<<v for v in xs)
                a,b,c,d=map(bits,(a1,a2,b1,b2))
                yield frozenset((a|c,a|d,b|c,b|d))

Q=list(quartet_assignments())
assert len(Q)==2520

def hcount(f):
    return sum(1 for a in f if a<(a^255) and (a^255) in f
               for c in f if (c&a).bit_count()==2)

def test_graph(tag,edges,expected_p4):
    adj=neighbours(edges)
    family=mis4(adj)
    m=len(family)
    n0=sum(1 for x,y in combinations(sorted(family),2) if (x&y).bit_count()==0)
    n2=sum(1 for x,y in combinations(sorted(family),2) if (x&y).bit_count()==2)
    h=hcount(family)
    a=F(2*m,35);b=F(2*n0,35)+F(n2,315);c=F(h,315)
    target=[1-a+b-c,a-2*b+3*c,b-3*c,c]
    actual=Counter(len(family & q) for q in Q)
    assert all(F(actual[k],2520)==target[k] for k in range(4)),(tag,target,actual)
    assert all(k<=3 for k in actual)
    law=greedy(adj,255)
    assert sum(law.values())==1
    assert all(independent(s,adj) and maximal(s,adj) for s in law)
    p4=sum((p for s,p in law.items() if s.bit_count()==4),F())
    assert p4==expected_p4,(tag,p4,expected_p4)
    mean=sum((sum((law.get(s,F()) for s in family&q),F()) for q in Q),F())/2520
    assert mean==F(2,35)*p4
    print(f"PASS {tag}: m={m}, n0={n0}, n2={n2}, h={h}, Pr(N0=3)={c}, greedy-size4={p4}, greedy-zero={mean}")
    return family,target

p8, _ = test_graph('P8',[(i,i+1) for i in range(7)],F(34,45))
star, _ = test_graph('K1,7',[(0,i) for i in range(1,8)],F(0))
double, _ = test_graph('double-star',[(0,1),(0,2),(0,3),(0,4),(1,5),(1,6),(1,7)],F(7,16))
spider, splaw = test_graph('S(2,2,2,1)',[(0,4),(0,5),(0,6),(0,7),(1,6),(2,5),(3,4)],F(1))
assert len(spider)==9 and splaw[3]==F(1,105)

# Exhaustive independent check over all balanced 4+4 bipartite graphs.
# Connectedness is tested by BFS; mixed MIS counted independently.
counts=Counter()
for mask in range(1<<16):
    adj=[0]*8
    for i in range(4):
        for j in range(4):
            if (mask>>(4*i+j))&1:
                adj[i]|=1<<(4+j)
                adj[4+j]|=1<<i
    seen=1
    while True:
        nxt=seen
        for v in V:
            if seen>>v&1:nxt|=adj[v]
        if nxt==seen:break
        seen=nxt
    if seen!=255:continue
    b=sum(1 for s in mis4(tuple(adj)) if (s&15).bit_count()==2)
    assert b<=3
    if b==3:
        assert mask.bit_count()==7
        assert sorted((x.bit_count() for x in adj),reverse=True)==[4,2,2,2,1,1,1,1]
        hub=next(i for i,x in enumerate(adj) if x.bit_count()==4)
        assert sum(bool(adj[v]&(1<<hub)) and adj[v].bit_count()==2 for v in V)==3
    counts[b]+=1
assert counts==Counter({0:19457,1:13212,2:3456,3:192}),counts
print("PASS: 36,317 connected 4+4 bipartite graphs; sharp b=3 only for 192 labelled spiders")
print("NOTE: finite verification, not a theorem's Lean kernel check or a novelty certificate")
