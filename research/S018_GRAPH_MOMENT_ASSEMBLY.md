# S018 — genuine graph-MIS factorial moment bridge

16 October 2026. Canonical proof branch: `session/s007-full-lean-flagship`, draft PR #4.

## Real probability model

For an arbitrary `SimpleGraph (Fin 8)`, define
\[
\mathcal F_G=\{s\subseteq V: |s|=4\text{ and }s\text{ is a maximal independent vertex set of }G\}.
\]
The labelling sample space is the actual symmetric group
\(\Omega=\mathrm{Perm}(V)\), cardinality \(8!=40320\).
For each `e : Equiv.Perm Vertex`, put
\(Z_e(s)=[\sum_{v\in s}\mathrm{canonicalCapF3}(e(v))=0]\).
The genuine random variable is
\(N_0(e,G)=\sum_{s\in\mathcal F_G} Z_e(s)\).

## First-moment double counting — substantive S018 source increment

For *every* graph, not merely a connected graph or a matrix encoding,
\[
\begin{aligned}
 \sum_{e\in\Omega}N_0(e,G)
 &= \sum_{e\in\Omega}\sum_{s\in\mathcal F_G}Z_e(s) \\
 &= \sum_{s\in\mathcal F_G}\sum_{e\in\Omega}Z_e(s) \\
 &= 2304\,|\mathcal F_G|.
\end{aligned}
\]
The last equality invokes the S015 strictly certified **actual** permutation singleton-event fibre \(2304\) for each genuine four-vertex graph MIS \(s\). Dividing by 40320 yields
\[
M_1=\mathbb E[N_0]=\frac{2m}{35}.
\]
An S018 Lean source candidate adds `fourGraphMISFamily`,
`labellingZeroMISCount_eq_family_filter` and
`graphMIS_first_moment_numerator`. Its status must be assigned by the
exact-source strict hosted CI: source text alone is **SOURCE_FORMALIZED**,
not a kernel certificate.

## Remaining second/third moment incidence obligation

Let \(\mathcal P_2(G)\) be the **unordered** two-element subsets of
\(\mathcal F_G\), and let \(\mathcal P_3(G)\) be the analogous
three-element subsets. Then for each labelling e,
\(\binom{N_0(e,G)}2\) (resp. \(\binom{N_0(e,G)}3\))
is the number of members of \(\mathcal P_2(G)\) (resp.
\(\mathcal P_3(G)\)) all of whose constituent four-MIS have
cap-zero sum.

For distinct cap-zero quartets, intersections are only 0 or 2
(the S014 strictly certified predicate), so the pair moment partitions
by disjoint and overlap-two sources. The S016/S017 certified
permutation fibres give respectively 2304 and 128 favourable
labellings for each such pair. This predicts
\[
\sum_e\binom{N_0(e,G)}2=2304 n_0+128n_2.
\]
For any three distinct cap-zero quartets, one pair is disjoint.
For three distinct four-subsets of an eight-set, at most **one**
pair can be disjoint: if s is disjoint from t and u then
t=u=V\\s, violating distinctness. Thus a compatible unordered
triple has a *unique* complementary pair; the other two
intersections have size 2. Every compatible real three-MIS event
has the certified 128 source permutations (S017), predicting
\[
\sum_e\binom{N_0(e,G)}3=128h.
\]
The remaining Lean job is a complete proof of these unordered
family-cardinality double counts; do not replace them with ordered
pairs/triples or postulate their identities.

For connected graphs, S013 proved \(N_0\le3\).
Consequently the four exact probabilities follow by binomial
inversion, and S010's certified \(h\le3\) plus
\(h=3\iff G\cong S(2,2,2,1)\) closes sharpness *once* the real
third-moment equality is kernel checked. Without the second and third
moment bridges the full flagship remains **OPEN_IN_LEAN**.

## Publication and provenance

The canonical cap incidence/fibres use only S011-S017 actual
permutations; the arbitrary-cap normal form remains an **explicit
classical hypothesis**, never an axiom. Mathematical priority remains
unresolved. No Palomar registration, PR merge, arXiv or journal
submission is authorised by this session.
