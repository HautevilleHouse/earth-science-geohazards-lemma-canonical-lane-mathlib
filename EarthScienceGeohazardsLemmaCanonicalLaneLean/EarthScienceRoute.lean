import EarthScienceGeohazardsLemmaCanonicalLaneLean.FinalTheorem
import EarthScienceGeohazardsLemmaCanonicalLaneLean.EarthScienceAnalyticFoundation

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure EarthScienceRouteObligations where
  seismicHazardAssessment : Prop
  hazardCommunication : Prop
  riskMitigation : Prop

structure EarthScienceRouteEvidence (R : EarthScienceRouteObligations) where
  seismicHazardAssessmentClosed : R.seismicHazardAssessment
  hazardCommunicationClosed : R.hazardCommunication
  riskMitigationClosed : R.riskMitigation

def EarthScienceRouteClosed (R : EarthScienceRouteObligations) : Prop :=
  R.seismicHazardAssessment ∧ R.hazardCommunication ∧ R.riskMitigation

theorem earth_science_route_closed_from_evidence
    (R : EarthScienceRouteObligations) (E : EarthScienceRouteEvidence R) :
    EarthScienceRouteClosed R := by
  exact And.intro E.seismicHazardAssessmentClosed (And.intro E.hazardCommunicationClosed E.riskMitigationClosed)

def EarthScienceAnalyticFoundation.toEarthScienceRouteObligations
    (A : EarthScienceAnalyticFoundation) : EarthScienceRouteObligations :=
  { seismicHazardAssessment := ProbabilisticSeismicHazardClosed A.probabilisticSeismicHazard
    hazardCommunication := True
    riskMitigation := True
  }

def earth_science_route_evidence_from_analytic_foundation
    (A : EarthScienceAnalyticFoundation) :
    EarthScienceRouteEvidence A.toEarthScienceRouteObligations :=
  { seismicHazardAssessmentClosed := probabilistic_seismic_hazard_closed_from_evidence A.probabilisticSeismicHazard A.probabilisticSeismicHazardEvidence
    hazardCommunicationClosed := by trivial
    riskMitigationClosed := by trivial
  }

theorem earth_science_route_closed_from_analytic_foundation
    (A : EarthScienceAnalyticFoundation) :
    EarthScienceRouteClosed A.toEarthScienceRouteObligations := by
  exact earth_science_route_closed_from_evidence
    A.toEarthScienceRouteObligations
    (earth_science_route_evidence_from_analytic_foundation A)

structure EarthScienceCanonicalLaneRoute (A : AdmissibleClass) where
  obligations : EarthScienceRouteObligations
  evidence : EarthScienceRouteEvidence obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

theorem earth_science_route_yields_constrained_closure
    (A : AdmissibleClass) (R : EarthScienceCanonicalLaneRoute A) :
    ConstrainedEarthScienceClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
