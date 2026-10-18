# PDIC S035 — Fix Palomar Comparator memory and achieve all-green verification

**Owner-installed 18 October 2026. NOT EXECUTED.** The next request to run the next session authorises this task. Detailed binding specification: research/S035_PALOMAR_COMPARATOR_RECOVERY_TARGET.md. S034 paper writing is complete; the former S035 manuscript-audit target is postponed at research/S035_DEFERRED_MANUSCRIPT_AUDIT_PROMPT.md.

## Objective

Diagnose and fix the memory-intensive way the **full flagship theorem** is packaged/represented for the official Palomar Comparator, then repeatedly launch full-mode Palomar mechanical preflights on immutable commits until **every required gate is green on the same SHA**. Implement and test real changes; do not merely suggest more RAM.

## Starting facts

- Complete unconditional 8-cap/connected-graph/40320-permutation/P0-P3/sharp-spider theorem was kernel-certified on proof PR #4 at 09d9f392d20399c80f2c51e2f4979b78b412c4e2 (strict 39120877185). Preserve all of it.
- Last package PR #24 SHA fe94685a626051378e4c3dd1e0ff5fbc89503f02: strict Lean 39140421991 and finite 39140422043 PASSED, but full-mode Palomar 39140422199 FAILED with Comparator OOM (exit 137, approximately 16.13 GB versus 16.43 GB cgroup ceiling), report artifact 12142417885. Solution built and exported; Comparator, NanoDa and con-ron did not finish.
- Earlier full run 39138306868 failed on PDIC.spiderAdj declaration mismatch; latest OOM did not confirm whether that was resolved. Owner says the official registry verification also hit a resource barrier; obtain its exact report/profile if available.

## Execute

1. Inspect latest branches, Challenge.lean, Solution.lean, comparator.json, Lake and theorem modules, Palomar verifier documentation, earlier two mechanical JSON artifacts, and the official submission report if available. Reconstruct stage-specific failures and resource usage.
2. Measure the actual Comparator bottleneck: exported environments, transitive declaration dependency closure, heavy imported modules, redundant definitions and proof dependencies, cgroup memory/CPU peaks and timings. Distinguish memory optimisation from superficial text compression.
3. Implement a smaller but exact package: refactor module boundaries, imports, independent theorem specification, and proof interfaces without altering the true four-outcome probability law, any-cap scope, sharp isomorphism statement or independently fixed spider. No extra unchecked axioms, proof holes, concealed semantic definition gaps, disabled independent kernels or weaker graph-only theorem.
4. Commit each candidate SHA; run strict Lean with axioms/hole scan, finite independent checks, and **full Palomar preflight**. Inspect every finished mechanical artifact. Repair the first failing stage, recommit and rerun, repeating until all green, with a SHA/run/memory/diagnostic ledger. Higher-memory profiles only with verified availability and approved costs; source-footprint improvement is essential given the owner's real Palomar failure.
5. All-green means one SHA passing strict Lean, finite checks, Challenge provenance, Comparator, Lean replay, NanoDa and con-ron, with a delivered complete report. Preflight PASS is not registration. Do not submit a new registry record, merge proof/package PRs or fill the paper's pending Palomar link without explicit permission.
6. Commit S035 closeout, measurements and state changes; install S036. If all green, resume deferred manuscript audit. If still failing, blocked or unfinished, S036 must continue the Palomar recovery with the unchanged all-green target rather than move to publication.

**No CI jobs have been launched by installing this prompt.**
