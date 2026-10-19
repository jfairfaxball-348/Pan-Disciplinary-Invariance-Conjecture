module

public import Mathlib

section

/-!
# PDIC: finite quartet incidence, labelled spider, and moment inversion

All objects are explicit finite data. The assertions are discharged by Lean's
kernel-checked `decide` or algebraic tactics. In particular, no theorem in
this file assumes the nine-cap classification or universal graph extremality.
-/

namespace PDIC

public abbrev Vertex := Fin 8
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

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
theorem canonical_four_zero_iff :
    ∀ s : Finset Vertex, s.card = 4 →
      (chargeZeroBool s = true ↔ ∃ i : QuartetIndex, quartet i = s) := by
  decide

/- The spider S(2,2,2,1): hub 0, neighbours 4,5,6,7,
   additional edges 1--6, 2--5, 3--4. -/
public def spiderAdj (u v : Vertex) : Bool :=
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


/- Every element of Fin 8 appears in the executable vertex list. -/
private theorem allVertices_complete (v : Vertex) : v ∈ allVertices := by
  fin_cases v <;> decide

private theorem independent_check_iff
    (adj : Vertex → Vertex → Bool) (s : Finset Vertex) (u v : Vertex) :
    (!(decide (u ∈ s) && decide (v ∈ s)) || !(adj u v)) = true ↔
      (u ∈ s → v ∈ s → adj u v = false) := by
  by_cases hu : u ∈ s <;> by_cases hv : v ∈ s <;>
    cases he : adj u v <;> simp [hu, hv, he]

private theorem maximal_check_iff
    (adj : Vertex → Vertex → Bool) (s : Finset Vertex) (v : Vertex) :
    (decide (v ∈ s) ||
      allVertices.any (fun u => decide (u ∈ s) && adj v u)) = true ↔
      (v ∉ s → ∃ u ∈ s, adj v u = true) := by
  by_cases hv : v ∈ s
  · simp [hv]
  · simp [hv, List.any_eq_true, allVertices_complete]

/-- The executable MIS test has exactly the paper-level semantics for every
    adjacency function, even without assuming symmetry or irreflexivity. -/
theorem isMIS4Bool_iff_IsMIS4
    (adj : Vertex → Vertex → Bool) (s : Finset Vertex) :
    isMIS4Bool adj s = true ↔ IsMIS4 adj s := by
  simp [isMIS4Bool, IsMIS4, allVertices_complete,
    independent_check_iff, maximal_check_iff, List.all_eq_true]
  constructor
  · rintro ⟨⟨hc, hi⟩, hm⟩
    refine ⟨hc, ?_, ?_⟩
    · intro u hu v hv
      have h := hi u v
      rcases h with h | h
      · rcases h with h | h
        · exact False.elim (h hu)
        · exact False.elim (h hv)
      · exact h
    · intro v hv
      rcases hm v with hv' | h
      · exact False.elim (hv hv')
      · rcases h with ⟨u, hu, hed⟩
        exact ⟨u, hu, hed⟩
  · rintro ⟨hc, hi, hm⟩
    constructor
    · constructor
      · exact hc
      · intro u v
        by_cases hu : u ∈ s
        · by_cases hv : v ∈ s
          · exact Or.inr (hi u hu v hv)
          · exact Or.inl (Or.inr hv)
        · exact Or.inl (Or.inl hu)
    · intro v
      by_cases hv : v ∈ s
      · exact Or.inl hv
      · exact Or.inr (hm v hv)


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

/- Classical finite-set presentation of the paper-level predicate.  The
   Boolean implementation below remains the computable witness certificate. -/
noncomputable def propMis4Count (adj : Vertex → Vertex → Bool) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Vertex)).filter
    (fun s => IsMIS4 adj s)).card

noncomputable def propMixedMis4Count (adj : Vertex → Vertex → Bool) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Vertex)).filter
    (fun s => IsMIS4 adj s ∧
      (s.filter (fun v : Vertex => v.val < 4)).card = 2)).card

theorem propMis4Count_eq_mis4Count
    (adj : Vertex → Vertex → Bool) :
    propMis4Count adj = mis4Count adj := by
  classical
  simp [propMis4Count, mis4Count, isMIS4Bool_iff_IsMIS4]

theorem propMixedMis4Count_eq_mixedMisCount
    (adj : Vertex → Vertex → Bool) :
    propMixedMis4Count adj = mixedMisCount adj := by
  classical
  simp [propMixedMis4Count, mixedMisCount, isMIS4Bool_iff_IsMIS4]

theorem spider_prop_mis4_count : propMis4Count spiderAdj = 9 := by
  rw [propMis4Count_eq_mis4Count]
  exact spider_mis4_count

theorem spider_prop_mixed_mis_count :
    propMixedMis4Count spiderAdj = 3 := by
  rw [propMixedMis4Count_eq_mixedMisCount]
  exact spider_mixed_mis_count

/-- A conditional arithmetic bridge. The nontrivial hypothesis h ≤ 3
    must still be supplied by a separate universal graph theorem. -/
theorem sharp_probability_from_h (h : ℕ) (hh : h ≤ 3) :
    (h : ℚ) / 315 ≤ 1 / 105 ∧
      ((h : ℚ) / 315 = 1 / 105 ↔ h = 3) := by
  have hq : (h : ℚ) ≤ 3 := by
    exact_mod_cast hh
  constructor
  · linarith
  · constructor
    · intro he
      have hx : (h : ℚ) = 3 := by linarith
      exact_mod_cast hx
    · intro he
      subst h
      norm_num

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

#print axioms PDIC.isMIS4Bool_iff_IsMIS4
#print axioms PDIC.propMis4Count_eq_mis4Count
#print axioms PDIC.propMixedMis4Count_eq_mixedMisCount
#print axioms PDIC.spider_prop_mis4_count
#print axioms PDIC.spider_prop_mixed_mis_count
#print axioms PDIC.sharp_probability_from_h
#print axioms PDIC.quartet_triple_joint_incidence
#print axioms PDIC.canonical_four_zero_iff
#print axioms PDIC.spider_mixed_mis_count
#print axioms PDIC.four_point_moment_inversion

/- S003R2: universal 4+4 bipartite neighbourhood/complement semantics.
   This result holds for ANY rectangular Boolean adjacency function;
   no degree assumptions, 65,536-matrix enumeration or special spider
   are used in its proof. -/
abbrev Side := Fin 4

def sideNeighbours (adj : Side → Side → Bool) (X : Finset Side) : Finset Side :=
  Finset.univ.filter (fun j => ∃ i ∈ X, adj i j = true)

theorem mem_sideNeighbours_iff
    (adj : Side → Side → Bool) (X : Finset Side) (j : Side) :
    j ∈ sideNeighbours adj X ↔ ∃ i ∈ X, adj i j = true := by
  simp [sideNeighbours]

def IsMixedMIS (adj : Side → Side → Bool)
    (X Y : Finset Side) : Prop :=
  X.card = 2 ∧ Y.card = 2 ∧
  (∀ i ∈ X, ∀ j ∈ Y, adj i j = false) ∧
  (∀ i : Side, i ∉ X → ∃ j ∈ Y, adj i j = true) ∧
  (∀ j : Side, j ∉ Y → ∃ i ∈ X, adj i j = true)

/-- Any mixed maximal independent set has a UNIQUE opposite-side pair,
    namely the complement of the full neighbourhood of its left pair.
    No finite case checking or graph connectivity is used. -/
theorem mixed_opposite_unique
    (adj : Side → Side → Bool) (X Y : Finset Side)
    (h : IsMixedMIS adj X Y) :
    Y = Finset.univ \ sideNeighbours adj X := by
  rcases h with ⟨_, _, hInd, _, hDomB⟩
  apply Finset.ext
  intro j
  simp only [Finset.mem_sdiff, Finset.mem_univ, true_and]
  constructor
  · intro hj hn
    rcases (mem_sideNeighbours_iff adj X j).mp hn with ⟨i, hi, he⟩
    have hf := hInd i hi j hj
    simp [hf] at he
  · intro hn
    by_contra hnot
    rcases hDomB j hnot with ⟨i, hi, he⟩
    exact hn ((mem_sideNeighbours_iff adj X j).mpr ⟨i, hi, he⟩)

/-- Four-by-four pair test, without any unproved enumeration oracle:
    each mixed four-MIS is determined by its left two-set, and the
    remaining domination condition is precisely the condition below. -/
theorem mixed_iff_complement_criterion
    (adj : Side → Side → Bool) (X Y : Finset Side) :
    IsMixedMIS adj X Y ↔
      X.card = 2 ∧ Y.card = 2 ∧
      Y = Finset.univ \ sideNeighbours adj X ∧
      (∀ i : Side, i ∉ X → ∃ j ∈ Y, adj i j = true) := by
  constructor
  · intro h
    rcases h with ⟨hX, hY, hInd, hDomA, hDomB⟩
    exact ⟨hX, hY,
      mixed_opposite_unique adj X Y ⟨hX, hY, hInd, hDomA, hDomB⟩,
      hDomA⟩
  · rintro ⟨hX, hY, hEq, hDomA⟩
    refine ⟨hX, hY, ?_, hDomA, ?_⟩
    · intro i hi j hj
      have hjC : j ∈ Finset.univ \ sideNeighbours adj X := by
        rw [← hEq]
        exact hj
      have hnot : j ∉ sideNeighbours adj X := by
        simpa using hjC
      cases he : adj i j with
      | false => rfl
      | true =>
          exact False.elim (hnot ((mem_sideNeighbours_iff adj X j).mpr
            ⟨i, hi, he⟩))
    · intro j hj
      have hn : j ∈ sideNeighbours adj X := by
        by_contra hnot
        apply hj
        rw [hEq]
        simp [hnot]
      exact (mem_sideNeighbours_iff adj X j).mp hn

theorem mixed_left_pair_injective
    (adj : Side → Side → Bool) (X Y Z : Finset Side)
    (hY : IsMixedMIS adj X Y) (hZ : IsMixedMIS adj X Z) : Y = Z := by
  rw [mixed_opposite_unique adj X Y hY, mixed_opposite_unique adj X Z hZ]

#print axioms PDIC.mixed_opposite_unique
#print axioms PDIC.mixed_iff_complement_criterion
#print axioms PDIC.mixed_left_pair_injective

/- A bitvector presentation of ALL 4×4 Boolean matrices: the four BitVec 4
   inputs are exactly their rows. Its six pair tests use the above unique
   complement criterion. A checked SAT/LRAT certificate, rather than a Python
   enumeration, is sought for the six-edge extremal theorem. -/
def twoNeighboursBV (v : BitVec 4) : Bool :=
  (v == 3) || (v == 5) || (v == 6) ||
  (v == 9) || (v == 10) || (v == 12)

def goodLeftPairBV (x y z w : BitVec 4) : Bool :=
  let n := x ||| y
  twoNeighboursBV n &&
    ((z &&& (~~~n)) != 0) &&
    ((w &&& (~~~n)) != 0)

def fourRowMixedCountBV (a b c d : BitVec 4) : BitVec 3 :=
  (if goodLeftPairBV a b c d then 1 else 0) +
  (if goodLeftPairBV a c b d then 1 else 0) +
  (if goodLeftPairBV a d b c then 1 else 0) +
  (if goodLeftPairBV b c a d then 1 else 0) +
  (if goodLeftPairBV b d a c then 1 else 0) +
  (if goodLeftPairBV c d a b then 1 else 0)

def fourBitPopCount5 (v : BitVec 4) : BitVec 5 :=
  (if v.getLsbD 0 then 1 else 0) +
  (if v.getLsbD 1 then 1 else 0) +
  (if v.getLsbD 2 then 1 else 0) +
  (if v.getLsbD 3 then 1 else 0)

def fourRowEdgeCountBV (a b c d : BitVec 4) : BitVec 5 :=
  fourBitPopCount5 a + fourBitPopCount5 b +
  fourBitPopCount5 c + fourBitPopCount5 d

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
/-- A universal 16-Boolean-variable, verified-bitblasting formulation:
    four or more qualifying mixed pairs force at most five edges. -/
theorem four_by_four_six_edge_threshold_BV
    (a b c d : BitVec 4) :
    (4 : BitVec 3) ≤ fourRowMixedCountBV a b c d →
      fourRowEdgeCountBV a b c d ≤ (5 : BitVec 5) := by
  revert a b c d
  decide +kernel

#print axioms PDIC.four_by_four_six_edge_threshold_BV

/- S003R2 seven-edge equality certificate: a spider matrix is a row-hub
   with three different unit rows, or its transpose. Both orientations
   are included explicitly; connectivity is not assumed. -/
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

set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
/-- Exactly seven edges and exactly three mixed-MIS left-pair witnesses
    hold iff the matrix is a spider in one of the two orientations.
    Kernel reduction certifies the COMPLETE 16-bit finite theorem. -/
theorem seven_edge_three_iff_spider_BV (a b c d : BitVec 4) :
    (fourRowEdgeCountBV a b c d = (7 : BitVec 5) ∧
      fourRowMixedCountBV a b c d = (3 : BitVec 3)) ↔
        spiderMatrixBV a b c d = true := by
  revert a b c d
  decide +kernel

#print axioms PDIC.seven_edge_three_iff_spider_BV


/- S003R3: a lossless encoding for EVERY 4×4 Boolean adjacency, without
   appealing to an unchecked assignment of BitVec rows. -/
def encodeFourBools (p q r s : Bool) : BitVec 4 :=
  (if p then 1 else 0) ||| (if q then 2 else 0) |||
    (if r then 4 else 0) ||| (if s then 8 else 0)

set_option maxRecDepth 4096 in
theorem encodeFourBools_get (p q r s : Bool) (j : Side) :
    (encodeFourBools p q r s).getLsbD j.val =
      (if j = 0 then p else if j = 1 then q else if j = 2 then r else s) := by
  revert p q r s j
  decide +kernel

def rowsOfAdj (adj : Side → Side → Bool) (i : Side) : BitVec 4 :=
  encodeFourBools (adj i 0) (adj i 1) (adj i 2) (adj i 3)

def adjOfRows (rows : Side → BitVec 4) (i j : Side) : Bool :=
  (rows i).getLsbD j.val

theorem rowsOfAdj_get (adj : Side → Side → Bool) (i j : Side) :
    (rowsOfAdj adj i).getLsbD j.val = adj i j := by
  unfold rowsOfAdj
  rw [encodeFourBools_get]
  fin_cases j <;> rfl

/-- The row encoder has a *proved* left inverse: no 4×4 adjacency data
    are lost or introduced by the BitVec representation. -/
theorem adjOfRows_rowsOfAdj (adj : Side → Side → Bool) :
    adjOfRows (rowsOfAdj adj) = adj := by
  funext i j
  exact rowsOfAdj_get adj i j

theorem rowsOfAdj_injective :
    Function.Injective rowsOfAdj := by
  intro adj₁ adj₂ h
  have hh := congrArg adjOfRows h
  simpa [adjOfRows_rowsOfAdj] using hh

/- This is the *actual* existential mixed-MIS left-pair predicate.
   The earlier unique-opposite-side theorem turns it into a
   quantifier-free-in-Y cardinality formula for arbitrary adjacency. -/
def mixedPairCriterion (adj : Side → Side → Bool) (X : Finset Side) : Prop :=
  X.card = 2 ∧
  (Finset.univ \ sideNeighbours adj X).card = 2 ∧
  (∀ i : Side, i ∉ X →
    ∃ j ∈ (Finset.univ \ sideNeighbours adj X), adj i j = true)

theorem exists_mixed_iff_criterion (adj : Side → Side → Bool)
    (X : Finset Side) :
    (∃ Y : Finset Side, IsMixedMIS adj X Y) ↔
      mixedPairCriterion adj X := by
  constructor
  · rintro ⟨Y, h⟩
    obtain ⟨hx, hy, hEq, hDom⟩ :=
      (mixed_iff_complement_criterion adj X Y).mp h
    refine ⟨hx, ?_, ?_⟩
    · simpa only [← hEq] using hy
    · simpa only [← hEq] using hDom
  · rintro ⟨hx, hy, hDom⟩
    exact ⟨Finset.univ \ sideNeighbours adj X,
      (mixed_iff_complement_criterion adj X _).mpr ⟨hx, hy, rfl, hDom⟩⟩

noncomputable def actualMixedLeftPairCount (adj : Side → Side → Bool) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Side)).filter
    (fun X => ∃ Y : Finset Side, IsMixedMIS adj X Y)).card

noncomputable def mixedCriterionCount (adj : Side → Side → Bool) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Side)).filter
    (fun X => mixedPairCriterion adj X)).card

/-- Cardinality-level, rather than merely pointwise, witness bridge.
    Each eligible left pair corresponds to exactly one mixed MIS (by
    mixed_left_pair_injective), and this count is its exact criterion count. -/
theorem actualMixedLeftPairCount_eqCriterion (adj : Side → Side → Bool) :
    actualMixedLeftPairCount adj = mixedCriterionCount adj := by
  classical
  unfold actualMixedLeftPairCount mixedCriterionCount
  apply congrArg Finset.card
  ext X
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  exact exists_mixed_iff_criterion adj X

theorem encoded_mixed_left_count (adj : Side → Side → Bool) :
    actualMixedLeftPairCount (adjOfRows (rowsOfAdj adj)) =
      mixedCriterionCount adj := by
  rw [adjOfRows_rowsOfAdj]
  exact actualMixedLeftPairCount_eqCriterion adj

#print axioms PDIC.encodeFourBools_get
#print axioms PDIC.adjOfRows_rowsOfAdj
#print axioms PDIC.rowsOfAdj_injective
#print axioms PDIC.exists_mixed_iff_criterion
#print axioms PDIC.actualMixedLeftPairCount_eqCriterion
#print axioms PDIC.encoded_mixed_left_count


set_option maxRecDepth 16384 in
set_option maxHeartbeats 0 in
/-- An extra universal extremal exclusion needed to pass from the
    seven-edge equality theorem to arbitrary connected balanced graphs.
    At least eight bipartite edges leave at most two mixed-MIS pairs. -/
theorem eight_edges_at_most_two_mixed_BV (a b c d : BitVec 4) :
    (8 : BitVec 5) ≤ fourRowEdgeCountBV a b c d →
      fourRowMixedCountBV a b c d ≤ (2 : BitVec 3) := by
  revert a b c d
  decide +kernel

#print axioms PDIC.eight_edges_at_most_two_mixed_BV

end PDIC


namespace PDIC

/- S003R4 constructive, executable pairwise criterion; no classical
   proposition-decider is hidden in a Boolean finite census. -/
def allSides : List Side := [0, 1, 2, 3]

private theorem allSides_complete (i : Side) : i ∈ allSides := by
  fin_cases i <;> decide

def leftDominationBool (adj : Side → Side → Bool)
    (X Y : Finset Side) : Bool :=
  allSides.all (fun i => decide (i ∈ X) ||
    allSides.any (fun j => decide (j ∈ Y) && adj i j))

private theorem leftDominationBool_iff (adj : Side → Side → Bool)
    (X Y : Finset Side) :
    leftDominationBool adj X Y = true ↔
      (∀ i : Side, i ∉ X → ∃ j ∈ Y, adj i j = true) := by
  simp only [leftDominationBool, List.all_eq_true, List.any_eq_true,
    Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq]
  constructor
  · intro h i hi
    rcases h i (allSides_complete i) with hx | he
    · exact False.elim (hi hx)
    · rcases he with ⟨j, _, hj, hv⟩
      exact ⟨j, hj, hv⟩
  · intro h i _
    by_cases hi : i ∈ X
    · exact Or.inl hi
    · rcases h i hi with ⟨j, hj, hv⟩
      exact Or.inr ⟨j, allSides_complete j, hj, hv⟩

def mixedPairCriterionBool (adj : Side → Side → Bool)
    (X : Finset Side) : Bool :=
  decide (X.card = 2) &&
    decide ((Finset.univ \ sideNeighbours adj X).card = 2) &&
    leftDominationBool adj X (Finset.univ \ sideNeighbours adj X)

theorem mixedPairCriterionBool_iff (adj : Side → Side → Bool)
    (X : Finset Side) :
    mixedPairCriterionBool adj X = true ↔
      mixedPairCriterion adj X := by
  simp [mixedPairCriterionBool, mixedPairCriterion,
    Bool.and_eq_true, decide_eq_true_eq, leftDominationBool_iff, and_assoc]

def computableMixedLeftPairCount (adj : Side → Side → Bool) : ℕ :=
  ((Finset.univ : Finset (Finset Side)).filter
    (fun X => mixedPairCriterionBool adj X = true)).card

theorem computableMixedLeftPairCount_eq_actual
    (adj : Side → Side → Bool) :
    computableMixedLeftPairCount adj = actualMixedLeftPairCount adj := by
  classical
  unfold computableMixedLeftPairCount actualMixedLeftPairCount
  apply congrArg Finset.card
  ext X
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  rw [mixedPairCriterionBool_iff]
  exact (exists_mixed_iff_criterion adj X).symm

#print axioms PDIC.computableMixedLeftPairCount_eq_actual

end PDIC

namespace PDIC

/-! S003R5: replace universal 65,536-matrix semantic reductions with
    small kernel obligations.  The global count bridge is deliberately
    NOT asserted until an efficient compositional proof is checked. -/

/-- The semantic edge count, one edge per oriented left/right pair. -/
def actualMatrixEdgeCount (adj : Side → Side → Bool) : ℕ :=
  ((Finset.univ : Finset (Side × Side)).filter
    (fun ij => adj ij.1 ij.2 = true)).card

set_option maxRecDepth 4096 in
/-- A four-bit row has exactly the advertised number of set positions.
    Sixteen possible row masks; unlike the previous global decide, this
    calculation is confined to one row. -/
theorem fourBitPopCount5_eq_rowCard (v : BitVec 4) :
    (fourBitPopCount5 v).toNat =
      ((Finset.univ : Finset Side).filter
        (fun j => v.getLsbD j.val = true)).card := by
  revert v
  decide +kernel

set_option maxRecDepth 4096 in
theorem twoNeighboursBV_eq_rowCard_two (v : BitVec 4) :
    (twoNeighboursBV v = true ↔
      ((Finset.univ : Finset Side).filter
        (fun j => v.getLsbD j.val = true)).card = 2) := by
  revert v
  decide +kernel

set_option maxRecDepth 4096 in
/-- Bitwise nonzero intersection with the complement has a genuine
    witness column. This is one component of the six-pair bridge. -/
theorem outsideMask_nonzero_iff (n z : BitVec 4) :
    ((z &&& (~~~n)) != 0) = true ↔
      ∃ j : Side, z.getLsbD j.val = true ∧ n.getLsbD j.val = false := by
  revert n z
  decide +kernel

#print axioms PDIC.computableMixedLeftPairCount_eq_actual
#print axioms PDIC.fourBitPopCount5_eq_rowCard
#print axioms PDIC.twoNeighboursBV_eq_rowCard_two
#print axioms PDIC.outsideMask_nonzero_iff

end PDIC


namespace PDIC

set_option maxRecDepth 4096

/-! S003R6: compositional local witnesses and bounded arithmetic.
    All local test domains below are at most 1024 cases, rather than
    the full 65536 adjacency matrices with nested finite-set semantics. -/

/-- A bit of an OR-mask is set exactly when it is set in either operand. -/
theorem orMask_getLsbD_iff (x y : BitVec 4) (j : Side) :
    (x ||| y).getLsbD j.val = true ↔
      x.getLsbD j.val = true ∨ y.getLsbD j.val = true := by
  revert x y j
  decide +kernel

/-- One good-left-pair test has exact neighbourhood, size and
    outside-neighbour witness semantics; this is not a global census. -/
theorem goodLeftPairBV_spec (x y z w : BitVec 4) :
    goodLeftPairBV x y z w = true ↔
      ((Finset.univ : Finset Side).filter
        (fun j => (x ||| y).getLsbD j.val = true)).card = 2 ∧
      (∃ j : Side, z.getLsbD j.val = true ∧
        (x ||| y).getLsbD j.val = false) ∧
      (∃ j : Side, w.getLsbD j.val = true ∧
        (x ||| y).getLsbD j.val = false) := by
  simp only [goodLeftPairBV, Bool.and_eq_true,
    twoNeighboursBV_eq_rowCard_two, outsideMask_nonzero_iff, and_assoc]

/-- Every two-subset of Fin 4 appears exactly once in the explicit six. -/
def sidePairsSix : Finset (Finset Side) :=
  {({0,1} : Finset Side), ({0,2} : Finset Side),
   ({0,3} : Finset Side), ({1,2} : Finset Side),
   ({1,3} : Finset Side), ({2,3} : Finset Side)}

theorem sidePairsSix_eq_filter :
    sidePairsSix =
      ((Finset.univ : Finset (Finset Side)).filter (fun X => X.card = 2)) := by
  decide

theorem sidePairsSix_card : sidePairsSix.card = 6 := by
  decide

/-- Six zero-one summands fit exactly in three bits. -/
theorem sixBooleanIndicatorCount (p q r s t u : Bool) :
    ((if p then (1 : BitVec 3) else 0) +
      (if q then (1 : BitVec 3) else 0) +
      (if r then (1 : BitVec 3) else 0) +
      (if s then (1 : BitVec 3) else 0) +
      (if t then (1 : BitVec 3) else 0) +
      (if u then (1 : BitVec 3) else 0)).toNat =
      (if p then (1 : ℕ) else 0) +
      (if q then (1 : ℕ) else 0) +
      (if r then (1 : ℕ) else 0) +
      (if s then (1 : ℕ) else 0) +
      (if t then (1 : ℕ) else 0) +
      (if u then (1 : ℕ) else 0) := by
  revert p q r s t u
  decide +kernel

theorem fourRowMixedCountBV_eq_sixNat (a b c d : BitVec 4) :
    (fourRowMixedCountBV a b c d).toNat =
      (if goodLeftPairBV a b c d then (1 : ℕ) else 0) +
      (if goodLeftPairBV a c b d then (1 : ℕ) else 0) +
      (if goodLeftPairBV a d b c then (1 : ℕ) else 0) +
      (if goodLeftPairBV b c a d then (1 : ℕ) else 0) +
      (if goodLeftPairBV b d a c then (1 : ℕ) else 0) +
      (if goodLeftPairBV c d a b then (1 : ℕ) else 0) := by
  unfold fourRowMixedCountBV
  exact sixBooleanIndicatorCount _ _ _ _ _ _

/-- Each row popcount is at most four. -/
theorem fourBitPopCount5_le_four (v : BitVec 4) :
    (fourBitPopCount5 v).toNat ≤ 4 := by
  revert v
  decide +kernel

/-- Adding four 0..4 counts in five bits cannot overflow. -/
theorem fourSmallBVSum_noOverflow (a b c d : BitVec 5)
    (ha : a.toNat ≤ 4) (hb : b.toNat ≤ 4)
    (hc : c.toNat ≤ 4) (hd : d.toNat ≤ 4) :
    (a + b + c + d).toNat = a.toNat + b.toNat + c.toNat + d.toNat := by
  simp only [BitVec.toNat_add]
  omega

theorem fourRowEdgeCountBV_eq_fourPopNat (a b c d : BitVec 4) :
    (fourRowEdgeCountBV a b c d).toNat =
      (fourBitPopCount5 a).toNat + (fourBitPopCount5 b).toNat +
      (fourBitPopCount5 c).toNat + (fourBitPopCount5 d).toNat := by
  unfold fourRowEdgeCountBV
  exact fourSmallBVSum_noOverflow _ _ _ _
    (fourBitPopCount5_le_four a) (fourBitPopCount5_le_four b)
    (fourBitPopCount5_le_four c) (fourBitPopCount5_le_four d)

#print axioms PDIC.orMask_getLsbD_iff
#print axioms PDIC.goodLeftPairBV_spec
#print axioms PDIC.sidePairsSix_eq_filter
#print axioms PDIC.sixBooleanIndicatorCount
#print axioms PDIC.fourRowMixedCountBV_eq_sixNat
#print axioms PDIC.fourSmallBVSum_noOverflow
#print axioms PDIC.fourRowEdgeCountBV_eq_fourPopNat

end PDIC


namespace PDIC

/-! S003R7: the arbitrary-row pair-neighbourhood bridge.  This is
    symbolic in the row map; the only finite computation below concerns
    a single four-bit mask, not 65,536 matrices. -/

/-- The neighbourhood of a two-element left set is exactly the bitwise OR
    of its row masks, for every row function and both (possibly equal) indices. -/
theorem twoRowNeighbours_eq_orMask
    (rows : Side → BitVec 4) (i k : Side) :
    sideNeighbours (adjOfRows rows) ({i, k} : Finset Side) =
      ((Finset.univ : Finset Side).filter
        (fun j => (rows i ||| rows k).getLsbD j.val = true)) := by
  ext j
  simp only [sideNeighbours, Finset.mem_filter, Finset.mem_univ, true_and,
    adjOfRows, Finset.mem_insert, Finset.mem_singleton]
  rw [orMask_getLsbD_iff]
  constructor
  · rintro ⟨v, hv, he⟩
    rcases hv with rfl | rfl
    · exact Or.inl he
    · exact Or.inr he
  · rintro (he | he)
    · exact ⟨i, Or.inl rfl, he⟩
    · exact ⟨k, Or.inr rfl, he⟩

/-- Local four-bit complement fact: two absent columns iff two present
    columns.  This checks 16 masks, independently of the adjacency space. -/
theorem fourMask_complement_card_two_iff (n : BitVec 4) :
    (((Finset.univ : Finset Side) \
        ((Finset.univ : Finset Side).filter
          (fun j => n.getLsbD j.val = true))).card = 2 ↔
      ((Finset.univ : Finset Side).filter
        (fun j => n.getLsbD j.val = true)).card = 2) := by
  revert n
  decide +kernel

/-- Numerical part of the mixed-pair semantic bridge is now generic in rows. -/
theorem twoRow_complement_card_two_iff
    (rows : Side → BitVec 4) (i k : Side) :
    ((Finset.univ \ sideNeighbours (adjOfRows rows) ({i, k} : Finset Side)).card = 2) ↔
    ((Finset.univ : Finset Side).filter
      (fun j => (rows i ||| rows k).getLsbD j.val = true)).card = 2 := by
  rw [twoRowNeighbours_eq_orMask]
  exact fourMask_complement_card_two_iff _

#print axioms PDIC.twoRowNeighbours_eq_orMask
#print axioms PDIC.fourMask_complement_card_two_iff
#print axioms PDIC.twoRow_complement_card_two_iff

end PDIC


namespace PDIC

/-! S003R7: the remaining semantic witness is local in the row map. -/

/-- A vertex in the complement of the two-row neighbourhood is the
    same thing as a set bit of a third row outside their OR-mask. -/
theorem twoRow_outsideWitness_iff
    (rows : Side → BitVec 4) (i k v : Side) :
    (∃ j ∈ (Finset.univ \ sideNeighbours (adjOfRows rows)
        ({i, k} : Finset Side)), adjOfRows rows v j = true) ↔
      (∃ j : Side, (rows v).getLsbD j.val = true ∧
        (rows i ||| rows k).getLsbD j.val = false) := by
  rw [twoRowNeighbours_eq_orMask]
  constructor
  · rintro ⟨j, hj, he⟩
    have hn : (rows i ||| rows k).getLsbD j.val = false := by
      have hnot : (rows i ||| rows k).getLsbD j.val ≠ true := by
        intro ht
        exact (Finset.mem_sdiff.mp hj).2
          (Finset.mem_filter.mpr ⟨Finset.mem_univ j, ht⟩)
      cases hb : (rows i ||| rows k).getLsbD j.val with
      | false => rfl
      | true => exact False.elim (hnot hb)
    exact ⟨j, he, hn⟩
  · rintro ⟨j, he, hn⟩
    refine ⟨j, ?_, he⟩
    apply Finset.mem_sdiff.mpr
    constructor
    · exact Finset.mem_univ j
    · intro hm
      have ht := (Finset.mem_filter.mp hm).2
      have hor : (rows i ||| rows k).getLsbD j.val = true := ht
      rw [hn] at hor
      cases hor

/-- One *generic* mixed-pair correspondence, assuming the two remaining
    indices are z,w. The six concrete pairs will instantiate this once. -/
theorem goodPair_iff_mixedPairCriterion
    (rows : Side → BitVec 4) (i k z w : Side)
    (hpair : ({i, k} : Finset Side).card = 2)
    (hrest : ∀ v : Side, v ∉ ({i, k} : Finset Side) ↔ v = z ∨ v = w) :
    goodLeftPairBV (rows i) (rows k) (rows z) (rows w) = true ↔
      mixedPairCriterion (adjOfRows rows) ({i, k} : Finset Side) := by
  rw [goodLeftPairBV_spec]
  unfold mixedPairCriterion
  rw [twoRow_complement_card_two_iff]
  constructor
  · rintro ⟨hcard, hz, hw⟩
    refine ⟨hpair, hcard, ?_⟩
    intro v hv
    rcases (hrest v).mp hv with he | he
    · rw [he]
      exact (twoRow_outsideWitness_iff rows i k z).mpr hz
    · rw [he]
      exact (twoRow_outsideWitness_iff rows i k w).mpr hw
  · rintro ⟨_, hcard, hdom⟩
    refine ⟨hcard, ?_, ?_⟩
    · exact (twoRow_outsideWitness_iff rows i k z).mp
        (hdom z ((hrest z).mpr (Or.inl rfl)))
    · exact (twoRow_outsideWitness_iff rows i k w).mp
        (hdom w ((hrest w).mpr (Or.inr rfl)))

#print axioms PDIC.twoRow_outsideWitness_iff
#print axioms PDIC.goodPair_iff_mixedPairCriterion

end PDIC

namespace PDIC

/-! S003R7: all six concrete witnesses are instances of the single
    arbitrary-row, arbitrary-partition semantic equivalence. -/

def fourRows (a b c d : BitVec 4) (i : Side) : BitVec 4 :=
  if i = 0 then a else if i = 1 then b else if i = 2 then c else d


theorem fixedPair01Criterion (a b c d : BitVec 4) :
    goodLeftPairBV a b c d = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({0, 1} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (0 : Side) (1 : Side) (2 : Side) (3 : Side)
    (by decide) (by decide)


theorem fixedPair02Criterion (a b c d : BitVec 4) :
    goodLeftPairBV a c b d = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({0, 2} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (0 : Side) (2 : Side) (1 : Side) (3 : Side)
    (by decide) (by decide)


theorem fixedPair03Criterion (a b c d : BitVec 4) :
    goodLeftPairBV a d b c = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({0, 3} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (0 : Side) (3 : Side) (1 : Side) (2 : Side)
    (by decide) (by decide)


theorem fixedPair12Criterion (a b c d : BitVec 4) :
    goodLeftPairBV b c a d = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({1, 2} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (1 : Side) (2 : Side) (0 : Side) (3 : Side)
    (by decide) (by decide)


theorem fixedPair13Criterion (a b c d : BitVec 4) :
    goodLeftPairBV b d a c = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({1, 3} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (1 : Side) (3 : Side) (0 : Side) (2 : Side)
    (by decide) (by decide)


theorem fixedPair23Criterion (a b c d : BitVec 4) :
    goodLeftPairBV c d a b = true ↔
      mixedPairCriterionBool (adjOfRows (fourRows a b c d))
        ({2, 3} : Finset Side) = true := by
  rw [mixedPairCriterionBool_iff]
  exact goodPair_iff_mixedPairCriterion (fourRows a b c d)
    (2 : Side) (3 : Side) (0 : Side) (1 : Side)
    (by decide) (by decide)

#print axioms PDIC.fixedPair01Criterion
#print axioms PDIC.fixedPair02Criterion
#print axioms PDIC.fixedPair03Criterion
#print axioms PDIC.fixedPair12Criterion
#print axioms PDIC.fixedPair13Criterion
#print axioms PDIC.fixedPair23Criterion

end PDIC


namespace PDIC

/-! S003R7: six-pair filtered cardinality via the standard sum_boole
    lemma, rather than the previously failed recursive simp/card_filter. -/

set_option maxRecDepth 8192

theorem sixPairsBoolCardinality_by_sum (p : Finset Side → Bool)
    (h : ∀ X, p X = true → X.card = 2) :
    ((Finset.univ : Finset (Finset Side)).filter
      (fun X => p X = true)).card =
      (if p {0,1} then (1 : ℕ) else 0) +
      (if p {0,2} then (1 : ℕ) else 0) +
      (if p {0,3} then (1 : ℕ) else 0) +
      (if p {1,2} then (1 : ℕ) else 0) +
      (if p {1,3} then (1 : ℕ) else 0) +
      (if p {2,3} then (1 : ℕ) else 0) := by
  classical
  have hf :
      ((Finset.univ : Finset (Finset Side)).filter (fun X => p X = true)) =
      sidePairsSix.filter (fun X => p X = true) := by
    rw [sidePairsSix_eq_filter]
    ext X
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact ⟨fun hp => ⟨h X hp, hp⟩, fun hp => hp.2⟩
  rw [hf]
  calc
    _ = (∑ X ∈ sidePairsSix, if p X = true then (1 : ℕ) else 0) := by
      exact (Finset.sum_boole (R := ℕ)
        (fun X : Finset Side => p X = true) sidePairsSix).symm
    _ = _ := by
      unfold sidePairsSix
      rw [Finset.sum_insert (by decide), Finset.sum_insert (by decide),
        Finset.sum_insert (by decide), Finset.sum_insert (by decide),
        Finset.sum_insert (by decide), Finset.sum_singleton]
      simp only [add_assoc]

theorem computableMixedLeftPairCount_eq_sixCriterion
    (adj : Side → Side → Bool) :
    computableMixedLeftPairCount adj =
      (if mixedPairCriterionBool adj {0,1} then (1 : ℕ) else 0) +
      (if mixedPairCriterionBool adj {0,2} then (1 : ℕ) else 0) +
      (if mixedPairCriterionBool adj {0,3} then (1 : ℕ) else 0) +
      (if mixedPairCriterionBool adj {1,2} then (1 : ℕ) else 0) +
      (if mixedPairCriterionBool adj {1,3} then (1 : ℕ) else 0) +
      (if mixedPairCriterionBool adj {2,3} then (1 : ℕ) else 0) := by
  unfold computableMixedLeftPairCount
  apply sixPairsBoolCardinality_by_sum
  intro X hp
  exact ((mixedPairCriterionBool_iff adj X).mp hp).1

#print axioms PDIC.sixPairsBoolCardinality_by_sum
#print axioms PDIC.computableMixedLeftPairCount_eq_sixCriterion

end PDIC


namespace PDIC

/-! S003R7 edge semantics: a product cardinality splits into four
    independent row cardinalities. No census of matrix assignments. -/

theorem actualMatrixEdgeCount_eq_sum_rows
    (adj : Side → Side → Bool) :
    actualMatrixEdgeCount adj =
      ∑ i : Side, ((Finset.univ : Finset Side).filter
        (fun j => adj i j = true)).card := by
  classical
  unfold actualMatrixEdgeCount
  calc
    _ = ∑ ij : Side × Side,
          if adj ij.1 ij.2 = true then (1 : ℕ) else 0 := by
      exact (Finset.sum_boole (R := ℕ)
        (fun ij : Side × Side => adj ij.1 ij.2 = true) Finset.univ).symm
    _ = ∑ i : Side, ∑ j : Side,
          if adj i j = true then (1 : ℕ) else 0 := by
      rw [← Finset.univ_product_univ, Finset.sum_product]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro i _
      exact Finset.sum_boole (R := ℕ)
        (fun j : Side => adj i j = true) Finset.univ

theorem fourRowEdgeCountBV_eq_actual
    (a b c d : BitVec 4) :
    (fourRowEdgeCountBV a b c d).toNat =
      actualMatrixEdgeCount (adjOfRows (fourRows a b c d)) := by
  rw [fourRowEdgeCountBV_eq_fourPopNat, actualMatrixEdgeCount_eq_sum_rows,
    Fin.sum_univ_four]
  have hrow (i : Side) :
      ((Finset.univ : Finset Side).filter
        (fun j => adjOfRows (fourRows a b c d) i j = true)).card =
        (fourBitPopCount5 (fourRows a b c d i)).toNat := by
    exact (fourBitPopCount5_eq_rowCard (fourRows a b c d i)).symm
  rw [hrow 0, hrow 1, hrow 2, hrow 3]
  simp [fourRows]

#print axioms PDIC.actualMatrixEdgeCount_eq_sum_rows
#print axioms PDIC.fourRowEdgeCountBV_eq_actual

end PDIC


namespace PDIC

/-! S003R7: compose six individually proven iff witnesses, the six-pair
    Boolean cardinality identity and the exact 3-bit no-overflow sum. -/

theorem fourRowMixedCountBV_eq_actual
    (a b c d : BitVec 4) :
    (fourRowMixedCountBV a b c d).toNat =
      actualMixedLeftPairCount (adjOfRows (fourRows a b c d)) := by
  rw [fourRowMixedCountBV_eq_sixNat,
    ← computableMixedLeftPairCount_eq_actual,
    computableMixedLeftPairCount_eq_sixCriterion]
  simp only [← fixedPair01Criterion a b c d,
    ← fixedPair02Criterion a b c d,
    ← fixedPair03Criterion a b c d,
    ← fixedPair12Criterion a b c d,
    ← fixedPair13Criterion a b c d,
    ← fixedPair23Criterion a b c d]

#print axioms PDIC.fourRowMixedCountBV_eq_actual

end PDIC


namespace PDIC

/-! S003R8: promote the strict-kernel S003R7 BitVec-to-actual-count bridges
    to semantic theorems quantified over arbitrary Boolean 4 × 4 matrices.
    No 65,536-input semantic reduction is performed here. -/

theorem fourRows_rowsOfAdj (adj : Side → Side → Bool) :
    fourRows (rowsOfAdj adj 0) (rowsOfAdj adj 1)
      (rowsOfAdj adj 2) (rowsOfAdj adj 3) = rowsOfAdj adj := by
  funext i
  fin_cases i <;> rfl

theorem actualCounts_eq_encoded (adj : Side → Side → Bool) :
    actualMixedLeftPairCount adj =
      (fourRowMixedCountBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3)).toNat ∧
    actualMatrixEdgeCount adj =
      (fourRowEdgeCountBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3)).toNat := by
  have hrow : adjOfRows
      (fourRows (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3)) = adj := by
    rw [fourRows_rowsOfAdj, adjOfRows_rowsOfAdj]
  constructor
  · rw [fourRowMixedCountBV_eq_actual, hrow]
  · rw [fourRowEdgeCountBV_eq_actual, hrow]

/-- For every Boolean 4 × 4 bipartite adjacency, four mixed maximal
    independent left pairs force at most five edges. -/
theorem four_mixed_implies_at_most_five_edges
    (adj : Side → Side → Bool)
    (h : 4 ≤ actualMixedLeftPairCount adj) :
    actualMatrixEdgeCount adj ≤ 5 := by
  obtain ⟨hm, he⟩ := actualCounts_eq_encoded adj
  let a := rowsOfAdj adj 0
  let b := rowsOfAdj adj 1
  let c := rowsOfAdj adj 2
  let d := rowsOfAdj adj 3
  have hb : (4 : BitVec 3) ≤ fourRowMixedCountBV a b c d := by
    rw [BitVec.le_def]
    norm_num
    dsimp only [a, b, c, d]
    omega
  have ht := four_by_four_six_edge_threshold_BV a b c d hb
  have htNat := (BitVec.le_def).mp ht
  norm_num at htNat
  dsimp only [a, b, c, d] at htNat
  omega

/-- At least eight bipartite edges leave at most two mixed MIS witnesses. -/
theorem eight_edges_implies_at_most_two_mixed
    (adj : Side → Side → Bool)
    (h : 8 ≤ actualMatrixEdgeCount adj) :
    actualMixedLeftPairCount adj ≤ 2 := by
  obtain ⟨hm, he⟩ := actualCounts_eq_encoded adj
  let a := rowsOfAdj adj 0
  let b := rowsOfAdj adj 1
  let c := rowsOfAdj adj 2
  let d := rowsOfAdj adj 3
  have hb : (8 : BitVec 5) ≤ fourRowEdgeCountBV a b c d := by
    rw [BitVec.le_def]
    norm_num
    dsimp only [a, b, c, d]
    omega
  have ht := eight_edges_at_most_two_mixed_BV a b c d hb
  have htNat := (BitVec.le_def).mp ht
  norm_num at htNat
  dsimp only [a, b, c, d] at htNat
  omega

/-- The seven-edge/three-mixed-witness semantic equality case is EXACTLY
    the previously certified row- or column-hub spider pattern. -/
theorem seven_edges_three_mixed_iff_spider
    (adj : Side → Side → Bool) :
    (actualMatrixEdgeCount adj = 7 ∧
      actualMixedLeftPairCount adj = 3) ↔
    spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
      (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true := by
  obtain ⟨hm, he⟩ := actualCounts_eq_encoded adj
  let a := rowsOfAdj adj 0
  let b := rowsOfAdj adj 1
  let c := rowsOfAdj adj 2
  let d := rowsOfAdj adj 3
  have hbv := seven_edge_three_iff_spider_BV a b c d
  dsimp only [a, b, c, d] at hbv
  constructor
  · rintro ⟨hedges, hmixed⟩
    apply hbv.mp
    constructor
    · apply (BitVec.toNat_eq).2
      norm_num
      omega
    · apply (BitVec.toNat_eq).2
      norm_num
      omega
  · intro hspider
    rcases hbv.mpr hspider with ⟨hedges, hmixed⟩
    have heNat := congrArg BitVec.toNat hedges
    have hmNat := congrArg BitVec.toNat hmixed
    norm_num at heNat hmNat
    constructor <;> omega

/-- Hostile sanity check: the 8-vertex spider has a maximal independent
    four-set with a 3+1 split, so its MIS family is NOT exhausted by the
    two pure sides and the 2+2 mixed MIS family. -/
theorem spider_has_three_one_mis :
    IsMIS4 spiderAdj ({1, 2, 3, 7} : Finset Vertex) ∧
      (({1, 2, 3, 7} : Finset Vertex).filter
        (fun v => v.val < 4)).card = 3 := by
  constructor
  · apply (isMIS4Bool_iff_IsMIS4 _ _).mp
    decide
  · decide

/-- Likewise the spider contains a 1+3 maximal independent four-set. -/
theorem spider_has_one_three_mis :
    IsMIS4 spiderAdj ({2, 4, 6, 7} : Finset Vertex) ∧
      (({2, 4, 6, 7} : Finset Vertex).filter
        (fun v => v.val < 4)).card = 1 := by
  constructor
  · apply (isMIS4Bool_iff_IsMIS4 _ _).mp
    decide
  · decide

#print axioms PDIC.fourRows_rowsOfAdj
#print axioms PDIC.actualCounts_eq_encoded
#print axioms PDIC.four_mixed_implies_at_most_five_edges
#print axioms PDIC.eight_edges_implies_at_most_two_mixed
#print axioms PDIC.seven_edges_three_mixed_iff_spider
#print axioms PDIC.spider_has_three_one_mis
#print axioms PDIC.spider_has_one_three_mis

end PDIC


namespace PDIC

/-! S003R9: actual simple-graph semantics on the exact eight-element
    type Fin 4 ⊕ Fin 4. No connectivity or isomorphism is assumed here. -/
abbrev SplitVertex := Side ⊕ Side

def matrixGraph (adj : Side → Side → Bool) : SimpleGraph SplitVertex where
  Adj u v := match u, v with
    | .inl i, .inr j => adj i j = true
    | .inr j, .inl i => adj i j = true
    | _, _ => False
  symm.symm := by intro u v; cases u <;> cases v <;> simp_all
  loopless.irrefl := by intro u; cases u <;> simp

/-- Independence and domination are the usual exact finite MIS criterion. -/
public def GraphMIS {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
  (∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v) ∧
    (∀ v, v ∉ s → ∃ u ∈ s, G.Adj v u)

/-- This predicate really is maximality under inclusion, not maximum size. -/
theorem graphMIS_iff_maximal {V : Type*} [DecidableEq V]
    (G : SimpleGraph V) (s : Finset V) :
    GraphMIS G s ↔
      (∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v) ∧
      ∀ t : Finset V, s ⊆ t →
        (∀ u ∈ t, ∀ v ∈ t, ¬ G.Adj u v) → t = s := by
  classical
  constructor
  · rintro ⟨hi, hd⟩
    refine ⟨hi, ?_⟩
    intro t hst ht
    apply Finset.Subset.antisymm
    · intro v hv
      by_contra hvs
      obtain ⟨u, hu, he⟩ := hd v hvs
      exact ht v hv u (hst hu) he
    · exact hst
  · rintro ⟨hi, hm⟩
    refine ⟨hi, ?_⟩
    intro v hv
    by_contra hn
    have hno : ∀ u ∈ s, ¬ G.Adj v u := by
      intro u hu he
      exact hn ⟨u, hu, he⟩
    have hind : ∀ a ∈ insert v s, ∀ b ∈ insert v s, ¬ G.Adj a b := by
      intro a ha b hb
      simp only [Finset.mem_insert] at ha hb
      rcases ha with rfl | ha <;> rcases hb with rfl | hb
      · exact G.irrefl
      · exact hno b hb
      · exact fun he => hno a ha (G.adj_symm he)
      · exact hi a ha b hb
    have heq := hm (insert v s) (Finset.subset_insert v s) hind
    exact hv (heq ▸ Finset.mem_insert_self v s)

theorem mixed_iff_graphMIS (adj : Side → Side → Bool)
    (X Y : Finset Side) :
    IsMixedMIS adj X Y ↔
      X.card = 2 ∧ Y.card = 2 ∧
        GraphMIS (matrixGraph adj) (X.disjSum Y) := by
  constructor
  · rintro ⟨hx, hy, hi, hl, hr⟩
    refine ⟨hx, hy, ?_, ?_⟩
    · intro u hu v hv
      cases u with
      | inl i =>
        cases v with
        | inl k => exact id
        | inr j =>
          have hf := hi i (by simpa using hu) j (by simpa using hv)
          simpa [matrixGraph, hf]
      | inr j =>
        cases v with
        | inl i =>
          have hf := hi i (by simpa using hv) j (by simpa using hu)
          simpa [matrixGraph, hf]
        | inr k => exact id
    · intro v hv
      cases v with
      | inl i =>
        obtain ⟨j, hj, he⟩ := hl i (by simpa using hv)
        exact ⟨.inr j, by simpa using hj, he⟩
      | inr j =>
        obtain ⟨i, hi, he⟩ := hr j (by simpa using hv)
        exact ⟨.inl i, by simpa using hi, he⟩
  · rintro ⟨hx, hy, hi, hd⟩
    refine ⟨hx, hy, ?_, ?_, ?_⟩
    · intro i hiX j hjY
      have hn := hi (.inl i) (by simpa using hiX)
        (.inr j) (by simpa using hjY)
      cases he : adj i j with
      | false => rfl
      | true => exact False.elim (hn he)
    · intro i hiX
      obtain ⟨u, hu, he⟩ := hd (.inl i) (by simpa using hiX)
      cases u with
      | inl k => exact False.elim he
      | inr j => exact ⟨j, by simpa using hu, he⟩
    · intro j hjY
      obtain ⟨u, hu, he⟩ := hd (.inr j) (by simpa using hjY)
      cases u with
      | inl i => exact ⟨i, by simpa using hu, he⟩
      | inr k => exact False.elim he

/-- Actual graph witnesses, represented as vertex sets rather than row pairs. -/
noncomputable def graphMixedCount (adj : Side → Side → Bool) : ℕ := by
  classical
  exact Fintype.card {s : Finset SplitVertex //
    s.toLeft.card = 2 ∧ s.toRight.card = 2 ∧ GraphMIS (matrixGraph adj) s}

/-- Lossless bijection between actual mixed graph MIS and eligible left pairs. -/
noncomputable def graphMixedEquiv (adj : Side → Side → Bool) :
    {s : Finset SplitVertex //
      s.toLeft.card = 2 ∧ s.toRight.card = 2 ∧ GraphMIS (matrixGraph adj) s} ≃
    {X : Finset Side // ∃ Y : Finset Side, IsMixedMIS adj X Y} where
  toFun s := ⟨s.val.toLeft, s.val.toRight,
    (mixed_iff_graphMIS adj _ _).mpr
      ⟨s.property.1, s.property.2.1,
        by simpa only [Finset.toLeft_disjSum_toRight] using s.property.2.2⟩⟩
  invFun X := by
    let Y := Finset.univ \ sideNeighbours adj X.val
    have h : IsMixedMIS adj X.val Y := by
      obtain ⟨Z, hz⟩ := X.property
      have he := mixed_opposite_unique adj X.val Z hz
      simpa only [he] using hz
    exact ⟨X.val.disjSum Y, by
      simpa only [Finset.toLeft_disjSum, Finset.toRight_disjSum] using
        (mixed_iff_graphMIS adj X.val Y).mp h⟩
  left_inv s := by
    apply Subtype.ext
    have h := (mixed_iff_graphMIS adj s.val.toLeft s.val.toRight).mpr
      ⟨s.property.1, s.property.2.1,
        by simpa only [Finset.toLeft_disjSum_toRight] using s.property.2.2⟩
    change s.val.toLeft.disjSum
      (Finset.univ \ sideNeighbours adj s.val.toLeft) = s.val
    rw [← mixed_opposite_unique adj _ _ h, Finset.toLeft_disjSum_toRight]
  right_inv X := by
    apply Subtype.ext
    exact Finset.toLeft_disjSum

theorem graphMixedCount_eq_actual (adj : Side → Side → Bool) :
    graphMixedCount adj = actualMixedLeftPairCount adj := by
  classical
  rw [graphMixedCount, Fintype.card_congr (graphMixedEquiv adj)]
  simp [actualMixedLeftPairCount, Fintype.card_subtype]

/-- An edge-threshold graph theorem; connectivity-to-edge-count is separate. -/
theorem graphMixedCount_le_three (adj : Side → Side → Bool)
    (he : 6 ≤ actualMatrixEdgeCount adj) : graphMixedCount adj ≤ 3 := by
  rw [graphMixedCount_eq_actual]
  by_contra hn
  have hm : 4 ≤ actualMixedLeftPairCount adj := by omega
  have hh := four_mixed_implies_at_most_five_edges adj hm
  omega

theorem graphMixedCount_three_iff_spider (adj : Side → Side → Bool)
    (he : 7 ≤ actualMatrixEdgeCount adj) :
    graphMixedCount adj = 3 ↔
      spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true := by
  rw [graphMixedCount_eq_actual]
  constructor
  · intro hm
    have heq : actualMatrixEdgeCount adj = 7 := by
      by_contra hn
      have he8 : 8 ≤ actualMatrixEdgeCount adj := by omega
      have hb := eight_edges_implies_at_most_two_mixed adj he8
      omega
    exact (seven_edges_three_mixed_iff_spider adj).mp ⟨heq, hm⟩
  · intro hs
    exact ((seven_edges_three_mixed_iff_spider adj).mpr hs).2

#print axioms PDIC.graphMIS_iff_maximal
#print axioms PDIC.mixed_iff_graphMIS
#print axioms PDIC.graphMixedEquiv
#print axioms PDIC.graphMixedCount_eq_actual
#print axioms PDIC.graphMixedCount_le_three
#print axioms PDIC.graphMixedCount_three_iff_spider

end PDIC


namespace PDIC

/-- A proper two-colouring, with no balance or maximality assumed. -/
def ProperBoolColouring {V : Type*} (G : SimpleGraph V) (c : V → Bool) : Prop :=
  ∀ ⦃u v⦄, G.Adj u v → c u ≠ c v

theorem walk_colour_agreement {V : Type*} {G : SimpleGraph V}
    (c d : V → Bool) (hc : ProperBoolColouring G c)
    (hd : ProperBoolColouring G d) {u v : V} (p : G.Walk u v) :
    (c u = d u ↔ c v = d v) := by
  induction p with
  | nil => rfl
  | @cons u v w he p ih =>
    have hstep : c u = d u ↔ c v = d v := by
      have hc' := hc he
      have hd' := hd he
      cases hcu : c u <;> cases hcv : c v <;>
        cases hdu : d u <;> cases hdv : d v <;> simp_all
    exact hstep.trans ih

/-- Connectedness supplies the UNIQUE bipartition up to global swap. -/
theorem connected_bool_colouring_unique {V : Type*} {G : SimpleGraph V}
    (hconn : G.Connected) (r : V) (c d : V → Bool)
    (hc : ProperBoolColouring G c) (hd : ProperBoolColouring G d) :
    c = d ∨ c = fun v => !(d v) := by
  have hagree (v : V) : c r = d r ↔ c v = d v := by
    obtain ⟨p⟩ := hconn.preconnected r v
    exact walk_colour_agreement c d hc hd p
  by_cases hroot : c r = d r
  · exact Or.inl (funext fun v => (hagree v).mp hroot)
  · right
    funext v
    have hne : c v ≠ d v := fun he => hroot ((hagree v).mpr he)
    cases hcv : c v <;> cases hdv : d v <;> simp_all

noncomputable def membershipColour {V : Type*} (s : Finset V) (v : V) : Bool :=
  @decide (v ∈ s) (Classical.propDecidable _)

theorem independent_complement_proper {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (s : Finset V)
    (hi : ∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v)
    (hj : ∀ u ∈ (Finset.univ \ s), ∀ v ∈ (Finset.univ \ s), ¬ G.Adj u v) :
    ProperBoolColouring G (membershipColour s) := by
  classical
  intro u v he hcol
  by_cases hu : u ∈ s <;> by_cases hv : v ∈ s
  · exact hi u hu v hv he
  · simpa [membershipColour, hu, hv] using hcol
  · simpa [membershipColour, hu, hv] using hcol
  · exact hj u (by simp [hu]) v (by simp [hv]) he

/-- Any two complementary independent decompositions of a connected finite
    graph agree up to exchanging the two parts. Cardinalities are irrelevant. -/
theorem connected_independent_partition_unique
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hconn : G.Connected) (r : V) (s t : Finset V)
    (hs : ∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v)
    (hsc : ∀ u ∈ (Finset.univ \ s), ∀ v ∈ (Finset.univ \ s), ¬ G.Adj u v)
    (ht : ∀ u ∈ t, ∀ v ∈ t, ¬ G.Adj u v)
    (htc : ∀ u ∈ (Finset.univ \ t), ∀ v ∈ (Finset.univ \ t), ¬ G.Adj u v) :
    s = t ∨ s = Finset.univ \ t := by
  classical
  obtain he | he := connected_bool_colouring_unique hconn r
    (membershipColour s) (membershipColour t)
    (independent_complement_proper G s hs hsc)
    (independent_complement_proper G t ht htc)
  · left
    ext v
    have hv := congrFun he v
    have hm : membershipColour s v = true ↔ membershipColour t v = true := by rw [hv]
    simpa [membershipColour] using hm
  · right
    ext v
    have hv := congrFun he v
    have hm : membershipColour s v = true ↔ (!(membershipColour t v)) = true := by rw [hv]
    simpa [membershipColour] using hm

#print axioms PDIC.walk_colour_agreement
#print axioms PDIC.connected_bool_colouring_unique
#print axioms PDIC.independent_complement_proper
#print axioms PDIC.connected_independent_partition_unique

end PDIC


namespace PDIC

/-- Every occupied matrix cell is exactly one unordered simple-graph edge. -/
def matrixCellEdge (adj : Side → Side → Bool)
    (c : {ij : Side × Side // adj ij.1 ij.2 = true}) :
    (matrixGraph adj).edgeSet :=
  ⟨s(Sum.inl c.val.1, Sum.inr c.val.2), c.property⟩

theorem matrixCellEdge_bijective (adj : Side → Side → Bool) :
    Function.Bijective (matrixCellEdge adj) := by
  constructor
  · intro a b he
    apply Subtype.ext
    have hh : a.val.1 = b.val.1 ∧ a.val.2 = b.val.2 := by
      simpa only [matrixCellEdge, Sym2.eq_iff, Sum.inl.injEq, Sum.inr.injEq,
        Sum.inl_ne_inr, Sum.inr_ne_inl, false_and, or_false] using
        congrArg Subtype.val he
    exact Prod.ext hh.1 hh.2
  · rintro ⟨e, he⟩
    revert he
    refine Sym2.inductionOn e ?_
    intro u v he
    cases u with
    | inl i =>
      cases v with
      | inl k => exact False.elim he
      | inr j => exact ⟨⟨(i, j), he⟩, rfl⟩
    | inr j =>
      cases v with
      | inl i =>
        refine ⟨⟨(i, j), he⟩, ?_⟩
        apply Subtype.ext
        exact Sym2.eq_swap
      | inr k => exact False.elim he

theorem matrixGraph_edgeCount (adj : Side → Side → Bool) :
    Nat.card (matrixGraph adj).edgeSet = actualMatrixEdgeCount adj := by
  classical
  letI : Fintype (matrixGraph adj).edgeSet := Fintype.ofFinite _
  rw [Nat.card_eq_fintype_card,
    ← Fintype.card_congr (Equiv.ofBijective _ (matrixCellEdge_bijective adj))]
  simp [actualMatrixEdgeCount, Fintype.card_subtype]

theorem connected_matrixGraph_seven_edges (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) : 7 ≤ actualMatrixEdgeCount adj := by
  have hh := hc.card_vert_le_card_edgeSet_add_one
  rw [matrixGraph_edgeCount] at hh
  have hv : Nat.card SplitVertex = 8 := by
    simp [Nat.card_eq_fintype_card, SplitVertex, Side, Fintype.card_sum]
  rw [hv] at hh
  omega

/-- A genuine connected SimpleGraph theorem about actual mixed MIS vertex sets. -/
theorem connected_graphMixedCount_le_three (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) : graphMixedCount adj ≤ 3 := by
  apply graphMixedCount_le_three
  have hh := connected_matrixGraph_seven_edges adj hc
  omega

theorem connected_graphMixedCount_three_iff_pattern (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) :
    graphMixedCount adj = 3 ↔
      spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true := by
  exact graphMixedCount_three_iff_spider adj (connected_matrixGraph_seven_edges adj hc)

#print axioms PDIC.matrixCellEdge_bijective
#print axioms PDIC.matrixGraph_edgeCount
#print axioms PDIC.connected_matrixGraph_seven_edges
#print axioms PDIC.connected_graphMixedCount_le_three
#print axioms PDIC.connected_graphMixedCount_three_iff_pattern

end PDIC

/-! S007: direct connected-graph interfaces for unordered h(G).

    The count below uses genuine *sets of three four-MIS vertex sets*, not
    ordered triples and not a six-fold inflated proxy.  The bridge from
    unordered triples to the anchored third-set count is a subsequent theorem
    obligation, so no count equality is assumed here. -/
namespace PDIC

/-- An anchored balanced bipartition consisting of two genuine 4-MIS. -/
def FourMISPartition (G : SimpleGraph Vertex) (s : Finset Vertex) : Prop :=
  s.card = 4 ∧ GraphMIS G s ∧ GraphMIS G (Finset.univ \ s)

/-- A connected graph has at most one complementary independent partition
    up to exchanging sides, even though its MIS family may contain skew sets. -/
theorem fourMISPartition_unique_up_to_swap
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (s t : Finset Vertex)
    (hs : FourMISPartition G s) (ht : FourMISPartition G t) :
    s = t ∨ s = Finset.univ \ t := by
  exact connected_independent_partition_unique G hc (0 : Vertex)
    s t hs.2.1.1 hs.2.2.1 ht.2.1.1 ht.2.2.1

/-- A third four-MIS compatible with an anchored complementary pair. -/
def IsAnchoredMixedThird (G : SimpleGraph Vertex)
    (s r : Finset Vertex) : Prop :=
  GraphMIS G r ∧ (r ∩ s).card = 2 ∧
    (r ∩ (Finset.univ \ s)).card = 2

/-- A genuine unordered triple of distinct four-MIS, including a
    complementary disjoint pair and one 2+2 mixed third set.
    The three members are encoded by a Finset, not a list/tuple. -/
public def IsUnorderedCompatibleTriple (G : SimpleGraph Vertex)
    (T : Finset (Finset Vertex)) : Prop :=
  T.card = 3 ∧
  (∀ r ∈ T, r.card = 4 ∧ GraphMIS G r) ∧
  ∃ s ∈ T, ∃ t ∈ T, ∃ r ∈ T,
    s ≠ t ∧ s ≠ r ∧ t ≠ r ∧
      t = Finset.univ \ s ∧
      (r ∩ s).card = 2 ∧ (r ∩ t).card = 2

/-- The cardinality counts unordered triples, not ordered witnesses. -/
public noncomputable def unorderedCompatibleTripleCount
    (G : SimpleGraph Vertex) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset (Finset Vertex))).filter
    (IsUnorderedCompatibleTriple G)).card

/-- Any actual unordered compatible triple contains a balanced pair of
    four-vertex maximal independent sets. -/
theorem unorderedTriple_has_partition
    (G : SimpleGraph Vertex) (T : Finset (Finset Vertex))
    (hT : IsUnorderedCompatibleTriple G T) :
    ∃ s : Finset Vertex, FourMISPartition G s := by
  rcases hT with ⟨_, hall, s, hs, t, ht, r, hr, _, _, _, hcomp, _, _⟩
  refine ⟨s, (hall s hs).1, (hall s hs).2, ?_⟩
  simpa only [hcomp] using (hall t ht).2

/-- In the absence of a balanced complementary four-MIS pair the genuine
    unordered triple count vanishes. -/
theorem unorderedCompatibleTripleCount_zero_of_no_partition
    (G : SimpleGraph Vertex)
    (hnone : ¬ ∃ s : Finset Vertex, FourMISPartition G s) :
    unorderedCompatibleTripleCount G = 0 := by
  classical
  have hno : ∀ T : Finset (Finset Vertex),
      ¬ IsUnorderedCompatibleTriple G T := by
    intro T hT
    exact hnone (unorderedTriple_has_partition G T hT)
  simp [unorderedCompatibleTripleCount, hno]

/-- This candidate count deliberately counts mixed *third sets*.
    It is not definitionally the paper's unordered triple count: proving
    their equivalence using the connected uniqueness theorem is required. -/
noncomputable def anchoredMixedThirdCount
    (G : SimpleGraph Vertex) (s : Finset Vertex) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Vertex)).filter
    (IsAnchoredMixedThird G s)).card

/-- Side-swapping preserves the exact candidate third-set count. -/
theorem anchoredMixedThirdCount_swap
    (G : SimpleGraph Vertex) (s : Finset Vertex) :
    anchoredMixedThirdCount G (Finset.univ \ s) =
      anchoredMixedThirdCount G s := by
  classical
  have hcomp :
      (Finset.univ : Finset Vertex) \ (Finset.univ \ s) = s := by
    ext v
    simp
  unfold anchoredMixedThirdCount
  apply congrArg Finset.card
  ext r
  simp only [Finset.mem_filter, Finset.mem_univ, true_and,
    IsAnchoredMixedThird, hcomp]
  constructor
  · rintro ⟨hm, ha, hb⟩
    exact ⟨hm, hb, ha⟩
  · rintro ⟨hm, ha, hb⟩
    exact ⟨hm, hb, ha⟩

/-- Connectedness makes the anchored count independent of the choice
    of complementary pair: it is an intrinsic graph statistic. -/
theorem anchoredMixedThirdCount_partition_independent
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (s t : Finset Vertex)
    (hs : FourMISPartition G s) (ht : FourMISPartition G t) :
    anchoredMixedThirdCount G s = anchoredMixedThirdCount G t := by
  rcases fourMISPartition_unique_up_to_swap G hc s t hs ht with he | he
  · rw [he]
  · rw [he]
    exact anchoredMixedThirdCount_swap G t

/-- A genuine unordered compatible triple has a 2+2 mixed third set
    relative to *any* balanced independent partition of a connected graph.
    This is the central uniqueness step before cardinality transport. -/
theorem unorderedTriple_has_anchored_third
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (s : Finset Vertex) (hs : FourMISPartition G s)
    (T : Finset (Finset Vertex))
    (hT : IsUnorderedCompatibleTriple G T) :
    ∃ r ∈ T, IsAnchoredMixedThird G s r := by
  rcases hT with ⟨_, hall, a, ha, b, hb, r, hr, _, _, _, hab, hra, hrb⟩
  have hp : FourMISPartition G a := by
    refine ⟨(hall a ha).1, (hall a ha).2, ?_⟩
    simpa only [← hab] using (hall b hb).2
  rcases fourMISPartition_unique_up_to_swap G hc a s hp hs with he | he
  · subst a
    refine ⟨r, hr, (hall r hr).2, hra, ?_⟩
    simpa only [hab] using hrb
  · have hcc :
        (Finset.univ : Finset Vertex) \ (Finset.univ \ s) = s := by
      ext v
      simp
    refine ⟨r, hr, (hall r hr).2, ?_, ?_⟩
    · simpa only [hab, he, hcc] using hrb
    · simpa only [he] using hra

#print axioms PDIC.fourMISPartition_unique_up_to_swap
#print axioms PDIC.unorderedTriple_has_partition
#print axioms PDIC.unorderedTriple_has_anchored_third
#print axioms PDIC.unorderedCompatibleTripleCount_zero_of_no_partition
#print axioms PDIC.anchoredMixedThirdCount_swap
#print axioms PDIC.anchoredMixedThirdCount_partition_independent

end PDIC

namespace PDIC

/-! S007: unordered compatible triples in an arbitrary finite simple graph.
The count is over sets of sets, so neither orientations nor orderings are counted.
The complementary-pair condition includes the two size-four MIS explicitly. -/

def ComplementaryFourMIS {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (s t : Finset V) : Prop :=
  s.card = 4 ∧ t.card = 4 ∧ GraphMIS G s ∧ GraphMIS G t ∧
    t = Finset.univ \ s

def MixedFourMIS {V : Type*} [DecidableEq V]
    (G : SimpleGraph V) (s t r : Finset V) : Prop :=
  r.card = 4 ∧ GraphMIS G r ∧ (r ∩ s).card = 2 ∧ (r ∩ t).card = 2

def CompatibleTriple {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (q : Finset (Finset V)) : Prop :=
  ∃ s t r, ComplementaryFourMIS G s t ∧ MixedFourMIS G s t r ∧
    q = {s, t, r}

noncomputable def compatibleTripleCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) : ℕ := by
  classical
  exact Fintype.card {q : Finset (Finset V) // CompatibleTriple G q}

noncomputable def partitionMixedCount {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (s t : Finset V) : ℕ := by
  classical
  exact Fintype.card {r : Finset V // MixedFourMIS G s t r}

theorem complementaryFourMIS_symm {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} {s t : Finset V} (h : ComplementaryFourMIS G s t) :
    ComplementaryFourMIS G t s := by
  classical
  rcases h with ⟨hs, ht, hms, hmt, rfl⟩
  exact ⟨ht, hs, hmt, hms, by ext v; simp⟩

theorem complementaryFourMIS_ne {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} {s t : Finset V} (h : ComplementaryFourMIS G s t) :
    s ≠ t := by
  classical
  intro he
  obtain ⟨v, hv⟩ := Finset.card_pos.mp (show 0 < s.card by rw [h.1]; decide)
  have hvt : v ∈ t := he ▸ hv
  rw [h.2.2.2.2] at hvt
  exact (Finset.mem_sdiff.mp hvt).2 hv

theorem mixedFourMIS_ne_sides {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} {s t r : Finset V}
    (h : MixedFourMIS G s t r) : r ≠ s ∧ r ≠ t := by
  constructor
  · intro he
    have hh := h.2.2.1
    rw [← he, Finset.inter_self] at hh
    have hc := h.1
    omega
  · intro he
    have hh := h.2.2.2
    rw [← he, Finset.inter_self] at hh
    have hc := h.1
    omega

theorem compatibleTriple_card {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} {q : Finset (Finset V)} (h : CompatibleTriple G q) :
    q.card = 3 := by
  classical
  obtain ⟨s, t, r, hp, hm, rfl⟩ := h
  have hst := complementaryFourMIS_ne hp
  obtain ⟨hrs, hrt⟩ := mixedFourMIS_ne_sides hm
  simp [hst, Ne.symm hrs, Ne.symm hrt]

/-- If there is no complementary pair, there are no compatible triples. -/
theorem compatibleTripleCount_zero_of_no_pair
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (h : ¬ ∃ s t, ComplementaryFourMIS G s t) :
    compatibleTripleCount G = 0 := by
  classical
  unfold compatibleTripleCount
  apply Fintype.card_eq_zero_iff.mpr
  exact ⟨fun q => by
    obtain ⟨s, t, r, hp, _, _⟩ := q.property
    exact h ⟨s, t, hp⟩⟩

/-- A genuine connected graph has only one such unordered pair. -/
theorem connected_complementaryFourMIS_unique
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hc : G.Connected) (root : V) {s t a b : Finset V}
    (hst : ComplementaryFourMIS G s t) (hab : ComplementaryFourMIS G a b) :
    (a = s ∧ b = t) ∨ (a = t ∧ b = s) := by
  have ht : GraphMIS G (Finset.univ \ s) := hst.2.2.2.2 ▸ hst.2.2.2.1
  have hb : GraphMIS G (Finset.univ \ a) := hab.2.2.2.2 ▸ hab.2.2.2.1
  obtain he | he := connected_independent_partition_unique G hc root a s
    hab.2.2.1.1 hb.1 hst.2.2.1.1 ht.1
  · left
    exact ⟨he, by rw [hab.2.2.2.2, he, ← hst.2.2.2.2]⟩
  · right
    refine ⟨he.trans hst.2.2.2.2.symm, ?_⟩
    rw [hab.2.2.2.2, he]
    ext v
    simp

/-- Relative to the unique connected bipartition, every unordered triple
has precisely the form obtained by adjoining one genuine 2+2 mixed MIS. -/
theorem connected_compatibleTriple_iff
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hc : G.Connected) (root : V) {s t : Finset V}
    (hst : ComplementaryFourMIS G s t) (q : Finset (Finset V)) :
    CompatibleTriple G q ↔ ∃ r, MixedFourMIS G s t r ∧ q = {s, t, r} := by
  classical
  constructor
  · rintro ⟨a, b, r, hab, hr, hq⟩
    obtain ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ :=
      connected_complementaryFourMIS_unique G hc root hst hab
    · exact ⟨r, hr, hq⟩
    · refine ⟨r, ⟨hr.1, hr.2.1, hr.2.2.2, hr.2.2.1⟩, ?_⟩
      rw [hq]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
  · rintro ⟨r, hr, hq⟩
    exact ⟨s, t, r, hst, hr, hq⟩

/-- The map is injective because the added set differs from both sides.
This is the step that prevents counting the two pair orientations. -/
noncomputable def compatibleTripleEquiv
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hc : G.Connected) (root : V) {s t : Finset V}
    (hst : ComplementaryFourMIS G s t) :
    {r : Finset V // MixedFourMIS G s t r} ≃
    {q : Finset (Finset V) // CompatibleTriple G q} := by
  classical
  let f : {r : Finset V // MixedFourMIS G s t r} →
      {q : Finset (Finset V) // CompatibleTriple G q} :=
    fun r => ⟨{s, t, r.val}, s, t, r.val, hst, r.property, rfl⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b he
    apply Subtype.ext
    have hm : a.val ∈ ({s, t, b.val} : Finset (Finset V)) := by
      rw [← show ({s, t, a.val} : Finset (Finset V)) = {s, t, b.val} from
        congrArg Subtype.val he]
      simp
    have hn := mixedFourMIS_ne_sides a.property
    simpa only [Finset.mem_insert, Finset.mem_singleton, hn.1, hn.2,
      false_or] using hm
  · intro q
    obtain ⟨r, hr, he⟩ := (connected_compatibleTriple_iff G hc root hst q.val).mp q.property
    exact ⟨⟨r, hr⟩, Subtype.ext he.symm⟩

/-- Exact unordered-triple count, with no count equality assumed. -/
theorem connected_compatibleTripleCount_eq_partitionMixedCount
    {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    (hc : G.Connected) (root : V) {s t : Finset V}
    (hst : ComplementaryFourMIS G s t) :
    compatibleTripleCount G = partitionMixedCount G s t := by
  classical
  exact (Fintype.card_congr (compatibleTripleEquiv G hc root hst)).symm

#print axioms PDIC.complementaryFourMIS_symm
#print axioms PDIC.complementaryFourMIS_ne
#print axioms PDIC.mixedFourMIS_ne_sides
#print axioms PDIC.compatibleTriple_card
#print axioms PDIC.compatibleTripleCount_zero_of_no_pair
#print axioms PDIC.connected_complementaryFourMIS_unique
#print axioms PDIC.connected_compatibleTriple_iff
#print axioms PDIC.compatibleTripleEquiv
#print axioms PDIC.connected_compatibleTripleCount_eq_partitionMixedCount

end PDIC

namespace PDIC

/-- The anchored 2+2 conditions themselves force size four. -/
theorem anchoredMixedThird_card (G : SimpleGraph Vertex) (s r : Finset Vertex)
    (h : IsAnchoredMixedThird G s r) : r.card = 4 := by
  classical
  have he : r ∩ (Finset.univ \ s) = r \ s := by ext v; simp
  have hh := Finset.card_inter_add_card_sdiff r s
  rw [h.2.1, ← he, h.2.2] at hh
  omega

/-- The generic set-of-sets predicate exactly matches the paper-facing
S007 predicate, which explicitly asks for three distinct four-MIS. -/
theorem compatibleTriple_iff_unordered (G : SimpleGraph Vertex)
    (q : Finset (Finset Vertex)) :
    CompatibleTriple G q ↔ IsUnorderedCompatibleTriple G q := by
  classical
  constructor
  · intro h
    have hc := compatibleTriple_card h
    obtain ⟨s, t, r, hp, hm, rfl⟩ := h
    have hst := complementaryFourMIS_ne hp
    obtain ⟨hrs, hrt⟩ := mixedFourMIS_ne_sides hm
    refine ⟨hc, ?_, s, by simp, t, by simp, r, by simp,
      hst, Ne.symm hrs, Ne.symm hrt, hp.2.2.2.2, hm.2.2.1, hm.2.2.2⟩
    intro a ha
    simp only [Finset.mem_insert, Finset.mem_singleton] at ha
    rcases ha with rfl | rfl | rfl
    · exact ⟨hp.1, hp.2.2.1⟩
    · exact ⟨hp.2.1, hp.2.2.2.1⟩
    · exact ⟨hm.1, hm.2.1⟩
  · rintro ⟨hc, hall, s, hs, t, ht, r, hr, hst, hsr, htr, hcomp, h1, h2⟩
    refine ⟨s, t, r, ⟨(hall s hs).1, (hall t ht).1,
      (hall s hs).2, (hall t ht).2, hcomp⟩,
      ⟨(hall r hr).1, (hall r hr).2, h1, h2⟩, ?_⟩
    have hsub : ({s, t, r} : Finset (Finset Vertex)) ⊆ q := by
      intro x hx
      simp only [Finset.mem_insert, Finset.mem_singleton] at hx
      rcases hx with rfl | rfl | rfl <;> assumption
    have hcard : ({s, t, r} : Finset (Finset Vertex)).card = 3 := by
      simp [hst, hsr, htr]
    exact (Finset.eq_of_subset_of_card_le hsub (by omega)).symm

/-- The generic subtype cardinality and the paper's finite-filter count agree. -/
theorem compatibleTripleCount_eq_unordered (G : SimpleGraph Vertex) :
    compatibleTripleCount G = unorderedCompatibleTripleCount G := by
  classical
  simp only [compatibleTripleCount, unorderedCompatibleTripleCount,
    Fintype.card_subtype, compatibleTriple_iff_unordered]

/-- This closes the unordered h(G) -> anchored third-set count bridge.
The graph remains arbitrary: no matrix representation is assumed. -/
theorem unorderedCompatibleTripleCount_eq_anchored
    (G : SimpleGraph Vertex) (hc : G.Connected) (s : Finset Vertex)
    (hs : FourMISPartition G s) :
    unorderedCompatibleTripleCount G = anchoredMixedThirdCount G s := by
  classical
  have hcard : (Finset.univ \ s).card = 4 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ s)]
    simp [hs.1]
  have hp : ComplementaryFourMIS G s (Finset.univ \ s) :=
    ⟨hs.1, hcard, hs.2.1, hs.2.2, rfl⟩
  rw [← compatibleTripleCount_eq_unordered,
    connected_compatibleTripleCount_eq_partitionMixedCount G hc (0 : Vertex) hp]
  unfold partitionMixedCount anchoredMixedThirdCount
  rw [Fintype.card_subtype]
  congr 1
  ext r
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  change MixedFourMIS G s (Finset.univ \ s) r ↔ IsAnchoredMixedThird G s r
  constructor
  · exact fun h => h.2
  · exact fun h => ⟨anchoredMixedThird_card G s r h, h⟩

#print axioms PDIC.anchoredMixedThird_card
#print axioms PDIC.compatibleTriple_iff_unordered
#print axioms PDIC.compatibleTripleCount_eq_unordered
#print axioms PDIC.unorderedCompatibleTripleCount_eq_anchored

end PDIC

namespace PDIC

def splitLeft : Finset SplitVertex := (Finset.univ : Finset Side).disjSum ∅
def splitRight : Finset SplitVertex := (∅ : Finset Side).disjSum Finset.univ

theorem splitRight_eq_complement : splitRight = Finset.univ \ splitLeft := by
  ext v
  cases v <;> simp [splitLeft, splitRight]

theorem split_inter_card (r : Finset SplitVertex) :
    (r ∩ splitLeft).card = r.toLeft.card ∧
      (r ∩ splitRight).card = r.toRight.card := by
  have hl : r ∩ splitLeft = r.toLeft.disjSum ∅ := by
    ext v
    cases v <;> simp [splitLeft]
  have hr : r ∩ splitRight = (∅ : Finset Side).disjSum r.toRight := by
    ext v
    cases v <;> simp [splitRight]
  simp [hl, hr]

/-- Connectedness forces both pure sides to dominate the other side. -/
theorem connected_matrixGraph_pure_MIS (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) :
    GraphMIS (matrixGraph adj) splitLeft ∧ GraphMIS (matrixGraph adj) splitRight := by
  constructor
  · constructor
    · intro u hu v hv
      cases u <;> cases v <;> simp_all [splitLeft, matrixGraph]
    · intro v hv
      cases v with
      | inl i => simp [splitLeft] at hv
      | inr j =>
        obtain ⟨u, he⟩ := hc.preconnected.exists_adj_of_nontrivial (Sum.inr j)
        cases u with
        | inl i => exact ⟨Sum.inl i, by simp [splitLeft], he⟩
        | inr k => exact False.elim he
  · constructor
    · intro u hu v hv
      cases u <;> cases v <;> simp_all [splitRight, matrixGraph]
    · intro v hv
      cases v with
      | inr j => simp [splitRight] at hv
      | inl i =>
        obtain ⟨u, he⟩ := hc.preconnected.exists_adj_of_nontrivial (Sum.inl i)
        cases u with
        | inr j => exact ⟨Sum.inr j, by simp [splitRight], he⟩
        | inl k => exact False.elim he

theorem connected_matrixGraph_complementaryFourMIS (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) :
    ComplementaryFourMIS (matrixGraph adj) splitLeft splitRight := by
  obtain ⟨hl, hr⟩ := connected_matrixGraph_pure_MIS adj hc
  exact ⟨by decide, by decide, hl, hr, splitRight_eq_complement⟩

theorem mixedFourMIS_iff_split (adj : Side → Side → Bool) (r : Finset SplitVertex) :
    MixedFourMIS (matrixGraph adj) splitLeft splitRight r ↔
      r.toLeft.card = 2 ∧ r.toRight.card = 2 ∧ GraphMIS (matrixGraph adj) r := by
  obtain ⟨hl, hr⟩ := split_inter_card r
  constructor
  · rintro ⟨_, hm, hs, ht⟩
    exact ⟨hl ▸ hs, hr ▸ ht, hm⟩
  · rintro ⟨hs, ht, hm⟩
    have hc := Finset.card_disjSum r.toLeft r.toRight
    rw [Finset.toLeft_disjSum_toRight, hs, ht] at hc
    exact ⟨hc, hm, hl.trans hs, hr.trans ht⟩

/-- The full unordered h count of a connected matrix graph is the certified B(A). -/
theorem connected_compatibleTripleCount_matrix (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) :
    compatibleTripleCount (matrixGraph adj) = graphMixedCount adj := by
  classical
  rw [connected_compatibleTripleCount_eq_partitionMixedCount (matrixGraph adj) hc
    (Sum.inl (0 : Side)) (connected_matrixGraph_complementaryFourMIS adj hc)]
  exact Fintype.card_congr (Equiv.subtypeEquivRight (mixedFourMIS_iff_split adj))

theorem connected_compatibleTripleCount_matrix_le_three (adj : Side → Side → Bool)
    (hc : (matrixGraph adj).Connected) :
    compatibleTripleCount (matrixGraph adj) ≤ 3 := by
  rw [connected_compatibleTripleCount_matrix adj hc]
  exact connected_graphMixedCount_le_three adj hc

#print axioms PDIC.splitRight_eq_complement
#print axioms PDIC.split_inter_card
#print axioms PDIC.connected_matrixGraph_pure_MIS
#print axioms PDIC.connected_matrixGraph_complementaryFourMIS
#print axioms PDIC.mixedFourMIS_iff_split
#print axioms PDIC.connected_compatibleTripleCount_matrix
#print axioms PDIC.connected_compatibleTripleCount_matrix_le_three

end PDIC

namespace PDIC

theorem graphMIS_map_iff {V W : Type*} [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (s : Finset V) :
    GraphMIS H (s.map e.toEquiv.toEmbedding) ↔ GraphMIS G s := by
  classical
  constructor
  · rintro ⟨hi, hd⟩
    constructor
    · intro u hu v hv he
      exact hi (e u) (Finset.mem_map.mpr ⟨u, hu, rfl⟩)
        (e v) (Finset.mem_map.mpr ⟨v, hv, rfl⟩) (e.map_rel_iff.mpr he)
    · intro v hv
      have hn : e v ∉ s.map e.toEquiv.toEmbedding := by
        intro hm
        obtain ⟨w, hw, he⟩ := Finset.mem_map.mp hm
        exact hv ((e.injective he) ▸ hw)
      obtain ⟨w, hw, he⟩ := hd (e v) hn
      obtain ⟨u, hu, rfl⟩ := Finset.mem_map.mp hw
      exact ⟨u, hu, e.map_rel_iff.mp he⟩
  · rintro ⟨hi, hd⟩
    constructor
    · intro u hu v hv he
      obtain ⟨a, ha, rfl⟩ := Finset.mem_map.mp hu
      obtain ⟨b, hb, rfl⟩ := Finset.mem_map.mp hv
      exact hi a ha b hb (e.map_rel_iff.mp he)
    · intro v hv
      have hn : e.symm v ∉ s := by
        intro hm
        exact hv (Finset.mem_map.mpr ⟨e.symm v, hm, e.apply_symm_apply v⟩)
      obtain ⟨u, hu, he⟩ := hd (e.symm v) hn
      exact ⟨e u, Finset.mem_map.mpr ⟨u, hu, rfl⟩,
        by simpa using e.map_rel_iff.mpr he⟩

theorem complementaryFourMIS_map_iff
    {V W : Type*} [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (s t : Finset V) :
    ComplementaryFourMIS H (s.map e.toEquiv.toEmbedding) (t.map e.toEquiv.toEmbedding) ↔
      ComplementaryFourMIS G s t := by
  classical
  have he : (Finset.univ \ s).map e.toEquiv.toEmbedding =
      Finset.univ \ s.map e.toEquiv.toEmbedding := by
    rw [Finset.map_sdiff, Finset.map_univ_equiv]
  simp only [ComplementaryFourMIS, Finset.card_map, graphMIS_map_iff, ← he,
    Finset.map_inj]

theorem mixedFourMIS_map_iff
    {V W : Type*} [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (s t r : Finset V) :
    MixedFourMIS H (s.map e.toEquiv.toEmbedding) (t.map e.toEquiv.toEmbedding)
      (r.map e.toEquiv.toEmbedding) ↔ MixedFourMIS G s t r := by
  classical
  simp only [MixedFourMIS, Finset.card_map, graphMIS_map_iff, ← Finset.map_inter]

/-- Relabelling vertices transports genuine unordered compatible triples. -/
theorem compatibleTriple_map
    {V W : Type*} [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H)
    (q : Finset (Finset V)) (hq : CompatibleTriple G q) :
    CompatibleTriple H ((Equiv.finsetCongr (Equiv.finsetCongr e.toEquiv)) q) := by
  classical
  obtain ⟨s, t, r, hp, hm, rfl⟩ := hq
  refine ⟨s.map e.toEquiv.toEmbedding, t.map e.toEquiv.toEmbedding,
    r.map e.toEquiv.toEmbedding, (complementaryFourMIS_map_iff e s t).mpr hp,
    (mixedFourMIS_map_iff e s t r).mpr hm, ?_⟩
  simp [Equiv.finsetCongr_apply]

theorem compatibleTriple_map_iff
    {V W : Type*} [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) (q : Finset (Finset V)) :
    CompatibleTriple G q ↔
      CompatibleTriple H ((Equiv.finsetCongr (Equiv.finsetCongr e.toEquiv)) q) := by
  constructor
  · exact compatibleTriple_map e q
  · intro h
    have hh := compatibleTriple_map e.symm _ h
    let E := Equiv.finsetCongr (Equiv.finsetCongr e.toEquiv)
    change CompatibleTriple G (E.symm (E q)) at hh
    simpa only [Equiv.symm_apply_apply] using hh

/-- The set-of-sets count is a graph isomorphism invariant, not a labelling statistic. -/
theorem compatibleTripleCount_iso
    {V W : Type*} [Fintype V] [Fintype W] [DecidableEq V] [DecidableEq W]
    {G : SimpleGraph V} {H : SimpleGraph W} (e : G ≃g H) :
    compatibleTripleCount G = compatibleTripleCount H := by
  classical
  exact Fintype.card_congr (Equiv.subtypeEquiv
    (Equiv.finsetCongr (Equiv.finsetCongr e.toEquiv)) (compatibleTriple_map_iff e))

#print axioms PDIC.graphMIS_map_iff
#print axioms PDIC.complementaryFourMIS_map_iff
#print axioms PDIC.mixedFourMIS_map_iff
#print axioms PDIC.compatibleTriple_map
#print axioms PDIC.compatibleTriple_map_iff
#print axioms PDIC.compatibleTripleCount_iso

end PDIC

namespace PDIC

/-- A four-element side and its four-element complement give an actual
bijection from Fin 4 + Fin 4, with the two side membership laws. -/
theorem exists_balancedSplitEquiv (s : Finset Vertex)
    (hs : s.card = 4) (ht : (Finset.univ \ s).card = 4) :
    ∃ e : SplitVertex ≃ Vertex,
      (∀ i : Side, e (Sum.inl i) ∈ s) ∧
      (∀ j : Side, e (Sum.inr j) ∉ s) := by
  classical
  let l : Side ≃ {v // v ∈ s} := (s.equivFinOfCardEq hs).symm
  let r0 : Side ≃ {v // v ∈ (Finset.univ \ s)} :=
    ((Finset.univ \ s).equivFinOfCardEq ht).symm
  let r : Side ≃ {v // v ∉ s} := r0.trans
    (Equiv.subtypeEquivRight (fun v => by simp))
  let e : SplitVertex ≃ Vertex := (Equiv.sumCongr l r).trans
    (Equiv.sumCompl (fun v => v ∈ s))
  refine ⟨e, ?_, ?_⟩
  · intro i
    exact (l i).property
  · intro j
    exact (r j).property

/-- An arbitrary balanced independent partition transfers all adjacency,
including absent within-side edges, to a Boolean matrix graph. -/
theorem exists_matrixGraph_iso (G : SimpleGraph Vertex) (s : Finset Vertex)
    (hs : FourMISPartition G s) :
    ∃ adj : Side → Side → Bool, Nonempty (matrixGraph adj ≃g G) := by
  classical
  have ht : (Finset.univ \ s).card = 4 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ s)]
    simp [hs.1]
  obtain ⟨e, hl, hr⟩ := exists_balancedSplitEquiv s hs.1 ht
  let adj : Side → Side → Bool := fun i j => decide (G.Adj (e (Sum.inl i)) (e (Sum.inr j)))
  refine ⟨adj, ⟨{ toEquiv := e, map_rel_iff' := ?_ }⟩⟩
  intro u v
  cases u with
  | inl i =>
    cases v with
    | inl k =>
      exact iff_false_intro (hs.2.1.1 _ (hl i) _ (hl k))
    | inr j => simp [matrixGraph, adj]
  | inr j =>
    cases v with
    | inl i => simpa [matrixGraph, adj] using (G.adj_comm (e (Sum.inr j)) (e (Sum.inl i)))
    | inr k =>
      exact iff_false_intro (hs.2.2.1 _ (by simp [hr j]) _ (by simp [hr k]))

/-- General eight-vertex graph bound: a genuine unordered triple count,
with no balanced-partition, matrix, edge-count or count-equality hypothesis. -/
theorem connected_unorderedCompatibleTripleCount_le_three
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    unorderedCompatibleTripleCount G ≤ 3 := by
  classical
  by_cases hp : ∃ s, FourMISPartition G s
  · obtain ⟨s, hs⟩ := hp
    obtain ⟨adj, ⟨e⟩⟩ := exists_matrixGraph_iso G s hs
    rw [← compatibleTripleCount_eq_unordered, ← compatibleTripleCount_iso e]
    exact connected_compatibleTripleCount_matrix_le_three adj (e.connected_iff.mpr hc)
  · rw [unorderedCompatibleTripleCount_zero_of_no_partition G hp]
    omega

#print axioms PDIC.exists_balancedSplitEquiv
#print axioms PDIC.exists_matrixGraph_iso
#print axioms PDIC.connected_unorderedCompatibleTripleCount_le_three

end PDIC

namespace PDIC

/-- On exactly eight vertices, disjoint four-sets are complementary.
Thus the complement used in the invariant is not an extra graph hypothesis. -/
theorem disjoint_four_sets_complement (s t : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) (hd : Disjoint s t) :
    t = Finset.univ \ s := by
  classical
  have hcard : (s ∪ t).card = 8 := by
    rw [Finset.card_union_of_disjoint hd, hs, ht]
  have hu : s ∪ t = Finset.univ := Finset.eq_of_subset_of_card_le
    (Finset.subset_univ _) (by simp [hcard, Vertex])
  ext v
  simp only [Finset.mem_sdiff, Finset.mem_univ, true_and]
  constructor
  · intro hv hs'
    exact Finset.disjoint_left.mp hd hs' hv
  · intro hv
    have hm : v ∈ s ∪ t := by rw [hu]; simp
    exact (Finset.mem_union.mp hm).resolve_left hv

theorem complementaryFourMIS_iff_disjoint (G : SimpleGraph Vertex)
    (s t : Finset Vertex) :
    ComplementaryFourMIS G s t ↔
      s.card = 4 ∧ t.card = 4 ∧ GraphMIS G s ∧ GraphMIS G t ∧ Disjoint s t := by
  constructor
  · rintro ⟨hs, ht, hms, hmt, he⟩
    refine ⟨hs, ht, hms, hmt, ?_⟩
    rw [he]
    exact disjoint_sdiff_self_right
  · rintro ⟨hs, ht, hms, hmt, hd⟩
    exact ⟨hs, ht, hms, hmt, disjoint_four_sets_complement s t hs ht hd⟩

/-- Explicit graph-to-matrix cardinality bridge for any connected graph
with a complementary four-MIS pair. Neither the isomorphism nor h=B is an input. -/
theorem connected_partition_h_eq_matrix (G : SimpleGraph Vertex)
    (hc : G.Connected) (s : Finset Vertex) (hs : FourMISPartition G s) :
    ∃ adj : Side → Side → Bool,
      (matrixGraph adj).Connected ∧ Nonempty (matrixGraph adj ≃g G) ∧
        unorderedCompatibleTripleCount G = graphMixedCount adj := by
  obtain ⟨adj, ⟨e⟩⟩ := exists_matrixGraph_iso G s hs
  have hm := e.connected_iff.mpr hc
  refine ⟨adj, hm, ⟨e⟩, ?_⟩
  rw [← compatibleTripleCount_eq_unordered, ← compatibleTripleCount_iso e,
    connected_compatibleTripleCount_matrix adj hm]

#print axioms PDIC.disjoint_four_sets_complement
#print axioms PDIC.complementaryFourMIS_iff_disjoint
#print axioms PDIC.connected_partition_h_eq_matrix

end PDIC


namespace PDIC

/-! S008: the named, labelled spider and its concrete connected matrix model.
    The difficult converse (a normalising permutation for every equality
    matrix) is deliberately NOT taken as an axiom. -/

public theorem spiderAdj_symmetric : ∀ u v : Vertex, spiderAdj u v = true → spiderAdj v u = true := by decide
public theorem spiderAdj_loopless : ∀ u : Vertex, ¬ spiderAdj u u = true := by decide

set_option backward.proofsInPublic true
/-- The actual simple graph with edges 04, 05, 06, 07, 16, 25, 34. -/
@[expose] public def namedSpider : SimpleGraph Vertex where
  Adj u v := spiderAdj u v = true
  symm.symm := spiderAdj_symmetric
  loopless.irrefl := spiderAdj_loopless
set_option backward.proofsInPublic false

/-- A labelled four-by-four presentation, with row zero the hub. -/
def canonicalSpiderMatrix (i j : Side) : Bool :=
  decide (i = 0 ∨ (i = 1 ∧ j = 2) ∨
    (i = 2 ∧ j = 1) ∨ (i = 3 ∧ j = 0))

/-- The explicit map identifies the split vertex sides with labels 0..3
    and 4..7, without quotienting or forgetting nonedges. -/
def spiderSplitEquiv : SplitVertex ≃ Vertex where
  toFun v := match v with
    | .inl i => ⟨i.val, by omega⟩
    | .inr j => ⟨j.val + 4, by omega⟩
  invFun v :=
    if h : v.val < 4 then .inl ⟨v.val, h⟩
    else .inr ⟨v.val - 4, by omega⟩
  left_inv := by
    intro v
    cases v with
    | inl i => fin_cases i <;> decide
    | inr j => fin_cases j <;> decide
  right_inv := by
    intro v
    fin_cases v <;> decide

/-- This is an actual SimpleGraph isomorphism, not merely row-shape data. -/
def canonicalSpiderIso : matrixGraph canonicalSpiderMatrix ≃g namedSpider where
  toEquiv := spiderSplitEquiv
  map_rel_iff' := by
    intro u v
    cases u with
    | inl i =>
      cases v with
      | inl j => fin_cases i <;> fin_cases j <;>
          simp [matrixGraph, namedSpider, canonicalSpiderMatrix, spiderAdj, spiderSplitEquiv]
      | inr j => fin_cases i <;> fin_cases j <;>
          simp [matrixGraph, namedSpider, canonicalSpiderMatrix, spiderAdj, spiderSplitEquiv]
    | inr i =>
      cases v with
      | inl j => fin_cases i <;> fin_cases j <;>
          simp [matrixGraph, namedSpider, canonicalSpiderMatrix, spiderAdj, spiderSplitEquiv]
      | inr j => fin_cases i <;> fin_cases j <;>
          simp [matrixGraph, namedSpider, canonicalSpiderMatrix, spiderAdj, spiderSplitEquiv]

/-- Each left vertex has an explicitly chosen right neighbour. -/
def spiderSpoke (i : Side) : Side :=
  if i = 1 then 2 else if i = 2 then 1 else 0

/-- Every vertex has a walk from the hub, using at most two edges. -/
theorem canonicalSpider_root_reachable (u : SplitVertex) :
    (matrixGraph canonicalSpiderMatrix).Reachable (Sum.inl (0 : Side)) u := by
  cases u with
  | inl i =>
    have h1 : (matrixGraph canonicalSpiderMatrix).Adj
        (Sum.inl (0 : Side)) (Sum.inr (spiderSpoke i)) := by
      fin_cases i <;> simp [matrixGraph, canonicalSpiderMatrix, spiderSpoke]
    have h2 : (matrixGraph canonicalSpiderMatrix).Adj
        (Sum.inr (spiderSpoke i)) (Sum.inl i) := by
      fin_cases i <;> simp [matrixGraph, canonicalSpiderMatrix, spiderSpoke]
    exact ⟨.cons h1 (.cons h2 .nil)⟩
  | inr j =>
    have h : (matrixGraph canonicalSpiderMatrix).Adj
        (Sum.inl (0 : Side)) (Sum.inr j) := by
      fin_cases j <;> simp [matrixGraph, canonicalSpiderMatrix]
    exact ⟨.cons h .nil⟩

theorem canonicalSpider_connected :
    (matrixGraph canonicalSpiderMatrix).Connected := by
  apply (SimpleGraph.connected_iff_exists_forall_reachable _).mpr
  exact ⟨Sum.inl (0 : Side), canonicalSpider_root_reachable⟩

/-- The exact h=3 claim for the concrete named spider; no global
    equality-case classification is being smuggled into this proof. -/
theorem namedSpider_unorderedCompatibleTripleCount_three :
    unorderedCompatibleTripleCount namedSpider = 3 := by
  have hm : graphMixedCount canonicalSpiderMatrix = 3 := by
    rw [graphMixedCount_eq_actual]
    exact ((seven_edges_three_mixed_iff_spider canonicalSpiderMatrix).mpr
      (by decide)).2
  calc
    unorderedCompatibleTripleCount namedSpider =
        compatibleTripleCount namedSpider :=
      (compatibleTripleCount_eq_unordered namedSpider).symm
    _ = compatibleTripleCount (matrixGraph canonicalSpiderMatrix) :=
      (compatibleTripleCount_iso canonicalSpiderIso).symm
    _ = graphMixedCount canonicalSpiderMatrix :=
      connected_compatibleTripleCount_matrix canonicalSpiderMatrix canonicalSpider_connected
    _ = 3 := hm

#print axioms PDIC.canonicalSpiderIso
#print axioms PDIC.canonicalSpider_connected
#print axioms PDIC.namedSpider_unorderedCompatibleTripleCount_three

end PDIC


namespace PDIC

/-! S009: a *genuine* graph-isomorphism certificate for every equality
matrix.  The finite certificate only chooses 4-by-4 side permutations and
whether to exchange the two sides.  Graph adjacency is transported
separately, for all vertex pairs including nonedges. -/

/-! S010: break the former 65,536-matrix × permutation proof into
    one 3-leaf kernel certificate, four explicit row-hub relabellings,
    and a transpose identity.  No theorem assumes the desired isomorphism. -/

set_option maxRecDepth 16384
set_option maxHeartbeats 0

/-- For a fixed hub in row zero only the three other row masks vary.
The six choices of ordered distinct singleton neighbours are checked by
a small finite, kernel-reduced certificate rather than global search. -/
private theorem spiderHubZero_leaves (b c d : BitVec 4)
    (h : threeDistinctLeavesBV b c d = true) :
    ∃ q : Side ≃ Side, ∀ i j : Side,
      (adjOfRows (fourRows (15 : BitVec 4) b c d) i j = true) ↔
        canonicalSpiderMatrix i (q j) = true := by
  revert b c d
  decide +kernel

/-- The four weighted Boolean masks contribute to disjoint bits.
Only sixteen Boolean inputs and four bit positions occur in the kernel check. -/
private theorem spiderWeightedBit (p q r s : Bool) (i : Side) :
    (((if p then (1 : BitVec 4) else 0) +
      (if q then 2 else 0) +
      (if r then 4 else 0) +
      (if s then 8 else 0)).getLsbD i.val) =
      (if i = 0 then p else if i = 1 then q else if i = 2 then r else s) := by
  revert p q r s i
  decide +kernel

/-- A column mask is precisely the transposed row adjacency.
The kernel proof reduces to the sixteen cell positions, reusing
spiderWeightedBit instead of searching over all 65,536 matrices. -/
private theorem spiderTransposeCells (a b c d : BitVec 4) (i j : Side) :
    adjOfRows (fourRows
      (columnOfRowsBV a b c d 0)
      (columnOfRowsBV a b c d 1)
      (columnOfRowsBV a b c d 2)
      (columnOfRowsBV a b c d 3)) i j =
    adjOfRows (fourRows a b c d) j i := by
  fin_cases i
  · fin_cases j
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 0) (b.getLsbD 0)
          (c.getLsbD 0) (d.getLsbD 0) (0 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 0) (b.getLsbD 0)
          (c.getLsbD 0) (d.getLsbD 0) (1 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 0) (b.getLsbD 0)
          (c.getLsbD 0) (d.getLsbD 0) (2 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 0) (b.getLsbD 0)
          (c.getLsbD 0) (d.getLsbD 0) (3 : Side))
  · fin_cases j
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 1) (b.getLsbD 1)
          (c.getLsbD 1) (d.getLsbD 1) (0 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 1) (b.getLsbD 1)
          (c.getLsbD 1) (d.getLsbD 1) (1 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 1) (b.getLsbD 1)
          (c.getLsbD 1) (d.getLsbD 1) (2 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 1) (b.getLsbD 1)
          (c.getLsbD 1) (d.getLsbD 1) (3 : Side))
  · fin_cases j
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 2) (b.getLsbD 2)
          (c.getLsbD 2) (d.getLsbD 2) (0 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 2) (b.getLsbD 2)
          (c.getLsbD 2) (d.getLsbD 2) (1 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 2) (b.getLsbD 2)
          (c.getLsbD 2) (d.getLsbD 2) (2 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 2) (b.getLsbD 2)
          (c.getLsbD 2) (d.getLsbD 2) (3 : Side))
  · fin_cases j
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 3) (b.getLsbD 3)
          (c.getLsbD 3) (d.getLsbD 3) (0 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 3) (b.getLsbD 3)
          (c.getLsbD 3) (d.getLsbD 3) (1 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 3) (b.getLsbD 3)
          (c.getLsbD 3) (d.getLsbD 3) (2 : Side))
    · simpa [adjOfRows, fourRows, columnOfRowsBV] using
        (spiderWeightedBit (a.getLsbD 3) (b.getLsbD 3)
          (c.getLsbD 3) (d.getLsbD 3) (3 : Side))

/-- Hub-on-the-left normalisation. The only finite search occurs in
spiderHubZero_leaves: row placements are explicit swaps. -/
private theorem spiderHubRows_permutations (a b c d : BitVec 4)
    (hs : spiderHubRowsBV a b c d = true) :
    ∃ p q : Side ≃ Side, ∀ i j : Side,
      (adjOfRows (fourRows a b c d) i j = true) ↔
        canonicalSpiderMatrix (p i) (q j) = true := by
  have hcases :
      (a = 15 ∧ threeDistinctLeavesBV b c d = true) ∨
      (b = 15 ∧ threeDistinctLeavesBV a c d = true) ∨
      (c = 15 ∧ threeDistinctLeavesBV a b d = true) ∨
      (d = 15 ∧ threeDistinctLeavesBV a b c = true) := by
    simpa [spiderHubRowsBV, Bool.or_eq_true, Bool.and_eq_true, or_assoc] using hs
  rcases hcases with ⟨ha, hleaf⟩ | ⟨hb, hleaf⟩ |
    ⟨hc, hleaf⟩ | ⟨hd, hleaf⟩
  · subst a
    obtain ⟨q, hq⟩ := spiderHubZero_leaves b c d hleaf
    exact ⟨Equiv.refl Side, q, by intro i j; simpa using hq i j⟩
  · subst b
    obtain ⟨q, hq⟩ := spiderHubZero_leaves a c d hleaf
    refine ⟨Equiv.swap (0 : Side) (1 : Side), q, ?_⟩
    intro i j
    fin_cases i
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (1 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (0 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (2 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (3 : Side) j
  · subst c
    obtain ⟨q, hq⟩ := spiderHubZero_leaves a b d hleaf
    refine ⟨(Equiv.swap (0 : Side) (2 : Side)).trans
      (Equiv.swap (1 : Side) (2 : Side)), q, ?_⟩
    intro i j
    fin_cases i
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (1 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (2 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (0 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (3 : Side) j
  · subst d
    obtain ⟨q, hq⟩ := spiderHubZero_leaves a b c hleaf
    refine ⟨((Equiv.swap (0 : Side) (3 : Side)).trans
      (Equiv.swap (1 : Side) (3 : Side))).trans
      (Equiv.swap (2 : Side) (3 : Side)), q, ?_⟩
    intro i j
    fin_cases i
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (1 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (2 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (3 : Side) j
    · simpa [adjOfRows, fourRows, Equiv.swap_apply_def] using hq (0 : Side) j

/-- Universal orientation certificate, now factoring out the transpose
and normalising only the three leaves of a fixed hub. -/
theorem spiderBitRows_permutation_certificate (a b c d : BitVec 4)
    (hs : spiderMatrixBV a b c d = true) :
    ∃ swapSides : Bool, ∃ p q : Side ≃ Side,
      ∀ i j : Side,
        (adjOfRows (fourRows a b c d) i j = true) ↔
          (if swapSides then canonicalSpiderMatrix (p j) (q i)
           else canonicalSpiderMatrix (p i) (q j)) = true := by
  have hor :
      spiderHubRowsBV a b c d = true ∨
      spiderHubRowsBV
        (columnOfRowsBV a b c d 0)
        (columnOfRowsBV a b c d 1)
        (columnOfRowsBV a b c d 2)
        (columnOfRowsBV a b c d 3) = true := by
    simpa only [spiderMatrixBV, Bool.or_eq_true] using hs
  rcases hor with hrow | hcol
  · obtain ⟨p, q, h⟩ := spiderHubRows_permutations a b c d hrow
    exact ⟨false, p, q, by intro i j; simpa using h i j⟩
  · obtain ⟨p, q, h⟩ := spiderHubRows_permutations
        (columnOfRowsBV a b c d 0)
        (columnOfRowsBV a b c d 1)
        (columnOfRowsBV a b c d 2)
        (columnOfRowsBV a b c d 3) hcol
    refine ⟨true, p, q, ?_⟩
    intro i j
    simpa only [ite_true, ite_false] using
      (spiderTransposeCells a b c d j i ▸ h j i)

#print axioms PDIC.spiderHubZero_leaves
#print axioms PDIC.spiderHubRows_permutations
#print axioms PDIC.spiderBitRows_permutation_certificate

/-- Exchange the two four-vertex sides without making any assumption
about the edge relation. -/
private def spiderSideSwap : SplitVertex ≃ SplitVertex where
  toFun
    | .inl i => .inr i
    | .inr j => .inl j
  invFun
    | .inl i => .inr i
    | .inr j => .inl j
  left_inv := by intro v; cases v <;> rfl
  right_inv := by intro v; cases v <;> rfl

/-- Each row/column relabelling respecting all 16 entries gives an actual
graph isomorphism, including both pure-side nonedge classes. -/
private def spiderRowPermutationIso
    (adj : Side → Side → Bool) (p q : Side ≃ Side)
    (h : ∀ i j, adj i j = true ↔ canonicalSpiderMatrix (p i) (q j) = true) :
    matrixGraph adj ≃g matrixGraph canonicalSpiderMatrix where
  toEquiv := Equiv.sumCongr p q
  map_rel_iff' := by
    intro u v
    cases u with
    | inl i =>
      cases v with
      | inl j => simp [matrixGraph]
      | inr j => exact (h i j).symm
    | inr i =>
      cases v with
      | inl j => exact (h j i).symm
      | inr j => simp [matrixGraph]

/-- The transposed alternative is treated by a genuine swap of the graph
sides, not by assuming the matrix is row-centred. -/
private def spiderColumnPermutationIso
    (adj : Side → Side → Bool) (p q : Side ≃ Side)
    (h : ∀ i j, adj i j = true ↔ canonicalSpiderMatrix (p j) (q i) = true) :
    matrixGraph adj ≃g matrixGraph canonicalSpiderMatrix where
  toEquiv := spiderSideSwap.trans (Equiv.sumCongr p q)
  map_rel_iff' := by
    intro u v
    cases u with
    | inl i =>
      cases v with
      | inl j => simp [matrixGraph, spiderSideSwap]
      | inr j => simpa [matrixGraph, spiderSideSwap] using (h i j).symm
    | inr i =>
      cases v with
      | inl j => simpa [matrixGraph, spiderSideSwap] using (h j i).symm
      | inr j => simp [matrixGraph, spiderSideSwap]

/-- Universal spider-pattern to named labelled graph isomorphism. -/
theorem spiderPattern_matrixGraph_iso (adj : Side → Side → Bool)
    (hs : spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
      (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true) :
    Nonempty (matrixGraph adj ≃g namedSpider) := by
  let a := rowsOfAdj adj 0
  let b := rowsOfAdj adj 1
  let c := rowsOfAdj adj 2
  let d := rowsOfAdj adj 3
  obtain ⟨swapSides, p, q, hnorm⟩ :=
    spiderBitRows_permutation_certificate a b c d hs
  have hadj : adjOfRows (fourRows a b c d) = adj := by
    dsimp [a, b, c, d]
    rw [fourRows_rowsOfAdj, adjOfRows_rowsOfAdj]
  have h : ∀ i j : Side,
      (adj i j = true) ↔
        (if swapSides then canonicalSpiderMatrix (p j) (q i)
         else canonicalSpiderMatrix (p i) (q j)) = true := by
    intro i j
    simpa only [hadj] using hnorm i j
  cases swapSides with
  | false =>
    refine ⟨(spiderRowPermutationIso adj p q ?_).trans canonicalSpiderIso⟩
    intro i j
    simpa using h i j
  | true =>
    refine ⟨(spiderColumnPermutationIso adj p q ?_).trans canonicalSpiderIso⟩
    intro i j
    simpa using h i j

/-- The equality case for the genuine unordered triple count, for every
connected eight-vertex simple graph, is precisely the named spider. -/
theorem connected_h_three_iff_namedSpider (G : SimpleGraph Vertex)
    (hconn : G.Connected) :
    unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider) := by
  constructor
  · intro hh
    have hp : ∃ s : Finset Vertex, FourMISPartition G s := by
      by_contra hn
      have hz := unorderedCompatibleTripleCount_zero_of_no_partition G hn
      omega
    obtain ⟨s, hs⟩ := hp
    obtain ⟨adj, hm, ⟨e⟩, heq⟩ := connected_partition_h_eq_matrix G hconn s hs
    have hpatt : spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1)
        (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true :=
      (connected_graphMixedCount_three_iff_pattern adj hm).mp (by omega)
    obtain ⟨f⟩ := spiderPattern_matrixGraph_iso adj hpatt
    exact ⟨e.symm.trans f⟩
  · rintro ⟨e⟩
    calc
      unorderedCompatibleTripleCount G = compatibleTripleCount G :=
        (compatibleTripleCount_eq_unordered G).symm
      _ = compatibleTripleCount namedSpider := compatibleTripleCount_iso e
      _ = unorderedCompatibleTripleCount namedSpider :=
        compatibleTripleCount_eq_unordered namedSpider
      _ = 3 := namedSpider_unorderedCompatibleTripleCount_three

#print axioms PDIC.spiderBitRows_permutation_certificate
#print axioms PDIC.spiderPattern_matrixGraph_iso
#print axioms PDIC.connected_h_three_iff_namedSpider

end PDIC


namespace PDIC

/-! S011: a genuine F₃³ cap, with the external cap classification
represented only by a supplied zero-fixing linear equivalence. -/

public abbrev CapPoint := Fin 3 → ZMod 3

def canonicalCapF3 (v : Vertex) : CapPoint :=
  fun j => (canonicalCap v j : ZMod 3)

public def capSum (f : Vertex → CapPoint) (s : Finset Vertex) : CapPoint :=
  ∑ v ∈ s, f v

public def IsAdmissibleCap (f : Vertex → CapPoint) : Prop :=
  Function.Injective f ∧
    ∀ s : Finset Vertex,
      (s.card = 1 ∨ s.card = 2 ∨ s.card = 3) → capSum f s ≠ 0

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
theorem canonicalCapF3_injective : Function.Injective canonicalCapF3 := by
  decide +kernel

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
theorem canonicalCapF3_short_zero_free :
    ∀ s : Finset Vertex, (s.card = 1 ∨ s.card = 2 ∨ s.card = 3) →
      capSum canonicalCapF3 s ≠ 0 := by
  decide +kernel

theorem canonicalCapF3_admissible : IsAdmissibleCap canonicalCapF3 := by
  exact ⟨canonicalCapF3_injective, canonicalCapF3_short_zero_free⟩

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
theorem canonicalCapF3_four_zero_iff :
    ∀ s : Finset Vertex, s.card = 4 →
      (capSum canonicalCapF3 s = 0 ↔
        ∃ i : QuartetIndex, quartet i = s) := by
  decide +kernel

/-- Linear maps preserving the origin commute with every finite label sum. -/
theorem capSum_linear (L : CapPoint ≃ₗ[ZMod 3] CapPoint)
    (f : Vertex → CapPoint) (s : Finset Vertex) :
    capSum (fun v => L (f v)) s = L (capSum f s) := by
  simp [capSum, map_sum]

theorem capSum_zero_linear_iff (L : CapPoint ≃ₗ[ZMod 3] CapPoint)
    (f : Vertex → CapPoint) (s : Finset Vertex) :
    capSum (fun v => L (f v)) s = 0 ↔ capSum f s = 0 := by
  rw [capSum_linear]
  constructor
  · intro h
    apply L.injective
    simpa using h
  · intro h
    simp [h]

/-- A supplied GL(3,3) transformation preserves the cap conditions. -/
theorem admissible_under_linear
    (L : CapPoint ≃ₗ[ZMod 3] CapPoint) (f : Vertex → CapPoint)
    (h : IsAdmissibleCap f) :
    IsAdmissibleCap (fun v => L (f v)) := by
  constructor
  · exact L.injective.comp h.1
  · intro s hs
    exact (capSum_zero_linear_iff L f s).not.mpr (h.2 s hs)

/-- Complete quartet classification, conditional ONLY on a supplied
zero-fixing linear equivalence; the classical existence claim is separate. -/
theorem linearCanonicalCap_four_zero_iff
    (L : CapPoint ≃ₗ[ZMod 3] CapPoint)
    (s : Finset Vertex) (hs : s.card = 4) :
    (capSum (fun v => L (canonicalCapF3 v)) s = 0 ↔
      ∃ i : QuartetIndex, quartet i = s) := by
  rw [capSum_zero_linear_iff]
  exact canonicalCapF3_four_zero_iff s hs

/-- The genuine finite uniform-labelling sample space has eight factorial
outcomes; this statement does not assert the event-fibre probabilities. -/
theorem uniformLabellings_card :
    Fintype.card (Equiv.Perm Vertex) = 40320 := by
  norm_num [Fintype.card_perm, Vertex]

#print axioms PDIC.canonicalCapF3_admissible
#print axioms PDIC.canonicalCapF3_four_zero_iff
#print axioms PDIC.capSum_zero_linear_iff
#print axioms PDIC.admissible_under_linear
#print axioms PDIC.linearCanonicalCap_four_zero_iff
#print axioms PDIC.uniformLabellings_card

end PDIC


namespace PDIC

/-! S012: move the typed cap sum through a *genuine permutation* of vertices.
    This is independent of the classical nine-cap classification. -/

/-- Reindex the typed F₃³ cap sum by a permutation of all eight vertices. -/
theorem capSum_perm_reindex (e : Equiv.Perm Vertex) (s : Finset Vertex) :
    capSum (fun v => canonicalCapF3 (e v)) s =
      capSum canonicalCapF3 (s.image e) := by
  classical
  unfold capSum
  exact (Finset.sum_image (s := s) (g := e)
    (f := canonicalCapF3) (fun _ _ _ _ h => e.injective h)).symm

/-- The exact canonical quartet condition after *any* label permutation. -/
theorem canonicalCapF3_perm_four_zero_iff
    (e : Equiv.Perm Vertex) (s : Finset Vertex) (hs : s.card = 4) :
    (capSum (fun v => canonicalCapF3 (e v)) s = 0 ↔
      ∃ i : QuartetIndex, quartet i = s.image e) := by
  rw [capSum_perm_reindex]
  apply canonicalCapF3_four_zero_iff
  simpa only [Finset.card_image_of_injective s e.injective] using hs

/-- A supplied invertible linear transformation cannot alter which labelled
    four-sets have zero sum; affine translations are *not* included. -/
theorem linearPermCanonicalCap_four_zero_iff
    (L : CapPoint ≃ₗ[ZMod 3] CapPoint)
    (e : Equiv.Perm Vertex) (s : Finset Vertex) (hs : s.card = 4) :
    (capSum (fun v => L (canonicalCapF3 (e v))) s = 0 ↔
      ∃ i : QuartetIndex, quartet i = s.image e) := by
  rw [capSum_zero_linear_iff]
  exact canonicalCapF3_perm_four_zero_iff e s hs

/-- Actual uniform finite probability: count *permutations*, not abstract
    moments, in the denominator certified as 8! by S011. -/
noncomputable def uniformPermEventProbability
    (P : Equiv.Perm Vertex → Prop) : ℚ := by
  classical
  exact (((Finset.univ : Finset (Equiv.Perm Vertex)).filter P).card : ℚ) /
    (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- The random variable in the manuscript, defined on actual eight-vertex
    graph maximal-independent four-sets under the typed canonical cap. -/
noncomputable def labellingZeroMISCount
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset Vertex)).filter
    (fun s => s.card = 4 ∧ GraphMIS G s ∧
      capSum (fun v => canonicalCapF3 (e v)) s = 0)).card

/-- The classical cap normal form is a *named proposition*, not an axiom or
    silently imported theorem.  Any use must supply its proof as a hypothesis. -/
def ClassicalCapNormalForm : Prop :=
  ∀ f : Vertex → CapPoint, IsAdmissibleCap f →
    ∃ (L : CapPoint ≃ₗ[ZMod 3] CapPoint) (p : Equiv.Perm Vertex),
      ∀ v, f v = L (canonicalCapF3 (p v))

#print axioms PDIC.capSum_perm_reindex
#print axioms PDIC.canonicalCapF3_perm_four_zero_iff
#print axioms PDIC.linearPermCanonicalCap_four_zero_iff

end PDIC


namespace PDIC

/-! S012: an obstruction to simultaneous quartet independence in any
    connected graph; this also applies before maximality is imposed. -/

/-- Each opposite pair of the four canonical quartets partitions Fin 8. -/
theorem quartet_zero_complement_three :
    Finset.univ \ quartet (0 : QuartetIndex) =
      quartet (3 : QuartetIndex) := by
  decide

theorem quartet_one_complement_two :
    Finset.univ \ quartet (1 : QuartetIndex) =
      quartet (2 : QuartetIndex) := by
  decide

/-- Connectedness rules out all four canonical zero-sum quartets being
    graph-independent: the two resulting bipartitions would be distinct.
    This is a universal graph theorem, not a finite enumeration of graphs. -/
theorem connected_not_all_four_quartets_independent
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    ¬ ∀ i : QuartetIndex,
        (∀ u ∈ quartet i, ∀ v ∈ quartet i, ¬ G.Adj u v) := by
  intro hi
  have hsc : ∀ u ∈ (Finset.univ \ quartet (0 : QuartetIndex)),
      ∀ v ∈ (Finset.univ \ quartet (0 : QuartetIndex)), ¬ G.Adj u v := by
    simpa only [quartet_zero_complement_three] using hi 3
  have htc : ∀ u ∈ (Finset.univ \ quartet (1 : QuartetIndex)),
      ∀ v ∈ (Finset.univ \ quartet (1 : QuartetIndex)), ¬ G.Adj u v := by
    simpa only [quartet_one_complement_two] using hi 2
  obtain heq | hswap :=
    connected_independent_partition_unique G hc (0 : Vertex)
      (quartet 0) (quartet 1) (hi 0) hsc (hi 1) htc
  · have hne : quartet (0 : QuartetIndex) ≠ quartet (1 : QuartetIndex) := by
      decide
    exact hne heq
  · have hne : quartet (0 : QuartetIndex) ≠
        Finset.univ \ quartet (1 : QuartetIndex) := by
      decide
    exact hne hswap

#print axioms PDIC.connected_not_all_four_quartets_independent

end PDIC


namespace PDIC

/-- Pull each of the four cap quartets back to the graph vertices. -/
def pulledQuartet (e : Equiv.Perm Vertex) (i : QuartetIndex) : Finset Vertex :=
  (quartet i).map e.symm.toEmbedding

theorem pulledQuartet_complement_zero (e : Equiv.Perm Vertex) :
    Finset.univ \ pulledQuartet e 0 = pulledQuartet e 3 := by
  classical
  have h : (Finset.univ \ quartet (0 : QuartetIndex)).map e.symm.toEmbedding =
      Finset.univ \ (quartet (0 : QuartetIndex)).map e.symm.toEmbedding := by
    rw [Finset.map_sdiff, Finset.map_univ_equiv]
  change Finset.univ \ (quartet (0 : QuartetIndex)).map e.symm.toEmbedding =
    (quartet (3 : QuartetIndex)).map e.symm.toEmbedding
  rw [← h, quartet_zero_complement_three]

theorem pulledQuartet_complement_one (e : Equiv.Perm Vertex) :
    Finset.univ \ pulledQuartet e 1 = pulledQuartet e 2 := by
  classical
  have h : (Finset.univ \ quartet (1 : QuartetIndex)).map e.symm.toEmbedding =
      Finset.univ \ (quartet (1 : QuartetIndex)).map e.symm.toEmbedding := by
    rw [Finset.map_sdiff, Finset.map_univ_equiv]
  change Finset.univ \ (quartet (1 : QuartetIndex)).map e.symm.toEmbedding =
    (quartet (2 : QuartetIndex)).map e.symm.toEmbedding
  rw [← h, quartet_one_complement_two]

/-- The same connectedness obstruction holds at every *actual* permutation
    of the cap labels, not just at the fixed canonical ordering. -/
theorem connected_not_all_permuted_quartets_independent
    (G : SimpleGraph Vertex) (hc : G.Connected) (e : Equiv.Perm Vertex) :
    ¬ ∀ i : QuartetIndex,
        (∀ u ∈ pulledQuartet e i, ∀ v ∈ pulledQuartet e i, ¬ G.Adj u v) := by
  intro hi
  have hsc : ∀ u ∈ (Finset.univ \ pulledQuartet e 0),
      ∀ v ∈ (Finset.univ \ pulledQuartet e 0), ¬ G.Adj u v := by
    simpa only [pulledQuartet_complement_zero] using hi 3
  have htc : ∀ u ∈ (Finset.univ \ pulledQuartet e 1),
      ∀ v ∈ (Finset.univ \ pulledQuartet e 1), ¬ G.Adj u v := by
    simpa only [pulledQuartet_complement_one] using hi 2
  obtain heq | hswap :=
    connected_independent_partition_unique G hc (0 : Vertex)
      (pulledQuartet e 0) (pulledQuartet e 1) (hi 0) hsc (hi 1) htc
  · have hne : pulledQuartet e 0 ≠ pulledQuartet e 1 := by
      intro h
      have hf : quartet (0 : QuartetIndex) = quartet (1 : QuartetIndex) :=
        Finset.map_inj.mp h
      exact (by decide : quartet (0 : QuartetIndex) ≠ quartet (1 : QuartetIndex)) hf
    exact hne heq
  · rw [pulledQuartet_complement_one] at hswap
    have hf : quartet (0 : QuartetIndex) = quartet (2 : QuartetIndex) :=
      Finset.map_inj.mp hswap
    exact (by decide : quartet (0 : QuartetIndex) ≠ quartet (2 : QuartetIndex)) hf

#print axioms PDIC.connected_not_all_permuted_quartets_independent

end PDIC


namespace PDIC

/-! S013: actual permutation-labelled quartet support and the N₀ ≤ 3 gate. -/

/-- The Finset.map pullback agrees with direct finite-set image. -/
theorem pulledQuartet_eq_image (e : Equiv.Perm Vertex) (i : QuartetIndex) :
    pulledQuartet e i = (quartet i).image e.symm := by
  classical
  ext v
  simp only [pulledQuartet, Finset.mem_map, Finset.mem_image]
  constructor
  · rintro ⟨a, ha, hav⟩
    exact ⟨a, ha, hav⟩
  · rintro ⟨a, ha, hav⟩
    exact ⟨a, ha, hav⟩

/-- Reindexing by an equivalence and its inverse preserves every finite set. -/
theorem perm_finset_image_roundtrip
    (e : Equiv.Perm Vertex) (s : Finset Vertex) :
    (s.image e).image e.symm = s := by
  classical
  ext v
  simp

/-- Real zero-sum four-sets are exactly the four pulled-back cap quartets. -/
theorem canonicalCapF3_perm_four_zero_iff_pulled
    (e : Equiv.Perm Vertex) (s : Finset Vertex) (hs : s.card = 4) :
    (capSum (fun v => canonicalCapF3 (e v)) s = 0 ↔
      ∃ i : QuartetIndex, pulledQuartet e i = s) := by
  rw [canonicalCapF3_perm_four_zero_iff e s hs]
  constructor
  · rintro ⟨i, hi⟩
    refine ⟨i, ?_⟩
    rw [pulledQuartet_eq_image, hi, perm_finset_image_roundtrip]
  · rintro ⟨i, hi⟩
    refine ⟨i, ?_⟩
    rw [← hi, pulledQuartet_eq_image]
    simpa using (perm_finset_image_roundtrip e.symm (quartet i)).symm

/-- Connectedness bounds the manuscript's genuine maximal-independent,
zero-sum quartet count for every one of the 40320 labellings. -/
theorem connected_labellingZeroMISCount_le_three
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (e : Equiv.Perm Vertex) :
    labellingZeroMISCount G e ≤ 3 := by
  classical
  let S : Finset (Finset Vertex) :=
    (Finset.univ : Finset (Finset Vertex)).filter
      (fun s => s.card = 4 ∧ GraphMIS G s ∧
        capSum (fun v => canonicalCapF3 (e v)) s = 0)
  let T : Finset (Finset Vertex) :=
    (Finset.univ : Finset QuartetIndex).image (pulledQuartet e)
  have hsub : S ⊆ T := by
    intro s hs
    obtain ⟨_, hcard, _, hzero⟩ := Finset.mem_filter.mp hs
    obtain ⟨i, hi⟩ :=
      (canonicalCapF3_perm_four_zero_iff_pulled e s hcard).mp hzero
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, hi⟩
  have hne : S ≠ T := by
    intro heq
    apply connected_not_all_permuted_quartets_independent G hc e
    intro i
    have hm : pulledQuartet e i ∈ T :=
      Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
    rw [← heq] at hm
    exact (Finset.mem_filter.mp hm).2.2.1.1
  have hstrict : S ⊂ T :=
    Finset.ssubset_iff_subset_ne.mpr ⟨hsub, hne⟩
  have hlt : S.card < T.card := Finset.card_lt_card hstrict
  have ht : T.card ≤ 4 := by
    calc
      T.card ≤ (Finset.univ : Finset QuartetIndex).card :=
        Finset.card_image_le
      _ = 4 := by decide
  change S.card ≤ 3
  omega

#print axioms PDIC.pulledQuartet_eq_image
#print axioms PDIC.perm_finset_image_roundtrip
#print axioms PDIC.canonicalCapF3_perm_four_zero_iff_pulled
#print axioms PDIC.connected_labellingZeroMISCount_le_three

end PDIC


namespace PDIC

/-! S014: genuine one-to-one indexing of cap-zero size-four graph MIS. -/

/-- The four zero-sum quartets form four different sets. -/
theorem quartet_injective : Function.Injective quartet := by
  decide

/-- Pulling quartets back through a true permutation keeps them distinct. -/
theorem pulledQuartet_injective (e : Equiv.Perm Vertex) :
    Function.Injective (pulledQuartet e) := by
  intro i j hij
  apply quartet_injective
  exact Finset.map_inj.mp hij

/-- Every pulled-back quartet retains its four-element cardinality. -/
theorem pulledQuartet_card (e : Equiv.Perm Vertex) (i : QuartetIndex) :
    (pulledQuartet e i).card = 4 := by
  simp only [pulledQuartet, Finset.card_map]
  exact quartet_card i

/-- Noncomputable count of genuine MIS among the four distinct pulled-back
canonical cap quartets. Explicitly scoped classical decidability. -/
noncomputable def quartetMISIndexCount
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) : ℕ := by
  classical
  exact ((Finset.univ : Finset QuartetIndex).filter
    (fun i => GraphMIS G (pulledQuartet e i))).card

/-- True MIS counting, not a symbolic stand-in: N₀ is exactly the number
of the four pulled-back quartets that are maximal independent sets. -/
theorem labellingZeroMISCount_eq_quartetIndex_filter
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) :
    labellingZeroMISCount G e = quartetMISIndexCount G e := by
  classical
  let I : Finset QuartetIndex :=
    (Finset.univ : Finset QuartetIndex).filter
      (fun i => GraphMIS G (pulledQuartet e i))
  let S : Finset (Finset Vertex) :=
    (Finset.univ : Finset (Finset Vertex)).filter
      (fun s => s.card = 4 ∧ GraphMIS G s ∧
        capSum (fun v => canonicalCapF3 (e v)) s = 0)
  have hSI : S = I.image (pulledQuartet e) := by
    ext s
    constructor
    · intro hs
      obtain ⟨_, hcard, hmis, hzero⟩ := Finset.mem_filter.mp hs
      obtain ⟨i, hi⟩ :=
        (canonicalCapF3_perm_four_zero_iff_pulled e s hcard).mp hzero
      refine Finset.mem_image.mpr ⟨i, ?_, hi⟩
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hi ▸ hmis⟩
    · intro hs
      obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hs
      have hmis : GraphMIS G (pulledQuartet e i) :=
        (Finset.mem_filter.mp hi).2
      have hzero :
          capSum (fun v => canonicalCapF3 (e v)) (pulledQuartet e i) = 0 :=
        (canonicalCapF3_perm_four_zero_iff_pulled e
          (pulledQuartet e i) (pulledQuartet_card e i)).mpr ⟨i, rfl⟩
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_univ _, pulledQuartet_card e i, hmis, hzero⟩
  change S.card = I.card
  calc
    S.card = (I.image (pulledQuartet e)).card := congrArg Finset.card hSI
    _ = I.card := Finset.card_image_of_injective I (pulledQuartet_injective e)

#print axioms PDIC.quartet_injective
#print axioms PDIC.pulledQuartet_injective
#print axioms PDIC.pulledQuartet_card
#print axioms PDIC.labellingZeroMISCount_eq_quartetIndex_filter

end PDIC


namespace PDIC

/-! S014: actual two-event overlap obstruction before factorial moments. -/

/-- The canonical four-quartet intersection matrix is exact: overlap four
occurs only for the same quartet. -/
theorem quartet_inter_card_four_iff :
    ∀ i j : QuartetIndex,
      (quartet i ∩ quartet j).card = 4 ↔ i = j := by
  decide

/-- A genuine relabelling preserves the two-quartet intersection count. -/
theorem pulledQuartet_inter_card
    (e : Equiv.Perm Vertex) (i j : QuartetIndex) :
    (pulledQuartet e i ∩ pulledQuartet e j).card =
      (quartet i ∩ quartet j).card := by
  classical
  simp only [pulledQuartet, ← Finset.map_inter, Finset.card_map]

/-- Two true cap-zero size-four events can intersect in only 0, 2 or 4
vertices, independently of the graph and uniformly in the labelling. -/
theorem canonicalCapF3_perm_pair_overlap_cases
    (e : Equiv.Perm Vertex) (s t : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4)
    (hzs : capSum (fun v => canonicalCapF3 (e v)) s = 0)
    (hzt : capSum (fun v => canonicalCapF3 (e v)) t = 0) :
    (s ∩ t).card = 0 ∨ (s ∩ t).card = 2 ∨ (s ∩ t).card = 4 := by
  obtain ⟨i, hi⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e s hs).mp hzs
  obtain ⟨j, hj⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e t ht).mp hzt
  rw [← hi, ← hj, pulledQuartet_inter_card]
  exact quartet_pair_intersections i j

/-- In particular, *distinct* simultaneous cap-zero four-sets have
intersection cardinality precisely zero or two. -/
theorem canonicalCapF3_perm_distinct_pair_overlap_cases
    (e : Equiv.Perm Vertex) (s t : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4)
    (hst : s ≠ t)
    (hzs : capSum (fun v => canonicalCapF3 (e v)) s = 0)
    (hzt : capSum (fun v => canonicalCapF3 (e v)) t = 0) :
    (s ∩ t).card = 0 ∨ (s ∩ t).card = 2 := by
  obtain ⟨i, hi⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e s hs).mp hzs
  obtain ⟨j, hj⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e t ht).mp hzt
  have hij : i ≠ j := by
    intro h
    exact hst (hi.symm.trans (h ▸ hj))
  have hc := quartet_pair_intersections i j
  rcases hc with hc | hc | hc
  · left
    simpa [← hi, ← hj, pulledQuartet_inter_card] using hc
  · right
    simpa [← hi, ← hj, pulledQuartet_inter_card] using hc
  · exact False.elim (hij ((quartet_inter_card_four_iff i j).mp hc))

#print axioms PDIC.quartet_inter_card_four_iff
#print axioms PDIC.pulledQuartet_inter_card
#print axioms PDIC.canonicalCapF3_perm_pair_overlap_cases
#print axioms PDIC.canonicalCapF3_perm_distinct_pair_overlap_cases

end PDIC


namespace PDIC

/-! S014: the third real cap-zero event has an unavoidable complementary pair. -/

/-- Every three different canonical zero-sum quartets contain a disjoint
pair. This small finite statement is checked directly by the Lean kernel. -/
theorem quartet_three_distinct_has_disjoint_pair :
    ∀ i j k : QuartetIndex, i ≠ j → i ≠ k → j ≠ k →
      (quartet i ∩ quartet j).card = 0 ∨
      (quartet i ∩ quartet k).card = 0 ∨
      (quartet j ∩ quartet k).card = 0 := by
  decide

/-- For three distinct *actual* zero-sum four-sets under any permutation,
some two sets are disjoint; no graph surrogate is used. -/
theorem canonicalCapF3_perm_three_zero_has_disjoint_pair
    (e : Equiv.Perm Vertex) (s t u : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) (hu : u.card = 4)
    (hst : s ≠ t) (hsu : s ≠ u) (htu : t ≠ u)
    (hzs : capSum (fun v => canonicalCapF3 (e v)) s = 0)
    (hzt : capSum (fun v => canonicalCapF3 (e v)) t = 0)
    (hzu : capSum (fun v => canonicalCapF3 (e v)) u = 0) :
    (s ∩ t).card = 0 ∨ (s ∩ u).card = 0 ∨
    (t ∩ u).card = 0 := by
  obtain ⟨i, hi⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e s hs).mp hzs
  obtain ⟨j, hj⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e t ht).mp hzt
  obtain ⟨k, hk⟩ := (canonicalCapF3_perm_four_zero_iff_pulled e u hu).mp hzu
  have hij : i ≠ j := by
    intro h
    exact hst (hi.symm.trans (by simpa [h] using hj))
  have hik : i ≠ k := by
    intro h
    exact hsu (hi.symm.trans (by simpa [h] using hk))
  have hjk : j ≠ k := by
    intro h
    exact htu (hj.symm.trans (by simpa [h] using hk))
  rcases quartet_three_distinct_has_disjoint_pair i j k hij hik hjk with hh | hh | hh
  · left
    rw [← hi, ← hj, pulledQuartet_inter_card]
    exact hh
  · right
    left
    rw [← hi, ← hk, pulledQuartet_inter_card]
    exact hh
  · right
    right
    rw [← hj, ← hk, pulledQuartet_inter_card]
    exact hh

#print axioms PDIC.quartet_three_distinct_has_disjoint_pair
#print axioms PDIC.canonicalCapF3_perm_three_zero_has_disjoint_pair

end PDIC


namespace PDIC

/-! S014: numerical regular fibres via the standard permutation-stabilizer
equivalence. This is an exact finite-group proof, not a 40320-case enumeration. -/

/-- The colour records which side of the fixed four/four partition a
vertex belongs to. -/
def canonicalFourBlockColour (v : Vertex) : Bool :=
  decide (v ∈ quartet (0 : QuartetIndex))

/-- Both actual colour classes contain four labelled vertices. -/
theorem canonicalFourBlockColour_fibre_card (b : Bool) :
    Fintype.card {v : Vertex // canonicalFourBlockColour v = b} = 4 := by
  cases b <;> decide

/-- 4!·4! = 576 genuine permutations preserve a fixed four/four
partition. The proof uses the stabilizer's product-of-factorials formula. -/
theorem canonicalFourBlockStabilizer_card :
    Fintype.card {e : Equiv.Perm Vertex //
      canonicalFourBlockColour ∘ e = canonicalFourBlockColour} = 576 := by
  classical
  rw [DomMulAct.stabilizer_card]
  simp only [canonicalFourBlockColour_fibre_card]
  decide

#print axioms PDIC.canonicalFourBlockColour_fibre_card
#print axioms PDIC.canonicalFourBlockStabilizer_card

end PDIC


namespace PDIC

/-! S014: the second regular fibre has four two-element colour cells. -/

/-- Two intersecting canonical quartets partition the eight vertices into
four genuine cells of size two, indexed by their two membership bits. -/
def canonicalTwoQuartetColour (v : Vertex) : Bool × Bool :=
  (decide (v ∈ quartet (0 : QuartetIndex)),
   decide (v ∈ quartet (1 : QuartetIndex)))

/-- All four membership-bit cells have cardinality two. -/
theorem canonicalTwoQuartetColour_fibre_card (b : Bool × Bool) :
    Fintype.card {v : Vertex // canonicalTwoQuartetColour v = b} = 2 := by
  rcases b with ⟨b₀, b₁⟩
  cases b₀ <;> cases b₁ <;> decide

/-- (2!)⁴ = 16: the exact stabilizer fibre of the ordered two-quartet
incidence configuration. This is a product-of-factorials argument,
not an enumeration of all permutations. -/
theorem canonicalTwoQuartetStabilizer_card :
    Fintype.card {e : Equiv.Perm Vertex //
      canonicalTwoQuartetColour ∘ e = canonicalTwoQuartetColour} = 16 := by
  classical
  rw [DomMulAct.stabilizer_card]
  simp only [canonicalTwoQuartetColour_fibre_card]
  decide

#print axioms PDIC.canonicalTwoQuartetColour_fibre_card
#print axioms PDIC.canonicalTwoQuartetStabilizer_card

end PDIC


namespace PDIC

/-! S014: relate factorial stabilizers to events on actual vertex sets. -/

/-- For a true permutation, preservation of a finite set is the same as
membership preservation in both directions. -/
theorem perm_finset_image_fixed_iff
    (e : Equiv.Perm Vertex) (s : Finset Vertex) :
    s.image e = s ↔ ∀ v, (v ∈ s ↔ e v ∈ s) := by
  classical
  constructor
  · intro h v
    constructor
    · intro hv
      have he : e v ∈ s.image e :=
        Finset.mem_image.mpr ⟨v, hv, rfl⟩
      simpa [h] using he
    · intro hev
      have he : e v ∈ s.image e := by simpa [h] using hev
      obtain ⟨w, hw, hwe⟩ := Finset.mem_image.mp he
      have hwv : w = v := e.injective hwe
      simpa [hwv] using hw
  · intro h
    ext v
    constructor
    · intro hv
      obtain ⟨w, hw, hew⟩ := Finset.mem_image.mp hv
      subst v
      exact (h w).mp hw
    · intro hv
      have hmem : e (e.symm v) ∈ s := by simpa using hv
      have hs : e.symm v ∈ s := (h (e.symm v)).mpr hmem
      exact Finset.mem_image.mpr ⟨e.symm v, hs, e.apply_symm_apply v⟩

/-- Stabilising the canonical four/four colouring is literally the same
as fixing its actual canonical four-vertex subset. -/
theorem canonicalFourBlockColour_comp_iff_image_fixed
    (e : Equiv.Perm Vertex) :
    canonicalFourBlockColour ∘ e = canonicalFourBlockColour ↔
      (quartet (0 : QuartetIndex)).image e = quartet (0 : QuartetIndex) := by
  rw [perm_finset_image_fixed_iff]
  constructor
  · intro h v
    have hb :
        decide (e v ∈ quartet (0 : QuartetIndex)) =
          decide (v ∈ quartet (0 : QuartetIndex)) := by
      simpa [canonicalFourBlockColour, Function.comp_apply]
        using congrFun h v
    have hh : (e v ∈ quartet (0 : QuartetIndex)) ↔
        (v ∈ quartet (0 : QuartetIndex)) := by
      simpa using congrArg (fun b : Bool => b = true) hb
    exact hh.symm
  · intro h
    funext v
    by_cases hv : v ∈ quartet (0 : QuartetIndex)
    · have he : e v ∈ quartet (0 : QuartetIndex) := (h v).mp hv
      simp [canonicalFourBlockColour, Function.comp_apply, hv, he]
    · have he : e v ∉ quartet (0 : QuartetIndex) :=
        fun hh => hv ((h v).mpr hh)
      simp [canonicalFourBlockColour, Function.comp_apply, hv, he]

/-- The actual fixed-image singleton quartet fibre has 576 permutations,
using the colour stabilizer equivalence rather than brute-force search. -/
theorem canonicalQuartetImageStabilizer_card :
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet (0 : QuartetIndex)).image e =
        quartet (0 : QuartetIndex)} = 576 := by
  classical
  let E :
      {e : Equiv.Perm Vertex //
        (quartet (0 : QuartetIndex)).image e =
          quartet (0 : QuartetIndex)} ≃
      {e : Equiv.Perm Vertex //
        canonicalFourBlockColour ∘ e = canonicalFourBlockColour} :=
    Equiv.subtypeEquiv (Equiv.refl _) (fun e =>
      (canonicalFourBlockColour_comp_iff_image_fixed e).symm)
  calc
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet (0 : QuartetIndex)).image e =
        quartet (0 : QuartetIndex)} =
      Fintype.card {e : Equiv.Perm Vertex //
        canonicalFourBlockColour ∘ e = canonicalFourBlockColour} :=
          Fintype.card_congr E
    _ = 576 := canonicalFourBlockStabilizer_card

#print axioms PDIC.perm_finset_image_fixed_iff
#print axioms PDIC.canonicalFourBlockColour_comp_iff_image_fixed
#print axioms PDIC.canonicalQuartetImageStabilizer_card

end PDIC


namespace PDIC

/-! S015: the genuine ordered two-quartet image fibre, not merely its
colour-preserving abstract stabilizer. -/

/-- Fixing both actual canonical quartet images is equivalent to preserving
their two-bit incidence colouring. -/
theorem canonicalTwoQuartetColour_comp_iff_images_fixed
    (e : Equiv.Perm Vertex) :
    canonicalTwoQuartetColour ∘ e = canonicalTwoQuartetColour ↔
      (quartet (0 : QuartetIndex)).image e = quartet (0 : QuartetIndex) ∧
      (quartet (1 : QuartetIndex)).image e = quartet (1 : QuartetIndex) := by
  rw [perm_finset_image_fixed_iff, perm_finset_image_fixed_iff]
  constructor
  · intro h
    constructor
    · intro v
      have hp := congrArg Prod.fst (congrFun h v)
      have hb : decide (e v ∈ quartet (0 : QuartetIndex)) =
          decide (v ∈ quartet (0 : QuartetIndex)) := by
        simpa only [canonicalTwoQuartetColour, Function.comp_apply] using hp
      have hh : (e v ∈ quartet (0 : QuartetIndex)) ↔
          (v ∈ quartet (0 : QuartetIndex)) := by
        simpa using congrArg (fun b : Bool => b = true) hb
      exact hh.symm
    · intro v
      have hp := congrArg Prod.snd (congrFun h v)
      have hb : decide (e v ∈ quartet (1 : QuartetIndex)) =
          decide (v ∈ quartet (1 : QuartetIndex)) := by
        simpa only [canonicalTwoQuartetColour, Function.comp_apply] using hp
      have hh : (e v ∈ quartet (1 : QuartetIndex)) ↔
          (v ∈ quartet (1 : QuartetIndex)) := by
        simpa using congrArg (fun b : Bool => b = true) hb
      exact hh.symm
  · intro h
    funext v
    apply Prod.ext
    · change decide (e v ∈ quartet (0 : QuartetIndex)) =
        decide (v ∈ quartet (0 : QuartetIndex))
      simp only [← (h.1 v)]
    · change decide (e v ∈ quartet (1 : QuartetIndex)) =
        decide (v ∈ quartet (1 : QuartetIndex))
      simp only [← (h.2 v)]

/-- Exactly sixteen *actual* permutations fix both overlapping canonical
quartet images. This verifies the two-set image-stabilizer predicate. -/
theorem canonicalTwoQuartetImageStabilizer_card :
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet (0 : QuartetIndex)).image e = quartet (0 : QuartetIndex) ∧
      (quartet (1 : QuartetIndex)).image e = quartet (1 : QuartetIndex)} = 16 := by
  classical
  let E :
      {e : Equiv.Perm Vertex //
        (quartet (0 : QuartetIndex)).image e = quartet (0 : QuartetIndex) ∧
        (quartet (1 : QuartetIndex)).image e = quartet (1 : QuartetIndex)} ≃
      {e : Equiv.Perm Vertex //
        canonicalTwoQuartetColour ∘ e = canonicalTwoQuartetColour} :=
    Equiv.subtypeEquiv (Equiv.refl _) (fun e =>
      (canonicalTwoQuartetColour_comp_iff_images_fixed e).symm)
  calc
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet (0 : QuartetIndex)).image e = quartet (0 : QuartetIndex) ∧
      (quartet (1 : QuartetIndex)).image e = quartet (1 : QuartetIndex)} =
      Fintype.card {e : Equiv.Perm Vertex //
        canonicalTwoQuartetColour ∘ e = canonicalTwoQuartetColour} :=
          Fintype.card_congr E
    _ = 16 := canonicalTwoQuartetStabilizer_card

#print axioms PDIC.canonicalTwoQuartetColour_comp_iff_images_fixed
#print axioms PDIC.canonicalTwoQuartetImageStabilizer_card

end PDIC


namespace PDIC

/-! S015: honest transitivity of the permutation action on balanced four-sets. -/

/-- Any two four-element subsets of the actual eight vertices are related
by a genuine permutation; its construction matches their four/four splits. -/
theorem exists_perm_fourset_image (s t : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) :
    ∃ p : Equiv.Perm Vertex, s.image p = t := by
  classical
  have hsc : (Finset.univ \ s).card = 4 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ s)]
    simp [hs, Vertex]
  have htc : (Finset.univ \ t).card = 4 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ t)]
    simp [ht, Vertex]
  obtain ⟨eS, hSL, hSR⟩ := exists_balancedSplitEquiv s hs hsc
  obtain ⟨eT, hTL, hTR⟩ := exists_balancedSplitEquiv t ht htc
  let p : Equiv.Perm Vertex := eS.symm.trans eT
  have hpSub : s.image p ⊆ t := by
    intro v hv
    obtain ⟨w, hw, hwe⟩ := Finset.mem_image.mp hv
    subst v
    change eT (eS.symm w) ∈ t
    cases h : eS.symm w with
    | inl a =>
      exact hTL a
    | inr b =>
      have hback : eS (Sum.inr b) = w := by
        calc
          eS (Sum.inr b) = eS (eS.symm w) := by simp [h]
          _ = w := eS.apply_symm_apply w
      exact False.elim (hSR b (hback.symm ▸ hw))
  refine ⟨p, Finset.eq_of_subset_of_card_le hpSub ?_⟩
  have hcard : (s.image p).card = 4 := by
    simpa only [Finset.card_image_of_injective s p.injective] using hs
  omega

#print axioms PDIC.exists_perm_fourset_image

end PDIC


namespace PDIC

/-! S015: transport the genuine permutation fibres by composition. -/

/-- Mapping a finite set by two genuine permutations composes their images. -/
theorem finset_image_perm_trans
    (s : Finset Vertex) (p q : Equiv.Perm Vertex) :
    (s.image p).image q = s.image (p.trans q) := by
  classical
  ext v
  simp only [Finset.mem_image]
  constructor
  · rintro ⟨w, ⟨u, hu, rfl⟩, hw⟩
    exact ⟨u, hu, hw⟩
  · rintro ⟨u, hu, hw⟩
    exact ⟨p u, ⟨u, hu, rfl⟩, hw⟩

/-- Every nonempty fixed-image fibre is equivariant to the target
stabilizer; this is a bijection of actual permutations, not just counting. -/
theorem perm_image_fibre_card_eq_stabilizer
    (s t : Finset Vertex) (p : Equiv.Perm Vertex)
    (hp : s.image p = t) :
    Fintype.card {e : Equiv.Perm Vertex // s.image e = t} =
      Fintype.card {e : Equiv.Perm Vertex // t.image e = t} := by
  classical
  let F : Equiv.Perm Vertex ≃ Equiv.Perm Vertex :=
    { toFun := fun e => p.symm.trans e
      invFun := fun e => p.trans e
      left_inv := by intro e; ext v; simp
      right_inv := by intro e; ext v; simp }
  have hpred (e : Equiv.Perm Vertex) :
      s.image e = t ↔ t.image (F e) = t := by
    have hid : p.trans (F e) = e := F.left_inv e
    have ht : t.image (F e) = s.image e := by
      calc
        t.image (F e) = (s.image p).image (F e) := by rw [hp]
        _ = s.image (p.trans (F e)) := finset_image_perm_trans s p (F e)
        _ = s.image e := by rw [hid]
    rw [ht]
  let E :
      {e : Equiv.Perm Vertex // s.image e = t} ≃
      {e : Equiv.Perm Vertex // t.image e = t} :=
    Equiv.subtypeEquiv F (fun e => hpred e)
  exact Fintype.card_congr E

/-- The fibre of permutations sending *any* four-subset onto the actual
canonical zero-sum quartet Q0 has precisely 576 members. -/
theorem arbitraryFourset_to_canonicalQuartet_fibre_card
    (s : Finset Vertex) (hs : s.card = 4) :
    Fintype.card {e : Equiv.Perm Vertex //
      s.image e = quartet (0 : QuartetIndex)} = 576 := by
  classical
  obtain ⟨p, hp⟩ :=
    exists_perm_fourset_image s (quartet (0 : QuartetIndex))
      hs (quartet_card (0 : QuartetIndex))
  rw [perm_image_fibre_card_eq_stabilizer s (quartet 0) p hp]
  exact canonicalQuartetImageStabilizer_card

#print axioms PDIC.finset_image_perm_trans
#print axioms PDIC.perm_image_fibre_card_eq_stabilizer
#print axioms PDIC.arbitraryFourset_to_canonicalQuartet_fibre_card

end PDIC


namespace PDIC

/-! S015: the 576 stabilizer uniformly for all four canonical quartets. -/

def indexedQuartetBlockColour (i : QuartetIndex) (v : Vertex) : Bool :=
  decide (v ∈ quartet i)

theorem indexedQuartetBlockColour_fibre_card
    (i : QuartetIndex) (b : Bool) :
    Fintype.card {v : Vertex // indexedQuartetBlockColour i v = b} = 4 := by
  fin_cases i <;> cases b <;> decide

theorem indexedQuartetBlockStabilizer_card (i : QuartetIndex) :
    Fintype.card {e : Equiv.Perm Vertex //
      indexedQuartetBlockColour i ∘ e = indexedQuartetBlockColour i} = 576 := by
  classical
  rw [DomMulAct.stabilizer_card]
  simp only [indexedQuartetBlockColour_fibre_card]
  decide

theorem indexedQuartetBlockColour_comp_iff_image_fixed
    (i : QuartetIndex) (e : Equiv.Perm Vertex) :
    indexedQuartetBlockColour i ∘ e = indexedQuartetBlockColour i ↔
      (quartet i).image e = quartet i := by
  rw [perm_finset_image_fixed_iff]
  constructor
  · intro h v
    have hb : decide (e v ∈ quartet i) = decide (v ∈ quartet i) := by
      simpa [indexedQuartetBlockColour, Function.comp_apply] using congrFun h v
    have hh : (e v ∈ quartet i) ↔ (v ∈ quartet i) := by
      simpa using congrArg (fun b : Bool => b = true) hb
    exact hh.symm
  · intro h
    funext v
    by_cases hv : v ∈ quartet i
    · have he : e v ∈ quartet i := (h v).mp hv
      simp [indexedQuartetBlockColour, Function.comp_apply, hv, he]
    · have he : e v ∉ quartet i := fun hh => hv ((h v).mpr hh)
      simp [indexedQuartetBlockColour, Function.comp_apply, hv, he]

theorem indexedQuartetImageStabilizer_card (i : QuartetIndex) :
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet i).image e = quartet i} = 576 := by
  classical
  let E :
      {e : Equiv.Perm Vertex // (quartet i).image e = quartet i} ≃
      {e : Equiv.Perm Vertex //
        indexedQuartetBlockColour i ∘ e = indexedQuartetBlockColour i} :=
    Equiv.subtypeEquiv (Equiv.refl _) (fun e =>
      (indexedQuartetBlockColour_comp_iff_image_fixed i e).symm)
  calc
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet i).image e = quartet i} =
      Fintype.card {e : Equiv.Perm Vertex //
        indexedQuartetBlockColour i ∘ e = indexedQuartetBlockColour i} :=
          Fintype.card_congr E
    _ = 576 := indexedQuartetBlockStabilizer_card i

/-- Universal numerical singleton-image fibre: all four canonical targets
have exactly 576 genuine permutation witnesses for any source four-set. -/
theorem arbitraryFourset_to_anyQuartet_fibre_card
    (s : Finset Vertex) (hs : s.card = 4) (i : QuartetIndex) :
    Fintype.card {e : Equiv.Perm Vertex //
      s.image e = quartet i} = 576 := by
  classical
  obtain ⟨p, hp⟩ :=
    exists_perm_fourset_image s (quartet i) hs (quartet_card i)
  rw [perm_image_fibre_card_eq_stabilizer s (quartet i) p hp]
  exact indexedQuartetImageStabilizer_card i

#print axioms PDIC.indexedQuartetBlockColour_fibre_card
#print axioms PDIC.indexedQuartetBlockStabilizer_card
#print axioms PDIC.indexedQuartetBlockColour_comp_iff_image_fixed
#print axioms PDIC.indexedQuartetImageStabilizer_card
#print axioms PDIC.arbitraryFourset_to_anyQuartet_fibre_card

end PDIC


namespace PDIC

/-! S015: numerical 2304-event theorem for genuine uniformly permuted cap sums. -/

/-- Every fixed four-subset is cap-zero under precisely 2304 of the actual
40320 label permutations. The four distinct target quartets contribute 576
disjoint permutations apiece. -/
theorem canonicalCapF3_perm_singleton_event_card
    (s : Finset Vertex) (hs : s.card = 4) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0} = 2304 := by
  classical
  let f :
      (Σ i : QuartetIndex,
        {e : Equiv.Perm Vertex // s.image e = quartet i}) →
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0} :=
    fun x => ⟨x.2.1,
      (canonicalCapF3_perm_four_zero_iff x.2.1 s hs).mpr
        ⟨x.1, x.2.2.symm⟩⟩
  have hf : Function.Bijective f := by
    constructor
    · intro x y hxy
      rcases x with ⟨i, ⟨e, he⟩⟩
      rcases y with ⟨j, ⟨e', he'⟩⟩
      have heq : e = e' := congrArg Subtype.val hxy
      subst e'
      have hij : i = j := quartet_injective (he.symm.trans he')
      subst j
      rfl
    · intro e
      obtain ⟨i, hi⟩ :=
        (canonicalCapF3_perm_four_zero_iff e.val s hs).mp e.property
      refine ⟨⟨i, ⟨e.val, hi.symm⟩⟩, ?_⟩
      apply Subtype.ext
      rfl
  calc
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0} =
      Fintype.card (Σ i : QuartetIndex,
        {e : Equiv.Perm Vertex // s.image e = quartet i}) :=
          (Fintype.card_congr (Equiv.ofBijective f hf)).symm
    _ = 2304 := by
      rw [Fintype.card_sigma]
      calc
        (∑ i : QuartetIndex,
          Fintype.card {e : Equiv.Perm Vertex // s.image e = quartet i}) =
          ∑ _i : QuartetIndex, (576 : ℕ) := by
            apply Finset.sum_congr rfl
            intro i _
            exact arbitraryFourset_to_anyQuartet_fibre_card s hs i
        _ = 2304 := by norm_num [QuartetIndex]

#print axioms PDIC.canonicalCapF3_perm_singleton_event_card

end PDIC


namespace PDIC

/-! S016: the actual uniform complementary-pair event, built from the
certified singleton 2304 fibre and the zero sum of all eight cap points. -/

/-- The complete canonical eight-point cap has zero vector sum. -/
theorem canonicalCapF3_total_zero :
    capSum canonicalCapF3 (Finset.univ : Finset Vertex) = 0 := by
  decide +kernel

/-- A permutation of the eight labels leaves the total cap sum zero. -/
theorem canonicalCapF3_perm_total_zero (e : Equiv.Perm Vertex) :
    capSum (fun v => canonicalCapF3 (e v))
      (Finset.univ : Finset Vertex) = 0 := by
  rw [capSum_perm_reindex]
  have himage : (Finset.univ : Finset Vertex).image e = Finset.univ := by
    ext v
    simp
  rw [himage]
  exact canonicalCapF3_total_zero

/-- The two labelled cap sums of disjoint prescribed four-subsets add to zero,
for every actual labelling permutation. -/
theorem canonicalCapF3_perm_disjoint_pair_sum_zero
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hd : Disjoint s t) (e : Equiv.Perm Vertex) :
    capSum (fun v => canonicalCapF3 (e v)) s +
      capSum (fun v => canonicalCapF3 (e v)) t = 0 := by
  classical
  have hun : s ∪ t = (Finset.univ : Finset Vertex) :=
    Finset.eq_of_subset_of_card_le (Finset.subset_univ _) (by
      rw [Finset.card_union_of_disjoint hd, hs, ht]
      decide)
  change (∑ v ∈ s, canonicalCapF3 (e v)) +
    (∑ v ∈ t, canonicalCapF3 (e v)) = 0
  rw [← Finset.sum_union hd, hun]
  exact canonicalCapF3_perm_total_zero e

/-- Exactly 2304 of the 40320 actual permutations make BOTH disjoint
prescribed four-subsets zero-sum. This is a genuine pair event. -/
theorem canonicalCapF3_perm_complementary_pair_event_card
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hd : Disjoint s t) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0} = 2304 := by
  classical
  have hevent (e : Equiv.Perm Vertex) :
      (capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0) ↔
      capSum (fun v => canonicalCapF3 (e v)) s = 0 := by
    constructor
    · intro h
      exact h.1
    · intro hs0
      have htotal :=
        canonicalCapF3_perm_disjoint_pair_sum_zero s t hs ht hd e
      rw [hs0, zero_add] at htotal
      exact ⟨hs0, htotal⟩
  let E :
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0} ≃
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0} :=
    Equiv.subtypeEquiv (Equiv.refl _) (fun e => hevent e)
  exact (Fintype.card_congr E).trans
    (canonicalCapF3_perm_singleton_event_card s hs)

#print axioms PDIC.canonicalCapF3_total_zero
#print axioms PDIC.canonicalCapF3_perm_total_zero
#print axioms PDIC.canonicalCapF3_perm_disjoint_pair_sum_zero
#print axioms PDIC.canonicalCapF3_perm_complementary_pair_event_card

end PDIC


namespace PDIC

/-! S016: constructive dihedral transport of the eight ordered overlapping
canonical two-quartet configurations. Only eight explicit permutations are
checked; there is NO 40320-permutation decision procedure in this proof. -/

def quartetSwapFirstAtoms : Equiv.Perm Vertex :=
  (Equiv.swap (0 : Vertex) 2).trans (Equiv.swap (1 : Vertex) 3)

def quartetSwapLastAtoms : Equiv.Perm Vertex :=
  (Equiv.swap (4 : Vertex) 6).trans (Equiv.swap (5 : Vertex) 7)

def quartetSwapAxesAtoms : Equiv.Perm Vertex :=
  ((Equiv.swap (0 : Vertex) 4).trans (Equiv.swap (1 : Vertex) 5)).trans
    ((Equiv.swap (2 : Vertex) 6).trans (Equiv.swap (3 : Vertex) 7))

/-- The eight explicit axis/swap symmetries of the four-quartet C4 design. -/
def quartetDihedralPerm (k : Vertex) : Equiv.Perm Vertex :=
  if k = 0 then Equiv.refl Vertex
  else if k = 1 then quartetSwapLastAtoms
  else if k = 2 then quartetSwapFirstAtoms
  else if k = 3 then quartetSwapFirstAtoms.trans quartetSwapLastAtoms
  else if k = 4 then quartetSwapAxesAtoms
  else if k = 5 then quartetSwapAxesAtoms.trans quartetSwapFirstAtoms
  else if k = 6 then quartetSwapAxesAtoms.trans quartetSwapLastAtoms
  else quartetSwapAxesAtoms.trans
    (quartetSwapFirstAtoms.trans quartetSwapLastAtoms)

set_option maxRecDepth 16384
set_option maxHeartbeats 2000000
/-- Explicit orbit certificate for all eight ordered overlapping canonical
quartet pairs, using just the eight constructed symmetries. -/
theorem quartet_ordered_overlap_two_orbit
    (i j : QuartetIndex) (hij : (quartet i ∩ quartet j).card = 2) :
    ∃ p : Equiv.Perm Vertex,
      (quartet (0 : QuartetIndex)).image p = quartet i ∧
      (quartet (1 : QuartetIndex)).image p = quartet j := by
  have hfinite : ∀ a b : QuartetIndex,
      (quartet a ∩ quartet b).card = 2 →
      ∃ k : Vertex,
        (quartet (0 : QuartetIndex)).image (quartetDihedralPerm k) = quartet a ∧
        (quartet (1 : QuartetIndex)).image (quartetDihedralPerm k) = quartet b := by
    decide +kernel
  obtain ⟨k, hk⟩ := hfinite i j hij
  exact ⟨quartetDihedralPerm k, hk⟩

/-- Right-translation by a known orbit permutation identifies an arbitrary
fixed ordered pair-image fibre with the image stabilizer of the source pair. -/
theorem perm_pair_image_fibre_card_eq_stabilizer
    (s t u v : Finset Vertex) (p : Equiv.Perm Vertex)
    (hps : s.image p = u) (hpt : t.image p = v) :
    Fintype.card {e : Equiv.Perm Vertex //
      s.image e = u ∧ t.image e = v} =
    Fintype.card {e : Equiv.Perm Vertex //
      s.image e = s ∧ t.image e = t} := by
  classical
  let F : Equiv.Perm Vertex ≃ Equiv.Perm Vertex :=
    { toFun := fun e => e.trans p.symm
      invFun := fun e => e.trans p
      left_inv := by intro e; ext x; simp
      right_inv := by intro e; ext x; simp }
  have hpred (e : Equiv.Perm Vertex) :
      (s.image e = u ∧ t.image e = v) ↔
      (s.image (F e) = s ∧ t.image (F e) = t) := by
    have hleft (a : Finset Vertex) :
        a.image (F e) = (a.image e).image p.symm :=
      (finset_image_perm_trans a e p.symm).symm
    have hinv : (F e).trans p = e := F.left_inv e
    constructor
    · rintro ⟨heS, heT⟩
      constructor
      · rw [hleft s, heS, ← hps]
        exact perm_finset_image_roundtrip p s
      · rw [hleft t, heT, ← hpt]
        exact perm_finset_image_roundtrip p t
    · rintro ⟨heS, heT⟩
      constructor
      · calc
          s.image e = s.image ((F e).trans p) := by rw [hinv]
          _ = (s.image (F e)).image p :=
            (finset_image_perm_trans s (F e) p).symm
          _ = s.image p := by rw [heS]
          _ = u := hps
      · calc
          t.image e = t.image ((F e).trans p) := by rw [hinv]
          _ = (t.image (F e)).image p :=
            (finset_image_perm_trans t (F e) p).symm
          _ = t.image p := by rw [heT]
          _ = v := hpt
  let E :
      {e : Equiv.Perm Vertex // s.image e = u ∧ t.image e = v} ≃
      {e : Equiv.Perm Vertex // s.image e = s ∧ t.image e = t} :=
    Equiv.subtypeEquiv F (fun e => hpred e)
  exact Fintype.card_congr E

/-- For each of the eight canonical ordered overlapping targets, exactly
16 genuine permutations carry the fixed (Q0,Q1) source onto that target. -/
theorem canonical_ordered_overlap_pair_image_fibre_card
    (i j : QuartetIndex) (hij : (quartet i ∩ quartet j).card = 2) :
    Fintype.card {e : Equiv.Perm Vertex //
      (quartet (0 : QuartetIndex)).image e = quartet i ∧
      (quartet (1 : QuartetIndex)).image e = quartet j} = 16 := by
  obtain ⟨p, hp⟩ := quartet_ordered_overlap_two_orbit i j hij
  rw [perm_pair_image_fibre_card_eq_stabilizer
    (quartet (0 : QuartetIndex)) (quartet (1 : QuartetIndex))
    (quartet i) (quartet j) p hp.1 hp.2]
  exact canonicalTwoQuartetImageStabilizer_card

#print axioms PDIC.quartet_ordered_overlap_two_orbit
#print axioms PDIC.perm_pair_image_fibre_card_eq_stabilizer
#print axioms PDIC.canonical_ordered_overlap_pair_image_fibre_card

end PDIC


namespace PDIC

/-! S016: an actual 128/40320 joint cap-zero event for the fixed ordered
canonical Q0/Q1 source. This is a genuine event-fibre theorem; extension to
arbitrary two-overlap source sets remains a separate obligation. -/

abbrev CanonicalOrderedOverlapPair :=
  {p : QuartetIndex × QuartetIndex // (quartet p.1 ∩ quartet p.2).card = 2}

theorem canonicalOrderedOverlapPair_card :
    Fintype.card CanonicalOrderedOverlapPair = 8 := by
  decide +kernel

/-- The two specific overlapping source quartets are simultaneously
zero-sum under exactly 128 real label permutations. The proof partitions
by eight canonical target pairs, each with the certified 16-image fibre. -/
theorem canonicalCapF3_perm_canonical_overlap_pair_event_card :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) (quartet (0 : QuartetIndex)) = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) (quartet (1 : QuartetIndex)) = 0} =
        128 := by
  classical
  let F :
      (Σ p : CanonicalOrderedOverlapPair,
        {e : Equiv.Perm Vertex //
          (quartet (0 : QuartetIndex)).image e = quartet p.val.1 ∧
          (quartet (1 : QuartetIndex)).image e = quartet p.val.2}) →
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) (quartet (0 : QuartetIndex)) = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) (quartet (1 : QuartetIndex)) = 0} :=
    fun x => ⟨x.2.1,
      ⟨(canonicalCapF3_perm_four_zero_iff x.2.1
          (quartet (0 : QuartetIndex)) (quartet_card 0)).mpr
          ⟨x.1.val.1, x.2.2.1.symm⟩,
        (canonicalCapF3_perm_four_zero_iff x.2.1
          (quartet (1 : QuartetIndex)) (quartet_card 1)).mpr
          ⟨x.1.val.2, x.2.2.2.symm⟩⟩⟩
  have hF : Function.Bijective F := by
    constructor
    · intro x y hxy
      rcases x with ⟨p, ⟨e, he⟩⟩
      rcases y with ⟨q, ⟨e', he'⟩⟩
      have heq : e = e' := congrArg Subtype.val hxy
      subst e'
      have hfirst : p.val.1 = q.val.1 :=
        quartet_injective (he.1.symm.trans he'.1)
      have hsecond : p.val.2 = q.val.2 :=
        quartet_injective (he.2.symm.trans he'.2)
      have hpq : p = q := by
        apply Subtype.ext
        exact Prod.ext hfirst hsecond
      subst q
      rfl
    · intro x
      obtain ⟨i, hi⟩ :=
        (canonicalCapF3_perm_four_zero_iff x.val
          (quartet (0 : QuartetIndex)) (quartet_card 0)).mp x.property.1
      obtain ⟨j, hj⟩ :=
        (canonicalCapF3_perm_four_zero_iff x.val
          (quartet (1 : QuartetIndex)) (quartet_card 1)).mp x.property.2
      have hbase :
          (quartet (0 : QuartetIndex) ∩ quartet (1 : QuartetIndex)).card = 2 := by
        decide
      have htransport :=
        pulledQuartet_inter_card x.val.symm
          (0 : QuartetIndex) (1 : QuartetIndex)
      rw [hbase] at htransport
      have hoverlap : (quartet i ∩ quartet j).card = 2 := by
        rw [hi, hj]
        simpa [pulledQuartet_eq_image] using htransport
      let target : CanonicalOrderedOverlapPair := ⟨(i, j), hoverlap⟩
      have hfiber :
          (quartet (0 : QuartetIndex)).image x.val = quartet target.val.1 ∧
          (quartet (1 : QuartetIndex)).image x.val = quartet target.val.2 :=
        ⟨hi.symm, hj.symm⟩
      refine ⟨⟨target, ⟨x.val, hfiber⟩⟩, ?_⟩
      exact Subtype.ext rfl
  calc
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) (quartet (0 : QuartetIndex)) = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) (quartet (1 : QuartetIndex)) = 0} =
      Fintype.card (Σ p : CanonicalOrderedOverlapPair,
        {e : Equiv.Perm Vertex //
          (quartet (0 : QuartetIndex)).image e = quartet p.val.1 ∧
          (quartet (1 : QuartetIndex)).image e = quartet p.val.2}) :=
        (Fintype.card_congr (Equiv.ofBijective F hF)).symm
    _ = 128 := by
      rw [Fintype.card_sigma]
      calc
        (∑ p : CanonicalOrderedOverlapPair,
          Fintype.card {e : Equiv.Perm Vertex //
            (quartet (0 : QuartetIndex)).image e = quartet p.val.1 ∧
            (quartet (1 : QuartetIndex)).image e = quartet p.val.2}) =
          ∑ _p : CanonicalOrderedOverlapPair, (16 : ℕ) := by
            apply Finset.sum_congr rfl
            intro p _
            exact canonical_ordered_overlap_pair_image_fibre_card
              p.val.1 p.val.2 p.property
        _ = 128 := by simp [canonicalOrderedOverlapPair_card]

#print axioms PDIC.canonicalOrderedOverlapPair_card
#print axioms PDIC.canonicalCapF3_perm_canonical_overlap_pair_event_card

end PDIC


namespace PDIC

/-! S017: true all-source ordered overlapping-pair orbit transport. -/

def overlapSourceColour (s t : Finset Vertex) (v : Vertex) : Bool × Bool :=
  (decide (v ∈ s), decide (v ∈ t))

def overlapSourceCell (s t : Finset Vertex) (b : Bool × Bool) : Finset Vertex :=
  (if b.1 then s else Finset.univ \ s) ∩
  (if b.2 then t else Finset.univ \ t)

/-- The two prescribed overlapping four-sets cut the actual vertex set into
four two-element membership-bit cells. -/
theorem overlapSourceColour_fibre_card
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hst : (s ∩ t).card = 2) (b : Bool × Bool) :
    Fintype.card {v : Vertex // overlapSourceColour s t v = b} = 2 := by
  classical
  have hfilter :
      (Finset.univ.filter (fun v : Vertex => overlapSourceColour s t v = b)) =
        overlapSourceCell s t b := by
    ext v
    rcases b with ⟨b₁, b₂⟩
    cases b₁ <;> cases b₂ <;>
      by_cases h₁ : v ∈ s <;> by_cases h₂ : v ∈ t <;>
        simp [overlapSourceColour, overlapSourceCell, h₁, h₂]
  rw [Fintype.card_subtype, hfilter]
  have hdiffS : (s \ t).card = 2 := by
    have h := Finset.card_sdiff_add_card_inter s t
    omega
  have hdiffT : (t \ s).card = 2 := by
    have h := Finset.card_sdiff_add_card_inter t s
    rw [Finset.inter_comm t s] at h
    omega
  have hUnion : (s ∪ t).card = 6 := by
    have h := Finset.card_inter_add_card_union s t
    omega
  have hOutside : ((Finset.univ : Finset Vertex) \ (s ∪ t)).card = 2 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ (s ∪ t))]
    have hEight : (Finset.univ : Finset Vertex).card = 8 := by decide
    omega
  rcases b with ⟨b₁, b₂⟩
  cases b₁ <;> cases b₂
  · have h : overlapSourceCell s t (false, false) =
        (Finset.univ : Finset Vertex) \ (s ∪ t) := by
      ext v
      simp [overlapSourceCell]
    rw [h]
    exact hOutside
  · have h : overlapSourceCell s t (false, true) = t \ s := by
      ext v
      simp [overlapSourceCell] <;> tauto
    rw [h]
    exact hdiffT
  · have h : overlapSourceCell s t (true, false) = s \ t := by
      ext v
      simp [overlapSourceCell]
    rw [h]
    exact hdiffS
  · simpa [overlapSourceCell] using hst

/-- A permutation of the ACTUAL eight vertices takes any ordered pair of
four-sets with two-point overlap to the canonical ordered pair (Q0,Q1).
It is constructed by four explicit two-element fibre equivalences. -/
theorem exists_perm_overlap_pair_to_canonical
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hst : (s ∩ t).card = 2) :
    ∃ p : Equiv.Perm Vertex,
      s.image p = quartet (0 : QuartetIndex) ∧
      t.image p = quartet (1 : QuartetIndex) := by
  classical
  let c := overlapSourceColour s t
  let d := canonicalTwoQuartetColour
  have hc (b : Bool × Bool) :
      Fintype.card {v : Vertex // c v = b} = 2 := by
    exact overlapSourceColour_fibre_card s t hs ht hst b
  let φ (b : Bool × Bool) :
      {v : Vertex // c v = b} ≃ {v : Vertex // d v = b} :=
    Fintype.equivOfCardEq
      ((hc b).trans (canonicalTwoQuartetColour_fibre_card b).symm)
  let p : Equiv.Perm Vertex :=
    ((Equiv.sigmaFiberEquiv c).symm.trans
      (Equiv.sigmaCongrRight φ)).trans (Equiv.sigmaFiberEquiv d)
  have hcolour (v : Vertex) : c v = d (p v) := by
    have h :
        (Equiv.sigmaFiberEquiv d).symm (p v) =
          (Equiv.sigmaCongrRight φ) ((Equiv.sigmaFiberEquiv c).symm v) := by
      simp only [p, Equiv.trans_apply, Equiv.symm_apply_apply]
    have hf := congrArg Sigma.fst h.symm
    simpa only [Equiv.sigmaFiberEquiv_symm_apply_fst,
      Equiv.sigmaCongrRight_apply] using hf
  have hS (v : Vertex) : v ∈ s ↔ p v ∈ quartet (0 : QuartetIndex) := by
    have h := congrArg Prod.fst (hcolour v)
    by_cases a : v ∈ s <;>
      by_cases b : p v ∈ quartet (0 : QuartetIndex) <;>
        simp [c, d, overlapSourceColour, canonicalTwoQuartetColour, a, b] at h ⊢
  have hT (v : Vertex) : v ∈ t ↔ p v ∈ quartet (1 : QuartetIndex) := by
    have h := congrArg Prod.snd (hcolour v)
    by_cases a : v ∈ t <;>
      by_cases b : p v ∈ quartet (1 : QuartetIndex) <;>
        simp [c, d, overlapSourceColour, canonicalTwoQuartetColour, a, b] at h ⊢
  have hpS : s.image p = quartet (0 : QuartetIndex) := by
    ext v
    constructor
    · intro hv
      obtain ⟨w, hw, rfl⟩ := Finset.mem_image.mp hv
      exact (hS w).mp hw
    · intro hv
      refine Finset.mem_image.mpr ⟨p.symm v, ?_, by simp⟩
      exact (hS (p.symm v)).mpr (by simpa using hv)
  have hpT : t.image p = quartet (1 : QuartetIndex) := by
    ext v
    constructor
    · intro hv
      obtain ⟨w, hw, rfl⟩ := Finset.mem_image.mp hv
      exact (hT w).mp hw
    · intro hv
      refine Finset.mem_image.mpr ⟨p.symm v, ?_, by simp⟩
      exact (hT (p.symm v)).mpr (by simpa using hv)
  exact ⟨p, hpS, hpT⟩

/-- Universal real 128-event theorem: all prescribed distinct size-four
source sets meeting in two vertices, not only Q0 and Q1. No enumeration
of all 40320 permutations is used. -/
theorem canonicalCapF3_perm_overlap_two_pair_event_card
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hst : (s ∩ t).card = 2) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0} = 128 := by
  classical
  obtain ⟨p, hps, hpt⟩ :=
    exists_perm_overlap_pair_to_canonical s t hs ht hst
  let F : Equiv.Perm Vertex ≃ Equiv.Perm Vertex :=
    { toFun := fun e => p.symm.trans e
      invFun := fun e => p.trans e
      left_inv := by intro e; ext v; simp
      right_inv := by intro e; ext v; simp }
  have hpred (e : Equiv.Perm Vertex) :
      (capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
       capSum (fun v => canonicalCapF3 (e v)) t = 0) ↔
      (capSum (fun v => canonicalCapF3 ((F e) v))
          (quartet (0 : QuartetIndex)) = 0 ∧
       capSum (fun v => canonicalCapF3 ((F e) v))
          (quartet (1 : QuartetIndex)) = 0) := by
    have hsum (a : Finset Vertex) :
        capSum (fun v => canonicalCapF3 (e v)) a =
          capSum (fun v => canonicalCapF3 ((F e) v)) (a.image p) := by
      rw [capSum_perm_reindex, capSum_perm_reindex,
        finset_image_perm_trans]
      have hp : p.trans (F e) = e := F.left_inv e
      rw [hp]
    have hsumS := (hsum s)
    have hsumT := (hsum t)
    rw [hps] at hsumS
    rw [hpt] at hsumT
    rw [hsumS, hsumT]
  let E :
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0} ≃
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) (quartet (0 : QuartetIndex)) = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) (quartet (1 : QuartetIndex)) = 0} :=
    Equiv.subtypeEquiv F (fun e => hpred e)
  exact (Fintype.card_congr E).trans
    canonicalCapF3_perm_canonical_overlap_pair_event_card

#print axioms PDIC.overlapSourceColour_fibre_card
#print axioms PDIC.exists_perm_overlap_pair_to_canonical
#print axioms PDIC.canonicalCapF3_perm_overlap_two_pair_event_card

end PDIC


namespace PDIC

/-! S017: a genuine three-source cap-zero fibre using complementary pairs. -/

/-- A specified compatible triple of actual four-subsets is simultaneously
zero-sum under exactly 128 of the 40320 permutations. The complementary
second set imposes no new zero-sum condition beyond the first. -/
theorem canonicalCapF3_perm_compatible_triple_event_card
    (s t u : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hu : u.card = 4) (hd : Disjoint s t)
    (hsu : (s ∩ u).card = 2) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) u = 0} = 128 := by
  classical
  have hevent (e : Equiv.Perm Vertex) :
      (capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
       capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
       capSum (fun v => canonicalCapF3 (e v)) u = 0) ↔
      (capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
       capSum (fun v => canonicalCapF3 (e v)) u = 0) := by
    constructor
    · rintro ⟨hzs, hzt, hzu⟩
      exact ⟨hzs, hzu⟩
    · rintro ⟨hzs, hzu⟩
      have htotal :=
        canonicalCapF3_perm_disjoint_pair_sum_zero s t hs ht hd e
      rw [hzs, zero_add] at htotal
      exact ⟨hzs, htotal, hzu⟩
  let E :
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) u = 0} ≃
      {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) u = 0} :=
    Equiv.subtypeEquiv (Equiv.refl _) (fun e => hevent e)
  exact (Fintype.card_congr E).trans
    (canonicalCapF3_perm_overlap_two_pair_event_card s u hs hu hsu)

#print axioms PDIC.canonicalCapF3_perm_compatible_triple_event_card

end PDIC

 
namespace PDIC

/-! S018: begin the actual graph-level probability moment assembly.
The family below contains genuine maximal-independent vertex sets, not
quartet-index proxies or a matrix count. -/

/-- All size-four maximal independent vertex sets of the actual graph. -/
public noncomputable def fourGraphMISFamily (G : SimpleGraph Vertex) :
    Finset (Finset Vertex) := by
  classical
  exact (Finset.univ : Finset (Finset Vertex)).filter
    (fun s => s.card = 4 ∧ GraphMIS G s)

/-- The manuscript's random variable is the cardinal of the real graph-MIS
family surviving the canonical cap-zero condition. -/
theorem labellingZeroMISCount_eq_family_filter
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) :
    labellingZeroMISCount G e =
      ((fourGraphMISFamily G).filter
        (fun s => capSum (fun v => canonicalCapF3 (e v)) s = 0)).card := by
  classical
  change ((Finset.univ : Finset (Finset Vertex)).filter
      (fun s => s.card = 4 ∧ GraphMIS G s ∧
        capSum (fun v => canonicalCapF3 (e v)) s = 0)).card =
    (((Finset.univ : Finset (Finset Vertex)).filter
      (fun s => s.card = 4 ∧ GraphMIS G s)).filter
        (fun s => capSum (fun v => canonicalCapF3 (e v)) s = 0)).card
  congr 1
  ext s
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  tauto

/-- The first *genuine graph-derived* factorial-moment numerator.
It double-counts actual (labelling, four-MIS) incidents, and invokes the
strictly verified 2304 fibre theorem for each real graph MIS. -/
theorem graphMIS_first_moment_numerator
    (G : SimpleGraph Vertex) :
    (∑ e : Equiv.Perm Vertex, labellingZeroMISCount G e) =
      2304 * (fourGraphMISFamily G).card := by
  classical
  have hfilter (e : Equiv.Perm Vertex) :
      labellingZeroMISCount G e =
        ∑ s ∈ fourGraphMISFamily G,
          if capSum (fun v => canonicalCapF3 (e v)) s = 0
          then (1 : ℕ) else 0 := by
    rw [labellingZeroMISCount_eq_family_filter]
    simp
  calc
    (∑ e : Equiv.Perm Vertex, labellingZeroMISCount G e) =
        ∑ e : Equiv.Perm Vertex, ∑ s ∈ fourGraphMISFamily G,
          if capSum (fun v => canonicalCapF3 (e v)) s = 0
          then (1 : ℕ) else 0 := by
            apply Finset.sum_congr rfl
            intro e _
            exact hfilter e
    _ = ∑ s ∈ fourGraphMISFamily G, ∑ e : Equiv.Perm Vertex,
          if capSum (fun v => canonicalCapF3 (e v)) s = 0
          then (1 : ℕ) else 0 := by
            rw [Finset.sum_comm]
    _ = ∑ _s ∈ fourGraphMISFamily G, (2304 : ℕ) := by
          apply Finset.sum_congr rfl
          intro s hs
          have hfour : s.card = 4 := (Finset.mem_filter.mp hs).2.1
          have hc := canonicalCapF3_perm_singleton_event_card s hfour
          rw [Fintype.card_subtype] at hc
          simpa using hc
    _ = 2304 * (fourGraphMISFamily G).card := by
          simp [mul_comm]

#print axioms PDIC.labellingZeroMISCount_eq_family_filter
#print axioms PDIC.graphMIS_first_moment_numerator

end PDIC


namespace PDIC

/-! S018 continued: convert the exact real graph incidence count to the
manuscript's rational first moment and eliminate an ordered-triple pitfall. -/

/-- The expectation is calculated over the full genuine uniform 8! sample
space, with no replacement of the graph family by symbolic quartet indices. -/
noncomputable def graphMIS_first_moment (G : SimpleGraph Vertex) : ℚ :=
  (∑ e : Equiv.Perm Vertex, (labellingZeroMISCount G e : ℚ)) /
    (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- The first factor of the manuscript's complete probability law,
valid for every graph: E[N₀]=2m/35. -/
theorem graphMIS_first_moment_eq (G : SimpleGraph Vertex) :
    graphMIS_first_moment G =
      (2 : ℚ) * ((fourGraphMISFamily G).card : ℚ) / 35 := by
  classical
  have hn :
      (∑ e : Equiv.Perm Vertex, (labellingZeroMISCount G e : ℚ)) =
        (2304 : ℚ) * ((fourGraphMISFamily G).card : ℚ) := by
    exact_mod_cast graphMIS_first_moment_numerator G
  unfold graphMIS_first_moment
  rw [hn, uniformLabellings_card]
  ring

/-- A four-set in eight vertices has a unique disjoint four-set partner.
This is the orientation-free combinatorial reason a compatible unordered
three-MIS family cannot carry two different complementary pairs. -/
theorem disjoint_four_partner_unique
    (s t u : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) (hu : u.card = 4)
    (hst : Disjoint s t) (hsu : Disjoint s u) :
    t = u := by
  calc
    t = Finset.univ \ s :=
      disjoint_four_sets_complement s t hs ht hst
    _ = u := (disjoint_four_sets_complement s u hs hu hsu).symm

/-- In particular, three distinct four-sets never have two disjoint pairs
sharing the first set. This is a *true* unordered-incidence restriction,
not an assumption of sixfold ordered-triple multiplicity. -/
theorem three_distinct_four_sets_no_two_disjoint_pairs
    (s t u : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) (hu : u.card = 4)
    (htu : t ≠ u) (hst : Disjoint s t) :
    ¬ Disjoint s u := by
  intro hsu
  exact htu (disjoint_four_partner_unique s t u hs ht hu hst hsu)

#print axioms PDIC.graphMIS_first_moment_eq
#print axioms PDIC.disjoint_four_partner_unique
#print axioms PDIC.three_distinct_four_sets_no_two_disjoint_pairs

end PDIC


namespace PDIC

/-! S018 continuation: honest unordered subfamilies of actual four-MIS.
These are sets of distinct vertex sets, not ordered lists or quartet indices. -/

noncomputable def zeroFourGraphMISFamily
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) :
    Finset (Finset Vertex) := by
  classical
  exact (fourGraphMISFamily G).filter
    (fun s => capSum (fun v => canonicalCapF3 (e v)) s = 0)

theorem zeroFourGraphMISFamily_card
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) :
    (zeroFourGraphMISFamily G e).card = labellingZeroMISCount G e := by
  classical
  exact (labellingZeroMISCount_eq_family_filter G e).symm

/-- The surviving unordered k-subfamilies count is precisely choose(N0,k).
Unlike an ordered tuple, each distinct subfamily is counted once. -/
theorem zeroGraphMIS_subfamily_card_choose
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) (k : ℕ) :
    ((zeroFourGraphMISFamily G e).powersetCard k).card =
      Nat.choose (labellingZeroMISCount G e) k := by
  rw [Finset.card_powersetCard, zeroFourGraphMISFamily_card]

/-- Every zero-sum unordered k-subfamily is exactly a size-k subfamily of
the real graph MIS family on which all constituent cap sums vanish. -/
theorem zeroGraphMIS_subfamilies_eq_filter
    (G : SimpleGraph Vertex) (e : Equiv.Perm Vertex) (k : ℕ) :
    (zeroFourGraphMISFamily G e).powersetCard k =
      ((fourGraphMISFamily G).powersetCard k).filter
        (fun T => ∀ s ∈ T, capSum (fun v => canonicalCapF3 (e v)) s = 0) := by
  classical
  ext T
  simp only [Finset.mem_powersetCard, Finset.mem_filter]
  constructor
  · rintro ⟨hsub, hc⟩
    refine ⟨⟨?_, hc⟩, ?_⟩
    · exact hsub.trans (Finset.filter_subset _ _)
    · intro s hs
      exact (Finset.mem_filter.mp (hsub hs)).2
  · rintro ⟨⟨hsub, hc⟩, hz⟩
    refine ⟨?_, hc⟩
    intro s hs
    exact Finset.mem_filter.mpr ⟨hsub hs, hz s hs⟩

/-- A genuine uniform-labelling/binomial-moment double-counting identity
for EVERY k, with arbitrary graph and real unordered k-subsets of MIS.
This supplies the graph-probability combinatorial interface for M2/M3. -/
theorem graphMIS_unordered_moment_double_count
    (G : SimpleGraph Vertex) (k : ℕ) :
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) k) =
    ∑ T ∈ (fourGraphMISFamily G).powersetCard k,
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ s ∈ T,
          capSum (fun v => canonicalCapF3 (e v)) s = 0)).card := by
  classical
  calc
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) k) =
        ∑ e : Equiv.Perm Vertex,
          (((fourGraphMISFamily G).powersetCard k).filter
            (fun T => ∀ s ∈ T,
              capSum (fun v => canonicalCapF3 (e v)) s = 0)).card := by
          apply Finset.sum_congr rfl
          intro e _
          rw [← zeroGraphMIS_subfamily_card_choose G e k,
            zeroGraphMIS_subfamilies_eq_filter]
    _ = ∑ e : Equiv.Perm Vertex,
          ∑ T ∈ (fourGraphMISFamily G).powersetCard k,
            if (∀ s ∈ T, capSum (fun v => canonicalCapF3 (e v)) s = 0)
            then (1 : ℕ) else 0 := by simp
    _ = ∑ T ∈ (fourGraphMISFamily G).powersetCard k,
          ∑ e : Equiv.Perm Vertex,
            if (∀ s ∈ T, capSum (fun v => canonicalCapF3 (e v)) s = 0)
            then (1 : ℕ) else 0 := by rw [Finset.sum_comm]
    _ = ∑ T ∈ (fourGraphMISFamily G).powersetCard k,
          ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
            (fun e => ∀ s ∈ T,
              capSum (fun v => canonicalCapF3 (e v)) s = 0)).card := by simp

#print axioms PDIC.zeroFourGraphMISFamily_card
#print axioms PDIC.zeroGraphMIS_subfamily_card_choose
#print axioms PDIC.zeroGraphMIS_subfamilies_eq_filter
#print axioms PDIC.graphMIS_unordered_moment_double_count

end PDIC


namespace PDIC

/-! S019: eliminate impossible genuine two- and three-source events
before summing over unordered subfamilies of graph maximal-independent sets. -/

/-- Two distinct four-subsets whose overlap is neither 0 nor 2 cannot
simultaneously have zero cap sum under any of the 40320 permutations. -/
theorem canonicalCapF3_perm_distinct_pair_event_zero_of_other_overlap
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hne : s ≠ t)
    (hzero : (s ∩ t).card ≠ 0)
    (htwo : (s ∩ t).card ≠ 2) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0} = 0 := by
  classical
  have hnone (e : Equiv.Perm Vertex) :
      ¬(capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0) := by
    rintro ⟨hzs, hzt⟩
    rcases canonicalCapF3_perm_distinct_pair_overlap_cases e s t
        hs ht hne hzs hzt with h0 | h2
    · exact hzero h0
    · exact htwo h2
  rw [Fintype.card_subtype]
  simp [hnone]

/-- The exact pair event fibre classification for arbitrary ordered inputs
with distinct four-subsets. It is independent of the graph, and will
be applied once to each genuine unordered two-MIS family. -/
theorem canonicalCapF3_perm_distinct_pair_event_card_by_overlap
    (s t : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hne : s ≠ t) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0} =
      if (s ∩ t).card = 0 then 2304
      else if (s ∩ t).card = 2 then 128 else 0 := by
  classical
  by_cases hzero : (s ∩ t).card = 0
  · rw [if_pos hzero]
    have hd : Disjoint s t := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact Finset.card_eq_zero.mp hzero
    exact canonicalCapF3_perm_complementary_pair_event_card s t hs ht hd
  · rw [if_neg hzero]
    by_cases htwo : (s ∩ t).card = 2
    · rw [if_pos htwo]
      exact canonicalCapF3_perm_overlap_two_pair_event_card s t hs ht htwo
    · rw [if_neg htwo]
      exact canonicalCapF3_perm_distinct_pair_event_zero_of_other_overlap
        s t hs ht hne hzero htwo

/-- If three distinct size-four sources have a simultaneous zero event,
at least one pair is complementary. This rules out every triangle of
only overlapping 2+2 pairs, including when all sets happen to be MIS. -/
theorem canonicalCapF3_perm_distinct_triple_event_zero_of_no_disjoint
    (s t u : Finset Vertex) (hs : s.card = 4) (ht : t.card = 4)
    (hu : u.card = 4) (hst : s ≠ t) (hsu : s ≠ u) (htu : t ≠ u)
    (hst0 : (s ∩ t).card ≠ 0)
    (hsu0 : (s ∩ u).card ≠ 0)
    (htu0 : (t ∩ u).card ≠ 0) :
    Fintype.card {e : Equiv.Perm Vertex //
      capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
      capSum (fun v => canonicalCapF3 (e v)) u = 0} = 0 := by
  classical
  have hnone (e : Equiv.Perm Vertex) :
      ¬(capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) u = 0) := by
    rintro ⟨hzs, hzt, hzu⟩
    rcases canonicalCapF3_perm_three_zero_has_disjoint_pair e s t u
        hs ht hu hst hsu htu hzs hzt hzu with h0 | h0 | h0
    · exact hst0 h0
    · exact hsu0 h0
    · exact htu0 h0
  rw [Fintype.card_subtype]
  simp [hnone]

#print axioms PDIC.canonicalCapF3_perm_distinct_pair_event_zero_of_other_overlap
#print axioms PDIC.canonicalCapF3_perm_distinct_pair_event_card_by_overlap
#print axioms PDIC.canonicalCapF3_perm_distinct_triple_event_zero_of_no_disjoint

end PDIC


namespace PDIC

/-! S019 genuine unordered-family bridge: a two-member subfamily of
actual graph four-MIS is an unordered pair of distinct genuine sources,
whose event fibre is the classified, ordered-source fibre. -/

/-- Every genuine unordered two-subfamily has an exact 2304/128/0
fibre determined by its two different member four-MIS. The family T is
counted once in powersetCard 2, with no extra factor of two. -/
theorem graphMIS_unordered_pair_family_event_card
    (G : SimpleGraph Vertex) (T : Finset (Finset Vertex))
    (hT : T ∈ (fourGraphMISFamily G).powersetCard 2) :
    ∃ s t : Finset Vertex,
      s ≠ t ∧ s ∈ fourGraphMISFamily G ∧
      t ∈ fourGraphMISFamily G ∧ T = {s, t} ∧
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ u ∈ T,
          capSum (fun v => canonicalCapF3 (e v)) u = 0)).card =
        (if (s ∩ t).card = 0 then 2304
          else if (s ∩ t).card = 2 then 128 else 0) := by
  classical
  obtain ⟨hsub, hcard⟩ := Finset.mem_powersetCard.mp hT
  obtain ⟨s, t, hne, rfl⟩ := Finset.card_eq_two.mp hcard
  have hsM : s ∈ fourGraphMISFamily G := hsub (by simp)
  have htM : t ∈ fourGraphMISFamily G := hsub (by simp)
  have hs : s.card = 4 := (Finset.mem_filter.mp hsM).2.1
  have ht : t.card = 4 := (Finset.mem_filter.mp htM).2.1
  refine ⟨s, t, hne, hsM, htM, rfl, ?_⟩
  have hfilter :
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ u ∈ ({s, t} : Finset (Finset Vertex)),
          capSum (fun v => canonicalCapF3 (e v)) u = 0)).card =
      Fintype.card {e : Equiv.Perm Vertex //
        capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
        capSum (fun v => canonicalCapF3 (e v)) t = 0} := by
    rw [Fintype.card_subtype]
    congr 1
    ext e
    simp
  rw [hfilter]
  exact canonicalCapF3_perm_distinct_pair_event_card_by_overlap
    s t hs ht hne

#print axioms PDIC.graphMIS_unordered_pair_family_event_card

end PDIC


namespace PDIC

/-! S020: invariant overlap classes and the numerical second factorial
moment of the actual graph maximal-independent-set family. -/

/-- The overlap of a genuine unordered pair of sets is independent of
which member is named first. -/
public def UnorderedPairOverlap (T : Finset (Finset Vertex)) (k : ℕ) : Prop :=
  ∀ s ∈ T, ∀ t ∈ T, s ≠ t → (s ∩ t).card = k

theorem unorderedPairOverlap_pair_iff
    (s t : Finset Vertex) (hne : s ≠ t) (k : ℕ) :
    UnorderedPairOverlap {s, t} k ↔ (s ∩ t).card = k := by
  classical
  constructor
  · intro h
    exact h s (by simp) t (by simp) hne
  · intro h a ha b hb hab
    simp only [Finset.mem_insert, Finset.mem_singleton] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact (hab rfl).elim
    · exact h
    · simpa [Finset.inter_comm] using h
    · exact (hab rfl).elim

/-- Number of genuine *unordered* two-MIS subfamilies with overlap k. -/
public noncomputable def graphMIS_pairOverlapCount
    (G : SimpleGraph Vertex) (k : ℕ) : ℕ := by
  classical
  exact (((fourGraphMISFamily G).powersetCard 2).filter
    (fun T => UnorderedPairOverlap T k)).card

/-- The first fully numerical second factorial-moment identity for the
genuine 40320-element labelling space and genuine unordered graph MIS pairs. -/
theorem graphMIS_second_moment_numerator (G : SimpleGraph Vertex) :
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) 2) =
      2304 * graphMIS_pairOverlapCount G 0 +
      128 * graphMIS_pairOverlapCount G 2 := by
  classical
  let F := (fourGraphMISFamily G).powersetCard 2
  have hfibre (T : Finset (Finset Vertex)) (hT : T ∈ F) :
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ s ∈ T,
          capSum (fun v => canonicalCapF3 (e v)) s = 0)).card =
        (if UnorderedPairOverlap T 0 then 2304 else 0) +
        (if UnorderedPairOverlap T 2 then 128 else 0) := by
    obtain ⟨s, t, hne, _hs, _ht, rfl, hevent⟩ :=
      graphMIS_unordered_pair_family_event_card G T hT
    rw [hevent]
    simp only [unorderedPairOverlap_pair_iff s t hne]
    by_cases h0 : (s ∩ t).card = 0
    · have h2 : (s ∩ t).card ≠ 2 := by omega
      simp [h0, h2]
    · by_cases h2 : (s ∩ t).card = 2
      · simp [h0, h2]
      · simp [h0, h2]
  calc
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) 2) =
        ∑ T ∈ F,
          ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
            (fun e => ∀ s ∈ T,
              capSum (fun v => canonicalCapF3 (e v)) s = 0)).card := by
          exact graphMIS_unordered_moment_double_count G 2
    _ = ∑ T ∈ F,
          ((if UnorderedPairOverlap T 0 then 2304 else 0) +
           (if UnorderedPairOverlap T 2 then 128 else 0)) := by
          apply Finset.sum_congr rfl
          intro T hT
          exact hfibre T hT
    _ = 2304 * graphMIS_pairOverlapCount G 0 +
        128 * graphMIS_pairOverlapCount G 2 := by
          simp [F, graphMIS_pairOverlapCount, Finset.sum_add_distrib,
            Finset.sum_ite, mul_comm]

#print axioms PDIC.unorderedPairOverlap_pair_iff
#print axioms PDIC.graphMIS_second_moment_numerator

end PDIC


namespace PDIC

/-! S020 continuation: rational normalization and the genuine compatible
unordered three-subfamily fibre. -/

noncomputable def graphMIS_second_moment (G : SimpleGraph Vertex) : ℚ :=
  (∑ e : Equiv.Perm Vertex,
    (Nat.choose (labellingZeroMISCount G e) 2 : ℚ)) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- The exact rational second binomial moment, with actual unordered
overlap counts and no ordered-pair multiplicity. -/
theorem graphMIS_second_moment_eq (G : SimpleGraph Vertex) :
    graphMIS_second_moment G =
      (2 : ℚ) * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
      (graphMIS_pairOverlapCount G 2 : ℚ) / 315 := by
  classical
  have hn :
      (∑ e : Equiv.Perm Vertex,
        (Nat.choose (labellingZeroMISCount G e) 2 : ℚ)) =
        (2304 : ℚ) * (graphMIS_pairOverlapCount G 0 : ℚ) +
        (128 : ℚ) * (graphMIS_pairOverlapCount G 2 : ℚ) := by
    exact_mod_cast graphMIS_second_moment_numerator G
  unfold graphMIS_second_moment
  rw [hn, uniformLabellings_card]
  ring

/-- Each *actual* unordered compatible three-MIS family has precisely 128
simultaneous zero-label permutations. -/
theorem graphMIS_unordered_compatible_triple_event_card
    (G : SimpleGraph Vertex) (T : Finset (Finset Vertex))
    (hT : IsUnorderedCompatibleTriple G T) :
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => ∀ s ∈ T,
        capSum (fun v => canonicalCapF3 (e v)) s = 0)).card = 128 := by
  classical
  rcases hT with ⟨hthree, hall, s, hs, t, ht, r, hr,
    hst, hsr, htr, hcomp, hmixed, _hmixedOther⟩
  have hsub : ({s, t, r} : Finset (Finset Vertex)) ⊆ T := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl | rfl <;> assumption
  have hcard : ({s, t, r} : Finset (Finset Vertex)).card = 3 := by
    simp [hst, hsr, htr]
  have heq : T = {s, t, r} :=
    (Finset.eq_of_subset_of_card_le hsub (by omega)).symm
  have hd : Disjoint s t := by
    rw [Finset.disjoint_iff_inter_eq_empty, hcomp]
    ext v
    simp
  have hmix : (s ∩ r).card = 2 := by
    simpa [Finset.inter_comm] using hmixed
  rw [heq]
  have hfilt :
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => ∀ u ∈ ({s, t, r} : Finset (Finset Vertex)),
          capSum (fun v => canonicalCapF3 (e v)) u = 0)).card =
        Fintype.card {e : Equiv.Perm Vertex //
          capSum (fun v => canonicalCapF3 (e v)) s = 0 ∧
          capSum (fun v => canonicalCapF3 (e v)) t = 0 ∧
          capSum (fun v => canonicalCapF3 (e v)) r = 0} := by
    rw [Fintype.card_subtype]
    congr 1
    ext e
    simp
  rw [hfilt]
  exact canonicalCapF3_perm_compatible_triple_event_card s t r
    (hall s hs).1 (hall t ht).1 (hall r hr).1 hd hmix

#print axioms PDIC.graphMIS_second_moment_eq
#print axioms PDIC.graphMIS_unordered_compatible_triple_event_card

end PDIC


namespace PDIC

/-! S021: a simultaneous zero event on a genuine unordered three-MIS
subfamily forces exactly one complementary pair, and hence the 2+2
incidence defining the paper's intrinsic compatible-triple count. -/

/-- With a complementary four-set pair, any distinct third zero quartet
overlaps both sides in two vertices; a second complementary partner would
contradict its uniqueness. -/
theorem canonicalCapF3_perm_third_overlap_two
    (e : Equiv.Perm Vertex) (s t r : Finset Vertex)
    (hs : s.card = 4) (ht : t.card = 4) (hr : r.card = 4)
    (hsr : s ≠ r) (htr : t ≠ r)
    (hst : Disjoint s t)
    (hzs : capSum (fun v => canonicalCapF3 (e v)) s = 0)
    (hzt : capSum (fun v => canonicalCapF3 (e v)) t = 0)
    (hzr : capSum (fun v => canonicalCapF3 (e v)) r = 0) :
    (s ∩ r).card = 2 ∧ (t ∩ r).card = 2 := by
  classical
  constructor
  · rcases canonicalCapF3_perm_distinct_pair_overlap_cases e s r
      hs hr hsr hzs hzr with hzero | htwo
    · exfalso
      have hd : Disjoint s r := by
        rw [Finset.disjoint_iff_inter_eq_empty]
        exact Finset.card_eq_zero.mp hzero
      exact htr (disjoint_four_partner_unique s t r hs ht hr hst hd)
    · exact htwo
  · rcases canonicalCapF3_perm_distinct_pair_overlap_cases e t r
      ht hr htr hzt hzr with hzero | htwo
    · exfalso
      have hd : Disjoint t r := by
        rw [Finset.disjoint_iff_inter_eq_empty]
        exact Finset.card_eq_zero.mp hzero
      exact hsr (disjoint_four_partner_unique t s r ht hs hr hst.symm hd)
    · exact htwo

/-- A *real* three-element subfamily of graph maximal-independent
four-sets admitting one joint zero-sum labelling is intrinsically a
compatible unordered triple. No ordering is used in the conclusion. -/
theorem graphMIS_unordered_triple_compatible_of_event
    (G : SimpleGraph Vertex) (T : Finset (Finset Vertex))
    (hT : T ∈ (fourGraphMISFamily G).powersetCard 3)
    (e : Equiv.Perm Vertex)
    (hzero : ∀ s ∈ T,
      capSum (fun v => canonicalCapF3 (e v)) s = 0) :
    IsUnorderedCompatibleTriple G T := by
  classical
  obtain ⟨hsub, hcard⟩ := Finset.mem_powersetCard.mp hT
  obtain ⟨a, b, c, hab, hac, hbc, rfl⟩ := Finset.card_eq_three.mp hcard
  have hall : ∀ x ∈ ({a, b, c} : Finset (Finset Vertex)),
      x.card = 4 ∧ GraphMIS G x := by
    intro x hx
    exact (Finset.mem_filter.mp (hsub hx)).2
  have hthree : ({a, b, c} : Finset (Finset Vertex)).card = 3 := by
    simp [hab, hac, hbc]
  have hza : capSum (fun v => canonicalCapF3 (e v)) a = 0 :=
    hzero a (by simp)
  have hzb : capSum (fun v => canonicalCapF3 (e v)) b = 0 :=
    hzero b (by simp)
  have hzc : capSum (fun v => canonicalCapF3 (e v)) c = 0 :=
    hzero c (by simp)
  have hmake (s t r : Finset Vertex)
      (hsm : s ∈ ({a, b, c} : Finset (Finset Vertex)))
      (htm : t ∈ ({a, b, c} : Finset (Finset Vertex)))
      (hrm : r ∈ ({a, b, c} : Finset (Finset Vertex)))
      (hst : s ≠ t) (hsr : s ≠ r) (htr : t ≠ r)
      (hdis : (s ∩ t).card = 0) :
      IsUnorderedCompatibleTriple G {a, b, c} := by
    have hs := (hall s hsm).1
    have ht := (hall t htm).1
    have hr := (hall r hrm).1
    have hd : Disjoint s t := by
      rw [Finset.disjoint_iff_inter_eq_empty]
      exact Finset.card_eq_zero.mp hdis
    have hcomp := disjoint_four_sets_complement s t hs ht hd
    have hmix := canonicalCapF3_perm_third_overlap_two e s t r
      hs ht hr hsr htr hd (hzero s hsm) (hzero t htm) (hzero r hrm)
    refine ⟨hthree, hall, s, hsm, t, htm, r, hrm,
      hst, hsr, htr, hcomp, ?_, ?_⟩
    · simpa [Finset.inter_comm] using hmix.1
    · simpa [Finset.inter_comm] using hmix.2
  have ha := (hall a (by simp)).1
  have hb := (hall b (by simp)).1
  have hc := (hall c (by simp)).1
  rcases canonicalCapF3_perm_three_zero_has_disjoint_pair
      e a b c ha hb hc hab hac hbc hza hzb hzc with hd | hd | hd
  · exact hmake a b c (by simp) (by simp) (by simp)
      hab hac hbc hd
  · exact hmake a c b (by simp) (by simp) (by simp)
      hac hab hbc.symm hd
  · exact hmake b c a (by simp) (by simp) (by simp)
      hbc hab.symm hac.symm hd

/-- An incompatible genuine unordered triple has zero joint zero-sum
labellings. Together with the positive 128-fibre lemma this classifies
all true unordered three-MIS event fibres. -/
theorem graphMIS_unordered_triple_event_card_zero
    (G : SimpleGraph Vertex) (T : Finset (Finset Vertex))
    (hT : T ∈ (fourGraphMISFamily G).powersetCard 3)
    (hnot : ¬ IsUnorderedCompatibleTriple G T) :
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => ∀ s ∈ T,
        capSum (fun v => canonicalCapF3 (e v)) s = 0)).card = 0 := by
  classical
  have hnone (e : Equiv.Perm Vertex) :
      ¬(∀ s ∈ T, capSum (fun v => canonicalCapF3 (e v)) s = 0) := by
    intro hz
    exact hnot (graphMIS_unordered_triple_compatible_of_event G T hT e hz)
  simp [hnone]

/-- Full third factorial moment over *true unordered* three-member
graph-MIS families; the coefficient is 128, not 6 × 128. -/
theorem graphMIS_third_moment_numerator (G : SimpleGraph Vertex) :
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) 3) =
      128 * unorderedCompatibleTripleCount G := by
  classical
  let F := (fourGraphMISFamily G).powersetCard 3
  have hfamily (T : Finset (Finset Vertex))
      (h : IsUnorderedCompatibleTriple G T) : T ∈ F := by
    apply Finset.mem_powersetCard.mpr
    refine ⟨?_, h.1⟩
    intro s hs
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_univ _, h.2.1 s hs⟩
  have hcount :
      (F.filter (IsUnorderedCompatibleTriple G)).card =
        unorderedCompatibleTripleCount G := by
    change (F.filter (IsUnorderedCompatibleTriple G)).card =
      ((Finset.univ : Finset (Finset (Finset Vertex))).filter
        (IsUnorderedCompatibleTriple G)).card
    apply congrArg Finset.card
    ext T
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    exact ⟨fun h => h.2, fun h => ⟨hfamily T h, h⟩⟩
  calc
    (∑ e : Equiv.Perm Vertex,
      Nat.choose (labellingZeroMISCount G e) 3) =
        ∑ T ∈ F,
          ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
            (fun e => ∀ s ∈ T,
              capSum (fun v => canonicalCapF3 (e v)) s = 0)).card :=
        graphMIS_unordered_moment_double_count G 3
    _ = ∑ T ∈ F, (if IsUnorderedCompatibleTriple G T then 128 else 0) := by
          apply Finset.sum_congr rfl
          intro T hT
          by_cases hc : IsUnorderedCompatibleTriple G T
          · simp only [if_pos hc]
            exact graphMIS_unordered_compatible_triple_event_card G T hc
          · simp only [if_neg hc]
            exact graphMIS_unordered_triple_event_card_zero G T hT hc
    _ = 128 * (F.filter (IsUnorderedCompatibleTriple G)).card := by
          simp [Finset.sum_ite, mul_comm]
    _ = 128 * unorderedCompatibleTripleCount G := by rw [hcount]

noncomputable def graphMIS_third_moment (G : SimpleGraph Vertex) : ℚ :=
  (∑ e : Equiv.Perm Vertex,
    (Nat.choose (labellingZeroMISCount G e) 3 : ℚ)) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

theorem graphMIS_third_moment_eq (G : SimpleGraph Vertex) :
    graphMIS_third_moment G =
      (unorderedCompatibleTripleCount G : ℚ) / 315 := by
  have hn :
      (∑ e : Equiv.Perm Vertex,
        (Nat.choose (labellingZeroMISCount G e) 3 : ℚ)) =
      (128 : ℚ) * (unorderedCompatibleTripleCount G : ℚ) := by
    exact_mod_cast graphMIS_third_moment_numerator G
  unfold graphMIS_third_moment
  rw [hn, uniformLabellings_card]
  ring

#print axioms PDIC.canonicalCapF3_perm_third_overlap_two
#print axioms PDIC.graphMIS_unordered_triple_compatible_of_event
#print axioms PDIC.graphMIS_unordered_triple_event_card_zero
#print axioms PDIC.graphMIS_third_moment_numerator
#print axioms PDIC.graphMIS_third_moment_eq

end PDIC


namespace PDIC

/-! S021: the sharp extremal theorem as a probability of the actual
40320-element uniform permutation sample space, not a dummy moment variable. -/

noncomputable def graphMIS_exact_probability (G : SimpleGraph Vertex)
    (i : ℕ) : ℚ :=
  (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
    (fun e => labellingZeroMISCount G e = i)).card : ℚ) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- When the graph is connected, a labelling supports at most three
zero-sum four-MIS, so choose(N0,3) is exactly the indicator of N0=3. -/
theorem connected_graphMIS_choose_three_eq_indicator
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (e : Equiv.Perm Vertex) :
    Nat.choose (labellingZeroMISCount G e) 3 =
      if labellingZeroMISCount G e = 3 then 1 else 0 := by
  have hb := connected_labellingZeroMISCount_le_three G hc e
  have hcases : labellingZeroMISCount G e = 0 ∨
      labellingZeroMISCount G e = 1 ∨
      labellingZeroMISCount G e = 2 ∨
      labellingZeroMISCount G e = 3 := by omega
  rcases hcases with h | h | h | h <;> simp [h, Nat.choose]

/-- The genuine probability of precisely three zero-sum graph maximal
independent four-sets is h(G)/315. This is an actual event cardinal,
divided by the 8! = 40320 equally likely label permutations. -/
theorem connected_graphMIS_exact_probability_three
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 3 =
      (unorderedCompatibleTripleCount G : ℚ) / 315 := by
  classical
  have hs :
      (∑ e : Equiv.Perm Vertex,
        Nat.choose (labellingZeroMISCount G e) 3) =
      ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => labellingZeroMISCount G e = 3)).card := by
    calc
      (∑ e : Equiv.Perm Vertex,
        Nat.choose (labellingZeroMISCount G e) 3) =
        ∑ e : Equiv.Perm Vertex,
          (if labellingZeroMISCount G e = 3 then (1 : ℕ) else 0) := by
            apply Finset.sum_congr rfl
            intro e _
            exact connected_graphMIS_choose_three_eq_indicator G hc e
      _ = ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
          (fun e => labellingZeroMISCount G e = 3)).card := by simp
  have hn :
      (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
        (fun e => labellingZeroMISCount G e = 3)).card : ℚ) =
      (128 : ℚ) * (unorderedCompatibleTripleCount G : ℚ) := by
    exact_mod_cast (hs.symm.trans (graphMIS_third_moment_numerator G))
  unfold graphMIS_exact_probability
  rw [hn, uniformLabellings_card]
  ring

/-- The sharp real-event extremal result. The only connected eight-vertex
equality case up to graph isomorphism is the named spider S(2,2,2,1). -/
theorem connected_graphMIS_probability_three_sharp
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 3 ≤ (1 : ℚ) / 105 ∧
      (graphMIS_exact_probability G 3 = (1 : ℚ) / 105 ↔
        Nonempty (G ≃g namedSpider)) := by
  rw [connected_graphMIS_exact_probability_three G hc]
  obtain ⟨hle, heq⟩ :=
    sharp_probability_from_h (unorderedCompatibleTripleCount G)
      (connected_unorderedCompatibleTripleCount_le_three G hc)
  exact ⟨hle, heq.trans (connected_h_three_iff_namedSpider G hc)⟩

#print axioms PDIC.connected_graphMIS_choose_three_eq_indicator
#print axioms PDIC.connected_graphMIS_exact_probability_three
#print axioms PDIC.connected_graphMIS_probability_three_sharp

end PDIC


namespace PDIC

/-! S022: four *actual* probabilities, obtained from a histogram of genuine
40320-label events, never from hypothetical moment variables. -/

/-- A connected graph's genuine label histogram supports every rational test
function by summing over its four disjoint event fibres. -/
theorem connected_graphMIS_four_event_histogram
    (G : SimpleGraph Vertex) (hc : G.Connected) (f : ℕ → ℚ) :
    (∑ e : Equiv.Perm Vertex, f (labellingZeroMISCount G e)) =
    f 0 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 0)).card : ℚ) +
    f 1 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 1)).card : ℚ) +
    f 2 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 2)).card : ℚ) +
    f 3 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 3)).card : ℚ) := by
  classical
  calc
    (∑ e : Equiv.Perm Vertex, f (labellingZeroMISCount G e)) =
      ∑ e : Equiv.Perm Vertex, (
        (if labellingZeroMISCount G e = 0 then f 0 else 0) +
        (if labellingZeroMISCount G e = 1 then f 1 else 0) +
        (if labellingZeroMISCount G e = 2 then f 2 else 0) +
        (if labellingZeroMISCount G e = 3 then f 3 else 0)) := by
        apply Finset.sum_congr rfl
        intro e _
        have hb := connected_labellingZeroMISCount_le_three G hc e
        have hcases : labellingZeroMISCount G e = 0 ∨
            labellingZeroMISCount G e = 1 ∨
            labellingZeroMISCount G e = 2 ∨
            labellingZeroMISCount G e = 3 := by omega
        rcases hcases with h | h | h | h <;> simp [h]
    _ = f 0 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 0)).card : ℚ) +
    f 1 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 1)).card : ℚ) +
    f 2 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 2)).card : ℚ) +
    f 3 * (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = 3)).card : ℚ) := by
        simp [Finset.sum_add_distrib, Finset.sum_ite, mul_comm]

/-- Normalized histogram identity for any rational-valued observable on the
actual zero-sum maximal-independent-set count. -/
theorem connected_graphMIS_four_event_expectation
    (G : SimpleGraph Vertex) (hc : G.Connected) (f : ℕ → ℚ) :
    (∑ e : Equiv.Perm Vertex, f (labellingZeroMISCount G e)) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ) =
    f 0 * graphMIS_exact_probability G 0 +
    f 1 * graphMIS_exact_probability G 1 +
    f 2 * graphMIS_exact_probability G 2 +
    f 3 * graphMIS_exact_probability G 3 := by
  simp only [graphMIS_exact_probability]
  rw [connected_graphMIS_four_event_histogram G hc f]
  ring

/-- Every one of the genuine 40320 labels falls into exactly one of
N₀=0,1,2,3. -/
theorem connected_graphMIS_probability_mass
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 0 + graphMIS_exact_probability G 1 +
      graphMIS_exact_probability G 2 + graphMIS_exact_probability G 3 = 1 := by
  have h := connected_graphMIS_four_event_expectation G hc (fun _ => (1 : ℚ))
  have hu : (∑ _e : Equiv.Perm Vertex, (1 : ℚ)) =
      (Fintype.card (Equiv.Perm Vertex) : ℚ) := by simp
  rw [hu, uniformLabellings_card] at h
  norm_num at h
  linarith

/-- True first-moment transfer from event-cardinal probabilities. -/
theorem connected_graphMIS_probability_first
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 1 + 2 * graphMIS_exact_probability G 2 +
      3 * graphMIS_exact_probability G 3 = graphMIS_first_moment G := by
  have h := connected_graphMIS_four_event_expectation G hc
    (fun n => (n : ℚ))
  change graphMIS_first_moment G =
    (0 : ℚ) * graphMIS_exact_probability G 0 +
    (1 : ℚ) * graphMIS_exact_probability G 1 +
    (2 : ℚ) * graphMIS_exact_probability G 2 +
    (3 : ℚ) * graphMIS_exact_probability G 3 at h
  linarith

/-- True second *binomial* moment from the actual event partition. -/
theorem connected_graphMIS_probability_second
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 2 + 3 * graphMIS_exact_probability G 3 =
      graphMIS_second_moment G := by
  have h := connected_graphMIS_four_event_expectation G hc
    (fun n => (Nat.choose n 2 : ℚ))
  change graphMIS_second_moment G =
    (Nat.choose 0 2 : ℚ) * graphMIS_exact_probability G 0 +
    (Nat.choose 1 2 : ℚ) * graphMIS_exact_probability G 1 +
    (Nat.choose 2 2 : ℚ) * graphMIS_exact_probability G 2 +
    (Nat.choose 3 2 : ℚ) * graphMIS_exact_probability G 3 at h
  norm_num at h
  linarith

/-- The abstract rational inversion is now instantiated by real graph
probabilities, real factorial moments and connected support N₀≤3. -/
theorem connected_graphMIS_four_probability_moment_law
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 0 =
        1 - graphMIS_first_moment G + graphMIS_second_moment G -
          graphMIS_third_moment G ∧
    graphMIS_exact_probability G 1 =
        graphMIS_first_moment G - 2 * graphMIS_second_moment G +
          3 * graphMIS_third_moment G ∧
    graphMIS_exact_probability G 2 =
        graphMIS_second_moment G - 3 * graphMIS_third_moment G ∧
    graphMIS_exact_probability G 3 = graphMIS_third_moment G := by
  apply four_point_moment_inversion
  · exact connected_graphMIS_probability_mass G hc
  · exact connected_graphMIS_probability_first G hc
  · exact connected_graphMIS_probability_second G hc
  · rw [graphMIS_third_moment_eq, connected_graphMIS_exact_probability_three G hc]

/-- The complete, actual four-term probability law for every connected graph
on eight vertices. All parameters are true graph-MIS incidence counts. -/
theorem connected_graphMIS_four_probability_law
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    graphMIS_exact_probability G 0 =
      1 - 2 * ((fourGraphMISFamily G).card : ℚ) / 35 +
        2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability G 1 =
      2 * ((fourGraphMISFamily G).card : ℚ) / 35 -
        4 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 -
        2 * (graphMIS_pairOverlapCount G 2 : ℚ) / 315 +
        3 * (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability G 2 =
      2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 105 ∧
    graphMIS_exact_probability G 3 =
      (unorderedCompatibleTripleCount G : ℚ) / 315 := by
  obtain ⟨h0, h1, h2, h3⟩ :=
    connected_graphMIS_four_probability_moment_law G hc
  simp only [graphMIS_first_moment_eq, graphMIS_second_moment_eq,
    graphMIS_third_moment_eq] at h0 h1 h2 h3
  constructor
  · linarith
  constructor
  · linarith
  constructor
  · linarith
  · exact h3

/-- Unified flagship: all four *actual* label probabilities and the unique
sharp spider extremiser, not merely an abstract moment inversion. -/
theorem connected_graphMIS_complete_flagship
    (G : SimpleGraph Vertex) (hc : G.Connected) :
    (graphMIS_exact_probability G 0 =
      1 - 2 * ((fourGraphMISFamily G).card : ℚ) / 35 +
        2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability G 1 =
      2 * ((fourGraphMISFamily G).card : ℚ) / 35 -
        4 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 -
        2 * (graphMIS_pairOverlapCount G 2 : ℚ) / 315 +
        3 * (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability G 2 =
      2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 105 ∧
    graphMIS_exact_probability G 3 =
      (unorderedCompatibleTripleCount G : ℚ) / 315) ∧
    (graphMIS_exact_probability G 3 ≤ (1 : ℚ) / 105 ∧
      (graphMIS_exact_probability G 3 = (1 : ℚ) / 105 ↔
        Nonempty (G ≃g namedSpider))) := by
  exact ⟨connected_graphMIS_four_probability_law G hc,
    connected_graphMIS_probability_three_sharp G hc⟩

#print axioms PDIC.connected_graphMIS_four_event_histogram
#print axioms PDIC.connected_graphMIS_four_event_expectation
#print axioms PDIC.connected_graphMIS_probability_mass
#print axioms PDIC.connected_graphMIS_probability_first
#print axioms PDIC.connected_graphMIS_probability_second
#print axioms PDIC.connected_graphMIS_four_probability_moment_law
#print axioms PDIC.connected_graphMIS_four_probability_law
#print axioms PDIC.connected_graphMIS_complete_flagship

end PDIC

namespace PDIC

/-! S023: conditional transport of the actual 40320-label sample space from
an arbitrary admissible eight-cap to the canonical typed cap. The only
external geometric classification is the explicit *hypothesis*
\`ClassicalCapNormalForm\`, never an axiom or global instance. -/

/-- Genuine four-element *maximal independent* zero-sum count with a fixed
admissible cap enumeration \`f\` and a uniformly sampled label permutation. -/
public noncomputable def labellingZeroMISCountForCap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (e : Equiv.Perm Vertex) : ℕ :=
  ((fourGraphMISFamily G).filter
    (fun s => capSum (fun v => f (e v)) s = 0)).card

/-- Actual event-fibre probability, with the unchanged denominator 8!=40320. -/
public noncomputable def graphMIS_exact_probability_for_cap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint) (i : ℕ) : ℚ :=
  (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
    (fun e => labellingZeroMISCountForCap G f e = i)).card : ℚ) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- Postcomposing an eight-vertex labelling permutation by a fixed
permutation gives a genuine permutation of the entire sample space. -/
def rightTranslation (p : Equiv.Perm Vertex) :
    Equiv.Perm (Equiv.Perm Vertex) where
  toFun := fun e => e.trans p
  invFun := fun e => e.trans p.symm
  left_inv := by
    intro e
    ext v
    simp [Equiv.trans_apply]
  right_inv := by
    intro e
    ext v
    simp [Equiv.trans_apply]

/-- The true zero-event count for the cap \`L (canonicalCapF3 ∘ p)\`
equals the canonical count after the honest reindexing \`e.trans p\`.
This relies on *zero-fixing* linearity, not an affine translation. -/
theorem labellingZeroMISCountForCap_transport
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (L : CapPoint ≃ₗ[ZMod 3] CapPoint) (p : Equiv.Perm Vertex)
    (hf : ∀ v, f v = L (canonicalCapF3 (p v)))
    (e : Equiv.Perm Vertex) :
    labellingZeroMISCountForCap G f e =
      labellingZeroMISCount G (e.trans p) := by
  classical
  have hz (s : Finset Vertex) :
      capSum (fun v => f (e v)) s = 0 ↔
        capSum (fun v => canonicalCapF3 ((e.trans p) v)) s = 0 := by
    have he :
        (fun v => f (e v)) =
          (fun v => L (canonicalCapF3 ((e.trans p) v))) := by
      funext v
      simpa only [Equiv.trans_apply] using hf (e v)
    rw [he]
    exact capSum_zero_linear_iff L
      (fun v => canonicalCapF3 ((e.trans p) v)) s
  unfold labellingZeroMISCountForCap
  rw [labellingZeroMISCount_eq_family_filter]
  congr 1
  ext s
  simp only [Finset.mem_filter]
  exact and_congr_right (fun _ => hz s)

/-- Any event predicate on label permutations has the same number of
real sample points after the bijective postcomposition \`e ↦ e.trans p\`. -/
theorem rightTranslation_event_fibre_card
    (p : Equiv.Perm Vertex) (P : Equiv.Perm Vertex → Prop)
    [DecidablePred P] :
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e : Equiv.Perm Vertex => P (e.trans p))).card =
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter P).card := by
  classical
  let T := rightTranslation p
  let E : {e : Equiv.Perm Vertex // P (T e)} ≃
      {e : Equiv.Perm Vertex // P e} := {
    toFun := fun e => ⟨T e.1, e.2⟩
    invFun := fun e => ⟨T.symm e.1, by
      simpa only [Equiv.apply_symm_apply] using e.2⟩
    left_inv := by
      intro e
      apply Subtype.ext
      exact T.symm_apply_apply e.1
    right_inv := by
      intro e
      apply Subtype.ext
      exact T.apply_symm_apply e.1
  }
  have hc := Fintype.card_congr E
  simpa [T, rightTranslation, Fintype.card_subtype] using hc

/-- The cardinality of every one of the four genuine zero-MIS event fibres
is identical for \`f\` and the canonical cap, conditional only on the supplied
classical geometric normal form. -/
theorem graphMIS_cap_event_fibre_card
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (hf : IsAdmissibleCap f) (hnf : ClassicalCapNormalForm) (i : ℕ) :
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCountForCap G f e = i)).card =
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = i)).card := by
  classical
  obtain ⟨L, p, hmodel⟩ := hnf f hf
  calc
    ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCountForCap G f e = i)).card =
        ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
          (fun e => labellingZeroMISCount G (e.trans p) = i)).card := by
          congr 1
          ext e
          simp only [Finset.mem_filter]
          rw [labellingZeroMISCountForCap_transport G f L p hmodel e]
    _ = ((Finset.univ : Finset (Equiv.Perm Vertex)).filter
      (fun e => labellingZeroMISCount G e = i)).card :=
        rightTranslation_event_fibre_card p
          (fun e => labellingZeroMISCount G e = i)

/-- For an admissible fixed cap the real finite distribution agrees
*term by term* with the canonical one. This is not an abstract
probability symmetry assertion: the event cardinalities are identical. -/
theorem graphMIS_probability_for_cap_eq_canonical
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (hf : IsAdmissibleCap f) (hnf : ClassicalCapNormalForm)
    (i : ℕ) :
    graphMIS_exact_probability_for_cap G f i =
      graphMIS_exact_probability G i := by
  unfold graphMIS_exact_probability_for_cap graphMIS_exact_probability
  rw [graphMIS_cap_event_fibre_card G f hf hnf i]

/-- Complete connected-graph four-event distribution and uniquely sharp
spider at EVERY admissible fixed eight-cap, conditional explicitly on the
classical nine-cap normal-form proposition. The hypothesis is supplied,
not postulated or proved in this file. -/
theorem connected_graphMIS_complete_flagship_all_caps
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (hnf : ClassicalCapNormalForm) :
    (graphMIS_exact_probability_for_cap G f 0 =
      1 - 2 * ((fourGraphMISFamily G).card : ℚ) / 35 +
        2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability_for_cap G f 1 =
      2 * ((fourGraphMISFamily G).card : ℚ) / 35 -
        4 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 -
        2 * (graphMIS_pairOverlapCount G 2 : ℚ) / 315 +
        3 * (unorderedCompatibleTripleCount G : ℚ) / 315 ∧
    graphMIS_exact_probability_for_cap G f 2 =
      2 * (graphMIS_pairOverlapCount G 0 : ℚ) / 35 +
        (graphMIS_pairOverlapCount G 2 : ℚ) / 315 -
        (unorderedCompatibleTripleCount G : ℚ) / 105 ∧
    graphMIS_exact_probability_for_cap G f 3 =
      (unorderedCompatibleTripleCount G : ℚ) / 315) ∧
    (graphMIS_exact_probability_for_cap G f 3 ≤ (1 : ℚ) / 105 ∧
      (graphMIS_exact_probability_for_cap G f 3 = (1 : ℚ) / 105 ↔
        Nonempty (G ≃g namedSpider))) := by
  simp only [graphMIS_probability_for_cap_eq_canonical G f hf hnf]
  exact connected_graphMIS_complete_flagship G hc

#print axioms PDIC.rightTranslation
#print axioms PDIC.labellingZeroMISCountForCap_transport
#print axioms PDIC.rightTranslation_event_fibre_card
#print axioms PDIC.graphMIS_cap_event_fibre_card
#print axioms PDIC.graphMIS_probability_for_cap_eq_canonical
#print axioms PDIC.connected_graphMIS_complete_flagship_all_caps

end PDIC


namespace PDIC

/-! S024: pointed cap classification preflight. These unconditional
    lemmas hold for every actual admissible eight-cap; no normal-form
    hypothesis is assumed. The reduced finite enumeration still requires
    an internal completeness proof before all-cap flagship closure. -/

/-- An admissible cap cannot include the origin, because a singleton
    zero-sum subset is forbidden. -/
theorem admissibleCap_point_ne_zero
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) (v : Vertex) :
    f v ≠ 0 := by
  intro hz
  have hs := hf.2 ({v} : Finset Vertex) (by simp)
  apply hs
  simp [capSum, hz]

/-- An admissible cap cannot contain an antipodal pair at distinct
    vertex positions. -/
theorem admissibleCap_pair_ne_zero
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (v w : Vertex) (hvw : v ≠ w) :
    f v + f w ≠ 0 := by
  intro hz
  have hs := hf.2 ({v, w} : Finset Vertex) (by simp [hvw])
  apply hs
  simpa [capSum, hvw] using hz

/-- The standard basis of the pointed ternary space. -/
def s024BasisPoint (i : Fin 3) : CapPoint :=
  fun j => if i = j then 1 else 0

/-- Exclusions forced by origin-freeness and the short zero-sum tests:
    zero, the three basis points, their antipodes, and three negatives
    of sums of different basis points. -/
def s024ExcludedPoints : Finset CapPoint :=
  ({0} : Finset CapPoint) ∪
  ((Finset.univ : Finset (Fin 3)).image s024BasisPoint) ∪
  ((Finset.univ : Finset (Fin 3)).image (fun i => -s024BasisPoint i)) ∪
  (((Finset.univ : Finset (Fin 3)).powersetCard 2).image
    (fun t => -(∑ i ∈ t, s024BasisPoint i)))

def s024FreePoints : Finset CapPoint :=
  (Finset.univ : Finset CapPoint) \ s024ExcludedPoints

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
/-- A kernel-checked reduction: after pinning three basis points,
    precisely seventeen ambient candidates remain for the other five. -/
theorem s024FreePoints_card : s024FreePoints.card = 17 := by
  decide +kernel

#print axioms PDIC.admissibleCap_point_ne_zero
#print axioms PDIC.admissibleCap_pair_ne_zero
#print axioms PDIC.s024FreePoints_card

end PDIC
