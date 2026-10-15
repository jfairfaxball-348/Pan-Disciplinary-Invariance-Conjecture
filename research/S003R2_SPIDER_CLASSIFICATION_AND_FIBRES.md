# PDIC S003R2 — seven-edge equality classification and 2,520-fibre calculation

**Date:** 2026-10-15. **Status: WRITTEN PROOF + independently exhaustive checks.**
The full graph/homotopy/probability flagship is not asserted Lean-closed here; see the live axiom audit in the closeout.

## A direct equality proof without enumerating 65,536 matrices

Let G be a bipartite simple graph with parts A,B of four vertices each,
exactly seven edges, and let b be the number of mixed maximal independent
four-sets (two vertices from each side). S003R proves b≤3 whenever e≥6,
without any connectivity assumption.

**Claim.** b=3 exactly when G is the spider S(2,2,2,1), with its hub
on one side or the other. In particular every seven-edge equality
matrix is connected, even though connectedness was not assumed.

Use the S003R unique complement criterion: a two-set X⊂A is counted
iff N(X) has size two and each vertex of A\\X has a neighbour in
B\\N(X).

**Case 1: some A-vertex has degree ≥3.** A counted pair cannot contain
it. To obtain three counted pairs, all three pairs of the remaining
A-vertices must qualify. None of those three vertices can have degree
two: if d had two neighbours, the other two low vertices' neighbourhoods
would have to be contained in N(d) (to qualify with d), whereas either
candidate containing d requires the third remaining low vertex to have
a neighbour outside N(d), a contradiction. Thus all three are leaves,
and their neighbours are pairwise distinct (two leaves with the same
neighbour have a one-point union, so cannot form a counted pair).
Seven total edges force the high-degree vertex to have degree four.
This is precisely the spider, centred on A.

**Case 2: no A-vertex has degree ≥3.** A degree-zero vertex would have
to lie in every counted pair; obtaining three candidates would force
all other three A-vertices to have degree ≤2, giving ≤6 edges.
Thus there are no isolated A-vertices. Since the degree sum is seven
and every degree is 1 or 2, the multiset is (2,2,2,1).
Write l for the unique leaf, with neighbour b0. If a pair of degree-two
vertices qualifies, their neighbourhoods are identical and the S003R
degree argument excludes the two pairs consisting of l and either
of these degree-two vertices: then b≤2. Thus b=3 forces exactly
the three pairs {l,d_i} to qualify. For each i, the union
N(l)∪N(d_i) has cardinal two; since |N(d_i)|=2, necessarily
N(d_i)={b0,b_i}. The domination test for {l,d_i} forces b_j≠b_i
for j≠i. The b_i are therefore the three distinct B-vertices
other than b0. Thus b0 is adjacent to all four A-vertices and
each remaining B-vertex is adjacent to one d_i: the same spider
with its hub on B.

Conversely, each orientation of the spider has b=3, by its three
mixed independent sets (already proved constructively in S002 and
Lean-verified for one labelled spider). This concludes the iff.

**Exact count of labelled matrices.** For a spider with hub on A:
choose its hub row (4 ways), choose the B-vertex omitted by the three
A-leaves (4 ways), and biject the three A-leaves onto the remaining
B-vertices (3! ways). This is 4·4·3!=96 matrices. Transposition
gives 96 distinct matrices with hub on B. Therefore **192** total.
The orientations do not overlap because the spider has a unique
degree-four hub. Independent all-matrix checker confirms exactly 192.

## Exact triple labelling fibre without floating point

The canonical zero-quartet design consists of four two-point atoms
A1,A2,B1,B2 and four quartets A_i∪B_j.

Fix an ordered triple (S,T,R) of four-vertex subsets of V, such that
S and T are complementary, |R∩S|=|R∩T|=2. A uniformly random bijection
from the eight vertices to an admissible eight-cap induces a uniform
ordered partition of the eight vertices into four unordered pairs.
The number of such partitions is 8!/(2!)^4 = **2520**.

For (S,T,R) to be three distinct zero-quartets, the first two must be
one of the four *ordered* choices of opposite corners in the square,
and the third must be one of the other two corners. Hence exactly
4·2=**8** atom assignments succeed; the prescribed triple probability is
8/2520 = **1/315**. This combinatorial fibre calculation requires
only the C4 quartet profile, while extending to all admissible caps
uses the explicitly external classical nine-cap input.

The triple moment M3=h/315 and the sharp 1/105 spider probability
follow in the written proof once the connected-graph correspondence
h=b≤3 is supplied. **Do not mistake this rational computation for
the missing full formalised random-bijection semantics.**

## Independent check

A fresh one-pass verifier of all 2^16 balanced bipartite 4×4
adjacencies checked both the 192 equality matrices and the orientation
criterion (one side has a degree-four hub, the three other vertices
on that side have pairwise distinct singleton neighbourhoods).
Distribution of b≥3: (e,b,count)=(4,6,24),(5,4,288),(6,3,1728),(7,3,192).
This reproduces the checked census with a different spider test.

## Remaining formalisation boundary

Lean S003R2 proves a universal arbitrary-Boolean-matrix unique-complement
criterion and two axiom-free complete finite bitvector matrix results:
`four_by_four_six_edge_threshold_BV` and `seven_edge_three_iff_spider_BV`.
Both theorems passed the strict hosted `decide +kernel` audit: their
`#print axioms` output is exactly [propext, Quot.sound]. An earlier
`bv_decide` trial was explicitly rejected because it introduced a
native-computation axiom. The complete bridge from this bitvector
representation to arbitrary SimpleGraph four-MIS and the full random
labelling semantics remains OPEN. Full 8-vertex
connected graph isomorphism and 2,520-atom random-labelling moment
formalisation are still separate obligations.
