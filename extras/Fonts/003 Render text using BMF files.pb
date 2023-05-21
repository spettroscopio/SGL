; Again this one renders unicode text but the font is loaded from a BMF (bitmap font file).
; The font file is actually a zip, and the required additional unicode ranges are specified inside the XML descriptor
; and the glyph are already contained in the PNG texture.

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_210/RenderText.pb"

#TITLE$ = "Render text using BMF files"
#WIN_WIDTH = 800
#WIN_HEIGHT = 300
#VSYNC = 1
           
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
 RenderText::DestroyBitmapFont(gFon) 
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
               
    gFon = RenderText::LoadBitmapFont("./bmf/arial-12-unicode")       
    ASSERT(gFon)
    
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
 
 vec3::Set(color, 0.8, 0.9, 1.0)
 
 fntHeight = RenderText::GetFontHeight(gFon)
 
 glViewport_(0, 0, w, h)

 x = 1
 y = h - fntHeight  
 
 ForEach text()
    RenderText::Render(gWin, gFon, text(), 1, y, color)   
    y - fntHeight 
 Next

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
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 103
; FirstLine = 68
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\002.exe
; CPU = 1
; CompileSourceDirectory
; EnablePurifier