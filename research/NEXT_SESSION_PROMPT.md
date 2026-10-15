# PDIC-S003R3 — COMPLETE THE GRAPH–QUARTET SEMANTIC BRIDGES

**STATUS: PREPARED; NOT EXECUTED.** The next owner's "run next session" authorises exactly S003R3. Do not start S004 manuscript until the key mathematical statement is genuinely formalised, or explicitly preserve unresolved steps.

## Verified starting point

Repo: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture.
Read AGENTS.md; authoritative/STATE.json; sessions/S003R2_CLOSEOUT.md; research/CLAIMS.md; research/FLAGSHIP_THEOREM.md; research/S003R2_SPIDER_CLASSIFICATION_AND_FIBRES.md; research/S002_GREEDY_CHARGE_SPIDER_PROOF.md; research/PROVENANCE_AND_SOURCES.md; and PDIC.lean.

S003R2 has axiom-free, quantified **16-bit matrix** Lean theorems:
* `mixed_opposite_unique`, `mixed_iff_complement_criterion`: arbitrary 4×4 Bool matrix propositional maximality/unique opposite pair.
* `four_by_four_six_edge_threshold_BV`: four or more qualifying A-pairs imply at most five edges.
* `seven_edge_three_iff_spider_BV`: exactly seven edges and three qualifying A-pairs iff row/column-hub spider pattern.
The BitVec theorems print `[propext, Quot.sound]`. Strict hosted CI uses `decide +kernel`, not compiler-axiom-dependent `bv_decide`. The handwritten direct 192 count and actual 8/2520 triple-fibre combinatorics are complete; they are not yet full Lean semantics.

## Priority 1 — make matrix certificates genuine graph theorems

1. Define a total `rowsOfAdj` mapping every 4×4 Bool adjacency to four `BitVec 4` rows; **prove** its bits coincide with `adj i j`, with no unchecked decoding assumption.
2. Show `fourRowMixedCountBV` equals the cardinality of `IsMixedMIS` witnesses and `fourRowEdgeCountBV` equals actual bipartite graph edge count. Reuse the already formally established unique-complement criterion. This is the crucial formerly implicit semantic gap.
3. Lift to any connected simple graph `G : SimpleGraph (Fin 8)`. If a compatible triple exists, two disjoint four-MIS define a unique balanced bipartition (up to swap), hence h=b. Connectedness forces ≥7 edges. Prove h≤3 and h=3 iff `G` is isomorphic to the explicit eight-vertex spider (not merely that a selected graph has a certain degree sequence). Handle h=0 graph cases.
4. Attempt the strongest lemma first; do not retreat to more sample spider computations.

## Priority 2 — genuine random labelling moments

Formalise uniform bijections/atom partitions of eight vertices (2520 equally weighted unordered atom assignments), derive the 8 successful ordered atom fibres for a prescribed compatible triple, and show the actual finite probabilities M1=2m/35, M2=2n0/35+n2/315, M3=h/315. Invert moments using the existing Lean theorem to get all four probabilities and bound Pr(N0=3)≤1/105 with spider iff. Every admissible-cap result must explicitly assume/cite the external Follett et al. nine-cap classification unless independently formalised.

## Strict closeout

Run **pinned `lake build`** with shell `pipefail`; all five Python checkers; review `#print axioms` for every advertised theorem. Reject `sorryAx`, `admit`, `native_decide`, `_native.*` axioms, and unsupported external solver trust. If full graph+fibre closure cannot finish, publish exact verified partial Lean statements and identify the precise bridge, not a conditional placeholder called a theorem. Commit updated sources, claims, README, roadmap, state, closeout and **one** successor prompt. Keep S004 conditional. No Palomar, arXiv, external correspondence or journal submission without owner request.
