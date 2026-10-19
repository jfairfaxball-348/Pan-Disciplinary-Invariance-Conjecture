# PDIC S037 post-closeout — final Palomar Comparator report (19 October 2026)

This updates completed S037 verification results **without executing S038 or changing any mathematical source**.

## Verified exact-SHA gate ledger

Candidate `268f8ddf386e49875f6d21984fdfa8482187e900` remains the head of unmerged draft PR #24, `session/s032-palomar-full-flagship`.

- **Strict pinned Lean [run 39242337067](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337067): SUCCESS**. Source compiled with permitted printed axioms only. This validates the S037 `by decide` proof change as well as the pre-existing flagship proof in the package.
- **Independent finite [run 39242337236](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337236): SUCCESS**.
- **Official full Palomar [run 39242337489](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337489): FAILURE**, official downloaded [machine-report artifact 12182283774](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337489/artifacts/12182283774), report source.commit matching exact candidate SHA.
- Machine `status=fail`, `stage=comparator`, `diagnostics[0].code=comparator.rejected`, `comparator_log_tail=error: Const does not match between challenge and target 'PDIC.namedSpider'`.
- The independent Challenge's canonical source and provenance checks succeeded (`Challenge` imports Mathlib only, `untrusted_sources=[]`). The Solution built successfully in **1054.946 seconds** with cgroup peak **12,346,028,032 bytes** (0 OOM kills); Solution export succeeded in **20.080 seconds** with peak **4,767,059,968 bytes** (0 OOM kills).
- Comparator rejected in **3.563 seconds**, cgroup peak **185,438,208 bytes**, **zero OOM kills**, returncode 1. The repeated error is NOT the older ~16 GiB resource exhaustion.
- Comparator never passed, so **Lean replay, NanoDa and con-ron not reached**. No official full-mechanical PASS, no Palomar registration, no merge and no external submission.
- `definition_names` remains empty, `theorem_names` names only the exact complete flagship; approved axioms `propext`, `Classical.choice`, `Quot.sound` only.

## Diagnosis and next task

**Empirical result:** Changing both `namedSpider` record symmetry/loopless tactic proofs to `by decide` *did not* make the exported Challenge/Solution `PDIC.namedSpider` constants structurally identical. The previous proof-script hypothesis is disproven as a sufficient repair. This does not establish which component differs.

**S038 remains installed, NOT executed.** First build a bounded actual-export declaration diff of the two `PDIC.namedSpider : SimpleGraph (Fin 8)` entries (kind, type, value, safety, reducibility hints, references to generated names, proof fields). Inspect the official canonical Challenge export and package Solution export produced with pinned Lean v4.35.0-rc2. Reconcile the **first exact mismatch** without changing graph/cap scope, treating `namedSpider` as a `definition_names` hole, dropping the explicit iff-spider theorem, disabling kernels or silently increasing runner resources. Then rerun all three independent gates on a new immutable SHA. Do not burn another 18-minute full run on a textual guess with no exported-declaration evidence.

The original full theorem proof remains independently Lean-certified on PR #4 SHA `09d9f392d20399c80f2c51e2f4979b78b412c4e2`, pinned strict run 39120877185. Novelty/priority remain unresolved.
