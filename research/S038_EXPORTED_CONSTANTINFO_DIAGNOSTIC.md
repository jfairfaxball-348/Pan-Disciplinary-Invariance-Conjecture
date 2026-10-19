# PDIC S038 — frozen exported ConstantInfo diagnosis

- Package candidate: `268f8ddf386e49875f6d21984fdfa8482187e900`, unmerged PR #24.
- Proven full-mode gate: [39242337489](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337489) Comparator rejects `PDIC.namedSpider` in 3.563 s, not a memory failure. Replay/NanoDa/con-ron unattempted.
- Diagnostic **isolated branch**: [`diagnostic/s038-namedspider-export`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/diagnostic/s038-namedspider-export), diagnostic source head `7cbdf3e9f24d719425c1c5bb2a2694ea6d298025`.
- [Inspect diagnostic workflow](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/workflows/s038-export-diagnostic.yml). The result has not yet been inspected; no verdict is claimed.
- The independent `Challenge.lean` and comprehensive `PDIC.lean` both spell the actual seven-edge spider and `by decide` proof block, but Challenge uses `public section` and PDIC `section` plus `public def`. This textual observation is insufficient to identify the exported mismatch.
- Instrumented Lean inspectors independently import the **actual compiled modules** and extract `Lean.Environment.find?\u0060PDIC.namedSpider` with referenced companion constants. Machine-readable differences should appear in workflow artifact `s038-exported-constantinfo-diff` if the new diagnostic builds.
- Gate discipline: do not mask `namedSpider` as a definition hole, do not relax ordinary dependency equality, and do not retry full Palomar until a genuine exporter-level diagnosis supports the repair.
