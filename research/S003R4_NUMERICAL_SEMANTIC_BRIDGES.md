# PDIC S003R4 — exact bridge between numerical certificates and mathematical witnesses

Date: 2026-10-15. Research note for session S003R4. Proofs below are **ordinary mathematical derivations**; Lean kernel certification is a separate CI condition. Neither a generic eight-vertex graph theorem nor an actual random-labelling theorem follows merely from these matrix calculations.

## The core bridge

Let M be an arbitrary Boolean 4×4 matrix. Write r_i as a four-bit row mask, with its jth bit set iff M(i,j)=true. This is lossless, already proved by \`adjOfRows_rowsOfAdj\`. Let

* e(M) = |{(i,j) ∈ [4]² : M(i,j)=true}|,
* b(M) = |{X ⊆ [4]: |X|=2 and ∃Y⊆[4], IsMixedMIS M X Y}|.

For each pair X={i,k}, put n=r_i OR r_k; its bits describe N(X). The unique potential Y is [4]\N(X) (already proved in \`mixed_opposite_unique\`). The left-pair criterion is equivalent to:

1. n has **exactly two** bits set, so that Y has size two;
2. for each of the other rows r_l, the mask r_l AND (NOT n) is nonzero, so its vertex has a neighbour in Y.

\`goodLeftPairBV\` is precisely this conjunction. As there are exactly six unordered two-subsets X of a four-set, the sum of the six indicator values is **exactly b(M)**. It is at most six; its BitVec 3 representation cannot overflow, as six < eight. The row-wise popcounts likewise total e(M) ≤16, so the BitVec 5 representation cannot overflow (16 < 32). These two no-overflow facts are part of the correctness argument; an arbitrary unsigned wrapped sum would not be sufficient.

Hence for all M, writing its rows as a,b,c,d,

    (fourRowMixedCountBV a b c d).toNat = b(M)
    (fourRowEdgeCountBV a b c d).toNat = e(M).

\`computableMixedLeftPairCount_eq_actual\` supplies a direct Prop-level equivalence between executable decidability of the criterion and actual existential mixed-MIS witnesses. The two universal BitVec equalities and their adapter lemmas are implemented in the S003R4 branch and **must only be called Lean-proved if the strict hosted Lean workflow succeeds at their final HEAD**.

## Consequences at the matrix level

Composing the numerical certificates with these bridges yields universal (not sample-only) statements:

* b(M)≥4 ⇒ e(M)≤5.
* e(M)≥8 ⇒ b(M)≤2.
* e(M)=7 and b(M)=3 iff M has a full hub row plus three distinct unit rows, or its transpose.

The first two are proposed as new generic-adjacency Lean theorems in the branch. The third is a mathematically immediate restatement of the already kernel-verified \`seven_edge_three_iff_spider_BV\`, conditional on the numerical bridge; a separate generic adjacency declaration must be proved before claiming it as a new formal theorem. This does not yet construct a graph isomorphism.

## What remains open after the matrix bridge

**Graph:** For arbitrary connected \`SimpleGraph (Fin 8)\`, formally prove that an eligible triple of four-MIS gives a unique balanced bipartition, that its combinatorial triple count equals b(M), and that the spider matrix pattern is equivalent to genuine graph isomorphism to S(2,2,2,1).

**Probability:** Construct a real finite sample space of cap labellings / atom partitions, and show the 2520 atom assignments have 8 successful fibres for a prescribed compatible triple. Derive M1, M2, M3 from these actual samples, not solely by rational moment inversion. The nine-cap classification is a labelled external mathematical assumption in any global cap statement.

**Novelty:** Neither symbolic matrix computation nor finite checking establishes originality. Source-level novelty gate and the conditional manuscript session S004 remain outstanding.

## Verification discipline

The finite lead workflow and the strict Lean kernel workflow are distinct. A green finite check is not evidence that the new Lean declarations compile or are kernel checked. Read the exact HEAD run names and conclusions; use the source's \`#print axioms\` audit and the five independent finite checkers. Do not merge broken proof attempts into main.
