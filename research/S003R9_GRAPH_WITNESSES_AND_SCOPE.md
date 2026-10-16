# S003R9 — graph witnesses, connected partitions and first-paper scope

Date: 16 October 2026. This note distinguishes mathematical proofs, source declarations and hosted verification. The exact final certificate is in `sessions/S003R9_CLOSEOUT.md`; an attempted declaration is not certified by a finite checker or a failed build.

## Opening audit

PR #3 remained open and unmerged, at exact head `1e4cadd580b385e0d8e69e836f3211129e705839`. Both hosted Lean 38887318919 and finite 38887318971 were re-read as PASS. The three arbitrary Boolean-matrix semantic extremal statements were inherited without repeating their mathematical proof. Main documentation had advanced beyond the proof branch; it was brought into the working branch before further changes. No other research repository was modified.

## Actual graph semantics, without assuming the desired count equality

For A : Fin 4 → Fin 4 → Bool, `matrixGraph A` is a genuine `SimpleGraph (Fin 4 ⊕ Fin 4)`; adjacency occurs across the sides exactly in occupied cells. This vertex type has exactly eight elements. `GraphMIS G s` asserts independence of the finite vertex set s and domination of every excluded vertex. `graphMIS_iff_maximal` proves that this is exactly maximality under inclusion among independent finite sets.

For X,Y two side subsets, `mixed_iff_graphMIS` proves:

    IsMixedMIS A X Y ↔ |X|=2 ∧ |Y|=2 ∧ GraphMIS (matrixGraph A) (X.disjSum Y).

`graphMixedEquiv` is a lossless equivalence from actual vertex sets s with |s.toLeft|=|s.toRight|=2 and GraphMIS to eligible left pairs. Its inverse is X ↦ X.disjSum (univ \ N(X)). The inverse laws use the unique opposite-side theorem, rather than an unproved assertion that projection preserves the count. `graphMixedCount_eq_actual` transfers the Fintype cardinality through this equivalence. In particular every counted set has size four by `Finset.card_disjSum`.

This yields a genuine graph-vertex-set bound B(A)≤3 under e(A)≥6, and B(A)=3 iff the certified spider matrix pattern under e(A)≥7. Neither statement asserts that all four-MIS have a 2+2 split. The S003R8 skew-split witnesses remain valid.

## Why connected bipartitions are unique

For any simple graph G and proper Boolean colourings c,d, agreement c(u)=d(u) propagates across an edge, since each colouring flips its Boolean value. Induction on a genuine `G.Walk u v` proves agreement at u iff agreement at v. If G is connected, choose a root and propagate: c=d if they agree there, otherwise c(v)=not d(v) everywhere.

Colouring a finite independent set by membership gives a proper two-colouring exactly when its complement is independent. Consequently, any two complementary independent partitions of a connected finite graph agree up to exchanging the two parts. The Lean result is general in the vertex type and graph, and does not assume balance, cardinality eight or maximality.

## Graph edge adapter

An occupied cell (i,j) maps to the unordered edge {inl i,inr j}. This map is injective because its endpoints have different sum tags, and surjective because the graph has only cross-side edges. Hence Nat.card of the actual graph edge set equals e(A), without a factor-of-two ambiguity. Combining Mathlib's connected n-vertex lower edge bound with card(Fin 4 ⊕ Fin 4)=8 yields e(A)≥7. The source then derives B(A)≤3 under actual graph connectedness and B(A)=3 iff the matrix pattern. All five edge/connected-adapter declarations passed strict hosted Lean 38889327092 at exact source 8199e6bc41dc9801a95b1f19ece0c186c1791995, as recorded in the final certificate.

## A concrete prior-art separation, not a novelty claim

Primary sources consulted:

* [Follett et al., published paper, Proposition 2.2](https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf): affine equivalence and zero total sum of nine-caps. The eight-cap transfer needs an automorphism of the canonical cap to arrange that zero is fixed, making the final map linear. A translation alone need not preserve four-point zero sums. The manuscript now supplies that argument explicitly.
* [Liu 1993, publisher page](https://onlinelibrary.wiley.com/doi/abs/10.1002/jgt.3190170407): the accessible abstract concerns total MIS counts and extremal bipartite/connected bipartite graphs. Full theorem-level comparison was not available from this page; do not pretend the full article was read.
* [Li, Zhang, Zhang 2013, open full paper, Lemma 3, pp. 245–246](https://dmtcs.episciences.org/607/pdf): records classical extremal tree families B(2,(n−2)/2) and B(4,(n−4)/2), defined by attaching length-two paths to endpoints of a core path; reference [13] is Jou–Chang 1997. At n=8 the B(2,3) family includes the spider and a one-versus-two arm split. This is an inference from the displayed family, not a claim that their theorem discusses PDIC.

Take the split tree T with edges 01,02,14,16,23,45,67. Its maximal independent sets are:

    size 3: 246, 256, 247
    size 4: 0346, 0356, 0347, 1257, 0357, 1357.

The only compatible triple is {0346,1257,0357}. Thus both T and the spider have total MIS count 9, while their four-MIS counts are 6 and 9, and their h statistics are 1 and 3. The triple probabilities are 1/315 and 1/105. `scripts/verify_s003r9.py` independently lists actual MIS and all 2520 atom assignments, checking eight favourable assignments for every contributing triple. This is FINITE_CHECKED; it is not a Lean certificate or a literature-priority proof. It establishes that total MIS cardinality alone does not determine h. It does not rule out prior results concerning size-refined or mixed statistics.

## Written uniform probability model

There are 8!=40320 equally likely bijections. A four-set has 70 possible images, each with 4!4!=576 preimages. An overlap-two ordered pair has 70*6*6=2520 images, each with 16 preimages, because its four two-element membership atoms may each be permuted. A prescribed compatible triple likewise has four membership atoms of size two and exactly 16 bijections for each possible ordered image triple. Eight image triples are all-zero quartet triples. This proves the actual uniform push-forward probability 8/2520=1/315 in the written manuscript, rather than merely dividing two unrelated counts.

## Minimal remaining kernel interface and bounded fallback

The session freezes the certified matrix/graph appendix and general connected-partition uniqueness. It does not rename that partial theorem as the complete flagship. Remaining obligations are:

1. From any complementary four-MIS pair in arbitrary connected G on eight vertices, construct the balanced enumeration equivalence to `matrixGraph A`; prove graph/MIS transport.
2. Define genuine unordered compatible triples of four-MIS and construct their bijection with the mixed vertex sets for the unique partition; prove zero count when there is no complementary pair. This must use, not assume, the unique-partition theorem.
3. Construct a graph isomorphism from each row/column spider pattern to the named eight-vertex spider. A Boolean pattern is not by itself a declared graph isomorphism.
4. Build uniform finite labellings or atom assignments, prove the 16-to-one push-forward and eight favourable fibres, connect the quartet design, and sum moments to obtain the complete law. The nine-cap classification stays an explicit external input.

The S003R9 proposal to make S004 a final source-comparison/editing gate was withdrawn by the owner's process change on 16 October 2026. S004 currently has no installed target. The obligations above record the mathematical/formalisation boundary only; the owner will choose the session target. No PR merge or external submission has been performed.
