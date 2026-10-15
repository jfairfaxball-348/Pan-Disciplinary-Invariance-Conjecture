# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** combine finite-group zero-sum geometry, greedy independent sets and signed pebbling invariants into precisely scoped proved theorems, formalise the genuine graph–quartet flagship in Lean 4, then consider a manuscript only after a source-level priority audit.

**Status (2026-10-15): S003 executed, Lean flagship partially formalised; S003R next.** S001 proved the canonical cap geometry and classical-input all-caps extension. S002 wrote the complete exact zero-four-MIS distribution and the unique sharp spider bound Pr(N0=3)≤1/105 with equality precisely at S(2,2,2,1), supported by independent exhaustive finite checks. S003 installed a pinned Lean project and targeted kernel proofs of the four-quartet incidence, concrete canonical cap certificate, labelled spider count, and four-point moment inversion. **The general graph extremiser and the permutation-fibre probability distribution have NOT been proved in Lean.** The finite package **passed hosted Lean kernel CI** on source commit `6501e38c` (Actions run [38788657458](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38788657458)), with only standard axioms reported and all three Python checks PASS. This is still not a universal Lean proof of the graph flagship.

## Accelerated roadmap

| Session | Result | State |
| --- | --- | --- |
| S001 | Nine-cap-classification-dependent eight-cap rigidity; C4 quartet geometry and sharp connected-graph obstruction | DONE |
| S002 | Exact four-MIS zero-witness distribution, spider saturation equality theorem, greedy and pebbling transfer | DONE, written proof and independent finite checks |
| S003 | Lean project, finite quartet/canonical cap/spider certificates and moment inversion | PARTIAL, universal flagship remains |
| S003R | Certify full connected-graph triple bound, equality iff spider, and exact distribution in Lean | NEXT |
| S004 | Specialist novelty audit and publication-quality manuscript | CONDITIONAL |

**Next session:** [S003R proof-completion handoff](research/NEXT_SESSION_PROMPT.md). Owner saying "run next session" authorises exactly this named session and does not advance automatically.

**Sources:** [S002 proof](research/S002_GREEDY_CHARGE_SPIDER_PROOF.md), [S003 closeout](sessions/S003_CLOSEOUT.md), [S003 Lean module](PDIC.lean), [Claims](research/CLAIMS.md), [Sources](research/PROVENANCE_AND_SOURCES.md).

**Reproduction:** use `lake build` with committed `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`; three independent Python checks are `scripts/verify_s000.py`, `scripts/verify_s001_independent.py`, `scripts/verify_s002.py`. Do not confuse finite checks with Lean verification or priority.

The PDIC umbrella name remains aspirational. No general pan-disciplinary invariance conjecture, major open problem, TreeStack reachability result or publication novelty is certified.
