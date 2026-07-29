import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure TsunamiPropagationPackage where
  sourceMechanism : Prop
  waveDispersion : Prop
  coastalAmplification : Prop
  runupHeight : Prop
  arrivalTime : Prop

structure TsunamiPropagationEvidence
    (T : TsunamiPropagationPackage) where
  sourceMechanismClosed : T.sourceMechanism
  waveDispersionClosed : T.waveDispersion
  coastalAmplificationClosed : T.coastalAmplification
  runupHeightClosed : T.runupHeight
  arrivalTimeClosed : T.arrivalTime

def TsunamiPropagationClosed (T : TsunamiPropagationPackage) : Prop :=
  T.sourceMechanism ∧ T.waveDispersion ∧ T.coastalAmplification ∧
  T.runupHeight ∧ T.arrivalTime

theorem tsunami_propagation_closed_from_evidence
    (T : TsunamiPropagationPackage)
    (E : TsunamiPropagationEvidence T) : TsunamiPropagationClosed T := by
  exact And.intro E.sourceMechanismClosed
    (And.intro E.waveDispersionClosed
      (And.intro E.coastalAmplificationClosed
        (And.intro E.runupHeightClosed E.arrivalTimeClosed)))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
