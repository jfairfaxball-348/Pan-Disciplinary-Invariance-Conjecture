# Source audit and provenance — PDIC through S002 (2026-10-15)

## Project input repositories pinned

- [Inverse-Zero-Sum-Research](https://github.com/jfairfaxball-348/Inverse-Zero-Sum-Research/tree/496cefb8e0672d069991f759adbfbc954b70f471) commit `496cefb8e0672d069991f759adbfbc954b70f471`: Candidate3.lean, `InverseZeroSum.Candidate3.frozenClassification`; the length-24 theorem's inner-joint avoidance is not short-freeness of the full repeated sequence.
- [Greedy-Uniformity-on-Trees](https://github.com/jfairfaxball-348/Greedy-Uniformity-on-Trees/tree/a4c4493a5fff82dfb085f59de41393b862af63a3) commit `a4c4493a5fff82dfb085f59de41393b862af63a3`: independently random permutation and greedy maximal-independent-set process; its existing Lean verification is not imported into PDIC.
- [TreeStack-Structural-Certificates-for-Stacking-on-Trees](https://github.com/jfairfaxball-348/TreeStack-Structural-Certificates-for-Stacking-on-Trees/tree/e1e437b8d02552b7c7ee0c4c74041b6ac956f063) commit `e1e437b8d02552b7c7ee0c4c74041b6ac956f063`: rooted tree-pebbling transfers and branch-message framework. PDIC's signed mod-three residue is a much weaker, compatible necessary invariant under legal moves; **not** TreeStack's stackability test.
- S000 PDIC baseline [commit `8ea43f617b9a2007bdb759972a14325529353ca3`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/8ea43f617b9a2007bdb759972a14325529353ca3).
- Other motivating *but not logically imported* projects: ProbStack, TreeForge, sunflower-structures-programme, HHA, Davenport-Counterexample-Hunt, Pascal-Extremes and pascal-minus-one.

## Primary classical geometry source (source text actually checked in S002)

Michael Follett, Kyle Kalail, Elizabeth McMahon, Catherine Pelland and Robert Won, **“Partitions of AG(4,3) into maximal caps,”** *Discrete Mathematics* **337** (2014), 1–8, DOI [10.1016/j.disc.2014.08.002](https://doi.org/10.1016/j.disc.2014.08.002), publicly accessible [PDF](https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf).

Page 3, Proposition 2.2(1): all maximum nine-caps in AG(3,3) are affinely equivalent, and their coordinate sum is zero. Its proof explicitly traces classification to Bose (1947), Barlotti (1955), Panella (1955), elliptic quadrics and projective ovoid equivalence. The full S001 702-cap result is proved *using* this classical theorem, not claimed independently.

Davis–Maclagan, *The Joy of SET*, chapter 9: beware complete eight-caps; arbitrary complete eight-caps are not equivalent, whereas here the admissible eight-cap plus 0 forms a maximum nine-cap.

Karapetyan and Karapetyan (2024), “Complete Caps in Affine Geometry AG(n,3),” *Pattern Recognition and Image Analysis* **34**, 74–91, DOI 10.1134/s1054661824010097; abstract context only, not read as full primary proof.

## S002 bounded mathematical prior-art search

Looked at:

- Krivelevich et al., **“Greedy maximal independent sets via local limits,”** *Random Structures & Algorithms* (2024), DOI [10.1002/rsa.21200](https://doi.org/10.1002/rsa.21200). Standard random-permutation greedy MIS and exact/asymptotic tree analyses. The simple conditional expectation and greedy recurrence are not priority candidates.
- Jiuqiang Liu, **“Maximal independent sets in bipartite graphs,”** *Journal of Graph Theory* **17** (1993), DOI [10.1002/jgt.3190170407](https://doi.org/10.1002/jgt.3190170407). Retrieved abstract establishes extremal count context; full article was **not** read, so possible overlap with our *balanced mixed 4-MIS* extremal lemma remains to be checked.
- Füredi, **“The number of maximal independent sets in connected graphs,”** *Journal of Graph Theory* **11** (1987), 463–470, DOI [10.1002/jgt.3190110403](https://doi.org/10.1002/jgt.3190110403). Historical global extremal MIS bounds; full proof not inspected.
- Shi, Tu and Wang, **“Maximal independent sets in graphs with a given matching number,”** *Discrete Mathematics* **349** (2026), article 114880, DOI [10.1016/j.disc.2025.114880](https://doi.org/10.1016/j.disc.2025.114880); broad extremal MIS framework, full proof not inspected.
- Tian and Tu (2025), *Discrete Applied Mathematics* 368, 52–65, DOI [10.1016/j.dam.2025.02.027](https://doi.org/10.1016/j.dam.2025.02.027), minimum MIS counts by graph family; contextual rather than direct proof of our target.

Search formulations included “zero-sum quartet joint probability,” “balanced bipartite four plus four mixed maximal independent sets,” “maximal independent set spider triple saturation,” and “random greedy independent sets exact law”. No exact duplicate of the combined S002 theorem was located in the retrieved materials. **This is NOT proof of novelty**: the 4+4 structural bound may be a known special case of bipartite MIS results, and the cap quartet pair/triple incidences may already be implicit in finite designs.

## Proven statements and boundary

**CLASSICAL INPUT:** nine-cap maximum size and affine equivalence; sum zero.

**S001 PROVED WITH CLASSICAL INPUT:** 702 orbit, 16 stabiliser, four-quartet C4 profile, pair joint law, connected-graph obstruction.

**S002 PROVED WITH SAME INPUT:** three-quartet joint probability `1/315`, complete graph four-MIS zero-witness count distribution, sharp `Pr(N0=3)<=1/105` equality precisely the spider `S(2,2,2,1)`, conditional greedy zero law under graph edge hypothesis, and signed three-channel pebble invariants.

**FINITELY CHECKED:** `scripts/verify_s002.py`, 36,317 connected labelled 4+4 bipartite graphs and 2,520 cap-atom assignments, all exact rational, corroborating the written proof. S000/S001 scripts are part of the hosted workflow. Finite check does not establish publication priority or Lean proof.

**NOT CLAIMED:** first-worldwide proof, peer review, a general PDIC conjecture, any Collatz/Davenport/sunflower/HHA problem solved, a TreeStack stackability criterion, higher-dimensional invariance, or a guaranteed four-session publication.

## S003 / S004 review priorities

S003 must distinguish (i) a theorem conditioned on abstract quartet incidence and (ii) a kernel-proved actual canonical cap instance; do not smuggle nine-cap classification in as an undocumented Lean axiom. S004 must inspect the *actual text* of prior bipartite-MIS/finite-design sources and test whether the spider extremality theorem is a trivial special case or has nontrivial new content before deciding the paper title and venue.
