# PDIC S002 — exact greedy/charge transfer and sharp triple-saturation theorem

2026-10-15. **PROVED using the S001 quartet theorem, which in turn depends on the cited classical nine-cap classification.** Originality and significance remain unverified. No Lean proof is asserted.

## Setup and provenance

Let (A=\mathbb F_3^3), (U\subset A\setminus\{0\}) be an admissible eight-cap, and let (\lambda:V(G)\to U) be a uniformly random bijection. Unless stated otherwise, (U) may be *fixed*: all zero-event laws below depend only on the fixed S001 quartet profile. For the distribution over **nonzero charges**, sample (U) uniformly from all 702 caps as well, independently of the labelling and greedy order.

S001 established that the only nonempty zero-sum subsets of (U) have sizes 4 or 8, with exactly four zero-sum 4-sets. These are (Q_{ij}=A_i\cup B_j), where the four two-point atoms (A_1,A_2,B_1,B_2) partition (U). The quartet family is a 4-cycle under nonempty intersection; two pairs are disjoint, all four remaining pairs meet in exactly two points, and every three quartets contain exactly one disjoint pair.

Pinned inputs: Inverse-Zero-Sum-Research `496cefb8e0672d069991f759adbfbc954b70f471`; Greedy-Uniformity-on-Trees `a4c4493a5fff82dfb085f59de41393b862af63a3`; TreeStack `e1e437b8d02552b7c7ee0c4c74041b6ac956f063`. The Lean Candidate3 theorem is a statement about *innerly jointly avoiding* short witnesses for the 24-term sequence, not a statement that the repeated sequence is itself short-free.

## Theorem A: exact random greedy cap law

Fix any graph (G) with eight vertices and independently generate (I\subseteq V(G)) by the random-permutation greedy maximal-independent-set process. For any fixed admissible (U),

[
\Pr_\lambda\bigl(\textstyle\sum_{v\in I}\lambda(v)=0\bigr)
=\frac{2}{35}\Pr(|I|=4).
]

Proof: condition on the random vertex set (I=S). For (|S|=k), (\lambda(S)) is uniform among the ({8\choose k}) (k)-subsets of (U), so the conditional zero probability is (c_U(k)/{8\choose k}). Since the greedy output is nonempty, and the S001 profile is (c_U=(1,0,0,0,4,0,0,0,1)), the only possible contribution is (k=4) or (k=8). **Edge case:** If (G) is edgeless, greedy always selects all eight vertices and the probability is 1. Thus the displayed formula **requires at least one edge**; then (|I|\le7). This corrects the too-broad phrase "any graph" occasionally used for the baseline. For an eight-vertex graph with an edge the formula holds. The same reasoning applies to any independent random selection process whose output is nonempty and not all eight vertices.

If (U) is independently uniform over all 702 admissible caps, (GL(3,3)) acts transitively on the 26 nonzero target charges, so
[
\Pr(\textstyle\sum_{v\in I}\lambda(v)=a)
=\frac{1-(2/35)\Pr(|I|=4)}{26}
\quad(a\ne0).
]
This nonzero formula is NOT asserted for fixed (U).

If (w_G(S)=\Pr(I=S)), a completely explicit permutation-fibre formula for each maximal independent set (S) is
[
w_G(S)=\int_{[0,1]^S}\prod_{v\notin S}
\Bigl(1-\min_{u\in N(v)\cap S}t_u\Bigr)\,\prod_{u\in S}dt_u.
]
Here all clocks are independent (\mathrm{Unif}(0,1)). A maximal independent set has a nonempty (N(v)\cap S) for each outside vertex; the event that every such (v) occurs after at least one member of (N(v)\cap S) is exactly the event that greedy selects (S). Importantly, **the greedy output law is not uniform on maximal independent sets**.

Exact recurrence for the full greedy distribution: on an active induced subgraph with vertex set (R\), choose first vertex (v\in R) uniformly, accept (v), and recurse on (R\setminus N[v]); this computes the full law as rational numbers without floating point.

Checks: path (P_8) has size profile (\{3:11/45,4:34/45\}) and charge-zero probability (68/1575); star (K_{1,7}) has sizes (\{1:1/8,7:7/8\}) and probability 0; balanced double-star with two degree-four adjacent centres has (\{4:7/16,6:9/16\}) and probability (1/40).

## Theorem B: genuine three-channel conserved pebble residues

Let (T) be a rooted tree with parity (\epsilon(v)=(-1)^{d(r,v)}\in\{+1,-1\}). For each channel (j=1,2,3), put nonnegative integer pebbles (C_j(v)) at vertices; a legal **channel-j** move removes two pebbles from (v) and places one at adjacent (w), leaving other channels untouched.

Set (Q_j(C)=\sum_v\epsilon(v)C_j(v)\pmod3\). Since adjacent vertices have opposite parity, each legal move changes this residue by (-2\epsilon(v)+\epsilon(w)=-3\epsilon(v)=0\pmod3). Thus the vector (Q\in\mathbb F_3^3) is invariant under all finite sequences of legal channel moves.

Initialize (C_j(v)) to the representative of (\epsilon(v)\lambda(v)_j\pmod3\) in \(\{0,1,2\}\) for (v\in I), and zero for (v\notin I). Then (Q(C)=\sum_{v\in I}\lambda(v)\). The greedy-zero law is thereby also a law of three genuinely conserved pebbling residues. The statement works for arbitrary bipartite graphs with a fixed 2-colouring (trees supply canonical root parity), not for arbitrary non-bipartite graphs. Conservation does **not** entail reachability or stackability: TreeStack's signed rooted branch-message criteria are substantially stronger and use legal moves/weighted 2-adic transfer; no TreeStack theorem is imported or re-proved here.

## Theorem C: the complete zero-charge four-MIS count distribution

Let (G) be a **connected simple graph on eight vertices**, and (F=\{S\subset V(G):|S|=4,\ S\text{ is a maximal independent set}\}\). Put (m=|F|). For (t=0,2), let (n_t) count unordered pairs of distinct members of (F) whose intersection has (t) vertices. Let (h) count unordered triples (\{S,T,R\}\subset F) in which one pair (S,T) is disjoint and (R) meets each in two vertices. The disjoint pair is unique within each such triple.

For a uniformly random bijection to an admissible eight-cap, set (N_0=\sum_{S\in F}\mathbf1[\sum_{v\in S}\lambda(v)=0]\). Connectedness and S001 imply (N_0\le3) deterministically. Set
[
M_1=\frac{2m}{35},\quad
M_2=\frac{2n_0}{35}+\frac{n_2}{315},\quad
M_3=\frac{h}{315}.
]
Then the **complete distribution**, not just first and second moments, is
[
\begin{aligned}
\Pr(N_0=0)&=1-M_1+M_2-M_3,\\
\Pr(N_0=1)&=M_1-2M_2+3M_3,\\
\Pr(N_0=2)&=M_2-3M_3,\\
\Pr(N_0=3)&=M_3.
\end{aligned}
]

Proof: S001's exact single/quartet-pair laws give (\mathbb EN_0=M_1) and (\mathbb E{N_0\choose 2}=M_2). Three distinct zero quartets necessarily have the described unique disjoint pair and 2+2 splitting. For a prescribed ordered (S,T,R) with (T=V\setminus S) and (R) split 2+2, the number of possible ordered triples of four-subsets of an eight-element label set of this form is ({8\choose4}{4\choose2}^2=2520). Exactly **eight** are ordered zero-quartet triples in the S001 (C_4) family (four choices for the ordered disjoint pair; two choices for the third). Thus the joint triple-zero probability is (8/2520=1/315). Other distinct triples have probability zero. Consequently (\mathbb E{N_0\choose3}=M_3). Since (N_0\in\{0,1,2,3\}), inversion of these three binomial moments and normalization gives the four formulas.

This is a genuine cross-domain use of quartet incidence to compute the **entire graph witness-count law**. The theorem concerns uniform cap *labelling*; (N_0) counts maximal independent sets, not the one greedy output.

## Theorem D: sharp triple-saturation probability and unique graph

For every connected eight-vertex graph (G),
[
\boxed{\Pr(N_0=3)\le1/105,}
]
with equality **iff** (G\cong S(2,2,2,1)), the eight-vertex tree with one centre of degree four, three arms of length two, and one arm of length one.

Proof. If (h>0), two disjoint four-MIS (S,T) exist, cover all vertices, and are independent. Therefore (G) is connected bipartite with its unique bipartition (V=A\sqcup B), (|A|=|B|=4). Conversely (A,B) are both MIS, since connectedness rules out isolated vertices. They are the **only** pair of disjoint four-vertex independent sets: such a pair is a bipartition, unique up to swap. Hence (h=b(G)), the number of four-MIS (R=X\sqcup Y) with (|X|=|Y|=2), (X\subset A, Y\subset B). If no balanced bipartition exists, (h=0).

A balanced mixed four-set (R=X\cup Y) is a MIS iff
[
N(X)=B\setminus Y,\qquad N(Y)=A\setminus X.
]
The two equalities are necessary (independence forbids edges from (X) to (Y), maximality requires every vertex outside (R) adjacent to (R)) and sufficient. In particular (|N(X)|=2); thus every vertex of (X) has degree at most two. Call vertices in (A) of degree at most two *low* and let their count be \(\ell\).

If \(\ell\le2\), at most \({\ell\choose2}\le1\) candidates exist.

If \(\ell=3\), at most three candidates exist. If equality holds all three low vertices (a_1,a_2,a_3) participate in a valid pair. If any has two neighbours, say (N(a_1)=\{b_1,b_2\}\), then the other two low vertices must also have all neighbours among (b_1,b_2), by the two candidates involving (a_1). But for the candidate (X=\{a_1,a_2\}\), its complement (Y=B\setminus\{b_1,b_2\}) cannot dominate the remaining low vertex (a_3), contradiction. Therefore all three low vertices have degree one, with three **distinct** neighbours in (B) (otherwise a candidate would have (|N(X)|=1)). Connectedness forces the remaining high vertex in (A) to be adjacent to all four vertices of (B). Thus (G\cong S(2,2,2,1)).

If \(\ell=4\), all four A-degrees are at most two. Since (G) is connected, it has at least seven edges; consequently its A-degrees are either ((2,2,2,1)) or ((2,2,2,2)).
* In the 7-edge case, replace each of the three A-vertices of degree two by an edge between its two B-neighbours. The resulting (multi)graph on the four B-vertices is connected with three edges, hence is a simple tree. A possible candidate pair (X) must contain the sole A-leaf (a_0), since two degree-two vertices cannot have the same neighbourhood without introducing a parallel edge. Write (b_0) for the sole neighbour of (a_0). The other member of (X) corresponds to a tree edge incident to (b_0), so (b(G)\le\deg_{tree}(b_0)\le3). Equality requires a three-leaf star centred at (b_0), giving precisely the same spider graph.
* In the 8-edge case, the four degree-two A-vertices become four edges of a connected multigraph on four B-vertices. A candidate pair of A-vertices requires parallel edges. There can be at most one parallel pair: two separate parallel pairs, or a triple parallel class, would leave too few edges to connect four vertices. Thus (b(G)\le1\).

This proves (h=b(G)\le3), and equality implies the spider. Conversely, in the spider, choosing any two of its three outer leaf A-vertices for (X) and the other two opposite-side vertices for (Y) produces exactly three mixed four-MIS; hence (b=3) and (\Pr(N_0=3)=3/315=1/105). QED.

**Additional sharp spider fact.** The spider has nine MIS in total, *all* of size four. If the centre is chosen by greedy, the three outer leaves are subsequently chosen; otherwise greedy picks exactly one of the two vertices on each long arm and the short leaf. Consequently (\Pr(|I|=4)=1), and its zero-charge greedy probability averaged over cap labellings equals (2/35).

## Hostile checks and limits

* **Edgeless graph counterexample:** its greedy output has size eight and zero charge with probability **1**, disproving the two-term transfer formula if the "at least one edge" hypothesis is omitted.
* **Fixed-cap nonzero-charge uniformity:** false in general; the (GL)-randomised cap hypothesis is essential.
* **Non-bipartite connected graphs:** (h=0), so triple saturation is impossible.
* **Disconnected graphs:** could admit all four quartets independently; the (N_0\le3) support and moment inversion above need connectedness.
* **All four-subset independent sets versus maximal independent sets:** one can have more than three candidate 2+2 independent sets; the sharp spider theorem specifically counts *maximal* sets.
* **Charge invariants:** do not imply reachability/stackability and cannot be transferred to odd-cycle graphs with the same sign argument.
* **Priority:** the sharp triple-saturation law and spider characterization have a full mathematical proof, but may be a special small-graph corollary of earlier extremal MIS/design work. Do not assert novel literature priority without S004's source-level audit.

## Reproducibility

Run `python3 scripts/verify_s000.py`, `python3 scripts/verify_s001_independent.py`, and `python3 scripts/verify_s002.py`. The new **stdlib-only**, independent checker enumerates all 36,317 connected labelled bipartite graphs on a fixed balanced 4+4 partition, confirming (b\le3) and equality for the 192 labelled spider realisations; it also enumerates 2,520 atom assignments and verifies the full rational (N_0) law and greedy probabilities on path, star, double-star, and spider. The written proof above is independent of those finite counts. PDIC Lean/hosted Actions/novelty review are separately recorded.
