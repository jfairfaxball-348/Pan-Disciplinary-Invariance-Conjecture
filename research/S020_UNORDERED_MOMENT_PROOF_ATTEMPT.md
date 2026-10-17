# S020 — genuine unordered M₂ assembly and compatible-triple fibre

**Executed:** 17 October 2026. **Lean source branch:** `session/s007-full-lean-flagship`, draft PR #4. **Status:** `SOURCE_FORMALIZED / CI_UNVERIFIED` for all new S020 Lean declarations. Do not promote them to kernel-verified status without an exact-source successful hosted Lean job. The last strict, independent Lean certificate remains S019 at `e981acac25b8106e4b4df782340217ed948445bb` ([strict Lean success 38978027666](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027666); [ten-checker success 38978027657](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38978027657)).

## New source-bearing declarations

- `UnorderedPairOverlap T k`: invariant predicate, requiring **every ordered choice of distinct members** of an unordered two-element family `T` to intersect in exactly `k` vertices.
- `unorderedPairOverlap_pair_iff`: relates this invariant predicate to either representative ordered pair `{s,t}`.
- `graphMIS_pairOverlapCount G k`: actual `powersetCard 2` family cardinal filtered by overlap class.
- `graphMIS_second_moment_numerator`: proposed real graph-MIS count
  `∑ₑ choose(N₀(e,G),2) = 2304 * pairCount(G,0) + 128 * pairCount(G,2)`.
- `graphMIS_second_moment_eq`: proposed honest rational normalisation `M₂=2*n₀/35+n₂/315`, dividing the true permutation sum by exactly 40320.
- `graphMIS_unordered_compatible_triple_event_card`: proposed fibre count **128** for any *genuine* unordered compatible three-MIS family, reducing its quantified-all-members event to the previously certified prescribed triple event.

Proof source commits: [6a8ddd69](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/6a8ddd69b636ce523f7aa0c599e59c0fe07b7186), [cba4eede](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/cba4eedef0033ec828c66593f8cf35aba3d45fa1). Additional finite checker source: [afc1ecd8](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/afc1ecd80909d32a7e5cabf18df0044ccae9e696). **No local Lean executable was available. The GitHub workflow-run lookup returned no inspectable PR run for the new SHAs (the same lookup also returned none for the separately documented S019 SHA).** This is an evidence-visibility limitation, not a proof of success or failure. These declarations need actual hosted Lean certification.

## Unordered pair summation — mathematical argument

For each actual `T ∈ (fourGraphMISFamily G).powersetCard 2`, choose its two different members temporarily as `s,t`. S019 proves their event fibre is 2304 when `|s∩t|=0`, 128 when `|s∩t|=2`, and zero otherwise. The predicate `UnorderedPairOverlap T k` is independent of that temporary choice, so its overlap-zero and overlap-two classes are disjoint. Rewriting the event cardinality as `2304*[overlap zero]+128*[overlap two]`, summing over **one unordered T at a time**, and using S018's all-k incidence identity gives

\[
\sum_{e\in S_8}\binom{N_0(e,G)}2
=2304 n_0(G)+128 n_2(G).
\]

There is no factor two for the order of `s,t`. Divide by 40320 to get `M₂=2n₀/35+n₂/315`. The source encodes this proof but must still pass Lean.

## Unordered triple — precise next incidence equivalence

For any genuine unordered `T` with three distinct four-MIS, a nonempty joint cap-zero event has a disjoint pair by S014's already kernel-proved triple-disjoint-pair theorem. With eight vertices, disjoint four-sets are complementary; the remaining third member `r` must intersect each in two vertices. Indeed, S019's pair-overlap classification forces `|s∩r| ∈ {0,2}`; if it were zero, unique disjoint-four partner would force `r=t`, contradicting distinctness. The complementary partition then forces `|t∩r|=2`. Thus `T` satisfies the existing **genuine** `IsUnorderedCompatibleTriple G T`, rather than an ordered proxy. Conversely, each compatible `T` has exactly 128 joint-event permutations by the new S020 source-level lemma and certified S017 specified-triple fibre. Non-compatible `T` has zero joint event. After the equivalence and true filtered-family cardinality are proved, S018's `k=3` double count implies

\[
\sum_{e\in S_8}\binom{N_0(e,G)}3
=128\,h(G).
\]

**This global triple theorem is still OPEN_IN_LEAN**, not to be inferred from the new one-direction compatible-triple lemma.

## Independent finite corroboration

A new branch script, `scripts/verify_s020_unordered_moments.py`, exhausts the 40320 actual labellings of each of the two graphs, constructs genuine 4-MIS by independence **and maximality**, independently constructs `n₀,n₂,h` as unordered combinations, and checks both numerical factorial-moment identities:

| Graph | (m,n₀,n₂,h) | histogram (N₀=0,1,2,3) | M₂ numerator | M₃ numerator |
|---|---|---|---:|---:|
| Spider S(2,2,2,1) | (9,1,15,3) | (23424,13440,3072,384) | 4224 | 384 |
| P8 | (5,1,3,1) | (31360,6528,2304,128) | 2688 | 128 |

These calculations were independently executed locally and passed. They remain **FINITE_CHECKED**, not universal Lean proof or hosted-script certification.

## Mandatory remaining tasks

1. Obtain a fresh strict **exact-source** GitHub Actions Lean job for the current proof branch; fix elaboration, proof search, and forbidden-token scans if any S020 code fails, and inspect `#print axioms` (only propext, Classical.choice, Quot.sound).
2. Prove the *converse* triple-event classification and the **full** `128*h` unordered third numerator, without overcount.
3. Derive `M₃=h/315`, invert actual distributions using connected `N₀≤3`, prove **all four** probability identities as statements of actual sample probabilities, not abstract ring identities.
4. Combine with the already kernel-certified `h≤3` and `h=3 ↔ G ≃g namedSpider` to prove `P₃≤1/105` with equality iff the named spider.
5. Retain arbitrary-cap normal form solely under the explicit supplied `ClassicalCapNormalForm` hypothesis; maintain novelty/priority as unresolved.

No PR merge, Palomar registration or public submission was performed. S021 is installed as the next owner-triggered session.
