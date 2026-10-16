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
