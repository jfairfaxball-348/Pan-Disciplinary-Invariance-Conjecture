module

import all S024
public import S024

public section

namespace PDIC

/-!
S058: genuine sorted third-index partition of the original five-index
second-index shard. Nothing about s027ShortZeroFree is weakened.
These helper lemmas are isolated candidates until exact-source hosted Lean
and independent kernel checks pass.
-/

def s058LaterThird (j k : Fin 17) : Finset (Finset (Fin 17)) :=
  if j < k then
    ((s027LaterIndexPoints k).powersetCard 2).image (fun T => insert k T)
  else ∅

/-- Partition sorted three-element tails by their least index. -/
theorem s058_three_index_subsets_split (j : Fin 17) :
    (s027LaterIndexPoints j).powersetCard 3 =
      (Finset.univ : Finset (Fin 17)).biUnion (s058LaterThird j) := by
  classical
  ext S
  constructor
  · intro hS
    obtain ⟨hsub, hcard⟩ := Finset.mem_powersetCard.mp hS
    have hne : S.Nonempty := Finset.card_pos.mp (by omega : 0 < S.card)
    let k : Fin 17 := S.min' hne
    have hk : k ∈ S := Finset.min'_mem S hne
    have hjk : j < k := (Finset.mem_filter.mp (hsub hk)).2
    let T : Finset (Fin 17) := S.erase k
    have htcard : T.card = 2 := by
      simp [T, Finset.card_erase_of_mem hk, hcard]
    have htsub : T ⊆ s027LaterIndexPoints k := by
      intro x hx
      have hxne : x ≠ k := (Finset.mem_erase.mp hx).1
      have hxS : x ∈ S := (Finset.mem_erase.mp hx).2
      have hle : k ≤ x := Finset.min'_le S x hxS
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_univ _, lt_of_le_of_ne hle hxne.symm⟩
    apply Finset.mem_biUnion.mpr
    refine ⟨k, Finset.mem_univ _, ?_⟩
    simp only [s058LaterThird, if_pos hjk]
    apply Finset.mem_image.mpr
    exact ⟨T, Finset.mem_powersetCard.mpr ⟨htsub, htcard⟩,
      Finset.insert_erase hk⟩
  · intro hS
    obtain ⟨k, _, hkS⟩ := Finset.mem_biUnion.mp hS
    by_cases hjk : j < k
    · simp only [s058LaterThird, if_pos hjk] at hkS
      obtain ⟨T, hT, hEq⟩ := Finset.mem_image.mp hkS
      obtain ⟨hTsub, hTcard⟩ := Finset.mem_powersetCard.mp hT
      have hknot : k ∉ T := by
        intro hkT
        have hlt : k < k := (Finset.mem_filter.mp (hTsub hkT)).2
        exact (lt_irrefl k) hlt
      have hSub : insert k T ⊆ s027LaterIndexPoints j := by
        intro x hx
        rcases Finset.mem_insert.mp hx with hEqK | hxT
        · subst x
          exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hjk⟩
        · have hkx : k < x := (Finset.mem_filter.mp (hTsub hxT)).2
          exact Finset.mem_filter.mpr
            ⟨Finset.mem_univ _, lt_trans hjk hkx⟩
      have hCard : (insert k T).card = 3 := by
        simp [hknot, hTcard]
      rw [← hEq]
      exact Finset.mem_powersetCard.mpr ⟨hSub, hCard⟩
    · simp [s058LaterThird, hjk] at hkS

/-- The actual pair shard is the union of its sorted third-index parts. -/
def s058ThirdIndexShard (i j k : Fin 17) : Finset (Finset (Fin 17)) :=
  (s058LaterThird j k).image (fun T => insert i (insert j T))

theorem s058_second_index_split (i j : Fin 17) (hij : i < j) :
    (Finset.univ : Finset (Fin 17)).biUnion (s058ThirdIndexShard i j) =
      s027SecondIndexShard i j := by
  classical
  have hsplit := s058_three_index_subsets_split j
  simp only [s027SecondIndexShard, if_pos hij]
  ext S
  constructor
  · intro hS
    obtain ⟨k, _, hSk⟩ := Finset.mem_biUnion.mp hS
    obtain ⟨T, hT, hEq⟩ := Finset.mem_image.mp hSk
    apply Finset.mem_image.mpr
    refine ⟨T, ?_, hEq⟩
    rw [hsplit]
    exact Finset.mem_biUnion.mpr ⟨k, Finset.mem_univ _, hT⟩
  · intro hS
    obtain ⟨T, hT, hEq⟩ := Finset.mem_image.mp hS
    rw [hsplit] at hT
    obtain ⟨k, _, hk⟩ := Finset.mem_biUnion.mp hT
    apply Finset.mem_biUnion.mpr
    exact ⟨k, Finset.mem_univ _,
      Finset.mem_image.mpr ⟨T, hk, hEq⟩⟩

/-- Every third-index certificate checks the untouched original predicate. -/
def s058ThirdIndexSurvivors (i j k : Fin 17) : Finset (Finset (Fin 17)) :=
  (s058ThirdIndexShard i j k).filter
    (fun I => s027ShortZeroFree (s024BasisSet ∪ I.image s027FreePointAt) = true)

theorem s058_second_survivors_split (i j : Fin 17) (hij : i < j) :
    (Finset.univ : Finset (Fin 17)).biUnion
      (s058ThirdIndexSurvivors i j) = s028SecondIndexSurvivors i j := by
  classical
  ext S
  constructor
  · intro hS
    obtain ⟨k, _, hSk⟩ := Finset.mem_biUnion.mp hS
    obtain ⟨hshard, hgood⟩ := Finset.mem_filter.mp hSk
    apply Finset.mem_filter.mpr
    refine ⟨?_, hgood⟩
    rw [← s058_second_index_split i j hij]
    exact Finset.mem_biUnion.mpr ⟨k, Finset.mem_univ _, hshard⟩
  · intro hS
    obtain ⟨hshard, hgood⟩ := Finset.mem_filter.mp hS
    rw [← s058_second_index_split i j hij] at hshard
    obtain ⟨k, _, hSk⟩ := Finset.mem_biUnion.mp hshard
    apply Finset.mem_biUnion.mpr
    exact ⟨k, Finset.mem_univ _, Finset.mem_filter.mpr ⟨hSk, hgood⟩⟩

#print axioms PDIC.s058_three_index_subsets_split
#print axioms PDIC.s058_second_index_split
#print axioms PDIC.s058_second_survivors_split

end PDIC


namespace PDIC

/-!
S058 pilot (0,3): the sole surviving sorted tail is {0,3,7,10,14}.
For third index k, at most C(16-k,2) candidates require genuine
short-zero-free evaluation, versus C(13,3)=286 simultaneously.
No theorem from the historical giant proof is used in this cardinal proof.
-/

def s058Tail03 : Finset (Fin 17) := {0, 3, 7, 10, 14}

set_option maxRecDepth 16384 in
set_option maxHeartbeats 20000000 in
theorem s058_pair_0_3_third_table (k : Fin 17) :
    s058ThirdIndexSurvivors (0 : Fin 17) (3 : Fin 17) k =
      if k = (7 : Fin 17) then ({s058Tail03} : Finset (Finset (Fin 17))) else ∅ := by
  fin_cases k <;> decide +kernel

#print axioms PDIC.s058_pair_0_3_third_table

set_option maxRecDepth 16384 in
set_option maxHeartbeats 20000000 in
theorem s058_pair_0_3_card_optimized :
    (s028SecondIndexSurvivors (0 : Fin 17) (3 : Fin 17)).card = 1 := by
  classical
  rw [← s058_second_survivors_split (0 : Fin 17) (3 : Fin 17) (by decide)]
  simp only [s058_pair_0_3_third_table]
  decide +kernel

#print axioms PDIC.s058_pair_0_3_card_optimized

end PDIC
