# Formal candidate: cap–charge–nerve transfer

## Finite geometric input (S001 proved with classical nine-cap classification)

Let A=(F_3)^3, and C the eight-element subsets U of A\\{0} having no nonempty zero-sum subset of cardinality at most three. S001 proves the following using Follett et al. (2014), Proposition 2.2 (classical nine-cap classification), plus explicit quadratic normal form and group stabiliser proof:

- |C| = 702.
- GL(3,3) acts transitively on C with stabiliser 16.
- For k=0,...,8, the numbers c_U(k) of zero-sum k-subsets of U are (1,0,0,0,4,0,0,0,1).
- The four zero-sum quartets form a hypergraph with two disjoint pairs of edges, four intersections of size two, no triple intersection and nerve the four-cycle C4. Hence the abstract nerve has reduced integral H_1=Z; it has no three-edge sunflower.

S001 proof: [S001_CAP_RIGIDITY_PROOF.md](S001_CAP_RIGIDITY_PROOF.md). Numerical checks independently confirm it; bounded [prior-art audit](S001_PRIOR_ART_AUDIT.md) marks novelty unresolved. S001 additionally proves exact pair-zero probabilities for overlap 0..4 equal to (2/35,0,1/315,0,2/35), and a sharp connected-graph upper bound of three zero-charge four-element independent sets, attained by a tree with three maximal such sets.

## Stitched exact-law target (S002, future)

For graph T with eight vertices and at least one edge: choose U uniformly from C, label V(T) by U through an independent uniformly random bijection lambda, and independently produce maximal independent set I by scanning vertices in a uniformly random order and accepting a vertex unless a previous accepted neighbour blocks it.

Write P_T(z)=sum_k Pr(|I|=k) z^k. The target exact law is

    Pr(sum_{v in I} lambda(v) = 0) = (2/35) * [z^4]P_T(z),

    Pr(sum_{v in I} lambda(v) = a)
       = (1 - (2/35)*[z^4]P_T(z))/26
       for every a != 0 in A.

The second line **requires** the GL-invariant random cap: do not claim it for an arbitrary fixed U. The first line needs only the fixed U's profile and the uniform bijection.

For a tree T, choose root r and epsilon(v)=(-1)^distance(r,v). Put three pebble channels C_j(v) congruent to epsilon(v)*lambda(v)_j modulo 3 on selected vertices and 0 elsewhere (nonnegative representatives). A pebbling move uses two pebbles from v to neighbour w and adds one at w. Its change in signed channel charge is -2epsilon(v)+epsilon(w)=-3epsilon(v)=0 modulo 3. Thus the law is also the distribution of three genuine conserved pebbling charges.

Exact rational checks inherited from the synthesis:
- Path P8: P_T=(11/45)z^3+(34/45)z^4; charge-zero probability 68/1575.
- Star K1,7: P_T=(1/8)z+(7/8)z^7; charge-zero probability 0.
- Double-star with three leaves at each centre: P_T=(7/16)z^4+(9/16)z^6; charge-zero probability 1/40.

## Necessary originality advance

The fully general identity

    Pr(sum lambda(I)=0)
      = sum_k Pr(|I|=k) c_U(k)/binom(n,k)

follows immediately from conditioning under a random bijection. It is a **baseline, not the conjecture**. The first-paper flagship needs genuinely nontrivial witness classification, topology, a sharp graph-theoretic inequality or a significant broader generalisation, with clear prior-art boundaries.

Broader exploratory PDIC conjecture (NOT ASSERTED TRUE): in well-specified families of *extremal* short-zero-sum-free sets in (F_3)^d, the zero-sum witness profile and the nerve homotopy type may be independent of the extremiser. Test and falsify in higher dimension before freezing an all-d statement; if false identify its exact validity range.

Neither this finite identity nor the abstract C4 nerve resolves the Erdős–Rado sunflower, full rank-three Davenport, Collatz, Almost Stacked or HHA headline problem.
