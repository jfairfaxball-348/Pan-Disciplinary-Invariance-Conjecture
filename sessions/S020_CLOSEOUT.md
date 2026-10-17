# PDIC S020 closeout — genuine unordered second moment source and compatible triple bridge

**Executed:** 17 October 2026. **S021 installed and not executed.** Proof work remains on `session/s007-full-lean-flagship` / draft PR #4; main retains its historical Lean source.

## Deliverables

1. Source candidate `PDIC.lean` [6a8ddd69](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/6a8ddd69b636ce523f7aa0c599e59c0fe07b7186) defines invariant unordered overlap classes and proves a candidate exact **global second factorial-moment numerator** `2304*n₀+128*n₂`, counting each true `powersetCard 2` family once.
2. Continuation [cba4eede](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/cba4eedef0033ec828c66593f8cf35aba3d45fa1) proposes `M₂=2n₀/35+n₂/315` and the **128** cap-zero event cardinality for each true `IsUnorderedCompatibleTriple` family.
3. Independent finite checker [afc1ecd8](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/afc1ecd80909d32a7e5cabf18df0044ccae9e696) was also executed locally (spider and P8, each across all 40320 labellings); exact M₂ numerators 4224/2688 and M₃ numerators 384/128.
4. Detailed proof and outstanding equivalence recorded in [S020 proof note](../research/S020_UNORDERED_MOMENT_PROOF_ATTEMPT.md).

## Strict evidence and limitations

**All new S020 declarations are `SOURCE_FORMALIZED / CI_UNVERIFIED`.** The source commits succeeded, but no fresh exact-source GitHub-hosted Lean run could be inspected through the available workflow lookup, and `lake` is not installed locally. No assertion of kernel verification is made. The last exact SHA with documented strict success remains S019 `e981acac25b8106e4b4df782340217ed948445bb` ([Lean 38978027666 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027666); [finite 38978027657 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027657)). The global M₃ equation, rational M₃, actual four probabilities, and spider sharpness are still **OPEN_IN_LEAN**; so is the fully certified M₂ increment until exact-source strict CI passes. Novelty remains unresolved.

## Automatically installed S021

[Full executable S021 prompt](../research/NEXT_SESSION_PROMPT.md) prioritises **certifying or repairing S020's real M₂ source**, proving the missing **non-compatible-triple zero fibre** and global `128h` identity, then the end-to-end four-term law and spider iff. No external registration, submission or PR merge was authorised or performed.
