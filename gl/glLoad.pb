; *********************************************************************************************************************
; glLoad.pb
; by Luis
;
; OpenGL functions importer up to version 4.6.
; This include takes care of importing and binding OpenGL functions to write programs for both legacy and modern OpenGL 
; with core or compatible profiles. 
;
; Must be used in conjunction of gl.pbi (where the symbols and constants are defined).
;
; Tested on: Windows / Linux
;
; 1.11, Jun 11 2023, PB 6.02
; Added GetErrCode()
;
; 1.10, Apr 12 2023, PB 6.01
; Splitted from gl.pbi in its own module to be usable with glLoad::Load()

; 1.02, Nov 16 2021, PB 5.73
; Some refactoring.
;
; 1.01, Jun 22 2018, PB 5.62
; Updated for OpenGL 4.60
;
; 1.00, Apr 18 2017, PB 5.60
; First release.
;
; After calling glLoad::Load() all the OpenGL functions up to the version of the current OpenGL context are ready to be used.
; If the context is a COMPATIBLE context or an older tupe of context the deprecated functions are also included.
; If the context is a FORWARD COMPATIBLE context or a CORE context the deprecated functions are not included.
;
; To make possible to use this module with any OpenGL framework, you need to register the address of a helper function you want to use to 
; retrieve the OpenGL functions addresses. 
; In other words you have to implemente a callback containing the equivalent of the wglGetProcAddress_() avaliable in Windows.
;
; Reasons why glLoad::Load() may fail:
;
;  * There is a typo in some imported function name.
;    Check if one of the enumerated procedure address is zero. 
;
;  * The helper's function pointer you registered is null or not registered.
;    Register a valid helper function.
;
; *********************************************************************************************************************

XIncludeFile "gl.pbi"

DeclareModule glLoad
Declare     GetContextVersion (*major, *minor) ; Gets the version of the current OpenGL context.
Declare.i   Deprecated() ; Returns 1 if deprecated functions are included in the current OpenGL context.
Declare     GetProcsCount (*ImportedProcsCount.Integer, *MissingProcsCount.Integer) ; Gets the number of the successfully imported and/or missing OpenGL functions loaded with glLoad::Load()
Declare.s   GetErrString() ; Returns a descriptive error string if the return value of glLoad::Load() is zero.
Declare.i   GetErrCode() ; Returns a code specifying the type of error
Declare     RegisterCallBack (type, *fp) ; Registers the callback for GetProcAddress or EnumFuncs.
Declare.i   Load() ; Imports all the OpenGL functions included in the current OpenGL context.

Prototype.i  Proto_GetProcAddress (func$)
Prototype.i  Proto_EnumerateProcs (glver$, func$, *func)

#CallBack_GetProcAddress = 0
#CallBack_EnumFuncs      = 1   

#Error_OK                 = 0
#Error_GetProcAddress     = 1
#Error_MissingEntryPoints = 2

EndDeclareModule

Module glLoad

EnableExplicit

UseModule gl

Declare.i   GPA (func$)
Declare     ClearGlErrors()

; Up to OpenGL 4.6 
#MAX_OPENGL_SUPPORTED = 460
 
Structure GLLOAD_OBJ
 glver$
 ErrMsg$
 ErrCode.i
 MissingProcsCount.i
 ImportedProcsCount.i
 CallBack_GetProcAddress.Proto_GetProcAddress
 CallBack_EnumerateProcs.Proto_EnumerateProcs
EndStructure : Global GLLOAD.GLLOAD_OBJ

;- Private functions
  
Procedure.i GPA (func$) ; get address from the name of the func
 Protected *fp = GLLOAD\CallBack_GetProcAddress(func$)
 
 If *fp = 0
    GLLOAD\MissingProcsCount + 1    
 Else
    GLLOAD\ImportedProcsCount + 1
 EndIf
 
 If GLLOAD\CallBack_EnumerateProcs
    GLLOAD\CallBack_EnumerateProcs(GLLOAD\glver$, func$, *fp)
 EndIf
 
 ProcedureReturn *fp
EndProcedure

Procedure ClearGlErrors()
;> Clears any pending OpenGL error status for glGetError().

 Protected glerr
 Protected safe_bailout = 255
 
 Repeat
    glerr = glGetError_()
    safe_bailout - 1
 Until (glerr = #GL_NO_ERROR) Or (safe_bailout = 0)
 
 If glerr <> #GL_NO_ERROR
    DebuggerError("glGetError() inside an infinite loop (no current context ?)")    
 EndIf    
EndProcedure

;- Public functions 

Procedure GetContextVersion (*major, *minor)
;> Gets the version of the current OpenGL context.
 Protected maj, min, ret
 Protected ver$, *buf
 
 ClearGlErrors()
 
 glGetIntegerv_(#GL_MAJOR_VERSION, @maj) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
 glGetIntegerv_(#GL_MINOR_VERSION, @min) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf

 PokeI(*major, maj)
 PokeI(*minor, min)
 
 ProcedureReturn 
  
 fallback:
 
 *buf = glGetString_(#GL_VERSION)
 
 If *buf 
    ver$ = PeekS(glGetString_(#GL_VERSION), -1, #PB_Ascii)
 
     If glGetError_() = #GL_NO_ERROR
        maj = Val(StringField(ver$, 1, "."))
        min = Val(StringField(ver$, 2, "."))
     
        PokeI(*major, maj)
        PokeI(*minor, min) 
     EndIf
          
     ProcedureReturn 
 EndIf
EndProcedure

Procedure.i Deprecated()
;> Returns 1 if deprecated functions are included in the current OpenGL context.

 Protected mask, flags
 
 ClearGlErrors()
 
 glGetIntegerv_(#GL_CONTEXT_FLAGS, @flags)
 
 If glGetError_() <> #GL_NO_ERROR
    ProcedureReturn 1 ; we have and old context, so legacy functions are here
 EndIf
 
 If (flags & #GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT)
    ProcedureReturn 0 ; we have a forward compatible context, so legacy functions are deprecated
 EndIf
 
 glGetIntegerv_(#GL_CONTEXT_PROFILE_MASK, @mask) 
 
 If glGetError_() <> #GL_NO_ERROR
    ProcedureReturn 1 ; we have a context < 3.20 but not forward compatible, so legacy functions are here
 EndIf
 
 If (mask & #GL_CONTEXT_CORE_PROFILE_BIT)
    ProcedureReturn 0 ; we have a modern core context, so legacy functions are deprecated
 Else
    ProcedureReturn 1 ; we have modern compatible context, so legacy functions are here
 EndIf
EndProcedure

Procedure GetProcsCount (*ImportedProcsCount.Integer, *MissingProcsCount.Integer)
;> Gets the number of the successfully imported and/or missing OpenGL functions loaded with glLoad::Load()
 *ImportedProcsCount\i = GLLOAD\ImportedProcsCount
 *MissingProcsCount\i = GLLOAD\MissingProcsCount
EndProcedure

Procedure.s GetErrString()
;> Returns a descriptive error string if the return value of glLoad::Load() is zero.

 ProcedureReturn GLLOAD\ErrMsg$
EndProcedure

Procedure.i GetErrCode()
;> Returns a code specifying the type of error

 ProcedureReturn GLLOAD\ErrCode
EndProcedure

Procedure RegisterCallBack (type, *fp)
;> Registers the callback for GetProcAddress or EnumFuncs.
 Select type
    Case #CallBack_GetProcAddress
        GLLOAD\CallBack_GetProcAddress = *fp
    Case #CallBack_EnumFuncs
        GLLOAD\CallBack_EnumerateProcs = *fp
 EndSelect
EndProcedure

Procedure.i Load()
;> Imports all the OpenGL functions included in the current OpenGL context.
 Protected Major, Minor, Deprecated, glVer
 
 GetContextVersion (@Major, @Minor)
 
 glVer = Major * 100 + Minor * 10
 
 If glVer > #MAX_OPENGL_SUPPORTED
    glVer = #MAX_OPENGL_SUPPORTED
    DebuggerWarning("This module support OpenGL up to version " + #MAX_OPENGL_SUPPORTED)   
 EndIf
 
 Deprecated = Deprecated()

 If GLLOAD\CallBack_GetProcAddress = 0
    GLLOAD\ErrMsg$ = "A valid GetProcAddress() function has not been registered."  
    GLLOAD\ErrCode = #Error_GetProcAddress
    DebuggerError(GLLOAD\ErrMsg$)
    ProcedureReturn 0
 EndIf

 If glVer >= 120
    ;- BIND 1.2   
    GLLOAD\glver$ = "120"
    glDrawRangeElements_ = GPA("glDrawRangeElements")
    glTexImage3D_ = GPA("glTexImage3D")
    glTexSubImage3D_ = GPA("glTexSubImage3D")
    glCopyTexSubImage3D_ = GPA("glCopyTexSubImage3D")
 EndIf
 
 If glVer >= 130
    ;- BIND 1.3   
    GLLOAD\glver$ = "130"
    glActiveTexture_ = GPA("glActiveTexture")
    glSampleCoverage_ = GPA("glSampleCoverage")
    glCompressedTexImage3D_ = GPA("glCompressedTexImage3D")
    glCompressedTexImage2D_ = GPA("glCompressedTexImage2D")
    glCompressedTexImage1D_ = GPA("glCompressedTexImage1D")
    glCompressedTexSubImage3D_ = GPA("glCompressedTexSubImage3D")
    glCompressedTexSubImage2D_ = GPA("glCompressedTexSubImage2D")
    glCompressedTexSubImage1D_ = GPA("glCompressedTexSubImage1D")
    glGetCompressedTexImage_ = GPA("glGetCompressedTexImage")
 
    ;- BIND 1.3 LEGACY
    If Deprecated
        GLLOAD\glver$ = "130*"
        glClientActiveTexture_ = GPA("glClientActiveTexture")
        glMultiTexCoord1d_ = GPA("glMultiTexCoord1d")
        glMultiTexCoord1dv_ = GPA("glMultiTexCoord1dv")
        glMultiTexCoord1f_ = GPA("glMultiTexCoord1f")
        glMultiTexCoord1fv_ = GPA("glMultiTexCoord1fv")
        glMultiTexCoord1i_ = GPA("glMultiTexCoord1i")
        glMultiTexCoord1iv_ = GPA("glMultiTexCoord1iv")
        glMultiTexCoord1s_ = GPA("glMultiTexCoord1s")
        glMultiTexCoord1sv_ = GPA("glMultiTexCoord1sv")
        glMultiTexCoord2d_ = GPA("glMultiTexCoord2d")
        glMultiTexCoord2dv_ = GPA("glMultiTexCoord2dv")
        glMultiTexCoord2f_ = GPA("glMultiTexCoord2f")
        glMultiTexCoord2fv_ = GPA("glMultiTexCoord2fv")
        glMultiTexCoord2i_ = GPA("glMultiTexCoord2i")
        glMultiTexCoord2iv_ = GPA("glMultiTexCoord2iv")
        glMultiTexCoord2s_ = GPA("glMultiTexCoord2s")
        glMultiTexCoord2sv_ = GPA("glMultiTexCoord2sv")
        glMultiTexCoord3d_ = GPA("glMultiTexCoord3d")
        glMultiTexCoord3dv_ = GPA("glMultiTexCoord3dv")
        glMultiTexCoord3f_ = GPA("glMultiTexCoord3f")
        glMultiTexCoord3fv_ = GPA("glMultiTexCoord3fv")
        glMultiTexCoord3i_ = GPA("glMultiTexCoord3i")
        glMultiTexCoord3iv_ = GPA("glMultiTexCoord3iv")
        glMultiTexCoord3s_ = GPA("glMultiTexCoord3s")
        glMultiTexCoord3sv_ = GPA("glMultiTexCoord3sv")
        glMultiTexCoord4d_ = GPA("glMultiTexCoord4d")
        glMultiTexCoord4dv_ = GPA("glMultiTexCoord4dv")
        glMultiTexCoord4f_ = GPA("glMultiTexCoord4f")
        glMultiTexCoord4fv_ = GPA("glMultiTexCoord4fv")
        glMultiTexCoord4i_ = GPA("glMultiTexCoord4i")
        glMultiTexCoord4iv_ = GPA("glMultiTexCoord4iv")
        glMultiTexCoord4s_ = GPA("glMultiTexCoord4s")
        glMultiTexCoord4sv_ = GPA("glMultiTexCoord4sv")
        glLoadTransposeMatrixf_ = GPA("glLoadTransposeMatrixf")
        glLoadTransposeMatrixd_ = GPA("glLoadTransposeMatrixd")
        glMultTransposeMatrixf_ = GPA("glMultTransposeMatrixf")
        glMultTransposeMatrixd_ = GPA("glMultTransposeMatrixd")        
    EndIf
 EndIf
 
 If glVer >= 140
    ;- BIND 1.4    
    GLLOAD\glver$ = "140"
    glBlendFuncSeparate_ = GPA("glBlendFuncSeparate")
    glMultiDrawArrays_ = GPA("glMultiDrawArrays")
    glMultiDrawElements_ = GPA("glMultiDrawElements")
    glPointParameterf_ = GPA("glPointParameterf")
    glPointParameterfv_ = GPA("glPointParameterfv")
    glPointParameteri_ = GPA("glPointParameteri")
    glPointParameteriv_ = GPA("glPointParameteriv")
    glBlendColor_ = GPA("glBlendColor")
    glBlendEquation_ = GPA("glBlendEquation")

    ;- BIND 1.4 LEGACY
    If Deprecated
        GLLOAD\glver$ = "140*"
        glFogCoordf_ = GPA("glFogCoordf")
        glFogCoordfv_ = GPA("glFogCoordfv")
        glFogCoordd_ = GPA("glFogCoordd")
        glFogCoorddv_ = GPA("glFogCoorddv")
        glFogCoordPointer_ = GPA("glFogCoordPointer")
        glSecondaryColor3b_ = GPA("glSecondaryColor3b")
        glSecondaryColor3bv_ = GPA("glSecondaryColor3bv")
        glSecondaryColor3d_ = GPA("glSecondaryColor3d")
        glSecondaryColor3dv_ = GPA("glSecondaryColor3dv")
        glSecondaryColor3f_ = GPA("glSecondaryColor3f")
        glSecondaryColor3fv_ = GPA("glSecondaryColor3fv")
        glSecondaryColor3i_ = GPA("glSecondaryColor3i")
        glSecondaryColor3iv_ = GPA("glSecondaryColor3iv")
        glSecondaryColor3s_ = GPA("glSecondaryColor3s")
        glSecondaryColor3sv_ = GPA("glSecondaryColor3sv")
        glSecondaryColor3ub_ = GPA("glSecondaryColor3ub")
        glSecondaryColor3ubv_ = GPA("glSecondaryColor3ubv")
        glSecondaryColor3ui_ = GPA("glSecondaryColor3ui")
        glSecondaryColor3uiv_ = GPA("glSecondaryColor3uiv")
        glSecondaryColor3us_ = GPA("glSecondaryColor3us")
        glSecondaryColor3usv_ = GPA("glSecondaryColor3usv")
        glSecondaryColorPointer_ = GPA("glSecondaryColorPointer")
        glWindowPos2d_ = GPA("glWindowPos2d")
        glWindowPos2dv_ = GPA("glWindowPos2dv")
        glWindowPos2f_ = GPA("glWindowPos2f")
        glWindowPos2fv_ = GPA("glWindowPos2fv")
        glWindowPos2i_ = GPA("glWindowPos2i")
        glWindowPos2iv_ = GPA("glWindowPos2iv")
        glWindowPos2s_ = GPA("glWindowPos2s")
        glWindowPos2sv_ = GPA("glWindowPos2sv")
        glWindowPos3d_ = GPA("glWindowPos3d")
        glWindowPos3dv_ = GPA("glWindowPos3dv")
        glWindowPos3f_ = GPA("glWindowPos3f")
        glWindowPos3fv_ = GPA("glWindowPos3fv")
        glWindowPos3i_ = GPA("glWindowPos3i")
        glWindowPos3iv_ = GPA("glWindowPos3iv")
        glWindowPos3s_ = GPA("glWindowPos3s")
        glWindowPos3sv_ = GPA("glWindowPos3sv")    
    EndIf
 EndIf
 
 If glVer >= 150
    ;- BIND 1.5
    GLLOAD\glver$ = "150"
    glGenQueries_ = GPA("glGenQueries")
    glDeleteQueries_ = GPA("glDeleteQueries")
    glIsQuery_ = GPA("glIsQuery")
    glBeginQuery_ = GPA("glBeginQuery")
    glEndQuery_ = GPA("glEndQuery")
    glGetQueryiv_ = GPA("glGetQueryiv")
    glGetQueryObjectiv_ = GPA("glGetQueryObjectiv")
    glGetQueryObjectuiv_ = GPA("glGetQueryObjectuiv")
    glBindBuffer_ = GPA("glBindBuffer")
    glDeleteBuffers_ = GPA("glDeleteBuffers")
    glGenBuffers_ = GPA("glGenBuffers")
    glIsBuffer_ = GPA("glIsBuffer")
    glBufferdata_ = GPA("glBufferData")
    glBufferSubdata_ = GPA("glBufferSubData")
    glGetBufferSubdata_ = GPA("glGetBufferSubData")
    glMapBuffer_ = GPA("glMapBuffer")
    glUnmapBuffer_ = GPA("glUnmapBuffer")
    glGetBufferParameteriv_ = GPA("glGetBufferParameteriv")
    glGetBufferPointerv_ = GPA("glGetBufferPointerv")
 EndIf
 
 If glVer >= 200
    ;- BIND 2.0   
    GLLOAD\glver$ = "200"
    glBlendEquationSeparate_ = GPA("glBlendEquationSeparate")
    glDrawBuffers_ = GPA("glDrawBuffers")
    glStencilOpSeparate_ = GPA("glStencilOpSeparate")
    glStencilFuncSeparate_ = GPA("glStencilFuncSeparate")
    glStencilMaskSeparate_ = GPA("glStencilMaskSeparate")
    glAttachShader_ = GPA("glAttachShader")
    glBindAttribLocation_ = GPA("glBindAttribLocation")
    glCompileShader_ = GPA("glCompileShader")
    glCreateProgram_ = GPA("glCreateProgram")
    glCreateShader_ = GPA("glCreateShader")
    glDeleteProgram_ = GPA("glDeleteProgram")
    glDeleteShader_ = GPA("glDeleteShader")
    glDetachShader_ = GPA("glDetachShader")
    glDisableVertexAttribArray_ = GPA("glDisableVertexAttribArray")
    glEnableVertexAttribArray_ = GPA("glEnableVertexAttribArray")
    glGetActiveAttrib_ = GPA("glGetActiveAttrib")
    glGetActiveUniform_ = GPA("glGetActiveUniform")
    glGetAttachedShaders_ = GPA("glGetAttachedShaders")
    glGetAttribLocation_ = GPA("glGetAttribLocation")
    glGetProgramiv_ = GPA("glGetProgramiv")
    glGetProgramInfoLog_ = GPA("glGetProgramInfoLog")
    glGetShaderiv_ = GPA("glGetShaderiv")
    glGetShaderInfoLog_ = GPA("glGetShaderInfoLog")
    glGetShaderSource_ = GPA("glGetShaderSource")
    glGetUniformLocation_ = GPA("glGetUniformLocation")
    glGetUniformfv_ = GPA("glGetUniformfv")
    glGetUniformiv_ = GPA("glGetUniformiv")
    glGetVertexAttribdv_ = GPA("glGetVertexAttribdv")
    glGetVertexAttribfv_ = GPA("glGetVertexAttribfv")
    glGetVertexAttribiv_ = GPA("glGetVertexAttribiv")
    glGetVertexAttribPointerv_ = GPA("glGetVertexAttribPointerv")
    glIsProgram_ = GPA("glIsProgram")
    glIsShader_ = GPA("glIsShader")
    glLinkProgram_ = GPA("glLinkProgram")
    glShaderSource_ = GPA("glShaderSource")
    glUseProgram_ = GPA("glUseProgram")
    glUniform1f_ = GPA("glUniform1f")
    glUniform2f_ = GPA("glUniform2f")
    glUniform3f_ = GPA("glUniform3f")
    glUniform4f_ = GPA("glUniform4f")
    glUniform1i_ = GPA("glUniform1i")
    glUniform2i_ = GPA("glUniform2i")
    glUniform3i_ = GPA("glUniform3i")
    glUniform4i_ = GPA("glUniform4i")
    glUniform1fv_ = GPA("glUniform1fv")
    glUniform2fv_ = GPA("glUniform2fv")
    glUniform3fv_ = GPA("glUniform3fv")
    glUniform4fv_ = GPA("glUniform4fv")
    glUniform1iv_ = GPA("glUniform1iv")
    glUniform2iv_ = GPA("glUniform2iv")
    glUniform3iv_ = GPA("glUniform3iv")
    glUniform4iv_ = GPA("glUniform4iv")
    glUniformMatrix2fv_ = GPA("glUniformMatrix2fv")
    glUniformMatrix3fv_ = GPA("glUniformMatrix3fv")
    glUniformMatrix4fv_ = GPA("glUniformMatrix4fv")
    glValidateProgram_ = GPA("glValidateProgram")
    glVertexAttrib1d_ = GPA("glVertexAttrib1d")
    glVertexAttrib1dv_ = GPA("glVertexAttrib1dv")
    glVertexAttrib1f_ = GPA("glVertexAttrib1f")
    glVertexAttrib1fv_ = GPA("glVertexAttrib1fv")
    glVertexAttrib1s_ = GPA("glVertexAttrib1s")
    glVertexAttrib1sv_ = GPA("glVertexAttrib1sv")
    glVertexAttrib2d_ = GPA("glVertexAttrib2d")
    glVertexAttrib2dv_ = GPA("glVertexAttrib2dv")
    glVertexAttrib2f_ = GPA("glVertexAttrib2f")
    glVertexAttrib2fv_ = GPA("glVertexAttrib2fv")
    glVertexAttrib2s_ = GPA("glVertexAttrib2s")
    glVertexAttrib2sv_ = GPA("glVertexAttrib2sv")
    glVertexAttrib3d_ = GPA("glVertexAttrib3d")
    glVertexAttrib3dv_ = GPA("glVertexAttrib3dv")
    glVertexAttrib3f_ = GPA("glVertexAttrib3f")
    glVertexAttrib3fv_ = GPA("glVertexAttrib3fv")
    glVertexAttrib3s_ = GPA("glVertexAttrib3s")
    glVertexAttrib3sv_ = GPA("glVertexAttrib3sv")
    glVertexAttrib4Nbv_ = GPA("glVertexAttrib4Nbv")
    glVertexAttrib4Niv_ = GPA("glVertexAttrib4Niv")
    glVertexAttrib4Nsv_ = GPA("glVertexAttrib4Nsv")
    glVertexAttrib4Nub_ = GPA("glVertexAttrib4Nub")
    glVertexAttrib4Nubv_ = GPA("glVertexAttrib4Nubv")
    glVertexAttrib4Nuiv_ = GPA("glVertexAttrib4Nuiv")
    glVertexAttrib4Nusv_ = GPA("glVertexAttrib4Nusv")
    glVertexAttrib4bv_ = GPA("glVertexAttrib4bv")
    glVertexAttrib4d_ = GPA("glVertexAttrib4d")
    glVertexAttrib4dv_ = GPA("glVertexAttrib4dv")
    glVertexAttrib4f_ = GPA("glVertexAttrib4f")
    glVertexAttrib4fv_ = GPA("glVertexAttrib4fv")
    glVertexAttrib4iv_ = GPA("glVertexAttrib4iv")
    glVertexAttrib4s_ = GPA("glVertexAttrib4s")
    glVertexAttrib4sv_ = GPA("glVertexAttrib4sv")
    glVertexAttrib4ubv_ = GPA("glVertexAttrib4ubv")
    glVertexAttrib4uiv_ = GPA("glVertexAttrib4uiv")
    glVertexAttrib4usv_ = GPA("glVertexAttrib4usv")
    glVertexAttribPointer_ = GPA("glVertexAttribPointer")
 EndIf
 
 If glVer >= 210
    ;- BIND 2.1
    GLLOAD\glver$ = "210"
    glUniformMatrix2x3fv_ = GPA("glUniformMatrix2x3fv")
    glUniformMatrix3x2fv_ = GPA("glUniformMatrix3x2fv")
    glUniformMatrix2x4fv_ = GPA("glUniformMatrix2x4fv")
    glUniformMatrix4x2fv_ = GPA("glUniformMatrix4x2fv")
    glUniformMatrix3x4fv_ = GPA("glUniformMatrix3x4fv")
    glUniformMatrix4x3fv_ = GPA("glUniformMatrix4x3fv")
 EndIf 

 If glVer >= 300
    ;- BIND 3.0
    GLLOAD\glver$ = "300"
    glColorMaski_ = GPA("glColorMaski")
    glGetBooleani_v_ = GPA("glGetBooleani_v")
    glGetIntegeri_v_ = GPA("glGetIntegeri_v")
    glEnablei_ = GPA("glEnablei")
    glDisablei_ = GPA("glDisablei")
    glIsEnabledi_ = GPA("glIsEnabledi")
    glBeginTransformFeedback_ = GPA("glBeginTransformFeedback")
    glEndTransformFeedback_ = GPA("glEndTransformFeedback")
    glBindBufferRange_ = GPA("glBindBufferRange")
    glBindBufferBase_ = GPA("glBindBufferBase")
    glTransformFeedbackVaryings_ = GPA("glTransformFeedbackVaryings")
    glGetTransformFeedbackVarying_ = GPA("glGetTransformFeedbackVarying")
    glClampColor_ = GPA("glClampColor")
    glBeginConditionalRender_ = GPA("glBeginConditionalRender")
    glEndConditionalRender_ = GPA("glEndConditionalRender")
    glVertexAttribIPointer_ = GPA("glVertexAttribIPointer")
    glGetVertexAttribIiv_ = GPA("glGetVertexAttribIiv")
    glGetVertexAttribIuiv_ = GPA("glGetVertexAttribIuiv")
    glVertexAttribI1i_ = GPA("glVertexAttribI1i")
    glVertexAttribI2i_ = GPA("glVertexAttribI2i")
    glVertexAttribI3i_ = GPA("glVertexAttribI3i")
    glVertexAttribI4i_ = GPA("glVertexAttribI4i")
    glVertexAttribI1ui_ = GPA("glVertexAttribI1ui")
    glVertexAttribI2ui_ = GPA("glVertexAttribI2ui")
    glVertexAttribI3ui_ = GPA("glVertexAttribI3ui")
    glVertexAttribI4ui_ = GPA("glVertexAttribI4ui")
    glVertexAttribI1iv_ = GPA("glVertexAttribI1iv")
    glVertexAttribI2iv_ = GPA("glVertexAttribI2iv")
    glVertexAttribI3iv_ = GPA("glVertexAttribI3iv")
    glVertexAttribI4iv_ = GPA("glVertexAttribI4iv")
    glVertexAttribI1uiv_ = GPA("glVertexAttribI1uiv")
    glVertexAttribI2uiv_ = GPA("glVertexAttribI2uiv")
    glVertexAttribI3uiv_ = GPA("glVertexAttribI3uiv")
    glVertexAttribI4uiv_ = GPA("glVertexAttribI4uiv")
    glVertexAttribI4bv_ = GPA("glVertexAttribI4bv")
    glVertexAttribI4sv_ = GPA("glVertexAttribI4sv")
    glVertexAttribI4ubv_ = GPA("glVertexAttribI4ubv")
    glVertexAttribI4usv_ = GPA("glVertexAttribI4usv")
    glGetUniformuiv_ = GPA("glGetUniformuiv")
    glBindFragDataLocation_ = GPA("glBindFragDataLocation")
    glGetFragDataLocation_ = GPA("glGetFragDataLocation")
    glUniform1ui_ = GPA("glUniform1ui")
    glUniform2ui_ = GPA("glUniform2ui")
    glUniform3ui_ = GPA("glUniform3ui")
    glUniform4ui_ = GPA("glUniform4ui")
    glUniform1uiv_ = GPA("glUniform1uiv")
    glUniform2uiv_ = GPA("glUniform2uiv")
    glUniform3uiv_ = GPA("glUniform3uiv")
    glUniform4uiv_ = GPA("glUniform4uiv")
    glTexParameterIiv_ = GPA("glTexParameterIiv")
    glTexParameterIuiv_ = GPA("glTexParameterIuiv")
    glGetTexParameterIiv_ = GPA("glGetTexParameterIiv")
    glGetTexParameterIuiv_ = GPA("glGetTexParameterIuiv")
    glClearBufferiv_ = GPA("glClearBufferiv")
    glClearBufferuiv_ = GPA("glClearBufferuiv")
    glClearBufferfv_ = GPA("glClearBufferfv")
    glClearBufferfi_ = GPA("glClearBufferfi")
    glGetStringi_ = GPA("glGetStringi")
    glIsRenderbuffer_ = GPA("glIsRenderbuffer")
    glBindRenderbuffer_ = GPA("glBindRenderbuffer")
    glDeleteRenderbuffers_ = GPA("glDeleteRenderbuffers")
    glGenRenderbuffers_ = GPA("glGenRenderbuffers")
    glRenderbufferStorage_ = GPA("glRenderbufferStorage")
    glGetRenderbufferParameteriv_ = GPA("glGetRenderbufferParameteriv")
    glIsFramebuffer_ = GPA("glIsFramebuffer")
    glBindFramebuffer_ = GPA("glBindFramebuffer")
    glDeleteFramebuffers_ = GPA("glDeleteFramebuffers")
    glGenFramebuffers_ = GPA("glGenFramebuffers")
    glCheckFramebufferStatus_ = GPA("glCheckFramebufferStatus")
    glFramebufferTexture1D_ = GPA("glFramebufferTexture1D")
    glFramebufferTexture2D_ = GPA("glFramebufferTexture2D")
    glFramebufferTexture3D_ = GPA("glFramebufferTexture3D")
    glFramebufferRenderbuffer_ = GPA("glFramebufferRenderbuffer")
    glGetFramebufferAttachmentParameteriv_ = GPA("glGetFramebufferAttachmentParameteriv")
    glGenerateMipmap_ = GPA("glGenerateMipmap")
    glBlitFramebuffer_ = GPA("glBlitFramebuffer")
    glRenderbufferStorageMultisample_ = GPA("glRenderbufferStorageMultisample")
    glFramebufferTextureLayer_ = GPA("glFramebufferTextureLayer")
    glMapBufferRange_ = GPA("glMapBufferRange")
    glFlushMappedBufferRange_ = GPA("glFlushMappedBufferRange")
    glBindVertexArray_ = GPA("glBindVertexArray")
    glDeleteVertexArrays_ = GPA("glDeleteVertexArrays")
    glGenVertexArrays_ = GPA("glGenVertexArrays")
    glIsVertexArray_ = GPA("glIsVertexArray")
 EndIf

 If glVer >= 310
    ;- BIND 3.1
    GLLOAD\glver$ = "310"
    glDrawArraysInstanced_ = GPA("glDrawArraysInstanced")
    glDrawElementsInstanced_ = GPA("glDrawElementsInstanced")
    glTexBuffer_ = GPA("glTexBuffer")
    glPrimitiveRestartIndex_ = GPA("glPrimitiveRestartIndex")
    glCopyBufferSubData_ = GPA("glCopyBufferSubData")
    glGetUniformIndices_ = GPA("glGetUniformIndices")
    glGetActiveUniformsiv_ = GPA("glGetActiveUniformsiv")
    glGetActiveUniformName_ = GPA("glGetActiveUniformName")
    glGetUniformBlockIndex_ = GPA("glGetUniformBlockIndex")
    glGetActiveUniformBlockiv_ = GPA("glGetActiveUniformBlockiv")
    glGetActiveUniformBlockName_ = GPA("glGetActiveUniformBlockName")
    glUniformBlockBinding_ = GPA("glUniformBlockBinding")
 EndIf
 
 If glVer >= 320   
    ;- BIND 3.2
    GLLOAD\glver$ = "320"
    glDrawElementsBaseVertex_ = GPA("glDrawElementsBaseVertex")
    glDrawRangeElementsBaseVertex_ = GPA("glDrawRangeElementsBaseVertex")
    glDrawElementsInstancedBaseVertex_ = GPA("glDrawElementsInstancedBaseVertex")
    glMultiDrawElementsBaseVertex_ = GPA("glMultiDrawElementsBaseVertex")
    glProvokingVertex_ = GPA("glProvokingVertex")
    glFenceSync_ = GPA("glFenceSync")
    glIsSync_ = GPA("glIsSync")
    glDeleteSync_ = GPA("glDeleteSync")
    glClientWaitSync_ = GPA("glClientWaitSync")
    glWaitSync_ = GPA("glWaitSync")
    glGetInteger64v_ = GPA("glGetInteger64v")
    glGetSynciv_ = GPA("glGetSynciv")
    glGetInteger64i_v_ = GPA("glGetInteger64i_v")
    glGetBufferParameteri64v_ = GPA("glGetBufferParameteri64v")
    glFramebufferTexture_ = GPA("glFramebufferTexture")
    glTexImage2DMultisample_ = GPA("glTexImage2DMultisample")
    glTexImage3DMultisample_ = GPA("glTexImage3DMultisample")
    glGetMultisamplefv_ = GPA("glGetMultisamplefv")
    glSampleMaski_ = GPA("glSampleMaski")
 EndIf

 If glVer >= 330
    ;- BIND 3.3
    GLLOAD\glver$ = "330"
    glBindFragDataLocationIndexed_ = GPA("glBindFragDataLocationIndexed")
    glGetFragDataIndex_ = GPA("glGetFragDataIndex")
    glGenSamplers_ = GPA("glGenSamplers")
    glDeleteSamplers_ = GPA("glDeleteSamplers")
    glIsSampler_ = GPA("glIsSampler")
    glBindSampler_ = GPA("glBindSampler")
    glSamplerParameteri_ = GPA("glSamplerParameteri")
    glSamplerParameteriv_ = GPA("glSamplerParameteriv")
    glSamplerParameterf_ = GPA("glSamplerParameterf")
    glSamplerParameterfv_ = GPA("glSamplerParameterfv")
    glSamplerParameterIiv_ = GPA("glSamplerParameterIiv")
    glSamplerParameterIuiv_ = GPA("glSamplerParameterIuiv")
    glGetSamplerParameteriv_ = GPA("glGetSamplerParameteriv")
    glGetSamplerParameterIiv_ = GPA("glGetSamplerParameterIiv")
    glGetSamplerParameterfv_ = GPA("glGetSamplerParameterfv")
    glGetSamplerParameterIuiv_ = GPA("glGetSamplerParameterIuiv")
    glQueryCounter_ = GPA("glQueryCounter")
    glGetQueryObjecti64v_ = GPA("glGetQueryObjecti64v")
    glGetQueryObjectui64v_ = GPA("glGetQueryObjectui64v")
    glVertexAttribDivisor_ = GPA("glVertexAttribDivisor")
    glVertexAttribP1ui_ = GPA("glVertexAttribP1ui")
    glVertexAttribP1uiv_ = GPA("glVertexAttribP1uiv")
    glVertexAttribP2ui_ = GPA("glVertexAttribP2ui")
    glVertexAttribP2uiv_ = GPA("glVertexAttribP2uiv")
    glVertexAttribP3ui_ = GPA("glVertexAttribP3ui")
    glVertexAttribP3uiv_ = GPA("glVertexAttribP3uiv")
    glVertexAttribP4ui_ = GPA("glVertexAttribP4ui")
    glVertexAttribP4uiv_ = GPA("glVertexAttribP4uiv")
 EndIf

 If glVer >= 400
    ;- BIND 4.0
    GLLOAD\glver$ = "400"
    glMinSampleShading_ = GPA("glMinSampleShading")
    glBlendEquationi_ = GPA("glBlendEquationi")
    glBlendEquationSeparatei_ = GPA("glBlendEquationSeparatei")
    glBlendFunci_ = GPA("glBlendFunci")
    glBlendFuncSeparatei_ = GPA("glBlendFuncSeparatei")
    glDrawArraysIndirect_ = GPA("glDrawArraysIndirect")
    glDrawElementsIndirect_ = GPA("glDrawElementsIndirect")
    glUniform1d_ = GPA("glUniform1d")
    glUniform2d_ = GPA("glUniform2d")
    glUniform3d_ = GPA("glUniform3d")
    glUniform4d_ = GPA("glUniform4d")
    glUniform1dv_ = GPA("glUniform1dv")
    glUniform2dv_ = GPA("glUniform2dv")
    glUniform3dv_ = GPA("glUniform3dv")
    glUniform4dv_ = GPA("glUniform4dv")
    glUniformMatrix2dv_ = GPA("glUniformMatrix2dv")
    glUniformMatrix3dv_ = GPA("glUniformMatrix3dv")
    glUniformMatrix4dv_ = GPA("glUniformMatrix4dv")
    glUniformMatrix2x3dv_ = GPA("glUniformMatrix2x3dv")
    glUniformMatrix2x4dv_ = GPA("glUniformMatrix2x4dv")
    glUniformMatrix3x2dv_ = GPA("glUniformMatrix3x2dv")
    glUniformMatrix3x4dv_ = GPA("glUniformMatrix3x4dv")
    glUniformMatrix4x2dv_ = GPA("glUniformMatrix4x2dv")
    glUniformMatrix4x3dv_ = GPA("glUniformMatrix4x3dv")
    glGetUniformdv_ = GPA("glGetUniformdv")
    glGetSubroutineUniformLocation_ = GPA("glGetSubroutineUniformLocation")
    glGetSubroutineIndex_ = GPA("glGetSubroutineIndex")
    glGetActiveSubroutineUniformiv_ = GPA("glGetActiveSubroutineUniformiv")
    glGetActiveSubroutineUniformName_ = GPA("glGetActiveSubroutineUniformName")
    glGetActiveSubroutineName_ = GPA("glGetActiveSubroutineName")
    glUniformSubroutinesuiv_ = GPA("glUniformSubroutinesuiv")
    glGetUniformSubroutineuiv_ = GPA("glGetUniformSubroutineuiv")
    glGetProgramStageiv_ = GPA("glGetProgramStageiv")
    glPatchParameteri_ = GPA("glPatchParameteri")
    glPatchParameterfv_ = GPA("glPatchParameterfv")
    glBindTransformFeedback_ = GPA("glBindTransformFeedback")
    glDeleteTransformFeedbacks_ = GPA("glDeleteTransformFeedbacks")
    glGenTransformFeedbacks_ = GPA("glGenTransformFeedbacks")
    glIsTransformFeedback_ = GPA("glIsTransformFeedback")
    glPauseTransformFeedback_ = GPA("glPauseTransformFeedback")
    glResumeTransformFeedback_ = GPA("glResumeTransformFeedback")
    glDrawTransformFeedback_ = GPA("glDrawTransformFeedback")
    glDrawTransformFeedbackStream_ = GPA("glDrawTransformFeedbackStream")
    glBeginQueryIndexed_ = GPA("glBeginQueryIndexed")
    glEndQueryIndexed_ = GPA("glEndQueryIndexed")
    glGetQueryIndexediv_ = GPA("glGetQueryIndexediv")
 EndIf

 If glVer >= 410
    ;- BIND 4.1
    GLLOAD\glver$ = "410"
    glReleaseShaderCompiler_ = GPA("glReleaseShaderCompiler")
    glShaderBinary_ = GPA("glShaderBinary")
    glGetShaderPrecisionFormat_ = GPA("glGetShaderPrecisionFormat")
    glDepthRangef_ = GPA("glDepthRangef")
    glClearDepthf_ = GPA("glClearDepthf")
    glGetProgramBinary_ = GPA("glGetProgramBinary")
    glProgramBinary_ = GPA("glProgramBinary")
    glProgramParameteri_ = GPA("glProgramParameteri")
    glUseProgramStages_ = GPA("glUseProgramStages")
    glActiveShaderProgram_ = GPA("glActiveShaderProgram")
    glCreateShaderProgramv_ = GPA("glCreateShaderProgramv")
    glBindProgramPipeline_ = GPA("glBindProgramPipeline")
    glDeleteProgramPipelines_ = GPA("glDeleteProgramPipelines")
    glGenProgramPipelines_ = GPA("glGenProgramPipelines")
    glIsProgramPipeline_ = GPA("glIsProgramPipeline")
    glGetProgramPipelineiv_ = GPA("glGetProgramPipelineiv")
    glProgramUniform1i_ = GPA("glProgramUniform1i")
    glProgramUniform1iv_ = GPA("glProgramUniform1iv")
    glProgramUniform1f_ = GPA("glProgramUniform1f")
    glProgramUniform1fv_ = GPA("glProgramUniform1fv")
    glProgramUniform1d_ = GPA("glProgramUniform1d")
    glProgramUniform1dv_ = GPA("glProgramUniform1dv")
    glProgramUniform1ui_ = GPA("glProgramUniform1ui")
    glProgramUniform1uiv_ = GPA("glProgramUniform1uiv")
    glProgramUniform2i_ = GPA("glProgramUniform2i")
    glProgramUniform2iv_ = GPA("glProgramUniform2iv")
    glProgramUniform2f_ = GPA("glProgramUniform2f")
    glProgramUniform2fv_ = GPA("glProgramUniform2fv")
    glProgramUniform2d_ = GPA("glProgramUniform2d")
    glProgramUniform2dv_ = GPA("glProgramUniform2dv")
    glProgramUniform2ui_ = GPA("glProgramUniform2ui")
    glProgramUniform2uiv_ = GPA("glProgramUniform2uiv")
    glProgramUniform3i_ = GPA("glProgramUniform3i")
    glProgramUniform3iv_ = GPA("glProgramUniform3iv")
    glProgramUniform3f_ = GPA("glProgramUniform3f")
    glProgramUniform3fv_ = GPA("glProgramUniform3fv")
    glProgramUniform3d_ = GPA("glProgramUniform3d")
    glProgramUniform3dv_ = GPA("glProgramUniform3dv")
    glProgramUniform3ui_ = GPA("glProgramUniform3ui")
    glProgramUniform3uiv_ = GPA("glProgramUniform3uiv")
    glProgramUniform4i_ = GPA("glProgramUniform4i")
    glProgramUniform4iv_ = GPA("glProgramUniform4iv")
    glProgramUniform4f_ = GPA("glProgramUniform4f")
    glProgramUniform4fv_ = GPA("glProgramUniform4fv")
    glProgramUniform4d_ = GPA("glProgramUniform4d")
    glProgramUniform4dv_ = GPA("glProgramUniform4dv")
    glProgramUniform4ui_ = GPA("glProgramUniform4ui")
    glProgramUniform4uiv_ = GPA("glProgramUniform4uiv")
    glProgramUniformMatrix2fv_ = GPA("glProgramUniformMatrix2fv")
    glProgramUniformMatrix3fv_ = GPA("glProgramUniformMatrix3fv")
    glProgramUniformMatrix4fv_ = GPA("glProgramUniformMatrix4fv")
    glProgramUniformMatrix2dv_ = GPA("glProgramUniformMatrix2dv")
    glProgramUniformMatrix3dv_ = GPA("glProgramUniformMatrix3dv")
    glProgramUniformMatrix4dv_ = GPA("glProgramUniformMatrix4dv")
    glProgramUniformMatrix2x3fv_ = GPA("glProgramUniformMatrix2x3fv")
    glProgramUniformMatrix3x2fv_ = GPA("glProgramUniformMatrix3x2fv")
    glProgramUniformMatrix2x4fv_ = GPA("glProgramUniformMatrix2x4fv")
    glProgramUniformMatrix4x2fv_ = GPA("glProgramUniformMatrix4x2fv")
    glProgramUniformMatrix3x4fv_ = GPA("glProgramUniformMatrix3x4fv")
    glProgramUniformMatrix4x3fv_ = GPA("glProgramUniformMatrix4x3fv")
    glProgramUniformMatrix2x3dv_ = GPA("glProgramUniformMatrix2x3dv")
    glProgramUniformMatrix3x2dv_ = GPA("glProgramUniformMatrix3x2dv")
    glProgramUniformMatrix2x4dv_ = GPA("glProgramUniformMatrix2x4dv")
    glProgramUniformMatrix4x2dv_ = GPA("glProgramUniformMatrix4x2dv")
    glProgramUniformMatrix3x4dv_ = GPA("glProgramUniformMatrix3x4dv")
    glProgramUniformMatrix4x3dv_ = GPA("glProgramUniformMatrix4x3dv")
    glValidateProgramPipeline_ = GPA("glValidateProgramPipeline")
    glGetProgramPipelineInfoLog_ = GPA("glGetProgramPipelineInfoLog")
    glVertexAttribL1d_ = GPA("glVertexAttribL1d")
    glVertexAttribL2d_ = GPA("glVertexAttribL2d")
    glVertexAttribL3d_ = GPA("glVertexAttribL3d")
    glVertexAttribL4d_ = GPA("glVertexAttribL4d")
    glVertexAttribL1dv_ = GPA("glVertexAttribL1dv")
    glVertexAttribL2dv_ = GPA("glVertexAttribL2dv")
    glVertexAttribL3dv_ = GPA("glVertexAttribL3dv")
    glVertexAttribL4dv_ = GPA("glVertexAttribL4dv")
    glVertexAttribLPointer_ = GPA("glVertexAttribLPointer")
    glGetVertexAttribLdv_ = GPA("glGetVertexAttribLdv")
    glViewportArrayv_ = GPA("glViewportArrayv")
    glViewportIndexedf_ = GPA("glViewportIndexedf")
    glViewportIndexedfv_ = GPA("glViewportIndexedfv")
    glScissorArrayv_ = GPA("glScissorArrayv")
    glScissorIndexed_ = GPA("glScissorIndexed")
    glScissorIndexedv_ = GPA("glScissorIndexedv")
    glDepthRangeArrayv_ = GPA("glDepthRangeArrayv")
    glDepthRangeIndexed_ = GPA("glDepthRangeIndexed")
    glGetFloati_v_ = GPA("glGetFloati_v")
    glGetDoublei_v_ = GPA("glGetDoublei_v")    
 EndIf

 If glVer >= 420
    ;- BIND 4.2
    GLLOAD\glver$ = "420"
    glDrawArraysInstancedBaseInstance_ = GPA("glDrawArraysInstancedBaseInstance")
    glDrawElementsInstancedBaseInstance_ = GPA("glDrawElementsInstancedBaseInstance")
    glDrawElementsInstancedBaseVertexBaseInstance_ = GPA("glDrawElementsInstancedBaseVertexBaseInstance")
    glGetActiveAtomicCounterBufferiv_ = GPA("glGetActiveAtomicCounterBufferiv")
    glBindImageTexture_ = GPA("glBindImageTexture")
    glMemoryBarrier_ = GPA("glMemoryBarrier")
    glTexStorage1D_ = GPA("glTexStorage1D")
    glTexStorage2D_ = GPA("glTexStorage2D")
    glTexStorage3D_ = GPA("glTexStorage3D")
    glDrawTransformFeedbackInstanced_ = GPA("glDrawTransformFeedbackInstanced")
    glDrawTransformFeedbackStreamInstanced_ = GPA("glDrawTransformFeedbackStreamInstanced")
 EndIf

 If glVer >= 430
    ;- BIND 4.3
    GLLOAD\glver$ = "430"
    glClearBufferData_ = GPA("glClearBufferData")
    glClearBufferSubData_ = GPA("glClearBufferSubData")
    glDispatchCompute_ = GPA("glDispatchCompute")
    glDispatchComputeIndirect_ = GPA("glDispatchComputeIndirect")
    glCopyImageSubData_ = GPA("glCopyImageSubData")
    glFramebufferParameteri_ = GPA("glFramebufferParameteri")
    glGetFramebufferParameteriv_ = GPA("glGetFramebufferParameteriv")
    glGetInternalformati64v_ = GPA("glGetInternalformati64v")
    glInvalidateTexSubImage_ = GPA("glInvalidateTexSubImage")
    glInvalidateTexImage_ = GPA("glInvalidateTexImage")
    glInvalidateBufferSubData_ = GPA("glInvalidateBufferSubData")
    glInvalidateBufferData_ = GPA("glInvalidateBufferData")
    glInvalidateFramebuffer_ = GPA("glInvalidateFramebuffer")
    glInvalidateSubFramebuffer_ = GPA("glInvalidateSubFramebuffer")
    glMultiDrawArraysIndirect_ = GPA("glMultiDrawArraysIndirect")
    glMultiDrawElementsIndirect_ = GPA("glMultiDrawElementsIndirect")
    glGetProgramInterfaceiv_ = GPA("glGetProgramInterfaceiv")
    glGetProgramResourceIndex_ = GPA("glGetProgramResourceIndex")
    glGetProgramResourceName_ = GPA("glGetProgramResourceName")
    glGetProgramResourceiv_ = GPA("glGetProgramResourceiv")
    glGetProgramResourceLocation_ = GPA("glGetProgramResourceLocation")
    glGetProgramResourceLocationIndex_ = GPA("glGetProgramResourceLocationIndex")
    glShaderStorageBlockBinding_ = GPA("glShaderStorageBlockBinding")
    glTexBufferRange_ = GPA("glTexBufferRange")
    glTexStorage2DMultisample_ = GPA("glTexStorage2DMultisample")
    glTexStorage3DMultisample_ = GPA("glTexStorage3DMultisample")
    glTextureView_ = GPA("glTextureView")
    glBindVertexBuffer_ = GPA("glBindVertexBuffer")
    glVertexAttribFormat_ = GPA("glVertexAttribFormat")
    glVertexAttribIFormat_ = GPA("glVertexAttribIFormat")
    glVertexAttribLFormat_ = GPA("glVertexAttribLFormat")
    glVertexAttribBinding_ = GPA("glVertexAttribBinding")
    glVertexBindingDivisor_ = GPA("glVertexBindingDivisor")
    glDebugMessageControl_ = GPA("glDebugMessageControl")
    glDebugMessageInsert_ = GPA("glDebugMessageInsert")
    glDebugMessageCallback_ = GPA("glDebugMessageCallback")
    glGetDebugMessageLog_ = GPA("glGetDebugMessageLog")
    glPushDebugGroup_ = GPA("glPushDebugGroup")
    glPopDebugGroup_ = GPA("glPopDebugGroup")
    glObjectLabel_ = GPA("glObjectLabel")
    glGetObjectLabel_ = GPA("glGetObjectLabel")
    glObjectPtrLabel_ = GPA("glObjectPtrLabel")
    glGetObjectPtrLabel_ = GPA("glGetObjectPtrLabel")
 EndIf

 If glVer >= 440
    ;- BIND 4.4
    GLLOAD\glver$ = "440"
    glBufferStorage_ = GPA("glBufferStorage")
    glClearTexImage_ = GPA("glClearTexImage")
    glClearTexSubImage_ = GPA("glClearTexSubImage")
    glBindBuffersBase_ = GPA("glBindBuffersBase")
    glBindBuffersRange_ = GPA("glBindBuffersRange")
    glBindTextures_ = GPA("glBindTextures")
    glBindSamplers_ = GPA("glBindSamplers")
    glBindImageTextures_ = GPA("glBindImageTextures")
    glBindVertexBuffers_ = GPA("glBindVertexBuffers")
 EndIf

 If glVer >= 450
    ;- BIND 4.5
    GLLOAD\glver$ = "450"
    glClipControl_ = GPA("glClipControl")
    glCreateTransformFeedbacks_ = GPA("glCreateTransformFeedbacks")
    glTransformFeedbackBufferBase_ = GPA("glTransformFeedbackBufferBase")
    glTransformFeedbackBufferRange_ = GPA("glTransformFeedbackBufferRange")
    glGetTransformFeedbackiv_ = GPA("glGetTransformFeedbackiv")
    glGetTransformFeedbacki_v_ = GPA("glGetTransformFeedbacki_v")
    glGetTransformFeedbacki64_v_ = GPA("glGetTransformFeedbacki64_v")
    glCreateBuffers_ = GPA("glCreateBuffers")
    glNamedBufferStorage_ = GPA("glNamedBufferStorage")
    glNamedBufferData_ = GPA("glNamedBufferData")
    glNamedBufferSubData_ = GPA("glNamedBufferSubData")
    glCopyNamedBufferSubData_ = GPA("glCopyNamedBufferSubData")
    glClearNamedBufferData_ = GPA("glClearNamedBufferData")
    glClearNamedBufferSubData_ = GPA("glClearNamedBufferSubData")
    glMapNamedBuffer_ = GPA("glMapNamedBuffer")
    glMapNamedBufferRange_ = GPA("glMapNamedBufferRange")
    glUnmapNamedBuffer_ = GPA("glUnmapNamedBuffer")
    glFlushMappedNamedBufferRange_ = GPA("glFlushMappedNamedBufferRange")
    glGetNamedBufferParameteriv_ = GPA("glGetNamedBufferParameteriv")
    glGetNamedBufferParameteri64v_ = GPA("glGetNamedBufferParameteri64v")
    glGetNamedBufferPointerv_ = GPA("glGetNamedBufferPointerv")
    glGetNamedBufferSubData_ = GPA("glGetNamedBufferSubData")
    glCreateFramebuffers_ = GPA("glCreateFramebuffers")
    glNamedFramebufferRenderbuffer_ = GPA("glNamedFramebufferRenderbuffer")
    glNamedFramebufferParameteri_ = GPA("glNamedFramebufferParameteri")
    glNamedFramebufferTexture_ = GPA("glNamedFramebufferTexture")
    glNamedFramebufferTextureLayer_ = GPA("glNamedFramebufferTextureLayer")
    glNamedFramebufferDrawBuffer_ = GPA("glNamedFramebufferDrawBuffer")
    glNamedFramebufferDrawBuffers_ = GPA("glNamedFramebufferDrawBuffers")
    glNamedFramebufferReadBuffer_ = GPA("glNamedFramebufferReadBuffer")
    glInvalidateNamedFramebufferData_ = GPA("glInvalidateNamedFramebufferData")
    glInvalidateNamedFramebufferSubData_ = GPA("glInvalidateNamedFramebufferSubData")
    glClearNamedFramebufferiv_ = GPA("glClearNamedFramebufferiv")
    glClearNamedFramebufferuiv_ = GPA("glClearNamedFramebufferuiv")
    glClearNamedFramebufferfv_ = GPA("glClearNamedFramebufferfv")
    glClearNamedFramebufferfi_ = GPA("glClearNamedFramebufferfi")
    glBlitNamedFramebuffer_ = GPA("glBlitNamedFramebuffer")
    glCheckNamedFramebufferStatus_ = GPA("glCheckNamedFramebufferStatus")
    glGetNamedFramebufferParameteriv_ = GPA("glGetNamedFramebufferParameteriv")
    glGetNamedFramebufferAttachmentParameteriv_ = GPA("glGetNamedFramebufferAttachmentParameteriv")
    glCreateRenderbuffers_ = GPA("glCreateRenderbuffers")
    glNamedRenderbufferStorage_ = GPA("glNamedRenderbufferStorage")
    glNamedRenderbufferStorageMultisample_ = GPA("glNamedRenderbufferStorageMultisample")
    glGetNamedRenderbufferParameteriv_ = GPA("glGetNamedRenderbufferParameteriv")
    glCreateTextures_ = GPA("glCreateTextures")
    glTextureBuffer_ = GPA("glTextureBuffer")
    glTextureBufferRange_ = GPA("glTextureBufferRange")
    glTextureStorage1D_ = GPA("glTextureStorage1D")
    glTextureStorage2D_ = GPA("glTextureStorage2D")
    glTextureStorage3D_ = GPA("glTextureStorage3D")
    glTextureStorage2DMultisample_ = GPA("glTextureStorage2DMultisample")
    glTextureStorage3DMultisample_ = GPA("glTextureStorage3DMultisample")
    glTextureSubImage1D_ = GPA("glTextureSubImage1D")
    glTextureSubImage2D_ = GPA("glTextureSubImage2D")
    glTextureSubImage3D_ = GPA("glTextureSubImage3D")
    glCompressedTextureSubImage1D_ = GPA("glCompressedTextureSubImage1D")
    glCompressedTextureSubImage2D_ = GPA("glCompressedTextureSubImage2D")
    glCompressedTextureSubImage3D_ = GPA("glCompressedTextureSubImage3D")
    glCopyTextureSubImage1D_ = GPA("glCopyTextureSubImage1D")
    glCopyTextureSubImage2D_ = GPA("glCopyTextureSubImage2D")
    glCopyTextureSubImage3D_ = GPA("glCopyTextureSubImage3D")
    glTextureParameterf_ = GPA("glTextureParameterf")
    glTextureParameterfv_ = GPA("glTextureParameterfv")
    glTextureParameteri_ = GPA("glTextureParameteri")
    glTextureParameterIiv_ = GPA("glTextureParameterIiv")
    glTextureParameterIuiv_ = GPA("glTextureParameterIuiv")
    glTextureParameteriv_ = GPA("glTextureParameteriv")
    glGenerateTextureMipmap_ = GPA("glGenerateTextureMipmap")
    glBindTextureUnit_ = GPA("glBindTextureUnit")
    glGetTextureImage_ = GPA("glGetTextureImage")
    glGetCompressedTextureImage_ = GPA("glGetCompressedTextureImage")
    glGetTextureLevelParameterfv_ = GPA("glGetTextureLevelParameterfv")
    glGetTextureLevelParameteriv_ = GPA("glGetTextureLevelParameteriv")
    glGetTextureParameterfv_ = GPA("glGetTextureParameterfv")
    glGetTextureParameterIiv_ = GPA("glGetTextureParameterIiv")
    glGetTextureParameterIuiv_ = GPA("glGetTextureParameterIuiv")
    glGetTextureParameteriv_ = GPA("glGetTextureParameteriv")
    glCreateVertexArrays_ = GPA("glCreateVertexArrays")
    glDisableVertexArrayAttrib_ = GPA("glDisableVertexArrayAttrib")
    glEnableVertexArrayAttrib_ = GPA("glEnableVertexArrayAttrib")
    glVertexArrayElementBuffer_ = GPA("glVertexArrayElementBuffer")
    glVertexArrayVertexBuffer_ = GPA("glVertexArrayVertexBuffer")
    glVertexArrayVertexBuffers_ = GPA("glVertexArrayVertexBuffers")
    glVertexArrayAttribBinding_ = GPA("glVertexArrayAttribBinding")
    glVertexArrayAttribFormat_ = GPA("glVertexArrayAttribFormat")
    glVertexArrayAttribIFormat_ = GPA("glVertexArrayAttribIFormat")
    glVertexArrayAttribLFormat_ = GPA("glVertexArrayAttribLFormat")
    glVertexArrayBindingDivisor_ = GPA("glVertexArrayBindingDivisor")
    glGetVertexArrayiv_ = GPA("glGetVertexArrayiv")
    glGetVertexArrayIndexediv_ = GPA("glGetVertexArrayIndexediv")
    glGetVertexArrayIndexed64iv_ = GPA("glGetVertexArrayIndexed64iv")
    glCreateSamplers_ = GPA("glCreateSamplers")
    glCreateProgramPipelines_ = GPA("glCreateProgramPipelines")
    glCreateQueries_ = GPA("glCreateQueries")
    glGetQueryBufferObjecti64v_ = GPA("glGetQueryBufferObjecti64v")
    glGetQueryBufferObjectiv_ = GPA("glGetQueryBufferObjectiv")
    glGetQueryBufferObjectui64v_ = GPA("glGetQueryBufferObjectui64v")
    glGetQueryBufferObjectuiv_ = GPA("glGetQueryBufferObjectuiv")
    glMemoryBarrierByRegion_ = GPA("glMemoryBarrierByRegion")
    glGetTextureSubImage_ = GPA("glGetTextureSubImage")
    glGetCompressedTextureSubImage_ = GPA("glGetCompressedTextureSubImage")
    glGetGraphicsResetStatus_ = GPA("glGetGraphicsResetStatus")
    glGetnCompressedTexImage_ = GPA("glGetnCompressedTexImage")
    glGetnTexImage_ = GPA("glGetnTexImage")
    glGetnUniformdv_ = GPA("glGetnUniformdv")
    glGetnUniformfv_ = GPA("glGetnUniformfv")
    glGetnUniformiv_ = GPA("glGetnUniformiv")
    glGetnUniformuiv_ = GPA("glGetnUniformuiv")
    glReadnPixels_ = GPA("glReadnPixels")
    glGetnMapdv_ = GPA("glGetnMapdv")
    glGetnMapfv_ = GPA("glGetnMapfv")
    glGetnMapiv_ = GPA("glGetnMapiv")
    glGetnPixelMapfv_ = GPA("glGetnPixelMapfv")
    glGetnPixelMapuiv_ = GPA("glGetnPixelMapuiv")
    glGetnPixelMapusv_ = GPA("glGetnPixelMapusv")
    glGetnPolygonStipple_ = GPA("glGetnPolygonStipple")
    glGetnColorTable_ = GPA("glGetnColorTable")
    glGetnConvolutionFilter_ = GPA("glGetnConvolutionFilter")
    glGetnSeparableFilter_ = GPA("glGetnSeparableFilter")
    glGetnHistogram_ = GPA("glGetnHistogram")
    glGetnMinmax_ = GPA("glGetnMinmax")
    glTextureBarrier_ = GPA("glTextureBarrier")
 EndIf

 If glVer >= 460
    ;- BIND 4.6
    GLLOAD\glver$ = "460"
    glSpecializeShader_ = GPA("glSpecializeShader")
    glMultiDrawArraysIndirectCount_ = GPA("glMultiDrawArraysIndirectCount")
    glMultiDrawElementsIndirectCount_ = GPA("glMultiDrawElementsIndirectCount")
    glPolygonOffsetClamp_ = GPA("glPolygonOffsetClamp")   
 EndIf
 
 If GLLOAD\MissingProcsCount = 0 ; This is reliable only on Windows, always zero on Linux
    GLLOAD\ErrMsg$ = "OK"
    GLLOAD\ErrCode = #Error_OK
    ProcedureReturn 1
 EndIf
  
 GLLOAD\ErrMsg$ = "Some functions entry point were not found."
 GLLOAD\ErrCode = #Error_MissingEntryPoints
 
 ProcedureReturn 0
EndProcedure

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 202
; FirstLine = 199
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory