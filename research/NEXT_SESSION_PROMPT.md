# PDIC-S003R6 — PROVE THE SIX-PAIR COUNT BY COMPOSITION, NOT BY A 65,536-CASE KERNEL REDUCTION

**PREPARED, NOT EXECUTED.** Execute exactly S003R6 when instructed. Do not automatically run S004 or any further session. No correspondence, Palomar, arXiv or journal submission.

## Inputs and required checks

Read `AGENTS.md`, `authoritative/STATE.json`, `research/CLAIMS.md`, `research/FLAGSHIP_THEOREM.md`, `research/S003R5_PROOF_DECOMPOSITION.md`, S003R5 closeout, and PR #3 at https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3 . Inspect the exact *latest PR HEAD* and both named GitHub workflows. Do not borrow main's green kernel status as verification for an unmerged branch.

## Singular proof target

Complete a universal Lean theorem that `(fourRowMixedCountBV a b c d).toNat` equals the mathematical existential mixed maximal independent set left-pair count for **every** Boolean 4×4 matrix. No giant `decide +kernel` across nested Finsets and all 65,536 matrices. Develop a compositional symbolic proof in the following order.

1. If the S003R5 branch Lean job has failed, fix the small Boolean criterion and local mask lemmas first, with an exact-head Lean CI PASS before invoking them as proved. Inspect errors, never hide `sorryAx`.
2. Formalise `goodLeftPairBV_spec`: for arbitrary four BitVec rows, `goodLeftPairBV x y z w` iff the union of the first two neighbour sets has cardinality 2 and each of the other two rows witnesses an edge outside this union. Use the local lemmas `twoNeighboursBV_eq_rowCard_two`, `outsideMask_nonzero_iff`, and an OR-bit/neighbourhood correspondence. This is a **single-pair** semantic statement.
3. Give an explicit complete duplicate-free enumeration of the six two-subsets of `Fin 4`. Show the existential `IsMixedMIS` filter cardinality equals the sum of the six pair indicator values; use the previously proved unique complement criterion and `computableMixedLeftPairCount_eq_actual`.
4. Prove that all six indicator summands are 0 or 1 and the total is ≤6. Therefore the three-bit sum cannot wrap. Prove four row popcounts ≤4 and the total ≤16, hence the five-bit edge sum cannot wrap.
5. Conclude exact `fourRowMixedCountBV_eq_actual` and `fourRowEdgeCountBV_eq_actualMatrixEdgeCount` and the matrix-level `actual_eight_edges_at_most_two_mixed`, `actual_four_mixed_implies_at_most_five_edges`, and seven-edge spider iff for arbitrary Boolean adjacency. If one proof cannot be completed, report the exact lemma that still blocks it; do not replace it with an unexplained finite census.
6. **Only if the count bridge is verified**, start the genuine connected `SimpleGraph (Fin 8)` balanced bipartition, h=b and graph-isomorphism theorem. Actual 2520-assignment probability semantics follow after that. The classical nine-cap classification remains an explicit external input.

## CI and closeout gate

Run or use hosted Actions to establish `lake build`, all five original independent Python verifiers, no `sorry`/`admit`/unapproved axioms, and `#print axioms` on each new declaration. Verify success on the **exact commit**, and only then consider merging PR #3. Update the claim register, state, roadmap, research note, closeout and next prompt. If the flagship is still partial, prepare S003R7; S004 manuscript and specialist novelty remain conditional. Keep all other research repos untouched.
