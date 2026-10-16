# PDIC S018 closeout — genuine graph first moment, rational M₁, finite spider distribution

**Executed:** 16 October 2026. **Canonical proof branch:** `session/s007-full-lean-flagship`; **draft PR #4 remains open and unmerged**. This session completed a substantive portion of the installed S018 objective, not the full first-paper theorem. **S019 installed automatically, NOT executed.**

## Exact new Lean mathematics

Working on the existing strict-certified S017 128-event/2304-event foundation, S018 added to `PDIC.lean`:

1. `fourGraphMISFamily`: the **actual** `Finset (Finset (Fin 8))` of four-vertex maximal independent sets of any `SimpleGraph (Fin 8)`, using the existing `GraphMIS` criterion, not a surrogate matrix witness or a quartet-index count.
2. `labellingZeroMISCount_eq_family_filter`: the genuine zero-sum four-MIS random variable equals the zero-cap-sum filter of that family, under each actual `Equiv.Perm (Fin 8)`.
3. `graphMIS_first_moment_numerator`:
   ```lean
   (∑ e : Equiv.Perm Vertex, labellingZeroMISCount G e) =
     2304 * (fourGraphMISFamily G).card
   ```
   for **every** graph G on eight vertices, by exchanging the finite sums over **real** graph MIS and all 40320 cap label permutations, applying the already certified 2304 singleton event fibre to each graph MIS.
4. `graphMIS_first_moment` and `graphMIS_first_moment_eq`, proving the **exact rational** graph-derived first factorial moment
   \[
      M_1=\mathbb E[N_0]=\frac{2304}{40320}m=\frac{2m}{35}.
   \]
5. `disjoint_four_partner_unique` and `three_distinct_four_sets_no_two_disjoint_pairs`: any eight-vertex four-set has a unique disjoint four-set partner; three pairwise distinct four-sets cannot exhibit two complementary pairs sharing a member. This supplies a genuine unordered-incidence prerequisite, without claiming the complete triple moment.

## Strict proof evidence — exact source SHAs

- First actual graph family and summed numerator: [source `31a7cbb3de72944b5cb99994132060795cd7184f`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/31a7cbb3de72944b5cb99994132060795cd7184f), [strict Lean **PASS** 38970442172](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38970442172), [independent finite **PASS** 38970442337](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38970442337). New `#print axioms` declarations show only `propext`, `Classical.choice`, `Quot.sound`.
- Exact rational moment and disjoint partner incidence: [source `fe5d119af9a270a82fb7a854b9c004d5a4e041c6`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/fe5d119af9a270a82fb7a854b9c004d5a4e041c6), [strict Lean **PASS** 38970965466](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38970965466), [independent finite **PASS** 38970965502](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38970965502); three `#print axioms` declarations again show only `propext`, `Classical.choice`, `Quot.sound`.
- Final proof-branch head [`26a5f3b6c953872a459a457d593fb6cef620954c`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/26a5f3b6c953872a459a457d593fb6cef620954c): [strict Lean **PASS** 38971146819](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38971146819), [independent finite **PASS** 38971147020](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38971147020). The Lean workflow carries the pinned `lake build`, forbidden-proof-hole scanner, printed-axiom inspection, and all **ten** independent Python checkers, including the new S018 named-spider audit. No `sorry`, `admit`, `native_decide` or unapproved axioms added.

## Independent 40320-labelling spider audit — FINITE_CHECKED, not universal theorem

Added `scripts/verify_s018_spider_distribution.py` on the proof branch and both CI workflows. For the exact `namedSpider` edges 04,05,06,07,16,25,34, and canonical quartet cap-zero family, it enumerates all 40320 label permutations and independently computes:

| Statistic | Result |
| --- | --- |
| `m` genuine size-four graph MIS | 9 |
| `n₀` unordered disjoint pairs | 1 |
| `n₂` unordered overlap-two pairs | 15 |
| `h` compatible unordered triples | 3 |
| `N₀=0,1,2,3` permutation frequencies | 23424, 13440, 3072, 384 |
| Probabilities `P₀,P₁,P₂,P₃` | 61/105, 1/3, 8/105, 1/105 |

The script independently verifies the moment prediction in this single graph and the sharp case `P₃=1/105`. **Do not promote this enumeration to the universal four-term Lean theorem.**

## Exact remaining obstruction — S019 target

The existing verified S016/S017 event counts imply the manuscript's written formulas, but the **genuine unordered graph-MIS second and third factorial-moment double counting** is not yet fully formalised as a single Lean theorem. Construct true unordered two-/three-element subfamilies using `Finset.powersetCard` or equivalent; count simultaneous cap-zero events over these real graph-MIS families; use distinct-pair overlap 0/2 classification, universal 2304/128 source pair fibres and 128 compatible-triple fibres, and the unique disjoint-four partner result to prove

\[
\sum_{e\in S_8}\binom{N_0(e,G)}2=2304n_0+128n_2,\qquad
\sum_{e\in S_8}\binom{N_0(e,G)}3=128h.
\]

These would establish `M₂=2n₀/35+n₂/315` and `M₃=h/315`, and then via already kernel-certified connected `N₀≤3` and `h≤3, h=3 ↔ namedSpider` yield **all four** P-values and equality iff graph isomorphism to `S(2,2,2,1)`. **These end-to-end M₂/M₃/four-probability claims remain OPEN_IN_LEAN.** The arbitrary-admissible-cap normal-form input remains an explicit classical hypothesis, not an axiom or claimed formalisation; literature novelty/priority remains unresolved.

## Session governance and next prompt

Main's `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `research/S018_GRAPH_MOMENT_ASSEMBLY.md`, `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md` record this boundary. The executable [S019 prompt](../research/S019_UNORDERED_PAIR_TRIPLE_MOMENTS_TARGET.md) is **installed** to attack the remaining genuine unordered moments, the full four-term law and spider iff, not executed. Following owner process, generate/install S020 only when S019 is actually run. No PR merge, Palomar public registration, arXiv or journal submission took place.


## S018 continuation — additional kernel-certified unordered moment interface

S018 extension: **STRICT LEAN KERNEL PASS** at [6eb67aa8cb](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/6eb67aa8cb7ae08151fe3074166b7a206f844cd7), [Lean 38976368670](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38976368670), [finite 38976368661](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38976368661); full pinned `lake build`, 10 independent checkers and proof-hole scan PASS. `#print axioms` for `zeroFourGraphMISFamily_card`, `zeroGraphMIS_subfamily_card_choose`, `zeroGraphMIS_subfamilies_eq_filter`, `graphMIS_unordered_moment_double_count` prints only `propext`, `Classical.choice`, `Quot.sound`.

The new Lean declarations define the honest surviving family of graph maximal-independent four-sets, prove its cardinal equals the real `labellingZeroMISCount`, identify its unordered `k`-subfamily count with `Nat.choose N₀ k`, prove an exact `powersetCard`-filter equality, and exchange the actual permutation/family sums. The fully verified public theorem is:

```lean
theorem graphMIS_unordered_moment_double_count (G : SimpleGraph Vertex) (k : ℕ) :
    (∑ e : Equiv.Perm Vertex, Nat.choose (labellingZeroMISCount G e) k) =
    ∑ T ∈ (fourGraphMISFamily G).powersetCard k,
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ s ∈ T,
          capSum (fun v => canonicalCapF3 (e v)) s = 0)).card
```

This is **for every k and every eight-vertex graph**, not a symbolic moment stand-in, nor an ordered pair/triple overcount. It closes the *general incidence double-counting* bridge; the remaining work is the **value** of the event fibre attached to each honest unordered pair/triple, and its aggregation to `n₀,n₂,h`. Therefore universal numerical M₂, M₃, all four P-values and spider iff remain OPEN_IN_LEAN. Independently enumerated P8's 40320 label permutations: (m,n₀,n₂,h)=(5,1,3,1), frequencies (31360,6528,2304,128), probabilities (7/9,17/105,2/35,1/315); **FINITE_CHECKED_LOCALLY**, not a certified general theorem. Full argument: [extension proof note](../research/S018_UNORDERED_MOMENT_EXTENSION.md).

S019 remains installed, **NOT executed**; update it to invoke the verified `graphMIS_unordered_moment_double_count` instead of rebuilding the double count. No PR merge or public submission.
