; *********************************************************************************************************************
; dbg.pb
; by Luis
;
; The module namespace *MUST* be imported with "Usemodule dbg".
;
; Varius stuff useful for debugging.
;
; OS: Windows, Linux
;
; 1.00, Feb 10 2023, PB 6.01
; First release.
; *********************************************************************************************************************

; ---------------------------------------------------------------------------------------------------------------------
; DBG_TEXT (text, interval = 0) 
;  Writes to the PB debug window if executed inside the IDE, else writes to the PB debugger console and to a log file.
;
;  interval is used to control how often a repeatedly encountered DBG_TEXT is executed.
;
;  interval = 0
;   The macro is executed every time (default)
;
;  interval > 0 
;   The value is a time interval in ms. For example if set to 1000 (1 sec) the statement will be ignored if encountered 
;   again when less than a second is passed. This is useful to avoid to flood the debug output in a loop for example, while
;   still getting updates.
;
;  The macro is completely removed from the source when the debugger is disabled.
;
;  The log file name follows this scheme: [absolute path of the exe]/[exe name].debug.txt
;  For example C:\dir\test.debug.txt for a "test.exe" residing in "C:\dir\"
; ---------------------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------------------
; DBG_TEXT_IF (text, exp, interval = 0) 
;  Same as DBG_TEXT, but executed only if exp is #True.
;
;  The macro is completely removed from the source when the debugger is disabled.
; ---------------------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------------------
; DBG_TEXT_ONCE (text) 
;  Same as DBG_TEXT, but executed just the first time and never again for the current program run.
;
;  The macro is completely removed from the source when the debugger is disabled.
; ---------------------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------------------
; ASSERT (exp) 
;  Writes an error message to the PB debug window if run inside the IDE and the expression is false.
;  It also calls CallDebugger to pause the execution.
;
;  Open a MessageRequester() window if run outside the IDE and the expression is false.
;  It also terminates the program.
;
;  The macro is completely removed from the source when the debugger is disabled.
; ---------------------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------------------
; ASSERT_FAIL (text)
;  It behaves like a failed ASSERT, and prints the passed text instead of the expression.
;  It may be called for example inside an ASSERT_START / ASSERT_END block.
;
;  The macro is completely removed from the source when the debugger is disabled.
; ---------------------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------------------
; ASSERT_START / ASSERT_END
;  Two empty macros to make evident in the source that the code between them is used to verify some assertion which is too 
;  complex for a single-line ASSERT. Pay attention to not cause side effects !
;
;  The block should be removed from the source if the debugger is disabled, but you have to write the CompilerIf yourself.
;
;  Example:
;
;  ASSERT_START
;   CompilerIf (#PB_Compiler_Debugger = 1)
;    [code to verify the assertion here]
;   CompilerEndIf
;  ASSERT_END
; ---------------------------------------------------------------------------------------------------------------------

DeclareModule dbg

CompilerIf Defined(MACRO_DQ, #PB_Constant) = 0
 Macro DQ
  "
 EndMacro
 #MACRO_DQ = 1 
CompilerEndIf
 
Macro ASSERT_START

EndMacro

Macro ASSERT_END
EndMacro

Macro ASSERT (exp)
CompilerIf (#PB_Compiler_Debugger = 1)
 If Not(Bool(exp))
    _DBG_ASSERT(DQ#exp#DQ, #PB_Compiler_File, #PB_Compiler_Line)
    CallDebugger
 EndIf
CompilerEndIf
EndMacro

Macro ASSERT_FAIL (text)
CompilerIf (#PB_Compiler_Debugger = 1)
 _DBG_ASSERT(text, #PB_Compiler_File, #PB_Compiler_Line) 
 CallDebugger
CompilerEndIf
EndMacro

Macro DBG_TEXT (text, interval = 0)
CompilerIf (#PB_Compiler_Debugger = 1)
 _DBG_TEXT (text, interval, #PB_Compiler_File, #PB_Compiler_Line)
CompilerEndIf
EndMacro

Macro DBG_TEXT_IF (text, exp, interval = 0)
CompilerIf (#PB_Compiler_Debugger = 1)
 If (Bool(exp))   
    _DBG_TEXT (text, interval, #PB_Compiler_File, #PB_Compiler_Line)
 EndIf
CompilerEndIf
EndMacro

Macro DBG_TEXT_ONCE (text)
CompilerIf (#PB_Compiler_Debugger = 1)
 _DBG_TEXT (text, -1, #PB_Compiler_File, #PB_Compiler_Line)
CompilerEndIf
EndMacro

CompilerIf (#PB_Compiler_Debugger = 1)
Declare   _DBG_TEXT (Text$, Interval, FileName$, LineNum)
Declare   _DBG_ASSERT (Exp$, FileName$, LineNum)
CompilerEndIf

EndDeclareModule

Module dbg

;- INTERNALS

CompilerIf (#PB_Compiler_Debugger = 1)

Structure _DBG_OBJ
 Map LastMsgTime.i()
 InsideIDE.i
 LogFileTried.i
 LogFileHandle.i
 LogFileName$
EndStructure

Global _DBG._DBG_OBJ
 
If FindString(GetFilePart(ProgramFilename()),"PureBasic_Compilation", 1, #PB_String_NoCase)
    _DBG\InsideIDE = 1
EndIf
 
_DBG\LogFileTried = #False

Procedure _DBG_TEXT (Text$, Interval, FileName$, LineNum) 
 Protected t$, key$
 Protected now, diffTime, currTime = ElapsedMilliseconds()
 Protected shouldPrint = #True
 
 key$ = FileName$ + "_" + Str(LineNum)
      
 If FindMapElement(_DBG\LastMsgTime(), key$) <> 0 ; not the first time on this source + line
    diffTime = currTime - _DBG\LastMsgTime()
        
    If Interval = -1 ; Only once
        shouldPrint = #False
    ElseIf diffTime >= 0 And diffTime < Interval
        shouldPrint = #False
    EndIf
 EndIf
    
 If shouldPrint
    If _DBG\InsideIDE 
        FileName$ = GetFilePart(FileName$) ; if inside the IDE the full path is not shown ...
    EndIf
    
    t$ = Chr(34) + FileName$ + Chr(34) + " (" + Str(LineNum) + ") " + Text$    
    
    Debug t$ ; do not delete this, it's for the console of the stand alone exe + debugger
    
    If _DBG\InsideIDE = #False
        If _DBG\LogFileTried = #False ; first time we create the debugfile
            _DBG\LogFileTried = #True
            _DBG\LogFileName$ = GetPathPart(ProgramFilename()) + GetFilePart(ProgramFilename(), #PB_FileSystem_NoExtension) + ".debug.txt"
            _DBG\LogFileHandle = OpenFile(#PB_Any, _DBG\LogFileName$, #PB_File_NoBuffering)
        EndIf
        If IsFile(_DBG\LogFileHandle)
            now = Date()
            t$ = FormatDate("[%dd-%mm-%yyyy] ", now) + FormatDate("[%hh:%ii:%ss] ", now) + t$            
            WriteStringN(_DBG\LogFileHandle, t$) 
        EndIf
    EndIf 
   _DBG\LastMsgTime(key$) = currTime            
 EndIf
EndProcedure

Procedure _DBG_ASSERT (Exp$, FileName$, LineNum) 
 Protected t$ = "ASSERT: " + Exp$
 
 _DBG_TEXT (t$, 0, FileName$, LineNum)
  
 If _DBG\InsideIDE = #False
    If IsFile(_DBG\LogFileHandle)
        MessageRequester("ASSERT !", "A log of the debug session has been saved to " + #CRLF$ + #CRLF$ + _DBG\LogFileName$)
    Else        
        MessageRequester("ASSERT !", "A fatal error has been encountered.")
    EndIf
    End
 EndIf
EndProcedure
 
CompilerEndIf

EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 186
; FirstLine = 160
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory