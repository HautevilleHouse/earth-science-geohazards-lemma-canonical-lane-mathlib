import EarthScienceGeohazardsLemmaCanonicalLaneLean.GroundMotionPrediction

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure HazardCurvePackage {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F} where
  sourceModel : Prop
  recurrenceModel : Prop
  exceedanceProbability : Prop
  returnPeriod : Prop

structure HazardCurveEvidence {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    (H : HazardCurvePackage G) where
  sourceModelClosed : H.sourceModel
  recurrenceModelClosed : H.recurrenceModel
  exceedanceProbabilityClosed : H.exceedanceProbability
  returnPeriodClosed : H.returnPeriod

def HazardCurveClosed {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    (H : HazardCurvePackage G) : Prop :=
  H.sourceModel ∧ H.recurrenceModel ∧ H.exceedanceProbability ∧ H.returnPeriod

theorem hazard_curve_closed_from_evidence
    {P : SeismicWavePropagationPackage} {F : FaultGeometryPackage P}
    {G : GroundMotionPredictionPackage F} (H : HazardCurvePackage G)
    (E : HazardCurveEvidence H) : HazardCurveClosed H := by
  exact And.intro E.sourceModelClosed (And.intro E.recurrenceModelClosed (And.intro E.exceedanceProbabilityClosed E.returnPeriodClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
