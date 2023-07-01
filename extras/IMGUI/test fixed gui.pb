; Test of a simple IMGUI using the batch renderer (Array Textures)

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../Batch_ ArrayTexture/BatchRenderer.pb"
IncludeFile "../RenderText_Batch _ArrayTexture/RenderText.pb"
IncludeFile "imgui.pb"

#TITLE$ = "IMGUI example"
#WIN_WIDTH = 800
#WIN_HEIGHT = 600
#VSYNC = 0

#HowMany = 100
           
Global gWin
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
 RenderText::DestroyBitmapFont(gFon)
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h, x, y, nl
 Protected text$, txtColor.vec3::vec3
 Protected fh = RenderText::GetFontHeight(gFon)
 
 Static firstRun = 1
 Static GUIenabled = 1
 Static float1.f = 0.25, float2.f = 0.75
 Static int1 = 4, int2 = 0
 Static btn1_count, btn2_count
 Static check = 1
 Static enum = 0
 
 Static.vec4::vec4 rgb1, rgb2
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
  
 glClearColor_(0.05,0.05,0.1,1.0)

 glClear_(#GL_COLOR_BUFFER_BIT)
  
 glViewport_(0, 0, w, h)

 BatchRenderer::StartRenderer(gWin) 
 BatchRenderer::StartBatch()
 
 imgui::NewFrame (gWin)
 
 If firstRun 
    imgui::SetPos (25, 50)
    vec4::Set(rgb1, 1.0, 1.0, 0.0, 1.0)
    vec4::Set(rgb2, 0.0, 1.0, 1.0, 1.0)
    firstRun = 0    
 EndIf
 
 If GUIenabled 
    nl = 5

    If imgui::Button(imgui::ID(), "Button 1")
        btn1_count + 1        
    EndIf
     
    If btn1_count
        imgui::Text(imgui::ID(), "count : " + Str(btn1_count))
    EndIf
       
    imgui::NewLine(nl)
    
    If imgui::Button(imgui::ID(), "Button 2", 200, 50)
         btn2_count + 1
    EndIf

    If btn2_count
        imgui::AddY(15)
        imgui::Text(imgui::ID(), "count : " + Str(btn2_count))
    EndIf
     
    imgui::NewLine(nl)
     
    imgui::Text(imgui::ID(), "Some text.")
    imgui::NewLine(nl)
     
    imgui::Text(imgui::ID(), "Some other text but a little longer.")
    imgui::NewLine(nl)
     
    imgui::SliderFloat(imgui::ID(), @float1, 0.0, 1.0, 150)
    imgui::Text(imgui::ID(), "float (from 0.0 to 1.0)")
    imgui::NewLine(nl)
    
    imgui::SliderFloat(imgui::ID(), @float2, -1.0, 1.0, 300, 30)
    imgui::AddY(10)
    imgui::Text(imgui::ID(), "float (from -1.0 to 1.0)")
    imgui::NewLine(nl)
     
    imgui::SliderInt(imgui::ID(), @int1, 1, 5, 150)
    imgui::Text(imgui::ID(), "int (from 1 to 5)")
    imgui::NewLine(nl)

    imgui::SliderInt(imgui::ID(), @int2, -10, 30, 150, 40)
    imgui::AddY(10)
    imgui::Text(imgui::ID(), "int (from -10 to 30)")
    imgui::NewLine(nl)
    
    imgui::CheckBox(imgui::ID(), @check, "CheckBox")
    imgui::NewLine(nl)
     
    imgui::Text(imgui::ID(), "Enumeration : ") 
    imgui::SliderEnum(imgui::ID(), @enum, "alfa,beta,gamma,delta", 120)
    imgui::NewLine(nl)

    imgui::Text(imgui::ID(), "Color using bytes : ") 
    imgui::SetX(180)
    imgui::SliderRGB(imgui::ID(), @rgb1, imgui::#Bytes, 70)
    imgui::NewLine(nl)

    imgui::Text(imgui::ID(), "Color using floats : ") 
    imgui::SetX(180)
    imgui::SliderRGB(imgui::ID(), @rgb2, imgui::#Floats, 70)
    imgui::NewLine(nl)

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
 
 BatchRenderer::Init(5000)
 
 imgui::Init(12)
   
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
; CursorPosition = 149
; FirstLine = 128
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\imgui\test1.exe
; CPU = 1
; CompileSourceDirectory