#!/usr/bin/env python3
"""Sequential, exact-root kernel measurements; a nonzero checker is a failure.

The primitive roots match the pinned Lake comparator. No declarations or
checkers are removed from a requested root's transitive dependency closure.
Use --label to distinguish immutable baseline and repaired source runs.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import time

BASE = '''Quot Quot.mk Quot.lift Quot.ind propext Quot.sound Classical.choice
Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble
Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat
List eagerReduce Nat String String.mk Char optParam autoParam semiOutParam outParam'''.split()
P = '_private.S024.0.PDIC.'
FIRST = [P + f's030_first_{i}_survivor_card' for i in range(4)]
CASES = {'group01': FIRST[:2], 'group012': FIRST[:3], 'group0123': FIRST,
         'normalized': [P + 's030_normalized_survivor_card'],
         'classification': [P + 's030_normalized_tail_classification'],
         'normalform': [P + 'classicalCapNormalForm_proved'],
         'flagship': ['PDIC.palomar_complete_probability_and_spider'],
         'control': ['Nat.add_comm'],
         'forbidden': [P + 's060_forbidden_certified'],
         'fast_card': [P + 's060_fast_card']}
for i in range(4, 7):
    CASES[f'mid{i}'] = [P + f's027_mid_shard_{i}_survivor_card']


def run_case(case, args, folder, checker):
    prefix = folder / case
    export = prefix.with_suffix('.ndjson')
    roots = BASE + CASES[case]
    prefix.with_suffix('.roots.txt').write_text('\n'.join(roots) + '\n')
    with export.open('wb') as out, prefix.with_suffix('.export.log').open('wb') as err:
        exp = subprocess.run(['lake', 'env', 'leanexport', 'Solution', '--', *roots],
                             stdout=out, stderr=err)
    row = {'case': case, 'export_rc': exp.returncode, 'export_bytes': export.stat().st_size,
           'vm_limit_gib': args.vm, 'timeout_seconds': args.timeout}
    if exp.returncode:
        row['check_rc'] = None
        print(json.dumps(row), flush=True)
        return row
    cmd = [os.environ.get('PDIC_TIME', '/usr/bin/time'), '-v', '-o', str(prefix.with_suffix('.time')),
           'timeout', '--signal=TERM', '--kill-after=10s', f'{args.timeout}s',
           'prlimit', f'--as={args.vm * 1024**3}', '--', checker,
           '--silent', '--from-export', str(export)]
    started = time.monotonic()
    peak_vm = peak_rss = 0
    sampled = False
    with prefix.with_suffix('.check.log').open('wb') as log:
        proc = subprocess.Popen(cmd, stdout=log, stderr=subprocess.STDOUT)
        # /usr/bin/time supplies the definitive wait4 RSS. On normal Linux
        # runners, also sample the descendants' virtual address spaces.
        while proc.poll() is None:
            todo = [proc.pid]
            while todo:
                pid = todo.pop()
                try:
                    stat = Path(f'/proc/{pid}/status').read_text()
                    for line in stat.splitlines():
                        if line.startswith('VmSize:'):
                            peak_vm = max(peak_vm, int(line.split()[1])); sampled = True
                        if line.startswith('VmRSS:'):
                            peak_rss = max(peak_rss, int(line.split()[1]))
                    kids = Path(f'/proc/{pid}/task/{pid}/children').read_text().split()
                    todo.extend(map(int, kids))
                except (FileNotFoundError, PermissionError, ProcessLookupError):
                    pass
            time.sleep(0.1)
    row.update(check_rc=proc.returncode, elapsed_seconds=round(time.monotonic()-started, 2),
               sampled_vm_kib=peak_vm if sampled else None,
               sampled_rss_kib=peak_rss if sampled else None)
    for line in prefix.with_suffix('.time').read_text().splitlines():
        if 'Maximum resident set size (kbytes):' in line:
            row['peak_rss_kib'] = int(line.split(':', 1)[1])
    if not args.keep_exports:
        export.unlink()
    prefix.with_suffix('.result.json').write_text(json.dumps(row, indent=2)+'\n')
    print(json.dumps(row), flush=True)
    return row


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--label', required=True)
    parser.add_argument('--cases', nargs='+', choices=CASES, required=True)
    parser.add_argument('--vm', type=int, default=9)
    parser.add_argument('--timeout', type=int, default=300)
    parser.add_argument('--keep-exports', action='store_true')
    args = parser.parse_args()
    if not 1 <= args.vm <= 12:
        parser.error('Use a bounded 1..12 GiB virtual-address limit')
    folder = Path('s060-evidence') / args.label
    folder.mkdir(parents=True, exist_ok=True)
    meta = {'git_sha': subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True).strip(),
            'source_status': subprocess.check_output(['git', 'status', '--porcelain', '--untracked-files=no'], text=True),
            'lean_version': subprocess.check_output(['lean', '--version'], text=True).strip(),
            'cgroup_memory_max': Path('/sys/fs/cgroup/memory.max').read_text().strip(),
            'sequential_checker_processes': 1}
    import hashlib
    meta['source_sha256'] = {f: hashlib.sha256(Path(f).read_bytes()).hexdigest()
                            for f in ['PDIC.lean','S024.lean','Challenge.lean','Solution.lean','comparator.json']}
    (folder / 'metadata.json').write_text(json.dumps(meta, indent=2)+'\n')
    checker = str(Path(subprocess.check_output(['lean','--print-prefix'], text=True).strip()) / 'bin/leanchecker')
    rows = [run_case(case, args, folder, checker) for case in args.cases]
    (folder / 'results.json').write_text(json.dumps(rows, indent=2)+'\n')
    raise SystemExit(0 if all(r.get('check_rc') == 0 for r in rows) else 1)


if __name__ == '__main__':
    main()
