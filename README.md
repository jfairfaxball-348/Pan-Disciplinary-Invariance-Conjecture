# Pan-Disciplinary Invariance Conjecture (PDIC)

Connect finite-group zero-sum quartet geometry and maximal-independent-set statistics in a precise first paper. The project name is aspirational; literature priority remains unresolved.

**Current stage: full flagship Lean formalisation. S009 proposed universal h=3 iff named-spider graph-isomorphism Lean code but did NOT attain strict kernel certification (runner terminated, exit 143, during `lake build`). S010 structural repair is installed; S007/S008 previously certified facts remain valid.**

## What is now strictly verified

At exact source [`ff864170834954ef2a286afe6a6b6577ec02f986`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/ff864170834954ef2a286afe6a6b6577ec02f986), [hosted Lean run 38914271558: PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558), the public declaration `connected_unorderedCompatibleTripleCount_le_three` proves

    For every connected SimpleGraph (Fin 8), h(G) ≤ 3.

Here h counts genuine **unordered sets of three** size-four maximal independent vertex sets: a disjoint complementary pair and a third set meeting each side in two vertices. Lean constructs the balanced side enumerations and an actual graph isomorphism to a 4×4 matrix graph; it proves the MIS/triple transport and h=B count equivalence. These are constructed proofs, not assumptions of the bound. All seven independent checkers pass and all audited axioms are standard.

[Proof scope and dependency chain](research/S007_UNORDERED_GRAPH_BRIDGE.md) · [S007 continuation closeout](sessions/S007_EXTENSION_CLOSEOUT.md) · [draft PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4).

**Canonical proof branch:** `session/s007-full-lean-flagship`. Main retains its historical S003R3 `PDIC.lean`; read the certified branch/commit, not main's old source. The temporary `session/s008-full-h-bridge` scaffold is superseded. S008 was executed on this canonical proof branch; its partial scope and current CI are documented below.

## Remaining mandatory Lean gate

The manuscript's entire theorem remains the target. For a connected eight-vertex graph labelled uniformly by an admissible eight-cap, write m for the four-MIS count, n₀/n₂ for unordered pair overlap counts and h for compatible triples. Put M₁=2m/35, M₂=2n₀/35+n₂/315, M₃=h/315. The written theorem is

    Pr(N₀=0)=1−M₁+M₂−M₃;  Pr(N₀=1)=M₁−2M₂+3M₃;
    Pr(N₀=2)=M₂−3M₃;     Pr(N₀=3)=M₃≤1/105,

with equality precisely at the named spider S(2,2,2,1). The classical nine-cap classification is an explicitly cited external input to the written proof.

**Still open in Lean:** strict certification of S009's candidate matrix spider-pattern to named-spider graph isomorphism and hence the equality iff theorem; honest cap/classical-input transfer; the genuine uniform 8! bijection model and regular 16-element fibres; moments, N₀≤3 and the single integrated four-term theorem. Conditional rational moment inversion is already certified, but does not replace a probability-space proof. The spider has valid 3+1 and 1+3 four-MIS; the mixed family does not exhaust its MIS.

## Next session and process

[S010 executable prompt](research/S010_SPIDER_KERNEL_CLOSURE_TARGET.md): replace S009's expensive global permutation search by a constructive eight-case hub normalisation and obtain strict kernel PASS for the universal equality theorem. [S009 proof note](research/S009_SPIDER_MATRIX_PERMUTATION_CANDIDATE.md) and [closeout](sessions/S009_CLOSEOUT.md) record exact limitations.

The full probability theorem and uniquely sharp named extremiser must both pass strict Lean before returning to Palomar preparation, unless the owner redirects. A narrower certificate is not project completion.

## Evidence and history

| Milestone | Scope and evidence |
| --- | --- |
| S001–S002 | Written quartet/probability/spider theorem, with explicit classical cap input |
| S003R8 | Strict arbitrary Boolean-matrix count and extremal certificates; `1e4cadd580b385e0d8e69e836f3211129e705839`, run 38887318919 |
| S003R9 | Actual matrixGraph/MIS counts, connected partition uniqueness, edge count and connected mixed bound; `402465f2330a275e04108169a6bfbb65e94e10b8`, run 38890367785 |
| S004 | Primary-source novelty audit; classical cap/baton ingredients, exact combination potentially original but priority unresolved |
| S005–S006 | Palomar reconnaissance and separate narrow package; no official full-mode verification or registration |
| S007 initial | Unordered-triple structure; `d05fe1e71d054fe74a52a664112b6de436e999da`, run 38912238607 |
| S007 continuation | Exact unordered count, constructed arbitrary-graph transport and h≤3; `ff864170834954ef2a286afe6a6b6577ec02f986`, run 38914271558 |
| S008 partial | Actual named `SimpleGraph`, canonical 4×4 graph isomorphism, connectedness, and named h=3; STRICT LEAN PASS with all eight independent checkers; exact source `fc8581d0bd117cd66c4497fa16209e3480c65ec7`, [run 38918496261](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38918496261). Written arbitrary-pattern normalisation and 192 finite cases, **not** universal Lean iff. |

[Claims](research/CLAIMS.md) · [Roadmap](ROADMAP.md) · [Flagship statement](research/FLAGSHIP_THEOREM.md) · [Manuscript](paper/PDIC_S003R8_DRAFT.tex) · [Session control](research/NEXT_SESSION_PROMPT.md).

No publication submission, Palomar registration, correspondence or PR merge has been performed. The manuscript is a research draft; its older formalisation-scope paragraphs must be updated at the manuscript stage. The full flagship is not yet end-to-end Lean verified.

## S009 attempted universal equality (16 October 2026)

[Proof source 59d34387](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/59d34387f4a8bd299a37034d4ed878cba7be3e8d) proposes actual row/column graph isomorphisms and the universal equality iff theorem. Independent enumeration validates all 192 spider-pattern permutations, but [strict CI run 38922840797](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38922840797) failed at `lake build` due to runner shutdown (143), without a compiler diagnosis. Full checks skipped: **NOT LEAN_KERNEL_VERIFIED**. [S010](research/S010_SPIDER_KERNEL_CLOSURE_TARGET.md) is installed to repair this specific proof bottleneck. First-paper cap transfer and four-term probability formalisation remain mandatory. No submission or merge.
