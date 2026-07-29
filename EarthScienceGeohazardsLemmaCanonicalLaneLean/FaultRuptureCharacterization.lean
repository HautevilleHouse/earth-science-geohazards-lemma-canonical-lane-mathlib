import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure FaultRupturePackage where
  faultGeometry : Type
  slipDistribution : Type
  ruptureScenario : Prop
  stressTransfer : Prop
  recurrenceInterval : Prop
  ruptureScenarioClosed : ruptureScenario
  stressTransferClosed : stressTransfer
  recurrenceIntervalClosed : recurrenceInterval

structure FaultRuptureEvidence (F : FaultRupturePackage) where
  ruptureScenarioClosed : F.ruptureScenario
  stressTransferClosed : F.stressTransfer
  recurrenceIntervalClosed : F.recurrenceInterval

def FaultRuptureClosed (F : FaultRupturePackage) : Prop :=
  F.ruptureScenario ∧ F.stressTransfer ∧ F.recurrenceInterval

theorem fault_rupture_closed_from_evidence (F : FaultRupturePackage)
    (E : FaultRuptureEvidence F) : FaultRuptureClosed F := by
  exact And.intro E.ruptureScenarioClosed
    (And.intro E.stressTransferClosed E.recurrenceIntervalClosed)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse