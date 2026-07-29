import HautevilleHouse.DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean.GateauxDifferentiability

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean

structure FrechetDifferentiabilityPackage {X Y : DifferentiableSpace} (f : X.carrier → Y.carrier) where
  linearApproximationExists : ∃ (L : X.carrier → Y.carrier), (LinearMap X.carrier Y.carrier L) ∧
    (∀ (h : X.carrier), f (x + h) - f x - L h = o(h))
  linearApproximationUnique : ∀ (L1 L2 : X.carrier → Y.carrier),
    (LinearMap X.carrier Y.carrier L1) → (LinearMap X.carrier Y.carrier L2) →
    (∀ h, f (x + h) - f x - L1 h = o(h)) → (∀ h, f (x + h) - f x - L2 h = o(h)) → L1 = L2

structure FrechetDifferentiabilityEvidence {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (F : FrechetDifferentiabilityPackage f) where
  linearApproximationExistsClosed : F.linearApproximationExists
  linearApproximationUniqueClosed : F.linearApproximationUnique

def FrechetDifferentiabilityClosed {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (F : FrechetDifferentiabilityPackage f) : Prop :=
  F.linearApproximationExists ∧ F.linearApproximationUnique

theorem frechet_differentiability_closed_from_evidence
    {X Y : DifferentiableSpace} {f : X.carrier → Y.carrier}
    (F : FrechetDifferentiabilityPackage f) (E : FrechetDifferentiabilityEvidence F) :
    FrechetDifferentiabilityClosed F := by
  exact And.intro E.linearApproximationExistsClosed E.linearApproximationUniqueClosed

end DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean
end HautevilleHouse