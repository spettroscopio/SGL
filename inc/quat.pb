XIncludeFile "m4x4.pb"
XIncludeFile "vec3.pb"

DeclareModule quat

EnableExplicit

Structure quat
 float.f[0] 
 q0.f 
 q1.f 
 q2.f 
 q3.f 
EndStructure

Declare   Set (*Quat.quat, q0.f, q1.f, q2.f, q3.f) ; Set the 4 components of Quat.
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

Procedure Set (*Quat.quat, q0.f, q1.f, q2.f, q3.f)
;> Set the 4 components of Quat.
 *Quat\q0 = q0
 *Quat\q1 = q1
 *Quat\q2 = q2
 *Quat\q3 = q3
EndProcedure

Procedure Dump (*Quat.quat, decimals = 2)
;> Returns a string representation of Quat.
 Debug "(" + StrF(*Quat\q0, decimals) + ", " + StrF(*Quat\q1, decimals) + ", " + StrF(*Quat\q2, decimals) + ", " + StrF(*Quat\q3, decimals) + ")"
EndProcedure

Procedure Copy (*Quat.quat, *DestinationQuat.quat)
;> Copies Quat to DestinationQuat.

 *DestinationQuat\q0 = *Quat\q0
 *DestinationQuat\q1 = *Quat\q1
 *DestinationQuat\q2 = *Quat\q2
 *DestinationQuat\q3 = *Quat\q3 
EndProcedure

Procedure Conjugate (*Quat.quat, *ConjugateQuat.quat)
;> Sets ConjugateQuat as the conjugate of Quat.

; You can specify Quat in place of *ConjugateQuat.
 
 *ConjugateQuat\q0 =  *Quat\q0  ; the same real part 
 *ConjugateQuat\q1 = -*Quat\q1  
 *ConjugateQuat\q2 = -*Quat\q2  ; but the opposite complex part  
 *ConjugateQuat\q3 = -*Quat\q3
EndProcedure

Procedure Normalize (*Quat.quat, *UnitQuat.quat)
;> Sets UnitQuat to the normalized version of Quat.
; You can specify Quat in place of UnitQuat.

 Protected sq_magnitude.f, magnitude.f
 
 ; squared magnitued
 sq_magnitude = *Quat\q0 * *Quat\q0 + *Quat\q1 * *Quat\q1 + *Quat\q2 * *Quat\q2 + *Quat\q3 * *Quat\q3
 
 If Abs(1.0 - sq_magnitude) < 0.0001
    ; normalization not required
    *UnitQuat\q0 = *Quat\q0
    *UnitQuat\q1 = *Quat\q1
    *UnitQuat\q2 = *Quat\q2
    *UnitQuat\q3 = *Quat\q3
 Else
    ; normalize it
    magnitude  = Sqr(sq_magnitude)
    *UnitQuat\q0 = *Quat\q0 / magnitude
    *UnitQuat\q1 = *Quat\q1 / magnitude
    *UnitQuat\q2 = *Quat\q2 / magnitude
    *UnitQuat\q3 = *Quat\q3 / magnitude
 EndIf
EndProcedure

Procedure Multiply (*QuatA.quat, *QuatB.quat, *MultipliedQuat.quat)
; Multiplies QuatA by QuatB and store the result in MultipliedQuat.
; You can specify QuatA or QuatB in place of MultiplieQuat.

 Protected.quat TempQuat, *q
 
 If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
    *q = @TempQuat
 Else
    *q = *MultipliedQuat
 EndIf
 
 *q\q0 = *QuatB\q0 * *QuatA\q0 - *QuatB\q1 * *QuatA\q1 - *QuatB\q2 * *QuatA\q2 - *QuatB\q3 * *QuatA\q3 
 *q\q1 = *QuatB\q0 * *QuatA\q1 + *QuatB\q1 * *QuatA\q0 - *QuatB\q2 * *QuatA\q3 + *QuatB\q3 * *QuatA\q2
 *q\q2 = *QuatB\q0 * *QuatA\q2 + *QuatB\q1 * *QuatA\q3 + *QuatB\q2 * *QuatA\q0 - *QuatB\q3 * *QuatA\q1 
 *q\q3 = *QuatB\q0 * *QuatA\q3 - *QuatB\q1 * *QuatA\q2 + *QuatB\q2 * *QuatA\q1 + *QuatB\q3 * *QuatA\q0 
 
 If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
    Copy(*q, *MultipliedQuat )
 EndIf
EndProcedure


Procedure Versor (*Quat.quat, *Axis.vec3::vec3, angle.f)
;> Set the the quaternion as a versor.
; A versor store a rotation of a certain angle (angle) around a certain vector (Axis)
 Protected rad_half_angle.f = angle * #ONE_DEG_IN_RAD / 2.0
 
 *Quat\q0 = Cos(rad_half_angle)
 *Quat\q1 = Sin(rad_half_angle) * *Axis\x
 *Quat\q2 = Sin(rad_half_angle) * *Axis\y
 *Quat\q3 = Sin(rad_half_angle) * *Axis\z 
 
 Normalize(*Quat, *Quat)
EndProcedure

Procedure Identity (*Quat.quat)
;> Set the the quaternion to an identity versor.
 
 Protected.vec3::vec3 vec
 
 vec3::Zero(vec) 
 quat::Versor(*Quat, vec, 0.0)
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
 Multiply(Versor, VecAsQuat, Rotated) ; Versor * Point 
 Multiply(Rotated, ConjugatedVersor, Rotated) ; * Conj.Versor 
 
 ; downgrades the versor to vec3
 vec3::set(*RotatedVector, Rotated\q1, Rotated\q2, Rotated\q3)
EndProcedure

EndModule

CompilerIf #PB_Compiler_IsMainFile
EnableExplicit

Define.vec3::vec3 vec, p, rp
Define.quat::quat q

vec3::Set(p, 1.0, 2.0, 3.0)  ; starting point
vec3::Dump(p) ; (1.0, 2.0, 3.0) 

quat::Versor(q,vec,0)
vec4::Dump(q) ; rotated point (3.00, 2.00, -1.00)

quat::Identity(p) ; a null rotation 
vec4::Dump(p) ; (1.00, 0.00, 0.00, 0.00)

CompilerEndIf



; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 160
; FirstLine = 52
; Folding = ---
; Markers = 15
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory