import EarthScienceGeohazardsLemmaCanonicalLaneLean.ProbabilisticSeismicHazard

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure EarthScienceAnalyticFoundation where
  seismicWave : SeismicWavePropagationPackage
  seismicWaveEvidence : SeismicWavePropagationEvidence seismicWave
  faultGeometry : FaultGeometryPackage seismicWave
  faultGeometryEvidence : FaultGeometryEvidence faultGeometry
  groundMotion : GroundMotionPredictionPackage faultGeometry
  groundMotionEvidence : GroundMotionPredictionEvidence groundMotion
  hazardCurve : HazardCurvePackage groundMotion
  hazardCurveEvidence : HazardCurveEvidence hazardCurve
  siteResponse : SiteResponsePackage hazardCurve
  siteResponseEvidence : SiteResponseEvidence siteResponse
  probabilisticSeismicHazard : ProbabilisticSeismicHazardPackage siteResponse
  probabilisticSeismicHazardEvidence : ProbabilisticSeismicHazardEvidence probabilisticSeismicHazard

def EarthScienceAnalyticFoundationClosed (A : EarthScienceAnalyticFoundation) : Prop :=
  SeismicWavePropagationClosed A.seismicWave ∧
  FaultGeometryClosed A.faultGeometry ∧
  GroundMotionPredictionClosed A.groundMotion ∧
  HazardCurveClosed A.hazardCurve ∧
  SiteResponseClosed A.siteResponse ∧
  ProbabilisticSeismicHazardClosed A.probabilisticSeismicHazard

theorem earth_science_analytic_foundation_closed_from_evidence
    (A : EarthScienceAnalyticFoundation) :
    EarthScienceAnalyticFoundationClosed A := by
  exact And.intro (seismic_wave_propagation_closed_from_evidence A.seismicWave A.seismicWaveEvidence)
    (And.intro (fault_geometry_closed_from_evidence A.faultGeometry A.faultGeometryEvidence)
      (And.intro (ground_motion_prediction_closed_from_evidence A.groundMotion A.groundMotionEvidence)
        (And.intro (hazard_curve_closed_from_evidence A.hazardCurve A.hazardCurveEvidence)
          (And.intro (site_response_closed_from_evidence A.siteResponse A.siteResponseEvidence)
            (probabilistic_seismic_hazard_closed_from_evidence A.probabilisticSeismicHazard A.probabilisticSeismicHazardEvidence)))))

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
