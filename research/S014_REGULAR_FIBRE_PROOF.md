# S014 — regular permutation fibres from actual quartet partitions

Date: 16 October 2026. Canonical branch: `session/s007-full-lean-flagship`, draft PR #4.

**Final strict verification update — 16 October 2026:** Lean source [`95ef8f4886868f66edfbde90b34cc9e12fe6b463`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/95ef8f4886868f66edfbde90b34cc9e12fe6b463) has [kernel workflow PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894336) and [finite evidence PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894242) at that exact SHA. The hosted kernel job succeeded at `lake build`, forbidden proof-hole scan, and all nine independent checkers. `#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound` for S014 declarations. The repaired `perm_finset_image_fixed_iff`, `canonicalFourBlockColour_comp_iff_image_fixed`, `canonicalQuartetImageStabilizer_card = 576`, and `canonicalTwoQuartetStabilizer_card = 16` are now **LEAN_KERNEL_VERIFIED**. Previous statements about these declarations' CI being pending describe an earlier checkpoint, not the final result. **2304/128 full events, moments and four-term law remain OPEN_IN_LEAN.**

## Kernel-certified mathematical result

Define `canonicalFourBlockColour : Fin 8 → Bool` to indicate membership in the canonical quartet Q₀ = {0,1,4,5}. Both fibres have cardinal 4 by a small eight-point kernel decision. The pinned Mathlib theorem `DomMulAct.stabilizer_card` gives, for a finite function f, the stabilizer size `∏ᵢ (|f⁻¹(i)|!)`. Thus the exact genuine-permutation stabilizer preserving the ordered Q₀/complement partition has size `4! × 4! = 576`. Public theorem: `canonicalFourBlockStabilizer_card`.

**Verification:** source [3d004c3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3d004c3378e3c4afd07343a2e9dcc5ca26475aeb), strict [Lean job 38948956267 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38948956267), standard axioms only and nine independent checks. No enumeration of all 40320 permutations is used in this proof.

## Additional exact-source candidates: 16 and fixed actual images

Source [0ab79e8](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0ab79e8c9d9f5ef0fe111d69e6c87fa938d2b9bb) defines `canonicalTwoQuartetColour : Fin 8 → Bool × Bool` by membership bits of Q₀, Q₁. All four fibres have exactly two members: {0,1}, {4,5}, {6,7}, {2,3}. Applying `DomMulAct.stabilizer_card` yields `(2!)⁴ = 16`. This is the correct ordered configuration stabilizer for the 2+2+2+2 partition.

Source [3b8d2e3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3b8d2e3cd771f34ead2de9e6bf8bd72f3d55a585) adds `perm_finset_image_fixed_iff`, `canonicalFourBlockColour_comp_iff_image_fixed`, and `canonicalQuartetImageStabilizer_card`, meant to identify the 576 stabilizer with the actual predicate `(quartet 0).image e = quartet 0`. **These later source declarations were awaiting exact-source hosted Lean CI at the time of this closeout**. They must not be upgraded until strict compilation and axiom checks succeed.

## Mathematical scope and exact remaining obstruction

The written single-event number 2304 is `4 × 576`: for a fixed four-set S, its image under a uniform permutation must equal one of four canonical zero-sum quartets, with 576 permutations in each fixed-target image fibre. The pair/triple favourable number 128 is `8 × 16`: for compatible fixed overlap-two incidence data, eight ordered canonical image configurations each admit 16 permutations. **The multiplication is presently a written combinatorial argument, not the full general fixed-event Lean theorem.** Explicit coset/transport equivalences, disjointness of alternative targets and all graph MIS moment sums remain to be formalized.

Existing STRICT S014 earlier proofs certify `labellingZeroMISCount_eq_quartetIndex_filter`, actual zero-sum pair overlap 0/2 and existence of a disjoint pair among any three distinct zero-sum quartets at [466d0ac](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/466d0ac74d335e7f905dc4f9fc8ce3bec15129cd), [Lean PASS 38947974155](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38947974155). S013 independently proved for all connected graphs and all permutations `labellingZeroMISCount ≤ 3`.

Pending: two general 2304/128 event-fibre cardinalities, unordered pair/triple graph-MIS moments, single four-term law, equality iff spider. Arbitrary-cap normalisation existence is an explicit classical hypothesis only. No manuscript/registry submission and no claim of novelty priority.
