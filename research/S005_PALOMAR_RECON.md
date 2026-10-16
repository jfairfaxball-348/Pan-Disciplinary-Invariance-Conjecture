# PDIC S005 — Palomar registration and public-record reconnaissance

**Executed 16 October 2026. Read-only research and document design only. NOT a Palomar preflight, verification, review, or submission.**

## Source and frozen status

- PDIC main at opening: [05bcd6596b96a95203318a1bccceaad49cd1bf7e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/05bcd6596b96a95203318a1bccceaad49cd1bf7e).
- Unmerged [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) HEAD at opening: da6e148f56dae2d67c872518a136faf801978c42. Strict graph-appendix evidence is specifically frozen at [402465f2330a275e04108169a6bfbb65e94e10b8](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8), [Lean PASS run 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785) and [finite-checker PASS 38890368126](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890368126). These are NOT Palomar runs.
- PalomarSubmission workflow investigated at immutable [d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44](https://github.com/PalomarRegistry/PalomarSubmission/blob/d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44/.github/workflows/submission.yml); policy at [96b034cc31a72a63d4f4041911dce337a85c9a04](https://github.com/PalomarRegistry/PalomarPolicy/blob/96b034cc31a72a63d4f4041911dce337a85c9a04/CONTRIBUTING.md); public UI implementation at [ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f](https://github.com/PalomarRegistry/PalomarWeb/tree/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f).
- Governing human documentation: https://palomar-registry.org/how-to-submit and https://palomar-registry.org/llms.txt.

## Required snapshot and actual PDIC inventory

| Required source | Opening PDIC main / PR #3 | Result |
| --- | --- | --- |
| Public full 40-character source commit | Yes; main and PR differ | MUST pin the eventual complete submission commit |
| lean-toolchain | Present: leanprover/lean4:v4.35.0-rc2 | Current release compatibility and exact pinned Mathlib revision NOT independently tested under Palomar |
| lakefile.toml | Present, Mathlib Git dependency at tag v4.35.0-rc2 | Actual resolved manifest must agree exactly |
| lake-manifest.json | Present | Palomar preparation NOT_TESTED |
| A small Challenge.lean with independently auditable statement | ABSENT | BLOCKER |
| A matching proved Solution.lean | ABSENT | BLOCKER |
| Comparator configuration selecting the exact declarations | ABSENT | BLOCKER |
| formalization.yaml (v0.4 metadata) | ABSENT | BLOCKER |
| Exactly one acceptable root LICENSE / LICENCE / COPYING / UNLICENSE / OFL | ABSENT | BLOCKER |
| Lean module-system headers in all submitted Lean files | PDIC.lean begins with 'import Mathlib', not 'module' | BLOCKER: all regular .lean files need Lean's module system |
| Compliant Challenge imports | No Challenge exists | NOT_TESTED |
| Full sandboxed Comparator, Lean + NanoDa replay | Never attempted on this source | NOT_TESTED |
| Palomar AI editorial check, registration | Never attempted | NOT_REQUESTED |

The main PDIC.lean is an older S003R3 source, not the full certified S003R9 branch material. The full distribution, graph-isomorphism transport, arbitrary connected-graph compatible-triple correspondence, and canonical-cap uniform random-bijection probability model are not end-to-end Lean-certified even on PR #3. A conventional lake build, printed axiom audit and six separate Python finite verifiers do **not** substitute for official Comparator checking.

## Current Palomar intake rules — pin and read these before any future execution

See [Palomar submission policy](https://github.com/PalomarRegistry/PalomarPolicy/blob/96b034cc31a72a63d4f4041911dce337a85c9a04/CONTRIBUTING.md) and [official getting-ready instructions](https://palomar-registry.org/how-to-submit).

1. One Comparator configuration defines one Palomar entry, potentially with several selected declarations. Provide one exact 40-character public GitHub commit and repository-relative configuration path. Root licence is mandatory and must match project.license as one unambiguous SPDX identifier. No submodules/LFS or uploaded prebuilt build objects.
2. Every regular .lean file anywhere in the submitted source tree, including unused files and contained projects, must use the module system and have at most 10,000 physical lines; lakefile.lean has only a header exemption. Challenge has hard 1,000-line/100-KiB caps, with warnings after 300 lines/32 KiB.
3. Challenge must be a small, readable independent statement module; transitive Challenge imports restricted to Lean core, verified Mathlib, Tau Ceti or CSLib closure. Extra statement dependencies are separately marked as qualified. Solution may import separately pinned Git dependencies, but the submitted theorem and each selected definition must genuinely express the claimed result.
4. Comparator JSON keys: challenge_module, solution_module, nonempty theorem_names, permitted_axioms; optional definition_names and enable_nanoda. Only propext, Quot.sound and Classical.choice are permitted. Challenge may contain intentional sorry; proved Solution cannot rely on sorryAx, Lean.ofReduceBool, invented axioms or a vacuous witness/placeholder.
5. formalization.yaml should declare version: v0.4, project.name (at most 300 chars; default public title), project.description (at most 10,000 chars; exact public registry abstract), real human authors, matching licence, responsible maintainers, at least one source with truthful relationship, original-vs-source-based provenance, one to eight arXiv codes, zero to eight MSC2020 codes, automation.methods (including AI agents and model roles) and review.status plus truthful scope/fidelity/gaps. Original-proof status is NOT established by S004's bounded prior-art audit. Do not silently ascribe the known nine-cap classification to PDIC.
6. Canonical Mathlib checkout must match the submitted toolchain exactly. The project must provide a valid Lake project and normally a manifest. Palomar checks source, compiled separate protected Challenge, Comparator types and allowed axioms, exported proof via Lean and independent NanoDa, dependency and provenance metadata. Palomar's editorial AI review is a further distinct step; a pass does not establish novelty or human peer review.
7. Palomar permits a new version for an existing ID only under its version rules; all versions remain citable. Repository/commit/comparator paths become public when verified; reviewed results and registration entry only become public after explicit registration choice. Withdrawal after registration is not the ordinary process.

### What “preflight CL” means

Official public workflow terminology is **CI**, not “CL”. The PalomarSubmission reusable GitHub Actions workflow provides a lightweight mode preflight that **prepares** the immutable submission and reports missing metadata/layout, and mode full that continues into the actual expensive sandboxed mechanical check. Both prepare using verify_submission.py prepare. Neither runs automated editorial review or registers a public result. There is also a command-line implementation within that pipeline, but a bare local lake build or arbitrary Python check is not the official Palomar CI preflight.

### Proposed reusable workflow — NOT installed, NOT run

This is a copy-paste **proposal**, not a file installed in .github/workflows and not a test result. It assumes the eventual branch commit contains all Palomar submission files, and the declared relationship is truthful. The uses revision and pipeline_commit must be identical.

~~~yaml
name: Palomar mechanical preflight (proposed only)
on:
  workflow_dispatch:
jobs:
  palomar-preflight:
    uses: PalomarRegistry/PalomarSubmission/.github/workflows/submission.yml@d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44
    with:
      repository: ${{ github.repository }}
      commit: ${{ github.sha }}
      pipeline_commit: d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44
      request_id: pdic-s005-proposal
      mode: full
      options: '{"comparator_config_path":"comparator.json","authorization_relationship":"I am a responsible author or maintainer"}'
~~~

For a cheaper preparation-only inspection, substitute mode: preflight; this cannot certify proofs. The full mode runs the same prepare step and then verifier execution. An eventual workflow source commit may differ from the frozen S003R9 checked SHA because packaging creates a new commit: it must receive **fresh, exact-commit** Comparator verification. Workflow reports are authoritative only for the commit and mode actually run; mode preflight produces a preflight-report artifact and mode full a mechanical-report artifact. The public submission server can then initiate its own run, AI review and opt-in registration. No such jobs were requested or run in S005.

## Actual public record layout — presentation source audit

Priority user example: [TreeStack PALOMAR-2026-09-25-000010 v1](https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000010&version=1); immutable JSON target: https://data.palomar-registry.org/entries/PALOMAR-2026-09-25-000010-v1.json. **Access limit:** direct human page yielded only “Reading registry entry…” because content requires JavaScript; the data.palomar-registry.org JSON/API could not be fetched from available public access. Therefore the exact live DOM, exact record JSON contents and precise TreeStack field values were **not** directly inspected. Search-engine indexing showed a TreeStack title beginning “Tree stacking equals the Csernák–Soukup estimator on nontrivial…”, but this is supporting secondary indexing only. Independent richer example [PALOMAR-2026-09-25-000001 v1](https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000001&version=1) was visible in a search-engine rendered excerpt headed “Absence of bounded-orbit wandering domains”, displaying abstract, byline and Formal comparison surface. It too was not live-rendered in this browser.

The following **placement** is inferred from official [PalomarWeb app.js](https://github.com/PalomarRegistry/PalomarWeb/blob/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f/assets/app.js), [challenge-presentation.mjs](https://github.com/PalomarRegistry/PalomarWeb/blob/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f/assets/challenge-presentation.mjs), [formalization-presentation.mjs](https://github.com/PalomarRegistry/PalomarWeb/blob/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f/assets/formalization-presentation.mjs), [presentation-text.mjs](https://github.com/PalomarRegistry/PalomarWeb/blob/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f/assets/presentation-text.mjs) and [citation-presentation.mjs](https://github.com/PalomarRegistry/PalomarWeb/blob/ac8e13266ac8be4ccb9315d23bc9cebeaf9f5b3f/assets/citation-presentation.mjs), not from direct observation of the TreeStack browser record.

| Information | Source and placement under current renderer |
| --- | --- |
| Public title / citation title | formalization.yaml project.name → entry.title → top H1, search-card title, page browser title, BibTeX title |
| Public abstract | formalization.yaml project.description → entry.abstract → top lede below H1 and search-card summary; source is quoted text, not a mathematical theorem certificate |
| Authors | project.authors → top “By …”, search card, BibTeX citation (ORCID links where present) |
| Registration ID/version, trust | top badge/identity and registration callout; stable versioned URL, version history lower on page |
| Exact compared declarations | Comparator theorem_names → visible formal-comparison area / “Named compared declarations”; separate pinned formatted Challenge statement; selected names also in expanded verification metadata |
| Challenge full file and notes | Challenge module and generated render metadata → statement area links to pinned Challenge, Comparator, formatted statement and (when allowed) Lean Playground; imports and module documentation panel; challenge declaration docstrings retained in source/render |
| Solution, source commit, Lean, source hashes, workflow | expanded “Verification details”; links to source files, pinned repo, toolchain, standard axioms, workflow and durable reports |
| Independent kernel evidence | registration callout explicitly says Lean and independent kernel; detailed verifier provenance in expanded verification section and archived mechanical report |
| Automated review | top-level assurance sentence and expandable “Automated review” section with textual outcome/comments and archived review link; **numeric AI review scores not displayed**, per app.js |
| Dependencies | expandable “Statement dependencies” with Mathlib-only vs qualified trust, imports and transitive source repositories |
| Source bibliography, origin, author relationship | expandable “Mathematical origin” with source identities, roles, authorisation basis, source relationships, responsible maintainers and any related formalizations |
| Licence, classified subjects | expanded mechanical verification includes root licence and digest; separate subject classification |
| Detailed automation disclosure, miscellaneous raw metadata | source formalization.yaml and archived record/report links; do **not** presume every YAML field is separately rendered in top summary |
| BibTeX and full JSON | “Cite this” section generates BibTeX from entry.title, authors and ID/version; link to versioned full JSON in expanded verification |
| Paper publication / provenance links | collected from structured sources when present, not automatically inferred from README or arXiv |

**Formatting result:** app.js/presentation-text.mjs render project.description as escaped text spans; backtick-delimited code is styled, some Unicode math operators are styled as inline expressions. The abstract is *not* general Markdown or TeX rendering. Use readable Unicode/plain text for the compact “We prove that…” abstract. The formal declaration's separate Verso-rendered view is the right place for precise typeset mathematical statement, conditional on successful render. Long statement fallback links to the exact Challenge source. A very long equation inside the abstract has not been experimentally tested here; no unobserved wrapping/LaTeX behaviour is asserted.

## S005 verification disposition

Read source/policy/workflow/public UI implementation: **DONE**. Inspected PDIC snapshot and manuscript/proof boundary: **DONE**. Opened live example shell but no executable page data; indexed alternate and UI code analysis: **PARTIAL, access-qualified**. New Lean, Comparator, official preflight, submission, editorial review, PR merge, arXiv and journal: **NOT RUN / NOT AUTHORISED**.

Only the proposal file [S005_PUBLIC_RECORD_PROPOSAL.md](S005_PUBLIC_RECORD_PROPOSAL.md) supplies proposed public wording. It is not a currently registered or mechanically verified record.
