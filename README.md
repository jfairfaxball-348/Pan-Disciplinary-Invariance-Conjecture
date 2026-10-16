# Pan-Disciplinary Invariance Conjecture (PDIC)

**Mission:** connect finite-group zero-sum quartet geometry and graph maximal-independent-set statistics in a precise first paper. The project name is aspirational.

**CURRENT STAGE (16 October 2026): FULL FIRST-PAPER LEAN FORMALISATION RESUMED. S007 is installed but not executed, and automatic next-session prompt generation has been restored.** The goal is to formalise the **entire** four-term eight-cap probability theorem and unique sharp spider extremiser, not merely register its graph/matrix subtheorem. S006's narrow Palomar preparation is historical and never achieved a matching official full-mode verification PASS. Work from [S007's dedicated Lean-continuation branch](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s007-full-lean-flagship), seeded from the strictly verified S003R9 source. Main retains the earlier S003R3 Lean baseline; the separate S007 branch carries the real current proof source. Read the [S003R9 closeout](sessions/S003R9_CLOSEOUT.md) for evidence.

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

For any new mathematical claim, run `lake build`, strict `#print axioms` audits, the independent Python checkers and hosted CI at the **exact changed SHA**. S003R9's strict proof source is on the new S007 continuation branch; main's old S003R3 library should not be mistaken for the full source. The completed S004 novelty audit leaves priority and significance unresolved; S005 was Palomar reconnaissance; S006 prepared a narrow Palomar submission candidate but did **not** verify the full probability theorem or pass an official matching full-mode check. No PR merge, Palomar registration, arXiv submission, journal submission or author correspondence has been made. **Every executed session now automatically installs the next numbered full-Lean-critical-path prompt**; the owner starts each execution with “run next session.”

**S003R9 final exact-head PASS:** [`402465f2330a275e04108169a6bfbb65e94e10b8`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8), [strict Lean 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785), all six checkers PASS. [Final closeout](sessions/S003R9_CLOSEOUT.md).

## S004 literature verdict (16 October 2026)

The [claim-by-claim audit](research/S004_PRIOR_ART_NOVELTY_AUDIT.md) read the full Follett et al. cap paper, Li–Zhang–Zhang's 2013 graph paper, Nielsen's fixed-k MIS theorem and He–Nie–Spiro's later fixed-k results, and distinguished them from abstract-only Liu (1993), Jou–Chang (1997), and Byskov (2004) access. Cap classification is **classical**, various supporting transformations/counts are **routine**, and the known total-MIS spider extremiser does **not** imply PDIC's exact h statistic by its stated theorem. **Potentially original combination, unresolved historical priority** is the calibrated verdict. The existing strict Lean certificate is unchanged, and the written full probability flagship is not end-to-end kernel-verified. This session did not merge PR #3 or make any submission.

## S005 Palomar reconnaissance — completed 16 October 2026

[S005's official preflight CI/CL and public-register field investigation](research/S005_PALOMAR_RECON.md) establishes how the selected Challenge/Comparator declaration—not just an appealing abstract—defines what Palomar certifies. The [public record proposal](research/S005_PUBLIC_RECORD_PROPOSAL.md) matches the manuscript's exact title and its “We prove…” four-term probability law, but **that full law is not end-to-end Lean formalised**. A separate narrow proposal corresponds to the strictly checked graph/matrix appendix on PR #3. The owner-provided [TreeStack registry example](https://palomar-registry.org/entry?id=PALOMAR-2026-09-25-000010&version=1) could not be fully read through its dynamic JSON; the public UI presentation map was checked against pinned PalomarWeb implementation.

Palomar **NOT READY**: missing Challenge, Solution, comparator.json, formalization.yaml, root licence and required Lean module headers. No Palomar preflight, Comparator, NanoDa, registration or publication was executed. All S003R9 proof evidence and S004 novelty qualifications remain unchanged. [S005 closeout](sessions/S005_CLOSEOUT.md). S006 was subsequently executed on a separate preparation branch, without a full-mode Palomar certificate; the owner has since returned this project to full Lean formalisation.

## S006 historical packaging, superseded as active stage

The completed [S006 Palomar preparation branch](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s006-palomar-prepare) contains a **narrow** graph/matrix Challenge/Solution/Comparator candidate only. The [S006 closeout](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/blob/session/s006-palomar-prepare/sessions/S006_CLOSEOUT.md) reports **NOT_READY_FOR_OWNER_SUBMISSION**. No official full mechanical verification PASS at its final source SHA was established, and no registration occurred. It must not be described as end-to-end formalisation of the first paper.

## S007 active Lean formalisation stage (installed; not executed)

The [S007 full flagship Lean bridge target](research/S007_FULL_FLAGSHIP_LEAN_BRIDGE_TARGET.md) is the installed next session. Its dedicated [proof branch](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s007-full-lean-flagship) begins from the exact previously certified S003R9 mathematical `PDIC.lean` content (`402465f2330a275e04108169a6bfbb65e94e10b8`). The immediate highest-priority missing link is the formal **unordered compatible triple count h(G) → 4×4 actual mixed MIS B(A)** for arbitrary connected eight-vertex graphs, then `h(G)≤3` and equality iff named spider isomorphism. The canonical finite cap/8! labelling probability law and complete single headline theorem must follow, with the classical input stated genuinely and truthfully.

**Automatic handoffs ACTIVE:** Every session closeout must produce and commit a **new fully executable next-session prompt** focused on the greatest open proof obligation, update `authoritative/STATE.json` and `research/NEXT_SESSION_PROMPT.md`, then stop. The prompt is not run automatically; the owner says “run next session.” Palomar is deferred until the complete manuscript theorem has a strict Lean certificate or the owner explicitly redirects.
