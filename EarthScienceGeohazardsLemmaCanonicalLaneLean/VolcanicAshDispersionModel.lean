import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure VolcanicAshDispersionPackage where
  eruptionSource : Type
  atmosphericTransport : Type
  particleFallout : Prop
  concentrationForecast : Prop
  hazardZonation : Prop
  particleFalloutClosed : particleFallout
  concentrationForecastClosed : concentrationForecast
  hazardZonationClosed : hazardZonation

structure VolcanicAshDispersionEvidence (V : VolcanicAshDispersionPackage) where
  particleFalloutClosed : V.particleFallout
  concentrationForecastClosed : V.concentrationForecast
  hazardZonationClosed : V.hazardZonation

def VolcanicAshDispersionClosed (V : VolcanicAshDispersionPackage) : Prop :=
  V.particleFallout ∧ V.concentrationForecast ∧ V.hazardZonation

theorem volcanic_ash_dispersion_closed_from_evidence (V : VolcanicAshDispersionPackage)
    (E : VolcanicAshDispersionEvidence V) : VolcanicAshDispersionClosed V := by
  exact And.intro E.particleFalloutClosed
    (And.intro E.concentrationForecastClosed E.hazardZonationClosed)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse