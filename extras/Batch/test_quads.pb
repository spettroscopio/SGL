; Test of the Quad Batch Renderer () for OpenGL 3.30
; Colored Quads (with alpha blending)

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "BatchRenderer.pb"

IncludeFile "../RenderText/RenderText.pb"

#TITLE$ = "Quad Batch Renderer"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 0

#QUAD_SIZE = 25
           
Global gWin
Global gFon1

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
 RenderText::DestroyBitmapFont(gFon1) 
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h
 Protected x, y, i, text$, color.vec3::vec3, qc.vec4::vec4
 Protected.BatchRenderer::stats info
 Protected fh = RenderText::GetFontHeight(gFon1)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 glClearColor_(0.0,0.0,0.0,1.0)

 glClear_(#GL_COLOR_BUFFER_BIT)
  
 glViewport_(0, 0, w, h)
 
 BatchRenderer::StartRenderer(w, h)
  
 BatchRenderer::StartBatch()
 
  Protected xq, yq, wq, hq
  
  wq = #QUAD_SIZE
  hq = #QUAD_SIZE
 
  ; all these are batched
  
  For yq = 0 To h Step #QUAD_SIZE + 4
    For xq = 0 To w Step #QUAD_SIZE + 4
        vec4::Set(qc, Random(100) / 100.0, Random(100) / 100.0, Random(100) / 100.0, 1.0)
        BatchRenderer::DrawQuad(xq, yq, wq, hq, qc)
    Next       
  Next 
  
  ; info area semi transparent
  vec4::Set(qc, 0.0, 0.0, 1.0, 0.8)
  
  ; and these two also batched with all the above
  BatchRenderer::DrawQuad(0, 0, w, fh*3.1, qc)
  BatchRenderer::DrawQuad(0, h-fh*1.1, w, fh*1.1, qc)

 BatchRenderer::StopBatch()
 
 BatchRenderer::Flush() ; remember to flush it at the end
 
 BatchRenderer::GetStats(@info)  
 
 vec3::Set(color, 1.0, 1.0, 1.0)

 x = 0 
 
 Protected fps = sgl::GetFPS()
 Protected frameTime.f  = sgl::GetFrameTime()
 text$ = str::Sprintf("FPS: %i, Frame: %.2f ms", @fps, @frameTime)
 y = 0
 RenderText::Render(gWin, gFon1, text$, x, y, color)
 
 Protected bytes$ = str::FormatBytes(info\bufferSizeInBytes, str::#FormatBytes_Memory, 1)
 text$ = str::Sprintf("Buffer size in quads: %i, in bytes: %s", @info\bufferSizeInQuads, @bytes$)
 y + fh
 RenderText::Render(gWin, gFon1, text$, x, y, color) 
 
 text$ = str::Sprintf("Quads drawn: %i, Draw calls: %i", @info\totalQuadsDrawn, @info\drawCalls)
 y + fh
 RenderText::Render(gWin, gFon1, text$, x, y, color) 

 y = h - fh
 text$ = sgl::GetRenderer()
 RenderText::Render(gWin, gFon1, text$, x, y, color)
   
EndProcedure

Procedure MainLoop()   

 Dim ranges.sgl::BitmapFontRange(0)
 
 ; Latin (ascii)
 ranges(0)\firstChar  = 32
 ranges(0)\lastChar   = 128
 
 gFon1 = RenderText::CreateBitmapFont("Consolas", 10, #Null, ranges())
 ASSERT(gFon1)
 
 BatchRenderer::Init(5000)
   
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf        
    
    If sgl::IsWindowMinimized(gWin) = 0    
        sgl::StartFrameTimer()
        
        Render()
        
        sgl::TrackFPS()
        sgl::StopFrameTimer()    
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
; CursorPosition = 86
; FirstLine = 82
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\batch_renderer.exe
; CPU = 1
; DisableDebugger
; CompileSourceDirectory