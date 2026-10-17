# PDIC S026 — strict certification and unconditional zero-fixing eight-cap orbit closure

**S025 strict verification recovery update (17 October 2026):** Read [S025_VERIFICATION_RECOVERY.md](../sessions/S025_VERIFICATION_RECOVERY.md) first. The original monolithic S025 full candidate produced hosted **FAILURE 39052514935 (runner shutdown 143)** after a successful `lake build`. Active proof-branch S024.lean was reduced to independent-anchor source, and **strict run 39053896006 SUCCESS** (exact identical Lean source blobs between proof commit 482f17e5bc9eee15e1063d696e73c77d5e968014 and validation commit 80610407d796d1ccbd4b9f3174db4d8727f048d5), certifying three S025 anchor lemmas with standard axioms only, all scans and checkers green. The complete previously unverified candidate is preserved in `scratch/S025_FULL_UNVERIFIED_SOURCE.lean`. The separately isolated determinant/typed-map candidate is on temporary validation PR #10, [strict run 39054362391](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39054362391); inspect its **final** conclusion before promotion. Do not redo the verified three anchors; solve the typed GL proof and 18-case classification next. **S026 remains installed, NOT EXECUTED.**

**Installed automatically after S025 closeout on 17 October 2026; NOT EXECUTED.** The next owner's "Run next session" authorizes S026 immediately. Follow `AGENTS.md` and work on `session/s007-full-lean-flagship` with draft PR #4 **OPEN AND UNMERGED**. Never automatically merge the PR, register Palomar, submit arXiv/journal or contact researchers. At closeout install S027, but do not execute it.

## Binding theorem

Finish the only open *unconditional* mathematical ingredient of the all-admissible-cap first-paper flagship:

```lean
admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit
classicalCapNormalForm_proved : ClassicalCapNormalForm
connected_graphMIS_complete_flagship_unconditional_all_caps
```

The last statement must retain, for *every connected graph G on Fin 8* and *every admissible labelled cap f*, the exact real 40320-permutation probability formulas (P0,P1,P2,P3), the bound P3≤1/105, and equality **iff** graph-isomorphic to the named spider S(2,2,2,1). Do not replace this theorem with a paper-only result, a graph-only extremal theorem, a conditional normal-form assertion, or an external numerical script.

## Trust boundary at start

- S022 canonical all-four-event flagship is already **strict Lean certified** at `78273ce1fae09f844009740830b5ca9cdff7f6b7`; S023 arbitrary-cap transport **conditional explicitly on ClassicalCapNormalForm** is already **strict Lean certified** at `1ae1e7eccb55893d1dee798c57ba2e2663f03090`.
- S024's labelled-image orbit equivalence, genuine 17-point/6188-candidate reduction, and unconditional two-span escape theorem have successful pinned certificates. Latest independently confirmed geometry step: proof source `9f714802a8e38c4989de968f061886e1e4d7dc16`, [strict run 39045727429](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39045727429) PASS, finite run 39045727481 PASS.
- S025 new proof branch head [`1b4a096c94bd333ef6e0cf4274efc0f358235e5f`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1b4a096c94bd333ef6e0cf4274efc0f358235e5f) contains `S024.lean` proof **candidates** for noncollinear first two actual cap points, a genuine third witness outside the plane, a universal determinant lemma, a typed linear equivalence from the three columns, full 18-of-6188 normalized cap classification, and eighteen explicit matrix image witnesses. New `scripts/verify_s025_basis.py` independently audits 11232 determinant cases and 702 cap images. These new source declarations were **NOT verified by accessible exact-head strict CI at S025 closeout**; do not call them kernel-certified without checking actual logs.

Read `research/S025_POINTED_BASIS_AND_NORMALIZED_ORBIT.md`, `sessions/S025_CLOSEOUT.md`, current `S024.lean`, `PDIC.lean`, `research/S024_BASIS_NORMALIZATION_EXTENSION.md`, `research/FLAGSHIP_THEOREM.md`, `authoritative/STATE.json` and the manuscript before modifications.

## Priority order — mathematics before governance

**Gate A: exact-head S025 candidate verification and repair.** Fetch latest canonical source and hosted runs. Run pinned `lake build`, `lake env lean S024.lean`, source hole/axiom scan, all finite scripts. The 18-of-6188 `decide +kernel` proof or 19683-triple determinant proof may exceed reasonable kernel reduction; in that case replace with a smaller *trusted Lean certificate* (e.g. bitmask/Boolean membership, split bounded cases, balanced table checks), not `native_decide`, `sorry`, `admit`, `axiom`, `constant`, compiler trust, or a Python output passed off as a proof. Only permit printed axioms `propext`, `Classical.choice`, `Quot.sound`. Pin exact SHA and actual SUCCESS CI IDs. Do not touch proven S024 statements unnecessarily.

**Gate B: independent typed normalization.** The existing source defines `s025ColumnMatrix`, `s025CapBasisEquiv`, and `s025_admissible_three_anchor_witness`. Prove the map's three **actual column actions** on `s024BasisPoint 0/1/2` using `Matrix.mulVec`, and construct inverse normalization `CapPoint ≃ₗ[ZMod 3] CapPoint` taking f(0), f(1), f(w) to the standard basis. Derive w≠0, w≠1 and an injective anchor `a : Fin 3 → Vertex`. Prove transformed f remains injective, origin-free and zero-sum-free for all subsets of sizes 1,2,3. Do not simply postulate pinned anchors.

**Gate C: actual normalized-cap completeness.** Link genuine transformed image to the previously certified `s024_normalized_cap_image_in_candidates`; prove `s025ShortZeroFree` from the actual `IsAdmissibleCap` predicate for that image. Apply the now-strictly-checked `s025_normalized_tail_classification` and `s025_matrix_images_eq_normalized_table`. Extract a real witness matrix from the 18-entry table, use `s025_witness_matrices_nonsingular` to construct an `Invertible` matrix and actual `Matrix.toLinearEquiv'`, and show unordered image equality. Compose with the inverse basis normalization to obtain a **zero-fixing** linear map from the canonical eight-cap to the original; check composition orientation carefully. No affine translation.

**Gate D: flagship export.** Use `classicalCapNormalForm_of_image_orbit` / `classicalCapNormalForm_iff_image_orbit` (already S024-certified) to prove the universal normal form, and apply `connected_graphMIS_complete_flagship_all_caps` (already S023-certified) with no `hnf` binder. Confirm full four exact probability identities, sharp P3 and spider iff, print its axioms, and run independent spider/P8 histogram checkers.

## Mandatory hostile audit and closeout

Independently check all 18 tables, matrix row/column orientation, determinant nonzero, cardinality 18 vs 702 vs 11232/16, fixed origin, absence of duplicate cap images, and the bijection needed to promote unordered images to 40320 labelled permutations. Follett et al. 2014 Proposition 2.2(1) proves **affine nine-cap equivalence**, not directly the zero-fixing linear classification; do not overstate the citation. Novelty/priority unresolved.

Write a substantive S026 proof note and closeout; update README, ROADMAP, CLAIMS, STATE. Label each theorem accurately as OPEN, SOURCE_FORMALIZED, FINITE_CHECKED, CONDITIONAL or LEAN_KERNEL_VERIFIED with exact source SHA/CI evidence. Keep PR #4 draft and unmerged; no Palomar, arXiv, journal or external correspondence. **Automatically install S027** targeted at the largest remaining first-paper proof gap without executing it.
