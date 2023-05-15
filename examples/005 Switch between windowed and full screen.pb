; How to switch from a windowed window and a full screen window without recreating the window and keeping the OpenGL context alive.
; Press SPACE to switch

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "Switch between windowed and full screen"

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
 gluPerspective_(60.0, (w+0.0)/(h+0.0), 0.1, 100.0)
 
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

Define win, fullscreen = 0

sgl::RegisterErrorCallBack(@CallBack_Error())

Procedure SwitchBetweenModes (win, fullscreen)
 Protected vmode.sgl::VideoMode
 Protected mon 
 Static x, y

 If fullscreen 
    mon = sgl::GetPrimaryMonitor() ; find the primary monitor     
    sgl::GetWindowPos(win, @x, @y) ; save windowed position
    sgl::GetVideoMode(mon, @vmode) ; retrieve desktop current videomode
    
    ; set windowed full screen using desktop width, height, and refresh freq.
    sgl::SetWindowMonitor(win, mon, 0, 0, vmode\width, vmode\height, vmode\freq)    
 Else   
    ; restore position, size, and windowed mode
    sgl::SetWindowMonitor(win, #Null, x, y, 640, 480, 0)
 EndIf
  
EndProcedure

If sgl::Init()        
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)                
    
    win = sgl::CreateWindow(640, 480, Title$, #Null) 
    
    If win                
        sgl::MakeContextCurrent(win)
               
        While sgl::WindowShouldClose(win) = 0            
            Render(win)            

            If sgl::GetKeyPress(sgl::#Key_ESCAPE) 
                sgl::SetWindowShouldClose(win, 1)
            EndIf

            If sgl::GetKeyPress(sgl::#Key_SPACE) 
                fullscreen ! 1
                SwitchBetweenModes(win, fullscreen)
            EndIf                
                                   
            sgl::SwapBuffers(win)            
            sgl::PollEvents()            
        Wend    
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