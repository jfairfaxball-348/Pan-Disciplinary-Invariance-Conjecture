# PDIC S003R5 — compositional proof repair (2026-10-16)

## Confirmed diagnosis

S003R4 PR #3 at SHA `858579831aee8944cb9f03b83d5366d8e72dd5dd` **did not** pass strict Lean CI. Its kernel workflow [38816914819](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38816914819) reached `lake build` then terminated with code 143 after several minutes; there is no legitimate proof certificate for any of the unmerged universal numeric-count declarations. The independent Python finite verifier passed separately. The main branch retains the already verified S003R3 theorem family.

On S003R5, a first Lean branch reduction (`896a8fc`) was tested by workflow [38862320868](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38862320868). Crucially, this produced *diagnostic errors* rather than a silent timeout: the Prop criterion used left-associative versus right-associative conjunctions, and a doc comment separated `set_option ... in` from the declaration. CI also printed `sorryAx` for the incorrect incomplete criterion proof. Both defects were corrected in commit `ad39aec0714539dc43cd0a851a65e8d52978485d`, under PR #3; kernel certification of that exact commit is to be assessed separately.

## Mathematical bridge, fully specified at paper level

For a Boolean 4×4 adjacency matrix with row masks `a,b,c,d`, and each unordered pair `X={i,j}` of left vertices, define `n_X = r_i OR r_j`. A mixed four-vertex maximal independent set with left side `X` has a unique possible right side `Y=[4]\\N(X)`. Existence is **equivalent** to
(1) `popcount(n_X)=2`; (2) each of the other two rows `r_k` has `r_k AND (NOT n_X) != 0`.

The three local masks have small independent verification domains:
- row cardinality/popcount: 16 four-bit masks;
- `twoNeighboursBV` ↔ exactly two set bits: 16 masks;
- `z AND NOT n != 0` ↔ existence of an outside-neighbour bit: 256 ordered pairs of masks.

The last statement is the proposition
`(z ∧ ¬n ≠ 0) ↔ (∃j∈[4], z[j]=1 ∧ n[j]=0)`.
The forward implication selects a set bit of the intersection; the reverse implication observes that this selected bit makes the intersection nonzero.

Every two-subset of the four left vertices is one of six explicitly encoded pairs, each counted once. Consequently the sum of six Boolean indicator values is the exact mixed-MIS count, and `6<8` prevents a BitVec 3 overflow. Likewise four per-row bit-counts each at most four sum to at most sixteen, and `16<32` prevents a BitVec 5 overflow. These statements are **ordinary mathematical proofs**, not automatically Lean-certified by their independent Python checks.

## Decomposition adopted

1. Preserve already kernel-proved injective row encoding and unique-right-complement maximality criterion from main.
2. Prove the constructive Boolean criterion `mixedPairCriterionBool_iff` and its finite filter count `computableMixedLeftPairCount_eq_actual` by symbolic logic.
3. Prove the three **local** mask identities in Lean; avoid a single costly `decide +kernel` over all 65,536 matrices with nested `Finset (Finset (Fin 4))` semantics.
4. Use these to prove an individual `goodLeftPairBV` ↔ actual pair witness lemma **symbolically**, then six-pair cardinality and no-overflow sum identities.
5. Only then transfer `e≥8⇒b≤2`, `b≥4⇒e≤5`, and the seven-edge spider iff to actual adjacency. Thereafter attack connected `SimpleGraph (Fin 8)` and actual sample-space probabilities.

## Status discipline

Independent enumeration over 65,536 row quadruples confirms `b≥4⇒e≤5`, `e≥8⇒b≤2` and exactly 192 labelled seven-edge/three-witness matrices. This is **FINITE_CHECKED**, not a surrogate for the missing general Lean count theorem. Neither SimpleGraph isomorphism nor the 2520-atom sample-space theorem nor specialist source novelty is complete. No publication or external submission was made.
