module

import Lake.Check.Compare

open Lean

def hintText (h : ReducibilityHints) : String :=
  match h with
  | .opaque => "opaque"
  | .abbrev => "abbrev"
  | .regular n => s!"regular:{n.toNat}"

def detail (ci : ConstantInfo) : String :=
  match ci with
  | .defnInfo d => s!"definition hints={hintText d.hints} safety={reprStr d.safety} all={reprStr d.all}"
  | .opaqueInfo d => s!"opaque unsafe={d.isUnsafe} all={reprStr d.all}"
  | .thmInfo d => s!"theorem all={reprStr d.all}"
  | .axiomInfo d => s!"axiom unsafe={d.isUnsafe}"
  | _ => "other"

def readExport (path : String) : IO LeanExport.ExportedEnv := do
  let f ← IO.FS.Handle.mk path .read
  LeanExport.parseStream (.ofHandle f)

def main (args : List String) : IO Unit := do
  let [cp, sp] := args | throw <| IO.userError "expected two export files"
  let c ← readExport cp
  let s ← readExport sp
  let names : Array Name := #[`PDIC.Vertex, `PDIC.spiderAdj, `PDIC.namedSpider,
    `PDIC.GraphMIS, `PDIC.CapPoint, `PDIC.IsAdmissibleCap,
    `PDIC.fourGraphMISFamily, `PDIC.graphMIS_exact_probability_for_cap]
  for n in names do
    let some a := c.constMap[n]? | throw <| IO.userError s!"missing Challenge {n}"
    let some b := s.constMap[n]? | throw <| IO.userError s!"missing PDIC {n}"
    IO.println s!"CONST {n}: full_equal={a == b} type_equal={a.type == b.type} value_equal={a.value? == b.value?} levels_equal={a.levelParams == b.levelParams}"
    IO.println s!"  CHALLENGE {detail a}"
    IO.println s!"  SOLUTION  {detail b}"
  match Lake.Check.compareAt c s #[] #[] names with
  | .ok _ => IO.println "REAL_COMPARE PASS"
  | .error e => IO.println s!"REAL_COMPARE FAIL {e}"
