import HautevilleHouse.EarthScienceGeohazardsLemmaCanonicalLaneLean.GeohazardAdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure HazardModelPackage where
  hazardType : String
  intensityMeasure : Prop
  frequencyAnalysis : Prop
  spatialExtent : Prop
  temporalEvolution : Prop

structure HazardModelEvidence (H : HazardModelPackage) where
  intensityMeasureClosed : H.intensityMeasure
  frequencyAnalysisClosed : H.frequencyAnalysis
  spatialExtentClosed : H.spatialExtent
  temporalEvolutionClosed : H.temporalEvolution

def HazardModelClosed (H : HazardModelPackage) : Prop :=
  H.intensityMeasure ∧ H.frequencyAnalysis ∧ H.spatialExtent ∧ H.temporalEvolution

theorem hazard_model_closed_from_evidence (H : HazardModelPackage)
    (E : HazardModelEvidence H) : HazardModelClosed H := by
  exact And.intro E.intensityMeasureClosed
    (And.intro E.frequencyAnalysisClosed
      (And.intro E.spatialExtentClosed E.temporalEvolutionClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse