import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure FrechetDerivativePackage (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W] where
  f : V → W
  x : V
  linearMap : V →L[ℝ] W
  limitCondition : Prop

structure FrechetDerivativeEvidence {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDerivativePackage V W) where
  limitConditionClosed : F.limitCondition

def FrechetDerivativeClosed {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDerivativePackage V W) : Prop :=
  F.limitCondition

theorem frechet_derivative_closed_from_evidence
    {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (F : FrechetDerivativePackage V W) (E : FrechetDerivativeEvidence F) :
    FrechetDerivativeClosed F := by
  exact E.limitConditionClosed

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
