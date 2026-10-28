# PDIC S060 progress — 27 October 2026

## Exact current candidates

- Baseline original source: 4a91ea2c3af6eaaf6b1f2212d9f325d081aff756.
- Hosted matched-baseline instrumentation: 0cee7b4c158f7401012acdf7e2e488596b15667e,
  branch `diagnostic/s060-matched-baseline`, run 40516854244.
- Implemented structural repair: 34c82f12c34911485f099f5d8e75672c7fbbb11f,
  tree 31fbb797d61ab0a00af737eb955ce547fa12de10,
  branch `diagnostic/s060-aggregate-repair`, strict run 40517164085.
- Challenge.lean, PDIC.lean, Solution.lean, comparator.json, lean-toolchain and
  original dependency manifest are unchanged from the protected S059 baseline.
- No merge, PR24 promotion, paid runner, registry or external submission.

## Implemented repair and locally verified components

The new normalized-cardinality proof replaces the expensive full-point finite
certificate forest in its dependency closure with a general hereditary-obstruction
argument and an early-pruned list search. It proves an upper bound of 18 for the
original predicate; the existing eighteen genuine examples prove the lower bound.
All earlier shard lemmas remain in source, with unchanged statements and proofs.

The 54 obstruction patterns comprise 28 pairs and 26 triples. The search layer
sizes are 1,17,108,296,296,18. No exhaustiveness axiom or native oracle is used.
The standalone generic list completeness lemma, the original-point-predicate
soundness proof, and the exact new numeric count have all compiled in pinned
Lean 4.35.0-rc3. A standalone export of the numeric count plus all official
primitive roots passed the bundled independent Leanchecker under 6 GiB virtual
address space, exit 0, 1,909,176 KiB peak RSS, 14,377,938 exported bytes, 20.75 s.
The complete point-soundness/search probe compiled with only
[propext, Classical.choice, Quot.sound], peak RSS 3,101,876 KiB, 27.29 s.
These component results are NOT yet a full flagship or Palomar FULL verdict.

All original finite-predicate audits and the new independent 54-obstruction
search audit passed locally, including exact equality with all 18 genuine
survivors among the 6188 five-tails and original all-40320 permutation checks.

## Causal controls

The pinned `Lake/CLI/Check.lean` invokes independent verifiers sequentially.
Its NanoDa config uses four threads; concurrent independent verifier processes
are not supported as the cause by that source. The old normalized aggregate also
uses previously unprofiled first-index 4,5,6 certificates; grouping roots 0..3
alone was therefore not yet a complete dependency-cost attribution. The new
baseline workflow tests groups 0+1, 0+1+2, 0+1+2+3, mid4, mid5, mid6, normalized
and flagship at the same 9-GiB address limit and one checker at a time.

Actual Pascal Minus-One, TreeStack, Greedy Uniformity on Trees and ellipse
checkouts use the same permitted axioms and enable NanoDa, with no occurrences
of `decide +kernel` across their Lean sources. Their comparator settings do not
suggest an axiom-removal or verifier-disable workaround. Precise SHAs are in
`research/S060_STRUCTURAL_SEARCH_PROOF.md` / final closeout evidence.

## Environment notes and pending gates at this checkpoint

GitHub access is working after correcting the connector account identifier.
All remote writes use the owner's `jfairfaxball-348` connection. The initial
"Unknown tool" messages came from an incorrect link identifier, not a confirmed
GitHub outage. No permission changes were made.

The local workspace has an 8-GiB cgroup. An initial overlap of the original build
and exploratory probes killed S024 with cgroup OOM (exit 137); this is not a
source theorem rejection or a useful intrinsic baseline memory measurement.
Subsequent expensive builds/checks are serialized. The exact original control
is now being built and profiled on its hosted standard runner; its interrupted
local serial retry was stopped once hosted access was restored.

This container hides `/proc/<getpid()>/exe` while exposing `/proc/self/exe`.
A scratch LD_PRELOAD compatibility shim redirects only that one own-executable
path lookup to `/proc/self/exe`, enabling the unmodified pinned Lean binaries.
It does not modify verification or declarations. Hosted runs use ordinary,
unmodified Lean installation with no shim. Local `/proc` PID namespace prevents
descendant VmSize sampling, so local sampler fields are null and definitive
RSS comes from `/usr/bin/time` (wait4). Hosted PID sampling is enabled.

At this checkpoint both hosted jobs are compiling. Full local exact candidate
build is running. Await real normalized and flagship checker results, eight
ConstantInfo comparisons, and standard Palomar FULL before claiming those gates.

## Follow-up before final verifier results

The complete repaired source also exceeded the local 8-GiB cgroup when built
alone: S024 exit 137, /usr/bin/time peak 7,857,012 KiB, 7:06.04. This shows the
initial overlap was not the only local obstacle. Old unused numerical shard
lemmas still have to compile, even though they are absent from the new full
export closure. Hosted standard source compilation is the authoritative test.

Downloaded the actual old standard Palomar mechanical report for 40307527534:
solution-build PASS, 771.375 s, peak 11,985,340 KiB / 12,273,004,544 cgroup bytes;
solution-export PASS, peak 1,489,524 KiB; comparator cgroup peak 16,137,502,720 B,
6 OOM kills, exec signal 9, ceiling 16,431,078,522 B. The report does not expose
which individual comparator child was active at the kill. Do not infer that
all independent checkers were running concurrently.

Full-body ConstantInfo comparisons were restored correctly with `module` plus
`import all` on each separate side. Ordinary import hides the Challenge's
spiderAdj body, whereas the S053 Solution exposes it, producing a false public
view mismatch. The full separately compiled declarations compare equal for ALL
EIGHT original semantic constants in the local Challenge/unchanged-PDIC test.
No protected definition, statement or Challenge attribute was changed. The
hosted exact-Solution audit uses the same full-body import method.

Initial baseline run 40516854244 at 0cee7b4 compiled the original source, then
failed BEFORE ANY KERNEL CHECK because ordinary hosted runners do not necessarily
expose `/sys/fs/cgroup/memory.max`. The profiler now records null for unavailable
metadata and still executes every checker. This is an instrumentation error,
not a proof/resource result. Repaired metadata tests handle both existing and
absent paths. Corrected baseline SHA 1223596408540dbc98d35eb6f7570149a849d44c.

Corrected candidate SHA a77dcf5aa26dc3508c41628867f816910c5db3fe (same S024 proof
as 34c82f1), strict hosted run 40519106390. Prior run 40517164085 used the ordinary
import audit and will not constitute the final gate; intermediate f50cc3b run
40518880547 has the corrected audit but predates the optional-cgroup fix.


## Exact-source hosted mathematical build now PASS

Run 40517164085 at original repair SHA 34c82f12c34911485f099f5d8e75672c7fbbb11f
completed the full original `lake build Challenge PDIC S024 Solution`, approved
axioms, ALL EIGHT compiled ConstantInfo comparisons, and all original/new finite
audits successfully. The independent root stage then failed before exporting
or checking any root, solely on the missing optional cgroup metadata file.
Thus this first hosted workflow is overall FAILURE, but it is NOT a mathematical
proof rejection or a resource-limited root result. The corrected a77dcf5 run
40519106390 is executing the SAME S024 proof with the profiler fixed.

Correction to the predicted audit issue above: the first hosted diagnostic files
were legacy non-module files, so their ordinary imports did load full bodies
and all eight comparisons actually PASSED. Adding required module headers would
hide the Challenge body without `import all`; the corrected diagnostic uses
both `module` and `import all`, which passed the local full-body comparison.
The module-header/import changes are only audit packaging, not a theorem fix.

Corrected baseline run is 40519114016, SHA 1223596408540dbc98d35eb6f7570149a849d44c.


## New complete classification argument: all three independent kernels PASS

The local standalone point-soundness/count module exports the new complete
classification argument and the official primitive roots; it does not claim
full flagship verification. Results, serialized under the same pinned binaries:
Leanchecker exit 0, 1,920,392 KiB RSS at 6-GiB virtual cap; NanoDa (official four
threads/config/extensions/axioms) exit 0, 692,704 KiB at 6-GiB virtual cap;
con-ron --jobs=2 initially hit the 6-GiB virtual cap (exit 134, 2,864,472 KiB RSS),
then PASSED exit 0 under 9-GiB virtual cap at 3,217,668 KiB, accepting 6058
declarations (--verified). The first con-ron cap failure is a resource-limited
result, not a proof rejection. No official Palomar setting was changed.


## Corrected transitive body audit and final same-proof run

Run 40519106390 / a77dcf5 compiled the complete same S024 proof but failed the
module-mode diagnostic: `import all Solution` alone retains hidden bodies for
four definitions in its transitive defining module PDIC. This is visibility,
not a changed or rejected definition: direct full compiled Challenge/PDIC bodies
match for all eight. The diagnostic now imports BOTH `all PDIC` and `all Solution`.
A module-mode transitive-re-export control with that import arrangement passed
all eight full-body comparisons locally. No protected source was edited.

Same mathematical proof at 3ca0f229255733247ad960e0cb7cfd969f3269a1 is executing
strict run 40521986655. Root checks and finite audits now execute after successful
strict compilation even if the independent definition-audit step fails; any
failed audit still fails the overall workflow. This prevents diagnostic failures
from suppressing the actual kernel measurements. Every gate remains required.


## Definitive causal experiment completed: original mid4 alone fails

Corrected original baseline run 40519114016 at immutable
1223596408540dbc98d35eb6f7570149a849d44c completed. Original full compilation PASS;
the workflow correctly FAILS because individual mid4, normalized and flagship
independent roots fail. All cases used the same source, primitive roots, 300 s,
9-GiB virtual cap and one independent checker process at a time.

- Group {0,1}: PASS 1,594,084 KiB RSS, 123.33 s.
- Group {0,1,2}: PASS 2,694,152 KiB RSS, 190.49 s.
- Group {0,1,2,3}: PASS 3,666,220 KiB RSS, 238.18 s.
- **Previously unprofiled original mid4: FAIL 134**, 7,105,928 KiB RSS,
  sampled VmSize 9,437,072 KiB, 97.69 s, 22,160,441 exported bytes.
- mid5 PASS, 6,345,200 KiB RSS, 36.32 s; mid6 PASS 2,917,752 KiB, 17.3 s.
- normalized FAIL 134, 7,103,068 KiB RSS, same sampled VmSize, 97.53 s.
- full flagship FAIL 134, 7,105,560 KiB RSS, same sampled VmSize, 99.8 s.
- Fixed control PASS 114,672 KiB RSS, 0.2 s.

This refutes the proposed need to repair assembly of the first four roots merely
because they are combined: their joint closure passes. A single additional
reachable certificate, s027_mid_shard_4_survivor_card, is independently sufficient
to reproduce the failure; mid5 is also very costly. The old aggregate's failure
is not evidence that Finset.sum_congr itself needs balancing. The new sound
staged search eliminates the entire expensive point-enumeration certificate
forest from the normalized and flagship dependency closures. Exact source and
measurements are in sessions/S060_BASELINE_RESULTS.json and the hosted artifact.


## COMPLETE EXACT-SOURCE INDEPENDENT ROOT PASS

Run 40521986655 is SUCCESS at exact 3ca0f229255733247ad960e0cb7cfd969f3269a1.
Original full Lean build, approved axioms, full-body eight compiled definitions,
all original/new finite audits, and BOTH complete independently exported roots
passed. One checker at a time, identical official primitive roots, 9-GiB virtual
cap; no reduced theorem or skipped dependency closure:

- normalized card: export 27,584,605 bytes; exit 0; peak RSS 1,931,696 KiB;
  sampled VmSize 4,500,816 KiB; 15.84 s.
- COMPLETE original flagship: export 76,366,160 bytes; exit 0; peak RSS
  5,950,560 KiB; sampled VmSize 8,695,568 KiB; 262.19 s.

Compare original same-cap baseline: normalized FAIL 134 at 7,103,068 KiB RSS;
full flagship FAIL 134 at 7,105,560 KiB. Those failing peaks are capped values,
not uncapped old requirements. No percentage reduction in intrinsic uncapped
whole-proof demand is claimed. The pass/fail change under matched limits is real.

The standard, unpaid Palomar FULL preflight is now launched from immutable
 e3cfe8d3a944689c9735db03ee9fab8f7689b831 on diagnostic/s060-palomar-standard-full,
with only its workflow added to the exact strict code candidate. No protected
proof/Challenge/config/toolchain change. Pending official comparator/NanoDa/
con-ron/Lean verdict: this launch is not yet a Palomar FULL PASS or registration.


## Continuation: official FULL failed at declaration comparison, not OOM

Official standard FULL 40525316504, exact e3cfe8d3a944689c9735db03ee9fab8f7689b831,
finished 27 October 2026 with status fail/stage comparator:
`Const does not match between challenge and target PDIC.namedSpider`.
The source build passed. The official external kernel suite was not reached;
no FULL acceptance or registration can be claimed. Complete independent
Leanchecker PASS at 3ca0f2 remains genuine and is not superseded by this distinct
declaration-identity gate. Earlier eight-definition diagnostics compared bodies
and types but did not inspect every ConstantInfo metadata field; the comparator
compares the complete exported ConstantInfo, including hints and mutual lists.

A targeted actual-export comparison of Challenge and defining PDIC is now running
40556746068 at dcd8db71cfdb0ed4d22e0c88484e03fdb181d8d1, isolated branch
diagnostic/s060-comparator-fields. This builds only Challenge/PDIC, prints full
constant equality and separate type/value/hints/safety/mutual-list fields, then
invokes unchanged Lake.Check.compareAt. No theorem or protected config is altered.

Intervening wrapper profiles also completed SUCCESS, run 40526085773 at d35fbfe6:
classification 27,589,375 bytes, exit 0, 1,931,840 KiB RSS, 15.09 s;
normalform 48,010,736 bytes, exit 0, 4,025,000 KiB RSS, 156.9 s.
Both used official primitive roots and 9-GiB virtual cap, one checker at a time.


## 28 October continuation: actual metadata discrepancy isolated

Core-only actual export run [40558867354](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40558867354), exact `c4c8643d87d81913c449700546c163773665d13c`, executed the pinned `Lake.Check.compareAt` against independently exported Challenge and PDIC. Every one of the eight target constants has equal type and body. Seven have equal complete ConstantInfo. `PDIC.namedSpider` alone differs: Challenge `ReducibilityHints.regular 1`, solution `regular 5`. Actual comparator rejects it. The workflow was diagnostic and exited zero after printing FAIL; this is explicitly **not** comparator acceptance.

The S053 `@[expose]` on `spiderAdj` changed the reducibility height of the later `namedSpider`. Controlled candidate `5749ecfc2a11730cc6a603db89f5e1d3607822f8` on `diagnostic/s060-adjacency-interface` removes that expose attribute and adds a directly proved public `spiderAdj_explicit` lemma. Solution uses that lemma. Original predicate bodies, flagship statement, S024 memory repair, frozen Challenge and comparator config are unchanged. Candidate core/export workflow [40655783353](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/40655783353) is running; it now throws on any actual comparator failure. No verification claim for candidate until its actual result and complete source/full checks are inspected.


Candidate actual export comparison **PASS**, run 40655783353, exact 5749ecfc2a11730cc6a603db89f5e1d3607822f8. All eight complete ConstantInfo values match. Both namedSpider hints are now regular 1, and unchanged pinned Lake.Check.compareAt returns REAL_COMPARE PASS. This supports the visibility-height diagnosis. All six finite audit scripts rerun locally 28 October PASS (their older printed cautions about not yet formalizing the orbit are historical script text; current S024 strict full normal-form proof is independently verified as recorded above). The next official standard FULL uses this exact mathematical source plus only its invoking workflow.
