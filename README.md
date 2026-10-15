# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** combine finite-group zero-sum geometry, random graph algorithms, conserved tree-pebbling residues, and witness-hypergraph topology into substantive new-looking *fully proved* finite theorems; formalise in Lean 4 and write an honest manuscript on the accelerated four-session roadmap.

**Status (2026-10-15): S002 complete.** Using the cited classical classification of nine-caps in AG(3,3), S001 established a 702-cap orbit, its four-quartet C4 witness geometry, and a joint-overlap law. S002 proved a **complete exact distribution for the number of zero-charge size-four maximal independent sets** in connected eight-vertex graphs and the **sharp bound Pr(N0=3)<=1/105, with equality iff the spider S(2,2,2,1)**. S002 also proved the greedy zero-charge law (for graphs with at least one edge) and three signed pebbling-channel invariants. The mathematical proof and an independent exact-rational local verifier are available. **PDIC Lean and specialist novelty/priority checks remain open.**

## Four-session roadmap

| Session | Milestone | State |
| --- | --- | --- |
| S001 | Prove classical-input cap geometry, C4 nerve, quartet pair law and connected-graph obstruction. | **DONE** |
| S002 | Compose greedy and charge transfer; prove exact 4-MIS witness-count law and sharp spider triple-saturation theorem. | **DONE** |
| S003 | Formalise genuine theorem core in Lean 4 with no unproved placeholders or unapproved axioms; build/test, hosted CI. | **NEXT** |
| S004 | Source-level novelty/significance review, publication-quality manuscript with precise scope, TeX/PDF if feasible. | **CONDITIONAL** |

Four sessions is an aggressive target, not a promise of formalisation/novelty. The umbrella name PDIC remains aspirational; no all-dimensional pan-disciplinary invariance conjecture, sunflower, Collatz, Davenport, HHA or TreeStack theorem is claimed resolved.

**Next session:** [Full runnable S003 Lean handoff](research/NEXT_SESSION_PROMPT.md). Execution: owner's "run next session" authorises exactly the named next session, with no additional confirmation, and never automatically advances another session.

**Primary S002 results:** [Written structural proof](research/S002_GREEDY_CHARGE_SPIDER_PROOF.md) · [Frozen target](research/FLAGSHIP_THEOREM.md) · [Claim register](research/CLAIMS.md) · [S002 closeout](sessions/S002_CLOSEOUT.md) · [Provenance and literature](research/PROVENANCE_AND_SOURCES.md).

**Reproduce:** `python3 scripts/verify_s000.py`, `python3 scripts/verify_s001_independent.py`, `python3 scripts/verify_s002.py`. These are finite checks, not Lean verification or novelty certificates. The GitHub Actions workflow runs all three; consult the actual hosted run conclusion before claiming hosted PASS.

The routine random-bijection mixture is supporting arithmetic, not the claimed originality target. The first-paper tentative title is *Zero-sum quartet witnesses and sharp saturation on eight-vertex graphs*.
