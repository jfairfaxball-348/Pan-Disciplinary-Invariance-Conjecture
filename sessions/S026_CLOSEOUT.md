# PDIC S026 closeout — certified pointed basis determinant and column action

**Date:** 17 October 2026. **Session S026 EXECUTED. Formalisation objective PARTIALLY completed; unconditional all-cap flagship remains OPEN IN LEAN.** S027 installed, NOT EXECUTED.

## Delivered / certified

- Repairs original CI-failing S025 19683-triple determinant computation by splitting on first vector; true `s025_column_det_nonzero`, invertible typed `s025CapBasisEquiv`, and `s025_admissible_has_linear_basis_map`: isolated strict [39057615918 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39057615918) for [commit `7934dbee`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7934dbeeec1ab64cde09458f7761452a51253432).
- New `s026_columnMatrix_basis_action`: matrix maps each genuine coordinate basis vector to its selected original column; pinned [39058090455 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39058090455) for [`eeae2d2a`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/eeae2d2a47cf1740d6fa4736acf1eb657a4739cc).
- Combined canonical proof branch [`bc77db01f5fbc4c783a58370377b591b98dff5f8`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/bc77db01f5fbc4c783a58370377b591b98dff5f8) passes [strict Lean 39058175065](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39058175065) and [finite 39058175027](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39058175027); axiom prints for the newly certified declarations only `propext`, `Classical.choice`, `Quot.sound`; proof-hole scan green.
- Separate draft CI-only experiments: [PR #11](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/11) for entire 18-of-6188 certificate, [PR #12](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/12) for typed basis equivalence action. Their strict workflows [39058398437](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39058398437) and [39058538203](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39058538203), respectively, were **IN PROGRESS** at closeout, NOT yet successful. Neither source candidate is promoted to canonical branch or proof status; inspect final results in S027.
- Independent enumerations confirm candidate quantities, not mathematical Lean proof of orbit completeness. Old isolated [39054362391](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39054362391) **FAILED** by runner shutdown 143 and remains failed.

## Unfinished flagship interface

There is no verified unconditional `AdmissibleCapImageOrbit`, `ClassicalCapNormalForm` or `connected_graphMIS_complete_flagship_unconditional_all_caps`. S023's all-cap probability theorem still binds external `ClassicalCapNormalForm`. Remaining: trusted 18-case certificate, genuine cap image to classifier predicates, matrix witness extraction/invertibility, inverse map action and zero-fixing orbit transport, unconditional flagship export with entire original statement (four probabilities, deterministic N0, bound and spider iff).

The full mathematical evidence and citations are in [S026 proof note](../research/S026_PROOF_NOTE.md). [S027 authoritative prompt](../research/NEXT_SESSION_PROMPT.md) installed and NOT EXECUTED.

No external publication, registration or correspondence. PR #4 remains draft/unmerged. This session is **not** proof of the entire flagship.
