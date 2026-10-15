#!/usr/bin/env python3
"""Finite PDIC lead checks, not a proof of novelty or a Lean certificate."""
from collections import defaultdict
from fractions import Fraction
from functools import lru_cache
from itertools import combinations, product
from math import comb, factorial

A = list(product(range(3), repeat=3))
Z = (0, 0, 0)
NZ = [x for x in A if x != Z]

def add(*xs):
    return tuple(sum(x[j] for x in xs) % 3 for j in range(3))

def neg(x):
    return tuple((-k) % 3 for k in x)

# Eleven? No: F3^3 has 13 projective directions, each with an antipodal pair.
representatives = sorted(x for x in NZ if x < neg(x))
assert len(representatives) == 13
triples = {
    frozenset((a, b, neg(add(a, b))))
    for a, b in combinations(NZ, 2)
    if neg(add(a, b)) not in (a, b, Z)
}
assert len(triples) == 104
caps = []
independent_count = 0
for inds in combinations(range(13), 8):
    selected = [representatives[i] for i in inds]
    for mask in range(256):
        U = frozenset(neg(x) if (mask >> i) & 1 else x
                      for i, x in enumerate(selected))
        condition_by_lines = not any(line <= U for line in triples)
        condition_by_pair_sums = all(
            neg(add(a, b)) not in U for a, b in combinations(U, 2)
        )
        assert condition_by_lines == condition_by_pair_sums
        if condition_by_lines:
            caps.append(U)
        independent_count += int(condition_by_pair_sums)
assert len(caps) == len(set(caps)) == independent_count == 702

# GL(3,3) orbit, enumerating the images of the standard basis.
base = sorted(caps[0])
orbit = set()
GL_order = 0
for a in NZ:
    for b in NZ:
        span = {
            add(tuple(i * v for v in a), tuple(j * v for v in b))
            for i in range(3) for j in range(3)
        }
        if len(span) != 9:
            continue
        for c in NZ:
            if c in span:
                continue
            GL_order += 1
            orbit.add(frozenset(
                tuple((x[0]*a[j]+x[1]*b[j]+x[2]*c[j]) % 3 for j in range(3))
                for x in base
            ))
assert GL_order == 11232 and orbit == set(caps)
assert GL_order // len(caps) == 16

for U in caps:
    points = sorted(U)
    by_size = [
        [frozenset(sub) for sub in combinations(range(8), k)
         if add(*(points[i] for i in sub)) == Z]
        for k in range(9)
    ]
    assert [len(s) for s in by_size] == [1, 0, 0, 0, 4, 0, 0, 0, 1]
    Q = by_size[4]
    assert sorted(len(x & y) for x, y in combinations(Q, 2)) == [0,0,2,2,2,2]
    assert all(not (x & y & z) for x,y,z in combinations(Q,3))
    assert all(sum(i in q for q in Q)==2 for i in range(8))

count_24 = 702 * factorial(24) // factorial(3)**8
assert count_24 == 259318069140049920000

@lru_cache(None)
def greedy(adjacency, active):
    if active == 0:
        return ((0, Fraction(1)),)
    n = active.bit_count()
    result = defaultdict(Fraction)
    for v in range(len(adjacency)):
        if (active >> v) & 1:
            remain = active & ~(adjacency[v] | (1 << v))
            for k, p in greedy(adjacency, remain):
                result[k + 1] += p/n
    return tuple(sorted(result.items()))

def graph_law(edges):
    adjacency = [0] * 8
    for u, v in edges:
        adjacency[u] |= 1 << v
        adjacency[v] |= 1 << u
    return dict(greedy(tuple(adjacency), 255))

path = graph_law([(i,i+1) for i in range(7)])
star = graph_law([(0,i) for i in range(1,8)])
double_star = graph_law([(0,1),(0,2),(0,3),(0,4),(1,5),(1,6),(1,7)])
assert path == {3:Fraction(11,45), 4:Fraction(34,45)}
assert star == {1:Fraction(1,8), 7:Fraction(7,8)}
assert double_star == {4:Fraction(7,16), 6:Fraction(9,16)}
assert Fraction(2,35)*path[4] == Fraction(68,1575)
assert Fraction(2,35)*double_star[4] == Fraction(1,40)

# Uniform mass-24 weak compositions on path P8, with bipartition 4+4.
denominator = comb(31,7)
signed_fourier_coeff = comb(11,3)-4*comb(10,3)
assert signed_fourier_coeff == -315
assert Fraction((denominator+2*signed_fourier_coeff)//3, denominator) == Fraction(58421,175305)
print("PASS: 702 caps; GL(3,3) orbit/stabiliser 702/16")
print("PASS: zero-sum quartets, C4 nerve incidence, 24-term count")
print("PASS: exact greedy laws on P8, K1,7, double-star")
print("PASS: weak-composition ternary charge character filter")
print("NOTE: finite checks, not a complete proof, novelty audit, or Lean verification")
