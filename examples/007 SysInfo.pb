; Collect some info about the the hardware and the OpenGL capabilities 

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

IncludeFile "../inc/logfile.pb"

Global file$, lf
Global lines, i, standalone 

Procedure InsideIDE()
 If FindString(GetFilePart(ProgramFilename()),"PureBasic_Compilation", 1, #PB_String_NoCase)
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Macro out (line)
 Debug line
 LogFile::Write(lf, line) ; this can be safely called without an open file
EndMacro

Procedure CallBack_Error (Source$, Desc$)
 out ("[" + Source$ + "] " + Desc$)
EndProcedure

Dim sysInfo$(0)

If InsideIDE() = 0
    standalone = 1
EndIf

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()
    If standalone
        file$ = LogFile::GetProgramDirectory() + "sysinfo.txt" ; in the same directory of the process 
        lf = LogFile::Open(file$, LogFile::#TimeStamp)
    EndIf
        
    lines = sgl::GetSysInfo(sysInfo$())
    
    For i = 0 To lines - 1
        out (sysInfo$(i))
    Next

    sgl::Shutdown()
    
    If standalone
        logfile::Close(lf) 
        MessageRequester("SGL SysInfo", "A logfile has been saved to " + file$)    
    EndIf
EndIf

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 56
; FirstLine = 7
; Folding = -
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\sysinfo\windows\sysinfo.exe
; CPU = 1
; CompileSourceDirectory