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
cases=(structural_third optimized_pair_0_3 original_pair_0_3 flagship)
for case_name in "${cases[@]}"; do
  roots=("${base[@]}")
  case "$case_name" in
    structural_third)
      roots+=("_private.S024.0.PDIC.s058_second_survivors_split") ;;
    optimized_pair_0_3)
      roots+=("_private.S024.0.PDIC.s058_pair_0_3_card_optimized") ;;
    original_pair_0_3)
      roots+=("_private.S024.0.PDIC.s028_pair_0_3_survivor_card") ;;
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
# Deliberately do NOT claim PASS of a failed root just because the profile job exited 0.
