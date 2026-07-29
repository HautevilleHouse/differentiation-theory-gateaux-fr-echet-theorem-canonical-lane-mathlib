import HautevilleHouse.DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  GateauxWitnessClosed (A.object : GateauxAdmittedObject)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact (A.object : GateauxAdmittedObject).conclusion.right

end DifferentiationTheoryGateauxFrechetTheoremCanonicalLaneLean
end HautevilleHouse