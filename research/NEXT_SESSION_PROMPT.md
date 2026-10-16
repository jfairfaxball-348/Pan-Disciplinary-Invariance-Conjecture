# PDIC-S003R7 — CLOSE THE ARBITRARY MATRIX SEMANTIC COUNT BRIDGE

**PREPARED, NOT EXECUTED.** Execute S003R7 only on the next owner's instruction. Do not automatically begin S004, contact anyone, seek Palomar, or submit any manuscript.

## Required exact-head checks

Read `AGENTS.md`, `authoritative/STATE.json`, `research/CLAIMS.md`, `research/FLAGSHIP_THEOREM.md`, `research/S003R6_COMPOSITIONAL_COUNTS.md`, `sessions/S003R6_CLOSEOUT.md` and [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3). Determine PR HEAD live and check BOTH `PDIC Lean kernel verification` and `PDIC finite lead check` at that exact SHA. If the newest local lemma candidate failed, repair it before relying on it, and repeat exact-HEAD strict CI. The verified S003R6 baseline is commit `2bfb3164d9dbc73c830ea9cac24667a66b11a8f1`, [run 38871115121](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38871115121).

## Singular proof mission

Complete and kernel-certify `(fourRowMixedCountBV a b c d).toNat = actualMixedLeftPairCount (adjOfRows (fourRows a b c d))` for all `a b c d : BitVec 4`, and `(fourRowEdgeCountBV a b c d).toNat = actualMatrixEdgeCount (...)`; then transfer both extremal theorems. No monolithic `decide +kernel` over all 65,536 matrices with nested Finsets.

1. Preserve the verified symbolic lemmas `goodLeftPairBV_spec`, `orMask_getLsbD_iff`, `sidePairsSix_eq_filter`, `sixBooleanIndicatorCount`, `fourRowMixedCountBV_eq_sixNat`, `fourSmallBVSum_noOverflow`, and `fourRowEdgeCountBV_eq_fourPopNat`.
2. Finish `sixPairsBoolCardinality` and `computableMixedLeftPairCount_eq_sixCriterion` if not already strict-CI-verified. Prefer local `Finset.card_filter` and `Finset.sum_insert` simplifications; simplify the **six fixed pairs**, never the matrix space. Be wary of recursive `simp [sidePairsSix]` at low recursion budgets.
3. Prove a general pair-neighbourhood row identity via `Finset.ext` and `orMask_getLsbD_iff`, and show complement cardinality two iff the union-neighbour count is two. Isolate the latter as a 16-mask lemma if that simplifies the code.
4. Prove the two right-column witness correspondences with `outsideMask_nonzero_iff`. For pair `{i,j}`, pass the remaining indices `k,l` and prove `∀v, v∉{i,j} ↔ (v=k ∨ v=l)` by a **16-case index computation**, then instantiate the six pair permutations. This is the one outstanding symbolic link between `goodLeftPairBV` and `mixedPairCriterionBool`.
5. Use six scalar iff lemmas, `computableMixedLeftPairCount_eq_actual`, and the two six-term Nat-sum lemmas to obtain the exact general mixed-count equation. Do the analogous row-wise sum decomposition for `actualMatrixEdgeCount` using `Finset.card_filter` and `Finset.sum_product`; existing `fourBitPopCount5_eq_rowCard` completes the proof.
6. Transfer `eight_edges_at_most_two_mixed_BV`, `four_by_four_six_edge_threshold_BV`, and `seven_edge_three_iff_spider_BV` to all Boolean matrices. Once both numerical bridges are *kernel checked*, begin balanced connected eight-vertex `SimpleGraph` and spider isomorphism; actual 2520-assignment sample-space probability follows later.

## Closeout policy

Require on an **exact SHA**: `lake build`, all five independent Python scripts, forbidden-axiom guard, and `#print axioms` for every new theorem (only standard axioms). Do not merge PR #3 or promote the flagship while its global semantic theorem is absent. Classify any unfinished proof as OPEN_IN_LEAN and name the missing lemma precisely. Update research note, claims, authoritative state, roadmap, closeout, next prompt and README as appropriate. Keep all other research repositories untouched. S004 novelty source audit and TeX manuscript are conditional on a defensible theorem and the required bridges.
