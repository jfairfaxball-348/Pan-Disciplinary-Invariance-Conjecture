# Frozen PDIC mathematical target after S002

**S002 PROVED, conditional only on explicit classical nine-cap classification. Novelty remains OPEN.** Exact written proof: [S002_GREEDY_CHARGE_SPIDER_PROOF.md](S002_GREEDY_CHARGE_SPIDER_PROOF.md). S001 finite geometry: [S001_CAP_RIGIDITY_PROOF.md](S001_CAP_RIGIDITY_PROOF.md).

## Classical cap input and provenance

Let A=F3^3, and U range over eight-point subsets of A\{0} without zero-sum subsets of size 1,2,3. Classical nine-cap affine classification (Follett et al. 2014, Prop. 2.2) plus S001 gives 702 such U, one GL(3,3) orbit, stabiliser 16; zero-sum subset profile (1,0,0,0,4,0,0,0,1). The four zero-sum quartets Qij=Ai union Bj (four 2-point atoms) have intersection nerve C4 and abstract H1=Z.

## Principal graph–geometry flagship: entire count law and unique sharp extremiser

Let G be **connected** on eight vertices, lambda a uniformly random bijection to any fixed admissible cap U, and F its family of size-four **maximal independent sets**. Let m=|F|, n_t the number of unordered pairs of different members of F with overlap t, and h the number of unordered triples consisting of a disjoint complementary pair and a third member meeting each in exactly 2 vertices.

For N0 = number of members of F with label sum 0, N0<=3. Put M1=2m/35, M2=2n0/35+n2/315, M3=h/315. **Fully proved**:
    
    Pr(N0=0)=1-M1+M2-M3
    Pr(N0=1)=M1-2M2+3M3
    Pr(N0=2)=M2-3M3
    Pr(N0=3)=M3 <= 1/105.

Equality Pr(N0=3)=1/105 holds **iff G is the tree spider S(2,2,2,1)**, three length-two legs and one length-one leg. This is a theorem involving the quartet C4 design and an independent non-enumerative graph structural proof (with exhaustive finite corroboration). We do not assert original literature priority.

## Greedy–pebbling transfer package

If G has **at least one edge**, sample random-order greedy MIS I independently of U and labelling:

    Pr(sum lambda(I)=0)=(2/35)*Pr(|I|=4).

If U is uniform from the 702 admissible caps as well, then, for each nonzero a in F3^3:

    Pr(sum lambda(I)=a)=(1-(2/35)*Pr(|I|=4))/26.

The edgeless G counterexample forces the edge hypothesis. The second claim is not valid for arbitrary fixed U.

For a rooted tree T and epsilon(v)=(-1)^dist(root,v), each of three nonnegative channel pebble configurations C_j(v) has conserved residue Q_j=sum_v epsilon(v) C_j(v) mod 3 under legal same-channel moves (2 at v -> 1 at a neighbour), since delta=-3 epsilon(v). On chosen I initialise C_j(v) congruent epsilon(v)*lambda(v)_j mod 3 so Q equals the label sum. This is not a reachability or stackability result.

Exact examples:

- P8: Pr(|I|=4)=34/45, Pr(Q=0)=68/1575, Pr(N0=3)=1/315.
- Star K1,7: Pr(|I|=4)=0, Pr(Q=0)=0, Pr(N0=3)=0.
- Balanced double-star K1,3--K1,3: Pr(|I|=4)=7/16, Pr(Q=0)=1/40, Pr(N0=3)=0.
- Spider S(2,2,2,1): every maximal independent set has four vertices, so Pr(|I|=4)=1, Pr(Q=0)=2/35, Pr(N0=3)=1/105.

The elementary general random-bijection mixture and charge invariant are *supporting lemmas*, not the originality target. The sharp spider and complete witness-count law are the first plausible flagship; existing design/MIS literature might subsume them. Do NOT extrapolate to higher d, all extremisers, Collatz, Davenport, sunflower, HHA, or stackability.

## S003 Lean target

Proof first is complete for this *fixed-size* package. S003 should formalise minimal trusted interfaces in this order: (1) finite 4-subset quartets and pair/triple incidence certificate; (2) exact 4-MIS moment/distribution theorem conditional on that incidence; (3) combinatorial degree lemma b<=3 plus spider equality, or a kernel-proved exhaustive Fin 8 instance if that path is smaller and genuinely complete; (4) greedy law and channel invariance. Lean 4 build, axiom/placeholder audit, hosted CI required before a formalisation claim. S004 is paper + novelty audit.
