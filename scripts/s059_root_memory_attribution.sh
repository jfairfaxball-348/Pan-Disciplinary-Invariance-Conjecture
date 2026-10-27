#!/usr/bin/env bash
# S059: measure whole-flagship component proof closures at the exact S059 SHA.
# All requested roots include the same primitive roots as the comparator.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p s059-memory-evidence
printf 'case\tvm_gib\tbytes\texport_rc\tcheck_rc\trss_kib\twall\n' > s059-memory-evidence/results.tsv
git rev-parse HEAD > s059-memory-evidence/source-sha.txt
cat lean-toolchain > s059-memory-evidence/toolchain.txt
base=(Quot Quot.mk Quot.lift Quot.ind propext Quot.sound Classical.choice
 Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble
 Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight
 String.ofList Char.ofNat List eagerReduce Nat String String.mk Char
 optParam autoParam semiOutParam outParam)
checker="$(lean --print-prefix)/bin/leanchecker"
test -x "$checker"
case_name="${CASE_SELECTION:-first_0}"
case "$case_name" in
 first_0) root='_private.S024.0.PDIC.s030_first_0_survivor_card' ;;
 first_1) root='_private.S024.0.PDIC.s030_first_1_survivor_card' ;;
 first_2) root='_private.S024.0.PDIC.s030_first_2_survivor_card' ;;
 first_3) root='_private.S024.0.PDIC.s030_first_3_survivor_card' ;;
 pair_0_4) root='_private.S024.0.PDIC.s029_pair_0_4_survivor_card' ;;
 pair_0_5) root='_private.S024.0.PDIC.s029_pair_0_5_survivor_card' ;;
 pair_0_6) root='_private.S024.0.PDIC.s029_pair_0_6_survivor_card' ;;
 pair_1_4) root='_private.S024.0.PDIC.s029_pair_1_4_survivor_card' ;;
 pair_2_4) root='_private.S024.0.PDIC.s029_pair_2_4_survivor_card' ;;
 pair_3_5) root='_private.S024.0.PDIC.s029_pair_3_5_survivor_card' ;;
 normalized_card) root='_private.S024.0.PDIC.s030_normalized_survivor_card' ;;
 flagship) root='PDIC.palomar_complete_probability_and_spider' ;;
 *) echo "Unsupported exact case: $case_name" >&2; exit 2 ;;
esac
vm_gib="${VM_GIB:-9}"
case "$vm_gib" in 9|11|12) ;; *) echo "Unsupported bounded VM: $vm_gib"; exit 2 ;; esac
echo "case=$case_name root=$root vm_gib=$vm_gib sha=$(git rev-parse HEAD)"
lake build Challenge PDIC S024 Solution > s059-memory-evidence/build.log 2>&1 || {
 tail -n 90 s059-memory-evidence/build.log
 exit 1
}
lake env lean Solution.lean > s059-memory-evidence/axioms.log 2>&1 || {
 tail -n 50 s059-memory-evidence/axioms.log
 exit 1
}
if grep -Eq 'sorryAx|Lean.ofReduceBool|Lean.trustCompiler' s059-memory-evidence/{build,axioms}.log; then
 echo "UNAPPROVED AXIOM - do not profile untrusted proof" >&2; exit 1
fi
roots=("${base[@]}" "$root")
printf '%s\n' "${roots[@]}" > s059-memory-evidence/roots.txt
export_rc=0
lake env leanexport Solution -- "${roots[@]}" > "s059-$case_name.ndjson" 2> s059-memory-evidence/export.log || export_rc=$?
if [[ "$export_rc" -ne 0 ]]; then
 printf '%s\t%s\tNA\t%s\tNA\tNA\tNA\n' "$case_name" "$vm_gib" "$export_rc" | tee -a s059-memory-evidence/results.tsv
 tail -n 40 s059-memory-evidence/export.log
 exit 1
fi
bytes="$(wc -c < "s059-$case_name.ndjson" | tr -d ' ')"
set +e
/usr/bin/time -v -o s059-memory-evidence/check.time \
 timeout --signal=TERM --kill-after=10s 150s \
 prlimit --as="$((vm_gib * 1024 * 1024 * 1024))" -- \
 "$checker" --silent --from-export "s059-$case_name.ndjson" \
 > s059-memory-evidence/check.log 2>&1
check_rc=$?
set -e
rss="$(sed -n 's/^[[:space:]]*Maximum resident set size (kbytes):[[:space:]]*//p' s059-memory-evidence/check.time | tail -1)"
wall="$(sed -n 's/^[[:space:]]*Elapsed (wall clock) time (h:mm:ss or m:ss):[[:space:]]*//p' s059-memory-evidence/check.time | tail -1)"
printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$case_name" "$vm_gib" "$bytes" "$export_rc" "$check_rc" "${rss:-unknown}" "${wall:-unknown}" | tee -a s059-memory-evidence/results.tsv
if [[ "$check_rc" -ne 0 ]]; then tail -n 30 s059-memory-evidence/check.log; fi
rm -f "s059-$case_name.ndjson"
# Exit 1 on any independent checker non-zero; completion alone is never green.
[[ "$check_rc" -eq 0 ]]
