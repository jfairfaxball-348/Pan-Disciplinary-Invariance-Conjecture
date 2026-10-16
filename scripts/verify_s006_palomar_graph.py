#!/usr/bin/env python3
"""Independent finite audit of the S006 *narrow* connected graph theorem.

All 2^16 Boolean matrices A: Fin 4 x Fin 4 -> Bool are enumerated.
The mixed maximal-independent vertex-set count is computed by elementary
independence/domination (unique opposite-side complement), without reading
PDIC's BitVec functions or trusting its Lean implementation.

This is a finite cross-check, NOT a Palomar Comparator/NanoDa certificate.
"""
from itertools import combinations


def rows(mask):
    return [(mask >> (4 * i)) & 15 for i in range(4)]


def spider_pattern(mask):
    r = rows(mask)
    c = [sum(((r[i] >> j) & 1) << i for i in range(4)) for j in range(4)]

    def hub(q):
        return any(
            q[i] == 15
            and all(v in (1, 2, 4, 8) for v in (q[j] for j in range(4) if j != i))
            and len({q[j] for j in range(4) if j != i}) == 3
            for i in range(4)
        )

    return hub(r) or hub(c)


def mixed_count(mask):
    r = rows(mask)
    answer = 0
    for i, j in combinations(range(4), 2):
        forbidden_right = r[i] | r[j]
        right_set = (~forbidden_right) & 15
        if right_set.bit_count() != 2:
            continue
        if all(r[k] & right_set for k in range(4) if k not in (i, j)):
            answer += 1
    return answer


def is_connected(mask):
    r = rows(mask)
    seen = {0}
    active = [0]
    while active:
        v = active.pop()
        neighbours = (
            [4 + j for j in range(4) if r[v] & (1 << j)]
            if v < 4 else
            [i for i in range(4) if r[i] & (1 << (v - 4))]
        )
        for w in neighbours:
            if w not in seen:
                seen.add(w)
                active.append(w)
    return len(seen) == 8


def main():
    connected = sharp = 0
    for mask in range(1 << 16):
        if not is_connected(mask):
            continue
        connected += 1
        b = mixed_count(mask)
        p = spider_pattern(mask)
        assert b <= 3, (mask, b, p)
        assert (b == 3) == p, (mask, b, p)
        sharp += b == 3
    assert connected == 36317, connected
    assert sharp == 192, sharp
    print(f"PASS: {connected} connected matrices, {sharp} equality matrices, zero counterexamples")


if __name__ == "__main__":
    main()
