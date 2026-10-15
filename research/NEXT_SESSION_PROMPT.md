# PDIC-S003 — FORMALISE THE SHARP ZERO-CHARGE QUARTET–SPIDER THEOREM IN LEAN 4

**STATUS: PREPARED, NOT EXECUTED.** The owner's next “run next session” authorises exactly S003 without another confirmation. Do **NOT** start S004 during the same invocation.

Repository: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture

## READ AND PIN

Read AGENTS.md, README.md, ROADMAP.md, authoritative/STATE.json, research/FLAGSHIP_THEOREM.md, research/CLAIMS.md, research/S001_CAP_RIGIDITY_PROOF.md, **research/S002_GREEDY_CHARGE_SPIDER_PROOF.md**, research/PROVENANCE_AND_SOURCES.md, sessions/S002_CLOSEOUT.md, scripts/verify_s000.py, scripts/verify_s001_independent.py, scripts/verify_s002.py and .github/workflows/finite-lead-check.yml.

Pinned source inputs remain: Inverse-Zero-Sum-Research `496cefb8e0672d069991f759adbfbc954b70f471`; Greedy-Uniformity-on-Trees `a4c4493a5fff82dfb085f59de41393b862af63a3`; TreeStack `e1e437b8d02552b7c7ee0c4c74041b6ac956f063`. Source geometry: Follett et al. (2014), *Discrete Mathematics* 337, Proposition 2.2(1), DOI 10.1016/j.disc.2014.08.002.

## PRIORITY: ONE REAL KERNEL-CHECKED THEOREM PACKAGE

S002 has a complete informal proof of:

1. On connected 8-vertex G, for the family F of four-element **maximal** independent sets and a uniform admissible cap bijection, N0 is in {0,1,2,3}. Write `m=|F|`, `n0,n2` for unordered pair counts of overlaps 0 and 2, `h` for triples containing a unique disjoint pair and a 2+2 splitter. With `M1=2m/35, M2=2n0/35+n2/315, M3=h/315`, prove the four exact distribution values `(1-M1+M2-M3, M1-2M2+3M3, M2-3M3, M3)`.
2. **Sharp theorem** `h<=3` and `h=3 iff G ≃ spider S(2,2,2,1)` for connected G, hence `Pr(N0=3)<=1/105` and exact equality classification.
3. Supporting exact greedy formula for 8-vertex graphs **with at least one edge**, and three signed mod-three tree-pebbling channel invariants.

The **nonroutine flagship** is (1)+(2), not an elementary conditional expectation lemma.

### Formalisation sequencing

**First, define finite objects truthfully.** Use Mathlib/Lean 4 with reproducibly pinned lean-toolchain/lake-manifest; finite vertices `Fin 8`, graph `SimpleGraph (Fin 8)`, 4-subsets as `Finset (Fin 8)` with cardinality proof, `IsMIS4` as independence **and maximality**, canonical C4 quartet family as four explicit 4-subsets, and overlapping-pair and complementary-splitting triple counts. The fixed canonical cap `U0={(x,y,x^2+y^2): (x,y)≠(0,0)}` can be encoded by 8 explicitly defined vectors in `(ZMod 3)^3` or an equivalent trusted finite type. State distinctly the abstract-incidence theorem and the concrete canonical U0 corollary; do not assume all caps are equivalent through an invented axiom.

**Then prove the abstract quartet counting lemmas.** Prove four quartets, pair intersection 0/2 and unique disjoint-pair triple pattern; prove the cardinality ratios 4/70=2/35 and 8/2520=1/315 from explicit bijections or a kernel-checked finite enumeration. Prefer an integer cardinality theorem before introducing `PMF`/measure theory. A theorem over finite permutations using cardinality of satisfying permutations is sufficient to state the exact law; no need to fight an overly general probability library.

**Prove the graph bound.** For connected balanced bipartite graphs of 4+4 vertices and mixed 2+2 MIS, prove the degree lemma `b<=3`, equality iff spider. S002 contains the non-enumerative case proof: low-degree count <=2, =3, =4; in the =4 case only 7/8 edges and graph contraction. A kernel-proof of a sound finite 4x4 bipartite matrix exhaustive lemma may replace those cases if it is genuinely checked in Lean under an allowed kernel tactic and auditable. Do not invoke `native_decide`, `sorry`, `admit` or hide unproved assumptions. Reconcile the connected graph theorem via uniqueness of connected bipartition.

**Finally** formalise the N0 binomial-moment inversion and spider consequence. Add independent supporting lemmas of greedy-size transfer and channel residue invariance if this does not jeopardize finishing the core. Keep the dependency order graph/quartet flagship -> auxiliary greedy/pebbling -> presentation.

### Signature sketch only — refine to compile, do not advertise these as already checked

```lean
namespace PDIC
-- Define CapU, Quartet, IsMIS4, MixedMISCount, TriplePatternCount explicitly.
theorem canonical_quartet_incidence : ... := by ...
theorem quartet_triple_joint_count : ... := by ...
theorem mixed_mis_bound (G : SimpleGraph (Fin 8)) (hconn : G.Connected) :
    MixedMISCount G ≤ 3 := by ...
theorem mixed_mis_eq_three_iff_spider (G : SimpleGraph (Fin 8))
    (hconn : G.Connected) :
    MixedMISCount G = 3 ↔ Nonempty (G ≃g spider8) := by ...
theorem zero_witness_count_distribution (G : SimpleGraph (Fin 8))
    (hconn : G.Connected) : ... := by ...
theorem signed_mod_three_charge_invariant : ... := by ...
end PDIC
```

Sketch contains placeholders **only in this instructions document**; no source theorem with `sorry`/`admit` or a strengthened false claim is to be called complete. `≃g`, graph connectedness and `spider8` must be defined with actual installed Mathlib APIs; inspect existing Mathlib and source library rather than guessing signatures.

### Strong honesty gates

- The S001 all-702-cap orbit depends on a classical theorem **not yet formalised in this repo**; a Lean theorem assuming an arbitrary asserted cap-classification proposition is CONDITIONAL, not a Lean proof of the classical classification. A canonical U0 proof + abstract quartet pattern proof is a legitimate checked kernel package, but do **not** describe that as fully formalising the all-caps statement until a concrete extension is proved.
- The exact rational law can be expressed as finite permutation counts to avoid fragile measure libraries. Every denominator and total number of permutations must be verified.
- **Counterexample gates:** edgeless graph breaks greedy 2/35 law; arbitrary fixed cap does not force nonzero-charge uniformity; disconnected graphs can admit four quartets; non-bipartite graphs cannot have triple saturation.
- The spider must be the unique equality graph up to isomorphism; merely exhibiting it proves sharpness, not uniqueness.
- Use no forbidden placeholder, unapproved `axiom`/`constant`/`opaque` assumptions, or `native_decide` in advertised theorem dependency closure. Audit theorem axioms (`#print axioms`), source grep and compiled import graph.

## EXECUTION AND VERIFICATION

1. Create the smallest legitimate Lean project, pin versions, build modules using `lake build` locally or through GitHub Actions. GitHub Actions is explicitly permitted to run tests if local Lean tooling is missing.
2. Run all three finite scripts. Hosted PASS requires inspection of the actual GitHub workflow **run conclusion** and ideally the new commit's run; workflow definition alone does not prove pass.
3. Show exact theorem names/signatures, compile logs, axiom audit and exact commit IDs. If core theorem cannot be checked in one session, report precisely which parts are kernel-proved and which remain open; do **not** start S004 under pretence of success. Prepare a repair/proof-completion next prompt in that case.
4. Update authoritative/STATE.json, README.md, ROADMAP.md, research/CLAIMS.md, a fully detailed sessions/S003_CLOSEOUT.md, and research/NEXT_SESSION_PROMPT.md for S004 **only if** Lean core is genuinely checked (otherwise prepare S003R proof completion).
5. **Stop after S003**. No Palomar, arXiv, manuscript submission, external correspondence or further session unless separately instructed.

Mathematical reference: [research/S002_GREEDY_CHARGE_SPIDER_PROOF.md](S002_GREEDY_CHARGE_SPIDER_PROOF.md); exact reproducibility: [scripts/verify_s002.py](../scripts/verify_s002.py).
