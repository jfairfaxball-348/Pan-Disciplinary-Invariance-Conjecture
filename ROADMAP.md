# PDIC proof-first roadmap

**2026-10-15: S003 executed; next exactly S003R.** S002 is a complete written mathematical proof conditional on the classical nine-cap classification. Lean formalisation is a separate verification obligation.

| Session | Milestone | Status |
| --- | --- | --- |
| S001 | 702-cap orbit from classical 9-cap classification, C4 quartet incidence and joint overlap law | DONE written |
| S002 | Complete N0 zero-four-MIS count law, sharp 1/105 spider theorem, greedy zero charge and 3-channel residues | DONE written, finite corroboration |
| S003 | Pin Lean toolchain/Mathlib, create explicit finite cap/quartet/spider/conditional moment module, CI | PARTIAL: finite package kernel verified on Actions run 38788657458; full graph theorem not in Lean |
| S003R | Prove Boolean MIS correspondence, connected 4+4 bipartition reduction, universal h≤3 and equality iff spider, permutation-fibre law, full probability distribution | NEXT |
| S004 | Novelty and primary-source audit, proof/Lean comparison and TeX manuscript | CONDITIONAL |

**Separation:** A labelled spider enumeration does not prove the universal connected-graph bound. An algebraic moment inversion does not prove the random labelling moments. The concrete quadratic cap does not, by itself, certify classical classification of every admissible cap. No `sorry`, `admit`, `native_decide`, custom axiom or hidden computed oracle is acceptable in the theorem's proof closure. GitHub hosted PASS must be evidenced by a completed successful run for the relevant source commit.

**Guards:** greedy 2/35 identity requires ≥1 graph edge; fixed cap does not have uniformly distributed nonzero charges; pebbling residues do not imply stackability. Novelty is open.

[Lean source](PDIC.lean) · [S003 closeout](sessions/S003_CLOSEOUT.md) · [S003R next](research/NEXT_SESSION_PROMPT.md) · [S002 proof](research/S002_GREEDY_CHARGE_SPIDER_PROOF.md).
