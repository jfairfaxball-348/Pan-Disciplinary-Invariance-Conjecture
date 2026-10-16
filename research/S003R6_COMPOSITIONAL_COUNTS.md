# PDIC S003R6 — compositional numerical bridge progress (2026-10-16)

## Mathematical statement

For a Boolean 4×4 bipartite adjacency matrix with four row masks `a,b,c,d`, a left pair `{i,j}` contributes one mixed maximal independent four-set iff:

1. The union `n = rᵢ OR rⱼ` has exactly two set positions.
2. Each of the two other rows has a set bit outside `n`.

The unique right pair must be the complement of the left pair's neighbourhood, by `mixed_iff_complement_criterion` already established in S003R2. There are **precisely six** two-subsets of `Fin 4`, with the six orderings already used by `fourRowMixedCountBV`:

| Left pair | Test row order (x,y,z,w) |
| --- | --- |
| 01 | a,b,c,d |
| 02 | a,c,b,d |
| 03 | a,d,b,c |
| 12 | b,c,a,d |
| 13 | b,d,a,c |
| 23 | c,d,a,b |

Thus their indicator sum is at most 6, safely inside the 3-bit range 0..7. Each four-bit row popcount is at most 4; the four-row edge sum is at most 16 and safely inside the 5-bit range 0..31.

## Verified Lean slice

On unmerged PR #3 at commit [`2bfb3164`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/2bfb3164d9dbc73c830ea9cac24667a66b11a8f1), strict [Lean CI run 38871115121](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38871115121) **PASSED** with all five Python checks and forbidden-axiom guard.

New statements include:

- `orMask_getLsbD_iff`: a bit in the union mask iff it is set in either row.
- `goodLeftPairBV_spec`: a single mask pair test is exactly the two-neighbour/remaining-two-outside-witness condition, with arbitrary four row masks.
- `sidePairsSix_eq_filter` and `sidePairsSix_card`: six two-subsets, no duplicates.
- `sixBooleanIndicatorCount` and `fourRowMixedCountBV_eq_sixNat`: no 3-bit arithmetic wrap and exact ordinary-Nat six-indicator sum.
- `fourBitPopCount5_le_four`, `fourSmallBVSum_noOverflow`, `fourRowEdgeCountBV_eq_fourPopNat`: local upper bound four per row and exact no-wrap four-row arithmetic.

The explicit `#print axioms` reports for all principal declarations contain only standard `propext`, `Classical.choice`, `Quot.sound` (or none). None uses a forbidden oracle or custom axiom. This is genuinely compositional; there is no new global 65,536-case Finset reduction.

## Additional symbolic count on PR #3

The next source revision adds `sixPairsBoolCardinality`, asserting that the cardinality of **any** Boolean predicate supported on two-subsets of `Fin 4` is its six ordinary-Nat indicator sum, plus `computableMixedLeftPairCount_eq_sixCriterion` for the existing semantic criterion. This strengthens the six-subset enumeration from a list identity to a cardinality identity.

At the time of drafting, the first attempt failed at a `simp` recursion-depth limit, and an increased-depth revision was submitted for strict CI. **Do not cite this additional theorem as kernel-verified without an exact-HEAD passing run.**

## Remaining indispensable bridge

The following still need explicit checked Lean proofs:

1. `sideNeighbours (adjOfRows rows) {i,j} = Finset.univ.filter (fun v => (rows i ||| rows j).getLsbD v.val = true)` for arbitrary rows and left indices.
2. `(univ  sideNeighbours ...).card = 2` iff the pair OR-mask popcount is two (four columns; complement has cardinality two).
3. Each right-side domination witness in the complement iff the appropriate outside-mask nonzero condition, using `outsideMask_nonzero_iff`.
4. Instantiate this generic pair bridge at the six exact disjoint pair/complement orders 01|23, 02|13, 03|12, 12|03, 13|02, 23|01. This gives exact `goodLeftPairBV` iff `mixedPairCriterionBool` for each summand without any matrix census.
5. Combine the two **independently** proved six-term Nat-sum identities to get `fourRowMixedCountBV.toNat = actualMixedLeftPairCount`. Separately prove `actualMatrixEdgeCount` is the sum of the four row filtered-cardinalities and substitute `fourRowEdgeCountBV_eq_fourPopNat`.
6. Transfer 8-edge exclusion, 4-mixed/5-edge bound, and 7-edge spider iff to generic matrix semantics; only afterwards begin the `SimpleGraph (Fin 8)` h=b / connected-isomorphism and 2520-labelling probability bridge.

## Scope and honesty

The S002 graph/probability flagship is **written with the cited classical nine-cap input**, not fully formalised in Lean. This session does **not** complete the arbitrary matrix numerical↔semantic equality, connected graph classification or probability theorem, and does not establish literature originality. PR #3 remains unmerged until its promised global bridge is complete. No Palomar, arXiv, journal or external correspondence action.
