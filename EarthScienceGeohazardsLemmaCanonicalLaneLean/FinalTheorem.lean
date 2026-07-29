import EarthScienceGeohazardsLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

def ConstrainedEarthScienceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_earth_science_endgame (A : AdmissibleClass) :
    ConstrainedEarthScienceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse
