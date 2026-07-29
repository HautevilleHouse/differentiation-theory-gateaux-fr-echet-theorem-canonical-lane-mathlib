import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure GateauxDerivativePackage (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W] where
  f : V → W
  x : V
  directionalDerivative : V → W
  linearInDirection : Prop
  existsLimit : Prop

structure GateauxDerivativeEvidence {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (G : GateauxDerivativePackage V W) where
  linearInDirectionClosed : G.linearInDirection
  existsLimitClosed : G.existsLimit

def GateauxDerivativeClosed {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (G : GateauxDerivativePackage V W) : Prop :=
  G.linearInDirection ∧ G.existsLimit

theorem gateaux_derivative_closed_from_evidence
    {V W : Type} [NormedAddCommGroup V] [NormedAddCommGroup W]
    (G : GateauxDerivativePackage V W) (E : GateauxDerivativeEvidence G) :
    GateauxDerivativeClosed G := by
  exact And.intro E.linearInDirectionClosed E.existsLimitClosed

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
