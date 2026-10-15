# PDIC: short proof-first roadmap

**S002 complete 2026-10-15; next is exactly S003.** Mathematical core is frozen subject to actual specialist prior-art checking. An aggressive four-session objective, not a guarantee.

| Session | Work | Exit |
| --- | --- | --- |
| S001 — DONE | Classical-input 9-cap rigidity, 702 eight-caps; four-quartet C4 incidence, pair-zero law and sharp connected-graph three-independent-witness cap. | Structural proof and two finite checkers. |
| S002 — DONE | Exact random greedy/ternary-channel transfer, **full distribution of number of zero-four-MIS**, sharp **Pr(N0=3)<=1/105 iff S(2,2,2,1)**. | Structural proof independent of enumeration, dedicated rational checker, claims frozen. |
| S003 — NEXT | Formalise one precise graph–quartet incidence theorem and its sharp spider corollary, plus greedy/charge lemmas, in Lean 4. Do not replace geometric classification with unapproved axioms or opaque computed output. | Kernel-proved declarations, axiom scan, hosted CI; list any uncertified parts explicitly. |
| S004 — CONDITIONAL | Specialist novelty and source audit, write paper/main.tex with proofs/references and proof–Lean correspondence, compile PDF if feasible. | Honest manuscript draft or research note if significance gate fails. |

**Important boundary:** the greedy law Pr(sum lambda(I)=0)=(2/35)Pr(|I|=4) needs at least one graph edge; edgeless G is a counterexample. Uniform distribution of nonzero charges additionally needs the random GL-invariant cap, not a fixed cap. Three-channel charge conservation does not imply reachability or stackability.

Core chain: Inverse Zero-Sum CAND-03 context -> classical AG(3,3) cap geometry -> C4 quartet incidence -> exact random 4-MIS count distribution and unique sharp spider -> random greedy law -> tree pebbling conserved mod-three residues. The novel-looking piece is the exact **triple-saturation extremal theorem**, not the arithmetic mixture.

S002 mathematical proof: [research/S002_GREEDY_CHARGE_SPIDER_PROOF.md](research/S002_GREEDY_CHARGE_SPIDER_PROOF.md). Next executable session: [research/NEXT_SESSION_PROMPT.md](research/NEXT_SESSION_PROMPT.md). Originality remains open; no large open problem is claimed solved.

Execution policy: "run next session" invokes exactly the named session directly, and stops at its closeout.
