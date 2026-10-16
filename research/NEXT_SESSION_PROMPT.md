# PDIC S018 — certify S017 and derive genuine graph moments, four-term flagship law, unique sharp spider
**INSTALLED AFTER S017; NOT EXECUTED.** The next user "run next session" immediately authorises S018. Follow AGENTS.md. Automatic end-of-session prompt generation is active: install S019 at closeout without executing it. Work on `session/s007-full-lean-flagship` and draft PR #4, not main's historic smaller `PDIC.lean`. Do not merge PR #4 or perform Palomar, arXiv or journal submission.

## Mandatory preflight, highest-priority gate
Read `sessions/S017_CLOSEOUT.md`, `research/S017_UNIVERSAL_OVERLAP_AND_TRIPLE_FIBRES.md`, `authoritative/STATE.json`, `research/FLAGSHIP_THEOREM.md`, `research/CLAIMS.md`, `PDIC.lean`, and `paper/PDIC_S003R8_DRAFT.tex`. S017's complete two-event and three-event source `0e88ab34eda79df08f700d141b9ef5f98e13f17e` is **LEAN_KERNEL_VERIFIED** at strict hosted run `38967576459` and finite run `38967576644`. Independently reconfirm the run is successful for this exact source, including `#print axioms` (only the three standard axioms) before reusing its theorems. Do not unnecessarily re-prove the strictly certified S017 events. The last S016 certified canonical pair is 5dc78de0aad6fa1d19bcda72e7143386f222d617 / run 38963802011. S016 arbitrary disjoint pair 2304 is already strict-certified at 4b4b02aad5a8d1074288011976fc0c040622a4c0 / run 38962481022. Do not weaken or re-prove those results.

## Binding mathematical objective
For every connected simple graph G on Fin 8 and every true uniformly sampled labelling `e : Equiv.Perm (Fin 8)` by the canonical admissible F₃³ cap, prove the distribution of the **actual** number N₀(e,G) of zero-sum size-four maximal independent vertex sets. Define:
- m = the number of size-four GraphMIS sets;
- n₀ = the number of **unordered pairs of distinct** such sets with zero overlap;
- n₂ = the number of unordered pairs of distinct such sets with two-point overlap;
- h = the number of **unordered distinct compatible triples** with a complementary pair and the third meeting each side in two vertices.
Prove and export the actual finite probability factorial-moment identities:
```
M₁ = E[N₀]         = 2304 m / 40320 = 2m/35
M₂ = E[choose N₀ 2] = (2304 n₀ + 128 n₂) / 40320 = 2n₀/35 + n₂/315
M₃ = E[choose N₀ 3] = 128 h / 40320 = h/315.
```
Then, using existing kernel-proved N₀≤3, derive the exact *four probabilities*:
```
(P₀,P₁,P₂,P₃) =
(1-M₁+M₂-M₃, M₁-2M₂+3M₃, M₂-3M₃, M₃).
```
Prove P₃ ≤ 1/105 with equality iff Nonempty (G ≃g namedSpider), using S010's `connected_h_three_iff_namedSpider` or equivalent certified theorem. The result must quantify over the actual graph, actual MIS sets and actual 40320 permutation sample space. No graph-matrix-only substitution.

## Ordered attack
1. Verify the already **PASS exact source CI** for S017 and the printed axioms for each theorem (only `propext`, `Classical.choice`, `Quot.sound`), prohibit sorry/admit/native compiler trust and establish all nine checkers PASS.
2. Prove finite combinatorial incidence: unordered pairs classified by overlap 0 or 2 when simultaneously cap-zero, not 1/3; all actual triple events require a complementary pair; identify the unique complementary pair *within a compatible unordered triple* (if its purported uniqueness requires conditions, prove them explicitly).
3. Define honest `Finset` of `GraphMIS` size-four sets and genuine unordered two-/three-element subfamilies. Double-count through permutation subtypes and exchange finite sums. Avoid a surrogate enumeration of quartet indices counted as unordered graph events.
4. Invoke singleton 2304, disjoint pair 2304, overlap-two 128, compatible triple 128 certified event counts to close M₁,M₂,M₃. Correct 40320 denominator, source ordering and binomial normalisation.
5. Combine with `connected_labellingZeroMISCount_le_three`, prove the four distribution identities and sharp spider equality in one integrated flagship Lean theorem; prove equivalence to stated manuscript result.
6. Optional arbitrary admissible cap transfer ONLY with `ClassicalCapNormalForm` as explicit supplied hypothesis, and zero-fixing linear maps (no affine translations); do not smuggle literature classification into axioms.
7. Perform hostile independent mathematical audit of the aggregate incidence, exact-source `lake build`, hole scan, nine scripts, strict `#print axioms`, exact-SHA hosted CI; log exact links and any obstructions.

If the full law is not closed, prioritise a genuinely **kernel verified** first or second *graph-derived* moment rather than another graph-only bound, and install S019 against the smallest remaining moment/triple interface. Do not substitute paperwork or a weaker flagship.

## Closeout
Write complete proof notes, `sessions/S018_CLOSEOUT.md`, update `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, and automatically install a thorough S019 executable prompt in `research/NEXT_SESSION_PROMPT.md`. Do not execute S019. Maintain novelty/priority caveat and external submissions owner-controlled.
