# PDIC S011 — admissible eight-cap incidence and uniform-label bridge (full flagship Lean)

**INSTALLED AFTER S010; NOT EXECUTED.** The owner saying "run next session" starts S011. Work on `session/s007-full-lean-flagship` (PR #4) from the S010 strictly checked graph theorem; the proof-bearing exact source is `c8c64e5a2a98ee359c79430293ca0738211b4215` with [Lean kernel PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168) and [all eight independent checkers PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965172). The main branch still carries an older historical `PDIC.lean`; do not formalise against that source. Automatically install a complete S012 prompt at closeout, but do not execute it without a subsequent owner instruction.

## Binding mathematical objective

The entire first-paper probability law—not another graph-only theorem—is the gate. For any connected `G : SimpleGraph (Fin 8)` and uniform bijection from the vertices to an admissible eight-point cap `U ⊆ (ZMod 3)^3`, the labelled number `N₀` of four-element maximal independent sets whose labels sum to zero must satisfy

```
M₁ = 2*m/35, M₂ = 2*n₀/35 + n₂/315, M₃ = h/315
Pr(N₀=0) = 1-M₁+M₂-M₃
Pr(N₀=1) = M₁-2*M₂+3*M₃
Pr(N₀=2) = M₂-3*M₃
Pr(N₀=3) = M₃ ≤ 1/105,
equality iff Nonempty (G ≃g namedSpider).
```

Here `m` counts four-MIS, `n₀` and `n₂` count genuine unordered pairs of distinct four-MIS with intersection zero or two, and `h` is the genuine unordered compatible-three statistic already certified. Do **not** count ordered pairs/triples, lose 3+1 or 1+3 spider MIS, or pretend that conditional rational moment inversion is the probability model.

## Primary S011 construction (proof-first and executable)

1. Read `AGENTS.md`, `authoritative/STATE.json`, `research/FLAGSHIP_THEOREM.md`, `research/CLAIMS.md`, `paper/PDIC_S003R8_DRAFT.tex`, S010 closeout and actual certified branch source. Verify exact signature/axioms of `connected_h_three_iff_namedSpider` and `connected_unorderedCompatibleTripleCount_le_three`.
2. Define genuine `CapPoint := Fin 3 → ZMod 3` (or definitionally equivalent `Fin 3` vector) and `CapAdmissible U`: eight distinct nonzero points with no zero-sum subset of size 1, 2, 3. Connect the existing coordinatewise `canonicalCap : Fin 8 → Fin 3 → ℕ` via reduction mod 3, and prove canonical cap injectivity/admissibility and four-point zero-sum ↔ one of the four canonical quartets. Use no fabricated cap classification proof.
3. State the classical nine-cap classification / zero-fixing transfer as an **explicit hypothesis on the mathematical theorem or supplied equivalence**, not a Lean `axiom`, a global `constant`, or a claim of new original formalisation. Specify precisely the needed linear equivalence: any admissible U is the image of the canonical eight-cap under a zero-fixing `GL(3,3)` transformation (possibly after a suitably proved cap automorphism). Prove that a supplied linear equivalence preserves cardinality and zero-sum quadruples. Do not assume arbitrary affine translation preserves zero sums.
4. Define the **actual uniform sample space** `Equiv.Perm (Fin 8)` or an honest finite type of bijections `Fin 8 ≃ U`; prove its cardinality 8!=40320 (or equiprobability under explicit finite uniform measure). Construct the partition into four 2-point atoms, show each image of a prescribed overlap-two pair or compatible unordered triple has exactly 16 bijection fibres, and derive probabilities 2/35, 2/35, 1/315 for the relevant singleton, disjoint-pair, and compatible-three events. Count the eight favourable ordered quartet image triples carefully and do not equate ordered and unordered indices.
5. Reuse the existing abstract four-MIS predicates and counting equivalences. Establish genuine falling-factorial/binomial moment identities, prove `N₀ ≤ 3` for every labelling, and, if feasible in S011, compose all four probabilities plus graph sharpness into a single strictly checked public theorem. If the full probability model is not completed, finish the **largest kernel-verified nontrivial bridge** and pin the next exact blocking lemma rather than generating paper/admin tasks.
6. Run pinned `lake build`, strict `#print axioms`, all eight Python checkers and hosted CI on the exact source SHA. Standard `propext`, `Classical.choice`, `Quot.sound` only. No `sorry`, `admit`, `native_decide`, custom axioms, or unapproved compiler trust. Distinguish PROVED_WRITTEN_WITH_CLASSICAL_INPUT, FINITE_CHECKED, LEAN_KERNEL_VERIFIED, CONDITIONAL, OPEN.

## Closeout and automatic follow-up

Update `sessions/S011_CLOSEOUT.md`, claims, README, ROADMAP, `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md`, installing a substantial executable **S012** directed at the greatest residual obligation of the complete four-term theorem. A document alone is not a mathematical increment. No automatic execution of S012. Palomar, PR merge, arXiv, journal, external correspondence remain paused absent explicit instruction; priority/novelty unresolved.
