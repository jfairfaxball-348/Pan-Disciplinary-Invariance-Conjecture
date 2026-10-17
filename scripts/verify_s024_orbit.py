#!/usr/bin/env python3
"""S024 independent zero-fixing GL orbit and explicit labelling witnesses.

This exhaustive finite test is NOT a Lean proof of AdmissibleCapImageOrbit.
It imports no earlier PDIC checker and uses Python's standard library only.
"""
from collections import Counter
from itertools import product

ZERO = (0, 0, 0)
nonzero = tuple(p for p in product(range(3), repeat=3) if p != ZERO)

def neg(v):
    return tuple(-x % 3 for x in v)

def add(a, b):
    return tuple((a[j] + b[j]) % 3 for j in range(3))

representatives = sorted(v for v in nonzero if v < neg(v))
assert len(representatives) == 13
pairs = [(v, neg(v)) for v in representatives]

# Enumerate independently by rejecting opposite pairs and zero-sum triples.
# All admissible sets are encountered exactly once.
caps = set()
def extend(k, chosen, seen):
    if len(chosen) == 8:
        caps.add(frozenset(chosen))
        return
    if k == 13 or 13 - k < 8 - len(chosen):
        return
    extend(k + 1, chosen, seen)
    for v in pairs[k]:
        if any(neg(add(v, w)) in seen for w in chosen):
            continue
        chosen.append(v)
        seen.add(v)
        extend(k + 1, chosen, seen)
        seen.remove(v)
        chosen.pop()

extend(0, [], set())
assert len(caps) == 702, len(caps)

canonical = tuple(
    (x, y, (x*x + y*y) % 3)
    for x, y in product(range(3), repeat=2)
    if (x, y) != (0, 0)
)
assert len(canonical) == len(set(canonical)) == 8

def det(a, b, c):
    return sum(c[j]*(a[(j+1)%3]*b[(j+2)%3] -
                     a[(j+2)%3]*b[(j+1)%3])
               for j in range(3)) % 3

def transform(v, a, b, c):
    return tuple((v[0]*a[i] + v[1]*b[i] + v[2]*c[i]) % 3
                 for i in range(3))

orbit_mult = Counter()
witnesses = {}
matrices = 0
for a in nonzero:
    for b in nonzero:
        for c in nonzero:
            if det(a, b, c) == 0:
                continue
            matrices += 1
            mapped = tuple(transform(v, a, b, c) for v in canonical)
            image = frozenset(mapped)
            assert len(image) == 8
            orbit_mult[image] += 1
            witnesses.setdefault(image, mapped)

assert matrices == 11232
assert len(orbit_mult) == len(caps) == 702
assert set(orbit_mult) == caps
assert set(orbit_mult.values()) == {16}
for cap in caps:
    enumeration = tuple(sorted(cap))
    mapped = witnesses[cap]
    p = tuple(mapped.index(v) for v in enumeration)
    assert sorted(p) == list(range(8))
    assert tuple(mapped[p[i]] for i in range(8)) == enumeration

print("S024 finite PASS: 702 admissible image sets, independently enumerated")
print("S024 finite PASS: GL(3,3) order 11232 and exactly 16 matrices per image")
print("S024 finite PASS: all 702 images have a genuine vertex permutation")
print("CAVEAT: image-orbit surjectivity is NOT yet formally proved in Lean")
