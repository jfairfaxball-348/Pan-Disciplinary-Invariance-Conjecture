# PDIC S025 — strict Lean certificate for the 702-image zero-fixing GL(3,3) orbit

**Automatically installed at S024 closeout, 17 October 2026. NOT EXECUTED.** The next explicit owner's “Run next session” executes S025 immediately, without reconfirmation. Follow AGENTS.md. Work on `session/s007-full-lean-flagship`, draft PR #4; never merge it automatically. Install S026 at the end of S025 but do not execute it.

## Exact starting mathematical boundary

S022 has the complete real four-probability law and sharp unique spider for the canonical eight-cap, strictly certified. S023 has the same for any admissible cap **assuming** `hnf : ClassicalCapNormalForm`, strictly certified. S024 introduced `S024.lean` to isolate the precise **unlabelled** finite orbit proposition `AdmissibleCapImageOrbit`; the labelled equivalence `classicalCapNormalForm_iff_image_orbit` reconstructs a genuine permutation using admissibility/injectivity and finiteness. Consult `sessions/S024_CLOSEOUT.md` for whether the S024 bridge itself has passed exact-head strict CI.

**ONE exact remaining mathematical obligation:** prove `AdmissibleCapImageOrbit` without hypotheses, axiom, oracle, `sorry`, `admit`, `native_decide`, or an unverified numerical certificate. Do not confuse the already passing exhaustive Python checker with a Lean proof. The distinct `ClassicalCapNormalForm` proposition does not magically follow without this missing orbit lemma.

## S024 extension: preferred 6188-candidate basis-normalization alternative

A subsequent **FINITE_CHECKED**, not yet fully Lean-certified, S024 extension gives a potentially much smaller proof than 329472 opposite-pair candidates. First prove **every admissible eight-cap contains an independent ordered triple**, and construct a zero-fixing `LinearEquiv` sending that triple to `(e₁,e₂,e₃)`. The basis points themselves, zero, their three antipodes, and the three negatives of pairwise basis sums exclude 10 distinct ambient points. That leaves 17 candidate points for the remaining five: **C(17,5)=6188** candidates. Independent exhaustive code finds **18 admissible normalized caps**; all 18 equal a normalized canonical linear image. The canonical eight-cap has 48 independent unordered triples / 288 ordered ones, producing exactly the same 18 normalized cap images. Script: `scripts/verify_s024_normal_form.py`; mathematical note: `research/S024_BASIS_NORMALIZATION_EXTENSION.md` on proof branch. Prove the 17-point restriction and **18-of-6188 completeness** in the Lean kernel, and extract actual typed linear maps to close `AdmissibleCapImageOrbit`. Avoid claiming that the Python table itself or a conditional basis-normalized lemma discharges the universal orbit. Fall back to the original 13-direction method only if needed.

## Main proof target

Construct a theorem `admissibleCapImageOrbit_proved : AdmissibleCapImageOrbit` using real `CapPoint = Fin 3 → ZMod 3` and actual `CapPoint ≃ₗ[ZMod 3] CapPoint`. Then obtain `classicalCapNormalForm_proved : ClassicalCapNormalForm` via S024's certified equivalence, and finally derive `connected_graphMIS_complete_flagship_unconditional_all_caps` by applying S023's conditional flagship. The final statement must quantify over **all connected eight-vertex graphs G** and **all admissible enumerated caps f** and retain every one of the genuine four exact probabilities and the iff named-spider sharp equality case.

## Concrete finite-certificate strategy

1. Construct the 13 antipodal pairs of the 26 nonzero `F₃³` vectors in Lean, and a canonical finite encoding of eight-element subsets taking at most one representative from each pair. Form the at-most `binom(13,8)·2⁸ = 329472` candidate configurations; zero-sum-triple pruning leaves exactly 702. No exhaustive `27^8` labelled-map search.
2. Generate exact `GL(3,3)` matrices as independent ordered basis images; prove invertibility and the count 11232, while certifying the canonical cap-image stabiliser size 16. Avoid opaque runtime checks. Prefer a reduction to a finite table of unique 702 orbit masks with kernel-checked membership or a structural nine-cap proof, whichever is faster to make the Lean kernel accept.
3. Prove *every* admissible image is represented by the generated candidates, that each surviving candidate appears in the canonical orbit, and that a surviving member yields an actual `LinearEquiv` witness. Ensure none of these three implications is left as an unproved lemma. The independent `scripts/verify_s024_orbit.py` enumerates the same figures using a distinct antipodal-pair DFS; compare classifications and explicit permutations.
4. Exploit the S024 bridge already proved (subject to strict CI confirmation) to convert image equality to a **genuine vertex permutation**; do not insert a second arbitrary permutation hypothesis.
5. If direct finite reduction exhausts heartbeats, prove a mathematical shrinking lemma (e.g. basis normalisation or structural affine-nine-cap-to-pointed-linear reduction) rather than invoking `native_decide`. Record exact smallest remaining obligation if completion remains blocked.

## Hostile audit / verification / governance

Check independently for nonstandard orbit components, additive translations masquerading as linear maps, mishandled origin, incorrect matrix determinant or stabiliser counts, duplicate unordered image representations and missing labelled permutations. Primary reference is Follett–Kalail–McMahon–Pelland–Won (2014), Proposition 2.2(1); it states **affine** nine-cap equivalence, not the zero-fixing **linear** form, which requires an additional argument. Preserve novelty/priority as unresolved.

Run pinned `lake build`, `lake env lean S024.lean` (or an integrated proof module), source hole scan, `#print axioms` permitting only `propext`, `Classical.choice`, `Quot.sound`, all independent finite checkers and exact-head hosted strict/finite Actions. Do not upgrade the **unconditional** flagship until CI passes for the actual proof-bearing commit. Keep proof branch and draft PR #4 unmerged; do not submit Palomar/arXiv/journal, contact researchers, or modify other repositories.

## Closeout

Write a mathematical proof note; update CLAIMS, README, ROADMAP, `authoritative/STATE.json` and the next session's closeout; pin proof commit and exact successful CI run URLs. Automatically install an executable S026 prompt for the most significant remaining first-paper proof obligation, without executing S026.
