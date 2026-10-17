# PDIC S027 — complete the exact flagship theorem in trusted Lean

**Installed, NOT EXECUTED as a numbered session.** The owner's next “Run next session” authorizes execution without confirmation. S027 is ONLY the previously proved mathematics of the first-paper flagship, now being completed in Lean; no new mathematics or new research targets. Follow AGENTS.md. Keep the genuine research branch `session/s007-full-lean-flagship` and draft PR #4 **unmerged**. No Palomar registration, paper submission or external correspondence.

## Precisely certified S026 recovery and proof continuation (17 October 2026)

Read `sessions/S026_POST_CLOSEOUT_VERIFICATION_RECOVERY.md` and do not redo the accomplished geometry:

- Genuine admissible-cap independent anchors, determinant GL basis map, forward/inverse action, and injective normalization of the **actual cap** are strictly certified on canonical [commit d13efd7d142071716f008e3b39051186d51db2e4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/d13efd7d142071716f008e3b39051186d51db2e4), [Lean #39062459463 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39062459463), finite #39062459465 SUCCESS.
- Eighteen explicit zero-fixing invertible witness matrices and equality of their genuine eight-point images with `s025NormalizedFullTable` passed isolated [Lean #39076819328 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39076819328) and canonical [commit ce5108b73d950b888cc0170cd96c4ef0f3198fb7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ce5108b73d950b888cc0170cd96c4ef0f3198fb7), [Lean #39077367669 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39077367669). Certified declarations `s025_matrix_images_eq_normalized_table`, `s025_witness_matrices_nonsingular`.
- `s027_image_subset_no_short_zero` and `s027_image_short_zero_free` proved that the real admissible cap image satisfies all one-, two-, three-point exclusions: [Lean #39077143925 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39077143925).
- `s027_normalized_cap_image_in_filtered_candidates` and `s027_any_admissible_normalized_in_filtered_family` prove that for **every admissible cap**, an actual zero-fixing invertible normalization puts its complete image into the **filtered 6,188-candidate family**, without assuming the 18-case theorem: [Lean #39077624243 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39077624243). Promoted together to canonical [commit 9f5030951a54182dfaf692a621eeb081cfb09675](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/9f5030951a54182dfaf692a621eeb081cfb09675). The identical integrated canonical commit **PASSED** [strict Lean #39078143085](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39078143085) and [independent finite #39078143139](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39078143139), with only standard axioms, successful hole scan and all independent checkers.
- All successfully certified new declarations above print only `propext`, `Classical.choice`, `Quot.sound`; their source is free of `sorry`, `admit`, `axiom`, `constant`, and `native_decide`.

**DO NOT misreport this partial success as the unconditional theorem.** The monolithic computational `s025_normalized_tail_classification` does not have a successful strict Lean certificate: [failed #39060204539](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39060204539) completed `lake build` but then terminated with runner exit 143 on full `S024.lean`. Earlier failed variants had `Finset.all` type errors and noncomputable `Finset.toList`. Independent finite verifiers count **6,188** candidates, exactly **18** admissible normalized cases, **702** total cap images, **11,232** elements of GL(3,3), and **16** maps per image. This is FINITE_CHECKED corroboration, NOT a Lean proof of exhaustiveness.

## Binding final theorem

Produce a successful exact-source pinned Lean proof named:

```lean
admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit
classicalCapNormalForm_proved : ClassicalCapNormalForm
connected_graphMIS_complete_flagship_unconditional_all_caps
```

The last theorem must quantify over every connected simple graph `G : SimpleGraph Vertex` on eight vertices and every actual labelled `IsAdmissibleCap f`. It must retain the *real 40320-permutation* P₀/P₁/P₂/P₃ probability law (both moment and expanded forms), deterministic `N₀ ≤ 3` for each labelling, `P₃=h/315≤1/105`, and equality iff graph-isomorphic to `namedSpider = S(2,2,2,1)`. Do not silently weaken its scope or leave a `hnf : ClassicalCapNormalForm` hypothesis.

## Mandatory mathematical attack order

**Gate 1 — Trusted 18-of-6,188 completeness.** The sharp next theorem is exactly

```lean
s027NormalizedAdmissibleTails = s025NormalizedTails
```

with `s027NormalizedAdmissibleTails` being the *genuine* `s024FreePoints.powersetCard 5` filtered by `s027ShortZeroFree (s024BasisSet ∪ T)`, and `s025NormalizedTails` the explicit eighteen sets. Prove this without `native_decide`, `sorry`, `admit`, custom axioms, or external Python as an oracle. Replace one enormous `decide +kernel` on the full powerset with **small trusted Lean calculations**: partition candidates by their first (if needed first two) selected tail points, use bounded subfamilies or fast Boolean/bitmask predicates with formally proved equivalence, certify each piece and combine into an exact global equality. Test focused cases on temporary branches, inspect all Lean error logs, and only promote *successful exact-source* proofs. Do not increase resource limits and claim success for a still terminated monolithic run.

**Gate 2 — Real cap image to witness.** Use the existing kernel-certified `s027_any_admissible_normalized_in_filtered_family`, Gate 1, and `s025_matrix_images_eq_normalized_table` to extract an actual `M ∈ s025WitnessMatrices` matching the **unordered normalized image**. Apply certified `s025_witness_matrices_nonsingular` to prove `M.det ≠ 0`, construct a real invertible matrix and `Matrix.toLinearEquiv'`; prove that its image of `canonicalCapF3` is precisely that normalized image. Compose with the inverse normalization in the correct order. Every transformation must fix zero, not translate affinely.

**Gate 3 — Remove hypothesis and export the entire original statement.** Prove `AdmissibleCapImageOrbit`, then `ClassicalCapNormalForm` by the already certified S024 `classicalCapNormalForm_of_image_orbit`. Apply the already certified genuine S023 `connected_graphMIS_complete_flagship_all_caps` without `hnf`. Include deterministic bounded support and moment/expanded P₀–P₃ identities. Explicitly reject a graph-only, canonical-only, paper-only, or conditional substitute.

**Gate 4 — Strict exact-source hostile verification.** At the final pinned proof SHA obtain successful hosted `lake build` AND `lake env lean S024.lean`, `#print axioms` for all new public declarations and final theorem (only `propext`, `Classical.choice`, `Quot.sound`), zero proof holes/trusted compiler substitutions, and all independent finite scripts, including every explicit matrix/table and namedSpider/P8 permutation histogram. Audit 18 vs 702 vs 11232/16 and orientation of matrix multiplication, image sets vs labelled permutations. Record exact SUCCESS workflow URLs; any failed/pending run is NOT certification.

## Closeout

Only after Gate 4 succeeded mark the entire original first-paper flagship `LEAN_KERNEL_VERIFIED`. Otherwise preserve verified increments, label remaining steps `OPEN` or `SOURCE_FORMALIZED/FINITE_CHECKED`, explain the smallest failing Lean goal, and install S028 aimed only at that gap. Update `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, session closeout and proof note; keep main and draft PR #4 separate, no merge/publication without explicit owner instruction. Automatically install the **full executable S028 prompt but do not execute it**.
