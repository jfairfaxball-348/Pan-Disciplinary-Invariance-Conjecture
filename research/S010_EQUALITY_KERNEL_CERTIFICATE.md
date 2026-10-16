# PDIC S010 — named spider equality: kernel-certified normalisation

**Status: LEAN_KERNEL_VERIFIED on 16 October 2026.** Exact mathematical source [`c8c64e5a2a98ee359c79430293ca0738211b4215`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215), canonical proof branch `session/s007-full-lean-flagship`, open PR #4. [Hosted Lean 38928965168 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168), job 117067718411; [independent finite verification 38928965172 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965172). The Lean workflow separately passed: `lake build`, hole rejection and all eight independent finite checkers.

## New strictly certified declarations

- `spiderHubZero_leaves` (private): a full hub row and three distinct singleton leaves admit a genuine column permutation matching `canonicalSpiderMatrix`. The finite kernel certificate is now confined to the small leaf cases, not a Cartesian search over all labelled 4×4 matrices and permutations.
- `spiderWeightedBit` and `spiderTransposeCells` (private): independently kernel-checked four-weighted-bit and transposed adjacency bridges; the final proof uses kernel-reduced finite Boolean cases rather than native bitvector solver axioms.
- `spiderHubRows_permutations` (private): explicitly normalises each of four possible row-hub locations; its column-hub counterpart is obtained by transpose.
- `spiderBitRows_permutation_certificate`: row/column orientation and two actual `Fin 4` permutations matching **all sixteen** matrix cells.
- `spiderPattern_matrixGraph_iso`: a true `SimpleGraph` isomorphism to the **named** seven-edge `S(2,2,2,1)`, including all nonedges.
- `connected_h_three_iff_namedSpider`: for **every** connected `G : SimpleGraph (Fin 8)`,
  `unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider)`.

The hosted log's `#print axioms` for the permutation certificate, pattern-to-graph isomorphism and public equality theorem reports **only** `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx`, native/solver axioms or custom trust. Exact output is in the successful run above. This relies on the already-certified S003R9, S007 and S008 actual graph, unordered-count and named-spider lemmas. The named spider's skew 3+1 / 1+3 four-MIS are retained.

## Failure history, honestly scoped

S009's monolithic universal `decide +kernel` was not a verified theorem (runner termination in 38922840797). S010 commits `36242931`, `e5a8fc6c`, `c27ce837`, `12c69e3c`, and `f703ee8d` refined case splits, transpose and isomorphism orientation; earlier hosted attempts failed compiler/axiom checks. **Only** the final source `c8c64e5a2a98ee359c79430293ca0738211b4215` is promoted to a strict certificate (not the failed intermediate sources). The separately passing Python test over 192 labelled spider matrices is corroboration, not the Lean proof.

## Remaining boundary

The full first-paper four-term distribution law remains **OPEN_IN_LEAN**: admissible cap transfer with explicitly scoped classical input, genuine 8! uniform bijections and regular 16-element fibres, moments, `N₀ ≤ 3`, and integrated sharp probabilities. Mathematical written proof uses classical nine-cap classification, whose provenance remains a cited external input. No Palomar verification/registration, publication submission or PR merge took place; novelty and priority remain unresolved.

**Automatically installed next:** [S011 cap-incidence and uniform-label bridge](../research/S011_CAP_INCIDENCE_UNIFORM_LABELLING_TARGET.md). S011 is **not** executed here.
