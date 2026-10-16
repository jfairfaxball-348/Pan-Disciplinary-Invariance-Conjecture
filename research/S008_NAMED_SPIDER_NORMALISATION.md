# S008: constructive named-spider isomorphism

**16 October 2026. Status: PROVED_WRITTEN + FINITE_CHECKED; universal graph-isomorphism implication still OPEN_IN_LEAN.** The following is the missing structural proof, not an axiom or a Lean certification.

## Mathematical claim

For every connected graph G on eight vertices, the genuine unordered compatible triple count h(G) is at most three (S007 LEAN_KERNEL_VERIFIED), with equality exactly when G is isomorphic to the named spider with edges 04, 05, 06, 07, 16, 25, 34.

S007 transforms a complementary four-MIS pair into a lossless 4×4 matrix graph and proves h(G) equals the mixed-MIS count B(A). If h(G)=3, a triple exists and hence so does a complementary pair. For connected G, at least seven edges exist. The strict S003R9 pattern theorem classifies all equality matrices: one row of four ones and three other rows of distinct singleton support, OR one column of four ones and three other columns of distinct singleton support.

**Explicit row-centred isomorphism:** Let r be the full row, let i1,i2,i3 be the other rows in increasing order and let j1,j2,j3 be their distinct unique adjacent columns. Write j* for the missing column. The permutation of the eight split vertices sends r to 0, i1,i2,i3 to 1,2,3, j1,j2,j3 to 6,5,4, and j* to 7. Its edge image is exactly 04,05,06,07,16,25,34. It preserves all nonedges because all seven edges were listed. **Column-centred case:** transpose the roles of rows and columns, and use precisely the same mapping. Both are actual simple-graph isomorphisms, not just matrix equivalences.

**Converse:** The canonical matrix has row 0 all ones and rows 1,2,3 singletons in columns 2,1,0, respectively. It has three mixed-MIS witnesses. Its explicit vertex correspondence is left i ↦ i and right j ↦ 4+j. Connectedness and the certified S007 cardinality bridge give h=3. Isomorphism invariance transfers this property to the named graph.

The spider has legitimate 3+1 and 1+3 size-four maximal independent sets; the proof does not falsely discard them.

## Independent finite audit

The S008 standalone script at scripts/verify_s008.py checks all 65,536 4×4 matrices. Exactly 96 row-hub and 96 column-hub matrices satisfy the pattern. For every such matrix the constructive 8-vertex permutation above is bijective and preserves all 28 possible unordered vertex pairs, including nonedges. This is **FINITE_CHECKED corroboration**, not a kernel proof of the quantified normalization.

## Lean-critical interface still to close

Formalise, rather than assume, the arbitrary-pattern implication:

  spiderMatrixBV (rowsOfAdj A 0) (rowsOfAdj A 1) (rowsOfAdj A 2) (rowsOfAdj A 3) = true
    -> Nonempty (matrixGraph A ≃g namedSpider).

Then compose it with connected_partition_h_eq_matrix and connected_graphMixedCount_three_iff_pattern to prove, for arbitrary connected G on Fin 8,

  unorderedCompatibleTripleCount G = 3 <-> Nonempty (G ≃g namedSpider).

An intended new Lean converse is namedSpider_unorderedCompatibleTripleCount_three; it must pass exact-commit hosted compilation and axiom audit before calling it LEAN_KERNEL_VERIFIED.

The four-term uniform-bijection probability law, cap transfer, and classical nine-cap interface remain OPEN_IN_LEAN. Palomar is paused. Novelty remains unresolved.
