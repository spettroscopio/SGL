; Test of the Quad Batch Renderer () for OpenGL 3.30
; Textured Quads (with alpha blending)

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "BatchRenderer.pb"

IncludeFile "../RenderText/RenderText.pb"

#TITLE$ = "Textured Quad Batch Renderer using Array Textures"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 0

#QUAD_SIZE = 36

Global gWin
Global gFon1
Global gRandom
Global gAlphaTexture
Global gTimer
Global Dim gGenTextures(9)

Declare   CallBack_Error (source$, desc$)
Declare   Startup()
Declare   ShutDown()
Declare   Render()
Declare   MainLoop()
Declare   Main()

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure.i BuildAlphaTexture()
 Protected *td.sgl::TexelData
 Protected img1, img2, img3, texture, layer

 img1 = sgl::CreateImage_DiceFace(128, 128, 1, RGB(0,0,0), RGB(0,0,255), 255, 96)
 img2 = sgl::CreateImage_DiceFace(128, 128, 2, RGB(0,0,0), RGB(0,0,255), 255, 96)
 img3 = sgl::CreateImage_DiceFace(128, 128, 3, RGB(0,0,0), RGB(0,0,255), 255, 96)
  
 *td = sgl::CreateTexelData (img1)
 
 glGenTextures_(1, @texture)
 glBindTexture_(#GL_TEXTURE_2D_ARRAY, texture) 
 glTexImage3D_(#GL_TEXTURE_2D_ARRAY, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 3, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, #Null)

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)

 layer = 0
 glTexSubImage3D_(#GL_TEXTURE_2D_ARRAY, 0, 0, 0, layer, *td\imageWidth, *td\imageHeight, 1, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels) 
 sgl::DestroyTexelData(*td)
 
 *td = sgl::CreateTexelData (img2)
 layer = 1
 glTexSubImage3D_(#GL_TEXTURE_2D_ARRAY, 0, 0, 0, layer , *td\imageWidth, *td\imageHeight, 1, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels) 
 sgl::DestroyTexelData(*td)
 
 *td = sgl::CreateTexelData (img3)
 layer = 2
 glTexSubImage3D_(#GL_TEXTURE_2D_ARRAY, 0, 0, 0, layer , *td\imageWidth, *td\imageHeight, 1, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels) 
 sgl::DestroyTexelData(*td)
 
 FreeImage(img1)
 FreeImage(img2)
 FreeImage(img3)
 
 ProcedureReturn texture
EndProcedure

Procedure.i BuildTex (id)
 Protected *td.sgl::TexelData
 Protected img, texture
 Protected maxAnisotropy.f
 
 Select id
    Case 0 
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 1, RGB(255, 32, 64), RGB(255,255,255))
    Case 1 
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 2, RGB(255, 32, 64), RGB(255,255,255))
    Case 2
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 3, RGB(255, 32, 64), RGB(255,255,255))
    Case 3 
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 4, RGB(255, 32, 64), RGB(255,255,255))
    Case 4 
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 5, RGB(255, 32, 64), RGB(255,255,255))
    Case 5 
        img = sgl::CreateImage_DiceFace(#QUAD_SIZE, #QUAD_SIZE, 6, RGB(255, 32, 64), RGB(255,255,255))        
    Case 6
        img = sgl::CreateImage_Checkers(#QUAD_SIZE, #QUAD_SIZE, #QUAD_SIZE / 2, #QUAD_SIZE / 2, RGB(255,255,255), RGB(0,0,0))
    Case 7 
        img = sgl::CreateImage_Checkers(#QUAD_SIZE, #QUAD_SIZE, #QUAD_SIZE / 4, #QUAD_SIZE / 4, RGB(224,0,0), RGB(255,255,0)) 
    Case 8 
        img = sgl::CreateImage_Checkers(#QUAD_SIZE, #QUAD_SIZE, #QUAD_SIZE / 6, #QUAD_SIZE / 6, RGB(0,0,255), RGB(224,224,224)) 
    Case 9 
        img = sgl::CreateImage_RGB(#QUAD_SIZE, #QUAD_SIZE, 0)         
 EndSelect
  
 *td = sgl::CreateTexelData (img)
 
 glGenTextures_(1, @texture)
 glBindTexture_(#GL_TEXTURE_2D_ARRAY, texture)
 
 ; this define how many layers (subtextures) will be present in the Array Texture
 ; the third "1" after the width x height dimensions is used in this case
 
 glTexImage3D_(#GL_TEXTURE_2D_ARRAY, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 1, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)

 FreeImage(img)
 sgl::DestroyTexelData(*td)
 
 ProcedureReturn texture
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
 sgl::DestroyTimer(gTimer)
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h
 Protected x, y, i, text$, color.vec3::vec3, qc.vec4::vec4
 Protected.BatchRenderer::stats info
 Protected fh = RenderText::GetFontHeight(gFon1)
 Protected delta.f
 
 Static layer, layerTime.f
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 glClearColor_(0.8,0.8,1.0,1.0)

 glClear_(#GL_COLOR_BUFFER_BIT)
  
 glViewport_(0, 0, w, h)
 
 ; timestep
 delta = sgl::GetDeltaTime(gTimer)
 
 layerTime + delta
 
 BatchRenderer::StartRenderer(gWin)
  
 BatchRenderer::StartBatch()
 
 Protected xq, yq, wq, hq, tex
  
 wq = #QUAD_SIZE
 hq = #QUAD_SIZE
  
 tex = 0
 
  vec4::Set(qc, 1.0, 1.0, 1.0, 1.0)
  
  ; all these are batched
  
  For yq = 0 To h Step #QUAD_SIZE + 4
    For xq = 0 To w Step #QUAD_SIZE + 4
        If gRandom    
            BatchRenderer::DrawQuad(xq, yq, wq, hq, qc, gGenTextures(Random(9)))
        Else
            BatchRenderer::DrawQuad(xq, yq, wq, hq, qc, gGenTextures(tex % 10))
            tex + 1   
        EndIf
    Next    
  Next 
  
  Static alpha_x.f, alpha_inc.f = 250.0
  
  alpha_x + alpha_inc * delta
  
  If alpha_x > w - 128
    alpha_x = w - 128
    alpha_inc = -alpha_inc
  ElseIf alpha_x < 0
    alpha_x = 0
    alpha_inc = -alpha_inc
  EndIf
  
  If layerTime > 1.0
    layerTime = 0.0
    layer = math::Cycle3i(layer + 1, 0, 2)
  EndIf
  
  BatchRenderer::DrawQuad(alpha_x, h - 200, 128, 128, qc, gAlphaTexture, layer)
  
  ; info area semi transparent
  vec4::Set(qc, 0.0, 0.0, 1.0, 0.8)
  
  ; and these two are also batched with all the above
  BatchRenderer::DrawQuad(0, 0, w, fh*3.1, qc)
  BatchRenderer::DrawQuad(0, h-fh*1.1, w, fh*1.1, qc)

 BatchRenderer::StopBatch()
 
 BatchRenderer::Flush() ; flush all the quads in one shot or the remaing ones if multiple shots were required
 
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
 
 text$ = str::Sprintf("Textured Quads drawn: %i, Draw calls: %i", @info\totalQuadsDrawn, @info\drawCalls)
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
 
 gRandom = 1
 
 BatchRenderer::Init(5000)
 
 gGenTextures(0) = BuildTex (0)
 gGenTextures(1) = BuildTex (1)
 gGenTextures(2) = BuildTex (2)
 gGenTextures(3) = BuildTex (3)
 gGenTextures(4) = BuildTex (4)
 gGenTextures(5) = BuildTex (5)
 gGenTextures(6) = BuildTex (6)
 gGenTextures(7) = BuildTex (7)
 gGenTextures(8) = BuildTex (8)
 gGenTextures(9) = BuildTex (9)
 
 gAlphaTexture = BuildAlphaTexture()
 
 gTimer = sgl::CreateTimer()
   
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf        

    If sgl::GetKeyPress(sgl::#Key_SPACE)
        gRandom ! 1
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
; IDE Options = PureBasic 6.01 LTS (Linux - x64)
; CursorPosition = 233
; FirstLine = 216
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:/Users/luis/Desktop/Share/sgl/textured_batch_renderer.exe
; CPU = 1
; DisableDebugger
; CompileSourceDirectory