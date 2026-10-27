# PDIC S058 — sorted-third-index proof-memory experiment

**27 October 2026. EXECUTED PARTIALLY.** This is a new substantive mathematical certificate-engineering trial, *not* a Palomar preflight PASS or completed proof-memory fix. S059 installed for exact-source Lean, independent kernel profiling and integration follow-through. No weakening, forced merge, registry submission, unapproved axioms or paid runner use.

## Definitive inherited S057 evidence (observed in S058)

At isolated proof SHA `dd8d9d65c07b624b3881872783cda747abd54caa`, the [completed S057 strict/profile run 40414801128](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40414801128) is **SUCCESS**: built `Solution` and `Challenge`, printed the original full theorem's only axioms `propext`, `Classical.choice`, `Quot.sound`, ran independent finite enumerators, and uploaded [artifact 12695043663](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40414801128). A workflow-wide SUCCESS does not by itself imply individual checker success.

Each original-predicate per-root exported standalone Lean checker used identical 9 GiB *virtual-address-space* cap and 150s deadline:

| Root | Export bytes | checker exit | RSS KiB | elapsed |
| --- | ---: | ---: | ---: | --- |
| pair 0–1 | 22,759,415 | 0 | 155,652 | 0:01.56 |
| pair 0–2 | 22,759,426 | 0 | 155,920 | 0:01.50 |
| pair 0–3 | 22,165,963 | 0 | 5,804,080 | 0:25.18 |
| pair 1–2 | 22,753,477 | 0 | 155,732 | 0:01.56 |
| pair 1–3 | 22,165,963 | 0 | 5,802,020 | 0:25.64 |
| pair 2–3 | 22,165,971 | 0 | 5,822,316 | 0:25.85 |
| complete flagship | 77,108,153 | 134 | 7,098,708 | 1:41.80 |

The (1,2) zero-pair proof is **strict compiler PASS and individually independent kernel PASS**, and the full root still hits `std::bad_alloc` at 9 GiB address limit; neither a mathematical disproof nor standard-memory Palomar FULL PASS.

## New genuine sorted-third-index mathematics

Created isolated branch [diagnostic/s058-third-index-partition](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/diagnostic/s058-third-index-partition), starting from immutable S057 `dd8d9d65`, leaving unmerged PR #24 and the certified RC3 `ca4e6d7b` alone.

The new `S058.lean` defines `s058LaterThird`, `s058ThirdIndexShard` and `s058ThirdIndexSurvivors` using the **same** original `s027ShortZeroFree (s024BasisSet ∪ I.image s027FreePointAt)` predicate. It supplies explicit sorted-minimum combinatorial proofs of:
* `s058_three_index_subsets_split`: partition of all sorted residual triples into pieces with a fixed minimum `k`, whose residual search is `powersetCard 2`.
* `s058_second_index_split`: transport that partition to the unchanged original pair shard.
* `s058_second_survivors_split`: predicate-preserving identity for the union of genuine third-index surviving sets.

On a second immutable candidate, `s058_pair_0_3_third_table` and `s058_pair_0_3_card_optimized` attempt a *new* proof of the exact unchanged (0,3) card-one statement using 17 third-index cases (only third `k=7` survives) in place of one enormous 286-candidate `decide +kernel`. At `k=4` the largest child has at most 66 candidate tails; children decrease thereafter. This is a real proof candidate, not a new mathematical assumption.

Actual GitHub commits:
* `0c74184d8fac60bced5856cb684e2f0e936ac531`: structural Lean candidates.
* `164c260c72b736e39ef53fefe748e13972e034ba`: pinned-source CI workflow.
* `78f4132061e02f45e5d036138d2c5451712008ec`: (0,3) third-table/card candidate.
* `fe381f194918dbeccd41236aa56071ebfc07fb42`: standalone independent Python checker `scripts/verify_s058_third_shards.py`.

The independent Python arithmetic reproduced the 17 pinned points, three canonical basis points, original one/two/three-point zero-sum conditions and gave exactly these positive survivors:
* (0,3): `{0,3,7,10,14}` (minimum remaining index `k=7`);
* (1,3): `{1,3,6,8,13}` (`k=6`);
* (2,3): `{2,3,6,7,12}` and `{2,3,8,10,15}` (`k=6,8`).

This **FINITE_CHECKED** analysis alone does **not** verify the new Lean candidate, its independent exported kernel closure or the eventual 16 GiB Comparator. The script is committed for reproducibility.

## Hosted test visibility at closeout

Three dedicated [S058 GitHub Actions runs](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/workflows/s058-third-index.yml) were started:
* [40467512305](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467512305), first three structural proofs, exact `164c260c`;
* [40467818226](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467818226), new card-one candidate, exact `78f41320`;
* [40467973824](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467973824), additional checked-in Python audit, exact `fe381f19`.

These dedicated exact-source Lean workflows were **IN PROGRESS** at this S058 checkpoint; none is credited PASS here. Separate basic `finite-lead-check` workflows passed on earlier candidate commits, but they do not compile `S058.lean`. The dedicated workflow currently tests `lake build Challenge PDIC S024 Solution` and `lake env lean S058.lean` with `#print axioms`; it has *not yet* run separate `leanchecker --from-export` against the new optimized root. Do not count this as completed resource reduction.

## Locked publication and verification gates

Historical full unconditional flagship is certified at exact compact RC3 [strict 39774379133](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39774379133), proof SHA `ca4e6d7bfd2f2e886720afc50e194d9e13942c5e`. Original theorem is not changed; genuine all-eight-cap 8! probability and named spider remain required. Latest official full [40307527534](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40307527534) failed Comparator due to 16 GiB cgroup OOM. **No Palomar FULL PASS, no registration, no permission to pay for 32 GiB, and no merge.** 

## Next action

Run the full installed `research/NEXT_SESSION_PROMPT.md` **S059** on the next owner command. Prioritise the **first real Lean compiler failure**, if any, on the new combinatorial proof, then per-root independent kernel memory. Only after a verified resource win should the optimized proof be integrated into `S024.lean` and extended to (1,3)/(2,3). Do not treat a green outer diagnostic workflow as whole-flagship success.


---

## 27 October S058 continuation — real Lean failure identified and structurally repaired (CI PENDING)

The S058 original standalone `S058.lean` did **not** Lean-compile on any of three hosted runs: [40467512305](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467512305), [40467818226](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467818226), [40467973824](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40467973824). Read actual logs: S024 `lake build Challenge PDIC S024 Solution` **PASS**, but Lean rejected S058 references to module-private `s027LaterIndexPoints`, `s027SecondIndexShard` and `s028SecondIndexSurvivors`. Printed `sorryAx` for unelaborated dependent S058 declarations is a **failure**, NOT a proof. No mathematical contradiction observed.

Unlike exposing broad package internals, repaired experiment by moving the entire actual third-index sorted-minimum and original-predicate cardinal-one candidate into **the defining S024 module itself**, immediately after `s028SecondIndexSurvivors`. The **unchanged original** `s028_pair_0_3_survivor_card` theorem statement is now proved by exact candidate helper `s058_pair_0_3_card_optimized` in the test branch only, while the original full theorem and independent Challenge statements are byte-unchanged. Replaced CI to build `Challenge PDIC S024 Solution`, check original Solution axioms, run four original finite checks plus `verify_s058_third_shards.py`, and then measure genuinely independent exported optimized original (0,3), structural and whole-flagship kernel roots under exact S057 9 GiB / 150 s limit. Profile script reports internal exit codes faithfully rather than treating a green outer workflow as certification.

Important isolated branch commits: `2bee190c7a4f5fb7d24f2194eeaac9554adc4583` (move mathematics into S024), `bf97640c30c2f62edf12d986ebc359ebe1c8273e` (source-matched CI), `f64e13a4de8f76bee0c34dfb47d320665124ce77` (independent root profiler) and `33992aaaf1a824d66e1d556b59f90e51672dad17` (remove obsolete non-compiling separate module file). None has been promoted to PR24/main.

New exact-source hosted validation runs: [40477691356](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40477691356) at `f64e13a4` and [40478141116](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40478141116) at `33992aaa`, **IN PROGRESS as observed**. The completed early failed runs must never be counted as PASS, and the new integrated candidate remains **not Lean verified / not independently kernel verified** until exact logs show proof source & per-root checker exit 0. The full Palomar gate remains unchanged: **NOT PASSED**.

**Continuation requirement:** First read actual `40478141116` compiler errors (or success). Fix further math/tactic failures in the same original-module branch, before claiming memory reductions or moving to other pairs. Updated S059 prompt contains these exact run IDs and latest source.


## S058 follow-up: run #7 exact compiler root diagnosis and repair

**27 October 2026, post-S058 user-directed continuation.** [Run #7 / 40478141116](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40478141116) at exact source `33992aaaf1a824d66e1d556b59f90e51672dad17` **FAILED** compilation, not kernel acceptance. Its first and only compiler error was `S024.lean:1432:2: simp made no progress` inside `s058_pair_0_3_card_optimized`. Crucially, hosted axiom prints show all three preceding third-index structural lemmas and `s058_pair_0_3_third_table` have **only** `propext`, `Classical.choice`, `Quot.sound`; the failed cardinality proof and downstream flagship showed `sorryAx`, so cannot be treated as verified. Independent finite verification was skipped following failure.

Repaired the original-module proof **without modifying its mathematical statement** on `diagnostic/s058-third-index-partition`: commit [`621e553b06f1cc7e55c57b0b19f4cef4e111aa6e`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/621e553b06f1cc7e55c57b0b19f4cef4e111aa6e). Instead of attempting `simp only` under the higher-order `Finset.biUnion` binder, the new `hunion` proof uses `Finset.mem_biUnion`, derives singleton membership from the kernel-proved `s058_pair_0_3_third_table` by case analysis on `k=7`, constructs the witness `k=7` for the reverse inclusion, and derives the unchanged cardinality by `rw [← s058_second_survivors_split, hunion]`. This is a substantive trusted combinatorial proof tactic repair, **candidate only** until exact-source strict Lean and independent exported kernel passes.

Fresh [S058 run #8 / 40491186731](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40491186731) at repaired `621e553b` **IN PROGRESS** at this note. Dedicated finite-lead check [40491186734](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40491186734) likewise has no bearing on the Lean card proof. Do not claim full package/Palomar PASS or memory improvement until exact recorded checks.


## Definitive repair verification — S058 run #8 FULL WORKFLOW GREEN, per-root verdicts distinguished

**27 October 2026 11:05Z — verified against exact candidate SHA `621e553b06f1cc7e55c57b0b19f4cef4e111aa6e`.** [S058 integrated workflow run #8 / 40491186731](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40491186731) **completed SUCCESS**, after the previous #7 failure was fixed by the explicit union-is-singleton proof. The actual `lake build Challenge PDIC S024 Solution`, `lake env lean Solution.lean`, source trust scan, all original and new finite tests, and standalone exported Leanchecker checks of the new structural and pair-card roots passed. Actual flagship `#print axioms`: exactly `[propext, Classical.choice, Quot.sound]`. This is a genuine theorem-proof repair, **not merely a CI/YAML fix**. Its logic preserves original predicates, all 18 tails, all-cap 40320-sample-space four-term probability statement, named-spider iff equality and independent Challenge statement.

Same 9 GiB process **virtual-address-space** limit, 150 s deadline, pinned Leanchecker from exactly the tested source; authoritative measurements from completed job log and uploaded [evidence artifact 12730225421](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40491186731/artifacts/12730225421):

| Independent exported root | Export bytes | Export exit | Checker exit | Peak RSS KiB | Wall |
|---|---:|---:|---:|---:|---|
| structural third-index survivor partition | 24,872,007 | 0 | **0 PASS** | 161,920 | 0:02.61 |
| optimized actual pair (0,3) card | 25,156,348 | 0 | **0 PASS** | 1,096,388 | 0:22.37 |
| **original unchanged pair (0,3) theorem** with new body | 25,156,545 | 0 | **0 PASS** | 1,096,264 | 0:22.64 |
| complete original flagship | 77,370,284 | 0 | **134 RESOURCE LIMITED** | 7,099,140 | 1:41.31 |

True original pair (0,3) baseline in S057 successful same-limit independent kernel was 5,804,080 KiB; new actual original pair certificate is 1,096,264 KiB — **81.11% less RSS** (decrease of 4,707,816 KiB). The source-side optimization is independently confirmed at original unchanged pair theorem. No claim is made that **complete** flagship passed the 9 GiB address-space check: it still hits `std::bad_alloc`, although its source compiled and showed approved axioms only. An official 16 GiB Palomar FULL run is **not justified** yet, so none was launched. Required eight exported compiled ConstantInfo comparison profiles were **not** re-run in this S058 repair CI; leave that obligation for S059 before any promotion. PR #24 and main proof sources remain unchanged; no registration or paid 32 GiB runner.

**Next:** S059 must continue substantive positive-survivor proof compression starting from the strictly verified S058 `621e553b` candidate, not restart or invalidate this successful card proof. Work on remaining costly (1,3) and (2,3) original proof roots at S057 baseline ~5.80–5.82 million KiB, with genuine third-index singleton/two-survivor formal certificate; separately verify per-root kernels, then measure complete flagship. Install the next session when owner directs; S059 already installed in `research/NEXT_SESSION_PROMPT.md` and must be corrected to reflect run #8 PASS and full 9 GiB kernel failure.
