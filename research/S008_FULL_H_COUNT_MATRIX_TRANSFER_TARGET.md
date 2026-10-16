> **SUPERSEDED, NOT EXECUTED:** S007 continuation closed the h-count and matrix-transport obligations. The installed S008 target is [named-spider isomorphism](S008_NAMED_SPIDER_ISOMORPHISM_TARGET.md). The old scaffold branch is not the current proof source.

# PDIC S008 — prove genuine h(G) = mixed MIS count and connected h ≤ 3

**INSTALLED 16 October 2026, NOT EXECUTED.** Continue full first-paper Lean formalisation; no Palomar preparation, manuscript substitution or administrative pivot.

## Exact starting point and strict evidence

Repository: `jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture`.
Proof branch: `session/s008-full-h-bridge`, created from exact S007 verified `d05fe1e71d054fe74a52a664112b6de436e999da`. S007 strict [hosted pass 38912238607](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38912238607) checks all Lean declarations and six independent finite tests. Draft S007 [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4) stays unmerged. Main has an older `PDIC.lean` and must not be used as the proof base.

Read `AGENTS.md`, `research/FLAGSHIP_THEOREM.md`, `research/S007_UNORDERED_TRIPLE_BRIDGE.md`, `research/CLAIMS.md`, `paper/PDIC_S003R8_DRAFT.tex`, `authoritative/STATE.json` on main, and the exact proof branch source. The installed contract requires substantive Lean progress, exact-SHA hosted proof checks, and automatic S009 prompt installation at closeout.

## Primary proof obligation: turn the anchored-third lemma into a complete cardinality bijection

1. Work with S007's **genuine unordered triple** `IsUnorderedCompatibleTriple G T` where `T : Finset (Finset (Fin 8))`, each member is a four-MIS, and `T.card=3`. Do not replace it by an ordered triple or `anchoredMixedThirdCount` by definition.
2. For connected G and anchor `hs : FourMISPartition G s`, construct `Φ(r) = {s, univ \ s, r}` for every `IsAnchoredMixedThird G s r`. Prove `Φ(r)` is a valid unordered compatible triple, including that r differs from both pure sets and the triple has cardinality 3.
3. Prove every genuine triple T is `Φ(r)` for exactly one r, using S007 `unorderedTriple_has_anchored_third`, the established connected partition uniqueness and the fact an unordered three-set has exactly one third member. Supply an explicit `Equiv` or a bijective `Finset.card_bij` whose inverse laws are Lean checked. Prove `unorderedCompatibleTripleCount G = anchoredMixedThirdCount G s`. Also preserve the already proved zero case when no partition exists.
4. Hostile test: S(2,2,2,1) has genuine h=3 but also additional skew 3+1 and 1+3 four-MIS which MUST NOT count as anchored 2+2. Path P8 has h=1; split tree with edges 01,02,14,16,23,45,67 has h=1; star K1,7 has h=0; connected C8 has h=0. Computational checks are corroboration only.

## Secondary proof obligation: transport an arbitrary connected eight-vertex graph to the certified 4×4 theorem

5. Given `hs : FourMISPartition G s` explicitly enumerate the two four-element sides with `Fin 4` equivalences, define `A : Side → Side → Bool` from genuine G adjacency, and prove a graph isomorphism `G ≃g matrixGraph A`. Independence of the two sides supplies absence of same-side edges; avoid unproved isomorphism assertions.
6. Transport `GraphMIS`, overlap cardinalities and the anchored mixed third-set family along this graph isomorphism. Prove `anchoredMixedThirdCount G s = graphMixedCount A`; do not assume arbitrary graph count identity. Establish connectedness of `matrixGraph A` from `G.Connected`.
7. Conclude the unconditional connected graph statement `unorderedCompatibleTripleCount G ≤ 3`, using zero if no partition and S003R9 `connected_graphMixedCount_le_three` otherwise. This is the essential S008 mathematical goal. If scope permits, use `connected_graphMixedCount_three_iff_pattern` plus a proved row/column pattern-to-named `spiderAdj` isomorphism to establish h=3 iff spider isomorphism. Do not claim this if only matrix-pattern equality is established.

## Full flagship completion contract

The paper's probability law remains unproved end-to-end in Lean:

`Pr(N₀=0)=1−M₁+M₂−M₃`, `Pr(N₀=1)=M₁−2M₂+3M₃`, `Pr(N₀=2)=M₂−3M₃`, `Pr(N₀=3)=M₃=h(G)/315≤1/105` with iff equality at S(2,2,2,1), where `M₁=2m/35, M₂=2n₀/35+n₂/315, M₃=h/315`. The classical nine-cap equivalence is a **legitimate explicit external mathematical hypothesis**, never the theorem conclusion assumed. Follow h graph bridge with actual 8! cap labellings and fibre/moment formalisation in subsequent sessions. Never present a graph-only certificate as the whole theorem.

## Verification, closeout and automatic next prompt

All new declarations: no `sorry`, `admit`, `native_decide`, compiler trust or custom axioms. Prove intended precise specifications; run `lake build`, independent finite checks, strict `#print axioms`, and hosted GitHub Actions on the **exact final branch SHA**. If failing, fix the proof instead of promoting it. Keep PR(s) draft and do not merge without owner instruction.

At closeout, record every exact theorem and still-open obligation in `research/CLAIMS.md`, `authoritative/STATE.json`, a session proof note and `sessions/S008_CLOSEOUT.md`. **Automatically create, install and commit a fully executable S009 target** focussed on the strongest remaining full-theorem Lean gap. The prompt does not execute itself. Do not initiate Palomar registration, external correspondence, arXiv or journal actions.
