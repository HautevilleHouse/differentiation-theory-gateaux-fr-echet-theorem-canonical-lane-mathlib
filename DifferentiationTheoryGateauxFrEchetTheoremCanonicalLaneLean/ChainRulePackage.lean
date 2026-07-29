import canonicalLaneMathlib.AdmissibleClass
import .FrechetDerivativePackage
import .GateauxDerivativePackage

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure ChainRulePackage where
  domain : Type u
  intermediate : Type v
  codomain : Type w
  normedDomain : SeminormedAddCommGroup domain
  normedIntermediate : SeminormedAddCommGroup intermediate
  normedCodomain : SeminormedAddCommGroup codomain
  f : domain → intermediate
  g : intermediate → codomain
  x : domain
  fDeriv : domain →L[ℝ] intermediate
  gDeriv : intermediate →L[ℝ] codomain
  chainRuleProperty : Prop
  composition : Prop
  continuity : Prop

def ChainRuleClosed (P : ChainRulePackage) : Prop :=
  P.chainRuleProperty ∧ P.composition ∧ P.continuity

structure ChainRuleEvidence (P : ChainRulePackage) where
  chainRulePropertyClosed : P.chainRuleProperty
  compositionClosed : P.composition
  continuityClosed : P.continuity

theorem chain_rule_closed_from_evidence (P : ChainRulePackage)
    (E : ChainRuleEvidence P) : ChainRuleClosed P := by
  exact And.intro E.chainRulePropertyClosed (And.intro E.compositionClosed E.continuityClosed)

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse