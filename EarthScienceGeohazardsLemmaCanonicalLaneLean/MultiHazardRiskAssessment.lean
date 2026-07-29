import canonicalLaneMathlib.AdmissibleClass
import EarthScienceGeohazardsLemmaCanonicalLaneLean.SeismicHazardModel
import EarthScienceGeohazardsLemmaCanonicalLaneLean.FaultRuptureCharacterization
import EarthScienceGeohazardsLemmaCanonicalLaneLean.TsunamiPropagationModel
import EarthScienceGeohazardsLemmaCanonicalLaneLean.LandslideSusceptibilityAnalysis
import EarthScienceGeohazardsLemmaCanonicalLaneLean.VolcanicAshDispersionModel

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure MultiHazardRiskPackage where
  seismicModel : SeismicHazardModel
  faultModel : FaultRupturePackage
  tsunamiModel : TsunamiPropagationModel
  landslideModel : LandslideSusceptibilityPackage
  volcanicModel : VolcanicAshDispersionPackage
  vulnerabilityCurves : Prop
  exposureData : Prop
  riskIntegration : Prop
  vulnerabilityCurvesClosed : vulnerabilityCurves
  exposureDataClosed : exposureData
  riskIntegrationClosed : riskIntegration

structure MultiHazardRiskEvidence (M : MultiHazardRiskPackage) where
  seismicEvidence : SeismicHazardEvidence M.seismicModel
  faultEvidence : FaultRuptureEvidence M.faultModel
  tsunamiEvidence : TsunamiPropagationEvidence M.tsunamiModel
  landslideEvidence : LandslideSusceptibilityEvidence M.landslideModel
  volcanicEvidence : VolcanicAshDispersionEvidence M.volcanicModel
  vulnerabilityCurvesClosed : M.vulnerabilityCurves
  exposureDataClosed : M.exposureData
  riskIntegrationClosed : M.riskIntegration

def MultiHazardRiskPackageClosed (M : MultiHazardRiskPackage) : Prop :=
  SeismicHazardModelClosed M.seismicModel ∧
  FaultRuptureClosed M.faultModel ∧
  TsunamiPropagationClosed M.tsunamiModel ∧
  LandslideSusceptibilityClosed M.landslideModel ∧
  VolcanicAshDispersionClosed M.volcanicModel ∧
  M.vulnerabilityCurves ∧ M.exposureData ∧ M.riskIntegration

theorem multi_hazard_risk_closed_from_evidence (M : MultiHazardRiskPackage)
    (E : MultiHazardRiskEvidence M) : MultiHazardRiskPackageClosed M := by
  refine And.intro (seismic_hazard_model_closed_from_evidence M.seismicModel E.seismicEvidence)
    (And.intro (fault_rupture_closed_from_evidence M.faultModel E.faultEvidence)
      (And.intro (tsunami_propagation_closed_from_evidence M.tsunamiModel E.tsunamiEvidence)
        (And.intro (landslide_susceptibility_closed_from_evidence M.landslideModel E.landslideEvidence)
          (And.intro (volcanic_ash_dispersion_closed_from_evidence M.volcanicModel E.volcanicEvidence)
            (And.intro E.vulnerabilityCurvesClosed
              (And.intro E.exposureDataClosed E.riskIntegrationClosed))))))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse