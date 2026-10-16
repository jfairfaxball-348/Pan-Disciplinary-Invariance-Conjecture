# PDIC S016 — verify singleton fibre, close 128-events, and integrate full probability law

**INSTALLED AFTER S015; NOT EXECUTED.** The owner's next "run next session" authorises S016 on `session/s007-full-lean-flagship`, draft PR #4. Follow AGENTS.md. Automatic handoff generation remains active. No PR merge, public Palomar registration, arXiv or journal submission.

## Exact opening gate

1. Read `sessions/S015_CLOSEOUT.md`, `research/S015_SINGLETON_EVENT_PROOF.md`, current proof-branch `PDIC.lean`, `research/FLAGSHIP_THEOREM.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, `ROADMAP.md` and manuscript.
2. Check hosted **exact commit SHA** Lean run before promoting any S015 theorem; finite-check PASS is not Lean-kernel PASS. The S015 candidate package includes `canonicalTwoQuartetImageStabilizer_card=16`, transitivity of permutation action on 4-subsets, general 576 four-set→quartet image fibres and candidate `canonicalCapF3_perm_singleton_event_card=2304`. Early S015 commits failed elaboration; repairs were pushed, and verification status must be determined from actual hosted workflow evidence.
3. If strict Lean fails, fix the earliest compiler diagnostic, rerun kernel, source-hole and standard-axiom audit, and **do not skip** this proof gate for moment formalisation.

## Binding mathematical target

Prove the genuine probability law for each connected `SimpleGraph (Fin 8)` with the uniform actual `Equiv.Perm (Fin 8)` canonical admissible cap:

- fixed quartet singleton event 2304/40320 = 2/35;
- genuine disjoint complementary pair event 2304/40320 = 2/35;
- genuine distinct overlap-two pair and compatible unordered triple event 128/40320 = 1/315;
- inadmissible pair/triple events zero;
- exact unordered size-four maximal-independent-set moments `M₁=2m/35`, `M₂=2n₀/35+n₂/315`, `M₃=h/315`;
- complete four-term probabilities `P₀=1−M₁+M₂−M₃`, `P₁=M₁−2M₂+3M₃`, `P₂=M₂−3M₃`, `P₃=M₃≤1/105`, equality iff `Nonempty (G ≃g namedSpider)`.

## Ordered Lean obligations

1. Reuse the S014/S015 actual 576 and 16 stabilizer transports, not abstract invented probability variables. Resolve/verify the 2304 singleton theorem first.
2. Prove an **actual two-quartet fibre equivalence** for arbitrary two-overlap source pairs and each of the eight appropriate ordered canonical target pairs; turn the 16-member stabilizer into **128** by explicit disjoint choice of canonical target pairs. Prove complementary-pair event count **2304**, and compatible-triple count **128** using the true cap quartet incidence.
3. Formalise true unordered graph-MIS pairs and triples with correct symmetric-family accounting; sum their real events across the **40320 actual permutations** and derive the three factorial moment identities. Use the existing STRICT S010 graph h=3 iff named-spider theorem and S013 N₀≤3.
4. Export a **single complete end-to-end flagship Lean theorem** matching the manuscript, with the arbitrary-cap extension only conditional on a supplied `ClassicalCapNormalForm` witness. Never add it as an axiom.
5. Verify pinned `lake build`, `#print axioms`, no `sorry`, `admit`, `native_decide`, compiler-trust bypass or custom axioms, all nine independent Python checkers and exact-SHA hosted CI. Separate finite evidence from kernel proof.

If the full integration is still open, prioritise **the actual 128 overlap-two fibre theorem** as the minimum nontrivial strict increment. Document the smallest obstruction and install the next numbered S017 prompt rather than retreating to a graph-only/administrative result.

## Closeout

Commit mathematical source, S016 proof note, session closeout, claims/readme/roadmap/state, exact hosted evidence and automatically install an executable S017 prompt. Do **not** execute S017 without the next owner instruction. Preserve novelty/priority reservations and the external-submission hold.
