# PDIC S022 — actual four-probability law, strict kernel certificate

**Executed and VERIFIED 17 October 2026.** Canonical source branch `session/s007-full-lean-flagship`, draft PR #4 (unmerged). Exact certificate: [78273ce1fae09f844009740830b5ca9cdff7f6b7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/78273ce1fae09f844009740830b5ca9cdff7f6b7); strict `lake build`/proof-hole scan/independent 40320-label checks [39019738861](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738861) **SUCCESS**; independent finite workflow [39019738772](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738772) **SUCCESS**, on the same SHA. The eight new declarations print *only* `propext`, `Classical.choice`, `Quot.sound`. This is LEAN_KERNEL_VERIFIED, not just a paper identity.

## Main mathematical bridge

For each connected `SimpleGraph (Fin 8)` and genuine permutation `e ∈ Equiv.Perm (Fin 8)`, the existing proved theorem gives `N₀(G,e)≤3`. The S022 `connected_graphMIS_four_event_histogram` proves **for every rational function** `f : ℕ → ℚ` that `∑e f(N₀(G,e))` equals the sum of `f(i)` multiplied by the genuine cardinal of the event `{e | N₀(G,e)=i}`, for `i=0,1,2,3`. This is an actual exhaustive, disjoint partition of the 40320 permutations, not hypothetical `p_i` variables. Dividing by 40320 gives `connected_graphMIS_four_event_expectation`.

Instantiate `f=1`, `f(n)=n`, and `f(n)=Nat.choose n 2` to prove *literally for actual Pᵢ*:
```
P0+P1+P2+P3=1
P1+2*P2+3*P3=M1
P2+3*P3=M2
P3=M3                 (previous strict P3=M3 result)
```
where previously certified real double-counting gives `M1=2m/35`, `M2=2n0/35+n2/315`, `M3=h/315`. The existing kernel-proved `four_point_moment_inversion` then yields:
```
P0=1-2m/35+2n0/35+n2/315-h/315
P1=2m/35-4n0/35-2n2/315+3h/315
P2=2n0/35+n2/315-h/105
P3=h/315
```
with `m=(fourGraphMISFamily G).card`, `n0=graphMIS_pairOverlapCount G 0`, `n2=graphMIS_pairOverlapCount G 2` and `h=unorderedCompatibleTripleCount G`. The single new integrated `connected_graphMIS_complete_flagship` adds the already certified `P3≤1/105`, with equality **iff** `Nonempty (G ≃g namedSpider)`. In the manuscript the spider is `S(2,2,2,1)`.

## Verification and source repair

The first candidate at [`679eaddeff4f875358ded9f2b4a250a9d9b42426`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/679eaddeff4f875358ded9f2b4a250a9d9b42426) failed [strict Lean 39019429781](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019429781): the four summands were not parenthesised within the `∑ e` binder, and `rw` required absent occurrences of a moment in some hypotheses. These were repaired; the exact `78273ce1fae09f844009740830b5ca9cdff7f6b7` source passed [strict Lean 39019738861](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738861) **every step**: pinned build, no sorry/admit/native/trust/axioms, axiom prints and all finite scripts including the S020 unordered checker. [Finite 39019738772](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738772) also passed. No ignored Lean errors, unproved imported theorem or admitted goal.

Independent all-label corroboration:
| Graph | (m,n0,n2,h) | (count N0=0,1,2,3) | P0,P1,P2,P3 |
|---|---|---|---|
| Spider S(2,2,2,1) | (9,1,15,3) | (23424,13440,3072,384) | (61/105,1/3,8/105,1/105) |
| P8 | (5,1,3,1) | (31360,6528,2304,128) | (7/9,17/105,2/35,1/315) |

## Scope and next obligation

This is the **entire connected-graph four-term law for uniform permutations of the typed canonical F₃³ eight-cap, kernel certified**, including uniqueness of the sharp spider. The first-paper manuscript describes any admissible eight-cap; to align with that generality in Lean, S023 must formally transport event probabilities across the explicit supplied `ClassicalCapNormalForm` condition. That classification remains external and conditional; mathematical novelty/priority remain **unresolved**. Historical main/PDIC.lean is not this certified source; draft PR #4 is intentionally unmerged. No Palomar, arXiv, journal or correspondence actions.
