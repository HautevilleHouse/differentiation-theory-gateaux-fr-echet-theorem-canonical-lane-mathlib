import HautevilleHouse.DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean.ChainRule

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure MeanValueTheoremPackage {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace Y]
    {f : X → Y} {a b : X} (h : ∀ x ∈ segment ℝ a b, FrechetDifferentiableAt X Y f x) where
  inequality : ‖f b - f a‖ ≤ (⨆ x ∈ segment ℝ a b, ‖f.frechetDerivative x‖) * ‖b - a‖
  meanValueClosed : inequality

structure MeanValueInequalityEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace Y] 
    {f : X → Y} {a b : X} (M : MeanValueTheoremPackage (f := f) (a := a) (b := b)) where
  inequalityClosed : M.inequality

def MeanValueTheoremClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [CompleteSpace Y] 
    (f : X → Y) (a b : X) : Prop :=
  ‖f b - f a‖ ≤ (⨆ x ∈ segment ℝ a b, ‖(frechetDerivative f x)‖) * ‖b - a‖

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse