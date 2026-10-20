#!/usr/bin/env python3
"""Bounded streaming Lean 4 NDJSON export profiler. No export is loaded wholesale.

Counts raw byte/Expr frontiers between declaration records (NOT exclusive
declaration size). For selected declaration roots, separately traverses the
shared Expr DAG and reports unique reachable nodes. These are different
metrics. No assertion about Comparator RAM follows from either measurement.
"""
import argparse
import collections
import heapq
import json
import os
from array import array
from pathlib import Path

SENTINEL = (1 << 32) - 1

def profile(source: Path, top: int = 25, limit: int = 2_000_000):
    names = [(0, "")]
    edges = [array("I") for _ in range(4)]
    refs = collections.Counter()
    kinds = collections.Counter()
    decls = []
    byte_total = 0
    expr_total = 0
    segment_bytes = 0
    segment_expr = 0
    meta = None

    with source.open("rb", buffering=1024 * 1024) as stream:
        for line_no, raw in enumerate(stream, 1):
            byte_total += len(raw)
            segment_bytes += len(raw)
            try:
                rec = json.loads(raw)
            except (ValueError, UnicodeDecodeError) as exc:
                raise ValueError(f"invalid NDJSON line {line_no}: {exc}") from exc
            if "meta" in rec:
                meta = rec["meta"]
            if "in" in rec:
                i = int(rec["in"])
                if i != len(names):
                    raise ValueError(f"nonsequential name index at line {line_no}: {i}")
                if "str" in rec:
                    x = rec["str"]
                    names.append((int(x["pre"]), str(x["str"])))
                elif "num" in rec:
                    x = rec["num"]
                    names.append((int(x["pre"]), str(x["i"])))
                else:
                    raise ValueError("unknown name variant")
            if "ie" in rec:
                idx = int(rec["ie"])
                if idx != expr_total:
                    raise ValueError(f"nonsequential Expr index at line {line_no}: {idx} vs {expr_total}")
                children = []
                if "app" in rec:
                    children = [rec["app"]["fn"], rec["app"]["arg"]]
                    kinds["app"] += 1
                elif "lam" in rec or "forallE" in rec:
                    x = rec.get("lam", rec.get("forallE"))
                    children = [x["type"], x["body"]]
                    kinds["binder"] += 1
                elif "letE" in rec:
                    x = rec["letE"]
                    children = [x["type"], x["value"], x["body"]]
                    kinds["letE"] += 1
                elif "proj" in rec:
                    children = [rec["proj"]["struct"]]
                    kinds["proj"] += 1
                elif "mdata" in rec:
                    children = [rec["mdata"]["expr"]]
                    kinds["mdata"] += 1
                elif "const" in rec:
                    refs[int(rec["const"]["name"])] += 1
                    kinds["const"] += 1
                elif "bvar" in rec:
                    kinds["bvar"] += 1
                elif "sort" in rec:
                    kinds["sort"] += 1
                elif "natVal" in rec or "strVal" in rec:
                    kinds["literal"] += 1
                else:
                    raise ValueError(f"unexpected Expr variant at line {line_no}")
                if len(children) > 4:
                    raise ValueError("more than four Expr children")
                for j in range(4):
                    v = int(children[j]) if j < len(children) else SENTINEL
                    if v != SENTINEL and v >= idx:
                        raise ValueError(f"non-DAG Expr edge {idx} -> {v}")
                    edges[j].append(v)
                expr_total += 1
                segment_expr += 1
            for tag in ("thm", "def", "opaque", "axiom", "quot", "inductive"):
                if tag in rec:
                    entry = rec[tag]
                    if tag == "inductive":
                        # Group; not a single root/value declaration.
                        num = len(entry.get("types", []))
                        decls.append(dict(tag=tag, name_id=None, type=None, value=None,
                                          frontier_exprs=segment_expr,
                                          frontier_bytes=segment_bytes, members=num))
                    else:
                        decls.append(dict(tag=tag, name_id=entry.get("name"),
                                          type=entry.get("type"), value=entry.get("value"),
                                          frontier_exprs=segment_expr,
                                          frontier_bytes=segment_bytes))
                    segment_bytes = 0
                    segment_expr = 0
                    break

    cache = {0: ""}
    def resolve(i):
        if i is None:
            return "<inductive group>"
        i = int(i)
        if i not in cache:
            parts = []
            k = i
            while k and k not in cache:
                parent, part = names[k]
                parts.append((k, part))
                k = parent
            prefix = cache.get(k, "")
            for j, part in reversed(parts):
                prefix = (prefix + "." + part) if prefix else part
                cache[j] = prefix
        return cache[i]

    for d in decls:
        d["name"] = resolve(d.pop("name_id"))
    big = heapq.nlargest(top, decls, key=lambda d: d["frontier_exprs"])
    selected = [d for d in big if d["value"] is not None]
    flagship = [d for d in decls if d["name"].endswith("palomar_complete_probability_and_spider")]
    for d in flagship:
        if d not in selected and d["value"] is not None:
            selected.append(d)
    marks = array("I", [0]) * expr_total

    def reachable(root, generation):
        if root is None:
            return None
        root = int(root)
        stack = [root]
        visited = 0
        while stack:
            idx = stack.pop()
            if idx >= expr_total:
                raise ValueError(f"invalid expression root {idx}")
            if marks[idx] == generation:
                continue
            marks[idx] = generation
            visited += 1
            if visited >= limit:
                return dict(nodes_at_least=visited, truncated=True)
            for a in edges:
                child = a[idx]
                if child != SENTINEL and marks[child] != generation:
                    stack.append(child)
        return dict(unique_nodes=visited, truncated=False)

    for i, d in enumerate(selected, 1):
        d["value_dag"] = reachable(d["value"], i * 2)
        d["type_dag"] = reachable(d["type"], i * 2 + 1)
    const_counts = [
        {"name": resolve(i), "const_expr_nodes": cnt}
        for i, cnt in refs.most_common(top)
    ]
    return dict(
        sha=os.getenv("GITHUB_SHA", "local"), source=str(source),
        exporter_meta=meta, bytes=byte_total, expr_nodes=expr_total,
        declarations=len(decls), names=len(names), expr_kinds=dict(kinds),
        note=("frontier_bytes/frontier_exprs measure new NDJSON records emitted "
              "between declaration rows, including possibly transitive dependencies; "
              "NOT proof-only bytes or true memory attribution. "
              "value_dag/type_dag are globally deduplicated reachable Expr nodes, "
              "NOT resident memory or serialized per-declaration bytes."),
        largest_frontiers=big,
        selected_root_dags=selected,
        most_referenced_constants=const_counts,
    )

def main():
    p = argparse.ArgumentParser()
    p.add_argument("export", type=Path)
    p.add_argument("--output", required=True, type=Path)
    p.add_argument("--top", type=int, default=25)
    p.add_argument("--dag-limit", type=int, default=2_000_000)
    args = p.parse_args()
    result = profile(args.export, args.top, args.dag_limit)
    args.output.write_text(json.dumps(result, indent=2) + "\n")
    print("SHA", result["sha"], "file", args.export)
    print("serialized bytes", result["bytes"], "Expr rows", result["expr_nodes"],
          "declarations", result["declarations"])
    print("Largest declaration frontiers (not exclusive proof bytes):")
    for d in result["largest_frontiers"][:15]:
        print(d["name"], d["tag"], "Expr", d["frontier_exprs"],
              "bytes", d["frontier_bytes"])
    print("Saved bounded profile:", args.output)

if __name__ == "__main__":
    main()
