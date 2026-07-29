import HautevilleHouse.EarthScienceGeohazardsLemmaCanonicalLaneLean.RiskAssessmentPackage

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure GeohazardAnalyticFoundation where
  hazard : HazardModelPackage
  hazardEvidence : HazardModelEvidence hazard
  vulnerability : VulnerabilityPackage hazard
  vulnerabilityEvidence : VulnerabilityEvidence vulnerability
  risk : RiskAssessmentPackage vulnerability
  riskEvidence : RiskAssessmentEvidence risk

def GeohazardAnalyticFoundationClosed (A : GeohazardAnalyticFoundation) : Prop :=
  HazardModelClosed A.hazard ∧ VulnerabilityClosed A.vulnerability ∧ RiskAssessmentClosed A.risk

theorem geohazard_analytic_foundation_closed_from_evidence
    (A : GeohazardAnalyticFoundation) :
    GeohazardAnalyticFoundationClosed A := by
  exact And.intro (hazard_model_closed_from_evidence A.hazard A.hazardEvidence)
    (And.intro (vulnerability_closed_from_evidence A.vulnerability A.vulnerabilityEvidence)
      (risk_assessment_closed_from_evidence A.risk A.riskEvidence))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse