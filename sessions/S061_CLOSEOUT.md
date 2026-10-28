# PDIC S061 — illustrated first-paper manuscript closeout

Date: 28 October 2026. Status: manuscript revision, exact finite checks and PDF build COMPLETE; no paper submitted. Base main at session entry: 560b6b74f40f69f36050cd2d37a5b96afbd7b295. Manuscript-only branch: session/s061-illustrated-manuscript. This closeout records writing and visual checking, not a new independent formal theorem proof.

## Output

- paper/PDIC_S003R8_DRAFT.tex — substantially rewritten self-contained 12pt A4 research manuscript, 11 original numbered, cross-referenced editable TikZ figures; title and abstract, complete distribution theorem and proofs, worked comparison, bibliography, provenance/limits and proposed AI declaration.
- paper/check_figures.py — stdlib-only exact canonical cap, graph/MIS, spider-matrix and 40320-labelling audits.
- paper/README.md — current build and source guide.
- Eight-page compiled PDF produced as a ChatGPT conversation artifact at /mnt/data/pdic_s061/PDIC_S003R8_DRAFT.pdf; NOT tracked as a binary in Git. Source is canonical.
- Original source SHA-256: 4349ddc68a6fae510afc4af361f331a390a9e19e2dfd3027f3114c44c96811ea.
- Validator SHA-256: 8e8dc5513a69130263b2ea2ece1f07551a72479f21e386bb25fa6acfcb471819.
- PDF SHA-256: 488f45f735289b5a7d78a027a7966a8df4457d6aec0cde340f939a8715257122.

## Eleven figure subjects, captions and verification basis

1. Sampling model: fixed eight-cap and fixed connected graph, the only randomness is one of 40320 bijections; N0 counts every eligible four-MIS. Checked against definitions.
2. Canonical cap projected coordinate tableau: all eight nonzero paraboloid coordinates retain true z-height; projection explicitly schematic. Verified with the canonical finite-field construction.
3. Atom incidence: A1,A2,B1,B2 are disjoint 2-point atoms generating four Qij. Verified by exhaustive canonical quartet enumeration.
4. Four-cycle C4: exactly four intersecting 2-point-overlap pairs and two disjoint complementary pairs; all three-quartet configurations contain one complementary pair. Exact script check.
5. Spider S(2,2,2,1): exactly eight vertices, seven edges and degrees/arms as drawn. Graph adjacency and h=3 checked.
6. Spider 4-by-4 bipartite matrix: centre adjacent to all opposite-side vertices; each of t1,t2,t3 adjacent to its own u_i; seven edges. Cross-checked against graph edge set.
7. All three mixed spider four-MIS: explicit vertex-set witnesses (2+2 split) independently enumerated; no fourth; h=3.
8. Binomial-moment event orders: singleton 2m/35; complementary-pair 2n0/35 plus overlap-two n2/315; triple h/315. Schematic does NOT assert independent events.
9. P8 eight-vertex path: seven consecutive edges, five size-four MIS, pair counts n0=1,n2=3, h=1. Exact enum.
10. Four-point probabilities on a common zero-based axis: both series derived from exact rational table, labelled decimal rendering of exact fractions.
11. Separate rescaled rare-event bars: 315*P(N0=3)=h=1 for path, 3 for spider. Explicit separate scale, exact 1/315 versus 1/105.

No visual embeds unreliable random sampled frequencies, fake cap-space Euclidean geometry, or invalid fourth spider witnesses.

## Exact independent numerical checks

Run: python3 paper/check_figures.py (stdlib-only). PASS. Canonical cap: precisely four zero quartets with overlap multiset {0:2,2:4}; no zero-sum 1–3 subsets. Spider: 9 total MIS, m=9, n0=1, n2=15, h=3, exhaustive 40320 bijection N0 event counts (23424,13440,3072,384) and exact P=(61/105,1/3,8/105,1/105). Path: 9 total MIS, m=5, n0=1, n2=3, h=1, event counts (31360,6528,2304,128) and P=(7/9,17/105,2/35,1/315). Counts sum to 40320 in each case and match binomial moment inversion.

Run from paper directory: latexmk -pdf -interaction=nonstopmode -halt-on-error PDIC_S003R8_DRAFT.tex. PASS (8-page A4 PDF). Final LaTeX log inspection for Warning, Overfull, Underfull, Undefined returned no matches. PDF rendered page by page to PNG/contact sheet for visual review; after float placement correction final page break and captions inspected. Page-by-page notes: p1 title/abstract and sampling model; p2 main theorem and cap coordinates; p3 atoms, quartet cycle and start of graph argument; p4 extremal spider, adjacency matrix and three mixed witnesses; p5 sharp graph proof and moment diagram; p6 path example, table and probability comparison; p7 rare-event rescaling and start of provenance; p8 disclosure, limits and references. No clipped figures or missing labels noted. PDF not independently subjected to journal template checks.

## Trust, provenance, publication

Mathematical theorem left unchanged. Frozen all-cap full proof package 912b628e6df0f4881f56e8f341031ec8d99d4e9e, official standard Palomar FULL PASS 40656295590. No proof/Challenge/comparator/formalization changes or paid runner. Owner reports Palomar registered PALOMAR-2026-10-28-000025 v1 at https://palomar-registry.org/entry.html?id=PALOMAR-2026-10-28-000025&version=1. Registry page metadata inaccessible for independent inspection during this session; prose reports the owner's attribution, not a new independent registry finding. Proof branch remains unmerged.

Prior-art citations trace the original S004 source audit; priority remains UNRESOLVED and an additional independent, deeper literature comparison is still due. S061 makes no claim of new novelty determination or outside peer review. Proposed AI disclosure states OpenAI ChatGPT substantially assisted proof development, Lean formalisation, writing, figures and checks; final wording requires author approval. No journal/arXiv submission or external contact.

## Owner review and next authority

Owner should read and approve mathematics, diagrams, bibliography, figure design, AI declaration, target venue and any preprint release separately. S062 is automatically installed at research/NEXT_SESSION_PROMPT.md and research/S062_MANUSCRIPT_REVIEW_TARGET.md for a hostile manuscript/priority review and release-candidate preparation. Installing S062 is NOT executing it.
