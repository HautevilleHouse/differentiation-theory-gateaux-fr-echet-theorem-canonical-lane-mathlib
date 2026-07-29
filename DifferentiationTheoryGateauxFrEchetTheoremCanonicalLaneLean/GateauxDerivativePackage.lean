import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure GateauxDerivativePackage where
  domain : Type u
  codomain : Type v
  normedDomain : SeminormedAddCommGroup domain
  normedCodomain : SeminormedAddCommGroup codomain
  f : domain → codomain
  directionalDerivative : domain → domain → codomain
  gateauxProperty : Prop
  homogeneity : Prop
  additivity : Prop

def GateauxDerivativeClosed (P : GateauxDerivativePackage) : Prop :=
  P.gateauxProperty ∧ P.homogeneity ∧ P.additivity

structure GateauxDerivativeEvidence (P : GateauxDerivativePackage) where
  gateauxPropertyClosed : P.gateauxProperty
  homogeneityClosed : P.homogeneity
  additivityClosed : P.additivity

theorem gateaux_derivative_closed_from_evidence (P : GateauxDerivativePackage)
    (E : GateauxDerivativeEvidence P) : GateauxDerivativeClosed P := by
  exact And.intro E.gateauxPropertyClosed (And.intro E.homogeneityClosed E.additivityClosed)

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse