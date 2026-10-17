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
      simpa using (hp (p.symm v)).symm
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
