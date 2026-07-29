import HautevilleHouse.DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean.MeanValueTheorem

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure ImplicitFunctionTheoremPackage {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
    [CompleteSpace X] [CompleteSpace Y] {f : X × Y → Z} {a : X} {b : Y} (hf : FrechetDifferentiableAt (X × Y) Z f (a, b)) 
    (hfy : IsBoundedLinearMap (λ y : Y => f.frechetDerivative (a, b) (0, y))) (hsurj : ∀ z : Z, ∃ y : Y, f.frechetDerivative (a, b) (0, y) = z) where
  neighborhoodU : Set X
  neighborhoodV : Set Y
  implicitMap : X → Y
  implicitMapDifferentiable : ∀ x ∈ neighborhoodU, FrechetDifferentiableAt X Y implicitMap x
  implicitEquation : ∀ x ∈ neighborhoodU, f (x, implicitMap x) = f (a, b)
  implicitTheoremClosed : neighborhoodU ≠ ∅ ∧ neighborhoodV ≠ ∅ ∧ implicitMapDifferentiable ∧ implicitEquation

def ImplicitFunctionTheoremClosed {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
    [CompleteSpace X] [CompleteSpace Y] (f : X × Y → Z) (a : X) (b : Y) : Prop := False

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse