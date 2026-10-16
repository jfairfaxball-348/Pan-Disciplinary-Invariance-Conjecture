# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** join finite-group zero-sum quartet geometry, maximal independent sets, graph extremal combinatorics, random greedy dynamics and signed pebbling invariants in a precise, formally certified first paper. The project name is aspirational, not a proven universal invariance conjecture.

**Status 2026-10-16:** **S003R7 COMPLETED and BOTH arbitrary 4×4 numerical-to-semantic count identities are strictly kernel-verified** on unmerged PR #3 commit [`e1253ef`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca), [Lean CI 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311). The six individual mask-to-genuine-mixed-MIS pair iff lemmas, six-indicator filtered-cardinality sum, and exact matrix edge cardinality are certified with only standard axioms, alongside all five independent finite tests. Main retains the earlier S003R3 Lean baseline pending review/merge. The derived general Boolean-matrix extremal declarations, connected eight-vertex graph/spider isomorphism, genuine finite probability law and literature novelty remain open; no paper or priority claim is made.

## Written flagship (classical cap input required)

For any connected simple eight-vertex graph G, let N0 count size-four maximal independent sets whose labels sum to zero under a uniformly random bijection to a fixed admissible eight-cap. Write m for the number of four-MIS, n0/n2 for pair overlaps 0 and 2, h for compatible triples, and M1=2m/35, M2=2n0/35+n2/315, M3=h/315. The written result (depending on Follett et al.'s classical nine-cap classification) gives

Pr(N0=0)=1−M1+M2−M3; Pr(N0=1)=M1−2M2+3M3; Pr(N0=2)=M2−3M3; Pr(N0=3)=M3≤1/105, with equality iff G is the spider S(2,2,2,1).

## What is now strictly proved in Lean

- For every Boolean 4×4 bipartite adjacency, a mixed maximal independent four-set has a uniquely determined opposite two-set, given by the complement of its neighbourhood. A full iff pair criterion is formalised.
- Encoding a matrix by four `BitVec 4` rows, Lean proves **b≥4 ⇒ |E|≤5** by `decide +kernel`: `four_by_four_six_edge_threshold_BV`.
- For these same matrix predicates, **(|E|=7 and b=3) iff the row/column spider pattern**: `seven_edge_three_iff_spider_BV`. Both quantified finite theorems depend only on `propext` and `Quot.sound`; no native axiom.
- S003R3 supplies a **proved lossless arbitrary-Boolean-adjacency row encoder**, an exact existential mixed-MIS left-pair cardinality criterion, and the new **e≥8 ⇒ b≤2** universal kernel-checked matrix theorem.
- Written direct proof plus independent check splits exactly 192 labelled spider matrices into two sets of 96. The exact 2520-atom, eight-favourable-assignments combinatorics is written.

**Boundary:** the formal BitVec count has not yet been linked by a proved theorem to the cardinality of arbitrary `IsMixedMIS` sets, or to all connected `SimpleGraph (Fin 8)` and their random-cap labelling law. Concrete spider counts, the matrix certificates and conditional moment inversion do NOT yet constitute a fully Lean-formalised flagship.

## Short route

| Session | State |
| --- | --- |
| S001–S002 | Cap geometry and written graph/probability flagship, explicit classical input |
| S003–S003R | Concrete Lean certificates and generic MIS semantics |
| **S003R2** | **COMPLETE** kernel-only 4×4 matrix threshold and spider iff; direct 192/fibre proof |
| **S003R3** | **DONE, partial** — lossless row representation, actual existential witness criterion/count, e≥8⇒b≤2 in strict Lean; not yet full graph/measure bridge |
| **S003R4–S003R5** | Written numerical bridge, verified small Boolean and row-mask semantic lemmas on PR #3 |
| **S003R6** | **DONE, partial** — exact single-pair Boolean mask specification, six-pair enumeration, and no-overflow 3-bit/5-bit arithmetic certified at [CI 38871115121](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38871115121) |
| **S003R7** | **DONE, strict full numerical bridge** — all six pair semantics, exact six-indicator and row-edge sums, both arbitrary-matrix natural-number count identities [PASS 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311) |
| **S003R8** | **NEXT** — transfer three extremal matrix statements and eight-vertex graph/spider semantics; paper-positioning source audit |
| **S003R8** | **NEXT** — six-pair Nat count aggregation, edge product decomposition, full matrix theorem transfers or narrow paper fallback |
| S004 | Conditional novelty audit and TeX manuscript |

[S003R6 closeout](sessions/S003R6_CLOSEOUT.md) · [Compositional proof notes](research/S003R6_COMPOSITIONAL_COUNTS.md) · [Claims](research/CLAIMS.md) · [Next prompt](research/NEXT_SESSION_PROMPT.md)

Reproduce with pinned `lake build`, strict `#print axioms` audit and all five checkers in `scripts/`. A `bv_decide` trial was rejected because of its compiler-native axiom; the accepted theorems use `decide +kernel`. No Palomar/arXiv/journal submission authorised.

[S003R7 closeout](sessions/S003R7_CLOSEOUT.md) · [S003R7 proof notes](research/S003R7_SYMBOLIC_SEMANTIC_BRIDGE.md) · [Prepared S003R8](research/NEXT_SESSION_PROMPT.md)

**S003R7 final proof certificate:** [commit `e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca), [Lean workflow 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311), separate finite workflow 38883050344 PASS. See [full closeout](sessions/S003R7_CLOSEOUT.md) and [next S003R8 handoff](research/NEXT_SESSION_PROMPT.md).


## Current status: S003R8 completed (16 October 2026; supersedes stale NEXT S003R8 rows above)

The connected-graph **written proof** of the sharp compatible-triple witness bound `h(G)≤3`, equality iff `G≃S(2,2,2,1)`, is in [S003R8 research note](research/S003R8_GRAPH_BRIDGE_AND_NOVELTY.md). An explicit 3+1/1+3 maximal-independent-set audit prevents a false exhaustive 2+2 split claim. A [full initial manuscript draft](paper/PDIC_S003R8_DRAFT.tex) now exists, but source-level priority and end-to-end formalisation are not established.

On [unmerged PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), S003R8 adds arbitrary Boolean 4×4 matrix semantic inequalities and equality case statements, strictly dependent on the already certified S003R7 numerical bridges. **The S003R8 Lean exact-SHA CI verdict is pending** ([run 38886710499](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38886710499)); do not quote these new declarations as passed before a passing result. Main remains at the earlier Lean source baseline. The actual connected `SimpleGraph`, unlabelled spider isomorphism and 2520-atom probability law stay unformalised. [Closeout](sessions/S003R8_CLOSEOUT.md); [S003R9 prepared, not executed](research/NEXT_SESSION_PROMPT.md). No external submission or PR merge.
