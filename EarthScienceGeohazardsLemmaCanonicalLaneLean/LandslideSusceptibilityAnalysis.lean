import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure LandslideSusceptibilityPackage where
  terrainData : Type
  triggeringFactors : Type
  slopeStabilityModel : Prop
  rainfallThreshold : Prop
  susceptibilityMap : Prop
  slopeStabilityModelClosed : slopeStabilityModel
  rainfallThresholdClosed : rainfallThreshold
  susceptibilityMapClosed : susceptibilityMap

structure LandslideSusceptibilityEvidence (L : LandslideSusceptibilityPackage) where
  slopeStabilityModelClosed : L.slopeStabilityModel
  rainfallThresholdClosed : L.rainfallThreshold
  susceptibilityMapClosed : L.susceptibilityMap

def LandslideSusceptibilityClosed (L : LandslideSusceptibilityPackage) : Prop :=
  L.slopeStabilityModel ∧ L.rainfallThreshold ∧ L.susceptibilityMap

theorem landslide_susceptibility_closed_from_evidence (L : LandslideSusceptibilityPackage)
    (E : LandslideSusceptibilityEvidence L) : LandslideSusceptibilityClosed L := by
  exact And.intro E.slopeStabilityModelClosed
    (And.intro E.rainfallThresholdClosed E.susceptibilityMapClosed)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse