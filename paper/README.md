# PDIC illustrated first-paper manuscript — S061

**Current status (28 October 2026):** first illustrated manuscript completed and independently checked; formal proof registered by the owner's report; manuscript **not** submitted to arXiv or a journal. Priority and original-literature comparison remain unresolved.

## Files and reproducibility

- [Editable LaTeX manuscript](PDIC_S003R8_DRAFT.tex): eight-page A4 paper, eleven verified, numbered TikZ figures, complete graph/cap probability theorem and structural proof, bibliography and proposed human-reviewed AI disclosure.
- [Exact visual and event checker](check_figures.py): stdlib-only; canonical cap C4 quartet incidence, spider and path, all 40,320 vertex bijections for each graph, rational binomial moments and event counts.
- [S061 closeout and page/figure audit](../sessions/S061_CLOSEOUT.md).

Run from repo root:

    python3 paper/check_figures.py
    cd paper
    latexmk -pdf -interaction=nonstopmode -halt-on-error PDIC_S003R8_DRAFT.tex

The PDF is built from the editable TeX; it is delivered in the ChatGPT S061 conversation rather than committed as a binary. The final local build succeeded with eight A4 pages and no unresolved references or overfull text. S061 exact finite checker PASS. The registered theorem's proof files were not modified.

## Exact result and provenance

For every fixed admissible eight-point cap in F3^3 minus the origin and every connected simple graph on eight vertices, assign the cap bijectively and uniformly among 8!=40320 labellings. For the number N0 of zero-sum four-vertex inclusion-maximal independent sets, the exact law uses M1=2m/35, M2=2n0/35+n2/315, M3=h/315 and has P3=h/315<=1/105, equality exactly at S(2,2,2,1). The manuscript explains and illustrates the entire distribution, not a weaker graph-only statement.

Certified independent standard Palomar FULL source: [commit 912b628e6df0f4881f56e8f341031ec8d99d4e9e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/912b628e6df0f4881f56e8f341031ec8d99d4e9e), [verification run 40656295590](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40656295590). The owner supplied [Palomar registration PALOMAR-2026-10-28-000025 v1](https://palomar-registry.org/entry.html?id=PALOMAR-2026-10-28-000025&version=1); exact public entry text was not independently readable in S061. Historical S034 notes are superseded by S061; no prior failed Palomar result is the current official status.

Next installed, not executed: [S062 independent review](../research/NEXT_SESSION_PROMPT.md). There is no automatic release or submission.
