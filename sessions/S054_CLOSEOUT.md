# PDIC S054 — targeted independent-kernel memory attribution

**26 October 2026 — status: COMPLETED CONTROLLED MEMORY DIAGNOSTIC.**
This is a diagnostic/proof-engineering iteration, not an official Palomar verification, registry event or new theorem.

## Substantive work
- Audited [S052 official full 40307527534](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40307527534) bounded mechanical report: official source preparation, Challenge, Solution build and exports passed. Comparator failed with OOM (16,137,502,720 B cgroup peak, six OOM kills, effective 16,431,086,551 B max); the report does not distinguish exactly which nested kernel caused the OOM.
- Audited [S053 verified full theorem 40314618389](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40314618389), SHA `94bf5628d66d5eddc87563de01a2770bf539554f`. Full strict Lean built and original independent finite checks PASS, axioms `propext`, `Classical.choice`, `Quot.sound`. Public-only import needed just `@[expose]` for `spiderAdj`.
- Corrected an apples-to-oranges impression: S053 76,971,665 B export is **theorem-only**, identical to prior compact theorem-only exported size, **not** proof of 0.07% saving against the old 77,024,807 B *full-root* export. Re-measure with equal root arrays before drawing size conclusions.
- Constructed `diagnostic/s054-kernel-memory-isolation` from the strictly checked S053 source. Added `scripts/s054_isolated_kernels.sh` and `.github/workflows/s054-independent-kernel-profile.yml`. Strict build, faithful official export roots, independent con-ron 1 worker / NanoDa / Lean checker / con-ron 2 workers, each measured with /usr/bin/time, 12 GiB per-process virtual address cap, 540s timeout. Preserves raw evidence only, no huge exports uploaded. No source theorem, Challenge or protected config changed relative to S053 candidate. Candidate SHA `47d6c8d23ffaa2650801423185e1ab6ec9ff15c5`.
- Started [S054 run 40318389396](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40318389396). **FAILED deliberately bounded memory check, complete evidence preserved; no mathematical rejection.** No official full reattempt until a measured cause or justified fix.

## Next
See [research/NEXT_SESSION_PROMPT.md](../research/NEXT_SESSION_PROMPT.md) for S055, already started on an isolated proof-root attribution branch: first identify the expensive mathematical proof dependency, then **fix the mathematical proof certificate bottleneck**. No 32GB spend, merges or registry submission.

## Final S054 results and direct S055 response (26 October 2026)
[S054 job 40318389396](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40318389396) ended **FAILURE** because all four independent checker commands aborted allocation under an intentionally imposed **12 GiB virtual-address-space** (`prlimit --as`) ceiling. This is different from RSS and therefore must **not** be reported as four 12 GiB *resident-memory* OOMs or independent proof rejections. The preceding exact-source Lean build PASS, standard axioms `propext`, `Classical.choice`, `Quot.sound`; faithful official target roots produced Challenge 23,740,688 bytes and Solution 77,024,807 bytes. All four checker attempts exited **134** with allocation failure / `std::bad_alloc`:

| Kernel | max resident memory (KiB) | Wall clock | Outcome |
| --- | ---: | ---: | --- |
| con-ron --jobs=1 | 11,397,188 | 4:40.46 | artificial 12 GiB VM limit, exit 134 |
| NanoDa (4 threads) | 9,683,276 | 4:18.86 | artificial 12 GiB VM limit, exit 134 |
| Lean checker | 10,245,364 | 2:19.54 | artificial 12 GiB VM limit, exit 134 |
| con-ron --jobs=2 | 9,078,872 | 2:03.14 | artificial 12 GiB VM limit, exit 134 |

Diagnostic artifact: [s054-kernel-memory-evidence](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40318389396/artifacts/12649103597). Con-ron's `Lean.Syntax` printed trace is progress metadata and is **not** proof that `Lean.Syntax` is the causal bottleneck. No measured final kernel memory can be inferred from the capped runs.

Next applied test: Created `diagnostic/s055-root-attribution`, script `scripts/s055_root_attribution.sh`, automated [S055 root-slice check 40326483705](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40326483705), exact SHA `09d3b3e3ac2b6efc77384ad832143e4b951e4be0`. It tests *primitive-only* baseline, canonical spider isomorphism certificate, column determinant, first-survivor card, full graph probability law, and flagship. Each uses the same official primitive roots plus only the named declaration, measures kernel RSS, and records controlled VM-limit nonzero results as **diagnostics** rather than rejecting the theorem. Its final result was **in progress when recorded**. No proof mathematics was changed or approved as cheaper, no official Palomar FULL rerun yet.
