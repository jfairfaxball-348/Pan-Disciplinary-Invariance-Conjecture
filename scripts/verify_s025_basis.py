#!/usr/bin/env python3
"""S025 independent finite check for actual cap three-anchor geometry.

This script is not a Lean certificate; the source theorem must be checked
separately by the Lean kernel.
"""
from itertools import combinations, product

POINTS = tuple(product(range(3), repeat=3))
ZERO = (0, 0, 0)

def add(p, q):
    return tuple((p[i] + q[i]) % 3 for i in range(3))

def neg(p):
    return tuple(-p[i] % 3 for i in range(3))

def span(p, q):
    return {add(tuple(a*x % 3 for x in p), tuple(b*y % 3 for y in q))
            for a in range(3) for b in range(3)}

def det(p, q, r):
    return (p[0]*(q[1]*r[2]-q[2]*r[1])
            -p[1]*(q[0]*r[2]-q[2]*r[0])
            +p[2]*(q[0]*r[1]-q[1]*r[0])) % 3

def cap(s):
    return (len(s) == len(set(s))
            and all(p != ZERO for p in s)
            and all(add(p, q) != ZERO for p,q in combinations(s, 2))
            and all(add(add(p,q),r) != ZERO for p,q,r in combinations(s, 3)))

# Universal determinant gate (no cap hypothesis used).
valid_triples = 0
for p in POINTS:
    for q in POINTS:
        for r in POINTS:
            if p != ZERO and q not in span(p,p) and r not in span(p,q):
                assert det(p,q,r) != 0, (p,q,r)
                valid_triples += 1
assert valid_triples == 11232

# Independently generate the 702 admissible images from antipodal directions.
directions = [p for p in POINTS if p != ZERO and p < neg(p)]
assert len(directions) == 13
caps = set()
for selected in combinations(directions, 8):
    for signs in product((0,1), repeat=8):
        image = tuple(neg(p) if sign else p
                      for p,sign in zip(selected, signs))
        if cap(image):
            caps.add(frozenset(image))
assert len(caps) == 702

# Fixed first two labels need no special choice; any such pair extends
# to an actual independent ordered triple inside the cap.
for image in caps:
    points = sorted(image)
    p,q = points[0],points[1]
    assert p != ZERO and q not in span(p,p)
    assert any(r not in span(p,q) and det(p,q,r) != 0 for r in points)

print("PASS S025: 11232 triple matrices satisfy the determinant gate")
print("PASS S025: each of 702 admissible cap images extends any fixed first pair to a basis")
print("SCOPE: finite corroboration, not an internal Lean orbit certificate")
