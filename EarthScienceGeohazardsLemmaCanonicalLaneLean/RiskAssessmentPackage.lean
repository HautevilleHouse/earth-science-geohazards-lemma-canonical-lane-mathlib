import HautevilleHouse.EarthScienceGeohazardsLemmaCanonicalLaneLean.VulnerabilityPackage

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure RiskAssessmentPackage {H : HazardModelPackage}
    {V : VulnerabilityPackage H} where
  hazardIntensity : Prop
  exposureValue : Prop
  riskMetric : Prop
  mitigationMeasures : Prop

structure RiskAssessmentEvidence {H : HazardModelPackage}
    {V : VulnerabilityPackage H} (R : RiskAssessmentPackage V) where
  hazardIntensityClosed : R.hazardIntensity
  exposureValueClosed : R.exposureValue
  riskMetricClosed : R.riskMetric
  mitigationMeasuresClosed : R.mitigationMeasures

def RiskAssessmentClosed {H : HazardModelPackage}
    {V : VulnerabilityPackage H} (R : RiskAssessmentPackage V) : Prop :=
  R.hazardIntensity ∧ R.exposureValue ∧ R.riskMetric ∧ R.mitigationMeasures

theorem risk_assessment_closed_from_evidence
    {H : HazardModelPackage} {V : VulnerabilityPackage H}
    (R : RiskAssessmentPackage V) (E : RiskAssessmentEvidence R) :
    RiskAssessmentClosed R := by
  exact And.intro E.hazardIntensityClosed
    (And.intro E.exposureValueClosed
      (And.intro E.riskMetricClosed E.mitigationMeasuresClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse