import Challenge

/- Independent, inexpensive certificate for the exact seven-edge
   statement used as the second conjunct of Solution's flagship. -/
namespace PDIC

set_option maxRecDepth 8192 in
theorem s039_spider_spec_probe (u v : Vertex) :
    namedSpider.Adj u v ↔
      ((u = 0 ∧ (v = 4 ∨ v = 5 ∨ v = 6 ∨ v = 7)) ∨
       (v = 0 ∧ (u = 4 ∨ u = 5 ∨ u = 6 ∨ u = 7)) ∨
       (u = 1 ∧ v = 6) ∨ (u = 6 ∧ v = 1) ∨
       (u = 2 ∧ v = 5) ∨ (u = 5 ∧ v = 2) ∨
       (u = 3 ∧ v = 4) ∨ (u = 4 ∧ v = 3)) := by
  change spiderAdj u v = true ↔ _
  simp only [spiderAdj, decide_eq_true_eq, Fin.ext_iff]

#print axioms PDIC.s039_spider_spec_probe

end PDIC
