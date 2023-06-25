; This is similar to the previous one, but the concept of "material" is introduced together with diffusion and specular maps.
; Now different materials could be potentially associated to different parts of the object, and the diffusion map consent to modulate
; the diffusion color not just for a whole face like before but for a single pixel. 
; The specular map used in this example "wood_container_specular.png" has lighter colors used in the metal frame which runs around the box,
; and in the shader the specular color is multiplied by this specular map, giving a stronger effect on the metal part and a weaker one on 
; the wood part.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText/RenderText.pb"

UseModule gl

#TITLE$ = "Phong, materials, specular map (330)"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gVSync = #VSYNC 
Global gAmbientOn, gSpecularOn, gDiffuseOn
Global gShader, gLightShader
Global gDiffuseMap, gSpecularMap, gLampTex
Global gVao, gLightVao
Global gFon
Global gTimer

DataSection
 DiffuseMap:
 IncludeBinary "../assets/wood_container.png"
 SpecularMap:
 IncludeBinary "../assets/wood_container_specular.png"
 lamp:
 IncludeBinary "../assets/lamp.png"   
EndDataSection

Declare   CallBack_WindowRefresh (win)
Declare   CallBack_Error (source$, desc$)
Declare   SetupData()
Declare   SetupContext()
Declare   ShutDown()
Declare   Render()
Declare   MainLoop()
Declare   Main()
 
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
 Protected vbo, ibo, lightVbo
 
 Protected *vertex_light = sgl::StartData() 
  ; 3 * vertex_pos + 2 * tex_coord 
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0 ; one simple quad 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
 sgl::StopData()

 Protected *vertex = sgl::StartData()   
  ; 3 * vertex_pos + 2 * tex_coord + 3 * normals
  
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0,   0.0,  0.0,  1.0 ; front 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0,   0.0,  0.0,  1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0,   0.0,  0.0,  1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0,   0.0,  0.0,  1.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 0.0,   0.0,  0.0, -1.0 ; back 
  Data.f -1.0,  1.0, -1.0,   1.0, 1.0,   0.0,  0.0, -1.0
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0,   0.0,  0.0, -1.0
  Data.f  1.0, -1.0, -1.0,   0.0, 0.0,   0.0,  0.0, -1.0
                    
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,   0.0,  1.0,  0.0 ; top
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   0.0,  1.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,   0.0, -1.0,  0.0 ; bottom
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   0.0, -1.0,  0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0,   0.0, -1.0,  0.0
  Data.f -1.0, -1.0,  1.0,   0.0, 1.0,   0.0, -1.0,  0.0
                  
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   1.0,  0.0,  0.0 ; right
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0,   1.0,  0.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,  -1.0,  0.0,  0.0 ; left
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0,  1.0,   1.0, 1.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,  -1.0,  0.0,  0.0
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
 
 ; the OBJECT
 
 ; vertex array
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 ; vertex buffer
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 ; 24 vertices made by 8 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 8 * SizeOf(Float), *vertex, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 8 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coord
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 8 * SizeOf(Float), 3 * SizeOf(Float))

 glEnableVertexAttribArray_(2) ; normals
 glVertexAttribPointer_(2, 3, #GL_FLOAT, #GL_FALSE, 8 * SizeOf(Float), 5 * SizeOf(Float))

 ; index buffer
 glGenBuffers_(1, @ibo)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 ; 36 indices made by 1 long each
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 36  * SizeOf(Long), *indices, #GL_STATIC_DRAW)

 
 ; ... and the LIGHT
 
 ; vertex array
 glGenVertexArrays_(1, @gLightVao)
 glBindVertexArray_(gLightVao)
 
 ; vertex buffer
 glGenBuffers_(1, @lightVbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, lightVbo)
 ; 4 vertices made by 5 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 4 * 5 * SizeOf(Float), *vertex_light, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coord
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 3 * SizeOf(Float))
 
 ; we can share the same index buffer
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 glBindVertexArray_(0) ; we are done

 ; Shaders
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("009.phong.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("009.phong.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
 

 vs = sgl::CompileShaderFromFile("009.light.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("009.light.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gLightShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gLightShader)
  
 ; Textures 
 
  ; build textures
 gDiffuseMap = CatchTexture(?DiffuseMap) 
 gSpecularMap = CatchTexture(?SpecularMap) 
 gLampTex = CatchTexture(?lamp)
 
 ; Timers
 
 gTimer = sgl::CreateTimer()

 ; Fonts 
 
 Dim ranges.sgl::BitmapFontRange(0)
 ; Latin (ascii)
 ranges(0)\firstChar  = 32
 ranges(0)\lastChar   = 128               
 gFon = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges()) 
 ASSERT(gFon)
  
EndProcedure

Procedure SetupContext() 
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
             
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 
 End 
EndProcedure

Procedure ShutDown()
 sgl::DestroyTimer(gTimer)
 sgl::Shutdown()
EndProcedure

Procedure Render()
 Protected w, h, text$ 
 Protected delta.f
 Protected distance.f = 5.0
 Protected u_model, u_view, u_projection
 Protected u_light, u_material, u_lamp, u_eye
 
 Protected.m4x4::m4x4 model, projection, view
 Protected.vec3::vec3 eye, lampColor

 vec3::Set(eye, 0.0, 0.0, 0.0)
 
 Structure Light
  vPos.vec3::vec3
  vAmbientColor.vec3::vec3
  vDiffuseColor.vec3::vec3  
  vSpecularColor.vec3::vec3
 EndStructure
 
 Protected Light.Light
 
 Structure Material
  diffuseMap.i
  specularMap.i
  shiness.f
 EndStructure
 
 Protected Material.Material
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)

 delta = sgl::GetDeltaTime(gTimer)
 
 Static rot.f
 Static orbit.f = 90.0
 
 orbit + 70.0 * delta 
 math::Clamp3f(orbit, 0.0, 360.0)
 
 ; light pos
 Light\vPos\x = Sin(Radian(orbit)) * 3.5
 Light\vPos\y = Sin(Radian(orbit) / 3.0) * 2.0
 Light\vPos\z = Cos(Radian(orbit)) * 3.5
 
 ; material  
 Material\diffuseMap  = 0 ; texture unit 0
 Material\specularMap = 1 ; texture unit 1 
 Material\shiness = 32.0
 
 If gAmbientOn         
    glClearColor_(0.3, 0.3, 0.35, 1.0)
    vec3::Set(Light\vAmbientColor,    0.55, 0.55, 0.55)
    vec3::Set(Light\vDiffuseColor,    0.5, 0.5, 0.5)    
    vec3::Set(Light\vSpecularColor,   1.0, 1.0, 1.0)
    vec3::Set(lampColor, 1.0, 1.0, 1.0)
 Else    
    glClearColor_(0.15, 0.15, 0.2, 1.0)
    vec3::Set(Light\vAmbientColor,    0.2, 0.2, 0.25)
    vec3::Set(Light\vDiffuseColor,    0.0, 0.0, 0.0)
    vec3::Set(Light\vSpecularColor,   0.0, 0.0, 0.0)
    vec3::Set(lampColor, 0.1, 0.1, 0.1)
 EndIf
 
 If gSpecularOn = 0
    vec3::Zero(Light\vSpecularColor)
 EndIf
 
 If gDiffuseOn =  0
    vec3::Zero(Light\vDiffuseColor)
 EndIf
    
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 ; the view matrix and the projection matrix are common to the two shaders
 ; what we need to calculate separately are the two model matrix for the two objects
    
 ; view (both are translated to make them visible in our field of view)
 m4x4::Identity(view)
 m4x4::TranslateXYZ(view, 0.0, 0.0, -distance)
 
 ; projection (the perspective projection is obviously the same)
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
  
 ; this section is for the main object 
 
 rot - 15 * delta 
 math::Clamp3f(rot, 0.0, 360.0)
 
 ; model (the cube will rotate at the origin)
 m4x4::Identity(model)
 m4x4::RotateX(model, -20.0)
 m4x4::RotateY(model, rot)

 sgl::BindShaderProgram(gShader)
 
 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gDiffuseMap)

 glActiveTexture_(#GL_TEXTURE1)
 glBindTexture_(#GL_TEXTURE_2D, gSpecularMap)

 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 u_eye = sgl::GetUniformLocation(gShader, "u_eye")
 sgl::SetUniformVec3(u_eye, eye)

 ; light
 
 u_light = sgl::GetUniformLocation(gShader, "u_light.vPos")
 sgl::SetUniformVec3(u_light, Light\vPos)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vDiffuseColor")
 sgl::SetUniformVec3(u_light, Light\vDiffuseColor)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vAmbientColor")
 sgl::SetUniformVec3(u_light, Light\vAmbientColor)  

 u_light = sgl::GetUniformLocation(gShader, "u_light.vSpecularColor")
 sgl::SetUniformVec3(u_light, Light\vSpecularColor)
 
 ; material 

 u_material = sgl::GetUniformLocation(gShader, "u_material.diffuseMap")
 sgl::SetUniformLong(u_material, Material\diffuseMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.specularMap")
 sgl::SetUniformLong(u_material, Material\specularMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.shiness")
 sgl::SetUniformFloat(u_material, Material\shiness)
 
 glBindVertexArray_(gVao) 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) 

 ; and this section is for the light (a small floating cube)

 ; model (the light will orbit around the origin and spin on itself)
     
 m4x4::Identity(model)
 m4x4::Translate(model, Light\vPos)
 m4x4::ScaleXYZ(model, 0.15, 0.15, 0.15)
 
 sgl::BindShaderProgram(gLightShader)

 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gLampTex)
 
 u_model = sgl::GetUniformLocation(gLightShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gLightShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gLightShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)

 u_lamp  = sgl::GetUniformLocation(gLightShader, "u_lamp.color")
 sgl::SetUniformVec3(u_lamp, @lampColor)

 u_lamp  = sgl::GetUniformLocation(gLightShader, "u_lamp.texture")
 sgl::SetUniformLong(u_lamp, 0)
 
 glEnable_(#GL_BLEND)
 glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA) 
 
 glBindVertexArray_(gLightVao) 
 glDrawElements_(#GL_TRIANGLES, 6, #GL_UNSIGNED_INT, 0) ; our light
 
 glDisable_(#GL_BLEND)
  
 ; text info
 
 Protected x, y 
 Protected.vec3::vec3 color 
 
 ; top
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = 0
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
 EndIf

 vec3::Set(color, 1.0, 1.0, 0.0) 
 x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
 If gAmbientOn 
    text$ = "[L]ight is ON"
 Else
    text$ = "[L]ight is OFF"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)

If gAmbientOn
    vec3::Set(color, 1.0, 1.0, 0.0) 
    x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
    If gSpecularOn = 0 Or gAmbientOn = 0
       text$ = "[S]pecular lighting is OFF"
    Else
       text$ = "[S]pecular lighting is ON"
    EndIf 
    RenderText::Render(gWin, gFon, text$, x, y, color)
    
    vec3::Set(color, 1.0, 1.0, 0.0) 
    x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
    If gDiffuseOn = 0 Or gAmbientOn = 0
       text$ = "[D]iffuse lighting is OFF"
    Else
        text$ = "[D]iffuse lighting is ON"
    EndIf 
    RenderText::Render(gWin, gFon, text$, x, y, color)
 EndIf 
 
 ; bottom
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 text$ = sgl::GetRenderer()
 RenderText::Render(gWin, gFon, text$, x, y, color)

 sgl::SwapBuffers(gWin)
EndProcedure

Procedure MainLoop()

 gAmbientOn = 1
 gDiffuseOn = 1
 gSpecularOn = 1
 
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::GetKeyPress(sgl::#Key_V)
        gVSync ! 1
        sgl::EnableVSync(gVSync)
    EndIf

    If sgl::GetKeyPress(sgl::#Key_L)
        gAmbientOn ! 1
    EndIf
    
    If sgl::GetKeyPress(sgl::#Key_S)
        If gAmbientOn
            gSpecularOn ! 1
        EndIf
    EndIf

    If sgl::GetKeyPress(sgl::#Key_D)
        If gAmbientOn
            gDiffuseOn ! 1
        EndIf
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
EndProcedure : Main()
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 512
; FirstLine = 468
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\specular_map.exe
; CPU = 1
; CompileSourceDirectory