# PDIC S060 — URGENT: find the actual combined Lean kernel memory failure and FIX it

**Status: INSTALLED, NOT EXECUTED.** Created by owner instruction at definitive S059 closeout, 27 October 2026. On the owner's next "run next session", act immediately on the repo. This is a practical emergency proof-engineering / verification session, not a routine diagnostic-only session. Avoid multiplying sessions without attempting a source-backed structural repair.

## Absolute target

**Make the *unchanged full unconditional eight-cap probability-law and iff named-spider flagship theorem* pass an independent exact-source verifier under realistic standard 16 GiB Palomar capacity.** The theorem/Challenge graph predicates, exact normal form, 18 actual tails and all 40320 permutations must stay exact. No shortcut to a graph-only version, no new axiom, sorry, admit, native_decide, Lean.ofReduceBool, Lean.trustCompiler, changing Challenge's ConstantInfo, downgrading verifier, or relying on Python as the proof. Zero paid hardware authorisation. If full true pass cannot be completed this session, finish as much real measured repair as possible, record the blocker precisely and install the next session with executable actions, NOT another broad exploration.

## Prior authoritative facts: stop re-running failed S059 jobs to discover what is already known

Read [definitive S059 closeout](../sessions/S059_CLOSEOUT.md), [S059 progress](../sessions/S059_PROGRESS.md), AGENTS.md, authoritative/STATE.json, original Challenge.lean, S024.lean, Solution.lean, comparator.json, the 9/11 GiB benchmark scripts and exact GitHub logs FIRST. Older 'pending' statuses in S059 chronology are superseded.

**Original Lean compilation and axioms passed for all latest candidates. All ELEVEN optimized original positive pair certificates have actually independent-checker passed. The failure is in the composed proof, not an unresolved Lean syntax or truth obligation.**

- [run 40509171492](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40509171492), exact `4a91ea2c3af6eaaf6b1f2212d9f325d081aff756` on `diagnostic/s059-recovery-late-pairs`: complete Lean build + finite predicates PASS; newly improved pairs (1,5), (1,7), (3,5) all independently kernel PASS, along with eight earlier improved pairs. Full exported flagship checker **exit 134 std::bad_alloc**, RSS 7,103,592 KiB, 9 GiB **virtual-address-space** cap, 78,845,839 exported bytes.
- [run 40508917722](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40508917722), exact `e2303b6dac6d0cd7ca3a12f0b1c30279e8d9011c` on `diagnostic/s059-remaining-positive-pairs`: individually checked four `s030_first_i_survivor_card` proofs **PASS** (RSS 1,096,208 / 2,685,920 / 2,692,340 / 3,663,360 KiB); **`s030_normalized_survivor_card` checker exit 134 std::bad_alloc at 9 GiB virtual cap**, RSS 7,091,076 KiB; **complete flagship checker exit 134 even at 11 GiB virtual cap**, RSS 9,204,044 KiB. This precisely localizes resource escalation to assembly of first-index count proofs and/or proof closure/rechecking.
- Official standard [Palomar run 40307527534](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40307527534) was also OOM around 16 GiB cgroup. **A single `leanchecker` process under a 9 GiB virtual cap is NOT equivalent to a 16 GiB Palomar comparator with multiple verification processes.** Neither success on individual roots nor green `lake build` certifies official Palomar FULL. No S059 branch merged to main, PR #24 unchanged.

Do not start another ordinary “one more pair” branch just because it was the previous routine. Current optimized positives were all individually valid yet **the composite closure still fails**. Treat this as a verifier/proof-term aggregation and memory architecture investigation with a repair obligation. The strongest available verified candidate source to protect and build from is `diagnostic/s059-recovery-late-pairs` at SHA `4a91ea2c3af6eaaf6b1f2212d9f325d081aff756`; create a NEW isolated S060 diagnostic/repair branch from it. Preserve earlier immutable benchmark SHAs.

## Action order — do real work, avoid false diagnoses

### 1. Investigate WHY the independent verifier fails, with falsifiable tests (not opinions)

Inspect exact code for `s030_first_0_survivor_card`, `s030_first_1_survivor_card`, `s030_first_2_survivor_card`, `s030_first_3_survivor_card`, `s030_normalized_survivor_card`, `s030_normalized_tail_classification`, `classicalCapNormalForm_proved`, `PDIC.palomar_complete_probability_and_spider`. Map their actual dependencies and count proof/export bytes; locate how the first-index proofs are combined by `Finset.sum_congr` and `fin_cases`. Observe that Lean theorem constants are already separate: **do not assume merely adding helper lemmas will reduce kernel memory**.

In the SAME source SHA, toolchain, primitive export roots, wall budget and VM cap, export independently checked roots:
- the existing first-index theorem constants **together** in sets {0,1}, {0,1,2}, {0,1,2,3}; compare matched standalone checks;
- the actual existing `s030_normalized_survivor_card` alone;
- `s030_normalized_tail_classification`, `classicalCapNormalForm_proved` and complete flagship to locate any additional jump in dependency closure;
- a base and unrelated fixed-size control root.

This experiment distinguishes (A) cumulative independent-checker environment memory of several separately named large certificates, (B) extra proof-term expansion/reduction in the normalization **aggregation proof itself**, and (C) later graph/normal-form wrapper costs. Save exact `leanexport` byte counts, checker rc, elapsed, peak `VmRSS` and `VmSize` or process virtual size near failure, standardized `prlimit --as`, available cgroup memory and actual process concurrency. Change one variable per comparison. Critically, a 9 GiB virtual cap producing peak 7 GiB RSS is **not evidence of only 7 GiB total demand**; virtual allocations matter. Identify the failure from measurement, not guesswork. For compounding tests, avoid running six huge checkers concurrently on a 16GiB runner and mistaking cgroup pressure for a single checker limit. Use one root per process / isolated job or explicit sequentialization.

Also inspect actual Palomar comparator/full mode settings, Leanchecker, NanoDa and con-ron jobs, log allocations, and whether preventable concurrent verifier processes, duplicate proof exports, Lean/Mathlib import closures, or checker VM settings contribute to 16 GiB cgroup OOM. **No fake success by excluding roots or changing permitted axioms.**

### 2. Diagnose architectural difference with earlier successful repos

Owner reports earlier full Palomar verifications for TreeStack, Greedy Trees, Pascal and ellipse theorem were straightforward. Compare their accessible actual `Challenge` / `Solution` / comparator and Lean theorem packaging and kernel resource footprint, where useful, with this PDIC `S024` combinatorial Boolean `decide +kernel` forest. Establish which concrete proof-term or export pattern is **different**, rather than concluding "PDIC is simply bigger." This comparison must serve repair, not external novelty review.

### 3. Implement and test a structural fix before adding more leaves

Prioritize a root-cause-driven reduction of the **combined normalised-cardinality closure**, preserving identical theorem statements and s027ShortZeroFree predicate:
- If the aggregate proof itself is pathological, rebuild `s030_normalized_survivor_card` via small, balanced, typed cardinal-sum lemmas and a short final theorem, with independently checked subresults, avoiding large expression normalization, repeated inlining/definitional unfolding and enormous high-order kernel proofs.
- If the *joint environment* is the issue even for the set of separately checked theorem constants, identify expensive remaining dependencies and address **measured sources** at proof/certificate construction level (e.g. compressed arithmetic certificates / auxiliary structural lemmas / normal-form transport vs enumerated reduction), not blind extra third-index sharding.
- If official comparator concurrency or export duplication is the true root, design a strictly equivalent sequential/streaming verifier or official-supported memory-feasible packaging while preserving full independent checking of EVERY original theorem constant, and validate with ALL intended checkers. Never just skip NanoDa/con-ron, run an altered Challenge, or count a mere lean build as Palomar FULL.

After each meaningful change run real pinned exact-source Lean compile and permitted axiom check, actual independent `leanexport` + `leanchecker --from-export` of **normalized-card and full flagship**, plus original finite predicate scripts. Quantify improvement against exact source baseline; avoid repeated diagnostic runs with no mathematical/proof-engineering edit. Prefer **one independent full-root PASS under standard memory over dozens more individually green shards**.

### 4. Real external release gate

Keep original eight `ConstantInfo` comparisons between separately compiled original Challenge and Solution, and standard permitted axioms `[propext, Classical.choice, Quot.sound]`. Strict normal-form orbit/spider and all original theorem statements intact. Run normal 16GiB Palomar FULL preflight only after measured single-root/combined verifier feasibility; read actual comparator, NanoDa/con-ron and memory statuses. No paid 32GiB runner, no registry submission, no merge of PR #24, no arXiv or journal submission without owner authorization.

## Deliverables / session discipline

1. An evidence-backed **causal explanation** (what resource is being duplicated/allocated, exactly where, supported by a discriminating experiment), with explicit separation between facts and remaining hypotheses.
2. One **implemented, hosted-tested structural repair** (or multiple if required) and a benchmark showing actual reduction in the `s030_normalized_survivor_card` **AND** full flagship kernel check, not merely leaf-level success. If time/verification still blocks, report exact next coding obligation and best checked SHA; don't imply repaired merely because branches exist.
3. `sessions/S060_CLOSEOUT.md`, updated leading AGENTS.md / authoritative/STATE.json, exact run IDs/SHAs and actual root results, and installed executable **S061** prompt for owner-triggered subsequent session. S061 installed only, NOT executed. No gratuitous protocol or external review work: fixing full verifier is top priority.

**Owner's explicit urgency:** stop the repeated cycle of successful local mathematical facts and failed full Palomar checks. Attack the underlying memory amplification. Make the next session a genuine solution attempt, not merely more observations.
