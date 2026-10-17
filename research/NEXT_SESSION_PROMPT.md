# PDIC S025 — strict Lean certificate for the 702-image zero-fixing GL(3,3) orbit

**Automatically installed at S024 closeout, 17 October 2026. NOT EXECUTED.** The next explicit owner's “Run next session” executes S025 immediately, without reconfirmation. Follow AGENTS.md. Work on `session/s007-full-lean-flagship`, draft PR #4; never merge it automatically. Install S026 at the end of S025 but do not execute it.

## Exact starting mathematical boundary

S022 has the complete real four-probability law and sharp unique spider for the canonical eight-cap, strictly certified. S023 has the same for any admissible cap **assuming** `hnf : ClassicalCapNormalForm`, strictly certified. S024 introduced `S024.lean` to isolate the precise **unlabelled** finite orbit proposition `AdmissibleCapImageOrbit`; the labelled equivalence `classicalCapNormalForm_iff_image_orbit` reconstructs a genuine permutation using admissibility/injectivity and finiteness. Consult `sessions/S024_CLOSEOUT.md` for whether the S024 bridge itself has passed exact-head strict CI.

**ONE exact remaining mathematical obligation:** prove `AdmissibleCapImageOrbit` without hypotheses, axiom, oracle, `sorry`, `admit`, `native_decide`, or an unverified numerical certificate. Do not confuse the already passing exhaustive Python checker with a Lean proof. The distinct `ClassicalCapNormalForm` proposition does not magically follow without this missing orbit lemma.

## S024 extension: preferred 6188-candidate basis-normalization alternative

A subsequent **FINITE_CHECKED**, not yet fully Lean-certified, S024 extension gives a potentially much smaller proof than 329472 opposite-pair candidates. First prove **every admissible eight-cap contains an independent ordered triple**, and construct a zero-fixing `LinearEquiv` sending that triple to `(e₁,e₂,e₃)`. The basis points themselves, zero, their three antipodes, and the three negatives of pairwise basis sums exclude 10 distinct ambient points. That leaves 17 candidate points for the remaining five: **C(17,5)=6188** candidates. Independent exhaustive code finds **18 admissible normalized caps**; all 18 equal a normalized canonical linear image. The canonical eight-cap has 48 independent unordered triples / 288 ordered ones, producing exactly the same 18 normalized cap images. Script: `scripts/verify_s024_normal_form.py`; mathematical note: `research/S024_BASIS_NORMALIZATION_EXTENSION.md` on proof branch. Prove the 17-point restriction and **18-of-6188 completeness** in the Lean kernel, and extract actual typed linear maps to close `AdmissibleCapImageOrbit`. Avoid claiming that the Python table itself or a conditional basis-normalized lemma discharges the universal orbit. Fall back to the original 13-direction method only if needed.

## Strictly verified extension after S024 closeout — start here

Two new proof-bearing commits on `session/s007-full-lean-flagship` make the 17-point enumeration an honest theorem about **every normalized admissible cap**, not just the size of an ambient set.

- At [`4a0aad7a0728c699fc49edecb14567a6b89f3d1d`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4a0aad7a0728c699fc49edecb14567a6b89f3d1d), [strict Lean 39040469364 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040469364), theorem `admissibleCap_three_ne_zero` formalizes three-point exclusion and `s024_normalized_other_mem_free` proves each unanchored actual cap label lies in `s024FreePoints`, under an actual injective anchor assignment and basis-value equalities.
- At [`3a63b938cfff51e70be63dcd22835a6fa67e3046`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3a63b938cfff51e70be63dcd22835a6fa67e3046), [strict Lean 39040892718 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040892718), [independent finite 39040892593 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040892593), `s024RemainingVertices_card` proves exactly five non-anchor vertices and `s024RemainingCapPoints_in_five_subsets` proves the actual injective five-point image belongs to `s024FreePoints.powersetCard 5`. New theorems have only `propext`, `Classical.choice`, `Quot.sound` axioms.

S025 **must not redo** these certified conditional-on-normalization reductions. Still prove independently (a) existence of a normalizing linear equivalence/basis for every admissible cap, (b) all surviving 18 cases among the 6188 reduced candidates by a Lean kernel certificate, and (c) the corresponding **typed invertible** zero-fixing linear maps. The 18-case and global orbit claims remain **OPEN_IN_LEAN**, and the independent Python result remains only **FINITE_CHECKED**. S025 is installed, **NOT EXECUTED**. See `research/S024_BASIS_NORMALIZATION_EXTENSION.md` on the proof branch for precise closure.

## Further S024 extension: strictly certified two-span escape

After the already certified full-image 6,188-candidate theorem, a new unconditional mathematical obstruction is now **LEAN_KERNEL_VERIFIED**. At [source commit \`9f714802a8e38c4989de968f061886e1e4d7dc16\`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/9f714802a8e38c4989de968f061886e1e4d7dc16), [strict Lean run \`39045727429\` SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39045727429), [independent finite \`39045727481\` SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39045727481), Lean has proved:

- \`s024ProjectiveOrient_eq_cases\`: equality of projectively normalized ternary vectors implies equality up to sign;
- \`s024TwoSpan_projective_le_four\`: every span of two ternary vectors contains at most four nonzero projective directions;
- \`s024_admissible_point_outside_two_span\`: for every genuine admissible enumerated eight-cap and **any** two vertex labels \`u,v\`, there exists a third labelled vertex \`w\` outside the linear span of \`f u,f v\`.

Their printed axioms are only \`propext\`, \`Classical.choice\`, \`Quot.sound\`. This is a **genuine unconditional geometric lemma**, not a normalizing linear map or the final orbit theorem.

**S025 updated first mathematical gate:** start with \`u=0,v=1\`; prove these two cap vectors are linearly independent (using injectivity, nonzero singleton and nonzero pair sum over F₃), use the new outside-span witness as the third basis point, and **construct its actual inverse \`CapPoint ≃ₗ[ZMod 3] CapPoint\`**, e.g. via a verified matrix determinant and Mathlib's invertible-matrix/linear-equivalence machinery. Only after that normalization is kernel certified, implement the **18-of-6188** admissibility enumeration and typed zero-fixing witnesses. Do not redo the new two-span or 6,188-candidate proofs or silently assume an independent triple. The orbit, \`ClassicalCapNormalForm\`, and unconditional flagship remain **OPEN_IN_LEAN**. S025 remains **NOT EXECUTED**.

## Main proof target

Construct a theorem `admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit` using real `CapPoint = Fin 3 → ZMod 3` and actual `CapPoint ≃ₗ[ZMod 3] CapPoint`. Then obtain `classicalCapNormalForm_proved : ClassicalCapNormalForm` via S024's certified equivalence, and finally derive `connected_graphMIS_complete_flagship_unconditional_all_caps` by applying S023's conditional flagship. The final statement must quantify over **all connected eight-vertex graphs G** and **all admissible enumerated caps f** and retain every one of the genuine four exact probabilities and the iff named-spider sharp equality case.

## Concrete finite-certificate strategy

1. Construct the 13 antipodal pairs of the 26 nonzero `F₃³` vectors in Lean, and a canonical finite encoding of eight-element subsets taking at most one representative from each pair. Form the at-most `binom(13,8)·2⁸ = 329472` candidate configurations; zero-sum-triple pruning leaves exactly 702. No exhaustive `27^8` labelled-map search.
2. Generate exact `GL(3,3)` matrices as independent ordered basis images; prove invertibility and the count 11232, while certifying the canonical cap-image stabiliser size 16. Avoid opaque runtime checks. Prefer a reduction to a finite table of unique 702 orbit masks with kernel-checked membership or a structural nine-cap proof, whichever is faster to make the Lean kernel accept.
3. Prove *every* admissible image is represented by the generated candidates, that each surviving candidate appears in the canonical orbit, and that a surviving member yields an actual `LinearEquiv` witness. Ensure none of these three implications is left as an unproved lemma. The independent `scripts/verify_s024_orbit.py` enumerates the same figures using a distinct antipodal-pair DFS; compare classifications and explicit permutations.
4. Exploit the S024 bridge already proved (subject to strict CI confirmation) to convert image equality to a **genuine vertex permutation**; do not insert a second arbitrary permutation hypothesis.
5. If direct finite reduction exhausts heartbeats, prove a mathematical shrinking lemma (e.g. basis normalisation or structural affine-nine-cap-to-pointed-linear reduction) rather than invoking `native_decide`. Record exact smallest remaining obligation if completion remains blocked.

## Hostile audit / verification / governance

Check independently for nonstandard orbit components, additive translations masquerading as linear maps, mishandled origin, incorrect matrix determinant or stabiliser counts, duplicate unordered image representations and missing labelled permutations. Primary reference is Follett–Kalail–McMahon–Pelland–Won (2014), Proposition 2.2(1); it states **affine** nine-cap equivalence, not the zero-fixing **linear** form, which requires an additional argument. Preserve novelty/priority as unresolved.

Run pinned `lake build`, `lake env lean S024.lean` (or an integrated proof module), source hole scan, `#print axioms` permitting only `propext`, `Classical.choice`, `Quot.sound`, all independent finite checkers and exact-head hosted strict/finite Actions. Do not upgrade the **unconditional** flagship until CI passes for the actual proof-bearing commit. Keep proof branch and draft PR #4 unmerged; do not submit Palomar/arXiv/journal, contact researchers, or modify other repositories.

## Closeout

Write a mathematical proof note; update CLAIMS, README, ROADMAP, `authoritative/STATE.json` and the next session's closeout; pin proof commit and exact successful CI run URLs. Automatically install an executable S026 prompt for the most significant remaining first-paper proof obligation, without executing S026.
