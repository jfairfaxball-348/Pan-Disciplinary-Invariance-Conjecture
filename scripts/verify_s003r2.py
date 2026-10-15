#!/usr/bin/env python3
"""Independent seven-edge spider orbit audit; finite check, NOT a Lean proof."""
from collections import Counter
from itertools import combinations

counts = Counter()
orientations = Counter()

def hub_form(rows):
    return (
        sum(x == 15 for x in rows) == 1
        and sorted(x.bit_count() for x in rows) == [1, 1, 1, 4]
        and len({x for x in rows if x != 15}) == 3
    )

for mask in range(1 << 16):
    rows = tuple((mask >> (4 * i)) & 15 for i in range(4))
    cols = tuple(
        sum(1 << i for i in range(4) if rows[i] & (1 << j))
        for j in range(4)
    )
    b = 0
    for i, j in combinations(range(4), 2):
        neighbours = rows[i] | rows[j]
        if neighbours.bit_count() != 2:
            continue
        other = 15 ^ neighbours
        if all(rows[k] & other for k in range(4) if k not in (i, j)):
            b += 1
    e = mask.bit_count()
    row_spider = hub_form(rows)
    col_spider = hub_form(cols)
    assert e < 6 or b <= 3, mask
    assert e < 8 or b <= 2, mask
    assert not (row_spider and col_spider), mask
    assert (e == 7 and b == 3) == (row_spider or col_spider), mask
    counts[e, b] += 1
    if row_spider:
        orientations["A"] += 1
    if col_spider:
        orientations["B"] += 1

assert orientations == {"A": 96, "B": 96}, orientations
assert {(e, b): n for (e, b), n in counts.items() if b >= 3} == {
    (4, 6): 24, (5, 4): 288, (6, 3): 1728, (7, 3): 192
}
assert 2 * 4 * 4 * 6 == 192
print("PASS: 65,536 matrices, strict six-edge threshold and seven-edge iff")
print("PASS: 96 row-hub and 96 column-hub labelled spiders = 192")
print("FINITE CHECK ONLY: this independent verifier is not a Lean proof")
