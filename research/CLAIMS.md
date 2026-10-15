# PDIC claim register — S003R (2026-10-15)

| Claim | Status | Boundary |
| --- | --- | --- |
| 702 admissible eight-caps / unique orbit / C4 zero-quartets | PROVED_WITH_CLASSICAL_INPUT | Follett et al. (2014), Prop. 2.2. Not all-caps Lean classification. |
| Exact N0 distribution of zero four-MIS, connected G | PROVED_WITH_CLASSICAL_INPUT, NOT FULLY LEAN | Uniform labelling and mixed triple moments still unformalised. |
| Sharp Pr(N0=3)≤1/105, equality iff S(2,2,2,1) | PROVED_WITH_CLASSICAL_INPUT, NOT FULLY LEAN | S002 complete written structural proof, novelty open. |
| **Six-edge threshold:** balanced 4+4 bipartite b≥4⇒e≤5 | **PROVED_WRITTEN_S003R**, FINITE_CHECKED | New degree case proof + exhaustive 65,536 matrices; not yet Lean. |
| Seven-edge b=3 iff labelled spider | PROVED_WRITTEN_S002 plus FINITE_CHECKED_S003R | 192 labelled cases; universal graph-isomorphism Lean statement missing. |
| Every-adjacency isMIS4Bool ↔ IsMIS4 | LEAN_KERNEL_CHECKED_S003R | Run 38794729250 at d5963646; standard Lean axioms. |
| Propositional spider counts (all 4-MIS=9, mixed=3) | LEAN_CANDIDATE_S003R | New source; requires final successful CI validation. |
| h≤3 ⇒ h/315≤1/105, equality iff h=3 | LEAN_CANDIDATE_S003R | Conditional arithmetic, not graph extremality. |
| Concrete cap/quartet/spider Boolean counts and moment inversion | LEAN_KERNEL_CHECKED_S003 | Prior run 38788657458; no universal probability law. |
| Greedy zero-charge transfer | PROVED_WITH_CLASSICAL_INPUT | Graph must have an edge; nonzero uniformity requires random cap. |
| Signed mod-three three-channel pebble conservation | PROVED_ELEMENTARY | No reachability or stackability implied. |
| Universal connected graph b≤3 + equality iff spider in Lean | OPEN | S003R2 graph reduction and threshold proof. |
| Joint 2,520-labelling-fibre full probability law in Lean | OPEN | Must prove actual moments, not assume them. |
| Manuscript/novelty/peer review | NOT_STARTED / OPEN | S004 conditional only. |

Details: [S003R edge proof](S003R_EDGE_THRESHOLD_PROOF.md), [S002 proof](S002_GREEDY_CHARGE_SPIDER_PROOF.md), [Lean code](../PDIC.lean), [session closeout](../sessions/S003R_CLOSEOUT.md).
