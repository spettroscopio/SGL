; To test how a font look for a possibile usage in OpenGL programs
; OpenGL 2.10

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText_210/RenderText.pb"

#TITLE$ = "Try some fonts ..."
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1
#ATLAS_SIZE = 1024

Global gWin
Global *gFonInfo.RenderText::BMFont
Global *gFonCurrent.RenderText::BMFont
Global NewList glFontFiles.s()

Declare     CallBack_WindowRefresh (win)
Declare     CallBack_Error (source$, desc$)
Declare     Startup()
Declare     ShutDown()
Declare.s   GetLine (text$, *pos.Integer, len)
Declare     Render()
Declare     BuildFontList()
Declare     MainLoop()
Declare     Main()

Procedure CallBack_WindowRefresh (win)
 Render()
EndProcedure 

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure Startup() 
 Dim ranges.sgl::BitmapFontRange(0)
 
 UsePNGImageDecoder()
 
 BuildFontList()

 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 2)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 1)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
     
     gWin = sgl::CreateWindow(#WIN_WIDTH, #WIN_HEIGHT, #TITLE$)
     
     If gWin     
        sgl::MakeContextCurrent(gWin)
        
        sgl::RegisterWindowCallBack(gWin, sgl::#CALLBACK_WINDOW_REFRESH, @CallBack_WindowRefresh())
     
        glLoad::Load()
     
        sgl::LoadExtensionsStrings()
         
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf              
                                    
        ranges(0)\firstChar = 32
        ranges(0)\lastChar = 128
        
        *gFonInfo = RenderText::CreateFont("Arial", 12, #Null, ranges(), 256, 256)
        
        ASSERT(*gFonInfo)
       
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 End 
EndProcedure

Procedure ShutDown() 
 RenderText::DestroyFont(*gFonInfo) 
 RenderText::DestroyFont(*gFonCurrent) 
 sgl::Shutdown()
EndProcedure

Procedure.s GetLine (text$, *pos.Integer, len)
 Protected w, h, lw
 Protected c$, start = *pos\i
 Protected *glyph.sgl::GlyphData
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h) 
 
 If *pos\i < len
 
     While *pos\i <= len
        c$ = Mid(text$, *pos\i, 1)
        *glyph = RenderText::FindGlyph(*gFonCurrent, Asc(c$))
        If *glyph 
            lw + *glyph\xOffset
            If lw >= w
                *pos\i - 1
                Goto exit
            EndIf
        EndIf
        *pos\i + 1
     Wend
     
 exit:
         
     ProcedureReturn Mid(text$, start, *pos\i - start + 1)
 EndIf
 
 ProcedureReturn #Empty$
EndProcedure

Procedure Render() 
 Protected w, h, fps$
 Protected elapsed.f
 Protected fntInfoHeight = RenderText::GetFontHeight(*gFonInfo)
 Protected fntCurrentHeight = RenderText::GetFontHeight(*gFonCurrent)
 Protected color1.vec3::vec3, color2.vec3::vec3, x, y, j
 
 #lines = 3
 Dim text$(#lines)
 
 text$(0) = "The quick brown fox jumps over the lazy dog. 0123456789 " 
 text$(1) = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
 text$(2) = "abcdefghijklmnopqrstuvwxyz" 
 text$(3) = "!@#$%^&*(){}[]-=_+\|`~ "
            
 glClearColor_(0.05,0.05,0.2,1.0)
 
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 vec3::Set(color1, 0.5, 1.0, 0.5)
 
 x = 1
 y = h - fntInfoHeight
 RenderText::Render(gWin, *gFonInfo, "FontName: " + *gFonCurrent\fontName$, 1, y, color1)
 y - fntInfoHeight
 RenderText::Render(gWin, *gFonInfo, "FontSize: " + *gFonCurrent\FontSize, 1, y, color1)
 
 x = 1
 y = 1
 RenderText::Render(gWin, *gFonInfo, "[ Arrow Right ], [ Arrow Left ], [ KeyPad Plus ], [ KeyPad Minus ]", x, y, color1)
              
 Protected pos, len, line$
 x = 10 : y = h - 4 * fntInfoHeight - 2 * fntCurrentHeight
 
 vec3::Set(color2, 1.0, 0.75, 0.2)

 For j = 0 To #lines 
    pos = 1 : len = Len(text$(j))
    Repeat
        line$ = GetLine (text$(j), @pos, len)
        If line$ = #Empty$
            Break
        EndIf
        RenderText::Render(gWin, *gFonCurrent, line$, x, y, color2)    
        y = y - fntCurrentHeight - 1
        pos + 1
    ForEver
 Next
   
 sgl::SwapBuffers(gWin)
EndProcedure

Procedure BuildFontList()
 Protected ed, fonts$ = "./fonts"

 ed = ExamineDirectory(#PB_Any, fonts$, "*.*")
  
 While NextDirectoryEntry(ed) 
    If DirectoryEntryType(ed) = #PB_DirectoryEntry_File
        AddElement(glFontFiles())
        glFontFiles() = DirectoryEntryName(ed)
        If RegisterFontFile(fonts$ + "/" + glFontFiles()) = 0
            CallDebugger
        EndIf
    EndIf
 Wend
 
 FinishDirectory(ed)
 
 ResetList(glFontFiles())
EndProcedure


Procedure MainLoop()  
 Protected nextFont, changeSize
 Protected currFont$, currSize, *oldFont
 
 Dim ranges.sgl::BitmapFontRange(0)
 
 ranges(0)\firstChar = 32
 ranges(0)\lastChar = 128
 
 nextFont = 1
 currSize = 16                
 
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::GetKey(sgl::#Key_KP_ADD)
        changeSize = 1
    EndIf

    If sgl::GetKey(sgl::#Key_KP_SUBTRACT)
        changeSize = -1
    EndIf

    If sgl::GetKeyPress(sgl::#Key_RIGHT)
        nextFont = 1
    EndIf
    
    If sgl::GetKeyPress(sgl::#Key_LEFT)
        nextFont = -1
    EndIf
    
    If changeSize <> 0
        If currSize + changeSize <= 64 And currSize + changeSize >= 10
            currSize + changeSize
               
            *oldFont = *gFonCurrent                              
                                      
            *gFonCurrent = RenderText::CreateFont(currFont$, currSize, #Null, ranges(), #ATLAS_SIZE, #ATLAS_SIZE)
            
            ASSERT(*gFonCurrent)                    
            
            If *oldFont
                RenderText::DestroyFont(*oldFont)
            EndIf
        EndIf
        
        changeSize = 0
    EndIf
    
    If nextFont <> 0
        If ListSize(glFontFiles())
            
            If nextFont = 1
                If NextElement(glFontFiles()) = 0
                    ResetList(glFontFiles())
                    NextElement(glFontFiles())
                EndIf
            EndIf

            If nextFont = -1
                If PreviousElement(glFontFiles()) = 0
                    ResetList(glFontFiles())
                    LastElement(glFontFiles())
                EndIf
            EndIf
            
            currFont$ = glFontFiles()
                        
            *oldFont = *gFonCurrent
            
            currFont$ = GetFilePart(currFont$, #PB_FileSystem_NoExtension)
            
            *gFonCurrent = RenderText::CreateFont(currFont$, currSize, #Null, ranges(), #ATLAS_SIZE, #ATLAS_SIZE)
            
            ASSERT(*gFonCurrent)
            
            If *oldFont
                RenderText::DestroyFont(*oldFont)
            EndIf

        EndIf
        
        nextFont = 0
    EndIf
    
    If sgl::IsWindowMinimized(gWin) = 0
        Render()
    EndIf
     
    sgl::PollEvents()
 Wend
EndProcedure

Procedure Main()
 Startup() 
 MainLoop()    
 ShutDown()
EndProcedure

Main()
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; Folding = --
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\002.exe
; CPU = 1
; CompileSourceDirectory