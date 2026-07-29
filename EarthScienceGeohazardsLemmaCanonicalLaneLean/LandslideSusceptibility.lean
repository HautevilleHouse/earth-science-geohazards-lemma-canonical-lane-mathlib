import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure SlopeUnit where
  unitId : String
  geometry : Type u
  lithology : Prop
  slopeAngle : Prop
  vegetationCover : Prop

def slopeCharacterizationClosed (S : SlopeUnit) : Prop :=
  S.lithology ∧ S.slopeAngle ∧ S.vegetationCover

theorem slope_characterization_closed (S : SlopeUnit) : slopeCharacterizationClosed S :=
  ⟨S.lithology, S.slopeAngle, S.vegetationCover⟩

structure LandslideTrigger where
  triggerId : String
  rainfallThreshold : Prop
  seismicShaking : Prop
  anthropogenicActivity : Prop

def LandslideSusceptibilityModel (S : SlopeUnit) (T : LandslideTrigger) : Prop :=
  S.lithology ∧ T.rainfallThreshold

theorem landslide_susceptibility_closed (S : SlopeUnit) (T : LandslideTrigger) :
    LandslideSusceptibilityModel S T :=
  ⟨slopeCharacterizationClosed S, T.rainfallThreshold⟩

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
