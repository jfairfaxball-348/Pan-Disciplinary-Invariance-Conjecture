# PDIC claim register — after S003 (2026-10-15)

| Claim | Status | Boundary |
| --- | --- | --- |
| 702 admissible eight-caps, single GL(3,3) orbit, canonical quartet C4 geometry | PROVED_WITH_CLASSICAL_INPUT | Follett et al. (2014) Prop. 2.2; universal cap classification not re-proved in PDIC Lean. |
| Exact pair/triple quartet incidence, joint triple law 1/315 | PROVED_WITH_CLASSICAL_INPUT | S001/S002 written proof; finite incidence fragment in PDIC.lean. |
| N0 distribution for four-MIS on any connected 8-graph | PROVED_WITH_CLASSICAL_INPUT, **NOT FULLY LEAN FORMALISED** | General random permutation-fibre count absent from Lean. |
| Pr(N0=3)≤1/105 equality iff spider S(2,2,2,1) | PROVED_WITH_CLASSICAL_INPUT, **NOT FULLY LEAN FORMALISED** | S002 structural proof plus exhaustive Python corroboration; universal graph bound/equality remains a Lean obligation. |
| Quartet cardinalities, pair overlaps and ordered pair/triple incidence counts | LEAN_KERNEL_CHECKED_S003 | Actions run 38788657458 PASS; standard axioms only in audited theorem closure. |
| Concrete quadratic eight-cap zero quartets | LEAN_KERNEL_CHECKED_S003 | Computable mod-three certificate, PASS run 38788657458; no whole-orbit classical classification. |
| Labelled spider's 9 four-MIS and 3 mixed four-MIS | LEAN_KERNEL_CHECKED_S003 | Kernel-checked labelled example; does not imply the all-graphs extremal bound. |
| Four-point binomial moment inversion | LEAN_KERNEL_CHECKED_S003 | Kernel-checked conditional algebra lemma, not the full random witness law. |
| Greedy zero-charge transfer | PROVED_WITH_CLASSICAL_INPUT | At least one edge mandatory; otherwise edgeless counterexample. |
| Signed three-channel mod-three pebble residue conservation | PROVED_ELEMENTARY | No reachability or stackability. |
| Exact 702*24!/(3!)^8 sequence count | CONDITIONAL_ON_PINNED_SOURCE_CLASSIFICATION | Inverse-zero-sum 24-term inner-joint meaning retained. |
| S003 full flagship Lean proof | OPEN | S003R next: Boolean MIS iff, all connected graph cases, equality graph isomorphism, label-permutation distribution. |
| Novelty and journal significance | OPEN | Specialist design and maximal independent set primary-source audit. |
| Preprint/manuscript | NOT_STARTED | S004 conditional, no external submission. |

Consult [S003 closeout](../sessions/S003_CLOSEOUT.md), [S002 proof](S002_GREEDY_CHARGE_SPIDER_PROOF.md), and [Lean source](../PDIC.lean).
