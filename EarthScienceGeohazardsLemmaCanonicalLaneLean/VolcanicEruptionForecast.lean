import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure VolcanicEruptionForecastPackage where
  magmaChamberPressure : Prop
  seismicSwarmActivity : Prop
  gasEmissionRate : Prop
  groundDeformation : Prop
  eruptionLikelihood : Prop

structure VolcanicEruptionForecastEvidence
    (V : VolcanicEruptionForecastPackage) where
  magmaChamberPressureClosed : V.magmaChamberPressure
  seismicSwarmActivityClosed : V.seismicSwarmActivity
  gasEmissionRateClosed : V.gasEmissionRate
  groundDeformationClosed : V.groundDeformation
  eruptionLikelihoodClosed : V.eruptionLikelihood

def VolcanicEruptionForecastClosed
    (V : VolcanicEruptionForecastPackage) : Prop :=
  V.magmaChamberPressure ∧ V.seismicSwarmActivity ∧ V.gasEmissionRate ∧
  V.groundDeformation ∧ V.eruptionLikelihood

theorem volcanic_eruption_forecast_closed_from_evidence
    (V : VolcanicEruptionForecastPackage)
    (E : VolcanicEruptionForecastEvidence V) :
    VolcanicEruptionForecastClosed V := by
  exact And.intro E.magmaChamberPressureClosed
    (And.intro E.seismicSwarmActivityClosed
      (And.intro E.gasEmissionRateClosed
        (And.intro E.groundDeformationClosed E.eruptionLikelihoodClosed)))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
