; Model, View, Projection, and LookAt

; Drawing with model + view + projection + camera rotation with LookAt()
; In this demo the 3 cubes are the same object drawn with 3 different transformations.
; Also after some seconds the camera matrix is added into the mix and our point of view rotates around the cubes.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_330/RenderText.pb"

UseModule gl

#TITLE$ = "Model, View, Projection, and LookAt"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gTimer
Global gShader
Global gVao
Global gFon
Global Dim gTextures.i(2)

Declare     CallBack_WindowRefresh (win)
Declare     CallBack_Error (source$, desc$)
Declare.i   BuildTex (color)
Declare     SetupData()
Declare     SetupContext()
Declare     ShutDown()
Declare     Render()
Declare     MainLoop()
Declare     Main()

Procedure CallBack_WindowRefresh (win)
 Render()
EndProcedure 

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure.i BuildTex (color)
 Protected *td.sgl::TexelData
 Protected img, texid
 Protected maxAnisotropy.f
 
 img = sgl::CreateImage_Checkers(512, 512, 64, 64, RGB(255,255,255), color)
   
 *td = sgl::CreateTexelData (img)
  
 glGenTextures_(1, @texid) 
 glBindTexture_(#GL_TEXTURE_2D, texid)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
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

Procedure SetupData()
 Protected vbo, ibo

 Protected *vertex = sgl::StartData()   
  ; 3 * vertex pos + 2 * texture coord
  
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0 ; front 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 1.0 ; back 
  Data.f -1.0,  1.0, -1.0,   0.0, 0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 0.0
  Data.f  1.0, -1.0, -1.0,   1.0, 1.0
                  
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0 ; top
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0 ; bottom
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0
  Data.f -1.0, -1.0,  1.0,   0.0, 1.0
                  
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0 ; right
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0 ; left
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0
  Data.f -1.0,  1.0,  1.0,   1.0, 1.0
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0
 sgl::StopData()
    
 ; using indices to draw a quad
 Protected *indices = sgl::StartData()
  Data.l  0,  1,  2,  2,  3,  0
  Data.l  4,  5,  6,  6,  7,  4
  Data.l  8,  9, 10, 10, 11,  8
  Data.l 12, 13, 14, 14, 15, 12
  Data.l 16, 17, 18, 18, 19, 16
  Data.l 20, 21, 22, 22, 23, 20
 sgl::StopData()
 
 ; vertex array
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 ; vertex buffer
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 ; 24 vertices made by 5 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 5 * SizeOf(Float), *vertex, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coords
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 3 * SizeOf(Float))

 ; index buffer
 glGenBuffers_(1, @ibo)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 ; 36 indices made by 1 long each
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 36  * SizeOf(Long), *indices, #GL_STATIC_DRAW)

 glBindVertexArray_(0) ; we are done
 
 ; build texture 
 gTextures(0) = BuildTex(RGB(255,0,0))
 gTextures(1) = BuildTex(RGB(0,220,0))
 gTextures(2) = BuildTex(RGB(0,0,255))
 
 glActiveTexture_(#GL_TEXTURE0)
 
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("004.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("004.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
 
EndProcedure

Procedure SetupContext() 
 UsePNGImageDecoder()

 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_CORE)
     
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

        Dim ranges.sgl::BitmapFontRange(0)
        
        ; Latin (ascii)
        ranges(0)\firstChar  = 32
        ranges(0)\lastChar   = 128    
                
        gFon = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges(), 256, 256)
                  
        gTimer = sgl::CreateTimer()
        
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 End 
EndProcedure

Procedure ShutDown()
 RenderText::DestroyBitmapFont(gFon)
 sgl::DestroyTimer(gTimer)
 sgl::Shutdown()
EndProcedure


Procedure Render()
 #SPEED = 90.0 ; degrees x second
 
 Protected w, h
 Protected.m4x4::m4x4 model, view, projection
 Protected.vec3::vec3 eye, target, up
 Protected.vec3::vec3 radius
 Protected.vec3::vec3 color
 Protected u_texture, u_model, u_view, u_projection 
 Protected delta.f, distance.f
 
 Static rot.f
 Static orbit.f = 90.0 ; to sync the camera at the start of the orbital motion
 
 distance = 12.0 ; along the z axis
 
 vec3::Set(color, 1.0, 1.0, 1.0)
 
 glClearColor_(0.25,0.25,0.5,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)

 ; timestep
 delta = sgl::GetDeltaTime(gTimer)
 
 rot + #SPEED * delta
 
 If sgl::GetElapsedTime(gTimer) > 5.0
    orbit + #SPEED * delta / 4
    
    radius\x = Cos(Radian(orbit)) * distance
    radius\y = 0.0
    radius\z = Sin(Radian(orbit)) * distance
 Else
    radius\x = 0.0
    radius\y = 0.0
    radius\z = distance
 EndIf
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 glViewport_(0, 0, w, h)

 sgl::BindShaderProgram(gShader)
 
 u_texture = sgl::GetUniformLocation(gShader, "u_texture")
 
 sgl::SetUniformLong(u_texture, 0) ; 0 is the texture unit
 
 ; this time we send the three transformation matrices separately, just to show they can be multiplied in the shader
 u_model = sgl::GetUniformLocation(gShader, "u_model") 
 u_view = sgl::GetUniformLocation(gShader, "u_view") 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 
 ; view 
 vec3::set(eye, radius\x, 0.0, radius\z) ; orbits around the Y axis at the origin
 vec3::set(target, 0.0, 0.0, 0.0)
 vec3::set(up, 0.0, 1.0, 0.0)
 
 m4x4::LookAt(view, eye, target, up)
 
 sgl::SetUniformMatrix4x4(u_view, @view) 
  
 ; projection
 m4x4::Perspective(projection, 45.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
 
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 glBindVertexArray_(gVao)
 
 ; we draw the same object 3 times, just altering one of the transformation matrices between the draw calls
 
 ; model
 m4x4::Identity(model)
 m4x4::TranslateXYZ(model, -4.0, -1.0, 0.0)
 m4x4::RotateX(model, rot)
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 glBindTexture_(#GL_TEXTURE_2D, gTextures(0))
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
 
 ; model
 m4x4::Identity(model)
 m4x4::RotateY(model, rot)
 sgl::SetUniformMatrix4x4(u_model, @model) 
 glBindTexture_(#GL_TEXTURE_2D, gTextures(1))
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
 
 ; model
 m4x4::Identity(model)
 m4x4::TranslateXYZ(model, 4.0, 1.0, 0.0)
 m4x4::RotateZ(model, rot)
 sgl::SetUniformMatrix4x4(u_model, @model)
 glBindTexture_(#GL_TEXTURE_2D, gTextures(2))
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
 
 Protected x, y 
  
 x = 1 : y = 0
 RenderText::Render(gWin, gFon, sgl::GetRenderer(), x, y, color)
 
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
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
 SetupContext()
 SetupData()
 MainLoop()    
 ShutDown()
EndProcedure

Main()

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 255
; FirstLine = 252
; Folding = --
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\camera.exe
; CPU = 1
; CompileSourceDirectory