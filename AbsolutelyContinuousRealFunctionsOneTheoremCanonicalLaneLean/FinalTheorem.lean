import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean

/-- The admissible-class bridge for the fundamental theorem of calculus for
absolutely continuous functions. The closure asserts that both the bridge
to the theorem and the gate from the theorem are epistemologically closed. -/
def ConstrainedAbsoluteContinuityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_absolute_continuity_endgame (A : AdmissibleClass) :
    ConstrainedAbsoluteContinuityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean
end HautevilleHouse