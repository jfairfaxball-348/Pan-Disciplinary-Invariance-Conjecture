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
