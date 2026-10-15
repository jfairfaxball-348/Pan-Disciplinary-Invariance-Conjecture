# PDIC-S003R5 — KERNEL-CLOSE THE EXACT MATRIX COUNT, THEN GRAPH BRIDGES

**PREPARED, NOT EXECUTED.** Owner instruction “run next session” authorises exactly S003R5. Do not automatically execute S004. No external submissions.

## Starting condition

Read AGENTS.md, authoritative/STATE.json, research/CLAIMS.md, research/FLAGSHIP_THEOREM.md, research/S003R3_GRAPH_SEMANTICS_AND_EIGHT_EDGE_BOUND.md, S003R4 closeout, and the S003R4 research note. The main branch remains known-good S003R3 Lean; [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) holds **unmerged and unverified** S003R4 Lean candidates. The first run on PR #3 failed: `Decidable (mixedPairCriterion adj X)` missing. The subsequent commit `8585798` replaced the criterion with constructive Bool predicates. Recheck the **actual final HEAD** CI verdict, not a finite lead run.

## Top priority — no more silent gap

1. Inspect exact Lean job logs for PR #3. Fix all syntax/type/proof errors, timeouts, stack overflows, or excessive `decide +kernel` evaluations. Do not use `sorry`, `admit`, `native_decide`, `bv_decide` with unapproved native axioms, or trust compiler. If the global 65,536-case Prop-count check exhausts resources, decompose into six independent left-pair BV↔Boolean-equivalence lemmas, a finite-set sum of indicators, and separate no-overflow arithmetic. Prioritise a usable symbolic kernel proof over brute-force resource exhaustion.
2. Obtain CI PASS for `fourRowMixedCountBV_eq_actual` and `fourRowEdgeCountBV_eq_actualMatrixEdgeCount` and generic `actual_eight_edges_at_most_two_mixed` / `actual_four_mixed_implies_at_most_five_edges`. Explicitly confirm `#print axioms` includes no `sorryAx`/`_native`/`Lean.trustCompiler`.
3. Transfer the seven-edge equality iff `spiderMatrixBV` to **arbitrary Bool adjacency**, and only after this count bridge is proved, merge the tested PR to main. Keep claims/state in sync with the result, do not inherit CI success from other heads.

## Secondary — actual flagship

4. Attempt the connected `SimpleGraph (Fin 8)` h=b bijection/unique 4+4 bipartition/≥7-edge bound and equality iff **actual graph isomorphism** to S(2,2,2,1). Do not equate 192 labelled matrix samples with a graph isomorphism theorem.
5. If time allows, formalise uniform permutations of an eight-cap and 2520 equiprobable ordered atom assignments (16 permutations per assignment), exactly 8 successful assignments for a given compatible triple and moments/distribution. Rational inversion alone is insufficient. Maintain nine-cap classification as external.

## Mandatory closeout

Run `set -euo pipefail; lake build`, all five finite Python checkers, strict axiom audit, then confirm host Actions job success for the exact main HEAD if merged. Write the proved statement boundaries and a complete S003R6 prompt if still partial. S004 manuscript/novelty only after a defensible theorem. No other repos, external submissions or correspondence.