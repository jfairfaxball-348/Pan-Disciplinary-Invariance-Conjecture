# PDIC S005 — Palomar registration reconnaissance: preflight CL/CI and public statement

**OWNER-INSTALLED TARGET — NOT EXECUTED.** Owner selected this on 16 October 2026. Installing a prompt is not authorisation to execute it. Execute only on a later explicit "run next session". This session is **reconnaissance and public-record design only**, not submission, registration, fresh formalisation, PR merge, journal submission, or S006 planning.

## Owner's purpose and editorial standard

Find out precisely what is required to register PDIC with Palomar, how its preflight "CL" (verify whether official terminology is CI or a command-line route) works, and especially what appears on the public, permanent registry record. The final registry-facing **title, abstract, compared theorem, and formula** must line up exactly with the title and full mathematical theorem ultimately written in the first PDIC paper. The owner's desired text starts approximately **"We prove that…"**, followed by a **striking, legible, mathematically exact statement and formula**, not a promotional project slogan.

No paper claim may be presented as fully Palomar-verified unless its entire mathematical content is covered by the selected and kernel-certified Challenge/Solution declarations. Keep the S004 prior-art outcome (novelty and priority UNRESOLVED) explicit; don't claim a new pan-disciplinary invariance principle.

## Opening evidence and frozen source

Read AGENTS.md, README.md, ROADMAP.md, authoritative/STATE.json, research/CLAIMS.md, research/S004_PRIOR_ART_NOVELTY_AUDIT.md, sessions/S004_CLOSEOUT.md, research/FLAGSHIP_THEOREM.md, research/S003R9_GRAPH_WITNESSES_AND_SCOPE.md, sessions/S003R9_CLOSEOUT.md, paper/PDIC_S003R8_DRAFT.tex, and PR #3. Pin exact current HEAD commits. **Main retains older S003R3 Lean; actual S003R9 strict-certified graph/matrix source is on unmerged PR #3.** The written full paper theorem is not end-to-end kernel-formalised. Preserve this distinction.

Inventory whether actual compliant Challenge.lean, Solution.lean, comparator.json, formalization.yaml, LICENSE, Lean module headers, Lake manifest, matching toolchain, and supported imports presently exist. Mark absent/NOT_TESTED rather than claiming Palomar-ready.

## Public Palomar records — inspect what is ACTUALLY displayed

Priority sample is the owner's existing registered TreeStack result:
- Requested URL: https://palomar-registry.org/entry.html?id=PALOMAR-2026-09-25-000010&version=1
- Canonical entry URL: https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000010&version=1
- Its immutable JSON: https://data.palomar-registry.org/entries/PALOMAR-2026-09-25-000010-v1.json
- Data/API instructions: https://palomar-registry.org/llms.txt

View the actual rendered record AND versioned JSON where accessible; if the JS page or JSON is inaccessible, identify that fact and verify with alternative available public records rather than inventing it. Inspect at least one additional rich record. **Make a table mapping source metadata to visible UI content**, recording whether each field is in the top summary, expanded body, linked formatted statement, JSON only, or absent:
1. Entry title, author, project-wide abstract, source and pinned commit, provenance and publication context.
2. The **named compared declarations** from comparator.json, exactly displayed Lean/Verso statement, Challenge docstrings, imports and statement dependencies; links to Challenge, Solution, Comparator and render.
3. Proof verifier, Lean kernel and independent NanoDa, archived mechanical report, editorial AI review, its limitations and whether review scores are public.
4. Sources, licences, classifications, origin, automation disclosure, current version/version history, citation and BibTeX title, and other public record details.
5. Browser rendering behaviour of long statements, displayed equations, LaTeX/Unicode, Markdown, and the wording "We prove…". Do not presume that TeX in project.description is mathematically typeset; *test or document uncertainty*. The formal rendered declaration and the informal abstract have distinct display mechanisms.

Crucially confirm exact sources of fields under the **current standard**: formalization.yaml project.name supplies default public title and citation title; project.description supplies public registry abstract; Challenge and Comparator-selected declarations supply formal statement of record; README/Challenge docstrings provide further explanatory narrative. Verify field precedence, allowed lengths, and any discrepancies.

## Preflight CL/CI — primary operational workstream

Consult live and version-pinned authoritative documentation:
- https://palomar-registry.org/how-to-submit
- https://github.com/PalomarRegistry/PalomarPolicy/blob/main/CONTRIBUTING.md
- https://github.com/PalomarRegistry/PalomarSubmission
- https://github.com/PalomarRegistry/PalomarTemplate
- https://submit.palomar-registry.org/llms.txt, **for read-only procedural information only**.

Build an actionable and version-accurate **preflight and registration specification**, with cited official source lines/versions, distinguishing:
- Full, public 40-character immutable Git SHA, supported toolchain, Mathlib/toolchain match, Lake manifest, module-system rules for ALL Lean files (10,000-line limit), Challenge maximum 1,000 lines/100 KiB and recommended 300/32 KiB; root licence/compatible SPDX; required current v0.4 YAML provenance, sources, classification, authorship, automation and review self-reporting.
- Auditable Challenge.lean theorem *statement*, matching proved Solution.lean, comparator.json exact theorem_names, optional definition_names and permitted_axioms. All Challenge imports only from allowlisted canonical closure; Solution imports may be broader and pinned. Challenge can contain deliberate sorry; proofs must not rely on sorryAx, Lean.ofReduceBool, ad hoc axioms, missing definitions or a vacuous proxy theorem.
- Difference between current PDIC standard lake build / six finite checkers / printed axioms, actual Palomar Comparator sandbox, lean4export, Lean kernel and independent NanoDa replay. No mistaken assertion that the existing strict CI is a Palomar preflight.
- The official reusable **PalomarSubmission/.github/workflows/submission.yml** pinned by its FULL immutable pipeline SHA. Inspect its exact present inputs and write a *proposed* copy-paste workflow: repository, commit, pipeline_commit (must equal the uses SHA), request_id, mode, and options JSON (comparator_config_path and accurately declared author/maintainer relationship). Distinguish **mode preflight** (intake preparation) from **mode full** (predictive mechanical verification including Comparator/kernel); show report/artifact naming and diagnostic failure ownership. An earlier memory of "preflight CL" is not evidence of official CLI name: discover documented CLI if one exists or mark unsupported. Do not invent commands or run jobs during this reconnaissance unless the owner separately authorises them.
- Distinguish green *local full preflight* from official submitted mechanical verification, AI editorial review, optional human sign-in/agent authorisation, the owner's explicit final **register vs withdraw** decision, and permanently public record/version history. Describe public/private intake data and how to cite immutable versions. A preflight result is NOT registration, novelty certification or peer review.

Produce a **PASS / FAIL / NOT_TESTED** file-and-toolchain readiness checklist for this precise PDIC repo, plus actual known blockers and a proposed full preflight recipe, without silently creating a submission, touching Palomar intake, or claiming a test succeeded.

## Editorial thesis: title and formula must match the paper and formal surface

Use the paper draft's verified title as the primary candidate (unless a newer actual manuscript title supersedes it):
**Zero-Sum Quartet Incidence and Sharp Maximal-Independent-Set Witnesses on Eight Vertices.**

Do not use the aspirational repository/programme title as though it were the paper theorem. Draft **one preferred polished exact public title**, **one description beginning "We prove that…"**, and a clear formula suitable for Palomar's actual rendering; supply one strictly scoped fallback that accurately describes only the existing Lean appendix if full-paper formalisation remains incomplete. Do not present a fallback as though it formalises the whole manuscript.

Preserve the paper's genuine theorem, definitions, hypotheses and classical input:
Let G be any **connected** graph on **eight vertices**. Let U be a fixed **admissible eight-cap in F_3^3 minus {0}**, and label vertices by a uniformly random bijection onto U. Let N0 be the number of zero-sum **four-vertex maximal independent sets**; m the total such four-MIS, n0 and n2 counts of unordered pairs intersecting in 0 and 2 vertices, h(G) the number of compatible unordered triples consisting of a disjoint complementary pair and a third four-MIS meeting each side in two vertices. Put M1=2m/35, M2=2n0/35+n2/315, M3=h/315. The paper claims

    P(N0=0) = 1 - M1 + M2 - M3
    P(N0=1) = M1 - 2 M2 + 3 M3
    P(N0=2) = M2 - 3 M3
    P(N0=3) = M3 = h(G)/315 <= 1/105,

**with equality in the final bound exactly when G is isomorphic to the spider S(2,2,2,1)**. It uses an **explicit external classical nine-cap classification**. An optionally elegant equivalent generating polynomial is

    E[t^(N0)] = 1 + (2m/35)(t-1)
                  + (2n0/35 + n2/315)(t-1)^2
                  + (h(G)/315)(t-1)^3.

If using the generating polynomial in public-facing prose, **verify that it is equivalent to the four explicit probabilities and that it accurately matches the actual manuscript**. Prefer the actual paper statement; never replace it merely for dramatic notation. Maintain the sharp inequality and equality case, not just a visually attractive formula.

The **actual proven Lean appendix on PR #3** concerns arbitrary Boolean 4x4 matrices, actual SimpleGraph(Fin 4 ⊕ Fin 4) mixed 2+2 maximal independent sets B(A), edge thresholds and row/column spider *matrix patterns*, plus connected proper-two-colouring uniqueness. It does **not yet** close the full arbitrary-graph h comparison, named graph-isomorphism, uniform random labellings or moment probability law. Write a **truthful GAP / NO-GO / READY matrix** for paper theorem → candidate registry abstract → claimed Lean theorem declaration/types → matching proof → Comparator selected names. A full-paper title combined with a weaker Challenge **must be flagged as mismatch and NOT_READY**, not papered over.

Make a mock-up of **what an ordinary reader would see** on the Palomar page, including public title, exact plain-English "We prove" description, displayed/formatted formal statement surface, source/commit, author/source provenance, review wording and citation; clearly label this PREVIEW, not a registered record. Explain how to keep manuscript title, public metadata, formal source and BibTeX consistent when the final paper is frozen.

## Deliverables for the future execution of S005

1. research/S005_PALOMAR_RECON.md — current official procedure, precise preflight CI/CL and full mode recipe, public-entry field map from actual records, status and any site access limitations.
2. research/S005_PUBLIC_RECORD_PROPOSAL.md — preferred title and "We prove…" description with **the real theorem/formula**, paper-to-Lean-to-Comparator field mapping, realistic *observed-vs-proposed* entry preview and truthful narrowly verified fallback.
3. sessions/S005_CLOSEOUT.md — actual inspection, proof/CI status unchanged or verified changes, exact source links, definitive registration-readiness blockers and all checks actually run vs not run.
4. Update research/CLAIMS.md and authoritative/STATE.json at completion to reflect factual reconnaissance only; do not overwrite existing proof or novel-priority qualifiers.

**No Palomar submission, preflight job, PR merge, submission to arXiv/journal, correspondent contact, or new mathematical theorem/formalisation campaign is authorised by this reconnaissance target.** Nothing after S005 is selected: close the future session without suggesting or installing another target and return control to the owner.
