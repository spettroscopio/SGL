; *********************************************************************************************************************
; sys.pb
; by Luis
;
; Various system functions.
;
; OS: Windows, Linux
;
; 1.00, Feb 19 2023, PB 6.01
; First release.
; *********************************************************************************************************************

XIncludeFile "cpuid.pb"
XIncludeFile "str.pb"

DeclareModule sys
Declare.s    GetProgramName() ; Returns the program name of the process, without path or extension.
Declare.s    GetProgramDirectory() ; Returns the path of the directory from which the program has been launched.
Declare.i    Is64BitOS() ; Check if the OS under which the program is running is a 64 bit OS.
Declare.s    GetOSVersion() ; Returns a string representing the version number of the OS.
Declare.s    GetOS() ; Returns a string containing the name, bitness, and version number of the OS.
Declare.s    GetCpuName() ; Returns the CPU descriptive name or the manufacturer string if not supported.
Declare.q    GetTotalMemory() ; Returns the total system memory.
Declare.q    GetFreeMemory() ; Returns the free system memory.
EndDeclareModule

Module sys
EnableExplicit

;- Windows 

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)

Procedure.i WIN_Is64BitOS()
CompilerIf (#PB_Compiler_Processor = #PB_Processor_x64)
 ProcedureReturn 1 
CompilerElse   
 Protected Is64BitOS = 0
 Protected hDLL, IsWow64Process_
 
 hDll = OpenLibrary(#PB_Any,"kernel32.dll")
 If hDll
    IsWow64Process_ = GetFunction(hDll,"IsWow64Process")
    If IsWow64Process_
        CallFunctionFast(IsWow64Process_, GetCurrentProcess_(), @Is64BitOS)
    EndIf
    CloseLibrary(hDll)
 EndIf      
 ProcedureReturn Is64BitOS  
CompilerEndIf
EndProcedure

Procedure.s WIN_GetOSVersion ()
; see http://msdn.microsoft.com/en-us/library/windows/desktop/dn302074%28v=vs.85%29.aspx
; see http://msdn.microsoft.com/en-us/library/windows/hardware/ff561910%28v=vs.85%29.aspx

 Protected osvex.OSVERSIONINFOEX 
 Protected *fp, err, hDll, major, minor, release
 
 osvex\dwOSVersionInfoSize = SizeOf(osvex)
 
 err = 1
 
 If GetVersionEx_(@osvex)
    err = 0
    
    major = osvex\dwMajorVersion
    minor = osvex\dwMinorVersion 
    release = osvex\dwBuildNumber
        
    If (major = 6 And minor = 2) ; windows 8 he says... we'll double check this
        err = 1
        hDll = OpenLibrary (#PB_Any, "ntdll.dll")           
        If hDll    
            *fp = GetFunction(hDll, "RtlGetVersion")
            If *fp And CallFunctionFast(*fp, @osvex) = 0 ; #STATUS_SUCCESS
                err = 0
                major = osvex\dwMajorVersion    
                minor = osvex\dwMinorVersion
                release = osvex\dwBuildNumber
            EndIf     
            CloseLibrary(hDll)        
        EndIf
    EndIf      
 EndIf      
 
 If err
    ProcedureReturn #Empty$
 Else
    ; "10.0.19045" = Win 10 22H2
    ProcedureReturn Str(major) + "." + Str(minor) + "." + Str(release)
 EndIf
EndProcedure

Procedure.s WIN_GetOS()
 Protected OS$, arch$
 Protected OS_Version$ = WIN_GetOSVersion()
 Protected OS_Maj$ = StringField(OS_Version$, 1, ".")
 Protected OS_Min$ = StringField(OS_Version$, 2, ".")
 Protected OS_Release$ = StringField(OS_Version$, 3, ".")

 Select OSVersion()
    Case #PB_OS_Windows_NT3_51
        OS$ = "Windows NT 3.51"
    Case #PB_OS_Windows_95
        OS$ = "Windows 95"
        If OS_Maj$ = "4"
            If OS_Release$ = "1111" : OS$ = "Windows 95 OSR2" : EndIf
        EndIf        
    Case #PB_OS_Windows_NT_4
        OS$ = "Windows NT 4.0"
    Case #PB_OS_Windows_98
        OS$ = "Windows 98"    
        If OS_Maj$ = "4" And OS_Min$ = "10"
            If OS_Release$ = "2222" : OS$ = "Windows 98 SE" : EndIf        
        EndIf    
    Case #PB_OS_Windows_ME
        OS$ = "Windows ME"    
    Case #PB_OS_Windows_2000
        OS$ = "Windows 2000"   
    Case #PB_OS_Windows_XP
        OS$ = "Windows XP"    
    Case #PB_OS_Windows_Server_2003
        OS$ = "Windows Server 2003"    
    Case #PB_OS_Windows_Vista
        OS$ = "Windows Vista"   
        If OS_Maj$ = "6" And OS_Min$ ="0"
            If OS_Release$ = "6001" : OS$ = "Windows Vista (SP1)" : EndIf        
            If OS_Release$ = "6002" : OS$ = "Windows Vista (SP2)" : EndIf        
        EndIf 
    Case #PB_OS_Windows_Server_2008, #PB_OS_Windows_Server_2008_R2
        OS$ = "Windows Server 2008"    
    Case #PB_OS_Windows_7
        OS$ = "Windows 7"
        If OS_Maj$ = "6" And OS_Min$ ="0"
            If OS_Release$ = "7601": OS$ = "Windows 7 (SP1)" : EndIf        
        EndIf
    Case #PB_OS_Windows_8
        OS$ = "Windows 8"
    Case #PB_OS_Windows_Server_2012, #PB_OS_Windows_Server_2012_R2
        OS$ = "Windows Server 2012"    
    Case #PB_OS_Windows_8_1
        OS$ = "Windows 8.1"        
    Case #PB_OS_Windows_10
        OS$ = "Windows 10"        
    Case #PB_OS_Windows_11
        OS$ = "Windows 11"        
    Default
        OS$ = "Windows"
 EndSelect
 
 If WIN_Is64BitOS()
    arch$ = "x64"
 Else
    arch$ = "x86"
 EndIf
 
 ; "Windows 10 x64 (10.0.19045)"
 ProcedureReturn OS$ + " " + arch$ + " (" + OS_Version$ + ")"
EndProcedure

CompilerEndIf ; Windows 

;- Linux

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
  
Structure new_utsname 
 sysname.a[64+1] ; Linux
 nodename.a[64+1] ; LINUX-MINT
 release.a[64+1] ; 5.15.0-60-generic
 version.a[64+1] ; #66-Ubuntu SMP Fri Jan 20 14:29:49 UTC 2023
 machine.a[64+1] ; x86_64
 domainame.a[64+1] 
EndStructure

Procedure.s LIN_StripIssueMarkers (s$)
 Protected c$, out$
 Protected skipping = 0, i, l = Len(s$)
 
 For i = 1 To l
    c$ = Mid(s$, i, 1)
    
    If c$ = "\"
        skipping = 1
        Continue
    EndIf
    
    If skipping 
        If c$ = " "
            skipping = 0
        EndIf
    Else
        out$ + c$
    EndIf    
 Next
 
 ProcedureReturn Str::TrimEx(out$)
EndProcedure

Procedure.i LIN_Is64BitOS() 
 Protected buf.new_utsname
 Protected Is64BitOS = 0
 Protected arch$

 If uname_(@buf) = 0 ; success
    arch$ = PeekS(@buf\machine,-1,#PB_Ascii) ; x86_64
    If arch$ = "x86_64" ; 64 bit on Intel architecture
        Is64BitOS = 1
    EndIf
 EndIf

 ProcedureReturn Is64BitOS  
EndProcedure

Procedure.s LIN_GetOSVersion ()   
 Protected buf.new_utsname
 Protected ver$
 
 If uname_(@buf) = 0 ; success
    ; "5.15.0-60-generic"
    ver$ = PeekS(@buf\release,-1,#PB_Ascii) 
 EndIf
 
  ProcedureReturn ver$
EndProcedure

Procedure.s LIN_GetOS()
 Protected buf.new_utsname, fh
 Protected OS$, t$, arch$, issue$, os_release$
 Protected os_name$, name$ = "NAME=", name_l = Len(name$)
 Protected os_pretty_name$, pretty_name$ = "PRETTY_NAME=", pretty_name_l = Len(pretty_name$)
 
 If LIN_Is64BitOS()
    arch$ = "x64"
 Else
    arch$ = "x86"
 EndIf
 
 fh = ReadFile(#PB_Any, "/etc/issue")
 If fh
    t$ = ReadString(fh)
    CloseFile(fh)
    If t$ 
        issue$ = LIN_StripIssueMarkers (t$) 
    EndIf
 EndIf 
 
 fh = ReadFile(#PB_Any, "/etc/os-release")
 If fh
    While Not Eof(fh)
        t$ = ReadString(fh)
        If Left(t$, name_l) = name$
            t$ = Mid(t$, name_l + 1)
            t$ = Mid(t$, 2, Len(t$) - 2)
            os_name$ = t$            
        EndIf        
        If Left(t$, pretty_name_l) = pretty_name$
            t$ = Mid(t$, pretty_name_l + 1)
            t$ = Mid(t$, 2, Len(t$) - 2)
            os_pretty_name$ = t$            
        EndIf        
    Wend
    CloseFile(fh)
    
    If os_pretty_name$ 
        os_release$ = os_pretty_name$ 
    ElseIf os_name$ 
        os_release$ = os_name$ 
    EndIf
 EndIf

 If uname_(@buf) = 0 ; success
    ; Linux x64 (5.15.0-60-generic)
    OS$ = PeekS(@buf\sysname,-1,#PB_Ascii) + " " + arch$ + " (" + PeekS(@buf\release,-1,#PB_Ascii) + ")"
    If issue$     
        OS$ + ", " + issue$ ; Linux Mint 21.1 Vera
    ElseIf os_release$
        OS$ + ", " + os_release$ ; Linux Mint or Linux Mint 21.1        
    EndIf
 EndIf
  
 ProcedureReturn OS$ 
EndProcedure

CompilerEndIf ; Linux

;- [ PUBLIC ]

Procedure.s GetProgramName()
;> Returns the program name of the process, without path or extension.
; Example: "test" 
 ProcedureReturn GetFilePart(ProgramFilename(), #PB_FileSystem_NoExtension) 
EndProcedure

Procedure.s GetProgramDirectory()
;> Returns the path of the directory from which the program has been launched.
; Example: "C:\Dev\PB\test\"
 ProcedureReturn GetPathPart(ProgramFilename()) 
EndProcedure

Procedure.i Is64BitOS()
;> Check if the OS under which the program is running is a 64 bit OS.
; Returns 1 for 64 bit OS, else 0.

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
 ProcedureReturn WIN_Is64BitOS()                                                      
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
 ProcedureReturn LIN_Is64BitOS()
CompilerEndIf
                                                       
EndProcedure

Procedure.s GetOSVersion()
;> Returns a string representing the version number of the OS.
; example:
; "6.2.9200" = Win 8.0
; "6.3.9600" = Win 8.1
; "10.0.19045" = Win 10 22H2
; "5.15.0-60-generic" = Linux kernel version

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
 ProcedureReturn WIN_GetOSVersion()                                                      
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
 ProcedureReturn LIN_GetOSVersion()
CompilerEndIf

EndProcedure

Procedure.s GetOS()
;> Returns a string containing the name, bitness, and version number of the OS.
; example:
; "Windows 10 x64 (10.0.19045)"
; "Linux x64 (5.15.0-60-generic)
; "Linux x64 (5.15.0-60-generic), Linux Mint 21.1 Vera"
  
CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
 ProcedureReturn WIN_GetOS()
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
 ProcedureReturn LIN_GetOS()
CompilerEndIf

EndProcedure

Procedure.s GetCpuName()
;> Returns the CPU descriptive name or the manufacturer string if not supported.

 Protected Text$, Manufacturer$ = Space(12)
 Protected.l HighestExt, leaf, eax, ebx, ecx, edx
 
 CPUID::GetHighestLeaf ($80000000, @HighestExt, @Manufacturer$)

 If (HighestExt & $7FFFFFFF) >= $0004 ; checks if the required leaves are supported   
    For leaf = $80000002 To $80000004
        CPUID::CPUID (leaf, @eax, @ebx, @ecx, @edx)
        Text$ + PeekS(@eax, 4, #PB_Ascii) + PeekS(@ebx, 4, #PB_Ascii) + PeekS(@ecx, 4, #PB_Ascii) + PeekS(@edx, 4, #PB_Ascii)         
    Next           
 Else
    Text$ = Manufacturer$
 EndIf
 
 ProcedureReturn str::TrimEx(Text$)
EndProcedure

Procedure.q GetTotalMemory()
;> Returns the total system memory.
 ProcedureReturn MemoryStatus(#PB_System_TotalPhysical)
EndProcedure

Procedure.q GetFreeMemory()
;> Returns the free system memory.
 ProcedureReturn MemoryStatus(#PB_System_FreePhysical)
EndProcedure

EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 244
; FirstLine = 232
; Folding = -----
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory