import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure SeismicGapModel where
  faultSegment : Type u
  recurrenceInterval : Prop
  slipDeficitAccumulated : Prop
  gapLength : Prop
  recurrenceIntervalTerm : recurrenceInterval
  slipDeficitAccumulatedTerm : slipDeficitAccumulated
  gapLengthTerm : gapLength

structure SeismicGapEvidence (M : SeismicGapModel) where
  recurrenceIntervalClosed : M.recurrenceInterval
  slipDeficitAccumulatedClosed : M.slipDeficitAccumulated
  gapLengthClosed : M.gapLength

def SeismicGapClosed (M : SeismicGapModel) : Prop :=
  M.recurrenceInterval ∧ M.slipDeficitAccumulated ∧ M.gapLength

theorem seismic_gap_closed_from_evidence (M : SeismicGapModel)
    (E : SeismicGapEvidence M) : SeismicGapClosed M := by
  exact And.intro E.recurrenceIntervalClosed
    (And.intro E.slipDeficitAccumulatedClosed E.gapLengthClosed)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
