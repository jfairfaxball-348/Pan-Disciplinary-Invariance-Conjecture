# PDIC S008 closeout — concrete named-spider h=3; universal iff stays open

**Executed 16 October 2026. PARTIAL, not the full S008 iff theorem.** Canonical proof branch: `session/s007-full-lean-flagship`; draft PR #4. Previously strictly certified S007 connected bound source ff864170834954ef2a286afe6a6b6577ec02f986, run 38914271558 is preserved.

## Actual proof increment

Lean source [fc8581d0bd117cd66c4497fa16209e3480c65ec7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/fc8581d0bd117cd66c4497fa16209e3480c65ec7) introduces `namedSpider` on Fin 8 with exact edges 04,05,06,07,16,25,34, `canonicalSpiderMatrix`, `spiderSplitEquiv`, `canonicalSpiderIso` (preserves edges and nonedges), root-reachability/connectedness and `namedSpider_unorderedCompatibleTripleCount_three`. The concrete h=3 proof uses the existing certified mixed-witness graph count, rather than checking all sets of sets. All audited axioms for these additions are propext, Classical.choice and Quot.sound in a successful Lean compilation in run 38917870582; the overall run failed a grep guard on a prose comment and was corrected without changing proof meaning.

**Exact new proof/test source:** fc8581d0bd117cd66c4497fa16209e3480c65ec7. **Strict hosted workflow:** [38918496261](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38918496261) — STRICT LEAN PASS with all eight independent checkers. The workflow now runs eight independent checkers including the new 4×4 spider normalisation checker. Do not promote claims beyond the latest verified CI.

## Written structural advance, not a universal Lean theorem

[Constructive proof note](../research/S008_NAMED_SPIDER_NORMALISATION.md) maps an arbitrary row-hub spider matrix by placing the hub at 0, remaining rows at 1,2,3, three distinctly supported columns at 6,5,4 and the last column at 7; in the column-hub case swap row and column roles. The mapping is a genuine 8-vertex graph isomorphism. The separate [checker](../scripts/verify_s008.py) enumerates all 65,536 Boolean 4×4 matrices, finds exactly 96 row-centred and 96 column-centred patterns, and checks all 28 unordered pairs under the constructed bijection. The spider has 3+1 and 1+3 maximal independent sets, which have not been wrongly excluded.

**OPEN_IN_LEAN:** universal implication from `spiderMatrixBV ... = true` to `Nonempty (matrixGraph adj ≃g namedSpider)`, and hence the whole connected `unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider)`. Cap transfer, classical nine-cap input, uniform 8! labellings, fibres, moments, N0≤3 and complete four-term probability law also remain open. Therefore the mandatory first-paper gate has NOT passed. Novelty priority unresolved; no merge, Palomar registration, arXiv/journal submission or correspondence.

## Automatic next prompt — S009 installed, NOT executed

[Full executable S009 target](../research/S009_SPIDER_PATTERN_ISOMORPHISM_LEAN_TARGET.md) attacks exactly the universal matrix-pattern to graph-isomorphism Lean lemma and composes the iff if certified; it does not retreat to narrower Palomar packaging.

---

# PDIC S009 — formalise the universal row/column spider isomorphism

**Automatically installed after S008; NOT EXECUTED.** Owner instruction "run next session" executes this target. Continue on session/s007-full-lean-flagship; preserve strict S003R9/S007 certificates and any S008 declarations actually verified by hosted CI.

## Mission (the first-paper Lean critical path)

Finish the equality case for the *genuine unordered* compatible-three count on every connected SimpleGraph (Fin 8):

    theorem connected_h_three_iff_namedSpider
      (G : SimpleGraph (Fin 8)) (hconn : G.Connected) :
      unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider).

Do not substitute a Boolean-only equality, source-level Python verification, an isomorphism *hypothesis*, or a graph-only manuscript claim. Keep the specific seven-edge namedSpider (04,05,06,07,16,25,34) and preserve the skew 3+1 and 1+3 MIS.

## Required primary proof interface

1. Read AGENTS.md, README.md, ROADMAP.md, authoritative/STATE.json, research/CLAIMS.md, research/FLAGSHIP_THEOREM.md, research/S007_UNORDERED_GRAPH_BRIDGE.md, research/S008_NAMED_SPIDER_NORMALISATION.md, sessions/S008_CLOSEOUT.md, and actual source on the certified proof branch. Confirm the **exact source SHA and hosted statuses** before claiming anything.
2. Formalise the constructive written row- and column-hub normalisation from S008, not just its 65,536 finite checker: if spiderMatrixBV (rowsOfAdj A 0) ... (rowsOfAdj A 3) = true, construct a genuine graph isomorphism matrixGraph A ≃g namedSpider. In the row case, map the degree-four hub to 0, the other three rows (ascending index) to 1,2,3, their distinct unique neighbour columns to 6,5,4, and the remaining column to 7. Use the transposed construction in the column case. Establish the eight-vertex bijection **and both directions of adjacency** (including every nonedge) without unproved assumptions. Prefer finite row/column permutations and cardinal-4 type equivalences over brute forcing all 8! vertex permutations for all 65,536 matrices.
3. Prove the forward direction by h(G)=3 -> complementary partition exists (from an actual unordered triple), connected_partition_h_eq_matrix, connected_graphMixedCount_three_iff_pattern, pattern-to-actual-iso, and iso composition. No change to the already certified S007 graph/cardinality bridges.
4. Prove the backward direction using the exact S008 named-spider h=3 declaration once certified; use compatibleTripleCount_iso and compatibleTripleCount_eq_unordered to transport to G. If S008 code is not kernel-certified, repair it first with minimal changes.
5. Publish a single public theorem with the stated iff, then immediately audit its #print axioms output (standard propext/Classical.choice/Quot.sound only) and compare the exact theorem statement to the manuscript. No sorry, admit, native_decide, custom axiom, hidden hypothesis, or computationally unchecked promotion.

## Verification and governance

Run lake build and the strict GitHub PR Lean workflow on the exact final changed commit; run the seven legacy independent finite checkers plus the new S008 spider-normalisation checker. Record explicit SHA, run IDs, compile output/axiom check, failure/retry history, and names of all certified declarations. Keep the proof branch separate from stale main and the superseded S008 scaffold; do not merge to main, submit to Palomar, correspond, or publish.

If normalisation still fails, identify the **smallest** remaining Lean lemma and include an executable replacement target (not generic packaging). At closeout update claims, state, README, ROADMAP, a truthful sessions/S009_CLOSEOUT.md, and automatically install a complete S010 executable prompt. If this equality theorem succeeds, S010 should attack the honest classical nine-cap interface and incidence transfer, then the genuine uniform 8! label bijections, 16-element fibres, binomial moments, N0 ≤ 3 and the integrated four-point probability law. The complete first-paper theorem remains the only gateway back to Palomar preparation unless the owner redirects.

