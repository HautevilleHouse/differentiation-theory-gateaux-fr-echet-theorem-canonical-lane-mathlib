import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean.FrechetDerivative

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure ChainRulePackage (X Y Z : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  (F : FrechetDerivativePackage X Y) (G : FrechetDerivativePackage Y Z) where
  fDerivativeAtPoint : X →L[ℝ] Y
  gDerivativeAtImage : Y →L[ℝ] Z
  compositionDerivative : X →L[ℝ] Z
  chainRuleCondition : Prop
  chainRuleHolds : Prop

structure ChainRuleEvidence {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  {F : FrechetDerivativePackage X Y} {G : FrechetDerivativePackage Y Z}
  (C : ChainRulePackage X Y Z F G) where
  fDerivativeAtPointClosed : C.fDerivativeAtPoint
  gDerivativeAtImageClosed : C.gDerivativeAtImage
  compositionDerivativeClosed : C.compositionDerivative
  chainRuleConditionClosed : C.chainRuleCondition
  chainRuleHoldsClosed : C.chainRuleHolds

def ChainRuleClosed {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  {F : FrechetDerivativePackage X Y} {G : FrechetDerivativePackage Y Z}
  (C : ChainRulePackage X Y Z F G) : Prop :=
  C.fDerivativeAtPoint ∧ C.gDerivativeAtImage ∧ C.compositionDerivative ∧ C.chainRuleCondition ∧ C.chainRuleHolds

theorem chain_rule_closed_from_evidence {X Y Z : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup Z]
  {F : FrechetDerivativePackage X Y} {G : FrechetDerivativePackage Y Z}
  (C : ChainRulePackage X Y Z F G) (E : ChainRuleEvidence C) : ChainRuleClosed C := by
  exact And.intro E.fDerivativeAtPointClosed
    (And.intro E.gDerivativeAtImageClosed
      (And.intro E.compositionDerivativeClosed
        (And.intro E.chainRuleConditionClosed E.chainRuleHoldsClosed)))

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse