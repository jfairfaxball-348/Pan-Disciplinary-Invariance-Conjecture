# PDIC S019 — finish genuine unordered second and third moments, four-term law and spider sharpness

**INSTALLED AUTOMATICALLY AT S018 CLOSEOUT; NOT EXECUTED.** The next owner "run next session" authorises S019 immediately. Follow `AGENTS.md`. Automatic S020 executable-prompt installation at S019 closeout is mandatory. Do not execute S020 until separately requested. This remains **full flagship Lean formalisation**, not Palomar or manuscript packaging.

## Authoritative sources and proof branch
Use `session/s007-full-lean-flagship` and the unmerged [draft PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4), never the historically smaller `main:PDIC.lean`. Preflight `authoritative/STATE.json`, `research/FLAGSHIP_THEOREM.md`, `research/CLAIMS.md`, `research/S018_GRAPH_MOMENT_ASSEMBLY.md`, `sessions/S018_CLOSEOUT.md`, and `paper/PDIC_S003R8_DRAFT.tex`.

The graph-derived genuine M1 numerator `graphMIS_first_moment_numerator` is **LEAN_KERNEL_VERIFIED** at 31a7cbb3de72944b5cb99994132060795cd7184f, strict Lean run 38970442172 (standard `propext`, `Classical.choice`, `Quot.sound` only), finite run 38970442337. S018 additional rational `graphMIS_first_moment_eq` and unique disjoint-partner candidate source fe5d119af9a270a82fb7a854b9c004d5a4e041c6 must be checked and repaired if its exact hosted Lean workflow failed. At S018 writing the latest workflow-enabled proof head is 26a5f3b6c953872a459a457d593fb6cef620954c; never infer a CI pass for a newer head from an earlier SHA. Nine historical finite checkers plus the new full 40320-labelling spider independent checker are configured on this branch.

## Nonnegotiable complete flagship target

For every connected `SimpleGraph (Fin 8)`, quantify over genuine `Equiv.Perm (Fin 8)` uniformly sampled label permutations, genuine size-four `GraphMIS G s` vertex sets, and actual `labellingZeroMISCount G e`. Let
- `m` = cardinality of the genuine family `fourGraphMISFamily G`;
- `n₀` = number of unordered distinct graph-MIS pairs with zero overlap;
- `n₂` = number of unordered distinct graph-MIS pairs with two-element overlap;
- `h` = genuine unordered compatible triple count (existing `unorderedCompatibleTripleCount G`).

**Prove in Lean using real `Finset`/subtype families:**
```
sum_e N0(e,G)              = 2304*m
sum_e Nat.choose (N0(e,G)) 2 = 2304*n0 + 128*n2
sum_e Nat.choose (N0(e,G)) 3 = 128*h

M1 = 2*m/35
M2 = 2*n0/35+n2/315
M3 = h/315
(P0,P1,P2,P3) =
  (1-M1+M2-M3, M1-2*M2+3*M3, M2-3*M3, M3)
P3 ≤ 1/105
P3 = 1/105 ↔ Nonempty (G ≃g namedSpider).
```
Use existing strict `connected_labellingZeroMISCount_le_three`, `connected_h_three_iff_namedSpider`, universal cap-zero singleton (2304), disjoint-pair (2304), overlap-two pair (128), and compatible-triple (128) theorems rather than repeating their geometry.

## Ordered attack — proof first

1. **CI preflight**: audit final S018 proof head and exact workflow status; fix elaboration or theorem errors before promoting any candidate. Reject `sorry`, `admit`, `native_decide`, unapproved `axiom/constant`, nonstandard printed axioms. Pin precise source SHAs/runs.
2. **Define unordered events honestly**: a `Finset` of all `Finset (Finset Vertex)` two-element subsets of `fourGraphMISFamily G`, and similarly three-element subsets. Use `powersetCard`, subset/card equivalences and `Finset.card_powersetCard`; show each labelling's surviving subfamilies give `Nat.choose N0 2` and `Nat.choose N0 3`. No arbitrary choice of an order or sixfold triple inflation.
3. **Real pair incidence**: use S014 `canonicalCapF3_perm_distinct_pair_overlap_cases` to prove simultaneous cap-zero pair events vanish for overlap 1 or 3; 0 and 2 classes are disjoint. For genuine unordered two-element subfamilies, construct the source pair and transport certified S016/S017 event-card theorems, counting 2304 or 128 each. Double-count labelling/subfamily incidence to establish M2 and its exact rational denominator.
4. **Real triple incidence**: use S014 three-zero has disjoint pair and S018 disjoint-four-partner uniqueness to prove a compatible unordered three-family has **exactly one complementary pair**; the remaining set must meet each side in exactly two vertices. Transport S017 universal compatible-triple event count 128 and double-count the actual subfamilies to establish M3. Do not count disjoint-plus-skew (1+3 / 3+1) families: they are NOT compatible cap-zero triples.
5. **Integrated distribution**: binomial inversion for the kernel-proved N0≤3, with all four real event-probability subtype cardinalities and rational normalisation; exact P3 sharp equivalence using the already certified S010 graph isomorphism iff.
6. **Hostile audit**: independently test the spider and P8, including the actual 40320 permutations; check edge and graph-MIS conventions, pair/triple unordered normalization, and any false extrapolation. `scripts/verify_s018_spider_distribution.py` checks namedSpider exactly and is finite corroboration only. Classical arbitrary-cap normal form remains a supplied hypothesis `ClassicalCapNormalForm`, never a new axiom. No affine transfer.
7. **Strict verification**: full pinned `lake build`, `#print axioms` for each new public theorem, hole scan, ten independent Python checkers, hosted CI at the **exact proof SHA**. If the complete law cannot be closed, deliver kernel-certified M2 or M3 and identify the smallest remaining incidence equivalence, not a documentary substitute.

## Closeout required
Write `sessions/S019_CLOSEOUT.md`, mathematical proof note, update `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, and install a thorough executable S020 prompt automatically (do not execute S020). Preserve distinction `LEAN_KERNEL_VERIFIED / SOURCE_FORMALIZED / FINITE_CHECKED / OPEN` and exact-SHA links. No PR merge or Palomar/arXiv/journal submission without owner's explicit separate direction; novelty priority is unresolved.
