; *********************************************************************************************************************
; datetime.pb
; by Luis
;
; Various date and time functions.
;
; OS: Windows, Linux
;
; 1.00, Feb 11 2023, PB 6.01
; First release.
; *********************************************************************************************************************

DeclareModule DateTime
Declare.i   DaysOfMonth (yyyy, mm) ; Returns the number of days for the specified month of the year yyyy.
Declare.s   FormatDateEx (Mask$, DateValue) ; Formats a date like FormatDate() but also supports names for days and months.
EndDeclareModule

Module DateTime
EnableExplicit

Procedure.i DaysOfMonth (yyyy, mm)
;> Returns the number of days for the specified month of the year yyyy.

; The year must be 4 digits, and the month between 1 - 12.

 DataSection
  m_data: : Data.b 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
 EndDataSection

 Protected *p.Byte = ?m_data + mm - 1
 
 If mm = 2 And (yyyy % 400 = 0) Or (yyyy % 100 And yyyy % 4 = 0)
    ProcedureReturn 29
 EndIf
 
 ProcedureReturn *p\b
EndProcedure

Procedure.s FormatDateEx (Mask$, DateValue)
;> Formats a date like FormatDate() but also supports names for days and months.

; Adds the following tokens:
; %dddd -> day of week long name (Friday)
; %ddd -> day of week short name (3 chars, Fri)
; %mmmm -> month long name (December)
; %mmm -> month short name (3 chars, Dec)

 Dim Day$(6)
 Day$(0) = "Sunday"
 Day$(1) = "Monday"
 Day$(2) = "Tuesday"
 Day$(3) = "Wednesday"
 Day$(4) = "Thursday"
 Day$(5) = "Friday"
 Day$(6) = "Saturday"
 
 Dim Month$(11)
 Month$(0) = "January"
 Month$(1) = "February"
 Month$(2) = "March"
 Month$(3) = "April"
 Month$(4) = "May"
 Month$(5) = "June"
 Month$(6) = "July"
 Month$(7) = "August"
 Month$(8) = "September"
 Month$(9) = "October"
 Month$(10) = "November"
 Month$(11) = "December"
 
 Mask$ = ReplaceString(Mask$, "%dddd", Day$(DayOfWeek(DateValue))) 
 Mask$ = ReplaceString(Mask$, "%mmmm", Month$(Month(DateValue) - 1)) 
 Mask$ = ReplaceString(Mask$, "%ddd",  Left(Day$(DayOfWeek(DateValue)), 3)) ; short day name 
 Mask$ = ReplaceString(Mask$, "%mmm",  Left(Month$(Month(DateValue) - 1), 3)) ; short month name
 
 ProcedureReturn FormatDate(Mask$, DateValue)
EndProcedure

EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 15
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory