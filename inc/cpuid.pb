; *********************************************************************************************************************
; cpuid.pb
; by Luis
;
; Wrapper and utilities for the CPUID instruction
;
; OS: Windows, Linux 
; ASM backend, C backend, x86, x64
;
; 1.00, Feb 11 2023, PB 6.01
; First release.
; *********************************************************************************************************************

DeclareModule CPUID
Declare.i    IsSupported () ; Check if CPUID is supported by the CPU
Declare      GetHighestLeaf (Extended.l, *HighestLeaf, *Manufacturer = #Null) ; Get the 'highest' or 'highest extended' leaf level supported by CPUID and optionally the manufacturer ID.
Declare      CPUID (leaf.l, *eax, *ebx, *ecx, *edx) ; This wraps the CPUID instruction.
EndDeclareModule

;- [ INCLUDES ]

XIncludeFile "str.pb"

Module CPUID
EnableExplicit

Procedure.i IsSupported ()
;> Check if CPUID is supported by the CPU 
; It was introduced in 1993 at the time of the Pentium, so ... but you may do a check before calling the other functions.
 
CompilerIf (#PB_Compiler_Processor = #PB_Processor_x64)
 ProcedureReturn 1 ; CPUID is always present on 64 bit CPUs
CompilerEndIf
  
CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)  

 CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm
  !pushfd
  !pop eax
  !mov edx, eax
  !xor eax, 0x00200000
  !push eax
  !popfd
  !pushfd
  !pop eax
  !xor eax, edx
  !jne IsCpuid_OK
  !xor eax, eax
  !ret
  !IsCpuid_OK:
  !mov eax, 1
  !ret
 CompilerEndIf

 CompilerIf #PB_Compiler_Backend = #PB_Backend_C
  !asm volatile (".intel_syntax noprefix;"
  !"pushfd;"
  !"pop eax;"
  !"mov edx, eax;"
  !"xor eax, 0x00200000;"  
  !"push eax;"
  !"popfd;"
  !"pushfd;"
  !"pop eax;"
  !"xor eax, edx;"
  
  !"jne IsCpuid_OK;"
  !"mov %[retval], 0;"
  !"jmp IsCpuid_EXIT;"
  
  !"IsCpuid_OK:"
  !"mov %[retval], 1;"
  
  !"IsCpuid_EXIT:"
      
  !".att_syntax;"
  !: [retval] "=r" (r)
  !);

  !return r;
 CompilerEndIf

CompilerEndIf

EndProcedure

Procedure GetHighestLeaf (Extended.l, *HighestLeaf, *Manufacturer = #Null)
;> Get the 'highest' or 'highest extended' leaf level supported by CPUID and optionally the manufacturer ID.

; If Extended is = 0 the long pointed by *HighestLeaf will contain the highest leaf level supported.
; If Extended is = $80000000 the long pointed by *HighestLeaf will contain the highest extended leaf level supported.

; *HighestLeaf must be a pointer to a 32 bit integer (PB long)

; If *Manufacturer is not null it must point to a string of at least 12 * SizeOf(Character) + null termination.
; It will contain the manufacturer string ID of the CPU: "AuthenticAMD", "Genuineintel", etc.)

; Before calling CPUID() you should verify if the leaf level you are going to request is supported using this function.

Protected.l mf1, mf2, mf3

CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm
  !mov eax, dword [p.v_Extended]
  !CPUID
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)  
  !mov ebp, dword [p.p_HighestLeaf]
  !mov dword [ebp], eax 
 CompilerElse   
  !mov rbp, qword [p.p_HighestLeaf]
  !mov dword [rbp], eax
 CompilerEndIf 
  !mov dword [p.v_mf1], ebx
  !mov dword [p.v_mf2], edx
  !mov dword [p.v_mf3], ecx
CompilerEndIf

CompilerIf #PB_Compiler_Backend = #PB_Backend_C
  !unsigned int reg_a, reg_b, reg_c, reg_d;
  
  !asm volatile ("cpuid;"  
  !: "=a" (reg_a), "=b" (reg_b), "=c" (reg_c), "=d" (reg_d)	
  !: "0" (v_extended)
  !);
  
  ! * (unsigned int *) p_highestleaf = reg_a;
  ! v_mf1 = reg_b;
  ! v_mf2 = reg_d;
  ! v_mf3 = reg_c;
CompilerEndIf

If *Manufacturer
    PokeS(*Manufacturer, PeekS(@mf1, 4, #PB_Ascii) + PeekS(@mf2, 4, #PB_Ascii) + PeekS(@mf3, 4, #PB_Ascii))       
EndIf
EndProcedure

Procedure CPUID (leaf.l, *eax, *ebx, *ecx, *edx)
;> This wraps the CPUID instruction.

; leaf must be a 32 bit integer (PB long)
; It must contain the numerical id of the requested level of information and it will be loaded in the EAX register.

; *eax, *ebx, *ecx, *edx must be pointers to 32 bit integers (PB long)
; They will contain a copy of the values stored in the cpu registers after CPUID has been called.

CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm
  !mov eax, dword [p.v_leaf]
  !CPUID
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)  
  !mov ebp, dword [p.p_eax]
  !mov dword [ebp], eax
  !mov ebp, dword [p.p_ebx]
  !mov dword [ebp], ebx
  !mov ebp, dword [p.p_ecx]
  !mov dword [ebp], ecx
  !mov ebp, dword [p.p_edx]
  !mov dword [ebp], edx  
 CompilerElse   
  !mov rbp, qword [p.p_eax]
  !mov dword [rbp], eax
  !mov rbp, qword [p.p_ebx]
  !mov dword [rbp], ebx
  !mov rbp, qword [p.p_ecx]
  !mov dword [rbp], ecx
  !mov rbp, qword [p.p_edx]
  !mov dword [rbp], edx
 CompilerEndIf  
CompilerEndIf

CompilerIf #PB_Compiler_Backend = #PB_Backend_C
  !unsigned int reg_a, reg_b, reg_c, reg_d;
  
  !asm volatile ("cpuid;"  
  !: "=a" (reg_a), "=b" (reg_b), "=c" (reg_c), "=d" (reg_d)	
  !: "0" (v_leaf)
  !);
  
  ! * (unsigned int *) p_eax = reg_a;
  ! * (unsigned int *) p_ebx = reg_b;
  ! * (unsigned int *) p_ecx = reg_c;
  ! * (unsigned int *) p_edx = reg_d;
CompilerEndIf
EndProcedure

EndModule

; IDE Options = PureBasic 6.01 LTS beta 4 (Windows - x86)
; CursorPosition = 6
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier