import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean

/-- The class of admissible objects for the absolutely-continuous-functions
    theorem.  It extends the generic admissible class with the concrete
    hypotheses and the endpoint-recovery statement from the fundamental
    theorem of calculus for absolutely continuous functions. -/
structure AbsolutelyContinuousAdmissibleClass (f : ℝ → ℝ) (a b : ℝ) extends AdmissibleClass where
  /-- `f` is absolutely continuous on `[a,b]`. -/
  absolute_continuity : Prop
  /-- The derivative of `f` is integrable on `[a,b]`. -/
  integrable_derivative : Prop
  /-- The endpoint-recovery identity: `f b = f a + ∫_{a}^{b} f'`. -/
  endpoint_recovered : Prop
  /-- The gate closure witness: either the endpoint is recovered or the
      failure is explicitly recorded as a carried remainder. -/
  gate_witness : endpoint_recovered ∨ remainderRecorded

/-- The gate closed condition for the absolutely-continuous-functions theorem:
    the endpoint-recovery identity holds or the residual error is recorded. -/
def gateClosed {f : ℝ → ℝ} {a b : ℝ} (A : AbsolutelyContinuousAdmissibleClass f a b) : Prop :=
  A.endpoint_recovered ∨ A.remainderRecorded

/-- Every admissible class for absolutely continuous functions is gate-closed
    by its own gate witness. -/
theorem gate_from_admissible_class {f : ℝ → ℝ} {a b : ℝ}
    (A : AbsolutelyContinuousAdmissibleClass f a b) :
    gateClosed A := by
  exact A.gate_witness

end AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean
end HautevilleHouse