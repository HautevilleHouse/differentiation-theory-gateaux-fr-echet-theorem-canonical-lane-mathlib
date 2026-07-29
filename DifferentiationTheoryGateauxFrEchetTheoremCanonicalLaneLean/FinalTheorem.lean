import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

def ConstrainedGateauxFrechetClosure (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W]
    (A : GateauxFrechetAdmissibleClass V W) : Prop :=
  gateauxFrechetBridgeClosed A ∧ gateauxFrechetGateClosed A

theorem constrained_gateaux_frechet_endgame
    (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W]
    (A : GateauxFrechetAdmissibleClass V W) : ConstrainedGateauxFrechetClosure V W A := by
  exact And.intro (gateaux_frechet_bridge_from_admissible_class A) (gateaux_frechet_gate_from_admissible_class A)

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
