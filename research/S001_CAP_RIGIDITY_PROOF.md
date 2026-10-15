# PDIC S001 — cap rigidity, quartets, nerve and joint-charge theorem

2026-10-15. **PROVED using explicitly cited classical classification of nine-caps**. No PDIC Lean check, peer review or originality certificate.

## Definitions and outside theorem

Let F=F_3, V=F^3 and C be the eight-element subsets U of V\{0} without nonempty zero-sum subsets of cardinality at most three. For distinct nonzero points, a zero-sum pair is {x,-x}; a zero-sum triple is an affine line.

**Classical input.** Nine is the maximum cap size in AG(3,3), and every nine-point cap is affinely equivalent. Follett, Kalail, McMahon, Pelland and Won, *Discrete Mathematics* 337 (2014), Proposition 2.2(1), https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf; antecedents trace to Bose (1947) and elliptic quadrics. We do not claim this classical classification as a discovery.

**Augmentation.** U in C iff W=U union {0} is a nine-cap. Indeed a triple through 0 is an opposite pair in U, and every triple away from 0 is already forbidden in U. Therefore every U arises by deleting 0 from a maximum affine nine-cap.

## Canonical model and its quartet geometry

Use q(x,y)=x^2+y^2 over F_3. It is anisotropic: q(d)=0 iff d=0. Let

    W0 = { (x,y,q(x,y)) : (x,y) in F_3^2 },
    U0 = W0 \ {(0,0,0)}.

An affine line whose xy-coordinate step is nonzero d has, at three collinear projected positions a-d,a,a+d, heights whose sum is 2q(d)!=0, so its graph points are not collinear. A vertical line has at most one graph point. Thus W0 is a nine-cap.

Of the eight points of U0, four have q=1 and project to axes (+/-e1,+/-e2), while four have q=2 and project to corners (+/-(1,1),+/-(1,-1)). For a zero-sum quartet with t axis points the third-coordinate sum is t+2(4-t)=8-t modulo 3; hence t=2. The sum of two distinct axis vectors is zero if opposite and otherwise has two nonzero coordinates. The sum of two distinct corner vectors is zero if opposite and otherwise has exactly one nonzero coordinate. Their sums can cancel only if both pairs are opposite.

Call the two axis opposite pairs, lifted to height 1, A1 and A2; call the two corner opposite pairs, lifted to height 2, B1 and B2. Therefore the **only four zero-sum quartets** are

    Qij = Ai union Bj,  i,j in {1,2}.

There are two disjoint unordered pairs of quartets, four other pairs meet in exactly two points, no three intersect and each point lies in exactly two quartets. The abstract intersection nerve is **C4** (no triangles or higher faces), and its integral H_1 is Z (reduced H_0=0). No three of its quartets are a sunflower: every three contain a disjoint pair and an intersecting pair. The nerve lemma is **not** invoked for the geometrical union of discrete point sets.

Sum of W0 is 0: xy sums vanish and the four heights 1 plus four heights 2 total 12=0 mod 3. Thus sum U0=0. Zero-sum 1-, 2-, 3-subsets are forbidden; complements show there are no zero-sum 5-, 6-, 7-subsets. With the four quartets and empty/full subsets, the profile c_U(k), k=0..8, is

    (1,0,0,0,4,0,0,0,1).

## Orbit and stabiliser, without exhaustive enumeration

For t in F_3^2, the affine map

    phi_t(x,z) = (x+t, z+2<x,t>+q(t))

preserves W0 and moves 0 to (t,q(t)). By the cited classical affine equivalence of nine-caps, any cap W containing zero can first be matched to W0 affinely; use one of these point-moving automorphisms to arrange that 0 maps to 0. The resulting affine transformation is linear. Hence GL(3,3) acts transitively on C.

To compute the stabiliser of U0 in GL(3,3), note that it preserves W0, the four zero-sum quartets and the four two-point atoms A1,A2,B1,B2 obtained as nonempty pairwise intersections of distinct quartets. Their vector sums are respectively 2e3,2e3,e3,e3. Any stabilising matrix thus preserves the line F_3 e3, so it has block form

    (x,z) |-> (Bx, c^T x + d z)

with B in GL(2,3), d!=0. Since both (x,q(x)) and (-x,q(x)) lie in W0 and map to graph points with the same height q(Bx), subtraction shows 2c^T x=0 for all x, hence c=0. Therefore q(Bx)=d q(x) for all x. Conversely every such B and d gives a stabiliser.

For each d in {1,2}, B(e1) can be any of four nonzero vectors of norm d. The equation for q(B(e1+e2)) implies B(e1) and B(e2) are orthogonal, and B(e2) can be either of the two norm-d vectors orthogonal to B(e1). This gives 4*2=8 maps for each d, **16** in total.

    |GL(3,3)| = (27-1)(27-3)(27-9) = 11232;
    |C| = 11232/16 = 702.

Every U in C is linearly equivalent to U0, so all quartet, nerve and profile properties proved above transfer to every U.

## Strengthening: exact *joint* zero-charge law

Fix any U in C, eight labelled vertices, and a uniformly random bijection lambda from the vertices to U. For any *fixed* four-sets S,T of vertices with t=|S intersection T|, let X_S and X_T indicate that the sum of their labels is zero.

There are

    D_t = binom(8,4) binom(4,t)^2

ordered pairs of four-subsets of U intersecting in t elements, and (lambda(S),lambda(T)) is uniform on them. From the four quartets Qij, the ordered zero-sum-pair counts by t=0,1,2,3,4 are (4,0,8,0,4). Consequently:

| Overlap t | Pr(X_S=1 and X_T=1) |
| --- | --- |
| 0 | 2/35 |
| 1 | 0 |
| 2 | 1/315 |
| 3 | 0 |
| 4 | 2/35 |

The marginal p=2/35, so Cov(X_S,X_T) equals +66/1225 for t=0 or 4, -4/1225 for t=1 or 3, and -1/11025 for t=2. **Two four-set witnesses with odd overlap cannot simultaneously have zero sum.** This pair law uses the C4 incidence scheme and is not the scalar conditioning mixture.

If F is *any fixed* family of m distinct four-subsets of the eight vertices, set N0=sum_{S in F} X_S and let n_t be the number of unordered pairs of *distinct* members of F having intersection size t. The exact first two moments are

    E N0 = (2/35)m;
    Var N0 = (66/1225)m
             + (132/1225)n_0
             - (8/1225)(n_1+n_3)
             - (2/11025)n_2.

No distinct pairs overlap in 4 elements. A graph's family of size-four maximal independent sets gives a direct graph-theoretic application to attack in S002.

This new **derived** pair law has not passed a specialist novelty audit; it is **not** being claimed as a publishable new result at S001.


## Sharp connected-graph obstruction (further cross-domain theorem)

Let G be any **connected** simple graph on eight vertices, and lambda any bijection of its vertices to an admissible U. Let N0^ind count four-vertex independent sets S in G whose label sum is zero. Then

    N0^ind <= 3.

Proof: if all four quartets Qij were independent, no edge could join a vertex labelled in A1 union A2 to a vertex labelled in B1 union B2: any such cross-pair occurs together in the unique Qij selecting the two atoms. These two parts each contain four vertices, so G would be disconnected. Every zero-sum four-set is one of Q11,Q12,Q21,Q22, hence the bound.

**Sharp even among trees and maximal independent sets.** Regard each atom A1,A2,B1,B2 as two vertices. Place a four-vertex path with alternating A1/A2 vertices (edges a1-a3, a3-a2, a2-a4), a second four-vertex path with alternating B1/B2 vertices (b1-b3, b3-b2, b2-b4), and a single bridge a3-b3 between A2 and B2. This graph has eight vertices and seven edges, is connected and is a tree. Q11=A1 union B1, Q12=A1 union B2, Q21=A2 union B1 are independent; each is maximal because its complement's two atoms are dominated by the corresponding alternating paths. The fourth quartet Q22 is not independent because it contains both bridge endpoints. Thus exactly **three** zero-sum four-element *maximal independent sets* occur. The sharp connected-graph inequality is a deterministic graph–zero-sum statement, not a conditioning identity. Literature priority still requires audit.

## Proof boundary and reproducibility

The conceptual proof relies on the cited classical nine-cap classification, not on finite enumeration. Original S000 enumeration and S001 independent quadratic-orbit checker both pass locally, but neither is Lean or a peer-reviewed proof. This result concerns the abstract hypergraph nerve, not a nerve lemma for discrete sets. Source status and unresolved originality are in S001_PRIOR_ART_AUDIT.md.
