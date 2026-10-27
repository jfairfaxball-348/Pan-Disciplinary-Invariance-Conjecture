import Challenge
import Lean

open Lean Elab Command

/- S043: Read the *imported*, pinned, exported kernel ConstantInfo.
   Each file imports exactly one side to avoid conflicting PDIC names. -/
run_cmd do
  let env ← getEnv
  let names : Array Name := #[`PDIC.Vertex, `PDIC.spiderAdj, `PDIC.namedSpider,
    `PDIC.GraphMIS, `PDIC.CapPoint, `PDIC.IsAdmissibleCap,
    `PDIC.fourGraphMISFamily, `PDIC.graphMIS_exact_probability_for_cap]
  for name in names do
    let out := s!"diagnostics/s043-challenge-{name}.txt"
    let value ← match env.find? name with
      | none => pure "ABSENT\n"
      | some ci =>
        let body := match ci.value? with
          | some e => reprStr e
          | none => "NONE"
        pure ("kind=" ++ (if ci.isDefinition then "definition" else if ci.isTheorem then "theorem" else "other") ++
          "\nname=" ++ toString ci.name ++
          "\nunsafe=" ++ toString ci.isUnsafe ++
          "\nlevels=" ++ reprStr ci.levelParams ++
          "\ntype=" ++ reprStr ci.type ++
          "\nvalue=" ++ body ++ "\n")
    liftIO <| IO.FS.writeFile out value
    logInfo m!"S043 exported {name} from Challenge ({value.length} characters)"
