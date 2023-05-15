; How to use the OpenGL 1.1 functions already imported in PB with GLFW

IncludeFile "../../glfw/glfw.config.dynamic.pbi"
IncludeFile "../../glfw/glfw.pbi" 
IncludeFile "../../glfw/glfwLoad.pb" 

UseModule glfw

Procedure Render(win)
 Protected w, h
 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 glfwGetFramebufferSize(win, @w, @h)
 glViewport_(0, 0, w, h)
 
 glMatrixMode_ (#GL_PROJECTION)
 glLoadIdentity_()
 gluPerspective_(60.0, (w+0.0)/(h+0.0), 0.1, 100.0)
 
 glMatrixMode_(#GL_MODELVIEW)
 glLoadIdentity_()
 glTranslatef_(0.0, 0.0, -2.0)
 
 glBegin_(#GL_TRIANGLES)      
  glColor3f_( 1.0,  0.0, 0.0) 
  glVertex3f_( 0.0, 1.0, 0.0) 
  glColor3f_ ( 0.0, 1.0, 0.0) 
  glVertex3f_(-1.0,-1.0, 0.0) 
  glColor3f_ ( 0.0, 0.0, 1.0) 
  glVertex3f_( 1.0,-1.0, 0.0) 
 glEnd_() 
 
 glfwSwapBuffers(win)
EndProcedure

ProcedureC error_callback (err, *desc)
 Debug "error_callback = " + err + ", " + PeekS(*desc, -1, #PB_UTF8)
EndProcedure

ProcedureC resize_callback(win, w, h)
 Debug "resize_callback (" + w + ", " + h + ")"
 Render(win)
EndProcedure

ProcedureC char_callback (win, codepoint)
 Debug "char_callback = " + codepoint
EndProcedure

ProcedureC key_callback (win, key, scancode, action, mods)
 Debug "key_callback = " + key + ", scancode = " + scancode + ", action = " + action + ", mode = " + mods
 If (key = #GLFW_KEY_ESCAPE And action = #GLFW_PRESS)
    glfwSetWindowShouldClose(win, 1)
 EndIf
EndProcedure

Procedure Main()
 Protected win
 
 Debug PeekS(glfwGetVersionString(), -1, #PB_UTF8)
 
 glfwSetErrorCallback(@error_callback())    
   
 If glfwInit()       

    glfwWindowHint(#GLFW_CLIENT_API, #GLFW_OPENGL_API)
    glfwWindowHint(#GLFW_OPENGL_DEBUG_CONTEXT, 1)         
        
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 1)
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 0)
    
    glfwWindowHint(#GLFW_MAXIMIZED, 0)
    glfwWindowHint(#GLFW_RESIZABLE, 1)
              
    win = glfwCreateWindow(640, 480, PeekS(glfwGetVersionString(), -1, #PB_UTF8), #Null, #Null)              
          
    If win   
        glfwMakeContextCurrent(win)
        glfwSetWindowPos(win, 50, 50)        
        
        glfwSetFramebufferSizeCallback(win, @resize_callback())
        glfwSetKeyCallback(win, @key_callback())
        glfwSetCharCallback(win, @char_Callback())                
        
        Debug "GL_VENDOR = " + PeekS(glGetString_(#GL_VENDOR),-1,#PB_Ascii)
        Debug "GL_RENDERER = " + PeekS(glGetString_(#GL_RENDERER),-1,#PB_Ascii)
        Debug "GL_VERSION = " + PeekS(glGetString_(#GL_VERSION),-1,#PB_Ascii)     
               
        If glfwGetWindowAttrib(win, #GLFW_OPENGL_DEBUG_CONTEXT)      
            Debug "Debug context is ON"
        Else
            Debug "Debug context is OFF"
        EndIf
                        
        While (glfwWindowShouldClose(win) = 0)
            Render(win)                        
            glfwPollEvents()
        Wend                
    EndIf             
 EndIf 
EndProcedure

If glfwLoad::Load() = glfwLoad::#LOAD_OK
    Main()      
    glfwLoad::Shutdown()
EndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 5
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = test_01
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant