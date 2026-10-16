# PDIC S012 closeout — permutation probability interface and quartet obstruction

**Executed 16 October 2026** on the designated proof branch `session/s007-full-lean-flagship`, open draft PR #4.

**New committed source**: [`4c68728834570cb436944c407d700487c6448002`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002) (following five source-edit commits). Adds true permutation sum reindexing candidates, four-zero iff after permutation/linear transport, an actual sample-space event probability, `N₀(e,G)`, a named conditional classical cap normal form, and connectedness obstructions for both fixed and permuted quartets.

**Mathematical increment**: The two complementary pairs Q₀/Q₃ and Q₁/Q₂ cannot simultaneously be independent for any connected graph, by the previously verified uniqueness of its proper independent bipartition. The pulled-back form applies at every labelling. This is the structural core of the still-unproved `N₀≤3` count inequality.

**Strict verification boundary**: S011 base exact-source [`7f7e32d`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7f7e32dda87983c3df619481693af5a4baff5bfd) / [38935115211 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211) remains certified. A new S012 hosted run was not returned by commit-workflow lookup at closeout and local Lean/lake was unavailable. **Do not promote any newly added declaration to LEAN_KERNEL_VERIFIED until exact-source compilation and `#print axioms` both pass.** See [S012 proof note](../research/S012_PERMUTATION_AND_SUPPORT_PROOF.md).

**Incomplete full theorem**: no kernel-checked 2304/128 event fibres; no actual N₀≤3 cardinal proof; no genuine pair/triple factorial moment identities; no four-term law; no single all-cap flagged theorem. S011's independent 40320 enumeration is FINITE_CHECKED, not a replacement for these obligations. Novelty/priority and external classical cap normal-form existence remain unresolved.

**Automatic handoff**: [S013 proof-completion prompt](../research/NEXT_SESSION_PROMPT.md) is installed for the *next* owner 'run next session' only. Start by inspecting/repairing S012 exact-source CI, then attack the missing cardinal-bijection, event fibres and moment assembly. S013 has **not** been executed. No merge, Palomar registration or publication action performed.
