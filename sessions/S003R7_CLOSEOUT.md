# PDIC S003R7 — session closeout (2026-10-16)

**EXECUTED. The new arbitrary-row OR-neighbourhood and two-column complement adapters are kernel verified. The full four-row numerical↔mixed-MIS semantic bridge remains OPEN_IN_LEAN pending exact-HEAD verification of the later candidate and aggregation.**

## Newly certified theorem slice

PR #3 commit [b7d5523207675fe9c9b15df1a67ba469528f86f5](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/b7d5523207675fe9c9b15df1a67ba469528f86f5), [strict Lean run 38879098667](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38879098667) PASSED; separate finite checks passed for the same SHA.

- `twoRowNeighbours_eq_orMask`: for arbitrary `rows : Side → BitVec 4` and arbitrary left indices `i,k`, a pair's actual finite-set neighbours are exactly the occupied bits of the OR of the two rows; proof by `Finset.ext` and `orMask_getLsbD_iff`.
- `fourMask_complement_card_two_iff`: for each of 16 four-bit masks, the complement has two columns iff the mask has two columns; local `decide +kernel`, **not** full-matrix computation.
- `twoRow_complement_card_two_iff`: generic row-map/finite-set composition of the two preceding lemmas.

These proofs have no forbidden native axioms or holes. They were independently validated by the hosted Lean job.

## Further proof engineering during S003R7

The symbolic outside-witness proof `twoRow_outsideWitness_iff`, generic `goodPair_iff_mixedPairCriterion`, six individual `fixedPairXXCriterion` lemmas, and alternative `Finset.sum_boole` cardinality proof were attempted on unmerged PR #3. The first failing attempts are **NOT** certificates:
- `2f9b0344` failed due to local Boolean equality and substitution issues;
- `8be9b762` failed due to a direction mismatch on the OR-bit iff;
- a revised candidate `df53e200` corrects the local mismatch;
- the later candidate `a8df4a89` adds `sixPairsBoolCardinality_by_sum` and `computableMixedLeftPairCount_eq_sixCriterion` without the formerly failing nested `card_filter` simplification.

**Exact-HEAD strict CI must be checked before promoting ANY follow-on lemma.** In particular, a failing or pending run is not a theorem. This is not a completed proof of the mixed or edge numeric bridge.

## Independent computational evidence

The existing [`verify_s003r.py`](../scripts/verify_s003r.py) independently enumerates genuine maximal independent two-and-two pairs for every one of 65,536 Boolean matrices and compares them with the six-mask formula. It reports zero discrepancies, 192 labelled seven-edge/three-pair equality matrices, and the sharp five-edge exclusion for at least four mixed pairs. This confirms finite instances and catches counterexamples; **it does not replace the pending Lean equality**.

## Remaining mathematical obligations

1. Certify the six scalar pair criteria at an exact PR SHA, and the cardinality decomposition into six indicators. Use `Finset.sum_boole` / explicit small sums rather than the already failed recursive `simp [Finset.card_filter]`.
2. Prove `fourRowMixedCountBV.toNat = actualMixedLeftPairCount` for all four rows.
3. Prove the independent product/row cardinality sum `fourRowEdgeCountBV.toNat = actualMatrixEdgeCount`, without a 65,536×Finset reduction.
4. Transfer BV extremal inequalities and seven-edge spider iff to actual matrices.
5. Only after these steps discuss connected balanced 8-vertex `SimpleGraph`, spider graph isomorphism, 2520-labelling probability, prior-art positioning and a manuscript.

## Repository and integrity

PR #3 remains unmerged; main contains the established earlier Lean baseline, this written research and the closeout. No Palomar, external messages, arXiv or journal submission was initiated. The project is **not yet manuscript-ready**. The next-session handoff is `research/NEXT_SESSION_PROMPT.md`.

[Full mathematical decomposition](../research/S003R7_SYMBOLIC_SEMANTIC_BRIDGE.md) · [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3)
