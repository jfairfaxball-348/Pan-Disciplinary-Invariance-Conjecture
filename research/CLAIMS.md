# PDIC claim register — S003R2 (2026-10-15)

| Claim | Status | Boundary |
| --- | --- | --- |
| 702 admissible caps / unique GL(3,3) orbit / C4 quartets | PROVED_WITH_CLASSICAL_INPUT | Follett et al. 2014 nine-cap classification, not all-caps Lean |
| Canonical zero-charge quartets, C4 intersections | LEAN_KERNEL_CHECKED | Concrete canonical cap and four quartets |
| Generic Boolean 4-MIS iff paper-level Prop MIS | LEAN_KERNEL_CHECKED_S003R | All adjacency functions |
| Generic 4×4 left-pair ↔ unique complementary right-pair criterion | LEAN_KERNEL_CHECKED_S003R2 | `mixed_opposite_unique`, `mixed_iff_complement_criterion` |
| 4×4 matrix b≥4⇒e≤5 | **LEAN_KERNEL_CHECKED_S003R2** | Four row BitVec 4 inputs; `four_by_four_six_edge_threshold_BV`, `[propext, Quot.sound]`. Abstract MIS count bridge still open |
| 4×4 matrix e=7 and b=3 iff row- or column-centred spider | **LEAN_KERNEL_CHECKED_S003R2** | `seven_edge_three_iff_spider_BV`, `[propext, Quot.sound]`. Formal `SimpleGraph` isomorphism bridge open |
| Exactly 192 labelled equality matrices = 96+96 | PROVED_WRITTEN_S003R2, FINITE_CHECKED | Direct 2·4·4·3! count; count not in Lean |
| 2,520 ordered atom assignments; triple fibre 8/2520=1/315 | PROVED_WRITTEN_S003R2 | Genuine counting proof; no random-bijection Lean semantics yet |
| Complete N0 law and sharp Pr(N0=3)≤1/105 spider iff | PROVED_WRITTEN_WITH_CLASSICAL_INPUT, NOT_FULLY_LEAN | Still needs graph/bipartition bridge + actual probability moments |
| Propositional spider count 9 all-size-four MIS and 3 mixed | LEAN_KERNEL_CHECKED_S003R | Explicit labelled spider only |
| Conditional h≤3⇒h/315≤1/105 and moment inversion | LEAN_KERNEL_CHECKED | Pure arithmetic, not full random law |
| Greedy zero charge and pebble residue conservation | PROVED_WRITTEN_WITH_CLASSICAL_INPUT / ELEMENTARY | Edge and bipartiteness qualifications remain |
| Compiler-assisted `bv_decide` SAT attempt | **REJECTED_FOR_STRICT_LEAN** | Added native evaluation axiom; replaced by `decide +kernel` |
| Universal SimpleGraph 8-vertex h=b and unique graph extremiser in Lean | OPEN | S003R3 |
| Complete random-cap/2,520-fibre moment law in Lean | OPEN | S003R3 |
| Manuscript / priority / peer review | NOT_STARTED / OPEN | S004 conditional; no submissions |

See [session closeout](../sessions/S003R2_CLOSEOUT.md), [new equality proof](S003R2_SPIDER_CLASSIFICATION_AND_FIBRES.md), [Lean source](../PDIC.lean), and [next prompt](NEXT_SESSION_PROMPT.md).
