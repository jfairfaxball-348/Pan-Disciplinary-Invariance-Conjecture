# PDIC S024 closeout — finite orbit audit and labelled normal-form bridge

**Executed 17 October 2026.** S025 was installed automatically on main, **NOT EXECUTED**. The S024 mathematical gate is **PARTIAL**, because the 702-image orbit theorem is still not internalised in Lean. The complete arbitrary-cap flagship remains **CONDITIONAL** on `ClassicalCapNormalForm`; do not misreport it as unconditional.

## Formal progress

New proof source `S024.lean` on the canonical branch `session/s007-full-lean-flagship`, draft PR #4:
[final repaired proof source 06daea1887f0918fa3b1191cf315ec56a0c0222f](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/06daea1887f0918fa3b1191cf315ec56a0c0222f). This file defines the exact finite-image orbit obligation `AdmissibleCapImageOrbit` and supplies a proof of the *implication* `AdmissibleCapImageOrbit → ClassicalCapNormalForm` by constructing an index map from the image equality, proving injectivity from `IsAdmissibleCap`, upgrading to a genuine `Equiv.Perm Vertex` and proving pointwise equality. It also proves the converse conditional implication and the equality of the real cap probability distributions under the smaller image-orbit hypothesis.

The first strict source run [39024734901](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39024734901) failed due to a reversed equality in an inverse-permutation witness. **It is not a successful certificate.** That exact line was repaired in source `06daea18...`. Repaired source [strict run 39025025539](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39025025539) must pass before labelling even the conditional S024 bridge **LEAN_KERNEL_VERIFIED**. The already certified S023 source and theorem remain unchanged.

## Independent full finite check

The distinct `scripts/verify_s024_orbit.py` enumerates admissible eight-subsets by antipodal-pair pruning, all invertible F₃³ matrices and an explicit index permutation for every resulting cap image. Observed: **702** admissible cap images; **11232** invertible zero-fixing linear maps; **16** maps mapping the canonical cap onto each image; exactly the same 702 image sets on both sides. [Exact-source independent finite workflow 39025025613 SUCCESS](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39025025613). This is **FINITE_CHECKED**, not a Lean certificate of the global orbit property.

## Exact smallest mathematical gap

```lean
admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit
```

No proof of this statement was supplied, and no `classicalCapNormalForm_proved` or `connected_graphMIS_complete_flagship_unconditional_all_caps` was produced. The remaining task is a kernel-checkable 702-image orbit certificate or a structural proof of pointed linear equivalence. The primary classical source gives affine nine-cap equivalence, and a zero-fixing step needs proof. Priority/novelty remains unresolved.

## Governance

Main repository now links [S024 proof note](../research/S024_POINTED_ORBIT_BRIDGE.md), updates README, ROADMAP, CLAIMS and authoritative STATE, and installs [S025 executable target](../research/NEXT_SESSION_PROMPT.md) matching [S025 target copy](../research/S025_EXACT_CAP_ORBIT_KERNEL_TARGET.md). S025 **NOT EXECUTED**. Draft PR #4 **OPEN / UNMERGED**. No Palomar registration, external correspondence, arXiv or journal submission, or other-repository mutation.
