# PDIC S002 closeout — 2026-10-15

**Exactly S002 executed. S003 is prepared but NOT executed.** All S002 assertions below distinguish written proof, local finite evidence, hosted workflow checks, and unreviewed novelty.

## Achieved mathematics

1. **Exact random greedy cap transfer.** For any eight-vertex graph with at least one edge, independent uniformly random bijection to any fixed admissible eight-cap and independent random-order greedy MIS I, Pr(sum labels(I)=0)=(2/35)Pr(|I|=4). When the cap itself is uniformly random as well, every nonzero target a has probability (1-(2/35)Pr(|I|=4))/26. The **at least one edge** hypothesis is necessary: the edgeless graph always outputs all eight labels, summing to zero.
2. **Three actual conserved tree-pebbling channel residues.** With root parity epsilon(v), Q_j=sum epsilon(v)C_j(v) mod 3 is invariant under legal two-from-v/one-to-w same-channel moves, as delta=-3epsilon(v). Initial signed channel representatives on I give precisely sum labels(I). No stackability or reachability theorem is claimed.
3. **Genuine strengthening over single-witness averaging:** complete exact distribution for N0, the number of zero-sum size-four maximal independent sets in a connected eight-vertex graph, expressed through m, n0,n2 and the C4-compatible triple count h. For M1=2m/35, M2=2n0/35+n2/315, M3=h/315, the probabilities for N0=0,1,2,3 are (1-M1+M2-M3, M1-2M2+3M3, M2-3M3, M3). The triple C4 incidence law is 1/315, not an independence assumption.
4. **Sharp new-looking cross-domain graph theorem:** for every connected eight-vertex graph, Pr(N0=3)=h/315<=1/105, equality **iff** G is the spider S(2,2,2,1) (three arms length 2, one length 1). This is proved by the balanced bipartition uniqueness and low-degree/mixed-MIS argument, independently of brute force; the spider has nine size-four MIS and greedy |I|=4 almost surely. **No publication novelty or priority is claimed.**

Full mathematical proof: [S002_GREEDY_CHARGE_SPIDER_PROOF.md](../research/S002_GREEDY_CHARGE_SPIDER_PROOF.md). Frozen scope: [FLAGSHIP_THEOREM.md](../research/FLAGSHIP_THEOREM.md); claim ledger: [CLAIMS.md](../research/CLAIMS.md).

## Verification actually performed

- Independent S002 standard-library verifier was written and **executed locally**, PASS. It checked all **36,317** connected bipartite graphs on a fixed ordered 4+4 bipartition (of 2^16 adjacency matrices), finding mixed four-MIS counts b=0,1,2,3 with frequencies (19,457, 13,212, 3,456, 192). The 192 equality cases are all labelings of S(2,2,2,1). It also checked the full N0 distribution by **2,520 equiprobable cap-atom assignments** for path, star, double-star and spider, exact rational greedy laws and charge transfer.
- Both predecessor scripts `scripts/verify_s000.py` and `scripts/verify_s001_independent.py` were run by the **hosted GitHub Actions workflow** together with `scripts/verify_s002.py`; all three individual steps concluded **success**, job conclusion **success** on [Actions run 38785264646](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38785264646), head commit [1f255af30f6cd93e9b0011dc3ef47ee9cd575f78](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1f255af30f6cd93e9b0011dc3ef47ee9cd575f78). Later metadata commits trigger further runs; this exact run verified the three scripts.
- **No PDIC Lean compilation/kernel proof.** No hidden `sorry` certificate, Palomar run, arXiv submission, journal submission or external outreach.

## Source and priority audit

Personally inspected Follett et al. (2014), *Discrete Mathematics* 337, Prop. 2.2(1), p.3: maximum AG(3,3) nine-caps are affinely equivalent and sum to zero, referencing classical classification. S002 derives from that classical input and S001's normal form. Bounded searches identified random-greedy MIS literature (Krivelevich et al. 2024), bipartite maximum-MIS literature (Liu 1993), other extremal-MIS references (Füredi 1987; Shi–Tu–Wang 2026); full source comparison of the **precise spider theorem** remains open. No search result certifies originality. Provenance: [PROVENANCE_AND_SOURCES.md](../research/PROVENANCE_AND_SOURCES.md).

## Files added / changed

- [Proof](../research/S002_GREEDY_CHARGE_SPIDER_PROOF.md), [checker](../scripts/verify_s002.py), [CI workflow](../.github/workflows/finite-lead-check.yml).
- [README](../README.md), [ROADMAP](../ROADMAP.md), [CLAIMS](../research/CLAIMS.md), [FLAGSHIP](../research/FLAGSHIP_THEOREM.md), [sources](../research/PROVENANCE_AND_SOURCES.md).
- Next **full runnable** S003 Lean prompt in [NEXT_SESSION_PROMPT.md](../research/NEXT_SESSION_PROMPT.md), and updated authoritative state.

## Next

**S003 — formalise a genuinely kernel-checked graph–quartet flagship in Lean 4 and check hosted CI.** Prioritise the conditional abstract-incidence + concrete cap instance, full count law and sharp spider bound, then greedy/charge lemmas. Carefully separate all-caps classical classification from cap-specific finite verification, avoid an unproved axiom, and record any theorem not successfully checked. Stop at S003 closeout; S004 paper stays conditional on mathematical and novelty review.
