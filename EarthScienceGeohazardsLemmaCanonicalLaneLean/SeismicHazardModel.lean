import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure SeismicSourceZone where
  sourceId : String
  location : Type u
  geometry : Type v
  magnitudeDistribution : Prop
  recurrenceRate : Prop

def tectonicRegimeClosed (S : SeismicSourceZone) : Prop :=
  S.magnitudeDistribution ∧ S.recurrenceRate

theorem tectonic_regime_closed (S : SeismicSourceZone) : tectonicRegimeClosed S :=
  ⟨S.magnitudeDistribution, S.recurrenceRate⟩

structure SeismicHazardModel (S : SeismicSourceZone) where
  groundMotionPredictionEquation : Prop
  siteAmplification : Prop
  hazardCurve : S.location → Prop
  probabilisticSeismicHazardAssessment : Prop

def SeismicHazardPackage (S : SeismicSourceZone) : Prop :=
  ∃ (H : SeismicHazardModel S), H.groundMotionPredictionEquation ∧ H.siteAmplification

theorem seismic_hazard_closure (S : SeismicSourceZone) (H : SeismicHazardModel S) :
    H.groundMotionPredictionEquation ∧ H.siteAmplification :=
  ⟨H.groundMotionPredictionEquation, H.siteAmplification⟩

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
