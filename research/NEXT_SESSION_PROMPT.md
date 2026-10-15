# PDIC-S003R — COMPLETE THE GRAPH–QUARTET FLAGSHIP LEAN PROOF

**STATUS: PREPARED, NOT EXECUTED.** Next owner's "run next session" authorises exactly S003R. **Do not start S004 until the graph bound and exact witness law are kernel checked.**

Repository: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture

## Starting state

S001 and S002 contain complete written mathematical proofs (S001 dependent on Follett et al. 2014, Prop. 2.2, nine-cap classification). S003 built a pinned Lean 4/Mathlib project and an initial explicit finite **canonical** cap/quartet/spider/moment package in `PDIC.lean`. Read **sessions/S003_CLOSEOUT.md** and its *actual hosted CI run conclusion* before treating these files as checked. A finite computational certificate is not a general graph proof or a source-level novelty audit.

## Primary objective — prove one mathematically complete exact theorem, no substitutes

1. **Truthful graph definition.** Prove the `isMIS4Bool` implementation corresponds iff to `IsMIS4` (size-four, independent, maximal) for an arbitrary symmetric simple adjacency matrix. Distinguish full `SimpleGraph` and 4×4 bipartite encodings; document a certified equivalence.
2. **Universal sharp bound.** Formalise connected 8-vertex graphs: `h(G) ≤ 3` and `h(G) = 3 ↔ G` is isomorphic to spider `S(2,2,2,1)`. The S002 graph-degree proof covers ℓ≤2, ℓ=3, and ℓ=4 (7/8 edges); you may instead kernel-check an exhaustive **all 65,536** 4×4 bipartite matrix certificate and a connected-bipartition uniqueness reduction. Merely proving the labelled spider has `mixedMisCount=3` is insufficient. `bv_decide`, `decide`, or trusted tactics producing kernel proof terms are permitted; `native_decide`, `sorry`, unapproved axioms and opaque Python-generated conclusions are not.
3. **Joint zero-witness law.** Formalise canonical `U0` with four exact zero quartets and the cardinality of labelled atom assignments/permutation fibres (including the 8/2520=1/315 triple event). Prove the exact N0 distribution for any connected 8-vertex graph from `m,n0,n2,h`; `four_point_moment_inversion` is already a supporting algebraic lemma. The graph max-three bound and moment identities must be proved, not assumptions disguised as the flagship.
4. **Sharp probability corollary.** Derive `Pr(N0=3) ≤ 1/105` with equality iff spider, using exact finite cardinality statements; do not assert all arbitrary admissible caps classified in Lean unless the classical classification input itself is formalised or explicitly a hypothesis.
5. **Optional once core passes:** greedy law under at-least-one-edge hypothesis; signed mod-three three-channel pebble conservation. Edgeless graph and fixed-cap nonzero-charge uniformity counterexamples are mandatory guards.

## Execution and exit

- Inspect `AGENTS.md`, `ROADMAP.md`, `authoritative/STATE.json`, `research/FLAGSHIP_THEOREM.md`, `research/S002_GREEDY_CHARGE_SPIDER_PROOF.md`, `research/S001_CAP_RIGIDITY_PROOF.md`, `research/CLAIMS.md`, `PDIC.lean`, `lakefile.toml`, `lake-manifest.json`, `.github/workflows/lean.yml`, and `scripts/verify_s002.py`.
- Run `lake build`; inspect completed GitHub Actions jobs, their actual conclusion and failure logs; run three finite scripts. Check all relevant `#print axioms`, explicitly rejecting `sorryAx` and other unapproved axioms.
- If the full flagship succeeds, update claims, state, README, roadmap, closeout and the S004 paper prompt. If it fails, report exact checked subclaims and remaining obligations, and prepare a focused proof-completion session rather than silently publishing.
- Stop after **one** S003R session. No Palomar/arXiv/journal correspondence.

Mathematics is in `research/S002_GREEDY_CHARGE_SPIDER_PROOF.md`; classical classification source is Follett et al. (2014), DOI 10.1016/j.disc.2014.08.002. Source commits are pinned in `research/PROVENANCE_AND_SOURCES.md`.
