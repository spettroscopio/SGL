; How to keep track of FPS and time spent to compute a frame

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

IncludeFile "../extras/RenderText_210/RenderText.pb"

Define Title$ = "FPS and Frame Time"

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

Global gFont

Procedure Render (win)
 Protected w, h, th
 Protected fps$, frameTime$
 Protected color.vec3::vec3
 
 vec3::set(color, 1.0, 1.0, 1.0)
 
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
 
 ; FPS
 If sgl::GetFPS() 
    th = RenderText::GetFontHeight(gFont)
    
    fps$ = "FPS: " + sgl::GetFPS()
    RenderText::Render(win, gFont, fps$, 1, h - th, color)
    
    frameTime$ = "Frame: " + StrF(sgl::GetFrameTime(), 3) + " ms"
    RenderText::Render(win, gFont, frameTime$, 1, h - 2 * th, color)
 EndIf

EndProcedure

Define win

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()        
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)
            
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win                
        sgl::MakeContextCurrent(win)        
    
        glLoad::Load()

        Dim ranges.sgl::BitmapFontRange(0)
        
        ; Latin (ascii)
        ranges(0)\firstChar  = 32
        ranges(0)\lastChar   = 128    
        
        gFont = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges(), 256, 256)
        
        ASSERT(font)
        
        sgl::EnableVSYNC(1)
        
        ; sgl::SetMaxFPS(120)
                
        While sgl::WindowShouldClose(win) = 0
            
            sgl::StartFrameTimer()
            
            Render(win)  
            
            sgl::PollEvents()
                        
            sgl::TrackFPS()
            
            sgl::StopFrameTimer()
                       
            ; if you move SwapBuffers() before StopFrameTimer(), the frame time will include the time required to swap buffers
            ; plus the time spent waiting for the vertical retrace (when vsynch is enabled) or the time spent waiting for the
            ; target frame time (when SetMaxFPS() is active).
            
            sgl::SwapBuffers(win) 
            
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 83
; FirstLine = 66
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; DisableDebugger
; CompileSourceDirectory