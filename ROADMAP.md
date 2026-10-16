# PDIC — full first-paper Lean roadmap

**Latest certified gate:** S014 exact-head kernel + nine-checker PASS at [`95ef8f4886868f66edfbde90b34cc9e12fe6b463`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/95ef8f4886868f66edfbde90b34cc9e12fe6b463), [Lean 38949894336](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894336), [finite 38949894242](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894242). 576 and 16 stabilizer counts and actual fixed-quartet-image 576 are certified; general 2304/128 event totals are not. **Active gate:** finish the entire [flagship theorem](research/FLAGSHIP_THEOREM.md) before Palomar preparation. This includes the four-term probability law and equality iff the named spider, with an honestly scoped classical nine-cap input.

| Stage | Actual status |
| --- | --- |
| Written cap/graph/probability theorem | PROVED_WRITTEN_WITH_CLASSICAL_INPUT; novelty unresolved |
| Matrix/MIS semantics and connected mixed bound | Strict S003R9 certificate, source 402465f2330a275e04108169a6bfbb65e94e10b8 |
| Genuine unordered triples, no-pair zero and pair uniqueness | Strict S007 initial certificate, source d05fe1e71d054fe74a52a664112b6de436e999da |
| Exact unordered h cardinality, actual arbitrary-graph matrix transport, h=B and connected h≤3 | **STRICT LEAN PASS** at `ff864170834954ef2a286afe6a6b6577ec02f986`; [run 38914271558](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38914271558) |
| S008 concrete named-spider graph isomorphism, connectedness, h=3 | **PARTIAL S008 PROOF INCREMENT**, source `fc8581d0bd117cd66c4497fa16209e3480c65ec7`; [run 38918496261](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38918496261) (STRICT LEAN PASS with all eight independent checkers); [written normalisation](research/S008_NAMED_SPIDER_NORMALISATION.md). |
| S009: universal equality candidate | Attempt unverified (runner exit 143); superseded by S010 strict certificate |
| **S010: universal h=3 iff named spider actual isomorphism** | **STRICT LEAN PASS**, [source `c8c64e5a2a98`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/c8c64e5a2a98ee359c79430293ca0738211b4215), [Lean run 38928965168](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38928965168); eight finite checkers PASS; standard axioms only |
| **S011: typed cap, linear transfer, actual 8! labelling space** | **STRICT LEAN PASS** at [`e302e5f`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/e302e5f82434b3d8790c81506fe55062700e7a53), [run 38934564596](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38934564596); 40320 exhaustive finite check with 16-preimage fibres, Lean fibres not yet proved |
| **S012: permutation transport and quartet support obstruction** | **EXECUTED — SOURCE_FORMALIZED, CI_UNVERIFIED** at [4c6872883](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/4c68728834570cb436944c407d700487c6448002). Actual N₀≤3 cardinality and moments NOT CLOSED. [Closeout](sessions/S012_CLOSEOUT.md) |
| **S013: true N₀≤3 for every labelling** | **STRICT LEAN PASS**, [source 2a808e5](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/2a808e53cb7a763b54c53c4f06d12f7f64d3b113), [Lean run 38945169850](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169850) |
| Canonical cap incidence and preservation under supplied GL(3,3) | LEAN_KERNEL_VERIFIED_S011; existence of arbitrary-cap orbit is external classical premise, not proved |
| Genuine 8! sample-space cardinal | LEAN_KERNEL_VERIFIED_S011 |
| 16-element event fibres, moments, N₀≤3 and complete distribution | FINITE_CHECKED for canonical event fibres and spider/P8; OPEN_IN_LEAN universally |
| S012 typed permutation transport and four-quartet independence obstruction | **STRICT LEAN PASS**, exact source `4c68728834570cb436944c407d700487c6448002`, [run 38938608949](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38938608949) |
| **S013 genuine labelled zero-MIS support bound `N₀(e,G)≤3`** | **STRICT LEAN PASS** at `2a808e53cb7a763b54c53c4f06d12f7f64d3b113`, [run 38945169850](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169850), nine checkers; [finite 38945169844](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38945169844) |
| **S014 true 576/16 fibre counts → 2304/128 events → moments** | **INSTALLED, NOT EXECUTED** — [S014 prompt](research/NEXT_SESSION_PROMPT.md) |
| Single end-to-end headline theorem and strict hosted certification | OPEN; mandatory gate |
| Full-theorem-aligned Palomar preparation | PAUSED until full gate closes or owner redirects |

Continue from `session/s007-full-lean-flagship`, whose exact certificate is above. Main's older Lean and the former `session/s008-full-h-bridge` scaffold are not the current source. The old S008 h-count brief remains superseded because S007 continuation closed its principal obligations; S008 provided certified concrete h=3. S009's failed candidate is superseded by S010's **strictly certified iff**, while the full first-paper probability law remains OPEN_IN_LEAN. [Proof note](research/S007_UNORDERED_GRAPH_BRIDGE.md); [closeout](sessions/S007_EXTENSION_CLOSEOUT.md).

Every executed session must produce actual proof work, exact-SHA hosted evidence and truthful scope updates. Automatically select the greatest remaining mathematical obligation toward the complete flagship, write/install/commit the next numbered executable prompt, and stop. “Run next session” triggers execution; prompt generation is not an unattended run. Preserve strict standard-axiom checking and independent corroboration. Do not substitute a narrower graph certificate or packaging session for completion.

S011 proof detail: [typed cap and independent exhaustive check](research/S011_CAP_LABELLING_PROOF.md), [closeout](sessions/S011_CLOSEOUT.md). S012 attacks event-fibre and moment formalisation, not the already closed graph extremiser.


S012 verified-status clarification: S011 exact-source 7f7e32d / run 38935115211 remains the **last strict Lean PASS**. Candidate S012 appendix defines the genuine labelled count and proves (subject to CI) connectedness cannot admit all four pulled-back quartets independent. A fresh S012 CI result was not yet returned; no new Lean claim is promoted. [S012 proof note](research/S012_PERMUTATION_AND_SUPPORT_PROOF.md). S013 must compile/repair this source first, then prove the actual support bound, fibre counts and single flagship theorem.


S013 strict proof note: [actual N₀ and event fibres](research/S013_ACTUAL_N0_AND_EVENT_FIBRES.md); [S013 closeout](sessions/S013_CLOSEOUT.md). The **general** 2304/128 numerical event fibres and graph-derived moments remain OPEN_IN_LEAN despite independent enumeration. Complete manuscript four-probability theorem is not kernel certified. The historical S011/S012 pending status paragraphs above reflect earlier closeout times, superseded by exact-source S012/S013 PASS evidence.


### S014 regular fibres / S015 active target

S014 PARTIAL PROOF INCREMENT: strict kernel PASS at 3d004c3378e3c4afd07343a2e9dcc5ca26475aeb, run 38948956267, for the exact 4!×4!=576 four/four-colour stabilizer. Later source 0ab79e8c9d9f5ef0fe111d69e6c87fa938d2b9bb adds the (2!)^4=16 ordered two-quartet-colour stabilizer; 3b8d2e3cd771f34ead2de9e6bf8bd72f3d55a585 additionally connects the 576-colour stabilizer to a fixed actual quartet image. At writing these later exact-source hosted Lean jobs are pending, so their status is SOURCE_FORMALIZED, not LEAN_KERNEL_VERIFIED. Full 2304/128 cap-zero event counts, actual MIS factorial moments and full four-term distribution are still OPEN_IN_LEAN. S015 installed, not executed.

The proof branch `session/s007-full-lean-flagship` remains canonical. The full-theorem gate forbids a Palomar or paper-only shortcut. S015 must first certify the latest S014 Lean source and then turn 576 and 16 regular stabilizer cardinalities into the real 2304/128 event-fibre theorems and graph-derived moments.


### S014 final exact-source CI status

**Final strict verification update — 16 October 2026:** Lean source [`95ef8f4886868f66edfbde90b34cc9e12fe6b463`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/95ef8f4886868f66edfbde90b34cc9e12fe6b463) has [kernel workflow PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894336) and [finite evidence PASS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38949894242) at that exact SHA. The hosted kernel job succeeded at `lake build`, forbidden proof-hole scan, and all nine independent checkers. `#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound` for S014 declarations. The repaired `perm_finset_image_fixed_iff`, `canonicalFourBlockColour_comp_iff_image_fixed`, `canonicalQuartetImageStabilizer_card = 576`, and `canonicalTwoQuartetStabilizer_card = 16` are now **LEAN_KERNEL_VERIFIED**. Previous statements about these declarations' CI being pending describe an earlier checkpoint, not the final result. **2304/128 full events, moments and four-term law remain OPEN_IN_LEAN.**

S015 is the next installed session, not yet executed.


## S015 — true 2304 singleton cap-event candidate and S016 handoff (16 October 2026)

S015 was executed on the canonical Lean proof branch, draft PR #4. The formal source now constructs true permutations between arbitrary four-sets, transports fixed image fibres, proves the actual image-stabilizer correspondence for two overlapping cap quartets, and derives a candidate theorem `canonicalCapF3_perm_singleton_event_card` counting **2304** permutations that make any prescribed four-subset have zero canonical F₃³ label-sum. The argument sums four disjoint actual image fibres of 576 permutations each rather than using a symbolic placeholder.

**Verification boundary:** the updated source at [69de0c9e9963016ff5324545d55710619e8b8ead](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/69de0c9e9963016ff5324545d55710619e8b8ead) has [finite-check PASS 38959901752](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38959901752); its exact [strict Lean run 38959901730](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/38959901730) was still running when this record was written. The new claim remains SOURCE_FORMALIZED / CI_UNVERIFIED until the exact-source strict kernel workflow succeeds. The last confirmed kernel certificate remains S014 at 95ef8f4 / run 38949894336. Full 128 pair/triple event counts, unordered graph-derived moments and the four-term law remain OPEN_IN_LEAN.

[S015 closeout](sessions/S015_CLOSEOUT.md), [proof note](research/S015_SINGLETON_EVENT_PROOF.md), and [automatically installed S016 handoff](research/NEXT_SESSION_PROMPT.md). S016 is **not executed**. No merge, registration or publication; novelty remains unresolved.
