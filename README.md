# Pan-Disciplinary Invariance Conjecture (PDIC)

This repository studies zero-sum quartet incidence for eight-point caps in F₃³ and maximal-independent-set statistics of connected eight-vertex graphs. The project name is historical and aspirational: the **specific first-paper theorem below is fully formalized**, not a claim to have resolved every possible broader pan-disciplinary invariance question. Originality and literature priority have not been established.

## Current verification status — 28 October 2026

**COMPLETE: the unconditional first-paper probability law and sharp named-spider characterization are Lean-kernel verified and passed the standard full Palomar mechanical verifier.** The precise, independently specified Challenge and proved Solution were checked at immutable source commit [`912b628e6df0f4881f56e8f341031ec8d99d4e9e`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/912b628e6df0f4881f56e8f341031ec8d99d4e9e) on branch [`diagnostic/s060-interface-standard-full`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/diagnostic/s060-interface-standard-full).

- **Full standard-profile verification: PASS** — [GitHub Actions run 40656295590](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40656295590). Comparator and the independent con-ron, NanoDa, and Lean default-kernel checks accepted the complete original flagship; all eight exported Challenge/Solution declaration comparisons passed. The report has no errors or warnings.
- **Palomar submission mechanical verification: SUCCESS** — [submission run 40661719810](https://github.com/PalomarRegistry/PalomarSubmission/actions/runs/40661719810), with the Challenge-renderability check also passed on 28 October 2026. Mechanical verification is distinct from editorial acceptance or a public registry entry.
- **Permitted axioms:** `propext`, `Classical.choice`, and `Quot.sound`; no `sorry` / `admit`, new axiom, weakened theorem, or replacement of kernel checking by a Python result.
- **Registration:** not yet publicly registered as of this README update. A separate registration decision/process remains necessary. Palomar's mechanical checks do not constitute peer review or establish priority.

The original complete source and configuration live at the immutable verified commit; this README correction is **documentation-only** and does not alter Lean source, the Challenge, Solution, comparator, metadata, or toolchain. The repository's default `main` contains historical documentation and is **not** a substitute for the verified source commit on the proof branch.

## Exact scope of the proved theorem

Let `G` be any **connected simple graph on eight vertices**, and let `f` be any **admissible eight-point cap in F₃³**. Uniformly sample all **40,320 bijections** from the vertices to the cap, and let `N₀` count the size-four maximal independent vertex sets whose assigned labels sum to zero.

Write `m` for the number of size-four maximal independent sets, `n₀` and `n₂` for their numbers of unordered pairs intersecting in zero and two vertices, and `h` for the number of compatible unordered triples. Define

- `M₁ = 2m/35`
- `M₂ = 2n₀/35 + n₂/315`
- `M₃ = h/315`

The certified theorem gives all four exact probabilities:

```text
Pr(N₀ = 0) = 1 - M₁ + M₂ - M₃
Pr(N₀ = 1) = M₁ - 2M₂ + 3M₃
Pr(N₀ = 2) = M₂ - 3M₃
Pr(N₀ = 3) = M₃ = h/315 ≤ 1/105
```

Equality in the last inequality holds **if and only if** `G` is isomorphic to the named spider `S(2,2,2,1)`. In particular, `N₀ ≤ 3`. The theorem is **unconditional over all admissible caps**: the cap normal-form/orbit result is proved in Lean, not assumed as an external hypothesis.

The Palomar target is `PDIC.palomar_complete_probability_and_spider` in [`Solution.lean`](Solution.lean), relying on the substantive [`S024.lean`](S024.lean) development. Its independent specification is [`Challenge.lean`](Challenge.lean); see [`comparator.json`](comparator.json) and [`formalization.yaml`](formalization.yaml). The target additionally certifies the explicit adjacency characterization of the named spider.

## Remaining work (not open Lean obligations)

**There is no outstanding formalization or full-mechanical-verification gate for the particular theorem stated above.** The earlier missing event counts, unordered factorial moments, unconditional cap classification, complete probability law, and sharp spider iff have all been discharged in the final checked proof.

Remaining project work is separate from theorem correctness: complete the registry's review/registration process; bring the working manuscript into line with the unconditional formal theorem; and, if desired, seek independent human mathematical review and assess novelty/priority. No arXiv or journal acceptance, public registry registration, or novel-priority claim is implied.

## Verification and research history

| Milestone | Historical result |
| --- | --- |
| S007–S010 (16 October) | Kernel-verified graph MIS incidence and named-spider extremal characterization |
| S011–S017 (16 October) | Genuine cap-label permutation, stabilizer and event-fibre proof increments |
| S018–S023 (17 October) | Unordered moments and canonical/conditional probability laws |
| S024–S031 (17–18 October) | Unconditional all-cap normalization and complete flagship Lean theorem |
| S039–S059 (19–27 October) | Diagnostic and repair work on independent exported verification and memory consumption |
| **S060 (28 October)** | **Full original flagship independently checked; all declaration identities matched; standard Palomar FULL PASS at `912b628e`** |

These dated milestones are **historical snapshots**, not the current verification boundary. In particular, old session statements saying `OPEN_IN_LEAN`, `CI_PENDING`, or `Palomar blocked` describe their original dates and are superseded by the verified S060 result. The [previous README at the mechanically verified commit](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/blob/912b628e6df0f4881f56e8f341031ec8d99d4e9e/README.md) preserves the detailed earlier chronology; do not treat its dated work queue as current.

For underlying evidence, see [S060 closeout on the documentation branch](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/blob/main/sessions/S060_CLOSEOUT.md) and [the exact standard FULL run](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40656295590). The working manuscript is [`paper/PDIC_S003R8_DRAFT.tex`](paper/PDIC_S003R8_DRAFT.tex) and may contain older conditional wording; the checked Lean theorem and Palomar metadata take precedence for formal scope.
