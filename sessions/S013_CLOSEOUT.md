# PDIC S013 closeout — genuine N₀≤3 Lean kernel certificate

**Executed: 16 October 2026.** Canonical proof branch `session/s007-full-lean-flagship` (open draft PR #4). **S014 installed automatically, NOT EXECUTED.**

## Strict exact-source result

**LEAN_KERNEL_VERIFIED**, proof commit [`2a808e53cb7a763b54c53c4f06d12f7f64d3b113`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/2a808e53cb7a763b54c53c4f06d12f7f64d3b113), hosted [Lean kernel run 38945169850 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169850) (job `117122352499`) and [finite run 38945169844 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169844). The hosted `lake build`, source proof-hole rejection and all nine independent checkers, including the 40320-labelling S011 checker, succeeded. `#print axioms` for each new public declaration contains only `propext, Classical.choice, Quot.sound`.

Four new declarations:

- `pulledQuartet_eq_image`: `Finset.map` versus `Finset.image` of the true inverse permutation.
- `perm_finset_image_roundtrip`: genuine finite-subset transport by `e` and `e⁻¹`.
- `canonicalCapF3_perm_four_zero_iff_pulled`: every zero-sum labelled size-four set is **exactly** a pulled-back canonical quartet, and conversely.
- **`connected_labellingZeroMISCount_le_three`**: for any connected `G : SimpleGraph (Fin 8)` and every `e : Equiv.Perm (Fin 8)`, the **actual** count of size-four `GraphMIS G` with canonical typed F₃³ label-sum zero obeys `N₀(e,G)≤3`.

This is the first fully kernel-verified bound on the true manuscript random variable, not the earlier graph-only `h(G)≤3` statement. The proof shows the actual zero-sum MIS family is a *strict subset* of the image of four pulled-back cap quartets: connectedness forbids all four from being independent, using the certified uniqueness of independent complementary bipartitions. Four total image indices give at most three qualifying sets.

An initial candidate [`ad3ba23`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ad3ba23be66297da5bc28bc1a512e65bd99a12e0) failed Lean elaboration (two small issues: equality of map/image memberships, and extraction of the independence component of `GraphMIS`). Both were repaired; only the corrected exact head is certified.

S012 was also **retroactively verified from newly retrieved evidence** at [`4c687288`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002): hosted [Lean 38938608949 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938608949) and [finite 38938609119 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938609119). S012 closeout was correct *at the time* to withhold verification; evidence is now available.

## Event-fibre checks, not yet Lean probability theorems

Independent exhaustive enumeration of all 40320 permutations found singleton, complementary-pair, two-overlap-pair and compatible-triple favourable counts respectively `2304, 2304, 128, 128`. Their 4!·4!=576 and (2!)⁴=16 regular-fibre decompositions are proved as written combinatorial arguments and documented in [S013 proof note](../research/S013_ACTUAL_N0_AND_EVENT_FIBRES.md), **not yet formalised as general Lean fibre cardinalities**. Spider (N₀=0,1,2,3,4) histogram is `23424,13440,3072,384,0`; path `P8` histogram is `31360,6528,2304,128,0`.

## Remaining hard mathematical gate

**OPEN_IN_LEAN:** a 4-index-to-actual-MIS cardinal bijection (current Lean proof uses a sufficient strict-subset bound), universal 2304/128 event fibres, unordered event overlap classification, graph-derived first/second/third factorial moments and one complete four-term probability distribution theorem. The eventual spider equality can reuse strictly certified `connected_h_three_iff_namedSpider` from S010. Arbitrary-cap classification remains an external **explicit hypothesis**, not a kernel theorem or new axiom.

**No** full flagship Lean certification, no Palomar registration, no PR merge, no arXiv/journal submission or external correspondence. Prior-art priority remains unresolved.

## Automatic handoff

[S014 executable target](../research/NEXT_SESSION_PROMPT.md) has been installed and copied to [historical target](../research/S014_TRUE_FIBRES_AND_MOMENTS_TARGET.md). It must attack 576/16-permutation regular fibres, exact 2304/128 events, genuine moments and the full theorem; it is **NOT EXECUTED**. The next user "run next session" executes S014 directly.
