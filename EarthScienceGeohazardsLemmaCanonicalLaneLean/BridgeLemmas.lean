import HautevilleHouse.EarthScienceGeohazardsLemmaCanonicalLaneLean.GeohazardAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.riskAssessment

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.riskAssessment

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse