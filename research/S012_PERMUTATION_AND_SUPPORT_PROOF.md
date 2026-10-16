# PDIC S012 — permutation transport and quartet connectedness obstruction

Date: 16 October 2026. Canonical proof branch: `session/s007-full-lean-flagship` (draft PR #4).

## Exact candidate source (NOT YET a Lean certificate)

[Commit `4c68728834570cb436944c407d700487c6448002`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002) appends the following to `PDIC.lean`:

- `capSum_perm_reindex`: sums over canonical labels commute with a genuine permutation via `Finset.sum_image`.
- `canonicalCapF3_perm_four_zero_iff`: zero-sum four-sets after a label permutation correspond precisely to images equal to one of the four canonical quartets.
- `linearPermCanonicalCap_four_zero_iff`: the same incidence condition after a *supplied* invertible, zero-fixing linear transformation.
- `uniformPermEventProbability`: actual rational probabilities obtained by counting permutation events and dividing by `Fintype.card (Equiv.Perm Vertex)` (S011 has independently certified this cardinal is 40320).
- `labellingZeroMISCount`: the actual `N₀(e,G)` count over genuine size-four `GraphMIS` sets.
- `ClassicalCapNormalForm`: an explicit *proposition* that may later be passed as a hypothesis, not declared as an assumed truth.
- `connected_not_all_four_quartets_independent` and `connected_not_all_permuted_quartets_independent`: candidate universal connectedness lemmas preventing simultaneous independence of the four canonical quartet blocks.

## Written connectedness argument

The canonical quartets are Q₀={0,1,4,5}, Q₁={0,1,6,7}, Q₂={2,3,4,5}, Q₃={2,3,6,7}. They obey Q₃=V∖Q₀ and Q₂=V∖Q₁. If all four were independent in a connected G, Q₀ versus Q₃ and Q₁ versus Q₂ would constitute two proper two-colourings. The S003R9 kernel-certified connected-independent-partition uniqueness theorem forces Q₀=Q₁ or Q₀=Q₂, but both alternatives are false. Transport by e⁻¹ preserves complements and inequality, yielding the permutation-uniform argument.

This gives the conceptual obstruction needed for N₀≤3. **It is not yet the formal cardinality inequality**: the actual random variable must still be proven to count a subset of *exactly* these four distinct pulled-back quartets, then connectedness must eliminate one.

## Evidence and outstanding obligations

S011 strict hosted LEAN_KERNEL_VERIFIED baseline: [7f7e32dda87983c3df619481693af5a4baff5bfd](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7f7e32dda87983c3df619481693af5a4baff5bfd), [run 38935115211 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211). All nine independent checkers, including the full 40320-permutation/16-fibre S011 checker, passed **there**.

New S012 source has been committed. At closeout the GitHub commit-workflow lookup did **not** expose a new S012 run; there is no fresh exact-source `lake build` / axiom certificate yet. Thus all S012 Lean declarations are **SOURCE_FORMALIZED / CI_UNVERIFIED**, not LEAN_KERNEL_VERIFIED. No local `lake` executable or network clone was available, so the new code was not compiled locally.

Remaining **OPEN_IN_LEAN**:
1. Obtain strict hosted Lean PASS for the new S012 declarations; fix any diagnostic first.
2. Prove the 4-to-4 pulled-quartet counting bijection and connected N₀≤3.
3. Prove singleton and complementary event fibres 2304/40320, and overlap-two-pair/compatible-triple 128/40320 via 16-preimage fibres.
4. Derive genuine unordered factorial moments, the four probabilities, unique spider equality, and conditional all-cap orbit transfer as a *single actual probability theorem*.

S011 independent finite checks remain FINITE_CHECKED only; the classical nine-cap classification is CLASSICAL_INPUT only; the flagship remains OPEN_IN_LEAN. Novelty and priority remain unresolved. No Palomar registration, PR merge or submission is authorised.
