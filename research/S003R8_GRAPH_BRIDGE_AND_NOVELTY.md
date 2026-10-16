# S003R8: Boolean-matrix extremality, connected-graph bridge, and priority risk

Date: 2026-10-16. Research report accompanying S003R8 Lean changes on PR #3. The exact matrix-transfer candidate first appeared at commit `39490c5e1760760806259c61daf62cca0938067a`; **its Lean claims remain conditional on exact-SHA hosted CI** until certification is recorded in the final closeout. S003R7's two numerical identities passed independently at `e1253ef` (Lean run 38883050311).

## Semantic extremal statements

For an arbitrary Boolean 4 by 4 bipartite adjacency `A`, let `e(A)` be the number of occupied left/right cells and `b(A)` the number of two-element left sets `X` for which there exists a two-element right set `Y` such that `X union Y` is a **maximal** independent set in the 8-vertex bipartite graph.

The following exact implications are **mathematical consequences** of the S003R2/R3 BitVec theorems plus S003R7's *kernel-proved* mixed and edge counting identities and lossless encoding:

1. `b(A) >= 4 => e(A) <= 5`.
2. `e(A) >= 8 => b(A) <= 2`.
3. `(e(A)=7 and b(A)=3) iff A` has a row- or column-centred spider pattern: a hub of degree 4 on one side and three distinct degree-one vertices on the same side, with their neighbours different (the fourth hub-side vertex is the hub). Transpose permitted.

The bridge uses `fourRows_rowsOfAdj`, which proves `fourRows (rowsOfAdj A 0) ... (rowsOfAdj A 3) = rowsOfAdj A` by exhaustive elimination of **four indices only**. Combining `adjOfRows_rowsOfAdj`, `fourRowMixedCountBV_eq_actual`, and `fourRowEdgeCountBV_eq_actual` yields `actualCounts_eq_encoded` for *all* matrices, without re-enumerating 65,536 assignments or using a numerical oracle.

## Complete connected graph implication (written proof; SimpleGraph Lean interface OPEN)

Let G be a **connected simple graph** on eight vertices and let h count triples of *distinct* four-vertex maximal independent sets in which one complementary pair is disjoint, and the third meets each in exactly two vertices.

- If `h>0`, the disjoint pair `A,B` covers all eight vertices. Because both sets are independent, G is bipartite. Connectedness forces its proper 2-colouring to be unique up to exchange; consequently the unordered pair `{A,B}` is unique.
- Both colour classes have size four and are maximal independent: every vertex has a neighbour on the opposite side because connected G on eight vertices has no isolated vertex.
- Each contributing third four-MIS `R` meets each colour class in two vertices. Its left two-set uniquely determines its right complement (S003R2), so **h=b(A)**, exactly, not merely `h<=b(A)`. Conversely every eligible 2+2 mixed MIS contributes exactly one triple `{A,B,R}`. If G does not have such a balanced bipartition, h=0.
- A connected 8-vertex graph has at least seven edges. Therefore an h=3 graph is necessarily seven-edge, by the eight-edge bound, and is one of the spider matrices by the seven-edge equivalence. The spider has 8 vertices and 7 edges, one vertex of degree four, three disjoint length-two arms and one length-one arm, so its graph isomorphism type is `S(2,2,2,1)`.
- Conversely this spider contains exactly three 2+2 mixed maximal independent sets; hence h=3. Thus **h <= 3 with equality iff G is the spider** (written proof, using the formal finite matrix statements).

This closes the previously ambiguous **mathematical** transfer without claiming a completed Lean `SimpleGraph (Fin 8)` theorem: an actual graph/partition/map/isomorphism interface and a formal h-count remain separately open.

## Essential 3+1 and 1+3 witnesses — no false MIS partition claim

For the repository-labelled spider with hub vertex 0, four opposite vertices 4,5,6,7 and other edges 1–6,2–5,3–4, the independent four-sets `{1,2,3,7}` and `{2,4,6,7}` are **maximal**, with side splits 3+1 and 1+3 respectively. Thus a claim that all size-four MIS are just the two pure bipartition classes or 2+2 mixed sets is false, even in the equality extremiser. They do not contribute to h because their overlaps with the two pure sides are not 2+2.

Independent finite enumeration shows the spider has nine size-four MIS, split by left-side cardinality as **[1,3,3,1,1] for 0,1,2,3,4**, respectively. Its three 2+2 mixed witnesses are all and only the contributors to h.

## Exhaustive independent check (not Lean)

All `2^16=65,536` Boolean 4×4 matrices were considered; 36,317 induce connected graphs on the fixed 4+4 vertex partition. Their maximum eligible pair counts by edge number are:

| Edges | 7 | 8 | 9 | 10 | 11 | 12 | 13–16 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Maximum b | 3 | 2 | 2 | 1 | 1 | 1 | 0 |

Exactly **192** connected labelled seven-edge matrices have b=3; none with >=8 edges has b>=3. These counts independently corroborate the S003R2 spider equality theorem and S003R8 graph bridge.

## Source audit / originality boundary

- Follett, Kalail, McMahon, Pelland, Won (2014), *Partitions of AG(4,3) into maximal caps*, **Discrete Mathematics** 337, 1–8, DOI [10.1016/j.disc.2014.08.002](https://doi.org/10.1016/j.disc.2014.08.002), Prop. 2.2: the classical `AG(3,3)` nine-cap equivalence input. It does not by itself prove the graph/probability law.
- Jiuqiang Liu (1993), *Maximal independent sets in bipartite graphs*, **Journal of Graph Theory** 17, 495–507, DOI [10.1002/jgt.3190170407](https://doi.org/10.1002/jgt.3190170407), determines extremal **total** maximal-independent-set counts for bipartite graphs, including connected graphs. Potential overlap is significant; no novelty inference from a different statistic alone.
- Broader prior art on extremal independent sets in trees, connected graphs and bipartite graphs needs source-level theorem comparison. The special `b(A)` statistic, C4 cap-quartet design and full zero-witness distribution may differ, but this remains **unverified originality**.

**Paper strategy:** keep the geometrically enriched probability law and the sharp spider uniqueness together as the flagship, not the tiny 4×4 inequality alone; cite classical cap classification as explicit input and emphasize the *mixed-MIS count / cap-design probability* interaction. If the full formal graph/probability law is not ready, an accurately labelled partially formalised paper draft is possible, but neither full formalisation nor priority nor publication readiness is certified here.

No repository other than PDIC touched. No external author contact, Palomar request, arXiv or journal action.
