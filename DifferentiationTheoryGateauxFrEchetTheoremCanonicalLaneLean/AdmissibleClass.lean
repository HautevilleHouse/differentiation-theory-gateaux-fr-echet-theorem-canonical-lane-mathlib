import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : DifferentiationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DifferentiationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse