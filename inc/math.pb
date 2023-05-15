; *********************************************************************************************************************
; math.pb
; by Luis
;
; Various math functions.
;
; OS: Windows, Linux
;
; 1.00, Feb 12 2023, PB 6.01
; First release.
; *********************************************************************************************************************

DeclareModule Math
Declare.f   Float (value) ; Cast the integer to a float
Declare.d   Double (value) ; Cast the integer to a double
Declare.i   Min (a, b) ; Returns the smallest value between a and b.
Declare.i   Max (a, b) ; Returns the largest value between a and b.
Declare.f   Minf (a.f, b.f) ; Returns the smallest value between a and b.
Declare.f   Maxf (a.f, b.f) ; Returns the largest value between a and b.
Declare.i   Absi (value) ; Returns the input but without the sign.
Declare.q   Absq (value.q) ; Returns the input but without the sign.
Declare.f   Absf (value.f) ; Returns the input but without the sign.
Declare.i   GCD (a, b) ; Returns the greatest Common Divisor (GCD) for the two specified integers.
Declare.i   LCM (a, b) ; Returns the Least Common Multiple (LCM) for the two specified integers.
Declare.i   Cycle (value, min, max) ; Returns min if the input value is above max and max if the input value is below min.
Declare.i   Clamp (value, min, max) ; Returns the input value clamped between min and max.
Declare.f   Clampf (value.f, min.f, max.f) ; Returns the input value clamped between min and max.
Declare.f   Fract (value.f) ; Returns the fractional part of value.
Declare.i   Ceiling (value.f) ; Returns the integer number just above or equal to value.
Declare.i   Floor (value.f) ; Returns the integer number just below or equal to value.
Declare.f   Mix (a.f, b.f, mixing.f) ; Mixes a and b accordingly to the value of mixing (0.0-1.0) acting like a mixing slider from left to right.
Declare.i   MapToRange (val, low, high, new_low, new_high) ; Maps val in the range low ... high to the new range new_low ... new_high.
Declare.f   MapToRangef (val.f, low.f, high.f, new_low.f, new_high.f) ; Maps val in the range low ... high to the new range new_low ... new_high.
Declare.i   CloseEnough (a.f, b.f, epsilon.f) ; Compares two floats using the specified absolute tolerance, returns 1 if "equal" else 0.
EndDeclareModule

Module Math

EnableExplicit

Procedure.f Float (value)
;> Cast the integer to a float
 ProcedureReturn value
EndProcedure

Procedure.d Double (value)
;> Cast the integer to a double
 ProcedureReturn value
EndProcedure

Procedure.i Min (a, b)
;> Returns the smallest value between a and b.

 If a < b
    ProcedureReturn a
 EndIf
 ProcedureReturn b
EndProcedure

Procedure.i Max (a, b)
;> Returns the largest value between a and b.

 If a > b
    ProcedureReturn a
 EndIf
 ProcedureReturn b
EndProcedure

Procedure.f Minf (a.f, b.f)
;> Returns the smallest value between a and b.

 If a < b
    ProcedureReturn a
 EndIf
 ProcedureReturn b
EndProcedure

Procedure.f Maxf (a.f, b.f)
;> Returns the largest value between a and b.

 If a > b
    ProcedureReturn a
 EndIf
 ProcedureReturn b
EndProcedure

Procedure.i Absi (value)
;> Returns the input but without the sign.

 If value < 0
    ProcedureReturn  -value
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.q Absq (value.q)
;> Returns the input but without the sign.

 If value < 0
    ProcedureReturn  -value
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.f Absf (value.f)
;> Returns the input but without the sign.

 If value < 0
    ProcedureReturn  -value
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.i GCD (a, b)
;> Returns the greatest Common Divisor (GCD) for the two specified integers.

; http://en.wikipedia.org/wiki/Greatest_common_divisor  
; GCD (6,10) = 2

 Protected r
 
 Repeat
    r = a % b    
    If r = 0
        ProcedureReturn Absi(b)
    EndIf            
    a = b
    b = r
 ForEver
EndProcedure

Procedure.i LCM (a, b)
;> Returns the Least Common Multiple (LCM) for the two specified integers.

; http://en.wikipedia.org/wiki/Least_common_multiple
; LCM(6, 10) = 30

 ProcedureReturn Absi(a * b) / GCD(a, b)
EndProcedure

Procedure.i Cycle (value, min, max)
;> Returns min if the input value is above max and max if the input value is below min.

; Cycle (12, 1, 10) = 1
; Cycle (-1, 1, 10) = 10

 If value < min
    value = max
 ElseIf value > max 
    value = min
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.i Clamp (value, min, max)
;> Returns the input value clamped between min and max.

; Clamp (12, 1, 10) = 10

 If value < min
    value = min
 ElseIf value > max 
    value = max
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.f Clampf (value.f, min.f, max.f)
;> Returns the input value clamped between min and max.

; Clampf (12.0, 1.0, 10.0) = 10.0

 If value < min
    value = min
 ElseIf value > max 
    value = max
 EndIf
 ProcedureReturn value
EndProcedure

Procedure.f Fract (value.f) 
;> Returns the fractional part of value.

 ProcedureReturn value - Round(value, #PB_Round_Down)
EndProcedure

Procedure.i Ceiling (value.f)
;> Returns the integer number just above or equal to value.

; Ceiling(12.7) = 13

 ProcedureReturn Round(value, #PB_Round_Up)
EndProcedure

Procedure.i Floor (value.f)
;> Returns the integer number just below or equal to value.

; Floor(12.7) = 12

 ProcedureReturn Round(value, #PB_Round_Down)
EndProcedure

Procedure.f Mix (a.f, b.f, mixing.f) 
;> Mixes a and b accordingly to the value of mixing (0.0-1.0) acting like a mixing slider from left to right.

; 0.0 keeps only 'a' (slider all to the left), 1.0 keeps only 'b' (slider all to the right)
; Mix (200, 128, 0.5) = 164.0
 
 ProcedureReturn (a * (1.0 - mixing)) + (b * mixing);
EndProcedure

Procedure.i MapToRange (val, low, high, new_low, new_high)
;> Maps val in the range low ... high to the new range new_low ... new_high.

; MapToRange (10, 0, 100, 0, 255) = 25

 ProcedureReturn new_low + (val - low) * (new_high - new_low) / (high - low)
EndProcedure

Procedure.f MapToRangef (val.f, low.f, high.f, new_low.f, new_high.f)
;> Maps val in the range low ... high to the new range new_low ... new_high.

; MapToRangef (25.0, 0, 100.0, 0, 1.0) = 0.25

 ProcedureReturn new_low + (val - low) * (new_high - new_low) / (high - low)
EndProcedure

Procedure.i CloseEnough (a.f, b.f, epsilon.f)
;> Compares two floats using the specified absolute tolerance, returns 1 if "equal" else 0.

 If (Absf(a - b) <= epsilon)
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

EndModule


; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 34
; Folding = ----
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier