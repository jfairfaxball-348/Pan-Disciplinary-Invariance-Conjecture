# PDIC S015 — actual permutation-fibre transport and singleton event

16 October 2026. Work conducted on canonical formalisation branch `session/s007-full-lean-flagship`, draft PR #4. The full four-term theorem is **not** certified by this note.

## Mathematical construction

The S014 strict source proved that preserving the four/four membership colouring of canonical quartet `Q₀` has exactly 576 permutations, and preserving the 2×2 quartet-bit incidence colouring of `Q₀,Q₁` has exactly 16 permutations. The S015 source strengthens these as follows.

1. `canonicalTwoQuartetColour_comp_iff_images_fixed` identifies preservation of the ordered two-quartet colouring with **both actual image equalities** `Q₀.image e=Q₀` and `Q₁.image e=Q₁`. Thus `canonicalTwoQuartetImageStabilizer_card` targets the actual two-set image-fibre cardinal 16.
2. `exists_perm_fourset_image` explicitly constructs a permutation between any two four-subsets of `Fin 8`, by matching their four vertices and four complementary vertices through the certified split equivalences. No exhaustive 40320-permutation tactic is used.
3. `finset_image_perm_trans` and `perm_image_fibre_card_eq_stabilizer` exhibit composition transport between the fibre of permutations carrying a prescribed four-set to a target and that target's image stabilizer.
4. `indexedQuartetBlockStabilizer_card` and `indexedQuartetImageStabilizer_card` generalize 576 to all four canonical quartets, giving `arbitraryFourset_to_anyQuartet_fibre_card`: for each four-set S and index i, exactly 576 permutations carry S onto Qᵢ.
5. `canonicalCapF3_perm_singleton_event_card` is the actual singleton-event target: a dependent-sum map sends each pair (target index i, image-fibre permutation) into the zero-sum event. Its injectivity uses `quartet_injective`; surjectivity uses the certified cap-incidence equivalence. The intended event cardinal is **4×576=2304**, hence probability 2304/40320=2/35.

## Strict status boundary

The S015 modifications above are **SOURCE_FORMALIZED proof candidates until an exact-source hosted kernel pass is verified**. Early commits `aff5e357` and `ad7e38d` failed on Lean tactic elaboration, specifically a dependent `decide` congruence and a redundant rewrite after a case split. These were repaired in later commits. An independent finite enumeration already corroborates the 2304 count in the pre-existing S011 checker, but that finite result does not substitute for the universal Lean proof.

## Still outstanding

- Exact 128-permutation event for a two-overlap pair, and 128 for a compatible unordered triple; exact 2304 for complementary pairs; zero for inadmissible intersections.
- True unordered GraphMIS pair/triple event aggregation; first, second, third factorial moments; single four-term distribution theorem and uniquely sharp named-spider equality.
- Conditional transfer to arbitrary admissible caps still requires an **explicit supplied** classical normal-form hypothesis. Literary novelty, Palomar registration, arXiv and journal submission remain unresolved/unperformed.

The next session must first repair any CI failure at the final S015 source before advancing to 128 and true moments.