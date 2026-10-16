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
