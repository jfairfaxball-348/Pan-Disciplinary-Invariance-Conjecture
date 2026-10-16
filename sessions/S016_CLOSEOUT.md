# PDIC S016 closeout — real complementary pair and overlap-two fibre construction

**Executed 16 October 2026** on canonical proof branch `session/s007-full-lean-flagship`, open draft [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4). **S017 installed but NOT executed.**

## New strict certificate

`canonicalCapF3_perm_complementary_pair_event_card`: for arbitrary disjoint size-four source subsets, exactly **2304** of the 40320 true permutation labellings yield zero F₃³ sum on both. Genuine probability `2/35`. Exact proof commit [4b4b02aad5a8d1074288011976fc0c040622a4c0](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4b4b02aad5a8d1074288011976fc0c040622a4c0); strict [Lean PASS 38962481022](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38962481022); [finite PASS 38962480950](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38962480950); standard axioms only.

## Additional S016 proof work, exact status must be checked

Constructed explicit D8 symmetries of the four canonical quartets, real right-composition pair-image-fibre bijections and a Sigma decomposition of the Q0/Q1 simultaneous event into eight ordered 16-fibres. The intended theorem gives **128** permutations for the particular canonical overlapping pair. Early hosted strict runs 38962991585 and 38963206286 failed on a Lean declaration syntax issue, followed by a dependent Sigma witness elaboration issue. Repair commits include `ebf976b` and `5dc78de`. **The 128 theorem must not be described as kernel verified absent success on its exact latest theorem-bearing SHA.** Mathematical details are in [S016 proof note](../research/S016_PAIR_FIBRE_PROOF.md). Independent finite support does not replace kernel checking.

## What is not finished

This session does **not** prove the universal 128 event for arbitrary overlapping source sets, the compatible-triple event, the genuine graph-derived unordered moments, or the integrated four-term distribution with uniquely sharp spider. The complete first-paper flagship remains OPEN_IN_LEAN. No external submission, PR merge or priority assertion.

## Automatic handoff

[S017](../research/NEXT_SESSION_PROMPT.md) is installed. It must first verify/repair the most recent S016 overlap source if necessary, extend 128 from the canonical Q0/Q1 source to all two-overlap source pairs, prove compatible triples and graph moments, and complete the flagship if possible. Do not execute S017 without the next owner turn.


## S016 final certified canonical 128 event — 16 October 2026

**LEAN_KERNEL_VERIFIED:** [exact Lean source `5dc78de0aad6fa1d19bcda72e7143386f222d617`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/5dc78de0aad6fa1d19bcda72e7143386f222d617), [strict hosted `lake build`, proof-hole scan and all nine independent checkers **PASS 38963802011**](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38963802011), [independent finite **PASS 38963802113**](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38963802113). `quartet_ordered_overlap_two_orbit` proves the eight-target orbit with explicitly constructed finite permutations, `perm_pair_image_fibre_card_eq_stabilizer` bijectively transports actual image fibres, `canonical_ordered_overlap_pair_image_fibre_card` gives 16 per target, and `canonicalCapF3_perm_canonical_overlap_pair_event_card` proves exactly **128** of all **40320** actual canonical cap labellings give zero sum on both the fixed intersecting quartet source sets **Q0 and Q1**, probability **1/315**. Their `#print axioms` logs contain only `propext`, `Classical.choice`, `Quot.sound` (no `sorryAx`). This supersedes CI-pending and failed early candidate statements, but **does not yet quantify over arbitrary source pairs**. S016 separately strictly certified `canonicalCapF3_perm_complementary_pair_event_card` at `4b4b02aad5a8d1074288011976fc0c040622a4c0`, Lean PASS `38962481022`, exactly **2304** joint cap-zero permutations for **all disjoint** four-set pairs. The full moments and four-term flagship remain OPEN_IN_LEAN; S017 is installed and NOT EXECUTED. Novelty unresolved; no merge/submission.
