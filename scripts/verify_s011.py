#!/usr/bin/env python3
"""Independent S011 exhaustive test of genuine 8! cap labellings."""
from itertools import combinations, permutations
from fractions import Fraction
from collections import Counter

V = frozenset(range(8))
QUARTETS = {frozenset(s) for s in (
    (0, 1, 4, 5), (0, 1, 6, 7), (2, 3, 4, 5), (2, 3, 6, 7))}
CAP = ((1,0,1),(2,0,1),(0,1,1),(0,2,1),
       (1,1,2),(2,2,2),(1,2,2),(2,1,2))
assert len(QUARTETS) == 4 and len(set(CAP)) == 8
for k in (1,2,3,4):
    for subset in combinations(range(8), k):
        zero = all(sum(CAP[i][j] for i in subset) % 3 == 0 for j in range(3))
        assert zero == (k == 4 and frozenset(subset) in QUARTETS)

def graph_four_mis(edges):
    adj = {v:set() for v in V}
    for u,v in edges:
        adj[u].add(v); adj[v].add(u)
    out = set()
    for ss in combinations(V, 4):
        s = frozenset(ss)
        if all(not (adj[u] & s) for u in s) and all(adj[v] & s for v in V-s):
            out.add(s)
    return out

def graph_counts(mis):
    pairs = tuple(combinations(mis, 2))
    n0 = sum(len(s & t) == 0 for s,t in pairs)
    n2 = sum(len(s & t) == 2 for s,t in pairs)
    h = sum(any(len(s & t) == 0 and len(s & r) == 2 and len(t & r) == 2
                for s,t,r in permutations(triple, 3))
            for triple in combinations(mis, 3))
    return len(mis), n0, n2, h

S = frozenset((0,1,2,3))
T_DISJOINT = frozenset((4,5,6,7))
T_OVERLAP = frozenset((2,3,4,5))
R = frozenset((0,1,4,5))
COUNTS = dict(single=0, disjoint_pair=0, overlap_pair=0, compatible_triple=0)
PAIR_FIBRES, TRIPLE_FIBRES = Counter(), Counter()
SPIDER = graph_four_mis(((0,4),(0,5),(0,6),(0,7),(1,6),(2,5),(3,4)))
PATH = graph_four_mis(tuple((v, v+1) for v in range(7)))
HIST = {name:[0]*5 for name in ('spider','path')}

for p in permutations(range(8)):
    def mapped(s):
        return frozenset(p[v] for v in s)
    single = mapped(S) in QUARTETS
    COUNTS['single'] += single
    COUNTS['disjoint_pair'] += single and mapped(T_DISJOINT) in QUARTETS
    COUNTS['overlap_pair'] += single and mapped(T_OVERLAP) in QUARTETS
    COUNTS['compatible_triple'] += (
        single and mapped(T_DISJOINT) in QUARTETS and mapped(R) in QUARTETS)
    PAIR_FIBRES[(mapped(S), mapped(T_OVERLAP))] += 1
    TRIPLE_FIBRES[(mapped(S), mapped(T_DISJOINT), mapped(R))] += 1
    for name,mis in (('spider',SPIDER),('path',PATH)):
        count = sum(mapped(s) in QUARTETS for s in mis)
        assert count <= 3
        HIST[name][count] += 1

assert len(PAIR_FIBRES) == 2520 and set(PAIR_FIBRES.values()) == {16}
assert len(TRIPLE_FIBRES) == 2520 and set(TRIPLE_FIBRES.values()) == {16}
assert COUNTS == dict(single=2304, disjoint_pair=2304,
                       overlap_pair=128, compatible_triple=128), COUNTS
for name,mis in (('spider',SPIDER),('path',PATH)):
    m,n0,n2,h = graph_counts(mis)
    M1 = Fraction(2*m,35)
    M2 = Fraction(2*n0,35)+Fraction(n2,315)
    M3 = Fraction(h,315)
    expected = (1-M1+M2-M3, M1-2*M2+3*M3, M2-3*M3, M3)
    actual = tuple(Fraction(x,40320) for x in HIST[name][:4])
    assert actual == expected,(name, expected, actual)
    print(f'{name}: m={m}, n0={n0}, n2={n2}, h={h}; '
          f'hist={HIST[name][:4]}, probabilities={actual}')
assert HIST['spider'][3] == 384
print('S011 FINITE PASS: 40320 labellings, cap quartets, 16-to-1 fibres, '
      'spider and path exact witness distributions.')
