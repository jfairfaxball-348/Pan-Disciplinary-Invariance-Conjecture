# PDIC-S003R8 — FINISH BOTH NUMERIC SEMANTIC BRIDGES OR FREEZE A FIRST-PAPER THEOREM

**PREPARED, NOT EXECUTED.** Start only when the owner says “run next session”; do not execute S004 automatically. No Palomar, external outreach, arXiv or journal submission without explicit owner request.

## Exact state and integrity first

Read AGENTS.md, authoritative/STATE.json, research/CLAIMS.md, sessions/S003R7_CLOSEOUT.md and research/S003R7_SYMBOLIC_SEMANTIC_BRIDGE.md. Look up [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) live, record exact HEAD SHA and both GitHub Actions checks. **Never use the passing `b7d55232` local-lemma CI as evidence that later `df53e200` or `a8df4a89` kernels passed.** On any failed latest candidate inspect full Lean job logs and repair or *withdraw* the candidate. The strict passing S003R7 baseline is [`b7d55232`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/b7d5523207675fe9c9b15df1a67ba469528f86f5), [CI 38879098667](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38879098667).

## Singular core task — do not re-run a giant matrix enumeration

For all `a b c d : BitVec 4`, establish and kernel-check:

```lean
(fourRowMixedCountBV a b c d).toNat =
  actualMixedLeftPairCount (adjOfRows (fourRows a b c d))

(fourRowEdgeCountBV a b c d).toNat =
  actualMatrixEdgeCount (adjOfRows (fourRows a b c d))
```

1. Finalise exact six pair iff proofs from `twoRowNeighbours_eq_orMask`, `twoRow_outsideWitness_iff`, `goodPair_iff_mixedPairCriterion`, and `fixedPairXXCriterion`, checking exact CI.
2. Finish `sixPairsBoolCardinality_by_sum` and `computableMixedLeftPairCount_eq_sixCriterion` using `Finset.sum_boole`, six explicit fixed-pair summands and `Finset.sum_insert` or small cases. Do **not** repeat the twice-failed `simp [sidePairsSix, Finset.card_filter]` recursion explosion.
3. Combine `fourRowMixedCountBV_eq_sixNat`, all six `fixedPairXXCriterion`, the semantic cardinality result and `computableMixedLeftPairCount_eq_actual`. This is a composition of small verified equalities; do not invoke `decide` over a 65,536 × nested-Finset global theorem.
4. For edges, apply `Finset.sum_boole` to the edge-filter cardinality, `Finset.univ_product_univ` and `Finset.sum_product` (check exact Mathlib signatures) to decompose by rows. Combine `fourBitPopCount5_eq_rowCard` and `fourRowEdgeCountBV_eq_fourPopNat`.
5. Transfer all three BV results—`four_by_four_six_edge_threshold_BV`, `eight_edges_at_most_two_mixed_BV`, `seven_edge_three_iff_spider_BV`—into arbitrary Boolean matrices. Verify and print axioms. Do not yet call this the eight-vertex SimpleGraph isomorphism or full probability theorem.

## Aggressive publication-first fallback

If a bridge still fails, stop looping on simplifier settings. Freeze the strongest strict-CI-verified **self-contained 4×4 matrix theorem** with explicit definitions and assumptions, complete the *written* proof and source comparison, and prepare a narrow TeX-first-paper outline. Be candid if novelty is not established. The global flagship probability paper remains a separate later project until graph isomorphism, connectedness semantics, 2520-label probability, and the cited nine-cap classification have been properly integrated.

## Closeout

At an exact SHA require `lake build`, no `sorry`, `admit`, native proof oracle or custom axioms, explicit `#print axioms`, and all five existing Python scripts. Keep PR #3 unmerged until its promised equalities pass. Update claim register, state, README/ROADMAP as needed, one S003R8 closeout, exact links and the full S003R9 or S004 handoff. Do not alter any other repository.
