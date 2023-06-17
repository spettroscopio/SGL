; Render text and generate textures

; Shows how to draw some text building a simple RenderText() command around some SGL functions.
; Shows how to use the utility functions to build textures on the fly for testing, to be used as placeholders.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_210/RenderText.pb"

#TITLE$ = "Render text and generate textures"
#SCROLL_TEXT$ = "This is some pretty uninteresting scrolling text ... wait, there is more ... and unexpectedly there is even more ... ok, that's enough !"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

#ROTATION_TIME = 20.0 ; seconds to rotate 360.0 degrees
#SCROLL_SPEED = 120.0 ; speed in pixel/second

Global gWin
Global gFon1
Global gFon2
Global gTimerRot
Global gTimerScroll
Global gScrollAccumX.f
Global gScrollPixelsWidth
Global Dim gTexture(5)

Declare     CallBack_WindowRefresh (win)
Declare     CallBack_Error (source$, desc$)
Declare.i   BuildTex (id)
Declare     Startup()
Declare     ShutDown()
Declare     Render()
Declare     MainLoop()
Declare     Main() 

Procedure CallBack_WindowRefresh (win)
 Render()
 sgl::SwapBuffers(gWin)
 EndProcedure 

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure.i BuildTex (id)
 Protected *td.sgl::TexelData
 Protected img, texid
 Protected maxAnisotropy.f
 
 Select id
    Case 0 
        img = sgl::CreateImage_DiceFace(512, 512, 1, RGB(255,255,64), RGB(0,0,0))
        sgl::StickLabelToImage (img, "Front", 20)
    Case 1 
        img = sgl::CreateImage_DiceFace(512, 512, 1, RGB(224,0,0), RGB(255,255,255))
        sgl::StickLabelToImage (img, "Back", 20)
    Case 2 
        img = sgl::CreateImage_Checkers(512, 512, 64, 64, RGB(255,255,255), RGB(0,0,0))
        sgl::StickLabelToImage (img, "Top", 20)
    Case 3 
        img = sgl::CreateImage_Checkers(512, 512, 256, 256, RGB(224,0,0), RGB(255,255,0)) 
        sgl::StickLabelToImage (img, "Bottom", 20)
    Case 4 
        img = sgl::CreateImage_Checkers(512, 512, 32, 32, RGB(0,0,255), RGB(224,224,255)) 
        sgl::StickLabelToImage (img, "Right", 20)
    Case 5 
        img = sgl::CreateImage_RGB(512, 512, 0) 
        sgl::StickLabelToImage (img, "Left", 20)
 EndSelect
  
 *td = sgl::CreateTexelData (img)
  
 glGenTextures_(1, @texid) 
 glBindTexture_(#GL_TEXTURE_2D, texid)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR_MIPMAP_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
 
 If sgl::IsExtensionAvailable("GL_EXT_texture_filter_anisotropic") Or sgl::IsExtensionAvailable("GL_ARB_texture_filter_anisotropic")
    glGetFloatv_(#GL_MAX_TEXTURE_MAX_ANISOTROPY, @maxAnisotropy)
    glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAX_ANISOTROPY, maxAnisotropy)
 EndIf
  
 glTexImage2D_(#GL_TEXTURE_2D, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)
 glGenerateMipmap_(#GL_TEXTURE_2D)
 
 FreeImage(img)
 sgl::DestroyTexelData(*td)
 
 ProcedureReturn texid
EndProcedure

Procedure Startup() 
 UsePNGImageDecoder()

 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 2)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 1)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
           
     gWin = sgl::CreateWindow(#WIN_WIDTH, #WIN_HEIGHT, #TITLE$)
     
     If gWin     
        sgl::MakeContextCurrent(gWin)
        
        sgl::RegisterWindowCallBack(gWin, sgl::#CALLBACK_WINDOW_REFRESH, @CallBack_WindowRefresh())
        
        Debug sgl::GetRenderer()
     
        If glLoad::Load() = 0
            Debug glLoad::GetErrString()
        EndIf
     
        sgl::LoadExtensionsStrings()
         
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf   
                  
        gTimerRot = sgl::CreateTimer()
        gTimerScroll = sgl::CreateTimer()

        
        Dim ranges.sgl::BitmapFontRange(0)
        
        ; Latin (ascii)
        ranges(0)\firstChar  = 32
        ranges(0)\lastChar   = 128    
                
        gFon1 = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges())
        gFon2 = RenderText::CreateBitmapFont("Consolas", 12, #Null, ranges())
        
        gScrollAccumX = 0 
        gScrollPixelsWidth = RenderText::GetTextWidth(gFon2, #SCROLL_TEXT$)        
        
        gTexture(0) = BuildTex(0)
        gTexture(1) = BuildTex(1)
        gTexture(2) = BuildTex(2)
        gTexture(3) = BuildTex(3)
        gTexture(4) = BuildTex(4)
        gTexture(5) = BuildTex(5)
        
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 End 
EndProcedure

Procedure ShutDown() 
 sgl::DestroyTimer(gTimerRot)
 sgl::DestroyTimer(gTimerScroll)
 RenderText::DestroyBitmapFont(gFon1) 
 RenderText::DestroyBitmapFont(gFon2) 
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h, fps$
 Protected color.vec3::vec3
 Protected elapsed.f, rot.f
 
 vec3::Set(color, 1.0, 1.0, 1.0)
  
 glClearColor_(0.25,0.25,0.5,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)
 
  ; gets how much time has passed from the last full rotation
 elapsed = sgl::GetElapsedTime(gTimerRot)

 ; map this particular instant between 0 and #ROTATION_TIME seconds to a rotation from 0 to 360 degrees
 ; the resulting number is the angle the cube must be rotated at this point in time 
 rot = Math::MapToRange5f(elapsed, 0.0, #ROTATION_TIME, 0.0, 360.0)

 glMatrixMode_(#GL_PROJECTION) 
 glLoadIdentity_() 
 gluPerspective_(60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)

 glMatrixMode_(#GL_MODELVIEW) 
 glLoadIdentity_() 
 glTranslatef_(0.0, 0.0, -5.0) 
 
 glRotatef_(rot, 1.0, 1.0, 0.0)
 glRotatef_(rot, 0.0, 1.0, 0.0)
 glRotatef_(rot, 0.0, 1.0, 1.0)
  
 glColor3f_(1.0, 1.0, 1.0)
  
 glEnable_(#GL_TEXTURE_2D) 
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(0)) 
 glBegin_(#GL_QUADS)
  ; Front face    
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0,  1.0)
 glEnd_()
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(1))
 glBegin_(#GL_QUADS) 
  ; Back face
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0, -1.0)
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
 glEnd_()   
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(2))
 glBegin_(#GL_QUADS) 
  ; Top face
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0,  1.0,  1.0)
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
 glEnd_()    
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(3))
 glBegin_(#GL_QUADS)    
  ; Bottom face
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0, -1.0, -1.0)
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
 glEnd_()   
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(4))      
 glBegin_(#GL_QUADS) 
  ; Right face
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
 glEnd_()
 
 glBindTexture_(#GL_TEXTURE_2D, gTexture(5))
 glBegin_(#GL_QUADS) 
  ; Left face
  glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0, -1.0, -1.0)
  glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
  glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0,  1.0,  1.0)
  glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
 glEnd_()
 
 If elapsed > #ROTATION_TIME
    sgl::ResetTimer(gTimerRot)
 EndIf  
   
 elapsed = sgl::GetDeltaTime(gTimerScroll)
 
  ; FPS
 If sgl::GetFPS() 
    fps$ = "FPS: " + sgl::GetFPS()
    RenderText::Render(gWin, gFon1, fps$, 1, h - RenderText::GetFontHeight(gFon1), color)
 EndIf

 
 ; Scroller 
 gScrollAccumX + #SCROLL_SPEED / (1.0 / elapsed) ; how many pixel we advance going at that speed

 If gScrollAccumX > (gScrollPixelsWidth + w) ; the whole text has scrolled through the window
    gScrollAccumX = 0.0
 EndIf
 
 RenderText::Render(gWin, gFon2, #SCROLL_TEXT$, w - gScrollAccumX, 10, color) 
 
 sgl::SwapBuffers(gWin)
EndProcedure

Procedure MainLoop()
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::IsWindowMinimized(gWin) = 0
        Render()
        sgl::TrackFPS()
    EndIf     
        
    sgl::PollEvents()
               
 Wend
EndProcedure

Procedure Main()
 Startup() 
 MainLoop()    
 ShutDown()
EndProcedure

Main()
; IDE Options = PureBasic 6.03 beta 1 LTS (Windows - x86)
; CursorPosition = 139
; FirstLine = 135
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\002.exe
; CPU = 1
; DisableDebugger
; CompileSourceDirectory