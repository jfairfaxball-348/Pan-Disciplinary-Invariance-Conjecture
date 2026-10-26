#!/usr/bin/env bash
# S056: measured cost decomposition for 0th first-index finite survivor cardinality
# No mathematical changes; this is a diagnostic, not Palomar acceptance.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s056-evidence
printf 'case\texport_bytes\texport_rc\tcheck_rc\tpeak_rss_kib\twall\n' > s056-evidence/results.tsv
git rev-parse HEAD > s056-evidence/source-sha.txt
cat lean-toolchain > s056-evidence/toolchain.txt
cat > s056-evidence/limits.txt <<'EOF'
Kernel: Lean checker from pinned lean-toolchain, --from-export.
One process at a time; no math changed.
One-process address-space limit 9 GiB; wall timeout 150s per case.
A failure at address-space or time cap is NOT a proof rejection.
EOF
base=(
  Quot Quot.mk Quot.lift Quot.ind propext Quot.sound Classical.choice
  Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble
  Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
  String.ofList Char.ofNat List eagerReduce Nat String String.mk Char
  optParam autoParam semiOutParam outParam
)
echo "::group::S056 identical flagship source builds"
lake build Solution Challenge > s056-evidence/build.log 2>&1 || {
  tail -n 90 s056-evidence/build.log
  exit 1
}
lake env lean Solution.lean > s056-evidence/axioms.log 2>&1 || {
  tail -n 70 s056-evidence/axioms.log
  exit 1
}
if grep -E 'sorryAx|Lean.ofReduceBool|Lean.trustCompiler' s056-evidence/axioms.log; then
  echo 'Unexpected axiom; stop diagnostic'; exit 1
fi
tail -n 4 s056-evidence/axioms.log
echo "::endgroup::"

checker="$(lean --print-prefix)/bin/leanchecker"
test -x "$checker"
limit_bytes=$((9*1024*1024*1024))
# Check all 0-first-index table facts individually, then adjacent combined
# closures. The aggregator lemma is included to test structural part alone.
cases=(pair_0_1 pair_0_2 pair_0_3 pair_0_4 pair_0_5 pair_0_6
  pair_0_7 pair_0_8 pair_0_9 pair_0_10 pair_0_11 pair_0_12 pair_0_13
  structural_sum prefix_1_6 prefix_1_13)
roots=()
for case_name in "${cases[@]}"; do
  roots=("${base[@]}")
  if [[ "$case_name" = structural_sum ]]; then
    roots+=("_private.S024.0.PDIC.s029_first_survivors_card_eq_second_sum")
  elif [[ "$case_name" = prefix_1_6 || "$case_name" = prefix_1_13 ]]; then
    max=6; [[ "$case_name" = prefix_1_13 ]] && max=13
    for j in $(seq 1 "$max"); do
      if [[ "$j" = 3 || "$j" -ge 9 && "$j" -le 12 ]]; then
        roots+=("_private.S024.0.PDIC.s028_pair_0_${j}_survivor_card")
      else
        roots+=("_private.S024.0.PDIC.s029_pair_0_${j}_survivor_card")
      fi
    done
  else
    j="${case_name#pair_0_}"
    if [[ "$j" = 3 || "$j" -ge 9 && "$j" -le 12 ]]; then
      roots+=("_private.S024.0.PDIC.s028_pair_0_${j}_survivor_card")
    else
      roots+=("_private.S024.0.PDIC.s029_pair_0_${j}_survivor_card")
    fi
  fi
  echo "::group::S056 $case_name"
  printf '%s\n' "${roots[@]}" > "s056-evidence/$case_name.roots"
  rc=0
  lake env leanexport Solution -- "${roots[@]}" > "s056-$case_name.ndjson" 2> "s056-evidence/$case_name.export.log" || rc=$?
  if [ "$rc" -ne 0 ]; then
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" NA "$rc" NA NA NA | tee -a s056-evidence/results.tsv
    tail -n 16 "s056-evidence/$case_name.export.log"
    echo "::endgroup::"
    continue
  fi
  bytes="$(wc -c < "s056-$case_name.ndjson" | tr -d ' ')"
  set +e
  /usr/bin/time -v -o "s056-evidence/$case_name.time" \
    timeout --signal=TERM --kill-after=10s 150s \
    prlimit --as="$limit_bytes" -- \
    "$checker" --silent --from-export "s056-$case_name.ndjson" \
      > "s056-evidence/$case_name.check.log" 2>&1
  check_rc=$?
  set -e
  rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' "s056-evidence/$case_name.time" | tail -1)"
  wall="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' "s056-evidence/$case_name.time" | tail -1)"
  printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "$bytes" "$rc" "$check_rc" "${rss:-unknown}" "${wall:-unknown}" | tee -a s056-evidence/results.tsv
  if [ "$check_rc" -ne 0 ]; then tail -n 8 "s056-evidence/$case_name.check.log"; fi
  rm -f "s056-$case_name.ndjson"
  echo "::endgroup::"
done
echo '::group::S056 all measurements'
cat s056-evidence/results.tsv
echo "::endgroup::"
# Never paint a mathematical proof failure as checker success: 'success'
# here means instrument finished. All per-kernel results remain in TSV.
