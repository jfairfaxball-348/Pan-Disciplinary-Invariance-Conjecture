# PDIC S004 — primary-source prior-art and novelty audit

**Executed:** 16 October 2026. **Disposition:** completed bounded source audit; **no established originality/priority** for the flagship. This is an audit of the frozen S003R9 mathematical package, not a new theorem, a proof of novelty, or a publication decision.

## 1. Source pin and exact object audited

- Opening main branch: [cc725e443d39685fc901669bb28c26b58a574783](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/cc725e443d39685fc901669bb28c26b58a574783), containing the S004 owner-installed brief. Main's PDIC.lean remains the earlier S003R3 baseline.
- Unmerged [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), audit opening head [da6e148f56dae2d67c872518a136faf801978c42](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/da6e148f56dae2d67c872518a136faf801978c42), includes the later certified source. The final pre-audit strict certificate remains [402465f2330a275e04108169a6bfbb65e94e10b8](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8), [hosted Lean PASS 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785) plus [independent finite workflow 38890368126](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890368126). S004 makes **no new Lean or finite-computation certification claim**.
- Exact pre-audit mathematical targets: [FLAGSHIP_THEOREM](FLAGSHIP_THEOREM.md), [S002 written proof](S002_GREEDY_CHARGE_SPIDER_PROOF.md), [S003R9 graph/semantics boundary](S003R9_GRAPH_WITNESSES_AND_SCOPE.md), [S003R9 closeout](../sessions/S003R9_CLOSEOUT.md), and [the five-page research draft](../paper/PDIC_S003R8_DRAFT.tex).

One must not conflate: **(A)** a classical nine-cap input; **(B)** an explicit canonical quartet computation; **(C)** strictly Lean-certified 4-by-4 matrix and constructed SimpleGraph mixed-MIS statements; **(D)** a complete *written* connected-eight-vertex h/spider theorem and uniform-labelling probability law; and **(E)** novelty, which neither (C) nor (D) certifies. The arbitrary-graph unordered-triple h=b bridge, named spider isomorphism, and uniform-labelling probability remain outside end-to-end Lean certification.

## 2. Sources actually inspected and their access standard

Source locations below are **printed page numbers** where available. A full primary source was inspected in PDF only where explicitly so labelled; abstracts are not substituted for absent theorems.

**[F14], full author-hosted primary PDF:** M. Follett, K. Kalail, E. McMahon, C. Pelland, R. Won, *Partitions of AG(4,3) into maximal caps*, Discrete Mathematics **337** (2014), 1–8, [DOI 10.1016/j.disc.2014.08.002](https://doi.org/10.1016/j.disc.2014.08.002), [full text](https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf). **Proposition 2.2, p. 3:** maximal nine-caps in AG(3,3) are affinely equivalent; the article also addresses their zero-sum property. This is an explicit classical input, not a PDIC graph result. The proposition by itself is **affine**; fixing zero before claiming a **linear** map preserving zero-sum quartets is a separate PDIC argument.

**[L93], publisher abstract only:** J. Liu, *Maximal independent sets in bipartite graphs*, Journal of Graph Theory **17** (1993), 495–507, [DOI 10.1002/jgt.3190170407](https://doi.org/10.1002/jgt.3190170407), [publisher abstract](https://onlinelibrary.wiley.com/doi/abs/10.1002/jgt.3190170407). The accessible primary abstract explicitly concerns extremal **total** maximal-independent-set counts for bipartite graphs, including connected graphs; **full theorem wording, hypotheses, equality classification and theorem numbers not accessible here**. No claimed exclusion of h from Liu's full text is justified.

**[JC97], publisher abstract + independently attributed result in [LZZ13]:** M. Jou, G. Chang, *Maximal independent sets in graphs with at most one cycle*, Discrete Applied Mathematics **79** (1997), 67–73, [DOI 10.1016/S0166-218X(97)00033-4](https://doi.org/10.1016/S0166-218X(97)00033-4). The accessible publisher abstract concerns extremal **total** MIS counts for trees/unicyclic graphs; **the full primary text/theorem numbering was not accessible**. The published open [LZZ13] explicitly cites their work for the baton extremisers.

**[LZZ13], full open primary PDF:** S. Li, H. Zhang, X. Zhang, *Maximal independent sets in bipartite graphs with at least one cycle*, Discrete Mathematics & Theoretical Computer Science **15**(2) (2013), 243–258, [full text](https://dmtcs.episciences.org/607/pdf), [DOI 10.46298/dmtcs.607](https://doi.org/10.46298/dmtcs.607). **Lemma 3, pp. 245–246** records the classical tree MIS maximum and the equality families B(2,(n−2)/2), B(4,(n−4)/2) for even n, attributing the underlying result to [JC97]. For n=8 its total-MIS ceiling is 9; B(2,3) includes both the spider and a non-isomorphic split-baton. **Theorem 2(i), pp. 247–248** instead bounds total MIS in bipartite graphs with a cycle; its cyclic hypothesis cannot be imported into a tree extremiser. Neither identified statement counts compatible triples h.

**[N02], full primary PDF:** J. M. Nielsen, *On the Number of Maximal Independent Sets in a Graph*, BRICS Research Series **RS-02-15** (2002), [full PDF](https://www.brics.dk/RS/02/15/BRICS-RS-02-15.pdf). **Theorem 2, printed p. 3:** sharp general upper bound for the number of maximal independent sets of prescribed size k in an n-vertex graph: floor(n/k)^(k−r) times (floor(n/k)+1)^r, with r=n mod k. For n=8, k=4 this is 16. This directly defeats the suggestion that **size-refined MIS counting as a topic** is new, but gives no sharp connected-eight-vertex mixed 2+2 or h≤3 conclusion: it allows up to 16 fixed-size MIS with no compatibility condition.

**[B04], abstract/publisher indexing only:** J. M. Byskov, *Enumerating maximal independent sets with applications to graph colouring*, Operations Research Letters **32**(6) (2004), 547–556, [DOI 10.1016/j.orl.2004.03.002](https://doi.org/10.1016/j.orl.2004.03.002). Its available abstract/indexing describes enumeration by prescribed cardinality. **Full theorem-level comparison not performed**; [N02] supplies a fully accessible primary cardinality-refined result instead.

**[HNS22], full arXiv primary manuscript:** X. He, J. Nie, S. Spiro, *Maximal independent sets in clique-free graphs*, European Journal of Combinatorics **106** (2022), 103575, [manuscript](https://arxiv.org/pdf/2108.06359), [DOI 10.1016/j.ejc.2022.103575](https://doi.org/10.1016/j.ejc.2022.103575). **Theorem 1.3** reproduces the general sharp fixed-k count and credits Nielsen; **Theorem 1.6** gives fixed-k maximal independent set estimates for triangle-free graphs. These concern different hypotheses/statistics from a compatible complementary triple, but make the surrounding size-refined and triangle-free literature unmistakably nonempty.

Search also examined exact/alternate phrases around admissible eight-caps, zero-sum quartets, affine-cap incidence, fixed-size/maximal independent sets, connected bipartite extremisers, mixed 2+2 sets, common complement, compatible triples, random cap vertex bijections and the three-witness probability. This was **targeted web-accessible searching, not an exhaustive MathSciNet/ZbMATH/citation-network systematic review**. No full [L93] or [JC97] theorem was read; inaccessible potential overlaps remain material gaps.

## 3. Direct mathematical comparison

### 3.1 Finite geometry is largely inherited/elementary

Let U be an admissible eight-subset of F_3^3\{0}, i.e. no nonempty zero-sum set of size 1, 2 or 3. Then U∪{0} is a nine-cap. [F14, Proposition 2.2] supplies **affine** equivalence to the quadratic-graph canonical cap W0. The S003R9 manuscript explicitly constructs affine automorphisms of W0 acting transitively on its nine points, and composes an equivalence with one moving the image of the source origin back to the origin. An affine map fixing the origin is linear. **This zero-fixing correction is necessary:** translations need not preserve sums of four points in characteristic three (the sum shifts by 4t=t).

For canonical W0\{0}, the four zero-sum four-subsets are Q_ij=A_i∪B_j with i,j∈{1,2}, where the A and B atoms each have cardinality two. Their intersection graph is a 4-cycle; there are two complementary pairs, and the other four unordered pairs overlap in two vertices. This **precise four-quartet computation is an elementary finite deduction once [F14] is invoked**, not a proved new classification of caps. The count 702 admissible caps, one GL(3,3) orbit and stabiliser 16 are elementary orbit-count consequences of that setup and its stabiliser calculation, *not new priorities established by S004*. An abstract C4 nerve has H_1≅Z; no independent topological advance is evidenced.

### 3.2 MIS literature overlaps substantially, but identified bounds do not force the mixed theorem

Define b(A) for a Boolean 4×4 bipartite adjacency matrix as the number of 2+2 **maximal** independent sets, equivalently eligible left two-subsets X with unique right partner Y=R\N(X). The PDIC finite theorem gives b≥4⇒e≤5, e≥8⇒b≤2, and (e=7,b=3) iff a row/column spider matrix. On actual connected balanced 4+4 graphs, e≥7 and b≤3, with the pattern equality case. PR #3 has separately certified the matrix count-to-SimpleGraph equivalence. The mathematical written proof additionally relates b(A) to a compatible **unordered triple count** h(G) on arbitrary connected eight-vertex G.

**[L93]** covers extremal total MIS in connected bipartite graphs, and **[JC97]/[LZZ13, Lemma 3]** cover total MIS extremal trees. The PDIC spider is *not* an unknown tree shape and its total count 9 is *not* a new extremal fact. The split-baton counterexample (edges 01,02,14,16,23,45,67) and S(2,2,2,1) both attain total MIS 9, yet their four-vertex MIS counts are respectively 6 and 9, and h values 1 and 3. Consequently a theorem giving only the extremal **total** MIS count does **not as stated** identify PDIC's sharp h extremiser.

**[N02, Theorem 2]** and **[HNS22, Theorems 1.3/1.6]** concern *size-refined* counts, so it is wrong to advertise b or size-four counting as a new type of MIS enumeration. However their cited exact 8,4 upper bound of **16** is weaker than and structurally different from the 4+4, e≥7, b≤3 statement: the 16 bound lacks a connectedness/edge threshold, an exact side balance, a required complementary MIS pair, and the intersection-triple structure. This is a direct **nonimplication by theorem statement**, not proof of priority for the PDIC special case. [B04] might offer further fixed-cardinality machinery but its full text was not compared.

**Precise positive novelty candidate, with limits:** the conjunction “connected graph on eight vertices; count unordered triples of four-MIS with a complementary pair and 2+2 third set; sharp h≤3; equality only the spider S(2,2,2,1)” was not located **as stated** in the accessible theorems above. Its proof is short and specialised, and the shape already sits in a classical extremal family; it may be an easy consequence, an overlooked corollary, or previously phrased under distinct terminology. **Priority remains UNRESOLVED.** For the purely 4×4 finite-matrix three-threshold package, no direct published exact statement was found, but that too is not a priority certificate; as a 65,536-case theorem, its standalone significance is limited.

### 3.3 Probability law: routine machinery plus specialised graph input

For a fixed admissible cap U and uniformly chosen bijection λ:V(G)→U, let F(G) be the four-vertex MIS and let N0 count members whose labels sum to zero. Set m=|F|, n0/n2 the numbers of unordered pairs intersecting in 0/2 vertices, h the compatible triples, and

- M1=2m/35;
- M2=2n0/35+n2/315;
- M3=h/315.

From the four-quartet incidence pattern: a specified four-set is zero with probability 4/C(8,4)=2/35; a specified disjoint pair likewise with 2/35; a specified overlap-two pair with 8/2520=1/315; a compatible triple with 8/2520=1/315. Uniformity is genuine: each arrangement of four two-member membership atoms has (2!)^4=16 preimage bijections among 8!=40320. Noncompatible triple events have probability zero. A connected G cannot realise all four canonical zero quartets as independent sets, hence N0≤3. Invert binomial factorial moments E[C(N0,j)] = Mj to get

- P(N0=0)=1−M1+M2−M3;
- P(N0=1)=M1−2M2+3M3;
- P(N0=2)=M2−3M3;
- P(N0=3)=M3=h/315≤1/105.

**The counting/bijection-pushforward and moment inversion are ROUTINE_DERIVED** once the quartet intersection scheme and graph statistic h are supplied. The particular specialization to random labellings by this F_3^3 eight-cap, its exact joint design-incidence constants, and the sharp equality statement were **not identified as an explicit theorem** in these accessible primary sources. That is evidence of an *unmatched combination*, not evidence of historical first discovery. Novelty of the combined graph-design theorem is accordingly **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** only in this limited sense; final priority **UNRESOLVED**.

### 3.4 Supporting transfers are not independent claims to originality

The random-order greedy MIS I is independent of λ. For G with at least one edge, I cannot have eight vertices and the conditional zero-probability is 2/35 precisely when |I|=4. Hence P(charge zero)=(2/35)P(|I|=4), by conditioning: **ROUTINE_DERIVED** from symmetry and the cap profile. The edgeless graph violates the formula; for a fixed cap no symmetry of nonzero charge values is asserted. The purported “cross-disciplinary” label does not change the proof.

For a bipartitely signed rooted tree with ε(v)=(-1)^distance, a channel move 2 at v→1 at adjacent w changes Q_j=Σ ε(v)C_j(v) mod 3 by −2ε(v)+ε(w)=−3ε(v)=0: an elementary **ROUTINE_DERIVED** conservation law, not reachability/stackability. Neither use of three channels nor attachment to the greedy charge law was shown here to constitute a new pebbling theorem. The elementary C4 nerve interpretation likewise adds no independent topological novelty.

## 4. Claim-by-claim verdict register

Verdict meanings: **CLASSICAL** = directly supported known mathematical result; **SUBSUMED** = existing cited theorem already covers asserted statement; **ROUTINE_DERIVED** = transparent elementary deduction after known/frozen inputs; **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** = a precise distinction relative to *accessible* compared results, never proof of priority; **UNRESOLVED** = available evidence insufficient to exclude prior equivalent work.

| Frozen substantive PDIC claim | Closest located result / direct comparison | S004 novelty verdict | Limit of this verdict |
| --- | --- | --- | --- |
| Every maximal nine-cap of AG(3,3) is affinely equivalent | [F14] Prop. 2.2 p. 3 says so | **CLASSICAL; SUBSUMED** | Explicit external input |
| Zero-fixing affine-to-linear transport for canonical nine-cap | [F14] affine classification + canonical affine automorphism | **ROUTINE_DERIVED** | Careful necessary correction, not independent classification |
| 702 admissible U; unique GL orbit / stabiliser 16 | [F14] classification plus orbit arithmetic and S001 counting | **ROUTINE_DERIVED** | Exact counts not asserted verbatim in [F14] |
| Four canonical zero-sum quartets, Q_ij=A_i∪B_j, C4 intersections | Quadratic cap normal form + direct finite calculation | **ROUTINE_DERIVED** | Explicit formula not located in cited source; short computation |
| C4 nerve/H1=Z | Elementary homology of four-cycle | **CLASSICAL; ROUTINE_DERIVED** | No independent topology result |
| General independence+domination ⇔ maximal independence, unique opposite partner | Standard finite graph definitions; elementary bipartite domination | **ROUTINE_DERIVED** | Lean proof is verification, not novelty |
| 4×4 thresholds b≥4⇒e≤5, e≥8⇒b≤2; e=7,b=3 iff matrix spider | [L93]/[LZZ13] total-MIS; [N02]/[HNS22] cardinality-specific but broader/different | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** | No exact matching accessible statement; n=8 tiny special case; full [L93]/[JC97]/[B04] unavailable |
| Connected 4+4 b≤3, equality row/column spider | Same comparison; e≥7 from connectivity | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** | Equality tree already classical as a total-MIS extremiser |
| Spider shape and total MIS 9 as a tree extremiser | [LZZ13] Lemma 3 p.245–246, citing [JC97] | **CLASSICAL; SUBSUMED** | Does not count h |
| Compatible unordered triple statistic h and h≤3 iff spider | [LZZ13] total-MIS does not distinguish split baton (h=1) from spider (h=3); [N02] fixed-size upper bound 16 not sharp for h | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** | Full source overlap still **UNRESOLVED**; written proof, no end-to-end Lean h theorem |
| Nine-total-MIS, differing h (3 vs 1) example | Direct finite enumeration of two classical family members | **ROUTINE_DERIVED** | Valid separation from total MIS only; not a novelty proof |
| Uniform bijection fibres 16, single/pair/triple event probabilities | Elementary combinatorial design incidence and double counting | **ROUTINE_DERIVED** | Counts specialised to cap quartet C4 |
| Binomial moment inversion and full four-value N0 distribution given m,n0,n2,h | Standard factorial moment inversion after C4 probabilities | **ROUTINE_DERIVED** | Formula as a joint *application* might be otherwise unpublished |
| Combined eight-cap labelling law and P(N0=3)≤1/105 iff spider | No identical graph/finite-design joint result located in examined full sources | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** | **UNRESOLVED priority**; 1/105 follows routinely from h≤3 |
| Greedy zero-sum mixture (with edge hypothesis) | Conditional on |I| and uniform images of k-subsets | **ROUTINE_DERIVED** | Edgeless counterexample must remain visible |
| Three-channel signed mod-3 pebble residues | Direct bipartite parity change −3ε(v) | **ROUTINE_DERIVED** | No legal-reachability theorem |
| Publication-level originality, strength beyond finite eight-vertex package | Insufficient full primary-source coverage | **UNRESOLVED** | Lean CI, exhaustive checking and changed terminology are not novelty checks |

## 5. Audit's overall assessment

1. **The large-sounding Pan-Disciplinary Invariance Conjecture name is not a mathematical generality claim.** The validated result is an exact *eight-vertex, eight-cap* finite combination. No dimension-free pan-disciplinary invariance theorem is present.
2. **Several advertised ingredients are classical or routine:** nine-cap classification, pre-existing baton/spider extremality for total MIS, fixed-cardinality MIS theory as a field, elementary conditional probabilities, factorial-moment inversion, and parity-signed mod-three conservation.
3. **A sharply specified unmatched combination remains:** compatible 2+2 triple statistic h on connected eight-vertex graphs, a spider-equality finite theorem, and a zero-sum cap-labelled random variable with complete law. Compared primary statements do **not** directly state this combination. Their inability to determine h from the *total MIS extremum* is witnessed concretely. **But the result is small and specialised**, with substantial risk of being an unremarked classical corollary or alternate formulation. Mathematical originality and journal significance are **not established**.
4. The most defensible significance is **a carefully certified interdisciplinary worked example and a transparent exact distribution**, not a field-level conjecture, new cap classification, generally new MIS enumeration framework, or new pebbling invariant. Whether the combination is sufficiently substantial for a research paper remains an **independent unresolved editorial question**.
5. **Access limitations are decisive.** The accessible [L93] and [JC97] primary items were abstracts only, [B04] full proof unavailable, and no exhaustive citation-index search was completed. One cannot infer the absence of a size-refined/compatible-triple equivalent from those inaccessible articles, or claim priority based on a failed search phrase.
6. **Proof/formalisation status unchanged.** PR #3's strict Lean certification is genuine for its finite graph/matrix appendix; the complete h/graph-isomorphism/labelling law remains written (conditional on classical [F14]) and is not a single kernel-verified theorem. This audit does not prove or disprove those written assertions and supplies no new CI run.

**S004 audit verdict:** **COMPLETE as a bounded, source-backed prior-art audit; NOVELTY/PRIORITY STILL UNRESOLVED.** Tentative novelty is confined to the exact mixed-MIS/compatible-triple/finite-cap-probability *combination*, not its classical components. No new theorem target adopted or silently substituted.

## 6. Audit scope/verification record

Verification consisted of checking the frozen statements against the source-located results and inspected full-text/abstract access levels above; reading the documented strict GitHub CI certificate and unmerged PR context; checking that the claimed counterexample is limited to distinguishing h from total MIS; and elementary independent derivations of 2/35, 1/315, 1/105 and the Nielsen 16 bound. **No manuscript rewrite, code change, new formal proof, fresh Lean build, large external search guarantee, paper submission, correspondence, PR merge or other-repository mutation.**

Owner-directed closeout is at [S004_CLOSEOUT](../sessions/S004_CLOSEOUT.md). No later session target is proposed or installed.
