# PDIC — full headline theorem formalisation roadmap (active 16 October 2026)

**Gate:** finish complete flagship Lean formalisation of [the first-paper theorem](research/FLAGSHIP_THEOREM.md) before returning to Palomar preparation. The **four-term cap-labelled probability distribution AND uniquely sharp named spider graph** are the required output, not the S006 narrower graph/matrix appendix. The nine-cap classification may remain a clearly explicit, mathematically legitimate classical input.

## Verified/historical milestones

| Session | Mathematical result or administrative step | Actual status |
| --- | --- | --- |
| S001–S002 | Canonical eight-cap quartet design; written exact cap-labelled probability and spider theorem | PROVED_WRITTEN_WITH_CLASSICAL_INPUT |
| S003–S003R8 | Four-by-four matrix graph semantics, numerical bridges, sharp finite bound | STRICT_LEAN_VERIFIED at S003R8 proof commits |
| S003R9 | Genuine SimpleGraph maximal independent set counts, connected partition uniqueness, actual edges and connected mixed B≤3/spider matrix pattern | STRICT_LEAN_VERIFIED at [402465f...](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/402465f2330a275e04108169a6bfbb65e94e10b8), [hosted run 38890367785](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38890367785) |
| S004 | Primary-source prior art audit | COMPLETE; PRIORITY_UNRESOLVED |
| S005 | Palomar procedure and registry display reconnaissance | COMPLETE; READ_ONLY |
| S006 | Preparation of narrower matrix/MIS Palomar package | COMPLETE_ON_SEPARATE_BRANCH; **NOT** official full-mode verified and **NOT** full-paper formalisation |
| **S007** | Genuine unordered h(G), connected partition uniqueness, h=0 without a partition and anchored-third witness theorem | **STRICT LEAN PASS** d05fe1e / run 38912238607; full count bridge remains open |
| **S008** | Exact unordered h(G)=anchored mixed-third count; graph re-enumeration to matrixGraph and h≤3 | **NEXT: INSTALLED, NOT EXECUTED** |

## Outstanding strict Lean interfaces, in proof order

1. Construct genuine unordered compatible-triple invariant `h(G)` over all four-element maximal independent sets of arbitrary connected eight-vertex `SimpleGraph` and prove `h(G)=B(A)` after canonical balanced bipartition to 4×4 `matrixGraph` transport, or `h(G)=0` where no such partition exists.
2. Prove `h(G)≤3` and `h(G)=3 ↔ G ≃g S(2,2,2,1)`, including row/column spider-pattern to **actual** named graph isomorphism. Respect skew-split MIS.
3. Formalise canonical eight-cap zero-sum quartet incidence and transport for any admissible eight-cap, with the classical nine-cap classification **explicitly stated as external mathematical hypothesis** if needed.
4. Formalise uniform bijections 8! and the 2520 four-atom assignments, exact 16 labelling fibres, first three binomial moments, N₀≤3 and all four exact probability expressions.
5. Compose into a single Lean-kernel-checked theorem matching the full paper, and strict-hosted CI and axiom audit. Only then prepare Palomar for **this same headline theorem**, unless owner expressly changes target.

## Restored closeout automation

Every executed session must: (i) produce substantive mathematical work and an exact-SHA Lean evidence report, (ii) update claims/state, (iii) identify the strongest still-open obligation from the full-theorem chain, (iv) **write, install and commit the next numbered executable session prompt automatically** in `research/NEXT_SESSION_PROMPT.md` with its authoritative target file. Do not ask the owner to re-specify the stage or choose an administrative fallback. The user triggers each session by saying “run next session”; prompt generation alone never launches research in the background.

Current binding session target: [S008 exact h-count and graph-matrix bridge](research/S008_FULL_H_COUNT_MATRIX_TRANSFER_TARGET.md). Work branch: [session/s008-full-h-bridge](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s008-full-h-bridge). S007 structural lemmas passed strict hosted Lean [38912238607](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38912238607) at [d05fe1e](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/d05fe1e71d054fe74a52a664112b6de436e999da); h=B and h≤3 remain OPEN. Historical S006 package remains preserved [here](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/tree/session/s006-palomar-prepare), not merged or treated as full verification.
