#!/usr/bin/env python3
"""S058 independent finite audit (not a Lean proof).

Reconstruct exactly the 17 pinned ternary vectors and three basis points,
apply genuine zero-sum restrictions for subset sizes 1, 2, 3, and verify
sorted-third-index disjoint partitions of three expensive second-index
survivor families. The Lean theorem statements themselves stay unchanged.
"""
from itertools import combinations

FREE = (
    (0, 1, 1), (0, 1, 2), (0, 2, 1), (1, 0, 1),
    (1, 0, 2), (1, 1, 0), (1, 1, 1), (1, 1, 2),
    (1, 2, 0), (1, 2, 1), (1, 2, 2), (2, 0, 1),
    (2, 1, 0), (2, 1, 1), (2, 1, 2), (2, 2, 1),
    (2, 2, 2),
)
BASIS = ((1, 0, 0), (0, 1, 0), (0, 0, 1))
EXPECTED = {
    (0, 3): {(0, 3, 7, 10, 14)},
    (1, 3): {(1, 3, 6, 8, 13)},
    (2, 3): {(2, 3, 6, 7, 12), (2, 3, 8, 10, 15)},
    (0, 4): {(0, 4, 6, 9, 12)},
    (0, 5): {(0, 5, 9, 10, 15)},
    (0, 6): {(0, 6, 7, 8, 11)},
    (1, 4): {(1, 4, 5, 10, 14)},
    (2, 4): {(2, 4, 5, 6, 13), (2, 4, 9, 10, 16)},
    (1, 5): {(1, 5, 6, 9, 11)},
    (1, 7): {(1, 7, 8, 10, 16)},
    (3, 5): {(3, 5, 13, 14, 15)},
}


def short_zero_free(tail):
    points = BASIS + tuple(FREE[i] for i in tail)
    return all(
        any(sum(p[axis] for p in group) % 3 != 0 for axis in range(3))
        for size in (1, 2, 3)
        for group in combinations(points, size)
    )


def check_pair(i, j):
    full = {
        (i, j) + extra
        for extra in combinations(range(j + 1, 17), 3)
        if short_zero_free((i, j) + extra)
    }
    per_third = {}
    indexed = []
    for k in range(17):
        candidates = {
            (i, j, k) + rest
            for rest in combinations(range(k + 1, 17), 2)
        } if k > j else set()
        indexed.extend(candidates)
        per_third[k] = {tail for tail in candidates if short_zero_free(tail)}
    assert len(indexed) == len(set(indexed)), (i, j, "third-index overlap")
    assert set(indexed) == {
        (i, j) + extra
        for extra in combinations(range(j + 1, 17), 3)
    }, (i, j, "third-index coverage")
    assert set().union(*per_third.values()) == full, (i, j, "predicate partition")
    assert full == EXPECTED[i, j], (i, j, full, EXPECTED[i, j])
    rows = [(k, len(per_third[k])) for k in range(17) if per_third[k]]
    print(f"PASS pair ({i},{j}): {len(indexed)} candidates, "
          f"{len(full)} survivors, nonempty third shards {rows}")


def main():
    for i, j in EXPECTED:
        check_pair(i, j)


if __name__ == "__main__":
    main()
