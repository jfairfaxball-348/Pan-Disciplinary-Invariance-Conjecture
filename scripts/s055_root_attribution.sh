#!/usr/bin/env bash
# S055: isolate proof-closure roots before changing mathematical sources.
# All checker verdicts are diagnostics; NOT an official Palomar preflight.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s055-evidence
printf 'case\troot\texport_rc\texport_bytes\tleanchecker_rc\tmax_rss_kib\twall_clock\n' > s055-evidence/results.tsv
git rev-parse HEAD > s055-evidence/source-sha.txt
cat lean-toolchain > s055-evidence/toolchain.txt

base_roots=(
  Quot Quot.mk Quot.lift Quot.ind
  propext Quot.sound Classical.choice
  Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod
  Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
  String.ofList Char.ofNat List eagerReduce Nat String String.mk Char
  optParam autoParam semiOutParam outParam
)
printf '%s\n' "${base_roots[@]}" > s055-evidence/baseline-roots.txt

echo '::group::Rebuild exact certified S053 theorem'
lake build Solution Challenge > s055-evidence/build.log 2>&1 || {
  tail -n 100 s055-evidence/build.log
  exit 1
}
lake env lean Solution.lean > s055-evidence/axioms.log 2>&1 || {
  tail -n 60 s055-evidence/axioms.log
  exit 1
}
if grep -E 'sorryAx|Lean.ofReduceBool|Lean.trustCompiler' s055-evidence/axioms.log; then
  echo 'DISALLOWED AXIOM: stop benchmark'; exit 1
fi
tail -n 4 s055-evidence/axioms.log
echo '::endgroup::'

leanprefix="$(lean --print-prefix)"
test -x "$leanprefix/bin/leanchecker"
# Per process VM cap, not cgroup RSS; limited processes are not math verdicts.
limit_bytes=$((11*1024*1024*1024))
for case_name in baseline geometry_iso classification_det first_survivor graph_law flagship; do
  case "$case_name" in
    baseline) root='' ;;
    geometry_iso) root='_private.PDIC.0.PDIC.canonicalSpiderIso._proof_1' ;;
    classification_det) root='_private.S024.0.PDIC.s025_column_det_nonzero' ;;
    first_survivor) root='_private.S024.0.PDIC.s030_first_0_survivor_card' ;;
    graph_law) root='_private.PDIC.0.PDIC.connected_graphMIS_four_probability_law' ;;
    flagship) root='PDIC.palomar_complete_probability_and_spider' ;;
  esac
  echo "::group::S055 root $case_name"
  args=("${base_roots[@]}")
  if [ -n "$root" ]; then args+=("$root"); fi
  echo "case=$case_name root=${root:-<none>} roots=${#args[@]}"
  export_rc=0
  if ! lake env leanexport Solution -- "${args[@]}" > "s055-$case_name.ndjson" 2> "s055-evidence/$case_name.export.log"; then
    export_rc=1
    echo "Export failed for $case_name:"
    tail -n 12 "s055-evidence/$case_name.export.log"
    printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "${root:-BASE}" "$export_rc" "-" "-" "-" "-" >> s055-evidence/results.tsv
    echo '::endgroup::'
    continue
  fi
  bytes="$(wc -c < "s055-$case_name.ndjson" | tr -d ' ')"
  echo "export_bytes=$bytes"
  set +e
  /usr/bin/time -v -o "s055-evidence/$case_name.time" \
    timeout --signal=TERM --kill-after=10s 240s \
    prlimit --as="$limit_bytes" -- \
    "$leanprefix/bin/leanchecker" --silent --from-export "s055-$case_name.ndjson" \
    > "s055-evidence/$case_name.check.log" 2>&1
  check_rc=$?
  set -e
  rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' "s055-evidence/$case_name.time" | tail -1)"
  elapsed="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' "s055-evidence/$case_name.time" | tail -1)"
  printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "${root:-BASE}" "$export_rc" "$bytes" "$check_rc" "${rss:-unknown}" "${elapsed:-unknown}" | tee -a s055-evidence/results.tsv
  tail -n 8 "s055-evidence/$case_name.check.log" || true
  if [ "$check_rc" -ne 0 ]; then
    echo "DIAGNOSTIC: $case_name did not pass this bounded check. Not a theorem rejection without detailed evidence."
  fi
  rm -f "s055-$case_name.ndjson"
  echo '::endgroup::'
done

echo '::group::Summary (not official Palomar approval)'
cat s055-evidence/results.tsv
echo '::endgroup::'
# Do not fail the diagnostic job merely because a bounded profile reaches the
# deliberately-imposed memory ceiling; results.tsv is the authoritative result.
