# PDIC claim register — S007 structural bridge strict PASS; S008 h-count bridge next

Exact source SHA and hosted proof certificates are in [S003R9 closeout](../sessions/S003R9_CLOSEOUT.md). Certified new Lean source remains on unmerged PR #3; main source is the earlier S003R3 baseline.

| Claim | Status | Precise boundary |
| --- | --- | --- |
| Genuine unordered three-four-MIS predicate and count | LEAN_KERNEL_VERIFIED_S007 | Finset of three distinct vertex-set MIS; exact complement and 2+2 condition |
| Unordered triple implies balanced partition; count zero without partition | LEAN_KERNEL_VERIFIED_S007 | General eight-vertex SimpleGraph, not yet the h=B counting theorem |
| Connected complementary 4-MIS partition unique up to swapping | LEAN_KERNEL_VERIFIED_S007 | Reuses S003R9 connected partition uniqueness |
| Any unordered compatible triple has an anchored 2+2 third | LEAN_KERNEL_VERIFIED_S007 | At any fixed balanced complementary partition in a connected graph |
| Anchored mixed third-set count independent of partition choice | LEAN_KERNEL_VERIFIED_S007 | Count over actual graph MIS, not yet proven bijective to unordered h(G) |
| Intrinsic unordered h(G)=4×4 matrix graph count, h(G)≤3, named spider equality | OPEN_IN_LEAN | Cardinality bijection, arbitrary graph isomorphism and final extremal transport remain S008+ obligations |
| Admissible eight-cap classification, 702 caps and linear orbit | PROVED_WITH_CLASSICAL_INPUT / FINITE_CHECKED | Nine-cap equivalence externally cited; not all-caps Lean |
| Canonical four zero quartets and C4 incidence | LEAN_KERNEL_VERIFIED | Concrete canonical cap |
| Executable IsMIS4 iff Prop MIS | LEAN_KERNEL_VERIFIED | Every Bool adjacency |
| Unique opposite-side witness and pair criterion | LEAN_KERNEL_VERIFIED | Every Boolean 4×4 matrix |
| Lossless row encoding and both exact Nat count identities | LEAN_KERNEL_VERIFIED_S003R7 | Actual mixed witness count and occupied-cell count |
| b≥4⇒e≤5; e≥8⇒b≤2; e=7 and b=3 iff spider matrix pattern | LEAN_KERNEL_VERIFIED_S003R8 | Arbitrary Bool matrices; not a graph-isomorphism declaration |
| Actual matrixGraph is a SimpleGraph on eight vertices | LEAN_KERNEL_VERIFIED_S003R9_CORE | Vertex type Fin 4 ⊕ Fin 4 |
| Independence plus domination iff maximality under inclusion | LEAN_KERNEL_VERIFIED_S003R9_CORE | Generic SimpleGraph finite vertex-set predicate |
| Actual mixed MIS vertex sets ≃ eligible left pairs, equal counts | LEAN_KERNEL_VERIFIED_S003R9_CORE | Constructed equivalence with inverse laws |
| Actual mixed graph count B≤3 under e≥6; B=3 iff pattern under e≥7 | LEAN_KERNEL_VERIFIED_S003R9_CORE | Explicit edge hypotheses |
| Connected proper Boolean colouring / complementary partition unique up to swap | LEAN_KERNEL_VERIFIED_S003R9_CORE | General vertex type; no balance assumed |
| Actual unordered edge count equals matrix occupied cells; connected B≤3 | LEAN_KERNEL_VERIFIED_S003R9 | Actual graph connectedness; exact PASS 38889327092 |
| Spider has genuine 3+1 and 1+3 four-MIS | LEAN_KERNEL_VERIFIED_S003R8 | Refutes exhaustive pure/2+2 split assertion |
| Exactly 192 labelled spider equality matrices | PROVED_WRITTEN / FINITE_CHECKED | Count not Lean |
| Two nine-total-MIS trees have h=3 and h=1 | FINITE_CHECKED_S003R9; explicit lists written | Distinguishes total MIS statistic, not priority |
| Uniform 2520 images with 16 bijections each, eight favourable triple images | PROVED_WRITTEN / FINITE_CHECKED | Actual finite probability semantics remain OPEN_IN_LEAN |
| Arbitrary connected eight-vertex h≤3, genuine unordered count and h=B transport | LEAN_KERNEL_VERIFIED_S007 | Exact source ff864170834954ef2a286afe6a6b6577ec02f986; run 38914271558; actual graph isomorphism and MIS/triple transport |
| h=3 iff G is isomorphic to named spider | PROVED_WRITTEN; OPEN_IN_LEAN | Matrix-pattern to named graph-isomorphism remains the next obligation |
| Full N0 law and sharp probability ≤1/105 | PROVED_WRITTEN_WITH_CLASSICAL_INPUT | Genuine graph/labelling probability Lean interface OPEN |
| Conditional moment inversion and rational bound | LEAN_KERNEL_VERIFIED | Arithmetic is not a probability-model proof |
| Greedy charge mixture / signed pebbling residues | PROVED_WRITTEN_ELEMENTARY | Does not prove reachability or stackability |
| Novelty, journal readiness, priority | S004_AUDITED__PRIORITY_UNRESOLVED | Cap classification classical; total-MIS tree spider class known; fixed-cardinality MIS literature established. Exact h/cap law not located in accessible texts; full Liu/Jou–Chang/Byskov primary theorem-level texts inaccessible |
| Manuscript | REVISED_LATEX_DRAFT | Compiled and visually reviewed; not submitted |
| Native/compiler axioms, proof holes or custom axioms | NOT_APPROVED | Strict CI rejects them |

## S004 source-based originality qualification — 16 October 2026

Full [claim-by-claim primary-source audit](S004_PRIOR_ART_NOVELTY_AUDIT.md) and [S004 closeout](../sessions/S004_CLOSEOUT.md). These are **novelty** judgements, separate from the unchanged proof/Lean statuses above.

| Claim family | Novelty verdict | Evidence and limitation |
| --- | --- | --- |
| Classical affine nine-cap classification | CLASSICAL / SUBSUMED | [Follett et al. (2014), Proposition 2.2](https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf) |
| Zero-fixing cap map; 702 orbit; four canonical zero-sum quartets; C4 nerve | ROUTINE_DERIVED | Canonical finite calculation and classical cap input; not a new cap classification or topological theorem |
| Known baton/spider family and nine *total* MIS extremum | CLASSICAL / SUBSUMED | [Li–Zhang–Zhang (2013), Lemma 3](https://dmtcs.episciences.org/607/pdf), citing Jou–Chang (1997) |
| Fixed-size maximal-independent-set counting as a research direction | CLASSICAL | [Nielsen (2002), Theorem 2](https://www.brics.dk/RS/02/15/BRICS-RS-02-15.pdf), [He–Nie–Spiro (2022), Theorems 1.3, 1.6](https://arxiv.org/pdf/2108.06359) |
| Exact 4×4 2+2 mixed threshold package, connected h≤3/spider iff, cap-labelled exact distribution combination | POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE / UNRESOLVED | Specific h and joint cap probability not located in compared full texts; total-MIS extremality does not determine h (explicit two-tree witness). Accessible sources do not establish priority; full Liu/Jou–Chang/Byskov theorems not compared |
| Random-bijection fibres, binomial moments, conditional greedy mixture, signed mod-3 pebbling conservation | ROUTINE_DERIVED | Elementary double counting, moment inversion, conditioning, signed parity arithmetic |
| Literature priority and publication-level significance | UNRESOLVED | Special small-order result; bounded web source search, not exhaustive expert literature review |

**No first-priority claim is licensed.** The formal source remains on unmerged PR #3, main's Lean remains the S003R3 baseline, and the written flagship is not end-to-end Lean-certified. S004 closed without setting a subsequent target. The earlier combined brief remains withdrawn. No correspondence, merge, Palomar, arXiv or journal submission.

## S005 Palomar registration reconnaissance — 16 October 2026

This was a **read-only Palomar procedure and public-record audit**, not a new proof or verification. See [official-workflow and public-display reconnaissance](S005_PALOMAR_RECON.md), [record-alignment proposal](S005_PUBLIC_RECORD_PROPOSAL.md), and [closeout](../sessions/S005_CLOSEOUT.md).

| Claim / capability | S005 status and precise limit |
| --- | --- |
| Full eight-cap law, \(\Pr(N_0=3)=h/315\le1/105\), equality at spider | PROVED_WRITTEN_WITH_CLASSICAL_INPUT; **not** certified by Palomar nor end-to-end Lean |
| Connected 4×4 SimpleGraph mixed maximal independent set bound and equality pattern | STRICT_LEAN_VERIFIED on unmerged PR #3 at exact S003R9 source; **not** Palomar Comparator verified |
| Palomar Challenge/Solution, comparator.json, v0.4 formalization.yaml, root SPDX licence and module headers | MISSING / NOT_READY; earlier Lakefile, manifest and toolchain do exist but Palomar compatibility **NOT_TESTED** |
| Palomar CI preflight and full mechanical mode | OFFICIAL PROCEDURE RESEARCHED; **NO WORKFLOW EXECUTED** |
| Public entry title, project abstract, selected compared statement, verification and citation presentation | UI SOURCE INSPECTED, PROPOSAL WRITTEN; sample TreeStack dynamic page/JSON inaccessible for direct record validation |
| Submission/registration | NOT_REQUESTED; no public PDIC registry record |
| Priority and significance | S004 PRIORITY_UNRESOLVED (unchanged); no new theorem claim |

The paper title and formula may appear in a **proposed full-claim record only if the same theorem is genuinely selected, proved and mechanically verified in the eventual Palomar Challenge/Solution**. Narrower certified statements must instead be titled and described as such. No next target automatically installed.

## S006 factual closeout and S007 owner reset — 16 October 2026

- S006 did **not** complete the full mathematical formalisation. Its separate [graph-only Palomar package](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s006-palomar-prepare) was prepared but has **no verified official full-mode mechanical PASS** at its final SHA; no registration was made.
- The previously strictly kernel-verified S003R9 graph/matrix proof remains exactly certified at source `402465f2330a275e04108169a6bfbb65e94e10b8`, Lean run 38890367785. The full flagship is **PROVED_WRITTEN_WITH_CLASSICAL_INPUT; OPEN_END_TO_END_LEAN**.
- The owner explicitly restored the **full flagship** as a mandatory Lean milestone and reactivated automatic next-session prompt generation. New formal work is to continue on `session/s007-full-lean-flagship` (the previous exact mathematical proof source, not the S006 Comparator package).
- Installed S007 attempts the genuine arbitrary-graph unordered compatible-triple invariant `h(G)`, uniqueness/transport to actual 4×4 mixed MIS count `B(A)`, `h(G)≤3`, and (where possible) equality iff named spider isomorphism. **This is an installed target, not a newly proved Lean theorem.** The general eight-cap / 8! probability model and resulting single full theorem remain further kernel obligations.
- Priority/novelty remains unresolved as in S004; no Palomar/arXiv/journal submission is authorised by the process change.

## S007 strict proof increment (16 October 2026)

Exact proof SHA [`d05fe1e71d054fe74a52a664112b6de436e999da`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/d05fe1e71d054fe74a52a664112b6de436e999da) on draft [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4) passed [strict hosted Lean + all six Python checks 38912238607](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38912238607). This status applies to those six new *structural* declarations, not to the unproved h=B equality, h≤3, spider graph isomorphism, cap classification or full distribution. [Proof scope](S007_UNORDERED_TRIPLE_BRIDGE.md). S008 target is installed automatically; no submission authorised.

## S007 continuation: full arbitrary-graph count bridge and bound

**LEAN_KERNEL_VERIFIED** at [`ff864170834954ef2a286afe6a6b6577ec02f986`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ff864170834954ef2a286afe6a6b6577ec02f986), [strict run 38914271558: PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558). The earlier d05fe1e certificate remains valid but its missing count/graph interfaces are now closed. Genuine unordered triples are in a proved bijection with anchored mixed third sets; disjoint four-sets are proved complementary on eight vertices; actual balanced vertex enumeration and graph isomorphism transfer adjacency, MIS and triple counts. The public theorem `connected_unorderedCompatibleTripleCount_le_three` assumes only a connected `SimpleGraph (Fin 8)`. Its graph/matrix representation and h=B equality are constructed conclusions. All seven finite checkers pass. [Detailed scope](S007_UNORDERED_GRAPH_BRIDGE.md).

**OPEN_IN_LEAN:** equality iff named spider, cap transfer/classical input, actual uniform bijection probability model and complete four-term theorem. No novelty or publication-status upgrade. S008 named-spider prompt is installed, not executed; the older h-count prompt/scaffold is superseded.
