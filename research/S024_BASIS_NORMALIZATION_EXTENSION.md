# PDIC S024 extension — basis-normalized 17-point finite-orbit reduction

**Research continuation after the separately completed S024 closeout (17 October 2026).** This is additional groundwork for the installed S025 orbit proof, **not execution or closeout of S025**. Preserve the authoritative main-branch S025 prompt and the draft unmerged PR #4.

## Exact normalization and finite search

Represent `CapPoint` by triples over `F₃` and take an admissible eight-point image `U`. Whenever an ordered independent triple `(a,b,c)` belongs to `U`, its inverse basis matrix takes that triple to `E={e₁,e₂,e₃}`. In those coordinates all other five cap points avoid:

1. `0` (forbidden singleton);
2. `e₁,e₂,e₃` (already selected);
3. `-e₁,-e₂,-e₃` (forbidden opposite pairs);
4. `-(e₁+e₂), -(e₁+e₃), -(e₂+e₃)` (forbidden zero-sum triples).

These are exactly **ten distinct excluded ambient points**, leaving **17** eligible points. Thus after choosing a basis, classification needs only `C(17,5)=6188` remaining-five-subsets, compared with the 329472 opposite-direction configurations of S025's initial suggested strategy, or the impractical `27^8` labelled maps. Full singleton, pair and triple zero-sum checks on these 6188 candidates retain exactly **18** normalized images containing the prescribed basis.

For the quadratic canonical cap `U₀={(x,y,x²+y²): (x,y)≠0}`, there are **48 independent unordered point triples**, or **288 ordered triples**. Applying the unique linear map taking each ordered canonical triple to `E` produces exactly the same **18 normalized cap sets**. Consequently the finite calculation supplies a strong, small exhaustiveness certificate: every normalized admissible candidate is a zero-fixing linear image of the canonical cap, with no translation.

The script `scripts/verify_s024_normal_form.py` checks this **independently** of the repository's `scripts/verify_s024_orbit.py`, and corroborates: 702 admissible unordered cap images, 11232 invertible matrices, 16 maps in each image fibre, and 48 independent unordered triples in each cap.

## Written proof of the basis-existence step

**PROVED_WRITTEN, not yet LEAN_KERNEL_VERIFIED:** An admissible eight-point cap `U` contains an independent triple. Its span has dimension at most three. If the dimension were at most two, `U` would lie in a two-dimensional linear subspace `P ≅ F₃²`. Such a plane has exactly eight nonzero vectors, partitioned into four opposite pairs `{x,-x}`. Since `U` contains neither zero nor an opposite pair, it can contain at most four points of `P`. This contradicts `|U|=8`. Thus `span(U)` has dimension three and a basis can be selected from its points. The corresponding ordered basis determines a genuine invertible zero-fixing linear map taking it to `E`.

This rank-and-antipodes argument avoids any exhaustive labelled-map search. Lean still needs an internal proof of the dimension/cardinality implication, not a hypothesis asserting a basis exists.

## Formal progress and precise remaining obligations

New unconditionally formulated source in `PDIC.lean` introduces `s024BasisPoint`, the exact finite excluded-point set, `s024FreePoints`, and theorem `s024FreePoints_card : s024FreePoints.card = 17` by a **kernel-computed** `decide +kernel` certificate, together with elementary cap exclusions. **Promote this theorem to LEAN_KERNEL_VERIFIED only after hosted strict workflow success at its exact commit.** It does **not** prove the orbit.

The remaining formal bridge is:

- Derive an *independent triple inside every admissible eight-cap* without an external hypothesis, and construct its actual inverse `CapPoint ≃ₗ[ZMod 3] CapPoint`.
- Kernel-certify the full **18-of-6188 normalized classification**, with no `native_decide` or external script treated as a trusted oracle.
- Construct typed invertible linear image witnesses for those 18 caps, then use the existing S024 image-set-to-labelled-permutation equivalence to discharge `AdmissibleCapImageOrbit`. Only then derive unconditional `ClassicalCapNormalForm` and the complete all-cap probability flagship.

The independent Python count is `FINITE_CHECKED`, not a proof of these universally quantified Lean steps. The primary Follett et al. (2014), Proposition 2.2(1), states affine nine-cap equivalence; the pointed linear strengthening requires the specific origin-fixing argument and is not quoted as the literal proposition. Original citation: https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf.

**Status:** the original S024 conditional image-orbit bridge is already LEAN_KERNEL_VERIFIED at 06daea1887f0918fa3b1191cf315ec56a0c0222f / strict 39025025539. The entire unconditional cap-classification claim remains **OPEN_IN_LEAN**; the S022/S023 flagship certificates remain valid with their stated scopes. No new Palomar submission, arXiv submission, PR merge, or external correspondence.


## Further S024 continuation: genuine five-of-seventeen reduction, strictly checked

**New proof increment (17 October 2026).** On the same proof branch and still within S024 continuation, not execution of S025:

1. [Proof commit \`4a0aad7a0728c699fc49edecb14567a6b89f3d1d\`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4a0aad7a0728c699fc49edecb14567a6b89f3d1d), [strict Lean #39040469364 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040469364), [finite #39040469361 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040469361): theorem \`admissibleCap_three_ne_zero\` supplies the actual three-vertex sum obstruction; \`s024_normalized_other_mem_free\` proves, for any admissible cap enumeration \`f\`, injective anchor map \`a : Fin 3 → Vertex\`, and actual pinned values \`f (a i) = s024BasisPoint i\`, that every unanchored label lies in \`s024FreePoints\`. This fills the previously unformalised mathematical link from the concrete 17-point set to arbitrary normalized cap enumerations.
2. [Proof commit \`3a63b938cfff51e70be63dcd22835a6fa67e3046\`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3a63b938cfff51e70be63dcd22835a6fa67e3046), [strict Lean #39040892718 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040892718), [finite #39040892593 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39040892593): \`s024RemainingVertices_card\` certifies the five non-anchor vertex positions, and \`s024RemainingCapPoints_in_five_subsets\` proves that their actual **injective image** belongs to \`s024FreePoints.powersetCard 5\`. No arbitrary five-set assumption, dummy cap points or assumed normal-form orbit is inserted.

Both strict runs checked \`lake build\`, \`lake env lean S024.lean\`, the complete proof-hole scan, all independent finite checkers and \`#print axioms\` of the new declarations; allowed axioms are only \`propext\`, \`Classical.choice\`, \`Quot.sound\`. **Status: LEAN_KERNEL_VERIFIED** for the conditional normalized-cap inclusion and genuine five-subset reduction.

**Remaining exact gates:** (i) independently construct and kernel-certify a normalizing basis for *every* admissible cap, (ii) kernel-certify that the genuine admissible members of the 6188 five-subset candidates are exactly the 18 finitely computed normalized caps, (iii) exhibit and certify zero-fixing invertible linear maps for those 18; only then derive \`AdmissibleCapImageOrbit\`, \`ClassicalCapNormalForm\` and the unconditional four-probability/spider theorem. The 6188/18 counts remain **FINITE_CHECKED** until the enumerative Lean certificate exists; this extension does **not** discharge the orbit theorem.

The authoritative installed next prompt remains S025, **NOT EXECUTED**. Draft PR #4 stays **OPEN / UNMERGED**. No submissions, correspondence, or mutation of other research repositories.
