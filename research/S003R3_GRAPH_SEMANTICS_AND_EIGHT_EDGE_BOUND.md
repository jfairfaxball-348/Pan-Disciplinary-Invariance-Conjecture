# PDIC S003R3 — semantic bridges and eight-edge exclusion

2026-10-15. This note distinguishes **written mathematical proofs**, **strict Lean obligations**, and **independent finite tests**. The complete SimpleGraph theorem and random labelling law remain outside the current Lean boundary.

## 1. The missing eight-edge exclusion (direct proof)

Let M be any Boolean 4×4 bipartite adjacency matrix. For a two-element left set X to be the left side of a mixed maximal independent four-set, its neighbour union N(X) must have size two; its unique possible opposite pair is B\\N(X), and each left vertex outside X must meet B\\N(X). Denote the number of such X by b(M) and the number of ones by e(M).

**Theorem. If e(M) ≥ 8, then b(M) ≤ 2**, without assuming connectivity.

If any left vertex has degree at least three, no qualifying pair can contain it. To have three qualifying left pairs, exactly one vertex can have degree ≥3 and all three pairs of the remaining vertices must qualify. As in the direct S003R2 proof, this forces the remaining three vertices to be degree-one leaves with three distinct singleton neighbours. The hub has degree at most four; thus e(M) ≤ 4+1+1+1=7, a contradiction.

Otherwise every left vertex has degree at most two. The edge lower bound e(M)≥8 forces all four left degrees to equal two. A qualifying pair {i,j} must then have exactly the same two-element neighbourhood for i and j (because their union has two elements). Partition the four rows into classes by their common neighbourhoods. A class of size at least three contributes *no* qualifying pair, since for two chosen rows, a third identical row outside X has no neighbour in B\\N(X). Therefore only classes of size exactly two can supply candidates, each contributing at most one, and there can be at most two such classes. Hence b(M)≤2. QED.

This improves the earlier matrix certificates in exactly the range needed for the graph flagship. The independent 65,536-matrix check gives maximum b by e=8,…,16 of 2,2,1,1,1,0,0,0,0 respectively. The corresponding new Lean theorem is `eight_edges_at_most_two_mixed_BV`; its final certificate status must be determined from hosted CI, not from this note.

## 2. Lossless four-row encoding and witness cardinalities

Let M : Fin 4 → Fin 4 → Bool. Define its encoded row i by the four-bit OR of 1,2,4,8 according to the truth values M(i,0),…,M(i,3). Bit extraction at column j gives exactly M(i,j). Consequently decoding the four rows is the identity on arbitrary 4×4 Boolean matrices: there is no hidden assumption that a row encoding corresponds to an actual graph.

For any two-element X⊆A, the other side of a mixed MIS is uniquely Y=B\\N(X); it exists exactly if |B\\N(X)|=2 and every i∈A\\X has a neighbour in that Y. Counting eligible X therefore counts the actual *distinct* mixed MIS witnesses, with no accidental double counting. The new Lean declarations are `encodeFourBools_get`, `adjOfRows_rowsOfAdj`, `rowsOfAdj_injective`, `exists_mixed_iff_criterion`, `actualMixedLeftPairCount_eqCriterion`, and `encoded_mixed_left_count`.

**Exact boundary:** This establishes lossless Boolean encoding and the existential/cardinality criterion. It does **not** yet prove in Lean that the particular numerical `fourRowMixedCountBV` equals `actualMixedLeftPairCount` for every adjacency; the six-pair counting identity is the missing executable-to-Prop equality. Nor has the `SimpleGraph (Fin 8)` graph-isomorphism theorem been formally derived. Those must not be silently inferred from a computed census.

## 3. Abstract connected-graph reduction (written proof)

Let G be connected on eight vertices and h be the number of compatible triples of four-element maximal independent sets, as in the S002 theorem. If h>0, one compatible triple includes two disjoint four-MIS S,T. They partition V, and there are no edges within either set. Thus G is bipartite with a balanced 4+4 partition. A connected bipartite graph has a unique bipartition up to swapping colours, so {S,T} is the only possible complementary independent four-set pair. Both S,T are maximal because no vertex is isolated. Every compatible triple is then {S,T,R} with R a mixed four-MIS, and conversely each mixed four-MIS supplies a compatible triple. Therefore **h=b(M)** for the bipartite adjacency matrix M.

Connectivity gives e(M)≥7. If e≥8, the new exclusion gives b≤2. If e=7, the prior seven-edge theorem says b=3 exactly for a spider matrix, and the general six-edge threshold already rules out b≥4. Hence h≤3, and h=3 precisely for the connected eight-vertex spider S(2,2,2,1). When h=0, the inequality is immediate. This is a **classical written theorem** here; the formal Lean bridge must still construct the bipartition and the h↔b bijection and transfer the spider pattern to graph isomorphism.

## 4. The exact probability boundary

The previously derived uniform atom-partition sample space has 8!/(2!)^4=2520 members and a prescribed compatible ordered triple has eight favourable assignments; the written triple law is 1/315. In combination with h≤3 it yields Pr(N0=3)≤1/105 and equality at the spider, relying on the specified external nine-cap classification to reach arbitrary admissible caps.

The **actual** finite-sample probability operator, the correspondence from 8-vertex permutations to atom partitions with constant size-16 fibres, the full first/second/third moments, and the resulting distribution formula are not Lean proved in this session. In particular, the existing rational moment inversion is conditional algebra and not a replacement for sampling semantics.

## 5. Next formalisation obligations

1. In Lean, identify the six `goodLeftPairBV` tests with `mixedPairCriterion` and show `fourRowMixedCountBV.toNat = actualMixedLeftPairCount`. Identify `fourRowEdgeCountBV.toNat` with the actual finite bipartite edge count.
2. Bridge a connected `SimpleGraph (Fin 8)` with a compatible triple to the uniquely determined 4+4 matrix, prove h=b and spider-isomorphism, then transfer the strict matrix certificates.
3. Build real finite permutation/atom-partition probability semantics and prove the three moments. Retain the classical nine-cap external input and novelty audit.

No Palomar, arXiv, journal or external correspondence action is implied.
