# PDIC first-paper manuscript

Current paper: [`PDIC_S003R8_DRAFT.tex`](PDIC_S003R8_DRAFT.tex), substantially revised during S034 (18 October 2026). Title: **Zero-Sum Quartet Incidence and Sharp Maximal-Independent-Set Witnesses on Eight Vertices**.

The TeX manuscript headlines the complete unconditional $P(N_0=0,1,2,3)$ law and the sharp iff-$S(2,2,2,1)$ conclusion. It contains five numbered, cross-referenced TikZ figures: the eight-vertex seven-edge extremal spider, the $C_4$ quartet incidence, an explicit mixed four-MIS witness, the eight-vertex path, and an exact-probability chart; there is also a comparative exact table. Figure and enumeration source is [`check_figures.py`](check_figures.py). See [`S034_BUILD_AUDIT.md`](S034_BUILD_AUDIT.md).

Build locally twice: `pdflatex -interaction=nonstopmode -halt-on-error PDIC_S003R8_DRAFT.tex`. TeX Live produced **six A4 pages**, both passes successful with no remaining LaTeX warnings or unresolved references; the final PDF was rendered and reviewed for mathematical visuals. Generated PDFs/logs are not committed to Git (sources are canonical). An exported PDF is available in the S034 ChatGPT session.

The full all-cap 40,320-labelling theorem is Lean-kernel-verified in the unmerged draft proof PR #4 at immutable commit `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, strict workflow `39120877185`, independent finite `39120877141` (approved axioms only). Main's historical `PDIC.lean` is **not** the formal flagship. The separate official Palomar full mechanical package remains unregistered because Comparator exhausted 16 GiB; the TeX has a plainly unfilled Palomar link placeholder. Neither novelty/priority nor journal suitability is certified, and no paper was submitted.
