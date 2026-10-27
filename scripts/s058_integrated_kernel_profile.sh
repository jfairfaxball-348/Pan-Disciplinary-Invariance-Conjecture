#!/usr/bin/env bash
# Exact-source independent kernel checks for S058 original-predicate proof substitution.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s058-evidence
printf 'case\texport_bytes\texport_rc\tcheck_rc\tpeak_rss_kib\twall\n' > s058-evidence/kernel-results.tsv
git rev-parse HEAD > s058-evidence/source-sha.txt
cat lean-toolchain > s058-evidence/toolchain.txt
printf 'Independent Leanchecker; per process 9 GiB address-space; 150s wall timeout.\n' > s058-evidence/kernel-limits.txt
base=(
  Quot Quot.mk Quot.lift Quot.ind propext Quot.sound Classical.choice
  Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble
  Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
  String.ofList Char.ofNat List eagerReduce Nat String String.mk Char
  optParam autoParam semiOutParam outParam
)
checker="$(lean --print-prefix)/bin/leanchecker"
test -x "$checker"
limit_bytes=$((9*1024*1024*1024))
cases=(structural_third optimized_pair_0_3 original_pair_0_3 optimized_pair_1_3 original_pair_1_3 optimized_pair_2_3 original_pair_2_3 original_pair_0_4 original_pair_0_5 original_pair_0_6 original_pair_1_4 original_pair_2_4 original_pair_1_5 original_pair_1_7 original_pair_3_5 flagship)
for case_name in "${cases[@]}"; do
  roots=("${base[@]}")
  case "$case_name" in
    structural_third)
      roots+=("_private.S024.0.PDIC.s058_second_survivors_split") ;;
    optimized_pair_0_3)
      roots+=("_private.S024.0.PDIC.s058_pair_0_3_card_optimized") ;;
    original_pair_0_3)
      roots+=("_private.S024.0.PDIC.s028_pair_0_3_survivor_card") ;;
    optimized_pair_1_3)
      roots+=("_private.S024.0.PDIC.s059_pair_1_3_card_optimized") ;;
    original_pair_1_3)
      roots+=("_private.S024.0.PDIC.s029_pair_1_3_survivor_card") ;;
    optimized_pair_2_3)
      roots+=("_private.S024.0.PDIC.s059_pair_2_3_card_optimized") ;;
    original_pair_2_3)
      roots+=("_private.S024.0.PDIC.s029_pair_2_3_survivor_card") ;;
    original_pair_0_4)
      roots+=("_private.S024.0.PDIC.s029_pair_0_4_survivor_card") ;;
    original_pair_0_5)
      roots+=("_private.S024.0.PDIC.s029_pair_0_5_survivor_card") ;;
    original_pair_0_6)
      roots+=("_private.S024.0.PDIC.s029_pair_0_6_survivor_card") ;;
    original_pair_1_4)
      roots+=("_private.S024.0.PDIC.s029_pair_1_4_survivor_card") ;;
    original_pair_2_4)
      roots+=("_private.S024.0.PDIC.s029_pair_2_4_survivor_card") ;;
    original_pair_1_5)
      roots+=("_private.S024.0.PDIC.s029_pair_1_5_survivor_card") ;;
    original_pair_1_7)
      roots+=("_private.S024.0.PDIC.s029_pair_1_7_survivor_card") ;;
    original_pair_3_5)
      roots+=("_private.S024.0.PDIC.s029_pair_3_5_survivor_card") ;;
    flagship)
      roots+=("PDIC.palomar_complete_probability_and_spider") ;;
  esac
  echo "::group::S058 $case_name"
  printf '%s\n' "${roots[@]}" > "s058-evidence/$case_name.roots"
  rc=0
  lake env leanexport Solution -- "${roots[@]}" > "s058-$case_name.ndjson" 2> "s058-evidence/$case_name.export.log" || rc=$?
  if [ "$rc" -ne 0 ]; then
    printf '%s\tNA\t%s\tNA\tNA\tNA\n' "$case_name" "$rc" | tee -a s058-evidence/kernel-results.tsv
    tail -n 20 "s058-evidence/$case_name.export.log"
    echo "::endgroup::"
    continue
  fi
  bytes="$(wc -c < "s058-$case_name.ndjson" | tr -d ' ')"
  set +e
  /usr/bin/time -v -o "s058-evidence/$case_name.time" \
    timeout --signal=TERM --kill-after=10s 150s \
    prlimit --as="$limit_bytes" -- \
    "$checker" --silent --from-export "s058-$case_name.ndjson" \
      > "s058-evidence/$case_name.check.log" 2>&1
  check_rc=$?
  set -e
  rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' "s058-evidence/$case_name.time" | tail -1)"
  wall="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' "s058-evidence/$case_name.time" | tail -1)"
  printf '%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "$bytes" "$rc" "$check_rc" "${rss:-unknown}" "${wall:-unknown}" | tee -a s058-evidence/kernel-results.tsv
  if [ "$check_rc" -ne 0 ]; then tail -n 8 "s058-evidence/$case_name.check.log"; fi
  rm -f "s058-$case_name.ndjson"
  echo "::endgroup::"
done
cat s058-evidence/kernel-results.tsv
# Treat any independent checker failure as an actual CI failure. Diagnostics are
# already emitted and saved by the job's always() upload-artifact step.
if ! awk -F '\t' 'NR > 1 && ($3 != 0 || $4 != 0) { failed=1 } END { exit failed }' s058-evidence/kernel-results.tsv; then
  echo 'Independent kernel verification did not pass for every root: see the TSV and logs.'
  exit 1
fi
