# PDIC S031 — validation of complete flagship and exact-source canonical promotion

Date: 18 October 2026. Existing flagship, no new mathematics.

## Exact strict validation

- Source commit: `09d9f392d20399c80f2c51e2f4979b78b412c4e2`; file S024.lean blob `4067aa1f0a978a1437fb25d1741bad9537112380`; candidate draft PR #23.
- [Validation Lean CI 39119264069](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39119264069) SUCCESS at exact source, job 117651313038, pinned `lake build && lake env lean S024.lean`, source-hole scan and full independent checkers SUCCESS.
- [Independent finite run 39119264061](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39119264061) SUCCESS.
- Explicit printed axioms for PDIC.s030_normalized_tail_classification, PDIC.admissibleCapImageOrbit_proved, PDIC.classicalCapNormalForm_proved and PDIC.connected_graphMIS_complete_flagship_unconditional_all_caps are exactly [propext, Classical.choice, Quot.sound]. No sorry/admit/native_decide/custom axiom.
- The strict 18-tail proof assembles true indexed 0–3 cardinalities 5,5,5,1 with certified 4–16 cards, not raw 6188-candidate native computation.
- The actual theorem includes connected G, admissible f and all four rational graphMIS_exact_probability_for_cap equations and sharp 1/105 iff namedSpider conclusion, with no external ClassicalCapNormalForm premise.

## Canonical proof branch

- Candidate is exactly one commit ahead of verified base `9903ef8eb1d734ae5b11f0cb076aba6b0c440e64` and modifies ONLY S024.lean (+293 / -0).
- Canonical branch session/s007-full-lean-flagship was fast-forwarded with expected-head lease to the *identical* commit `09d9f392d20399c80f2c51e2f4979b78b412c4e2` without modification. PR #4 remains draft and unmerged.
- [Canonical strict CI 39120877185](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877185): Canonical workflow in progress; not yet certified on the second run. Canonical [finite 39120877141](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877141) SUCCESS.
- No unconditional standalone main-branch proof claim: formal source currently resides in PR #4 proof branch, not main's older PDIC.lean.

## Limitations

The 17-point 6,188/18 normalized-cap theorem, linear orbit theorem and exact full probability/spider theorem are LEAN_KERNEL_VERIFIED on the *candidate exact SHA*, which is now also canonical head. Under the strict two-run operating contract, canonical independent rerun remains in progress. Until that last gate is inspected successfully, do not upgrade its separate certification status.

External novelty/priority unresolved; existing TeX manuscript assumes cap classification externally and is out of date. No submission and no merge to main.


## S031 final post-closeout CI evidence (governance addendum, not a new numbered session)

## S031 final verification — canonical full flagship (18 October 2026)

The complete **unconditional** eight-cap / connected eight-vertex graph flagship is **LEAN_KERNEL_VERIFIED** at source commit `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, `S024.lean` blob `4067aa1f0a978a1437fb25d1741bad9537112380`. Validation [strict Lean #39119264069](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39119264069) succeeded; identical-source canonical proof branch [strict Lean #39120877185](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877185) succeeded (job 117656058420); [canonical independent finite #39120877141](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877141) succeeded. Actual pinned combined-build logs and explicit `#print axioms` show only `[propext, Classical.choice, Quot.sound]` for `s030_normalized_tail_classification`, `admissibleCapImageOrbit_proved`, `classicalCapNormalForm_proved`, and `connected_graphMIS_complete_flagship_unconditional_all_caps`. Source-hole scan and independent finite checks passed. The latter theorem has **no external normal-form hypothesis**; it covers the exact uniform 40,320-label permutation P0–P3 law, sharp P3≤1/105, equality iff the named spider S(2,2,2,1). The verified proof is on draft unmerged PR #4, not main's historical PDIC.lean.

**Owner-directed next step:** S032 is **Palomar full-flagship registration PACKAGE preparation**, not a manuscript-writing or novelty-audit stage. Install a complete Challenge/Solution/Comparator/metadata/licence/module-compliant snapshot and seek the **official full-mode PalomarSubmission mechanical verification PASS at an immutable final SHA**; hand that owner-submit-ready SHA and form tuple over without initiating submission or public registration. The paper and public title/formula must remain aligned. Novelty/priority remains unresolved; Palomar is not editorial priority certification.

See [current next-session prompt](research/NEXT_SESSION_PROMPT.md) and [S031 closeout](sessions/S031_CLOSEOUT.md).

