import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure TsunamiPropagationModel where
  bathymetry : Type
  dispersionRelation : Type
  initialWaveField : Prop
  shallowWaterEquations : Prop
  inundationMapping : Prop
  initialWaveFieldClosed : initialWaveField
  shallowWaterEquationsClosed : shallowWaterEquations
  inundationMappingClosed : inundationMapping

structure TsunamiPropagationEvidence (T : TsunamiPropagationModel) where
  initialWaveFieldClosed : T.initialWaveField
  shallowWaterEquationsClosed : T.shallowWaterEquations
  inundationMappingClosed : T.inundationMapping

def TsunamiPropagationClosed (T : TsunamiPropagationModel) : Prop :=
  T.initialWaveField ∧ T.shallowWaterEquations ∧ T.inundationMapping

theorem tsunami_propagation_closed_from_evidence (T : TsunamiPropagationModel)
    (E : TsunamiPropagationEvidence T) : TsunamiPropagationClosed T := by
  exact And.intro E.initialWaveFieldClosed
    (And.intro E.shallowWaterEquationsClosed E.inundationMappingClosed)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse