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

/-- A finite vertex subset is maximal independent when it has no adjacent pair and every outside vertex has a neighbour inside it. -/
def GraphMIS {V : Type*} (G : SimpleGraph V) (s : Finset V) : Prop :=
  (∀ u ∈ s, ∀ v ∈ s, ¬ G.Adj u v) ∧
    (∀ v, v ∉ s → ∃ u ∈ s, G.Adj v u)

/-- The named spider has hub 0, four hub-neighbours and three further leaf edges; its arm lengths are 2, 2, 2 and 1. -/
def spiderAdj (u v : Vertex) : Bool :=
  decide ((u.val = 0 ∧ (v.val = 4 ∨ v.val = 5 ∨ v.val = 6 ∨ v.val = 7)) ∨
          (v.val = 0 ∧ (u.val = 4 ∨ u.val = 5 ∨ u.val = 6 ∨ u.val = 7)) ∨
          (u.val = 1 ∧ v.val = 6) ∨ (u.val = 6 ∧ v.val = 1) ∨
          (u.val = 2 ∧ v.val = 5) ∨ (u.val = 5 ∧ v.val = 2) ∨
          (u.val = 3 ∧ v.val = 4) ∨ (u.val = 4 ∧ v.val = 3))

theorem spiderAdj_symmetric : ∀ u v : Vertex, spiderAdj u v = true → spiderAdj v u = true := by decide
theorem spiderAdj_loopless : ∀ u : Vertex, ¬ spiderAdj u u = true := by decide

set_option backward.proofsInPublic true
/-- The undirected simple graph S(2,2,2,1) presented on Fin 8. -/
@[expose] def namedSpider : SimpleGraph Vertex where
  Adj u v := spiderAdj u v = true
  symm.symm := spiderAdj_symmetric
  loopless.irrefl := spiderAdj_loopless
set_option backward.proofsInPublic false

/-- The three-dimensional vector space over the ternary field. -/
abbrev CapPoint := Fin 3 → ZMod 3

/-- The vector sum of the points assigned to a finite vertex subset. -/
def capSum (f : Vertex → CapPoint) (s : Finset Vertex) : CapPoint :=
  ∑ v ∈ s, f v

/-- An injective eight-point labelling avoiding zero-sums of one, two or three distinct cap points. -/
def IsAdmissibleCap (f : Vertex → CapPoint) : Prop :=
  Function.Injective f ∧
    ∀ s : Finset Vertex,
      (s.card = 1 ∨ s.card = 2 ∨ s.card = 3) → capSum f s ≠ 0

/-- The genuine size-four maximal independent subsets of the graph. -/
noncomputable def fourGraphMISFamily (G : SimpleGraph Vertex) :
    Finset (Finset Vertex) := by
  classical
  exact (Finset.univ : Finset (Finset Vertex)).filter
    (fun s => s.card = 4 ∧ GraphMIS G s)

/-- Number of maximal independent four-subsets whose sum is zero for the given relabelled cap. -/
noncomputable def labellingZeroMISCountForCap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint)
    (e : Equiv.Perm Vertex) : ℕ :=
  ((fourGraphMISFamily G).filter
    (fun s => capSum (fun v => f (e v)) s = 0)).card

/-- Actual event cardinal divided by |Perm(Fin 8)| = 40,320, not an abstract probability surrogate. -/
noncomputable def graphMIS_exact_probability_for_cap
    (G : SimpleGraph Vertex) (f : Vertex → CapPoint) (i : ℕ) : ℚ :=
  (((Finset.univ : Finset (Equiv.Perm Vertex)).filter
    (fun e => labellingZeroMISCountForCap G f e = i)).card : ℚ) /
      (Fintype.card (Equiv.Perm Vertex) : ℚ)

/-- A two-set family's distinct members have the indicated intersection cardinality. -/
def UnorderedPairOverlap (T : Finset (Finset Vertex)) (k : ℕ) : Prop :=
  ∀ s ∈ T, ∀ t ∈ T, s ≠ t → (s ∩ t).card = k

/-- Number of unordered pairs of real maximal independent four-sets with prescribed overlap. -/
noncomputable def graphMIS_pairOverlapCount
    (G : SimpleGraph Vertex) (k : ℕ) : ℕ := by
  classical
  exact (((fourGraphMISFamily G).powersetCard 2).filter
    (fun T => UnorderedPairOverlap T k)).card

/-- An unordered triple of distinct four-MIS with one complementary pair and a third 2+2 mixed set. -/
def IsUnorderedCompatibleTriple (G : SimpleGraph Vertex)
    (T : Finset (Finset Vertex)) : Prop :=
  T.card = 3 ∧
  (∀ r ∈ T, r.card = 4 ∧ GraphMIS G r) ∧
  ∃ s ∈ T, ∃ t ∈ T, ∃ r ∈ T,
    s ≠ t ∧ s ≠ r ∧ t ≠ r ∧
      t = Finset.univ \ s ∧
      (r ∩ s).card = 2 ∧ (r ∩ t).card = 2

/-- Number of genuine unordered compatible triple families. -/
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
    ((graphMIS_exact_probability_for_cap G f 0 =
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
        Nonempty (G ≃g namedSpider)))) ∧
    (∀ u v : Vertex, namedSpider.Adj u v ↔
      ((u = 0 ∧ (v = 4 ∨ v = 5 ∨ v = 6 ∨ v = 7)) ∨
       (v = 0 ∧ (u = 4 ∨ u = 5 ∨ u = 6 ∨ u = 7)) ∨
       (u = 1 ∧ v = 6) ∨ (u = 6 ∧ v = 1) ∨
       (u = 2 ∧ v = 5) ∨ (u = 5 ∧ v = 2) ∨
       (u = 3 ∧ v = 4) ∨ (u = 4 ∧ v = 3))) := by
  sorry

end PDIC
