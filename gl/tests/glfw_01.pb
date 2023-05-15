; Using gl.pbi + glLoad.pb + glfw.pbi + glfwLoad.pb to import and enumerate the OpenGL functions.

IncludeFile "../gl.pbi"
IncludeFile "../glLoad.pb"

UseModule gl

IncludeFile "../../glfw/glfw.config.dynamic.pbi"
IncludeFile "../../glfw/glfw.pbi"
IncludeFile "../../glfw/glfwLoad.pb"

UseModule glfw

Global GoodProcsCount, BadProcsCount

ProcedureC CallBack_glfw_error (err, *desc)
 Debug "GLFW error callback = " + PeekS(*desc, -1, #PB_UTF8)
EndProcedure

Procedure CallBack_GetProcAddress (func$)
 ProcedureReturn glfwGetProcAddress(func$) ; we use the appropriate glfw function here
EndProcedure

Procedure CallBack_Enumerate (glver$, func$, *func) 
 Debug Left(glver$ + Space(4), 4) + " -> " + func$ + " ($" + Hex(*func) + ")"
EndProcedure

Procedure Main()
 Protected win
 Protected maj, min
 Protected glfw_ver$
 
 glfwSetErrorCallback(@CallBack_glfw_error())    
   
 If glfwInit()              
    glfwWindowHint(#GLFW_VISIBLE, 0)
    
    ; let's ask for OpenGL 2.1
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 2)
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 1)      
    
    win = glfwCreateWindow(640, 480, "glfw", #Null, #Null) ; invisible window             
          
    If win
        glfwMakeContextCurrent(win)
        glfw_ver$ = PeekS(glfwGetVersionString(), -1, #PB_UTF8)
        Debug "GLFW version = " + glfw_ver$

        Debug "GL_VENDOR = " + PeekS(glGetString_(#GL_VENDOR),-1,#PB_Ascii)
        Debug "GL_RENDERER = " + PeekS(glGetString_(#GL_RENDERER),-1,#PB_Ascii)
        Debug "GL_VERSION = " + PeekS(glGetString_(#GL_VERSION),-1,#PB_Ascii)                        
        
        glLoad::GetContextVersion(@Major, @Minor)
                
        Debug "OpenGL context version = " + Str(Major) + "." + Str(Minor)

        If glLoad::Deprecated()
            Debug "Deprecated functions are included."
        Else
            Debug "Deprecated functions are not included."
        EndIf    
        
        glLoad::RegisterCallBack(glLoad::#CallBack_GetProcAddress, @CallBack_GetProcAddress())
        glLoad::RegisterCallBack(glLoad::#CallBack_EnumFuncs, @CallBack_Enumerate())
        
        If glLoad::Load()
            glLoad::GetProcsCount(@GoodProcsCount, @BadProcsCount)   
            Debug Str(GoodProcsCount) + " functions imported, " + Str(BadProcsCount) + " missing."
        EndIf
        glfwDestroyWindow(win)
    EndIf        
 EndIf    
EndProcedure

If glfwLoad::Load() = glfwLoad::#LOAD_OK
    Main()
    glfwLoad::Shutdown()
EndIf

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 74
; FirstLine = 30
; Folding = -
; EnableXP
; EnableUser
; Executable = test.exe
; CPU = 1
; CompileSourceDirectory
; EnableExeConstant