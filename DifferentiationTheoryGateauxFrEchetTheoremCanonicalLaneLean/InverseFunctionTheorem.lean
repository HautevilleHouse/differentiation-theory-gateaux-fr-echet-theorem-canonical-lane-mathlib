import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

structure InverseFunctionTheoremPackage where
  derivativeInvertible : Prop
  localDiffeo : Prop
  inverseDiff : Prop
  derivativeInvertibleTerm : derivativeInvertible
  localDiffeoTerm : localDiffeo
  inverseDiffTerm : inverseDiff

structure InverseFunctionTheoremEvidence (I : InverseFunctionTheoremPackage) where
  localDiffeoClosed : I.localDiffeo
  inverseDiffClosed : I.inverseDiff

def InverseFunctionTheoremClosed (I : InverseFunctionTheoremPackage) : Prop :=
  I.localDiffeo ∧ I.inverseDiff

theorem inverse_function_theorem_closed_from_evidence (I : InverseFunctionTheoremPackage)
    (E : InverseFunctionTheoremEvidence I) : InverseFunctionTheoremClosed I := by
  exact And.intro E.localDiffeoClosed E.inverseDiffClosed

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse
