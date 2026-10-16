# S017 — Universal overlapping-pair and compatible-triple real permutation events
16 October 2026 · Canonical proof branch `session/s007-full-lean-flagship` · draft PR #4

## Mathematical reduction (written proof)
Take arbitrary four-subsets S,T of V=Fin 8 with |S∩T|=2. The four membership-bit cells
A=S∩T, B=S\T, C=T\S, D=V\(S∪T)
all have cardinality exactly two. This follows from the two four-element counts, two-element intersection, and |V|=8.

Their corresponding four cells under the canonical ordered zero-sum quartets Q0 and Q1 also have size two. Choose a bijection in each cell. The disjoint union of these four bijections is an *actual eight-vertex permutation* p with p(S)=Q0 and p(T)=Q1. In Lean this is constructed from `Equiv.sigmaFiberEquiv`, `Equiv.sigmaCongrRight`, and `Fintype.equivOfCardEq`, not a test of all 40320 label permutations.

For every e, the genuine zero-sum event on S,T is equivalent to the canonical event on Q0,Q1 under p⁻¹ ∘ e: reindex each sum by p, use the established sum/image compatibility and the group inverse law. Thus its cardinality is the S016 strictly certified canonical event cardinality 128. Therefore
```
# {e in Sym(V) : Σ_{v∈S} cap(e(v))=0 and Σ_{v∈T} cap(e(v))=0} = 128
P(two prescribed overlapping quartets cap-zero) = 128/40320 = 1/315.
```

For distinct four-subsets S,T,U with S∩T empty and |S∩U|=2, the canonical total cap sum is zero. Since S,T form an eight-vertex partition, whenever the sum over S vanishes, so does the sum over T. Consequently the three-event predicate is equivalent to the (S,U) two-event predicate and its cardinality is again **128**, for all prescribed compatible triples. This is the underlying scalar count, not yet an aggregate unordered graph triple moment.

The existing S014 theorem `canonicalCapF3_perm_three_zero_has_disjoint_pair` shows every three distinct simultaneous cap-zero quartets contains a complementary pair. The S013 `connected_labellingZeroMISCount_le_three` bounds the genuine count in connected graphs.

## Exact source and epistemic status
- S016 predecessor (fixed prescribed Q0/Q1): full kernel pass at `5dc78de0aad6fa1d19bcda72e7143386f222d617`, strict run `38963802011`; finite run `38963802113`.
- S016 universal *disjoint* pair: kernel pass `4b4b02aad5a8d1074288011976fc0c040622a4c0`, run `38962481022`.
- S017 initial source `82933786f6130d10b22c3dbd0d7036e9f100c92b`: hosted Lean failed on four local proof elaboration/tactic errors; its finite design check passed. This candidate is not a certificate.
- S017 repaired universal two-pair source `2695776996159cdc4495368dade8cefad1a91923` (strict Lean PASS 38967523801), augmented with real compatible triple to current source `0e88ab34eda79df08f700d141b9ef5f98e13f17e`.
- S017 source at [0e88ab34eda79df08f700d141b9ef5f98e13f17e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/0e88ab34eda79df08f700d141b9ef5f98e13f17e) **LEAN_KERNEL_VERIFIED**: [strict hosted run 38967576459 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38967576459) (full pinned `lake build`, proof-hole scan, all independent finite checkers); [finite run 38967576644 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38967576644). `#print axioms` for all four new public declarations contains only `propext`, `Classical.choice`, `Quot.sound`.
- S017 declarations: `overlapSourceColour_fibre_card`, `exists_perm_overlap_pair_to_canonical`, `canonicalCapF3_perm_overlap_two_pair_event_card`, `canonicalCapF3_perm_compatible_triple_event_card`. Each has a `#print axioms` invocation. Axioms must be confirmed only as `propext`, `Classical.choice`, `Quot.sound`.
- The final exact SHA passed strict hosted Lean and the independent finite workflow. Independent finite checks corroborate 8 ordered canonical overlap-two target pairs; the fibre proof is algebraic, not an exhaustive 40320-permutation certificate.

## Still outstanding
The *genuine unordered graph-derived* moments `m,n₀,n₂,h` have not yet been derived in Lean by summing over graph maximal-independent four-subsets and permutations. The unique compatible incidence classification must be combined with the true event counts, not substituted with matrix coefficients. The integrated four-term distribution and spider equality theorem remain OPEN_IN_LEAN. The classical arbitrary-admissible-cap classification remains an *explicit hypothesis*, not an axiom. Novelty/priority unresolved. No PR merge, Palomar, arXiv or journal submission.

[S018 installed](NEXT_SESSION_PROMPT.md) to complete the moment and flagship integration, after confirming S017 exact source passes strict CI.
