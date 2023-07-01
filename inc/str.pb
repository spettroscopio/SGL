; *********************************************************************************************************************
; str.pb
; by Luis
;
; Various strings functions.
;
; OS: Windows, Linux
;
; 1.00, Feb 06 2023, PB 6.01
; First release.
; *********************************************************************************************************************

DeclareModule str

Enumeration
 #FormatBytes_IEC = 1
 #FormatBytes_Memory = 2
 #FormatBytes_Metric = 3
EndEnumeration

Declare.s   Sprintf (fmt$, *v1 = 0, *v2 = 0, *v3 = 0, *v4 = 0, *v5 = 0, *v6 = 0, *v7 = 0, *v8 = 0, *v9 = 0, *v10 = 0) ; A sprintf()-like function inspired by the C library function.
Declare.s   TrimEx (in$, char$ = " ") ; Removes char$ from in$ left and right, and then replace internal multiple consecutive char$ with a single one.
Declare.s   PadLeft (s$, newlen, char$ = " ") ; Pads to the left the string s$ with the char char$.
Declare.s   PadRight (s$, newlen, char$ = " ") ; Pads to the right the string s$ with the char char$.
Declare.s   FormatQuad (value.q, sep$ = ",") ; Returns the quad converted to a string including a thousands separator.
Declare.s   FormatDouble (value.d,  decimals = 2, decSep$ =".", thouSep$=",", alwaysSign = #False) ; Returns the double converted to a string including a thousands separator and a fixed number of decimals.
Declare.s   FormatBytes (Bytes.d, format, decimals = 1) ; Returns the bytes converted to a string including a thousands separator and a fixed number of decimals plus the appropriate unit suffix.
Declare.i   SplitToArray (s$, sep$, Array arr$(1)) ; Split a string using the specified separator into an array of strings.
Declare.i   SplitToArrayEx (s$, sepList$, Array arr$(1)) ; Split a string using the specified separators list into an array of strings.

EndDeclareModule

Module str
EnableExplicit

Procedure.s Sprintf (fmt$, *v1 = 0, *v2 = 0, *v3 = 0, *v4 = 0, *v5 = 0, *v6 = 0, *v7 = 0, *v8 = 0, *v9 = 0, *v10 = 0)
;> A sprintf()-like function inspired by the C library function.

; By mk-soft
; https://www.purebasic.fr/english/viewtopic.php?f=12&t=32026
;
; %[flags][width][.precision]specifier
;
; flags:
;   -         Left-justify within the given field width, right justification is the default
;   +         Forces the result to be preceeded by a plus or minus sign (+ or -) even for positive numbers
;   '[char]   Fill character, space is the default
;
; width:
;   [Number]  Minimum number of characters to be printed. If the resulting string to be printed is shorter than this number, then is padded with blanks.
;             The value is never truncated even if larger.
;
; precision:
;   [Number]  For float and double specifiers: this is the number of digits to be printed after the decimal point.
;             For string specifiers: truncate string to that len.
;             For hexnumber: defined input value; 2 = byte, 4 = word; 8 = dword; 16 = qword
;             
; Specifier:
;   b         Byte
;   a         Unsigned byte
;   w         Word
;   u         Unsigned word
;   l         Long
;   q         Quad
;   i         Integer
;   f         Float
;   d         Double
;   X         Hex; Uppercase character
;   x         Hex; Lowercase character
;   s         String
;   c         Char (as an integer)

 Structure AnyType
  StructureUnion
   a.a
   b.b
   c.c
   w.w
   u.w
   l.l
   i.i
   f.f
   d.d
   q.q
  EndStructureUnion
 EndStructure

 Protected *args.Integer, *fmt.Character, *value.AnyType
 Protected out$, tmp$, SetFill$
 Protected IsValue, IsString, IsLeft, IsVZ, IsNum2, num1, num2
 
 ; Calc offset between params
 Protected param_align = @*v2 - @*v1
 
 *args  = @*v1
 *fmt = @fmt$

 Repeat
    Select *fmt\c
        Case 0
            Break
        Case '\'
            *fmt + SizeOf ( Character )
            Select *fmt\c
              Case 0   : Break
              Case '\' : out$ + "\"
              Case 'n' : out$ + #LF$
              Case 'r' : out$ + #CR$
              Case 't' : out$ + #HT$
              Case 'v' : out$ + #VT$
              Case 39  : out$ + #DQUOTE$ ; (')
              Case 'a' : out$ + #BEL$
              Case 'b' : out$ + #BS$
              Case 'f' : out$ + #FF$
              Case '[' : out$ + #ESC$
              Case '%' : out$ + "%"                 
            EndSelect
        
            *fmt + SizeOf ( Character )
     
        Case '%'
            tmp$     = "?"
            IsValue = #False
            IsString = #False
            IsLeft = #False
            IsVZ   = #False
            IsNum2 = #False
            SetFill$ = " "
            num1    = 0
            num2    = 0
            *fmt   + SizeOf ( Character )
            *value  = *args\i ; get pointer to value

            Repeat
       
                Select *fmt\c
                    Case 0   : Break
                    Case '-' : IsLeft = #True
                    Case '+' : IsVZ   = #True
                    Case '.' : IsNum2 = #True
                    Case '%' : out$ + "%" : *fmt + SizeOf ( Character ) : Break
                    Case 39  : *fmt + SizeOf ( Character ) : If *fmt\c = 0 : Break : Else : SetFill$ = Chr(*fmt\c) : EndIf
                    Case '0' To '9'
                        If IsNum2 : num2 = num2 * 10 + *fmt\c - 48 : Else : num1 = num1 * 10 + *fmt\c - 48 : EndIf
             
                    Case 'a'
                        If *value : tmp$ = Str ( *value\a ) : EndIf : IsValue = #True
             
                    Case 'b'
                        If *value : tmp$ = Str ( *value\b ) : EndIf : IsValue = #True
            
                    Case 'u'
                        If *value : tmp$ = StrU ( *value\u, #PB_Word ) : EndIf : IsValue = #True             
                    Case 'w'
                        If *value : tmp$ = Str ( *value\w ) : EndIf : IsValue = #True                     
                    Case 'l'
                        If *value : tmp$ = Str ( *value\l ) : EndIf : IsValue = #True                 
                    Case 'q'
                        If *value : tmp$ = Str ( *value\q ) : EndIf : IsValue = #True             
                    Case 'i'
                        If *value : tmp$ = Str ( *value\i ) : EndIf : IsValue = #True             
                    Case 'f'
                        If *value : tmp$ = StrF ( *value\f, num2 ) : EndIf : IsValue = #True            
                    Case 'd'
                        If *value : tmp$ = StrD ( *value\d , num2 ) : EndIf : IsValue = #True             
                    Case 's'
                        If *value : tmp$ = PeekS ( *value ) : EndIf
                        If num2   : tmp$ = Left ( tmp$, num2 ) : EndIf : IsString = #True            
                    Case 'c'
                        If *value : tmp$ = Chr ( *value\i ) : EndIf : IsString = #True             
                    Case 'X', 'x'
                        If num2 = 0 : num2 = num1 : EndIf
                        If *value
                            Select num2
                                Case 0 To 2  : tmp$ = RSet ( Hex ( *value\b, #PB_Byte), num2, "0" )
                                Case 3 To 4  : tmp$ = RSet ( Hex ( *value\w, #PB_Word), num2, "0" )
                                Case 5 To 8  : tmp$ = RSet ( Hex ( *value\l, #PB_Long), num2, "0" )
                                Default      : tmp$ = RSet ( Hex ( *value\q, #PB_Quad), num2, "0" )
                            EndSelect
                        EndIf
                        If *fmt\c = 'x' : tmp$ = LCase ( tmp$ ) : EndIf
                        IsString = #True             
                    Default
                        IsString = #True             
                EndSelect
         
                If IsValue And IsVZ
                    If Left ( tmp$, 1 ) <> "-"
                        tmp$ = "+" + tmp$                 
                    EndIf
                EndIf
         
                *fmt + SizeOf(Character)
         
                If IsString Or IsValue
                    If num1 And Len ( tmp$ ) < num1
                        If IsLeft
                            out$ + LSet ( tmp$, num1, SetFill$ )
                        Else
                            out$ + RSet ( tmp$, num1, SetFill$ )
                        EndIf
                    Else
                        out$ + tmp$
                    EndIf                   
                    *args + param_align                   
                    Break
                EndIf
         
            ForEver
       
        Default
            out$ + Chr    ( *fmt\c   )
            *fmt + SizeOf ( Character )       
    EndSelect   
 ForEver
 
 ProcedureReturn out$   
EndProcedure

Procedure.s TrimEx (in$, char$ = " ")
;> Removes char$ from in$ left and right, and then replace internal multiple consecutive char$ with a single one.

; char$ must be one char long
 
 Protected lbef, laft
 
 char$ = Left (char$, 1)
 
 in$ = Trim(in$, char$)
  
 Repeat
    lbef = Len(in$)
    in$ = ReplaceString(in$, char$ + char$, char$)
    laft = Len(in$)
    If lbef = laft
        Break
    EndIf
 ForEver
  
 ProcedureReturn in$
EndProcedure

Procedure.s PadLeft (s$, newlen, char$ = " ")
;> Pads to the left the string s$ with the char char$.
; If a too small value for len is specified, the original string is returned.

 If newlen > Len(s$)
    ProcedureReturn RSet(s$, newlen, char$)
 EndIf
 ProcedureReturn s$
EndProcedure

Procedure.s PadRight (s$, newlen, char$ = " ")
;> Pads to the right the string s$ with the char char$.
; If a too small value for len is specified, the original string is returned.

 If newlen > Len(s$)
    ProcedureReturn LSet(s$, newlen, char$)
 EndIf
 ProcedureReturn s$
EndProcedure


Procedure.s FormatQuad (value.q, sep$ = ",") 
;> Returns the quad converted to a string including a thousands separator.

 Protected r$, q$ = Str(value)
 Protected i, l = Len(q$) 
 
 For i = 0 To l - 2
    r$ + Mid(q$,i+1,1)
    If (l-i) % 3 = 1   
        r$ + sep$
    EndIf        
 Next
 r$ + Right(q$,1)
 
 ProcedureReturn r$
EndProcedure

Procedure.s FormatDouble (value.d,  decimals = 2, decSep$ =".", thouSep$=",", alwaysSign = #False)
;> Returns the double converted to a string including a thousands separator and a fixed number of decimals.
; Original code: https://www.purebasic.fr/german/viewtopic.php?p=333457&sid=b6f80a624e737ffe417efb25b40c6f6b#p333457

 Protected ret$
 Protected sign, i
 Protected num$, left$, right$
  
 If value < 0
    value = -value
    sign = 1
 EndIf
  
 num$ = StrD(value, decimals) + "."
 left$ = StringField(num$, 1, ".")
 right$ = StringField(num$, 2, ".")
 
 i = Len(left$) - 3
  
 While i > 0
    left$ = Left(left$,i) + thouSep$ + Mid(left$, i+1)
    i-3
 Wend
 
 If left$ = #Empty$
    left$ = "0"
 EndIf
 
 If right$ <> #Empty$
    ret$ = left$ + decSep$ + right$
 Else
    ret$ = left$
 EndIf
 
 If sign Or alwaysSign
    ret$ = Mid("+-", sign + 1, 1) + ret$
 EndIf
  
 ProcedureReturn ret$
EndProcedure

Procedure.s FormatBytes (Bytes.d, format, decimals = 1)
;> Returns the bytes converted to a string including a thousands separator and a fixed number of decimals plus the appropriate unit suffix.

; format must be one of these:
; #FormatBytes_IEC 
; #FormatBytes_Memory
; #FormatBytes_Metric

; Original code: https://www.purebasic.fr/english/viewtopic.php?t=70940 

 Protected Base, Exponent, MaxExponent, Unit$
   
 Select format
    Case #FormatBytes_IEC
        ; https://en.wikipedia.org/wiki/Byte#Multiple-byte_units
        Base = 1024
        Unit$ = "KiB,MiB,GiB,TiB,PiB"
    Case #FormatBytes_Memory
        ; https://en.wikipedia.org/wiki/JEDEC_memory_standards#Unit_prefixes_for_semiconductor_storage_capacity
        Base = 1024
        Unit$ = "KB,MB,GB,TB"    
    Case #FormatBytes_Metric 
        ; https://en.wikipedia.org/wiki/Metric_prefix
        Base = 1000
        Unit$ = "kB,MB,GB,TB,PB"    
    Default
        ProcedureReturn "?"
 EndSelect
  
 Exponent = Int(Log(Bytes) / Log(Base))
  
 MaxExponent = CountString(Unit$, ",") + 1
  
 If Exponent > MaxExponent
    Exponent = MaxExponent
 EndIf
  
 If Exponent
    ProcedureReturn FormatDouble (Bytes / Pow(Base, Exponent), decimals) + " " + StringField(Unit$, Exponent, ",")
 Else
    ProcedureReturn FormatDouble (Bytes, 0) + " Bytes"
 EndIf
EndProcedure

Procedure.i SplitToArray (s$, sep$, Array arr$(1))
;> Split a string using the specified separator into an array of strings.
; sep$ must be at least one char long.
; If a separator is immediately near another separator an empty item is extracted.
; If the array is big enough for the number of splitted items its size doesn't change, else it's resized to the number of items - 1.
; The number of splitted items is returned, the minimum is 1 when the untouched original string is stored in arr$(0).
; This should be used when a single type of separator is present.

 Protected i, items
 
 If Len(sep$) > 0 
     items = CountString(s$,sep$) + 1
     
     If items > ArraySize(arr$()) + 1
        ReDim arr$(items - 1)
     EndIf
     
     For i = 1 To items    
        arr$(i-1) = StringField(s$, i, sep$)
     Next
 EndIf
 
 ProcedureReturn items
EndProcedure

Procedure.i SplitToArrayEx (s$, sepList$, Array arr$(1))
;> Split a string using the specified separators list into an array of strings.
; The separators inside sepList$ must be separated by "|" and sepList$ must be at least one char long.
; If a separator is immediately near another separator an empty item is extracted.
; Some characters must be expressed with a special syntax: 
; \\        means a backslash
; \{34}     means a double quote
; \{124}    means a pipe

; If the array is big enough for the number of splitted items its size doesn't change, else it's resized to the number of items - 1.
; The number of splitted items is returned, the minimum is 1 when the untouched original string is stored in arr$(0).
; This should be used when multiple type of separators are present.

 Protected i, items, separators
 Dim sep$(0)
 
 If Len(sepList$) > 0
    separators = SplitToArray(sepList$, "|", sep$())
    For i = 1 To separators
        If FindString(sep$(i-1), "\\") ; \
            sep$(i-1) = ReplaceString(sep$(i-1), "\\", "\") 
        EndIf
        If FindString(sep$(i-1), "\{34}") ; "
            sep$(i-1) = ReplaceString(sep$(i-1), "\{34}", Chr(34)) 
        EndIf
        If FindString(sep$(i-1), "\{124}") ; |
            sep$(i-1) = ReplaceString(sep$(i-1), "\{124}", "|") 
        EndIf                    
    Next
 EndIf
 
 For i = 2 To separators
    s$ = ReplaceString(s$, sep$(i-1), sep$(0)) 
 Next
 
 items = SplitToArray(s$, sep$(0), arr$())
 
 ProcedureReturn items
EndProcedure

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 35
; FirstLine = 35
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier