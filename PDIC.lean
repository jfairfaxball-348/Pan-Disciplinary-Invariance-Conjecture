import Mathlib

/-!
# PDIC: finite quartet incidence, labelled spider, and moment inversion

All objects are explicit finite data. The assertions are discharged by Lean's
kernel-checked `decide` or algebraic tactics. In particular, no theorem in
this file assumes the nine-cap classification or universal graph extremality.
-/

namespace PDIC

abbrev Vertex := Fin 8
abbrev QuartetIndex := Fin 4

def quartet (i : QuartetIndex) : Finset Vertex :=
  if i = 0 then {0, 1, 4, 5}
  else if i = 1 then {0, 1, 6, 7}
  else if i = 2 then {2, 3, 4, 5}
  else {2, 3, 6, 7}

theorem quartet_card : ∀ i : QuartetIndex, (quartet i).card = 4 := by
  decide

theorem quartet_pair_intersections :
    ∀ i j : QuartetIndex,
      (quartet i ∩ quartet j).card = 0 ∨
      (quartet i ∩ quartet j).card = 2 ∨
      (quartet i ∩ quartet j).card = 4 := by
  decide

theorem quartet_no_odd_pair_overlap :
    ∀ i j : QuartetIndex,
      (quartet i ∩ quartet j).card ≠ 1 ∧
      (quartet i ∩ quartet j).card ≠ 3 := by
  decide

theorem quartet_disjoint_ordered_pairs :
    ((Finset.univ : Finset (QuartetIndex × QuartetIndex)).filter
      (fun p => (quartet p.1 ∩ quartet p.2).card = 0)).card = 4 := by
  decide

theorem quartet_two_overlap_ordered_pairs :
    ((Finset.univ : Finset (QuartetIndex × QuartetIndex)).filter
      (fun p => (quartet p.1 ∩ quartet p.2).card = 2)).card = 8 := by
  decide

theorem quartet_triple_joint_incidence :
    ((Finset.univ : Finset (QuartetIndex × QuartetIndex × QuartetIndex)).filter
      (fun t => (quartet t.1 ∩ quartet t.2.1).card = 0 ∧
        (quartet t.1 ∩ quartet t.2.2).card = 2 ∧
        (quartet t.2.1 ∩ quartet t.2.2).card = 2)).card = 8 := by
  decide

/- An actual labelled eight-point quadratic cap over F_3. -/
def canonicalCap (v : Vertex) : Fin 3 → ℕ :=
  match v.val with
  | 0 => ![1, 0, 1]
  | 1 => ![2, 0, 1]
  | 2 => ![0, 1, 1]
  | 3 => ![0, 2, 1]
  | 4 => ![1, 1, 2]
  | 5 => ![2, 2, 2]
  | 6 => ![1, 2, 2]
  | 7 => ![2, 1, 2]
  | _ => ![0, 0, 0]

def chargeZeroBool (s : Finset Vertex) : Bool :=
  decide (((∑ v ∈ s, canonicalCap v 0) % 3) = 0) &&
  decide (((∑ v ∈ s, canonicalCap v 1) % 3) = 0) &&
  decide (((∑ v ∈ s, canonicalCap v 2) % 3) = 0)

def chargeZero (s : Finset Vertex) : Prop := chargeZeroBool s = true

theorem canonical_quartets_zero :
    ∀ i : QuartetIndex, chargeZeroBool (quartet i) = true := by
  decide

theorem canonical_four_zero_iff :
    ∀ s : Finset Vertex, s.card = 4 →
      (chargeZeroBool s = true ↔ ∃ i : QuartetIndex, quartet i = s) := by
  decide

/- The spider S(2,2,2,1): hub 0, neighbours 4,5,6,7,
   additional edges 1--6, 2--5, 3--4. -/
def spiderAdj (u v : Vertex) : Bool :=
  decide ((u = 0 ∧ (v = 4 ∨ v = 5 ∨ v = 6 ∨ v = 7)) ∨
          (v = 0 ∧ (u = 4 ∨ u = 5 ∨ u = 6 ∨ u = 7)) ∨
          (u = 1 ∧ v = 6) ∨ (u = 6 ∧ v = 1) ∨
          (u = 2 ∧ v = 5) ∨ (u = 5 ∧ v = 2) ∨
          (u = 3 ∧ v = 4) ∨ (u = 4 ∧ v = 3))

def IsMIS4 (adj : Vertex → Vertex → Bool) (s : Finset Vertex) : Prop :=
  s.card = 4 ∧
  (∀ u ∈ s, ∀ v ∈ s, adj u v = false) ∧
  (∀ v : Vertex, v ∉ s → ∃ u ∈ s, adj v u = true)

/- A computable Boolean implementation, deliberately distinct from the
   paper-level Prop specification IsMIS4 until correspondence is proved. -/
def allVertices : List Vertex := [0, 1, 2, 3, 4, 5, 6, 7]

def isMIS4Bool (adj : Vertex → Vertex → Bool) (s : Finset Vertex) : Bool :=
  (s.card == 4) &&
  allVertices.all
    (fun u => allVertices.all
      (fun v => !(decide (u ∈ s) && decide (v ∈ s)) || !(adj u v))) &&
  allVertices.all
    (fun v => decide (v ∈ s) ||
      allVertices.any (fun u => decide (u ∈ s) && adj v u))

def mis4Count (adj : Vertex → Vertex → Bool) : ℕ :=
  ((Finset.univ : Finset (Finset Vertex)).filter
    (fun s => isMIS4Bool adj s = true)).card

def mixedMisCount (adj : Vertex → Vertex → Bool) : ℕ :=
  ((Finset.univ : Finset (Finset Vertex)).filter
    (fun s => isMIS4Bool adj s = true ∧
      (s.filter (fun (v : Vertex) => v.val < 4)).card = 2)).card

theorem spider_mis4_count : mis4Count spiderAdj = 9 := by
  decide

theorem spider_mixed_mis_count : mixedMisCount spiderAdj = 3 := by
  decide

/- Exact binomial-moment inversion when N_0 is supported in {0,1,2,3}. -/
theorem four_point_moment_inversion
    (p0 p1 p2 p3 M1 M2 M3 : ℚ)
    (hnorm : p0 + p1 + p2 + p3 = 1)
    (hm1 : p1 + 2 * p2 + 3 * p3 = M1)
    (hm2 : p2 + 3 * p3 = M2)
    (hm3 : p3 = M3) :
    p0 = 1 - M1 + M2 - M3 ∧
    p1 = M1 - 2 * M2 + 3 * M3 ∧
    p2 = M2 - 3 * M3 ∧ p3 = M3 := by
  constructor
  · linarith
  constructor
  · linarith
  constructor
  · linarith
  · exact hm3

theorem spider_sharp_rational_identity :
    (3 : ℚ) / 315 = 1 / 105 := by
  norm_num

#print axioms PDIC.quartet_triple_joint_incidence
#print axioms PDIC.canonical_four_zero_iff
#print axioms PDIC.spider_mixed_mis_count
#print axioms PDIC.four_point_moment_inversion

end PDIC
