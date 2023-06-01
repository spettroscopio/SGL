DeclareModule vec3

EnableExplicit

Structure vec3
 float.f[0]
 x.f
 y.f
 z.f
EndStructure

Declare     Set (*Vector.vec3, x.f, y.f, z.f) ; Set the x, y, z components of Vector.
Declare     Dump (*Vector.vec3, desc$ = "") ; Returns a string representation of Vector.
Declare     Zero (*Vector.vec3) ; Set Vector to (0.0, 0.0, 0.0)
Declare.i   IsZero (*Vector.vec3) ; Returns 1 if Vector is (0.0, 0.0, 0.0), else 0.
Declare     SetFromPoints (*Vector.vec3, *PointA.vec3, *PointB.vec3) ; Sets Vector to the vector going from PointA to PointB.
Declare     Copy (*Vector.vec3, *DestinationVector.vec3) ; Copies Vector to DestinationVector.
Declare     Add (*VectorA.vec3, *VectorB.vec3, *SumVector.vec3) ; Add VectorA to VectorB and store the result in SumVector.
Declare     Sub (*VectorA.vec3, *VectorB.vec3, *DiffVector.vec3) ; Subtract VectorB from VectorA and store the result in DiffVector.
Declare.f   Length (*Vector.vec3) ; Returns the length of Vector.
Declare.f   LengthSquared (*Vector.vec3) ; Returns the squared length of Vector.
Declare.f   Distance (*PointA.vec3, *PointB.vec3) ; Returns the distance between PointA and PointB.
Declare     Negate (*Vector.vec3, *NegatedVector.vec3) ; Sets NegatedVector to the opposite version of Vector.
Declare     Normalize (*Vector.vec3, *UnitVector.vec3) ; Sets UnitVector to the normalized version of Vector.
Declare     Scale (*Vector.vec3, scalar.f, *ScaledVector.vec3) ; Sets ScaledVector to the scaled version of Vector.
Declare.f   DotProduct (*VectorA.vec3, *VectorB.vec3) ; Returns the dot product of the two vectors.
Declare.f   Angle (*VectorA.vec3, *VectorB.vec3) ; Returns the angle formed by the two vectors.
Declare.f   Colinearity (*VectorA.vec3, *VectorB.vec3) ; Returns a signed scalar approaching 1.0 the more the vectors are colinear, and 0.0 the more are ortogonal.
Declare     CrossProduct (*VectorA.vec3, *VectorB.vec3, *CrossVector.vec3)
Declare     PointAlongVector (*PointA.vec3, *PointB.vec3, distance.f, *PointAlong.vec3) ; Calculate the point along the vector going from PointA to PointB at the specified distance from PointA.

EndDeclareModule

Module vec3

Procedure Set (*Vector.vec3, x.f, y.f, z.f)
;> Set the x, y, z components of Vector.
 *Vector\x = x
 *Vector\y = y
 *Vector\z = z
EndProcedure

Procedure Dump (*Vector.vec3, desc$ = "")
;> Returns a string representation of Vector.
 Protected text$
 Protected decimals = 2
 
 If desc$ <> #Empty$ : text$ = desc$ + " " : EndIf
 
 text$ + "T(" + StrF(*Vector\x, decimals) + ", " + StrF(*Vector\y, decimals) + ", " + StrF(*Vector\z, decimals) + ")"
 
 Debug text$
EndProcedure

Procedure Zero (*Vector.vec3)
;> Set Vector to (0.0, 0.0, 0.0)
 *Vector\x = 0.0
 *Vector\y = 0.0
 *Vector\z = 0.0
EndProcedure

Procedure.i IsZero (*Vector.vec3)
;> Returns 1 if Vector is (0.0, 0.0, 0.0), else 0.
 If *Vector\x = 0.0 And *Vector\y = 0.0 And *Vector\z = 0.0 
    ProcedureReturn 1
 EndIf
  ProcedureReturn 0
EndProcedure

Procedure SetFromPoints (*Vector.vec3, *PointA.vec3, *PointB.vec3)
;> Sets Vector to the vector going from PointA to PointB.
 Sub(*PointB, *PointA, *Vector)
EndProcedure

Procedure Copy (*Vector.vec3, *DestinationVector.vec3)
;> Copies Vector to DestinationVector.
 *DestinationVector\x = *Vector\x
 *DestinationVector\y = *Vector\y
 *DestinationVector\z = *Vector\z
EndProcedure

Procedure Add (*VectorA.vec3, *VectorB.vec3, *SumVector.vec3)
;> Add VectorA to VectorB and store the result in SumVector.
; You can specify VectorA or VectorB in place of SumVector.
 *SumVector\x = *VectorA\x + *VectorB\x
 *SumVector\y = *VectorA\y + *VectorB\y
 *SumVector\z = *VectorA\z + *VectorB\z
EndProcedure

Procedure Sub (*VectorA.vec3, *VectorB.vec3, *DiffVector.vec3)
;> Subtract VectorB from VectorA and store the result in DiffVector.
; You can specify VectorA or VectorB in place of DiffVector.
 *DiffVector\x = *VectorA\x - *VectorB\x
 *DiffVector\y = *VectorA\y - *VectorB\y
 *DiffVector\z = *VectorA\z - *VectorB\z
EndProcedure

Procedure.f Length (*Vector.vec3)
;> Returns the length of Vector.
 ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z))
EndProcedure

Procedure.f LengthSquared (*Vector.vec3)
;> Returns the squared length of Vector.
 ProcedureReturn (*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z)
EndProcedure

Procedure.f Distance (*PointA.vec3, *PointB.vec3)
;> Returns the distance between PointA and PointB.
 Protected.vec3 vAB
 SetFromPoints(vAB, *PointA, *PointB)
 ProcedureReturn Length(vAB)
EndProcedure

Procedure Negate (*Vector.vec3, *NegatedVector.vec3)
;> Sets NegatedVector to the opposite version of Vector.
; You can specify Vector in place of NegatedVector.
 *NegatedVector\x = - *Vector\x 
 *NegatedVector\y = - *Vector\y 
 *NegatedVector\z = - *Vector\z
EndProcedure

Procedure Normalize (*Vector.vec3, *UnitVector.vec3)
;> Sets UnitVector to the normalized version of Vector.
; You can specify Vector in place of UnitVector.
 Protected len.f = Length(*Vector) 
 *UnitVector\x = *Vector\x / len
 *UnitVector\y = *Vector\y / len
 *UnitVector\z = *Vector\z / len
EndProcedure

Procedure Scale (*Vector.vec3, scalar.f, *ScaledVector.vec3)
;> Sets ScaledVector to the scaled version of Vector.
; You can specify Vector in place of ScaledVector.
 *ScaledVector\x = *Vector\x * scalar
 *ScaledVector\y = *Vector\y * scalar
 *ScaledVector\z = *Vector\z * scalar
EndProcedure

Procedure.f DotProduct (*VectorA.vec3, *VectorB.vec3)
;> Returns the dot product of the two vectors.
; The dot product is 0 when the two vectors are orthogonal, and reach its max when they are colinear.
; The returned value is a signed scalar.
 ProcedureReturn (*VectorA\x * *VectorB\x + *VectorA\y * *VectorB\y + *VectorA\z * *VectorB\z)
EndProcedure

Procedure.f Angle (*VectorA.vec3, *VectorB.vec3)
;> Returns the angle formed by the two vectors.
; https://www.omnicalculator.com/math/angle-between-two-vectors
 Protected dotp.f = DotProduct(*VectorA, *VectorB)
 Protected lenA.f = Length(*VectorA)
 Protected lenB.f = Length(*VectorB)
 
 ProcedureReturn Degree(ACos(dotp / (lenA * lenB)))
EndProcedure

Procedure.f Colinearity (*VectorA.vec3, *VectorB.vec3)
;> Returns a signed scalar approaching 1.0 the more the vectors are colinear, and 0.0 the more are ortogonal. 
 Protected.vec3 vuA, vuB
 
 Normalize(*VectorA, vuA)
 Normalize(*VectorB, vuB) 
 ProcedureReturn DotProduct(vuA, vuB)
EndProcedure

Procedure CrossProduct (*VectorA.vec3, *VectorB.vec3, *CrossVector.vec3)
; Calculate the cross product between VectorA and VectorB resulting in the ortogonal vector CrossVector.
 *CrossVector\x = *VectorA\y * *VectorB\z - *VectorA\z * *VectorB\y
 *CrossVector\y = *VectorA\z * *VectorB\x - *VectorA\x * *VectorB\z
 *CrossVector\z = *VectorA\x * *VectorB\y - *VectorA\y * *VectorB\x
EndProcedure

Procedure PointAlongVector (*PointA.vec3, *PointB.vec3, distance.f, *PointAlong.vec3)
;> Calculate the point along the vector going from PointA to PointB at the specified distance from PointA.
; PointAlong = PointA + distance in the direction of PointA -> PointB.
 Protected.vec3 vAB, uvAB
 
 ; get the vector from PointA to PointB
 SetFromPoints(vAB, *PointA, *PointB)
 
 ; and normalize it to get a direction
 Normalize(vAB, uvAB)
 
 ; adds the distance-scaled unit vector to the starting point to get the new point
 *PointAlong\x = *PointA\x + uvAB\x * distance 
 *PointAlong\y = *PointA\y + uvAB\y * distance 
 *PointAlong\z = *PointA\z + uvAB\z * distance 
EndProcedure



EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 30
; Folding = ----
; Markers = 11
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory