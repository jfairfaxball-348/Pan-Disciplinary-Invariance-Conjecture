# PDIC proof-first accelerated roadmap — S003R2 closeout (2026-10-15)

**S003R2 executed, not fully closed:** the universal 4×4 Boolean-matrix six-edge bound and seven-edge spider iff have **strict kernel-only Lean certificates** using `decide +kernel`, plus an axioms-clean generic maximality/complement lemma. Full abstract connected-graph semantics and the actual 2,520-assignment probability law remain to formalise. Keep S004 CONDITIONAL.

| Session | Deliverable | State |
| --- | --- | --- |
| S001 | Eight-cap orbit and C4 quartet profile | Written, external nine-cap classification |
| S002 | Full exact N0 law and sharp spider extremiser, pebble/greedy safeguards | Written proof with classical cap input |
| S003 | Concrete cap/quartet/spider and moment inversion in pinned Lean | Partial, kernel verified |
| S003R | Universal Boolean MIS ↔ Prop and stronger six-edge written theorem | Done |
| **S003R2** | Matrix unique-complement criterion; universal 4×4 e≥6⇒b≤3; e=7,b=3 iff spider; strict axiom audit; direct 192 proof | **DONE at matrix level**; graph/law incomplete |
| **S003R3** | Lean bridge BitVec rows ↔ mixed four-MIS ↔ SimpleGraph/connected bipartition; 2,520-fibre real probability semantics | **NEXT, targeted one-session proof closure** |
| S004 | Specialist source-level novelty check and manuscript | **CONDITIONAL**, no publication claims |

Only `propext`, `Classical.choice`, and `Quot.sound` are accepted. The two new matrix theorems report only `[propext, Quot.sound]`. A previous `bv_decide` build was discarded as compiler-axiom-dependent, despite compiling. CI must use `set -euo pipefail` and reject `_native`, `sorryAx`, custom axioms, and proof holes. A matrix encoding proof is NOT a completed mathematical-probability semantics bridge.

[Closeout](sessions/S003R2_CLOSEOUT.md) · [Next session](research/NEXT_SESSION_PROMPT.md) · [Claims](research/CLAIMS.md).
