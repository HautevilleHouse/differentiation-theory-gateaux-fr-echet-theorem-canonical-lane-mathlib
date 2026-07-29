import DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean

structure GateauxFrechetSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GateauxFrechetAdmittedObject where
  space : GateauxFrechetSpace
  linearMapDefined : Prop
  boundednessCondition : Prop
  limitExists : Prop
  conclusion : limitExists

def GateauxFrechetWitnessClosed (O : GateauxFrechetAdmittedObject) : Prop :=
  O.limitExists

end DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean
end HautevilleHouse