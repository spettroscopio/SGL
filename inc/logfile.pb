; *********************************************************************************************************************
; logfile.pb
; by Luis
;
; Creates a log file and writes to it.
;
; OS: Windows, Linux
;
; 1.01, Feb 10 2023, PB 6.01
; Minor tweaks.
;
; 1.00, Sep 08 2021, PB 5.73
; First release.                                                                             
; *********************************************************************************************************************

DeclareModule LogFile

EnumerationBinary ; flags 
 #FileAppend 
 #DateStamp
 #TimeStamp
EndEnumeration

Declare.s    GetProgramName()
Declare.s    GetProgramDirectory()
Declare.i    Open (file$, flags = 0, BufSize = 2048, DateFmt$ = "%dd-%mmm-%yyyy", TimeFmt$ = "%hh:%ii:%ss")
Declare      Write (f, text$)
Declare      Close (f)
EndDeclareModule

;- [ INCLUDES ]

XIncludeFile "datetime.pb"

Module LogFile
EnableExplicit 
 
Structure LogfileObj
 file$
 bAppend.i
 bTimeStamp.i
 bDateStamp.i
 TimeFmt$  
 DateFmt$
EndStructure
 
Structure LogfileMap
 Map Files.LogfileObj()
EndStructure : Global LogfileMap.LogfileMap

Procedure.s GetProgramName()
 ProcedureReturn GetFilePart(ProgramFilename(), #PB_FileSystem_NoExtension) 
EndProcedure

Procedure.s GetProgramDirectory()
 ProcedureReturn GetPathPart(ProgramFilename()) 
EndProcedure
  
Procedure.i Open (file$, flags = 0, BufSize = 2048, DateFmt$ = "%dd-%mmm-%yyyy", TimeFmt$ = "%hh:%ii:%ss")
 Protected f, now
  
 If flags & #FileAppend
   f = OpenFile(#PB_Any, file$, #PB_File_Append)
 Else  
   f = CreateFile(#PB_Any, file$)
 EndIf
 
 If IsFile(f)
    FileBuffersSize(f, BufSize)
    
    If AddMapElement(LogfileMap\Files(), Str(f))
        LogfileMap\Files()\file$ = file$
        LogfileMap\Files()\bAppend = flags & #FileAppend
        LogfileMap\Files()\bTimeStamp = flags & #TimeStamp
        LogfileMap\Files()\bDateStamp = flags & #DateStamp
        LogfileMap\Files()\TimeFmt$ = TimeFmt$
        LogfileMap\Files()\DateFmt$ = DateFmt$
        
        now = Date()
        
        If Lof(f)
            WriteStringN(f, "")
        EndIf
        
        WRITE(f, "Logfile started on " + DateTime::FormatDateEx(LogfileMap\Files()\DateFmt$, now) + ", " + DateTime::FormatDateEx(LogfileMap\Files()\TimeFmt$, now))
    Else
        CloseFile(f)    
        f = 0
    EndIf
 EndIf
  
 ProcedureReturn f
EndProcedure
  
Procedure Write (f, text$)
 Protected out$, now
 
 If IsFile(f)    
    now = Date()

    FindMapElement(LogfileMap\Files(), Str(f))

    If LogfileMap\Files()\bDateStamp
        out$ + DateTime::FormatDateEx(LogfileMap\Files()\DateFmt$, now)
    EndIf        

    If LogfileMap\Files()\bTimeStamp
        If Len(out$) : out$ + " " : EndIf
        out$ + DateTime::FormatDateEx(LogfileMap\Files()\TimeFmt$, now)
    EndIf   

    If Len(out$) : out$ + " : " : EndIf
    
    out$ + text$
  
    If WriteStringN(f, out$) = 0 ; in case of failure, maybe out of space ?     
        CloseFile(f) ; let's call it a day
        DeleteMapElement(LogfileMap\Files(), Str(f))     
    EndIf    
 EndIf
EndProcedure
  
Procedure Close (f)
 Protected now
    
 If IsFile(f)
    now = Date()            
    WRITE(f, "Logfile closed on " + DateTime::FormatDateEx(LogfileMap\Files()\DateFmt$, now) + ", " + DateTime::FormatDateEx(LogfileMap\Files()\TimeFmt$, now))
    CloseFile(f)
    DeleteMapElement(LogfileMap\Files(), Str(f)) 
 EndIf
EndProcedure

EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 25
; FirstLine = 8
; Folding = --
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant