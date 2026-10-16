# PDIC S013 — kernel-close permutation transport, N₀≤3 and genuine event fibres

**INSTALLED AFTER EXECUTED S012; NOT EXECUTED.** Owner's next "run next session" executes S013 on canonical Lean branch `session/s007-full-lean-flagship` (draft PR #4). Maintain automatic executable-prompt installation at closeout but do not run S014 without further owner direction. Follow `AGENTS.md`.

## Exact opening evidence and immediate verification gate

- S011 last genuinely STRICT LEAN PASS: [7f7e32dda87983c3df619481693af5a4baff5bfd](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7f7e32dda87983c3df619481693af5a4baff5bfd), [run 38935115211](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211) with nine independent checkers.
- S012 new `PDIC.lean` source candidate [4c68728834570cb436944c407d700487c6448002](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002). At S012 closeout there was **no exposed fresh hosted CI result**. Treat all S012 additions as **SOURCE_FORMALIZED / UNVERIFIED**, not Lean verified, until a real exact-SHA run compiles.
- Read [S012 proof note](S012_PERMUTATION_AND_SUPPORT_PROOF.md), [closeout](../sessions/S012_CLOSEOUT.md), the full manuscript `paper/PDIC_S003R8_DRAFT.tex`, `research/FLAGSHIP_THEOREM.md`, `research/CLAIMS.md`, `ROADMAP.md`, `authoritative/STATE.json`.
- **First action:** inspect current branch and GitHub Actions, obtain `lake build` and `#print axioms` against exact S012 or latest source. Resolve any elaboration/tactic errors in `capSum_perm_reindex`, image-card transport, `Finset.map` and quartet-complement rewriting. Never claim an unverified S012 lemma was certified.

## Central theorem obligation, not further scaffolding

For each connected `G : SimpleGraph (Fin 8)`, let `N₀(e,G)` count the actual size-four `GraphMIS G` sets satisfying `capSum (canonicalCapF3 ∘ e) s=0`, where `e` runs uniformly over the genuine 40320 permutations. Prove the manuscript's *full* formula in Lean, from actual finite sample-space event counts:

```
M₁ = 2*m/35
M₂ = 2*n₀/35 + n₂/315
M₃ = h/315
Pr(N₀=0) = 1-M₁+M₂-M₃
Pr(N₀=1) = M₁-2*M₂+3*M₃
Pr(N₀=2) = M₂-3*M₃
Pr(N₀=3) = M₃ ≤ 1/105,
with equality iff Nonempty (G ≃g namedSpider).
```

Here m = number of genuine size-four GraphMIS, n₀ and n₂ = **unordered** distinct pairs with 0 and 2 intersection, h = genuine **unordered** compatible triples, the already-verified `unorderedCompatibleTripleCount`.

## Ordered proof-critical work

1. **Complete the *actual* count support bound.** Prove each zero-sum labelled four-MIS corresponds *bijectively* to a unique pulled-back quartet `pulledQuartet e i`; prove four quartets are distinct for any permutation and `N₀(e,G)` equals the number of the four that are GraphMIS. Combine with S012's `connected_not_all_permuted_quartets_independent` to give **`labellingZeroMISCount G e ≤ 3` for every connected G and e**, not merely a statement that all four are not independent.
2. **Proof of uniform event fibres** over `Finset.univ : Finset (Equiv.Perm Vertex)`: singleton 2304; complementary disjoint pair 2304; prescribed overlap-two pair 128; prescribed compatible triple 128. Introduce an explicit bijection between permutations and (image configuration, 16-element within-cell permutation fibre) rather than doing an untrusted 40320-case truth table. Show 2520 admissible *ordered* image configurations and eight favourable images; don't mistake them for unordered graph triples.
3. Prove occurrence intersections incompatible with 1 or 3 overlap, and classify all *unordered* pair events by overlap 0/2. Derive exact first/second/third **factorial moments** from the real graph MIS family and the true permutation probability function, with no symbolic-probability shortcut.
4. Compose genuine moments plus N₀≤3 using the already-certified moment-inversion theorem. The final named-spider iff must invoke the kernel-verified `connected_h_three_iff_namedSpider`.
5. Give the arbitrary cap orbit classification only as a theorem **hypothesis** `ClassicalCapNormalForm`; use S011 linear transfer and permutation-sample-space bijections to prove the conditional all-admissible-cap probability statement. Do not treat arbitrary affine translations as origin-fixing.
6. Run pinned exact `lake build`, inspect `#print axioms` for each public declaration, scan for `sorry`/`admit`/`native_decide`/custom axioms, and run all nine independent checkers including `scripts/verify_s011.py`. Require hosted exact-head CI PASS before status upgrade. If resources prevent full closure, **get at least the actual N₀≤3 count theorem kernel checked and one nontrivial event-fibre theorem**, name the smallest missing obligation and install S014 to target it directly. Do not divert to Palomar or paper packaging.

## Closeout

Commit the new substantive Lean source and exact CI evidence to PR #4; update `sessions/S013_CLOSEOUT.md`, proof note, README, ROADMAP, CLAIMS, STATE and `research/NEXT_SESSION_PROMPT.md` with S014's greatest outstanding proof obligation. Keep statuses differentiated LEAN_KERNEL_VERIFIED / FINITE_CHECKED / CLASSICAL_INPUT / SOURCE_FORMALIZED / OPEN. Automatically install, **do not execute**, S014. Do not merge PR, register Palomar or submit a paper without explicit authorisation. Novelty/priority unresolved.
