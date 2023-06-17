; Test of the RenderText() for OpenGL 3.30

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "RenderText.pb"

#TITLE$ = "RenderText test 3.30"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 0

#HowMany = 100
           
Global gWin
Global gTimerFPS
Global gFon1
Global gFon2
Global gFon3

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
 sgl::DestroyTimer(gTimerFPS)
 RenderText::DestroyBitmapFont(gFon1) 
 RenderText::DestroyBitmapFont(gFon2) 
 RenderText::DestroyBitmapFont(gFon3) 
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h
 Protected x, y, i, text$, color.vec3::vec3
 Dim text$(2)
 Dim color.vec3::vec3(2)
 Dim font(2)
 
 Structure obj
  x.i
  y.i
  color.i
  textId.i
  fnt.i
 EndStructure : Static Dim obj.obj(#HowMany - 1)
 
 text$(0) = "Hello World !"
 vec3::Set(color(0), 1.0, 1.0, 0.0)
 font(0) = gFon1
 
 text$(1) = "The quick brown fox jumps over the lazy dog."
 vec3::Set(color(1), 0.0, 1.0, 0.0)
 font(1) = gFon2
 
 text$(2) = "Nothing is impossible if you don't have to do it yourself."
 vec3::Set(color(2), 0.0, 1.0, 1.0)
 font(2) = gFon3
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 If sgl::GetMouseButton(gWin, sgl::#MOUSE_BUTTON_1) = sgl::#RELEASED
     For i = 0 To #HowMany - 1
        obj(i)\textId = i % 3
        obj(i)\color = i % 3
        obj(i)\x = Random(w) - w / 4
        obj(i)\y = Random(h) - x / 4   
        obj(i)\fnt = i % 3
     Next
 EndIf
 
 glClearColor_(0.1,0.1,0.3,1.0)

 glClear_(#GL_COLOR_BUFFER_BIT)
  
 glViewport_(0, 0, w, h)

 For i = 0 To #HowMany - 1
    RenderText::Render(gWin, font(obj(i)\fnt), text$(obj(i)\textId), obj(i)\x, obj(i)\y, color(obj(i)\color))    
 Next
 
 vec3::Set(color, 1.0, 1.0, 1.0)
  
 text$ = "FPS: " + sgl::GetFPS()
 y = h - RenderText::GetFontHeight(gFon1)
 RenderText::Render(gWin, gFon1, text$, x, y, color) 
   
 text$ = sgl::GetRenderer()
 y = 0
 RenderText::Render(gWin, gFon1, text$, x, y, color)
 
 ; every second
 If sgl::GetElapsedTime(gTimerFPS) >= 1.0
    If sgl::GetFPS()
        sgl::SetWindowText(gWin, #TITLE$ + " (" + sgl::GetFPS() + " FPS)")
        sgl::ResetTimer(gTimerFPS)
    EndIf
 EndIf
EndProcedure

Procedure MainLoop()   

 Dim ranges.sgl::BitmapFontRange(0)
 
 ; Latin (ascii)
 ranges(0)\firstChar  = 32
 ranges(0)\lastChar   = 128
 
 gFon1 = RenderText::CreateBitmapFont("Consolas", 10, #Null, ranges())
 
 ASSERT(gFon1)
 
 gFon2 = RenderText::CreateBitmapFont("Monaco", 14, #Null, ranges())

 ASSERT(gFon2)
 
 gFon3 = RenderText::CreateBitmapFont("Arial", 16, #Null, ranges())
 
 ASSERT(gFon3)
 
 gTimerFPS = sgl::CreateTimer()
   
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
EndProcedure

Procedure Main()
 Startup() 
 MainLoop()    
 ShutDown()
EndProcedure

Main()
; IDE Options = PureBasic 6.03 beta 1 LTS (Windows - x86)
; CursorPosition = 159
; FirstLine = 141
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\render_text_330.exe
; CPU = 1
; DisableDebugger
; CompileSourceDirectory