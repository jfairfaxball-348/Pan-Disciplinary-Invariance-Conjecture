# PDIC S024 — pointed normal-form reduction to a finite unlabelled orbit

**Executed 17 October 2026.** The **complete arbitrary-cap flagship is not yet unconditional**. S024 isolates and formalises the exact missing geometry as `AdmissibleCapImageOrbit` and independently checks its finite numerical content; it does **not** prove that orbit statement in the Lean kernel.

## Precise mathematical result

For actual `Vertex = Fin 8`, actual `CapPoint = Fin 3 → ZMod 3` and the original `IsAdmissibleCap`, define

```lean
def AdmissibleCapImageOrbit : Prop :=
  ∀ f : Vertex → CapPoint, IsAdmissibleCap f →
    ∃ L : CapPoint ≃ₗ[ZMod 3] CapPoint,
      Set.range f = Set.range
        (fun v : Vertex => L (canonicalCapF3 v))
```

The new `S024.lean` proves **conditionally on this exact image-orbit claim** a genuine `ClassicalCapNormalForm`. Given an enumerated admissible cap and an unlabelled linear image equality, for each vertex `v` choose the canonical index `p(v)` with `f(v) = L(canonicalCapF3(p(v)))`. The choice is **injective** because the admissibility assumption includes `Function.Injective f`. Since domain and codomain are both the finite eight-vertex type, `p` is automatically bijective and can be promoted to `Equiv.Perm Vertex`. This completes the specifically demanded *labelled* reduction without postulating an indexing permutation.

Conversely the original `ClassicalCapNormalForm` immediately implies `AdmissibleCapImageOrbit`, because a permutation maps the finite vertex range onto itself. Thus the two normal-form propositions are equivalent. Another new theorem transfers actual fibre probabilities under an explicit image-orbit hypothesis by instantiating S023.

**Do not conflate:** the biconditional proof establishes *equivalence of hypotheses*. It does not discharge the hypothesis. A proof of `AdmissibleCapImageOrbit` remains the single smallest mathematical gap.

## Independent hostile finite audit

A new independent standard-library program `scripts/verify_s024_orbit.py` enumerates potential eight-caps via the 13 antipodal pairs of nonzero vectors, pruning every newly created three-term zero sum. The resulting 702 unordered images are compared to the images under every one of the 11232 independently enumerated invertible 3×3 matrices. The lists coincide; each image has 16 matrix witnesses. The checker also reconstructs an actual vertex bijection for **each** image against its chosen image witness. All its assertions passed locally and in the branch's hosted finite workflow. These are **FINITE_CHECKED**, not a universal formalisation.

## Primary literature wording and additional pointed step

Follett–Kalail–McMahon–Pelland–Won, *Discrete Mathematics* 337 (2014), Proposition 2.2(1), [primary PDF](https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf), states that maximal nine-caps of `AG(3,3)` are **affinely equivalent**. It does *not* directly state that a selected common origin can be fixed by an invertible linear map. S001's mathematical argument supplies origin-moving automorphisms of the quadratic canonical graph; strict Lean still needs a structural proof of that classification or a complete finite orbit certificate.

## Verification and provenance

Proof branch: `session/s007-full-lean-flagship`, draft [PR #4](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/pull/4), still open and unmerged. S024 proof source [06daea1887f0918fa3b1191cf315ec56a0c0222f](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/06daea1887f0918fa3b1191cf315ec56a0c0222f) includes the orientation repair following failed strict run [39024734901](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39024734901). Exact repaired-source [strict workflow 39025025539](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39025025539) and [finite workflow 39025025613](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/runs/39025025613) both completed **SUCCESS** at the exact repaired proof SHA. The strict job passed pinned `lake build`, `lake env lean S024.lean`, the source hole scan and all independent finite checkers. `#print axioms` for all four new declarations contains only `propext`, `Classical.choice`, `Quot.sound`. Therefore these *conditional bridge lemmas*, but not the orbit-exhaustion claim, are **LEAN_KERNEL_VERIFIED**.

S022/S023 pre-existing strictly checked theorems are preserved. No PR merge, Palomar/arXiv/journal submission, contact, or other-repository changes occurred. Literature priority and novelty remain unresolved.

**Next:** the automatically installed `research/NEXT_SESSION_PROMPT.md` is S025, devoted to a *Lean kernel-checkable proof of AdmissibleCapImageOrbit*, followed by the complete unconditional all-cap flagship, not to documentation or registration.
