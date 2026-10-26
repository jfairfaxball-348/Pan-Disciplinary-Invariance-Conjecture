#!/usr/bin/env bash
# S054. Diagnose independent kernel memory WITHOUT altering theorem, protected
# Comparator config, source, or using paid capacity. NOT Palomar acceptance.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s054-evidence
: > s054-evidence/stages.tsv
printf "stage\texit_code\tpeak_rss_kib\twall_clock\n" > s054-evidence/stages.tsv
printf '%s\n' "$GITHUB_SHA" > s054-evidence/source-sha.txt
printf '%s\n' "$(cat lean-toolchain)" > s054-evidence/toolchain.txt

# The pinned Lean 4.35.0-rc3 src/lake/Lake/CLI/Check.lean exportTargets
# includes builtin Quot targets when Quot.sound is legal, target and axioms,
# and exactly these 26 additional primitive targets. Root-only exports
# are NOT acceptable surrogates for the official comparator.
roots=(
  Quot Quot.mk Quot.lift Quot.ind
  PDIC.palomar_complete_probability_and_spider
  propext Quot.sound Classical.choice
  Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod
  Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
  String.ofList Char.ofNat List eagerReduce Nat String String.mk Char
  optParam autoParam semiOutParam outParam
)
printf '%s\n' "${roots[@]}" > s054-evidence/roots.txt

# Strong source validation; S053 was certified at its exact earlier SHA,
# but S054 deliberately recompiles the unchanged theorem plus its diagnostics.
echo "::group::Strict exact-source build"
lake build Challenge Solution > s054-evidence/build.log 2>&1 || {
  tail -n 90 s054-evidence/build.log
  exit 1
}
lake env lean Solution.lean > s054-evidence/axioms.log 2>&1 || {
  tail -n 50 s054-evidence/axioms.log
  exit 1
}
if grep -E 'sorryAx|Lean\.ofReduceBool|Lean\.trustCompiler' s054-evidence/axioms.log; then
  echo 'Unapproved axiom in proved Solution'; exit 1
fi
tail -n 8 s054-evidence/axioms.log
echo "::endgroup::"

echo "::group::Export with the faithful Palomar root list"
lake env leanexport Challenge -- "${roots[@]}" > s054-challenge.ndjson
lake env leanexport Solution -- "${roots[@]}" > s054-solution.ndjson
wc -c s054-challenge.ndjson s054-solution.ndjson | tee s054-evidence/export-bytes.txt
echo "::endgroup::"

# NanoDa's config matches src/lake/Lake/CLI/Check.lean runExternalKernel.
python3 - <<'PY'
import json
from pathlib import Path
config = {
  "use_stdin": False,
  "export_file_path": str(Path("s054-solution.ndjson").resolve()),
  "permitted_axioms": ["propext","Quot.sound","Classical.choice"],
  "unpermitted_axiom_hard_error": False,
  "num_threads": 4,
  "nat_extension": True,
  "string_extension": True
}
Path("s054-evidence/nanoda-config.json").write_text(json.dumps(config, indent=2) + "\n")
PY

prefix="$(lean --print-prefix)"
for kernel in leanchecker nanoda_bin con-ron; do
  test -x "$prefix/bin/$kernel" || { echo "Missing pinned kernel: $kernel"; exit 2; }
done
# Prlimit caps EACH stage's address space at 12 GiB to prevent an
# uncontrolled 16 GiB OOM. If a kernel needs more, record that as
# RESOURCE-LIMITED, not as proof rejection or verification failure.
# Compare single and official two-worker con-ron; use official NanoDa
# thread config, and the exact bundled Lean checker.
limit_bytes=$((12*1024*1024*1024))
run() {
  local stage="$1"; shift
  echo "::group::S054 isolated $stage"
  echo "S054 $stage start"
  set +e
  /usr/bin/time -v -o "s054-evidence/$stage.time" \
    timeout --signal=TERM --kill-after=15s 540s \
    prlimit --as="$limit_bytes" -- "$@" > "s054-evidence/$stage.log" 2>&1
  local rc=$?
  set -e
  local rss wall
  rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' "s054-evidence/$stage.time" | tail -1)"
  wall="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' "s054-evidence/$stage.time" | tail -1)"
  printf '%s\t%s\t%s\t%s\n' "$stage" "$rc" "${rss:-unknown}" "${wall:-unknown}" | tee -a s054-evidence/stages.tsv
  tail -n 24 "s054-evidence/$stage.log" || true
  if [ "$rc" -eq 124 ] || [ "$rc" -eq 137 ]; then
    echo "S054 $stage RESOURCE/TIME LIMIT, NOT A PROOF VERDICT"
  elif [ "$rc" -ne 0 ]; then
    echo "S054 $stage exited $rc; see log. An address-space cap may be the cause."
  fi
  echo "::endgroup::"
}
run conron_1 "$prefix/bin/con-ron" --jobs=1 s054-solution.ndjson
run nanoda "$prefix/bin/nanoda_bin" s054-evidence/nanoda-config.json
run leanchecker "$prefix/bin/leanchecker" --silent --from-export s054-solution.ndjson
run conron_2 "$prefix/bin/con-ron" --jobs=2 s054-solution.ndjson

echo "S054 isolated kernel matrix:"
cat s054-evidence/stages.tsv
# Diagnostic job is green iff all isolated kernels really exited 0;
# a green here still does not replace official Palomar FULL.
awk 'NR>1 && $2 != 0 {failed=1} END {exit failed}' s054-evidence/stages.tsv
