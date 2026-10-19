module

public import S024

public section

/-!
# Certified full probability law

This is the proved counterpart of the independently specified Challenge.
All semantic definitions are those of the substantive development in PDIC.lean.
The full proof is PDIC.connected_graphMIS_complete_flagship_unconditional_all_caps
in S024.lean, certified at source commit 09d9f392d20399c80f2c51e2f4979b78b412c4e2 prior to repackaging.
The module-system conversion and Comparator must be reverified at this new SHA.
-/

namespace PDIC

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
  refine ⟨connected_graphMIS_complete_flagship_unconditional_all_caps G hc f hf, ?_⟩
  intro u v
  change spiderAdj u v = true ↔ _
  simp only [spiderAdj, decide_eq_true_eq]

#print axioms PDIC.palomar_complete_probability_and_spider

end PDIC
