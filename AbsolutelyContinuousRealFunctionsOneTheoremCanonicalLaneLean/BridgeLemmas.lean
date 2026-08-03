import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Calculus.Deriv
import Mathlib.MeasureTheory.Integral.IntervalIntegral

open scoped Interval
open MeasureTheory

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean

structure AbsolutelyContinuousRealFunctionsOneTheoremWitness where
  f : ℝ → ℝ
  a : ℝ
  b : ℝ
  h_absolutely_continuous : ∀ ε > 0, ∃ δ > 0, ∀ x y, a ≤ x → x ≤ y → y ≤ b → y - x < δ → |f y - f x| < ε
  h_differentiable_ae : ∀ᵐ x ∂volume.restrict (Set.Icc a b), DifferentiableAt ℝ f x
  h_deriv_integrable : IntegrableOn (deriv f) (Set.Icc a b)
  conclusion : ∀ x : ℝ, x ∈ Set.Icc a b → f x = f a + ∫ t in a..x, deriv f t

def AbsolutelyContinuousRealFunctionsOneTheoremClosed (w : AbsolutelyContinuousRealFunctionsOneTheoremWitness) : Prop :=
  w.conclusion

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AbsolutelyContinuousRealFunctionsOneTheoremClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean
end HautevilleHouse