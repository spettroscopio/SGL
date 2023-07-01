; Test of a simple IMGUI using the batch renderer (Array Textures)

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../Batch_ ArrayTexture/BatchRenderer.pb"
IncludeFile "../RenderText_Batch _ArrayTexture/RenderText.pb"
IncludeFile "imgui.pb"

#TITLE$ = "IMGUI example"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 0

#HowMany = 100
           
Global gWin
Global gTimer
Global gFon

Declare   CallBack_Error (source$, desc$)
Declare   Startup()
Declare   ShutDown()
Declare   Render()
Declare   MainLoop()
Declare   Main()

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure Startup() 
 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_CORE)
     
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
           
     gWin = sgl::CreateWindow(#WIN_WIDTH, #WIN_HEIGHT, #TITLE$)
     
     If gWin
        sgl::MakeContextCurrent(gWin)
                
        glLoad::Load()
     
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
 RenderText::DestroyBitmapFont(gFon)
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h, x, y
 Protected i, size
 Protected txtColor.vec3::vec3, backColor.vec4::vec4
 Protected fh = RenderText::GetFontHeight(gFon)
 Protected.BatchRenderer::stats info
 Protected delta.f, elapsed.f
 Protected text$
  
 Static firstRun = 1
 Static GUIenabled = 1
 Static.f deg 
 
 Static Dim qx.f(4) 
 Static Dim qy.f(4) 
 Static Dim qw(4) 
 Static Dim qh(4) 
 Static Dim direction(4)
 Static Dim qcol.vec4::vec4(4)
 
 Static run = 1
 Static amplitude.f = 0.5
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
  
 glClearColor_(0.25,0.25,0.35,1.0)

 glClear_(#GL_COLOR_BUFFER_BIT)
  
 glViewport_(0, 0, w, h)
 
 delta = sgl::GetDeltaTime(gTimer)
 elapsed = sgl::GetElapsedTime(gTimer)
 
 BatchRenderer::GetStats(@info)
 
 BatchRenderer::StartRenderer(gWin) 
 BatchRenderer::StartBatch()
 
 imgui::NewFrame (gWin)
 
 text$ = std::IIFs(GUIenabled, "Hide GUI", "Show GUI")
 
 If imgui::GuiButton(imgui::ID(), text$, 80)
    GUIenabled ! 1
 EndIf
 
 If firstRun 
    qw(0) = 250
    qh(0) = 250
    
    qw(1) = 150
    qh(1) = 150
    
    qw(2) = 150
    qh(2) = 150

    qw(3) = 150
    qh(3) = 150
    
    For i = 0 To 3
        direction(i) = 1
    Next
    
    vec4::Set(qcol(0), 1.0, 1.0, 1.0, 1.0)
    vec4::Set(qcol(1), 1.0, 0.0, 0.0, 1.0)
    vec4::Set(qcol(2), 0.0, 0.8, 0.0, 1.0)
    vec4::Set(qcol(3), 0.0, 0.0, 1.0, 1.0)
    
    imgui::SetPos (5, 5) ; the position will be relative to the movable background
    imgui::SetBackgroundPos(5, h - 200)
    
    firstRun = 0   
 EndIf
 
 If run
     deg + delta * 150
    
     qx(0) + delta * 100 * direction(0)
     qy(0) = h/2 - qw(0) / 2 + Sin(Radian(deg)) * (h/2 * amplitude)
    
     qx(1) + delta * 180 * direction(1)
     qy(1) = 100
    
     qx(2) + delta * 240 * direction(2)
     qy(2) = h/2 - qh(2)/2

     qx(3) + delta * 300 * direction(3)
     qy(3) = h - qh(3) - 100
      
     math::Clamp3f(deg, 0.0, 360.0)
 EndIf
 
 ; draw quads
 
 BatchRenderer::DrawQuad (qx(1), qy(1), qw(1), qh(1), qcol(1)) 
 BatchRenderer::DrawQuad (qx(2), qy(2), qw(2), qh(2), qcol(2)) 
 BatchRenderer::DrawQuad (qx(3), qy(3), qw(3), qh(3), qcol(3)) 
 
 BatchRenderer::DrawQuad (qx(0), qy(0), qw(0), qh(0), qcol(0)) 
 
 ; bounce logic 
 
 For i = 0 To 3
     If (qx(i) + qw(i) > w) 
        direction(i) = -1
     EndIf
     If qx(i) < 0
        direction(i) = 1 
     EndIf
 Next

 ; GUI
  
 If GUIenabled
    Protected width = 220
    
    ; fake window           
    vec4::Set(backColor, 0.0, 0.0, 0.0, 0.85)    
    imgui::Background(imgui::ID(), "Big Quad Settings", 350, 180, backColor)
    
    text$ = str::Sprintf("Quads drawn: %i, Draw calls: %i", @info\totalQuadsDrawn, @info\drawCalls)
    imgui::Text(imgui::ID(), text$)
    imgui::NewLine()

    text$ = str::Sprintf("Elapsed time: %.3f", @elapsed)
    imgui::Text(imgui::ID(), text$)
    imgui::NewLine(15)
        
    imgui::SliderInt(imgui::ID(), @qw(0), 30, 450, width)
    imgui::Text(imgui::ID(), "Size")
    qh(0) = qw(0)
    imgui::NewLine()
  
    imgui::SliderRGB(imgui::ID(), @qcol(0), imgui::#Bytes, 60)
    imgui::Text(imgui::ID(), "Color") 
    imgui::NewLine()

    imgui::SliderFloat(imgui::ID(), @qcol(0)\w, 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Alpha")    
    imgui::NewLine()
    
    imgui::SliderFloat(imgui::ID(), @amplitude, 0.0, 1.0, width)
    imgui::Text(imgui::ID(), "Sin(x) amplitude")
    imgui::NewLine()
    
    imgui::CheckBox(imgui::ID(), @run, "Run")
    imgui::NewLine()
 EndIf

 ; text color 
 vec3::Set(txtColor, 1.0, 1.0, 1.0)
 
 text$ = "FPS: " + sgl::GetFPS()
 y = 0
 RenderText::Render(gWin, gFon, text$, x, y, txtColor)
     
 text$ = sgl::GetRenderer()
 y = h - fh
 RenderText::Render(gWin, gFon, text$, x, y, txtColor)

 BatchRenderer::StopBatch() 
 BatchRenderer::Flush() 
EndProcedure

Procedure MainLoop()   

 Dim ranges.sgl::BitmapFontRange(0)
 
 ; Latin (ascii)
 ranges(0)\firstChar  = 32
 ranges(0)\lastChar   = 128
 
 gFon = RenderText::CreateBitmapFont("Consolas", 10, #Null, ranges()) 
 ASSERT(gFon)
 
 gTimer = sgl::CreateTimer()
 
 BatchRenderer::Init(5000)
 
 imgui::Init()
   
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
 MainLoop()    
 ShutDown()
EndProcedure

Main()
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 198
; FirstLine = 194
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\imgui\test2.exe
; CPU = 1
; DisableDebugger
; CompileSourceDirectory