# S018 continuation — universal unordered-MIS moment incidence

**16 October 2026; S018 continuation, not execution of installed S019.**
Canonical proof branch `session/s007-full-lean-flagship`, draft PR #4.

## New mathematical theorem candidate

Let \(\mathcal F_G\) denote the genuine finite family of size-four maximal independent vertex sets in an eight-vertex simple graph \(G\). For every true permutation labelling \(e\), let
\[
\mathcal Z_G(e)=\{s\in\mathcal F_G:
  \sum_{v\in s}\mathrm{canonicalCapF3}(e(v))=0\},\quad
N_0(e,G)=|\mathcal Z_G(e)|.
\]
For every \(k\in\mathbb N\), the surviving **unordered** \(k\)-families have cardinality
\[
\left|\{T\subseteq\mathcal Z_G(e): |T|=k\}\right|
=\binom{N_0(e,G)}k.
\]

Double-count the finite set of incidence pairs
\((e,T)\) for which \(T\subseteq\mathcal F_G\),
\(|T|=k\), and every member of \(T\) has zero label sum.
Exchanging the actual two finite sums gives the identity
\[
\boxed{
\sum_{e\in S_8}\binom{N_0(e,G)}k
=
\sum_{\substack{T\subseteq\mathcal F_G\\|T|=k}}
\left|\left\{e\in S_8:
\forall s\in T,\ 
\sum_{v\in s}\mathrm{canonicalCapF3}(e(v))=0
\right\}\right|.
}
\]
This is valid for every graph and every nonnegative \(k\), not just k=2 or 3, and does not impose connectedness or artificially order subsets. It is the missing graph-level *moment incidence* interface; the remaining needed work is to compute the **inner event count** for each real unordered pair/triple, using certified S016/S017 prescribed-source fibre theorems.

Lean candidate declarations in proof-bearing source
[6eb67aa8cb7ae08151fe3074166b7a206f844cd7](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/6eb67aa8cb7ae08151fe3074166b7a206f844cd7):
- `zeroFourGraphMISFamily`
- `zeroFourGraphMISFamily_card`
- `zeroGraphMIS_subfamily_card_choose`
- `zeroGraphMIS_subfamilies_eq_filter`
- `graphMIS_unordered_moment_double_count`

This source is **LEAN_KERNEL_VERIFIED** with only the standard axioms; [strict workflow 38976368670](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38976368670) and [finite workflow 38976368661](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38976368661) both **PASS** at the same SHA. The pinned Lean build, hole scan, all ten independent checkers and the four new `#print axioms` inspections passed. The printed axioms are only `propext`, `Classical.choice`, `Quot.sound`. The earlier S018 first rational moment remains strictly certified.

## Independent sanity check: path P8

Separately enumerated all 40320 canonical cap permutations for the path on the labelled vertices \(0,\ldots,7\) with edges \(i(i+1)\).
Actual four-MIS statistics are \(m=5,n_0=1,n_2=3,h=1\), and the \(N_0\) frequencies are
\((31360,6528,2304,128)\).
The probabilities are therefore
\[
(P_0,P_1,P_2,P_3)
=(7/9,17/105,2/35,1/315),
\]
matching the full written moment law. This check is **FINITE_CHECKED_LOCALLY**, neither hosted proof evidence nor a substitute for the universal formal theorem.

## Remaining exact mathematical obstruction

For \(k=2\), split the real unordered graph-MIS two-subfamilies by intersection size:
overlap 0 has event count 2304, overlap 2 has event count 128, and all other overlaps have event count zero. For \(k=3\), show a zero-event triple has exactly one complementary disjoint pair, with the third overlapping 2+2; its event count is 128. Prove the aggregate cardinality identities for these unordered families and then derive the four probabilities and sharp spider iff. The needed prescribed event-fibre theorems themselves were already kernel checked in S015-S017. Arbitrary-cap normal form remains an explicit classical assumption, novelty/priority is unresolved, and no submission or merge is authorised.
