#!/usr/bin/env python3
"""Independent S008 finite check: every row/column spider matrix is the named graph.

This is FINITE_CHECKED corroboration, not a replacement for the open
Lean kernel-level universal matrix-pattern-to-graph-isomorphism theorem.
Enumerates all 2^16 4x4 Boolean matrices and constructs an explicit
bijection from Fin 4 ⊕ Fin 4 to Fin 8 whenever the spider pattern holds.
"""
from itertools import combinations

EXPECTED = {frozenset(pair) for pair in
            [(0,4), (0,5), (0,6), (0,7), (1,6), (2,5), (3,4)]}

def witnesses(mask):
    a = [[(mask >> (4*i+j)) & 1 for j in range(4)] for i in range(4)]
    for hub in range(4):
        leaves = [i for i in range(4) if i != hub]
        if all(a[hub]) and all(sum(a[i]) == 1 for i in leaves):
            tips = [a[i].index(1) for i in leaves]
            if len(set(tips)) == 3:
                left = {hub: 0, **{i: k+1 for k, i in enumerate(leaves)}}
                right = {tips[k]: 6-k for k in range(3)}
                right[({0,1,2,3} - set(tips)).pop()] = 7
                yield "row", {i: left[i] for i in range(4)} | {
                    4+j: right[j] for j in range(4)}
    for hub in range(4):
        leaves = [j for j in range(4) if j != hub]
        if all(a[i][hub] for i in range(4)) and all(
                sum(a[i][j] for i in range(4)) == 1 for j in leaves):
            tips = [next(i for i in range(4) if a[i][j]) for j in leaves]
            if len(set(tips)) == 3:
                right = {hub: 0, **{j: k+1 for k, j in enumerate(leaves)}}
                left = {tips[k]: 6-k for k in range(3)}
                left[({0,1,2,3} - set(tips)).pop()] = 7
                yield "column", {i: left[i] for i in range(4)} | {
                    4+j: right[j] for j in range(4)}

def check():
    row, column = 0, 0
    for mask in range(65536):
        witness = list(witnesses(mask))
        for orientation, renaming in witness:
            if orientation == "row":
                row += 1
            else:
                column += 1
            assert set(renaming) == set(range(8))
            assert sorted(renaming.values()) == list(range(8))
            edges = {frozenset((renaming[i], renaming[4+j]))
                     for i in range(4) for j in range(4)
                     if (mask >> (4*i+j)) & 1}
            assert edges == EXPECTED, (mask, orientation, edges)
            # Every nonedge is also preserved, not just the seven edges.
            for u, v in combinations(range(8), 2):
                # Direct orientation-independent adjacency test:
                if u < 4 and v >= 4:
                    original = bool((mask >> (4*u+v-4)) & 1)
                elif v < 4 and u >= 4:
                    original = bool((mask >> (4*v+u-4)) & 1)
                else:
                    original = False
                assert original == (frozenset(
                    (renaming[u], renaming[v])) in EXPECTED)
    assert (row, column) == (96, 96), (row, column)
    print("S008 PASS: 65,536 matrices; 96 row and 96 column spiders;")
    print("explicit 8-vertex bijections preserve every edge and nonedge.")

if __name__ == "__main__":
    check()
