# PDIC claim register — after S002 (2026-10-15)

| Claim | Status | Boundary |
| --- | --- | --- |
| All admissible eight-caps extend to nine-caps and form one GL(3,3) orbit of size 702 | PROVED_WITH_CLASSICAL_INPUT | Follett et al. (2014) Prop. 2.2 is the cited maximum-nine-cap classification; no new classification claim. |
| Exact cap zero-subset profile (1,0,0,0,4,0,0,0,1), quartet nerve C4, abstract H1=Z | PROVED_WITH_CLASSICAL_INPUT | Not a geometric nerve-lemma statement. |
| Joint zero-four-subset pair law by overlap (2/35,0,1/315,0,2/35) | PROVED_WITH_CLASSICAL_INPUT | S001 proof. |
| Joint three-zero-quartet probability 1/315 for a uniquely complementary 2+2 triple, zero otherwise | PROVED_WITH_CLASSICAL_INPUT | New S002 combinatorial count 8/(70*36). |
| For connected 8-vertex G, N0 (# zero-sum four-MIS) has exact law from m,n0,n2,h | PROVED_WITH_CLASSICAL_INPUT | Theorem C, S002 proof, full 0..3 distribution. |
| For connected 8-vertex G, Pr(N0=3)<=1/105, equality iff spider S(2,2,2,1) | PROVED_WITH_CLASSICAL_INPUT | Structural degree proof, exhaustive independent finite corroboration of 36,317 connected balanced bipartite graphs. |
| Every connected 8-vertex G has at most three zero-sum independent four-sets, with sharp tree example | PROVED_WITH_CLASSICAL_INPUT | S001 deterministic obstruction, distinct from probabilistic sharpening. |
| Random greedy law Pr(charge=0)=(2/35)Pr(|I|=4) | PROVED_WITH_CLASSICAL_INPUT_AND_ELEMENTARY_CONDITIONING | **Requires G has at least one edge**; edgeless graph counterexample Pr=1. |
| For uniform random cap every nonzero a has Pr(charge=a)=(1-(2/35)Pr(|I|=4))/26 | PROVED_WITH_CLASSICAL_INPUT_AND_GL_SYMMETRY | GL-invariant cap sampling is necessary; do not claim fixed-cap uniformity. |
| Exact greedy output permutation-fibre integral and deletion recurrence | PROVED_ELEMENTARY | Source greedy model from pinned Greedy-Uniformity-on-Trees; not uniform among MIS. |
| Three signed mod-3 pebble channel charges invariant under legal same-channel moves | PROVED_ELEMENTARY | Bipartite graph/tree only; does not imply TreeStack rooted reachability or stackability. |
| Spider S(2,2,2,1) has 9 size-four MIS and random greedy output size four a.s. | PROVED | Direct split according to whether the centre is chosen. |
| Exact 702*24!/(3!)^8 indexed 24-sequence count | CONDITIONAL_ON_PINNED_SOURCE_CLASSIFICATION | Inverse-Zero-Sum classification means inner-joint avoidance; not full short-freeness. |
| S002 source-level novelty / significance | OPEN | Specialist incidence designs, bipartite graph MIS literature (incl. Liu 1993), random greedy process audit needed in S004. |
| PDIC Lean | NOT_STARTED | S003 will build actual kernel-checked declarations, no placeholders or unapproved axioms. |
| PDIC manuscript | NOT_STARTED | S004 conditional on significance, novelty boundary explicit. |
| Local verifier scripts | PASS_LOCALLY | scripts/verify_s002.py confirmed; hosted CI separate status. |

Detailed proof: research/S002_GREEDY_CHARGE_SPIDER_PROOF.md. Prior-art context: research/PROVENANCE_AND_SOURCES.md.
