# PDIC S029 — finish trusted eighteen-tail classification, orbit and unconditional flagship

**Installed from S028 closeout; NOT EXECUTED.** The next owner "Run next session" authorizes immediate execution. Scope is strictly full Lean formalisation of the existing first-paper theorem in `research/FLAGSHIP_THEOREM.md`. No new mathematical result, Palomar, publication, correspondence, or PR #4 merge. Follow `AGENTS.md`.

## Evidence to inherit and recheck

- Canonical proof branch `session/s007-full-lean-flagship`, draft PR #4, carries genuine normalization of arbitrary admissible eight-caps, 18 positive tails, bijective 17-point representation, first-/second-index partitions, and certified survivor counts for first indices 4–16 (S027).
- S028 strictly **certified** eleven corrected pair-shard cardinalities: exact validation proof blob `3130b682596bba3ef3746a975d9422fc1181b722`, [Lean 39112520609 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39112520609). S028 also strictly **certified** the filtered first-index-to-second-index survivor union `s028_first_survivors_split`, [Lean 39112524267 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39112524267), promoted canonical commit `fabb6135d2ced461481c3dce59898953d6d4d61c`. Both reports have standard approved axioms only and all independent finite scripts PASS. Consult `sessions/S028_CLOSEOUT.md` and `research/S028_LEAN_PROOF_NOTE.md` for exact scope. Neither is yet the 18-case classification.
- The known finite ground truth is 6,188 indexed five-subsets of 17 eligible points and exactly 18 admissible normalized tails. By first index, survivors are [5,5,5,1,1,0,0,0,1,0,0,0,0,0,0,0,0]. Their nonzero (first,second) counts are (0,3)=1,(0,4)=1,(0,5)=1,(0,6)=1,(0,11)=1; (1,3)=1,(1,4)=1,(1,5)=1,(1,7)=1,(1,11)=1; (2,3)=2,(2,4)=2,(2,12)=1; (3,5)=1. These are independent finite results, **not** built-in proof facts.

## Principal Lean obligations, in order

1. **Reuse the now certified S028 eleven pair-shard certificates and filtered survivor-union theorem.** Verify every still-missing pair shard using true `s027SecondIndexShard`, `s027FreePointAt`, and `s027ShortZeroFree`, with subcases of at most 455 candidates; avoid a single 6,188-case kernel decision.
2. Prove **coverage and unique least/second indices** of the indexed five-sets. Derive pairwise disjointness of unequal first/second shards and cardinal additivity. Do not infer total count from merely listing successful local checks.
3. Obtain exact Lean cardinalities for all first indices 0–3, and the existing first-index results 4–16. Prove `s027NormalizedAdmissibleTails.card = 18` from the certified indexed-set equivalence, filtered union, disjointness and shard counts.
4. Combine cardinality with `s027_eighteen_tails_subset_filtered_candidates` and the separately proved 18-entry table cardinal to prove the **unconditional equality** `s027NormalizedAdmissibleTails = s025NormalizedTails`. No external finite/classification premise may remain.
5. Repair/certify the typed zero-fixing GL witness composition `s027_image_orbit_of_tail_classification`. Instantiate its hypothesis with the actually proved classification equation, prove `admissibleCapImageOrbit_proved` and `classicalCapNormalForm_proved`. Keep temporary experiment PRs unmerged.
6. Export `connected_graphMIS_complete_flagship_unconditional_all_caps` without `hnf` or replacement assumptions, preserving the real 40,320-permutation graph-MIS P0–P3 distribution, `N0≤3`, P3=h/315≤1/105 and equality iff graph isomorphic to the named S(2,2,2,1) spider. The conditional existing S023 four-term theorem must be instantiated, not weakened.

## Strict certification and closeout

At the **exact** final proof SHA run pinned `lake build`, `lake env lean S024.lean`, hole scan in **both** `PDIC.lean` and `S024.lean`, `#print axioms` on every new public theorem including the unconditional flagship (only `propext`, `Classical.choice`, `Quot.sound`), and all independent finite scripts. Reject `sorry`, `admit`, `native_decide`, custom axioms, or a runner-exit-143 attempt as proof. Inspect hosted Action IDs, logs and the exact source blobs.

Update `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, session proof note and closeout with exact links and honest status. If any flagship gate remains open, install the executable S030 continuation as part of the closeout, not execute it. Keep canonical proof PR #4 draft/unmerged and make no external submissions.
