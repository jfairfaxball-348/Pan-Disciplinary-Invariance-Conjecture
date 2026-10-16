# S007 continuation — genuine unordered h(G), arbitrary graph transport and h≤3

**STRICT LEAN KERNEL VERIFIED.** Proof source `ff864170834954ef2a286afe6a6b6577ec02f986`, [hosted run 38914271558: PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558). Local pinned Lean 4.35.0-rc2 build and all seven independent checkers also pass. New declarations use only `propext`, `Classical.choice`, and `Quot.sound` (or fewer).

## Result and precise scope

For **every** connected `SimpleGraph (Fin 8)`:

    unorderedCompatibleTripleCount G ≤ 3

This is the manuscript's actual unordered compatible-triple statistic: sets of three distinct size-four maximal independent vertex sets, containing a disjoint complementary pair and a third set meeting both sides in two vertices. No bipartiteness, chosen partition, matrix representation, edge-count threshold or count identity is assumed by the public bound.

The earlier S007 partial certificate at `d05fe1e71d054fe74a52a664112b6de436e999da` was preserved. This continuation closes the exact cardinality and arbitrary-graph interfaces left open by that certificate. The previously installed S008 h-count target is therefore superseded by the named-spider equality target; S008 has **not** been executed.

## Proof chain

1. Generic `ComplementaryFourMIS`, `MixedFourMIS`, `CompatibleTriple` and `compatibleTripleCount` work on arbitrary finite simple graphs. `compatibleTriple_card` proves there are three distinct members; no ordering multiplicity is hidden in the count. `compatibleTriple_iff_unordered` and `compatibleTripleCount_eq_unordered` identify these with the existing paper-facing S007 predicates and count.
2. `disjoint_four_sets_complement` and `complementaryFourMIS_iff_disjoint` prove the complementary formulation is exactly the disjoint-four-set formulation on eight vertices. `graphMIS_iff_maximal` already establishes genuine maximality under inclusion.
3. `connected_complementaryFourMIS_unique` uses connected proper-colouring uniqueness to prove the complementary pair unique up to swap. `compatibleTripleEquiv` constructs a genuine equivalence from mixed third sets to unordered triples by `r ↦ {s,t,r}`; injectivity uses r different from both sides, and surjectivity uses the pair uniqueness. `connected_compatibleTripleCount_eq_partitionMixedCount` proves the cardinality equality.
4. `anchoredMixedThird_card` proves the two intersections force cardinality four. `unorderedCompatibleTripleCount_eq_anchored` closes the paper-facing h-to-anchored-count equality with no count hypothesis.
5. `connected_matrixGraph_pure_MIS` proves both pure sides are MIS from connectedness. `mixedFourMIS_iff_split` transfers the actual 2+2 vertex sets. `connected_compatibleTripleCount_matrix` proves h(matrixGraph A)=graphMixedCount A; its bound then reuses the S003R9 theorem.
6. `graphMIS_map_iff`, the complementary/mixed transport lemmas, `compatibleTriple_map_iff` and `compatibleTripleCount_iso` prove vertex-set, adjacency and unordered-triple transport under actual graph isomorphisms.
7. `exists_balancedSplitEquiv` constructs side enumerations using actual four-element subtype equivalences. `exists_matrixGraph_iso` constructs the Boolean adjacency **and an actual simple-graph isomorphism** from the independent partition; within-side nonedges are proved from independence. `connected_partition_h_eq_matrix` gives the explicit h=B bridge.
8. `connected_unorderedCompatibleTripleCount_le_three` splits on existence of a four-MIS partition. Absence gives h=0. Presence gives the constructed connected matrix graph, transports h and applies the certified mixed bound.

## Verification and adversarial checks

[Exact proof commit](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ff864170834954ef2a286afe6a6b6577ec02f986); [strict hosted run](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558); draft PR #4. Every new theorem and equivalence has an explicit `#print axioms` audit. Source scan rejects proof holes, custom axioms and compiler trust. Seven checkers pass; `verify_s007.py` tests direct sets-of-three semantics, anchored reconstruction, relabelling invariance, the path and star, 3+1/1+3 spider MIS, and 800 fixed-seed arbitrary/bipartite samples. A disconnected four-edge matching has multiple complementary partitions and refutes dropping connectedness from the anchored identity. These finite checks are corroboration, not the proof certificate.

## Still open

The equality **iff named graph S(2,2,2,1)** is not yet kernel closed. Matrix pattern equality is not that named graph isomorphism. Canonical cap transfer with honestly scoped classical input, the actual uniform 8! bijection model, its 16-element fibres, the binomial moments and the single four-term probability theorem remain open end-to-end. No novelty upgrade, Palomar preparation, PR merge or external submission follows from this graph-bound certificate.

Next: [S008 named-spider isomorphism](S008_NAMED_SPIDER_ISOMORPHISM_TARGET.md), installed and not executed.
