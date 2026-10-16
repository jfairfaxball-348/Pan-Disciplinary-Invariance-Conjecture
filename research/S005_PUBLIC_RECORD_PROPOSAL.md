# PDIC S005 — proposed permanent Palomar title, abstract and theorem correspondence

**Proposal only — NOT published, submitted, preflighted or Palomar verified.** Owner's publication alignment takes precedence over the aspirational PDIC programme name. Historical novelty/priority and significance remain unresolved after S004.

## A. Preferred full-paper record — CONDITIONAL ON FULL FUTURE CERTIFICATION

**Exactly matching current manuscript title:** **Zero-Sum Quartet Incidence and Sharp Maximal-Independent-Set Witnesses on Eight Vertices**. This is the exact title line presently in paper/PDIC_S003R8_DRAFT.tex. Use it as formalization.yaml project.name / public H1 / BibTeX title if the full flagship eventually becomes the compared and certified theorem. If the manuscript title changes, keep the two sources in deliberate lockstep.

**Proposed plain-text public project.description (not a claim of current Lean completion):**

> We prove that for every connected simple graph G on eight vertices, uniformly labelling its vertices by any fixed admissible eight-point cap U in F₃³ yields an exact four-term law for N₀, the number of four-vertex maximal independent sets with zero label sum. If m is the number of such maximal independent sets, n₀ and n₂ count unordered pairs intersecting in zero and two vertices, and h counts compatible unordered triples, put M₁=2m/35, M₂=2n₀/35+n₂/315 and M₃=h/315. Then P(N₀=0,1,2,3)=(1−M₁+M₂−M₃, M₁−2M₂+3M₃, M₂−3M₃, M₃), with P(N₀=3)=h/315≤1/105; equality holds precisely when G is the spider tree with leg lengths (2,2,2,1). The cap reduction uses the classical affine classification of nine-caps, explicitly credited to Follett and collaborators. The mathematical statement is a written theorem; at present only the strictly separated finite graph/matrix component has been Lean-kernel-checked. Literature priority and mathematical significance remain unresolved.

This text is a **draft**, not suitable as final Palomar metadata while the displayed certification qualifier is still true but no Challenge proves the law. On any eventual full law registration, replace the last two sentences with the true **exact formalisation status** and qualified provenance at that future commit, without making historical priority claims.

### Mathematical headline for paper Theorem / eventual fully compared Challenge

For an admissible U ⊂ F₃³ \ {0} and a uniform bijection λ:V(G)→U, let

N₀(G,λ) = #{S⊂V(G) : |S|=4, S a maximal independent set of G, Σ(v∈S)λ(v)=0}.

Let m=|F(G)|, n_t=#{ {S,T}⊂F(G): S≠T and |S∩T|=t } for t∈{0,2}, and h=#compatible unordered triples with one complementary disjoint pair and a third four-MIS meeting each in exactly two vertices. Put

M₁ = 2m/35,   M₂ = 2n₀/35 + n₂/315,   M₃ = h/315.

**We prove** that for every connected simple eight-vertex G,

~~~text
(P[N₀=0], P[N₀=1], P[N₀=2], P[N₀=3])
 = (1−M₁+M₂−M₃, M₁−2M₂+3M₃, M₂−3M₃, M₃),
P[N₀=3] = h/315 ≤ 1/105
with equality if and only if G ≅ S(2,2,2,1).
~~~

These are exactly the written full-law claims in manuscript section “The complete random cap-labelling law” and FLAGSHIP_THEOREM.md. **They are not currently represented by a certified end-to-end Challenge/Solution.**

For a future exact-alignment metadata surface, the **same quantified theorem** must be represented in the public Challenge declarations, selected in comparator.json theorem_names, matched by Solution declarations, and checked in Palomar full mode. Its mathematical definition of N₀ must be the genuine uniform finite-bijection probability model, not an arbitrary rational placeholder or hypothesis that assumes the desired bound. Any external classical nine-cap classification must be genuinely formalised or exposed as an explicit relevant hypothesis, honestly disclosed. The paper, Challenge docstrings, public description, exact theorem_names and eventual Palomar record should describe **one and the same claim**.

## B. Immediately truthful narrower proposed record — not submitted, not Comparator-certified

**Alternative title:** **Sharp Mixed Maximal-Independent-Set Bounds for Connected Four-by-Four Bipartite Graphs**.

**Alternative “We prove…” description:**

> We prove that if A is a Boolean 4×4 bipartite adjacency matrix whose associated eight-vertex simple graph G(A) is connected, then the number B(A) of mixed maximal independent vertex sets taking two vertices from each side is at most three. Equality B(A)=3 holds if and only if A has the certified row- or column-centred spider matrix pattern. More generally, four or more mixed witnesses force at most five matrix edges, while eight or more edges force at most two witnesses. The associated graph semantics, mixed-witness cardinality and connected-graph reduction have been strictly checked by Lean 4 at a pinned source revision; **no Palomar Comparator check has been run**. This does not certify the complete random eight-cap labelling law, the arbitrary-graph compatible-triple equivalence, or the isomorphism statement G≅S(2,2,2,1). Literature priority remains unresolved.

This narrower description is appropriate only if the actual selected Challenge contains independently auditable **exactly matching** theorem statements and the Solution matches them. The current PR #3 uses its own PDIC definitions; they are not automatically eligible Challenge dependencies and the repo currently has no Challenge at all. Therefore this is a **possible honest record wording**, not current Palomar readiness.

### Exact current Lean bridge candidates, NOT final Comparator selection

[PR #3 source](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/blob/402465f2330a275e04108169a6bfbb65e94e10b8/PDIC.lean) strictly certified at [Lean run 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785). The relevant theorem types include:

- PDIC.connected_graphMixedCount_le_three: for adj:Side→Side→Bool, if (matrixGraph adj).Connected then graphMixedCount adj ≤ 3.
- PDIC.connected_graphMixedCount_three_iff_pattern: with the same connectivity hypothesis, graphMixedCount adj = 3 ↔ spiderMatrixBV (rowsOfAdj adj 0) (rowsOfAdj adj 1) (rowsOfAdj adj 2) (rowsOfAdj adj 3) = true.
- PDIC.four_mixed_implies_at_most_five_edges, PDIC.eight_edges_implies_at_most_two_mixed and PDIC.seven_edges_three_mixed_iff_spider: arithmetic/matrix semantic extremal theorems for arbitrary Boolean matrices.

Note the important difference: **“spider matrix pattern” is not itself a proved named SimpleGraph isomorphism**, and **graphMixedCount is not h(G)** in the full abstract eight-vertex statement. Neither should be silently replaced by the more impressive paper claim.

## C. Alignment and content authority table

| Paper / wording | formalization.yaml | Challenge + Comparator statement | Current status |
| --- | --- | --- | --- |
| Manuscript title above | project.name / public record and BibTeX title | Need not be a namespace name | Manuscript title EXISTS; metadata ABSENT |
| “We prove that … exact N₀ law” | project.description (plain text summary) | Must select a fully proved probability/graph theorem, with real definitions | WRITTEN, **NOT** end-to-end Lean checked |
| P(N₀=3)=h/315 ≤1/105, equality iff G≅spider | Description + Challenge docstrings | Requires h-triple equivalence, finite labelling model and named graph isomorphism | WRITTEN ONLY as full connected-graph theorem |
| B(A)≤3 for connected G(A), spider pattern equality | In narrowly scoped alternative abstract | Candidate PDIC.connected_graphMixedCount_* types | Strict Lean checked on PR #3; NOT Palomar checked |
| Classical nine-cap equivalence | Structured bibliography/provenance, precise narrative and any hypothesis | Cannot assume it was proved in current source | External classical input |
| Authors, classification, AI methods, review | v0.4 structured metadata | Not substitutes for theorem proofs | MUST be factual, future file not authored by S005 |
| Literature originality, research significance | Truthful scope and provenance | Palomar does NOT independently establish either | S004: UNRESOLVED |

## D. “Observed” versus “proposed” public preview

Under PalomarWeb's current source implementation, a record is expected to show:

1. Top: “PALOMAR-... vN” and a statement trust label; H1 = project.name; plain-text abstract lede = project.description; “By [human authors]”; paper/source links only when structured references exist.
2. Immediately below: **Formal comparison surface / Named compared declarations**, with source and formatted statement links. This surface must display the **actual** Challenge-selected Lean declarations, not this prose proposal.
3. Then: registered assurance, collapsible verification details, statement dependencies, source/provenance, AI review comments, citation and version history. No numeric AI review scores are presented in the normal page, per current app.js.

**Verification of actual sample limited:** attempted [TreeStack v1](https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000010&version=1), but direct dynamic registry JSON was inaccessible in this environment. Above is official UI source-derived behaviour, **not** a claim that proposed PDIC text has been previewed in the live Registry. Inline backticks and some Unicode operators in an abstract are styled by the site's text segmenter, but generic LaTeX/Markdown is not parsed there. The exact formal statement has its own render page.

## E. Absolute boundary

No formalization.yaml, Challenge, Solution or Comparator is being created in S005. No source or statement is being submitted, and no preflight job has been dispatched. The policy's research-interest and statement-faithfulness review remains an independent gate. The S004 negative-search result must never be stated as confirmed novelty.
