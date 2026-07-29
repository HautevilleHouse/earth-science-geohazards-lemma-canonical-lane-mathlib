import EarthScienceGeohazardsLemmaCanonicalLaneLean.SiteResponse

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure ProbabilisticSeismicHazardPackage {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} {S : SiteResponsePackage H} where
  logicTree : Prop
  epistemicUncertainty : Prop
  hazardMap : Prop
  uniformHazardSpectrum : Prop
  deaggregation : Prop

structure ProbabilisticSeismicHazardEvidence {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} {S : SiteResponsePackage H}
    (PSH : ProbabilisticSeismicHazardPackage S) where
  logicTreeClosed : PSH.logicTree
  epistemicUncertaintyClosed : PSH.epistemicUncertainty
  hazardMapClosed : PSH.hazardMap
  uniformHazardSpectrumClosed : PSH.uniformHazardSpectrum
  deaggregationClosed : PSH.deaggregation

def ProbabilisticSeismicHazardClosed {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} {S : SiteResponsePackage H}
    (PSH : ProbabilisticSeismicHazardPackage S) : Prop :=
  PSH.logicTree ∧ PSH.epistemicUncertainty ∧ PSH.hazardMap ∧ PSH.uniformHazardSpectrum ∧ PSH.deaggregation

theorem probabilistic_seismic_hazard_closed_from_evidence
    {P : SeismicWavePropagationPackage} {F : FaultGeometryPackage P}
    {G : GroundMotionPredictionPackage F} {H : HazardCurvePackage G}
    {S : SiteResponsePackage H} (PSH : ProbabilisticSeismicHazardPackage S)
    (E : ProbabilisticSeismicHazardEvidence PSH) : ProbabilisticSeismicHazardClosed PSH := by
  exact And.intro E.logicTreeClosed (And.intro E.epistemicUncertaintyClosed (And.intro E.hazardMapClosed (And.intro E.uniformHazardSpectrumClosed E.deaggregationClosed)))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
