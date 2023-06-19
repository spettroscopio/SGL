; An example of how a shader can replace the sampling from a texture by dynamicall calculating the color of every pixels in real time

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_330/RenderText.pb"

UseModule gl

#TITLE$ = "Dynamic shader instead of a texture (330)" 
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gVSync = #VSYNC 
Global gShader
Global gFon
Global gTimer
Global gVao
Global Dim gTextures(5)

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

Procedure.i RandomColor()
 Protected r, g, b
 r = Random(255, 64)
 g = Random(255, 64)
 b = Random(255, 64)
 ProcedureReturn RGB(r,g,b)
EndProcedure

Procedure SetupData()
  Protected vbo, ibo

 Protected *vertex = sgl::StartData()   
  ; 3 * vertex_pos + 2 * texture_coord + 1
  
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 1.0
  Data.f -1.0,  1.0, -1.0,   0.0, 0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 0.0
  Data.f  1.0, -1.0, -1.0,   1.0, 1.0
                  
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0
  Data.f -1.0, -1.0,  1.0,   0.0, 1.0
                  
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0
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
 
 ; Shaders
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("012.algo.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("012.algo.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
  
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
 Protected delta.f, time.f
 Protected.m4x4::m4x4 model, view, projection
 Protected u_model, u_view, u_projection, u_time, u_morph1, u_morph2
 
 Static rot.f
 Static morph1.f = 1.0
 Static morph2.f = 0.25
 Static morph2Inc.f = 0.15

 glClearColor_(0.25,0.25,0.5,1.0)
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)

 time = sgl::GetElapsedTime(gTimer)
 
 delta = sgl::GetDeltaTime(gTimer)
 
 morph1 = math::Cycle3f(morph1, 1.0, 8.0) 
 morph1 + delta * 0.1

 If morph2 > 0.75
    morph2Inc = -0.15
 EndIf
 
 If morph2 < -0.5    
    morph2Inc = 0.15
 EndIf
 
 morph2 + delta * morph2Inc
 
 rot - 15  * delta 
 math::Clamp3f(rot, 0.0, 360.0)
 
 ; model (the cube will rotate at the origin)
 m4x4::Identity(model)
 m4x4::RotateX(model, -25.0)
 m4x4::RotateY(model, rot)
  
 ; view 
 m4x4::Identity(view)
 m4x4::TranslateXYZ(view, 0.0, 0.0, -4.0)
 
 ; projection (the perspective projection is obviously the same)
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
  
 sgl::BindShaderProgram(gShader)
 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)

 u_time = sgl::GetUniformLocation(gShader, "u_time")
 sgl::SetUniformFloat(u_time, time)
 
 u_morph1 = sgl::GetUniformLocation(gShader, "u_morph1")
 sgl::SetUniformFloat(u_morph1, morph1)
 
 u_morph2 = sgl::GetUniformLocation(gShader, "u_morph2")
 sgl::SetUniformFloat(u_morph2, morph2)

 glBindVertexArray_(gVao)
 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) ; 36 indices to build the quads 
  
 ; text info
 
 Protected x, y 
 Protected.vec3::vec3 color 
 
 ; top
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
 EndIf

 ; bottom
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = 0
 text$ = sgl::GetRenderer()
 RenderText::Render(gWin, gFon, text$, x, y, color)
 
 If time > 30.0
    sgl::ResetTimer(gTimer)
 EndIf
 
 sgl::SwapBuffers(gWin)
EndProcedure

Procedure MainLoop()

 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::GetKeyPress(sgl::#Key_V)
        gVSync ! 1
        sgl::EnableVSync(gVSync)
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
; CursorPosition = 160
; FirstLine = 153
; Folding = --
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\012.exe
; CPU = 1
; CompileSourceDirectory