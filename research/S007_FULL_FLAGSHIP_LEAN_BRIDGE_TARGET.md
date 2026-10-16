# PDIC S007 — Resume complete headline theorem Lean formalisation: h(G) and the spider

**INSTALLED 16 October 2026; NOT EXECUTED.** This is a mathematical proof session. It is NOT Palomar submission preparation, novelty administration or a new short paper.

## Binding objective

Recover the complete first-paper theorem of `paper/PDIC_S003R8_DRAFT.tex` as an **end-to-end Lean theorem**, not merely a registerable graph fragment:

For any connected simple graph G on eight vertices, a uniformly random bijection to any fixed admissible eight-cap U ⊂ F₃³ has the exact four-term distribution, writing m for size-four maximal-independent-set count, n₀/n₂ for unordered pair overlap counts, h for unordered compatible triple count, M₁=2m/35, M₂=2n₀/35+n₂/315, M₃=h/315:

    Pr(N₀=0)=1−M₁+M₂−M₃,
    Pr(N₀=1)=M₁−2M₂+3M₃,
    Pr(N₀=2)=M₂−3M₃,
    Pr(N₀=3)=M₃=h(G)/315≤1/105,

with equality iff G is isomorphic to S(2,2,2,1). The classical nine-cap equivalence may be represented by an **explicit, genuine classical hypothesis** with provenance, never the conclusion disguised as an assumption. Aim to discharge it if practical; do not misrepresent conditional scope.

## Starting point

- Canonical proof source: strictly kernel-verified S003R9 `PDIC.lean` at `402465f2330a275e04108169a6bfbb65e94e10b8`, [Lean PASS 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785). This is the certified core; main historically held older S003R3 source.
- Dedicated Lean-continuation branch: `session/s007-full-lean-flagship`, created from the updated project governance and then populated with the **unchanged S003R9 PDIC.lean**. Verify this replacement and run new strict hosted CI for any changes; a prior passing SHA is not a new certificate.
- S006 `session/s006-palomar-prepare` contains a narrower Palomar graph/matrix candidate, **not** a complete flagship, and did not have a verified official full-mode pass. Preserve it as historical, non-blocking work. Do not substitute its Challenge/Solution for the mathematical target.
- Read `AGENTS.md`, `README.md`, `ROADMAP.md`, `research/FLAGSHIP_THEOREM.md`, `research/S003R9_GRAPH_WITNESSES_AND_SCOPE.md`, `research/CLAIMS.md` and manuscript. Respect explicit cap-classification reliance, strict axiom policy and prior-art uncertainty.

## S007 highest-priority mathematical obligation: bridge arbitrary connected graph h to the actual 4×4 matrix theorem

1. Work with an **actual** `SimpleGraph (Fin 8)` (or an equivalent explicitly eight-element vertex type and bijections), not just a fixed matrix graph. Define the genuine family F(G) of cardinality-four maximal independent vertex sets; define **unordered** compatible triples h(G) as in the manuscript, with the disjoint complementary pair and a third set meeting each side in two vertices. Prove these definitions are faithful to the paper. In particular distinguish 2+2 mixed sets from 3+1, 1+3 and pure ones.
2. Construct and kernel-prove a dichotomy: if no complementary disjoint pair of four-MIS exists, h(G)=0; otherwise its two sides make G bipartite and, by connected uniqueness of proper Boolean colourings, the complementary partition is unique up to swap.
3. Construct a bijection between the two four-element sides and `Fin 4`, transfer the full graph adjacency, maximality and individual mixed witnesses under the bijection (not an unproved count identity). Prove **h(G)=graphMixedCount A** for the resulting 4×4 Boolean matrix A, with the uniqueness of the disjoint pair handled in the unordered triple semantics. Use the existing `PDIC.graphMixedEquiv`, `connected_independent_partition_unique`, `matrixGraph_edgeCount`, `connected_graphMixedCount_le_three`.
4. Derive `h(G)≤3` for every connected G. Seek and prove the equality iff named eight-vertex spider graph isomorphism by transporting the certified `spiderMatrixBV` pattern, not merely asserting matrix-pattern equality. Define the spider's exact edge set and prove the converse (explicit three compatible mixed witnesses). If the complete equality theorem is too large for one session, first close a kernel-proved general `h(G)≤3` and install the smallest necessary next Lean obligation.
5. Inspect for hidden hypotheses: G is connected, loops excluded (SimpleGraph), eight distinct vertices, cardinality four, unordered triples, genuine MIS not maximum independent sets. Adversarially test disconnected graphs, graphs without balanced bipartition, spider skew 3+1 MIS and graphs with multiple complementary partitions. Use independent small enumeration only as cross-check, not a substitute for Lean.

## Subsequent mathematical obligations — stay on the critical path

- Exact quadratic canonical eight-cap quartet incidence, zero-fixing linear transfer and the classical nine-cap input scoped honestly.
- Actual finite probability space of all 8! bijections; 2520 ordered four-atom assignments and exact 16-fibre regularity; first three factorial/binomial moments and N₀≤3; probability mass inversion for N₀=0,1,2,3.
- Combine general h≤3/equality, uniform distribution and cap classification into **one named public Lean theorem matching the manuscript's entire displayed law and sharp spider extremiser**, with no conclusion smuggled in as hypothesis.
- Only after the full theorem is strictly hosted Lean certified does Palomar preparation become the active stage again. Do not offer a narrower graph-only certificate as project completion.

## Required session execution and closeout

- Make real Lean proof changes on `session/s007-full-lean-flagship`; do not spend the session only on documentation or another Palomar package.
- Every substantive new theorem: fully specified statement, no sorry/admit, no native_decide/compiler-trust or custom axioms; use strict `#print axioms`, `lake build`, test files and hosted CI. Identify exactly which commit and run passed. Avoid stale PR3/main ambiguity.
- Record progress against each missing bridge in `research/CLAIMS.md`, `authoritative/STATE.json`, relevant proof note, session closeout and README. Distinguish written/finite-checked/kernel-verified.
- **AUTOMATIC NEXT-PROMPT GENERATION IS REACTIVATED**: at the end of S007 select the most important unresolved obligation directly toward the full formalisation, write a complete executable `S008` prompt to a tracked research file, point `research/NEXT_SESSION_PROMPT.md` and state to it, and commit. The owner need only say “run next session”. This generates the prompt, **not** an unattended research run.
- If flagship achieved in S007, next prompt may move to full-theorem-aligned Palomar verification. Never silently shrink the mathematical goal or claim an administrative milestone is the full proof. Do not initiate public Palomar registration, correspondence, arXiv or journal submission without express owner authorisation.
