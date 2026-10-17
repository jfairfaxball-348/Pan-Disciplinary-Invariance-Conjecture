# PDIC S025 closeout — independent basis and finite 18-case orbit certificate candidates

**Session S025 EXECUTED, 17 October 2026.** **Mathematical completion: PARTIAL.** S026 next prompt installed, **NOT EXECUTED**.

## Actual work

On `session/s007-full-lean-flagship` in draft [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4), new proof-source commits culminated at [`1b4a096c94bd333ef6e0cf4274efc0f358235e5f`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1b4a096c94bd333ef6e0cf4274efc0f358235e5f). The added `S024.lean` blocks are:

- actual cap noncollinearity and independent third-point witness: `s025_span_self_cases`, `s025_cap01_not_in_self_span`, `s025_admissible_three_anchor_witness`;
- typed basis-map construction and determinant obstruction: `s025ColumnMatrix`, `s025_column_det_nonzero`, `s025CapBasisEquiv`, `s025_admissible_has_linear_basis_map`;
- explicit normalized candidate certificate: `s025ShortZeroFree`, `s025NormalizedTails`, `s025_normalized_tail_classification`, `s025_normalized_tail_count`;
- eighteen zero-fixing 3×3 witness matrices and exact image equality: `s025WitnessMatrices`, `s025WitnessImages`, `s025NormalizedFullTable`, `s025_matrix_images_eq_normalized_table`, `s025_witness_matrices_nonsingular`.

Committed an independent `scripts/verify_s025_basis.py` and wired it into `.github/workflows/lean.yml`; corrected all eighteen matrix literals to Mathlib's actual `!![a,b,c;d,e,f;g,h,i]` notation at final head. The proof candidate is mathematically meaningful and **all its novel statements still require a successful pinned Lean compilation**.

## Evidence and trust boundary

Independent in-session Python enumeration found **11,232** line/plane-independent ordered triples with nonzero determinant and independently recovered **702** cap images, with no failure to extend any selected pair to an independent third point. Separate S024 evidence already found **18** normalized caps among **6,188** five-subset candidates and confirmed their equality with normalized canonical orbit images. These observations remain **FINITE_CHECKED**. The complete S025 `decide +kernel` certificate is **SOURCE_FORMALIZED / EXACT-HEAD LEAN CI UNVERIFIED**: no successful hosted workflow ID was retrievable for the proof source, and the pinned Lean toolchain was not locally available. The source can have syntax, type, tactic, heartbeat or kernel-runtime failures; do **not** imply otherwise. A line containing `decide +kernel` is not a completed certificate until the Lean kernel actually accepts it.

**Previously strictly verified:** S024 genuine 6188-domain reduction and unconditional two-span escape, [source `9f714802...`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/9f714802a8e38c4989de968f061886e1e4d7dc16), [strict Lean 39045727429 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39045727429), finite 39045727481 SUCCESS. S022 canonical and S023 conditional all-cap law remain strictly verified at their original exact SHAs.

## Remaining precise mathematical gap

**NO** `admissibleCapImageOrbit_proved`, **NO** unconditional `classicalCapNormalForm_proved`, **NO** unconditional all-cap complete four-probability theorem has been checked or exported. First strictly certify/repair the S025 source; next verify that the typed map sends the three standard basis elements to actual cap columns, use its inverse to normalize the actual cap, link the genuine 6188 candidate to the 18-list, extract typed GL witnesses and compose image-equalities. The existing S024 bridge then removes `hnf : ClassicalCapNormalForm` from the genuine full S023 flagship. Detailed mathematics: [S025 proof record](../research/S025_POINTED_BASIS_AND_NORMALIZED_ORBIT.md).

## Governance / next

The authoritative [S026 prompt](../research/NEXT_SESSION_PROMPT.md) is installed with a copy at [research/S026_UNCONDITIONAL_CAP_ORBIT_CLOSE_TARGET.md](../research/S026_UNCONDITIONAL_CAP_ORBIT_CLOSE_TARGET.md), **NOT EXECUTED**. `authoritative/STATE.json`, README, ROADMAP, CLAIMS updated at closeout. PR #4 remains **DRAFT / OPEN / UNMERGED**; no Palomar registration, arXiv or journal submission or external correspondence. Literature priority remains unresolved.
