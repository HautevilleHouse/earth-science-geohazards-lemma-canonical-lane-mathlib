import EarthScienceGeohazardsLemmaCanonicalLaneLean.HazardCurve

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure SiteResponsePackage {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} where
  soilProfile : Prop
  shearWaveVelocity : Prop
  amplificationFunction : Prop
  liquefactionPotential : Prop

structure SiteResponseEvidence {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} (S : SiteResponsePackage H) where
  soilProfileClosed : S.soilProfile
  shearWaveVelocityClosed : S.shearWaveVelocity
  amplificationFunctionClosed : S.amplificationFunction
  liquefactionPotentialClosed : S.liquefactionPotential

def SiteResponseClosed {P : SeismicWavePropagationPackage}
    {F : FaultGeometryPackage P} {G : GroundMotionPredictionPackage F}
    {H : HazardCurvePackage G} (S : SiteResponsePackage H) : Prop :=
  S.soilProfile ∧ S.shearWaveVelocity ∧ S.amplificationFunction ∧ S.liquefactionPotential

theorem site_response_closed_from_evidence
    {P : SeismicWavePropagationPackage} {F : FaultGeometryPackage P}
    {G : GroundMotionPredictionPackage F} {H : HazardCurvePackage G}
    (S : SiteResponsePackage H) (E : SiteResponseEvidence S) : SiteResponseClosed S := by
  exact And.intro E.soilProfileClosed (And.intro E.shearWaveVelocityClosed (And.intro E.amplificationFunctionClosed E.liquefactionPotentialClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
