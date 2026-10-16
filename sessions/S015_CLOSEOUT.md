# PDIC S015 closeout — genuine cap-zero singleton permutation fibre

**Executed 16 October 2026** on canonical proof branch `session/s007-full-lean-flagship` (draft PR #4). S016 prompt installed automatically and **NOT EXECUTED**.

## Mathematical work in this session

S015 added genuine permutation-image and event-count candidate source, not a detached abstract probability package:

- `canonicalTwoQuartetColour_comp_iff_images_fixed` relates the real `Q₀,Q₁` image equalities to the two-bit colour stabilizer; `canonicalTwoQuartetImageStabilizer_card` states the corresponding actual 16-image stabilizer.
- `exists_perm_fourset_image` constructs actual permutations between any two four-sets of `Fin 8`; the proof uses the existing split-side equivalences, not a 40320-case enumeration.
- `finset_image_perm_trans` and `perm_image_fibre_card_eq_stabilizer` transport fixed-image fibres to a stabilizer by composition.
- `indexedQuartetBlockStabilizer_card`, `indexedQuartetImageStabilizer_card` and `arbitraryFourset_to_anyQuartet_fibre_card` target the **576-permutation actual fibre for every canonical quartet and every prescribed source four-set**.
- `canonicalCapF3_perm_singleton_event_card` targets **2304** actual zero-sum labellings for any fixed four-set, using a bijection from a dependent sum of four distinct 576-sized quartet-image fibres. It is the correct kind of source needed for the genuine first factorial moment.

The source above is in `PDIC.lean`; detailed proof explanation: [S015 singleton event note](../research/S015_SINGLETON_EVENT_PROOF.md).

## Exact proof and CI honesty

S014 is still the last **confirmed** completed Lean-certificate milestone: exact source `95ef8f4886868f66edfbde90b34cc9e12fe6b463`, [strict Lean PASS 38949894336](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894336), [finite PASS 38949894242](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894242).

S015 early strict builds of `aff5e357`, `ad7e38d`, `521d8b9`, `5883e88` and `b01f652` failed on Lean elaboration (initial Bool-decide congruence and redundant rewrite in split-transport proof); these errors were repaired in later source `8b099a25a60f95e5dbc4c3be218edbb637e64581`. **At this closeout snapshot, that exact source and subsequent document-only commits had not yet yielded a confirmed successful strict kernel run.** The new S015 mathematical theorems therefore remain **SOURCE_FORMALIZED / CI_UNVERIFIED**, not claimed as LEAN_KERNEL_VERIFIED. The independent finite workflow at `8b099a25` succeeded (run 38959268063); it is not a substitute for the Lean kernel workflow 38959268002. If the latter finishes PASS, record that as a separate exact-source verified update; if FAIL, repair before promotion.

No full flagship probability law is claimed. The prior S013 `N₀≤3` and S010 spider iff certificates remain valid and unaffected.

## Remaining obligations

The genuine **128** overlap-two pair/triple events, **2304** complementary pair event, graph-derived unordered factorial moments and the single four-term probability theorem with equality iff spider all remain **OPEN_IN_LEAN**. General admissible cap normal form remains an explicitly supplied classical premise. Novelty/priority is unresolved; no Palomar, arXiv, journal submission or PR merge was conducted.

## Automatic next-session target

[S016 executable prompt](../research/NEXT_SESSION_PROMPT.md), also preserved as [S016 fixed target](../research/S016_PAIR_FIBRES_AND_MOMENTS_TARGET.md), is **installed, not executed**. First verify/repair S015, then prove the genuine 128-pair/triple fibre and moments. Continue proof-first, no administrative detour.
