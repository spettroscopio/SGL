DeclareModule vec2

EnableExplicit

Structure vec2 
 float.f[0]
 x.f
 y.f
EndStructure

Declare     Set (*Vector.vec2, x.f, y.f) ; Set the x, y components of Vector.
Declare     Dump (*Vector.vec2, decimals = 2) ; Returns a string representation of Vector.
Declare     Zero (*Vector.vec2) ; Set Vector to (0.0, 0.0)
Declare.i   IsZero (*Vector.vec2) ; Returns 1 if Vector is (0.0, 0.0), else 0.
Declare     SetFromPoints (*Vector.vec2, *PointA.vec2, *PointB.vec2) ; Sets Vector to the vector going from PointA to PointB.
Declare     Copy (*Vector.vec2, *DestinationVector.vec2) ; Copies Vector to DestinationVector.
Declare     Add (*VectorA.vec2, *VectorB.vec2, *SumVector.vec2) ; Add VectorA to VectorB and store the result in SumVector.
Declare     Sub (*VectorA.vec2, *VectorB.vec2, *DiffVector.vec2) ; Subtract VectorB from VectorA and store the result in DiffVector.
Declare.f   Length (*Vector.vec2) ; Returns the length of Vector.
Declare.f   LengthSquared (*Vector.vec2) ; Returns the squared length of Vector.
Declare.f   Distance (*PointA.vec2, *PointB.vec2) ; Returns the distance between PointA and PointB.
Declare     Negate (*Vector.vec2, *NegatedVector.vec2) ; Sets NegatedVector to the opposite version of Vector.
Declare     Normalize (*Vector.vec2, *UnitVector.vec2) ; Sets UnitVector to the normalized version of Vector.
Declare     Scale (*Vector.vec2, scalar.f, *ScaledVector.vec2) ; Sets ScaledVector to the scaled version of Vector.
Declare.f   DotProduct (*VectorA.vec2, *VectorB.vec2) ; Returns the dot product of the two vectors.
Declare.f   Angle (*VectorA.vec2, *VectorB.vec2) ; Returns the angle formed by the two vectors.
Declare.f   Colinearity (*VectorA.vec2, *VectorB.vec2) ; Returns a signed scalar approaching 1.0 the more the vectors are colinear, and 0.0 the more are ortogonal.

Declare     PointAlongVector (*PointA.vec2, *PointB.vec2, distance.f, *PointAlong.vec2) ; Calculate the point along the vector going from PointA to PointB at the specified distance from PointA.
Declare.f   Projection (*VectorA.vec2, *VectorB.vec2) ; Returns the signed length of the projection of VectorA on VectorB.
Declare     Reflect (*VectorA.vec2, *VectorB.vec2, *ReflectedVector.vec2) ; Sets ReflectedVector to the normalized vector corresponding to the reflection of VectorA on VectorB.
Declare     Rotate (*Vector.vec2, angle.f, *RotatedVector.vec2) ; Rotates a vector by angle degrees.
Declare     TransformLocalToWorld (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointLocal.vec2, *PointWorld.vec2) ; Transform a point pl from the local space to a point pw in the world space.
Declare     TransformWorldToLocal (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointWorld.vec2, *PointLocal.vec2) ; Transform a point pw from the world space to a point pl in the local space.

EndDeclareModule

Module vec2

#ONE_DEG_IN_RAD = 2* #PI / 360
#ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 

Procedure Set (*Vector.vec2, x.f, y.f)
;> Set the x, y components of Vector.
 *Vector\x = x
 *Vector\y = y
EndProcedure

Procedure Dump (*Vector.vec2, decimals = 2)
;> Returns a string representation of Vector.
 Debug "T(" + StrF(*Vector\x, decimals) + ", " + StrF(*Vector\y, decimals) + ")"
EndProcedure

Procedure Zero (*Vector.vec2)
;> Set Vector to (0.0, 0.0)
 *Vector\x = 0.0
 *Vector\y = 0.0
EndProcedure

Procedure.i IsZero (*Vector.vec2)
;> Returns 1 if Vector is (0.0, 0.0), else 0.
 If *Vector\x = 0.0 And *Vector\y = 0.0
    ProcedureReturn 1
 EndIf
  ProcedureReturn 0
EndProcedure

Procedure SetFromPoints (*Vector.vec2, *PointA.vec2, *PointB.vec2)
;> Sets Vector to the vector going from PointA to PointB.
 Sub(*PointB, *PointA, *Vector)
EndProcedure

Procedure Copy (*Vector.vec2, *DestinationVector.vec2)
;> Copies Vector to DestinationVector.
 *DestinationVector\x = *Vector\x
 *DestinationVector\y = *Vector\y
EndProcedure


Procedure Add (*VectorA.vec2, *VectorB.vec2, *SumVector.vec2)
;> Add VectorA to VectorB and store the result in SumVector.
; You can specify VectorA in place of SumVector.
 *SumVector\x = *VectorA\x + *VectorB\x
 *SumVector\y = *VectorA\y + *VectorB\y
EndProcedure

Procedure Sub (*VectorA.vec2, *VectorB.vec2, *DiffVector.vec2)
;> Subtract VectorB from VectorA and store the result in DiffVector.
; You can specify VectorA in place of DiffVector.
 *DiffVector\x = *VectorA\x - *VectorB\x
 *DiffVector\y = *VectorA\y - *VectorB\y
EndProcedure

Procedure.f Length (*Vector.vec2)
;> Returns the length of Vector.
 ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y))
EndProcedure

Procedure.f LengthSquared (*Vector.vec2)
;> Returns the squared length of Vector.
 ProcedureReturn (*Vector\x * *Vector\x) + (*Vector\y * *Vector\y)
EndProcedure

Procedure.f Distance (*PointA.vec2, *PointB.vec2)
;> Returns the distance between PointA and PointB.
 Protected.vec2 vAB
 SetFromPoints(vAB, *PointA, *PointB)
 ProcedureReturn Length(vAB)
EndProcedure

Procedure Negate (*Vector.vec2, *NegatedVector.vec2)
;> Sets NegatedVector to the opposite version of Vector.
; You can specify Vector in place of NegatedVector.
 *NegatedVector\x = - *Vector\x 
 *NegatedVector\y = - *Vector\y 
EndProcedure

Procedure Normalize (*Vector.vec2, *UnitVector.vec2)
;> Sets UnitVector to the normalized version of Vector.
; You can specify Vector in place of UnitVector.
 Protected len.f = Length(*Vector) 
 *UnitVector\x = *Vector\x / len
 *UnitVector\y = *Vector\y / len
EndProcedure

Procedure Scale (*Vector.vec2, scalar.f, *ScaledVector.vec2)
;> Sets ScaledVector to the scaled version of Vector.
; You can specify Vector in place of ScaledVector.
 *ScaledVector\x = *Vector\x * scalar
 *ScaledVector\y = *Vector\y * scalar
EndProcedure

Procedure.f DotProduct (*VectorA.vec2, *VectorB.vec2)
;> Returns the dot product of the two vectors.
; The dot product is 0 when the two vectors are orthogonal, and reach its max when they are colinear.
; The returned value is a signed scalar.
 ProcedureReturn (*VectorA\x * *VectorB\x + *VectorA\y * *VectorB\y)
EndProcedure

Procedure.f Angle (*VectorA.vec2, *VectorB.vec2)
;> Returns the angle formed by the two vectors.
; https://www.omnicalculator.com/math/angle-between-two-vectors
 Protected dotp.f = DotProduct(*VectorA, *VectorB)
 Protected lenA.f = Length(*VectorA)
 Protected lenB.f = Length(*VectorB)
 
 ProcedureReturn Degree(ACos(dotp / (lenA * lenB)))
EndProcedure

Procedure.f Colinearity (*VectorA.vec2, *VectorB.vec2)
;> Returns a signed scalar approaching 1.0 the more the vectors are colinear, and 0.0 the more are ortogonal. 
 Protected.vec2 vuA, vuB
 
 Normalize(*VectorA, vuA)
 Normalize(*VectorB, vuB) 
 ProcedureReturn DotProduct(vuA, vuB)
EndProcedure

Procedure PointAlongVector (*PointA.vec2, *PointB.vec2, distance.f, *PointAlong.vec2)
;> Calculate the point along the vector going from PointA to PointB at the specified distance from PointA.
; PointAlong = PointA + distance in the direction of PointA -> PointB.
 Protected.vec2 vAB, uvAB
 
 ; get the vector from PointA to PointB
 SetFromPoints(vAB, *PointA, *PointB)
 
 ; and normalize it to get a direction
 Normalize(vAB, uvAB)
 
 ; adds the distance-scaled unit vector to the starting point to get the new point
 *PointAlong\x = *PointA\x + uvAB\x * distance 
 *PointAlong\y = *PointA\y + uvAB\y * distance 
EndProcedure

Procedure.f Projection (*VectorA.vec2, *VectorB.vec2)
;> Returns the signed length of the projection of VectorA on VectorB.
 Protected.vec2 vuB
 
 ; normalize the vector we are projecting to 
 Normalize(*VectorB, vuB)
 
 ; dot product of VectorA with the normalized VectorB
 ProcedureReturn DotProduct(*VectorA, vuB)
EndProcedure  

Procedure Reflect (*VectorA.vec2, *VectorB.vec2, *ReflectedVector.vec2)
;> Sets ReflectedVector to the normalized vector corresponding to the reflection of VectorA on VectorB.
; VectorA : The incoming vector to be reflected.
; VectorB : The reflecting vector representing a reflective surface.
 Protected.vec2 vuA, vuB
 Protected dp.f
 
 ; normalize VectorA
 Normalize(*VectorA, vuA)

 ; normalize VectorB
 Normalize(*VectorB, vuB)
 
 ; dot product * 2 
 dp = DotProduct(vuA, vuB) * 2.0

 ; scale vuB * dot product 
 Scale(vuB, dp, vuB)
 
 ; get the vector going from vua to the enlarged vub
 Sub(vuB, vuA, *ReflectedVector)
EndProcedure

Procedure Rotate (*Vector.vec2, angle.f, *RotatedVector.vec2)
;> Rotates a vector by angle degrees.
; You can specify Vector in place of RotatedVector
; Positive angles rotates anti-clockwise, negative angles rotates clockwise.
 Protected x.f, y.f
 
 angle = #ONE_DEG_IN_RAD * angle
 
 x = (Cos(angle) * *Vector\x) - (Sin(angle) * *Vector\y)
 y = (Sin(angle) * *Vector\x) + (Cos(angle) * *Vector\y)
 
 *RotatedVector\x = x
 *RotatedVector\y = y
EndProcedure

Procedure TransformLocalToWorld (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointLocal.vec2, *PointWorld.vec2)
;> Transform a point pl from the local space to a point pw in the world space.
; Origin : the local space origin expressed as a point in world space
; AxisX : a normalized vector in world space representing the X axis of the local space
; AxisY : a normalized vector in world space representing the Y axis of the local space
; PointLocal : the starting local point
; PointWorld : the resulting world space point

 Protected WS_LocalOriginToLocalPoint.vec2 ; world space vector going from the local origin to the local point
 Protected WS_FinalVector.vec2 ; world space vector going from the world space origin to the local point
 Protected ScaledAxisX.vec2, ScaledAxisY.vec2

 ; scale the unit vector of the local X axis to extend it to the X of the local point
 Scale(*AxisX, *PointLocal\x, ScaledAxisX) 
 ; scale the unit vector of the local Y axis to extend it to the Y of the local point
 Scale(*AxisY, *PointLocal\y, ScaledAxisY) 

 ; add the two vectors to get a new vector in world space going from the locall origin to the local point
 Add(ScaledAxisX, ScaledAxisY, WS_LocalOriginToLocalPoint) 

 ; add the two vectors the get the final one going in world space from the origin to the local point
 Add(*Origin, WS_LocalOriginToLocalPoint, WS_FinalVector)

 ; returns the final point in world space
 *PointWorld\x = WS_FinalVector\x
 *PointWorld\y = WS_FinalVector\y
EndProcedure

Procedure TransformWorldToLocal (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointWorld.vec2, *PointLocal.vec2)
;> Transform a point pw from the world space to a point pl in the local space.
; Origin : the local space origin expressed as a point in world space
; AxisX : a normalized vector in world space representing the X axis of the local space
; AxisY : a normalized vector in world space representing the Y axis of the local space
; PointWorld : the source world space point
; PointLocal : the resulting local point

 Protected WS_LocalOriginToLocalPoint.vec2 ; world space vector going from the local origin to the local point
 Protected LocalX.f, LocalY.f

 Sub(*PointWorld, *Origin, WS_LocalOriginToLocalPoint)
 
 LocalX = DotProduct(WS_LocalOriginToLocalPoint, *AxisX) ; project along the X axis to get the X component
 LocalY = DotProduct(WS_LocalOriginToLocalPoint, *AxisY) ; project along the Y axis to get the Y component
 
 ; returns the final point in local space
 *PointLocal\x = LocalX
 *PointLocal\y = LocalY
EndProcedure

EndModule


CompilerIf #PB_Compiler_IsMainFile

EnableExplicit

Define.vec2::vec2 v1, v2, v3, vo
Define.vec2::vec2 p1, p2, p3, po

vec2::Set (v1,-2.0, 4.0)
vec2::Set (v2, 3.0, 2.0)
vec2::Dump(v1) ; (-2.00, 4.00)
vec2::Dump(v2) ; (3.00, 2.00)
Debug vec2::Length(v1) ; 4.4721360206604
Debug vec2::LengthSquared(v1) ; 20.0
Debug vec2::Length(v2) ; 3.60555124282837
Debug vec2::LengthSquared(v2) ; 13.0

vec2::Set(v1,-2.0, 4.0)
vec2::Set(v2, 3.0, 2.0)
vec2::Sub(v1, v2, vo)
vec2::Dump(vo) ; (-5.00, 2.00)
Debug vec2::Length(vo) ; 5.38516473770142

vec2::Set(p1,-2.0, 4.0)
vec2::Set(p2, 3.0, 2.0)
vec2::SetFromPoints(v1, p1, p2)
vec2::Dump(v1) ; (5.00, -2.00)

vec2::Set(v1,-2.0, 4.0)
vec2::Set(v2, 3.0, 2.0)
vec2::Add(v1, v2, vo)
vec2::Dump(vo) ; (1.00, 6.00)
Debug vec2::Length(vo) ;  6.08276271820068

vec2::Set(v1,-2.0, 4.0)
vec2::Scale(v1, 3.0, vo)
vec2::Dump(vo) ; (-6.00, 12.00)

vec2::Set(v1,-2.0, 4.0)
vec2::Normalize (v1, vo) 
vec2::Dump(vo) ; (-0.45, 0.89)
Debug vec2::Length(vo) ; 1.0

vec2::Set (v1,-2.0, 3.0)
vec2::Set (v2, 3.0, 2.0)
Debug vec2::DotProduct(v1, v2) ; 0.0

vec2::Set (v1, 6.0, 4.0)
vec2::Set (v2, 3.0, 2.0)
Debug vec2::DotProduct(v1, v2) ; 26.0

vec2::Set (v1, 3.0, 3.0)
vec2::Set (v2, 3.0, 0.0)
Debug vec2::Projection( v1, v2) ; 3.0

vec2::Set (v1, 1.5, 6.0)
vec2::Set (v2, 3.0, 0.0)
Debug vec2::Projection( v1, v2) ; 1.5

vec2::Set (v1, 3.0, -3.0)
vec2::Set (v2, 3.0, 0.0)
vec2::Reflect(v1, v2, vo) 
vec2::Dump(vo) ; (0.71, 0.71)

vec2::Set (v1, -4.0, -1.0)
vec2::Set (v2, 0.0, 5.0)
vec2::Reflect(v1, v2, vo) 
vec2::Dump(vo) ; (0.97, -0.24)

vec2::Set (v1, 1.0, 1.0)
vec2::Rotate(v1, 45, v1)
vec2::Dump(v1) ; (1.41, 0.00)

vec2::Set (v1, 1.0, 1.0)
vec2::Rotate(v1, -30, v1)
vec2::Dump(v1) ; (0.37, 1.37)

vec2::Set (v1, 1.0, 1.0)
vec2::Set (v2, 1.0, 0.0)
Debug vec2::Angle(v1, v2) ; 45.0

vec2::Set (v1, 1.0, 1.0)
vec2::Set (v2, 5.0, 5.0)
Debug vec2::Distance (v1, v2) ; 5.65685415267944

vec2::Set (v1, 2.0, 1.0)
vec2::Set (v2, 8.0, 2.0)
vec2::PointAlongVector(v1, v2, 2.0, vo)
vec2::Dump(vo) ; (3.97, 1.33)

vec2::Set (v1, 2.0, 2.0)
vec2::Set (v2, 4.0, 4.0)
Debug vec2::Colinearity(v1, v2) ; 0.99999994039536

vec2::Set (v1, 2.0, 2.0)
vec2::Set (v2, -2.0, 2.0)
Debug vec2::Colinearity(v1, v2) ; 0.0

vec2::Set (v1, 2.0, 2.0)
vec2::Set (v2, -2.0, -2.0)
Debug vec2::Colinearity(v1, v2) ; -0.99999994039536

Define.vec2::vec2 UnitAxisX, UnitAxisY, Origin
Define.vec2::vec2 pl, pw
vec2::Set(UnitAxisX, 0.71, 0.71)
vec2::Set(UnitAxisY, -0.71, 0.71)
vec2::Set(Origin, 3.0, 2.0)
vec2::Set(pl, 2.0, 1.0)
vec2::Set(pw, 0.0, 0.0)
vec2::TransformLocalToWorld(Origin, UnitAxisX, UnitAxisY, pl, pw)
vec2::Dump(pw) ; (3.71, 4.13)

vec2::Set(pw, 3.71, 4.13)
vec2::Set(pl, 0.0, 0.0)
vec2::TransformWorldToLocal(Origin, UnitAxisX, UnitAxisY, pw, pl)
vec2::Dump(pl) ; (2.02, 1.01)

CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 156
; FirstLine = 125
; Folding = -----
; Markers = 10
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory