import PDIC
import Lean

open Lean Elab Command

run_cmd do
  let env ← getEnv
  let some (.defnInfo d) := env.find? `PDIC.namedSpider
    | throwError "S038: PDIC.namedSpider is not an exported definition"
  logInfo m!"S038_KIND=defnInfo"
  logInfo m!"S038_NAME={d.name}"
  logInfo m!"S038_LEVELS={repr d.levelParams}"
  logInfo m!"S038_TYPE={repr d.type}"
  logInfo m!"S038_SAFETY={repr d.safety}"
  logInfo m!"S038_HINTS={repr d.hints}"
  logInfo m!"S038_VALUE_HASH={hash d.value}"
  logInfo m!"S038_VALUE={repr d.value}"
