# PDIC — S008 parallel bridge proof (supplementary closeout)

**Date:** 16 October 2026. **Status:** STRICT LEAN AND SIX FINITE CHECKERS PASS for the independently completed unordered-triple cardinality bridge; **superseded as the canonical active session by a concurrent, stronger S007 extension.**

## Exact immutable evidence

- Branch: `session/s008-full-h-bridge`, begun from the S007 initial strict-PASS proof `d05fe1e71d054fe74a52a664112b6de436e999da`.
- Successful source commit: [`13863587ba132ec9888c5a34d9b6df509e83aa80`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/13863587ba132ec9888c5a34d9b6df509e83aa80).
- Exact-source [Lean kernel, standard-axiom audit, source-hole check and all six independent finite checkers: PASS, run 38914678646](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914678646); separate [finite lead check PASS, run 38914678640](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914678640).
- Initial attempts `c0ee512...` and `7c8d9d2...` failed due to Lean tactics; errors corrected at `13863587...`. Those attempts are not certificates.
- [Draft PR #6](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/6) **closed as superseded**. No merge or external submission occurred.

## Genuinely proved in Lean on this branch

1. `tripleOfThird` forms the three-set `{s, univ \ s, r}`; it has cardinality exactly three whenever `s` is a complementary four-MIS partition and `r` is a 2+2 third maximal independent set.
2. `tripleOfThird_compatible`: every anchored mixed third constructs a genuine unordered compatible triple, not an ordered surrogate.
3. `compatibleTriple_eq_tripleOfThird`: in a connected graph every genuine triple is this construction for any fixed valid partition and its anchored third.
4. `tripleOfThird_injective_on_mixed`: a third set is uniquely recoverable from its triple.
5. `unorderedTripleAnchoredEquiv`: full inverse-checked equivalence of subtype families.
6. `unorderedCompatibleTripleCount_eq_anchoredMixedThirdCount`: actual count identity for all connected eight-vertex graphs with a valid complementary 4-MIS partition. No-pair zero comes from the original certified S007 source.

The spider's skew 3+1 and 1+3 MIS are not counted as anchored 2+2 third sets. No exhaustiveness claim over all four-MIS is used.

## Concurrent authoritative repo advance and handoff

While this attempt was underway, another continuation on `session/s007-full-lean-flagship` proved the full arbitrary-connected-graph transport `h(G)=B(A)\le3` at [`ff864170834954ef2a286afe6a6b6577ec02f986`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ff864170834954ef2a286afe6a6b6577ec02f986), strict [run 38914271558 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558). That stronger result supersedes the original unfinished S008 remainder.

**Do not replace main's latest `authoritative/STATE.json` or next prompt with this older branch's handoff.** The live canonical next target is [S008 named spider-isomorphism](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/blob/main/research/S008_NAMED_SPIDER_ISOMORPHISM_TARGET.md), which is installed but **has not been executed by this parallel bridge closeout**. The separately created `session/s009-arbitrary-graph-matrix-transport` scaffold is obsolete and is **not an installed next prompt**.

The named spider iff, classical cap input and complete canonical eight-cap uniform-labelling four-term probability theorem remain OPEN_IN_LEAN; priority remains unresolved. No Palomar registration, arXiv/journal submission, external correspondence or main merge was performed.
