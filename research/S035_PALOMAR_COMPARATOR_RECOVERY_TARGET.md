# PDIC S035 — Palomar resource diagnosis and full verification recovery

**Installed, not executed (18 October 2026).** The next owner command "Run next session" authorises execution. This explicitly replaces the manuscript audit, which is archived as research/S035_DEFERRED_MANUSCRIPT_AUDIT_PROMPT.md.

## Target

Find the actual cause of Palomar Comparator memory exhaustion; change the packaging, declaration closure or source-module representation without changing the complete flagship theorem; run repeated full Palomar mechanical preflights **until every required check passes on one identical immutable commit**.

## Evidence to start from

- Full original theorem: proof PR #4, Lean-verified SHA 09d9f392d20399c80f2c51e2f4979b78b412c4e2. Covers connected eight-vertex graphs, all admissible eight-caps in F3^3, actual 40,320 permutations, all four probability coefficients and sharp iff-spider conclusion.
- Package PR #24 SHA fe94685a626051378e4c3dd1e0ff5fbc89503f02: strict Lean 39140421991 PASS; finite 39140422043 PASS.
- Palomar full preflight 39140422199: FAILED, report artifact 12142417885: Solution build/export succeeded; Comparator exceeded 16 GB worker limit (exit 137 OOM); independent kernel checks never completed.
- Earlier attempt 39138306868 had a different Comparator failure on PDIC.spiderAdj; the OOM does not establish whether it was fixed. Owner says their actual Palomar submission also hit a resource barrier: obtain its report/profile if available.
- Current preflight forced palomar-standard-v1; compare Palomar's approved 32 GiB profile, but do not assume extra hardware solves the issue or incur unapproved charges.

## Execute in S035

1. Retrieve both machine-readable reports, current PR heads and all Challenge, Solution, comparator, Lake and Lean sources. Distinguish OOM from the earlier declaration mismatch; inspect Palomar's actual verification and declaration-closure rules.
2. Profile memory by phase. Determine whether exported transitive definition closure, unnecessary imports, huge proof namespace, duplicated definitions or the chosen witness expression inflate Comparator memory. Record evidence and concrete measurements.
3. Implement leaner equivalent package interfaces, module factoring or declaration boundaries. Preserve the exact complete mathematical result, independent Challenge, genuine fixed spider and three permitted axioms. Do not hide meaningful definitions from the Comparator, weaken the statement, add proof holes or disable independent kernels.
4. For each tested change, commit a new immutable SHA, rerun strict Lean/axiom scan, finite checks and the **full Palomar mechanical preflight**. Inspect final artifact: when anything fails, diagnose, amend and rerun. Maintain a chronological table of exact SHAs, changes, memory, time, run/artifact URLs, stage results.
5. Green requires the same SHA to pass strict Lean, finite checks, Comparator with Challenge provenance, Lean replay, NanoDa and con-ron, with delivered report. A running, OOM or partially passed run is NOT green.
6. Close out with source changes, evidence, repository updates and a full installed S036 prompt. If verification is still blocked or running, S036 must continue this same recovery target instead of switching to manuscript/audit. If truly green, resume archived manuscript audit. Do not merge the draft PRs or initiate new Palomar submission without the owner's separate direction.

**Success is all-green full verification, not an optimisation proposal.** No CI starts merely because this instruction is installed.
