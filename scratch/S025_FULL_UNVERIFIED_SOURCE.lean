-- Unverified S025 source snapshot retained verbatim for repair after isolated CI checks.
-- Do not import in public verified modules until exact-SHA strict Lean CI succeeds.
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


namespace PDIC

/-! S025 continuation: the first actual typed zero-fixing linear basis map. -/

/-- The matrix whose three columns are selected points of F₃³. -/
def s025ColumnMatrix (p q r : CapPoint) :
    Matrix (Fin 3) (Fin 3) (ZMod 3) :=
  fun i j => if j = 0 then p i else if j = 1 then q i else r i

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
  decide +kernel

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

/-! S025 finite normalized-classification candidate. The exact statement
is an equality of the complete 6,188-element searched family with an
explicit 18-element list; it is NOT a definition of admissibility and
does not assume orbit completeness. -/

/-- Independent point-set short-zero-sum predicate. For size-eight
images it implements all singleton/pair/triple exclusions directly. -/
def s025ShortZeroFree (U : Finset CapPoint) : Bool :=
  (U.powersetCard 1).all (fun s =>
    decide ((∑ p ∈ s, p) ≠ (0 : CapPoint))) &&
  (U.powersetCard 2).all (fun s =>
    decide ((∑ p ∈ s, p) ≠ (0 : CapPoint))) &&
  (U.powersetCard 3).all (fun s =>
    decide ((∑ p ∈ s, p) ≠ (0 : CapPoint)))

/-- The eighteen point sets generated by normalizing three independent
actual canonical-cap points. The following certificate must prove that
all 6,188 candidates have been tested, not just this displayed list. -/
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

set_option maxRecDepth 16384 in
set_option maxHeartbeats 20000000 in
/-- Exhaustive 18-of-6,188 kernel proposition. This source candidate
must pass the pinned hosted strict Lean workflow before promotion. -/
theorem s025_normalized_tail_classification :
    (s024FreePoints.powersetCard 5).filter
      (fun T => s025ShortZeroFree (s024BasisSet ∪ T) = true) =
      s025NormalizedTails := by
  decide +kernel

theorem s025_normalized_tail_count :
    ((s024FreePoints.powersetCard 5).filter
      (fun T => s025ShortZeroFree (s024BasisSet ∪ T) = true)).card = 18 := by
  rw [s025_normalized_tail_classification]
  decide +kernel

#print axioms PDIC.s025_normalized_tail_classification
#print axioms PDIC.s025_normalized_tail_count

end PDIC


namespace PDIC

/-! S025: independent explicit zero-fixing matrix witnesses for the
normalized cap table. The finite equalities below are checked in the
kernel rather than trusting an external list of orbit images. -/

/-- One concrete 3×3 invertible matrix for each normalized canonical
cap image. There are precisely eighteen chosen representatives. -/
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
