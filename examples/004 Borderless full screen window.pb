; How to create a "borderless full screen window" on the primary monitor.
; This is usually faster to create and the alt-tab is smoother compared to a full screen wideo requiring a different video mode.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "Borderless Full Screen"

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
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
 
 glBegin_(#GL_TRIANGLES)      
  glColor3f_ ( 1.0, 0.0, 0.0) 
  glVertex3f_( 0.0, 1.0, 0.0) 
  glColor3f_ ( 0.0, 1.0, 0.0) 
  glVertex3f_(-1.0,-1.0, 0.0) 
  glColor3f_ ( 0.0, 0.0, 1.0) 
  glVertex3f_( 1.0,-1.0, 0.0) 
 glEnd_() 
EndProcedure

Define win, mon, vmode.sgl::VideoMode

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()        
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)    

    mon = sgl::GetPrimaryMonitor() ; find the primary monitor
    
    sgl::GetVideoMode(mon, @vmode) ; retrieve its videomode

    sgl::SetWindowHint(sgl::#HINT_WIN_FRAMEBUFFER_DEPTH, vmode\depth) ; ask for the same color depth
    
    sgl::SetWindowHint(sgl::#HINT_WIN_REFRESH_RATE, vmode\freq) ; and the same refresh frequency
 
    win = sgl::CreateWindow(vmode\width, vmode\height, Title$, mon) ; create the "borderless fullscreen"
    
    If win                
        sgl::MakeContextCurrent(win)
        
        While sgl::WindowShouldClose(win) = 0
            Render(win)
            
            If sgl::GetKeyPress(sgl::#Key_ESCAPE)
                sgl::SetWindowShouldClose(win, 1)
            EndIf

            sgl::SwapBuffers(win)            
            sgl::PollEvents()            
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 67
; FirstLine = 29
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory