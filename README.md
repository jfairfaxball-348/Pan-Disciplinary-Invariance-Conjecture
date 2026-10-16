# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** connect finite-group zero-sum quartet geometry and graph maximal-independent-set statistics in a precise first paper. The project name is aspirational.

**S003R9 COMPLETED. Owner-directed sessions: S004 target unassigned.** The source is on [unmerged PR #3](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/3), branch `session/s003r4-numerical-semantic`. Main retains the earlier S003R3 Lean baseline; documentation on main describes the separately certified PR source. Read the [S003R9 closeout](sessions/S003R9_CLOSEOUT.md) for exact final SHA and workflow evidence.

## Strictly certified foundation

S003R8 at `1e4cadd580b385e0d8e69e836f3211129e705839`, [Lean 38887318919](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38887318919), proved all three arbitrary Boolean 4×4 matrix extremal statements and exact numerical/semantic counts.

S003R9 at `86869bb09872be9c9edae27bd0bc05a0b0398079`, [Lean 38889060304](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38889060304), further certifies:

- A genuine `SimpleGraph (Fin 4 ⊕ Fin 4)` and exact maximal-independent-vertex-set semantics.
- A proved equivalence between mixed graph MIS vertex sets and matrix left-pair witnesses, giving exact cardinality equality.
- At least six edges imply at most three mixed graph MIS; under at least seven edges, equality is exactly the certified row/column spider matrix pattern.
- Proper Boolean colourings, hence complementary independent partitions, of any connected finite graph are unique up to exchanging sides.

At exact source `8199e6bc41dc9801a95b1f19ece0c186c1791995`, [Lean 38889327092](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38889327092) also **PASS** certifies the actual graph edge count, the connected seven-edge lower bound, and **connected B≤3 with equality iff the certified spider matrix pattern**. Only standard axioms are accepted. The full arbitrary-graph unordered-triple h=b equivalence, named graph-isomorphism and uniform probability semantics remain separate obligations.

## Written first-paper result

For a connected eight-vertex graph G, label its vertices uniformly by a fixed admissible eight-cap. Let N0 count zero-sum four-MIS, m count four-MIS, n0/n2 count pairs with overlaps 0/2, and h count compatible unordered triples. With M1=2m/35, M2=2n0/35+n2/315 and M3=h/315,

    Pr(N0=0)=1−M1+M2−M3;  Pr(N0=1)=M1−2M2+3M3;
    Pr(N0=2)=M2−3M3;     Pr(N0=3)=M3≤1/105.

Equality in the final bound holds precisely at the spider S(2,2,2,1), as a written theorem using an explicitly external classical nine-cap classification. This complete flagship is **not** yet an end-to-end Lean theorem.

The [revised manuscript](paper/PDIC_S003R8_DRAFT.tex) supplies the zero-fixing linear cap transfer, equal 16-element labelling fibres, and a concrete comparison: two classical nine-MIS trees have h=3 and h=1. This distinguishes the statistic from total MIS count, and does not establish novelty.

[Claims](research/CLAIMS.md) · [Roadmap](ROADMAP.md) · [S003R9 proof/scope](research/S003R9_GRAPH_WITNESSES_AND_SCOPE.md) · [Session control](research/NEXT_SESSION_PROMPT.md).

Reproduce the pinned `lake build`, strict `#print axioms` audit and six Python checkers in `scripts/`. The sixth checks the prior-art separation examples and all 2520 atom assignments. No PR merge, author correspondence, Palomar/arXiv/journal submission has occurred. The owner supplies each session target. Closeouts report completed work and verification without suggesting a next step or generating a next-session prompt. The former S004 brief is withdrawn; S004 awaits the owner's target.

**S003R9 final exact-head PASS:** [`402465f2330a275e04108169a6bfbb65e94e10b8`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8), [strict Lean 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785), all six checkers PASS. [Final closeout](sessions/S003R9_CLOSEOUT.md).
