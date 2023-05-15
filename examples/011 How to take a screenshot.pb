; Example of taking a screenshot reading from the frame buffer using CreateImageFromFrameBuffer()
; Press "S" to take a screenshot

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "How to take a screenshot"

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
 
 glBegin_(#GL_TRIANGLES) ; you should land here and discover glEnd() was the cause     
  glColor3f_ ( 1.0, 0.0, 0.0) 
  glVertex3f_( 0.0, 1.0, 0.0) 
  glColor3f_ ( 0.0, 1.0, 0.0) 
  glVertex3f_(-1.0,-1.0, 0.0) 
  glColor3f_ ( 0.0, 0.0, 1.0) 
  glVertex3f_( 1.0,-1.0, 0.0) 
 glEnd_() 
EndProcedure 

Define win, img

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
                sgl::EnableDebugOutput() ; we can enable the modern debug output
            EndIf
            
            While sgl::WindowShouldClose(win) = 0               
                Render(win)

                If sgl::GetKeyPress(sgl::#Key_S) ; "S" to take the screen shot
                    ; the image still contains the alpha channel from the framebuffer
                    img = sgl::CreateImageFromFrameBuffer(win, 0, 0, 640, 480) 
                    If IsImage(img)
                        ; flatten alpha if needed to get a proper screenshot                        
                        sgl::SetImageAlpha (img, 255)
                        
                        ShowLibraryViewer("Image")
                    EndIf
                EndIf
                                
                sgl::SwapBuffers(win)
                sgl::PollEvents()
            Wend            
        EndIf
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 2
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory