# PDIC S046 closeout — empirical Comparator recovery and two isolated proof-source checks

**22 October 2026 · PARTIAL ENGINEERING WITH LIVE CI; NOT A PALOMAR FULL PASS.** S046 was executed, and S047 is installed but NOT executed. This session performed and committed a measured diagnostic comparison, attempted a genuine local kernel-safe proof change and launched both an exact-source Lean/export/RSS profile and eight distinct structural definition checks. Their eventual success must be established by observed workflows; neither is silently credited while running.

## Prior S045 result resolved (genuine successful exact-source benchmark)

The previously unobserved S045 profiler has now completed SUCCESS: exact baseline SHA `4adef41f1d1804d3e08ccc1886ffd2f01d007076` [workflow #39406088174](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39406088174); uploaded `s045-baseline-closure-evidence` artifact ID 12258565315 was downloaded and read. All steps passed, including Challenge, Solution, allowed axioms and finite checks. Measured Solution export 85,068,616 bytes; Challenge export 23,719,351 bytes; Solution 1,480,683 expression rows and 16,445 declaration records; profiler-hosted Solution export process maxRSS 6,475,408 KiB, Solution build process maxRSS 13,775,524 KiB. **These process metrics are not Comparator cgroup usage.**

The local source-profile frontier identifies:

- `_private.PDIC.0.PDIC.canonicalSpiderIso._proof_1`: 26,477 frontier Expr rows; 1,447,832 frontier bytes; 27,944 unique reachable value DAG nodes.
- `_private.PDIC.0.PDIC.spiderTransposeCells`: 10,691 rows, 566,205 bytes and 11,919 reachable DAG nodes.
- `_private.S024.0.PDIC.s025_column_det_nonzero`: 8,651 rows, 494,147 bytes.
- `_private.S024.0.PDIC.s030_first_0_survivor_card`: 6,587 rows, 352,802 bytes.
- Root `PDIC.palomar_complete_probability_and_spider` itself: 408 frontier Exprs, 20,547 bytes, and 852 reachable value DAG nodes. The transitive supporting certificate is much larger than its final application.

Frontier byte segments ARE NOT exclusive proof sizes or attribution of Comparator memory; the largest identified local frontier is only ~1.70% of the total Solution export.

## Actual comparative Palomar mechanical reports recovered

PDIC failed full run [#39309877112](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39309877112), report artifact 12216769696, was decoded, not assumed from annotations. Its phases:

- `solution-build:cgroup` peak 12,519,899,136 B, success;
- `solution-export:cgroup` peak 4,779,462,656 B, success;
- `comparator:cgroup` peak **16,118,239,232 B**, 2 OOM kills, result infrastructure/resource-exhausted under memory.max 16,431,086,551 B.

Pascal Extremes successful [#36690939932](https://github.com/jfairfaxball-348/Pascal-Extremes/actions/runs/36690939932), artifact 11085936662, gave solution-build cgroup peak 1,070,997,504 B, export peak 1,007,173,632 B, Comparator 481,718,272 B and complete Lean / con-ron / NanoDa PASS (for **Pascal** only). This is strong **resource-scale** comparison, not proof a specific PDIC theorem causes Comparator OOM. The pinned [Comparator closure note](https://github.com/PalomarRegistry/PalomarSubmission/blob/d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44/docs/comparator-declaration-closure.md) follows the type closure for independent definition comparison, then replay uses full exported Solution.

All details, units, source URLs and warnings are in [S046 resource audit](../research/S046_PROOF_CLOSURE_RESOURCE_AUDIT.md).

## Real isolated proof engineering, NOT promoted

From immutable S045 baseline `4adef41f...`, created `diagnostic/s046-compact-spider-iso`, exact source SHA `c8ad03a6d4fb107475aa4f5bd40eec0683abfab1`. Changed **only four tactics** in the body of the existing `PDIC.canonicalSpiderIso.map_rel_iff'` proof: attempt kernel reflexive/decidable closure before fallback to the old simplifier (`first | rfl | decide | simp ...`). No statement, definition, cap, graph, Challenge, Solution or comparator config changed. GitHub diff from baseline confirms only the four proof branches and isolated profiler workflow changed.

- [Exact-source profiler run 39753030387](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39753030387): **IN PROGRESS as inspected at closeout**; Mathlib installation/cache and independent Challenge compile PASS, Solution build in progress, export/axioms/profile still unobserved. It MUST be inspected for actual Lean/build result, axioms, exported bytes and memory before claiming savings.
- [Separate finite run 39753030527](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39753030527): **SUCCESS** on that exact SHA. This confirms independent finite checks, NOT compilation of the modified proof.
- For full eight-definition diagnostic added S043's pre-existing compiled ConstantInfo fixture unchanged to `diagnostic/s046-constantinfo-check` head SHA `37da2765335f7dc0cc1db55ebabf6a61088c38c2` (same PDIC proof file as `c8ad...`; only diagnostic files/workflow added). [Run 39754500391](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39754500391) **IN PROGRESS at closeout**. It builds two independent modules, reads original compiled ConstantInfo for eight named definitions, compares exact serialized type/value/kind/safety/levels and fails on any mismatch. Do not call pass until run completes and evidence is inspected. The earlier S043 implementation and comparison script were verified on a different SHA; they are not automatic evidence of current candidate passing.

**No candidate is yet certified to reduce the official 16GB Comparator heap, no 32GB paid test, no edit to original PR #24, no Palomar registry entry, no external submission.** Flagship theorem remains strictly Lean-kernel verified at proof SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2` [#39120877185](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877185); this does not assert an official Palomar pass.

## Resource fallback

Main already contains manual `.github/workflows/palomar-full-approved-32gb.yml` with explicit owner-controlled `authorize_namespace_spend=false`, pin to immutable theorem package, Namespace 16vCPU/32GB profile. Prior published indicative PAYG $0.024/min, maximum theoretical 350-minute $8.40 before tax/plan; actual billing entitlement and access not verified. **NOT AUTHORISED to dispatch**, no spend occurred.

## Automatically installed S047

`research/NEXT_SESSION_PROMPT.md` now contains fully executable **S047**. Start by consuming both CI results and real profiler/ConstantInfo artifacts, fixing failures rather than spending another numbered session simply polling; compare measured source savings against S045, try a distinct real proof-engineering reduction if insufficient, carry out complete exact-source/structural/finite gates, then only if compelling promote to unchanged PR #24 and run official strict/finite/FULL on one SHA. Without demonstrated 16GB path, present guarded 32GB authorization decision without starting a billable runner. Do not execute S047 until a new owner request.
