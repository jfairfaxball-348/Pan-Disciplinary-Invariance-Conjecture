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
