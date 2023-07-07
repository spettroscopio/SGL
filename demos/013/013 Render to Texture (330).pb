; Render to texture

; This demo shows how to render to a texture.
; The main scene is a cube moving left and right, and then there is a secondary scene wich is a textured cube lifted from one of the first demos.
; The secondary scene renders to a texture insted of rendering to screen, and then the texture is applied in the main scene to one of the sides of the cube.
; There is also an optional "old tv effect" in the shader as a bonus.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"


; Batch Renderer (Array Texture version)
IncludeFile "../../extras/Batch_ AT/BatchRenderer.pb"

; Text Renderer (Batch Array Texture version)
IncludeFile "../../extras/RenderText_BAT/RenderText.pb"

; IMGUI (using the above batch renderer)
IncludeFile "../../extras/IMGUI/imgui.pb"

UseModule gl

#TITLE$ = "Render to Texture (330)"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

#TARGET_TEX_SIZE = 512

Global gWin
Global gTimer, gTimerChild
Global gTimerFPS
Global gVao
Global gFbo
Global gRbo
Global gShader
Global gfon
Global gTexture, gTextureYinYang, gTargetTexture

DataSection
 texture:
 IncludeBinary "../assets/yin-yang.png"   
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

Procedure SetRenderTargetToDefault()
 glBindFramebuffer_(#GL_DRAW_FRAMEBUFFER, 0)
EndProcedure

Procedure SetRenderTargetToTexture()
 glBindFramebuffer_(#GL_DRAW_FRAMEBUFFER, gFbo)
EndProcedure

Procedure.i BuildTexture()
 Protected *td.sgl::TexelData
 Protected texid
 Protected maxAnisotropy.f
 
 Protected img = sgl::CreateImage_Checkers(#TARGET_TEX_SIZE, #TARGET_TEX_SIZE, 32, 32, RGB(255,255,255), RGB(30, 50, 128))
   
 *td = sgl::CreateTexelData (img)
  
 glGenTextures_(1, @texid) 
 glBindTexture_(#GL_TEXTURE_2D, texid)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
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

Procedure.i BuildTargetTexture()
 Protected texid 
  
 glGenTextures_(1, @texid) 
 glBindTexture_(#GL_TEXTURE_2D, texid)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
 
 glTexImage2D_(#GL_TEXTURE_2D, 0, #GL_RGB8, #TARGET_TEX_SIZE, #TARGET_TEX_SIZE, 0, #GL_RGB, #GL_UNSIGNED_BYTE, #Null)

 ProcedureReturn texid
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
  ; 3 * vertex_pos + 2 * texture_coord + 1 * texture_unit
  
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0,   0.0 ; front 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0,   0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0,   0.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0,   0.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 0.0,   1.0 ; back 
  Data.f -1.0,  1.0, -1.0,   1.0, 1.0,   1.0
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0,   1.0
  Data.f  1.0, -1.0, -1.0,   0.0, 0.0,   1.0
                  
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,   1.0 ; top
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0,   1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0,   1.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,   1.0 ; bottom
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   1.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0,   1.0
  Data.f -1.0, -1.0,  1.0,   0.0, 1.0,   1.0
                  
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   1.0 ; right
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   1.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0,   1.0
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0,   1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,   1.0 ; left
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0,   1.0
  Data.f -1.0,  1.0,  1.0,   1.0, 1.0,   1.0
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,   1.0
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
 ; 24 vertices made by 6 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 6 * SizeOf(Float), *vertex, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 6 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coords
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 6 * SizeOf(Float), 3 * SizeOf(Float))
  
 glEnableVertexAttribArray_(2) ; texture unit
 glVertexAttribPointer_(2, 1, #GL_FLOAT, #GL_FALSE, 6 * SizeOf(Float), 5 * SizeOf(Float))

 ; index buffer
 glGenBuffers_(1, @ibo)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 ; 36 indices made by 1 long each
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 36  * SizeOf(Long), *indices, #GL_STATIC_DRAW)

 glBindVertexArray_(0) ; we are done
 
 ; build textures 
 gTexture = BuildTexture()
 gTargetTexture = BuildTargetTexture()
 gTextureYinYang = CatchTexture(?texture)
 
 ; the render to texture magic setup is all here ...
 
 ; generates a new framebuffer object (we need a 2nd framebuffer beyond the usual default we are always using)
 glGenFramebuffers_(1, @gFbo)
 glBindFramebuffer_(#GL_DRAW_FRAMEBUFFER, gFbo)
 
 ; we specify a texture as a color attachment, to signify we want to render the contents of the color buffer there
 glFramebufferTexture2D_(#GL_DRAW_FRAMEBUFFER, #GL_COLOR_ATTACHMENT0, #GL_TEXTURE_2D, gTargetTexture, 0)
 
 ; generates a new renderbuffer object (we use this to complement the texure above, to store the depth buffer used for drawing)
 glGenRenderbuffers_(1, @gRbo)
 glBindRenderbuffer_(#GL_RENDERBUFFER, gRbo)
 
 ; we reserve space for the depth buffer (same size as the texture)
 glRenderbufferStorage_(#GL_RENDERBUFFER, #GL_DEPTH_COMPONENT24, #TARGET_TEX_SIZE, #TARGET_TEX_SIZE)
 
 ; we specify also a depth attachment as we did for the color, and we send it to the renderbuffer instead of the texture
 glFramebufferRenderbuffer_(#GL_DRAW_FRAMEBUFFER, #GL_DEPTH_ATTACHMENT, #GL_RENDERBUFFER, gRbo)
 
 ; we check the framebuffer for completeness
 ASSERT (glCheckFramebufferStatus_(#GL_DRAW_FRAMEBUFFER) = #GL_FRAMEBUFFER_COMPLETE)
 
 ; we set all this off for now
 glBindFramebuffer_(#GL_DRAW_FRAMEBUFFER, 0)
 
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("013.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("013.fs", #GL_FRAGMENT_SHADER) 
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
                
        gFon = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges())
                  
        gTimerFPS = sgl::CreateTimer()
        gTimer = sgl::CreateTimer()
        gTimerChild = sgl::CreateTimer()
        
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
 sgl::DestroyTimer(gTimerChild)   
 sgl::DestroyTimer(gTimerFPS)   
 sgl::Shutdown()
EndProcedure

Procedure RenderChild()
 Protected RotTime.f = 6.0 ; seconds to rotate 360.0 degrees
 
 ; this time the size is relative to the texture, not the window
 Protected w = #TARGET_TEX_SIZE
 Protected h = #TARGET_TEX_SIZE
 
 Protected.m4x4::m4x4 model, view, projection
 Protected u_model, u_view, u_projection, u_texUnits, u_old_TV, u_time
 Protected elapsed.f, rot.f
 Protected color.vec3::vec3
 
 vec3::Set(color, 1.0, 1.0, 1.0)
 
 glClearColor_(0.25,0.25,0.5,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 ; since we are not rendering to screen but to a texture, we need so specify the texture size
 BatchRenderer::StartRenderer(w, h) 
 
 BatchRenderer::StartBatch()
 
 Protected *units = sgl::StartData()
  Data.l 0, 0
 sgl::StopData()
 
 glViewport_(0, 0, w, h)

 ; gets how much time has passed from the last full rotation
 elapsed = sgl::GetElapsedTime(gTimerChild)

 ; map this particular instant between 0 and #ROTATION_TIME seconds to a rotation from 0 to 360 degrees
 ; the resulting number is the angle the cube must be rotated at this point in time
 rot = Math::MapToRange5f(elapsed, 0.0, RotTime, 0.0, 360.0)

 ; model
 m4x4::Identity(model)
 m4x4::RotateX(model, -25)
 m4x4::RotateY(model, -rot)
 m4x4::RotateZ(model, 0)
  
 ; view
 m4x4::Identity(view)
 m4x4::TranslateXYZ(view, 0.0, 0.25, -4.0) 
  
 ; projection
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)

 sgl::BindShaderProgram(gShader)
 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 u_texUnits = sgl::GetUniformLocation(gShader, "u_texUnits")
 sgl::SetUniformLongs(u_texUnits, *units, 2)
 
 u_old_TV = sgl::GetUniformLocation(gShader, "u_old_TV")
 sgl::SetUniformLong(u_old_TV, 0)

 u_time = sgl::GetUniformLocation(gShader, "u_time")
 sgl::SetUniformFloat(u_time, 0.0) ; not used for this renderer 

 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gTextureYinYang)
 
 glBindVertexArray_(gVao)
 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
 
 Protected x, y 
  
 x = 1 : y = 0
 If sgl::GetFPS()    
    RenderText::Render(0, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
 EndIf

 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 RenderText::Render(0, gFon, sgl::GetRenderer(), x, y, color)
 
 BatchRenderer::StopBatch() 
 BatchRenderer::Flush() 

 If elapsed > RotTime
    sgl::ResetTimer(gTimerChild)
 EndIf
 
EndProcedure

Procedure Render() 
 Protected w, h, text$ 
 Protected delta.f, elapsed.f
 Protected.m4x4::m4x4 model, projection, view
 Protected u_model, u_view, u_projection, u_texUnits, u_old_TV, u_old_TV_settings, u_time
 Protected txtColor.vec3::vec3, backColor.vec4::vec4

 ; we enable rendering to texture
 SetRenderTargetToTexture()
 
 ; we render the scene with the black textured cube
 RenderChild()
 
 ; now we revert to rendering to screen
 SetRenderTargetToDefault()

 Static firstRun = 1
 Static GUIenabled = 0
 Static renderToTexture = 1
 Static oldTV = 1
 Static rot.f
 Static direction.f = 1.0
 Static Dim tv_settings.f(6)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h) 
 
 Protected *units = sgl::StartData()
  Data.l 0, 1
 sgl::StopData()
 
 glClearColor_(0.15,0.20,0.30,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 If rot > 30
    direction = -1.0
 ElseIf rot < -30
    direction = 1.0
 EndIf
   
 elapsed = sgl::GetElapsedTime(gTimer)
 delta = sgl::GetDeltaTime(gTimer)
 rot + delta * 10 * direction
  
 ; model
 m4x4::Identity(model)
 m4x4::RotateX(model, -22.0)
 m4x4::RotateY(model, rot)
 
 ; view
 m4x4::Identity(view)
 m4x4::TranslateXYZ(view, 0.0, 0.15, -3.5) 
 
 ; projection
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
  
 sgl::BindShaderProgram(gShader)
 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)

 u_texUnits = sgl::GetUniformLocation(gShader, "u_texUnits")
 sgl::SetUniformLongs(u_texUnits, *units, 2)
 
 u_old_TV = sgl::GetUniformLocation(gShader, "u_old_TV")
 
 If renderToTexture    
    sgl::SetUniformLong(u_old_TV, oldTV)
 Else
    sgl::SetUniformLong(u_old_TV, 0)
 EndIf
 
 u_time = sgl::GetUniformLocation(gShader, "u_time")
 sgl::SetUniformFloat(u_time, elapsed)
 
 u_old_TV_settings = sgl::GetUniformLocation(gShader, "u_old_TV_settings")
 sgl::SetUniformFloats(u_old_TV_settings, @tv_settings(), 6)
 
 ; this is the texture rendered inside RenderChild()
 glActiveTexture_(#GL_TEXTURE0)
 
 If renderToTexture
    glBindTexture_(#GL_TEXTURE_2D, gTargetTexture)
 Else
    glBindTexture_(#GL_TEXTURE_2D, 0)
 EndIf
 
 ; and this is the checkered pattern used for the container cube we draw in this scene
 glActiveTexture_(#GL_TEXTURE1)
 glBindTexture_(#GL_TEXTURE_2D, gTexture)
 
 glBindVertexArray_(gVao)
 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
 
 BatchRenderer::StartRenderer(w, h) 
 BatchRenderer::StartBatch()

 If firstRun
    imgui::SetPos (5, 5) ; the position will be relative to the movable background    
    imgui::SetBackgroundPos (5, h - 220)
    
    tv_settings(0) = 0.20  ; vertical jerk
    tv_settings(1) = 0.20  ; vertical roll
    tv_settings(2) = 0.75  ; background static 
    tv_settings(3) = 1.25  ; scanlines
    tv_settings(4) = 0.75  ; RGB offset
    tv_settings(5) = 0.30  ; horizontal fluttering
    
    firstRun = 0
 EndIf
 
 ; text info 
 Protected x, y 
 
 ; top
 vec3::Set(txtColor, 1.0, 1.0, 1.0)
 
 x = 1 : y = 0
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, txtColor)
 EndIf

 ; bottom
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 text$ = sgl::GetRenderer()
 RenderText::Render(gWin, gFon, text$, x, y, txtColor)
 
 ; GUI
 imgui::NewFrame (gWin)
 
 text$ = std::IIFs(GUIenabled, "Hide GUI", "Show GUI")
 
 If imgui::GuiButton(imgui::ID(), text$, 80)
    GUIenabled ! 1
    
    If GUIenabled
        imgui::SetBackgroundPos (5, h - 220)
    EndIf
 EndIf
 
 If GUIenabled
    Protected width = 200
    
    ; fake window           
    vec4::Set(backColor, 0.0, 0.0, 0.0, 0.85)    
    imgui::Background(imgui::ID(), "Settings", 350, 200, backColor)
    
    imgui::CheckBox(imgui::ID(), @renderToTexture, "Render to Texture")
    imgui::NewLine()
    
    If oldTV
        text$ = "Old TV enabled"
    Else
        text$ = "Old TV disabled"
    EndIf
    
    imgui::CheckBox(imgui::ID(), @oldTV, text$)
    imgui::NewLine()
    
    imgui::SliderFloat(imgui::ID(), @tv_settings(0), 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Vertical Jerk")
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @tv_settings(1), 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Vertical Roll")
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @tv_settings(2), 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Background Static")
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @tv_settings(3), 0.0, 2.0, width)
    imgui::Text(imgui::ID(), "Scanlines")
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @tv_settings(4), 0.0, 2.0, width)
    imgui::Text(imgui::ID(), "RGB Offset")
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @tv_settings(5), 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Horizontal Fluttering")
    imgui::NewLine()
 EndIf
  
 BatchRenderer::StopBatch() 
 BatchRenderer::Flush() 
EndProcedure

Procedure MainLoop()

 BatchRenderer::Init(5000)
 
 imgui::Init("../../extras/Fonts/bmf/")

 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::IsWindowMinimized(gWin) = 0
        Render()
        sgl::TrackFPS()
    EndIf     
    
    sgl::PollEvents()
    
    sgl::SwapBuffers(gWin) 
 Wend
 
 BatchRenderer::Destroy()
EndProcedure

Procedure Main()
 Startup()
 SetupData()
 MainLoop()    
 ShutDown()
EndProcedure

Main()

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 408
; FirstLine = 378
; Folding = ---
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\013\013.exe
; CPU = 1
; CompileSourceDirectory