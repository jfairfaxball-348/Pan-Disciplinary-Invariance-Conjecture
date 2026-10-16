# PDIC claim register — S010 strictly certified universal spider equality; full probability law open

Certified universal graph equality: [S010 source `c8c64e5a2a98ee359c79430293ca0738211b4215`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215), [hosted Lean `38928965168`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168) and [all eight finite checkers `38928965172`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965172) on unmerged PR #4. Main's older `PDIC.lean` is not the proof branch. See [S010 proof note](S010_EQUALITY_KERNEL_CERTIFICATE.md).

| Claim | Status | Precise boundary |
| --- | --- | --- |
| Genuine unordered three-four-MIS predicate and count | LEAN_KERNEL_VERIFIED_S007 | Finset of three distinct vertex-set MIS; exact complement and 2+2 condition |
| Unordered triple implies balanced partition; count zero without partition | LEAN_KERNEL_VERIFIED_S007 | General eight-vertex SimpleGraph, not yet the h=B counting theorem |
| Connected complementary 4-MIS partition unique up to swapping | LEAN_KERNEL_VERIFIED_S007 | Reuses S003R9 connected partition uniqueness |
| Any unordered compatible triple has an anchored 2+2 third | LEAN_KERNEL_VERIFIED_S007 | At any fixed balanced complementary partition in a connected graph |
| Anchored mixed third-set count independent of partition choice | LEAN_KERNEL_VERIFIED_S007 | Count over actual graph MIS, not yet proven bijective to unordered h(G) |
| Genuine unordered h(G)=4×4 matrix count, connected h≤3 | LEAN_KERNEL_VERIFIED_S007 | Exact S007 graph transport and h=B theorem; source ff864170..., run 38914271558 |
| Named spider concrete graph, matrixGraph isomorphism, connectedness, h=3 | LEAN_KERNEL_VERIFIED_S008 | Source fc8581d0bd117cd66c4497fa16209e3480c65ec7; run 38918496261; STRICT LEAN PASS with all eight independent checkers |
| Universal h=3 iff G is isomorphic to named spider | **LEAN_KERNEL_VERIFIED_S010** | Actual graph isomorphism, no ordered-triple shortcut, exact source `c8c64e5a2a98ee359c79430293ca0738211b4215`, Lean PASS `38928965168`; standard axioms only |
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
| h=3 iff G is isomorphic to named spider | **LEAN_KERNEL_VERIFIED_S010** | Matrix pattern transformed into actual `SimpleGraph` iso; connected `Fin 8` classification proved at exact S010 source |
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


## S008 — concrete spider Lean increment and universal isomorphism bridge boundary (16 October 2026)

Named `SimpleGraph (Fin 8)` with edges 04,05,06,07,16,25,34, explicit canonical 4×4 `matrixGraph` isomorphism, connectedness via hub walks, and the theorem `namedSpider_unorderedCompatibleTripleCount_three` have Lean source at [fc8581d0bd117cd66c4497fa16209e3480c65ec7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/fc8581d0bd117cd66c4497fa16209e3480c65ec7). `#print axioms` for these concrete declarations reports only propext, Classical.choice and Quot.sound in a successful compile at 191f2b5. Latest exact-source strict run: [38918496261](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38918496261) — STRICT LEAN PASS with all eight independent checkers. The initial failed run merely lacked reduction of named adjacency; the second compiled but source-guard rejected an innocuous comment token, which has been removed.

An explicit constructive proof normalising **every** 96 row-centred and 96 column-centred matrix to the named graph is written at [S008 note](S008_NAMED_SPIDER_NORMALISATION.md); [independent checker](../scripts/verify_s008.py) covers all 65,536 matrices and all 28 unordered adjacency/nonadjacency pairs per witness. That evidence is PROVED_WRITTEN / FINITE_CHECKED; the quantified pattern-to-actual-graph-isomorphism remains OPEN_IN_LEAN. No completed equality iff and no full cap-labelled probability law are claimed. S009 is automatically installed but unexecuted. No submissions or PR merge.

## S009 strict evidence boundary — 16 October 2026

Proposed source 59d34387 constructs row/column graph-isomorphism and public connected h=3 iff namedSpider statements. Strict source workflow head 0a9961f92c69027bda803c9e805349943079856b: [run 38922840797](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38922840797) **FAILED** with runner SIGTERM/143 during lake build after six minutes, without Lean compiler diagnostics. Full eight checkers and axiom check skipped. Earlier S007/S008 certificates remain valid. Unverified new declarations may not be labelled proved. Independent enumeration: 96 row + 96 column qualifying matrices all admit correct permutations, FINITE_CHECKED only. [S010 constructive repair installed](S010_SPIDER_KERNEL_CLOSURE_TARGET.md); no external submission.

## S010 strict universal graph equality certificate — 16 October 2026

Public `connected_h_three_iff_namedSpider` and supporting bit-mask, transpose, permutation, true-graph-isomorphism certificates passed `lake build`, strict allowed-axiom scan and all eight independent finite checkers at [exact commit `c8c64e5a2a98ee359c79430293ca0738211b4215`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215) with [Lean run 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168). The earlier S009 failure remains historical, not the current formalisation status. **Still OPEN_IN_LEAN:** admissible-cap classical linear-transfer interface, uniform label counting and the whole four-term probability theorem. [Detailed proof](S010_EQUALITY_KERNEL_CERTIFICATE.md), [S011 target](S011_CAP_INCIDENCE_UNIFORM_LABELLING_TARGET.md). Novelty, priority and Palomar registration remain unresolved/unperformed.


## S011 typed cap and labellings — 16 October 2026

**LEAN_KERNEL_VERIFIED** at [exact source e302e5f82434b3d8790c81506fe55062700e7a53](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53), [strict run 38934564596 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596): canonical 8-point `CapPoint = Fin 3 → ZMod 3` labels are injective and have no zero-sum subset of sizes 1, 2 or 3; exact zero-sum four-set equivalence with the four indexed quartets; preservation of short-zero-freeness and four-sum zero under **supplied** `LinearEquiv (ZMod 3) CapPoint CapPoint`; and actual `Fintype.card (Equiv.Perm Vertex)=40320`. These are not a proof of classical nine-cap classification or the distribution law.

**FINITE_CHECKED** by new `scripts/verify_s011.py`: all 40320 permutations, 2/35 singleton/disjoint pair probability, 1/315 overlap-two pair / compatible triple probability, each of 2520 2-overlap/triple image configurations having exactly 16 preimages; full named spider and P8 histograms. **OPEN_IN_LEAN:** transfer to arbitrary permutation-labelled graph subsets; 16-fibre cardinality proof; N₀≤3 from connectedness; moments and four-term law; conditional all-cap theorem. [Proof note](S011_CAP_LABELLING_PROOF.md); [S012 installed](S012_UNIFORM_PROBABILITY_LEAN_TARGET.md). Novelty/priority not upgraded.

S011 final hosted exact head: [7f7e32dda87983c3df619481693af5a4baff5bfd](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7f7e32dda87983c3df619481693af5a4baff5bfd), [strict Lean CI 38935115211 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211) with all nine checkers; [finite CI 38935115324 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115324). The explicit 16-fibre checks are independently executed, not Lean fibre theorems.
