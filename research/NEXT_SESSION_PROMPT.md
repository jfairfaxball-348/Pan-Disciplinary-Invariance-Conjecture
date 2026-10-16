# PDIC-S003R8 — TRANSFER SHARP 4×4 MATRIX RESULTS TO GRAPH SEMANTICS; FREEZE FIRST PAPER

**PREPARED, NOT EXECUTED.** Execute only on the owner's next explicit “Run next session.” Do not automatically start S004; do not contact authors, Palomar, arXiv or journals without explicit owner instruction.

## Exact verified foundation — DO NOT REOPEN THE TWO NUMERIC COUNT BRIDGES

Read AGENTS.md, authoritative/STATE.json, research/CLAIMS.md, sessions/S003R7_CLOSEOUT.md, research/S003R7_SYMBOLIC_SEMANTIC_BRIDGE.md and current [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3). Pin live HEAD and check strict CI. The source `e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca` passed [Lean run 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311) and separate [finite run 38883050344](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050344). It now contains full, kernel-verified:
```lean
(fourRowMixedCountBV a b c d).toNat =
  actualMixedLeftPairCount (adjOfRows (fourRows a b c d))
(fourRowEdgeCountBV a b c d).toNat =
  actualMatrixEdgeCount (adjOfRows (fourRows a b c d))
```
plus the six individual pair iff, six-pair cardinality and exact edge row sum. Do not repeat failed monolithic 65,536-matrix Finset simplification.

## Main S003R8 proof mission

1. **Complete actual adjacency transfer** from the already kernel-verified BV theorems (a) mixed left-pair count ≥4 ⇒ at most 5 edges, (b) ≥8 edges ⇒ at most 2 mixed pairs, and (c) 7 edges and exactly 3 mixed pairs iff the BV row/column spider matrix. Use `rowsOfAdj` and its proven left inverse `adjOfRows_rowsOfAdj`; establish `fourRows (rowsOfAdj adj 0) ... = rowsOfAdj adj` by `funext`, `fin_cases`; use explicit BitVec/Nat bounds rather than opaque numerical coercion. Each new theorem must #print axioms and pass exact SHA hosted Lean CI.
2. **Attack connected balanced 8-vertex graph semantics**: construct `SimpleGraph (Fin 8)` from a 4+4 bipartition, identify every size-four MIS as 4+0/0+4 or a genuine 2+2 mixed pair, and prove for connected graphs the relevant h=b/counting reduction. Explicitly handle disconnected and 3+1 patterns as potential counterexamples rather than silently assuming they vanish.
3. **Spider isomorphism**: show any connected graph saturating the seven-edge/three-pair threshold is the 8-vertex spider S(2,2,2,1) up to vertex isomorphism. The BV row/column hub recognition is already certified; the graph isomorphism is not.
4. **Paper-first choice**: perform targeted primary source comparison against extremal enumeration of maximal independent sets in bipartite graphs and spider extremisers. If the full cap-probability flagship is not tractable in this session, freeze the **narrowest rigorously novel or clearly interesting and fully verified** 4×4 matrix / balanced graph theorem as the first-paper candidate and prepare a full TeX outline. Do not manufacture an originality claim.
5. **Cap probability model** (only if time allows after 1–4): define an actual equiprobable 2520 atom-labelling assignment space, prove the 8/2520=1/315 triple fibre law and moment inversion; preserve classical nine-cap classification as explicit external input until formalised.

## Gate and closeout

At one precise PR SHA run pinned `lake build`, verify no forbidden `sorry`/`admit`/`native_decide` or custom/native axioms, review `#print axioms`, and all five Python scripts. Preserve all previous kernel results and no change to other repositories. Update claims, authoritative state, roadmap, README if needed, S003R8 closeout, exact CI URLs and next prompt. The conditional graph/probability flagship is not fully formalised merely because the arbitrary four-by-four matrix count bridge now passes. PR #3 unmerged until review/owner merge decision.
