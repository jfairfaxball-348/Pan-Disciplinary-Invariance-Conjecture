# S019 — exact source-event classification and honest unordered pair families

**FINAL EXACT-SOURCE CERTIFICATE:** [strict Lean run 38978027666](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027666) **SUCCESS** and [ten-checker finite run 38978027657](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027657) **SUCCESS**, both at proof SHA `e981acac25b8106e4b4df782340217ed948445bb`. All four S019 public Lean declarations are **LEAN_KERNEL_VERIFIED** (only `propext`, `Classical.choice`, `Quot.sound`; pinned build and hole scanner PASS). The complete global M₂/M₃ and four-probability flagship is nevertheless **OPEN_IN_LEAN**.


16 October 2026. Canonical source branch: `session/s007-full-lean-flagship` (unmerged draft PR #4).

## The source-level mathematical advance

Let \(s,t\) be distinct four-subsets of eight vertices. For the canonical admissible cap \(U\subseteq \mathbb F_3^3\), each of the \(8!=40320\) permutations \(e\) labels the vertices bijectively. Set \(Z_e(s)\) when the cap-label sum on \(s\) vanishes.

The genuine simultaneous-event fibre is

\[
\#\{e:Z_e(s)\land Z_e(t)\} =
\begin{cases}
2304 & |s\cap t|=0,\\
128 & |s\cap t|=2,\\
0 & \text{otherwise}.
\end{cases}
\]

This is proved by applying S016/S017's already certified complementary-pair \(2304\) and overlapping-pair \(128\) theorems. The residual cases are impossible by S014's true canonical-cap overlap restriction for two *distinct* pulled-back zero quartets. Crucially, the residual zero is not a guessed event count.

For three pairwise different four-sets, S014's verified theorem says three simultaneous zero events always contain a disjoint pair. A triple whose three pairwise intersections are all nonempty therefore has exactly **zero** simultaneous zero-permutation events. This is not yet the full 128/0 classification of every unordered triple.

## Actual unordered graph maximal-independent two-families

Define \(\mathcal F_G\) to be the true size-four maximal independent vertex sets of a graph \(G\). An actual unordered two-family \(T\in\mathcal F_G.\mathrm{powersetCard}(2)\) can be written \(T=\{s,t\}\) with \(s\neq t\), both actual graph MIS. Its permutation event is literally the same event as requiring \(Z_e(s)\land Z_e(t)\); it therefore has the classified fibre \(2304,128,0\), *once per unordered family T*, with no factor of two. This is the first genuinely graph-level bridge beyond the universal \(k\)-moment double-counting theorem of S018.

Lean declarations on the proof branch:

- `canonicalCapF3_perm_distinct_pair_event_zero_of_other_overlap`
- `canonicalCapF3_perm_distinct_pair_event_card_by_overlap`
- `canonicalCapF3_perm_distinct_triple_event_zero_of_no_disjoint`
- `graphMIS_unordered_pair_family_event_card`

The final proof candidate is source commit `e981acac25b8106e4b4df782340217ed948445bb`. Certification requires the exact-source hosted strict Lean run `38978027666` and independent finite run `38978027657`; check their completed conclusions before promoting the declarations to LEAN_KERNEL_VERIFIED. An earlier attempt `932ea8ff` built Lean and printed only standard axioms, but failed the repository's naive forbidden-token grep because a prose comment used the English verb *admit*. The comment was replaced at `e981acac`. This earlier run is **not** a strict PASS. An intermediate `de445163` included the graph two-family bridge but still carried that comment. Retain separate exact proof and check SHA evidence.

## Remaining mathematical obstruction

S018 has a strict kernel proof of

\[
\sum_{e\in S_8}\binom{N_0(e,G)}{k}=
\sum_{T\in\mathcal F_G^{(k)}}\#\{e:\forall s\in T,\ Z_e(s)\}.
\]

The S019 candidate classifies the individual unordered two-family summands. It **does not yet** prove the numerical global aggregate \(2304n_0+128n_2\); that still requires defining and summing invariant overlap-zero and overlap-two family filters in Lean. For \(k=3\), the remaining obligations are the unique complementary pair with 2+2 mixed third set, the equivalence with the real `IsUnorderedCompatibleTriple` and \(128h\) total.

Until the numerical M₂ and M₃ equations, rational normalisations, all four real event probability identities and the spider iff have exact strict Lean certification, **the full first-paper flagship theorem remains OPEN_IN_LEAN**, even if these individual source-fibre bridges are verified. The arbitrary-cap normal form remains explicitly conditional on classical cap classification, never a new Lean axiom. Novelty/priority remains unresolved.

## Audit requirements

The hosted Lean workflow checks pinned `lake build`, printed axioms, proof-hole scan and ten independent finite scripts. The permitted printed axiom set is exactly `propext`, `Classical.choice`, `Quot.sound`. The spider's finite-only histogram \((23424,13440,3072,384)\) and the path P8 histogram \((31360,6528,2304,128)\) remain corroboration, not an end-to-end universal certificate. No PR merge or external registration/publication is authorised.