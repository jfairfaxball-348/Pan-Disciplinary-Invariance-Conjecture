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

/- S003R4: a COMPUTABLE finite count of genuine mixed-MIS witnesses.
   This is defined through the criterion, not through a substitute
   matrix census. The Boolean decision is propositionally exact. -/
def computableMixedLeftPairCount (adj : Side → Side → Bool) : ℕ :=
  ((Finset.univ : Finset (Finset Side)).filter
    (fun X => decide (mixedPairCriterion adj X))).card

theorem computableMixedLeftPairCount_eq_actual
    (adj : Side → Side → Bool) :
    computableMixedLeftPairCount adj = actualMixedLeftPairCount adj := by
  classical
  unfold computableMixedLeftPairCount actualMixedLeftPairCount
  apply congrArg Finset.card
  ext X
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, decide_eq_true_eq]
  exact (exists_mixed_iff_criterion adj X).symm

#print axioms PDIC.computableMixedLeftPairCount_eq_actual

end PDIC
