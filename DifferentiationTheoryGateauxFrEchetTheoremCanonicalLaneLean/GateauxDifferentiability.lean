import HautevilleHouse.DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean

structure GateauxDifferentiabilityPackage {X Y : DifferentiableSpace} (f : X.carrier → Y.carrier) where
  directionalDerivativeExists : ∀ (h : X.carrier), HasDerivAt (λ t : ℝ => f (t • h)) (h) 0
  linearInDirection : ∀ (h1 h2 : X.carrier), (directionalDerivativeExists h1) ∧ (directionalDerivativeExists h2) →
    ∃ (h : X.carrier), HasDerivAt (λ t : ℝ => f (t • (h1 + h2))) (h) 0
  continuousInDirection : ∀ (h : X.carrier), ContinuousAt (λ t : ℝ => f (t • h)) 0

structure GateauxDifferentiabilityEvidence {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (G : GateauxDifferentiabilityPackage f) where
  directionalDerivativeExistsClosed : G.directionalDerivativeExists
  linearInDirectionClosed : G.linearInDirection
  continuousInDirectionClosed : G.continuousInDirection

def GateauxDifferentiabilityClosed {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (G : GateauxDifferentiabilityPackage f) : Prop :=
  G.directionalDerivativeExists ∧ G.linearInDirection ∧ G.continuousInDirection

theorem gateaux_differentiability_closed_from_evidence
    {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (G : GateauxDifferentiabilityPackage f) (E : GateauxDifferentiabilityEvidence G) :
    GateauxDifferentiabilityClosed G := by
  exact And.intro E.directionalDerivativeExistsClosed
    (And.intro E.linearInDirectionClosed E.continuousInDirectionClosed)

end DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean
end HautevilleHouse