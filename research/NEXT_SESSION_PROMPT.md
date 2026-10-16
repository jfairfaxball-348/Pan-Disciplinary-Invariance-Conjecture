# PDIC S012 — complete uniform-label fibres, connected support bound and probability moments in Lean

**INSTALLED AFTER S011; NOT EXECUTED.** The owner's next "run next session" executes S012 on the canonical proof branch `session/s007-full-lean-flagship` (open PR #4). S011 source at [e302e5f82434b3d8790c81506fe55062700e7a53](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53) has STRICT LEAN PASS [38934564596](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596). The independent checker `scripts/verify_s011.py` enumerates all 40320 labellings, checks each 16-to-1 event fibre, and checks complete spider and P8 distributions; this is FINITE_CHECKED rather than universal Lean. The full paper theorem remains OPEN_IN_LEAN.

## Mandatory mathematical target

For connected `G : SimpleGraph (Fin 8)`, uniformly selected `e : Equiv.Perm Vertex`, and the genuine typed canonical cap `canonicalCapF3`, define `N₀(e,G)` as the number of size-four `GraphMIS G` subsets whose `capSum (fun v => canonicalCapF3 (e v)) s = 0`. Construct proofs rather than postulate the expected law:

```
M₁ = 2*m/35
M₂ = 2*n₀/35 + n₂/315
M₃ = h/315
Pr(N₀=0)=1−M₁+M₂−M₃
Pr(N₀=1)=M₁−2*M₂+3*M₃
Pr(N₀=2)=M₂−3*M₃
Pr(N₀=3)=M₃≤1/105
with equality iff Nonempty (G ≃g namedSpider).
```

The graph extremiser `connected_h_three_iff_namedSpider` is already LEAN_KERNEL_VERIFIED at S010. The S011 cap point/admissibility/four-zero/GL transport statements are now certified; reuse them. Do not retreat to an abstract moment inversion pretending it is a distribution theorem.

## Proof-critical tasks, in order

1. Recheck exact branch head and pinned S010/S011 certificates, the manuscript, `AGENTS.md`, `authoritative/STATE.json`, `research/CLAIMS.md`, and the existing actual unordered `CompatibleTriple` and `GraphMIS` predicates. Preserve all approved proofs. If S011 latest hosted checker integration has failed or is pending, diagnose/repair it first without relabelling earlier source PASS as new proof.
2. Prove a **permutation transport lemma**: for any `e : Equiv.Perm Vertex` and four-set `s`, the typed `capSum` over `canonicalCapF3 ∘ e` is zero iff `s.image e` equals one of the four `quartet i`. Prove sum reindexing using the actual equivalence, injectivity and `Finset.card_image`. The external nine-cap theorem is *not* required for this canonical reduction.
3. Define a genuine finite probability function using `Fintype.card (Equiv.Perm Vertex)=40320` with actual `Finset.univ.filter` cardinalities, not a conditional abstract `M₁,M₂,M₃`. Prove that the prescribed singleton event has 2304 good labellings and that the event of a prescribed disjoint complementary pair also has 2304. For prescribed overlap-two pairs and compatible triples, give a **bijective 16-fibre theorem**: precisely 2520 possible ordered image configurations, each with `(2!)^4=16` permutations; exactly eight images are favourable, hence 128 labellings, probability 1/315. The 8 ordered images are not the graph's unordered triples.
4. Prove the **connected-graph support bound `N₀ ≤ 3`** for each permutation. If all four canonical quartets were graph-independent, every possible edge between the two nonempty four-vertex blocks `{0,1,2,3}` and `{4,5,6,7}` would be forbidden; there would be no crossing edge and the graph would be disconnected. Transport this fact under `e`; do not assume that 3+1 and 1+3 spider MIS do not exist.
5. Derive the **real unordered** factorial moments by summing actual event indicators over the size-four `GraphMIS` family, unordered distinct pairs split into overlap 0/2 (others zero), and unordered compatible triples. Match existing `unorderedCompatibleTripleCount`. Use the already kernel-certified `four_point_moment_inversion` only after the moment identities and support bound are proved. Compose the complete distribution, rational ≤1/105 and named-spider iff as a single public Lean theorem.
6. State **classical nine-cap classification as an explicit theorem hypothesis**, not a declaration of an axiom: any admissible labelled cap f admits some invertible zero-fixing linear equivalence `L : CapPoint ≃ₗ[ZMod 3] CapPoint` and some permutation `p : Equiv.Perm Vertex` with `f v = L (canonicalCapF3 (p v))`. Prove all-cap probability invariance from S011 linear transport and the permutation sample-space bijection. Arbitrary affine translations do not preserve zero-sum quadruples.
7. Run the pinned `lake build`, check `#print axioms`, scan for unapproved holes/trust, run all nine independent checkers including `scripts/verify_s011.py`, and obtain exact-source hosted CI PASS. Separate LEAN_KERNEL_VERIFIED, FINITE_CHECKED, CLASSICAL_INPUT, OPEN. If the full theorem does not close, prioritise and kernel-certify the largest nontrivial missing lemma and describe the smallest remaining obstruction.

## Closeout discipline

Update source, `sessions/S012_CLOSEOUT.md`, proof notes, `research/CLAIMS.md`, README, ROADMAP, `authoritative/STATE.json` and next-session control. Automatically install and commit a complete S013 proof-critical prompt, but **do not run S013** without the owner directing it. Do not merge the draft PR, register Palomar or submit a paper without explicit authorisation. Novelty/priority remain unresolved.
