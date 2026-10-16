# PDIC claim register — S003R6 (2026-10-16)

| Claim | Status | Boundary |
| --- | --- | --- |
| 702 admissible caps / unique GL(3,3) orbit / C4 quartets | PROVED_WITH_CLASSICAL_INPUT | Follett et al. 2014 nine-cap classification, not all-caps Lean |
| Canonical zero-charge quartets, C4 intersections | LEAN_KERNEL_CHECKED | Concrete canonical cap and four quartets |
| Generic Boolean 4-MIS iff paper-level Prop MIS | LEAN_KERNEL_CHECKED_S003R | All adjacency functions |
| Generic 4×4 left-pair ↔ unique complementary right-pair criterion | LEAN_KERNEL_CHECKED_S003R2 | `mixed_opposite_unique`, `mixed_iff_complement_criterion` |
| 4×4 matrix b≥4⇒e≤5 | **LEAN_KERNEL_CHECKED_S003R2** | Four row BitVec 4 inputs; `four_by_four_six_edge_threshold_BV`, `[propext, Quot.sound]`. Abstract MIS count bridge still open |
| 4×4 matrix e=7 and b=3 iff row- or column-centred spider | **LEAN_KERNEL_CHECKED_S003R2** | `seven_edge_three_iff_spider_BV`, `[propext, Quot.sound]`. Formal `SimpleGraph` isomorphism bridge open |
| Lossless Boolean adjacency → 4 BitVec rows and inverse/injective | **LEAN_KERNEL_CHECKED_S003R3** | `adjOfRows_rowsOfAdj`, `rowsOfAdj_injective`, arbitrary Bool adjacency; approved hosted CI |
| Mixed-MIS left-pair existential and criterion **cardinality** equality | **LEAN_KERNEL_CHECKED_S003R3** | `actualMixedLeftPairCount_eqCriterion`; unique opposite-side criterion; numerical BV counting identity remains OPEN |
| Matrix e≥8⇒b≤2 | **LEAN_KERNEL_CHECKED_S003R3** | `eight_edges_at_most_two_mixed_BV`, exact universal 4×4 BitVec statement; passed strict CI 38812570517 |
| S003R4 written BitVec six-pair count equals actual mixed-MIS witness count, and five-bit edge count equals actual 16-edge count | **PROVED_WRITTEN / FINITE_CHECKED; LEAN NOT YET VERIFIED** | [S003R4 note](S003R4_NUMERICAL_SEMANTIC_BRIDGES.md) on PR branch; no-overflow argument; independent 65,536 checks |
| S003R4 Lean finite Boolean domination and count candidates | **PR #3 UNMERGED; S003R5 SMALL LEMMA REPAIR PASSED** | S003R4 global reduction failed/was terminated; S003R5 smaller corrected source `ad39aec` passed strict Lean at 38862718980. This certifies only the smaller declared lemmas, not the discarded global numerical equality |
| **S003R5 constructive Bool pair criterion ↔ Prop and computable pair-filter cardinality ↔ actual mixed-MIS witness count** | **LEAN_KERNEL_CHECKED_ON_UNMERGED_PR3** | Exact HEAD `ad39aec`, Lean PASS run 38862718980; no forbidden axioms; `mixedPairCriterionBool_iff`, `computableMixedLeftPairCount_eq_actual`. Does NOT imply six numerical BitVec test equivalence |\n| **S003R5 four-bit mask row popcount, exactly-two neighbour masks, nonzero outside-mask ↔ witness column** | **LEAN_KERNEL_CHECKED_ON_UNMERGED_PR3** | `fourBitPopCount5_eq_rowCard`, `twoNeighboursBV_eq_rowCard_two`, `outsideMask_nonzero_iff`; strict CI PASS 38862718980, five Python verifiers PASS |\n| Numerical BV-count ↔ actual mixed-MIS witness cardinality | **OPEN_IN_LEAN** | `fourRowMixedCountBV.toNat = actualMixedLeftPairCount` not proved |
| Numerical BV-edge-count ↔ actual matrix edge cardinality | **OPEN_IN_LEAN** | Local per-row identity is certified, but four-row no-overflow sum and actual edge cardinality adapter still open |
| Exactly 192 labelled equality matrices = 96+96 | PROVED_WRITTEN_S003R2, FINITE_CHECKED | Direct 2·4·4·3! count; count not in Lean |
| 2,520 ordered atom assignments; triple fibre 8/2520=1/315 | PROVED_WRITTEN_S003R2 | Genuine counting proof; no random-bijection Lean semantics yet |
| Complete N0 law and sharp Pr(N0=3)≤1/105 spider iff | PROVED_WRITTEN_WITH_CLASSICAL_INPUT, NOT_FULLY_LEAN | Still needs graph/bipartition bridge + actual probability moments |
| Propositional spider count 9 all-size-four MIS and 3 mixed | LEAN_KERNEL_CHECKED_S003R | Explicit labelled spider only |
| Conditional h≤3⇒h/315≤1/105 and moment inversion | LEAN_KERNEL_CHECKED | Pure arithmetic, not full random law |
| Greedy zero charge and pebble residue conservation | PROVED_WRITTEN_WITH_CLASSICAL_INPUT / ELEMENTARY | Edge and bipartiteness qualifications remain |
| Compiler-assisted `bv_decide` SAT attempt | **REJECTED_FOR_STRICT_LEAN** | Added native evaluation axiom; replaced by `decide +kernel` |
| Universal SimpleGraph 8-vertex h=b and unique graph extremiser in Lean | OPEN | S003R4 |
| Complete random-cap/2,520-fibre moment law in Lean | OPEN | S003R4 |
| Manuscript / priority / peer review | NOT_STARTED / OPEN | S004 conditional; no submissions |

See [S003R5 closeout](../sessions/S003R5_CLOSEOUT.md), [S003R5 decomposed proof](S003R5_PROOF_DECOMPOSITION.md), [S003R4 closeout](../sessions/S003R4_CLOSEOUT.md), [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), and [prior S003R3 closeout](../sessions/S003R3_CLOSEOUT.md), [new eight-edge and semantic proof](S003R3_GRAPH_SEMANTICS_AND_EIGHT_EDGE_BOUND.md), [Lean source](../PDIC.lean), and [next prompt](NEXT_SESSION_PROMPT.md).

## S003R6 audit addendum (2026-10-16)

| Claim | Status | Exact limit |
| --- | --- | --- |
| One-pair `goodLeftPairBV_spec` iff two-neighbour mask and two outside witnesses | **LEAN_KERNEL_CHECKED_ON_PR3_2bfb316** | All four BitVec rows; exact Lean [run 38871115121](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38871115121) |
| OR-mask bit correspondence; six distinct two-subsets of `Fin 4` | **LEAN_KERNEL_CHECKED_ON_PR3_2bfb316** | `orMask_getLsbD_iff`, `sidePairsSix_eq_filter`, `sidePairsSix_card` |
| Three-bit six-indicator sum equals exact natural sum | **LEAN_KERNEL_CHECKED_ON_PR3_2bfb316** | `sixBooleanIndicatorCount`, `fourRowMixedCountBV_eq_sixNat`; at most six, no wrap |
| Four five-bit row popcounts sum to exact natural sum | **LEAN_KERNEL_CHECKED_ON_PR3_2bfb316** | `fourSmallBVSum_noOverflow`, `fourRowEdgeCountBV_eq_fourPopNat`; each at most four |
| Arbitrary Boolean predicate's six two-subset filtered-cardinality identity | **OPEN_IN_LEAN / FAILED_TRIAL_WITHDRAWN** | `sixPairsBoolCardinality` simplifier exceeded recursion limit on commits `25f4c628` and `540e1329`; neither is certified, both withdrawn from PR HEAD `30ac30c0` |
| Exact `fourRowMixedCountBV.toNat = actualMixedLeftPairCount` | **OPEN_IN_LEAN** | Six scalar `goodLeftPairBV`↔`mixedPairCriterionBool` equivalences still required |
| Exact `fourRowEdgeCountBV.toNat = actualMatrixEdgeCount` | **OPEN_IN_LEAN** | Four-row filtered edge-cardinality sum adapter still required |
| General Boolean matrix transferred edge/mixed bounds and spider iff | **OPEN_IN_LEAN** | Both semantic numerical count adapters prerequisite |
| Complete graph probability law / originality | **PROVED_WRITTEN_WITH_CLASSICAL_INPUT / OPEN_IN_LEAN / NOVELTY_OPEN** | Graph isomorphism, h=b, 2520-assignments and specialist source audit remain |

This addendum is authoritative for S003R6 and supersedes older 'NEXT S003R4/S003R5' wording elsewhere. Do not claim an unverified PR candidate was kernel checked.

## S003R7 strict theorem addendum (2026-10-16)

| Claim | Certification | Exact boundary |
| --- | --- | --- |
| Generic two-row neighbourhood equals bitwise OR support and its two-column complement criterion | **LEAN_KERNEL_CHECKED_PR3_b7d55232** | [Strict CI 38879098667](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38879098667), arbitrary row map |
| Generic outside-complement witness equivalence and `goodPair_iff_mixedPairCriterion` | **LEAN_KERNEL_CHECKED_PR3_df53e200** | [Strict CI 38880618519](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38880618519), no finite 65536 case computation |
| **All six `fixedPairXXCriterion` tests** correspond exactly to semantic mixed-MIS pair criterion | **LEAN_KERNEL_CHECKED_PR3_df53e200** | [Strict CI 38880618519](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38880618519); global filtered cardinality not implied by scalar iff alone |
| Six-pair filtered-cardinality `sum_boole` aggregator | **OPEN_IN_LEAN** | `a8df4a89` failed Nat rewrite CI 38880747155; `8e76088b` repaired candidate pending exact CI; cannot promote until success |
| Full mixed-count and edge-count BV↔semantic natural-number identities | **OPEN_IN_LEAN** | Requires certified summation and edge product row decomposition; independent exhaustive Python agreement is not a Lean proof |
| Whole connected graph/probability flagship, originality, publication | **NOT_FULLY_FORMALISED / OPEN** | Graph isomorphism, 2520-bijection random law and targeted prior art remain |

## S003R7 FINAL CLAIM AUDIT — EXACT HEAD `e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca` (2026-10-16)

**THIS FINAL AUDIT SUPERSEDES PREVIOUS S003R6 AND EARLIER S003R7 OPEN-LABELS FOR THE TWO COUNT IDENTITIES.** Source: [unmerged PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) [strict hosted kernel PASS 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311); separate finite 38883050344 PASS; no forbidden axioms.

| Statement | Verified status | Boundary |
| --- | --- | --- |
| Two-row neighbourhood/OR and opposite-side witness, all six fixed left pairs | **LEAN_KERNEL_VERIFIED** | Arbitrary four-row Boolean adjacency, no global enumeration |
| `sixPairsBoolCardinality_by_sum` and `computableMixedLeftPairCount_eq_sixCriterion` | **LEAN_KERNEL_VERIFIED** | Any Boolean predicate supported on six two-subsets of `Fin 4`; five explicit sum-insert rewrites |
| `actualMatrixEdgeCount_eq_sum_rows` | **LEAN_KERNEL_VERIFIED** | Arbitrary 4×4 Boolean adjacency, Finset product/row summation |
| `fourRowMixedCountBV_eq_actual` | **LEAN_KERNEL_VERIFIED** | **All four BitVec 4 rows**; `BV.toNat` equals actual existential mixed maximal-independent-pair cardinality |
| `fourRowEdgeCountBV_eq_actual` | **LEAN_KERNEL_VERIFIED** | **All four BitVec 4 rows**; `BV.toNat` equals actual matrix edge cardinality |
| BV threshold, eight-edge exclusion and spider iff | **ALREADY_LEAN_VERIFIED_AS_BV_THEOREMS** | General Boolean-matrix statement transfer not yet separately declared and certified |
| Connected arbitrary `SimpleGraph (Fin 8)` h=b, unlabelled spider iff, genuine 2520-labelling cap probability | **OPEN_IN_LEAN** | Earlier written/finite results do not bridge full graph probability semantics |
| Prior-art novelty and paper | **OPEN / NOT SUBMITTED** | No originality claim follows from kernel verification |

All five independent finite verifiers PASS on the same PR HEAD; `#print axioms` for new count identities reports only `[propext, Classical.choice, Quot.sound]`.


## S003R8 graph/matrix transfer claim audit (supersedes prior stage markers, 2026-10-16)

| Claim | State | Boundary |
| --- | --- | --- |
| Semantic b(A)≥4 ⇒ e(A)≤5, e(A)≥8 ⇒ b(A)≤2; seven-edge three-mixed spider matrix iff | **PROVED_MATHEMATICALLY_FROM_STRICT_S003R7_BRIDGES; NEW_DECLARATIONS_CI_PENDING** | New Lean proofs on [unmerged PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), initial exact SHA f0f56b60 [strict Lean run 38886710499](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38886710499) must PASS before promotion |
| Four-row reconstruction and actual semantic count equals encoded BV count | **LEAN_DECLARATIONS_CANDIDATE** | Already kernel-verified at earlier failed-overall candidate runs as isolated declarations, final exact-head certificate required |
| Concrete spider mixed 3+1 and 1+3 four-MIS | **LEAN_DECLARATIONS_CANDIDATE** | Both isolated theorem declarations passed on earlier failed-overall runs; latest exact SHA workflow gate retained |
| Connected eight-vertex compatible triple count h=b(A), h≤3 and equality iff spider S(2,2,2,1) | **PROVED_WRITTEN / INDEPENDENT_FINITE_CHECKED; OPEN_IN_GRAPH_LEAN** | Uses unique connected balanced bipartition and previous strict finite matrix bounds; no SimpleGraph/isomorphism theorem yet |
| Complete quartet/cap N0 law, Pr(N0=3)=h/315≤1/105 | **PROVED_WRITTEN_WITH_EXTERNAL_CLASSICAL_CAP_INPUT; OPEN_IN_PROBABILITY_LEAN** | True 2520 uniform labelling model and cap equivalence not formalised |
| First full TeX research draft | **DRAFT_CREATED, NOT_SUBMITTED, NOVELTY_OPEN** | [paper/PDIC_S003R8_DRAFT.tex](../paper/PDIC_S003R8_DRAFT.tex), Liu 1993 and cap primary source checked, detailed originality comparison outstanding |

Independent 65,536-matrix check including all 36,317 connected fixed bipartition instances and 192 sharp spider matrices is **FINITE_CHECKED, not Lean**. See [S003R8 closeout](../sessions/S003R8_CLOSEOUT.md), [mathematical research note](S003R8_GRAPH_BRIDGE_AND_NOVELTY.md), [next S003R9 handoff](NEXT_SESSION_PROMPT.md). Any later exact Lean PASS certificate supersedes this candidate-status row.

## S003R8 FINAL STRICT KERNEL VERDICT — 16 October 2026 (supersedes CI_PENDING above)

**Exact [PR #3 commit `1e4cadd580b385e0d8e69e836f3211129e705839`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1e4cadd580b385e0d8e69e836f3211129e705839)**, [strict Lean 38887318919 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38887318919), [separate finite 38887318971 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38887318971). `lake build`, banned-hole/native-axiom checks, and all five independent checkers passed. New seven `#print axioms` = `[propext, Classical.choice, Quot.sound]`, with no `sorryAx`.

| Newly proved declaration | Final state | Statement scope |
| --- | --- | --- |
| `fourRows_rowsOfAdj`, `actualCounts_eq_encoded` | **LEAN_KERNEL_VERIFIED** | Every Boolean 4×4 matrix; exact reconstruction and semantic counts |
| `four_mixed_implies_at_most_five_edges` | **LEAN_KERNEL_VERIFIED** | b(A)≥4⇒e(A)≤5 for arbitrary adjacency |
| `eight_edges_implies_at_most_two_mixed` | **LEAN_KERNEL_VERIFIED** | e(A)≥8⇒b(A)≤2 for arbitrary adjacency |
| `seven_edges_three_mixed_iff_spider` | **LEAN_KERNEL_VERIFIED** | e(A)=7 ∧ b(A)=3 iff row/column spider matrix for arbitrary adjacency |
| `spider_has_three_one_mis`, `spider_has_one_three_mis` | **LEAN_KERNEL_VERIFIED** | Actual skew 3+1 and 1+3 maximal independent four-sets on labelled spider |
| Graph `SimpleGraph(Fin8)` h=b and unlabelled spider extremiser | **PROVED_WRITTEN; OPEN_IN_LEAN** | Formal graph/connected/isomorphism interface not implemented |
| Genuine uniform-2520 cap probability law, originality | **OPEN_IN_LEAN / NOVELTY_OPEN** | Draft paper exists, external cap classification, no submission |
