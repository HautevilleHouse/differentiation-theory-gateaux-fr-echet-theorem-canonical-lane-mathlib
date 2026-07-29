import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean.GateauxDerivative
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean.FrechetDerivative

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure EquivalencePackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y]
  (G : GateauxDerivativePackage X Y) (F : FrechetDerivativePackage X Y) where
  gateauxDerivativeDefined : Prop
  frechetDerivativeDefined : Prop
  equivalenceCondition : Prop
  equivalenceHolds : Prop

structure EquivalenceEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  {G : GateauxDerivativePackage X Y} {F : FrechetDerivativePackage X Y}
  (E : EquivalencePackage X Y G F) where
  gateauxDerivativeDefinedClosed : E.gateauxDerivativeDefined
  frechetDerivativeDefinedClosed : E.frechetDerivativeDefined
  equivalenceConditionClosed : E.equivalenceCondition
  equivalenceHoldsClosed : E.equivalenceHolds

def EquivalenceClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  {G : GateauxDerivativePackage X Y} {F : FrechetDerivativePackage X Y}
  (E : EquivalencePackage X Y G F) : Prop :=
  E.gateauxDerivativeDefined ∧ E.frechetDerivativeDefined ∧ E.equivalenceCondition ∧ E.equivalenceHolds

theorem equivalence_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y]
  {G : GateauxDerivativePackage X Y} {F : FrechetDerivativePackage X Y}
  (E : EquivalencePackage X Y G F) (Ev : EquivalenceEvidence E) : EquivalenceClosed E := by
  exact And.intro Ev.gateauxDerivativeDefinedClosed
    (And.intro Ev.frechetDerivativeDefinedClosed
      (And.intro Ev.equivalenceConditionClosed Ev.equivalenceHoldsClosed))

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse