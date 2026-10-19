# S038 independent exact-source declaration forensics

This **isolated diagnostic branch** starts from unmerged package SHA `268f8ddf386e49875f6d21984fdfa8482187e900`, preserving the frozen flagship proof and PR #24 untouched. The dedicated workflow builds the *actual* independent `Challenge` and substantive `PDIC` modules under Lean v4.35.0-rc2, then imports each separately to print its `PDIC.namedSpider` `ConstantInfo` fields. This avoids co-importing conflicting Challenge and Solution definitions and compares structural `Expr` representations rather than source text. The official pinned Palomar Comparator is the final arbiter; no pass is claimed from matching hashes alone.

[Diagnostic Actions](https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/actions/workflows/s038-constantinfo-forensics.yml)

No change to Challenge, PDIC, S024, Solution, comparator.json, Palomar submission workflow, or official package source.
