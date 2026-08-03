import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean

/-! # Admissibility for the Absolutely Continuous Real Functions One Theorem

This module encodes the admissible-class bridge for the fundamental theorem
of calculus for absolutely continuous real functions. The structure
`AdmissibleClass` mirrors the Poincaré precedent and provides the epistemic
closure pattern for the one theorem: a real function is absolutely continuous
if and only if it is an indefinite integral of its derivative. -/

/-- The object of study: a real function on a compact interval together with
the properties involved in the one theorem. -/
structure ACAbsolutelyContinuousFunction where
  lower : ℝ
  upper : ℝ
  toFun : ℝ → ℝ
  /-- The defining property: absolute continuity on `[lower, upper]`. -/
  absolutelyContinuous : Prop
  /-- The intermediate property: the derivative exists almost everywhere. -/
  derivativeAlmostEverywhere : Prop
  /-- The recovery property: the function is recovered by integrating its derivative. -/
  integralRepresentation : Prop
  /-- The one theorem: absolute continuity is equivalent to the conjunction of
  the derivative and integral representation properties. -/
  oneTheorem :
    absolutelyContinuous ↔ derivativeAlmostEverywhere ∧ integralRepresentation

/-- A pinned admitted object: an AC function for which the one theorem is
postulated/established. -/
structure ACAdmittedObject where
  function : ACAbsolutelyContinuousFunction
  witness : function.oneTheorem

/-- The bridge-closure predicate for the AC one theorem. A witness is closed
when the one theorem is settled (in the forward direction at least). -/
def ACWitnessClosed (A : ACAdmittedObject) : Prop :=
  A.function.absolutelyContinuous → A.function.integralRepresentation

/-- The admissible constraint for the AC one theorem, following the
Poincaré precondition. `endpointSatisfied` records that the forward
direction of the one theorem has been attained; `remainderRecorded`
records that the converse (recovery) is in place. -/
structure AdmissibleClass where
  object : ACAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

/-- The closure of an admissible class: the AC witness is closed and the
gate criterion is satisfied. -/
def admittedClosure (A : AdmissibleClass) : Prop :=
  ACWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

/-- Bridge-closed component of the closure. -/
def bridgeClosed (A : AdmissibleClass) : Prop :=
  ACWitnessClosed A.object

/-- Gate-closed component of the closure. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

/-- The closure is exactly the conjunction of bridge-closed and gate-closed. -/
theorem admittedClosure_iff (A : AdmissibleClass) :
    admittedClosure A ↔ bridgeClosed A ∧ gateClosed A := by
  rfl

end AbsolutelyContinuousRealFunctionsOneTheoremCanonicalLaneLean
end HautevilleHouse