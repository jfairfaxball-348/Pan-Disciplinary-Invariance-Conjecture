# PDIC S028 — certify every remaining cap shard and export the unconditional flagship

**Installed after partial S027 closeout, NOT EXECUTED.** The owner's next “Run next session” authorizes immediate execution. This session does *only* trusted Lean formalisation of the already-written complete first-paper flagship in `research/FLAGSHIP_THEOREM.md`. No new mathematical target, Palomar submission, article submission, external correspondence or PR #4 merge. Follow `AGENTS.md`.

## Last verified mathematical state

The canonical proof branch is `session/s007-full-lean-flagship`, draft PR #4. Its fully checked pre-S027 baseline is commit `9f5030951a54182dfaf692a621eeb081cfb09675` / strict Lean `39078143085`. S027 subsequently *strictly verified on isolated source and promoted*:

- Eighteen listed tails all belong to the actual admissible normalized filter: isolated strict `39109084674`; canonical commit `d753fe0cf85d98edae28af5484c9c976bcccc625`.
- Exact explicit `Fin 17` point indexing and correspondence between all indexed five-subsets and the true 6,188 candidate family: isolated strict `39108972085` and `39109155431`; promoted at `64f242a5f4fcaeaa391f412de19425a05851359d`.
- Exact first-index partition `s027_five_index_tails_split_by_first`: isolated strict `39109376664`; canonical `286ddd40ec0ce3973994edd920d576003a9b6493`, integrated strict `39109927604` SUCCESS.
- Exact survivor-card certificates for first indices 7–12: isolated strict `39109880476`, canonical `9a1bd62ea98342de135ec82937129d563ceca913`.
- Mid-size shard survivor-card certificates for indices 4–6: isolated strict `39110009522`, canonical `7a7bde0d1fd1de7de87ec95cad6fc3258b830bed`.
- Exact two-index partition `s027_first_index_shard_second_split`, reducing every large shard to cases of at most 455 possible tails: isolated strict `39110136139`, canonical `1b334210b3e95d44a6588a8dc4db51af3a9cb55e`.

Read `sessions/S027_CLOSEOUT.md` and `research/S027_LEAN_PROOF_NOTE.md` for exact flags and late running checks. In particular S027's additional high-index shard, conditional orbit transport, and pair-shard pilot were testing in dedicated branches. Inspect their exact final CI outcomes before claiming proof status.

## Primary gate: finish 18-of-6,188 *inside the Lean kernel*

1. Work from the latest strict-green canonical proof head; inspect hosted CI on `session/s027-small-shard-counts-ci`, `session/s027-conditional-orbit-transport-ci`, and `session/s027-pair-shard-pilot-ci`. Fix failures on isolated branches, promote only true success and check the canonical exact source again.
2. Use the certified `s027FreePointAt`, `s027_indexed_five_tails_eq_original`, `s027_five_index_tails_split_by_first`, and `s027_first_index_shard_second_split` machinery. Verify remaining first-index survivor counts, splitting indices 0–3 by second index into bounded cases of no more than 455 candidates. Avoid the failed monolithic `decide +kernel` over the 6,188 Finset candidate filter. Establish coverage and uniqueness/disjointness of shards, not merely matching independent Python counts.
3. The independent FINITE_CHECKED survivor counts by least index are `[5,5,5,1,1,0,0,0,1,0,0,0,0,0,0,0,0]` (sum 18). These are targets to certify, **not axioms or Lean proofs**. Check second-index pilot `(0,3)` expected one survivor. Establish the exact total card `s027NormalizedAdmissibleTails.card = 18` in trusted Lean using a proof of indexed cardinal preservation, disjoint shard decomposition and certified shard results.
4. Combine the already certified `s027_eighteen_tails_subset_filtered_candidates` with exact survivor cardinal 18 and the explicit table cardinal 18, proving the **unconditional** equality `s027NormalizedAdmissibleTails = s025NormalizedTails` — no `sorry`, `admit`, `native_decide`, fabricated certificate, assumed orbit or custom `axiom`.

## Final orbit and flagship gate

5. Complete the typed matrix witness image-orbit composition, using the real 18 invertible matrices and actual cap normalization. The S027 isolated candidate `s027_image_orbit_of_tail_classification` on `session/s027-conditional-orbit-transport-ci` has the correct intended mathematical scope but must pass its exact strict Lean CI before promotion. Its finite-classification hypothesis must be supplied by the actual proved equality from step 4, not added as an axiom.
6. Prove `admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit`, `classicalCapNormalForm_proved : ClassicalCapNormalForm` and **`connected_graphMIS_complete_flagship_unconditional_all_caps`**, with no `hnf` argument. Preserve the entire real 40,320-permutation P₀–P₃ moment and expanded laws, deterministic `N₀≤3`, `P₃=h/315≤1/105` and equality iff `G ≃g namedSpider = S(2,2,2,1)`. Do not silently weaken the theorem to canonical caps or one probability.

## Non-negotiable strict verification and closeout

At the exact final SHA run pinned `lake build` AND `lake env lean S024.lean`, scan *both* `PDIC.lean` and `S024.lean` for proof holes, print axioms for every new public theorem and the unconditional flagship (allow only `propext`, `Classical.choice`, `Quot.sound`), and run all independent finite checkers. Failure, runner exit 143, or successful finite scripts alone do **not** establish a Lean theorem.

Update `README.md`, `ROADMAP.md`, `research/CLAIMS.md`, `authoritative/STATE.json`, proof note and session closeout with exact source and success/failure URLs. If the full flagship remains incomplete, document the smallest exact Lean obstruction and install the executable S029 continuation without running it. PR #4 remains draft/unmerged. No publication/Palomar action.