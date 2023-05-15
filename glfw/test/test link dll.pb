; example of dynamic linking from DLL file

IncludeFile "../../glfw/glfw.config.dynamic.pbi"
IncludeFile "../../glfw/glfw.pbi"
IncludeFile "../../glfw/glfwLoad.pb"

UseModule glfw
 
If glfwLoad::Load() = glfwLoad::#LOAD_OK 
    If glfwInit()
        Debug "OK"
        Debug PeekS(glfwGetVersionString(), -1, #PB_UTF8)        
    EndIf
    glfwLoad::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; EnableXP
; EnableUser
; Executable = test
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant
; EnableUnicode