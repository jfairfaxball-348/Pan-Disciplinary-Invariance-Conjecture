# PDIC claim register — S003R4 (2026-10-15)

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
| S003R4 Lean finite Boolean domination and count candidates | **PR #3 UNMERGED; FIRST LEAN BUILD FAILED; REPAIR UNDER TEST** | First failure: automatic Decidable missing; repaired with explicit constructive Bool predicate, final kernel PASS unobserved; do NOT cite finite workflow as Lean certification |
| Numerical BV-count ↔ actual mixed-MIS witness cardinality | **OPEN_IN_LEAN** | `fourRowMixedCountBV.toNat = actualMixedLeftPairCount` not proved |
| Numerical BV-edge-count ↔ actual matrix edge cardinality | **OPEN_IN_LEAN** | Exact `fourRowEdgeCountBV.toNat` bridge not proved |
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

See [S003R4 closeout](../sessions/S003R4_CLOSEOUT.md), [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), and [prior S003R3 closeout](../sessions/S003R3_CLOSEOUT.md), [new eight-edge and semantic proof](S003R3_GRAPH_SEMANTICS_AND_EIGHT_EDGE_BOUND.md), [Lean source](../PDIC.lean), and [next prompt](NEXT_SESSION_PROMPT.md).
