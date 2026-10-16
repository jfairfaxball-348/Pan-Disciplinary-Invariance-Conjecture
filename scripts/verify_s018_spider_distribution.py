#!/usr/bin/env python3
"""Independent exhaustive S018 spider probability-law corroboration.

FINITE_CHECKED only — never treated as a substitute for Lean theorem proofs.
Matches the vertex labels/edges of PDIC.namedSpider and the four canonical
cap-zero quartets in PDIC.lean.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations, permutations

VERTICES = tuple(range(8))
EDGES = {
    tuple(sorted(edge))
    for edge in ((0, 4), (0, 5), (0, 6), (0, 7),
                 (1, 6), (2, 5), (3, 4))
}
QUARTETS = {
    frozenset(q)
    for q in ((0, 1, 4, 5), (0, 1, 6, 7),
              (2, 3, 4, 5), (2, 3, 6, 7))
}


def adjacent(u: int, v: int) -> bool:
    return tuple(sorted((u, v))) in EDGES


def maximal_independent(s: frozenset[int]) -> bool:
    return (all(not adjacent(u, v) for u, v in combinations(s, 2))
            and all(any(adjacent(v, u) for u in s)
                    for v in VERTICES if v not in s))


def compatible_triple(triple: tuple[frozenset[int], ...]) -> bool:
    return any(
        not (s & t) and len(s & u) == 2 and len(t & u) == 2
        for s, t, u in permutations(triple)
    )


def main() -> None:
    mis = [
        frozenset(s) for s in combinations(VERTICES, 4)
        if maximal_independent(frozenset(s))
    ]
    m = len(mis)
    pairs = tuple(combinations(mis, 2))
    n0 = sum(len(s & t) == 0 for s, t in pairs)
    n2 = sum(len(s & t) == 2 for s, t in pairs)
    h = sum(compatible_triple(t) for t in combinations(mis, 3))
    assert (m, n0, n2, h) == (9, 1, 15, 3), (m, n0, n2, h)

    distribution = Counter()
    for perm in permutations(VERTICES):
        n = sum(frozenset(perm[v] for v in s) in QUARTETS for s in mis)
        distribution[n] += 1
    assert sum(distribution.values()) == 40320
    assert distribution == Counter({0: 23424, 1: 13440, 2: 3072, 3: 384})

    m1 = Fraction(2 * m, 35)
    m2 = Fraction(2 * n0, 35) + Fraction(n2, 315)
    m3 = Fraction(h, 315)
    prediction = (
        1 - m1 + m2 - m3,
        m1 - 2 * m2 + 3 * m3,
        m2 - 3 * m3,
        m3,
    )
    actual = tuple(Fraction(distribution[k], 40320) for k in range(4))
    assert prediction == actual == (
        Fraction(61, 105), Fraction(1, 3),
        Fraction(8, 105), Fraction(1, 105),
    ), (prediction, actual)
    assert m3 == Fraction(1, 105)
    print("S018 independent namedSpider distribution: PASS")
    print(f"graph MIS invariants: m={m} n0={n0} n2={n2} h={h}")
    print(f"N0 counts: {dict(sorted(distribution.items()))}")
    print(f"exact probabilities: {actual}")
    print("Scope: finite corroboration of namedSpider, NOT universal Lean proof.")


if __name__ == "__main__":
    main()
