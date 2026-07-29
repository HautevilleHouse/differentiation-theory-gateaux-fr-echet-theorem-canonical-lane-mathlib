import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure FrechetDerivativePackage where
  domain : Type u
  codomain : Type v
  normedDomain : SeminormedAddCommGroup domain
  normedCodomain : SeminormedAddCommGroup codomain
  f : domain → codomain
  derivativeAtPoint : domain → (domain →L[ℝ] codomain)
  frechetProperty : Prop
  linearity : Prop
  boundedness : Prop

def FrechetDerivativeClosed (P : FrechetDerivativePackage) : Prop :=
  P.frechetProperty ∧ P.linearity ∧ P.boundedness

structure FrechetDerivativeEvidence (P : FrechetDerivativePackage) where
  frechetPropertyClosed : P.frechetProperty
  linearityClosed : P.linearity
  boundednessClosed : P.boundedness

theorem frechet_derivative_closed_from_evidence (P : FrechetDerivativePackage)
    (E : FrechetDerivativeEvidence P) : FrechetDerivativeClosed P := by
  exact And.intro E.frechetPropertyClosed (And.intro E.linearityClosed E.boundednessClosed)

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse