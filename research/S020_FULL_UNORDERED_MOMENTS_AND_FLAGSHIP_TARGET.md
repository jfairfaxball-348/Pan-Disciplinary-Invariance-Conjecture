# PDIC S020 — close the honest unordered M₂/M₃ numerators and complete the flagship law

**Automatically installed at S019 closeout; not executed.** The next owner's “run next session” authorises S020. Follow `AGENTS.md`; automatically install S021 with the closeout, but do not execute it. Work on the canonical Lean proof branch `session/s007-full-lean-flagship` and unmerged draft PR #4. No Palomar preparation, PR merge, arXiv or journal submission without separate owner approval.

## Preflight and evidence discipline

Read `research/NEXT_SESSION_PROMPT.md`, `sessions/S019_CLOSEOUT.md`, `research/S019_PAIR_SUBFAMILY_BRIDGE.md`, `sessions/S018_CLOSEOUT.md`, `research/S018_UNORDERED_MOMENT_EXTENSION.md`, `research/FLAGSHIP_THEOREM.md`, and `paper/PDIC_S003R8_DRAFT.tex`. Check exact-commit hosted Lean and finite results for the last S019 source head; a source candidate is not certified until the pinned full Lean workflow succeeds with printed standard axioms only. Repair any failed S019 candidates before advancing.

Already kernel certified in S018: `graphMIS_unordered_moment_double_count G k` over honest `powersetCard k` subfamilies, `graphMIS_first_moment_eq`, unique disjoint-four partner, cap-zero `N₀≤3`, connected `h≤3` and `h=3 ↔ G ≃g namedSpider`, and 2304/128 prescribed-source event fibres. S019 added exact four-subset pair event classification (2304 for intersection 0; 128 for intersection 2; 0 otherwise) and an honest two-MIS-subfamily representation candidate. **Use these source declarations after strict certification**; do not duplicate their geometry or silently assume they passed.

## Nonnegotiable target

For any connected eight-vertex simple graph, set `F = fourGraphMISFamily G`, `N₀(e,G) = labellingZeroMISCount G e` over the genuine uniformly sampled 40320 permutations. Define `n₀` and `n₂` as cardinalities of *unordered* two-element subfamilies `T∈F.powersetCard 2` classified by source intersection 0 and 2, and `h` as the previously kernel-proved genuine `unorderedCompatibleTripleCount G`. Prove the actual Nat equations, not paper abbreviations:

```
∑ e, Nat.choose (N₀(e,G)) 2 = 2304*n₀ + 128*n₂
∑ e, Nat.choose (N₀(e,G)) 3 = 128*h
```

Prove their `ℚ` normalisations
`M₂ = 2*n₀/35 + n₂/315`, `M₃=h/315`, and **all four exact probabilities**
`(P₀,P₁,P₂,P₃) =
 (1-M₁+M₂-M₃, M₁-2*M₂+3*M₃, M₂-3*M₃, M₃)`;
then `P₃≤1/105`, equality iff `Nonempty (G ≃g namedSpider)` for connected graphs. This complete flagship is the gate; don't reinterpret the moment identities alone as completion.

## Proof attack

1. Use S019's two-element unordered `powersetCard` representation to define invariant overlap classes `PairOverlapZero T` and `PairOverlapTwo T`; prove classification is independent of the chosen ordering, classes are disjoint, and each actual `T` contributes exactly `2304`, `128` or zero. Sum these values over the real filtered family and use `Finset.sum_ite`/filtered cardinalities to obtain exact M₂ numerator. Avoid multiplicity 2.
2. For each true three-element `T∈F.powersetCard 3`, use `Finset.card_eq_three` to obtain three distinct actual graph MIS and the already verified S014 cap-zero triple disjoint-pair theorem. Use S018 partner uniqueness to show any nonempty triple zero event has **exactly one** complementary pair; the remaining pair overlaps are 2. Show equivalence between nonempty triple events and `IsUnorderedCompatibleTriple G T`. The fibre is 128 by S017; otherwise it is 0. Sum to `128 * unorderedCompatibleTripleCount G` without ordering the triple or six-fold overcount.
3. Cast exact Nat sums into `ℚ` with `norm_num`, `exact_mod_cast`, `ring`, and the certified `uniformLabellings_card`. Use connected `N₀≤3` to invert the three factorial moments into actual cardinalities `#\{e : N₀(e,G)=i\}`, `i∈\{0,1,2,3\}`. Prove the four rational probability identities, not just algebraic binomial inversion for symbolic moments.
4. Apply `connected_h_three_iff_namedSpider` to the proved real `P₃=h/315`. Handle `h≤3` and the rational equality carefully. The fixed canonical cap law is unconditional; arbitrary caps are covered only under the supplied `ClassicalCapNormalForm` hypothesis, never by invented axioms.
5. Independently test the actual 40320 permutations for `namedSpider` and `P8` against the resulting P-vector. Check counts `(m,n₀,n₂,h)=(9,1,15,3)` for spider and `(5,1,3,1)` for P8. Audit all source-class and set-inclusion directions. Novelty/priority remains unresolved.

## Strict completion and handoff

Use pinned Lean 4/Mathlib `lake build`, hole scan rejecting `sorry`, `admit`, `native_decide`, unapproved `axiom`/`constant`, and `#print axioms` for each new theorem; all printed axioms must be limited to `propext`, `Classical.choice`, `Quot.sound`. Require exact-source GitHub hosted Lean and ten-checker finite PASS. If the entire flagship cannot be certified, close the largest substantive Lean theorem actually proved (preferably the complete M₂ numerator), identify the precise next incidence equivalence, and **install a full executable S021** attacking the remaining theorem. Update `sessions/S020_CLOSEOUT.md`, proof notes, `research/CLAIMS.md`, `README.md`, `ROADMAP.md`, `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md`. Keep statuses exact, do not claim a source candidate is kernel verified without a successful strict hosted run.