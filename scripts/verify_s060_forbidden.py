#!/usr/bin/env python3
"""Independent audit of S060's sound obstruction search (not a proof substitute)."""
from itertools import combinations
from pathlib import Path
import re
from verify_s058_third_shards import BASIS, FREE, short_zero_free


def main():
    source = Path('S024.lean').read_text()
    block = source.split('def s060ForbiddenLists', 1)[1].split('def s060AllowedList', 1)[0]
    patterns = [tuple(map(int, re.findall(r'\d+', row)))
                for row in re.findall(r'\[([\d, ]+)\]', block)]
    assert len(patterns) == 54 and len(set(patterns)) == 54, len(patterns)
    assert all(len(set(B)) == len(B) and all(0 <= b < 17 for b in B) for B in patterns)
    assert all(not short_zero_free(B) for B in patterns), 'unsound local obstruction'
    layer = [()]
    counts = [1]
    for _ in range(5):
        layer = [I + (j,) for I in layer
                 for j in range(max(I, default=-1) + 1, 17)
                 if not any(set(B) <= set(I + (j,)) for B in patterns)]
        assert len(layer) == len(set(layer)), 'duplicate sorted construction'
        counts.append(len(layer))
    actual = {I for I in combinations(range(17), 5) if short_zero_free(I)}
    assert set(layer) == actual, (set(layer) - actual, actual - set(layer))
    assert len(actual) == 18
    print('PASS all 54 local obstructions use the original zero-sum predicate')
    print('PASS layer counts:', counts)
    print('PASS staged survivors equal all 18 genuine survivors among all 6188 tails')


if __name__ == '__main__':
    main()
