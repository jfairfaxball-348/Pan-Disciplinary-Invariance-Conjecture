# PDIC S003R — six-edge threshold for mixed maximal independent sets

**2026-10-15. PROVED as a written combinatorial lemma; not yet Lean-formalised.** The accompanying `scripts/verify_s003r.py` is exhaustive corroboration, not the proof.

## Theorem (stronger than the connectivity-only bound)

Let `G=(A ⊔ B,E)` be any **simple** bipartite graph, with `|A|=|B|=4` (connectedness is not assumed). Let `b(G)` be the number of maximal independent sets `X ⊔ Y` with `|X|=|Y|=2`, `X ⊆ A`, `Y ⊆ B`. Then

> **If `|E| ≥ 6`, then `b(G) ≤ 3`. Equivalently, `b(G) ≥ 4` implies `|E| ≤ 5`.**

In particular, a connected balanced 4+4 bipartite graph has at least seven edges, hence `b(G) ≤ 3`.

## Basic criterion

For each pair `X ⊆ A`, `|X|=2`, there is **at most one** qualifying `Y`: necessarily `Y=B \\ N(X)`, since independence forces `Y ⊆ B \\ N(X)`, maximality forces every vertex of `B \\ Y` to have a neighbour in `X`, and `|Y|=2`. A pair `X` is counted by `b(G)` precisely when

1. `|N(X)|=2`, and
2. both vertices of `A \\ X` have at least one neighbour in `B \\ N(X)`.

This is necessary and sufficient for `X ⊔ (B \\ N(X))` to be independent and dominating, hence maximal independent.

## Combinatorial proof

For every counted `X`, each `a∈X` has degree at most two. If any vertex of `A` has degree at least three, at most the other three vertices can appear in a counted pair, yielding `b(G) ≤ C(3,2)=3`.

If some `a_0 ∈ A` has degree zero, every counted `X` contains `a_0`: otherwise the zero-degree vertex is outside the proposed MIS but not dominated. At most three pairs contain a fixed vertex, so again `b(G)≤3`.

We may therefore assume **every A-degree is one or two**. With at least six edges, the degree multiset on `A` is one of
`(2,2,1,1)`, `(2,2,2,1)` or `(2,2,2,2)`.

- **Case (2,2,1,1).** Call the two degree-two vertices `d_1,d_2` and the leaves `l_1,l_2`. Each `d_i` can form a counted pair with **at most one** leaf: for `{d_i,l_1}` to be maximal, `l_2` must have its sole neighbour outside `N(d_i)`; this excludes `{d_i,l_2}`, and conversely. Hence at most two degree-two/leaf pairs are counted. There is only one leaf/leaf pair. If the degree-two/degree-two pair is counted, the two degree-two neighbourhoods coincide and both leaves have neighbours outside their common neighbourhood. This excludes every degree-two/leaf pair; it also excludes a counted leaf/leaf pair, since the two leaves' neighbours lie in the complement of the common degree-two neighbourhood, leaving both degree-two vertices undominated by the proposed leaf/leaf set. Hence `b(G)≤3`.
- **Case (2,2,2,1).** Call the three degree-two vertices `d_1,d_2,d_3` and the leaf `l`. There are only three possible leaf/degree-two pairs. A counted degree-two/degree-two pair must have **identical** two-element neighbourhoods (else their union has size at least three). At most one such pair can be counted: a third vertex with that same neighbourhood would be undominated, and three degree-two vertices cannot contain two different identical-neighbourhood pairs without all three being identical. Moreover, if `{d_1,d_2}` is counted, the leaf neighbour lies outside their common neighbourhood, excluding both `{l,d_1}` and `{l,d_2}`. Thus in that event there are at most two counted pairs total; otherwise at most three.
- **Case (2,2,2,2).** A counted pair must consist of two degree-two vertices with identical neighbourhoods, and neither of the other two vertices may have that neighbourhood (or it would be undominated). Hence each counted pair is an isolated size-two class in the partition of the four rows by neighbourhood; there can be at most two such classes, so `b(G)≤2`.

This covers all degree patterns and proves `b(G)≤3` when `|E|≥6`. □

## Seven-edge equality and finite verification

The S002 structural proof characterises equality in **connected** balanced graphs: `b(G)=3` iff `G ≅ S(2,2,2,1)`. For `|E|=7`, the exhaustive 4×4 matrix census also finds exactly 192 labelled equality cases, all of that spider shape; it checks the converse as well. The equality characterisation should not be inferred just from a degree sequence without the neighbourhood condition.

The independent S003R verifier checks all 65,536 matrices using **two separately implemented counts**: the unique-complement pair criterion above and direct independence/dominating tests over all 36 mixed choices. It finds the only cases with `b≥3` to be

| Edges | b | Matrix count |
| ---: | ---: | ---: |
| 4 | 6 | 24 |
| 5 | 4 | 288 |
| 6 | 3 | 1,728 |
| 7 | 3 | 192 |

There are no instances with `b≥3` at other edge counts. The census certifies the finite claim **computationally**, not in Lean's kernel. Source-level novelty is still open.

## Formalisation remaining

To turn the stronger threshold into the S003R universal Lean theorem: encode the six candidate A-pairs, prove the unique-complement maximality criterion for arbitrary 4×4 Boolean matrices, formalise the A-degree case split above, then connect the bipartite reduction to connected simple graphs on eight vertices. The matrix enumeration by itself is insufficient to prove an all-connected-graph theorem in Lean.
