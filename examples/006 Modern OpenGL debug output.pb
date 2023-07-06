; How to setup and use the modern OpenGL "debug output" to simplify the debugging of your OpenGL programs

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "Modern OpenGL debug output"

; More info at: https://learnopengl.com/In-Practice/Debugging
; More info at: https://registry.khronos.org/OpenGL/extensions/KHR/KHR_debug.txt
; More info at: https://registry.khronos.org/OpenGL/extensions/ARB/ARB_debug_output.txt

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
 
 ; enable CallDebugger to follow the procedure stack up to the offending statement
 ; CallDebugger
EndProcedure

Procedure Render (win)
 Protected w, h
 
 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 glMatrixMode_ (#GL_PROJECTION)
 glLoadIdentity_()
 gluPerspective_(60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
 
 glMatrixMode_(#GL_MODELVIEW)
 glLoadIdentity_()
 glTranslatef_(0.0, 0.0, -2.0)
 
 ; try to enable the glEnd() below to cause an error
 ; glEnd_() 

 glBegin_(#GL_TRIANGLES) ; you should land here and discover glEnd() was the cause     
  glColor3f_ ( 1.0, 0.0, 0.0) 
  glVertex3f_( 0.0, 1.0, 0.0) 
  glColor3f_ ( 0.0, 1.0, 0.0) 
  glVertex3f_(-1.0,-1.0, 0.0) 
  glColor3f_ ( 0.0, 0.0, 1.0) 
  glVertex3f_( 1.0,-1.0, 0.0) 
 glEnd_() 
EndProcedure 

Define win

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()        
    ; we request for legacy 1.0
    ; we will get the highest available version still backward compatible    
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)
    
    ; we try to request a debug context
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
            
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win                
        sgl::MakeContextCurrent(win)
                
        Debug sgl::GetRenderer()
        
        If glLoad::Load() ; load the OpenGL functions

            If sgl::IsDebugContext() ; if we really got a debug context
                Debug "OpenGL debug context was requested and it's available."
                If sgl::EnableDebugOutput() ; we can enable the modern debug output
                    Debug "OpenGL debug output successfully enabled."
                EndIf
            EndIf
            
            ; from now on every time an OpenGL error happens, the error callback will report it
            ; and by following the callstack with the debugger we can land on the line following the code causing it   
            
            While sgl::WindowShouldClose(win) = 0               
                Render(win)  
                sgl::SwapBuffers(win)
                sgl::PollEvents()
            Wend            
        EndIf
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 75
; FirstLine = 44
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory