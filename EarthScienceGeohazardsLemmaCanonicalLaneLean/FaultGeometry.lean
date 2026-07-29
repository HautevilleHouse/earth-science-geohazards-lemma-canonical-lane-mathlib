import EarthScienceGeohazardsLemmaCanonicalLaneLean.SeismicWavePropagation

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure FaultGeometryPackage {P : SeismicWavePropagationPackage} where
  faultSurface : Type u
  strike : Prop
  dip : Prop
  ruptureArea : Prop
  slipDistribution : Prop

structure FaultGeometryEvidence {P : SeismicWavePropagationPackage}
    (F : FaultGeometryPackage P) where
  strikeClosed : F.strike
  dipClosed : F.dip
  ruptureAreaClosed : F.ruptureArea
  slipDistributionClosed : F.slipDistribution

def FaultGeometryClosed {P : SeismicWavePropagationPackage}
    (F : FaultGeometryPackage P) : Prop :=
  F.strike ∧ F.dip ∧ F.ruptureArea ∧ F.slipDistribution

theorem fault_geometry_closed_from_evidence
    {P : SeismicWavePropagationPackage} (F : FaultGeometryPackage P)
    (E : FaultGeometryEvidence F) : FaultGeometryClosed F := by
  exact And.intro E.strikeClosed (And.intro E.dipClosed (And.intro E.ruptureAreaClosed E.slipDistributionClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
