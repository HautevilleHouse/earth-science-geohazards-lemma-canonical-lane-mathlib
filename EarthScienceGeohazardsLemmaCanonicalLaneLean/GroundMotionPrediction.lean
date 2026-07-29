import EarthScienceGeohazardsLemmaCanonicalLaneLean.FaultGeometry

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure GroundMotionPredictionPackage {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} where
  magnitude : Prop
  distanceMetric : Prop
  siteAmplification : Prop
  intensityMeasure : Prop
  aleatoryUncertainty : Prop

structure GroundMotionPredictionEvidence {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} (G : GroundMotionPredictionPackage F) where
  magnitudeClosed : G.magnitude
  distanceMetricClosed : G.distanceMetric
  siteAmplificationClosed : G.siteAmplification
  intensityMeasureClosed : G.intensityMeasure
  aleatoryUncertaintyClosed : G.aleatoryUncertainty

def GroundMotionPredictionClosed {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} (G : GroundMotionPredictionPackage F) : Prop :=
  G.magnitude ∧ G.distanceMetric ∧ G.siteAmplification ∧ G.intensityMeasure ∧ G.aleatoryUncertainty

theorem ground_motion_prediction_closed_from_evidence
    {P : SeismicWavePropagationPackage} {F : FaultGeometryPackage P}
    (G : GroundMotionPredictionPackage F) (E : GroundMotionPredictionEvidence G) :
    GroundMotionPredictionClosed G := by
  exact And.intro E.magnitudeClosed (And.intro E.distanceMetricClosed (And.intro E.siteAmplificationClosed (And.intro E.intensityMeasureClosed E.aleatoryUncertaintyClosed)))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
