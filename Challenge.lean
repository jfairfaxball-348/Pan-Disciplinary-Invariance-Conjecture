module
public import Mathlib

public section

/-!
# Sharp mixed maximal-independent-set bounds in balanced bipartite graphs

For every Boolean 4-by-4 incidence matrix A, form the **actual simple graph**
on the disjoint union of four left and four right vertices, with an edge
(inl i)-(inr j) exactly when A i j is true.

The numerical invariant B(A) counts distinct **vertex sets** that are maximal
independent, and contain exactly two left and two right vertices. "Maximal"
means inclusion-maximal, NOT maximum cardinality.

When this eight-vertex graph is connected, B(A) is at most 3. Equality holds
precisely for the explicitly defined row- or column-centred seven-edge spider
matrix pattern. This certificate DOES NOT prove the paper's full distribution
for randomly labelled eight-caps, or a named graph-isomorphism classification.
-/

namespace PDIC

abbrev Side := Fin 4

abbrev SplitVertex := Side ⊕ Side

def matrixGraph (adj : Side → Side → Bool) : SimpleGraph SplitVertex where
  Adj u v := match u, v with
    | .inl i, .inr j => adj i j = true
    | .inr j, .inl i => adj i j = true
    | _, _ => False
  symm.symm := by intro u v; cases u <;> cases v <;> simp_all
  loopless.irrefl := by intro u; cases u <;> simp

/-- Independence and domination are the usual exact finite MIS criterion. -/
def GraphMIS {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
  (∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v) ∧
    (∀ v, v ∉ s → ∃ u ∈ s, G.Adj v u)

/-- Actual graph witnesses, represented as vertex sets rather than row pairs. -/
noncomputable def graphMixedCount (adj : Side → Side → Bool) : ℕ := by
  classical
  exact Fintype.card {s : Finset SplitVertex //
    s.toLeft.card = 2 ∧ s.toRight.card = 2 ∧ GraphMIS (matrixGraph adj) s}

/-! An explicitly readable seven-edge row/column spider pattern.
A row hub has degree four and the other three rows have distinct degree-one
neighbours; either orientation is admitted. -/
def oneNeighbourBV (v : BitVec 4) : Bool :=
  (v == 1) || (v == 2) || (v == 4) || (v == 8)

def threeDistinctLeavesBV (x y z : BitVec 4) : Bool :=
  oneNeighbourBV x && oneNeighbourBV y && oneNeighbourBV z &&
  (x != y) && (x != z) && (y != z)

def spiderHubRowsBV (a b c d : BitVec 4) : Bool :=
  ((a == 15) && threeDistinctLeavesBV b c d) ||
  ((b == 15) && threeDistinctLeavesBV a c d) ||
  ((c == 15) && threeDistinctLeavesBV a b d) ||
  ((d == 15) && threeDistinctLeavesBV a b c)

def columnOfRowsBV (a b c d : BitVec 4) (j : Nat) : BitVec 4 :=
  (if a.getLsbD j then 1 else 0) +
  (if b.getLsbD j then 2 else 0) +
  (if c.getLsbD j then 4 else 0) +
  (if d.getLsbD j then 8 else 0)

def spiderMatrixBV (a b c d : BitVec 4) : Bool :=
  spiderHubRowsBV a b c d ||
  spiderHubRowsBV
    (columnOfRowsBV a b c d 0)
    (columnOfRowsBV a b c d 1)
    (columnOfRowsBV a b c d 2)
    (columnOfRowsBV a b c d 3)

def encodeFourBools (p q r s : Bool) : BitVec 4 :=
  (if p then 1 else 0) ||| (if q then 2 else 0) |||
    (if r then 4 else 0) ||| (if s then 8 else 0)

def rowsOfAdj (adj : Side → Side → Bool) (i : Side) : BitVec 4 :=
  encodeFourBools (adj i 0) (adj i 1) (adj i 2) (adj i 3)

end PDIC

namespace PDICSubmission

/-- A connected 4+4 matrix graph has at most three distinct 2+2
maximal independent vertex sets (not merely encoded row-pair witnesses). -/
theorem connected_mixed_bound (adj : PDIC.Side → PDIC.Side → Bool)
    (hc : (PDIC.matrixGraph adj).Connected) :
    PDIC.graphMixedCount adj ≤ 3 := by
  sorry

/-- Sharpness: equality in the actual mixed-MIS count is equivalent to
the explicitly encoded row- or column-centred spider *matrix pattern*.
This statement does not assert graph isomorphism to a named tree. -/
theorem connected_mixed_equality (adj : PDIC.Side → PDIC.Side → Bool)
    (hc : (PDIC.matrixGraph adj).Connected) :
    PDIC.graphMixedCount adj = 3 ↔
      PDIC.spiderMatrixBV (PDIC.rowsOfAdj adj 0) (PDIC.rowsOfAdj adj 1)
        (PDIC.rowsOfAdj adj 2) (PDIC.rowsOfAdj adj 3) = true := by
  sorry

end PDICSubmission
