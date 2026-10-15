# PDIC proof-first roadmap (2026-10-15)

S003R executed: a new written six-edge threshold was proved for balanced bipartite graphs, an independent all-matrix audit was installed, and the first general Boolean/Prop four-MIS correspondence was kernel checked. Full flagship Lean verification remains open. **Next: S003R2**; do not start S004 while major graph/moment statements are missing.

| Stage | Deliverable | Status |
| --- | --- | --- |
| S001 | 702-cap orbit from classical classification; C4 quartet incidences | DONE written, classical input |
| S002 | Exact N0 law; sharp 1/105 spider iff; greedy/pebble safeguards | DONE written, classical input |
| S003 | Pinned Lean, concrete cap/quartet/spider and conditional moment certificates | PARTIAL Lean kernel verified |
| S003R | All-adjacency Boolean MIS equivalence; conditional sharp arithmetic; stronger b≥4⇒e≤5 theorem | Executed, Lean PARTIAL |
| S003R2 | Kernel proof of 4×4 pair criterion, b≤3 at e≥6, seven-edge spider equality, graph bipartition reduction, and exact 2,520-atom-fibre N0 law | NEXT |
| S004 | Specialist novelty audit, source comparison and publishable manuscript | CONDITIONAL |

**Separation of statuses.** The S003R six-edge theorem has a genuine written degree-case proof plus two-method enumeration; it is not a Lean theorem. Existing Lean spider counts do not imply the universal sharp bound. Rational inversion and the conditional h≤3 arithmetic bridge do not imply actual probability moments. Classical nine-cap classification is not formalised; all abstract-cap theorems must retain that input visibly.

No `sorry`, `admit`, `native_decide` or custom axioms; review `#print axioms` and completed GitHub Actions run on the **actual source commit**. [Session report](sessions/S003R_CLOSEOUT.md) · [Next prompt](research/NEXT_SESSION_PROMPT.md).
