# PDIC S022 — certify real sharp P₃ and close all four actual event probabilities in Lean

**Automatically installed by S021 closeout on 17 October 2026. NOT EXECUTED.** The owner's next **“Run next session”** authorises S022 immediately. Follow [AGENTS.md](../AGENTS.md) and work on the existing canonical proof branch `session/s007-full-lean-flagship`, draft PR #4. **Never formalise against main's older PDIC.lean**. At closeout install a full executable S023, unexecuted. **No PR merge, Palomar registration, arXiv/journal submission or correspondence** without separate owner direction.

## Required preflight and strict CI

Read `AGENTS.md`, this prompt, `sessions/S021_CLOSEOUT.md`, `research/S021_TRUE_UNORDERED_M3_AND_SHARP_PROBABILITY.md`, `research/FLAGSHIP_THEOREM.md`, `paper/PDIC_S003R8_DRAFT.tex`, `research/CLAIMS.md`, `ROADMAP.md`, `authoritative/STATE.json`, and exact current proof branch `PDIC.lean`.

The certified incremental base includes first true moment `M₁=2m/35` (S018), genuine unordered pair numerator `2304n₀+128n₂`, rational `M₂=2n₀/35+n₂/315` ([strict Lean success 39012753312](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39012753312), SHA `3a3db44e088eaae07338dc033091fd4c0241c4f2`), and genuine unordered triple numerator `128h`, rational `M₃=h/315` ([strict Lean success 39013338273](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013338273), SHA `810a13cc994aaec0c56a5872be6f6e4d87622b49`). The exact source P₃ sharpness candidate was added at `1339127d293b0c865c7c98d64f3b81a283909c8b`; check [strict run 39013646695](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39013646695) and inspect compiler logs and its `#print axioms`. Do not assume success if pending/failure.

Obtain a fully successful hosted `lake build`, the proof-hole scanner (no `sorry`, `admit`, `native_decide` or new `axiom`/`constant`), `#print axioms` for every added public declaration with **only** `propext`, `Classical.choice`, `Quot.sound`, and all independent checkers **including** `scripts/verify_s020_unordered_moments.py`. Pin exact SHA and Actions run URLs.

## Primary completion target — four honest probability events

Use the already defined true event probability

```lean
graphMIS_exact_probability G i =
  (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = i)).card : ℚ) /
    (Fintype.card (Equiv.Perm Vertex) : ℚ)
```

for i=0,1,2,3. This **must not be replaced** by abstract variables satisfying invented moment equations. For every `G : SimpleGraph Vertex` with `hc : G.Connected`, the existing kernel-certified `connected_labellingZeroMISCount_le_three G hc e` forces `N₀(e,G)∈{0,1,2,3}` for every one of the actual 40320 permutations. Prove a reusable `Finset`-sum/filter histogram transfer for the following exact rational equalities (ideally a general four-support lemma, or separately by per-e cases 0/1/2/3):

```
P0 + P1 + P2 + P3 = 1
P1 + 2*P2 + 3*P3 = graphMIS_first_moment G
P2 + 3*P3 = graphMIS_second_moment G
P3 = graphMIS_third_moment G
```

where `Pi := graphMIS_exact_probability G i` and all casts/normalisations from natural event-cardinality sums are **explicit**. Reuse the already kernel-proved `four_point_moment_inversion` (rather than reproving algebra). Derive the **actual graph probability law**:

```text
P0 = 1 - 2*m/35 + 2*n₀/35 + n₂/315 - h/315
P1 = 2*m/35 - 4*n₀/35 - 2*n₂/315 + 3*h/315
P2 = 2*n₀/35 + n₂/315 - h/105
P3 = h/315
```

with `m=(fourGraphMISFamily G).card`, `n₀=graphMIS_pairOverlapCount G 0`, `n₂=graphMIS_pairOverlapCount G 2`, `h=unorderedCompatibleTripleCount G`. Also offer the compact moment form `P0=1-M1+M2-M3`, `P1=M1-2M2+3M3`, `P2=M2-3M3`, `P3=M3`. Correct actual probabilities only; do not merely restate the written theorem.

## Sharp extremal part

After confirming or repairing S021's `connected_graphMIS_exact_probability_three` and `connected_graphMIS_probability_three_sharp`, integrate

```lean
P3 ≤ (1 : ℚ) / 105
P3 = (1 : ℚ) / 105 ↔ Nonempty (G ≃g namedSpider)
```

as the final connected-graph theorem with actual P3. Reuse certified `connected_unorderedCompatibleTripleCount_le_three`, `connected_h_three_iff_namedSpider`, and `sharp_probability_from_h`. Do not falsely present a paper-only sharpness statement as a complete Lean certificate. Keep the any-cap extension **conditional** on an explicitly supplied `ClassicalCapNormalForm` hypothesis.

## Mandatory independent cross-checks

Reconfirm the genuine independent graph four-MIS and all 40320 label permutations for both spider and P8. Spider: `(m,n₀,n₂,h)=(9,1,15,3)`, histogram `(23424,13440,3072,384)`, `M₂` numerator 4224, `M₃` numerator 384, probabilities `(61/105,1/3,8/105,1/105)`. P8: `(5,1,3,1)`, histogram `(31360,6528,2304,128)`, `M₂` numerator 2688, `M₃` numerator 128, probabilities `(7/9,17/105,2/35,1/315)`. Check max independent, not merely independent, and don't count ordered triples.

## Closeout & disposition

Aim at full **strictly kernel-verified flagship**, not an incidental lemma or publication paperwork. If the full theorem is not compiled, close out the largest kernel-proved increment, name the exact smallest unproved equation and install **full executable S023** attacking it. Update `research/CLAIMS.md`, `README.md`, `ROADMAP.md`, `authoritative/STATE.json`, `sessions/S022_CLOSEOUT.md`, proof note, and `research/NEXT_SESSION_PROMPT.md` with exact SHA/run links. Keep mathematical novelty and journal priority **unresolved**. Leave PR #4 draft and unmerged; do not register or submit.
