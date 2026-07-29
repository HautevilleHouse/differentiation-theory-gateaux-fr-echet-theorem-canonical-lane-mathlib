import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure HigherOrderDerivativePackage where
  order : Nat
  multilinearMap : Type u
  symmetric : Prop
  taylorExpansion : Prop
  symmetricTerm : symmetric
  taylorExpansionTerm : taylorExpansion

structure HigherOrderDerivativeEvidence (H : HigherOrderDerivativePackage) where
  symmetricClosed : H.symmetric
  taylorExpansionClosed : H.taylorExpansion

def HigherOrderDerivativeClosed (H : HigherOrderDerivativePackage) : Prop :=
  H.symmetric ∧ H.taylorExpansion

theorem higher_order_derivative_closed_from_evidence (H : HigherOrderDerivativePackage)
    (E : HigherOrderDerivativeEvidence H) : HigherOrderDerivativeClosed H := by
  exact And.intro E.symmetricClosed E.taylorExpansionClosed

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
