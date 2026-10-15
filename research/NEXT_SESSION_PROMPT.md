# PDIC-S003R2 — KERNEL-CLOSE THE UNIVERSAL GRAPH–QUARTET FLAGSHIP

**STATUS: PREPARED; NOT EXECUTED.** The owner's next "run next session" authorises exactly S003R2. The roadmap is intentionally short: do not drift to S004 manuscript before the major bound and exact distribution are formalised.

Repository: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture

## Starting state

Read AGENTS.md; README.md; ROADMAP.md; authoritative/STATE.json; sessions/S003R_CLOSEOUT.md; research/FLAGSHIP_THEOREM.md; research/S002_GREEDY_CHARGE_SPIDER_PROOF.md; research/S003R_EDGE_THRESHOLD_PROOF.md; research/CLAIMS.md; research/PROVENANCE_AND_SOURCES.md; PDIC.lean; scripts/verify_s003r.py. Inspect the latest completed Lean CI (not merely a pending build) and the `#print axioms` results.

S003R added a general Boolean/propositional four-MIS equivalence and a stronger written *six-edge threshold*:

    b(G) >= 4  =>  |E(G)| <= 5

for every balanced 4+4 bipartite graph. The 65,536-matrix two-implementation census corroborates this but is not itself the kernel theorem. The classical AG(3,3) nine-cap classification remains an explicitly cited outside input.

## Primary deliverable: full truth, not conditional placeholders

1. **Reduce 4×4 mixed MIS to six A-pairs.** Lean-formalise arbitrary Boolean 4×4 matrices, `N(X)`, and the iff criterion: two A-vertices `X` extend to a mixed MIS exactly when `|N(X)|=2` and both unselected A-vertices meet `B\\N(X)`; `Y=B\\N(X)` is unique. Link to the now-kernel-checked `isMIS4Bool_iff_IsMIS4`.
2. **Prove universal sharp combinatorics.** Formalise the S003R degree-case proof b≤3 for all 4+4 bipartite matrices with at least six edges; then the equality characterisation for the seven-edge connected case `S(2,2,2,1)`. No unproved enumeration oracle. Exhaustive `decide` is acceptable if kernel-reduced and CI passes, but do not substitute Python output for a proof.
3. **Lift to any connected 8-vertex simple graph.** A compatible disjoint pair of four-MIS gives a balanced bipartition; connectedness implies at least seven edges and bipartition uniqueness. Hence the triple-compatible count h equals b and h≤3, with h=3 iff graph is isomorphic to the spider. Prove the bridge at `SimpleGraph (Fin 8)` level (or an explicitly justified equivalent representation).
4. **Prove the complete random labelling law.** For a fixed canonical cap U0, verify the actual 2,520 unordered-atom assignment fibres and joint 8/2,520=1/315 triple event. Derive M1=2m/35, M2=2n0/35+n2/315 and M3=h/315 and apply the already proven moment inversion, rather than postulating the moments. For arbitrary admissible caps, label the external nine-cap classification as a hypothesis if not formalised.
5. **Conclude** Pr(N0=3)≤1/105 with spider iff from the **actual formalised h bound and moments**. The purely conditional rational bridge is not sufficient on its own.

Prioritise graph theorem and full distribution. If the complete package cannot be certified this session, deliver the strongest genuinely complete kernel-checked subclaims plus exact unresolved lemmas; do not falsely declare S004 ready.

## Verification and closeout

Run pinned `lake build`, all four scripts (`verify_s000.py`, `verify_s001_independent.py`, `verify_s002.py`, `verify_s003r.py`), and `#print axioms`. Check hosted Actions final conclusions against the latest source commit. Reject `sorryAx`, `admit`, `native_decide` and unapproved axioms. Commit all sources, update claims/state/roadmap/README, write the actual session report and complete next prompt. Stop after **one** session. No Palomar, arXiv or journal submission without owner instruction.

**Primary source:** Follett et al. (2014), DOI 10.1016/j.disc.2014.08.002, classical nine-cap classification. Research-commit pins are in PROVENANCE_AND_SOURCES.md.
