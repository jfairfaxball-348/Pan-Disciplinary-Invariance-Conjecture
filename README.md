# Pan-Disciplinary Invariance Conjecture (PDIC)

Connect finite-group zero-sum quartet geometry and maximal-independent-set statistics in a precise first paper. The project name is aspirational; literature priority remains unresolved.

**Current stage: full flagship Lean formalisation. S008 executed: the concrete named-spider isomorphism and h=3 witness compile with standard axioms; complete equality iff a named spider remains OPEN_IN_LEAN. S009 universal spider normalisation is now installed, not executed.**

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

**Still open in Lean:** the universal implication from an arbitrary spider-pattern matrix to an actual named-spider graph isomorphism, hence the completed equality iff statement; honest cap/classical-input transfer; the genuine uniform 8! bijection model and regular 16-element fibres; moments, N₀≤3 and the single integrated four-term theorem. Conditional rational moment inversion is already certified, but does not replace a probability-space proof. The spider has valid 3+1 and 1+3 four-MIS; the mixed family does not exhaust its MIS.

## Next session and process

[S009 executable prompt](research/S009_SPIDER_PATTERN_ISOMORPHISM_LEAN_TARGET.md): finish the explicit arbitrary row/column-pattern to actual graph-isomorphism proof and compose `h(G)=3 ↔ G ≃g namedSpider`. S008's concrete spider and written constructive normalisation are already in [the S008 proof note](research/S008_NAMED_SPIDER_NORMALISATION.md) and [closeout](sessions/S008_CLOSEOUT.md). Say **“run next session”** to execute it. At every closeout, automatically write, install and commit the next numbered prompt; do not run it without a new owner instruction.

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
