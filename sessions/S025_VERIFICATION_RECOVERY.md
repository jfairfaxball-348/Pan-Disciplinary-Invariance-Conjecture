# S025 verification recovery — independent cap anchors strictly certified

Date: 17 October 2026. This is a **post-closeout verification correction** to S025; S026 remains installed and **NOT EXECUTED**.

## What was wrong with the original claim

Original S025 source `1b4a096c94bd333ef6e0cf4274efc0f358235e5f` contained a monolithic `S024.lean` with independent anchor lemmas, a ternary determinant computation, a typed linear equivalence and the 18-of-6188 candidate table. The first properly readable pull-request strict workflow [39052514935](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39052514935) **FAILED**: `lake build` succeeded, but the runner terminated with exit 143 while separately checking `S024.lean`. The finite workflow [39052515003](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39052515003) passed, but does not resolve that Lean failure.

The complete unverified original source was preserved verbatim in `scratch/S025_FULL_UNVERIFIED_SOURCE.lean` on the proof branch. The active `S024.lean` was reduced to the already-certified S024 geometry plus exactly three S025 independent-anchor declarations. The larger 18-case and typed-matrix candidates were not deleted; they were **removed from the active build** pending separate compilation and verification.

## Certified exact-source increment

Proof branch commit: [`482f17e5bc9eee15e1063d696e73c77d5e968014`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/482f17e5bc9eee15e1063d696e73c77d5e968014).

Hosted validation commit: [`80610407d796d1ccbd4b9f3174db4d8727f048d5`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/80610407d796d1ccbd4b9f3174db4d8727f048d5) in temporary draft PR #10, deliberately differing only by a nonproof CI marker file. GitHub's content API was used to **confirm identical blob SHAs** for `PDIC.lean`, `S024.lean`, `lakefile.toml` and `lean-toolchain` between the canonical proof branch and this precise validation commit.

Strict pinned [Lean CI #39053896006 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39053896006), with `lake build`, `lake env lean S024.lean`, proof-hole scan and every independent finite verifier passing. The runner's `#print axioms` output establishes that these declarations have only `propext`, `Classical.choice`, `Quot.sound`:

- `s025_span_self_cases`: if q lies in the span of a repeated p then q is 0, p or -p;
- `s025_cap01_not_in_self_span`: the second point of any genuinely admissible cap cannot lie on the line of the first;
- `s025_admissible_three_anchor_witness`: combining the above with already-certified S024 two-span escape, constructs a third cap point outside the plane of the first pair.

**These three are LEAN_KERNEL_VERIFIED.** This is a real and useful geometric increment, but is not the typed normalization theorem or all-cap orbit.

## Next verification gate

The determinant `s025_column_det_nonzero` and actual typed matrix map `s025CapBasisEquiv` were placed separately on the temporary validation branch in [candidate commit `13e0cff15cea95cce3563bb61cbb54af1fcc36a0`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/13e0cff15cea95cce3563bb61cbb54af1fcc36a0), with hosted strict run [39054362391](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39054362391). Its final CI conclusion must be checked explicitly before the candidate is promoted to the canonical proof source. The 18 normalized-cap table, 18 typed linear images, actual 6188-case classification, `AdmissibleCapImageOrbit`, `ClassicalCapNormalForm` without external hypothesis, and unconditional graph–cap flagship are **NOT YET LEAN CERTIFIED**.

S026 authoritative target remains `research/NEXT_SESSION_PROMPT.md`, now with this narrower CI/reduction status. Draft PR #4 remains unmerged. Temporary PR #10 is CI-only and must not be merged. No Palomar, arXiv, journal, or correspondence.
