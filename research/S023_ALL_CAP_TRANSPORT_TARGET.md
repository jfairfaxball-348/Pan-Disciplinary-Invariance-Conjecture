# PDIC S023 — transport the complete canonical flagship to every admissible eight-cap (conditional on the explicit classical normal form)

**Automatically installed at S022 closeout on 17 October 2026. NOT EXECUTED.** The owner's next “Run next session” executes S023 immediately; do not request additional confirmation. Use AGENTS.md, the canonical proof branch `session/s007-full-lean-flagship`, draft PR #4, and strict CI. **Do not use historical main/PDIC.lean, merge PR #4, register Palomar, submit to arXiv/journal, or contact researchers** without separate owner authorisation. At closeout install full S024, unexecuted.

## Certified S022 starting point

The complete first-paper canonical-cap four-event graph law and unique sharp spider extremiser are strictly Lean-kernel verified at source `78273ce1fae09f844009740830b5ca9cdff7f6b7` ([strict Lean PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738861), [finite PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39019738772)). The eight new public declarations `connected_graphMIS_four_event_histogram`, `connected_graphMIS_four_event_expectation`, `connected_graphMIS_probability_mass`, `connected_graphMIS_probability_first`, `connected_graphMIS_probability_second`, `connected_graphMIS_four_probability_moment_law`, `connected_graphMIS_four_probability_law`, and `connected_graphMIS_complete_flagship` printed only `propext`, `Classical.choice`, `Quot.sound`; strict hole scanner and the S020 unordered 40320-labelling checker passed.

Read README.md, ROADMAP.md, authoritative/STATE.json, research/FLAGSHIP_THEOREM.md, research/CLAIMS.md, sessions/S022_CLOSEOUT.md, research/S022_ACTUAL_FOUR_PROBABILITY_LAW.md, paper/PDIC_S003R8_DRAFT.tex and exact branch PDIC.lean. Pin all subsequent source, logs, full Actions success and any failure repairs.

## Primary obligation — actual arbitrary-cap uniform-labelling transport

The written theorem samples a **uniform bijection into any fixed admissible eight-point cap** U in F₃³, not solely the named canonical cap. Existing `ClassicalCapNormalForm` is a **Prop to be supplied as a hypothesis**, not a proved theorem, instance or axiom. Its mathematical claim is an external literature classification of nine-caps. Implement:
1. For an arbitrary injection/label enumeration `f : Vertex → CapPoint` with `IsAdmissibleCap f`, define real `labellingZeroMISCountForCap G f e` and `graphMIS_exact_probability_for_cap G f i`, with the same actual 40320-element uniform `Equiv.Perm Vertex` denominator. Verify all events use *maximal independent four-sets*, never merely independent sets.
2. Assuming `ClassicalCapNormalForm`, obtain explicit `L : CapPoint ≃ₗ[ZMod 3] CapPoint` and `p : Equiv.Perm Vertex` with `f(v)=L(canonicalCapF3(p v))`. Prove for every `e`, the count for `f ∘ e` is the canonical count for `e.trans p` (confirm Lean composition orientation), using `capSum_zero_linear_iff`. Prove `e ↦ e.trans p` is a genuine permutation of the finite sample space and preserves each **event fibre cardinal**, hence every actual probability P₀..P₃. No probability transfer by informal symmetry alone.
3. Deduce a single theorem matching the manuscript's **all admissible U** distribution with formulas
   `P0=1-2m/35+2n0/35+n2/315-h/315`,
   `P1=2m/35-4n0/35-2n2/315+3h/315`,
   `P2=2n0/35+n2/315-h/105`,
   `P3=h/315≤1/105` and `P3=1/105 iff Nonempty (G ≃g namedSpider)`, for connected G, **explicitly conditional on supplied `ClassicalCapNormalForm`**.
4. Explicitly document exactly what is internal Lean proof and what remains an external mathematical input. Do not add a new axiom, constant, hidden instance, vague cap-orbit assertion or an affine translation preserving zero-sum quartets.
5. Independently cross-check P8 and S(2,2,2,1), at all 40320 permutations and at more than one admissible cap if feasible; exact histograms from S022 are respectively `(31360,6528,2304,128)` and `(23424,13440,3072,384)`. Inspect the mathematical manuscript's cap equivalence wording, graph-isomorphism extremiser, all four coefficients, and its now-stale formalisation-status section; prepare justified source/paper alignment, without releasing the paper.

## Verification and hard boundaries

Run pinned `lake build` with every newly advertised `#print axioms` (only `propext`, `Classical.choice`, `Quot.sound`), explicit proof-hole scanner and **all** independent checkers including `scripts/verify_s020_unordered_moments.py`. Record the exact SHA and actual strict hosted Actions run. If compilation fails, repair and verify; if blocked, truthfully close the largest certified increment and install a narrow S024 on the precise obstruction. Keep novelty and priority UNRESOLVED. No merge, external registration, submission or correspondence.

At closeout update README.md, ROADMAP.md, research/CLAIMS.md, authoritative/STATE.json, proof note, sessions/S023_CLOSEOUT.md, research/NEXT_SESSION_PROMPT.md and the draft PR description. Install an **executable S024** under automatic prompt-generation rules; do not run it without the owner's next command.
