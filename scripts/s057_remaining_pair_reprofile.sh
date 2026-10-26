#!/usr/bin/env bash
# S057: matched original vs symbolic (1,2) zero-sum pair and remaining positive shard profiling
# Proof source changed for (1,2) as well as prior two (0,1)/(0,2) zero-card shards; diagnostic only, not Palomar acceptance.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s057-evidence
printf 'case\texport_bytes\texport_rc\tcheck_rc\tpeak_rss_kib\twall\n' > s057-evidence/results.tsv
git rev-parse HEAD > s057-evidence/source-sha.txt
cat lean-toolchain > s057-evidence/toolchain.txt
cat > s057-evidence/limits.txt <<'EOF'
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
echo "::group::S057 identical flagship source builds"
lake build Solution Challenge > s057-evidence/build.log 2>&1 || {
  tail -n 90 s057-evidence/build.log
  exit 1
}
lake env lean Solution.lean > s057-evidence/axioms.log 2>&1 || {
  tail -n 70 s057-evidence/axioms.log
  exit 1
}
if grep -E 'sorryAx|Lean.ofReduceBool|Lean.trustCompiler' s057-evidence/axioms.log; then
  echo 'Unexpected axiom; stop diagnostic'; exit 1
fi
tail -n 4 s057-evidence/axioms.log
echo "::endgroup::"

checker="$(lean --print-prefix)/bin/leanchecker"
test -x "$checker"
limit_bytes=$((9*1024*1024*1024))
# Check all 0-first-index table facts individually, then adjacent combined
# closures. The aggregator lemma is included to test structural part alone.
cases=(pair_0_1 pair_0_2 pair_0_3 pair_1_2 pair_1_3 pair_2_3 flagship)
roots=()
for case_name in "${cases[@]}"; do
  roots=("${base[@]}")
  if [[ "$case_name" = flagship ]]; then
    roots+=("PDIC.palomar_complete_probability_and_spider")
  elif [[ "$case_name" = structural_sum ]]; then
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
    i="${case_name#pair_}"
    i="${i%%_*}"
    j="${case_name##*_}"
    if [[ "$i" = 0 && ( "$j" = 3 || ( "$j" -ge 9 && "$j" -le 12 ) ) ]]; then
      roots+=("_private.S024.0.PDIC.s028_pair_0_${j}_survivor_card")
    else
      roots+=("_private.S024.0.PDIC.s029_pair_${i}_${j}_survivor_card")
    fi
  fi
  echo "::group::S057 $case_name"
  printf '%s\n' "${roots[@]}" > "s057-evidence/$case_name.roots"
  rc=0
  lake env leanexport Solution -- "${roots[@]}" > "s057-$case_name.ndjson" 2> "s057-evidence/$case_name.export.log" || rc=$?
  if [ "$rc" -ne 0 ]; then
    printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" NA "$rc" NA NA NA | tee -a s057-evidence/results.tsv
    tail -n 16 "s057-evidence/$case_name.export.log"
    echo "::endgroup::"
    continue
  fi
  bytes="$(wc -c < "s057-$case_name.ndjson" | tr -d ' ')"
  set +e
  /usr/bin/time -v -o "s057-evidence/$case_name.time" \
    timeout --signal=TERM --kill-after=10s 150s \
    prlimit --as="$limit_bytes" -- \
    "$checker" --silent --from-export "s057-$case_name.ndjson" \
      > "s057-evidence/$case_name.check.log" 2>&1
  check_rc=$?
  set -e
  rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' "s057-evidence/$case_name.time" | tail -1)"
  wall="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' "s057-evidence/$case_name.time" | tail -1)"
  printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "$bytes" "$rc" "$check_rc" "${rss:-unknown}" "${wall:-unknown}" | tee -a s057-evidence/results.tsv
  if [ "$check_rc" -ne 0 ]; then tail -n 8 "s057-evidence/$case_name.check.log"; fi
  rm -f "s057-$case_name.ndjson"
  echo "::endgroup::"
done
echo '::group::S057 all measurements'
cat s057-evidence/results.tsv
echo "::endgroup::"
# Never paint a mathematical proof failure as checker success: 'success'
# here means instrument finished. All per-kernel results remain in TSV.
