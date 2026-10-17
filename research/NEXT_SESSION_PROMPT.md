# PDIC S021 — strict-certify S020 M₂; close the genuine unordered M₃ and complete the flagship

**Automatically installed at the S020 closeout (17 October 2026). NOT EXECUTED.** The owner's next “run next session” authorises S021 immediately. Follow AGENTS.md. Work on the canonical Lean proof branch `session/s007-full-lean-flagship` and draft PR #4, **not** main's historic `PDIC.lean`. At closeout automatically install a full executable S022 without executing it. Do not merge PRs, register on Palomar, submit to arXiv/journal or contact anyone without explicit owner approval.

## Mandatory preflight

Read `AGENTS.md`, `research/NEXT_SESSION_PROMPT.md`, `sessions/S020_CLOSEOUT.md`, `research/S020_UNORDERED_MOMENT_PROOF_ATTEMPT.md`, `research/S019_PAIR_SUBFAMILY_BRIDGE.md`, `research/S018_UNORDERED_MOMENT_EXTENSION.md`, `research/FLAGSHIP_THEOREM.md`, `paper/PDIC_S003R8_DRAFT.tex`, `research/CLAIMS.md`, `ROADMAP.md`, `authoritative/STATE.json`, and the **current canonical proof branch source**.

The **last confirmed exact-source strict Lean certificate** in the record is S019 `e981acac25b8106e4b4df782340217ed948445bb`, with strict Lean run 38978027666 SUCCESS and independent ten-checker run 38978027657 SUCCESS. S020 added Lean candidates at `6a8ddd69b636ce523f7aa0c599e59c0fe07b7186` and `cba4eedef0033ec828c66593f8cf35aba3d45fa1`, with finite script at `afc1ecd80909d32a7e5cabf18df0044ccae9e696`. **These S020 Lean declarations are SOURCE_FORMALIZED/CI_UNVERIFIED; no exact-source Lean run has been established.**

## Priority zero — establish exact-source strict Lean

Obtain an actual hosted GitHub Actions run on the **current proof branch SHA**. If needed use the repository's existing supported workflow trigger or workflow_dispatch, not a status guess. Confirm:
- pinned toolchain/Mathlib full `lake build`,
- scanner rejecting proof holes (`sorry`, `admit`, `native_decide`, unapproved axiom/constant),
- `#print axioms` for **each** new public S020 declaration showing only `propext`, `Classical.choice`, `Quot.sound`,
- existing ten independent finite checkers, plus the new `scripts/verify_s020_unordered_moments.py`.

Immediately repair compiler or scanner failures; keep exact SHA/run links. **Do not label S020 M₂ kernel-verified unless this passes.** For source repairs, examine the final `simp [F, graphMIS_pairOverlapCount, Finset.sum_add_distrib, Finset.sum_ite, mul_comm]`, the unordered-pair orientation lemma and the `Finset.eq_of_subset_of_card_le` use in the compatible-triple bridge.

## Primary mathematics — finish the honest M₃ numerator

Let `F = fourGraphMISFamily G`; `N₀(e,G) = labellingZeroMISCount G e`; `h = unorderedCompatibleTripleCount G`.

Prove for **every** true `T ∈ F.powersetCard 3`:
1. If its simultaneous zero-permutation event is inhabited, use its genuine three distinct four-MIS, S014's `canonicalCapF3_perm_three_zero_has_disjoint_pair`, and S018 `disjoint_four_partner_unique` to extract **one and only one** complementary pair.
2. For the third distinct four-MIS, use S019's `canonicalCapF3_perm_distinct_pair_overlap_cases`. Overlap zero would make it the unique complementary partner and contradict distinctness. Therefore it overlaps the first side in two vertices, and hence also the other side in two, because the pair partitions all eight vertices.
3. Convert exactly to `IsUnorderedCompatibleTriple G T` with the existing definition; do not silently order or count the triple six times.
4. Conversely, use the S020 candidate `graphMIS_unordered_compatible_triple_event_card` (after strict certification) to show a compatible T has exactly **128** real labelling events. An incompatible T has **zero**.
5. Sum these true unordered k=3 event fibres with the S018 kernel-proved `graphMIS_unordered_moment_double_count G 3`, bridge the filter cardinal to existing `unorderedCompatibleTripleCount G`, and prove the genuine Nat equation

```lean
(∑ e : Equiv.Perm Vertex,
   Nat.choose (labellingZeroMISCount G e) 3) =
 128 * unorderedCompatibleTripleCount G
```

Do not substitute an ordered-triple or labelled-quartet-index count.

## Full flagship, not another narrow stopping point

Once strict M₂ and M₃ are certified, obtain the rational `M₂=2n₀/35+n₂/315`, `M₃=h/315` over the actual 40320 labellings. Reuse kernel-certified `M₁=2m/35`, actual connected `N₀≤3`, and the fact that all 40320 labellings are accounted for. Establish the four *actual event probability* identities

```
P0 = 1 - M1 + M2 - M3
P1 = M1 - 2*M2 + 3*M3
P2 = M2 - 3*M3
P3 = M3
```

with `Pi` an explicit normalized cardinal of `{e | N₀(e,G)=i}`, **not merely algebraic dummy variables**. Then prove for every connected `G` the actual sharp statement `P3≤1/105`, with equality iff `Nonempty (G ≃g namedSpider)`, invoking the already strictly certified `h≤3` and `h=3 ↔ namedSpider` statements. Arbitrary-cap normal form must remain **conditional on the explicitly supplied classical hypothesis**, never a fresh axiom.

## Independent checks and closeout

Re-run/host the real 40320-label-permutation enumeration for the spider and P8. Verify `(m,n₀,n₂,h)=(9,1,15,3)` and `(5,1,3,1)`, actual histograms `(23424,13440,3072,384)` and `(31360,6528,2304,128)`, M₂ numerators 4224 and 2688, and M₃ numerators 384 and 128. Audit the true graph MIS criteria and unordered class membership.

Aim for the **complete** law this session. If not strictly certified, close the largest substantive verified increment rather than claiming the flagship, identify the precise unproved Lean obligation, and **install a full executable S022** targeting the remainder. Write/update `sessions/S021_CLOSEOUT.md`, a substantive proof note, `research/CLAIMS.md`, `README.md`, `ROADMAP.md`, `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md` with exact SHA/run evidence. Novelty/priority remains unresolved, and external registrations/submissions remain paused.
