; example of static binding

IncludeFile "../../glfw/glfw.config.static.pbi"
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
; CursorPosition = 15
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant
; EnableUnicode