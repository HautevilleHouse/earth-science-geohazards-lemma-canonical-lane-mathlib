import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure GeohazardAdmittedObject where
  region : Type u
  topology : TopologicalSpace region
  hazardModel : Prop
  vulnerability : Prop
  exposure : Prop
  riskAssessment : hazardModel ∧ vulnerability ∧ exposure

structure AdmissibleClass where
  object : GeohazardAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.riskAssessment) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse