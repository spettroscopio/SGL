DeclareModule vec4

EnableExplicit

Structure vec4
 float.f[0]
 x.f
 y.f
 z.f
 w.f
EndStructure

Declare     Set (*Vector.vec4, x.f, y.f, z.f, w.f) ; Set the x, y, z components of Vector.
Declare     Dump (*Vector.vec4, decimals = 2) ; Returns a string representation of Vector.
Declare     Zero (*Vector.vec4) ; Set Vector to (0.0, 0.0, 0.0, 0.0)
Declare.i   IsZero (*Vector.vec4) ; Returns 1 if Vector is (0.0, 0.0, 0.0, 0.0), else 0.
Declare     Copy (*Vector.vec4, *DestinationVector.vec4) ; Copies Vector to DestinationVector.
Declare     Add (*VectorA.vec4, *VectorB.vec4, *SumVector.vec4) ; Add VectorA to VectorB and store the result in SumVector.
Declare     Sub (*VectorA.vec4, *VectorB.vec4, *DiffVector.vec4) ; Subtract VectorB from VectorA and store the result in DiffVector.
Declare.f   Length (*Vector.vec4) ; Returns the length of Vector.
Declare.f   LengthSquared (*Vector.vec4) ; Returns the squared length of Vector.
Declare     Normalize (*Vector.vec4, *UnitVector.vec4) ; Sets UnitVector to the normalized version of Vector.
Declare     Scale (*Vector.vec4, scalar.f, *ScaledVector.vec4) ; Sets ScaledVector to the scaled version of Vector.

EndDeclareModule

Module vec4

Procedure Set (*Vector.vec4, x.f, y.f, z.f, w.f)
;> Set the x, y, z components of Vector.
 *Vector\x = x
 *Vector\y = y
 *Vector\z = z
 *Vector\w = w
EndProcedure

Procedure Dump (*Vector.vec4, decimals = 2)
;> Returns a string representation of Vector.
 Debug "T(" + StrF(*Vector\x, decimals) + ", " + StrF(*Vector\y, decimals) + ", " + StrF(*Vector\z, decimals) + ", " + StrF(*Vector\w, decimals) + ")"
EndProcedure

Procedure Zero (*Vector.vec4)
;> Set Vector to (0.0, 0.0, 0.0, 0.0)
 *Vector\x = 0.0
 *Vector\y = 0.0
 *Vector\z = 0.0
 *Vector\w = 0.0
EndProcedure

Procedure.i IsZero (*Vector.vec4)
;> Returns 1 if Vector is (0.0, 0.0, 0.0, 0.0), else 0.
 If *Vector\x = 0.0 And *Vector\y = 0.0 And *Vector\z = 0.0 And *Vector\w = 0.0
    ProcedureReturn 1
 EndIf
  ProcedureReturn 0
EndProcedure

Procedure Copy (*Vector.vec4, *DestinationVector.vec4)
;> Copies Vector to DestinationVector.
 *DestinationVector\x = *Vector\x
 *DestinationVector\y = *Vector\y
 *DestinationVector\z = *Vector\z
 *DestinationVector\w = *Vector\w
EndProcedure

Procedure Add (*VectorA.vec4, *VectorB.vec4, *SumVector.vec4)
;> Add VectorA to VectorB and store the result in SumVector.
; You can specify VectorA in place of SumVector.
 *SumVector\x = *VectorA\x + *VectorB\x
 *SumVector\y = *VectorA\y + *VectorB\y
 *SumVector\z = *VectorA\z + *VectorB\z
 *SumVector\w = *VectorA\w + *VectorB\w
EndProcedure

Procedure Sub (*VectorA.vec4, *VectorB.vec4, *DiffVector.vec4)
;> Subtract VectorB from VectorA and store the result in DiffVector.
; You can specify VectorA in place of DiffVector.
 *DiffVector\x = *VectorA\x - *VectorB\x
 *DiffVector\y = *VectorA\y - *VectorB\y
 *DiffVector\z = *VectorA\z - *VectorB\z
 *DiffVector\w = *VectorA\w - *VectorB\w
EndProcedure

Procedure.f Length (*Vector.vec4)
;> Returns the length of Vector.
 ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z) + (*Vector\w * *Vector\w))
EndProcedure

Procedure.f LengthSquared (*Vector.vec4)
;> Returns the squared length of Vector.
 ProcedureReturn (*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z) + (*Vector\w * *Vector\w)
EndProcedure

Procedure Normalize (*Vector.vec4, *UnitVector.vec4)
;> Sets UnitVector to the normalized version of Vector.
; You can specify Vector in place of UnitVector.
 Protected len.f = Length(*Vector) 
 *UnitVector\x = *Vector\x / len
 *UnitVector\y = *Vector\y / len
 *UnitVector\z = *Vector\z / len
 *UnitVector\w = *Vector\w / len
EndProcedure

Procedure Scale (*Vector.vec4, scalar.f, *ScaledVector.vec4)
;> Sets ScaledVector to the scaled version of Vector.
; You can specify Vector in place of ScaledVector.
 *ScaledVector\x = *Vector\x * scalar
 *ScaledVector\y = *Vector\y * scalar
 *ScaledVector\z = *Vector\z * scalar
 *ScaledVector\w = *Vector\w * scalar
EndProcedure

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 31
; Folding = ---
; Markers = 12
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory