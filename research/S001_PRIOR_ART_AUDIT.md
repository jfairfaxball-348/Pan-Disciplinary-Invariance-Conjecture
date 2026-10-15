# S001 bounded literature and pinned-source audit (2026-10-15)

## Directly read primary geometry literature

Follett, Michael; Kalail, Kyle; McMahon, Elizabeth; Pelland, Catherine; Won, Robert. "Partitions of AG(4,3) into maximal caps." *Discrete Mathematics* **337** (2014), 1–8. DOI https://doi.org/10.1016/j.disc.2014.08.002. Public PDF https://sites.lafayette.edu/mcmahone/files/2015/01/PartitionsAG43.pdf. Section 2, Proposition 2.2(1), establishes affine equivalence and zero total sum of maximal nine-caps in AG(3,3), recording the maximum cap size nine and Bose (1947)/elliptic quadric antecedents. Our cap-normal-form proof **depends** on that classification. Do not assert it is new.

Davis and Maclagan, *The Joy of SET*, chapter 9: warns that arbitrary **complete** eight-caps in AG(3,3) need not all be affinely equivalent. Our U is more restrictive: adding zero produces a maximum nine-cap. A free-standing claim about all complete eight-caps would be false.

Karapetyan and Karapetyan, "Complete Caps in Affine Geometry AG(n,3)," *Pattern Recognition and Image Analysis* **34** (2024), 74–91, https://doi.org/10.1134/s1054661824010097, provides more recent context. Only public abstract was inspected, not a source proof.

Bounded search for equivalent "702 8-caps", "nine-cap zero-sum quartets", "C4 four-subset nerve", "zero-sum 4-subset joint probabilities" found no exact duplicate of the S001 pair law in the retrieved texts. This **does not establish novelty**, especially in finite design theory.

## Exact pinned repository inputs

- https://github.com/jfairfaxball-348/Inverse-Zero-Sum-Research/tree/496cefb8e0672d069991f759adbfbc954b70f471 : Candidate3.lean defines and proves InverseZeroSum.Candidate3.frozenClassification : FrozenClassification. The positional avoidance property for length 24 is *not* absence of all short zero sums. This source theorem does **not** formalise PDIC cap rigidity.
- https://github.com/jfairfaxball-348/Greedy-Uniformity-on-Trees/tree/a4c4493a5fff82dfb085f59de41393b862af63a3 : random-order greedy MIS model and separately formalised tree uniformity results.
- https://github.com/jfairfaxball-348/TreeStack-Structural-Certificates-for-Stacking-on-Trees/tree/e1e437b8d02552b7c7ee0c4c74041b6ac956f063 : rooted pebbling transfer and branch-message machinery; S002 must distinguish mod-three conservation from the much stronger stackability theorem.
- https://github.com/jfairfaxball-348/Pan-Disciplinary-Invariance-Conjecture/commit/8ea43f617b9a2007bdb759972a14325529353ca3 : S000 finite-check code and GitHub Actions workflow baseline.

## Priority and significance gate

**CLASSICAL INPUT:** nine-cap maximum size, affine equivalence and total sum. **PROVED WITH CLASSICAL INPUT:** our 702 count, stabiliser 16 and canonical quartet/nerve picture. **PROVED CONDITIONAL ON THOSE:** exact pair-zero witness overlap law and graph-family variance identity. **ELEMENTARY BASELINE:** random-bijection one-witness conditioning.

The pair law might be an unrecorded but elementary reformulation of known affine design incidences. **Novelty and substantive publishability remain OPEN**, with graph-theoretic sharp consequences and comparison against combinatorial designs assigned to S002. No general-dimensional PDIC, sunflower conjecture, Davenport conjecture, HHA target or stackability claim is asserted here.
