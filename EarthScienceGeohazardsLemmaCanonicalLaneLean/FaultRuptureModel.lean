import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure FaultRuptureModelPackage where
  faultGeometry : Type u
  slipRateFault : faultGeometry → ℝ
  recurrenceInterval : ℕ
  seismicMomentRelease : ℕ
  consistentMomentRate : ∀ f : faultGeometry, slipRateFault f * recurrenceInterval = seismicMomentRelease

structure FaultRuptureModelEvidence (F : FaultRuptureModelPackage) where
  consistentMomentRateClosed : F.consistentMomentRate

def FaultRuptureModelClosed (F : FaultRuptureModelPackage) : Prop :=
  F.consistentMomentRate

theorem fault_rupture_model_closed_from_evidence (F : FaultRuptureModelPackage)
    (E : FaultRuptureModelEvidence F) : FaultRuptureModelClosed F := by
  exact E.consistentMomentRateClosed

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse