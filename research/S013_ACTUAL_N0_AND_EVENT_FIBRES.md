# PDIC S013 — genuine labelled N₀ support and event-fibre analysis

Date: 16 October 2026. Canonical formalisation branch: \`session/s007-full-lean-flagship\`, draft PR #4.

## Exact proof attempt and dependency

Candidate Lean source: [\`2a808e53cb7a763b54c53c4f06d12f7f64d3b113\`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/2a808e53cb7a763b54c53c4f06d12f7f64d3b113).

The S012 permutation-transport source \`4c68728834570cb436944c407d700487c6448002\`, previously awaiting hosted verification, has now passed [exact-source Lean workflow 38938608949](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938608949) and [finite workflow 38938609119](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938609119). Its #print axioms output contains only propext, Classical.choice and Quot.sound.

## Actual connected-graph count bound: proof structure

For a connected \`G : SimpleGraph (Fin 8)\` and a genuine permutation \`e : Equiv.Perm (Fin 8)\`, let

- \`S(e,G)\` be the *actual* Finset of size-four \`GraphMIS G\` subsets whose typed cap sum after labelling \`e\` vanishes.
- \`T(e)\` be the image of the four distinct canonical cap quartets under \`pulledQuartet e\`.

S011 and S012 show a size-four set has zero cap sum iff its image under \`e\` is a canonical quartet. S013 constructs the inverse finite-image correspondence, proving \`S(e,G) ⊆ T(e)\`. For a connected graph, it is **not** possible that every pulled-back quartet is independent: Q₀/Q₃ and Q₁/Q₂ would give different independent bipartitions, contradicting the previously certified uniqueness lemma. Therefore \`S(e,G) ≠ T(e)\`. A strict subset of an image of four indices has at most three members, hence

\[
N_0(e,G) = |S(e,G)| \leq 3.
\]

This is an actual graph-MIS, zero-sum, uniformly-labellable statement, **not** merely a bound on a symbolic quartet statistic. Its Lean status must be read from the exact-source CI result, not inferred from this written argument.

## Event-fibre counting: independent finite evidence and general written bijections

A separate 40,320-permutation exhaustive enumeration finds:

| Event on prescribed four-sets | Favourable permutations | Probability |
|---|---:|---:|
| One zero-sum set | 2304 | 2/35 |
| Complementary zero-sum pair | 2304 | 2/35 |
| Ordered two-overlap zero-sum pair | 128 | 1/315 |
| Compatible zero-sum triple | 128 | 1/315 |

Combinatorial counting without enumeration:

1. For a specified four-set, its image under a permutation is any of the 70 size-four sets; each image has \`4!·4!=576\` preimages. Four quartet images are favourable: \`4·576=2304\`.
2. For two disjoint four-sets, their images are complementary; once the first image is one of four quartets, the second is forced to its complementary quartet. Hence 2304.
3. For two four-sets intersecting in two vertices, the four disjoint source cells (common, left-only, right-only, neither) all have size two. There are 2520 possible ordered image configurations, each with \`(2!)⁴=16\` permutation preimages. Exactly eight ordered canonical quartet pairs have two-point overlap: \`8·16=128\`.
4. For a prescribed compatible triple, the unique complementary pair maps to one of the two canonical opposite pairs (four ordered orientations); the third image is one of the other two quartets. Again eight favourable ordered configurations, each with 16 preimages: 128. A noncompatible triple cannot consist of three distinct canonical quartets.

For any three distinct canonical quartets, one pair is complementary. This forces actual nonzero third factorial-moment contributions to match the genuine unordered compatible-triple statistic \`h(G)\`.

These are **PROVED_WRITTEN / FINITE_CHECKED**, but until Lean proves the fibre-size bijections, the exact general 2304 and 128 fibre-cardinality theorems are **OPEN_IN_LEAN**. Do not promote them merely because the finite check passed.

## Distribution check

Exhaustive enumeration for the named spider \`S(2,2,2,1)\` gives \`(N₀=0,1,2,3,4)\` counts \`(23424,13440,3072,384,0)\`. For path \`P8\`, counts are \`(31360,6528,2304,128,0)\`. The spider attains \`Pr(N₀=3)=384/40320=1/105\`, consistent with the certified \`h(namedSpider)=3\`.

## Genuine remaining Lean boundary

Formalise exact singleton/complementary 2304 and overlap-two/triple 128 event-fibre cardinalities via genuine 16-to-one and 576-to-one bijections; transfer them to true unordered first/second/third factorial moments; combine the now-written actual support bound with moment inversion; and state/prove one integrated four-probability theorem with equality iff actual graph isomorphism to the named spider. Supply the arbitrary-cap classification as an explicit hypothesis, **not** an axiom or unproved premise. Preserve the prohibition on affine translations masquerading as zero-fixing linear transformations.

The full manuscript theorem is **NOT END-TO-END LEAN VERIFIED** and Palomar preparation remains paused. Novelty/priority remain unresolved.
