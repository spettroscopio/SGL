; Again this one renders unicode text but the font is loaded from a BMF (bitmap font file).
; The font file is actually a zip, and the required additional unicode ranges are specified inside the XML descriptor
; and the glyph are already contained in the PNG texture.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_210/RenderText.pb"

#TITLE$ = "Render text using BMF files"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 600
#VSYNC = 1
           
Global gWin
Global gFon1, gFon2, gFon3

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
 Dim ranges.sgl::BitmapFontRange(0)
 
 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 2)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 1)
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
 RenderText::DestroyBitmapFont(gFon2)
 RenderText::DestroyBitmapFont(gFon3)
 sgl::Shutdown()
EndProcedure

Procedure Render() 
 Protected w, h
 Protected color.vec3::vec3
 Protected x, y, fntHeight, file
 
 Static firstRun = 1
 Static NewList text.s()
 
 If firstRun
    firstRun = 0
               
    gFon1 = RenderText::LoadBitmapFont("./bmf/arial-unicode-12")
    ASSERT(gFon1)
    
    gFon2 = RenderText::LoadBitmapFont("./bmf/videophreak-16")
    ASSERT(gFon2)
    
    gFon3 = RenderText::LoadBitmapFont("./bmf/gimp-42")
    ASSERT(gFon3)
    
    ; read the UTF-8 file
    
    file = ReadFile(#PB_Any, "unicode-text.txt", #PB_UTF8)
    
    If file
        While Not Eof(file)
            AddElement(text())
            text() = ReadString(file)        
        Wend    
        CloseFile(file)
    EndIf
 EndIf
 
 glClearColor_(0.1,0.1,0.3,1.0)
 
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 glViewport_(0, 0, w, h)

 x = 1
 y = 0
 
 fntHeight = RenderText::GetFontHeight(gFon1)
 vec3::Set(color, 0.9, 0.9, 0.0)
 
 y + fntHeight 
 RenderText::Render(gWin, gFon1, "BMF arial-unicode-12.zip", 1, y, color)
 
 y + fntHeight 
 RenderText::Render(gWin, gFon1, "This font has been rendered from a system font.", 1, y, color)
 
 y + fntHeight 
 ForEach text()
    y + fntHeight 
    RenderText::Render(gWin, gFon1, text(), 1, y, color)
 Next
 
 fntHeight = RenderText::GetFontHeight(gFon2)
 vec3::Set(color, 0.0, 0.9, 1.0)
 
 y + fntHeight * 2
 RenderText::Render(gWin, gFon2, "BMF videophreak-16.zip", 1, y, color)

 y + fntHeight
 RenderText::Render(gWin, gFon2, "This font has been rendered from a True Type file.", 1, y, color)
 
 fntHeight = RenderText::GetFontHeight(gFon3)
 vec3::Set(color, 1.0, 1.0, 1.0)
 
 y + fntHeight * 2
 RenderText::Render(gWin, gFon3, "BMF gimp-42.zip", 1, y, color)
 
 y + fntHeight
 RenderText::Render(gWin, gFon3, "This font has been made with GIMP.", 1, y, color)   

EndProcedure

Procedure MainLoop()   
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::IsWindowMinimized(gWin) = 0
        Render()
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
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 127
; FirstLine = 86
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\002.exe
; CPU = 1
; CompileSourceDirectory
; EnablePurifier