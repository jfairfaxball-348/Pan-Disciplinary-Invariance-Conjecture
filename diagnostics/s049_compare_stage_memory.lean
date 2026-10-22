module

import Lake.Check.Compare
import Lake.Check.Axioms

open Lean

def loadExport (path : String) : IO LeanExport.ExportedEnv := do
  let handle ← IO.FS.Handle.mk path .read
  LeanExport.parseStream (.ofHandle handle)

def main (args : List String) : IO Unit := do
  let [mode, challengePath, solutionPath] := args
    | throw <| IO.userError "usage: <challenge|solution|both|compare|axioms> <challenge.ndjson> <solution.ndjson>"
  if mode == "challenge" then
    let c ← loadExport challengePath
    IO.println s!"S049 parsed challenge: {c.constOrder.size} declarations"
  else if mode == "solution" then
    let s ← loadExport solutionPath
    IO.println s!"S049 parsed solution: {s.constOrder.size} declarations"
  else
    let c ← loadExport challengePath
    IO.println s!"S049 loaded challenge ({c.constOrder.size} declarations)"
    let s ← loadExport solutionPath
    IO.println s!"S049 loaded solution ({s.constOrder.size} declarations)"
    let target : Name := `PDIC.palomar_complete_probability_and_spider
    let legal : Array Name := #[`propext, `Quot.sound, `Classical.choice]
    if mode == "compare" then
      IO.println "S049 starting semantic declaration comparison"
      let primitives : Array Name := #[
        `Nat.add, `Nat.sub, `Nat.mul, `Nat.pow, `Nat.gcd,
        `Nat.div, `Nat.mod, `Nat.beq, `Nat.ble,
        `Nat.land, `Nat.lor, `Nat.xor, `Nat.shiftLeft,
        `Nat.shiftRight, `String.ofList, `Char.ofNat,
        `List, `eagerReduce, `Nat, `String, `String.mk,
        `Char, `optParam, `autoParam, `semiOutParam, `outParam
      ]
      match Lake.Check.compareAt c s (#[target] ++ legal) #[] primitives with
      | .ok _ => IO.println "S049 comparison completed successfully"
      | .error msg => throw <| IO.userError s!"S049 comparison rejected: {msg}"
    else if mode == "axioms" then
      IO.println "S049 starting allowed-axiom traversal"
      match Lake.Check.checkAxioms s #[target] #[] legal with
      | .ok _ => IO.println "S049 axiom traversal completed successfully"
      | .error msg => throw <| IO.userError s!"S049 axiom traversal rejected: {msg}"
    else if mode == "both" then
      IO.println "S049 both environments parsed; traversal not started"
    else
      throw <| IO.userError s!"unknown mode: {mode}"
