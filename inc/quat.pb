XIncludeFile "m4x4.pb"
XIncludeFile "vec3.pb"

DeclareModule quat

EnableExplicit

Structure quat
 float.f[0] 
 qw.f 
 qx.f 
 qy.f 
 qz.f 
EndStructure

Declare   Set (*Quat.quat, qw.f, qx.f, qy.f, qz.f) ; Set the 4 components of Quat.
Declare   Dump (*Quat.quat, decimals = 2) ; Returns a string representation of Quat.
Declare   Copy (*Quat.quat, *DestinationQuat.quat) ; Copies Quat to DestinationQuat.
Declare   Conjugate (*Quat.quat, *ConjugateQuat.quat) ; Sets ConjugateQuat as the conjugate of Quat.
Declare   Normalize (*Quat.quat, *UnitQuat.quat) ; Sets UnitQuat to the normalized version of Quat.
Declare   Multiply (*QuatA.quat, *QuatB.quat, *MultipliedQuat.quat)
Declare   Versor (*Quat.quat, *Axis.vec3::vec3, angle.f) ; Set the the quaternion as a versor.
Declare   Identity (*Quat.quat) ; Set the the quaternion to an identity versor.
Declare   GetMatrix (*Quat.quat, *Destinationmatrix.m4x4::m4x4) ; Convert the quaternion to an OpenGL 4x4 matrix.
Declare   RotateVec (*Vector.vec3::vec3,  *RotationAxis.vec3::vec3, angle.f, *RotatedVector.vec3::vec3) ; Rotates a point vector around the axis RotationAxis by angle degrees.

EndDeclareModule

Module quat
#ONE_DEG_IN_RAD = 2* #PI / 360
#ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 

Procedure Set (*Quat.quat, qw.f, qx.f, qy.f, qz.f)
;> Set the 4 components of Quat.
 *Quat\qw = qw
 *Quat\qx = qx
 *Quat\qy = qy
 *Quat\qz = qz
EndProcedure

Procedure Dump (*Quat.quat, decimals = 2)
;> Returns a string representation of Quat.
 Debug "(" + StrF(*Quat\qw, decimals) + ", " + StrF(*Quat\qx, decimals) + ", " + StrF(*Quat\qy, decimals) + ", " + StrF(*Quat\qz, decimals) + ")"
EndProcedure

Procedure Copy (*Quat.quat, *DestinationQuat.quat)
;> Copies Quat to DestinationQuat.

 *DestinationQuat\qw = *Quat\qw
 *DestinationQuat\qx = *Quat\qx
 *DestinationQuat\qy = *Quat\qy
 *DestinationQuat\qz = *Quat\qz 
EndProcedure

Procedure Conjugate (*Quat.quat, *ConjugateQuat.quat)
;> Sets ConjugateQuat as the conjugate of Quat.

; You can specify Quat in place of *ConjugateQuat.
 
 *ConjugateQuat\qw =  *Quat\qw  ; the same "real" part
 *ConjugateQuat\qx = -*Quat\qx  
 *ConjugateQuat\qy = -*Quat\qy  ; but the opposite complex part  
 *ConjugateQuat\qz = -*Quat\qz
EndProcedure

Procedure Normalize (*Quat.quat, *UnitQuat.quat)
;> Sets UnitQuat to the normalized version of Quat.
; You can specify Quat in place of UnitQuat.

 Protected sq_magnitude.f, magnitude.f
 
 ; squared magnitued
 sq_magnitude = *Quat\qw * *Quat\qw + *Quat\qx * *Quat\qx + *Quat\qy * *Quat\qy + *Quat\qz * *Quat\qz
 
 If Abs(1.0 - sq_magnitude) < 0.0001
    ; normalization not required
    *UnitQuat\qw = *Quat\qw
    *UnitQuat\qx = *Quat\qx
    *UnitQuat\qy = *Quat\qy
    *UnitQuat\qz = *Quat\qz
 Else
    ; normalize it
    magnitude  = Sqr(sq_magnitude)
    *UnitQuat\qw = *Quat\qw / magnitude
    *UnitQuat\qx = *Quat\qx / magnitude
    *UnitQuat\qy = *Quat\qy / magnitude
    *UnitQuat\qz = *Quat\qz / magnitude
 EndIf
EndProcedure

Procedure Multiply (*QuatA.quat, *QuatB.quat, *MultipliedQuat.quat)
; Multiplies QuatA by QuatB and stores the result in MultipliedQuat.
; You can specify QuatA or QuatB in place of MultiplieQuat.

 Protected.quat TempQuat, *q
 
 If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
    *q = @TempQuat
 Else
    *q = *MultipliedQuat
 EndIf
 
 *q\qw = *QuatB\qw * *QuatA\qw - *QuatB\qx * *QuatA\qx - *QuatB\qy * *QuatA\qy - *QuatB\qz * *QuatA\qz 
 *q\qx = *QuatB\qw * *QuatA\qx + *QuatB\qx * *QuatA\qw - *QuatB\qy * *QuatA\qz + *QuatB\qz * *QuatA\qy
 *q\qy = *QuatB\qw * *QuatA\qy + *QuatB\qx * *QuatA\qz + *QuatB\qy * *QuatA\qw - *QuatB\qz * *QuatA\qx 
 *q\qz = *QuatB\qw * *QuatA\qz - *QuatB\qx * *QuatA\qy + *QuatB\qy * *QuatA\qx + *QuatB\qz * *QuatA\qw 
 
 If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
    Copy(*q, *MultipliedQuat )
 EndIf
EndProcedure


Procedure Versor (*Quat.quat, *Axis.vec3::vec3, angle.f)
;> Set the the quaternion as a versor.
; A versor store a rotation of a certain angle (angle) around a certain vector (Axis)
 Protected rad_half_angle.f = angle * #ONE_DEG_IN_RAD / 2.0
 
 *Quat\qw = Cos(rad_half_angle)
 *Quat\qx = Sin(rad_half_angle) * *Axis\x
 *Quat\qy = Sin(rad_half_angle) * *Axis\y
 *Quat\qz = Sin(rad_half_angle) * *Axis\z 
 
 Normalize(*Quat, *Quat)
EndProcedure

Procedure Identity (*Quat.quat)
;> Set the the quaternion to an identity versor. 
 quat::Set(*Quat, 1.0, 0.0, 0.0, 0.0)
EndProcedure

Procedure GetMatrix (*Quat.quat, *Destinationmatrix.m4x4::m4x4)
;> Convert the quaternion to an OpenGL 4x4 matrix.
 Normalize(*Quat, *Quat)
  
 *Destinationmatrix\float[0]  = 1.0 - (2.0 * *Quat\float[2] * *Quat\float[2]) - (2.0 * *Quat\float[3] * *Quat\float[3])
 *Destinationmatrix\float[1]  = (2.0 * *Quat\float[1] * *Quat\float[2]) + (2.0 * *Quat\float[0] * *Quat\float[3])
 *Destinationmatrix\float[2]  = (2.0 * *Quat\float[1] * *Quat\float[3]) - (2.0 * *Quat\float[0] * *Quat\float[2])
 *Destinationmatrix\float[3]  = 0.0
 *Destinationmatrix\float[4]  = (2.0 * *Quat\float[1] * *Quat\float[2]) - (2.0 * *Quat\float[0] * *Quat\float[3])
 *Destinationmatrix\float[5]  = 1.0 - (2.0 * *Quat\float[1] * *Quat\float[1]) - (2.0 * *Quat\float[3] * *Quat\float[3])
 *Destinationmatrix\float[6]  = (2.0 * *Quat\float[2] * *Quat\float[3]) + (2.0 * *Quat\float[0] * *Quat\float[1])
 *Destinationmatrix\float[7]  = 0.0
 *Destinationmatrix\float[8]  = (2.0 * *Quat\float[1] * *Quat\float[3]) + (2.0 * *Quat\float[0] * *Quat\float[2])
 *Destinationmatrix\float[9]  = (2.0 * *Quat\float[2] * *Quat\float[3]) - (2.0 * *Quat\float[0] * *Quat\float[1])
 *Destinationmatrix\float[10] = 1.0 - (2.0 * *Quat\float[1] * *Quat\float[1]) - (2.0 * *Quat\float[2] * *Quat\float[2])
 *Destinationmatrix\float[11] = 0.0
 *Destinationmatrix\float[12] = 0.0
 *Destinationmatrix\float[13] = 0.0
 *Destinationmatrix\float[14] = 0.0
 *Destinationmatrix\float[15] = 1.0  
EndProcedure


Procedure RotateVec (*Vector.vec3::vec3,  *RotationAxis.vec3::vec3, angle.f, *RotatedVector.vec3::vec3)
;> Rotates a point vector around the axis RotationAxis by angle degrees.
; You can specify Vector in place of RotatedVector.

 Protected.quat::quat VecAsQuat
 Protected.quat::quat Versor, ConjugatedVersor, Rotated
 
 ; store the vector as a quaternion with the real part = 0.0
 Set(VecAsQuat, 0.0, *Vector\x, *Vector\y, *Vector\z)
 
 ; creates the versor representing a rotation around RotationAxis by angle degrees
 Versor (Versor, *RotationAxis, angle)
  
 ; creates the negation of the versor above
 Conjugate(Versor, ConjugatedVersor)
 
 ; this is the "sandwich" to rotate a point vector: Versor * Point * Conj.Versor = Rotated Point
 Multiply(Versor, VecAsQuat, Rotated) ; Versor * Point ...
 Multiply(Rotated, ConjugatedVersor, Rotated) ; ... * Conj.Versor 
 
 ; downgrades the versor to vec3
 *RotatedVector\x = Rotated\qx
 *RotatedVector\y = Rotated\qy
 *RotatedVector\z = Rotated\qz 
EndProcedure

EndModule

CompilerIf #PB_Compiler_IsMainFile
EnableExplicit

Define.vec3::vec3 axis, p, rp
Define.quat::quat q

vec3::Set(p, 1.0, 2.0, 3.0)  ; starting point
vec3::Dump(p) ; (1.0, 2.0, 3.0) 

vec3::Set(axis, 0.0, 1.0, 0.0)  ; rotation axis
vec4::Dump(axis) ; rotated point (3.00, 2.00, -1.00)

quat::RotateVec (p,axis,90, rp)
vec3::Dump(rp) ; rotated point (3.00, 2.00, -1.00)

quat::Identity(p) ; a null rotation 
vec4::Dump(p) ; (1.00, 0.00, 0.00, 0.00)

CompilerEndIf


; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 90
; FirstLine = 111
; Folding = ---
; Markers = 15
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory