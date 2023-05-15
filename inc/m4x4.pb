XIncludeFile "math.pb"
XIncludeFile "vec3.pb"
XIncludeFile "vec4.pb"

DeclareModule m4x4

EnableExplicit

; column major

; m[ 0] m[ 4] m[ 8] m[12]     m[Xx] m[Yx] m[Zx] m[Tx]
; m[ 1] m[ 5] m[ 9] m[13]  =  m[Xy] m[Yy] m[Zy] m[Ty]
; m[ 2] m[ 6] m[10] m[14]     m[Xz] m[Yz] m[Zz] m[Tz]
; m[ 3] m[ 7] m[11] m[15]     m[Xw] m[Yw] m[Zw] m[Tw]

Structure m4x4
 float.f[0]
 
 Xx.f ;  0
 Xy.f ;  1
 Xz.f ;  2
 Xw.f ;  3
 
 Yx.f ;  4
 Yy.f ;  5
 Yz.f ;  6
 Yw.f ;  7

 Zx.f ;  8
 Zy.f ;  9
 Zz.f ; 10
 Zw.f ; 11
 
 Tx.f ; 12
 Ty.f ; 13
 Tz.f ; 14
 Tw.f ; 15
EndStructure

Declare   SetRow0 (*Matrix.m4x4, Xx.f, Yx.f, Zx.f, Tx,f) ; Sets the row 0 of the matrix to the passed values.
Declare   SetRow1 (*Matrix.m4x4, Xy.f, Yy.f, Zy.f, Ty,f) ; Sets the row 1 of the matrix to the passed values.
Declare   SetRow2 (*Matrix.m4x4, Xz.f, Yz.f, Zz.f, Tz.f) ; Sets the row 2 of the matrix to the passed values.
Declare   SetRow3 (*Matrix.m4x4, Xw.f, Yw.f, Zw.f, Tw.f) ; Sets the row 3 of the matrix to the passed values.
Declare   Dump (*Matrix.m4x4, desc$ = "") ; Prints a string representation of Matrix.
Declare   Identity (*IdentityMatrix.m4x4) ; Sets the passed matrix to the identity matrix.
Declare   Zero (*ZeroMatrix.m4x4) ; Sets the passed matrix to the zero matrix.
Declare   Copy (*Matrix.m4x4, *DestinationMatrix.m4x4) ; Copies Matrix to DestinationMatrix.
Declare   Transpose (*Matrix.m4x4, *TransposedMatrix.m4x4) ; Transpose Matrix to TransposedMatrix.
Declare   Multiply (*MatrixA.m4x4, *MatrixB.m4x4, *MultipliedMatrix.m4x4) ; Multiplies MatrixA by MatrixB and store the result in MultipliedMatrix.
Declare   MultiplyByVec (*Matrix.m4x4, *Vector.vec4::vec4, *TransformedVector.vec4::vec4) ; Multiply Matrix by Vector and stores the result in TransformedVector.
Declare   Translate (*TranslatedMatrix.m4x4, *Vector.vec3::vec3) ; Translates the passed matrix by the specified Vector.
Declare   TranslateXYZ (*TranslatedMatrix.m4x4, x.f, y.f, z.f) ; Translates the passed matrix by the specified (x, y, z) components.
Declare   Scale (*ScaledMatrix.m4x4, *Vector.vec3::vec3) ; Scales the passed matrix by the specified Vector.
Declare   ScaleXYZ (*ScaledMatrix.m4x4, x.f, y.f, z.f) ; Scales the passed matrix by the specified (x, y, z) components.
Declare   RotateX (*RotatedMatrix.m4x4, angle.f) ; Rotates the passed matrix by the specified angle around the X axis.
Declare   RotateY (*RotatedMatrix.m4x4, angle.f) ; Rotates the passed matrix by the specified angle around the Y axis.
Declare   RotateZ (*RotatedMatrix.m4x4, angle.f) ; Rotates the passed matrix by the specified angle around the Z axis.
Declare   Perspective (*PerspectiveMatrix.m4x4, fovy.f, aspect.f, near.f, far.f) ; Sets the passed matrix to a perspective matrix.
Declare   Ortho (*OrthoMatrix.m4x4, left.f, right.f, bottom.f, top.f, near.f, far.f) ; Sets the passed matrix to a orthografic matrix.
Declare   LookAt (*ViewMatrix.m4x4, *eye.vec3::vec3, *target.vec3::vec3, *up.vec3::vec3) ; Sets the passed matrix to a view or camera matrix.

EndDeclareModule

Module m4x4

#ONE_DEG_IN_RAD = 2* #PI / 360
#ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 

Procedure SetRow0 (*Matrix.m4x4, Xx.f, Yx.f, Zx.f, Tx,f) 
;> Sets the row 0 of the matrix to the passed values.
 *Matrix\Xx = Xx
 *Matrix\Yx = Yx
 *Matrix\Zx = Zx
 *Matrix\Tx = Tx
EndProcedure

Procedure SetRow1 (*Matrix.m4x4, Xy.f, Yy.f, Zy.f, Ty,f) 
;> Sets the row 1 of the matrix to the passed values.
 *Matrix\Xy = Xy
 *Matrix\Yy = Yy
 *Matrix\Zy = Zy
 *Matrix\Ty = Ty
EndProcedure

Procedure SetRow2 (*Matrix.m4x4, Xz.f, Yz.f, Zz.f, Tz.f) 
;> Sets the row 2 of the matrix to the passed values.
 *Matrix\Xz = Xz
 *Matrix\Yz = Yz
 *Matrix\Zz = Zz
 *Matrix\Tz = Tz
EndProcedure

Procedure SetRow3 (*Matrix.m4x4, Xw.f, Yw.f, Zw.f, Tw.f) 
;> Sets the row 3 of the matrix to the passed values.
 *Matrix\Xw = Xw
 *Matrix\Yw = Yw
 *Matrix\Zw = Zw
 *Matrix\Tw = Tw
EndProcedure

Procedure Dump (*Matrix.m4x4, desc$ = "")
;> Prints a string representation of Matrix.
 
 Protected decimals = 2
 
 If desc$ <> #Empty$ : Debug desc$ : EndIf 
 
 Debug "(" + StrF(*Matrix\Xx, decimals) + ", " + StrF(*Matrix\Yx, decimals) + ", " + StrF(*Matrix\Zx, decimals) + ", " + StrF(*Matrix\Tx, decimals) + ")"
 Debug "(" + StrF(*Matrix\Xy, decimals) + ", " + StrF(*Matrix\Yy, decimals) + ", " + StrF(*Matrix\Zy, decimals) + ", " + StrF(*Matrix\Ty, decimals) + ")"
 Debug "(" + StrF(*Matrix\Xz, decimals) + ", " + StrF(*Matrix\Yz, decimals) + ", " + StrF(*Matrix\Zz, decimals) + ", " + StrF(*Matrix\Tz, decimals) + ")"
 Debug "(" + StrF(*Matrix\Xw, decimals) + ", " + StrF(*Matrix\Yw, decimals) + ", " + StrF(*Matrix\Zw, decimals) + ", " + StrF(*Matrix\Tw, decimals) + ")"
 Debug ""
EndProcedure

Procedure Identity (*IdentityMatrix.m4x4)
;> Sets the passed matrix to the identity matrix.

 *IdentityMatrix\float[0]  = 1.0
 *IdentityMatrix\float[1]  = 0.0
 *IdentityMatrix\float[2]  = 0.0
 *IdentityMatrix\float[3]  = 0.0
 
 *IdentityMatrix\float[4]  = 0.0
 *IdentityMatrix\float[5]  = 1.0
 *IdentityMatrix\float[6]  = 0.0
 *IdentityMatrix\float[7]  = 0.0

 *IdentityMatrix\float[8]  = 0.0
 *IdentityMatrix\float[9]  = 0.0
 *IdentityMatrix\float[10] = 1.0
 *IdentityMatrix\float[11] = 0.0

 *IdentityMatrix\float[12] = 0.0
 *IdentityMatrix\float[13] = 0.0
 *IdentityMatrix\float[14] = 0.0
 *IdentityMatrix\float[15] = 1.0
EndProcedure

Procedure Zero (*ZeroMatrix.m4x4)
;> Sets the passed matrix to the zero matrix.

 *ZeroMatrix\float[0]  = 0.0
 *ZeroMatrix\float[1]  = 0.0
 *ZeroMatrix\float[2]  = 0.0
 *ZeroMatrix\float[3]  = 0.0
 
 *ZeroMatrix\float[4]  = 0.0
 *ZeroMatrix\float[5]  = 0.0
 *ZeroMatrix\float[6]  = 0.0
 *ZeroMatrix\float[7]  = 0.0

 *ZeroMatrix\float[8]  = 0.0
 *ZeroMatrix\float[9]  = 0.0
 *ZeroMatrix\float[10] = 0.0
 *ZeroMatrix\float[11] = 0.0

 *ZeroMatrix\float[12] = 0.0
 *ZeroMatrix\float[13] = 0.0
 *ZeroMatrix\float[14] = 0.0
 *ZeroMatrix\float[15] = 0.0
EndProcedure

Procedure Copy (*Matrix.m4x4, *DestinationMatrix.m4x4)
;> Copies Matrix to DestinationMatrix.

 Protected i
 
 For i = 0 To 15
    *DestinationMatrix\float[i] = *Matrix\float[i]
 Next
EndProcedure

Procedure Transpose (*Matrix.m4x4, *TransposedMatrix.m4x4)
;> Transpose Matrix to TransposedMatrix.
; You can specify Matrix in place of TransposedMatrix.

 Protected.m4x4 TempMatrix, *m
 
 If *Matrix = *TransposedMatrix
    *m = @TempMatrix
 Else
    *m = *TransposedMatrix
 EndIf
 
 *m\float[0]  = *Matrix\float[0]
 *m\float[1]  = *Matrix\float[4]
 *m\float[2]  = *Matrix\float[8]
 *m\float[3]  = *Matrix\float[12]
 *m\float[4]  = *Matrix\float[1]
 *m\float[5]  = *Matrix\float[5]
 *m\float[6]  = *Matrix\float[9]
 *m\float[7]  = *Matrix\float[13]
 *m\float[8]  = *Matrix\float[2]
 *m\float[9]  = *Matrix\float[6]
 *m\float[10] = *Matrix\float[10]
 *m\float[11] = *Matrix\float[14]
 *m\float[12] = *Matrix\float[3]
 *m\float[13] = *Matrix\float[7]
 *m\float[14] = *Matrix\float[11]
 *m\float[15] = *Matrix\float[15]
 
 If *Matrix = *TransposedMatrix
    Copy(*m, *TransposedMatrix)
 EndIf

EndProcedure

Procedure Multiply (*MatrixA.m4x4, *MatrixB.m4x4, *MultipliedMatrix.m4x4)
;> Multiplies MatrixA by MatrixB and store the result in MultipliedMatrix.
; You can specify MatrixA or MatrixB in place of MultipliedMatrix.

 Protected.m4x4 TempMatrix, *m
 
 If *MatrixA = *MultipliedMatrix Or *MatrixB = *MultipliedMatrix 
    *m = @TempMatrix
 Else
    *m = *MultipliedMatrix
 EndIf
 
 *m\float[0]  = *MatrixA\float[0] * *MatrixB\float[0]  + *MatrixA\float[4] * *MatrixB\float[1]  + *MatrixA\float[8]  * *MatrixB\float[2]  + *MatrixA\float[12] * *MatrixB\float[3]
 *m\float[4]  = *MatrixA\float[0] * *MatrixB\float[4]  + *MatrixA\float[4] * *MatrixB\float[5]  + *MatrixA\float[8]  * *MatrixB\float[6]  + *MatrixA\float[12] * *MatrixB\float[7]
 *m\float[8]  = *MatrixA\float[0] * *MatrixB\float[8]  + *MatrixA\float[4] * *MatrixB\float[9]  + *MatrixA\float[8]  * *MatrixB\float[10] + *MatrixA\float[12] * *MatrixB\float[11]
 *m\float[12] = *MatrixA\float[0] * *MatrixB\float[12] + *MatrixA\float[4] * *MatrixB\float[13] + *MatrixA\float[8]  * *MatrixB\float[14] + *MatrixA\float[12] * *MatrixB\float[15]
 *m\float[1]  = *MatrixA\float[1] * *MatrixB\float[0]  + *MatrixA\float[5] * *MatrixB\float[1]  + *MatrixA\float[9]  * *MatrixB\float[2]  + *MatrixA\float[13] * *MatrixB\float[3]
 *m\float[5]  = *MatrixA\float[1] * *MatrixB\float[4]  + *MatrixA\float[5] * *MatrixB\float[5]  + *MatrixA\float[9]  * *MatrixB\float[6]  + *MatrixA\float[13] * *MatrixB\float[7]
 *m\float[9]  = *MatrixA\float[1] * *MatrixB\float[8]  + *MatrixA\float[5] * *MatrixB\float[9]  + *MatrixA\float[9]  * *MatrixB\float[10] + *MatrixA\float[13] * *MatrixB\float[11]
 *m\float[13] = *MatrixA\float[1] * *MatrixB\float[12] + *MatrixA\float[5] * *MatrixB\float[13] + *MatrixA\float[9]  * *MatrixB\float[14] + *MatrixA\float[13] * *MatrixB\float[15]
 *m\float[2]  = *MatrixA\float[2] * *MatrixB\float[0]  + *MatrixA\float[6] * *MatrixB\float[1]  + *MatrixA\float[10] * *MatrixB\float[2]  + *MatrixA\float[14] * *MatrixB\float[3]
 *m\float[6]  = *MatrixA\float[2] * *MatrixB\float[4]  + *MatrixA\float[6] * *MatrixB\float[5]  + *MatrixA\float[10] * *MatrixB\float[6]  + *MatrixA\float[14] * *MatrixB\float[7]
 *m\float[10] = *MatrixA\float[2] * *MatrixB\float[8]  + *MatrixA\float[6] * *MatrixB\float[9]  + *MatrixA\float[10] * *MatrixB\float[10] + *MatrixA\float[14] * *MatrixB\float[11]
 *m\float[14] = *MatrixA\float[2] * *MatrixB\float[12] + *MatrixA\float[6] * *MatrixB\float[13] + *MatrixA\float[10] * *MatrixB\float[14] + *MatrixA\float[14] * *MatrixB\float[15]
 *m\float[3]  = *MatrixA\float[3] * *MatrixB\float[0]  + *MatrixA\float[7] * *MatrixB\float[1]  + *MatrixA\float[11] * *MatrixB\float[2]  + *MatrixA\float[15] * *MatrixB\float[3]
 *m\float[7]  = *MatrixA\float[3] * *MatrixB\float[4]  + *MatrixA\float[7] * *MatrixB\float[5]  + *MatrixA\float[11] * *MatrixB\float[6]  + *MatrixA\float[15] * *MatrixB\float[7]
 *m\float[11] = *MatrixA\float[3] * *MatrixB\float[8]  + *MatrixA\float[7] * *MatrixB\float[9]  + *MatrixA\float[11] * *MatrixB\float[10] + *MatrixA\float[15] * *MatrixB\float[11]
 *m\float[15] = *MatrixA\float[3] * *MatrixB\float[12] + *MatrixA\float[7] * *MatrixB\float[13] + *MatrixA\float[11] * *MatrixB\float[14] + *MatrixA\float[15] * *MatrixB\float[15]     

 If *MatrixA = *MultipliedMatrix Or *MatrixB = *MultipliedMatrix 
    Copy(*m, *MultipliedMatrix)
 EndIf
EndProcedure

Procedure MultiplyByVec (*Matrix.m4x4, *Vector.vec4::vec4, *TransformedVector.vec4::vec4)
;> Multiply Matrix by Vector and stores the result in TransformedVector.
; You can specify Vector in place of TransformedVector.

 Protected.vec4::vec4 TempVector, *v

 If *Vector = *TransformedVector
    *v = @TempVector
 Else
    *v = *TransformedVector
 EndIf
 
 *v\x = *Matrix\float[0] * *Vector\float[0] + *Matrix\float[4] * *Vector\float[1] + *Matrix\float[8]  * *Vector\float[2] + *Matrix\float[12] * *Vector\float[3]
 *v\y = *Matrix\float[1] * *Vector\float[0] + *Matrix\float[5] * *Vector\float[1] + *Matrix\float[9]  * *Vector\float[2] + *Matrix\float[13] * *Vector\float[3]
 *v\z = *Matrix\float[2] * *Vector\float[0] + *Matrix\float[6] * *Vector\float[1] + *Matrix\float[10] * *Vector\float[2] + *Matrix\float[14] * *Vector\float[3]
 *v\w = *Matrix\float[3] * *Vector\float[0] + *Matrix\float[7] * *Vector\float[1] + *Matrix\float[11] * *Vector\float[2] + *Matrix\float[15] * *Vector\float[3]
 
 If *Vector = *TransformedVector
    vec4::Copy(*v, *TransformedVector)
 EndIf
EndProcedure

Procedure Translate (*TranslatedMatrix.m4x4, *Vector.vec3::vec3)
;> Translates the passed matrix by the specified Vector.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 
 Identity(TempMatrix)
 
 TempMatrix\float[12] = *Vector\x
 TempMatrix\float[13] = *Vector\y
 TempMatrix\float[14] = *Vector\z

 Multiply(*TranslatedMatrix, TempMatrix, *TranslatedMatrix)
EndProcedure

Procedure TranslateXYZ (*TranslatedMatrix.m4x4, x.f, y.f, z.f)
;> Translates the passed matrix by the specified (x, y, z) components.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 
 Identity(TempMatrix)
 
 TempMatrix\float[12] = x
 TempMatrix\float[13] = y
 TempMatrix\float[14] = z

 Multiply(*TranslatedMatrix, TempMatrix, *TranslatedMatrix)
EndProcedure

Procedure Scale (*ScaledMatrix.m4x4, *Vector.vec3::vec3)
;> Scales the passed matrix by the specified Vector.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 
 Identity(TempMatrix)
 
 TempMatrix\float[0]  = *Vector\x
 TempMatrix\float[5]  = *Vector\y
 TempMatrix\float[10] = *Vector\z

 Multiply(*ScaledMatrix, TempMatrix, *ScaledMatrix)
EndProcedure

Procedure ScaleXYZ (*ScaledMatrix.m4x4, x.f, y.f, z.f)
;> Scales the passed matrix by the specified (x, y, z) components.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 
 Identity(TempMatrix)
 
 TempMatrix\float[0]  = x
 TempMatrix\float[5]  = y
 TempMatrix\float[10] = z

 Multiply(*ScaledMatrix, TempMatrix, *ScaledMatrix)
EndProcedure

Procedure RotateX (*RotatedMatrix.m4x4, angle.f)
;> Rotates the passed matrix by the specified angle around the X axis.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 Protected rad.f = angle * #ONE_DEG_IN_RAD
 Protected sine.f = Sin(rad)
 Protected cosine.f = Cos(rad)
 
 Identity(TempMatrix)
 
 TempMatrix\float[5]  =  cosine
 TempMatrix\float[6]  = -sine
 TempMatrix\float[9]  =  sine
 TempMatrix\float[10] =  cosine
  
 Multiply(*RotatedMatrix, TempMatrix, *RotatedMatrix)
 EndProcedure

Procedure RotateY (*RotatedMatrix.m4x4, angle.f)
;> Rotates the passed matrix by the specified angle around the Y axis.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 Protected rad.f = angle * #ONE_DEG_IN_RAD
 Protected sine.f = Sin(rad)
 Protected cosine.f = Cos(rad)
 
 Identity(TempMatrix)
 
 TempMatrix\float[0]  =  cosine
 TempMatrix\float[2]  =  sine
 TempMatrix\float[8]  = -sine
 TempMatrix\float[10] =  cosine
  
 Multiply(*RotatedMatrix, TempMatrix, *RotatedMatrix)
 EndProcedure

Procedure RotateZ (*RotatedMatrix.m4x4, angle.f)
;> Rotates the passed matrix by the specified angle around the Z axis.
; The original matrix is modified.

 Protected.m4x4 TempMatrix
 Protected rad.f = angle * #ONE_DEG_IN_RAD
 Protected sine.f = Sin(rad)
 Protected cosine.f = Cos(rad)
 
 Identity(TempMatrix)
 
 TempMatrix\float[0]  =  cosine
 TempMatrix\float[1]  = -sine
 TempMatrix\float[4]  =  sine
 TempMatrix\float[5]  =  cosine
  
 Multiply(*RotatedMatrix, TempMatrix, *RotatedMatrix)
 EndProcedure

Procedure Perspective (*PerspectiveMatrix.m4x4, fovy.f, aspect.f, near.f, far.f) 
;> Sets the passed matrix to a perspective matrix.
; The original matrix is modified.

; fovy : field of view along the Y axis
; aspect : aspect ratio to be used (usually width / height of the window)
; near : distance to the near clipping plane
; far : distance to the far clipping plane

 Protected inverseRange.f 

 Zero(*PerspectiveMatrix)

 inverseRange = 1.0 / Tan((fovy * #ONE_DEG_IN_RAD) / 2.0)

 *PerspectiveMatrix\float[0]  = inverseRange / aspect
 *PerspectiveMatrix\float[5]  = inverseRange
 *PerspectiveMatrix\float[10] = - (far + near) / (far - near)
 *PerspectiveMatrix\float[14] = - (2.0 * far * near) / (far - near)
 *PerspectiveMatrix\float[11] = -1.0 
EndProcedure

Procedure Ortho (*OrthoMatrix.m4x4, left.f, right.f, bottom.f, top.f, near.f, far.f)
;> Sets the passed matrix to a orthografic matrix.
; The original matrix is modified

; left, right, bottom, top : coordinates of the vertical clipping plane.
; near : distance to the near clipping plane
; far : distance to the far clipping plane

 Zero(*OrthoMatrix)
 
 *OrthoMatrix\float[0]  =  2.0 / (right - left) 
 *OrthoMatrix\float[5]  =  2.0 / (top - bottom) 
 *OrthoMatrix\float[10] = -2.0 / (far - near)
 
 *OrthoMatrix\float[12] = -((right + left) / (right - left)) 
 *OrthoMatrix\float[13] = -((top + bottom) / (top - bottom)) 
 *OrthoMatrix\float[14] = -((far + near) / (far - near)) 
 *OrthoMatrix\float[15] = 1.0    
EndProcedure

Procedure LookAt (*ViewMatrix.m4x4, *eye.vec3::vec3, *target.vec3::vec3, *up.vec3::vec3)
;> Sets the passed matrix to a view or camera matrix.
; The original matrix is modified

; eye : a vector representing the camera position
; target : a vector representing the direction the camera is pointing to
; up : a vector representing the up direction

; https://www.geertarien.com/blog/2017/07/30/breakdown-of-the-lookAt-function-in-OpenGL/

 Protected.vec3::vec3 forward, right
 Protected.vec3::vec3 xaxis, yaxis, zaxis
 
 Zero(*ViewMatrix)
 
 ; zaxis
 vec3::sub(*target, *eye, forward)
 vec3::Normalize(forward, zaxis)
  
 ; xaxis
 vec3::CrossProduct(zaxis, *up, right)
 vec3::Normalize(right, xaxis)
 
 ; yaxis
 vec3::CrossProduct(xaxis, zaxis, yaxis)
 
 vec3::Negate(zaxis, zaxis)
 
 *ViewMatrix\Xx = xaxis\x
 *ViewMatrix\Yx = xaxis\y
 *ViewMatrix\Zx = xaxis\z
 
 *ViewMatrix\Xy = yaxis\x
 *ViewMatrix\Yy = yaxis\y
 *ViewMatrix\Zy = yaxis\z
 
 *ViewMatrix\Xz = zaxis\x
 *ViewMatrix\Yz = zaxis\y
 *ViewMatrix\Zz = zaxis\z
 
 *ViewMatrix\Tx = - vec3::DotProduct(xaxis, *eye)
 *ViewMatrix\Ty = - vec3::DotProduct(yaxis, *eye)
 *ViewMatrix\Tz = - vec3::DotProduct(zaxis, *eye)

 *ViewMatrix\Tw = 1.0
EndProcedure

EndModule

CompilerIf #PB_Compiler_IsMainFile
EnableExplicit

Define.m4x4::m4x4 ma, mb

m4x4::Identity(ma)
m4x4::TranslateXYZ(ma, 1.0, 2.0, 3.0)
m4x4::ScaleXYZ(ma, 1.1, 1.2, 1.3)
m4x4::Dump(ma)
; (1.10, 0.00, 0.00, 1.00)
; (0.00, 1.20, 0.00, 2.00)
; (0.00, 0.00, 1.30, 3.00)
; (0.00, 0.00, 0.00, 1.00)

Define.vec4::vec4 va

vec4::Set(va, 1.0, 0.0, 0.0, 1.0)
m4x4::Identity(ma)
m4x4::Translatexyz(ma, 1.0, 1.0, 0.0)
m4x4::MultiplyByVec(ma, va, va)
vec4::Dump(va)
; T(2.00, 1.00, 0.00, 1.00)
CompilerEndIf



; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 60
; FirstLine = 38
; Folding = -----
; Markers = 39
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory