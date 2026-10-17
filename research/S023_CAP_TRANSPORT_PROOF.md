# PDIC S023 — exact all-cap transport proof and strict certificate

**Executed 17 October 2026; LEAN_KERNEL_VERIFIED conditional on externally supplied `ClassicalCapNormalForm`.**

Source: [1ae1e7eccb55893d1dee798c57ba2e2663f03090](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1ae1e7eccb55893d1dee798c57ba2e2663f03090) on `session/s007-full-lean-flagship`, [strict Lean 39023530142](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39023530142) **SUCCESS**, [finite 39023530135](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39023530135) **SUCCESS**. Draft PR #4 remains unmerged.

## The mathematical argument formalised

The Lean definition `labellingZeroMISCountForCap G f e` filters the real `fourGraphMISFamily G`, requiring a **maximal** independent set of size four and zero sum under the fixed enumeration `f` followed by the uniformly sampled permutation `e`. The actual probability `graphMIS_exact_probability_for_cap G f i` counts the cardinal of the event `N₀=i` among the genuine 40320 equally likely permutations; denominator is unchanged.

Given the explicit hypothesis `hnf : ClassicalCapNormalForm` and an admissible `f`, Lean obtains actual `L : CapPoint ≃ₗ[ZMod 3] CapPoint` and `p : Equiv.Perm Vertex` with `f(v)=L(canonicalCapF3(p v))`. The new theorem `labellingZeroMISCountForCap_transport` uses the already proved `capSum_zero_linear_iff` to show every real graph-MIS zero-event count agrees with the canonical count at the reindexed permutation `e.trans p`. No affine translation is used.

The new `rightTranslation` is an explicit equivalence on the *entire* permutation sample space, with inverse `e ↦ e.trans p.symm`. The theorem `rightTranslation_event_fibre_card` constructs the induced equivalence between the actual event subtypes and proves cardinality equality. Thus `graphMIS_cap_event_fibre_card` and `graphMIS_probability_for_cap_eq_canonical` prove equality for **each** genuine fibre and each probability. The unified `connected_graphMIS_complete_flagship_all_caps` instantiates the strictly certified S022 canonical theorem for any connected eight-vertex graph and any admissible fixed cap under `hnf`.

Writing `m=|fourGraphMISFamily G|`, `n₀=graphMIS_pairOverlapCount G 0`, `n₂=graphMIS_pairOverlapCount G 2`, `h=unorderedCompatibleTripleCount G`, the exact equalities are:

```text
P0 = 1 - 2m/35 + 2n0/35 + n2/315 - h/315
P1 = 2m/35 - 4n0/35 - 2n2/315 + 3h/315
P2 = 2n0/35 + n2/315 - h/105
P3 = h/315 <= 1/105
P3 = 1/105 iff Nonempty (G ≃g namedSpider)
```

## Verification

At **1ae1e7eccb55893d1dee798c57ba2e2663f03090**, [strict hosted workflow 39023530142](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39023530142) passed pinned `lake build`, rejected proof holes, and ran **all independent scripts** including S020 unordered moments and the new S023 two-cap checker. The six new printed proof declarations depended only on `propext`, `Classical.choice`, `Quot.sound` (the permutation equivalence used a subset). No `sorryAx` appeared. Separate [finite workflow 39023530135](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39023530135) passed.

The independent new `scripts/verify_s023_all_caps.py` checks two genuinely distinct caps (canonical plus invertible zero-fixing shear), P8 and S(2,2,2,1), and every one of the 40320 permutations for each graph/cap. For each cap: P8 histogram `(31360,6528,2304,128)`; spider histogram `(23424,13440,3072,384)`. This is FINITE_CHECKED corroboration, not a proof of the classifying normal form. Earlier first candidates failed strict Lean (e.g. S023 run 39022602775, 39022917137 and 39023222268), then Lean elaboration and subtype-cardinality normalisation were repaired before the exact successful commit.

## Precisely remaining external input

`ClassicalCapNormalForm` is still a **Prop supplied as a theorem hypothesis**, not a Lean axiom, constant, typeclass instance or internally proved theorem. Its geometric truth depends on classical nine-cap equivalence and the pointed zero-fixing reduction. The S023 complete flagship is therefore LEAN_KERNEL_VERIFIED **conditionally**, rather than unconditional geometric classification. S024 explicitly targets internal Lean certification of this last input. Literature priority/novelty remains unresolved. No PR merge, registration, submission, correspondence, or publication was performed.
