; Textured rotating cube

; Shows how to load a texture with SGL
; Shows how to animate an object mapping its rotation in space to a specific moment in time, freeing it from the number of fps.
; Shows how to check the presence of an extension to apply a specific texture filtering.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

UseModule gl

#TITLE$ = "Textured rotating cube"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gTimerRot
Global gTimerFPS
Global gTexture

DataSection
 texture:   
 IncludeBinary "../assets/yin-yang.png"   
EndDataSection

Declare     CallBack_WindowRefresh (gWin)
Declare     CallBack_Error (Source$, Desc$)
Declare.i   CatchTexture (address)
Declare     Startup()
Declare     ShutDown()
Declare     Render()
Declare     MainLoop()
Declare     Main()

Procedure CallBack_WindowRefresh (gWin)
 Render()
EndProcedure 

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure.i CatchTexture (address) 
 Protected *td.sgl::TexelData
 Protected img, texid
 Protected maxAnisotropy.f
 
 img = CatchImage(#PB_Any, address)
  
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
             
        If glLoad::Load() = 0
            Debug glLoad::GetErrString()
        EndIf
     
        sgl::LoadExtensionsStrings()
         
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf   
              
        gTimerRot = sgl::CreateTimer()
        gTimerFPS = sgl::CreateTimer()
        
        gTexture  = CatchTexture (?texture)
        
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 End 
EndProcedure

Procedure ShutDown()
 sgl::DestroyTimer(gTimerRot)   
 sgl::DestroyTimer(gTimerFPS)   
 sgl::Shutdown()
EndProcedure

Procedure Render()
 #ROTATION_TIME = 15.0 ; seconds to rotate 360.0 degrees
 
 Protected w, h
 Protected elapsed.f, rot.f
  
 glClearColor_(0.25,0.25,0.5,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)

 ; gets how much time has passed from the last full rotation
 elapsed = sgl::GetElapsedTime(gTimerRot)

 ; the resulting number is the angle the cube must be rotated at this point in time
 ; map this particular instant between 0 and #ROTATION_TIME seconds to a rotation from 0 to 360 degrees
 rot = Math::MapToRangef(elapsed, 0.0, #ROTATION_TIME, 0.0, 360.0)
     
 glMatrixMode_(#GL_PROJECTION) 
 glLoadIdentity_() 
 gluPerspective_(60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)

 glMatrixMode_(#GL_MODELVIEW) 
 glLoadIdentity_() 
 glTranslatef_(0.0, 0.0, -4.0) 

 glRotatef_(rot, 1.0, 0.0, 0.0)
 glRotatef_(rot, 0.0, 1.0, 0.0)
 glRotatef_(rot, 0.0, 0.0, 1.0)
 
 glEnable_(#GL_TEXTURE_2D)
 glBindTexture_(#GL_TEXTURE_2D, gTexture)
 
 glColor3f_(1.0, 1.0, 1.0)
 
 glBegin_(#GL_QUADS)
    ; Front face
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0,  1.0)
    ; Back face
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0, -1.0)
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
    ; Top face
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0,  1.0,  1.0)
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
    ; Bottom face
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0, -1.0, -1.0)
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
    ; Right face
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ ( 1.0, -1.0, -1.0)
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ ( 1.0,  1.0, -1.0)
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ ( 1.0,  1.0,  1.0)
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ ( 1.0, -1.0,  1.0)
    ; Left face
    glTexCoord2f_ (0.0, 0.0) : glVertex3f_ (-1.0, -1.0, -1.0)
    glTexCoord2f_ (1.0, 0.0) : glVertex3f_ (-1.0, -1.0,  1.0)
    glTexCoord2f_ (1.0, 1.0) : glVertex3f_ (-1.0,  1.0,  1.0)
    glTexCoord2f_ (0.0, 1.0) : glVertex3f_ (-1.0,  1.0, -1.0)
 glEnd_()
 
 glDisable_(#GL_TEXTURE_2D)
 
 ; every second
 If sgl::GetElapsedTime(gTimerFPS) >= 1.0
    If sgl::GetFPS()
        sgl::SetWindowText(gWin, #TITLE$ + " (" + sgl::GetFPS() + " FPS)")
        sgl::ResetTimer(gTimerFPS)
    EndIf
 EndIf

 If elapsed > #ROTATION_TIME  
    sgl::ResetTimer(gTimerRot)
 EndIf
 
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
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 16
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = 001.exe
; CPU = 1
; CompileSourceDirectory