# PDIC S021 — strict M₂ recovery and real unordered M₃ proof

**S021 FINAL P₃ STRICT CERTIFICATE (17 October 2026):** Source [`1339127d293b0c865c7c98d64f3b81a283909c8b`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1339127d293b0c865c7c98d64f3b81a283909c8b) has [exact-source Lean kernel PASS 39013646695](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013646695) and [finite PASS 39013646709](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013646709). Kernel-verified `graphMIS_exact_probability G i` is the **actual** cardinal of `{e : Perm Vertex | N₀(e,G)=i}` divided by 40320. For connected G, `P₃=h/315≤1/105`, equality **iff `Nonempty (G ≃g namedSpider)`**. All three new public declarations print only `propext`, `Classical.choice`, `Quot.sound`; strict scan and all finite scripts **including S020 unordered witness checker** pass. This **supersedes the CI-PENDING P₃ notes from earlier S021 snapshots**. S022 remains necessary for the actual P₀/P₁/P₂ laws; full flagship is **not** kernel certified.

**Executed:** 17 October 2026. **Canonical source:** `session/s007-full-lean-flagship`, unmerged draft PR #4. Do not substitute main's historic `PDIC.lean`.

## Certified repair — true second moment

S020's source `afc1ecd80909d32a7e5cabf18df0044ccae9e696` did **not** compile: GitHub Actions [39011764364](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39011764364) failed, reporting missing `DecidablePred` at `graphMIS_pairOverlapCount`, a mis-scoped two-`if` sum and `sorryAx` in the uncompiled candidate. S021 repaired the local classical instance and inserted parentheses around the summand. Strict verification **SUCCESS** at exact SHA [`3a3db44e088eaae07338dc033091fd4c0241c4f2`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3a3db44e088eaae07338dc033091fd4c0241c4f2), [Lean run 39012753312](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39012753312), [finite run 39012753220](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39012753220). The second binomial moment is genuinely `2304*n₀+128*n₂` / 40320, so `M₂=2n₀/35+n₂/315`; the compatible unordered triple fibre has exactly 128 labellings. This supersedes the older S020 CI-unverified status.

## Certified genuine unordered M₃

Source [`810a13cc994aaec0c56a5872be6f6e4d87622b49`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/810a13cc994aaec0c56a5872be6f6e4d87622b49) passed [strict Lean 39013338273](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013338273) and [independent finite 39013338290](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013338290). Its new declarations:

- `canonicalCapF3_perm_third_overlap_two`: in a simultaneous zero triple with a complementary pair, the third distinct size-four set overlaps both sides in two vertices. It uses existing pair-overlap cases and the unique disjoint-four partner, not an extra assumption.
- `graphMIS_unordered_triple_compatible_of_event`: **any** real `T ∈ (fourGraphMISFamily G).powersetCard 3` with at least one common zero labelling satisfies `IsUnorderedCompatibleTriple G T`. This is the previously missing converse incidence.
- `graphMIS_unordered_triple_event_card_zero`: every incompatible real T has no zero-sum labellings. The S020 compatible fibre is exactly 128.
- `graphMIS_third_moment_numerator`: **true unordered** graph-MIS third-moment numerator `∑e Nat.choose (N₀ e) 3 = 128 * unorderedCompatibleTripleCount G`, not an ordered tuple multiplied by six.
- `graphMIS_third_moment_eq`: true rational `M₃=h/315`.

Only standard `propext`, `Classical.choice`, and `Quot.sound` appeared in the new `#print axioms`; strict workflow success includes pinned `lake build`, proof-hole rejection, finite checks. The workflow was amended on the proof branch to execute `scripts/verify_s020_unordered_moments.py` as well, across the actual 40320 labellings for both the named spider and P8. At `810a13cc` the independent finite workflow is PASS; the strict workflow was rerun after the checker inclusion.

## The real P₃ bridge

Candidate at [`1339127d293b0c865c7c98d64f3b81a283909c8b`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/1339127d293b0c865c7c98d64f3b81a283909c8b) defines `graphMIS_exact_probability G i` as **an actual event cardinal divided by `Fintype.card (Equiv.Perm Vertex)`**; for connected G uses `N₀ ≤ 3` to identify `choose(N₀,3)` with `[N₀=3]`, proves `P₃=h/315`, and composes with the already certified `h≤3` and `h=3 ↔ Nonempty (G ≃g namedSpider)` to propose sharp `P₃≤1/105` iff spider. This candidate requires its **own exact-source strict CI** before being called kernel verified. [Lean run 39013646695](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013646695) was started; [finite run 39013646709](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013646709) passed.

## Independent numerical witness

All actual labellings of the named spider give `(m,n₀,n₂,h)=(9,1,15,3)`, histogram `(23424,13440,3072,384)`, `∑ choose(N₀,2)=4224`, `∑ choose(N₀,3)=384`. For P8: `(5,1,3,1)`, histogram `(31360,6528,2304,128)`, second numerator `2688`, third `128`. This is FINITE_CHECKED corroboration, not a universal proof. The exact 40320 source permutation model and genuine maximality checks are used.

## Remaining first-paper obligations

The complete P0/P1/P2/P3 law over actual event-cardinality definitions, not merely abstract moments, remains to be assembled in Lean. The mathematical written law exists and `four_point_moment_inversion` is already kernel-verified as an abstract rational identity; a uniform sum over connected N₀∈{0,1,2,3} must transfer true event histograms to M₁/M₂/M₃. Check the exact-source P₃ CI before promoting its status. The arbitrary-cap normal form requires **the explicit classical hypothesis** and is not a fresh axiom. Novelty/priority remains unresolved. Do not merge PR #4, register on Palomar, submit or correspond externally without owner approval.
