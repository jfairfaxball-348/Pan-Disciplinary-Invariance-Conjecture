# PDIC-S003R4 — CLOSE NUMERICAL COUNT, GRAPH AND RANDOM-LABELLING BRIDGES

**STATUS: PREPARED, NOT EXECUTED.** The next instruction “run next session” authorises exactly S003R4. Do not start S004 unless a formally and mathematically defensible flagship has truly closed; no external submissions.

## Starting point

Repo: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture, main latest S003R3 closeout. Read AGENTS, authoritative/STATE.json, research/CLAIMS.md, FLAGSHIP_THEOREM, [S003R3 proof](S003R3_GRAPH_SEMANTICS_AND_EIGHT_EDGE_BOUND.md), S002 written proof and PDIC.lean. Last verified S003R3 kernel CI is [run 38812570517](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38812570517), commit aaf21059ffb6a6df66db59755817e5ea5176a917. Revalidate latest main HEAD before work.

Existing Lean: arbitrary Boolean 4×4 row encoder with proved inverse/injective; arbitrary IsMixedMIS existential criterion and true left-pair criterion/cardinality equality; numerical BitVec matrix b≥4⇒e≤5, e=7∧b=3↔spider, **e≥8⇒b≤2**. All were hosted kernel-checked (no native evaluation trust). The new e≥8 exclusion was also proved directly in prose. **Do not misstate the still-missing numerical BV↔Prop count equality as complete.**

## Priority A — close the actual semantic count (not another sample)

1. For `adjOfRows` of four explicit BitVec rows, prove `fourRowMixedCountBV.toNat = actualMixedLeftPairCount` through the six left two-sets and `mixedPairCriterion`. Use pair-by-pair Boolean truth-table certificates if needed, or elementary finite-set counting lemmas. Ensure uniqueness of the opposite pair is used to avoid counting the same mixed MIS multiple times.
2. Prove `fourRowEdgeCountBV.toNat` is the actual number of present left-right edges (0–16; no five-bit overflow). Prove the exact relation between `rowsOfAdj` and `adjOfRows` for EVERY arbitrary Bool adjacency.
3. **Transfer**, as proper Lean theorems, b≤3 for e≥7 and b=3↔spider matrix for every arbitrary Bool adjacency, not merely the numerical BitVec statement.

## Priority B — close the flagship graph theorem

Formalise a connected `SimpleGraph (Fin 8)`, four-vertex MIS, compatible unordered triples, and show if h>0 the complementary disjoint MIS pair gives a unique balanced bipartition. Define its 4×4 adjacency and show h=b; connectedness implies ≥7 edges. Derive h≤3 and h=3 precisely when G is isomorphic to the explicit S(2,2,2,1). No substitution of the 192 labelled spider samples for a universal graph isomorphism.

## Priority C — actual probability, not just rational arithmetic

Model uniform vertex-to-eight-cap bijections via a real finite sample space. Formalise push-forward onto ordered 2-point atom partitions with 2520 equiprobable outcomes; prove the prescribed compatible triple has exactly 8 successful atom assignments (probability 1/315), plus the single/pair joint probabilities. Derive actual first three binomial moments, support N0≤3, and use already formal inversion to give the full N0 distribution and unique sharp 1/105 spider extremiser. The nine-cap classification is an EXTERNAL explicitly labelled classical assumption for all-cap claims.

## Mandatory closeout

Attempt the strongest bridge first. Run pinned `lake build` under `set -euo pipefail`, all five independent Python checkers, strict `#print axioms` scans, and inspect GitHub Actions at the final commit. If full bridge impossible in this one session, finish and publish exact *proved* partial results, pinpoint the exact unresolved Lean proposition, update claims/roadmap/state/closeout and one S003R5 prompt, **not** an invented “proof complete” claim. Keep S004 novelty/manuscript conditional. Do not touch other repos; no external submission or correspondence.
