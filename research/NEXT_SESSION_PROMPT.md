# PDIC S015 — actual 2304/128 event fibres, real MIS moments and full four-term law

**INSTALLED AFTER EXECUTED S014; NOT EXECUTED.** The next owner's “run next session” executes S015 directly on canonical branch `session/s007-full-lean-flagship` (draft PR #4), following AGENTS.md. Automatic next-session prompt creation remains active at closeout, but the next session is never run without a further instruction. Do not merge, register Palomar or submit a paper.

## Opening strict verification gate

1. Read S014 [closeout](../sessions/S014_CLOSEOUT.md), [regular fibre note](S014_REGULAR_FIBRE_PROOF.md), the full [flagship theorem](FLAGSHIP_THEOREM.md), the [manuscript](../paper/PDIC_S003R8_DRAFT.tex), state, claims, roadmap and latest actual proof source.
2. **Latest S014 exact-source strict certificate**: [`95ef8f4886868f66edfbde90b34cc9e12fe6b463`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/95ef8f4886868f66edfbde90b34cc9e12fe6b463) with [hosted Lean kernel PASS 38949894336](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894336) and [hosted finite PASS 38949894242](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894242). It verifies the genuine quartet-index MIS correspondence, pair/triple event incidence restrictions, `canonicalFourBlockStabilizer_card=576`, `canonicalTwoQuartetStabilizer_card=16`, `perm_finset_image_fixed_iff`, `canonicalFourBlockColour_comp_iff_image_fixed`, and `canonicalQuartetImageStabilizer_card=576`. All nine checkers and the proof-hole scan passed with only standard Lean axioms. The 16 and 576 are **stabilizer/fixed-image fibre counts**, not yet universal 128/2304 event totals.
3. Existing strict certified graph extremiser: `connected_h_three_iff_namedSpider`, [S010 run 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168). Existing true `N₀(e,G)≤3`: [S013 run 38945169850](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169850). Existing real quartet-index bijection and event-overlap structural results: [S014 run 38947974155](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38947974155).

## Main mathematical target (do not replace with administrative tasks)

For every connected graph G on Fin 8 with canonical F₃³ cap permuted uniformly over actual `Equiv.Perm (Fin 8)`, prove:

```
M₁ = 2*m/35
M₂ = 2*n₀/35 + n₂/315
M₃ = h/315
Pr(N₀=0) = 1-M₁+M₂-M₃
Pr(N₀=1) = M₁-2*M₂+3*M₃
Pr(N₀=2) = M₂-3*M₃
Pr(N₀=3) = M₃ ≤ 1/105
with equality iff Nonempty (G ≃g namedSpider)
```

All m,n₀,n₂,h must be true **unordered** maximal-independent-set statistics. No symbolic moment stand-ins.

## Ordered proof obligations

1. **Reconfirm exact S014 certificate and build from its proved interfaces.** Reuse kernel-checked `canonicalFourBlockStabilizer_card=576`, `canonicalTwoQuartetStabilizer_card=16`, and actual `canonicalQuartetImageStabilizer_card=576`. Use the pinned Mathlib `DomMulAct.stabilizer_card`. The image-fixing equivalence now passes strict Lean; do not redo its proof or enumerate 40320 permutations. Proceed directly to transitive transport from the fixed quartet to arbitrary prescribed four-subsets.
2. **Transport true fixed-image fibres.** For arbitrary prescribed four-subset S and canonical quartet Qᵢ construct explicit permutation witnesses S→Qᵢ and a `Fintype.card_congr` equivalence between the fibre `{e | S.image e = Qᵢ}` and the 576 base stabilizer. Prove the four possible target events are disjoint. Then prove the genuine `canonicalCapF3_perm_four_zero_iff` event cardinality is **2304** for every |S|=4, giving probability 2/35.
3. **Two-quartet regular fibres.** Show preservation of the ordered two-quartet 2+2+2+2 membership colouring is equivalent to fixing *both* actual quartet images. Build corresponding coset equivalences for any prescribed 2-overlap four-set pair. The eight compatible ordered canonical image assignments are distinct and each has the **16**-permutation regular fibre, giving actual two-overlap pair event count **128** and probability 1/315. Handle complementary pairs separately: 2304. Triple events: 128 for genuine compatible triples. Prove zero events for pair overlaps 1/3 and noncompatible triples, invoking already verified overlap/triple structure.
4. **True moment identities.** Define real unordered distinct MIS4 pairs and compatible unordered triples on G; interchange finite permutation and graph-set sums. Prove first, second and third binomial moments of the *actual* `labellingZeroMISCount` equal M₁, M₂, M₃. Identify `h` with the strictly verified `unorderedCompatibleTripleCount`.
5. Combine moments + genuine `N₀≤3` and the proven inversion law. Export a single flagship Lean statement including the four probabilities, upper bound, and spider iff equality. Arbitrary-cap transfer may assume a supplied proof of `ClassicalCapNormalForm` and only a zero-fixing linear map; **never silently claim classical classification or affine-translation invariance**.
6. Verify pinned exact `lake build`, public `#print axioms`, forbidden-hole scans (no `sorry`, `admit`, `native_decide`, custom axioms or compiler trust), all nine checkers including `verify_s011.py`, and hosted exact-SHA CI PASS. Record precise source+run, not a candidate-only claim.

## If the full theorem is not yet closed

Prioritise **real 2304 and 128 fixed-event cardinalities** over any new symbolic formula. Get at least one of them strictly kernel-verified at an exact commit; isolate the smallest unsolved coset/image or graph-MIS moment interface and install S016 to attack it directly. Do not divert into graph-only results, novelty paperwork, Palomar, or manuscript presentation.

## Closeout contract

Commit actual mathematics and proof notes, `sessions/S015_CLOSEOUT.md`, exact CI evidence, README, ROADMAP, CLAIMS, authoritative STATE, and a full executable S016 prompt to both `research/NEXT_SESSION_PROMPT.md` and historical target. **Do not execute S016** without the next explicit owner command. Priority and submissions remain unresolved/unperformed.
