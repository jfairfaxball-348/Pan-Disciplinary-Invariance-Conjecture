# PDIC S003R9 — completed, 16 October 2026

**EXECUTED; bounded formal-appendix fallback used for the remaining full flagship. S004 PRIOR-ART/NOVELTY AUDIT SUBSEQUENTLY OWNER-INSTALLED; NOT EXECUTED.**

## Verified result

On unmerged [PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), exact source SHA [`8199e6bc41dc9801a95b1f19ece0c186c1791995`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/8199e6bc41dc9801a95b1f19ece0c186c1791995) passed [strict hosted Lean 38889327092](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38889327092) and [separate finite workflow 38889327050](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38889327050). Hosted steps passed pinned Mathlib/lake build, axiom and placeholder audits, and all five original Python checkers. The sixth checker added in this session passes locally and is integrated into both workflows. The earlier core-only pass is 86869bb09872be9c9edae27bd0bc05a0b0398079 / 38889060304. Failed API-adaptation candidates are not certificates.

Fifteen new declarations are strictly verified, including a constructed equivalence:

- A genuine `SimpleGraph (Fin 4 ⊕ Fin 4)`, and independence/domination iff maximality under inclusion.
- Exact equivalence between actual mixed graph MIS vertex sets and eligible matrix left pairs; their Fintype cardinalities agree.
- General connected proper Boolean-colouring uniqueness, and complementary independent partitions unique up to exchange.
- Exact occupied-cell ↔ unordered graph-edge bijection, avoiding an orientation factor of two.
- Actual connectedness implies at least seven edges, hence **at most three mixed MIS vertex sets**, with equality iff the certified row/column spider matrix pattern.

The pattern conclusion is not a named graph-isomorphism theorem. The count is actual mixed vertex sets, not all four-MIS or the full arbitrary-graph h statistic. Every printed new declaration depends only on a subset of `propext`, `Classical.choice`, `Quot.sound`; no proof holes, native evaluation or custom axioms are accepted. The walk agreement theorem uses only `propext`; Boolean-colouring uniqueness uses `propext` and `Quot.sound`.

## Written mathematics and primary-source comparison

[Detailed research note](../research/S003R9_GRAPH_WITNESSES_AND_SCOPE.md) gives the explicit bijections, connectedness argument and remaining proof interface. The [revised manuscript](../paper/PDIC_S003R8_DRAFT.tex) corrects the cap transport to a linear map fixing zero and proves uniformity via exactly 16 bijections per compatible image triple. Its probability proof therefore counts an actual push-forward of uniform bijections.

A concrete comparison within the classical B(2,3) tree family separates the statistic: the spider and a split-arm tree both have nine total MIS; their four-MIS counts are nine/six, h counts three/one, and triple probabilities 1/105 versus 1/315. The new `scripts/verify_s003r9.py` enumerates actual MIS and all 2520 atom assignments, checking eight favourable assignments per compatible triple. FINITE_CHECKED, not Lean or priority.

Primary sources were Follett et al. Proposition 2.2, the accessible Liu 1993 publisher abstract, and Li–Zhang–Zhang 2013 Lemma 3 with the Jou–Chang reference. The full Liu theorem text was not obtained. Neither different statistics nor absent title matches establishes novelty. The TeX compiled twice into five pages without warnings/overfull boxes; rendered pages were visually inspected. The temporary PDF was layout QA, not a separately published artifact.

## Remaining formal flagship boundary

1. Construct the enumeration/isomorphism from an arbitrary balanced complementary pair in connected G to a matrixGraph, with MIS transport.
2. Define genuine unordered compatible triples and prove their cardinality equals the actual mixed graph count using the now-certified unique partition; prove h=0 when no such pair exists.
3. Construct an isomorphism from the certified row/column pattern to the named spider.
4. Build uniform finite labellings with regular fibres, connect quartet charge incidence, and sum moments to obtain the actual random law. Classical nine-cap classification remains external.

The **full written h≤3/spider/probability theorem is not end-to-end formalised**. The session freezes a defensible strictly certified graph/matrix appendix and a qualified manuscript, as the S003R9 fallback required. Main remains at its older Lean source baseline; no PR merge, other-repository edit, correspondence, Palomar, arXiv or journal submission occurred.

## Owner-directed process update — 16 October 2026

The owner withdrew the previously prepared S004 brief and retired automatic next-step suggestions and next-session prompt generation. S003R9 remains closed with the results and certificates above. The owner subsequently installed S004 as a prior-art and novelty audit; it has not been executed. Historical versions preserve the earlier proposed brief; it is not active authorisation.

## FINAL EXACT-HEAD CERTIFICATE

PR #3 final head [`402465f2330a275e04108169a6bfbb65e94e10b8`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8) passed [strict Lean 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785) and [separate finite 38890368126](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890368126). All SIX finite checkers passed in the strict workflow, as did the kernel build and standard-axiom/proof-hole audits. The Lean source is byte-for-byte identical to source certificate `8199e6bc41dc9801a95b1f19ece0c186c1791995`. Final manuscript includes the nonempty zero-sum hypothesis and the direct canonical-nine-cap argument; its final five-page rendering was rechecked. Working tree clean; PR open, unmerged. The owner withdrew the combined prepared S004 brief and subsequently installed a prior-art and novelty audit target. S004 has not been executed.
