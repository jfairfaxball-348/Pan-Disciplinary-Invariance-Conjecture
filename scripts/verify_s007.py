#!/usr/bin/env python3
"""Independent S007 semantic cross-check; not a Lean certificate."""
from itertools import combinations
from random import Random

FULL = 255
FOURS = [sum(1 << v for v in xs) for xs in combinations(range(8), 4)]


def family(edges):
    adj = [0] * 8
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    sets = {s for s in FOURS
            if all(not (adj[v] & s) if s >> v & 1 else bool(adj[v] & s)
                   for v in range(8))}
    seen = 1
    while True:
        nxt = seen
        for v in range(8):
            if seen >> v & 1:
                nxt |= adj[v]
        if nxt == seen:
            return sets, seen == FULL
        seen = nxt


def triples(sets):
    # Direct unordered sets of three, independent of choosing a partition.
    return {frozenset(q) for q in combinations(sorted(sets), 3)
            if any(a & b == 0 and (r & a).bit_count() == 2
                   and (r & b).bit_count() == 2
                   for a, b, r in (q, (q[0], q[2], q[1]), (q[1], q[2], q[0])))}


def check(edges):
    sets, connected = family(edges)
    ts = triples(sets)
    pairs = {frozenset((s, FULL ^ s)) for s in sets if FULL ^ s in sets}
    if not pairs:
        assert not ts
    if connected:
        assert len(pairs) <= 1
        assert len(ts) <= 3
        for pair in pairs:
            s, t = sorted(pair)
            mixed = {r for r in sets if (r & s).bit_count() == (r & t).bit_count() == 2}
            assert ts == {frozenset((s, t, r)) for r in mixed}
    return sets, ts, pairs


rng = Random(7007)
spider = [(0, 4), (0, 5), (0, 6), (0, 7), (1, 6), (2, 5), (3, 4)]
sets, ts, pairs = check(spider)
assert len(sets) == 9 and len(ts) == 3
s, t = sorted(next(iter(pairs)))
assert any((r & s).bit_count() == 3 for r in sets)
assert any((r & s).bit_count() == 1 for r in sets)
assert len(check([(v, v + 1) for v in range(7)])[1]) == 1
assert not check([(0, v) for v in range(1, 8)])[1]
# Four disconnected edges have many complementary partitions: the anchored
# count is not intrinsically h without the connectedness hypothesis.
sets, ts, pairs = check([(0, 4), (1, 5), (2, 6), (3, 7)])
assert len(pairs) > 1
s, t = sorted(next(iter(pairs)))
assert len(ts) != sum((r & s).bit_count() == (r & t).bit_count() == 2 for r in sets)
for k in range(800):
    candidates = ([(i, j + 4) for i in range(4) for j in range(4)] if k % 2
                  else list(combinations(range(8), 2)))
    p = (k % 9 + 1) / 10
    edges = [e for e in candidates if rng.random() < p]
    _, ts, _ = check(edges)
    perm = list(range(8))
    rng.shuffle(perm)
    _, other, _ = check([(perm[u], perm[v]) for u, v in edges])
    assert len(ts) == len(other)
print('PASS S007: 800 reproducible arbitrary/bipartite samples and relabellings;')
print('  unordered/anchored bijection, no-pair zero, h<=3, skew spider MIS;')
print('  disconnected matching refutes dropping connectedness.')
print('FINITE CHECK ONLY: strict Lean CI supplies the theorem certificate.')
