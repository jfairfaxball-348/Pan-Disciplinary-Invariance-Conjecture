# PDIC S017 — arbitrary 128 overlap-event fibres, genuine graph moments and complete first-paper law

**INSTALLED AFTER S016; NOT EXECUTED.** The owner's next “run next session” authorises immediate execution of S017. Follow AGENTS.md. The canonical Lean branch is `session/s007-full-lean-flagship`, draft PR #4. Automatic end-of-session prompt generation remains active. Do not merge PR #4, file a Palomar record, or submit an arXiv/journal manuscript without explicit owner instruction.

## Preflight — trust exact certificates only

Read `sessions/S016_CLOSEOUT.md`, `research/S016_PAIR_FIBRE_PROOF.md`, `research/FLAGSHIP_THEOREM.md`, current `PDIC.lean`, `authoritative/STATE.json`, `ROADMAP.md`, `research/CLAIMS.md` and the manuscript. Verify the exact current `PDIC.lean` blob and hosted Lean logs before using S016 theorems. S015 singleton event (2304) is strictly certified at `69de0c9e9963016ff5324545d55710619e8b8ead`, Lean run `38959901730`. S016's complementary-pair 2304 theorem passed strict hosted Lean at `4b4b02aad5a8d1074288011976fc0c040622a4c0`, run `38962481022`. Treat subsequent S016 dihedral/128 candidates as certified **only** if the exact-theorem-bearing hosted Lean run has succeeded; repair syntax, elaboration, or computational timeout issues first if not.

## Binding first-paper objective

For every connected `G : SimpleGraph (Fin 8)` and actual uniform permutation `e : Equiv.Perm (Fin 8)` labelling vertices by the canonical admissible F₃³ cap, derive the exact law of the true number `N₀(e,G)` of zero-sum size-four `GraphMIS` sets. The required genuine unordered graph counts are `m` (singletons), `n₀` (disjoint pairs), `n₂` (two-overlap pairs), and `h` (compatible triples). The manuscript law is

\[
M_1=\frac{2m}{35},\quad
M_2=\frac{2n_0}{35}+\frac{n_2}{315},\quad
M_3=\frac{h}{315},
\]
\[
(P_0,P_1,P_2,P_3)
=(1-M_1+M_2-M_3,\ M_1-2M_2+3M_3,\ M_2-3M_3,\ M_3),
\quad P_3\le 1/105,
\]
with equality **iff** `Nonempty (G ≃g namedSpider)`.

## Ordered mathematical obligations

1. Upgrade S016's canonical fixed Q₀/Q₁ overlap-two event `128` to **every** prescribed pair `s,t` with `s.card=t.card=4` and `(s∩t).card=2`. Construct a genuine permutation taking one balanced 2/2/2/2 membership-bit partition to another, by explicit bijections of its four two-element cells. Then transport the certified eight-target-by-16-fibre calculation; do **not** brute-force 40320 permutations with `decide`.
2. Prove all remaining true pair-event cases: complementary disjoint source count `2304` from S016, impossible intersection 1/3, and exclude equal source sets from unordered pair aggregation.
3. Prove the **actual compatible unordered triple** event count `128`, with the unique complementary pair identified combinatorially. Show all other distinct triple incidence types are incompatible. Do not conflate eight *ordered* canonical image configurations with the unordered graph triple count.
4. Double-count over real `Equiv.Perm Vertex` and actual `GraphMIS` families to kernel-prove the three moment formulas for `N₀`. Correctly exchange finite sums and divide by exactly `40320`. Reuse S013's true `N₀≤3`.
5. Export **one complete four-term Lean flagship theorem** with spider equality using the S010 certified `connected_h_three_iff_namedSpider`. If extending to arbitrary admissible eight-caps, require `ClassicalCapNormalForm` as an **explicit supplied hypothesis**, apply only zero-fixing linear equivalences, and do not smuggle a classification into axioms.
6. Enforce pinned `lake build`, `#print axioms` for new public results, hole/axiom scan, all nine independent scripts and hosted exact-SHA CI. Only `propext`, `Classical.choice` and `Quot.sound` are acceptable. State CI-pending versus LEAN_KERNEL_VERIFIED honestly.

If total closure proves too ambitious in this session, deliver the **universal actual 128-event pair cardinality** as the primary nontrivial strict certificate, document the minimal remaining triple/moment interface and install S018 aimed directly at it. Do not return to graph-only extremality, Palomar packaging or administrative work.

## Closeout contract

Write substantive source proofs and evidence, `research/S017_*.md` proof note, `sessions/S017_CLOSEOUT.md`, update README/ROADMAP/CLAIMS/STATE and **automatically install** a full executable S018 prompt. Never execute S018 without the next owner instruction. Novelty, priority and all external submission decisions remain open.
