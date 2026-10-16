# Pan-Disciplinary Invariance Conjecture (PDIC)

Connect finite-group zero-sum quartet geometry and maximal-independent-set statistics in a precise first paper. The project name is aspirational; literature priority remains unresolved.

**Current stage: complete first-paper Lean formalisation. S012 has committed additional SOURCE_FORMALIZED, CI-UNVERIFIED permutation probability transport and connected-quartet obstructions; the last strictly Lean-verified head remains S011. S011 has strictly certified the typed canonical eight-cap, zero-sum incidence, linear preservation and the 40320-label sample-space cardinality, while S010 certified the genuine connected eight-vertex graph equality `h(G)=3 ↔ G ≃g namedSpider` at [`c8c64e5a2a98`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215), [Lean PASS 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168), eight finite checkers PASS. S011 cap-incidence bridge is executed and Lean-verified at [`e302e5f`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53), [strict CI PASS 38934564596](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596). S012 source-level permutation transport and the connected-quartet obstruction have been attempted, but their fresh hosted Lean certificate was not available at closeout.**

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

**Still open in Lean:** general cap-classification existence (to be supplied as an external hypothesis), permutation-event fibre counting and uniform event probabilities (despite a certified 40320 sample-space cardinality), moments, N₀≤3 and the single integrated four-term distribution. The canonical cap and invariance under a supplied invertible linear map are now Lean-verified. The **graph equality is now certified**, not an open candidate. Conditional rational moment inversion does not replace the probability model. The named spider retains legitimate 3+1 and 1+3 four-MIS.

## Next session and process

[S013 executable prompt](research/NEXT_SESSION_PROMPT.md): certify the S012 candidate and prove actual permutation-event fibres, moments, connected `N₀≤3` and the integrated four-term law. [S011 closeout](sessions/S011_CLOSEOUT.md), [proof note](research/S011_CAP_LABELLING_PROOF.md). S013 is installed automatically; its execution requires a new owner instruction.

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
| S009 source candidate | Unverified universal equality proof, runner exit 143; finite count not a Lean certificate |
| **S010** | **Strict Lean PASS: h=3 iff named spider actual graph isomorphism**, source [`c8c64e5a2a98`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215); [Lean 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168); [finite 38928965172](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965172) |

[Claims](research/CLAIMS.md) · [Roadmap](ROADMAP.md) · [Flagship statement](research/FLAGSHIP_THEOREM.md) · [Manuscript](paper/PDIC_S003R8_DRAFT.tex) · [Session control](research/NEXT_SESSION_PROMPT.md).

No publication submission, Palomar registration, correspondence or PR merge has been performed. The manuscript is a research draft; its older formalisation-scope paragraphs must be updated at the manuscript stage. The full flagship is not yet end-to-end Lean verified.

## S009 attempt and S010 closure (16 October 2026)

S009's universal equality source remained unverified following runner shutdown. S010 replaced the expensive search by a small kernel-checked leaf certificate, explicit hub-row permutations, and kernel-checked matrix transpose. The public `connected_h_three_iff_namedSpider` is now **LEAN_KERNEL_VERIFIED**, exact source [`c8c64e5a2a98ee359c79430293ca0738211b4215`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215), [Lean PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168), [independent finite PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965172). See [full S010 proof note](research/S010_EQUALITY_KERNEL_CERTIFICATE.md). The *cap-labelled four-term probability law* and its all-cap transfer remain **OPEN_IN_LEAN**. [S011 is installed](research/NEXT_SESSION_PROMPT.md), not executed; no external submission or PR merge.

## S011 cap and finite probability increment (16 October 2026)

At [source e302e5f](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53), [strict hosted Lean PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596), canonical F₃³ labels are injected and free of zero sums of sizes 1–3; four-sum zero iff the four canonical quartets; any supplied zero-fixing linear equivalence preserves these facts; real `Equiv.Perm (Fin 8)` has 40320 elements. Independent 40320-labelling enumeration checks 16-element fibres and the complete distributions for the spider and P8, but **universal Lean probability** is still pending. [Details](research/S011_CAP_LABELLING_PROOF.md). [S013 installed](research/NEXT_SESSION_PROMPT.md).

**S011 final hosted proof head:** [7f7e32d](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/7f7e32dda87983c3df619481693af5a4baff5bfd), [Lean CI 38935115211 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211) including new ninth 8!-labelling checker and all eight earlier checkers; [finite CI 38935115324 PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115324). This certifies the typed cap bridge, **not** the complete probability theorem.


## S012 source increment and S013 target (16 October 2026)

S012 executed on proof [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4). Candidate `PDIC.lean` source [4c68728834570cb436944c407d700487c6448002](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002) adds actual permutation sum reindexing, canonical four-zero transport, a genuine finite probability definition, the random MIS count N₀, explicit conditional cap normal form, and connectedness obstructions for fixed and relabelled quartets. **S012 SOURCE_FORMALIZED only**: no fresh exact-source hosted strict CI response was available at session closeout, and local Lean was unavailable. Do not call new declarations kernel verified until independently compiled. Last fully certified proof baseline is [S011 7f7e32d / CI PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38935115211).

The completed four-probability theorem still requires genuine N₀≤3 *cardinality*, 2304/128 Lean event fibres, graph-derived unordered moments, the integrated probability statement and all-cap conditional transfer. [S012 proof note](research/S012_PERMUTATION_AND_SUPPORT_PROOF.md) · [closeout](sessions/S012_CLOSEOUT.md) · [S013 installed, NOT executed](research/NEXT_SESSION_PROMPT.md). Novelty, Palomar registration and submission status remain unchanged.
