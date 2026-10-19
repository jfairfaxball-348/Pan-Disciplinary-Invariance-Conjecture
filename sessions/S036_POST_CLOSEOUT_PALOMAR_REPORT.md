# PDIC S036 post-closeout — official final Palomar report (19 October 2026)

This note **updates diagnostics after S036 closeout; it is not execution of S037.** Original S036 recorded running jobs honestly. Full mechanical run has now ended and been inspected.

- **Exact immutable source SHA:** `99e3a40ec0864050dc9596724ccde05dc8d5578d` (draft package PR #24, unchanged by this note).
- **Strict pinned Lean:** [39222014929](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014929) SUCCESS.
- **Independent finite checks:** [39222014796](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014796) SUCCESS.
- **Official Palomar full:** [39222015131](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131) FAILURE, downloaded/inspected official [machine report artifact 12173795837](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131/artifacts/12173795837).
- Report `status=fail`, `stage=comparator`, `diagnostics[0].code=comparator.rejected`; precise error `Const does not match between challenge and target 'PDIC.namedSpider'`.
- This failure is **semantic/export declaration equality, not out-of-memory**: Comparator elapsed 3.732 seconds, cgroup peak 186,888,192 bytes, 0 OOM kills. Preceding Solution build succeeded (960.804 seconds, 12,348,428,288 bytes cgroup peak), and Solution export succeeded (22.35 seconds, 4,764,614,656 bytes cgroup peak). Challenge provenance remained independent Mathlib-only.
- **Lean replay, NanoDa and con-ron were not reached**, so full-mechanical PASS is not claimed. No registration occurred.
- Both source definitions of `PDIC.namedSpider` as visible in `Challenge.lean` and `PDIC.lean` have the same spider adjacency and finitary constructor proofs text except the public visibility modifier. Comparator upstream [Compare.lean at v4.35.0-rc2](https://github.com/leanprover/lean4/blob/v4.35.0-rc2/src/lake/Lake/Check/Compare.lean) checks ordinary exported `ConstantInfo` for structural equality, not graph-isomorphism or pointwise logical equivalence. Thus S037 must investigate the exported constant components before picking a repair. A module-private generated proof term or visibility-induced export representation difference is a hypothesis, not yet a demonstrated exact cause.
- Protect the theorem scope (all connected eight-vertex graphs, all admissible caps, actual 40320 permutations, four probabilities, iff named spider), keep Challenge independent and do not whitelist `namedSpider` as a definition hole just to suppress Comparator checking.

**Installed next task remains S037**, [research/NEXT_SESSION_PROMPT.md](../research/NEXT_SESSION_PROMPT.md). This diagnostic-only update does not execute S037, alter the proof source or trigger any new verification workflow.
