; How to use the OpenGL functions imported using the include gl.pbi + glLoad.pb

IncludeFile "../../gl/gl.pbi"
IncludeFile "../../gl/glLoad.pb"

UseModule gl

IncludeFile "../../glfw/glfw.config.dynamic.pbi"
IncludeFile "../../glfw/glfw.pbi"
IncludeFile "../../glfw/glfwLoad.pb"

UseModule glfw

Procedure CallBack_GetProcAddress (func$)
 ; we use the GLFW function instead of the Windows native wglGetProcAddress()
 ProcedureReturn glfwGetProcAddress(func$) 
EndProcedure

Procedure Render(win)
 Protected w, h
 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 glfwGetFramebufferSize(win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 glMatrixMode_(#GL_PROJECTION)
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

ProcedureC CallBack_char (win, codepoint)
 Debug "CallBack_char = " + codepoint
EndProcedure

ProcedureC CallBack_key (win, key, scancode, action, mods)
 Debug "CallBack_key = " + key + ", scancode = " + scancode + ", action = " + action + ", mode = " + mods
 If (key = #GLFW_KEY_ESCAPE And action = #GLFW_PRESS)
    glfwSetWindowShouldClose(win, 1)
 EndIf
EndProcedure

ProcedureC CallBack_error (err, *desc)
 Debug "CallBack_error = " + err + ", " + PeekS(*desc, -1, #PB_UTF8)
EndProcedure

ProcedureC CallBack_resize (win, w, h)
 Debug "CallBack_resize (" + w + ", " + h + ")"
 Render(win)
EndProcedure

Procedure Main()
 Protected win, major, minor
 
 Debug PeekS(glfwGetVersionString(), -1, #PB_UTF8)
 
 glfwSetErrorCallback(@CallBack_error())    
 
 If glfwInit()       

    glfwWindowHint(#GLFW_CLIENT_API, #GLFW_OPENGL_API)
    glfwWindowHint(#GLFW_OPENGL_DEBUG_CONTEXT, 1)         
    glfwWindowHint(#GLFW_MAXIMIZED, 0)
    glfwWindowHint(#GLFW_RESIZABLE, 1)
    
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, 1) ; we ask for OpenGL 1.2, we may get a higher version if available
    glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, 2)  
    
              
    win = glfwCreateWindow(640, 480, PeekS(glfwGetVersionString(), -1, #PB_UTF8), #Null, #Null)              
          
    If win   
        glfwMakeContextCurrent(win) ; we need a current context 
              
        glLoad::RegisterCallBack(glLoad::#CallBack_GetProcAddress, @CallBack_GetProcAddress())
        
        glLoad::GetContextVersion(@major, @minor)
        
        Debug "Created context version = " + major + "." + minor
        
        If glLoad::Load()
            glfwSetWindowPos(win, 50, 50)        
            
            glfwSetFramebufferSizeCallback(win, @CallBack_resize())
            glfwSetKeyCallback(win, @CallBack_key())
            glfwSetCharCallback(win, @CallBack_char())                
            
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
        Else
            Debug glLoad::GetErrString()
        EndIf
    EndIf
         
 EndIf 
EndProcedure

If glfwLoad::Load() = glfwLoad::#LOAD_OK
    Main()    
    glfwLoad::Shutdown()
EndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 7
; Folding = --
; EnableXP
; EnableUser
; Executable = glfw_test_2.exe
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant