module

public import Mathlib

public section

/-!
# Zero-sum quartet incidence and the sharp eight-vertex MIS witness law

The *independent* Challenge states actual permutation-sample-space probabilities
and genuine maximal independent four-subset counts. The labelled spider is
S(2,2,2,1). The deliberately unfinished Challenge proof is not the Solution.
-/

namespace PDIC

abbrev Vertex := Fin 8

def GraphMIS {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
  (∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v) ∧
    (∀ v, v ∉ s → ∃ u ∈ s, G.Adj v u)

def spiderAdj (u v : Vertex) : Bool :=
  decide ((u = 0 ∧ (v = 4 ∨ v = 5 ∨ v = 6 ∨ v = 7)) ∨
          (v = 0 ∧ (u = 4 ∨ u = 5 ∨ u = 6 ∨ u = 7)) ∨
          (u = 1 ∧ v = 6) ∨ (u = 6 ∧ v = 1) ∨
          (u = 2 ∧ v = 5) ∨ (u = 5 ∧ v = 2) ∨
          (u = 3 ∧ v = 4) ∨ (u = 4 ∧ v = 3))

def namedSpider : SimpleGraph Vertex where
  Adj u v := spiderAdj u v = true
  symm.symm := by
    intro u v
    fin_cases u <;> fin_cases v <;> decide
  loopless.irrefl := by
    intro u
    fin_cases u <;> decide

abbrev CapPoint := Fin 3 → ZMod 3

def capSum (f : Vertex → CapPoint) (s : Finset Vertex) : CapPoint :=
  ∑ v ∈ s, f v

def IsAdmissibleCap (f : Vertex → CapPoint) : Prop :=
  Function.Injective f ∧
    ∀ s : Finset Vertex,
      (s.card = 1 ∨ s.card = 2 ∨ s.card = 3) → capSum f s ≠ 0

noncomputable def fourGraphMISFamily (G : SimpleGraph Vertex) :
    Finset (Finset Vertex) := by
  classical
  exact (Finset.univ : Finset (Finset Vertex)).filter
    (fun s => s.card = 4 ∧ GraphMIS G s)

noncomputable def labellingZeroMISCountForCap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (e : Equiv.Perm Vertex) : ℕ :=
  ((fourGraphMISFamily G).filter
    (fun s => capSum (fun v => f (e v)) s = 0)).card

noncomputable def graphMIS_exact_probability_for_cap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint) (i : ℕ) : ℚ :=
  (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
    (fun e => labellingZeroMISCountForCap G f e = i)).card : ℚ) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

def UnorderedPairOverlap (T : Finset (Finset Vertex)) (k : ℕ) : Prop :=
  ∀ s ∈ T, ∀ t ∈ T, s ≠ t → (s ∩ t).card = k

noncomputable def graphMIS_pairOverlapCount
    (G : SimpleGraph Vertex) (k : ℕ) : ℕ := by
  classical
  exact (((fourGraphMISFamily G).powersetCard 2).filter
    (fun T => UnorderedPairOverlap T k)).card

def IsUnorderedCompatibleTriple (G : SimpleGraph Vertex)
    (T : Finset (Finset Vertex)) : Prop :=
  T.card = 3 ∧
  (∀ r ∈ T, r.card = 4 ∧ GraphMIS G r) ∧
  ∃ s ∈ T, ∃ t ∈ T, ∃ r ∈ T,
    s ≠ t ∧ s ≠ r ∧ t ≠ r ∧
      t = Finset.univ \ s ∧
      (r ∩ s).card = 2 ∧ (r ∩ t).card = 2

noncomputable def unorderedCompatibleTripleCount
    (G : SimpleGraph Vertex) : ℕ := by
  classical
  exact ((Finset.univ : Finset (Finset (Finset Vertex))).filter
    (IsUnorderedCompatibleTriple G)).card

/-- Full unconditional four-event law and sharp spider characterisation,
for any connected graph on eight vertices and ANY admissible cap in F_3^3.
The sample space is genuinely the 8! vertex permutations; the final equality
holds if and only if G is graph-isomorphic to the named spider. -/
theorem palomar_complete_probability_and_spider
    (G : SimpleGraph Vertex) (hc : G.Connected)
    (f : Vertex → CapPoint) (hf : IsAdmissibleCap f) :
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
  sorry

end PDIC
