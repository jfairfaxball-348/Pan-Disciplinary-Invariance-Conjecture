#!/usr/bin/env python3
"""Independent S001 quadratic-model/orbit and joint-witness check.
No imports from the S000 enumeration checker. Standard library only.
"""
from itertools import combinations, product
from collections import Counter
from fractions import Fraction
from math import comb

F = range(3)
q = lambda x, y: (x*x + y*y) % 3
W = [(x, y, q(x,y)) for x,y in product(F, repeat=2)]
U = set(W) - {(0,0,0)}
assert len(U) == 8
assert all(any(sum(v[j] for v in t)%3 for j in range(3))
           for t in combinations(W,3))
Q = [frozenset(s) for s in combinations(U,4)
     if all(sum(v[j] for v in s)%3 == 0 for j in range(3))]
assert len(Q)==4
assert Counter(len(s & t) for s,t in combinations(Q,2)) == {2:4,0:2}
assert all(not (a & b & c) for a,b,c in combinations(Q,3))
ordered = Counter(len(a&b) for a in Q for b in Q)
assert ordered == {4:4,2:8,0:4}
expected={0:Fraction(2,35),1:Fraction(0),2:Fraction(1,315),
          3:Fraction(0),4:Fraction(2,35)}
for t in range(5):
    assert Fraction(ordered[t],comb(8,4)*comb(4,t)**2)==expected[t]

nonzero=[a for a in product(F,repeat=3) if a!=(0,0,0)]
orbit=set()
nmat=0
for a in nonzero:
 for b in nonzero:
  cross=((a[1]*b[2]-a[2]*b[1])%3,
         (a[2]*b[0]-a[0]*b[2])%3,
         (a[0]*b[1]-a[1]*b[0])%3)
  for c in nonzero:
   if sum(c[i]*cross[i] for i in range(3))%3==0: continue
   nmat+=1
   orbit.add(frozenset(
       tuple((x*a[i]+y*b[i]+z*c[i])%3 for i in range(3))
       for x,y,z in U))
assert nmat==11232 and len(orbit)==702
print("PASS independent: quadratic nine-cap, four quartets and C4")
print("PASS independent: 11232 GL matrices, 702 orbit members, stabiliser 16")
print("PASS independent: joint zero-sum overlap distribution",expected)
print("NOTE: numerical corroboration, not Lean or priority verification")
