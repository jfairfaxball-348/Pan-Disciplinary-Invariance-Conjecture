module
public import PDIC

public section

/-!
# S006 Palomar solution

The compared statements in Challenge.lean reconstruct the ordinary graph
definitions and spider-pattern predicate from the independently verified
S003R9 PDIC proof development. The following are named wrappers of the
substantive, earlier strictly Lean-verified theorems; no conditional assumption
of the conclusions is introduced here.
-/

namespace PDICSubmission

theorem connected_mixed_bound (adj : PDIC.Side → PDIC.Side → Bool)
    (hc : (PDIC.matrixGraph adj).Connected) :
    PDIC.graphMixedCount adj ≤ 3 := by
  exact PDIC.connected_graphMixedCount_le_three adj hc

theorem connected_mixed_equality (adj : PDIC.Side → PDIC.Side → Bool)
    (hc : (PDIC.matrixGraph adj).Connected) :
    PDIC.graphMixedCount adj = 3 ↔
      PDIC.spiderMatrixBV (PDIC.rowsOfAdj adj 0) (PDIC.rowsOfAdj adj 1)
        (PDIC.rowsOfAdj adj 2) (PDIC.rowsOfAdj adj 3) = true := by
  exact PDIC.connected_graphMixedCount_three_iff_pattern adj hc

#print axioms PDICSubmission.connected_mixed_bound
#print axioms PDICSubmission.connected_mixed_equality

end PDICSubmission
