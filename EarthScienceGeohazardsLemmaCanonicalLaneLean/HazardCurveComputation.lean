import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure HazardCurvePayload (M : GroundMotionPredictionPackage S) where
  exceedanceProb : ℝ → ℝ
  poissonAssumption : ∀ x : ℝ, exceedanceProb x = 1 - exp(-λ * M.peakGroundAcceleration x)

structure HazardCurveEvidence {M : GroundMotionPredictionPackage S} (H : HazardCurvePayload M) where
  poissonAssumptionClosed : H.poissonAssumption

def HazardCurveClosed {M : GroundMotionPredictionPackage S} (H : HazardCurvePayload M) : Prop :=
  H.poissonAssumption

theorem hazard_curve_closed_from_evidence {M : GroundMotionPredictionPackage S}
    (H : HazardCurvePayload M) (E : HazardCurveEvidence H) : HazardCurveClosed H := by
  exact E.poissonAssumptionClosed

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse