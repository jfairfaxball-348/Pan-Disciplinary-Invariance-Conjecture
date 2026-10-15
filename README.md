# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** combine finite-group zero-sum geometry, maximal-independent-set structure, random greedy graph dynamics and signed pebbling residues in precisely stated results; formalise the graph–quartet flagship before a primary-source novelty audit and manuscript.

**Status (2026-10-15): S003R executed, PARTIAL Lean completion; S003R2 next.** The name is an aspirational umbrella, not a proved universal pan-disciplinary conjecture.

## Main result (written proof, classical cap input)

For a connected eight-vertex graph G, a uniformly random labelling by a fixed admissible eight-cap U, and N0 the number of zero-charge maximal independent four-sets: write m for the four-MIS count, n0 and n2 for overlap-0 and overlap-2 unordered pair counts, and h for the compatible triple count. With M1=2m/35, M2=2n0/35+n2/315, M3=h/315, the exact law is

- Pr(N0=0)=1−M1+M2−M3
- Pr(N0=1)=M1−2M2+3M3
- Pr(N0=2)=M2−3M3
- Pr(N0=3)=M3≤1/105, equality iff the spider S(2,2,2,1).

This is an S002 written result **dependent on the explicitly cited classical nine-cap classification**, not yet a fully verified Lean flagship; novelty remains OPEN.

## S003R mathematical improvement

**New six-edge threshold, written proof:** for any balanced 4+4 bipartite graph (even disconnected), if it has at least six edges, its number b of mixed four-vertex maximal independent sets is at most three. Equivalently b≥4 forces at most five edges. Independently enumerating all 65,536 4×4 matrices gives exactly 192 labelled seven-edge equality spiders, with two distinct counting methods agreeing. See [proof](research/S003R_EDGE_THRESHOLD_PROOF.md) and [checker](scripts/verify_s003r.py). Finite enumeration is **not** a Lean proof.

## Formalisation status

The pinned Lean module [PDIC.lean](PDIC.lean) now adds the arbitrary-adjacency equivalence of executable and propositional four-MIS predicates, proposition-level spider count lemmas, and the **conditional** sharp rational inequality bridge. The generic equivalence passed [hosted kernel CI at d5963646](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38794729250), standard axioms only; the final S003R corollaries must also pass a completed CI run before receiving a kernel-checked claim.

**Still missing in Lean:** the universal edge-threshold/connected-graph extremiser, isomorphism equality statement, connected-bipartition correspondence, and the 2,520-fibre joint-label moment theorem. These are not implied by spider example counts or moment inversion alone.

## Short accelerated roadmap

| Session | Milestone | Status |
| --- | --- | --- |
| S001 | Cap orbit / C4 quartet geometry from classical nine-cap theorem | Written DONE |
| S002 | Full zero-witness law and unique spider extremiser | Written DONE |
| S003 | Pinned Lean + finite quartet/spider/moment package | PARTIAL Lean verified |
| S003R | Generic MIS semantics + stronger six-edge threshold | DONE, flagship Lean PARTIAL |
| S003R2 | Kernel-prove graph universal bound and exact random-label law | NEXT |
| S004 | Actual-source novelty audit and TeX manuscript | CONDITIONAL |

**Next:** [S003R2 complete proof prompt](research/NEXT_SESSION_PROMPT.md). A single "run next session" authorises exactly S003R2. No Palomar, arXiv or journal submission is authorised.

Sources: [S002 proof](research/S002_GREEDY_CHARGE_SPIDER_PROOF.md) · [S003R proof](research/S003R_EDGE_THRESHOLD_PROOF.md) · [S003R closeout](sessions/S003R_CLOSEOUT.md) · [claims](research/CLAIMS.md) · [provenance](research/PROVENANCE_AND_SOURCES.md).

Reproduce with pinned `lake build` and the Python verifiers in `scripts/`. Neither CI nor exhaustive finite testing establishes literature priority.
