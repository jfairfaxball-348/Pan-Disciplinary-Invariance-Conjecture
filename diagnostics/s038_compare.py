#!/usr/bin/env python3
"""S038 bounded, honest, byte-level comparison of Lean-exported ConstantInfo reprs."""
from pathlib import Path
from hashlib import sha256
import json

folder = Path("diagnostics")
names = ("PDIC.Vertex", "PDIC.spiderAdj", "PDIC.namedSpider",
         "PDIC.GraphMIS", "PDIC.CapPoint", "PDIC.IsAdmissibleCap",
         "PDIC.fourGraphMISFamily", "PDIC.graphMIS_exact_probability_for_cap")
result = {"source": "pinned Lean 4.35.0-rc2 imported compiled Challenge/PDIC oleans", "constants": {}}
for name in names:
    a = (folder / f"s038-challenge-{name}.txt").read_text()
    b = (folder / f"s038-pdic-{name}.txt").read_text()
    n = min(len(a), len(b))
    k = next((i for i in range(n) if a[i] != b[i]), n)
    same = a == b
    def field(s, pos):
        anchors = ["kind=", "name=", "unsafe=", "levels=", "type=", "value="]
        found = [(s.find("\n" + v), v) for v in anchors[1:]]
        found.append((0, "kind="))
        return sorted((i, v) for i,v in found if 0 <= i <= pos)[-1][1]
    entry = {
      "equal_repr": same,
      "challenge_len": len(a), "solution_len": len(b),
      "challenge_sha256": sha256(a.encode()).hexdigest(),
      "solution_sha256": sha256(b.encode()).hexdigest()
    }
    if not same:
        entry.update({
          "first_differing_char": k,
          "field_at_difference": field(a, k),
          "challenge_context": a[max(0,k-160):k+280],
          "solution_context": b[max(0,k-160):k+280],
          "challenge_truncated": k == len(a),
          "solution_truncated": k == len(b)
        })
    result["constants"][name] = entry
(folder / "S038_EXPORTED_CONST_DIFF.json").write_text(json.dumps(result, indent=2))
for name, entry in result["constants"].items():
    print(name, "SAME" if entry["equal_repr"] else
          f"DIFFERENT first char {entry['first_differing_char']} ({entry['field_at_difference']})")
    if not entry["equal_repr"]:
        print("Challenge:", repr(entry["challenge_context"][:200]))
        print("Solution :", repr(entry["solution_context"][:200]))
