#!/usr/bin/env python3
"""S024 independent basis-normalized cap-cover audit; finite evidence, not Lean."""
from itertools import combinations, permutations, product

P = tuple(product(range(3), repeat=3))
Z = (0, 0, 0)
E = ((1, 0, 0), (0, 1, 0), (0, 0, 1))
Q = tuple(sorted((x, y, (x*x+y*y)%3) for x, y in product(range(3), repeat=2)
                 if (x, y) != (0, 0)))

def add(a, b): return tuple((a[i] + b[i]) % 3 for i in range(3))
def neg(a): return tuple((-v) % 3 for v in a)
def det(a, b, c):
    return (a[0]*(b[1]*c[2]-b[2]*c[1])
            -a[1]*(b[0]*c[2]-b[2]*c[0])
            +a[2]*(b[0]*c[1]-b[1]*c[0])) % 3

def cap(S):
    return (len(S) == len(set(S)) and all(x != Z for x in S)
            and all(add(a, b) != Z for a, b in combinations(S, 2))
            and all(add(add(a, b), c) != Z for a, b, c in combinations(S, 3)))

def linear(a, b, c, p):
    return tuple((p[0]*a[j] + p[1]*b[j] + p[2]*c[j]) % 3 for j in range(3))

def normalize(S, a, b, c):
    assert det(a, b, c)
    columns = tuple(next(p for p in P if linear(a, b, c, p) == e) for e in E)
    return frozenset(linear(*columns, p) for p in S)

excluded = {Z, *E, *(neg(e) for e in E),
            *(neg(add(a, b)) for a, b in combinations(E, 2))}
assert len(excluded) == 10
remaining = tuple(sorted(set(P) - excluded))
assert len(remaining) == 17
normalized = {frozenset(E + tail) for tail in combinations(remaining, 5)
              if cap(E + tail)}
assert len(normalized) == 18
basis_triples = tuple(t for t in permutations(Q, 3) if det(*t))
assert len(basis_triples) == 288
assert {normalize(Q, *t) for t in basis_triples} == normalized

directions = tuple(p for p in P if p != Z and p < neg(p))
assert len(directions) == 13
all_caps = set()
for d in combinations(directions, 8):
    for mask in product((0, 1), repeat=8):
        U = frozenset(neg(x) if flag else x for x, flag in zip(d, mask))
        if cap(U): all_caps.add(U)
assert len(all_caps) == 702
assert {U for U in all_caps if set(E) <= U} == normalized
assert all(sum(det(*t) != 0 for t in combinations(U, 3)) == 48 for U in all_caps)
orbit = set()
order = 0
for a in P:
    for b in P:
        for c in P:
            if det(a, b, c):
                order += 1
                orbit.add(frozenset(linear(a, b, c, p) for p in Q))
assert order == 11232
assert orbit == all_caps and len(orbit) == 702
assert order // len(orbit) == 16
print("PASS S024 17 free points, 6188 candidates, 18 normalized caps")
print("PASS S024 288 ordered bases normalize to the same 18 caps")
print("PASS S024 independent enumeration 702; GL order 11232; stabilizer 16")
print("PASS S024 every admissible cap has 48 unordered independent triples")
print("LIMIT: FINITE_CHECKED only; normal form remains unproved in Lean")
