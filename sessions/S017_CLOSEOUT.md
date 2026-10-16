# PDIC S017 closeout — all-source overlapping pair and compatible triple events
Executed 16 October 2026. Active Lean branch `session/s007-full-lean-flagship`, unmerged draft PR #4.

## Substantive source
Introduced actual four two-element membership-bit fibres for *arbitrary* overlapping four-sets, constructed an eight-vertex permutation by cellwise equivalences, and transported true canonical-cap event counts. New S017 theorems:
1. `overlapSourceColour_fibre_card`: every membership-bit fibre has cardinality 2 under |S|=|T|=4 and |S∩T|=2.
2. `exists_perm_overlap_pair_to_canonical`: a real permutation maps S,T to canonical Q0,Q1 simultaneously.
3. `canonicalCapF3_perm_overlap_two_pair_event_card`: 128 true simultaneous zero-sum permutations for every such ordered pair.
4. `canonicalCapF3_perm_compatible_triple_event_card`: 128 true simultaneous zero-sum permutations for every prescribed compatible (complementary pair + intersecting third) triple.

Proof-bearing branch source: [0e88ab34eda79df08f700d141b9ef5f98e13f17e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0e88ab34eda79df08f700d141b9ef5f98e13f17e).
The initial candidate [82933786f6130d10b22c3dbd0d7036e9f100c92b](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/82933786f6130d10b22c3dbd0d7036e9f100c92b) failed hosted strict Lean on four tactic/elaboration issues; corrected in 2695776996159cdc4495368dade8cefad1a91923. The latest candidate adds the triple theorem.

## Verification gate
**S017 source at [0e88ab34eda79df08f700d141b9ef5f98e13f17e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0e88ab34eda79df08f700d141b9ef5f98e13f17e) **LEAN_KERNEL_VERIFIED**: [strict hosted run 38967576459 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38967576459) (full pinned `lake build`, proof-hole scan, all independent finite checkers); [finite run 38967576644 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38967576644). `#print axioms` for all four new public declarations contains only `propext`, `Classical.choice`, `Quot.sound`.** Exact-source strict Lean **PASS** 38967576459 and finite **PASS** 38967576644 certify both S017 event counts. The four new `#print axioms` show only the three allowed standard axioms, with no `sorryAx`. [Source and mathematical proof note](../research/S017_UNIVERSAL_OVERLAP_AND_TRIPLE_FIBRES.md).

## Open mathematics
The real unordered GraphMIS first, second and third moment double-counting, exact four-term probability distribution and P₃ sharp iff spider are **not** yet Lean formalised end-to-end. The S017 triple event is a *prescribed triple* event, not the graph aggregate h/315. The classical arbitrary-cap normal form has not been imported as an axiom. No claims of novelty priority, PR merge, Palomar entry, arXiv or journal submission.

## Handover
[S018](../research/NEXT_SESSION_PROMPT.md) is installed automatically. It builds directly on this verified S017 source and attacks genuine graph MIS moments and the complete flagship theorem. S018 has not been executed.
