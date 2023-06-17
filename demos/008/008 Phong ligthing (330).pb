; A simple recreation of the Phong lighting algorithm (ambient + diffuse + specular)
; A better way would be to assign properties (materials) to every surface, instead this is global to the whole object.
; https://learnopengl.com/Lighting/Basic-Lighting

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_330/RenderText.pb"

UseModule gl

#TITLE$ = "Phong ligthing (330)"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gVSync = #VSYNC 
Global gAmbientOn, gSpecularOn, gDiffuseOn
Global gShader, gLightShader
Global gVao, gLightVao
Global gFon
Global gTimer

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

Procedure SetupData()
  Protected vbo, ibo, lightVbo

 Protected *vertex_light = sgl::StartData()   
  ; 3 * vertex_pos 
  
  Data.f -0.5, -0.5,  0.5 ; front 
  Data.f  0.5, -0.5,  0.5
  Data.f  0.5,  0.5,  0.5
  Data.f -0.5,  0.5,  0.5
                  
  Data.f -0.5, -0.5, -0.5 ; back 
  Data.f -0.5,  0.5, -0.5
  Data.f  0.5,  0.5, -0.5
  Data.f  0.5, -0.5, -0.5
                  
  Data.f -0.5,  0.5, -0.5 ; top
  Data.f -0.5,  0.5,  0.5
  Data.f  0.5,  0.5,  0.5
  Data.f  0.5,  0.5, -0.5
                  
  Data.f -0.5, -0.5, -0.5 ; bottom
  Data.f  0.5, -0.5, -0.5
  Data.f  0.5, -0.5,  0.5
  Data.f -0.5, -0.5,  0.5
                  
  Data.f  0.5, -0.5, -0.5 ; right
  Data.f  0.5,  0.5, -0.5
  Data.f  0.5,  0.5,  0.5
  Data.f  0.5, -0.5,  0.5
                  
  Data.f -0.5, -0.5, -0.5 ; left
  Data.f -0.5, -0.5,  0.5
  Data.f -0.5,  0.5,  0.5
  Data.f -0.5,  0.5, -0.5
 sgl::StopData()
 
 Protected *vertex = sgl::StartData()   
  ; 3 * vertex_pos + 3 * color_rgb + 3 * normals
  
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0 ; front 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
  Data.f -1.0,  1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0 ; back 
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
  Data.f  1.0, -1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
                  
  Data.f -1.0,  1.0, -1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0 ; top
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0,  1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0, -1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0 ; bottom
  Data.f  1.0, -1.0, -1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
  Data.f -1.0, -1.0,  1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
                  
  Data.f  1.0, -1.0, -1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0 ; right
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0, -1.0,  1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0 ; left
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0,  1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0, -1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
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
 ; 24 vertices made by 9 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 9 * SizeOf(Float), *vertex, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; colors
 glVertexAttribPointer_(1, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 3 * SizeOf(Float))

 glEnableVertexAttribArray_(2) ; normals
 glVertexAttribPointer_(2, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 6 * SizeOf(Float))

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
 ; 24 vertices made by 3 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 3 * SizeOf(Float), *vertex_light, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 3 * SizeOf(Float), 0)
 
 ; we can share the same index buffer
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 glBindVertexArray_(0) ; we are done

 ; Shaders
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("008.phong.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("008.phong.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
 

 vs = sgl::CompileShaderFromFile("008.light.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("008.light.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gLightShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gLightShader)
  
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
 Protected distance.f = 6.0
 Protected u_model, u_view, u_projection
 Protected u_light, u_lampColor, u_eye
 
 Protected.m4x4::m4x4 model, projection, view
 Protected.vec3::vec3 eye, lampColor

 vec3::Set(eye, 0.0, 0.0, 0.0)
 
 Structure Light
  vPos.vec3::vec3
  vDiffuseColor.vec3::vec3  
  vAmbientColor.vec3::vec3
  vSpecularColor.vec3::vec3
  shiness.f
 EndStructure
 
 Protected Light.Light 
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)

 delta = sgl::GetDeltaTime(gTimer)
 
 Static rot.f
 Static orbit.f = 90.0
 
 orbit + 80.0 * delta 
 math::Clamp3f(orbit, 0.0, 360.0)
 
 Light\vPos\x = Sin(Radian(orbit)) * 3.5
 Light\vPos\y = Sin(Radian(orbit) / 5.0) * 2.0
 Light\vPos\z = Cos(Radian(orbit)) * 3.5
 
 Light\shiness = 24.0
 
 If gAmbientOn         
    glClearColor_(0.3, 0.3, 0.4, 1.0)
    vec3::Set(Light\vAmbientColor,    0.4, 0.4, 0.5)
    vec3::Set(Light\vDiffuseColor,    0.5, 0.5, 0.5)    
    vec3::Set(Light\vSpecularColor,   0.2, 0.2, 0.2)
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
 
 rot - 20 * delta 
 math::Clamp3f(rot, 0.0, 360.0)
 
 ; model (the cube will rotate at the origin)
 m4x4::Identity(model)
 m4x4::RotateX(model, rot)
 m4x4::RotateY(model, rot)

 sgl::BindShaderProgram(gShader)
 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 u_eye = sgl::GetUniformLocation(gShader, "u_eye")
 sgl::SetUniformVec3(u_eye, eye)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vPos")
 sgl::SetUniformVec3(u_light, Light\vPos)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vDiffuseColor")
 sgl::SetUniformVec3(u_light, Light\vDiffuseColor)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vAmbientColor")
 sgl::SetUniformVec3(u_light, Light\vAmbientColor)  

 u_light = sgl::GetUniformLocation(gShader, "u_light.vSpecularColor")
 sgl::SetUniformVec3(u_light, Light\vSpecularColor)
 
 u_light = sgl::GetUniformLocation(gShader, "u_light.shiness")
 sgl::SetUniformFloat(u_light, Light\shiness)
 
 glBindVertexArray_(gVao) 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) 

 ; and this section is for the light (a small floating cube)

 ; model (the light will orbit around the origin and spin on itself)
     
 m4x4::Identity(model)
 m4x4::Translate(model, Light\vPos)
 m4x4::ScaleXYZ(model, 0.1, 0.1, 0.1)
 m4x4::RotateY(model, rot * 10)
 
 sgl::BindShaderProgram(gLightShader)
 
 u_model = sgl::GetUniformLocation(gLightShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gLightShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gLightShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)

 u_lampColor = sgl::GetUniformLocation(gLightShader, "u_lampColor")
 sgl::SetUniformVec3(u_lampColor, @lampColor)
 
 glBindVertexArray_(gLightVao) 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; our light
 
 ; text info
 
 Protected x, y 
 Protected.vec3::vec3 color 
 
 ; top
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
 EndIf

 vec3::Set(color, 1.0, 1.0, 0.0) 
 x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
 If gAmbientOn 
    text$ = "[L]ight is ON"
 Else
    text$ = "[L]ight is OFF"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)

 vec3::Set(color, 1.0, 1.0, 0.0) 
 x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
 If gSpecularOn = 0 Or gAmbientOn = 0
    text$ = "[S]pecular lighting is OFF"
 Else
    text$ = "[S]pecular lighting is ON"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)

 vec3::Set(color, 1.0, 1.0, 0.0) 
 x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
 If gDiffuseOn = 0 Or gAmbientOn = 0
    text$ = "[D]iffuse lighting is OFF"
 Else
    text$ = "[D]iffuse lighting is ON"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)
 
 ; bottom
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = 0
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
; IDE Options = PureBasic 6.03 beta 1 LTS (Windows - x86)
; CursorPosition = 212
; FirstLine = 208
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\phong.exe
; CPU = 1
; CompileSourceDirectory