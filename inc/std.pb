; *********************************************************************************************************************
; std.pb
; by Luis
;
; Assorted stuff which can be useful in any program and didn't fit in a specific category.
;
; OS: Windows, Linux
;
; 1.00, Feb 05 2023, PB 6.01
; First release.                                                                              
; *********************************************************************************************************************

DeclareModule std

; Min/Max value of various data types 
#MAX_LONG =  1 << 31 - 1
#MIN_LONG = -#MAX_LONG - 1

#MAX_QUAD = 1 << 63 - 1
#MIN_QUAD = -#MAX_QUAD - 1

CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
#MAX_INTEGER = #MAX_LONG 
#MIN_INTEGER = #MIN_LONG
CompilerElse   
#MAX_INTEGER = #MAX_QUAD
#MIN_INTEGER = #MIN_QUAD 
CompilerEndIf

Macro ALIGN (address, bytes)
; Align 'address' to the boundary of 'bytes'
 (address + (bytes - address % bytes))
EndMacro

Macro LoWord (dword) 
; Get the low word (16 bit) of a dword  (32 bit).
 (dword & $FFFF)
EndMacro

Macro HiWord (dword) 
; Get the high word (16 bit) of a dword (32 bit),
 ((dword >> 16) & $FFFF)
EndMacro

Macro LoByte (word) 
; Get the low byte (8 bit) of a word (16 bit).
 (word & $FF)
EndMacro

Macro HiByte (word) 
; Get the high byte (8 bit) of a word (16 bit),
 ((word >> 8) & $FF)
EndMacro

Macro FreeMemorySafe (p)
 If (p) : FreeMemory(p) : p = 0 : EndIf 
EndMacro

Macro FreeStructureSafe (p)
 If (p) : FreeStructure(p) : p = 0 : EndIf 
EndMacro

Macro CloseFileSafe (h)
 If IsFile(h) : CloseFile(h) : h = 0 : EndIf 
EndMacro

Declare.f    ByteToFloat (byte) ; Returns a float corresponding to the normalized value between 0 ... 1 of the input.
Declare.i    FloatToByte (float.f) ; Returns a byte corresponding to the normalized value between 0 ... 255 of the input.
Declare.i    IIF (exp, T, F) ; If the exp is #True the procedure returns the second parameter, else the third.
Declare.q    IIFq (exp, T.q, F.q) ; If the exp is #True the procedure returns the second parameter, else the third.
Declare.f    IIFf (exp, T.f, F.f) ; If the exp is #True the procedure returns the second parameter, else the third.
Declare.s    IIFs (exp, T$, F$) ; If the exp is #True the procedure returns the second parameter, else the third.

EndDeclareModule

Module std
EnableExplicit

Procedure.f ByteToFloat (byte)
;> Returns a float corresponding to the normalized value between 0 ... 1 of the input.

; byte must be between 0 and 255
 ProcedureReturn  (byte / 255.0)
EndProcedure

Procedure.i FloatToByte (float.f)
;> Returns a byte corresponding to the normalized value between 0 ... 255 of the input.

; float must be between 0.0 and 1.0
 ProcedureReturn Int(float * 255.0)
EndProcedure

Procedure.i IIF (exp, T, F)
;> If the exp is #True the procedure returns the second parameter, else the third.
;
; exp : The expression to be evaluated.
; T : The value returned if exp is #True.
; F : The value returned if exp is #False.
;
; Please note you may need to enclose the expression inside a Bool().

 If (exp)
    ProcedureReturn T
 EndIf    
 
 ProcedureReturn F
EndProcedure

Procedure.q IIFq (exp, T.q, F.q)
;> If the exp is #True the procedure returns the second parameter, else the third.
;
; exp : The expression to be evaluated.
; T : The value returned if exp is #True.
; F : The value returned if exp is #False.
;
; Please note you may need to enclose the expression inside a Bool().

 If (exp)
    ProcedureReturn T
 EndIf    
 
 ProcedureReturn F
EndProcedure

Procedure.f IIFf (exp, T.f, F.f)
;> If the exp is #True the procedure returns the second parameter, else the third.
;
; exp : The expression to be evaluated.
; T : The value returned if exp is #True.
; F : The value returned if exp is #False.
;
; Please note you may need to enclose the expression inside a Bool().

 If (exp)
    ProcedureReturn T
 EndIf    
 
 ProcedureReturn F
EndProcedure

Procedure.s IIFs (exp, T$, F$)
;> If the exp is #True the procedure returns the second parameter, else the third.
;
; exp : The expression to be evaluated.
; T$ : The string returned if exp is #True.
; F$ : The string returned if exp is #False.
;
; Please note you may need to enclose the expression inside a Bool().

 If (exp)
    ProcedureReturn T$
 EndIf
 
 ProcedureReturn F$
EndProcedure

EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 28
; FirstLine = 6
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier