# PDIC S014 — kernel-prove true 8! event fibres and full MIS probability moments

**INSTALLED AFTER S013; NOT EXECUTED.** The owner's next "run next session" directly executes S014. Follow AGENTS.md; automatic next-session prompt installation remains active. Work on the canonical Lean proof branch `session/s007-full-lean-flagship`, draft PR #4, **not** the historical main-branch PDIC.lean. Do not merge, prepare a narrower Palomar record, or submit the paper.

## Required preflight and current evidence

1. Read [S013 actual support and fibre proof note](S013_ACTUAL_N0_AND_EVENT_FIBRES.md), [S013 closeout](../sessions/S013_CLOSEOUT.md), `research/FLAGSHIP_THEOREM.md`, manuscript `paper/PDIC_S003R8_DRAFT.tex`, CLAIMS, ROADMAP, STATE and latest source. Inspect GitHub CI on the **exact current proof branch head**; do not infer kernel verification from a finite checker.
2. S012 has an exact-source hosted strict Lean **PASS** at `4c68728834570cb436944c407d700487c6448002`, [38938608949](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938608949), and finite [38938609119](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938609119).
3. S013's proof candidate introduces `pulledQuartet_eq_image`, `perm_finset_image_roundtrip`, `canonicalCapF3_perm_four_zero_iff_pulled` and `connected_labellingZeroMISCount_le_three` on branch commit `2a808e53cb7a763b54c53c4f06d12f7f64d3b113`; inspect [run 38945169850](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169850) before using it. If strict CI did not finish successfully, repair **this actual theorem first**, rerun strict Lean and axiom checks, then proceed.
4. S010 strictly certifies universal connected `h(G)=3 iff Nonempty (G ≃g namedSpider)`, [run 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168). S011 strictly certifies the genuine canonical F₃³ cap and `card (Equiv.Perm Vertex)=40320`, [run 38935115211](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211).

## Binding mathematical target

Close the **largest remaining mathematical obligation** of the complete first-paper flagship: convert the **real permutation-labelled zero-sum maximal-independent-four-set events** into honest kernel-checked 2304/128 finite-fibre equalities and graph-derived factorial moments, then (if possible in the same run) the *entire* four-term law:

\[
\begin{aligned}
M_1 &= 2m/35,\\
M_2 &= 2n_0/35+n_2/315,\\
M_3 &= h/315;\\
\Pr(N_0=0)&=1-M_1+M_2-M_3,\\
\Pr(N_0=1)&=M_1-2M_2+3M_3,\\
\Pr(N_0=2)&=M_2-3M_3,\\
\Pr(N_0=3)&=M_3\leq1/105,
\end{aligned}
\]
with equality in the final inequality **iff** the actual connected graph is isomorphic to the named spider. The graph invariants `m,n₀,n₂,h` must count genuine unordered graph-MIS sets/pairs/triples, not invented symbolic parameters.

## Ordered obligations (proof first, no administrative detours)

1. Prove the four pulled-back quartets `pulledQuartet e i` are **pairwise distinct** for every permutation, and turn the S013 support inclusion into an **actual cardinal equivalence** between zero-sum GraphMIS sets and the filtered 4-index family. Preserve `N₀≤3` as a public theorem without any graph enumeration.
2. Construct explicit **bijections** of 8! permutations with (a) the 70 four-subset images and their 576-element within/block fibres and (b) the 2520 ordered 2/2/2/2 block-image configurations and their 16-element within-cell fibres. In Lean show, for every fixed qualifying configuration, exactly 576 or 16 distinct permutations. No gigantic `decide` call over 40320 permutations as a substitute for proof.
3. Prove **actual fixed-event cardinalities**: singleton 2304; complementary pair 2304; prescribed 2-overlap pair 128; prescribed compatible triple 128. Derive event incompatibility for 1- and 3-overlap pairs, and noncompatible triples. All events are predicates on actual `Equiv.Perm Vertex` and cap sums of actual size-four vertex Finsets.
4. Prove the **genuine binomial/factorial moment identities** using the real GraphMIS family:
   `E[N₀]=2m/35`,
   `E[choose(N₀,2)]=2n₀/35+n₂/315`,
   `E[choose(N₀,3)]=h/315`.
   Account for unordered, distinct pairs and triples correctly; do not confuse 8 ordered quartet-image assignments with eight unordered graph triples.
5. Combine the true moment identities with the now established `N₀≤3` and the existing moment-inversion proof to state **one exported Lean flagship probability law**, with spider sharpness via `connected_h_three_iff_namedSpider`. If attempting arbitrary admissible caps, require a supplied proof of `ClassicalCapNormalForm` and use only zero-fixing `LinearEquiv`; do not declare cap classification as an axiom.
6. Run strict pinned `lake build`, `#print axioms` of every new public declaration, grep for `sorry`, `admit`, `native_decide`, `sorryAx`, compiler trust and custom axioms, all nine independent scripts including `verify_s011.py`, plus hosted exact-SHA CI. No status upgrade from compilation-only or finite-only evidence.

## If full closure remains open

Do not retreat to another graph-only theorem, Palomar packaging or manuscript polish. At minimum get a nontrivial **numerical fixed-event fibre** theorem (preferably the 576-preimage and 2304-singleton count) strictly kernel checked, plus the true quartet-index cardinal equivalence. Document the exact smallest unresolved Lean interface and make S015 attack it directly.

## Closeout

Commit mathematical proof source to the designated PR #4 branch, pinned hosted CI evidence and exact status to the main project claim register, `sessions/S014_CLOSEOUT.md`, README, ROADMAP, STATE and a substantive proof note. Automatically install an executable S015 prompt; **do not execute S015** without a later owner message. Keep the full probability theorem gate active, novelty/priority unresolved, and all external submissions paused without explicit owner authorisation.
