import canonicalLaneMathlib.AdmissibleClass
import .FrechetDerivativePackage
import .GateauxDerivativePackage

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean

theorem frechet_implies_gateaux {D : Type u} {C : Type v}
    [SeminormedAddCommGroup D] [SeminormedAddCommGroup C]
    (f : D → C) (x : D) (L : D →L[ℝ] C) (hFrechet : FrechetDerivativeAt f x L) :
    GateauxDerivativeAt f x (fun h => L h) := by
  -- The Frechet derivative implies Gateaux differentiability with same linear map
  intro h
  have := hFrechet.tendsto_sup_norm h
  refine (hasDerivAtFilter_iff_tendsto_slope ?_).mpr ?_
  exact isLittleO_iff_tendsto_sup_norm.mpr this

end DifferentiationTheoryGateauxFrEchetTheoremCanonicalLaneLean
end HautevilleHouse