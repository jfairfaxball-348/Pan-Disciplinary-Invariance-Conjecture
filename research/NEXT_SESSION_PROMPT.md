# PDIC-S002 — EXACT GREEDY–CHARGE TRANSFER AND SHARP CONNECTEDNESS: RUNNABLE (FUTURE / UNEXECUTED)

**Execution authorisation:** The owner's next “run next session” instruction or pasted prompt authorises exactly S002, immediately, with no extra confirmation. S003 must NOT be executed in the same invocation.

Repository: https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture

## READ FIRST

Read README.md, AGENTS.md, ROADMAP.md, authoritative/STATE.json, research/CLAIMS.md, research/FLAGSHIP_THEOREM.md, research/S001_CAP_RIGIDITY_PROOF.md, research/S001_PRIOR_ART_AUDIT.md, sessions/S001_CLOSEOUT.md, scripts/verify_s000.py and scripts/verify_s001_independent.py. Check the proof of nine-cap equivalence at Follett et al., *Discrete Mathematics* 337 (2014), Proposition 2.2, without claiming that classification as original.

Pin source commits already recorded:
- Inverse-Zero-Sum-Research 496cefb8e0672d069991f759adbfbc954b70f471, theorem InverseZeroSum.Candidate3.frozenClassification in Candidate3.lean.
- Greedy-Uniformity-on-Trees a4c4493a5fff82dfb085f59de41393b862af63a3.
- TreeStack-Structural-Certificates-for-Stacking-on-Trees e1e437b8d02552b7c7ee0c4c74041b6ac956f063.

## MAIN PROOF TARGET: ONE SHARP THEOREM PACKAGE, NOT PARALLEL INCREMENTAL DRIFT

**A. Freeze the exact law.** For an eight-vertex graph (particularly each tree), choose a uniform admissible 8-cap U, an independently uniform random bijection lambda from vertices to U, and independently generate a maximal independent set I using random-order greedy acceptance. Prove by conditioning that

  Pr(sum_{v in I}lambda(v)=0) = (2/35) Pr(|I|=4),

and every nonzero element a in F_3^3 has probability

  [1-(2/35)Pr(|I|=4)]/26.

Prove the second formula only for the GL-invariant cap law; do NOT assert it for a fixed cap. Check exact P8, K1,7, balanced double-star distributions without relying on floating point. Distinguish distribution of the output I from uniform choice among maximal independent sets.

**B. Freeze true charge conservation.** For any rooted bipartite tree T, define epsilon(v)=(-1)^dist(root,v), and nonnegative initial pebble *channel* counts C_j(v) congruent to epsilon(v)*lambda(v)_j mod 3 for selected vertices v and 0 elsewhere. For each legal standard move removing two channel-j pebbles at v and placing one at neighbouring w, prove that the channel's signed charge Q_j=sum_v epsilon(v) C_j(v) mod 3 is invariant, since -2epsilon(v)+epsilon(w)=-3epsilon(v)=0. Explain that this conserved residue is **not** a full reachability/stackability certificate, and verify compatibility with TreeStack's rooted transfer framework.

**C. Aggressively strengthen before freezing a flagship.** Use the S001 four-quartet C4 and overlap-pair law, not just single-witness mixing, to prove a useful sharp graph theorem or detect its failure. Starting input is ALREADY PROVED in S001: for every connected eight-vertex graph with any cap labelling, at most three zero-sum independent 4-sets occur, and this bound is achieved by an eight-vertex tree with three *maximal* such sets. Seek a genuinely stronger theorem that uses greedy order fibres, a sharp bound or distribution for the random count N0 of charge-zero 4-MIS, or a tight graph-family characterization by overlap statistics. Independently enumerate all 8-vertex tree isomorphism classes and use the actual invariants n_t to identify and **prove** one significant consequence; disprove attractive false universal bounds quickly. Keep a clear novelty gate against existing finite-design and random greedy MIS literature.

Priority is a mathematically nonroutine theorem fit to be sent to Lean in S003, not a dressed-up conditional-probability identity. Freeze exact statements and proof only when justified; explicitly mark classical/elementary material. Do not claim a solved general PDIC conjecture.

## VERIFICATION AND OUTPUTS

1. Run BOTH finite scripts. Add and execute a targeted independent exact-rational verification of newly claimed graph formulas, preferably tree-isomorphism-aware. If using GitHub Actions, inspect actual hosted job conclusion; a workflow file or empty statuses does NOT mean hosted PASS.
2. Record all proof arguments and hostile counterexamples, edge cases, and input SHA provenance.
3. Update claims, roadmap as needed, authoritative/STATE.json, sources, and S002 closeout.
4. Prepare **FULL RUNNABLE S003 Lean prompt** in research/NEXT_SESSION_PROMPT.md, with realistic audited theorem signatures, only if the S002 theorem core is freeze-worthy. Otherwise clearly explain what remains and prepare a proof-first repair session without fake advancement.
5. Commit the verified deliverables to GitHub and include exact links in closeout.

No Lean execution, Palomar, arXiv submission, journal submission or outreach during S002 unless the owner separately instructs it. **Stop after S002.**
