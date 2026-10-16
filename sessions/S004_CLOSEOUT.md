# PDIC S004 — prior-art and novelty audit closeout

**Date:** 16 October 2026  
**Status:** EXECUTED / COMPLETED (bounded literature audit)  
**Owner instruction:** run the previously installed S004 primary prior-art and novelty audit; do not propose or install another target.

## Opening exact inputs

- Main opening head: [`cc725e443d39685fc901669bb28c26b58a574783`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/cc725e443d39685fc901669bb28c26b58a574783), which had the owner-installed [S004 scope](../research/S004_PRIOR_ART_NOVELTY_AUDIT_TARGET.md) and older S003R3 Lean baseline.
- [Unmerged proof PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3) audit-opening head [`da6e148f56dae2d67c872518a136faf801978c42`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/da6e148f56dae2d67c872518a136faf801978c42). Frozen S003R9 exact verified source [`402465f2330a275e04108169a6bfbb65e94e10b8`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8): [strict Lean PASS 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785), [independent finite PASS 38890368126](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890368126).
- Evaluated [written theorem](../research/FLAGSHIP_THEOREM.md), [detailed S002 proof](../research/S002_GREEDY_CHARGE_SPIDER_PROOF.md), [S003R9 graph/Lean boundary](../research/S003R9_GRAPH_WITNESSES_AND_SCOPE.md) and [five-page working LaTeX manuscript](../paper/PDIC_S003R8_DRAFT.tex).

## Completed research and evidence

The full [source-located audit](../research/S004_PRIOR_ART_NOVELTY_AUDIT.md) makes claim-by-claim verdicts, explicit mathematical comparisons, and states text-access limits. Full primary source inspection included Follett–Kalail–McMahon–Pelland–Won (2014), **Proposition 2.2**; Li–Zhang–Zhang (2013), **Lemma 3 / Theorem 2(i)**; Nielsen (2002), **Theorem 2**; and He–Nie–Spiro (2022), **Theorems 1.3 and 1.6**. The Liu (1993), Jou–Chang (1997), Byskov (2004) materials available were **publisher abstract/indexing only**; their full theorem-level overlap was **not** excluded.

| Claim | S004 novelty verdict | Significance of comparison |
| --- | --- | --- |
| Nine-cap affine classification | **CLASSICAL / SUBSUMED** | Follett et al., Prop. 2.2 supplies the exact external cap input |
| Zero-fixing map, canonical four quartets, C4 incidence, orbit counting | **ROUTINE_DERIVED** | Precise but elementary consequences of known classification/finite computation; not a new cap classification |
| Spider among trees with nine total MIS | **CLASSICAL / SUBSUMED** | The classical baton extremisers encompass the spider |
| General fixed-cardinality MIS enumeration | **CLASSICAL** | Nielsen and later graph-theoretic work already study k-MIS counts |
| Exact 4×4 mixed 2+2 count thresholds and connected h≤3/spider equality | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE; priority UNRESOLVED** | Examined theorems do not directly state h. Spider and split baton both have nine total MIS but h=3 versus 1, so total-MIS extremality alone does not determine h |
| Four-quartet random-labelling entire N0 distribution, 1/105 spider probability | **POTENTIALLY_ORIGINAL_WITH_STATED_EVIDENCE** as a specialised combination; **UNRESOLVED priority** | No exact matched graph/finite-cap result located in inspected sources; fibre counts, moments and constants themselves are routine |
| Greedy zero-charge formula, signed mod-three pebble conservation, abstract C4 nerve | **ROUTINE_DERIVED** | No independent cross-discipline breakthrough supported |
| Literature priority and journal-level mathematical significance | **UNRESOLVED** | Small fixed-eight-vertex theorem, non-exhaustive web review, three full texts inaccessible |

**Overall conclusion:** The project is an exact and partly formally verified finite geometry/graph-probability synthesis, not an established new pan-disciplinary invariance principle. Strong novelty or priority cannot responsibly be advertised. The mathematically distinctive specific h / cap-label-count combination is an *unmatched specialisation in the bounded accessible comparison*, and even its priority remains **UNRESOLVED**. This is neither a negative mathematical proof nor an assertion of historical originality. No target theorem was silently changed to rescue the audit.

## Repository changes and verification

- Added [S004 source-backed audit](../research/S004_PRIOR_ART_NOVELTY_AUDIT.md), initial audit commit [`fe2a47ddd578100e8473b0dff637142c5de4f263`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/fe2a47ddd578100e8473b0dff637142c5de4f263).
- Updated [claim register](../research/CLAIMS.md) with per-family novelty tags, without modifying proved/formalised vs written statuses; commit [`50c26d94387cad0c5fa1c9385bae36df66841480`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/50c26d94387cad0c5fa1c9385bae36df66841480).
- Updated [authoritative state](../authoritative/STATE.json) to `last_completed_session=S004`, `S004 completed`, `no next owner target installed`, and novelty priority **UNRESOLVED**; commit [`3e56ac4e0da3638cc36682eb7e2762f371f679c7`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/3e56ac4e0da3638cc36682eb7e2762f371f679c7).
- Changed [owner session control](../research/NEXT_SESSION_PROMPT.md) to a no-next-target compatibility record; marked [installed S004 target](../research/S004_PRIOR_ART_NOVELTY_AUDIT_TARGET.md) executed; updated [README](../README.md) and [historical roadmap](../ROADMAP.md). No later session prompt was generated.
- Audit evidence is from actual primary PDF text, openly qualified publisher abstracts, direct hypothesis/statistic comparisons and recorded pre-existing strict CI certificates. **No new Lean build or formal code change was undertaken by S004**, and **no new full-theorem CI certificate is claimed**.

## Closed scope and residual facts

The full written graph h/isomorphism/probability result remains **not end-to-end Lean formalised**. The certified finite 4×4 and actual SimpleGraph appendix on PR #3 remains exactly as before. Literature priority and publication significance remain unresolved because the audit could not access all relevant complete primary theorems or exhaust the literature. These are **status observations only**, not automatically selected future tasks.

No PR merge, change to any other research repository, new manuscript drafting, author correspondence, Palomar, arXiv or journal submission. The owner-directed session is closed **without suggesting, selecting or installing a next target**.
