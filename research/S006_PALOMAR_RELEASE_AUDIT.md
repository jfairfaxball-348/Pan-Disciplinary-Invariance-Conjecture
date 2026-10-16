# PDIC S006 — Palomar release audit (owner-directed)

Date: 16 October 2026.
Status: **NOT_READY_FOR_OWNER_SUBMISSION until an official PalomarSubmission mode=full mechanical PASS is inspected for this exact source SHA.**
Branch: `session/s006-palomar-prepare`. Source was ported from strictly hosted Lean-verified S003R9 snapshot `402465f2330a275e04108169a6bfbb65e94e10b8` (old Lean run 38890367785). Earlier Lean CI **is not** a Palomar Comparator/NanoDa result.

## Scope: selected genuine graph/matrix certificate — PARTIAL_PAPER_ALIGNMENT

**Public title:** Sharp Mixed Maximal-Independent-Set Bounds for Connected Four-by-Four Bipartite Graphs.

**Public abstract, matching formalization.yaml:** We prove that for every connected simple bipartite graph represented by a Boolean four-by-four adjacency matrix A, the number B(A) of distinct inclusion-maximal independent vertex sets containing two vertices on each side is at most three, B(A) ≤ 3. Moreover B(A) = 3 if and only if A has the explicitly defined row- or column-centred seven-edge spider **matrix** pattern. This certifies the graph appendix, not the manuscript's full cap-labelled distribution or named spider isomorphism.

The compared Lean theorems, with `adj : PDIC.Side → PDIC.Side → Bool`, `hc : (PDIC.matrixGraph adj).Connected`, are exactly:

```lean
PDICSubmission.connected_mixed_bound :
  (adj : PDIC.Side → PDIC.Side → Bool) →
  (PDIC.matrixGraph adj).Connected → PDIC.graphMixedCount adj ≤ 3

PDICSubmission.connected_mixed_equality :
  (adj : PDIC.Side → PDIC.Side → Bool) →
  (PDIC.matrixGraph adj).Connected →
  (PDIC.graphMixedCount adj = 3 ↔
    PDIC.spiderMatrixBV (PDIC.rowsOfAdj adj 0) (PDIC.rowsOfAdj adj 1)
      (PDIC.rowsOfAdj adj 2) (PDIC.rowsOfAdj adj 3) = true)
```

`matrixGraph` is a real `SimpleGraph (Fin 4 ⊕ Fin 4)`; `GraphMIS` requires independence and domination of excluded vertices; `graphMixedCount` counts vertex-set MIS with 2 left and 2 right vertices. The source proves independence-plus-domination equivalent to ordinary inclusion-maximality, and losslessly transfers actual vertex-set count to encoded left-pair witnesses. The spider predicate is a row/column finite matrix pattern, **not** an unproved named graph isomorphism.

`Challenge.lean` reconstructs these underlying mathematical definitions independently of `PDIC.lean`, with two deliberate statement-template `sorry` bodies. `Solution.lean` imports the entire S003R9 proof development and proves both new named wrappers using the certified graph theorems. `comparator.json` selects these two theorems and underlying definition correspondences for Comparator; a successful run is needed to establish whether the isolated Challenge and Solution match under Palomar's exact comparison semantics.

**FULL_FLAGSHIP_NOT_FORMALISED.** The manuscript `paper/PDIC_S003R8_DRAFT.tex` additionally proves (in prose, conditional on external classical nine-cap classification) the random cap-labelling law with `Pr(N₀=3)=h(G)/315 ≤ 1/105`, and equality exactly at the spider `S(2,2,2,1)`. The cap equivalence, arbitrary-graph compatible-triple transport, named spider isomorphism, and random-bijection push-forward are not end-to-end Lean-certified. They are not in this Comparator configuration; no Palomar record should title this narrow certificate as that full law.

## Preflight checklist, evidence and blockers

| Gate | S006 evidence | Verdict |
| --- | --- | --- |
| Theorem fidelity and statement separation | Direct actual graph MIS and spider matrix definitions in Challenge, wrappers in Solution | SOURCE_PREPARED; awaiting Comparator |
| Preserved prior strict Lean proof | S003R9 commit `402465f2330a275e04108169a6bfbb65e94e10b8`; Lean run [38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785) | PREVIOUS_PASS_ONLY |
| v0.4 metadata, genuine authorship/provenance/limitations | Root `formalization.yaml` | PREPARED_NOT_PALOMAR_VALIDATED |
| Root SPDX licence | `LICENSE` MIT; metadata agrees | PREPARED_NOT_PALOMAR_VALIDATED |
| Module-system headers | `PDIC.lean`, `Challenge.lean`, `Solution.lean` ported | PREPARED_NOT_BUILT |
| Frozen 40-character Mathlib dependency | Lakefile and manifest pinned to `065356127b1dc0016f66b7283ce0ce2c4055aa55`; Lean `v4.35.0-rc2` | SOURCE_PINNED_NOT_REBUILT |
| Solution proof holes, Lean kernel axioms | Prior source strict checks only; Solution aliases checked theorem names and includes `#print axioms` | S006_BUILD_NOT_YET_VERIFIED |
| Earlier six Python checkers | Preserved from repository | S006_NOT_RERUN |\n| S006 new independent exhaustive graph check | All 65,536 matrices scanned; 36,317 connected, 192 equality-pattern cases; no failures | LOCAL_FINITE_PASS_ONLY; reproducible by `python3 scripts/verify_s006_palomar_graph.py` |
| Official full-mode PalomarSubmission report at final SHA | Reusable workflow added separately; report must show Comparator and NanoDa/con-ron verification | **NO_VERIFIED_FULL_PASS_AT_CLOSEOUT** |
| Public title = verified statement | Narrow title accurately matches two selected graph/matrix theorems, not paper headline | PROPOSED; publication would require official verification |
| Historical priority and journal significance | S004 read primary sources but did not establish priority | UNRESOLVED |
| Palomar submission/editorial/registration | Not authorised by S006 | NOT_REQUESTED |

Official workflow source pinned to `PalomarRegistry/PalomarSubmission@d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44` (as observed 2026-10-16); docs: [Palomar submission rules](https://palomar-registry.org/how-to-submit). The reusable workflow's advisory run is distinct from a live registry submission.

Until a **concluded successful official mode=full mechanical verification against the final exact immutable commit** exists and is read, no one may call the branch or any commit submission-ready. The root paths for any subsequent *owner-controlled* form are `comparator.json` and `formalization.yaml`, with project path root; no such form has been submitted.

No S007 target is installed. The owner chooses subsequent work.
