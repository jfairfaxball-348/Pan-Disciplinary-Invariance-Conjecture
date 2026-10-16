# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** join finite-group zero-sum quartet geometry, maximal independent sets, graph extremal combinatorics, random greedy dynamics and signed pebbling invariants in a precise, formally certified first paper. The project name is aspirational, not a proven universal invariance conjecture.

**Status 2026-10-16:** **S003R6 completed with new strict-Lean-certified compositional mask and bounded-arithmetic lemmas on unmerged PR #3.** The exact individual pair mask criterion, all six two-subsets, and three-bit/five-bit natural-number no-overflow identities have passed hosted Lean checks. The crucial *six individual mask-pair↔semantic-criterion equivalences*, full numerical↔actual-MIS and edge cardinality adapters, connected graph classification and true finite probability semantics remain open. Main retains the already certified S003R3 Lean baseline; no paper or original-priority claim is made.

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
| **S003R7** | **NEXT** — six scalar mask↔mixed-MIS criterion proofs, actual matrix count adapters, then connected graph bridge |
| S004 | Conditional novelty audit and TeX manuscript |

[S003R6 closeout](sessions/S003R6_CLOSEOUT.md) · [Compositional proof notes](research/S003R6_COMPOSITIONAL_COUNTS.md) · [Claims](research/CLAIMS.md) · [Next prompt](research/NEXT_SESSION_PROMPT.md)

Reproduce with pinned `lake build`, strict `#print axioms` audit and all five checkers in `scripts/`. A `bv_decide` trial was rejected because of its compiler-native axiom; the accepted theorems use `decide +kernel`. No Palomar/arXiv/journal submission authorised.
