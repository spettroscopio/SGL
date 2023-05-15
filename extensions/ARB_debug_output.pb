; ARB_debug_output
; https://registry.khronos.org/OpenGL/extensions/ARB/ARB_debug_output.txt

CompilerIf Defined(glDebugMessageControl, #PB_Prototype) = 0
Prototype glDebugMessageControl (source, type, severity, count, *ids, enabled) : Global glDebugMessageControl_.glDebugMessageControl
CompilerEndIf

CompilerIf Defined(glDebugMessageInsert, #PB_Prototype) = 0
Prototype glDebugMessageInsert (source, type, id, severity, length, *buf) : Global glDebugMessageInsert_.glDebugMessageInsert
CompilerEndIf

CompilerIf Defined(glDebugMessageCallback, #PB_Prototype) = 0
Prototype glDebugMessageCallback (*callback, *userParam) : Global glDebugMessageCallback_.glDebugMessageCallback
CompilerEndIf

CompilerIf Defined(glGetDebugMessageLog, #PB_Prototype) = 0
Prototype glGetDebugMessageLog (count, bufSize, *sources, *types, *ids, *severities, *lengths, *messageLog) : Global glGetDebugMessageLog_.glGetDebugMessageLog
CompilerEndIf

Procedure.i ARB_debug_output()
; Returns 1 if the extension has been successfully loaded , else 0.

 If sgl::CountExtensionsStrings() = 0
    sgl::LoadExtensionsStrings()
 EndIf
 
 If sgl::IsExtensionAvailable("GL_ARB_debug_output") = 0
    ProcedureReturn 0
 EndIf

 glDebugMessageControl_ = sgl::GetProcAddress("glDebugMessageControlARB")
 If glDebugMessageControl_ = 0 : ProcedureReturn 0 : EndIf
 
 glDebugMessageInsert_ = sgl::GetProcAddress("glDebugMessageInsertARB") 
 If glDebugMessageInsert_ = 0 : ProcedureReturn 0 : EndIf
 
 glDebugMessageCallback_ = sgl::GetProcAddress("glDebugMessageCallbackARB") 
 If glDebugMessageCallback_ = 0 : ProcedureReturn 0 : EndIf
 
 glGetDebugMessageLog_ = sgl::GetProcAddress("glGetDebugMessageLogARB")
 If glGetDebugMessageLog_ = 0 : ProcedureReturn 0 : EndIf
 
 ProcedureReturn 1
EndProcedure

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 42
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory