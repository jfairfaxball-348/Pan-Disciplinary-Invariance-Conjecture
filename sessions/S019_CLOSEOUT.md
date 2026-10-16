# PDIC S019 closeout — unordered graph-MIS pair-fibre classification (partial flagship)

**Executed:** 16 October 2026. **Canonical proof branch:** session/s007-full-lean-flagship; unmerged draft PR #4. **S020 automatically installed, not executed.** No PR merge, Palomar registration or external submission.

## Substantive proof work

Continuing from S018's strictly certified all-k unordered incidence theorem, S019 appended four named Lean declarations:

1. `canonicalCapF3_perm_distinct_pair_event_zero_of_other_overlap`: two distinct size-four sources with overlap other than 0 or 2 cannot both have cap-zero labels.
2. `canonicalCapF3_perm_distinct_pair_event_card_by_overlap`: the genuine pair-fibre count is exactly 2304 for overlap 0, 128 for overlap 2, and 0 otherwise, by combining previous certified source-event theorems with the genuine overlap obstruction.
3. `canonicalCapF3_perm_distinct_triple_event_zero_of_no_disjoint`: three distinct four-sets without any disjoint pair cannot all have cap-zero labels.
4. `graphMIS_unordered_pair_family_event_card`: each **actual** two-member family in the powersetCard 2 of fourGraphMISFamily G is an unordered pair of distinct genuine graph MIS; its event count is precisely the classified 2304/128/0 with no extra factor of two.

Full proof explanation: [S019 note](../research/S019_PAIR_SUBFAMILY_BRIDGE.md).

## Verification evidence and boundaries

Proof-bearing source candidate: [e981acac25b8106e4b4df782340217ed948445bb](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e981acac25b8106e4b4df782340217ed948445bb). The independent finite workflow [38978027657](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027657) completed **SUCCESS**. The final strict hosted Lean workflow [38978027666](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027666) must be checked for final conclusion before promoting the new declarations beyond SOURCE_FORMALIZED.

An earlier source 932ea8ff successfully **compiled** its three new Lean theorems with printed axioms restricted to propext, Classical.choice and Quot.sound, but its overall workflow **FAILED** a text scanner because a comment contained the normal English word 'admit'. The comment was corrected at e981acac. Do not present that previous run as a strict PASS.

## Precise unfinished mathematical obligations

The full second factorial-moment numerator (2304*n0 + 128*n2), using true unordered overlap-class family counts, has **not** been proved by a single Lean theorem. The global third factorial-moment numerator (128*h) is likewise **OPEN_IN_LEAN**, requiring equivalence between actual three-member zero-event families and IsUnorderedCompatibleTriple G T, with a unique complementary pair and a 2+2 third member. Exact rational M2 and M3, all four **actual** probability identities, and the sharp spider equality iff are still OPEN_IN_LEAN; the full flagship is not formally complete.

Prior strict certificates remain intact: all-k graphMIS_unordered_moment_double_count, rational M1, genuine connected N0<=3, h<=3 and h=3 iff namedSpider graph isomorphism, and the 2304/128 prescribed source-event fibres. Finite named-spider and P8 histograms remain finite corroboration only. ClassicalCapNormalForm is a supplied classical hypothesis; novelty/priority unresolved.

## Automatic next-session handoff

The executable [S020 target](../research/S020_FULL_UNORDERED_MOMENTS_AND_FLAGSHIP_TARGET.md) is installed, not executed. Its priority is to **sum invariant unordered overlap classes** to close M2, then classify genuine unordered three-families to close M3, and finish the four-term probability law and spider sharpness. If S019 hosted strict certification fails, repair the exact proof candidate before pursuing S020. The owner can override the next target. S020 must install an executable S021 at closeout.