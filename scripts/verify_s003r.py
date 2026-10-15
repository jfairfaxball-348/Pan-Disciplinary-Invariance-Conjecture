#!/usr/bin/env python3
"""S003R independent all-matrix edge-threshold check (finite evidence, NOT Lean)."""
from collections import Counter
from itertools import combinations

PAIRS = tuple(combinations(range(4), 2))
HIST = Counter()

def pair_formula(rows, i, j):
    """Two A vertices fix the only possible opposite B-pair."""
    covered = rows[i] | rows[j]
    if covered.bit_count() != 2:
        return False
    Y = 15 ^ covered
    return all(rows[k] & Y for k in range(4) if k != i and k != j)

def directly_maximal(rows, A, B):
    """Independent and dominating, with no reliance on pair_formula."""
    Am = sum(1 << i for i in A)
    Bm = sum(1 << j for j in B)
    independent = all((rows[i] & Bm) == 0 for i in A)
    dominates_A = all(rows[i] & Bm for i in range(4) if not ((Am >> i) & 1))
    dominates_B = all(any((rows[i] >> j) & 1 for i in A)
                      for j in range(4) if not ((Bm >> j) & 1))
    return independent and dominates_A and dominates_B

def spider_degree_pattern(rows):
    adj = [0] * 8
    for i in range(4):
        for j in range(4):
            if (rows[i] >> j) & 1:
                adj[i] |= 1 << (j + 4)
                adj[j + 4] |= 1 << i
    degrees = [a.bit_count() for a in adj]
    return (sorted(degrees, reverse=True) == [4,2,2,2,1,1,1,1] and
            any(degrees[v] == 4 and
                sum(bool(adj[v] & (1 << u)) and degrees[u] == 2
                    for u in range(8)) == 3
                for v in range(8)))

for matrix in range(65536):
    rows = tuple((matrix >> (4 * i)) & 15 for i in range(4))
    via_pairs = sum(pair_formula(rows, i, j) for i,j in PAIRS)
    via_direct = sum(directly_maximal(rows, A, B) for A in PAIRS for B in PAIRS)
    assert via_pairs == via_direct, (matrix, via_pairs, via_direct)
    edges = matrix.bit_count()
    HIST[edges, via_direct] += 1
    assert not (edges >= 6 and via_direct >= 4), (matrix, edges, via_direct)
    if edges >= 7 and via_direct == 3:
        assert edges == 7 and spider_degree_pattern(rows), matrix
    if edges == 7 and spider_degree_pattern(rows):
        assert via_direct == 3, matrix

assert sum(HIST.values()) == 65536
assert sum(n for (edges, b), n in HIST.items() if b >= 4) == 312
assert {(edges,b):n for (edges,b),n in HIST.items() if b>=3} == {
    (4,6):24, (5,4):288, (6,3):1728, (7,3):192
}
print("PASS: all 65,536 matrices, two independent mixed-MIS counters agree")
print("PASS: b >= 4 implies at most five edges; b=3, e=7 iff labelled spider (192 matrices)")
print("FINITE CHECK ONLY: does not replace a Lean theorem or connected-graph reduction")
