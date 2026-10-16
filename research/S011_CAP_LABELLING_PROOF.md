# PDIC S011 — canonical cap and actual 8! labelling evidence

## Strict Lean source

S011 adds `CapPoint := Fin 3 → ZMod 3`, `canonicalCapF3`, `capSum` and `IsAdmissibleCap` to the genuine proof branch. At exact [e302e5f82434b3d8790c81506fe55062700e7a53](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53), [Lean run 38934564596](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596) **SUCCESS**, with strict `lake build`, standard axiom printouts, source guards and pre-existing eight checkers.

The new kernel-checked declarations are `canonicalCapF3_injective`, `canonicalCapF3_short_zero_free`, `canonicalCapF3_admissible`, `canonicalCapF3_four_zero_iff`, `capSum_linear`, `capSum_zero_linear_iff`, `admissible_under_linear`, `linearCanonicalCap_four_zero_iff`, `uniformLabellings_card`. The last statement counts the actual finite type `Equiv.Perm (Fin 8)` as 40320, but does not by itself prove event-fibre counts.

The linear-equivalence preservation is conditional on a **supplied** `CapPoint ≃ₗ[ZMod 3] CapPoint`; it neither postulates nor proves global orbit classification. No `axiom` or `constant` is introduced.

## Independent finite labelling check

`scripts/verify_s011.py` checks all 40320 bijections and direct coordinate arithmetic. A single specified four-set is mapped to one of four zero quartets under 2304 permutations; a complementary pair also under 2304; an overlap-two ordered pair or specified compatible triple under 128. The latter two types each have exactly 2520 distinct ordered image configurations, every one with precisely 16 preimages (verified by individual image-key counters). Among them exactly eight images are zero-quartet compatible. Thus numerical probabilities are 2/35, 2/35, 1/315, 1/315, respectively.

For the named spider, true size-four MIS counts are m=9, n₀=1, n₂=15, h=3, and the 40320-labelling N₀ histogram on values 0..3 is (23424,13440,3072,384), giving probabilities (61/105, 1/3, 8/105, 1/105). For P8, m=5,n₀=1,n₂=3,h=1 and histogram (31360,6528,2304,128), probabilities (7/9,17/105,2/35,1/315). These are independently **FINITE_CHECKED**, not a universal Lean theorem. The existing named-spider graph extremiser was previously certified in S010.

## Remaining mandatory Lean tasks

The all-graphs `N₀≤3` support bound, permutation-sum reindexing, 16-element fibres as a Lean cardinality theorem, actual uniform event/moment identities, a single four-probability theorem and all-cap classification hypothesis/transfer remain OPEN_IN_LEAN. Prior-art and originality remain unresolved. No Palomar registration, manuscript submission or PR merge.
