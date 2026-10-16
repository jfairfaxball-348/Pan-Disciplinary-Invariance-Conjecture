# PDIC S006 — Palomar preparation: a submission-ready immutable commit

**OWNER-INSTALLED, NOT EXECUTED.** Installed 16 October 2026 by express owner direction. Execute only on a subsequent “run next session”. Unlike S005, this target authorises actual proof/packaging changes in this repository, new code, local and hosted verification, and an official PalomarSubmission **full mechanical preflight**. It does NOT authorise actual Palomar submission, automated editorial-review request, publication/registration, external correspondence, arXiv/journal submission, or modifications to other research repositories.

## Principal deliverable and acceptance criterion

**End S006 with one public, stable, full 40-character Git commit SHA that the owner can enter into the Palomar submission form, containing a complete, honest, auditable Palomar Challenge/Solution + Comparator + v0.4 metadata package, and with an official full-mode PalomarSubmission mechanical verification PASS against that identical SHA.**

Target outcome: **READY_FOR_OWNER_SUBMISSION**, with commit, exact hosted run, mechanical report and all form inputs. This is not a promise that Palomar's subsequent editorial check will accept the result or that Palomar will register it: the owner controls those subsequent acts. Fix ordinary technical failures and re-run the official check rather than closing merely with a file checklist.

### Theorem selection (priority and non-negotiable honesty)

**First choice — full first-paper theorem.** Seek genuinely complete Lean/Comparator formalisation of the principal written probability law from paper/PDIC_S003R8_DRAFT.tex and research/FLAGSHIP_THEOREM.md. Given a connected simple 8-vertex graph G uniformly labelled by a fixed admissible 8-cap of F₃³, N₀ counts the zero-sum four-element maximal independent sets. Let m count four-MIS, n₀ and n₂ count pairs with overlap 0 or 2, h the compatible unordered triples, and M₁=2m/35, M₂=2n₀/35+n₂/315, M₃=h/315. The paper's theorem is:

    Pr(N₀=0)=1−M₁+M₂−M₃,
    Pr(N₀=1)=M₁−2M₂+3M₃,
    Pr(N₀=2)=M₂−3M₃,
    Pr(N₀=3)=M₃=h(G)/315≤1/105,
    with equality iff G ≅ S(2,2,2,1).

The classical nine-cap classification must be cited and either formalised or **explicitly represented as a relevant mathematical hypothesis**, with the corresponding conditional scope truthfully stated. Never turn the assertion into a tautology or encode its conclusion as an unjustified hypothesis. If the actual compared theorem includes the complete original law, use the manuscript's exact title: **Zero-Sum Quartet Incidence and Sharp Maximal-Independent-Set Witnesses on Eight Vertices**, with the exact “We prove…” description from research/S005_PUBLIC_RECORD_PROPOSAL.md, edited only to make the final certification status accurate.

**Permitted contingency — narrower but genuinely registerable result.** If completing the flagship within this session proves infeasible, do not sacrifice the principal user objective of a registerable commit. Package the strongest substantive theorem presently Lean-certified on PR #3, preferably the actual connected 4×4 bipartite SimpleGraph mixed-maximal-independent-set bound B(A)≤3 and spider-*matrix-pattern* equality criterion, with truthful 5/7/8-edge refinements where selected. An acceptable narrower public title is **Sharp Mixed Maximal-Independent-Set Bounds for Connected Four-by-Four Bipartite Graphs**. Its abstract begins “We prove that…”, cites its actual hypotheses and conclusion and says explicitly that the full eight-cap probability law, arbitrary-graph h transport and named graph-isomorphism are **NOT** part of this certificate. This theorem is in the paper, but it is NOT the whole paper's claim. Mark FULL_FLAGSHIP_NOT_FORMALISED and PARTIAL_PAPER_ALIGNMENT transparently in the closeout.

**Hard gate:** If no genuinely nontrivial mathematically faithful theorem passes the actual official full-mode mechanical verification at the identical final SHA, mark **NOT_READY_FOR_OWNER_SUBMISSION**, never imply ready on local build, prior PR CI or preparation-only PASS. Never present a narrowed theorem under the larger probability-formula headline. S004's priority/novelty status remains **UNRESOLVED**; registration is not a novelty certificate.

## Opening state and source control

Read AGENTS.md, README.md, authoritative/STATE.json, research/CLAIMS.md, research/S005_PALOMAR_RECON.md, research/S005_PUBLIC_RECORD_PROPOSAL.md, sessions/S005_CLOSEOUT.md, paper/PDIC_S003R8_DRAFT.tex and S003R9 source/scope before changing anything. Pin current HEADs again at execution.

- At installation, main was **dd5e6c0ccaeabed894802610597d26c22353032d**.
- Unmerged PR #3 was **da6e148f56dae2d67c872518a136faf801978c42**, branch session/s003r4-numerical-semantic.
- Exact previously strict-Lean-verified graph/matrix source was **402465f2330a275e04108169a6bfbb65e94e10b8**, hosted Lean run https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785 . Current main has the older S003R3 Lean; do not confuse it with the unmerged PR source.
- Prefer a durable separate S006 preparation branch based on the appropriate PR #3 mathematical source, incorporating needed main metadata, rather than merging or rewriting PR #3. Do not modify other repositories. A publicly reachable Git commit need not have been merged to main to be submitted, but retain its public branch/commit, do not force-rewrite it, and document which SHA is actually submitted.

Refresh current official rules:
https://palomar-registry.org/how-to-submit
https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md
https://github.com/PalomarRegistry/PalomarSubmission
https://github.com/PalomarRegistry/PalomarTemplate
https://submit.palomar-registry.org/llms.txt (read-only)
and S005's detailed source-/UI-audit reports. Pin the **full official PalomarSubmission workflow SHA** used. The 2026-10-16 S005 pinned workflow source was d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44; inspect live rules for any changes, and do not assume the old revision remains current.

## Workstream 1 — create a genuinely compliant submission repository snapshot

All actual files must be committed in the selected publicly reachable source SHA (default root layout preferred unless a documented nested project is necessary):

1. A small **Challenge.lean** that independently states real mathematical definitions and named theorems in readable auditable Lean. Correct Lean module header, module/docstrings, qualified theorem declarations, only permitted transitively allowlisted Challenge imports. Challenge may intentionally use sorry in its statement template but must not depend on PDIC private solution code. Limit at most 1,000 lines and 100 KiB; aim below 300 lines/32 KiB. Do not hide crucial semantics in unrelated opaque definitions or complex uninspectable notation.
2. A **Solution.lean** containing matching compared declarations, real proofs, trusted dependencies and a fully checked proof closure. Comparator must confirm exact names/types. Prove using only permitted propext, Classical.choice and Quot.sound as relevant, and **no** sorryAx, ad hoc axioms, Lean.ofReduceBool or native_decide-dependent proofs. Check explicit printed theorem axioms and semantic fidelity; a finite BitVec/decide proof is permissible if genuine and supported. The Challenge's definitions must match the actual finite-graph terms being advertised.
3. A correct **comparator.json** with challenge_module, solution_module, theorem_names, optional definition_names and permitted_axioms, all exact. No empty or decorative compared result.
4. A complete **formalization.yaml v0.4**: project.name exactly equal to intended public title/BibTeX title, project.description as a concise readable “We prove…” abstract with exact formula/scope, truthful authors/maintainers, compatible licence and source provenance (including Follett et al. classical nine-cap source and relevant graph/MIS work), classifications, automation methods and model roles, review status, scope/fidelity limitations and source-to-Lean declaration mapping. Don't invent ORCID, author approval, external review, originality, computer costs or novelty. Explicitly distinguish the paper-wide written theorem from a narrowed compared certificate.
5. One allowed **repository-root SPDX-compatible licence file**, Lake package, pinned supported Lean toolchain (prior repository used v4.35.0-rc2), committed Lake manifest with exact dependency resolution, full 40-character Git dependency pins where required; no rejected submodule/LFS/prebuilt objects. Convert **every regular .lean file** in the submitted tree, including unused files, to the new module syntax, at most 10,000 physical lines each. The only module-header exception is eligible lakefile.lean. Make public definitions/imports compatible and actually build.
6. README/Challenge docstrings must agree with manuscript and metadata. If the narrower contingency is used, specifically explain that the Palomar theorem formalises the graph/matrix part of the paper, and list the unformalised cap law without advertising it as mechanically certified.

No package consisting only of placeholders, no misleading minimal proxy result, no local external axiom that assumes the conclusion, and no unreviewable mega-Challenge. Prior strict Lean CI of PDIC.lean alone is insufficient.

## Workstream 2 — actual preflight and full mechanical proof verification

1. Build the exact changed source, run theorem-signature/axiom audits and retained six PDIC finite verifiers where applicable. Inspect all regular Lean files and module closure; eliminate every structural and mathematical issue before freezing.
2. Add a legitimate reusable GitHub Actions workflow pinned to the full immutable current PalomarSubmission commit. Its official inputs must include repository, 40-character source commit, pipeline_commit exactly matching the uses revision, request_id, mode and accurate options JSON including comparator_config_path and truthful author/maintainer authorization. See S005's copyable official pattern. A preparation-only mode=preflight PASS checks packaging, not proof.
3. Push candidate SHA. Run the official **mode=full** workflow at **that exact 40-character candidate SHA**. Inspect the uploaded mechanical report, verified theorem names, statement import/source closure, Comparator type comparison, Lean kernel replay, independent NanoDa kernel check, axiom list and build logs. Fix failures; commit and repeat at the resulting new SHA until all requirements genuinely pass.
4. Verify that the official full-mode workflow concluded PASS at the **final** SHA and preserved evidence links. Do not conflate a successful artifact upload, old PR run, 'preflight' preparation result, or a partly successful workflow with accepted mechanical proof.
5. Include status/closeout/docs in the submission snapshot **before** its final official full-mode check, or write closeout/ledger-only commits elsewhere without modifying the final checked snapshot. Never hand over a later unchecked commit pretending that the earlier run covers it. Report any separate control HEAD distinctly.
6. No live Palomar submission/registry POSTs or editorial-review dispatch: **owner submits** with the documented GitHub SHA when satisfied.

## Release gate / session end

**READY_FOR_OWNER_SUBMISSION** may be stated only if:
- Exactly one identified PUBLIC, durable **full 40-character SHA** contains all source and metadata and is accessible on GitHub.
- Challenge/Solution/Comparator and honest public abstract actually match the mathematical theorem, with the correct strong or narrower title and no unresolved proof holes.
- Valid licence, metadata/provenance, toolchain, manifest, module headers, permitted source closure and permitted axioms are verified.
- The official PalomarSubmission **full-mode** mechanical report (not just preparation mode) shows successful Comparator and independent kernel verification for the identical SHA.
- Full release form inputs and hosted run/report links are supplied.

If any fail, conclude NOT_READY with an explicit blocker register rather than overclaiming. The editorial Palomar review and eventual registration remain outside the scope and cannot be guaranteed beforehand.

## Required S006 outputs

- **Actual** complete Palomar package and reusable workflow committed in the source repository, and a verified immutable public submission SHA if possible.
- research/S006_PALOMAR_RELEASE_AUDIT.md: exact compared theorem types, mathematical fidelity vs paper, imports/dependencies, axiom audit, provenance, all pass/fail run links, full/narrow flag, mechanical gate table and actual public-record title/abstract.
- sessions/S006_CLOSEOUT.md: what was really done, definitive READY or NOT_READY verdict, the **full** registration SHA and matching successful official full-mode run/report when READY, plus copyable owner form tuple: GitHub repository, full commit, project_path if relevant, comparator_config_path, formalization_metadata_path, and truthful authorization relationship. Explicitly state no Palomar registration or editorial review has been requested.
- Update research/CLAIMS.md, authoritative/STATE.json, README and owner-directed session control factually. **No automatic next session selection, S007 prompt or unsolicited future plan.**

**Result sought: a rigorously checked, mathematically faithful public commit for the owner to register — not another planning document.**
