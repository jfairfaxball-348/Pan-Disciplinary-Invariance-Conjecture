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

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
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
def GraphMIS {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
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
def IsUnorderedCompatibleTriple (G : SimpleGraph Vertex)
    (T : Finset (Finset Vertex)) : Prop :=
  T.card = 3 ∧
  (∀ r ∈ T, r.card = 4 ∧ GraphMIS G r) ∧
  ∃ s ∈ T, ∃ t ∈ T, ∃ r ∈ T,
    s ≠ t ∧ s ≠ r ∧ t ≠ r ∧
      t = Finset.univ \ s ∧
      (r ∩ s).card = 2 ∧ (r ∩ t).card = 2

/-- The cardinality counts unordered triples, not ordered witnesses. -/
noncomputable def unorderedCompatibleTripleCount
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


/-! S008: the genuine unordered-three-set cardinality bridge. -/
namespace PDIC

/-- The unordered triple determined by a fixed complementary pair and a
genuine 2+2 third set. -/
def tripleOfThird (s r : Finset Vertex) : Finset (Finset Vertex) :=
  {s, Finset.univ \ s, r}

private theorem anchoredThird_ne_sides
    (G : SimpleGraph Vertex) (s r : Finset Vertex)
    (hs : FourMISPartition G s)
    (hr : IsAnchoredMixedThird G s r) :
    r ≠ s ∧ r ≠ Finset.univ \ s := by
  constructor
  · intro he
    have hh : (r ∩ s).card = 4 := by
      rw [he, Finset.inter_self]
      exact hs.1
    omega
  · intro he
    have hh : (r ∩ s).card = 0 := by
      simp [he]
    omega

private theorem partition_ne_complement
    (G : SimpleGraph Vertex) (s : Finset Vertex)
    (hs : FourMISPartition G s) : s ≠ Finset.univ \ s := by
  intro he
  have hh : (s ∩ (Finset.univ \ s)).card = 4 := by
    rw [← he, Finset.inter_self]
    exact hs.1
  have hz : (s ∩ (Finset.univ \ s)).card = 0 := by simp
  omega

private theorem anchoredThird_card_four
    (G : SimpleGraph Vertex) (s r : Finset Vertex)
    (hr : IsAnchoredMixedThird G s r) : r.card = 4 := by
  have hh := Finset.card_inter_add_card_sdiff r s
  have he : r \ s = r ∩ (Finset.univ \ s) := by
    ext v
    simp
  rw [he] at hh
  omega

private theorem complementary_four_card
    (G : SimpleGraph Vertex) (s : Finset Vertex)
    (hs : FourMISPartition G s) :
    (Finset.univ \ s).card = 4 := by
  have hh : (Finset.univ \ s).card + s.card = 8 := by
    simpa using (Finset.card_sdiff_add_card_eq_card (Finset.subset_univ s))
  omega

theorem tripleOfThird_card
    (G : SimpleGraph Vertex) (s r : Finset Vertex)
    (hs : FourMISPartition G s)
    (hr : IsAnchoredMixedThird G s r) :
    (tripleOfThird s r).card = 3 := by
  have hn := anchoredThird_ne_sides G s r hs hr
  have hc := partition_ne_complement G s hs
  have h1 : s ∉ ({Finset.univ \ s, r} : Finset (Finset Vertex)) := by
    simp [hc, Ne.symm hn.1]
  have h2 : (Finset.univ \ s) ∉ ({r} : Finset (Finset Vertex)) := by
    simpa using (Ne.symm hn.2)
  simp [tripleOfThird, h1, h2]

/-- The reverse implication omitted from S007: every anchored mixed third
is a genuine unordered compatible triple. Skew 3+1 sets do not qualify. -/
theorem tripleOfThird_compatible
    (G : SimpleGraph Vertex) (s r : Finset Vertex)
    (hs : FourMISPartition G s)
    (hr : IsAnchoredMixedThird G s r) :
    IsUnorderedCompatibleTriple G (tripleOfThird s r) := by
  have hn := anchoredThird_ne_sides G s r hs hr
  have hc := partition_ne_complement G s hs
  refine ⟨tripleOfThird_card G s r hs hr, ?_,
    s, by simp [tripleOfThird],
    Finset.univ \ s, by simp [tripleOfThird],
    r, by simp [tripleOfThird],
    hc, Ne.symm hn.1, Ne.symm hn.2, rfl, hr.2.1, hr.2.2⟩
  intro q hq
  simp only [tripleOfThird, Finset.mem_insert, Finset.mem_singleton] at hq
  rcases hq with rfl | rfl | rfl
  · exact ⟨hs.1, hs.2.1⟩
  · exact ⟨complementary_four_card G s hs, hs.2.2⟩
  · exact ⟨anchoredThird_card_four G s r hr, hr.1⟩

/-- Every actual unordered compatible triple is exactly the set constructed
from its anchored 2+2 third element; the complementary pair is forced by
connectedness rather than assumed in the definition of h. -/
theorem compatibleTriple_eq_tripleOfThird
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (s : Finset Vertex) (hs : FourMISPartition G s)
    (T : Finset (Finset Vertex)) (hT : IsUnorderedCompatibleTriple G T)
    (r : Finset Vertex) (hrt : r ∈ T)
    (hr : IsAnchoredMixedThird G s r) :
    T = tripleOfThird s r := by
  have hsT : s ∈ T ∧ (Finset.univ \ s) ∈ T := by
    rcases hT with ⟨_, hall, a, ha, b, hb, q, hq, _, _, _, hab, _, _⟩
    have hp : FourMISPartition G a := by
      refine ⟨(hall a ha).1, (hall a ha).2, ?_⟩
      simpa only [← hab] using (hall b hb).2
    rcases fourMISPartition_unique_up_to_swap G hc a s hp hs with he | he
    · subst a
      refine ⟨ha, ?_⟩
      simpa only [hab] using hb
    · constructor
      · have hbs : b = s := by
          rw [hab, he]
          simp
        simpa only [hbs] using hb
      · simpa only [he] using ha
  have hsub : tripleOfThird s r ⊆ T := by
    intro q hq
    simp only [tripleOfThird, Finset.mem_insert, Finset.mem_singleton] at hq
    rcases hq with rfl | rfl | rfl
    · exact hsT.1
    · exact hsT.2
    · exact hrt
  have heq : tripleOfThird s r = T :=
    Finset.eq_of_subset_of_card_le hsub (by
      rw [hT.1, tripleOfThird_card G s r hs hr])
  exact heq.symm

/-- Two admissible third sets cannot determine the same unordered triple. -/
theorem tripleOfThird_injective_on_mixed
    (G : SimpleGraph Vertex) (s : Finset Vertex)
    (hs : FourMISPartition G s)
    (r t : Finset Vertex)
    (hr : IsAnchoredMixedThird G s r)
    (ht : IsAnchoredMixedThird G s t)
    (he : tripleOfThird s r = tripleOfThird s t) : r = t := by
  have hm : r ∈ tripleOfThird s t := by
    rw [← he]
    simp [tripleOfThird]
  simp only [tripleOfThird, Finset.mem_insert, Finset.mem_singleton] at hm
  rcases hm with heq | heq | heq
  · exact False.elim ((anchoredThird_ne_sides G s r hs hr).1 heq)
  · exact False.elim ((anchoredThird_ne_sides G s r hs hr).2 heq)
  · exact heq

#print axioms PDIC.tripleOfThird_card
#print axioms PDIC.tripleOfThird_compatible
#print axioms PDIC.compatibleTriple_eq_tripleOfThird
#print axioms PDIC.tripleOfThird_injective_on_mixed

end PDIC
