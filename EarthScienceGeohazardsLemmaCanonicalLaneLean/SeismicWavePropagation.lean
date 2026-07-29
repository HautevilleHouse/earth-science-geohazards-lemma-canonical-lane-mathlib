import EarthScienceGeohazardsLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure SeismicWavePropagationPackage where
  mediumContinuum : Type u
  elasticParameters : Type v
  waveEquation : Prop
  pWaveVelocity : Prop
  sWaveVelocity : Prop
  attenuationModel : Prop

structure SeismicWavePropagationEvidence (P : SeismicWavePropagationPackage) where
  waveEquationClosed : P.waveEquation
  pWaveVelocityClosed : P.pWaveVelocity
  sWaveVelocityClosed : P.sWaveVelocity
  attenuationModelClosed : P.attenuationModel

def SeismicWavePropagationClosed (P : SeismicWavePropagationPackage) : Prop :=
  P.waveEquation ∧ P.pWaveVelocity ∧ P.sWaveVelocity ∧ P.attenuationModel

theorem seismic_wave_propagation_closed_from_evidence
    (P : SeismicWavePropagationPackage) (E : SeismicWavePropagationEvidence P) :
    SeismicWavePropagationClosed P := by
  exact And.intro E.waveEquationClosed (And.intro E.pWaveVelocityClosed (And.intro E.sWaveVelocityClosed E.attenuationModelClosed))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
