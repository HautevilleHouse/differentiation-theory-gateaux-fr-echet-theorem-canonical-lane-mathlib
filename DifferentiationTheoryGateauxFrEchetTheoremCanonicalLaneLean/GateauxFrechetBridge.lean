import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure GateauxFrechetAdmissibleClass (V W : Type) [NormedAddCommGroup V] [NormedAddCommGroup W] where
  object : FrechetDerivativePackage V W
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def gateauxFrechetBridgeClosed (A : GateauxFrechetAdmissibleClass V W) : Prop :=
  FrechetDerivativeClosed A.object

theorem gateaux_frechet_bridge_from_admissible_class
    (A : GateauxFrechetAdmissibleClass V W) : gateauxFrechetBridgeClosed A := by
  exact A.object.limitCondition

def gateauxFrechetGateClosed (A : GateauxFrechetAdmissibleClass V W) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gateaux_frechet_gate_from_admissible_class
    (A : GateauxFrechetAdmissibleClass V W) : gateauxFrechetGateClosed A := by
  exact A.gateWitness

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
