# PDIC S034 — paper manuscript and five verified mathematical figures

**Executed 18 October 2026. Status: MANUSCRIPT_WRITTEN_TEX_PDF_BUILT; NOT SUBMITTED; PALOMAR PENDING.** The installed owner directive was executed rather than merely replanned.

## Manuscript produced

- **Revised in place:** `paper/PDIC_S003R8_DRAFT.tex`. Full, unconditional all-cap four-event distribution now appears prominently on page 1; the unique eight-vertex sharp spider is Figure 1 on page 2.
- Main theorem: $P(N_0=0,1,2,3)=(1-M_1+M_2-M_3,M_1-2M_2+3M_3,M_2-3M_3,M_3)$, where $M_1=2m/35$, $M_2=2n_0/35+n_2/315$, $M_3=h/315$, and $P(N_0=3)=h/315\le1/105$ with equality iff $G\cong S(2,2,2,1)$.
- Explicitly fixed old S003R8's obsolete claim that `ClassicalCapNormalForm` remains an external Lean premise. Pointed cap orbit and original full law are kernel-proved in S024 at S031 verified proof SHA. Manuscript faithfully distinguishes historical classical input, internal formalisation and unfinished Palomar full verification.
- Included self-contained prose proofs of canonical quartet pattern, mixed MIS test, connected graph extremal $h\le3$, uniform event counting, moment inversion, and an exact path/spider example. Dropped peripheral pebbling/greedy section from the first paper for focus.
- Figure 1 extremal spider; Figure 2 quartet incidence C4; Figure 3 explicit highlighted mixed witness on 4+4 bipartite drawing; Figure 4 path P8; Figure 5 exact probability bar comparison. Table 1 supplies all four exact probabilities. All are vector TikZ source in the TeX, numbered and cross-referenced.

## Reproducibility and build

- `paper/check_figures.py` independently checks the canonical cap profile, all figure graph incidences, exact $(m,n_0,n_2,h)$ and exhaustive **40,320 labellings for each of path and spider**, all with exact fractions.
- Spider: $m=9,n_0=1,n_2=15,h=3$; event fibres $(23424,13440,3072,384)$.
- Path: $m=5,n_0=1,n_2=3,h=1$; event fibres $(31360,6528,2304,128)$.
- TeX Live `pdflatex` completed **two successful final passes**; **6-page A4 PDF**; final log has no overfull/underfull box messages, unresolved references or warnings. Every PDF page and the five embedded figures were visually reviewed from a rasterised contact sheet.
- Audit log and commands: `paper/S034_BUILD_AUDIT.md`. The user receives a PDF/TeX download from the S034 session. Build outputs remain uncommitted, while editable, reproducible source is committed.

## Formal and publication gates

- **Lean unchanged:** unmerged proof PR #4 at exact SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, strict Lean `39120877185` PASS, finite `39120877141` PASS; only `propext`, `Classical.choice`, `Quot.sound` as printed axioms. Do not confuse main historical `PDIC.lean` with this formal branch.
- **Palomar unregistered:** package PR #24 remains draft/unmerged, official full-mode `39140422199` OOM during Comparator, no Comparator semantic verdict/NanoDa full certificate. The literal **[PALOMAR REGISTRY LINK — PENDING]** remains temporary.
- **No priority claim:** Follett et al. for cap equivalence, Liu and Li–Zhang–Zhang for MIS background; unresolved source-level novelty and independent peer scrutiny. No external journal/arXiv/Palomar submission or correspondence.

## Next session installed: S035 (NOT executed)

Target file: `research/NEXT_SESSION_PROMPT.md`. Owner's next **run next session** executes S035 without another confirmation. Complete installed prompt is reproduced below.

---

# PDIC S035 — independent mathematical manuscript audit and journal-readiness revision

**Installed automatically at S034 closeout on 18 October 2026. NOT EXECUTED.** The owner's next “run next session” authorises the session immediately. This is a manuscript/provenance session, not a new Lean, mathematical-discovery, Palomar-preflight or external submission session.

## Binding baseline

- S034 manuscript: `paper/PDIC_S003R8_DRAFT.tex` on main, complete six-page article with five numbered TikZ figures and an exact distribution table, compiled cleanly using two `pdflatex` passes.
- Full unconditional theorem is Lean-kernel-verified in the unmerged proof PR #4 at canonical immutable proof SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2`: actual 40,320 bijections, any fixed admissible eight-cap in F3^3, any connected eight-vertex simple graph, four P0–P3 coefficients and sharp iff-spider. Strict Lean workflow `39120877185` and independent finite `39120877141` passed with approved axioms only.
- The official Palomar full mechanical run `39140422199` failed due to 16 GiB Comparator OOM; no Comparator semantic verdict, NanoDa completion or registration. The paper correctly includes `[PALOMAR REGISTRY LINK — PENDING]`. Do not fill it without a true registry record.
- Priority and novelty unresolved. Classical nine-cap affine classification (Follett et al.) and MIS literature (Liu; Li–Zhang–Zhang) are acknowledged. Paper mathematical scope remains frozen.
- Do not alter unmerged proof PR #4, package PR #24, main proof `PDIC.lean`, registry metadata or Palomar resources. Do not submit or contact anyone.

## Work, not just review

1. Open the actual current paper and `paper/S034_BUILD_AUDIT.md`, S034 closeout, `research/S002_GREEDY_CHARGE_SPIDER_PROOF.md`, S004 novelty audit, S031 certificate, and the canonical `S024.lean` source at pinned proof SHA.
2. Perform a **line-by-line hostile mathematical audit**: check the cap classification/pointing argument, canonical quartet enumeration, the connected graph $h\le3$ proof (especially the $\ell=3$ and $\ell=4$, seven/eight-edge subcases), all singleton/pair/triple uniform-fibre counts, the moment inversion and both example distributions. Correct errors in the manuscript, not the locked theorem; explicitly flag a gap if found.
3. Independently recheck every figure and caption (eight vertices/seven edges, incidence $C_4$, mixed witness, $P_8$ graph, histogram fractions), using `python3 paper/check_figures.py` and, where needed, direct finite scripts. Check page-one headline and figure order, axes, font sizes, bibliographic DOI metadata, citations and typography.
4. Strengthen journal self-containment: add a short formal-cap-orbit verification appendix or rigorous reproducibility description if appropriate; clearly distinguish a classical cited classification from the Lean-internal finite proof; make graph extremal proof intelligible without relying on 65,536-case enumeration.
5. Continue the S004 source-level novelty/prior-art audit, focusing on graph size-refined maximal-independent-set and finite cap incidence/design literature. Explicitly state what sources were full-text inspected versus only abstracts; never infer originality from absence of a quick search.
6. Revise the same TeX (not a new unrelated paper), compile with the available LaTeX toolchain twice, inspect *all* PDF pages for typography, all figures and warnings, and update `paper/README.md` and audit notes. If build impossible, say precisely why.
7. Commit manuscript revisions, new audit artefacts and `sessions/S035_CLOSEOUT.md` to the repository; update `authoritative/STATE.json` and install a complete S036 prompt automatically. **Do not execute S036** absent the next owner request.

## Success conditions

Math and citation gaps corrected, paper genuinely clearer and stronger for journal review, visible reliable figures and reproducible build, clear distinction between passed Lean and pending Palomar, no novelty/priority overclaim. Handover exact changed commit SHA and full next-session prompt.

