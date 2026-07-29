import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure FloodRiskAssessmentPackage where
  precipitationIntensity : Prop
  riverDischarge : Prop
  terrainElevation : Prop
  floodDefense : Prop
  inundationDepth : Prop

structure FloodRiskAssessmentEvidence
    (F : FloodRiskAssessmentPackage) where
  precipitationIntensityClosed : F.precipitationIntensity
  riverDischargeClosed : F.riverDischarge
  terrainElevationClosed : F.terrainElevation
  floodDefenseClosed : F.floodDefense
  inundationDepthClosed : F.inundationDepth

def FloodRiskAssessmentClosed (F : FloodRiskAssessmentPackage) : Prop :=
  F.precipitationIntensity ∧ F.riverDischarge ∧ F.terrainElevation ∧
  F.floodDefense ∧ F.inundationDepth

theorem flood_risk_assessment_closed_from_evidence
    (F : FloodRiskAssessmentPackage)
    (E : FloodRiskAssessmentEvidence F) : FloodRiskAssessmentClosed F := by
  exact And.intro E.precipitationIntensityClosed
    (And.intro E.riverDischargeClosed
      (And.intro E.terrainElevationClosed
        (And.intro E.floodDefenseClosed E.inundationDepthClosed)))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
