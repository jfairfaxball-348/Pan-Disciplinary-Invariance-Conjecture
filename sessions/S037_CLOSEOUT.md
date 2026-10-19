# PDIC S037 closeout — namedSpider structural-equality repair candidate

**Executed 19 October 2026. Not all green at closeout.** A substantive, same-SHA Challenge/Solution dependency repair candidate was **committed and full CI triggered**. Independent finite evidence passed; strict pinned Lean and official full Palomar verification were still in progress. No mathematical or publication gate is prematurely promoted.

## Forensic starting gate (actual S036 final report)

Draft PR #24 was at `99e3a40ec0864050dc9596724ccde05dc8d5578d`, with [strict 39222014929](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014929) PASS, [finite 39222014796](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222014796) PASS, [official full 39222015131](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131) FAIL. The official [machine report 12173795837](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39222015131/artifacts/12173795837) states `status=fail`, `stage=comparator`, `comparator.rejected`, first failing dependency `PDIC.namedSpider` with "Const does not match between challenge and target". Comparison ended normally in 3.732 s, peaked at 186,888,192 cgroup bytes with zero OOM kills. Solution build PASS (960.804 s, peak 12,348,428,288 bytes), Solution export PASS (22.35 s, peak 4,764,614,656 bytes). Lean replay/NanoDa/con-ron **not reached**. Thus this particular failure was not the previous memory exhaustion.

Upstream pinned Lean `Lake.Check.Compare` uses **structural equality** for each ordinary dependency's full `ConstantInfo`, not graph-extensional equality. Source-identical-looking named definitions can have differing proof terms, syntax-generated auxiliaries or elaboration environments. The difference's **exact exported subterm is not yet demonstrated**; the new repair is a hypothesis, not a finding that the old tactic was conclusively responsible.

## S037 concrete source change

- On existing **unmerged** [PR #24](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/24), created and fast-forwarded immutable [commit `268f8ddf386e49875f6d21984fdfa8482187e900`](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/268f8ddf386e49875f6d21984fdfa8482187e900) from previous branch HEAD `99e3a40ec0864050dc9596724ccde05dc8d5578d`.
- Exactly two substantive source files changed: `Challenge.lean` and `PDIC.lean`. The corresponding `namedSpider : SimpleGraph Vertex` records now both use `symm.symm := by decide` and `loopless.irrefl := by decide` instead of proof scripts using `intro`, `fin_cases` and `decide`. They are text-identical at the declaration block, and the same seven spider edges persist.
- **No edits** to the advertised theorem statement, actual permutation/graph/cap definitions beyond the named graph's witness *proof-term construction*, `Solution.lean` theorem, `S024.lean`, independent Challenge import boundary, Comparator settings, allowed axioms, Palomar execution profile or manuscript. This is not a narrowed claim or masking `namedSpider` via `definition_names`.
- The targeted motive is to remove tactic elaboration of quantified finitary proofs as a possible source of nonidentical exported constant bodies. This must be tested by the real pinned compiler and Comparator. There is no local Lean toolchain or network-backed git in the execution container; a source-text equality check is **not** the official gate.

## Evidence ledger for the new exact SHA

| Gate | Exact S037 run | Status when documented |
|---|---|---|
| Independent finite evidence | [39242337236](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337236) | **PASS** |
| Strict pinned Lean/source scan/axioms | [39242337067](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337067) | **IN PROGRESS — result unverified** |
| Official full Palomar Challenge provenance + Comparator + replay + NanoDa + con-ron | [39242337489](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39242337489) | **IN PROGRESS — result unverified** |

The prior historical proof PR #4 `09d9f392d20399c80f2c51e2f4979b78b412c4e2` remains independently **LEAN_KERNEL_VERIFIED** ([39120877185](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39120877185)). It is NOT an official full Palomar PASS on S037's edited source. Earlier package `fe94685a626051378e4c3dd1e0ff5fbc89503f02` had [Comparator OOM 39140422199](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39140422199) at peak 16,129,802,240 bytes / six OOM kills, which should be diagnosed separately if it recurs.

**Verdict:** PALOMAR_FULL_MECHANICAL_PASSED = **FALSE / NOT VERIFIED**, READY_FOR_OWNER_SUBMISSION = **FALSE**, REGISTERED = **FALSE**. No Palomar registration, PR merges, journal/arXiv submission or external correspondence; keep the manuscript Palomar link placeholder unfilled and novelty/priority unresolved.

## Full executable next prompt installed

`research/NEXT_SESSION_PROMPT.md` installs **S038** (not executed). Read there for complete same-SHA final-status/report retrieval and first-failure recovery. If strict/finite/full ultimately all passed on `268f8ddf386e49875f6d21984fdfa8482187e900`, promote only the verified status with exact machine evidence and switch S039 to deferred manuscript audit; otherwise continue Comparator and resource diagnostics until a full official report is green.
