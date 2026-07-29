import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure GateauxDerivativePackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  domainOpen : Set X
  point : X
  linearMap : X →L[ℝ] Y
  directionalLimit : (X → Y) → Prop
  limitCondition : Prop
  derivativeDefined : Prop

structure GateauxDerivativeEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) where
  domainOpenClosed : G.domainOpen
  linearMapClosed : G.linearMap
  directionalLimitClosed : G.directionalLimit
  limitConditionClosed : G.limitCondition
  derivativeDefinedClosed : G.derivativeDefined

def GateauxDerivativeClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) : Prop :=
  G.domainOpen ∧ G.linearMap ∧ G.directionalLimit ∧ G.limitCondition ∧ G.derivativeDefined

theorem gateaux_derivative_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) (E : GateauxDerivativeEvidence G) : GateauxDerivativeClosed G := by
  exact And.intro E.domainOpenClosed
    (And.intro E.linearMapClosed
      (And.intro E.directionalLimitClosed
        (And.intro E.limitConditionClosed E.derivativeDefinedClosed)))

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse