#!/usr/bin/env python3
"""S003R9 prior-art separation witness; exact finite corroboration, not Lean."""
from collections import Counter
from fractions import Fraction
from itertools import combinations

V = range(8)

def all_mis(edges):
    adj = [0] * 8
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    return {s for s in range(256)
            if all(not (adj[v] & s) for v in V if s >> v & 1)
            and all(adj[v] & s for v in V if not (s >> v & 1))}

def compatible(a, b, c):
    return any(x & y == 0 and (x & z).bit_count() == 2
               and (y & z).bit_count() == 2
               for x, y, z in ((a, b, c), (a, c, b), (b, c, a)))

def atom_designs():
    bits = lambda xs: sum(1 << v for v in xs)
    for a in combinations(V, 2):
        r1 = set(V) - set(a)
        for b in combinations(sorted(r1), 2):
            r2 = r1 - set(b)
            for c in combinations(sorted(r2), 2):
                d = r2 - set(c)
                x, y, z, w = map(bits, (a, b, c, d))
                yield {x | z, x | w, y | z, y | w}

designs = list(atom_designs())
assert len(designs) == 2520
profiles = []
for k, expected in ((0, (9, 9, 3)), (1, (9, 6, 1))):
    edges = [(0, 1)] + [(0 if i < k else 1, 2 + 2*i)
                            for i in range(3)]
    edges += [(2 + 2*i, 3 + 2*i) for i in range(3)]
    family = all_mis(edges)
    four = {s for s in family if s.bit_count() == 4}
    triples = {frozenset(t) for t in combinations(four, 3) if compatible(*t)}
    assert (len(family), len(four), len(triples)) == expected
    # Each actual triple has exactly eight favourable atom assignments.
    for t in triples:
        assert sum(t <= q for q in designs) == 8
    counts = Counter(len(four & q) for q in designs)
    assert max(counts) <= 3
    assert Fraction(counts[3], 2520) == Fraction(len(triples), 315)
    profile = Counter(s.bit_count() for s in family)
    profiles.append(profile)
    print(f"PASS B(2,3), arms split {k}+{3-k}: "
          f"MIS sizes={dict(sorted(profile.items()))}, h={len(triples)}, "
          f"Pr(N0=3)={Fraction(counts[3],2520)}")
assert profiles == [Counter({4: 9}), Counter({4: 6, 3: 3})]
print("FINITE CHECK ONLY: total-MIS equality does not determine h or its cap law")
