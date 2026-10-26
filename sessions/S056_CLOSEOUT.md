# PDIC S056 closeout — finite-zero certificate proof repair under exact-source verification

**Date:** 26 October 2026. **Status:** EXECUTED PARTIALLY — real proof repair committed on an isolated branch; exact-source compiler and kernel profiling PENDING. S057 is installed but NOT executed.

## Conclusive S056 diagnostic

Workflow [40332800915](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40332800915) on diagnostic SHA `b7126a03382e3cd9e16d7a1f2d9d6f0b3abe7e9c` completed and uploaded artifact `s056-pair-shard-cost-evidence` (ID `12656649263`). Pinned Lean source build and flagship allowed axiom print succeeded. **Workflow success is instrumentation success, not kernel success for each tested proof.**

Per-case independent `leanchecker --from-export` measurements under 9 GiB **per-process virtual address space**, 150 s deadline:

| Root | Checker exit | Peak RSS (KiB) | Observation |
| --- | ---: | ---: | --- |
| `s029_pair_0_1_survivor_card` | 1 | 7,072,952 | `INTERNAL PANIC: out of memory` |
| `s029_pair_0_2_survivor_card` | 134 | 7,105,736 | `std::bad_alloc` |
| `s028_pair_0_3_survivor_card` | 0 | 5,804,168 | Kernel PASS, but very expensive |
| `s029_pair_0_4_survivor_card` | 0 | 3,653,052 | Kernel PASS |
| `s029_pair_0_5_survivor_card` | 0 | 2,681,996 | Kernel PASS |
| `s029_pair_0_6_survivor_card` | 0 | 1,587,840 | Kernel PASS |
| `s029_pair_0_7_survivor_card` | 0 | 1,038,964 | Kernel PASS |
| `s029_pair_0_8_survivor_card` | 0 | 679,240 | Kernel PASS |
| `s029_pair_0_9_survivor_card` | 0 | 456,912 | Kernel PASS |
| `s029_pair_0_10_survivor_card` | 0 | 315,696 | Kernel PASS |
| `s029_pair_0_11_survivor_card` | 0 | 256,252 | Kernel PASS |
| `s029_pair_0_12_survivor_card` | 0 | 185,728 | Kernel PASS |
| `s029_pair_0_13_survivor_card` | 0 | 153,704 | Kernel PASS |
| structural sum | 0 | 165,968 | Kernel PASS |
| combined pair roots 1–6 | 124 | 7,104,044 | timeout/resource bound |
| combined pair roots 1–13 | 134 | 7,104,308 | `std::bad_alloc` |

All 13 pair-root export files are similar sizes (~22,165,xxx bytes). **Proof-term evaluation/dependency shape, not simple export byte count, explains the very different memory cost.** No mathematical counterexample or kernel rejection was observed.

## Concrete symbolic replacement

In the actual ternary projective-point data from `S024.lean`:

- The basis vector `s024BasisPoint 1 = (0,1,0)`, and indexed points `s027FreePointAt 0 = (0,1,1)`, `s027FreePointAt 1 = (0,1,2)`, sum to zero modulo three.
- The basis vector `s024BasisPoint 2 = (0,0,1)`, and indexed points `s027FreePointAt 0 = (0,1,1)`, `s027FreePointAt 2 = (0,2,1)`, also sum to zero.

Thus **any** five-tail set containing indexed pair (0,1), or (0,2), contains a forbidden zero-sum triple after adjoining the three fixed basis vectors. The exact `s027ShortZeroFree` 3-cardinality obstruction excludes such candidates by subset inclusion — no exhaustive filtered-powerset proof should be needed.

Created isolated [`diagnostic/s056-symbolic-zero-triples`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/diagnostic/s056-symbolic-zero-triples). Exact proof-edit commit [`0c26a621`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0c26a621e103f86ab2da093412c95cc7e5e5aac3) adds the generic finite-zero-triple obstruction lemma and its indexed-pair application in `S024.lean`, replacing **only** the two costly `decide +kernel` theorem bodies at `s029_pair_0_1_survivor_card` and `s029_pair_0_2_survivor_card`. Their theorem statements and every other theorem and specification are unchanged.

Current branch at exact `670479affc65d93673344608f09c6282de59b894` installs `scripts/s056_symbolic_reprofile.sh` and [dedicated hosted workflow 40405047962](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40405047962) for pinned compilation, the unchanged flagship allowed-axiom output, source-hole scan (Solution side only: the independent Challenge is intentionally incomplete), matched 9 GiB / 150 s pair and prefix re-profiling, and independent finite checks. **Run still in progress at this closeout.** The currently untested proof candidate MUST NOT be promoted or counted as Lean certified until the actual same-SHA hosted compiler and proof-term checks pass.

## Registration and next action

- Original complete unconditional flagship remains exact-source Lean verified on compact RC3 SHA `ca4e6d7bfd2f2e886720afc50e194d9e13942c5e`, [run 39774379133](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39774379133).
- Standard Palomar FULL still last **failed** at Comparator cgroup OOM [40307527534](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40307527534); no actual new Comparator pass or NanoDa/con-ron final certification.
- No flagship weakening, external axioms, PR merge, Palomar registration, publication, or paid 32GB launch. The unmerged official package is not promoted to this unverified experimental code.

[**Installed S057**](../research/NEXT_SESSION_PROMPT.md) must act first on the definitive same-SHA compiler/profiler results, repair any Lean elaboration errors, measure the kernel effect, and continue genuine proof engineering rather than close with diagnostics alone.
