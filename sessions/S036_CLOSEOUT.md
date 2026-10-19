# PDIC S036 — Solution import boundary repair and restarted Palomar gates

**Executed 19 October 2026. Outcome: a substantive Lean source-interface repair committed; finite checks PASS, strict/full hosted verification in progress at closeout. NOT ALL GREEN; no Palomar registration.** S037 is installed and not executed. No mathematics, Challenge statement, public claims, manuscript or PR merge changed.

## Actual S035 results inspected before editing

- Candidate `d3048b0c5aa0533a2ebfe10ff381e33498018eb5`: [finite run 39217918892](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39217918892) **PASS**.
- [Strict run 39217918899](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39217918899) **FAIL**, exact job 117946054492: `Solution.lean:49:2`, the `change spiderAdj u v = true ↔ _` tactic could not definitionally match `namedSpider.Adj u v ↔ ...` after S035 removed `import all PDIC` from Solution. The unresolved failed proof produced a reported `sorryAx`, so the complete Solution was **not** certified on this commit.
- [Official full run 39217919193](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39217919193) **FAIL**. Downloaded and parsed full official [mechanical-report artifact 12171217402](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39217919193/artifacts/12171217402). Machine verdict `status=fail`, `stage=solution-build`, `source.commit=d3048b0c5aa0533a2ebfe10ff381e33498018eb5`, diagnostic `solution.build_failed`. The Solution build ran **882.396 s** and peaked at **12,286,300,160 cgroup bytes** with 0 OOM kills; **actual Comparator, Lean replay, NanoDa, con-ron never reached**. Therefore no OOM-performance improvement has been measured on this failed candidate. Challenge remained Mathlib-only with no untrusted Challenge sources; full exact source had standard pinned Lean 4.35.0-rc2 and official Palomar pipeline d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44.
- Earlier Comparator [full run 39140422199](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39140422199) on `fe94685a626051378e4c3dd1e0ff5fbc89503f02`: **FAIL** at cgroup OOM, peak 16,129,802,240 bytes / 6 kills. Prior [39138306868](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39138306868) showed a separate `PDIC.spiderAdj` semantic mismatch. Neither failure has been established fixed.

## Real source repair and exact-hosted experiments

On the existing **unmerged PR #24 package branch**, committed [`99e3a40ec0864050dc9596724ccde05dc8d5578d`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/99e3a40ec0864050dc9596724ccde05dc8d5578d) with the **sole file change** `Solution.lean`: insert private `import all PDIC` after `public import S024`. The original proof file had used this exact import; restoring it makes its private definitional reductions available without broadening the exported public interface of `PDIC.lean` and `S024.lean`. The theorem's statement, its proof tactics, graph/cap semantics, 40,320 permutations, the independent Challenge and Comparator configuration remain unmodified.

| Immutable package SHA | Independent finite | Strict Lean | Official full Palomar |
|---|---|---|---|
| `d3048b0c5aa0533a2ebfe10ff381e33498018eb5` | 39217918892 PASS | 39217918899 FAIL Solution `change` | 39217919193 FAIL at Solution build; Comparator not reached |
| `99e3a40ec0864050dc9596724ccde05dc8d5578d` | [39222014796](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014796) **PASS** | [39222014929](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014929) **RUNNING at closeout** | [39222015131](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131) **RUNNING at closeout** |

A running job is **not** a successful verification. No source change unrelated to the actual diagnosed problem was made. Original full mathematical flagship proof remains **LEAN_KERNEL_VERIFIED** on unmerged PR #4, SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, strict [39120877185](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877185) PASS. This is mathematically distinct from an official Palomar full mechanical PASS. The working manuscript remains unsubmitted with pending Palomar link; novelty/priority unresolved.

## Exact next prompt automatically installed

# PDIC S037 — Finish same-SHA Palomar verification recovery

**Installed at S036 closeout, 19 October 2026. NOT EXECUTED.** The next owner's "Run next session" command authorises execution. This is the continuation of the owner's full-mode Palomar verification target, not a paper-writing session unless the package becomes demonstrably all-green.

## Goal and frozen mathematics

Produce **one exact immutable SHA on draft PR #24** passing independently (1) strict pinned Lean with approved axioms and source-hole scan, (2) independently checked finite evidence, and (3) the **official full** Palomar Challenge/Solution provenance, Comparator dependency equivalence, Lean replay, NanoDa and con-ron in the bounded official machine report. Preserve the full unconditional connected-eight-vertex/all admissible eight-caps/40,320 actual vertex permutations P0–P3 law and sharp iff the named spider S(2,2,2,1). The already independently kernel-certified original proof remains PR #4 SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, strict workflow 39120877185. Do not weaken any theorem, hide definitions, introduce axioms or sorry, lower graph/cap scope, remove independent Challenge semantics, or disable the extra kernels.

## Starting artefacts

- Draft PR #24 `session/s032-palomar-full-flagship`; latest actual source commit at installation **`99e3a40ec0864050dc9596724ccde05dc8d5578d`**. This restored `import all PDIC` privately in `Solution.lean`, while retaining S035's narrower public module interface. It leaves the actual theorem and proof unchanged.
- [Finite 39222014796](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014796) PASS at S036 closeout; [strict 39222014929](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014929) and [full Palomar 39222015131](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131) **in progress at closeout**, not pre-certified. Query their FINAL statuses immediately.
- The failed preceding S035 package `d3048b0c5aa0533a2ebfe10ff381e33498018eb5`: strict 39217918899 FAILED and full 39217919193 FAILED at `solution-build`, because `Solution.lean:49:2` could not definitionally unfold `namedSpider.Adj` to `spiderAdj ... = true`; generated `sorryAx` was from the failed proof goal, not an intentional source axiom. Exact machine report artifact [12171217402](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39217919193/artifacts/12171217402), independently finite 39217918892 PASS. Solution build was 882.396 s and peak 12,286,300,160 bytes; **Comparator did not execute**, so no memory-improvement claim is justified.
- Earlier `fe94685a626051378e4c3dd1e0ff5fbc89503f02`: strict/finite PASS; full 39140422199 FAIL at **Comparator OOM** (six OOM kills, peak 16,129,802,240 bytes). Still earlier 39138306868 returned a distinct `PDIC.spiderAdj` declaration mismatch. Inspect S035 and S036 closeouts and their actual machine reports, not just GitHub job badges.

## Execute the complete recovery

1. Confirm PR #24 branch HEAD (do not silently overwrite concurrent commits), all three same-SHA S036 workflow FINAL conclusions, and download `mechanical-report.json` from the real full-workflow artifact. Record `source.commit`, `status`, `stage`, `errors`, Challenge canonical provenance, exported target, actual stage timing, cgroup `memory_peak_bytes`, `memory_events.oom_kill`, and whether Comparator, Lean replay, NanoDa and con-ron all individually ran and passed.
2. If strict Lean fails, read failing log line and repair the source exactly; verify only `propext`, `Classical.choice`, `Quot.sound` and no false trust. Ensure the official full-mode Solution build is green before assessing Comparator memory.
3. If Comparator fails semantically, use the **first named constant** and the independently defined Challenge to correct genuinely differing values/types; retain nontrivial independent Challenge and unchanged theorem semantics.
4. If Comparator again reaches ~16 GiB resource exhaustion, profile export/public closure and memory by phase. Refactor dependency/module-export footprint or **kernel-checkable** proof factoring only if it reduces actual compared closure; do not use a high-memory or paid runner without owner's express approval and current verified availability/cost. Measure each candidate, not just presumed compression.
5. Every new candidate must be a committed immutable 40-character SHA with triggered strict, finite and official full Palomar on the **same SHA**, and a source-to-source ledger. Inspect full report including replay, NanoDa and con-ron; do not equate an early stage PASS to all-green.
6. If all real gates pass for one SHA, mark **PALOMAR_FULL_MECHANICAL_PASSED / READY_FOR_OWNER_SUBMISSION**, not REGISTERED; install the deferred manuscript mathematical/novelty audit as S038. If ANY gate failed or remained pending, install **S038 continuation of this identical all-green full-mode Palomar recovery objective**.
7. Write an honest executed S037 closeout, stage/memory/result ledger, update `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md` with a complete executable S038 prompt, and commit them. Leave PR #4 and #24 unmerged and preserve `[PALOMAR REGISTRY LINK — PENDING]` until actual registration.

**Do not perform registry submission, journal/arXiv submission, external correspondence or publication without explicit owner authorisation.**

