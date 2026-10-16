# PDIC S003R8 — graph/matrix transfer and manuscript closeout (16 October 2026)

**EXECUTED.** Graph extremal result is PROVED_WRITTEN, 4×4 Boolean matrix numerical semantic transfer declarations are on [unmerged PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) and must not be called strictly formalised before exact-head hosted Lean PASS. Prior S003R7 full count adapters are kernel-verified at SHA `e1253ef0060ec5f0bc9c1f5f6dbfec2b45b06fca`, [Lean run 38883050311](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38883050311).

## Actual mathematics

For every Boolean 4×4 adjacency `A` write `b(A)` for mixed maximal independent 2+2 pairs (counted uniquely by left pair) and `e(A)` for edges. The S003R2/R3 BV theorems plus S003R7 strict numeral-to-actual semantic equalities give, as **mathematical consequences**:
- `b(A)≥4 ⇒ e(A)≤5`;
- `e(A)≥8 ⇒ b(A)≤2`;
- `e(A)=7 ∧ b(A)=3 ⇔ A` is a row/column-centred spider matrix.

S003R8 Lean adds `fourRows_rowsOfAdj`, `actualCounts_eq_encoded`, `four_mixed_implies_at_most_five_edges`, `eight_edges_implies_at_most_two_mixed` and `seven_edges_three_mixed_iff_spider` to `PDIC.lean`. Exact SHA kernel-verification status is recorded in an appended certificate; **earlier failed candidate builds must never be treated as verification**.

For connected simple graphs on eight vertices define `h(G)` as the number of unordered compatible triples of four-MIS containing a disjoint complementary pair and a third member that intersects the pair in two vertices each. For `h(G)>0`, the complementary pair gives the unique balanced bipartition (connectedness) and is maximal; compatible third members correspond bijectively to mixed 2+2 MIS. Hence `h(G)=b(A)`; otherwise `h(G)=0`. Connectivity entails `e(G)≥7`, and the matrix theorem gives **`h(G)≤3`, equality iff spider `S(2,2,2,1)`**, with converse by three mixed witnesses. This is a **written proof**; a graph `SimpleGraph (Fin 8)`/isomorphism Lean formalisation is OPEN.

A naive reduction claiming all size-four maximal independent sets are 2+2 or pure is false. The labelled spider has the genuine `3+1` maximal independent set `{1,2,3,7}` and `1+3` set `{2,4,6,7}`. They do not enter the compatible triple h count. Explicit `IsMIS4` witness Lean proofs were added and run through hosted verification.

Independent exhaustive check: all 65,536 Boolean 4×4 matrices; 36,317 connected labelled matrices on fixed 4+4; max b for e=7 is 3, for e=8 or 9 is 2; exactly 192 seven-edge/three-mixed matrices are spider configurations. Checks support but cannot substitute for kernel proof.

## First manuscript and positioning

- [Detailed S003R8 graph bridge and novelty caveats](../research/S003R8_GRAPH_BRIDGE_AND_NOVELTY.md).
- [Complete LaTeX working draft](../paper/PDIC_S003R8_DRAFT.tex) couples four zero-sum cap quartets, sharp spider triple probability `h/315≤1/105`, and full witness-count law. External classical nine-cap equivalence input clearly cited, not formalised here.
- Targeted prior art: Follett et al. (2014) nine-cap classification and Liu (1993) total MIS extremal enumeration. These are not proof of novelty of the specific cross-domain law; originality gate **OPEN**. No submission, correspondence or Palomar request.
- The full genuine uniform 2520-assignment cap-labelled probability model is **OPEN_IN_LEAN**; so is connected general `SimpleGraph` interpretation and graph isomorphism.

PR #3 stays unmerged, main retains earlier Lean baseline. No other research repos modified. [S003R9 handoff](../research/NEXT_SESSION_PROMPT.md) is PREPARED, NOT EXECUTED: first insist on exact-head Lean certificate, then close connected graph/isomorphism and probability formalisation or rigorously freeze narrow statement and refine manuscript.
