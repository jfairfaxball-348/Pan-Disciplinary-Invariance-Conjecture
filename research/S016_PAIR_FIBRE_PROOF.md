# PDIC S016 — actual complementary pair and ordered overlap-two fibre proof

16 October 2026. Canonical Lean proof branch: `session/s007-full-lean-flagship` (unmerged draft PR #4). This is **not** full end-to-end certification of the flagship probability theorem.

## Verified new theorem: complementary pair 2304

Exact proof-bearing commit [`4b4b02aad5a8d1074288011976fc0c040622a4c0`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4b4b02aad5a8d1074288011976fc0c040622a4c0), [strict hosted Lean kernel workflow 38962481022 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38962481022), [finite workflow 38962480950 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38962480950).

The public theorem `canonicalCapF3_perm_complementary_pair_event_card` quantifies over **arbitrary disjoint** `s,t : Finset (Fin 8)` of cardinality four and over the actual 8! permutation-labelled cap sample space. It proves exactly 2304 labellings satisfy **both** canonical F₃³ zero-sum events. The construction is algebraic: the sum of the eight canonical cap points vanishes; a permutation preserves the total sum; a disjoint pair of size-four source sets partitions all eight vertices; hence zero sum on one member iff zero sum on its complement. A genuine `Equiv.subtypeEquiv` then transfers the previously verified singleton-fibre cardinal 2304 to the joint event. This closes the manuscript's complementary-pair probability \(2/35\) for all disjoint pairs, not merely for the named spider.

Supporting declarations: `canonicalCapF3_total_zero`, `canonicalCapF3_perm_total_zero`, `canonicalCapF3_perm_disjoint_pair_sum_zero`; all four report only `propext`, `Classical.choice`, `Quot.sound` in `#print axioms`. No graph-independent theorem is being passed off as an unordered graph moment.

## Ordered overlap-two event: mathematical construction and proof status

The genuine 128-count mechanism uses four two-vertex atoms A={0,1}, B={2,3}, C={4,5}, D={6,7}, with Q0=A∪C, Q1=A∪D, Q2=B∪C, Q3=B∪D. There are exactly eight ordered canonical quartet pairs with two-point overlap. Three explicit permutations exchanging A/B, C/D, and the two coordinate axes generate eight dihedral images of the ordered base pair (Q0,Q1). Hence all eight target pairs are in a constructive orbit, verified by a small eight-symmetry finite certificate, **not** by exhaustive testing of 40320 label permutations.

A right-translation bijection of actual permutations carries each ordered pair-image fibre to the Q0/Q1 image stabilizer, whose size 16 was strictly certified in S015. Thus the real joint zero event for prescribed **canonical source** Q0,Q1 should have eight disjoint fibres of 16, giving 128 actual permutations and probability 1/315. This is the content of candidate declarations `quartet_ordered_overlap_two_orbit`, `perm_pair_image_fibre_card_eq_stabilizer`, `canonical_ordered_overlap_pair_image_fibre_card`, and `canonicalCapF3_perm_canonical_overlap_pair_event_card`.

The earlier candidate `8b80b043` failed solely because a doc comment was immediately followed by `set_option` rather than a declaration. The `e8563c5b` candidate additionally exposed an incorrectly nested dependent Sigma witness; its proof must not be certified. These issues were repaired in subsequent source. **Do not promote the ordered-128 theorem until its exact-source strict hosted Lean workflow is PASS.** The statement only handles the canonical Q0/Q1 source, not arbitrary prescribed size-four sets intersecting in two vertices.

## Still open

The all-source two-overlap 128-event theorem needs an explicit 2/2/2/2 cellwise permutation transporter; compatible unordered triple 128 events need the unique disjoint pair; actual `GraphMIS` first/second/third factorial moments need correct double counting; the single four-term law and spider sharpness are not yet integrated in Lean. The classical arbitrary-cap normal form is supplied only as an external premise, not axiomatized. Novelty and priority remain unresolved; no PR merge, Palomar registration, arXiv or journal submission occurred.

[S017 next target](S017_FULL_PAIR_MOMENTS_TARGET.md) preserves these exact obligations and the strict proof-first gate.


## Final exact-source kernel certification: canonical ordered overlapping source pair

**LEAN_KERNEL_VERIFIED.** Candidate repaired by [commit `5dc78de0aad6fa1d19bcda72e7143386f222d617`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/5dc78de0aad6fa1d19bcda72e7143386f222d617) and strictly verified at [Lean run **38963802011 PASS**](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38963802011), [finite run **38963802113 PASS**](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38963802113). The checked Lean declarations certify the eight explicit design symmetries, real pair-image fibre transport, 16 fibres per ordered overlapping canonical quartet pair, and the **128-permutation simultaneous cap-zero event for fixed source Q0/Q1**. `#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`; the hosted build, proof-hole scan and nine independent checkers passed. All earlier syntax and dependent-witness errors are resolved by this exact proof SHA; earlier CI-unverified notes are superseded. This strict certificate does **not** extend the 128 event to arbitrary overlapping source sets: the cellwise transporter and real unordered MIS moments remain the next mathematical obligations in S017. The general disjoint pair 2304 theorem is independently certified at `4b4b02aad5a8d1074288011976fc0c040622a4c0` / Lean run `38962481022`.
