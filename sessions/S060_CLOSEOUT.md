# PDIC S060 — structural proof replay repair and exact declaration compatibility

28 October 2026. **COMPLETE: original full flagship passes official standard Palomar FULL. S061 installed, not executed.**

## Result and scope

Implemented a sound staged obstruction-search proof of the same original normalized survivor cardinality. It preserves the exact original short-zero-free predicate, actual 18 normalized tails, full unconditional all-eight-cap normal form, all 40320-permutation probability semantics and iff-spider flagship. Source statements and frozen Challenge are unchanged. Trusted reduction produces proof terms replayable by independent kernels; there is no native compiler trust or new axiom.

The complete independently exported flagship now passes under the original 9-GiB virtual-address limit. A separate official declaration-identity failure was then diagnosed and repaired by preserving the frozen adjacency visibility and using a public proved interface lemma. The final standard unpaid FULL passes all intended kernels and the official declaration/provenance gates.

## Causal experiment

Matched source `1223596408540dbc98d35eb6f7570149a849d44c`, [run 40519114016](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40519114016), one checker at a time, official primitive roots, 9-GiB address cap, 300 s per case:

| Original dependency closure | Independent result | Peak RSS KiB | Seconds |
|---|---|---:|---:|
| first 0+1 | PASS | 1,594,084 | 123.33 |
| first 0+1+2 | PASS | 2,694,152 | 190.49 |
| first 0+1+2+3 | PASS | 3,666,220 | 238.18 |
| mid4 alone | FAIL 134 / bad_alloc | 7,105,928 | 97.69 |
| mid5 alone | PASS | 6,345,200 | 36.32 |
| mid6 alone | PASS | 2,917,752 | 17.30 |
| normalized card | FAIL 134 / bad_alloc | 7,103,068 | 97.53 |
| complete flagship | FAIL 134 / bad_alloc | 7,105,560 | 99.80 |
| fixed control | PASS | 114,672 | 0.20 |

The first four roots together pass. A single previously unprofiled reachable theorem, `s027_mid_shard_4_survivor_card`, reproduces the failure alone. This refutes attributing failure merely to combining the first four counts, or to Finset.sum_congr without supporting measurements. It identifies costly finite certificate replay as a sufficient failure source, although it does not identify the exact allocator instruction. Virtual limits are distinct from RSS and from Palomar's cgroup cap. Failing sampled VmSize was 9,437,072 KiB; capped RSS is not the uncapped old demand.

## Implemented mathematical repair

[Proof note](../research/S060_STRUCTURAL_SEARCH_PROOF.md). The original predicate is hereditary under point-set inclusion. Kernel proofs certify 54 local obstructions (28 pairs, 26 triples), each tested with the same fixed basis. Every original surviving tail avoids those patterns. A sorted list search prunes partial candidates early; general induction proves completeness by erasing the largest index. Trusted kernel reduction counts exactly 18 final tails. The resulting upper bound and existing genuine 18-tail inclusion prove the original cardinality statement. Search layer sizes: 1,17,108,296,296,18. Exhaustiveness of the obstruction list is not assumed.

Old shard theorems remain in source; the new normalized-count proof no longer depends on the costly enumeration forest. Hosted full compilation still includes them. A local 8-GiB source build exhausted its smaller environment; standard hosted builds pass. The repair targets independent proof replay rather than claiming all source compilation fits 8 GiB.

## Exact-source verification

[Strict run 40521986655](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40521986655), exact `3ca0f229255733247ad960e0cb7cfd969f3269a1`: full `lake build Challenge PDIC S024 Solution`, source trust scan, permitted axioms `[propext, Classical.choice, Quot.sound]`, finite audits, type/body dumps and both complete independent roots PASS. The type/body dumps did not compare every ConstantInfo field; they are not an official structural-comparison verdict.

| Repaired root | Export bytes | Result | Peak RSS KiB | Seconds | Sampled VM KiB |
|---|---:|---|---:|---:|---:|
| normalized card | 27,584,605 | PASS rc0 | 1,931,696 | 15.84 | 4,500,816 |
| complete original flagship | 76,366,160 | PASS rc0 | 5,950,560 | 262.19 | 8,695,568 |

Both use the same official primitive roots and 9-GiB virtual cap. The repaired run allowed 540 s versus 300 s in the baseline; both successful repaired checks actually finish within the original 300 s (15.84/262.19 s), so timeout extension does not explain the pass. This is an actual matched-limit failure-to-pass change. No percentage reduction in uncapped whole-proof demand is inferred from capped failures.

[Wrapper profiles 40526085773](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40526085773), exact `d35fbfe6d8fdef48ca6df7fa046e7a5dafb28560`: classification PASS rc0, 1,931,840 KiB RSS/15.09 s; complete normal form PASS rc0, 4,025,000 KiB RSS/156.90 s, same 9-GiB cap.

Standalone new search proof also passed Leanchecker, NanoDa and con-ron locally with standard allowed axioms. Con-ron failed its smaller 6-GiB virtual cap and passed 9 GiB at 3,217,668 KiB RSS. These were component checks, not a complete official FULL verdict. The temporary local proc-exe compatibility shim affected only resolving this sandbox's own process path; hosted runs use no shim.

## Declaration compatibility repair

First official [FULL 40525316504](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40525316504), exact `e3cfe8d3a944689c9735db03ee9fab8f7689b831`, failed before external kernels: `Const does not match between challenge and target PDIC.namedSpider`. Comparator took 3.25 s, 174,836 KiB RSS, no cgroup OOM kills. This was a distinct structural gate, not failed independent mathematics or another memory exhaustion.

Actual independently exported metadata [40558867354](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40558867354), exact `c4c8643d87d81913c449700546c163773665d13c`, established identical type and value for all eight constants, with only namedSpider's reducibility height differing: Challenge regular 1, solution regular 5. The pinned actual `Lake.Check.compareAt` rejected it. The workflow was diagnostic and returned zero after printing FAIL, so its overall green status was not a comparator PASS.

The S053 expose attribute on spiderAdj was the controlled cause: remove it to restore the frozen module visibility; add public theorem `spiderAdj_explicit`, proved directly from the original Boolean definition; use that theorem in the unchanged flagship statement's adjacency proof. [Actual-export run 40655783353](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40655783353), exact `5749ecfc2a11730cc6a603db89f5e1d3607822f8`, now passes all eight COMPLETE ConstantInfo equalities and pinned compareAt, with both namedSpider hints regular 1. This workflow throws on actual comparator failure.

Final source `912b628e6df0f4881f56e8f341031ec8d99d4e9e` changes only the invoking official workflow from that passing metadata candidate. S024 SHA256 `4428f4849f628bca94960acb9fac056db9a0912d6a194ca5efbff987aa783a66` is byte-identical to the independently verified memory repair. Challenge, comparator.json, formalization.yaml, toolchain, Lake project and dependency manifest unchanged; see [interface invariants](S060_INTERFACE_INVARIANTS.json). All six original/new finite audit scripts rerun 28 October PASS.

## Relevant successful-project controls

Source packaging comparison used Pascal Minus-One `5c0363d43044be94430dff489bd5c64cd153b8d5`, TreeStack `e1e437b8d02552b7c7ee0c4c74041b6ac956f063`, Greedy Uniformity on Trees `a4c4493a5fff82dfb085f59de41393b862af63a3`, and ellipse `9d2208e65f35cbfc8d491c3399b78b95c7d1f9a5`. They use the same three allowed axioms and enable NanoDa. Their checked Lean sources contained no `decide +kernel` certificates. PDIC's expensive finite Boolean reduction forest is a concrete difference; project size by itself is not a causal explanation. The pinned Lake comparator invokes external kernels sequentially, with NanoDa using four threads internally. There was no evidence for simultaneous standalone kernels exhausting memory together, and no verifier scheduling or trust policy was modified.

## Official final standard FULL

[Run 40656295590](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40656295590), exact `912b628e6df0f4881f56e8f341031ec8d99d4e9e`, branch `diagnostic/s060-interface-standard-full`, pinned official pipeline `d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44`, profile `palomar-standard-v1`, full mode, original comparator config and NanoDa enabled. **PASS / complete**, checked 28 October 2026 at 08:57:46 UTC. Both profile and verification jobs SUCCESS. Actual official log:

> con-ron: accepted 14757 declarations (--verified)
> con-ron kernel accepts the solution
> nanoda kernel accepts the solution
> Lean default kernel accepts the solution
> Your solution is okay!

The report contains no errors or warnings, frozen Challenge trust level high, no definition holes, only the three approved axioms, original full flagship target and all official intended kernels enabled. Full report preserved as [S060_PALOMAR_FULL_PASS_REPORT.json](S060_PALOMAR_FULL_PASS_REPORT.json), artifact 12803249160 (ZIP SHA256 3eb38360d23fa38f7bc4db9ee5f5dc09d551201330203f85f3533acd5d05aa10).

| Official phase | Return | Seconds | Peak RSS KiB |
|---|---:|---:|---:|
| solution build | 0 | 694.048 | 11,982,996 |
| complete comparator and kernel suite | 0 | 1,062.292 | 15,772,556 |

Comparator cgroup peak 16,151,109,632 bytes (15.042 GiB), enforced cap 16,431,086,551 bytes (15.303 GiB); zero OOM/kill events, no deadline fired. This is a genuine standard-profile pass with about 267 MiB headroom, **not** evidence of generous spare memory or a guaranteed repeat-run margin. No paid runner or verifier policy change was used. The independent 9-GiB Leanchecker pass remains a separate measurement, not the official suite's memory figure.

No paid resources, registry registration, external publication, proof-branch merge or PR24 promotion. Docs-only main checkpoints do not merge proof sources. Novelty/priority remains unresolved. Owner subsequently asked to move directly to registry. That authorizes submission of the verified package without another proof session. The browser plugin reports no originating connected context, and gh is not installed/authenticated, so the authenticated submission must be handed to the owner. Exact form values are recorded below. S061 is installed for actual submission/review follow-through. It has not been executed. S060 is closed. The verified proof source remains on its isolated branch; main receives documentation and evidence only.


## Owner-directed registry handoff

After confirmation of FULL PASS, the owner asked “if it passes - can't we move to registry now?” Yes: no further proof/audit session is a prerequisite. Submit at https://submit.palomar-registry.org/ with:

- Repository: `jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture`
- Commit: `912b628e6df0f4881f56e8f341031ec8d99d4e9e`
- Comparator configuration: `comparator.json`
- Formalization metadata: `formalization.yaml`
- Project directory: repository root (blank)
- Relationship: responsible author or maintainer (`maintainer`)

The official intake must still run its own verification/review; this reusable full-mode pass is its advisory prerequisite, not registry registration. The submission service requires human GitHub sign-in, or a complete authenticated tag-plus-secret-gist ownership proof. No authenticated gh/gist path is available here; the connected browser tool also reports no originating browser context. Do not create a GitHub issue as a substitute. Do not infer a new registry ID from the preflight. The review must be shown to the owner before public registration consent; no registry action or proof merge has occurred during S060.
