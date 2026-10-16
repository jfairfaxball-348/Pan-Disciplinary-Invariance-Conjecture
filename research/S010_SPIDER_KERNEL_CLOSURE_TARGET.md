# PDIC S010 — structural spider normalisation and strict equality-case Lean proof

**Automatically installed after S009; NOT EXECUTED.** Execute when the owner next says "run next session". Canonical proof branch: `session/s007-full-lean-flagship`. Preserve S003R9, S007 and S008 kernel-certified source, no PR merge or external publication, correspondence or Palomar submission.

## Certified context and S009 failure

S007's connected eight-vertex genuine unordered compatible-triple bound `h(G)≤3` is LEAN_KERNEL_VERIFIED at `ff864170834954ef2a286afe6a6b6577ec02f986`, hosted run 38914271558. S008's genuine named spider isomorphism, connectedness and `h(namedSpider)=3` are LEAN_KERNEL_VERIFIED at `fc8581d0bd117cd66c4497fa16209e3480c65ec7`, run 38918496261. S009 added the **unverified** universal spider pattern graph isomorphism and public `connected_h_three_iff_namedSpider` candidate in commit `59d34387f4a8bd299a37034d4ed878cba7be3e8d`. On the same mathematical source, strict [run 38922840797](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38922840797) failed after about six minutes of `lake build` when the runner received a shutdown signal (exit code 143); no Lean compiler diagnostic was reported. Subsequent eight independent checkers and axiom-output inspection did not complete. Python exhaustively verified the target normalisation for all 192 equality matrices, but that does **not** promote it to a Lean theorem.

## Primary execution target: eliminate the computational proof bottleneck

1. Review `PDIC.lean`, `research/S009_SPIDER_MATRIX_PERMUTATION_CANDIDATE.md`, `sessions/S009_CLOSEOUT.md`, the original S009 target, current branch head, and GitHub job 117046840316 logs. The specific remaining gap is the expensive global `spiderBitRows_permutation_certificate` proving for each spider-pattern Boolean 4×4 matrix an actual pair `p q : Fin 4 ≃ Fin 4` and optional side-swap matching `canonicalSpiderMatrix`.
2. **Prove structurally**, without enumerating every 16-bit matrix times every permutation. Split the equality `spiderMatrixBV` into four row-hub cases and four column-hub (transposed) cases; each has a full hub and three distinct unit neighbours. Send the hub to canonical 0, order the three other row vertices as 1,2,3, map their distinct singleton columns to 6,5,4, and the missing fourth to 7. Use `Finset` or `Equiv.ofBijective` to construct the actual two `Fin 4` permutations. Prove equality of all 16 adjacency values under ordinary or side-swapping row/column relabelling. Where appropriate, use eight small finite kernel certificates as local ingredients rather than a giant global `decide +kernel`.
3. Reuse `spiderRowPermutationIso`, `spiderColumnPermutationIso`, `spiderPattern_matrixGraph_iso`, `connected_partition_h_eq_matrix`, `connected_graphMixedCount_three_iff_pattern` and `compatibleTripleCount_iso`. Produce a public strictly checked theorem with exact statement:
```lean
theorem connected_h_three_iff_namedSpider
    (G : SimpleGraph (Fin 8)) (hconn : G.Connected) :
    unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider)
```
Do not replace graph isomorphism by a Boolean matrix pattern, assume an isomorphism, discard 3+1/1+3 spider MIS or count ordered triples.
4. Run `lake build` and strict `#print axioms` audits for the constructed permutation and public equality declarations, with only approved `propext`, `Classical.choice`, `Quot.sound`; forbid `sorry`, `admit`, `native_decide`, custom axioms or compiler trust. Run all eight independent finite scripts; require a successful hosted Lean workflow on the exact final source commit, record its full 40-digit SHA, workflow/job IDs and actual outcome. If any proof still fails, document exact smallest remaining declaration and install S011 attacking it, not paperwork.
5. **If the equality is strictly kernel-certified**, pivot within the same session if feasible to the next flagship obstruction: begin genuinely typed admissible affine eight-cap and zero-sum quartet incidence transfer over `(ZMod 3)^3`, treating the classical nine-cap classification as an explicitly stated external *mathematical premise*, never a falsely certified theorem or an unapproved Lean axiom. The full distribution still requires genuine uniform 8! labellings, 16-element fibres, binomial moments, N0≤3 and four-term probability law with sharp spider equality.

## Governance and automatic follow-up

Update `authoritative/STATE.json`, `research/CLAIMS.md`, `README.md`, `ROADMAP.md`, mathematical notes and `sessions/S010_CLOSEOUT.md` with actual evidence; automatically write/install/commit a complete executable S011 target directed at the largest remaining first-paper Lean obligation, but do not execute it until a subsequent owner instruction. Palomar, arXiv, journal submission and PR merges remain paused. Novelty/priority unresolved.
