# S046 — exported Lean closure and Palomar memory evidence (22 October 2026)

## Scope and integrity

This is an empirical diagnosis of the **existing, unweakened** unconditional all-admissible-cap, connected-eight-vertex P₀–P₃ and sharp spider flagship. No new mathematical theorem, axioms, Palomar full PASS or registration is claimed. Canonical original full theorem was kernel verified at `09d9f392d20399c80f2c51e2f4979b78b412c4e2` in CI `39120877185`. The Palomar PR #24 baseline `c59cbeecd669d9a0ab5ba5f6e1e4021051a62c8a` is **not modified** by S046 experiments.

## Previously unobserved S045 result: now confirmed PASS

Source-neutral profiling: isolated SHA `4adef41f1d1804d3e08ccc1886ffd2f01d007076`; [run 39406088174](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39406088174) **success**, all steps: Challenge build, full Solution build, axioms (only `propext`, `Classical.choice`, `Quot.sound`), independent exports and finite checkers. [Artifact 12258565315](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39406088174) `s045-baseline-closure-evidence`, SHA-preserving provenance.

| Measure | Challenge | Solution |
| --- | ---: | ---: |
| NDJSON serialized bytes, same S045 run | 23,719,351 | 85,068,616 |
| Expr rows | 406,697 | 1,480,683 |
| Declaration records | 5,730 | 16,445 |
| Export command maxRSS (KiB), process-level | 1,939,592 | 6,475,408 |
| Build command maxRSS (KiB), process-level | 954,640 | 13,775,524 |

These are measured ordinary GitHub-hosted benchmark metrics, **not** Palomar Comparator cgroup RSS. The previously cited 16,553,836-byte Challenge baseline is from earlier runs and differs from the actual S045 Challenge export; do not normalize that discrepancy away or compare across unlike export invocations.

## Profiled local proof witnesses

These values are **frontier records** between NDJSON declaration lines, not exclusive proof bytes or marginal RAM allocation. Root DAG counts globally deduplicate Expr nodes, and are not residency.

| Source-local emitted declaration | Frontier Expr rows | Frontier bytes | Unique value-DAG nodes |
| --- | ---: | ---: | ---: |
| `_private.PDIC.0.PDIC.canonicalSpiderIso._proof_1` | 26,477 | 1,447,832 | 27,944 |
| `_private.PDIC.0.PDIC.spiderTransposeCells` | 10,691 | 566,205 | 11,919 |
| `_private.S024.0.PDIC.s025_column_det_nonzero` | 8,651 | 494,147 | 9,702 |
| `_private.S024.0.PDIC.s030_first_0_survivor_card` | 6,587 | 352,802 | 7,053 |
| Main `PDIC.palomar_complete_probability_and_spider` proof | 408 | 20,547 | 852 |

The named flagship proof itself appears relatively small, because it imports and invokes a substantial transitive certificate graph. The largest **selected source-local** emitted proof witness relates to the concrete canonical spider isomorphism, not to a newly discovered mathematical error. Removing even all 1.45MB of its frontier would be only ~1.70% of the 85.07MB Solution export, and exported-size savings cannot be assumed to scale linearly with Comparator memory.

## Read actual official mechanical report files

PDIC Palomar full report: [run 39309877112](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39309877112), artifact `12216769696`, recovered `mechanical-report.json`:

- `solution-build:cgroup` peak 12,519,899,136 bytes (no OOM).
- `solution-export:cgroup` peak 4,779,462,656 bytes (no OOM).
- `comparator:cgroup` peak 16,118,239,232 bytes; memory ceiling 16,431,086,551 bytes; **two OOM kills** and exit 137 before independent replay.
- Classification `infrastructure/resource-exhausted`; not a proved comparator-definition mismatch or refutation.

Pascal Extremes successful mechanical report: [run 36690939932](https://github.com/jfairfaxball-348/Pascal-Extremes/actions/runs/36690939932), artifact `11085936662`, recovered `mechanical-report.json`:

- `solution-build:cgroup` peak 1,070,997,504 bytes.
- `solution-export:cgroup` peak 1,007,173,632 bytes.
- `comparator:cgroup` peak 481,718,272 bytes, exit 0.
- Report confirms con-ron, NanoDa, Lean default kernel all accept the Pascal package. Not evidence that they ran on PDIC.

This is a concrete cross-project difference. The reports contain no attribution of Comparator heap or declaration nodes to individual PDIC theorem constants, so the local closure ranking must **not** be confused with proven Comparator hotspot residency.

## S046 controlled proof engineering

On isolated branch `diagnostic/s046-compact-spider-iso`, from the unchanged S045 baseline, change ONLY the four ground relational cases inside `PDIC.canonicalSpiderIso` from unconditional `simp` to `first | rfl | decide | simp`. This attempts refl/decidable kernel certificates before fallback to the original simp; the isomorphism declaration's type and all graph/cap/probability definitions, Solution/Challenge and `comparator.json` are unchanged. Proof candidate commit `18d4f038f4f48796e5d0b8517d79b7753f440aa4`; exact runner-equipped source `c8ad03a6d4fb107475aa4f5bd40eec0683abfab1`. [Hosted validation/profile run 39753030387](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39753030387) must be inspected **to completion** before assigning any proof success, export saving or memory reduction. Independent finite push test is [39753030527](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39753030527). A source diff is not Lean/Comparator evidence.

If a truly measured strict/finite/structural-safe improvement is established, only then consider a controlled PR #24 change and same-SHA official full verification; otherwise preserve the original submitted head.

## Resource fallback and authorization

Manually gated workflow on main: `.github/workflows/palomar-full-approved-32gb.yml`, uses pinned Palomar `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44` and `palomar-namespace-16x32-v1`, requires `authorize_namespace_spend=true` **from owner** and one immutable commit SHA; it does not trigger automatically. Previously published PAYG indicative price $0.024/min ($1.44/hour; 350-minute theoretical $8.40 before possible tax/plan). Account-specific access, billing plan and real runtime are not verified. **No paid run has been authorised or launched.**

No submission, merge or public Palomar registration follows from this audit.
