import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeohazardsLemmaCanonicalLaneLean

structure GeohazardModel where
  ruptureSource : Type u
  propagationPath : Type v
  slipDistribution : ruputureSource → propagationPath → ℝ
  stressDrop : ℝ
  magnitudeUpperBound : ℕ
  magnitudeUpperBoundPositive : magnitudeUpperBound > 0

structure GeohazardModelEvidence (G : GeohazardModel) where
  slipDistributionBounded : ∀ r : G.ruptureSource, ∀ p : G.propagationPath, |G.slipDistribution r p| ≤ G.magnitudeUpperBound
  stressDropPositive : G.stressDrop > 0

end EarthScienceGeohazardsLemmaCanonicalLaneLean
end HautevilleHouse