# PDIC S009 closeout — substantive Lean proof attempt; universal equality not yet certified

**Executed 16 October 2026. Outcome: PARTIAL SOURCE DELIVERABLE, STRICT HOSTED LEAN FAIL.**

## Work performed and exact proof-source evidence

On canonical unmerged proof branch `session/s007-full-lean-flagship` / [draft PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4), [commit 59d34387](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/59d34387f4a8bd299a37034d4ed878cba7be3e8d) adds proposed Lean declarations `spiderBitRows_permutation_certificate`, `spiderSideSwap`, `spiderRowPermutationIso`, `spiderColumnPermutationIso`, `spiderPattern_matrixGraph_iso` and `connected_h_three_iff_namedSpider`. The proposed public iff quantifies over *arbitrary connected* `SimpleGraph (Fin 8)`, uses the true unordered MIS triple count and constructs graph isomorphisms, including nonedges. Existing strictly verified S007/S008 proofs are preserved.

An independent Python exhaustive checker confirms the proposed structural invariant across 65,536 matrices: exactly 96 row-hub plus 96 column-hub spider cases, all normalisable by two four-side permutations and an optional side swap. This is finite corroboration, **not** a kernel proof.

[Commit 0a9961f](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0a9961f92c69027bda803c9e805349943079856b) enabled the strict workflow for pushes to the canonical proof branch, without changing the proof content. Independent finite-lead CI runs **38922630097** and **38922773677** succeeded, but did **not** compile the new Lean theorem. The strict hosted [run 38922840797](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38922840797) successfully set up Lean, resolved Mathlib and cache, then after ~6 minutes of `lake build` failed when the runner received a shutdown signal, exit code **143**. The log supplies no Lean compiler/type error and does not identify the root cause. Source guard, explicit printed axiom certification and eight independent CI scripts were **skipped**. Therefore **S009's new declarations MUST NOT BE CALLED LEAN_KERNEL_VERIFIED**.

A companion [draft PR #7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/7) was created solely for extra CI checking and remains unmerged. S007's bound certificate `ff864170...` / run 38914271558 and S008's concrete named-spider h=3 certificate `fc8581...` / run 38918496261 remain strict successes.

## Critical path still open

The exact smallest obstruction is the **unverified computational `spiderBitRows_permutation_certificate`**, whose giant `decide +kernel` case/existential-permutation search is a plausible resource bottleneck. S010 will replace it by constructive four-row-hub and four-transposed-column-hub cases and explicitly check the graph isomorphism and public equality iff. The cap-labelled complete probability law, nine-cap input, 8! uniform bijections, 16-element fibres and moments remain OPEN_IN_LEAN; novelty/priority unresolved. No Palomar, publication, correspondence or merge.

## Automatically installed, not executed

[S010 executable target](../research/S010_SPIDER_KERNEL_CLOSURE_TARGET.md) is installed in `research/NEXT_SESSION_PROMPT.md`; this does **not** execute S010. Await a new owner "run next session" instruction.
