# PDIC S003R7 — exact pair-count bridge and verification boundary (2026-10-16)

## Target, with correct logical scope

For arbitrary four 4-bit rows `a,b,c,d` let `rows = fourRows a b c d` and `A = adjOfRows rows`. Write `b(A)` for the number of left two-sets `X` admitting a complementary right two-set `Y` making a maximal independent four-set; `e(A)` is the number of matrix edges. The desired **full** bridge is

```
(fourRowMixedCountBV a b c d).toNat = actualMixedLeftPairCount A
(fourRowEdgeCountBV a b c d).toNat = actualMatrixEdgeCount A
```

These equations are mathematical consequences of the lemmas below, but they must **not** be promoted as Lean-certified unless separately checked.

## Symbolic proof (no global matrix enumeration)

**Pair support.** For any two row indices `i,k`, the two-row neighbour set satisfies

```
sideNeighbours (adjOfRows rows) {i,k}
= univ.filter (fun j => (rows i ||| rows k).getLsbD j.val = true).
```

It follows by OR-bit membership and a Finset extensionality argument. The opposite-side candidate `Y` is the exact complement of this set, uniquely by the prior `mixed_opposite_unique` theorem. Since four right columns exist, `|Y|=2` iff the OR mask has exactly two occupied columns. This last result needs only 16 masks, not 65,536 matrices.

**Domination.** For any third row `v`,

```
(∃j ∈ Y, adjOfRows rows v j = true)
↔ ∃j, (rows v).getLsbD j.val = true ∧
      (rows i ||| rows k).getLsbD j.val = false.
```

The right side is exactly the witness certified by `outsideMask_nonzero_iff`. If `z,w` are the *other* two row indices, `goodLeftPairBV (rows i) (rows k) (rows z) (rows w)` is exactly `mixedPairCriterion A {i,k}`, hence also `mixedPairCriterionBool A {i,k}`.

**Six distinct left pairs.** The six tests occur once each in the order

```
01 | a b | c d
02 | a c | b d
03 | a d | b c
12 | b c | a d
13 | b d | a c
23 | c d | a b
```

The previously kernel-checked `sidePairsSix_eq_filter` supplies completeness, `fourRowMixedCountBV_eq_sixNat` removes three-bit wrap, and `computableMixedLeftPairCount_eq_actual` links the semantic Boolean criterion to the existential maximal-independent-set count. The **only necessary aggregation step** is to turn a cardinality of a predicate supported on these six distinct pairs into their six ordinary-natural-number Boolean indicators. A prior `simp [sidePairsSix, Finset.card_filter]` attempt failed twice by recursion-depth exhaustion and was withdrawn, so **do not use it as established**.

**Edges.** Separately, `actualMatrixEdgeCount` is the cardinality of the subset of `Side × Side` occupied by edges, which partitions disjointly by the first coordinate. Thus
```
e(A) = ∑ i : Side, |{j : Side | A i j = true}|.
```
`fourBitPopCount5_eq_rowCard` equates each four-bit row popcount with its row cardinality; `fourRowEdgeCountBV_eq_fourPopNat` establishes no overflow. The missing Lean proof is the four-row finite-cardinality decomposition, not a new combinatorial theorem.

## Independent finite corroboration (not a Lean proof of the full bridge)

Independent exhaustive enumeration of the 65,536 four-row 4-bit matrices using the above six pair tests gives:

| Edges e | Maximum qualifying left pairs b |
| --: | --: |
| 0–3 | 0 |
| 4 | 6 |
| 5 | 4 |
| 6–7 | 3 |
| 8–9 | 2 |
| 10–12 | 1 |
| 13–16 | 0 |

There are exactly 192 matrices with seven edges and three qualifying left pairs, consistent with the already kernel-checked seven-edge spider characterization. This enumeration checks the finite statements; it does not replace the symbolic semantic bridge or graph/probability formalisation.

## Certificate tracking

- First S003R7 local OR-neighbourhood and complement lemmas: PR #3 commit `b7d5523207675fe9c9b15df1a67ba469528f86f5`, strict CI run `38879098667` PASS (Lean + all five Python scripts).
- Generic outside-witness, arbitrary-partition criterion and **all six** individual fixed-pair equivalences: commit `df53e200188cf185c1398929143f5b0456fbadd2`, strict CI run `38880618519` **PASS** (Lean + five Python scripts, only standard axioms).
- Subsequent six-pair filtered-cardinality trial at `a8df4a89` **FAILED** CI 38880747155 on a Nat casting/rewrite issue. Candidate `8e76088b` uses explicit `R := ℕ` with `Finset.sum_boole`; do not certify until exact-head CI passes.
- The full global two-count equalities, transferred matrix extremal theorem, SimpleGraph/spider isomorphism, and 2520-bijection probability theorem are OPEN_IN_LEAN unless later evidence is linked here.

No priority claim, Palomar request, manuscript submission, or merge of PR #3 is authorised by this note.
