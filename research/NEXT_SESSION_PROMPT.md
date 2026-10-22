# PDIC S052 — faithful Comparator measurement and real proof-closure reduction

**Execute on the next "Run next session".** This is a continuation of the unfinished S051 engineering, not a session merely to poll CI.

## Target
Make the **unchanged unconditional eight-vertex/all-F₃³-cap/8! permutations/P₀–P₃/sharp iff spider S(2,2,2,1)** flagship pass the official 16 GB Palomar FULL Comparator and all independent kernels. No theorem weakening, changes to Challenge semantics, new axioms, or bypassing checks.

## Precise S051 handoff
- Lean RC3 exact-source proof remains verified: `ca4e6d7bfd2f2e886720afc50e194d9e13942c5e`, [strict run 39774379133](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39774379133). Official FULL still not approved.
- Corrected early profiler [39791921228](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39791921228), exact SHA `3331f181cbdd4041b5eb12ab52c060ca73825959`, parsed Challenge (6,371 decls) and Solution (15,804 decls) individually and together; allowed-axiom traversal passed. Each stage showed about 846,000 KiB max RSS, but the comparison failed immediately on `semiOutParam`.
- Crucial diagnosis from **pinned** `leanprover/lean4:v4.35.0-rc3` `src/lake/Lake/CLI/Check.lean`: the official `compareIt` exports built-in `Quot` targets, the theorem, legal axioms and **all kernel primitives**. The earlier profiler exported only the theorem, so its `compareAt` call could not legally compare primitives absent from Challenge. This was an invalid diagnostic input, not a mathematical failure and not an OOM measurement of comparison.
- Isolated diagnostic branch `diagnostic/s049-comparator-load-profile` has a no-export baseline in `0abf56a33be1308e86d118f104d15678c6d5a083` and official-root-faithful export plus safer cgroup reporting in **`ba6276d0ab1d9c5f3561cdc904264e6d38d98d9e`**. Workflow `s049-comparator-stage-memory.yml` auto-triggers on push. Its **new run and result are not yet confirmed** at S051 handoff; do not assert PASS, memory reduction or comparison outcome.

## Execute substantive recovery
1. Identify the workflow run for `ba6276d0`, read complete logs and artifact `s049-comparator-stage-memory-evidence`. Compare the **baseline** process max RSS with challenge-only, solution-only, both, comparison, and axioms. Check actual byte/Expr/decl counts from faithful exports. Treat absent cgroup files as unavailable, not a zero-OOM signal.
2. If the corrected export or `compareAt` fails, diagnose the real stage using pinned `LeanExport.parseStream`, `Lake.Check.compareAt` and `checkAxioms`. Correct any remaining *profiler* implementation errors on the same isolated branch without changing proof/Challenge. If it OOMs, preserve completed stage evidence.
3. Do **real source/proof-driven** work: use `scripts/profile_leanexport_ndjson.py` to attribute reachable Expr closure to S024 finite certificates and transitive dependencies, then experiment on a separate isolated proof branch. Keep the theorem, ordinary ConstantInfo equality of the eight Challenge definitions, approved axioms and finite results invariant. Measure identical-export-root before/after byte/Expr/declaration counts and stage max RSS; do not treat smaller textual exports as proof of RAM savings.
4. Launch **one** unchanged-semantics `palomar-standard-v1` FULL only if measured headroom under the 16 GB cap is credible; inspect mechanical Comparator, default replay, NanoDa and con-ron report. No repeated unchanged OOM jobs.
5. Record honest evidence and install the next substantive prompt, with minimal session paperwork.

**Not authorised:** paid 32 GB Namespace runner; PR #24 merge; public registration; publication. **Success means official same-source Palomar FULL mechanical PASS, not Lean-only PASS or a diagnostic green check.**
