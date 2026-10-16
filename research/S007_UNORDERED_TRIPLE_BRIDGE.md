# PDIC S007 — unordered connected graph triple bridge: exact proof scope

**Executed 16 October 2026. Strict Lean PASS.** Exact proof commit: [`d05fe1e71d054fe74a52a664112b6de436e999da`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/d05fe1e71d054fe74a52a664112b6de436e999da) on `session/s007-full-lean-flagship`. Hosted [Lean and all six finite checkers 38912238607 — SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38912238607). [Draft PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4) is unmerged.

## Strictly checked declarations added to PDIC.lean

- `FourMISPartition`: actual complementary four-vertex maximal independent sets, not maximum independent sets.
- `fourMISPartition_unique_up_to_swap`: combines S003R9's proper Boolean-colouring theorem with actual MIS semantics for connected G.
- `IsUnorderedCompatibleTriple`, `unorderedCompatibleTripleCount`: genuine three-member Finset, each member a four-MIS; one complementary pair and a third with 2+2 overlap. No ordered triple overcounting.
- `unorderedTriple_has_partition`: real triple implies complementary four-MIS pair.
- `unorderedCompatibleTripleCount_zero_of_no_partition`: exact zero case when no pair exists.
- `IsAnchoredMixedThird`, `anchoredMixedThirdCount`: anchored third-set candidate separated from true unordered triple count.
- `anchoredMixedThirdCount_swap`, `anchoredMixedThirdCount_partition_independent`: the anchored count is well-defined independently of a chosen side of a connected graph.
- `unorderedTriple_has_anchored_third`: any true compatible unordered triple contains a 2+2 third relative to any fixed balanced partition.

Every theorem above is checked on the quoted source SHA; `#print axioms` for each named proof and the exact pinned CI workflow rejected unapproved axioms/holes. S007's initial commit `aefba9120c0816c1b634b5f3e4121b42fec9e931` also passed [run 38912031056](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38912031056), but d05fe1e is the exact latest certificate.

## What is NOT proved, and why

This is a **one-way** triple-to-third witness step, plus an anchored count invariant. The converse construction and **cardinality bijection** `unorderedCompatibleTripleCount G = anchoredMixedThirdCount G s` are not yet kernel-verified. Without them, no `h(G)=graphMixedCount A` may be asserted. Nor has arbitrary connected G been transported to a four-by-four `matrixGraph`, and `h(G)≤3` and named spider iff are **OPEN_IN_LEAN**, despite being written in the paper.

The original matrix extremum remains strictly verified at S003R9, but is **not automatically applicable** to the newly defined genuine arbitrary-graph h. The canonical cap / 8! labelling probability law is also OPEN_IN_LEAN; the classical nine-cap classification remains an acknowledged external input. Prior-art priority stays unresolved, and no Palomar/publication action occurred.

## Independent small-graph hostility checks (not Lean certificates)

Directly enumerating genuine size-four maximal independent sets and unordered triples on labelled eight-vertex examples gave: S(2,2,2,1): m=9,h=3; P8: m=5,h=1; split tree 01,02,14,16,23,45,67: m=6,h=1; K1,7: m=0,h=0; C8: m=2,h=0. The 2+2 anchored count agrees with the genuine h count where a complementary partition exists. These tests support the bijection target; they do **not** certify it for all connected graphs.

## Next proof step

The automatically installed [S008 target](S008_FULL_H_COUNT_MATRIX_TRANSFER_TARGET.md) attacks the missing two-way cardinality bijection, genuine graph isomorphism to 4×4 matrixGraph and universal h≤3. Proof source branch: `session/s008-full-h-bridge`, seeded directly from d05fe1e.
