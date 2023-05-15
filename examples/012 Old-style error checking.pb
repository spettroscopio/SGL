; If your OpenGL driver does not support the modern OpenGL debug output you have to resort to the very old glGetError() to pinpoint problems. 
; Try to avoid it if possible.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "Old-Style error checking"

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
 
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

 glBegin_(#GL_TRIANGLES) 
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
    
    ; we don't want a debug context for this example, even if available
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 0)
            
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win                
        sgl::MakeContextCurrent(win)
                
        Debug sgl::GetRenderer()                
        
        If glLoad::Load() ; load the OpenGL functions
            
            ; from now on every time an OpenGL error happens, the error callback will report it
            ; and by following the callstack with the debugger we can land on the line following the code causing it   
            
            While sgl::WindowShouldClose(win) = 0               
                Render(win)
                
                sgl::SwapBuffers(win)
                
                ; here we check for errors every frame and we use the error callback to report them
                sgl::CheckGlErrors()
                
                sgl::PollEvents()
                
                ; being "every frame" we don't know exactly where this happened, but at least we know someting went bad
                ; from the last time we modified our code and we can go fishing around using glGetError()                
            Wend            
        EndIf
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory