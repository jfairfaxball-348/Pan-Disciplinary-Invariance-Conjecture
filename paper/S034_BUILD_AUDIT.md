# PDIC S034 — independent source, figure and TeX build audit

Date: 18 October 2026. Output: `paper/PDIC_S003R8_DRAFT.tex`. The source was rewritten from the existing S003R8 draft, retaining the paper-aligned title; no change to frozen mathematics.

## TeX build and page-level check

- TeX Live `pdflatex -interaction=nonstopmode -halt-on-error PDIC_S003R8_DRAFT.tex` executed for **two final consecutive passes**: both exit status 0.
- Final PDF: **6 pages, A4**, approximately 309 kB. Final pass: **no undefined references, no overfull/underfull boxes, no LaTeX warnings**.
- Rasterised all six pages at 120 dpi and examined contact sheet for page breaks, figures, captions, title/main theorem and bibliography. Figures 1--5 all visible, captions and references display correctly. No table overlaps or clipped images observed.
- PDF and local build logs are distributed as S034 user-facing session artefacts, not checked into Git to keep the manuscript source self-contained. The TeX itself contains all editable TikZ diagrams.

## Figure-specific mathematical checks

1. **Figure 1:** spider edges `01,12,03,34,05,56,07`, so 8 vertices and 7 edges; arms lengths 2,2,2,1; $h=3$.
2. **Figure 2:** four quartets $Q_{ij}=A_i\cup B_j$ on four disjoint two-point atoms: exactly two opposite disjoint pairs, four adjacent pairs of overlap 2. Four-cycle $C_4$ check against explicit canonical $U$.
3. **Figure 3:** bipartite spider $A=\{c,t_1,t_2,t_3\}$, $B=\{s,u_1,u_2,u_3\}$, witness $R=\{t_1,t_2,s,u_3\}$ independent and inclusion-maximal; $|R\cap A|=|R\cap B|=2$. There are three such mixed witnesses.
4. **Figure 4:** path edges $01,12,23,34,45,56,67$ on eight vertices, $m=5,n_0=1,n_2=3,h=1$.
5. **Figure 5:** bars render the exact Table 1 fractions, not independently fitted measurements. Spider $P=(61/105,1/3,8/105,1/105)$, path $P=(7/9,17/105,2/35,1/315)$.

## Independent finite reproducibility

Run `python3 paper/check_figures.py` (stdlib-only). It:
- constructs the paraboloid cap, verifies four and only four zero quartets and the exact $C_4$ overlap profile, and excludes all 1--3-subset zero sums;
- enumerates maximal independent sets and $(m,n_0,n_2,h)$ for both graphs;
- enumerates all **40,320** uniform vertex-labelling permutations per graph and compares exact $N_0$ histograms against the moment formula.
- Expected event histograms (P0,P1,P2,P3): spider **(23424,13440,3072,384)**; path **(31360,6528,2304,128)**; both sum to 40320 and pass exact rational calculations.
- These direct checks corroborate the paper's figures/examples; they are not substitutes for the universal Lean formalisation.

## Lean / Palomar / novelty scopes

The theorem is already strictly kernel-verified at the immutable *unmerged* canonical proof commit `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, with exact source Lean `39120877185` and finite `39120877141` both PASS. Printed axioms: only `propext`, `Classical.choice`, `Quot.sound`. The S024 pointed cap-orbit classification is proved internally. No new Lean run was needed for manuscript-only changes.

Official Palomar full run `39140422199` did not pass: Comparator OOM at 16 GiB with no semantic verdict or NanoDa completion; the paper includes **[PALOMAR REGISTRY LINK — PENDING]**. No registry record, journal submission, arXiv upload or PR merges. Novelty and literature priority remain unresolved, including possible prior equivalent graph-design/MIS statements. S035 will audit proof exposition and source coverage.
