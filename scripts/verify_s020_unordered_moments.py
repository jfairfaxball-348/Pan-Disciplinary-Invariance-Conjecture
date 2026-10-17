#!/usr/bin/env python3
"""S020 exhaustive witness check: genuine unordered MIS M2/M3 numerators.

Finite corroboration for the named spider and path P8, not a Lean proof.
"""
from collections import Counter
from itertools import combinations, permutations

V = tuple(range(8))
Q = {frozenset(x) for x in (
    (0, 1, 4, 5), (0, 1, 6, 7), (2, 3, 4, 5), (2, 3, 6, 7)
)}


def four_mis(edges):
    e = {frozenset(x) for x in edges}
    family = []
    for vs in combinations(V, 4):
        s = frozenset(vs)
        if (all(frozenset((u, v)) not in e for u, v in combinations(s, 2))
                and all(any(frozenset((u, v)) in e for u in s)
                        for v in V if v not in s)):
            family.append(s)
    return family


for name, edges, expected in (
    ("namedSpider",
     ((0, 4), (0, 5), (0, 6), (0, 7), (1, 6), (2, 5), (3, 4)),
     (9, 1, 15, 3, 4224, 384)),
    ("P8", tuple((i, i + 1) for i in range(7)),
     (5, 1, 3, 1, 2688, 128)),
):
    family = four_mis(edges)
    n0 = sum(not (s & t) for s, t in combinations(family, 2))
    n2 = sum(len(s & t) == 2 for s, t in combinations(family, 2))
    h = sum(any(not (s & t) and len(s & r) == 2
                for s, t, r in permutations(triple))
            for triple in combinations(family, 3))

    histogram = Counter()
    for p in permutations(V):
        n = sum(frozenset(p[v] for v in s) in Q for s in family)
        histogram[n] += 1

    m2_numerator = sum(n * (n - 1) // 2 * ct
                       for n, ct in histogram.items())
    m3_numerator = sum(n * (n - 1) * (n - 2) // 6 * ct
                       for n, ct in histogram.items())
    assert m2_numerator == 2304 * n0 + 128 * n2
    assert m3_numerator == 128 * h
    assert (len(family), n0, n2, h, m2_numerator,
            m3_numerator) == expected
    assert sum(histogram.values()) == 40320
    print(name, "m,n0,n2,h:", len(family), n0, n2, h,
          "hist:", sorted(histogram.items()),
          "M2 numerator:", m2_numerator,
          "M3 numerator:", m3_numerator)

print("S020 finite corroboration PASS; universal Lean proof not implied.")
