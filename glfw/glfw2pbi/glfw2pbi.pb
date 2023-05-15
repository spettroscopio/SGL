; Generates the code for these sections from glfw.pbi

#s1$ = ";- GLFW CONSTANTS"
#s2$ = ";- GLFW IMPORTS FOR STATIC BINDING"
#s3$ = ";- GLFW PROTOTYPES FOR DYNAMIC BINDING"

; It does not generate the code for the structures (they are just a few and it's safer to do it manually anyway).

EnableExplicit

#glfw3$ = "../c/glfw3.h"
#glfw3native$ = "../c/glfw3native.h"
#out$ = "output.pbi"

Procedure.s TrimEx (s$, c$ = " ")
;> Removes c$ from s$ left and right, and then replace internal multiple consecutive c$ with a single one.
 
 Protected lbef, laft
 
 s$ = Trim(s$, c$)
  
 Repeat
    lbef = Len(s$)
    s$ = ReplaceString(s$, c$ + c$, c$)
    laft = Len(s$)
    If lbef = laft
        Break
    EndIf
 ForEver
 
 ProcedureReturn s$
EndProcedure

Procedure.i LoadSourceFile (file_in$, List src.s())
 Protected RetCode, line$
 Protected fi = ReadFile(#PB_Any, file_in$)
 If fi
    While Not Eof(fi)
        line$ = ReadString(fi)
        If AddElement(src())
            src() = line$
        EndIf
    Wend
    CloseFile(fi)
    RetCode = 1  
 EndIf
 ProcedureReturn RetCode
EndProcedure

Procedure.i GenerateCode (List glfw.s(), List code.s())
 Protected line$, out$
  
 ForEach glfw()
    line$ = glfw()
    If Left(glfw(), 12) = "#define GLFW"
        ;Debug line$
        out$ = Mid(line$,8)
        out$ = ReplaceString(out$, "GLFW_", "#GLFW_")
        out$ = TrimEx(out$)
        out$ = ReplaceString(out$, " ", " = ", #PB_String_CaseSensitive, 1, 1)
        out$ = ReplaceString(out$, "/*", "; /*", #PB_String_CaseSensitive, 1, 1)
        out$ = ReplaceString(out$, "0x", "$")
        If AddElement(code())        
            code() = out$
            ;Debug out$
        EndIf
    EndIf    
 Next 

 ForEach glfw()
    line$ = glfw()
    If Left(glfw(), 7) = "GLFWAPI"
        ; NATIVE Win32, GLX, X11 are kept
        
        ; Drops NATIVE COCOA
        If FindString(line$, "glfwGetCocoaMonitor") : Continue : EndIf
        If FindString(line$, "glfwGetCocoaWindow") : Continue : EndIf
        If FindString(line$, "glfwGetNSGLContext") : Continue : EndIf
        
        ; Drops NATIVE Wayland
        ; This API returns structures from functions, so the glfw source code should be extended with wrappers returning them as params
        If FindString(line$, "glfwGetWaylandDisplay") : Continue : EndIf
        If FindString(line$, "glfwGetWaylandMonitor") : Continue : EndIf
        If FindString(line$, "glfwGetWaylandWindow") : Continue : EndIf
        
        ; Drops NATIVE EGL
        If FindString(line$, "glfwGetEGLDisplay") : Continue : EndIf
        If FindString(line$, "glfwGetEGLContext") : Continue : EndIf
        If FindString(line$, "glfwGetEGLSurface") : Continue : EndIf
        
        ; Drops NATIVE MESA
        If FindString(line$, "glfwGetOSMesaColorBuffer") : Continue : EndIf
        If FindString(line$, "glfwGetOSMesaDepthBuffer") : Continue : EndIf
        If FindString(line$, "glfwGetOSMesaContext") : Continue : EndIf
                       
        ;Debug line$       
        out$ = Mid(line$,8)     
        out$ = ReplaceString(out$, ";", "")
        If AddElement(code())        
            code() = out$
            ;Debug out$
        EndIf
    EndIf    
 Next 
 
 ProcedureReturn 1
EndProcedure

Procedure.i WritePBCode (file_out$, List code.s()) 
 Protected RetCode 
 Protected fo = CreateFile (#PB_Any, file_out$)
 
 If fo
    ForEach code()
        WriteStringN(fo, code())
    Next
    CloseFile(fo)
    RetCode = 1   
 EndIf
 ProcedureReturn RetCode
EndProcedure

Procedure Main()
 NewList glfw3.s()
 NewList glfw3native.s()
 NewList code.s()
 
 Protected fout
 
 If LoadSourceFile (#glfw3$, glfw3()) = 0
    CallDebugger
 EndIf
 
 If LoadSourceFile (#glfw3native$, glfw3native()) = 0
    CallDebugger
 EndIf
 
 If GenerateCode (glfw3(), code()) = 0
    CallDebugger
 EndIf
 
 If GenerateCode (glfw3native(), code()) = 0
    CallDebugger
 EndIf
 
 If WritePBCode (#out$, code()) = 0
    CallDebugger
 EndIf
EndProcedure

Main()

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 151
; FirstLine = 103
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier