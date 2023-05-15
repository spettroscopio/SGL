; Textured Rotating Cube

; This is the equivalent of the first demo, but using OpenGL 3.30 Core
; All the data is stored inside a VBO, which is indexed with an index buffer, and all is bound  to a single VAO.
; Also the modelview and projection matrices are done using a m4x4 library and sent to the shader.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

IncludeFile "../extras/RenderText_330/RenderText.pb"

UseModule gl

#TITLE$ = "Textured Rotating Cube using 3.30 Core Profile"
#WIN_WIDTH = 800
#WIN_HEIGHT = 600
#VSYNC = 1

Global gWin
Global gTimerRot
Global gTimerFPS
Global gVao
Global gShader
Global gfon
Global gTexture

DataSection
 texture:   
 IncludeBinary "assets/yin-yang.png"   
EndDataSection

Declare     CallBack_WindowRefresh (win)
Declare     CallBack_Error (Source$, Desc$)
Declare.i   CatchTexture (address)
Declare     Startup()
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

Procedure.i CatchTexture (address) 
 Protected *td.sgl::TexelData
 Protected img, texid
 Protected maxAnisotropy.f
 
 img = CatchImage(#PB_Any, address)
  
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
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0 
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0
  Data.f -1.0,  1.0,  1.0,   1.0, 1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0 
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0
                  
  Data.f -1.0,  1.0, -1.0,   0.0, 0.0 
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f  1.0,  1.0, -1.0,   1.0, 0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 1.0 
  Data.f  1.0, -1.0, -1.0,   1.0, 1.0
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0
                  
  Data.f  1.0, -1.0, -1.0,   0.0, 0.0 
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 0.0 
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
  Data.f -1.0,  1.0, -1.0,   1.0, 1.0
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
 gTexture = CatchTexture(?texture) 
 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gTexture)
 
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("003.vert.glsl", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("003.frag.glsl", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
  
EndProcedure

Procedure Startup() 
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
                
        gFon = RenderText::CreateFont("Consolas", 10, #Null, ranges(), 256, 256)
                  
        gTimerRot = sgl::CreateTimer()
        gTimerFPS = sgl::CreateTimer()
        
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 End 
EndProcedure

Procedure ShutDown()
 RenderText::DestroyFont(gFon)   
 sgl::DestroyTimer(gTimerRot)   
 sgl::DestroyTimer(gTimerFPS)   
 sgl::Shutdown()
EndProcedure

Procedure Render()
 #ROTATION_TIME = 15.0 ; seconds to rotate 360.0 degrees
 
 Protected w, h
 Protected.m4x4::m4x4 modelview, projection
 Protected u_texture, u_modelview, u_projection 
 Protected elapsed.f, rot.f
 Protected color.vec3::vec3
 
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
 rot = Math::MapToRangef(elapsed, 0.0, #ROTATION_TIME, 0.0, 360.0)

 ; modelview
 m4x4::Identity(modelview)
 m4x4::TranslateXYZ(modelview, 0.0, 0.0, -4.0)
 m4x4::RotateX(modelview, rot)
 m4x4::RotateY(modelview, rot)
 m4x4::RotateZ(modelview, rot)
  
 ; projection
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)

 sgl::BindShaderProgram(gShader)
 
 u_texture = sgl::GetUniformLocation(gShader, "u_texture")
 
 u_modelview = sgl::GetUniformLocation(gShader, "u_modelview")
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 
 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gTexture)
 
 sgl::SetUniformLong(u_texture, 0) ; 0 is the texture unit we have selected with glActiveTexture()
 
 sgl::SetUniformMatrix4x4(u_modelview, @modelview)
 
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 glBindVertexArray_(gVao)
 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
  
 Protected x, y 
  
 x = 1 : y = 0
 RenderText::Render(gWin, gFon, sgl::GetRenderer(), x, y, color)
 
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
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
 SetupData()
 MainLoop()    
 ShutDown()
EndProcedure

Main()

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 259
; FirstLine = 255
; Folding = --
; EnableXP
; EnableUser
; Executable = ..\001\001.exe
; CPU = 1
; CompileSourceDirectory