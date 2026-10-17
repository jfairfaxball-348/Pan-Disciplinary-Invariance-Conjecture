#!/usr/bin/env python3
"""S023 independent exhaustive two-cap, two-graph cross-check.

FINITE_CHECKED, not a proof of the nine-cap normal form, all-cap
transport or the universal connected-graph theorem.
"""
from collections import Counter
from itertools import combinations, permutations

CAP = ((1, 0, 1), (2, 0, 1), (0, 1, 1), (0, 2, 1),
       (1, 1, 2), (2, 2, 2), (1, 2, 2), (2, 1, 2))
# The invertible zero-fixing shear (x,y,z) -> (x+z,y,z).
SHEARED_CAP = tuple(((x + z) % 3, y, z) for x, y, z in CAP)
assert set(CAP) != set(SHEARED_CAP), "Require genuinely different fixed caps"
V = set(range(8))


def quartets(cap):
    assert len(set(cap)) == 8
    for k in (1, 2, 3):
        assert not any(
            all(sum(cap[v][j] for v in s) % 3 == 0 for j in range(3))
            for s in combinations(range(8), k)
        ), "Not an admissible cap"
    return {
        frozenset(s) for s in combinations(range(8), 4)
        if all(sum(cap[v][j] for v in s) % 3 == 0 for j in range(3))
    }


def maximal_independent_four_sets(edges):
    adj = {v: set() for v in V}
    for u, v in edges:
        adj[u].add(v)
        adj[v].add(u)
    return [
        frozenset(s) for s in combinations(range(8), 4)
        if all(not (adj[v] & set(s)) for v in s)
        and all(adj[v] & set(s) for v in V - set(s))
    ]


spider_edges = ((0, 4), (0, 5), (0, 6), (0, 7),
                (1, 6), (2, 5), (3, 4))
path_edges = tuple((v, v + 1) for v in range(7))
cases = (
    ("S(2,2,2,1)", spider_edges, (23424, 13440, 3072, 384)),
    ("P8", path_edges, (31360, 6528, 2304, 128)),
)
canonical_quartets = quartets(CAP)
sheared_quartets = quartets(SHEARED_CAP)
assert canonical_quartets == sheared_quartets
assert len(canonical_quartets) == 4

for graph_name, edges, expected in cases:
    family = maximal_independent_four_sets(edges)
    for cap_name, cap in (("canonical", CAP), ("sheared", SHEARED_CAP)):
        zero_quartets = quartets(cap)
        hist = Counter(
            sum(frozenset(p[v] for v in s) in zero_quartets
                for s in family)
            for p in permutations(range(8))
        )
        actual = tuple(hist.get(i, 0) for i in range(4))
        assert actual == expected, (graph_name, cap_name, actual, expected)
        assert sum(hist.values()) == 40320
        print(f"{graph_name} / {cap_name}: {actual}")

print("S023 FINITE PASS: two genuinely distinct admissible eight-caps, "
      "two graphs, all 40320 label permutations each.")
