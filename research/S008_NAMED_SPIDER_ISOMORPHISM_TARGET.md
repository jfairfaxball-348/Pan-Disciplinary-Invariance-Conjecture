# PDIC S008 — strict Lean equality iff the named spider

**INSTALLED, NOT EXECUTED.** Run this session when the owner says “run next session”. Continue on `session/s007-full-lean-flagship`; preserve all certified S003R9 and S007 source. Read `AGENTS.md`, `README.md`, `ROADMAP.md`, `authoritative/STATE.json`, `research/CLAIMS.md`, `research/S007_UNORDERED_GRAPH_BRIDGE.md`, `sessions/S007_CLOSEOUT.md`, the flagship theorem and the manuscript.

## Objective

Complete the next missing graph theorem in Lean:

    For every connected SimpleGraph (Fin 8),
    unorderedCompatibleTripleCount G = 3 ↔ Nonempty (G ≃g namedSpider).

`namedSpider` must be the genuine simple graph S(2,2,2,1), with explicit edges `04,05,06,07,16,25,34`, or a proved isomorphic labelling. The equality is graph isomorphism, not only a Boolean matrix pattern.

## Required mathematical work

1. Recheck the exact S007 certificate. Reuse its genuine unordered count, no-partition zero theorem, h-to-mixed-witness equivalence, graph-isomorphism invariance, constructed balanced matrix representation and general connected h≤3. Do not repeat these proofs or replace the count with ordered triples.
2. From h=3 obtain a complementary four-MIS pair, then use `connected_partition_h_eq_matrix` and `connected_graphMixedCount_three_iff_pattern`. Prove that each certified row- or column-centred spider pattern gives an **actual graph isomorphism** to `namedSpider`. Construct the required row/column permutations and possible side swap; transport adjacency, including all nonedges. The pattern-to-isomorphism implication must not be an assumption.
3. Prove the converse for the named graph via its actual matrix count and transport under graph isomorphism. Avoid evaluating all sets of sets: use the certified h=B equivalence and explicit three mixed witnesses. Preserve the spider's valid 3+1 and 1+3 MIS; do not assert every four-MIS is pure or 2+2.
4. Compose the unconditional connected-eight-vertex bound and named equality case into public Lean declarations. No proof holes, native compiler trust or custom axioms. Run `lake build`, strict `#print axioms`, all seven independent checkers and hosted CI for the exact changed commit. Record exact SHAs, runs and limitations.

## Completion and handoff

Update claims, state, README and session closeout with actual proved scope. If equality is unfinished, identify the smallest remaining isomorphism lemma and make it the next target. Automatically write, install and commit the full S009 executable prompt; do not execute it yet. If equality closes, target the greatest remaining cap-incidence / genuine uniform-bijection probability obligation.

The complete four-term cap-labelled probability law and unique spider extremiser remain the mandatory end-to-end Lean gate. Palomar preparation resumes only after that entire theorem passes strict checking or the owner redirects. Novelty remains unresolved. No merge to main, correspondence, public registration or publication submission is authorised by this session.
