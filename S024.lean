import PDIC

namespace PDIC

/-!
S024 internal classification bridge.

A theorem about *unordered image sets* suffices to derive the precise
labelled normal form used by S023. The remaining image-orbit classification
is not postulated here. All statements in this file are implications or
equivalences, with explicit hypotheses.
-/

/-- The still-to-be-certified finite orbit claim, stated in the smaller
unordered language: the eight-point image of every admissible cap is
in the zero-fixing GL(3,3) orbit of the canonical cap image. -/
def AdmissibleCapImageOrbit : Prop :=
  ∀ f : Vertex → CapPoint, IsAdmissibleCap f →
    ∃ L : CapPoint ≃ₗ[ZMod 3] CapPoint,
      Set.range f = Set.range (fun v : Vertex => L (canonicalCapF3 v))

/-- Point exclusion follows from the *actual* one-term condition in
IsAdmissibleCap; this is not an independent hypothesis. -/
theorem admissibleCap_ne_zero
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (v : Vertex) : f v ≠ 0 := by
  have h := hf.2 ({v} : Finset Vertex) (by simp)
  simpa [capSum] using h

/-- Crucial labelled bridge: a linear equivalence matching just the
unordered image sets induces a genuine permutation of all eight vertices.
Injectivity of the cap enumeration gives uniqueness of the matching,
and finiteness upgrades its injection to a bijection. -/
theorem classicalCapNormalForm_of_image_orbit
    (horbit : AdmissibleCapImageOrbit) : ClassicalCapNormalForm := by
  intro f hf
  obtain ⟨L, hrange⟩ := horbit f hf
  have hex (v : Vertex) :
      ∃ w : Vertex, f v = L (canonicalCapF3 w) := by
    have hm : f v ∈ Set.range f := ⟨v, rfl⟩
    rw [hrange] at hm
    obtain ⟨w, hw⟩ := hm
    exact ⟨w, hw.symm⟩
  choose p hp using hex
  have hp_inj : Function.Injective p := by
    intro a b hab
    apply hf.1
    calc
      f a = L (canonicalCapF3 (p a)) := hp a
      _ = L (canonicalCapF3 (p b)) :=
        congrArg (fun w : Vertex => L (canonicalCapF3 w)) hab
      _ = f b := (hp b).symm
  let e : Equiv.Perm Vertex :=
    Equiv.ofBijective p (Finite.injective_iff_bijective.mp hp_inj)
  refine ⟨L, e, ?_⟩
  intro v
  exact hp v

/-- The two geometrical normal forms are logically equivalent, but the
finite orbit claim is *not* discharged by this equivalence proof. -/
theorem classicalCapNormalForm_iff_image_orbit :
    ClassicalCapNormalForm ↔ AdmissibleCapImageOrbit := by
  constructor
  · intro hn f hf
    obtain ⟨L, p, hp⟩ := hn f hf
    refine ⟨L, Set.ext ?_⟩
    intro x
    constructor
    · rintro ⟨v, rfl⟩
      exact ⟨p v, (hp v).symm⟩
    · rintro ⟨v, rfl⟩
      refine ⟨p.symm v, ?_⟩
      simpa using (hp (p.symm v))
  · exact classicalCapNormalForm_of_image_orbit

/-- Under the precise *unproved* image-orbit classification, all
40320 real labellings have the canonical fibre cardinalities. This
isolates the only missing geometry from the S023 probability proof. -/
theorem graphMIS_probability_for_cap_of_image_orbit
    (horbit : AdmissibleCapImageOrbit)
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (hf : IsAdmissibleCap f) (i : ℕ) :
    graphMIS_exact_probability_for_cap G f i =
      graphMIS_exact_probability G i :=
  graphMIS_probability_for_cap_eq_canonical
    G f hf (classicalCapNormalForm_of_image_orbit horbit) i

#print axioms PDIC.admissibleCap_ne_zero
#print axioms PDIC.classicalCapNormalForm_of_image_orbit
#print axioms PDIC.classicalCapNormalForm_iff_image_orbit
#print axioms PDIC.graphMIS_probability_for_cap_of_image_orbit

end PDIC


namespace PDIC

/-!
S024 extension: genuine normalized-cap exclusions.  These are universal
logical consequences of the short zero-sum conditions, not extra numerical
assumptions or an assertion of the still-open orbit theorem.
-/

/-- No triple of distinct cap labels can sum to zero. -/
theorem admissibleCap_three_ne_zero
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (u v w : Vertex) (huv : u ≠ v) (huw : u ≠ w) (hvw : v ≠ w) :
    f u + f v + f w ≠ 0 := by
  have hs : capSum f ({u, v, w} : Finset Vertex) ≠ 0 :=
    hf.2 _ (Or.inr (Or.inr (by simp [huv, huw, hvw, ne_comm])))
  simpa [capSum, huv, huw, hvw, ne_comm,
    add_assoc, add_comm, add_left_comm] using hs

/-- Given three genuinely placed standard basis labels, every OTHER label
is in the explicitly kernel-counted seventeen-point free set. -/
theorem s024_normalized_other_mem_free
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (a : Fin 3 → Vertex) (ha : Function.Injective a)
    (hanchor : ∀ i, f (a i) = s024BasisPoint i)
    (v : Vertex) (hv : ∀ i, v ≠ a i) :
    f v ∈ s024FreePoints := by
  classical
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro he
  unfold s024ExcludedPoints at he
  rcases Finset.mem_union.mp he with hfirst | hpair
  · rcases Finset.mem_union.mp hfirst with hfirst | hneg
    · rcases Finset.mem_union.mp hfirst with hzero | hbase
      · have heq : f v = 0 := by simpa using hzero
        exact (admissibleCap_point_ne_zero f hf v) heq
      · obtain ⟨i, _, hi⟩ := Finset.mem_image.mp hbase
        have heq : f v = f (a i) := by rw [hanchor i]; exact hi.symm
        exact hv i (hf.1 heq)
    · obtain ⟨i, _, hi⟩ := Finset.mem_image.mp hneg
      have hz : f v + f (a i) = 0 := by
        calc
          f v + f (a i) = -s024BasisPoint i + s024BasisPoint i := by
            rw [← hi, hanchor i]
          _ = 0 := neg_add_cancel _
      exact (admissibleCap_pair_ne_zero f hf v (a i) (hv i)) hz
  · obtain ⟨t, ht, hi⟩ := Finset.mem_image.mp hpair
    obtain ⟨i, j, hij, rfl⟩ :=
      Finset.card_eq_two.mp (Finset.mem_powersetCard.mp ht).2
    have hab : a i ≠ a j := ha.ne hij
    have hvi : v ≠ a i := hv i
    have hvj : v ≠ a j := hv j
    have hval : f v = -(s024BasisPoint i + s024BasisPoint j) := by
      simpa [hij] using hi.symm
    have hzero : f v + f (a i) + f (a j) = 0 := by
      rw [hval, hanchor i, hanchor j]
      abel
    exact (admissibleCap_three_ne_zero f hf v (a i) (a j)
      hvi hvj hab) hzero

#print axioms PDIC.admissibleCap_three_ne_zero
#print axioms PDIC.s024_normalized_other_mem_free

end PDIC


namespace PDIC

/-! S024 extension: the exact 6188-candidate domain, under a genuinely
normalized independent triple. The universal existence of a normalizing
triple and exhaustive 18-case orbit certificate remain separate obligations. -/

/-- The five vertices outside the three distinct basis-anchor positions. -/
def s024RemainingVertices (a : Fin 3 → Vertex) : Finset Vertex :=
  (Finset.univ : Finset Vertex).filter (fun v => ∀ i, v ≠ a i)

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
theorem s024RemainingVertices_card :
    ∀ a : Fin 3 → Vertex, Function.Injective a →
      (s024RemainingVertices a).card = 5 := by
  decide +kernel

/-- The actual five non-basis cap points, retaining the vertex-to-point
injection rather than assuming a choice of five ambient vectors. -/
noncomputable def s024RemainingCapPoints
    (f : Vertex → CapPoint) (a : Fin 3 → Vertex) : Finset CapPoint := by
  classical
  exact (s024RemainingVertices a).image f

/-- Every normalized admissible cap contributes one of the genuine
five-element subsets of the seventeen allowable ambient points.
This reduces the later universal classification to precisely the
\`s024FreePoints.powersetCard 5\` domain; it does not assume all
such subsets are caps or classify the resulting eighteen caps. -/
theorem s024RemainingCapPoints_in_five_subsets
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (a : Fin 3 → Vertex) (ha : Function.Injective a)
    (hanchor : ∀ i, f (a i) = s024BasisPoint i) :
    s024RemainingCapPoints f a ∈ s024FreePoints.powersetCard 5 := by
  classical
  change (s024RemainingVertices a).image f ∈
    s024FreePoints.powersetCard 5
  apply Finset.mem_powersetCard.mpr
  constructor
  · intro x hx
    obtain ⟨v, hv, rfl⟩ := Finset.mem_image.mp hx
    apply s024_normalized_other_mem_free f hf a ha hanchor v
    exact (Finset.mem_filter.mp hv).2
  · rw [Finset.card_image_of_injective _ hf.1]
    exact s024RemainingVertices_card a ha

#print axioms PDIC.s024RemainingVertices_card
#print axioms PDIC.s024RemainingCapPoints_in_five_subsets

end PDIC


namespace PDIC

/-! S024 continuation: exact normalized full-image finite domain.  This
does not assume that an arbitrary cap already admits normalizing anchors. -/

/-- There are exactly 6,188 possible five-point residual subsets in the
17-point ambient domain. The 18 admissible cases still require separate
Lean classification; 6,188 counts *candidates*, not caps. -/
theorem s024RemainingCandidateFamily_card :
    (s024FreePoints.powersetCard 5).card = 6188 := by
  rw [Finset.card_powersetCard, s024FreePoints_card]
  decide

/-- The three pinned basis points as a finite unordered set. -/
def s024BasisSet : Finset CapPoint :=
  (Finset.univ : Finset (Fin 3)).image s024BasisPoint

/-- Every candidate full eight-point image must be a three-basis union
with a five-point subset from the reduced 17-point family. -/
def s024NormalizedFullCandidates : Finset (Finset CapPoint) :=
  (s024FreePoints.powersetCard 5).image
    (fun T => s024BasisSet ∪ T)

/-- Every genuinely admissible cap whose three actual anchor vertices
carry the pinned basis has its entire unordered image represented by one
of the 6,188 full-image candidates. No orbit equivalence is assumed. -/
theorem s024_normalized_cap_image_in_candidates
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (a : Fin 3 → Vertex) (ha : Function.Injective a)
    (hanchor : ∀ i, f (a i) = s024BasisPoint i) :
    ((Finset.univ : Finset Vertex).image f) ∈
      s024NormalizedFullCandidates := by
  classical
  let T := s024RemainingCapPoints f a
  have hT : T ∈ s024FreePoints.powersetCard 5 :=
    s024RemainingCapPoints_in_five_subsets f hf a ha hanchor
  apply Finset.mem_image.mpr
  refine ⟨T, hT, ?_⟩
  symm
  ext x
  simp only [Finset.mem_image, Finset.mem_univ, true_and,
    Finset.mem_union, s024BasisSet, T, s024RemainingCapPoints,
    s024RemainingVertices, Finset.mem_filter]
  constructor
  · rintro ⟨v, hv⟩
    by_cases h : ∃ i : Fin 3, v = a i
    · rcases h with ⟨i, rfl⟩
      exact Or.inl ⟨i, (hanchor i).symm.trans hv⟩
    · apply Or.inr
      refine ⟨v, ?_, hv⟩
      intro i
      exact fun hi => h ⟨i, hi⟩
  · rintro (⟨i, hi⟩ | ⟨v, _hv, hi⟩)
    · exact ⟨a i, (hanchor i).trans hi⟩
    · exact ⟨v, hi⟩

#print axioms PDIC.s024RemainingCandidateFamily_card
#print axioms PDIC.s024_normalized_cap_image_in_candidates

end PDIC


namespace PDIC

/-! S024 continuation: intrinsic basis-existence obstruction, without
assuming a normal-form map or examining all labelled cap functions. -/

/-- Orient each nonzero ternary direction by making its first nonzero
coordinate equal to 1. Zero is fixed. -/
def s024ProjectiveOrient (p : CapPoint) : CapPoint :=
  if p 0 = (2 : ZMod 3) ∨
      (p 0 = 0 ∧ p 1 = (2 : ZMod 3)) ∨
      (p 0 = 0 ∧ p 1 = 0 ∧ p 2 = (2 : ZMod 3))
  then -p else p

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
/-- Two points have the same canonical direction precisely up to sign.
This is a finite property of the actual 27-element ternary vector space. -/
theorem s024ProjectiveOrient_eq_cases :
    ∀ p q : CapPoint,
      s024ProjectiveOrient p = s024ProjectiveOrient q →
        p = q ∨ p = -q := by
  decide +kernel

/-- Nine or fewer vectors in the subspace spanned by two vectors. -/
def s024TwoSpan (p q : CapPoint) : Finset CapPoint :=
  (Finset.univ : Finset (ZMod 3 × ZMod 3)).image
    (fun ab => ab.1 • p + ab.2 • q)

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
/-- Every ternary linear plane has at most four nonzero projective
directions. Unlike external scripts, this is a kernel-computed 27×27
finite geometry certificate. -/
theorem s024TwoSpan_projective_le_four :
    ∀ p q : CapPoint,
      (((s024TwoSpan p q).filter (fun x => x ≠ 0)).image
        s024ProjectiveOrient).card ≤ 4 := by
  decide +kernel

/-- A genuine admissible eight-cap always has some point outside the
linear span of any TWO selected cap labels: eight injective, nonzero,
pairwise nonantipodal points cannot fit in four projective directions. -/
theorem s024_admissible_point_outside_two_span
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (u v : Vertex) :
    ∃ w : Vertex, f w ∉ s024TwoSpan (f u) (f v) := by
  classical
  by_contra hnone
  have hall (w : Vertex) : f w ∈ s024TwoSpan (f u) (f v) := by
    by_contra hw
    exact hnone ⟨w, hw⟩
  have hinj : Function.Injective
      (fun w : Vertex => s024ProjectiveOrient (f w)) := by
    intro a b hab
    rcases s024ProjectiveOrient_eq_cases (f a) (f b) hab with heq | hneg
    · exact hf.1 heq
    · by_contra hne
      have hzero : f a + f b = 0 := by
        rw [hneg]
        exact neg_add_cancel _
      exact (admissibleCap_pair_ne_zero f hf a b hne) hzero
  have hsub :
      ((Finset.univ : Finset Vertex).image
        (fun w => s024ProjectiveOrient (f w))) ⊆
      (((s024TwoSpan (f u) (f v)).filter (fun x => x ≠ 0)).image
        s024ProjectiveOrient) := by
    intro x hx
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.mp hx
    apply Finset.mem_image.mpr
    refine ⟨f w, ?_, rfl⟩
    exact Finset.mem_filter.mpr
      ⟨hall w, admissibleCap_point_ne_zero f hf w⟩
  have hc :
      ((Finset.univ : Finset Vertex).image
        (fun w => s024ProjectiveOrient (f w))).card = 8 := by
    rw [Finset.card_image_of_injective _ hinj]
    decide
  have hle := Finset.card_le_card hsub
  have hfour := s024TwoSpan_projective_le_four (f u) (f v)
  omega

#print axioms PDIC.s024ProjectiveOrient_eq_cases
#print axioms PDIC.s024TwoSpan_projective_le_four
#print axioms PDIC.s024_admissible_point_outside_two_span

end PDIC


namespace PDIC

/-! S025: genuine independent-triple witness from actual cap exclusions.
The next task is to construct the typed zero-fixing linear equivalence from
this witness, then certify the eighteen normalized orbit cases. -/

set_option maxRecDepth 16384 in
set_option maxHeartbeats 2000000 in
/-- The span of a repeated vector has only zero and its two signs,
including the degenerate zero-vector case. The assertion is finite and
checked by the Lean kernel over the actual ternary coordinate type. -/
theorem s025_span_self_cases :
    ∀ p q : CapPoint, q ∈ s024TwoSpan p p →
      q = 0 ∨ q = p ∨ q = -p := by
  decide +kernel

/-- Two actual distinct cap labels cannot lie on the same ternary
projective direction. This establishes the first two independent anchors
without an assumed cap normal form. -/
theorem s025_cap01_not_in_self_span
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    f 1 ∉ s024TwoSpan (f 0) (f 0) := by
  intro hs
  rcases s025_span_self_cases (f 0) (f 1) hs with hzero | hsame | hneg
  · exact admissibleCap_point_ne_zero f hf 1 hzero
  · have h : (1 : Vertex) = 0 := hf.1 hsame
    exact (by decide : (1 : Vertex) ≠ 0) h
  · have hsum : f 0 + f 1 = 0 := by
      rw [hneg]
      exact add_neg_cancel _
    exact admissibleCap_pair_ne_zero f hf 0 1 (by decide) hsum

/-- Every genuine eight-cap has an ordered triple of actual labelled points:
the second is outside the first one's line and the third is outside their
plane. These hypotheses are sufficient for coordinate basis normalization,
which is the next S025 construction. -/
theorem s025_admissible_three_anchor_witness
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    ∃ w : Vertex,
      f 1 ∉ s024TwoSpan (f 0) (f 0) ∧
      f w ∉ s024TwoSpan (f 0) (f 1) := by
  obtain ⟨w, hw⟩ :=
    s024_admissible_point_outside_two_span f hf 0 1
  exact ⟨w, s025_cap01_not_in_self_span f hf, hw⟩

#print axioms PDIC.s025_span_self_cases
#print axioms PDIC.s025_cap01_not_in_self_span
#print axioms PDIC.s025_admissible_three_anchor_witness

end PDIC



/-! Remaining S025 matrix and finite-table proof candidates are preserved
in scratch/S025_FULL_UNVERIFIED_SOURCE.lean until separate kernel checks. -/


namespace PDIC

/-! S026: isolate the column-action bridge from the costly determinant
certificate. This is a typed statement about the actual ternary vectors,
not an external basis-normal-form assumption. -/

/-- The selected cap points as the three columns of a genuine 3 × 3
matrix, prior to certifying its nonsingularity. -/
def s025ColumnMatrix (p q r : CapPoint) :
    Matrix (Fin 3) (Fin 3) (ZMod 3) :=
  fun i j => if j = 0 then p i else if j = 1 then q i else r i

/-- A column matrix sends each pinned standard basis vector to the
corresponding actual column. This is the action missing from S025. -/
theorem s026_columnMatrix_basis_action (p q r : CapPoint) (i : Fin 3) :
    (s025ColumnMatrix p q r).mulVec (s024BasisPoint i) =
      (if i = 0 then p else if i = 1 then q else r) := by
  have hsingle : s024BasisPoint i = Pi.single i (1 : ZMod 3) := by
    funext j
    simp [s024BasisPoint, Pi.single_apply, eq_comm]
  rw [hsingle, Matrix.mulVec_single_one]
  fin_cases i <;> ext j <;> simp [s025ColumnMatrix, Matrix.col]

#print axioms PDIC.s026_columnMatrix_basis_action

end PDIC

namespace PDIC

/-! S026: bounded kernel certificate for genuine cap determinant and the
actual typed GL(3,3) basis map, promoted from the dedicated CI branch. -/

set_option maxRecDepth 16384 in
set_option maxHeartbeats 10000000 in
/-- An ordered triple comprising a nonzero point, a point outside its
projective line and a third point outside their plane has an invertible
column matrix. The finite determinant obstruction is kernel checked. -/
theorem s025_column_det_nonzero :
    ∀ p q r : CapPoint, p ≠ 0 →
      q ∉ s024TwoSpan p p →
      r ∉ s024TwoSpan p q →
      (s025ColumnMatrix p q r).det ≠ 0 := by
  intro p
  fin_cases p <;> decide +kernel

/-- For every admissible cap a genuine third vertex provides an actual
zero-fixing linear equivalence. It is constructed from the three selected
cap columns, rather than supplied as a normal-form assumption. -/
noncomputable def s025CapBasisEquiv
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (w : Vertex) (hw : f w ∉ s024TwoSpan (f 0) (f 1)) :
    CapPoint ≃ₗ[ZMod 3] CapPoint := by
  let M : Matrix (Fin 3) (Fin 3) (ZMod 3) :=
    s025ColumnMatrix (f 0) (f 1) (f w)
  have hdet : M.det ≠ 0 :=
    s025_column_det_nonzero (f 0) (f 1) (f w)
      (admissibleCap_point_ne_zero f hf 0)
      (s025_cap01_not_in_self_span f hf) hw
  have hunit : IsUnit M.det := isUnit_iff_ne_zero.mpr hdet
  letI : Invertible M := Matrix.invertibleOfIsUnitDet M hunit
  exact M.toLinearEquiv' inferInstance

/-- A normalizing linear equivalence exists for every admissible cap,
with columns explicitly taken from genuine labels 0, 1 and w. This closes
the basis-existence part of the orbit gate but not the finite 18-case orbit
classification. -/
theorem s025_admissible_has_linear_basis_map
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    ∃ w : Vertex, ∃ L : CapPoint ≃ₗ[ZMod 3] CapPoint,
      f w ∉ s024TwoSpan (f 0) (f 1) := by
  obtain ⟨w, _, hw⟩ := s025_admissible_three_anchor_witness f hf
  exact ⟨w, s025CapBasisEquiv f hf w hw, hw⟩

#print axioms PDIC.s025_column_det_nonzero
#print axioms PDIC.s025CapBasisEquiv
#print axioms PDIC.s025_admissible_has_linear_basis_map


end PDIC

namespace PDIC

/-! S026: expose the typed GL basis-map action, not just its existence. -/

/-- The actual typed linear equivalence sends each standard basis point
to the corresponding chosen admissible-cap column. -/
theorem s026_capBasisEquiv_basis_action
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (w : Vertex) (hw : f w ∉ s024TwoSpan (f 0) (f 1))
    (i : Fin 3) :
    s025CapBasisEquiv f hf w hw (s024BasisPoint i) =
      (if i = 0 then f 0 else if i = 1 then f 1 else f w) := by
  unfold s025CapBasisEquiv
  simp only [Matrix.toLinearEquiv'_apply, Matrix.toLin'_apply]
  exact s026_columnMatrix_basis_action (f 0) (f 1) (f w) i

#print axioms PDIC.s026_capBasisEquiv_basis_action

end PDIC


namespace PDIC

/-! S026: the inverse typed equivalence normalises genuine cap anchors,
not an abstract change of coordinates. -/

theorem s026_capBasisEquiv_inverse_basis_action
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (w : Vertex) (hw : f w ∉ s024TwoSpan (f 0) (f 1))
    (i : Fin 3) :
    (s025CapBasisEquiv f hf w hw).symm
      (if i = 0 then f 0 else if i = 1 then f 1 else f w) =
      s024BasisPoint i := by
  rw [← s026_capBasisEquiv_basis_action f hf w hw i]
  simp

/-- The third selected label really is distinct from the first two. -/
theorem s026_basis_third_ne_zero_one
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (w : Vertex) (hw : f w ∉ s024TwoSpan (f 0) (f 1)) :
    w ≠ 0 ∧ w ≠ 1 := by
  have hmem0 : f 0 ∈ s024TwoSpan (f 0) (f 1) := by
    apply Finset.mem_image.mpr
    refine ⟨(1, 0), Finset.mem_univ _, ?_⟩
    simp
  have hmem1 : f 1 ∈ s024TwoSpan (f 0) (f 1) := by
    apply Finset.mem_image.mpr
    refine ⟨(0, 1), Finset.mem_univ _, ?_⟩
    simp
  constructor
  · intro h
    exact hw (by simpa [h] using hmem0)
  · intro h
    exact hw (by simpa [h] using hmem1)

/-- Every genuine admissible eight-cap admits genuine injective anchor
vertices and a normalised admissible cap; this still does not assume orbit
classification, and it uses only the inverse of the explicitly constructed
zero-fixing typed basis equivalence. -/
theorem s026_admissible_normalized_anchors
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    ∃ L : CapPoint ≃ₗ[ZMod 3] CapPoint,
      IsAdmissibleCap (fun v => L (f v)) ∧
      ∃ a : Fin 3 → Vertex, Function.Injective a ∧
        ∀ i, L (f (a i)) = s024BasisPoint i := by
  obtain ⟨w, _, hw⟩ := s025_admissible_three_anchor_witness f hf
  let L := (s025CapBasisEquiv f hf w hw).symm
  refine ⟨L, admissible_under_linear L f hf, ?_⟩
  let a : Fin 3 → Vertex :=
    fun i => if i = 0 then 0 else if i = 1 then 1 else w
  have hne := s026_basis_third_ne_zero_one f hf w hw
  have ha : Function.Injective a := by
    intro i j hij
    fin_cases i <;> fin_cases j <;>
      simp [a, hne.1, hne.2] at hij ⊢
    · exact hne.1 hij.symm
    · exact hne.2 hij.symm
  refine ⟨a, ha, ?_⟩
  intro i
  change (s025CapBasisEquiv f hf w hw).symm
    (f (if i = 0 then 0 else if i = 1 then 1 else w)) =
      s024BasisPoint i
  rw [apply_ite f, apply_ite f]
  exact s026_capBasisEquiv_inverse_basis_action f hf w hw i

#print axioms PDIC.s026_capBasisEquiv_inverse_basis_action
#print axioms PDIC.s026_basis_third_ne_zero_one
#print axioms PDIC.s026_admissible_normalized_anchors

end PDIC


namespace PDIC

/-! S027 independent strict certification of concrete zero-fixing matrix
witnesses for the eighteen normalized cap images. The costly exhaustion
claim is deliberately excluded from this isolated kernel check. -/

def s025NormalizedTails : Finset (Finset CapPoint) :=
  {
    {![1, 1, 2], ![1, 0, 1], ![1, 2, 2], ![2, 1, 2], ![0, 1, 1]},
    {![2, 0, 1], ![2, 1, 2], ![2, 2, 2], ![0, 1, 2], ![2, 1, 1]},
    {![1, 2, 2], ![0, 2, 1], ![2, 2, 2], ![1, 2, 1], ![1, 0, 2]},
    {![1, 2, 1], ![1, 1, 0], ![1, 2, 2], ![2, 2, 1], ![0, 1, 1]},
    {![2, 1, 1], ![1, 1, 0], ![2, 1, 2], ![1, 0, 1], ![2, 2, 1]},
    {![1, 2, 2], ![2, 1, 2], ![1, 1, 0], ![0, 1, 2], ![1, 0, 2]},
    {![1, 1, 1], ![2, 0, 1], ![1, 1, 0], ![0, 1, 2], ![1, 2, 1]},
    {![0, 2, 1], ![1, 1, 1], ![1, 1, 0], ![1, 0, 2], ![2, 1, 1]},
    {![2, 1, 0], ![2, 2, 1], ![2, 2, 2], ![0, 2, 1], ![2, 1, 1]},
    {![1, 1, 1], ![2, 1, 0], ![1, 1, 2], ![1, 0, 1], ![0, 2, 1]},
    {![2, 2, 2], ![2, 1, 0], ![1, 1, 2], ![2, 1, 2], ![1, 0, 2]},
    {![0, 1, 1], ![2, 1, 0], ![2, 0, 1], ![2, 1, 2], ![2, 2, 1]},
    {![1, 2, 1], ![2, 1, 0], ![0, 1, 1], ![1, 0, 2], ![1, 1, 1]},
    {![1, 2, 2], ![0, 1, 2], ![2, 2, 2], ![1, 1, 2], ![1, 2, 0]},
    {![1, 2, 2], ![2, 2, 1], ![1, 0, 1], ![0, 2, 1], ![1, 2, 0]},
    {![0, 1, 2], ![1, 1, 1], ![2, 1, 1], ![1, 0, 1], ![1, 2, 0]},
    {![2, 2, 2], ![2, 0, 1], ![1, 2, 1], ![2, 2, 1], ![1, 2, 0]},
    {![1, 1, 2], ![0, 1, 1], ![2, 0, 1], ![1, 1, 1], ![1, 2, 0]}
  }


def s025WitnessMatrices :
    Finset (Matrix (Fin 3) (Fin 3) (ZMod 3)) :=
  {
    !![2, 1, 2; 1, 1, 2; 0, 1, 0],
    !![2, 0, 2; 1, 1, 2; 0, 1, 0],
    !![2, 2, 2; 1, 0, 2; 0, 2, 0],
    !![2, 1, 2; 0, 1, 0; 1, 1, 2],
    !![1, 0, 0; 1, 2, 2; 1, 1, 2],
    !![0, 2, 1; 2, 0, 1; 2, 2, 1],
    !![0, 2, 1; 1, 2, 2; 1, 1, 2],
    !![2, 1, 2; 2, 0, 1; 1, 1, 2],
    !![2, 0, 2; 0, 1, 0; 1, 1, 2],
    !![0, 1, 1; 1, 2, 2; 1, 1, 2],
    !![1, 2, 0; 2, 0, 1; 2, 2, 1],
    !![2, 0, 2; 1, 2, 2; 1, 1, 2],
    !![0, 1, 1; 2, 0, 1; 1, 1, 2],
    !![2, 2, 2; 0, 2, 0; 1, 0, 2],
    !![0, 2, 1; 2, 2, 1; 2, 0, 1],
    !![2, 2, 2; 1, 2, 2; 2, 0, 1],
    !![1, 2, 0; 2, 2, 1; 2, 0, 1],
    !![0, 2, 1; 1, 2, 2; 2, 0, 1]
  }

def s025WitnessImages : Finset (Finset CapPoint) :=
  s025WitnessMatrices.image (fun M =>
    (Finset.univ : Finset Vertex).image
      (fun v => M.mulVec (canonicalCapF3 v)))

def s025NormalizedFullTable : Finset (Finset CapPoint) :=
  s025NormalizedTails.image (fun T => s024BasisSet ∪ T)

set_option maxRecDepth 16384 in
set_option maxHeartbeats 20000000 in
/-- The eighteen displayed matrix images are *exactly* the eighteen
normalized eight-point sets. All maps fix the origin. -/
theorem s025_matrix_images_eq_normalized_table :
    s025WitnessImages = s025NormalizedFullTable := by
  decide +kernel

set_option maxRecDepth 16384 in
set_option maxHeartbeats 4000000 in
/-- No matrix in the displayed witness family has a zero determinant. -/
theorem s025_witness_matrices_nonsingular :
    (s025WitnessMatrices.filter (fun M => M.det = 0)).card = 0 := by
  decide +kernel

#print axioms PDIC.s025_matrix_images_eq_normalized_table
#print axioms PDIC.s025_witness_matrices_nonsingular


end PDIC


namespace PDIC

/-! S027 proof experiment: genuine labelled cap images satisfy the intrinsic
point-set short-zero exclusion test. This does not use the eighteen-case
table, orbit classification, an assumed normal form or an external script. -/

/-- Lift each small subset of an actual admissible cap's unordered point
image back to its unique subset of eight labelled vertices; sums and
cardinalities are preserved by injectivity. -/
theorem s027_image_subset_no_short_zero
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (s : Finset CapPoint)
    (hs : s ⊆ (Finset.univ : Finset Vertex).image f)
    (hcard : s.card = 1 ∨ s.card = 2 ∨ s.card = 3) :
    (∑ p ∈ s, p) ≠ (0 : CapPoint) := by
  classical
  let t : Finset Vertex :=
    s.preimage f (fun _ _ _ _ h => hf.1 h)
  have himage : t.image f = s := by
    ext p
    constructor
    · intro hp
      obtain ⟨v, hv, hvp⟩ := Finset.mem_image.mp hp
      have hfv : f v ∈ s := Finset.mem_preimage.mp hv
      simpa [hvp] using hfv
    · intro hp
      obtain ⟨v, _, hvp⟩ := Finset.mem_image.mp (hs hp)
      apply Finset.mem_image.mpr
      refine ⟨v, ?_, hvp⟩
      apply Finset.mem_preimage.mpr
      simpa [hvp] using hp
  have hcardt : t.card = s.card := by
    calc
      t.card = (t.image f).card :=
        (Finset.card_image_of_injective _ hf.1).symm
      _ = s.card := congrArg Finset.card himage
  have hsum : (∑ p ∈ s, p) = capSum f t := by
    rw [← himage]
    simpa [capSum] using
      (Finset.sum_image (s := t) (g := f)
        (f := fun p : CapPoint => p)
        (fun _ _ _ _ h => hf.1 h))
  intro hz
  have htcard : t.card = 1 ∨ t.card = 2 ∨ t.card = 3 := by
    simpa [hcardt] using hcard
  exact (hf.2 t htcard) (hsum.symm.trans hz)

/-- All three genuine finite point-set obstructions, rather than a test
on an unrelated synthetic eight-element list. -/
def s027ShortZeroFree (U : Finset CapPoint) : Bool :=
  decide (((U.powersetCard 1).filter (fun s =>
    (∑ p ∈ s, p) = (0 : CapPoint))).card = 0) &&
  decide (((U.powersetCard 2).filter (fun s =>
    (∑ p ∈ s, p) = (0 : CapPoint))).card = 0) &&
  decide (((U.powersetCard 3).filter (fun s =>
    (∑ p ∈ s, p) = (0 : CapPoint))).card = 0)

theorem s027_image_short_zero_free
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    s027ShortZeroFree ((Finset.univ : Finset Vertex).image f) = true := by
  classical
  let U : Finset CapPoint := (Finset.univ : Finset Vertex).image f
  have hbad (n : ℕ) (hn : n = 1 ∨ n = 2 ∨ n = 3) :
      ((U.powersetCard n).filter (fun s =>
        (∑ p ∈ s, p) = (0 : CapPoint))).card = 0 := by
    apply Finset.card_eq_zero.mpr
    apply Finset.eq_empty_of_forall_notMem
    intro s hs
    obtain ⟨hs, hz⟩ := Finset.mem_filter.mp hs
    obtain ⟨hsub, hc⟩ := Finset.mem_powersetCard.mp hs
    have hc' : s.card = 1 ∨ s.card = 2 ∨ s.card = 3 := by
      rcases hn with h1 | h2 | h3
      · exact Or.inl (hc.trans h1)
      · exact Or.inr (Or.inl (hc.trans h2))
      · exact Or.inr (Or.inr (hc.trans h3))
    exact (s027_image_subset_no_short_zero f hf s hsub hc') hz
  change
    (decide (((U.powersetCard 1).filter (fun s =>
      (∑ p ∈ s, p) = (0 : CapPoint))).card = 0) &&
    decide (((U.powersetCard 2).filter (fun s =>
      (∑ p ∈ s, p) = (0 : CapPoint))).card = 0) &&
    decide (((U.powersetCard 3).filter (fun s =>
      (∑ p ∈ s, p) = (0 : CapPoint))).card = 0)) = true
  simp only [hbad 1 (Or.inl rfl), hbad 2 (Or.inr (Or.inl rfl)),
    hbad 3 (Or.inr (Or.inr rfl))]
  rfl

#print axioms PDIC.s027_image_subset_no_short_zero
#print axioms PDIC.s027_image_short_zero_free

end PDIC


namespace PDIC

/-! S027: bridge the actual zero-sum-free normalized image into the
complete filtered 6,188-candidate search family without using the unverified
classification of its eighteen survivors. -/

def s027NormalizedAdmissibleTails : Finset (Finset CapPoint) :=
  (s024FreePoints.powersetCard 5).filter
    (fun T => s027ShortZeroFree (s024BasisSet ∪ T) = true)

theorem s027_normalized_cap_image_in_filtered_candidates
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f)
    (a : Fin 3 → Vertex) (ha : Function.Injective a)
    (hanchor : ∀ i, f (a i) = s024BasisPoint i) :
    ((Finset.univ : Finset Vertex).image f) ∈
      s027NormalizedAdmissibleTails.image
        (fun T => s024BasisSet ∪ T) := by
  classical
  have hraw :=
    s024_normalized_cap_image_in_candidates f hf a ha hanchor
  change ((Finset.univ : Finset Vertex).image f) ∈
    (s024FreePoints.powersetCard 5).image
      (fun T => s024BasisSet ∪ T) at hraw
  obtain ⟨T, hT, hEq⟩ := Finset.mem_image.mp hraw
  apply Finset.mem_image.mpr
  refine ⟨T, ?_, hEq⟩
  apply Finset.mem_filter.mpr
  refine ⟨hT, ?_⟩
  rw [hEq]
  exact s027_image_short_zero_free f hf

/-- Every actual admissible eight-cap can first be normalized by a
zero-fixing invertible linear equivalence, and its real unordered image
then belongs to the full finite candidate *filter* (not yet to the
eighteen-entry orbit table). -/
theorem s027_any_admissible_normalized_in_filtered_family
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
    ∃ L : CapPoint ≃ₗ[ZMod 3] CapPoint,
      ((Finset.univ : Finset Vertex).image
        (fun v => L (f v))) ∈
          s027NormalizedAdmissibleTails.image
            (fun T => s024BasisSet ∪ T) := by
  obtain ⟨L, hL, a, ha, hanchor⟩ :=
    s026_admissible_normalized_anchors f hf
  exact ⟨L,
    s027_normalized_cap_image_in_filtered_candidates
      (fun v => L (f v)) hL a ha hanchor⟩

#print axioms PDIC.s027_normalized_cap_image_in_filtered_candidates
#print axioms PDIC.s027_any_admissible_normalized_in_filtered_family

end PDIC


namespace PDIC

/-! S027 positive half of the finite normalized-cap classification:
verify *only* the 18 explicitly stated tails, never enumerate every
possible Finset CapPoint in the kernel. The remaining exhaustive
no-other-tail direction is a separate, still-open mathematical gate. -/

set_option maxRecDepth 16384 in
set_option maxHeartbeats 5000000 in
theorem s027_eighteen_tails_free_domain_certificate :
    (s025NormalizedTails.filter (fun T =>
      ¬ (T ⊆ s024FreePoints ∧ T.card = 5))).card = 0 := by
  decide +kernel

set_option maxRecDepth 16384 in
set_option maxHeartbeats 5000000 in
theorem s027_eighteen_tails_short_zero_certificate :
    (s025NormalizedTails.filter (fun T =>
      s027ShortZeroFree (s024BasisSet ∪ T) = false)).card = 0 := by
  decide +kernel

/-- Every one of the explicit eighteen candidate tails belongs to the
genuinely admissible normalized filter. This is only one inclusion. -/
theorem s027_eighteen_tails_subset_filtered_candidates :
    s025NormalizedTails ⊆ s027NormalizedAdmissibleTails := by
  classical
  intro T hT
  have hdomain : T ⊆ s024FreePoints ∧ T.card = 5 := by
    by_contra hn
    have hmem :
        T ∈ s025NormalizedTails.filter (fun V =>
          ¬ (V ⊆ s024FreePoints ∧ V.card = 5)) :=
      Finset.mem_filter.mpr ⟨hT, hn⟩
    have he : (s025NormalizedTails.filter (fun V =>
          ¬ (V ⊆ s024FreePoints ∧ V.card = 5))) = ∅ :=
      Finset.card_eq_zero.mp s027_eighteen_tails_free_domain_certificate
    simp [he] at hmem
  have hshort : s027ShortZeroFree (s024BasisSet ∪ T) = true := by
    cases h : s027ShortZeroFree (s024BasisSet ∪ T) with
    | false =>
      have hmem :
          T ∈ s025NormalizedTails.filter (fun V =>
            s027ShortZeroFree (s024BasisSet ∪ V) = false) :=
        Finset.mem_filter.mpr ⟨hT, h⟩
      have he : (s025NormalizedTails.filter (fun V =>
            s027ShortZeroFree (s024BasisSet ∪ V) = false)) = ∅ :=
        Finset.card_eq_zero.mp s027_eighteen_tails_short_zero_certificate
      simp [he] at hmem
    | true => exact h
  apply Finset.mem_filter.mpr
  exact ⟨Finset.mem_powersetCard.mpr hdomain, hshort⟩

#print axioms PDIC.s027_eighteen_tails_free_domain_certificate
#print axioms PDIC.s027_eighteen_tails_short_zero_certificate
#print axioms PDIC.s027_eighteen_tails_subset_filtered_candidates

end PDIC
