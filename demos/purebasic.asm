; 
; PureBasic 6.01 LTS (Windows - x64) generated code
; 
; (c) 2022 Fantaisie Software
; 
; The header must remain intact for Re-Assembly
; 
; System
; Sort
; Process
; Cipher
; Math
; Map
; Library
; ImagePluginPNG
; FileSystem
; Date
; File
; Array
; 2DDrawing
; Image
; LinkedList
; AlphaImage
; ImagePluginBMP
; ImagePlugin
; VectorDrawing
; String
; Memory
; Font
; Object
; SimpleList
; :System
; kernel32.lib
; opengl32.lib
; :Import
; N:\sgl\glfw\lib\glfw3.x64.lib
; Opengl32.lib
; Opengl32.lib
; Glu32.lib
; Opengl32.lib
; 
format MS64 COFF
; 
; 
extrn PB_NewList
extrn PB_NewMap
extrn PB_ACos_DOUBLE
extrn PB_AddElement
extrn PB_AllocateMemory
extrn PB_AllocateStructure
extrn PB_ArraySize
extrn PB_Asc
extrn PB_Ascii
extrn PB_BackColor
extrn PB_Blue
extrn PB_Box
extrn PB_Box2
extrn PB_CallFunctionFast
extrn PB_CallFunctionFast2
extrn PB_Chr
extrn PB_Circle2
extrn PB_ClearList
extrn PB_CloseFile
extrn PB_CloseLibrary
extrn PB_CopyArray
extrn PB_CopyMemory
extrn PB_CopyStructure
extrn PB_CountCPUs2
extrn PB_CountString
extrn PB_CreateImage2
extrn PB_CreateImage3
extrn PB_Degree_DOUBLE
extrn PB_Delay
extrn PB_DrawImage
extrn PB_DrawingBuffer
extrn PB_DrawingBufferPitch
extrn PB_DrawingBufferPixelFormat
extrn PB_DrawingFont
extrn PB_DrawingMode
extrn PB_DrawText
extrn PB_EndAlphaImage
extrn PB_EndVectorDrawing
extrn PB_FindString
extrn PB_FontID
extrn PB_FreeFiles
extrn PB_FreeFileSystem
extrn PB_FreeFont
extrn PB_FreeFonts
extrn PB_FreeImage
extrn PB_FreeImages
extrn PB_FreeLibraries
extrn PB_FreeList
extrn PB_FreeMap
extrn PB_FreeMemory
extrn PB_FreeMemorys
extrn PB_FreeObjects
extrn PB_FreeStructure
extrn PB_FrontColor
extrn PB_GetFilePart2
extrn PB_GetFunction
extrn PB_GetPathPart
extrn PB_Green
extrn PB_Hex2
extrn PB_ImageDepth
extrn PB_ImageHeight
extrn PB_ImageID
extrn PB_ImageOutput
extrn PB_ImageWidth
extrn PB_Init2DDrawing
extrn PB_InitAlphaImage
extrn PB_InitArray
extrn PB_InitBMPImagePlugin
extrn PB_InitFile
extrn PB_InitFont
extrn PB_InitImage
extrn PB_InitImageDecoder
extrn PB_InitLibrary
extrn PB_InitList
extrn PB_InitMap
extrn PB_InitMemory
extrn PB_InitProcess
extrn PB_InitVectorDrawing
extrn PB_Int
extrn PB_IsImage
extrn PB_LCase
extrn PB_Left
extrn PB_Len
extrn PB_LoadFont2
extrn PB_Log_DOUBLE
extrn PB_LSet2
extrn PB_MapKey
extrn PB_MapSize
extrn PB_MemoryStatus
extrn PB_Mid
extrn PB_Mid2
extrn PB_NextElement
extrn PB_NextMapElement
extrn PB_OpenLibrary
extrn PB_OSVersion
extrn PB_PeekI
extrn PB_PeekS
extrn PB_PeekS3
extrn PB_PokeI
extrn PB_PokeL
extrn PB_PokeS
extrn PB_Pow_DOUBLE
extrn PB_ProgramFilename
extrn PB_Radian_DOUBLE
extrn PB_ReadFile
extrn PB_ReadString2
extrn PB_ReadStringFormat
extrn PB_Red
extrn PB_ReplaceString
extrn PB_ResetList
extrn PB_ResetMap
extrn PB_Right
extrn PB_Round_DOUBLE
extrn PB_RSet2
extrn PB_SortArray
extrn PB_Space
extrn PB_StartDrawing
extrn PB_StopDrawing
extrn PB_Str
extrn PB_StrD
extrn PB_StrD2
extrn PB_StrF2
extrn PB_StringField
extrn PB_StrU2
extrn PB_TextHeight
extrn PB_TextWidth
extrn PB_Trim2
extrn PB_UsePNGImageDecoder
extrn PB_UsePNGImageEncoder
extrn PB_Val
extrn ExitProcess
extrn GetModuleHandleW
extrn GetVersionExW
extrn HeapCreate
extrn HeapDestroy
extrn glBindTexture
extrn glBlendFunc
extrn glClear
extrn glClearColor
extrn glDeleteTextures
extrn glDisable
extrn glDrawElements
extrn glEnable
extrn glGenTextures
extrn glGetError
extrn glGetIntegerv
extrn glGetString
extrn glReadPixels
extrn glTexImage2D
extrn glTexParameteri
extrn glViewport
extrn glfwCreateWindow
extrn glfwDefaultWindowHints
extrn glfwDestroyWindow
extrn glfwFocusWindow
extrn glfwGetCurrentContext
extrn glfwGetCursorPos
extrn glfwGetFramebufferSize
extrn glfwGetKeyName
extrn glfwGetMonitorContentScale
extrn glfwGetMonitorName
extrn glfwGetMonitors
extrn glfwGetMouseButton
extrn glfwGetPrimaryMonitor
extrn glfwGetProcAddress
extrn glfwGetTime
extrn glfwGetTimerFrequency
extrn glfwGetVersionString
extrn glfwGetVideoMode
extrn glfwGetVideoModes
extrn glfwGetWindowAttrib
extrn glfwGetWindowContentScale
extrn glfwGetWindowMonitor
extrn glfwGetWindowPos
extrn glfwHideWindow
extrn glfwIconifyWindow
extrn glfwInit
extrn glfwMakeContextCurrent
extrn glfwMaximizeWindow
extrn glfwPollEvents
extrn glfwRawMouseMotionSupported
extrn glfwRestoreWindow
extrn glfwSetCharCallback
extrn glfwSetCursorEnterCallback
extrn glfwSetCursorPos
extrn glfwSetCursorPosCallback
extrn glfwSetErrorCallback
extrn glfwSetFramebufferSizeCallback
extrn glfwSetInputMode
extrn glfwSetKeyCallback
extrn glfwSetMouseButtonCallback
extrn glfwSetScrollCallback
extrn glfwSetWindowAspectRatio
extrn glfwSetWindowAttrib
extrn glfwSetWindowCloseCallback
extrn glfwSetWindowFocusCallback
extrn glfwSetWindowIcon
extrn glfwSetWindowIconifyCallback
extrn glfwSetWindowMaximizeCallback
extrn glfwSetWindowMonitor
extrn glfwSetWindowPos
extrn glfwSetWindowPosCallback
extrn glfwSetWindowRefreshCallback
extrn glfwSetWindowShouldClose
extrn glfwSetWindowSize
extrn glfwSetWindowSizeCallback
extrn glfwSetWindowSizeLimits
extrn glfwSetWindowTitle
extrn glfwShowWindow
extrn glfwSwapBuffers
extrn glfwSwapInterval
extrn glfwTerminate
extrn glfwWaitEvents
extrn glfwWaitEventsTimeout
extrn glfwWindowHint
extrn glfwWindowShouldClose
extrn memset
extrn wglGetCurrentDC
extrn SYS_CopyString
extrn SYS_InitDynamicStructure
extrn SYS_ToAscii
extrn SYS_ToUTF8
extrn SYS_FreeStructureStrings
extrn SYS_FreeArray
extrn SYS_StringEqual
extrn SYS_StringSuperior
extrn SYS_StringInferior
extrn SYS_AllocateString4
extrn SYS_FastAllocateString4
extrn SYS_FastAllocateStringFree4
extrn SYS_FreeString
extrn SYS_FreeStringNoCheck
extrn SYS_AllocateArray
extrn SYS_ReAllocateArray
extrn PB_GetMapElement
extrn PB_StringBase
extrn SYS_InitString
extrn SYS_FreeStrings
; 
extrn PB_StringBasePosition
public _PB_Instance
public PB_ExecutableType
public PB_OpenGLSubsystem
public _PB_MemoryBase
public PB_Instance
public PB_MemoryBase
public PB_EndFunctions

macro pb_public symbol
{
  public  _#symbol
  public symbol
_#symbol:
symbol:
}

macro    pb_align value { rb (value-1) - ($-_PB_DataSection + value-1) mod value }
macro pb_bssalign value { rb (value-1) - ($-_PB_BSSSection  + value-1) mod value }
; 
public PureBasicStart
; 
section '.code' code readable executable align 4096
; 
; 
PureBasicStart:
; 
  SUB    rsp,40
  MOV    r8,I_BSSEnd-I_BSSStart
  XOR    rdx,rdx
  MOV    rcx,I_BSSStart
  CALL   memset
  XOR    rcx,rcx
  CALL   GetModuleHandleW
  MOV    [PB_Instance],rax
  XOR    r8,r8
  MOV    rdx,4096
  XOR    rcx,rcx
  CALL   HeapCreate
  MOV    [PB_MemoryBase],rax
  MOV    rax,PB_DataSectionStart
  MOV    qword [PB_DataPointer],rax
  CALL   SYS_InitString
  CALL   PB_InitFont
  CALL   PB_InitMemory
  CALL   PB_InitVectorDrawing
  CALL   PB_InitImageDecoder
  CALL   PB_InitBMPImagePlugin
  CALL   PB_InitAlphaImage
  CALL   PB_InitList
  CALL   PB_InitImage
  CALL   PB_Init2DDrawing
  CALL   PB_InitArray
  CALL   PB_InitFile
  CALL   PB_InitLibrary
  CALL   PB_InitMap
  CALL   PB_InitProcess
  MOV    rdx,s_sgl.sgl_obj
  LEA    rcx,qword [sgl.v_SGL]
  CALL   SYS_InitDynamicStructure
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_vertex_end rendertext.l_vertex_end
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_vertex_end rendertext.l_vertex_end
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_vertex_end rendertext.l_vertex_end
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_vertex rendertext.l_vertex
define rendertext.ll_render_fragment rendertext.l_fragment
define rendertext.ll_render_fragment_end rendertext.l_fragment_end
define rendertext.ll_render_fragment rendertext.l_fragment
define rendertext.ll_render_fragment rendertext.l_fragment
define rendertext.ll_render_fragment_end rendertext.l_fragment_end
define rendertext.ll_render_fragment rendertext.l_fragment
define rendertext.ll_render_fragment_end rendertext.l_fragment_end
define rendertext.ll_render_fragment rendertext.l_fragment
define rendertext.ll_render_fragment rendertext.l_fragment
; 
; 
; 
; 
; EnableExplicit
; 
; IncludeFile "../sgl.config.pbi"
; 
; 
; 
; 
; 
; DeclareModule sgl_config
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; #LINK_DYNAMIC = 0
; CompilerElse
; EndDeclareModule : Module sgl_config : EndModule
; 
; IncludeFile "../sgl.pbi"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; CompilerIf Defined(sgl_config, #PB_Module) = 0 
; 
; 
; CompilerIf sgl_config::#LINK_DYNAMIC = 1
; XIncludeFile "glfw/glfw.config.static.pbi"
; DeclareModule glfw_config
; #LINK_DYNAMIC = 0
; EndDeclareModule : Module glfw_config : EndModule
; 
; CompilerEndIf
; 
; 
; XIncludeFile "inc/std.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule std
; 
; 
; #MAX_LONG =  1 << 31 - 1
; #MIN_LONG = -#MAX_LONG - 1
; 
; #MAX_QUAD = 1 << 63 - 1
; #MIN_QUAD = -#MAX_QUAD - 1
; 
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
; #MAX_INTEGER = #MAX_QUAD
; #MIN_INTEGER = #MIN_QUAD 
; CompilerEndIf
; 
; Macro ALIGN (address, bytes)
; 
; Macro LoWord (dword) 
; 
; Macro HiWord (dword) 
; 
; Macro LoByte (word) 
; 
; Macro HiByte (word) 
; 
; Macro FreeMemorySafe (p)
; 
; Macro FreeStructureSafe (p)
; 
; Macro CloseFileSafe (h)
; 
; Declare.f    ByteToFloat (byte) 
; Declare.i    FloatToByte (float.f) 
; Declare.i    IIF (exp, T, F) 
; Declare.q    IIFq (exp, T.q, F.q) 
; Declare.f    IIFf (exp, T.f, F.f) 
; Declare.s    IIFs (exp, T$, F$) 
; 
; EndDeclareModule
; 
; Module std
; EnableExplicit
; 
; 
; 
; 
; 
; 
; 
; EndModule
; XIncludeFile "inc/str.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule str
; 
; Enumeration
; #FormatBytes_IEC = 1
; #FormatBytes_Memory = 2
; #FormatBytes_Metric = 3
; EndEnumeration
; 
; Declare.s   Sprintf (fmt$, *v1 = 0, *v2 = 0, *v3 = 0, *v4 = 0, *v5 = 0, *v6 = 0, *v7 = 0, *v8 = 0, *v9 = 0, *v10 = 0) 
; Declare.s   TrimEx (in$, char$ = " ") 
; Declare.s   PadLeft (s$, newlen, char$ = " ") 
; Declare.s   PadRight (s$, newlen, char$ = " ") 
; Declare.s   FormatQuad (value.q, sep$ = ",") 
; Declare.s   FormatDouble (value.d,  decimals = 2, decSep$ =".", thouSep$=",", alwaysSign = #False) 
; Declare.s   FormatBytes (Bytes.d, format, decimals = 1) 
; Declare.i   SplitToArray (s$, sep$, Array arr$(1)) 
; Declare.i   SplitToArrayEx (s$, sepList$, Array arr$(1)) 
; 
; EndDeclareModule
; 
; Module str
; EnableExplicit
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; XIncludeFile "inc/sys.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; XIncludeFile "cpuid.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule CPUID
; Declare.i    IsSupported () 
; Declare      GetHighestLeaf (Extended.l, *HighestLeaf, *Manufacturer = #Null) 
; Declare      CPUID (leaf.l, *eax, *ebx, *ecx, *edx) 
; EndDeclareModule
; 
; 
; 
; XIncludeFile "str.pb"
; 
; Module CPUID
; EnableExplicit
; 
; 
; 
; 
; EndModule
; 
; XIncludeFile "str.pb"
; 
; DeclareModule sys
; Declare.s    GetProgramName() 
; Declare.s    GetProgramDirectory() 
; Declare.i    Is64BitOS() 
; Declare.s    GetOSVersion() 
; Declare.s    GetOS() 
; Declare.s    GetCpuName() 
; Declare.q    GetTotalMemory() 
; Declare.q    GetFreeMemory() 
; EndDeclareModule
; 
; Module sys
; EnableExplicit
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; 
; 
; 
; 
; CompilerEndIf 
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; XIncludeFile "inc/math.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule Math
; Declare.f   Float (value) 
; Declare.d   Double (value) 
; Declare.i   Min (a, b) 
; Declare.i   Max (a, b) 
; Declare.f   Minf (a.f, b.f) 
; Declare.f   Maxf (a.f, b.f) 
; Declare.i   Absi (value) 
; Declare.q   Absq (value.q) 
; Declare.f   Absf (value.f) 
; Declare.i   GCD (a, b) 
; Declare.i   LCM (a, b) 
; Declare.i   Cycle (value, min, max) 
; Declare.i   Clamp (value, min, max) 
; Declare.f   Clampf (value.f, min.f, max.f) 
; Declare.f   Fract (value.f) 
; Declare.i   Ceiling (value.f) 
; Declare.i   Floor (value.f) 
; Declare.f   Mix (a.f, b.f, mixing.f) 
; Declare.i   MapToRange (val, low, high, new_low, new_high) 
; Declare.f   MapToRangef (val.f, low.f, high.f, new_low.f, new_high.f) 
; Declare.i   CloseEnough (a.f, b.f, epsilon.f) 
; EndDeclareModule
; 
; Module Math
; 
; EnableExplicit
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; 
; 
; 
; XIncludeFile "glfw/glfw.pbi"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; CompilerIf Defined(glfw_config, #PB_Module) = 0 
; 
; DeclareModule glfw
; 
; EnableExplicit
; 
; 
; 
; Structure GLFW_vidmode Align #PB_Structure_AlignC
; width.l
; height.l
; redBits.l
; greenBits.l
; blueBits.l
; refreshRate.l
; EndStructure
; 
; Structure GLFW_gammaramp Align #PB_Structure_AlignC
; *red
; *green
; *blue
; size.l
; EndStructure
; 
; Structure GLFW_image Align #PB_Structure_AlignC
; width.l
; height.l
; *pixels
; EndStructure
; 
; Structure GLFWgamepadstate Align #PB_Structure_AlignC
; buttons.a[15]
; axes.f[6]
; EndStructure
; 
; 
; 
; #GLFW_VERSION_MAJOR = 3
; #GLFW_VERSION_MINOR = 3
; #GLFW_VERSION_REVISION = 8
; 
; #GLFW_TRUE = 1
; #GLFW_FALSE = 0
; 
; #GLFW_RELEASE = 0
; #GLFW_PRESS = 1
; #GLFW_REPEAT = 2
; 
; #GLFW_HAT_CENTERED = 0
; #GLFW_HAT_UP = 1
; #GLFW_HAT_RIGHT = 2
; #GLFW_HAT_DOWN = 4
; #GLFW_HAT_LEFT = 8
; #GLFW_HAT_RIGHT_UP = (#GLFW_HAT_RIGHT | #GLFW_HAT_UP)
; #GLFW_HAT_RIGHT_DOWN = (#GLFW_HAT_RIGHT | #GLFW_HAT_DOWN)
; #GLFW_HAT_LEFT_UP = (#GLFW_HAT_LEFT | #GLFW_HAT_UP)
; #GLFW_HAT_LEFT_DOWN = (#GLFW_HAT_LEFT | #GLFW_HAT_DOWN)
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; #GLFW_KEY_UNKNOWN = -1
; 
; 
; #GLFW_KEY_SPACE = 32
; #GLFW_KEY_APOSTROPHE = 39 
; #GLFW_KEY_COMMA = 44 
; #GLFW_KEY_MINUS = 45 
; #GLFW_KEY_PERIOD = 46 
; #GLFW_KEY_SLASH = 47 
; #GLFW_KEY_0 = 48
; #GLFW_KEY_1 = 49
; #GLFW_KEY_2 = 50
; #GLFW_KEY_3 = 51
; #GLFW_KEY_4 = 52
; #GLFW_KEY_5 = 53
; #GLFW_KEY_6 = 54
; #GLFW_KEY_7 = 55
; #GLFW_KEY_8 = 56
; #GLFW_KEY_9 = 57
; #GLFW_KEY_SEMICOLON = 59 
; #GLFW_KEY_EQUAL = 61 
; #GLFW_KEY_A = 65
; #GLFW_KEY_B = 66
; #GLFW_KEY_C = 67
; #GLFW_KEY_D = 68
; #GLFW_KEY_E = 69
; #GLFW_KEY_F = 70
; #GLFW_KEY_G = 71
; #GLFW_KEY_H = 72
; #GLFW_KEY_I = 73
; #GLFW_KEY_J = 74
; #GLFW_KEY_K = 75
; #GLFW_KEY_L = 76
; #GLFW_KEY_M = 77
; #GLFW_KEY_N = 78
; #GLFW_KEY_O = 79
; #GLFW_KEY_P = 80
; #GLFW_KEY_Q = 81
; #GLFW_KEY_R = 82
; #GLFW_KEY_S = 83
; #GLFW_KEY_T = 84
; #GLFW_KEY_U = 85
; #GLFW_KEY_V = 86
; #GLFW_KEY_W = 87
; #GLFW_KEY_X = 88
; #GLFW_KEY_Y = 89
; #GLFW_KEY_Z = 90
; #GLFW_KEY_LEFT_BRACKET = 91 
; #GLFW_KEY_BACKSLASH = 92 
; #GLFW_KEY_RIGHT_BRACKET = 93 
; #GLFW_KEY_GRAVE_ACCENT = 96 
; #GLFW_KEY_WORLD_1 = 161 
; #GLFW_KEY_WORLD_2 = 162 
; 
; 
; #GLFW_KEY_ESCAPE = 256
; #GLFW_KEY_ENTER = 257
; #GLFW_KEY_TAB = 258
; #GLFW_KEY_BACKSPACE = 259
; #GLFW_KEY_INSERT = 260
; #GLFW_KEY_DELETE = 261
; #GLFW_KEY_RIGHT = 262
; #GLFW_KEY_LEFT = 263
; #GLFW_KEY_DOWN = 264
; #GLFW_KEY_UP = 265
; #GLFW_KEY_PAGE_UP = 266
; #GLFW_KEY_PAGE_DOWN = 267
; #GLFW_KEY_HOME = 268
; #GLFW_KEY_END = 269
; #GLFW_KEY_CAPS_LOCK = 280
; #GLFW_KEY_SCROLL_LOCK = 281
; #GLFW_KEY_NUM_LOCK = 282
; #GLFW_KEY_PRINT_SCREEN = 283
; #GLFW_KEY_PAUSE = 284
; #GLFW_KEY_F1 = 290
; #GLFW_KEY_F2 = 291
; #GLFW_KEY_F3 = 292
; #GLFW_KEY_F4 = 293
; #GLFW_KEY_F5 = 294
; #GLFW_KEY_F6 = 295
; #GLFW_KEY_F7 = 296
; #GLFW_KEY_F8 = 297
; #GLFW_KEY_F9 = 298
; #GLFW_KEY_F10 = 299
; #GLFW_KEY_F11 = 300
; #GLFW_KEY_F12 = 301
; #GLFW_KEY_F13 = 302
; #GLFW_KEY_F14 = 303
; #GLFW_KEY_F15 = 304
; #GLFW_KEY_F16 = 305
; #GLFW_KEY_F17 = 306
; #GLFW_KEY_F18 = 307
; #GLFW_KEY_F19 = 308
; #GLFW_KEY_F20 = 309
; #GLFW_KEY_F21 = 310
; #GLFW_KEY_F22 = 311
; #GLFW_KEY_F23 = 312
; #GLFW_KEY_F24 = 313
; #GLFW_KEY_F25 = 314
; #GLFW_KEY_KP_0 = 320
; #GLFW_KEY_KP_1 = 321
; #GLFW_KEY_KP_2 = 322
; #GLFW_KEY_KP_3 = 323
; #GLFW_KEY_KP_4 = 324
; #GLFW_KEY_KP_5 = 325
; #GLFW_KEY_KP_6 = 326
; #GLFW_KEY_KP_7 = 327
; #GLFW_KEY_KP_8 = 328
; #GLFW_KEY_KP_9 = 329
; #GLFW_KEY_KP_DECIMAL = 330
; #GLFW_KEY_KP_DIVIDE = 331
; #GLFW_KEY_KP_MULTIPLY = 332
; #GLFW_KEY_KP_SUBTRACT = 333
; #GLFW_KEY_KP_ADD = 334
; #GLFW_KEY_KP_ENTER = 335
; #GLFW_KEY_KP_EQUAL = 336
; #GLFW_KEY_LEFT_SHIFT = 340
; #GLFW_KEY_LEFT_CONTROL = 341
; #GLFW_KEY_LEFT_ALT = 342
; #GLFW_KEY_LEFT_SUPER = 343
; #GLFW_KEY_RIGHT_SHIFT = 344
; #GLFW_KEY_RIGHT_CONTROL = 345
; #GLFW_KEY_RIGHT_ALT = 346
; #GLFW_KEY_RIGHT_SUPER = 347
; #GLFW_KEY_MENU = 348
; #GLFW_KEY_LAST = #GLFW_KEY_MENU
; 
; #GLFW_MOD_SHIFT = $0001
; #GLFW_MOD_CONTROL = $0002
; #GLFW_MOD_ALT = $0004
; #GLFW_MOD_SUPER = $0008
; #GLFW_MOD_CAPS_LOCK = $0010
; #GLFW_MOD_NUM_LOCK = $0020
; 
; #GLFW_MOUSE_BUTTON_1 = 0
; #GLFW_MOUSE_BUTTON_2 = 1
; #GLFW_MOUSE_BUTTON_3 = 2
; #GLFW_MOUSE_BUTTON_4 = 3
; #GLFW_MOUSE_BUTTON_5 = 4
; #GLFW_MOUSE_BUTTON_6 = 5
; #GLFW_MOUSE_BUTTON_7 = 6
; #GLFW_MOUSE_BUTTON_8 = 7
; #GLFW_MOUSE_BUTTON_LAST = #GLFW_MOUSE_BUTTON_8
; #GLFW_MOUSE_BUTTON_LEFT = #GLFW_MOUSE_BUTTON_1
; #GLFW_MOUSE_BUTTON_RIGHT = #GLFW_MOUSE_BUTTON_2
; #GLFW_MOUSE_BUTTON_MIDDLE = #GLFW_MOUSE_BUTTON_3
; 
; #GLFW_JOYSTICK_1 = 0
; #GLFW_JOYSTICK_2 = 1
; #GLFW_JOYSTICK_3 = 2
; #GLFW_JOYSTICK_4 = 3
; #GLFW_JOYSTICK_5 = 4
; #GLFW_JOYSTICK_6 = 5
; #GLFW_JOYSTICK_7 = 6
; #GLFW_JOYSTICK_8 = 7
; #GLFW_JOYSTICK_9 = 8
; #GLFW_JOYSTICK_10 = 9
; #GLFW_JOYSTICK_11 = 10
; #GLFW_JOYSTICK_12 = 11
; #GLFW_JOYSTICK_13 = 12
; #GLFW_JOYSTICK_14 = 13
; #GLFW_JOYSTICK_15 = 14
; #GLFW_JOYSTICK_16 = 15
; #GLFW_JOYSTICK_LAST = #GLFW_JOYSTICK_16
; 
; #GLFW_GAMEPAD_BUTTON_A = 0
; #GLFW_GAMEPAD_BUTTON_B = 1
; #GLFW_GAMEPAD_BUTTON_X = 2
; #GLFW_GAMEPAD_BUTTON_Y = 3
; #GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = 4
; #GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5
; #GLFW_GAMEPAD_BUTTON_BACK = 6
; #GLFW_GAMEPAD_BUTTON_START = 7
; #GLFW_GAMEPAD_BUTTON_GUIDE = 8
; #GLFW_GAMEPAD_BUTTON_LEFT_THUMB = 9
; #GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = 10
; #GLFW_GAMEPAD_BUTTON_DPAD_UP = 11
; #GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = 12
; #GLFW_GAMEPAD_BUTTON_DPAD_DOWN = 13
; #GLFW_GAMEPAD_BUTTON_DPAD_LEFT = 14
; #GLFW_GAMEPAD_BUTTON_LAST = #GLFW_GAMEPAD_BUTTON_DPAD_LEFT
; #GLFW_GAMEPAD_BUTTON_CROSS = #GLFW_GAMEPAD_BUTTON_A
; #GLFW_GAMEPAD_BUTTON_CIRCLE = #GLFW_GAMEPAD_BUTTON_B
; #GLFW_GAMEPAD_BUTTON_SQUARE = #GLFW_GAMEPAD_BUTTON_X
; #GLFW_GAMEPAD_BUTTON_TRIANGLE = #GLFW_GAMEPAD_BUTTON_Y
; #GLFW_GAMEPAD_AXIS_LEFT_X = 0
; #GLFW_GAMEPAD_AXIS_LEFT_Y = 1
; #GLFW_GAMEPAD_AXIS_RIGHT_X = 2
; #GLFW_GAMEPAD_AXIS_RIGHT_Y = 3
; #GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = 4
; #GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5
; #GLFW_GAMEPAD_AXIS_LAST = #GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
; 
; #GLFW_NO_ERROR = 0
; #GLFW_NOT_INITIALIZED = $00010001
; #GLFW_NO_CURRENT_CONTEXT = $00010002
; #GLFW_INVALID_ENUM = $00010003
; #GLFW_INVALID_VALUE = $00010004
; #GLFW_OUT_OF_MEMORY = $00010005
; #GLFW_API_UNAVAILABLE = $00010006
; #GLFW_VERSION_UNAVAILABLE = $00010007
; #GLFW_PLATFORM_ERROR = $00010008
; #GLFW_FORMAT_UNAVAILABLE = $00010009
; #GLFW_NO_WINDOW_CONTEXT = $0001000A
; 
; #GLFW_FOCUSED = $00020001
; #GLFW_ICONIFIED = $00020002
; #GLFW_RESIZABLE = $00020003
; #GLFW_VISIBLE = $00020004
; #GLFW_DECORATED = $00020005
; #GLFW_AUTO_ICONIFY = $00020006
; #GLFW_FLOATING = $00020007
; #GLFW_MAXIMIZED = $00020008
; #GLFW_CENTER_CURSOR = $00020009
; 
; #GLFW_TRANSPARENT_FRAMEBUFFER = $0002000A
; #GLFW_HOVERED = $0002000B
; #GLFW_FOCUS_ON_SHOW = $0002000C
; #GLFW_RED_BITS = $00021001
; #GLFW_GREEN_BITS = $00021002
; #GLFW_BLUE_BITS = $00021003
; #GLFW_ALPHA_BITS = $00021004
; #GLFW_DEPTH_BITS = $00021005
; #GLFW_STENCIL_BITS = $00021006
; #GLFW_ACCUM_RED_BITS = $00021007
; #GLFW_ACCUM_GREEN_BITS = $00021008
; #GLFW_ACCUM_BLUE_BITS = $00021009
; #GLFW_ACCUM_ALPHA_BITS = $0002100A
; #GLFW_AUX_BUFFERS = $0002100B
; #GLFW_STEREO = $0002100C
; #GLFW_SAMPLES = $0002100D
; #GLFW_SRGB_CAPABLE = $0002100E
; #GLFW_REFRESH_RATE = $0002100F
; #GLFW_DOUBLEBUFFER = $00021010
; 
; #GLFW_CLIENT_API = $00022001
; #GLFW_CONTEXT_VERSION_MAJOR = $00022002
; #GLFW_CONTEXT_VERSION_MINOR = $00022003
; #GLFW_CONTEXT_REVISION = $00022004
; #GLFW_CONTEXT_ROBUSTNESS = $00022005
; #GLFW_OPENGL_FORWARD_COMPAT = $00022006
; #GLFW_OPENGL_DEBUG_CONTEXT = $00022007
; #GLFW_OPENGL_PROFILE = $00022008
; #GLFW_CONTEXT_RELEASE_BEHAVIOR = $00022009
; #GLFW_CONTEXT_NO_ERROR = $0002200A
; #GLFW_CONTEXT_CREATION_API = $0002200B
; #GLFW_SCALE_TO_MONITOR = $0002200C
; #GLFW_COCOA_RETINA_FRAMEBUFFER = $00023001
; #GLFW_COCOA_FRAME_NAME = $00023002
; #GLFW_COCOA_GRAPHICS_SWITCHING = $00023003
; #GLFW_X11_CLASS_NAME = $00024001
; #GLFW_X11_INSTANCE_NAME = $00024002
; 
; #GLFW_NO_API = 0
; #GLFW_OPENGL_API = $00030001
; #GLFW_OPENGL_ES_API = $00030002
; 
; #GLFW_NO_ROBUSTNESS = 0
; #GLFW_NO_RESET_NOTIFICATION = $00031001
; #GLFW_LOSE_CONTEXT_ON_RESET = $00031002
; 
; #GLFW_OPENGL_ANY_PROFILE = 0
; #GLFW_OPENGL_CORE_PROFILE = $00032001
; #GLFW_OPENGL_COMPAT_PROFILE = $00032002
; 
; #GLFW_CURSOR = $00033001
; #GLFW_STICKY_KEYS = $00033002
; #GLFW_STICKY_MOUSE_BUTTONS = $00033003
; 
; #GLFW_LOCK_KEY_MODS = $00033004
; #GLFW_RAW_MOUSE_MOTION = $00033005
; 
; #GLFW_CURSOR_NORMAL = $00034001
; #GLFW_CURSOR_HIDDEN = $00034002
; #GLFW_CURSOR_DISABLED = $00034003
; 
; #GLFW_ANY_RELEASE_BEHAVIOR = 0
; #GLFW_RELEASE_BEHAVIOR_FLUSH = $00035001
; #GLFW_RELEASE_BEHAVIOR_NONE = $00035002
; 
; #GLFW_NATIVE_CONTEXT_API = $00036001
; #GLFW_EGL_CONTEXT_API = $00036002
; #GLFW_OSMESA_CONTEXT_API = $00036003
; 
; #GLFW_ARROW_CURSOR = $00036001
; #GLFW_IBEAM_CURSOR = $00036002
; #GLFW_CROSSHAIR_CURSOR = $00036003
; #GLFW_HAND_CURSOR = $00036004
; #GLFW_HRESIZE_CURSOR = $00036005
; #GLFW_VRESIZE_CURSOR = $00036006
; #GLFW_CONNECTED = $00040001
; #GLFW_DISCONNECTED = $00040002
; #GLFW_JOYSTICK_HAT_BUTTONS = $00050001
; #GLFW_COCOA_CHDIR_RESOURCES = $00051001
; #GLFW_COCOA_MENUBAR = $00051002
; 
; #GLFW_DONT_CARE = -1
; 
; CompilerIf glfw_config::#LINK_DYNAMIC = 0
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
; ImportC "./lib/glfw3.x64.lib"
; CompilerEndIf
; CompilerEndIf
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
; 
; glfwInit.i()
; glfwTerminate()
; glfwInitHint(hint, value)
; glfwGetVersion(*major, *minor, *rev)
; glfwGetVersionString.i()
; glfwGetError.i(*description) 
; glfwSetErrorCallback.i(*cbfun)
; glfwGetMonitors.i(*count)
; glfwGetPrimaryMonitor.i() 
; glfwGetMonitorPos(*monitor, *xpos, *ypos)
; glfwGetMonitorWorkarea(*monitor, *xpos, *ypos, *width, *height)
; glfwGetMonitorPhysicalSize(*monitor, *widthMM, *heightMM)
; glfwGetMonitorContentScale(*monitor, *xscale, *yscale)
; glfwGetMonitorName.i(*monitor)
; glfwSetMonitorUserPointer(*monitor, *pointer)
; glfwGetMonitorUserPointer.i(*monitor) 
; glfwSetMonitorCallback.i(*cbfun)
; glfwGetVideoModes.i(*monitor, *count)
; glfwGetVideoMode.i(*monitor)
; glfwSetGamma(*monitor, gamma.f)
; glfwGetGammaRamp.i(*monitor)
; glfwSetGammaRamp(*monitor, *ramp)
; glfwDefaultWindowHints()
; glfwWindowHint(hint, value) 
; glfwWindowHintString(hint, value.p-utf8)
; glfwCreateWindow.i(width, height, title.p-utf8, *monitor, *share)
; glfwDestroyWindow(*window)
; glfwWindowShouldClose.i(*window)
; glfwSetWindowShouldClose(*window, value)
; glfwSetWindowTitle(*window, title.p-utf8)
; glfwSetWindowIcon(*window, count, *images)
; glfwGetWindowPos(*window, *xpos, *ypos)
; glfwSetWindowPos(*window, xpos, ypos)
; glfwGetWindowSize(*window, *width, *height)
; glfwSetWindowSizeLimits(*window, minwidth, minheight, maxwidth, maxheight)
; glfwSetWindowAspectRatio(*window, numer, denom)
; glfwSetWindowSize(*window, width, height)
; glfwGetFramebufferSize(*window, *width, *height)
; glfwGetWindowFrameSize(*window, *left, *top, *right, *bottom)
; glfwGetWindowContentScale(*window, *xscale, *yscale)
; glfwGetWindowOpacity.f(*window)
; glfwSetWindowOpacity(*window, opacity.f)
; glfwIconifyWindow(*window)
; glfwRestoreWindow(*window)
; glfwMaximizeWindow(*window)
; glfwShowWindow(*window)
; glfwHideWindow(*window)
; glfwFocusWindow(*window)
; glfwRequestWindowAttention(*window)
; glfwGetWindowMonitor.i(*window)
; glfwSetWindowMonitor(*window, *monitor, xpos, ypos, width, height, refreshRate)
; glfwGetWindowAttrib.i(*window, attrib)
; glfwSetWindowAttrib(*window, attrib, value) 
; glfwSetWindowUserPointer(*window, *pointer)
; glfwGetWindowUserPointer.i(*window)
; glfwSetWindowPosCallback.i(*window, *cbfun)
; glfwSetWindowSizeCallback.i(*window, *cbfun)
; glfwSetWindowCloseCallback.i(*window, *cbfun)
; glfwSetWindowRefreshCallback.i(*window, *cbfun)
; glfwSetWindowFocusCallback.i(*window, *cbfun)
; glfwSetWindowIconifyCallback.i(*window, *cbfun)
; glfwSetWindowMaximizeCallback.i(*window, *cbfun)
; glfwSetFramebufferSizeCallback.i(*window, *cbfun)
; glfwSetWindowContentScaleCallback.i(*window, *cbfun)
; glfwPollEvents()
; glfwWaitEvents()
; glfwWaitEventsTimeout(timeout.d)
; glfwPostEmptyEvent()
; glfwGetInputMode.i(*window, mode)
; glfwSetInputMode(*window, mode, value)
; glfwRawMouseMotionSupported.i()
; glfwGetKeyName.i(key, scancode)
; glfwGetKeyScancode.i(key)
; glfwGetKey.i(*window, key)
; glfwGetMouseButton.i(*window, button)
; glfwGetCursorPos(*window, *xpos, *ypos)
; glfwSetCursorPos(*window, xpos.d, ypos.d)
; glfwCreateCursor.i(*image, xhot, yhot)
; glfwCreateStandardCursor.i(shape)
; glfwDestroyCursor(*cursor)
; glfwSetCursor(*window, *cursor)
; glfwSetKeyCallback.i(*window, *cbfun)
; glfwSetCharCallback.i(*window, *cbfun)
; glfwSetCharModsCallback.i(*window, *cbfun)
; glfwSetMouseButtonCallback.i(*window, *cbfun)
; glfwSetCursorPosCallback.i(*window, *cbfun)
; glfwSetCursorEnterCallback.i(*window, *cbfun)
; glfwSetScrollCallback.i(*window, *cbfun)
; glfwSetDropCallback.i(*window, *cbfun)
; glfwJoystickPresent.i(joy)
; glfwGetJoystickAxes.i(joy, *count)
; glfwGetJoystickButtons.i(joy, *count)
; glfwGetJoystickHats.i(jid, *count)
; glfwGetJoystickName.i(joy)
; glfwGetJoystickGUID.i(jid)
; glfwSetJoystickUserPointer(jid, *pointer)
; glfwGetJoystickUserPointer.i(jid)
; glfwJoystickIsGamepad.i(jid)
; glfwSetJoystickCallback.i(*cbfun)
; glfwUpdateGamepadMappings.i(string.p-utf8)
; glfwGetGamepadName.i(jid)
; glfwGetGamepadState.i(jid, *state)
; glfwSetClipboardString(*window, string.p-utf8)
; glfwGetClipboardString.i(*window)
; glfwGetTime.d()
; glfwSetTime(time.d)
; glfwGetTimerValue.q()
; glfwGetTimerFrequency.q()
; glfwMakeContextCurrent(*window)
; glfwGetCurrentContext.i()
; glfwSwapBuffers(*window)
; glfwSwapInterval(interval)
; glfwExtensionSupported.i(extension.p-utf8)
; glfwGetProcAddress.i(procname.p-utf8)
; glfwVulkanSupported.i()
; glfwGetRequiredInstanceExtensions.i(*count)
; glfwGetInstanceProcAddress.i(*instance, procname.p-utf8)
; glfwGetPhysicalDevicePresentationSupport.i(*instance, device, queuefamily)
; glfwCreateWindowSurface.i(*instance, *window, *allocator, *surface)
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; glfwGetWin32Adapter.i(*monitor)
; glfwGetWin32Monitor.i(*monitor)
; glfwGetWin32Window.i(*window) 
; glfwGetWGLContext.i(*window)
; CompilerEndIf
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Linux) 
; 
; EndImport
; 
; CompilerElse
; 
; EndDeclareModule
; 
; Module glfw
; 
; EndModule
; 
; XIncludeFile "glfw/glfwLoad.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule glfwLoad
; 
; EnableExplicit
; 
; Declare.i    Load()
; Declare      Shutdown()
; 
; 
; 
; #LOAD_OK = 0
; #LOAD_DLL_NOT_FOUND = 1
; #LOAD_MISSING_IMPORTED_FUNCS = 2
; 
; EndDeclareModule
; 
; Module glfwLoad
; 
; UseModule glfw
; 
; CompilerIf glfw_config::#LINK_DYNAMIC = 1
; 
; 
; 
; CompilerIf glfw_config::#LINK_DYNAMIC = 0
; 
; 
; 
; CompilerEndIf 
; EndModule
; 
; 
; 
; XIncludeFile "gl/gl.pbi"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule gl
; 
; 
; 
; 
; 
; 
; 
; #GLU_INVALID_ENUM = 100900
; #GLU_INVALID_VALUE = 100901
; #GLU_OUT_OF_MEMORY = 100902
; #GLU_INCOMPATIBLE_GL_VERSION= 100903
; #GLU_VERSION = 100800
; #GLU_EXTENSIONS = 100801
; #GLU_TRUE = 1
; #GLU_FALSE = 0
; #GLU_SMOOTH = 100000
; #GLU_FLAT = 100001
; #GLU_NONE = 100002
; #GLU_POINT = 100010
; #GLU_LINE = 100011
; #GLU_FILL = 100012
; #GLU_SILHOUETTE = 100013
; #GLU_OUTSIDE = 100020
; #GLU_INSIDE = 100021
; #GLU_TESS_MAX_COORD = 1.0e150
; #GLU_TESS_WINDING_RULE = 100140
; #GLU_TESS_BOUNDARY_ONLY = 100141
; #GLU_TESS_TOLERANCE = 100142
; #GLU_TESS_WINDING_ODD = 100130
; #GLU_TESS_WINDING_NONZERO = 100131
; #GLU_TESS_WINDING_POSITIVE= 100132
; #GLU_TESS_WINDING_NEGATIVE= 100133
; #GLU_TESS_WINDING_ABS_GEQ_TWO= 100134
; #GLU_TESS_BEGIN = 100100
; #GLU_TESS_VERTEX = 100101
; #GLU_TESS_END = 100102
; #GLU_TESS_ERROR = 100103
; #GLU_TESS_EDGE_FLAG = 100104
; #GLU_TESS_COMBINE = 100105
; #GLU_TESS_BEGIN_DATA = 100106
; #GLU_TESS_VERTEX_DATA = 100107
; #GLU_TESS_END_DATA = 100108
; #GLU_TESS_ERROR_DATA = 100109
; #GLU_TESS_EDGE_FLAG_DATA = 100110
; #GLU_TESS_COMBINE_DATA = 100111
; #GLU_TESS_ERROR1 = 100151
; #GLU_TESS_ERROR2 = 100152
; #GLU_TESS_ERROR3 = 100153
; #GLU_TESS_ERROR4 = 100154
; #GLU_TESS_ERROR5 = 100155
; #GLU_TESS_ERROR6 = 100156
; #GLU_TESS_ERROR7 = 100157
; #GLU_TESS_ERROR8 = 100158
; #GLU_TESS_MISSING_BEGIN_POLYGON= #GLU_TESS_ERROR1
; #GLU_TESS_MISSING_BEGIN_CONTOUR= #GLU_TESS_ERROR2
; #GLU_TESS_MISSING_END_POLYGON= #GLU_TESS_ERROR3
; #GLU_TESS_MISSING_END_CONTOUR= #GLU_TESS_ERROR4
; #GLU_TESS_COORD_TOO_LARGE = #GLU_TESS_ERROR5
; #GLU_TESS_NEED_COMBINE_CALLBACK= #GLU_TESS_ERROR6
; #GLU_AUTO_LOAD_MATRIX = 100200
; #GLU_CULLING = 100201
; #GLU_SAMPLING_TOLERANCE = 100203
; #GLU_DISPLAY_MODE = 100204
; #GLU_PARAMETRIC_TOLERANCE = 100202
; #GLU_SAMPLING_METHOD = 100205
; #GLU_U_STEP = 100206
; #GLU_V_STEP = 100207
; #GLU_PATH_LENGTH = 100215
; #GLU_PARAMETRIC_ERROR = 100216
; #GLU_DOMAIN_DISTANCE = 100217
; #GLU_MAP1_TRIM_2 = 100210
; #GLU_MAP1_TRIM_3 = 100211
; #GLU_OUTLINE_POLYGON = 100240
; #GLU_OUTLINE_PATCH = 100241
; #GLU_NURBS_ERROR1 = 100251
; #GLU_NURBS_ERROR2 = 100252
; #GLU_NURBS_ERROR3 = 100253
; #GLU_NURBS_ERROR4 = 100254
; #GLU_NURBS_ERROR5 = 100255
; #GLU_NURBS_ERROR6 = 100256
; #GLU_NURBS_ERROR7 = 100257
; #GLU_NURBS_ERROR8 = 100258
; #GLU_NURBS_ERROR9 = 100259
; #GLU_NURBS_ERROR10 = 100260
; #GLU_NURBS_ERROR11 = 100261
; #GLU_NURBS_ERROR12 = 100262
; #GLU_NURBS_ERROR13 = 100263
; #GLU_NURBS_ERROR14 = 100264
; #GLU_NURBS_ERROR15 = 100265
; #GLU_NURBS_ERROR16 = 100266
; #GLU_NURBS_ERROR17 = 100267
; #GLU_NURBS_ERROR18 = 100268
; #GLU_NURBS_ERROR19 = 100269
; #GLU_NURBS_ERROR20 = 100270
; #GLU_NURBS_ERROR21 = 100271
; #GLU_NURBS_ERROR22 = 100272
; #GLU_NURBS_ERROR23 = 100273
; #GLU_NURBS_ERROR24 = 100274
; #GLU_NURBS_ERROR25 = 100275
; #GLU_NURBS_ERROR26 = 100276
; #GLU_NURBS_ERROR27 = 100277
; #GLU_NURBS_ERROR28 = 100278
; #GLU_NURBS_ERROR29 = 100279
; #GLU_NURBS_ERROR30 = 100280
; #GLU_NURBS_ERROR31 = 100281
; #GLU_NURBS_ERROR32 = 100282
; #GLU_NURBS_ERROR33 = 100283
; #GLU_NURBS_ERROR34 = 100284
; #GLU_NURBS_ERROR35 = 100285
; #GLU_NURBS_ERROR36 = 100286
; #GLU_NURBS_ERROR37 = 100287
; #GLU_CW = 100120
; #GLU_CCW = 100121
; #GLU_INTERIOR = 100122
; #GLU_EXTERIOR = 100123
; #GLU_UNKNOWN = 100124
; #GLU_BEGIN = #GLU_TESS_BEGIN
; #GLU_VERTEX = #GLU_TESS_VERTEX
; #GLU_END = #GLU_TESS_END
; #GLU_ERROR = #GLU_TESS_ERROR
; #GLU_EDGE_FLAG = #GLU_TESS_EDGE_FLAG
; 
; 
; #GL_ACCUM = $0100
; #GL_LOAD = $0101
; #GL_RETURN = $0102
; #GL_MULT = $0103
; #GL_ADD = $0104
; 
; #GL_NEVER = $0200
; #GL_LESS = $0201
; #GL_EQUAL = $0202
; #GL_LEQUAL = $0203
; #GL_GREATER = $0204
; #GL_NOTEQUAL = $0205
; #GL_GEQUAL = $0206
; #GL_ALWAYS = $0207
; 
; #GL_CURRENT_BIT = $01
; #GL_POINT_BIT = $02
; #GL_LINE_BIT = $04
; #GL_POLYGON_BIT = $08
; #GL_POLYGON_STIPPLE_BIT = $10
; #GL_PIXEL_MODE_BIT = $20
; #GL_LIGHTING_BIT = $40
; #GL_FOG_BIT = $80
; #GL_DEPTH_BUFFER_BIT = $0100
; #GL_ACCUM_BUFFER_BIT = $0200
; #GL_STENCIL_BUFFER_BIT = $0400
; #GL_VIEWPORT_BIT = $0800
; #GL_TRANSFORM_BIT = $1000
; #GL_ENABLE_BIT = $2000
; #GL_COLOR_BUFFER_BIT = $4000
; #GL_HINT_BIT = $8000
; #GL_EVAL_BIT = $010000
; #GL_LIST_BIT = $020000
; #GL_TEXTURE_BIT = $040000
; #GL_SCISSOR_BIT = $080000
; #GL_ALL_ATTRIB_BITS = $0FFFFF
; 
; #GL_POINTS = $00
; #GL_LINES = $01
; #GL_LINE_LOOP = $02
; #GL_LINE_STRIP = $03
; #GL_TRIANGLES = $04
; #GL_TRIANGLE_STRIP = $05
; #GL_TRIANGLE_FAN = $06
; #GL_QUADS = $07
; #GL_QUAD_STRIP = $08
; #GL_POLYGON = $09
; 
; #GL_ZERO = 0
; #GL_ONE = 1
; #GL_SRC_COLOR = $0300
; #GL_ONE_MINUS_SRC_COLOR = $0301
; #GL_SRC_ALPHA = $0302
; #GL_ONE_MINUS_SRC_ALPHA = $0303
; #GL_DST_ALPHA = $0304
; #GL_ONE_MINUS_DST_ALPHA = $0305
; 
; #GL_DST_COLOR = $0306
; #GL_ONE_MINUS_DST_COLOR = $0307
; #GL_SRC_ALPHA_SATURATE = $0308
; 
; #GL_TRUE = 1
; #GL_FALSE = 0
; 
; #GL_CLIP_PLANE0 = $3000
; #GL_CLIP_PLANE1 = $3001
; #GL_CLIP_PLANE2 = $3002
; #GL_CLIP_PLANE3 = $3003
; #GL_CLIP_PLANE4 = $3004
; #GL_CLIP_PLANE5 = $3005
; 
; #GL_BYTE = $1400
; #GL_UNSIGNED_BYTE = $1401
; #GL_SHORT = $1402
; #GL_UNSIGNED_SHORT = $1403
; #GL_INT = $1404
; #GL_UNSIGNED_INT = $1405
; #GL_FLOAT = $1406
; #GL_2_BYTES = $1407
; #GL_3_BYTES = $1408
; #GL_4_BYTES = $1409
; #GL_DOUBLE = $140A
; 
; #GL_NONE = 0
; #GL_FRONT_LEFT = $0400
; #GL_FRONT_RIGHT = $0401
; #GL_BACK_LEFT = $0402
; #GL_BACK_RIGHT = $0403
; #GL_FRONT = $0404
; #GL_BACK = $0405
; #GL_LEFT = $0406
; #GL_RIGHT = $0407
; #GL_FRONT_AND_BACK = $0408
; #GL_AUX0 = $0409
; #GL_AUX1 = $040A
; #GL_AUX2 = $040B
; #GL_AUX3 = $040C
; 
; #GL_NO_ERROR = 0
; #GL_INVALID_ENUM = $0500
; #GL_INVALID_VALUE = $0501
; #GL_INVALID_OPERATION = $0502
; #GL_STACK_OVERFLOW = $0503
; #GL_STACK_UNDERFLOW = $0504
; #GL_OUT_OF_MEMORY = $0505
; 
; #GL_2D = $0600
; #GL_3D = $0601
; #GL_3D_COLOR = $0602
; #GL_3D_COLOR_TEXTURE = $0603
; #GL_4D_COLOR_TEXTURE = $0604
; 
; #GL_PASS_THROUGH_TOKEN = $0700
; #GL_POINT_TOKEN = $0701
; #GL_LINE_TOKEN = $0702
; #GL_POLYGON_TOKEN = $0703
; #GL_BITMAP_TOKEN = $0704
; #GL_DRAW_PIXEL_TOKEN = $0705
; #GL_COPY_PIXEL_TOKEN = $0706
; #GL_LINE_RESET_TOKEN = $0707
; 
; #GL_EXP = $0800
; #GL_EXP2 = $0801
; 
; #GL_CW = $0900
; #GL_CCW = $0901
; 
; #GL_COEFF = $0A00
; #GL_ORDER = $0A01
; #GL_DOMAIN = $0A02
; 
; #GL_CURRENT_COLOR = $0B00
; #GL_CURRENT_INDEX = $0B01
; #GL_CURRENT_NORMAL = $0B02
; #GL_CURRENT_TEXTURE_COORDS = $0B03
; #GL_CURRENT_RASTER_COLOR = $0B04
; #GL_CURRENT_RASTER_INDEX = $0B05
; #GL_CURRENT_RASTER_TEXTURE_COORDS = $0B06
; #GL_CURRENT_RASTER_POSITION = $0B07
; #GL_CURRENT_RASTER_POSITION_VALID = $0B08
; #GL_CURRENT_RASTER_DISTANCE = $0B09
; #GL_POINT_SMOOTH = $0B10
; #GL_POINT_SIZE = $0B11
; #GL_POINT_SIZE_RANGE = $0B12
; #GL_POINT_SIZE_GRANULARITY = $0B13
; #GL_LINE_SMOOTH = $0B20
; #GL_LINE_WIDTH = $0B21
; #GL_LINE_WIDTH_RANGE = $0B22
; #GL_LINE_WIDTH_GRANULARITY = $0B23
; #GL_LINE_STIPPLE = $0B24
; #GL_LINE_STIPPLE_PATTERN = $0B25
; #GL_LINE_STIPPLE_REPEAT = $0B26
; #GL_LIST_MODE = $0B30
; #GL_MAX_LIST_NESTING = $0B31
; #GL_LIST_BASE = $0B32
; #GL_LIST_INDEX = $0B33
; #GL_POLYGON_MODE = $0B40
; #GL_POLYGON_SMOOTH = $0B41
; #GL_POLYGON_STIPPLE = $0B42
; #GL_EDGE_FLAG = $0B43
; #GL_CULL_FACE = $0B44
; #GL_CULL_FACE_MODE = $0B45
; #GL_FRONT_FACE = $0B46
; #GL_LIGHTING = $0B50
; #GL_LIGHT_MODEL_LOCAL_VIEWER = $0B51
; #GL_LIGHT_MODEL_TWO_SIDE = $0B52
; #GL_LIGHT_MODEL_AMBIENT = $0B53
; #GL_SHADE_MODEL = $0B54
; #GL_COLOR_MATERIAL_FACE = $0B55
; #GL_COLOR_MATERIAL_PARAMETER = $0B56
; #GL_COLOR_MATERIAL = $0B57
; #GL_FOG = $0B60
; #GL_FOG_INDEX = $0B61
; #GL_FOG_DENSITY = $0B62
; #GL_FOG_START = $0B63
; #GL_FOG_END = $0B64
; #GL_FOG_MODE = $0B65
; #GL_FOG_COLOR = $0B66
; #GL_DEPTH_RANGE = $0B70
; #GL_DEPTH_TEST = $0B71
; #GL_DEPTH_WRITEMASK = $0B72
; #GL_DEPTH_CLEAR_VALUE = $0B73
; #GL_DEPTH_FUNC = $0B74
; #GL_ACCUM_CLEAR_VALUE = $0B80
; #GL_STENCIL_TEST = $0B90
; #GL_STENCIL_CLEAR_VALUE = $0B91
; #GL_STENCIL_FUNC = $0B92
; #GL_STENCIL_VALUE_MASK = $0B93
; #GL_STENCIL_FAIL = $0B94
; #GL_STENCIL_PASS_DEPTH_FAIL = $0B95
; #GL_STENCIL_PASS_DEPTH_PASS = $0B96
; #GL_STENCIL_REF = $0B97
; #GL_STENCIL_WRITEMASK = $0B98
; #GL_MATRIX_MODE = $0BA0
; #GL_NORMALIZE = $0BA1
; #GL_VIEWPORT = $0BA2
; #GL_MODELVIEW_STACK_DEPTH = $0BA3
; #GL_PROJECTION_STACK_DEPTH = $0BA4
; #GL_TEXTURE_STACK_DEPTH = $0BA5
; #GL_MODELVIEW_MATRIX = $0BA6
; #GL_PROJECTION_MATRIX = $0BA7
; #GL_TEXTURE_MATRIX = $0BA8
; #GL_ATTRIB_STACK_DEPTH = $0BB0
; #GL_CLIENT_ATTRIB_STACK_DEPTH = $0BB1
; #GL_ALPHA_TEST = $0BC0
; #GL_ALPHA_TEST_FUNC = $0BC1
; #GL_ALPHA_TEST_REF = $0BC2
; #GL_DITHER = $0BD0
; #GL_BLEND_DST = $0BE0
; #GL_BLEND_SRC = $0BE1
; #GL_BLEND = $0BE2
; #GL_LOGIC_OP_MODE = $0BF0
; #GL_INDEX_LOGIC_OP = $0BF1
; #GL_COLOR_LOGIC_OP = $0BF2
; #GL_AUX_BUFFERS = $0C00
; #GL_DRAW_BUFFER = $0C01
; #GL_READ_BUFFER = $0C02
; #GL_SCISSOR_BOX = $0C10
; #GL_SCISSOR_TEST = $0C11
; #GL_INDEX_CLEAR_VALUE = $0C20
; #GL_INDEX_WRITEMASK = $0C21
; #GL_COLOR_CLEAR_VALUE = $0C22
; #GL_COLOR_WRITEMASK = $0C23
; #GL_INDEX_MODE = $0C30
; #GL_RGBA_MODE = $0C31
; #GL_DOUBLEBUFFER = $0C32
; #GL_STEREO = $0C33
; #GL_RENDER_MODE = $0C40
; #GL_PERSPECTIVE_CORRECTION_HINT = $0C50
; #GL_POINT_SMOOTH_HINT = $0C51
; #GL_LINE_SMOOTH_HINT = $0C52
; #GL_POLYGON_SMOOTH_HINT = $0C53
; #GL_FOG_HINT = $0C54
; #GL_TEXTURE_GEN_S = $0C60
; #GL_TEXTURE_GEN_T = $0C61
; #GL_TEXTURE_GEN_R = $0C62
; #GL_TEXTURE_GEN_Q = $0C63
; #GL_PIXEL_MAP_I_TO_I = $0C70
; #GL_PIXEL_MAP_S_TO_S = $0C71
; #GL_PIXEL_MAP_I_TO_R = $0C72
; #GL_PIXEL_MAP_I_TO_G = $0C73
; #GL_PIXEL_MAP_I_TO_B = $0C74
; #GL_PIXEL_MAP_I_TO_A = $0C75
; #GL_PIXEL_MAP_R_TO_R = $0C76
; #GL_PIXEL_MAP_G_TO_G = $0C77
; #GL_PIXEL_MAP_B_TO_B = $0C78
; #GL_PIXEL_MAP_A_TO_A = $0C79
; #GL_PIXEL_MAP_I_TO_I_SIZE = $0CB0
; #GL_PIXEL_MAP_S_TO_S_SIZE = $0CB1
; #GL_PIXEL_MAP_I_TO_R_SIZE = $0CB2
; #GL_PIXEL_MAP_I_TO_G_SIZE = $0CB3
; #GL_PIXEL_MAP_I_TO_B_SIZE = $0CB4
; #GL_PIXEL_MAP_I_TO_A_SIZE = $0CB5
; #GL_PIXEL_MAP_R_TO_R_SIZE = $0CB6
; #GL_PIXEL_MAP_G_TO_G_SIZE = $0CB7
; #GL_PIXEL_MAP_B_TO_B_SIZE = $0CB8
; #GL_PIXEL_MAP_A_TO_A_SIZE = $0CB9
; #GL_UNPACK_SWAP_BYTES = $0CF0
; #GL_UNPACK_LSB_FIRST = $0CF1
; #GL_UNPACK_ROW_LENGTH = $0CF2
; #GL_UNPACK_SKIP_ROWS = $0CF3
; #GL_UNPACK_SKIP_PIXELS = $0CF4
; #GL_UNPACK_ALIGNMENT = $0CF5
; #GL_PACK_SWAP_BYTES = $0D00
; #GL_PACK_LSB_FIRST = $0D01
; #GL_PACK_ROW_LENGTH = $0D02
; #GL_PACK_SKIP_ROWS = $0D03
; #GL_PACK_SKIP_PIXELS = $0D04
; #GL_PACK_ALIGNMENT = $0D05
; #GL_MAP_COLOR = $0D10
; #GL_MAP_STENCIL = $0D11
; #GL_INDEX_SHIFT = $0D12
; #GL_INDEX_OFFSET = $0D13
; #GL_RED_SCALE = $0D14
; #GL_RED_BIAS = $0D15
; #GL_ZOOM_X = $0D16
; #GL_ZOOM_Y = $0D17
; #GL_GREEN_SCALE = $0D18
; #GL_GREEN_BIAS = $0D19
; #GL_BLUE_SCALE = $0D1A
; #GL_BLUE_BIAS = $0D1B
; #GL_ALPHA_SCALE = $0D1C
; #GL_ALPHA_BIAS = $0D1D
; #GL_DEPTH_SCALE = $0D1E
; #GL_DEPTH_BIAS = $0D1F
; #GL_MAX_EVAL_ORDER = $0D30
; #GL_MAX_LIGHTS = $0D31
; #GL_MAX_CLIP_PLANES = $0D32
; #GL_MAX_TEXTURE_SIZE = $0D33
; #GL_MAX_PIXEL_MAP_TABLE = $0D34
; #GL_MAX_ATTRIB_STACK_DEPTH = $0D35
; #GL_MAX_MODELVIEW_STACK_DEPTH = $0D36
; #GL_MAX_NAME_STACK_DEPTH = $0D37
; #GL_MAX_PROJECTION_STACK_DEPTH = $0D38
; #GL_MAX_TEXTURE_STACK_DEPTH = $0D39
; #GL_MAX_VIEWPORT_DIMS = $0D3A
; #GL_MAX_CLIENT_ATTRIB_STACK_DEPTH = $0D3B
; #GL_SUBPIXEL_BITS = $0D50
; #GL_INDEX_BITS = $0D51
; #GL_RED_BITS = $0D52
; #GL_GREEN_BITS = $0D53
; #GL_BLUE_BITS = $0D54
; #GL_ALPHA_BITS = $0D55
; #GL_DEPTH_BITS = $0D56
; #GL_STENCIL_BITS = $0D57
; #GL_ACCUM_RED_BITS = $0D58
; #GL_ACCUM_GREEN_BITS = $0D59
; #GL_ACCUM_BLUE_BITS = $0D5A
; #GL_ACCUM_ALPHA_BITS = $0D5B
; #GL_NAME_STACK_DEPTH = $0D70
; #GL_AUTO_NORMAL = $0D80
; #GL_MAP1_COLOR_4 = $0D90
; #GL_MAP1_INDEX = $0D91
; #GL_MAP1_NORMAL = $0D92
; #GL_MAP1_TEXTURE_COORD_1 = $0D93
; #GL_MAP1_TEXTURE_COORD_2 = $0D94
; #GL_MAP1_TEXTURE_COORD_3 = $0D95
; #GL_MAP1_TEXTURE_COORD_4 = $0D96
; #GL_MAP1_VERTEX_3 = $0D97
; #GL_MAP1_VERTEX_4 = $0D98
; #GL_MAP2_COLOR_4 = $0DB0
; #GL_MAP2_INDEX = $0DB1
; #GL_MAP2_NORMAL = $0DB2
; #GL_MAP2_TEXTURE_COORD_1 = $0DB3
; #GL_MAP2_TEXTURE_COORD_2 = $0DB4
; #GL_MAP2_TEXTURE_COORD_3 = $0DB5
; #GL_MAP2_TEXTURE_COORD_4 = $0DB6
; #GL_MAP2_VERTEX_3 = $0DB7
; #GL_MAP2_VERTEX_4 = $0DB8
; #GL_MAP1_GRID_DOMAIN = $0DD0
; #GL_MAP1_GRID_SEGMENTS = $0DD1
; #GL_MAP2_GRID_DOMAIN = $0DD2
; #GL_MAP2_GRID_SEGMENTS = $0DD3
; #GL_TEXTURE_1D = $0DE0
; #GL_TEXTURE_2D = $0DE1
; #GL_FEEDBACK_BUFFER_POINTER = $0DF0
; #GL_FEEDBACK_BUFFER_SIZE = $0DF1
; #GL_FEEDBACK_BUFFER_TYPE = $0DF2
; #GL_SELECTION_BUFFER_POINTER = $0DF3
; #GL_SELECTION_BUFFER_SIZE = $0DF4
; 
; #GL_TEXTURE_WIDTH = $1000
; #GL_TEXTURE_HEIGHT = $1001
; #GL_TEXTURE_INTERNAL_FORMAT = $1003
; #GL_TEXTURE_BORDER_COLOR = $1004
; #GL_TEXTURE_BORDER = $1005
; 
; #GL_DONT_CARE = $1100
; #GL_FASTEST = $1101
; #GL_NICEST = $1102
; 
; #GL_LIGHT0 = $4000
; #GL_LIGHT1 = $4001
; #GL_LIGHT2 = $4002
; #GL_LIGHT3 = $4003
; #GL_LIGHT4 = $4004
; #GL_LIGHT5 = $4005
; #GL_LIGHT6 = $4006
; #GL_LIGHT7 = $4007
; 
; #GL_AMBIENT = $1200
; #GL_DIFFUSE = $1201
; #GL_SPECULAR = $1202
; #GL_POSITION = $1203
; #GL_SPOT_DIRECTION = $1204
; #GL_SPOT_EXPONENT = $1205
; #GL_SPOT_CUTOFF = $1206
; #GL_CONSTANT_ATTENUATION = $1207
; #GL_LINEAR_ATTENUATION = $1208
; #GL_QUADRATIC_ATTENUATION = $1209
; 
; #GL_COMPILE = $1300
; #GL_COMPILE_AND_EXECUTE = $1301
; 
; #GL_CLEAR = $1500
; #GL_AND = $1501
; #GL_AND_REVERSE = $1502
; #GL_COPY = $1503
; #GL_AND_INVERTED = $1504
; #GL_NOOP = $1505
; #GL_XOR = $1506
; #GL_OR = $1507
; #GL_NOR = $1508
; #GL_EQUIV = $1509
; #GL_INVERT = $150A
; #GL_OR_REVERSE = $150B
; #GL_COPY_INVERTED = $150C
; #GL_OR_INVERTED = $150D
; #GL_NAND = $150E
; #GL_SET = $150F
; 
; #GL_EMISSION = $1600
; #GL_SHININESS = $1601
; #GL_AMBIENT_AND_DIFFUSE = $1602
; #GL_COLOR_INDEXES = $1603
; 
; #GL_MODELVIEW = $1700
; #GL_PROJECTION = $1701
; #GL_TEXTURE = $1702
; 
; #GL_COLOR = $1800
; #GL_DEPTH = $1801
; #GL_STENCIL = $1802
; 
; #GL_COLOR_INDEX = $1900
; #GL_STENCIL_INDEX = $1901
; #GL_DEPTH_COMPONENT = $1902
; #GL_RED = $1903
; #GL_GREEN = $1904
; #GL_BLUE = $1905
; #GL_ALPHA = $1906
; #GL_RGB = $1907
; #GL_RGBA = $1908
; #GL_LUMINANCE = $1909
; #GL_LUMINANCE_ALPHA = $190A
; 
; #GL_BITMAP = $1A00
; 
; #GL_POINT = $1B00
; #GL_LINE = $1B01
; #GL_FILL = $1B02
; 
; #GL_RENDER = $1C00
; #GL_FEEDBACK = $1C01
; #GL_SELECT = $1C02
; 
; #GL_FLAT = $1D00
; #GL_SMOOTH = $1D01
; 
; #GL_KEEP = $1E00
; #GL_REPLACE = $1E01
; #GL_INCR = $1E02
; #GL_DECR = $1E03
; 
; #GL_VENDOR = $1F00
; #GL_RENDERER = $1F01
; #GL_VERSION = $1F02
; #GL_EXTENSIONS = $1F03
; 
; #GL_S = $2000
; #GL_T = $2001
; #GL_R = $2002
; #GL_Q = $2003
; 
; #GL_MODULATE = $2100
; #GL_DECAL = $2101
; 
; #GL_TEXTURE_ENV_MODE = $2200
; #GL_TEXTURE_ENV_COLOR = $2201
; 
; #GL_TEXTURE_ENV = $2300
; 
; #GL_EYE_LINEAR = $2400
; #GL_OBJECT_LINEAR = $2401
; #GL_SPHERE_MAP = $2402
; 
; #GL_TEXTURE_GEN_MODE = $2500
; #GL_OBJECT_PLANE = $2501
; #GL_EYE_PLANE = $2502
; 
; #GL_NEAREST = $2600
; #GL_LINEAR = $2601
; 
; #GL_NEAREST_MIPMAP_NEAREST = $2700
; #GL_LINEAR_MIPMAP_NEAREST = $2701
; #GL_NEAREST_MIPMAP_LINEAR = $2702
; #GL_LINEAR_MIPMAP_LINEAR = $2703
; 
; #GL_TEXTURE_MAG_FILTER = $2800
; #GL_TEXTURE_MIN_FILTER = $2801
; #GL_TEXTURE_WRAP_S = $2802
; #GL_TEXTURE_WRAP_T = $2803
; 
; #GL_CLAMP = $2900
; #GL_REPEAT = $2901
; 
; #GL_CLIENT_PIXEL_STORE_BIT = $01
; #GL_CLIENT_VERTEX_ARRAY_BIT = $02
; #GL_CLIENT_ALL_ATTRIB_BITS = $FFFFFFFF
; 
; #GL_POLYGON_OFFSET_FACTOR = $8038
; #GL_POLYGON_OFFSET_UNITS = $2A00
; #GL_POLYGON_OFFSET_POINT = $2A01
; #GL_POLYGON_OFFSET_LINE = $2A02
; #GL_POLYGON_OFFSET_FILL = $8037
; 
; #GL_ALPHA4 = $803B
; #GL_ALPHA8 = $803C
; #GL_ALPHA12 = $803D
; #GL_ALPHA16 = $803E
; #GL_LUMINANCE4 = $803F
; #GL_LUMINANCE8 = $8040
; #GL_LUMINANCE12 = $8041
; #GL_LUMINANCE16 = $8042
; #GL_LUMINANCE4_ALPHA4 = $8043
; #GL_LUMINANCE6_ALPHA2 = $8044
; #GL_LUMINANCE8_ALPHA8 = $8045
; #GL_LUMINANCE12_ALPHA4 = $8046
; #GL_LUMINANCE12_ALPHA12 = $8047
; #GL_LUMINANCE16_ALPHA16 = $8048
; #GL_INTENSITY = $8049
; #GL_INTENSITY4 = $804A
; #GL_INTENSITY8 = $804B
; #GL_INTENSITY12 = $804C
; #GL_INTENSITY16 = $804D
; #GL_R3_G3_B2 = $2A10
; #GL_RGB4 = $804F
; #GL_RGB5 = $8050
; #GL_RGB8 = $8051
; #GL_RGB10 = $8052
; #GL_RGB12 = $8053
; #GL_RGB16 = $8054
; #GL_RGBA2 = $8055
; #GL_RGBA4 = $8056
; #GL_RGB5_A1 = $8057
; #GL_RGBA8 = $8058
; #GL_RGB10_A2 = $8059
; #GL_RGBA12 = $805A
; #GL_RGBA16 = $805B
; #GL_TEXTURE_RED_SIZE = $805C
; #GL_TEXTURE_GREEN_SIZE = $805D
; #GL_TEXTURE_BLUE_SIZE = $805E
; #GL_TEXTURE_ALPHA_SIZE = $805F
; #GL_TEXTURE_LUMINANCE_SIZE = $8060
; #GL_TEXTURE_INTENSITY_SIZE = $8061
; #GL_PROXY_TEXTURE_1D = $8063
; #GL_PROXY_TEXTURE_2D = $8064
; 
; #GL_TEXTURE_PRIORITY = $8066
; #GL_TEXTURE_RESIDENT = $8067
; #GL_TEXTURE_BINDING_1D = $8068
; #GL_TEXTURE_BINDING_2D = $8069
; 
; #GL_VERTEX_ARRAY = $8074
; #GL_NORMAL_ARRAY = $8075
; #GL_COLOR_ARRAY = $8076
; #GL_INDEX_ARRAY = $8077
; #GL_TEXTURE_COORD_ARRAY = $8078
; #GL_EDGE_FLAG_ARRAY = $8079
; #GL_VERTEX_ARRAY_SIZE = $807A
; #GL_VERTEX_ARRAY_TYPE = $807B
; #GL_VERTEX_ARRAY_STRIDE = $807C
; #GL_NORMAL_ARRAY_TYPE = $807E
; #GL_NORMAL_ARRAY_STRIDE = $807F
; #GL_COLOR_ARRAY_SIZE = $8081
; #GL_COLOR_ARRAY_TYPE = $8082
; #GL_COLOR_ARRAY_STRIDE = $8083
; #GL_INDEX_ARRAY_TYPE = $8085
; #GL_INDEX_ARRAY_STRIDE = $8086
; #GL_TEXTURE_COORD_ARRAY_SIZE = $8088
; #GL_TEXTURE_COORD_ARRAY_TYPE = $8089
; #GL_TEXTURE_COORD_ARRAY_STRIDE = $808A
; #GL_EDGE_FLAG_ARRAY_STRIDE = $808C
; #GL_VERTEX_ARRAY_POINTER = $808E
; #GL_NORMAL_ARRAY_POINTER = $808F
; #GL_COLOR_ARRAY_POINTER = $8090
; #GL_INDEX_ARRAY_POINTER = $8091
; #GL_TEXTURE_COORD_ARRAY_POINTER = $8092
; #GL_EDGE_FLAG_ARRAY_POINTER = $8093
; #GL_V2F = $2A20
; #GL_V3F = $2A21
; #GL_C4UB_V2F = $2A22
; #GL_C4UB_V3F = $2A23
; #GL_C3F_V3F = $2A24
; #GL_N3F_V3F = $2A25
; #GL_C4F_N3F_V3F = $2A26
; #GL_T2F_V3F = $2A27
; #GL_T4F_V4F = $2A28
; #GL_T2F_C4UB_V3F = $2A29
; #GL_T2F_C3F_V3F = $2A2A
; #GL_T2F_N3F_V3F = $2A2B
; #GL_T2F_C4F_N3F_V3F = $2A2C
; #GL_T4F_C4F_N3F_V4F = $2A2D
; 
; #GL_VERTEX_ARRAY_EXT = $8074
; #GL_NORMAL_ARRAY_EXT = $8075
; #GL_COLOR_ARRAY_EXT = $8076
; #GL_INDEX_ARRAY_EXT = $8077
; #GL_TEXTURE_COORD_ARRAY_EXT = $8078
; #GL_EDGE_FLAG_ARRAY_EXT = $8079
; #GL_VERTEX_ARRAY_SIZE_EXT = $807A
; #GL_VERTEX_ARRAY_TYPE_EXT = $807B
; #GL_VERTEX_ARRAY_STRIDE_EXT = $807C
; #GL_VERTEX_ARRAY_COUNT_EXT = $807D
; #GL_NORMAL_ARRAY_TYPE_EXT = $807E
; #GL_NORMAL_ARRAY_STRIDE_EXT = $807F
; #GL_NORMAL_ARRAY_COUNT_EXT = $8080
; #GL_COLOR_ARRAY_SIZE_EXT = $8081
; #GL_COLOR_ARRAY_TYPE_EXT = $8082
; #GL_COLOR_ARRAY_STRIDE_EXT = $8083
; #GL_COLOR_ARRAY_COUNT_EXT = $8084
; #GL_INDEX_ARRAY_TYPE_EXT = $8085
; #GL_INDEX_ARRAY_STRIDE_EXT = $8086
; #GL_INDEX_ARRAY_COUNT_EXT = $8087
; #GL_TEXTURE_COORD_ARRAY_SIZE_EXT = $8088
; #GL_TEXTURE_COORD_ARRAY_TYPE_EXT = $8089
; #GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = $808A
; #GL_TEXTURE_COORD_ARRAY_COUNT_EXT = $808B
; #GL_EDGE_FLAG_ARRAY_STRIDE_EXT = $808C
; #GL_EDGE_FLAG_ARRAY_COUNT_EXT = $808D
; #GL_VERTEX_ARRAY_POINTER_EXT = $808E
; #GL_NORMAL_ARRAY_POINTER_EXT = $808F
; #GL_COLOR_ARRAY_POINTER_EXT = $8090
; #GL_INDEX_ARRAY_POINTER_EXT = $8091
; #GL_TEXTURE_COORD_ARRAY_POINTER_EXT = $8092
; #GL_EDGE_FLAG_ARRAY_POINTER_EXT = $8093
; #GL_DOUBLE_EXT = #GL_DOUBLE
; 
; #GL_BGR_EXT = $80E0
; #GL_BGRA_EXT = $80E1
; 
; #GL_COLOR_TABLE_FORMAT_EXT = $80D8
; #GL_COLOR_TABLE_WIDTH_EXT = $80D9
; #GL_COLOR_TABLE_RED_SIZE_EXT = $80DA
; #GL_COLOR_TABLE_GREEN_SIZE_EXT = $80DB
; #GL_COLOR_TABLE_BLUE_SIZE_EXT = $80DC
; #GL_COLOR_TABLE_ALPHA_SIZE_EXT = $80DD
; #GL_COLOR_TABLE_LUMINANCE_SIZE_EXT = $80DE
; #GL_COLOR_TABLE_INTENSITY_SIZE_EXT = $80DF
; 
; #GL_COLOR_INDEX1_EXT = $80E2
; #GL_COLOR_INDEX2_EXT = $80E3
; #GL_COLOR_INDEX4_EXT = $80E4
; #GL_COLOR_INDEX8_EXT = $80E5
; #GL_COLOR_INDEX12_EXT = $80E6
; #GL_COLOR_INDEX16_EXT = $80E7
; 
; #GL_MAX_ELEMENTS_VERTICES_WIN = $80E8
; #GL_MAX_ELEMENTS_INDICES_WIN = $80E9
; 
; #GL_PHONG_WIN = $80EA
; #GL_PHONG_HINT_WIN = $80EB
; 
; #GL_FOG_SPECULAR_TEXTURE_WIN = $80EC
; 
; #GL_LOGIC_OP = #GL_INDEX_LOGIC_OP
; #GL_TEXTURE_COMPONENTS = #GL_TEXTURE_INTERNAL_FORMAT
; 
; 
; #GL_UNSIGNED_BYTE_3_3_2 = $8032
; #GL_UNSIGNED_SHORT_4_4_4_4 = $8033
; #GL_UNSIGNED_SHORT_5_5_5_1 = $8034
; #GL_UNSIGNED_INT_8_8_8_8 = $8035
; #GL_UNSIGNED_INT_10_10_10_2 = $8036
; #GL_TEXTURE_BINDING_3D = $806A
; #GL_PACK_SKIP_IMAGES = $806B
; #GL_PACK_IMAGE_HEIGHT = $806C
; #GL_UNPACK_SKIP_IMAGES = $806D
; #GL_UNPACK_IMAGE_HEIGHT = $806E
; #GL_TEXTURE_3D = $806F
; #GL_PROXY_TEXTURE_3D = $8070
; #GL_TEXTURE_DEPTH = $8071
; #GL_TEXTURE_WRAP_R = $8072
; #GL_MAX_3D_TEXTURE_SIZE = $8073
; #GL_UNSIGNED_BYTE_2_3_3_REV = $8362
; #GL_UNSIGNED_SHORT_5_6_5 = $8363
; #GL_UNSIGNED_SHORT_5_6_5_REV = $8364
; #GL_UNSIGNED_SHORT_4_4_4_4_REV = $8365
; #GL_UNSIGNED_SHORT_1_5_5_5_REV = $8366
; #GL_UNSIGNED_INT_8_8_8_8_REV = $8367
; #GL_UNSIGNED_INT_2_10_10_10_REV = $8368
; #GL_BGR = $80E0
; #GL_BGRA = $80E1
; #GL_MAX_ELEMENTS_VERTICES = $80E8
; #GL_MAX_ELEMENTS_INDICES = $80E9
; #GL_CLAMP_TO_EDGE = $812F
; #GL_TEXTURE_MIN_LOD = $813A
; #GL_TEXTURE_MAX_LOD = $813B
; #GL_TEXTURE_BASE_LEVEL = $813C
; #GL_TEXTURE_MAX_LEVEL = $813D
; #GL_SMOOTH_POINT_SIZE_RANGE = $0B12
; #GL_SMOOTH_POINT_SIZE_GRANULARITY = $0B13
; #GL_SMOOTH_LINE_WIDTH_RANGE = $0B22
; #GL_SMOOTH_LINE_WIDTH_GRANULARITY = $0B23
; #GL_ALIASED_LINE_WIDTH_RANGE = $846E
; 
; 
; #GL_RESCALE_NORMAL = $803A
; #GL_LIGHT_MODEL_COLOR_CONTROL = $81F8
; #GL_SINGLE_COLOR = $81F9
; #GL_SEPARATE_SPECULAR_COLOR = $81FA
; #GL_ALIASED_POINT_SIZE_RANGE = $846D
; 
; 
; #GL_TEXTURE0 = $84C0
; #GL_TEXTURE1 = $84C1
; #GL_TEXTURE2 = $84C2
; #GL_TEXTURE3 = $84C3
; #GL_TEXTURE4 = $84C4
; #GL_TEXTURE5 = $84C5
; #GL_TEXTURE6 = $84C6
; #GL_TEXTURE7 = $84C7
; #GL_TEXTURE8 = $84C8
; #GL_TEXTURE9 = $84C9
; #GL_TEXTURE10 = $84CA
; #GL_TEXTURE11 = $84CB
; #GL_TEXTURE12 = $84CC
; #GL_TEXTURE13 = $84CD
; #GL_TEXTURE14 = $84CE
; #GL_TEXTURE15 = $84CF
; #GL_TEXTURE16 = $84D0
; #GL_TEXTURE17 = $84D1
; #GL_TEXTURE18 = $84D2
; #GL_TEXTURE19 = $84D3
; #GL_TEXTURE20 = $84D4
; #GL_TEXTURE21 = $84D5
; #GL_TEXTURE22 = $84D6
; #GL_TEXTURE23 = $84D7
; #GL_TEXTURE24 = $84D8
; #GL_TEXTURE25 = $84D9
; #GL_TEXTURE26 = $84DA
; #GL_TEXTURE27 = $84DB
; #GL_TEXTURE28 = $84DC
; #GL_TEXTURE29 = $84DD
; #GL_TEXTURE30 = $84DE
; #GL_TEXTURE31 = $84DF
; #GL_ACTIVE_TEXTURE = $84E0
; #GL_MULTISAMPLE = $809D
; #GL_SAMPLE_ALPHA_TO_COVERAGE = $809E
; #GL_SAMPLE_ALPHA_TO_ONE = $809F
; #GL_SAMPLE_COVERAGE = $80A0
; #GL_SAMPLE_BUFFERS = $80A8
; #GL_SAMPLES = $80A9
; #GL_SAMPLE_COVERAGE_VALUE = $80AA
; #GL_SAMPLE_COVERAGE_INVERT = $80AB
; #GL_TEXTURE_CUBE_MAP = $8513
; #GL_TEXTURE_BINDING_CUBE_MAP = $8514
; #GL_TEXTURE_CUBE_MAP_POSITIVE_X = $8515
; #GL_TEXTURE_CUBE_MAP_NEGATIVE_X = $8516
; #GL_TEXTURE_CUBE_MAP_POSITIVE_Y = $8517
; #GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = $8518
; #GL_TEXTURE_CUBE_MAP_POSITIVE_Z = $8519
; #GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = $851A
; #GL_PROXY_TEXTURE_CUBE_MAP = $851B
; #GL_MAX_CUBE_MAP_TEXTURE_SIZE = $851C
; #GL_COMPRESSED_RGB = $84ED
; #GL_COMPRESSED_RGBA = $84EE
; #GL_TEXTURE_COMPRESSION_HINT = $84EF
; #GL_TEXTURE_COMPRESSED_IMAGE_SIZE = $86A0
; #GL_TEXTURE_COMPRESSED = $86A1
; #GL_NUM_COMPRESSED_TEXTURE_FORMATS = $86A2
; #GL_COMPRESSED_TEXTURE_FORMATS = $86A3
; #GL_CLAMP_TO_BORDER = $812D
; 
; 
; #GL_CLIENT_ACTIVE_TEXTURE = $84E1
; #GL_MAX_TEXTURE_UNITS = $84E2
; #GL_TRANSPOSE_MODELVIEW_MATRIX = $84E3
; #GL_TRANSPOSE_PROJECTION_MATRIX = $84E4
; #GL_TRANSPOSE_TEXTURE_MATRIX = $84E5
; #GL_TRANSPOSE_COLOR_MATRIX = $84E6
; #GL_MULTISAMPLE_BIT = $20000000
; #GL_NORMAL_MAP = $8511
; #GL_REFLECTION_MAP = $8512
; #GL_COMPRESSED_ALPHA = $84E9
; #GL_COMPRESSED_LUMINANCE = $84EA
; #GL_COMPRESSED_LUMINANCE_ALPHA = $84EB
; #GL_COMPRESSED_INTENSITY = $84EC
; #GL_COMBINE = $8570
; #GL_COMBINE_RGB = $8571
; #GL_COMBINE_ALPHA = $8572
; #GL_SOURCE0_RGB = $8580
; #GL_SOURCE1_RGB = $8581
; #GL_SOURCE2_RGB = $8582
; #GL_SOURCE0_ALPHA = $8588
; #GL_SOURCE1_ALPHA = $8589
; #GL_SOURCE2_ALPHA = $858A
; #GL_OPERAND0_RGB = $8590
; #GL_OPERAND1_RGB = $8591
; #GL_OPERAND2_RGB = $8592
; #GL_OPERAND0_ALPHA = $8598
; #GL_OPERAND1_ALPHA = $8599
; #GL_OPERAND2_ALPHA = $859A
; #GL_RGB_SCALE = $8573
; #GL_ADD_SIGNED = $8574
; #GL_INTERPOLATE = $8575
; #GL_SUBTRACT = $84E7
; #GL_CONSTANT = $8576
; #GL_PRIMARY_COLOR = $8577
; #GL_PREVIOUS = $8578
; #GL_DOT3_RGB = $86AE
; #GL_DOT3_RGBA = $86AF
; 
; 
; #GL_BLEND_DST_RGB = $80C8
; #GL_BLEND_SRC_RGB = $80C9
; #GL_BLEND_DST_ALPHA = $80CA
; #GL_BLEND_SRC_ALPHA = $80CB
; #GL_POINT_FADE_THRESHOLD_SIZE = $8128
; #GL_DEPTH_COMPONENT16 = $81A5
; #GL_DEPTH_COMPONENT24 = $81A6
; #GL_DEPTH_COMPONENT32 = $81A7
; #GL_MIRRORED_REPEAT = $8370
; #GL_MAX_TEXTURE_LOD_BIAS = $84FD
; #GL_TEXTURE_LOD_BIAS = $8501
; #GL_INCR_WRAP = $8507
; #GL_DECR_WRAP = $8508
; #GL_TEXTURE_DEPTH_SIZE = $884A
; #GL_TEXTURE_COMPARE_MODE = $884C
; #GL_TEXTURE_COMPARE_FUNC = $884D
; 
; 
; #GL_POINT_SIZE_MIN = $8126
; #GL_POINT_SIZE_MAX = $8127
; #GL_POINT_DISTANCE_ATTENUATION = $8129
; #GL_GENERATE_MIPMAP = $8191
; #GL_GENERATE_MIPMAP_HINT = $8192
; #GL_FOG_COORDINATE_SOURCE = $8450
; #GL_FOG_COORDINATE = $8451
; #GL_FRAGMENT_DEPTH = $8452
; #GL_CURRENT_FOG_COORDINATE = $8453
; #GL_FOG_COORDINATE_ARRAY_TYPE = $8454
; #GL_FOG_COORDINATE_ARRAY_STRIDE = $8455
; #GL_FOG_COORDINATE_ARRAY_POINTER = $8456
; #GL_FOG_COORDINATE_ARRAY = $8457
; #GL_COLOR_SUM = $8458
; #GL_CURRENT_SECONDARY_COLOR = $8459
; #GL_SECONDARY_COLOR_ARRAY_SIZE = $845A
; #GL_SECONDARY_COLOR_ARRAY_TYPE = $845B
; #GL_SECONDARY_COLOR_ARRAY_STRIDE = $845C
; #GL_SECONDARY_COLOR_ARRAY_POINTER = $845D
; #GL_SECONDARY_COLOR_ARRAY = $845E
; #GL_TEXTURE_FILTER_CONTROL = $8500
; #GL_DEPTH_TEXTURE_MODE = $884B
; #GL_COMPARE_R_TO_TEXTURE = $884E
; 
; 
; #GL_BUFFER_SIZE = $8764
; #GL_BUFFER_USAGE = $8765
; #GL_QUERY_COUNTER_BITS = $8864
; #GL_CURRENT_QUERY = $8865
; #GL_QUERY_RESULT = $8866
; #GL_QUERY_RESULT_AVAILABLE = $8867
; #GL_ARRAY_BUFFER = $8892
; #GL_ELEMENT_ARRAY_BUFFER = $8893
; #GL_ARRAY_BUFFER_BINDING = $8894
; #GL_ELEMENT_ARRAY_BUFFER_BINDING = $8895
; #GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = $889F
; #GL_READ_ONLY = $88B8
; #GL_WRITE_ONLY = $88B9
; #GL_READ_WRITE = $88BA
; #GL_BUFFER_ACCESS = $88BB
; #GL_BUFFER_MAPPED = $88BC
; #GL_BUFFER_MAP_POINTER = $88BD
; #GL_STREAM_DRAW = $88E0
; #GL_STREAM_READ = $88E1
; #GL_STREAM_COPY = $88E2
; #GL_STATIC_DRAW = $88E4
; #GL_STATIC_READ = $88E5
; #GL_STATIC_COPY = $88E6
; #GL_DYNAMIC_DRAW = $88E8
; #GL_DYNAMIC_READ = $88E9
; #GL_DYNAMIC_COPY = $88EA
; #GL_SAMPLES_PASSED = $8914
; 
; 
; #GL_VERTEX_ARRAY_BUFFER_BINDING = $8896
; #GL_NORMAL_ARRAY_BUFFER_BINDING = $8897
; #GL_COLOR_ARRAY_BUFFER_BINDING = $8898
; #GL_INDEX_ARRAY_BUFFER_BINDING = $8899
; #GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = $889A
; #GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = $889B
; #GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = $889C
; #GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = $889D
; #GL_WEIGHT_ARRAY_BUFFER_BINDING = $889E
; #GL_FOG_COORD_SRC = $8450
; #GL_FOG_COORD = $8451
; #GL_CURRENT_FOG_COORD = $8453
; #GL_FOG_COORD_ARRAY_TYPE = $8454
; #GL_FOG_COORD_ARRAY_STRIDE = $8455
; #GL_FOG_COORD_ARRAY_POINTER = $8456
; #GL_FOG_COORD_ARRAY = $8457
; #GL_FOG_COORD_ARRAY_BUFFER_BINDING = $889D
; #GL_SRC0_RGB = $8580
; #GL_SRC1_RGB = $8581
; #GL_SRC2_RGB = $8582
; #GL_SRC0_ALPHA = $8588
; #GL_SRC1_ALPHA = $8589
; #GL_SRC2_ALPHA = $858A
; 
; 
; #GL_BLEND_EQUATION_RGB = $8009
; #GL_VERTEX_ATTRIB_ARRAY_ENABLED = $8622
; #GL_VERTEX_ATTRIB_ARRAY_SIZE = $8623
; #GL_VERTEX_ATTRIB_ARRAY_STRIDE = $8624
; #GL_VERTEX_ATTRIB_ARRAY_TYPE = $8625
; #GL_CURRENT_VERTEX_ATTRIB = $8626
; #GL_VERTEX_PROGRAM_POINT_SIZE = $8642
; #GL_VERTEX_ATTRIB_ARRAY_POINTER = $8645
; #GL_STENCIL_BACK_FUNC = $8800
; #GL_STENCIL_BACK_FAIL = $8801
; #GL_STENCIL_BACK_PASS_DEPTH_FAIL = $8802
; #GL_STENCIL_BACK_PASS_DEPTH_PASS = $8803
; #GL_MAX_DRAW_BUFFERS = $8824
; #GL_DRAW_BUFFER0 = $8825
; #GL_DRAW_BUFFER1 = $8826
; #GL_DRAW_BUFFER2 = $8827
; #GL_DRAW_BUFFER3 = $8828
; #GL_DRAW_BUFFER4 = $8829
; #GL_DRAW_BUFFER5 = $882A
; #GL_DRAW_BUFFER6 = $882B
; #GL_DRAW_BUFFER7 = $882C
; #GL_DRAW_BUFFER8 = $882D
; #GL_DRAW_BUFFER9 = $882E
; #GL_DRAW_BUFFER10 = $882F
; #GL_DRAW_BUFFER11 = $8830
; #GL_DRAW_BUFFER12 = $8831
; #GL_DRAW_BUFFER13 = $8832
; #GL_DRAW_BUFFER14 = $8833
; #GL_DRAW_BUFFER15 = $8834
; #GL_BLEND_EQUATION_ALPHA = $883D
; #GL_MAX_VERTEX_ATTRIBS = $8869
; #GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = $886A
; #GL_MAX_TEXTURE_IMAGE_UNITS = $8872
; #GL_FRAGMENT_SHADER = $8B30
; #GL_VERTEX_SHADER = $8B31
; #GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = $8B49
; #GL_MAX_VERTEX_UNIFORM_COMPONENTS = $8B4A
; #GL_MAX_VARYING_FLOATS = $8B4B
; #GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = $8B4C
; #GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = $8B4D
; #GL_SHADER_TYPE = $8B4F
; #GL_FLOAT_VEC2 = $8B50
; #GL_FLOAT_VEC3 = $8B51
; #GL_FLOAT_VEC4 = $8B52
; #GL_INT_VEC2 = $8B53
; #GL_INT_VEC3 = $8B54
; #GL_INT_VEC4 = $8B55
; #GL_BOOL = $8B56
; #GL_BOOL_VEC2 = $8B57
; #GL_BOOL_VEC3 = $8B58
; #GL_BOOL_VEC4 = $8B59
; #GL_FLOAT_MAT2 = $8B5A
; #GL_FLOAT_MAT3 = $8B5B
; #GL_FLOAT_MAT4 = $8B5C
; #GL_SAMPLER_1D = $8B5D
; #GL_SAMPLER_2D = $8B5E
; #GL_SAMPLER_3D = $8B5F
; #GL_SAMPLER_CUBE = $8B60
; #GL_SAMPLER_1D_SHADOW = $8B61
; #GL_SAMPLER_2D_SHADOW = $8B62
; #GL_DELETE_STATUS = $8B80
; #GL_COMPILE_STATUS = $8B81
; #GL_LINK_STATUS = $8B82
; #GL_VALIDATE_STATUS = $8B83
; #GL_INFO_LOG_LENGTH = $8B84
; #GL_ATTACHED_SHADERS = $8B85
; #GL_ACTIVE_UNIFORMS = $8B86
; #GL_ACTIVE_UNIFORM_MAX_LENGTH = $8B87
; #GL_SHADER_SOURCE_LENGTH = $8B88
; #GL_ACTIVE_ATTRIBUTES = $8B89
; #GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = $8B8A
; #GL_FRAGMENT_SHADER_DERIVATIVE_HINT = $8B8B
; #GL_SHADING_LANGUAGE_VERSION = $8B8C
; #GL_CURRENT_PROGRAM = $8B8D
; #GL_POINT_SPRITE_COORD_ORIGIN = $8CA0
; #GL_LOWER_LEFT = $8CA1
; #GL_UPPER_LEFT = $8CA2
; #GL_STENCIL_BACK_REF = $8CA3
; #GL_STENCIL_BACK_VALUE_MASK = $8CA4
; #GL_STENCIL_BACK_WRITEMASK = $8CA5
; 
; 
; #GL_VERTEX_PROGRAM_TWO_SIDE = $8643
; #GL_POINT_SPRITE = $8861
; #GL_COORD_REPLACE = $8862
; #GL_MAX_TEXTURE_COORDS = $8871
; 
; 
; #GL_PIXEL_PACK_BUFFER = $88EB
; #GL_PIXEL_UNPACK_BUFFER = $88EC
; #GL_PIXEL_PACK_BUFFER_BINDING = $88ED
; #GL_PIXEL_UNPACK_BUFFER_BINDING = $88EF
; #GL_FLOAT_MAT2x3 = $8B65
; #GL_FLOAT_MAT2x4 = $8B66
; #GL_FLOAT_MAT3x2 = $8B67
; #GL_FLOAT_MAT3x4 = $8B68
; #GL_FLOAT_MAT4x2 = $8B69
; #GL_FLOAT_MAT4x3 = $8B6A
; #GL_SRGB = $8C40
; #GL_SRGB8 = $8C41
; #GL_SRGB_ALPHA = $8C42
; #GL_SRGB8_ALPHA8 = $8C43
; #GL_COMPRESSED_SRGB = $8C48
; #GL_COMPRESSED_SRGB_ALPHA = $8C49
; 
; 
; #GL_CURRENT_RASTER_SECONDARY_COLOR = $845F
; #GL_SLUMINANCE_ALPHA = $8C44
; #GL_SLUMINANCE8_ALPHA8 = $8C45
; #GL_SLUMINANCE = $8C46
; #GL_SLUMINANCE8 = $8C47
; #GL_COMPRESSED_SLUMINANCE = $8C4A
; #GL_COMPRESSED_SLUMINANCE_ALPHA = $8C4B
; 
; 
; #GL_COMPARE_REF_TO_TEXTURE = $884E
; #GL_CLIP_DISTANCE0 = $3000
; #GL_CLIP_DISTANCE1 = $3001
; #GL_CLIP_DISTANCE2 = $3002
; #GL_CLIP_DISTANCE3 = $3003
; #GL_CLIP_DISTANCE4 = $3004
; #GL_CLIP_DISTANCE5 = $3005
; #GL_CLIP_DISTANCE6 = $3006
; #GL_CLIP_DISTANCE7 = $3007
; #GL_MAX_CLIP_DISTANCES = $0D32
; #GL_MAJOR_VERSION = $821B
; #GL_MINOR_VERSION = $821C
; #GL_NUM_EXTENSIONS = $821D
; #GL_CONTEXT_FLAGS = $821E
; #GL_COMPRESSED_RED = $8225
; #GL_COMPRESSED_RG = $8226
; #GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = $01
; #GL_RGBA32F = $8814
; #GL_RGB32F = $8815
; #GL_RGBA16F = $881A
; #GL_RGB16F = $881B
; #GL_VERTEX_ATTRIB_ARRAY_INTEGER = $88FD
; #GL_MAX_ARRAY_TEXTURE_LAYERS = $88FF
; #GL_MIN_PROGRAM_TEXEL_OFFSET = $8904
; #GL_MAX_PROGRAM_TEXEL_OFFSET = $8905
; #GL_CLAMP_READ_COLOR = $891C
; #GL_FIXED_ONLY = $891D
; #GL_MAX_VARYING_COMPONENTS = $8B4B
; #GL_TEXTURE_1D_ARRAY = $8C18
; #GL_PROXY_TEXTURE_1D_ARRAY = $8C19
; #GL_TEXTURE_2D_ARRAY = $8C1A
; #GL_PROXY_TEXTURE_2D_ARRAY = $8C1B
; #GL_TEXTURE_BINDING_1D_ARRAY = $8C1C
; #GL_TEXTURE_BINDING_2D_ARRAY = $8C1D
; #GL_R11F_G11F_B10F = $8C3A
; #GL_UNSIGNED_INT_10F_11F_11F_REV = $8C3B
; #GL_RGB9_E5 = $8C3D
; #GL_UNSIGNED_INT_5_9_9_9_REV = $8C3E
; #GL_TEXTURE_SHARED_SIZE = $8C3F
; #GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = $8C76
; #GL_TRANSFORM_FEEDBACK_BUFFER_MODE = $8C7F
; #GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = $8C80
; #GL_TRANSFORM_FEEDBACK_VARYINGS = $8C83
; #GL_TRANSFORM_FEEDBACK_BUFFER_START = $8C84
; #GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = $8C85
; #GL_PRIMITIVES_GENERATED = $8C87
; #GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = $8C88
; #GL_RASTERIZER_DISCARD = $8C89
; #GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = $8C8A
; #GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = $8C8B
; #GL_INTERLEAVED_ATTRIBS = $8C8C
; #GL_SEPARATE_ATTRIBS = $8C8D
; #GL_TRANSFORM_FEEDBACK_BUFFER = $8C8E
; #GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = $8C8F
; #GL_RGBA32UI = $8D70
; #GL_RGB32UI = $8D71
; #GL_RGBA16UI = $8D76
; #GL_RGB16UI = $8D77
; #GL_RGBA8UI = $8D7C
; #GL_RGB8UI = $8D7D
; #GL_RGBA32I = $8D82
; #GL_RGB32I = $8D83
; #GL_RGBA16I = $8D88
; #GL_RGB16I = $8D89
; #GL_RGBA8I = $8D8E
; #GL_RGB8I = $8D8F
; #GL_RED_INTEGER = $8D94
; #GL_GREEN_INTEGER = $8D95
; #GL_BLUE_INTEGER = $8D96
; #GL_RGB_INTEGER = $8D98
; #GL_RGBA_INTEGER = $8D99
; #GL_BGR_INTEGER = $8D9A
; #GL_BGRA_INTEGER = $8D9B
; #GL_SAMPLER_1D_ARRAY = $8DC0
; #GL_SAMPLER_2D_ARRAY = $8DC1
; #GL_SAMPLER_1D_ARRAY_SHADOW = $8DC3
; #GL_SAMPLER_2D_ARRAY_SHADOW = $8DC4
; #GL_SAMPLER_CUBE_SHADOW = $8DC5
; #GL_UNSIGNED_INT_VEC2 = $8DC6
; #GL_UNSIGNED_INT_VEC3 = $8DC7
; #GL_UNSIGNED_INT_VEC4 = $8DC8
; #GL_INT_SAMPLER_1D = $8DC9
; #GL_INT_SAMPLER_2D = $8DCA
; #GL_INT_SAMPLER_3D = $8DCB
; #GL_INT_SAMPLER_CUBE = $8DCC
; #GL_INT_SAMPLER_1D_ARRAY = $8DCE
; #GL_INT_SAMPLER_2D_ARRAY = $8DCF
; #GL_UNSIGNED_INT_SAMPLER_1D = $8DD1
; #GL_UNSIGNED_INT_SAMPLER_2D = $8DD2
; #GL_UNSIGNED_INT_SAMPLER_3D = $8DD3
; #GL_UNSIGNED_INT_SAMPLER_CUBE = $8DD4
; #GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = $8DD6
; #GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = $8DD7
; #GL_QUERY_WAIT = $8E13
; #GL_QUERY_NO_WAIT = $8E14
; #GL_QUERY_BY_REGION_WAIT = $8E15
; #GL_QUERY_BY_REGION_NO_WAIT = $8E16
; #GL_BUFFER_ACCESS_FLAGS = $911F
; #GL_BUFFER_MAP_LENGTH = $9120
; #GL_BUFFER_MAP_OFFSET = $9121
; #GL_DEPTH_COMPONENT32F = $8CAC
; #GL_DEPTH32F_STENCIL8 = $8CAD
; #GL_FLOAT_32_UNSIGNED_INT_24_8_REV = $8DAD
; #GL_INVALID_FRAMEBUFFER_OPERATION = $0506
; #GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = $8210
; #GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = $8211
; #GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = $8212
; #GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = $8213
; #GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = $8214
; #GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = $8215
; #GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = $8216
; #GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = $8217
; #GL_FRAMEBUFFER_DEFAULT = $8218
; #GL_FRAMEBUFFER_UNDEFINED = $8219
; #GL_DEPTH_STENCIL_ATTACHMENT = $821A
; #GL_MAX_RENDERBUFFER_SIZE = $84E8
; #GL_DEPTH_STENCIL = $84F9
; #GL_UNSIGNED_INT_24_8 = $84FA
; #GL_DEPTH24_STENCIL8 = $88F0
; #GL_TEXTURE_STENCIL_SIZE = $88F1
; #GL_TEXTURE_RED_TYPE = $8C10
; #GL_TEXTURE_GREEN_TYPE = $8C11
; #GL_TEXTURE_BLUE_TYPE = $8C12
; #GL_TEXTURE_ALPHA_TYPE = $8C13
; #GL_TEXTURE_DEPTH_TYPE = $8C16
; #GL_UNSIGNED_NORMALIZED = $8C17
; #GL_FRAMEBUFFER_BINDING = $8CA6
; #GL_DRAW_FRAMEBUFFER_BINDING = $8CA6
; #GL_RENDERBUFFER_BINDING = $8CA7
; #GL_READ_FRAMEBUFFER = $8CA8
; #GL_DRAW_FRAMEBUFFER = $8CA9
; #GL_READ_FRAMEBUFFER_BINDING = $8CAA
; #GL_RENDERBUFFER_SAMPLES = $8CAB
; #GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = $8CD0
; #GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = $8CD1
; #GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = $8CD2
; #GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = $8CD3
; #GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = $8CD4
; #GL_FRAMEBUFFER_COMPLETE = $8CD5
; #GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = $8CD6
; #GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = $8CD7
; #GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = $8CDB
; #GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = $8CDC
; #GL_FRAMEBUFFER_UNSUPPORTED = $8CDD
; #GL_MAX_COLOR_ATTACHMENTS = $8CDF
; #GL_COLOR_ATTACHMENT0 = $8CE0
; #GL_COLOR_ATTACHMENT1 = $8CE1
; #GL_COLOR_ATTACHMENT2 = $8CE2
; #GL_COLOR_ATTACHMENT3 = $8CE3
; #GL_COLOR_ATTACHMENT4 = $8CE4
; #GL_COLOR_ATTACHMENT5 = $8CE5
; #GL_COLOR_ATTACHMENT6 = $8CE6
; #GL_COLOR_ATTACHMENT7 = $8CE7
; #GL_COLOR_ATTACHMENT8 = $8CE8
; #GL_COLOR_ATTACHMENT9 = $8CE9
; #GL_COLOR_ATTACHMENT10 = $8CEA
; #GL_COLOR_ATTACHMENT11 = $8CEB
; #GL_COLOR_ATTACHMENT12 = $8CEC
; #GL_COLOR_ATTACHMENT13 = $8CED
; #GL_COLOR_ATTACHMENT14 = $8CEE
; #GL_COLOR_ATTACHMENT15 = $8CEF
; #GL_DEPTH_ATTACHMENT = $8D00
; #GL_STENCIL_ATTACHMENT = $8D20
; #GL_FRAMEBUFFER = $8D40
; #GL_RENDERBUFFER = $8D41
; #GL_RENDERBUFFER_WIDTH = $8D42
; #GL_RENDERBUFFER_HEIGHT = $8D43
; #GL_RENDERBUFFER_INTERNAL_FORMAT = $8D44
; #GL_STENCIL_INDEX1 = $8D46
; #GL_STENCIL_INDEX4 = $8D47
; #GL_STENCIL_INDEX8 = $8D48
; #GL_STENCIL_INDEX16 = $8D49
; #GL_RENDERBUFFER_RED_SIZE = $8D50
; #GL_RENDERBUFFER_GREEN_SIZE = $8D51
; #GL_RENDERBUFFER_BLUE_SIZE = $8D52
; #GL_RENDERBUFFER_ALPHA_SIZE = $8D53
; #GL_RENDERBUFFER_DEPTH_SIZE = $8D54
; #GL_RENDERBUFFER_STENCIL_SIZE = $8D55
; #GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = $8D56
; #GL_MAX_SAMPLES = $8D57
; #GL_INDEX = $8222
; #GL_TEXTURE_LUMINANCE_TYPE = $8C14
; #GL_TEXTURE_INTENSITY_TYPE = $8C15
; #GL_FRAMEBUFFER_SRGB = $8DB9
; #GL_HALF_FLOAT = $140B
; #GL_MAP_READ_BIT = $01
; #GL_MAP_WRITE_BIT = $02
; #GL_MAP_INVALIDATE_RANGE_BIT = $04
; #GL_MAP_INVALIDATE_BUFFER_BIT = $08
; #GL_MAP_FLUSH_EXPLICIT_BIT = $010
; #GL_MAP_UNSYNCHRONIZED_BIT = $020
; #GL_COMPRESSED_RED_RGTC1 = $8DBB
; #GL_COMPRESSED_SIGNED_RED_RGTC1 = $8DBC
; #GL_COMPRESSED_RG_RGTC2 = $8DBD
; #GL_COMPRESSED_SIGNED_RG_RGTC2 = $8DBE
; #GL_RG = $8227
; #GL_RG_INTEGER = $8228
; #GL_R8 = $8229
; #GL_R16 = $822A
; #GL_RG8 = $822B
; #GL_RG16 = $822C
; #GL_R16F = $822D
; #GL_R32F = $822E
; #GL_RG16F = $822F
; #GL_RG32F = $8230
; #GL_R8I = $8231
; #GL_R8UI = $8232
; #GL_R16I = $8233
; #GL_R16UI = $8234
; #GL_R32I = $8235
; #GL_R32UI = $8236
; #GL_RG8I = $8237
; #GL_RG8UI = $8238
; #GL_RG16I = $8239
; #GL_RG16UI = $823A
; #GL_RG32I = $823B
; #GL_RG32UI = $823C
; #GL_VERTEX_ARRAY_BINDING = $85B5
; 
; 
; #GL_CLAMP_VERTEX_COLOR = $891A
; #GL_CLAMP_FRAGMENT_COLOR = $891B
; #GL_ALPHA_INTEGER = $8D97
; 
; 
; #GL_SAMPLER_2D_RECT = $8B63
; #GL_SAMPLER_2D_RECT_SHADOW = $8B64
; #GL_SAMPLER_BUFFER = $8DC2
; #GL_INT_SAMPLER_2D_RECT = $8DCD
; #GL_INT_SAMPLER_BUFFER = $8DD0
; #GL_UNSIGNED_INT_SAMPLER_2D_RECT = $8DD5
; #GL_UNSIGNED_INT_SAMPLER_BUFFER = $8DD8
; #GL_TEXTURE_BUFFER = $8C2A
; #GL_MAX_TEXTURE_BUFFER_SIZE = $8C2B
; #GL_TEXTURE_BINDING_BUFFER = $8C2C
; #GL_TEXTURE_BUFFER_DATA_STORE_BINDING = $8C2D
; #GL_TEXTURE_RECTANGLE = $84F5 
; #GL_TEXTURE_BINDING_RECTANGLE = $84F6
; #GL_PROXY_TEXTURE_RECTANGLE = $84F7
; #GL_MAX_RECTANGLE_TEXTURE_SIZE = $84F8
; #GL_R8_SNORM = $8F94
; #GL_RG8_SNORM = $8F95
; #GL_RGB8_SNORM = $8F96
; #GL_RGBA8_SNORM = $8F97
; #GL_R16_SNORM = $8F98
; #GL_RG16_SNORM = $8F99
; #GL_RGB16_SNORM = $8F9A
; #GL_RGBA16_SNORM = $8F9B
; #GL_SIGNED_NORMALIZED = $8F9C
; #GL_PRIMITIVE_RESTART = $8F9D
; #GL_PRIMITIVE_RESTART_INDEX = $8F9E
; #GL_COPY_READ_BUFFER = $8F36
; #GL_COPY_WRITE_BUFFER = $8F37
; #GL_UNIFORM_BUFFER = $8A11
; #GL_UNIFORM_BUFFER_BINDING = $8A28
; #GL_UNIFORM_BUFFER_START = $8A29
; #GL_UNIFORM_BUFFER_SIZE = $8A2A
; #GL_MAX_VERTEX_UNIFORM_BLOCKS = $8A2B
; #GL_MAX_GEOMETRY_UNIFORM_BLOCKS = $8A2C
; #GL_MAX_FRAGMENT_UNIFORM_BLOCKS = $8A2D
; #GL_MAX_COMBINED_UNIFORM_BLOCKS = $8A2E
; #GL_MAX_UNIFORM_BUFFER_BINDINGS = $8A2F
; #GL_MAX_UNIFORM_BLOCK_SIZE = $8A30
; #GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = $8A31
; #GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = $8A32
; #GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = $8A33
; #GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = $8A34
; #GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = $8A35
; #GL_ACTIVE_UNIFORM_BLOCKS = $8A36
; #GL_UNIFORM_TYPE = $8A37
; #GL_UNIFORM_SIZE = $8A38
; #GL_UNIFORM_NAME_LENGTH = $8A39
; #GL_UNIFORM_BLOCK_INDEX = $8A3A
; #GL_UNIFORM_OFFSET = $8A3B
; #GL_UNIFORM_ARRAY_STRIDE = $8A3C
; #GL_UNIFORM_MATRIX_STRIDE = $8A3D
; #GL_UNIFORM_IS_ROW_MAJOR = $8A3E
; #GL_UNIFORM_BLOCK_BINDING = $8A3F
; #GL_UNIFORM_BLOCK_DATA_SIZE = $8A40
; #GL_UNIFORM_BLOCK_NAME_LENGTH = $8A41
; #GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = $8A42
; #GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = $8A43
; #GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = $8A44
; #GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = $8A45
; #GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = $8A46
; #GL_INVALID_INDEX = $FFFFFFFF
; 
; 
; #GL_CONTEXT_CORE_PROFILE_BIT = $01
; #GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = $02
; #GL_LINES_ADJACENCY = $0A
; #GL_LINE_STRIP_ADJACENCY = $0B
; #GL_TRIANGLES_ADJACENCY = $0C
; #GL_TRIANGLE_STRIP_ADJACENCY = $0D
; #GL_PROGRAM_POINT_SIZE = $8642
; #GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = $8C29
; #GL_FRAMEBUFFER_ATTACHMENT_LAYERED = $8DA7
; #GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = $8DA8
; #GL_GEOMETRY_SHADER = $8DD9
; #GL_GEOMETRY_VERTICES_OUT = $8916
; #GL_GEOMETRY_INPUT_TYPE = $8917
; #GL_GEOMETRY_OUTPUT_TYPE = $8918
; #GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = $8DDF
; #GL_MAX_GEOMETRY_OUTPUT_VERTICES = $8DE0
; #GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = $8DE1
; #GL_MAX_VERTEX_OUTPUT_COMPONENTS = $9122
; #GL_MAX_GEOMETRY_INPUT_COMPONENTS = $9123
; #GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = $9124
; #GL_MAX_FRAGMENT_INPUT_COMPONENTS = $9125
; #GL_CONTEXT_PROFILE_MASK = $9126
; #GL_DEPTH_CLAMP = $864F
; #GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = $8E4C
; #GL_FIRST_VERTEX_CONVENTION = $8E4D
; #GL_LAST_VERTEX_CONVENTION = $8E4E
; #GL_PROVOKING_VERTEX = $8E4F
; #GL_TEXTURE_CUBE_MAP_SEAMLESS = $884F
; #GL_MAX_SERVER_WAIT_TIMEOUT = $9111
; #GL_OBJECT_TYPE = $9112
; #GL_SYNC_CONDITION = $9113
; #GL_SYNC_STATUS = $9114
; #GL_SYNC_FLAGS = $9115
; #GL_SYNC_FENCE = $9116
; #GL_SYNC_GPU_COMMANDS_COMPLETE = $9117
; #GL_UNSIGNALED = $9118
; #GL_SIGNALED = $9119
; #GL_ALREADY_SIGNALED = $911A
; #GL_TIMEOUT_EXPIRED = $911B
; #GL_CONDITION_SATISFIED = $911C
; #GL_WAIT_FAILED = $911D
; #GL_TIMEOUT_IGNORED = $FFFFFFFFFFFFFFFF
; #GL_SYNC_FLUSH_COMMANDS_BIT = $01
; #GL_SAMPLE_POSITION = $8E50
; #GL_SAMPLE_MASK = $8E51
; #GL_SAMPLE_MASK_VALUE = $8E52
; #GL_MAX_SAMPLE_MASK_WORDS = $8E59
; #GL_TEXTURE_2D_MULTISAMPLE = $9100
; #GL_PROXY_TEXTURE_2D_MULTISAMPLE = $9101
; #GL_TEXTURE_2D_MULTISAMPLE_ARRAY = $9102
; #GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = $9103
; #GL_TEXTURE_BINDING_2D_MULTISAMPLE = $9104
; #GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = $9105
; #GL_TEXTURE_SAMPLES = $9106
; #GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = $9107
; #GL_SAMPLER_2D_MULTISAMPLE = $9108
; #GL_INT_SAMPLER_2D_MULTISAMPLE = $9109
; #GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = $910A
; #GL_SAMPLER_2D_MULTISAMPLE_ARRAY = $910B
; #GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = $910C
; #GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = $910D
; #GL_MAX_COLOR_TEXTURE_SAMPLES = $910E
; #GL_MAX_DEPTH_TEXTURE_SAMPLES = $910F
; #GL_MAX_INTEGER_SAMPLES = $9110
; 
; 
; #GL_VERTEX_ATTRIB_ARRAY_DIVISOR = $88FE
; #GL_SRC1_COLOR = $88F9
; #GL_ONE_MINUS_SRC1_COLOR = $88FA
; #GL_ONE_MINUS_SRC1_ALPHA = $88FB
; #GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = $88FC
; #GL_ANY_SAMPLES_PASSED = $8C2F
; #GL_SAMPLER_BINDING = $8919
; #GL_RGB10_A2UI = $906F
; #GL_TEXTURE_SWIZZLE_R = $8E42
; #GL_TEXTURE_SWIZZLE_G = $8E43
; #GL_TEXTURE_SWIZZLE_B = $8E44
; #GL_TEXTURE_SWIZZLE_A = $8E45
; #GL_TEXTURE_SWIZZLE_RGBA = $8E46
; #GL_TIME_ELAPSED = $88BF
; #GL_TIMESTAMP = $8E28
; #GL_INT_2_10_10_10_REV = $8D9F
; 
; 
; #GL_SAMPLE_SHADING = $8C36
; #GL_MIN_SAMPLE_SHADING_VALUE = $8C37
; #GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = $8E5E
; #GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = $8E5F
; #GL_TEXTURE_CUBE_MAP_ARRAY = $9009
; #GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = $900A
; #GL_PROXY_TEXTURE_CUBE_MAP_ARRAY = $900B
; #GL_SAMPLER_CUBE_MAP_ARRAY = $900C
; #GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW = $900D
; #GL_INT_SAMPLER_CUBE_MAP_ARRAY = $900E
; #GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = $900F
; #GL_DRAW_INDIRECT_BUFFER = $8F3F
; #GL_DRAW_INDIRECT_BUFFER_BINDING = $8F43
; #GL_GEOMETRY_SHADER_INVOCATIONS = $887F
; #GL_MAX_GEOMETRY_SHADER_INVOCATIONS = $8E5A
; #GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = $8E5B
; #GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = $8E5C
; #GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = $8E5D
; #GL_MAX_VERTEX_STREAMS = $8E71
; #GL_DOUBLE_VEC2 = $8FFC
; #GL_DOUBLE_VEC3 = $8FFD
; #GL_DOUBLE_VEC4 = $8FFE
; #GL_DOUBLE_MAT2 = $8F46
; #GL_DOUBLE_MAT3 = $8F47
; #GL_DOUBLE_MAT4 = $8F48
; #GL_DOUBLE_MAT2x3 = $8F49
; #GL_DOUBLE_MAT2x4 = $8F4A
; #GL_DOUBLE_MAT3x2 = $8F4B
; #GL_DOUBLE_MAT3x4 = $8F4C
; #GL_DOUBLE_MAT4x2 = $8F4D
; #GL_DOUBLE_MAT4x3 = $8F4E
; #GL_ACTIVE_SUBROUTINES = $8DE5
; #GL_ACTIVE_SUBROUTINE_UNIFORMS = $8DE6
; #GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = $8E47
; #GL_ACTIVE_SUBROUTINE_MAX_LENGTH = $8E48
; #GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = $8E49
; #GL_MAX_SUBROUTINES = $8DE7
; #GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = $8DE8
; #GL_NUM_COMPATIBLE_SUBROUTINES = $8E4A
; #GL_COMPATIBLE_SUBROUTINES = $8E4B
; #GL_PATCHES = $0E
; #GL_PATCH_VERTICES = $8E72
; #GL_PATCH_DEFAULT_INNER_LEVEL = $8E73
; #GL_PATCH_DEFAULT_OUTER_LEVEL = $8E74
; #GL_TESS_CONTROL_OUTPUT_VERTICES = $8E75
; #GL_TESS_GEN_MODE = $8E76
; #GL_TESS_GEN_SPACING = $8E77
; #GL_TESS_GEN_VERTEX_ORDER = $8E78
; #GL_TESS_GEN_POINT_MODE = $8E79
; #GL_ISOLINES = $8E7A
; #GL_FRACTIONAL_ODD = $8E7B
; #GL_FRACTIONAL_EVEN = $8E7C
; #GL_MAX_PATCH_VERTICES = $8E7D
; #GL_MAX_TESS_GEN_LEVEL = $8E7E
; #GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = $8E7F
; #GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = $8E80
; #GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = $8E81
; #GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = $8E82
; #GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = $8E83
; #GL_MAX_TESS_PATCH_COMPONENTS = $8E84
; #GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = $8E85
; #GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = $8E86
; #GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = $8E89
; #GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = $8E8A
; #GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = $886C
; #GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = $886D
; #GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = $8E1E
; #GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = $8E1F
; #GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = $84F0
; #GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = $84F1
; #GL_TESS_EVALUATION_SHADER = $8E87
; #GL_TESS_CONTROL_SHADER = $8E88
; #GL_TRANSFORM_FEEDBACK = $8E22
; #GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = $8E23
; #GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = $8E24
; #GL_TRANSFORM_FEEDBACK_BINDING = $8E25
; #GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = $8E70
; 
; 
; #GL_FIXED = $140C
; #GL_IMPLEMENTATION_COLOR_READ_TYPE = $8B9A
; #GL_IMPLEMENTATION_COLOR_READ_FORMAT = $8B9B
; #GL_LOW_FLOAT = $8DF0
; #GL_MEDIUM_FLOAT = $8DF1
; #GL_HIGH_FLOAT = $8DF2
; #GL_LOW_INT = $8DF3
; #GL_MEDIUM_INT = $8DF4
; #GL_HIGH_INT = $8DF5
; #GL_SHADER_COMPILER = $8DFA
; #GL_SHADER_BINARY_FORMATS = $8DF8
; #GL_NUM_SHADER_BINARY_FORMATS = $8DF9
; #GL_MAX_VERTEX_UNIFORM_VECTORS = $8DFB
; #GL_MAX_VARYING_VECTORS = $8DFC
; #GL_MAX_FRAGMENT_UNIFORM_VECTORS = $8DFD
; #GL_RGB565 = $8D62
; #GL_PROGRAM_BINARY_RETRIEVABLE_HINT = $8257
; #GL_PROGRAM_BINARY_LENGTH = $8741
; #GL_NUM_PROGRAM_BINARY_FORMATS = $87FE
; #GL_PROGRAM_BINARY_FORMATS = $87FF
; #GL_VERTEX_SHADER_BIT = $01
; #GL_FRAGMENT_SHADER_BIT = $02
; #GL_GEOMETRY_SHADER_BIT = $04
; #GL_TESS_CONTROL_SHADER_BIT = $08
; #GL_TESS_EVALUATION_SHADER_BIT = $010
; #GL_ALL_SHADER_BITS = $FFFFFFFF
; #GL_PROGRAM_SEPARABLE = $8258
; #GL_ACTIVE_PROGRAM = $8259
; #GL_PROGRAM_PIPELINE_BINDING = $825A
; #GL_MAX_VIEWPORTS = $825B
; #GL_VIEWPORT_SUBPIXEL_BITS = $825C
; #GL_VIEWPORT_BOUNDS_RANGE = $825D
; #GL_LAYER_PROVOKING_VERTEX = $825E
; #GL_VIEWPORT_INDEX_PROVOKING_VERTEX = $825F
; #GL_UNDEFINED_VERTEX = $8260
; 
; 
; #GL_COPY_READ_BUFFER_BINDING = $8F36
; #GL_COPY_WRITE_BUFFER_BINDING = $8F37
; #GL_TRANSFORM_FEEDBACK_ACTIVE = $8E24
; #GL_TRANSFORM_FEEDBACK_PAUSED = $8E23
; #GL_UNPACK_COMPRESSED_BLOCK_WIDTH = $9127
; #GL_UNPACK_COMPRESSED_BLOCK_HEIGHT = $9128
; #GL_UNPACK_COMPRESSED_BLOCK_DEPTH = $9129
; #GL_UNPACK_COMPRESSED_BLOCK_SIZE = $912A
; #GL_PACK_COMPRESSED_BLOCK_WIDTH = $912B
; #GL_PACK_COMPRESSED_BLOCK_HEIGHT = $912C
; #GL_PACK_COMPRESSED_BLOCK_DEPTH = $912D
; #GL_PACK_COMPRESSED_BLOCK_SIZE = $912E
; #GL_NUM_SAMPLE_COUNTS = $9380
; #GL_MIN_MAP_BUFFER_ALIGNMENT = $90BC
; #GL_ATOMIC_COUNTER_BUFFER = $92C0
; #GL_ATOMIC_COUNTER_BUFFER_BINDING = $92C1
; #GL_ATOMIC_COUNTER_BUFFER_START = $92C2
; #GL_ATOMIC_COUNTER_BUFFER_SIZE = $92C3
; #GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE = $92C4
; #GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS = $92C5
; #GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES = $92C6
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER = $92C7
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER = $92C8
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = $92C9
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER = $92CA
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER = $92CB
; #GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = $92CC
; #GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = $92CD
; #GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = $92CE
; #GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = $92CF
; #GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = $92D0
; #GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = $92D1
; #GL_MAX_VERTEX_ATOMIC_COUNTERS = $92D2
; #GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = $92D3
; #GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = $92D4
; #GL_MAX_GEOMETRY_ATOMIC_COUNTERS = $92D5
; #GL_MAX_FRAGMENT_ATOMIC_COUNTERS = $92D6
; #GL_MAX_COMBINED_ATOMIC_COUNTERS = $92D7
; #GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = $92D8
; #GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = $92DC
; #GL_ACTIVE_ATOMIC_COUNTER_BUFFERS = $92D9
; #GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX = $92DA
; #GL_UNSIGNED_INT_ATOMIC_COUNTER = $92DB
; #GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = $01
; #GL_ELEMENT_ARRAY_BARRIER_BIT = $02
; #GL_UNIFORM_BARRIER_BIT = $04
; #GL_TEXTURE_FETCH_BARRIER_BIT = $08
; #GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = $020
; #GL_COMMAND_BARRIER_BIT = $040
; #GL_PIXEL_BUFFER_BARRIER_BIT = $080
; #GL_TEXTURE_UPDATE_BARRIER_BIT = $0100
; #GL_BUFFER_UPDATE_BARRIER_BIT = $0200
; #GL_FRAMEBUFFER_BARRIER_BIT = $0400
; #GL_TRANSFORM_FEEDBACK_BARRIER_BIT = $0800
; #GL_ATOMIC_COUNTER_BARRIER_BIT = $01000
; #GL_ALL_BARRIER_BITS = $FFFFFFFF
; #GL_MAX_IMAGE_UNITS = $8F38
; #GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = $8F39
; #GL_IMAGE_BINDING_NAME = $8F3A
; #GL_IMAGE_BINDING_LEVEL = $8F3B
; #GL_IMAGE_BINDING_LAYERED = $8F3C
; #GL_IMAGE_BINDING_LAYER = $8F3D
; #GL_IMAGE_BINDING_ACCESS = $8F3E
; #GL_IMAGE_1D = $904C
; #GL_IMAGE_2D = $904D
; #GL_IMAGE_3D = $904E
; #GL_IMAGE_2D_RECT = $904F
; #GL_IMAGE_CUBE = $9050
; #GL_IMAGE_BUFFER = $9051
; #GL_IMAGE_1D_ARRAY = $9052
; #GL_IMAGE_2D_ARRAY = $9053
; #GL_IMAGE_CUBE_MAP_ARRAY = $9054
; #GL_IMAGE_2D_MULTISAMPLE = $9055
; #GL_IMAGE_2D_MULTISAMPLE_ARRAY = $9056
; #GL_INT_IMAGE_1D = $9057
; #GL_INT_IMAGE_2D = $9058
; #GL_INT_IMAGE_3D = $9059
; #GL_INT_IMAGE_2D_RECT = $905A
; #GL_INT_IMAGE_CUBE = $905B
; #GL_INT_IMAGE_BUFFER = $905C
; #GL_INT_IMAGE_1D_ARRAY = $905D
; #GL_INT_IMAGE_2D_ARRAY = $905E
; #GL_INT_IMAGE_CUBE_MAP_ARRAY = $905F
; #GL_INT_IMAGE_2D_MULTISAMPLE = $9060
; #GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY = $9061
; #GL_UNSIGNED_INT_IMAGE_1D = $9062
; #GL_UNSIGNED_INT_IMAGE_2D = $9063
; #GL_UNSIGNED_INT_IMAGE_3D = $9064
; #GL_UNSIGNED_INT_IMAGE_2D_RECT = $9065
; #GL_UNSIGNED_INT_IMAGE_CUBE = $9066
; #GL_UNSIGNED_INT_IMAGE_BUFFER = $9067
; #GL_UNSIGNED_INT_IMAGE_1D_ARRAY = $9068
; #GL_UNSIGNED_INT_IMAGE_2D_ARRAY = $9069
; #GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = $906A
; #GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE = $906B
; #GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = $906C
; #GL_MAX_IMAGE_SAMPLES = $906D
; #GL_IMAGE_BINDING_FORMAT = $906E
; #GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = $90C7
; #GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = $90C8
; #GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = $90C9
; #GL_MAX_VERTEX_IMAGE_UNIFORMS = $90CA
; #GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = $90CB
; #GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = $90CC
; #GL_MAX_GEOMETRY_IMAGE_UNIFORMS = $90CD
; #GL_MAX_FRAGMENT_IMAGE_UNIFORMS = $90CE
; #GL_MAX_COMBINED_IMAGE_UNIFORMS = $90CF
; #GL_COMPRESSED_RGBA_BPTC_UNORM = $8E8C
; #GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM = $8E8D
; #GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT = $8E8E
; #GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT = $8E8F
; #GL_TEXTURE_IMMUTABLE_FORMAT = $912F
; 
; 
; #GL_NUM_SHADING_LANGUAGE_VERSIONS = $82E9
; #GL_VERTEX_ATTRIB_ARRAY_LONG = $874E
; #GL_COMPRESSED_RGB8_ETC2 = $9274
; #GL_COMPRESSED_SRGB8_ETC2 = $9275
; #GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = $9276
; #GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = $9277
; #GL_COMPRESSED_RGBA8_ETC2_EAC = $9278
; #GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = $9279
; #GL_COMPRESSED_R11_EAC = $9270
; #GL_COMPRESSED_SIGNED_R11_EAC = $9271
; #GL_COMPRESSED_RG11_EAC = $9272
; #GL_COMPRESSED_SIGNED_RG11_EAC = $9273
; #GL_PRIMITIVE_RESTART_FIXED_INDEX = $8D69
; #GL_ANY_SAMPLES_PASSED_CONSERVATIVE = $8D6A
; #GL_MAX_ELEMENT_INDEX = $8D6B
; #GL_COMPUTE_SHADER = $91B9
; #GL_MAX_COMPUTE_UNIFORM_BLOCKS = $91BB
; #GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = $91BC
; #GL_MAX_COMPUTE_IMAGE_UNIFORMS = $91BD
; #GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = $8262
; #GL_MAX_COMPUTE_UNIFORM_COMPONENTS = $8263
; #GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = $8264
; #GL_MAX_COMPUTE_ATOMIC_COUNTERS = $8265
; #GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = $8266
; #GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS = $90EB
; #GL_MAX_COMPUTE_WORK_GROUP_COUNT = $91BE
; #GL_MAX_COMPUTE_WORK_GROUP_SIZE = $91BF
; #GL_COMPUTE_WORK_GROUP_SIZE = $8267
; #GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER = $90EC
; #GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = $90ED
; #GL_DISPATCH_INDIRECT_BUFFER = $90EE
; #GL_DISPATCH_INDIRECT_BUFFER_BINDING = $90EF
; #GL_COMPUTE_SHADER_BIT = $020
; #GL_DEBUG_OUTPUT_SYNCHRONOUS = $8242
; #GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = $8243
; #GL_DEBUG_CALLBACK_FUNCTION = $8244
; #GL_DEBUG_CALLBACK_USER_PARAM = $8245
; #GL_DEBUG_SOURCE_API = $8246
; #GL_DEBUG_SOURCE_WINDOW_SYSTEM = $8247
; #GL_DEBUG_SOURCE_SHADER_COMPILER = $8248
; #GL_DEBUG_SOURCE_THIRD_PARTY = $8249
; #GL_DEBUG_SOURCE_APPLICATION = $824A
; #GL_DEBUG_SOURCE_OTHER = $824B
; #GL_DEBUG_TYPE_ERROR = $824C
; #GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = $824D
; #GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR = $824E
; #GL_DEBUG_TYPE_PORTABILITY = $824F
; #GL_DEBUG_TYPE_PERFORMANCE = $8250
; #GL_DEBUG_TYPE_OTHER = $8251
; #GL_MAX_DEBUG_MESSAGE_LENGTH = $9143
; #GL_MAX_DEBUG_LOGGED_MESSAGES = $9144
; #GL_DEBUG_LOGGED_MESSAGES = $9145
; #GL_DEBUG_SEVERITY_HIGH = $9146
; #GL_DEBUG_SEVERITY_MEDIUM = $9147
; #GL_DEBUG_SEVERITY_LOW = $9148
; #GL_DEBUG_TYPE_MARKER = $8268
; #GL_DEBUG_TYPE_PUSH_GROUP = $8269
; #GL_DEBUG_TYPE_POP_GROUP = $826A
; #GL_DEBUG_SEVERITY_NOTIFICATION = $826B
; #GL_MAX_DEBUG_GROUP_STACK_DEPTH = $826C
; #GL_DEBUG_GROUP_STACK_DEPTH = $826D
; #GL_BUFFER = $82E0
; #GL_SHADER = $82E1
; #GL_PROGRAM = $82E2
; #GL_QUERY = $82E3
; #GL_PROGRAM_PIPELINE = $82E4
; #GL_SAMPLER = $82E6
; #GL_MAX_LABEL_LENGTH = $82E8
; #GL_DEBUG_OUTPUT = $92E0
; #GL_CONTEXT_FLAG_DEBUG_BIT = $02
; #GL_MAX_UNIFORM_LOCATIONS = $826E
; #GL_FRAMEBUFFER_DEFAULT_WIDTH = $9310
; #GL_FRAMEBUFFER_DEFAULT_HEIGHT = $9311
; #GL_FRAMEBUFFER_DEFAULT_LAYERS = $9312
; #GL_FRAMEBUFFER_DEFAULT_SAMPLES = $9313
; #GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = $9314
; #GL_MAX_FRAMEBUFFER_WIDTH = $9315
; #GL_MAX_FRAMEBUFFER_HEIGHT = $9316
; #GL_MAX_FRAMEBUFFER_LAYERS = $9317
; #GL_MAX_FRAMEBUFFER_SAMPLES = $9318
; #GL_INTERNALFORMAT_SUPPORTED = $826F
; #GL_INTERNALFORMAT_PREFERRED = $8270
; #GL_INTERNALFORMAT_RED_SIZE = $8271
; #GL_INTERNALFORMAT_GREEN_SIZE = $8272
; #GL_INTERNALFORMAT_BLUE_SIZE = $8273
; #GL_INTERNALFORMAT_ALPHA_SIZE = $8274
; #GL_INTERNALFORMAT_DEPTH_SIZE = $8275
; #GL_INTERNALFORMAT_STENCIL_SIZE = $8276
; #GL_INTERNALFORMAT_SHARED_SIZE = $8277
; #GL_INTERNALFORMAT_RED_TYPE = $8278
; #GL_INTERNALFORMAT_GREEN_TYPE = $8279
; #GL_INTERNALFORMAT_BLUE_TYPE = $827A
; #GL_INTERNALFORMAT_ALPHA_TYPE = $827B
; #GL_INTERNALFORMAT_DEPTH_TYPE = $827C
; #GL_INTERNALFORMAT_STENCIL_TYPE = $827D
; #GL_MAX_WIDTH = $827E
; #GL_MAX_HEIGHT = $827F
; #GL_MAX_DEPTH = $8280
; #GL_MAX_LAYERS = $8281
; #GL_MAX_COMBINED_DIMENSIONS = $8282
; #GL_COLOR_COMPONENTS = $8283
; #GL_DEPTH_COMPONENTS = $8284
; #GL_STENCIL_COMPONENTS = $8285
; #GL_COLOR_RENDERABLE = $8286
; #GL_DEPTH_RENDERABLE = $8287
; #GL_STENCIL_RENDERABLE = $8288
; #GL_FRAMEBUFFER_RENDERABLE = $8289
; #GL_FRAMEBUFFER_RENDERABLE_LAYERED = $828A
; #GL_FRAMEBUFFER_BLEND = $828B
; #GL_READ_PIXELS = $828C
; #GL_READ_PIXELS_FORMAT = $828D
; #GL_READ_PIXELS_TYPE = $828E
; #GL_TEXTURE_IMAGE_FORMAT = $828F
; #GL_TEXTURE_IMAGE_TYPE = $8290
; #GL_GET_TEXTURE_IMAGE_FORMAT = $8291
; #GL_GET_TEXTURE_IMAGE_TYPE = $8292
; #GL_MIPMAP = $8293
; #GL_MANUAL_GENERATE_MIPMAP = $8294
; #GL_AUTO_GENERATE_MIPMAP = $8295
; #GL_COLOR_ENCODING = $8296
; #GL_SRGB_READ = $8297
; #GL_SRGB_WRITE = $8298
; #GL_FILTER = $829A
; #GL_VERTEX_TEXTURE = $829B
; #GL_TESS_CONTROL_TEXTURE = $829C
; #GL_TESS_EVALUATION_TEXTURE = $829D
; #GL_GEOMETRY_TEXTURE = $829E
; #GL_FRAGMENT_TEXTURE = $829F
; #GL_COMPUTE_TEXTURE = $82A0
; #GL_TEXTURE_SHADOW = $82A1
; #GL_TEXTURE_GATHER = $82A2
; #GL_TEXTURE_GATHER_SHADOW = $82A3
; #GL_SHADER_IMAGE_LOAD = $82A4
; #GL_SHADER_IMAGE_STORE = $82A5
; #GL_SHADER_IMAGE_ATOMIC = $82A6
; #GL_IMAGE_TEXEL_SIZE = $82A7
; #GL_IMAGE_COMPATIBILITY_CLASS = $82A8
; #GL_IMAGE_PIXEL_FORMAT = $82A9
; #GL_IMAGE_PIXEL_TYPE = $82AA
; #GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST = $82AC
; #GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST = $82AD
; #GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE = $82AE
; #GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE = $82AF
; #GL_TEXTURE_COMPRESSED_BLOCK_WIDTH = $82B1
; #GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT = $82B2
; #GL_TEXTURE_COMPRESSED_BLOCK_SIZE = $82B3
; #GL_CLEAR_BUFFER = $82B4
; #GL_TEXTURE_VIEW = $82B5
; #GL_VIEW_COMPATIBILITY_CLASS = $82B6
; #GL_FULL_SUPPORT = $82B7
; #GL_CAVEAT_SUPPORT = $82B8
; #GL_IMAGE_CLASS_4_X_32 = $82B9
; #GL_IMAGE_CLASS_2_X_32 = $82BA
; #GL_IMAGE_CLASS_1_X_32 = $82BB
; #GL_IMAGE_CLASS_4_X_16 = $82BC
; #GL_IMAGE_CLASS_2_X_16 = $82BD
; #GL_IMAGE_CLASS_1_X_16 = $82BE
; #GL_IMAGE_CLASS_4_X_8 = $82BF
; #GL_IMAGE_CLASS_2_X_8 = $82C0
; #GL_IMAGE_CLASS_1_X_8 = $82C1
; #GL_IMAGE_CLASS_11_11_10 = $82C2
; #GL_IMAGE_CLASS_10_10_10_2 = $82C3
; #GL_VIEW_CLASS_128_BITS = $82C4
; #GL_VIEW_CLASS_96_BITS = $82C5
; #GL_VIEW_CLASS_64_BITS = $82C6
; #GL_VIEW_CLASS_48_BITS = $82C7
; #GL_VIEW_CLASS_32_BITS = $82C8
; #GL_VIEW_CLASS_24_BITS = $82C9
; #GL_VIEW_CLASS_16_BITS = $82CA
; #GL_VIEW_CLASS_8_BITS = $82CB
; #GL_VIEW_CLASS_S3TC_DXT1_RGB = $82CC
; #GL_VIEW_CLASS_S3TC_DXT1_RGBA = $82CD
; #GL_VIEW_CLASS_S3TC_DXT3_RGBA = $82CE
; #GL_VIEW_CLASS_S3TC_DXT5_RGBA = $82CF
; #GL_VIEW_CLASS_RGTC1_RED = $82D0
; #GL_VIEW_CLASS_RGTC2_RG = $82D1
; #GL_VIEW_CLASS_BPTC_UNORM = $82D2
; #GL_VIEW_CLASS_BPTC_FLOAT = $82D3
; #GL_UNIFORM = $92E1
; #GL_UNIFORM_BLOCK = $92E2
; #GL_PROGRAM_INPUT = $92E3
; #GL_PROGRAM_OUTPUT = $92E4
; #GL_BUFFER_VARIABLE = $92E5
; #GL_SHADER_STORAGE_BLOCK = $92E6
; #GL_VERTEX_SUBROUTINE = $92E8
; #GL_TESS_CONTROL_SUBROUTINE = $92E9
; #GL_TESS_EVALUATION_SUBROUTINE = $92EA
; #GL_GEOMETRY_SUBROUTINE = $92EB
; #GL_FRAGMENT_SUBROUTINE = $92EC
; #GL_COMPUTE_SUBROUTINE = $92ED
; #GL_VERTEX_SUBROUTINE_UNIFORM = $92EE
; #GL_TESS_CONTROL_SUBROUTINE_UNIFORM = $92EF
; #GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = $92F0
; #GL_GEOMETRY_SUBROUTINE_UNIFORM = $92F1
; #GL_FRAGMENT_SUBROUTINE_UNIFORM = $92F2
; #GL_COMPUTE_SUBROUTINE_UNIFORM = $92F3
; #GL_TRANSFORM_FEEDBACK_VARYING = $92F4
; #GL_ACTIVE_RESOURCES = $92F5
; #GL_MAX_NAME_LENGTH = $92F6
; #GL_MAX_NUM_ACTIVE_VARIABLES = $92F7
; #GL_MAX_NUM_COMPATIBLE_SUBROUTINES = $92F8
; #GL_NAME_LENGTH = $92F9
; #GL_TYPE = $92FA
; #GL_ARRAY_SIZE = $92FB
; #GL_OFFSET = $92FC
; #GL_BLOCK_INDEX = $92FD
; #GL_ARRAY_STRIDE = $92FE
; #GL_MATRIX_STRIDE = $92FF
; #GL_IS_ROW_MAJOR = $9300
; #GL_ATOMIC_COUNTER_BUFFER_INDEX = $9301
; #GL_BUFFER_BINDING = $9302
; #GL_BUFFER_DATA_SIZE = $9303
; #GL_NUM_ACTIVE_VARIABLES = $9304
; #GL_ACTIVE_VARIABLES = $9305
; #GL_REFERENCED_BY_VERTEX_SHADER = $9306
; #GL_REFERENCED_BY_TESS_CONTROL_SHADER = $9307
; #GL_REFERENCED_BY_TESS_EVALUATION_SHADER = $9308
; #GL_REFERENCED_BY_GEOMETRY_SHADER = $9309
; #GL_REFERENCED_BY_FRAGMENT_SHADER = $930A
; #GL_REFERENCED_BY_COMPUTE_SHADER = $930B
; #GL_TOP_LEVEL_ARRAY_SIZE = $930C
; #GL_TOP_LEVEL_ARRAY_STRIDE = $930D
; #GL_LOCATION = $930E
; #GL_LOCATION_INDEX = $930F
; #GL_IS_PER_PATCH = $92E7
; #GL_SHADER_STORAGE_BUFFER = $90D2
; #GL_SHADER_STORAGE_BUFFER_BINDING = $90D3
; #GL_SHADER_STORAGE_BUFFER_START = $90D4
; #GL_SHADER_STORAGE_BUFFER_SIZE = $90D5
; #GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = $90D6
; #GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = $90D7
; #GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = $90D8
; #GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = $90D9
; #GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = $90DA
; #GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = $90DB
; #GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = $90DC
; #GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = $90DD
; #GL_MAX_SHADER_STORAGE_BLOCK_SIZE = $90DE
; #GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = $90DF
; #GL_SHADER_STORAGE_BARRIER_BIT = $02000
; #GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = $8F39
; #GL_DEPTH_STENCIL_TEXTURE_MODE = $90EA
; #GL_TEXTURE_BUFFER_OFFSET = $919D
; #GL_TEXTURE_BUFFER_SIZE = $919E
; #GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = $919F
; #GL_TEXTURE_VIEW_MIN_LEVEL = $82DB
; #GL_TEXTURE_VIEW_NUM_LEVELS = $82DC
; #GL_TEXTURE_VIEW_MIN_LAYER = $82DD
; #GL_TEXTURE_VIEW_NUM_LAYERS = $82DE
; #GL_TEXTURE_IMMUTABLE_LEVELS = $82DF
; #GL_VERTEX_ATTRIB_BINDING = $82D4
; #GL_VERTEX_ATTRIB_RELATIVE_OFFSET = $82D5
; #GL_VERTEX_BINDING_DIVISOR = $82D6
; #GL_VERTEX_BINDING_OFFSET = $82D7
; #GL_VERTEX_BINDING_STRIDE = $82D8
; #GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = $82D9
; #GL_MAX_VERTEX_ATTRIB_BINDINGS = $82DA
; #GL_VERTEX_BINDING_BUFFER = $8F4F
; #GL_DISPLAY_LIST = $82E7
; 
; 
; #GL_MAX_VERTEX_ATTRIB_STRIDE = $82E5
; #GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = $8221
; #GL_TEXTURE_BUFFER_BINDING = $8C2A
; #GL_MAP_PERSISTENT_BIT = $40
; #GL_MAP_COHERENT_BIT = $80
; #GL_DYNAMIC_STORAGE_BIT = $0100
; #GL_CLIENT_STORAGE_BIT = $0200
; #GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT = $4000
; #GL_BUFFER_IMMUTABLE_STORAGE = $821F
; #GL_BUFFER_STORAGE_FLAGS = $8220
; #GL_CLEAR_TEXTURE = $9365
; #GL_LOCATION_COMPONENT = $934A
; #GL_TRANSFORM_FEEDBACK_BUFFER_INDEX = $934B
; #GL_TRANSFORM_FEEDBACK_BUFFER_STRIDE = $934C
; #GL_QUERY_BUFFER = $9192
; #GL_QUERY_BUFFER_BARRIER_BIT = $8000
; #GL_QUERY_BUFFER_BINDING = $9193
; #GL_QUERY_RESULT_NO_WAIT = $9194
; #GL_MIRROR_CLAMP_TO_EDGE = $8743
; 
; 
; #GL_CONTEXT_LOST = $0507
; #GL_NEGATIVE_ONE_TO_ONE = $935E
; #GL_ZERO_TO_ONE = $935F
; #GL_CLIP_ORIGIN = $935C
; #GL_CLIP_DEPTH_MODE = $935D
; #GL_QUERY_WAIT_INVERTED = $8E17
; #GL_QUERY_NO_WAIT_INVERTED = $8E18
; #GL_QUERY_BY_REGION_WAIT_INVERTED = $8E19
; #GL_QUERY_BY_REGION_NO_WAIT_INVERTED = $8E1A
; #GL_MAX_CULL_DISTANCES = $82F9
; #GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES = $82FA
; #GL_TEXTURE_TARGET = $1006
; #GL_QUERY_TARGET = $82EA
; #GL_TEXTURE_BINDING = $82EB
; #GL_GUILTY_CONTEXT_RESET = $8253
; #GL_INNOCENT_CONTEXT_RESET = $8254
; #GL_UNKNOWN_CONTEXT_RESET = $8255
; #GL_RESET_NOTIFICATION_STRATEGY = $8256
; #GL_LOSE_CONTEXT_ON_RESET = $8252
; #GL_NO_RESET_NOTIFICATION = $8261
; #GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT = $04
; #GL_CONTEXT_RELEASE_BEHAVIOR = $82FB
; #GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = $82FC
; 
; 
; #GL_SHADER_BINARY_FORMAT_SPIR_V = $9551
; #GL_SPIR_V_BINARY = $9552
; #GL_PARAMETER_BUFFER = $80EE
; #GL_PARAMETER_BUFFER_BINDING = $80EF
; #GL_CONTEXT_FLAG_NO_ERROR_BIT = $00000008
; #GL_VERTICES_SUBMITTED = $82EE
; #GL_PRIMITIVES_SUBMITTED = $82EF
; #GL_VERTEX_SHADER_INVOCATIONS = $82F0
; #GL_TESS_CONTROL_SHADER_PATCHES = $82F1
; #GL_TESS_EVALUATION_SHADER_INVOCATIONS = $82F2
; #GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED = $82F3
; #GL_FRAGMENT_SHADER_INVOCATIONS = $82F4
; #GL_COMPUTE_SHADER_INVOCATIONS = $82F5
; #GL_CLIPPING_INPUT_PRIMITIVES = $82F6
; #GL_CLIPPING_OUTPUT_PRIMITIVES = $82F7
; #GL_POLYGON_OFFSET_CLAMP = $8E1B
; #GL_SPIR_V_EXTENSIONS = $9553
; #GL_NUM_SPIR_V_EXTENSIONS = $9554
; #GL_TEXTURE_MAX_ANISOTROPY = $84FE
; #GL_MAX_TEXTURE_MAX_ANISOTROPY = $84FF
; #GL_TRANSFORM_FEEDBACK_OVERFLOW = $82EC
; #GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW = $82ED
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; 
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86) 
; 
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x64) 
; 
; 
; 
; 
; Import "Opengl32.lib" 
; glBindTexture_(a.i,b.i) As "glBindTexture"
; glBlendFunc_(a.i,b.i) As "glBlendFunc"
; glClear_(a.i) As "glClear"
; glClearColor_(a.f,b.f,c.f,d.f) As "glClearColor"
; glClearDepth_(a.d) As "glClearDepth"
; glClearStencil_(a.i) As "glClearStencil"
; glColorMask_(a.c,b.c,c.c,d.c) As "glColorMask"
; glCopyTexImage1D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i) As "glCopyTexImage1D"
; glCopyTexImage2D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i) As "glCopyTexImage2D"
; glCopyTexSubImage1D_(a.i,b.i,c.i,d.i,e.i,f.i) As "glCopyTexSubImage1D"
; glCopyTexSubImage2D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i) As "glCopyTexSubImage2D"
; glCullFace_(a.i) As "glCullFace"
; glDeleteTextures_(a.i,b.i) As "glDeleteTextures"
; glDepthFunc_(a.i) As "glDepthFunc"
; glDepthMask_(a.c) As "glDepthMask"
; glDepthRange_(a.d,b.d) As "glDepthRange"
; glDisable_(a.i) As "glDisable"
; glDrawArrays_(a.i,b.i,c.i) As "glDrawArrays"
; glDrawBuffer_(a.i) As "glDrawBuffer"
; glDrawElements_(a.i,b.i,c.i,d.i) As "glDrawElements"
; glEnable_(a.i) As "glEnable"
; glFinish_() As "glFinish"
; glFlush_() As "glFlush"
; glFrontFace_(a.i) As "glFrontFace"
; glGenTextures_(a.i,b.i) As "glGenTextures"
; glGetBooleanv_(a.i,b.i) As "glGetBooleanv"
; glGetDoublev_(a.i,b.i) As "glGetDoublev"
; glGetError_() As "glGetError"
; glGetFloatv_(a.i,b.i) As "glGetFloatv"
; glGetIntegerv_(a.i,b.i) As "glGetIntegerv"
; glGetPointerv_(a.i,b.i) As "glGetPointerv"
; glGetString_(a.i) As "glGetString"
; glGetTexImage_(a.i,b.i,c.i,d.i,e.i) As "glGetTexImage"
; glGetTexLevelParameterfv_(a.i,b.i,c.i,d.i) As "glGetTexLevelParameterfv"
; glGetTexLevelParameteriv_(a.i,b.i,c.i,d.i) As "glGetTexLevelParameteriv"
; glGetTexParameterfv_(a.i,b.i,c.i) As "glGetTexParameterfv"
; glGetTexParameteriv_(a.i,b.i,c.i) As "glGetTexParameteriv"
; glHint_(a.i,b.i) As "glHint"
; glIsEnabled_(a.i) As "glIsEnabled"
; glIsTexture_(a.i) As "glIsTexture"
; glLineWidth_(a.f) As "glLineWidth"
; glLogicOp_(a.i) As "glLogicOp"
; glPixelStoref_(a.i,b.f) As "glPixelStoref"
; glPixelStorei_(a.i,b.i) As "glPixelStorei"
; glPointSize_(a.f) As "glPointSize"
; glPolygonMode_(a.i,b.i) As "glPolygonMode"
; glPolygonOffset_(a.f,b.f) As "glPolygonOffset"
; glReadBuffer_(a.i) As "glReadBuffer"
; glReadPixels_(a.i,b.i,c.i,d.i,e.i,f.i,g.i) As "glReadPixels"
; glScissor_(a.i,b.i,c.i,d.i) As "glScissor"
; glStencilFunc_(a.i,b.i,c.i) As "glStencilFunc"
; glStencilMask_(a.i) As "glStencilMask"
; glStencilOp_(a.i,b.i,c.i) As "glStencilOp"
; glTexImage1D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i) As "glTexImage1D"
; glTexImage2D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i,i.i) As "glTexImage2D"
; glTexParameterf_(a.i,b.i,c.f) As "glTexParameterf"
; glTexParameterfv_(a.i,b.i,c.i) As "glTexParameterfv"
; glTexParameteri_(a.i,b.i,c.i) As "glTexParameteri"
; glTexParameteriv_(a.i,b.i,c.i) As "glTexParameteriv"
; glTexSubImage1D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i) As "glTexSubImage1D"
; glTexSubImage2D_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i,i.i) As "glTexSubImage2D"
; glViewport_(a.i,b.i,c.i,d.i) As "glViewport"
; EndImport
; 
; 
; 
; Import "Opengl32.lib"
; glAccum_(a.i,b.f) As "glAccum"
; glAlphaFunc_(a.i,b.f) As "glAlphaFunc"
; glAreTexturesResident_(a.i,b.i,c.i) As "glAreTexturesResident"
; glArrayElement_(a.i) As "glArrayElement"
; glBegin_(a.i) As "glBegin"
; glBitmap_(a.i,b.i,c.f,d.f,e.f,f.f,g.i) As "glBitmap"
; glCallList_(a.i) As "glCallList"
; glCallLists_(a.i,b.i,c.i) As "glCallLists"
; glClearAccum_(a.f,b.f,c.f,d.f) As "glClearAccum"
; glClearIndex_(a.f) As "glClearIndex"
; glClipPlane_(a.i,b.i) As "glClipPlane"
; glColor3b_(a.b,b.b,c.b) As "glColor3b"
; glColor3bv_(a.i) As "glColor3bv"
; glColor3d_(a.d,b.d,c.d) As "glColor3d"
; glColor3dv_(a.i) As "glColor3dv"
; glColor3f_(a.f,b.f,c.f) As "glColor3f"
; glColor3fv_(a.i) As "glColor3fv"
; glColor3i_(a.i,b.i,c.i) As "glColor3i"
; glColor3iv_(a.i) As "glColor3iv"
; glColor3s_(a.w,b.w,c.w) As "glColor3s"
; glColor3sv_(a.i) As "glColor3sv"
; glColor3ub_(a.a,b.a,c.a) As "glColor3ub"
; glColor3ubv_(a.a) As "glColor3ubv"
; glColor3ui_(a.i,b.i,c.i) As "glColor3ui"
; glColor3uiv_(a.i) As "glColor3uiv"
; glColor3us_(a.w,b.w,c.w) As "glColor3us"
; glColor3usv_(a.i) As "glColor3usv"
; glColor4b_(a.b,b.b,c.b,d.b) As "glColor4b"
; glColor4bv_(a.i) As "glColor4bv"
; glColor4d_(a.d,b.d,c.d,d.d) As "glColor4d"
; glColor4dv_(a.i) As "glColor4dv"
; glColor4f_(a.f,b.f,c.f,d.f) As "glColor4f"
; glColor4fv_(a.i) As "glColor4fv"
; glColor4i_(a.i,b.i,c.i,d.i) As "glColor4i"
; glColor4iv_(a.i) As "glColor4iv"
; glColor4s_(a.w,b.w,c.w,d.w) As "glColor4s"
; glColor4sv_(a.i) As "glColor4sv"
; glColor4ub_(a.a,b.a,c.a,d.a) As "glColor4ub"
; glColor4ubv_(a.a) As "glColor4ubv"
; glColor4ui_(a.i,b.i,c.i,d.i) As "glColor4ui"
; glColor4uiv_(a.i) As "glColor4uiv"
; glColor4us_(a.w,b.w,c.w,d.w) As "glColor4us"
; glColor4usv_(a.i) As "glColor4usv"
; glColorMaterial_(a.i,b.i) As "glColorMaterial"
; glColorPointer_(a.i,b.i,c.i,d.i) As "glColorPointer"
; glCopyPixels_(a.i,b.i,c.i,d.i,e.i) As "glCopyPixels"
; glDeleteLists_(a.i,b.i) As "glDeleteLists" 
; glDisableClientState_(a.i) As "glDisableClientState"
; glDrawPixels_(a.i,b.i,c.i,d.i,e.i) As "glDrawPixels"
; glEdgeFlag_(a.c) As "glEdgeFlag"
; glEdgeFlagPointer_(a.i,b.i) As "glEdgeFlagPointer"
; glEdgeFlagv_(a.i) As "glEdgeFlagv"
; glEnableClientState_(a.i) As "glEnableClientState"
; glEnd_() As "glEnd"
; glEndList_() As "glEndList"
; glEvalCoord1d_(a.d) As "glEvalCoord1d"
; glEvalCoord1dv_(a.i) As "glEvalCoord1dv"
; glEvalCoord1f_(a.f) As "glEvalCoord1f"
; glEvalCoord1fv_(a.i) As "glEvalCoord1fv"
; glEvalCoord2d_(a.d,b.d) As "glEvalCoord2d"
; glEvalCoord2dv_(a.i) As "glEvalCoord2dv"
; glEvalCoord2f_(a.f,b.f) As "glEvalCoord2f"
; glEvalCoord2fv_(a.i) As "glEvalCoord2fv"
; glEvalMesh1_(a.i,b.i,c.i) As "glEvalMesh1"
; glEvalMesh2_(a.i,b.i,c.i,d.i,e.i) As "glEvalMesh2"
; glEvalPoint1_(a.i) As "glEvalPoint1"
; glEvalPoint2_(a.i,b.i) As "glEvalPoint2"
; glFeedbackBuffer_(a.i,b.i,c.i) As "glFeedbackBuffer"
; glFogf_(a.i,b.f) As "glFogf"
; glFogfv_(a.i,b.i) As "glFogfv"
; glFogi_(a.i,b.i) As "glFogi"
; glFogiv_(a.i,b.i) As "glFogiv"
; glFrustum_(a.d,b.d,c.d,d.d,e.d,f.d) As "glFrustum"
; glGenLists_(a.i) As "glGenLists"
; glGetClipPlane_(a.i,b.i) As "glGetClipPlane"
; glGetLightfv_(a.i,b.i,c.i) As "glGetLightfv"
; glGetLightiv_(a.i,b.i,c.i) As "glGetLightiv"
; glGetMapdv_(a.i,b.i,c.i) As "glGetMapdv"
; glGetMapfv_(a.i,b.i,c.i) As "glGetMapfv"
; glGetMapiv_(a.i,b.i,c.i) As "glGetMapiv"
; glGetMaterialfv_(a.i,b.i,c.i) As "glGetMaterialfv"
; glGetMaterialiv_(a.i,b.i,c.i) As "glGetMaterialiv"
; glGetPixelMapfv_(a.i,b.i) As "glGetPixelMapfv"
; glGetPixelMapuiv_(a.i,b.i) As "glGetPixelMapuiv"
; glGetPixelMapusv_(a.i,b.i) As "glGetPixelMapusv"
; glGetPolygonStipple_(a.i) As "glGetPolygonStipple"
; glGetTexEnvfv_(a.i,b.i,c.i) As "glGetTexEnvfv"
; glGetTexEnviv_(a.i,b.i,c.i) As "glGetTexEnviv"
; glGetTexGendv_(a.i,b.i,c.i) As "glGetTexGendv"
; glGetTexGenfv_(a.i,b.i,c.i) As "glGetTexGenfv"
; glGetTexGeniv_(a.i,b.i,c.i) As "glGetTexGeniv"
; glIndexMask_(a.i) As "glIndexMask"
; glIndexPointer_(a.i,b.i,c.i) As "glIndexPointer"
; glIndexd_(a.d) As "glIndexd"
; glIndexdv_(a.i) As "glIndexdv"
; glIndexf_(a.f) As "glIndexf"
; glIndexfv_(a.i) As "glIndexfv"
; glIndexi_(a.i) As "glIndexi"
; glIndexiv_(a.i) As "glIndexiv"
; glIndexs_(a.w) As "glIndexs"
; glIndexsv_(a.i) As "glIndexsv"
; glIndexub_(a.a) As "glIndexub"
; glIndexubv_(a.a) As "glIndexubv"
; glInitNames_() As "glInitNames"
; glInterleavedArrays_(a.i,b.i,c.i) As "glInterleavedArrays"
; glIsList_(a.i) As "glIsList"
; glLightModelf_(a.i,b.f) As "glLightModelf"
; glLightModelfv_(a.i,b.i) As "glLightModelfv"
; glLightModeli_(a.i,b.i) As "glLightModeli"
; glLightModeliv_(a.i,b.i) As "glLightModeliv"
; glLightf_(a.i,b.i,c.f) As "glLightf"
; glLightfv_(a.i,b.i,c.i) As "glLightfv"
; glLighti_(a.i,b.i,c.i) As "glLighti"
; glLightiv_(a.i,b.i,c.i) As "glLightiv"
; glLineStipple_(a.i,b.w) As "glLineStipple"
; glListBase_(a.i) As "glListBase"
; glLoadIdentity_() As "glLoadIdentity"
; glLoadMatrixd_(a.i) As "glLoadMatrixd"
; glLoadMatrixf_(a.i) As "glLoadMatrixf"
; glLoadName_(a.i) As "glLoadName"
; glMap1d_(a.i,b.d,c.d,d.i,e.i,f.i) As "glMap1d"
; glMap1f_(a.i,b.f,c.f,d.i,e.i,f.i) As "glMap1f"
; glMap2d_(a.i,b.d,c.d,d.i,e.i,f.d,g.d,h.i,i.i,j.i) As "glMap2d"
; glMap2f_(a.i,b.f,c.f,d.i,e.i,f.f,g.f,h.i,i.i,j.i) As "glMap2f"
; glMapGrid1d_(a.i,b.d,c.d) As "glMapGrid1d"
; glMapGrid1f_(a.i,b.f,c.f) As "glMapGrid1f"
; glMapGrid2d_(a.i,b.d,c.d,d.i,e.d,f.d) As "glMapGrid2d"
; glMapGrid2f_(a.i,b.f,c.f,d.i,e.f,f.f) As "glMapGrid2f"
; glMaterialf_(a.i,b.i,c.f) As "glMaterialf"
; glMaterialfv_(a.i,b.i,c.i) As "glMaterialfv"
; glMateriali_(a.i,b.i,c.i) As "glMateriali"
; glMaterialiv_(a.i,b.i,c.i) As "glMaterialiv"
; glMatrixMode_(a.i) As "glMatrixMode"
; glMultMatrixd_(a.i) As "glMultMatrixd"
; glMultMatrixf_(a.i) As "glMultMatrixf"
; glNewList_(a.i,b.i) As "glNewList"
; glNormal3b_(a.b,b.b,c.b) As "glNormal3b"
; glNormal3bv_(a.i) As "glNormal3bv"
; glNormal3d_(a.d,b.d,c.d) As "glNormal3d"
; glNormal3dv_(a.i) As "glNormal3dv"
; glNormal3f_(a.f,b.f,c.f) As "glNormal3f"
; glNormal3fv_(a.i) As "glNormal3fv"
; glNormal3i_(a.i,b.i,c.i) As "glNormal3i"
; glNormal3iv_(a.i) As "glNormal3iv"
; glNormal3s_(a.w,b.w,c.w) As "glNormal3s"
; glNormal3sv_(a.i) As "glNormal3sv"
; glNormalPointer_(a.i,b.i,c.i) As "glNormalPointer"
; glOrtho_(a.d,b.d,c.d,d.d,e.d,f.d) As "glOrtho"
; glPassThrough_(a.f) As "glPassThrough"
; glPixelMapfv_(a.i,b.i,c.i) As "glPixelMapfv"
; glPixelMapuiv_(a.i,b.i,c.i) As "glPixelMapuiv"
; glPixelMapusv_(a.i,b.i,c.i) As "glPixelMapusv"
; glPixelTransferf_(a.i,b.f) As "glPixelTransferf"
; glPixelTransferi_(a.i,b.i) As "glPixelTransferi"
; glPixelZoom_(a.f,b.f) As "glPixelZoom"
; glPolygonStipple_(a.i) As "glPolygonStipple"
; glPopAttrib_() As "glPopAttrib"
; glPopClientAttrib_() As "glPopClientAttrib"
; glPopMatrix_() As "glPopMatrix"
; glPopName_() As "glPopName"
; glPrioritizeTextures_(a.i,b.i,c.i) As "glPrioritizeTextures"
; glPushAttrib_(a.i) As "glPushAttrib"
; glPushClientAttrib_(a.i) As "glPushClientAttrib"
; glPushMatrix_() As "glPushMatrix"
; glPushName_(a.i) As "glPushName"
; glRasterPos2d_(a.d,b.d) As "glRasterPos2d"
; glRasterPos2dv_(a.i) As "glRasterPos2dv"
; glRasterPos2f_(a.f,b.f) As "glRasterPos2f"
; glRasterPos2fv_(a.i) As "glRasterPos2fv"
; glRasterPos2i_(a.i,b.i) As "glRasterPos2i"
; glRasterPos2iv_(a.i) As "glRasterPos2iv"
; glRasterPos2s_(a.w,b.w) As "glRasterPos2s"
; glRasterPos2sv_(a.i) As "glRasterPos2sv"
; glRasterPos3d_(a.d,b.d,c.d) As "glRasterPos3d"
; glRasterPos3dv_(a.i) As "glRasterPos3dv"
; glRasterPos3f_(a.f,b.f,c.f) As "glRasterPos3f"
; glRasterPos3fv_(a.i) As "glRasterPos3fv"
; glRasterPos3i_(a.i,b.i,c.i) As "glRasterPos3i"
; glRasterPos3iv_(a.i) As "glRasterPos3iv"
; glRasterPos3s_(a.w,b.w,c.w) As "glRasterPos3s"
; glRasterPos3sv_(a.i) As "glRasterPos3sv"
; glRasterPos4d_(a.d,b.d,c.d,d.d) As "glRasterPos4d"
; glRasterPos4dv_(a.i) As "glRasterPos4dv"
; glRasterPos4f_(a.f,b.f,c.f,d.f) As "glRasterPos4f"
; glRasterPos4fv_(a.i) As "glRasterPos4fv"
; glRasterPos4i_(a.i,b.i,c.i,d.i) As "glRasterPos4i"
; glRasterPos4iv_(a.i) As "glRasterPos4iv"
; glRasterPos4s_(a.w,b.w,c.w,d.w) As "glRasterPos4s"
; glRasterPos4sv_(a.i) As "glRasterPos4sv"
; glRectd_(a.d,b.d,c.d,d.d) As "glRectd"
; glRectdv_(a.i,b.i) As "glRectdv"
; glRectf_(a.f,b.f,c.f,d.f) As "glRectf"
; glRectfv_(a.i,b.i) As "glRectfv"
; glRecti_(a.i,b.i,c.i,d.i) As "glRecti"
; glRectiv_(a.i,b.i) As "glRectiv"
; glRects_(a.w,b.w,c.w,d.w) As "glRects"
; glRectsv_(a.i,b.i) As "glRectsv"
; glRenderMode_(a.i) As "glRenderMode"
; glRotated_(a.d,b.d,c.d,d.d) As "glRotated"
; glRotatef_(a.f,b.f,c.f,d.f) As "glRotatef"
; glScaled_(a.d,b.d,c.d) As "glScaled"
; glScalef_(a.f,b.f,c.f) As "glScalef"
; glSelectBuffer_(a.i,b.i) As "glSelectBuffer"
; glShadeModel_(a.i) As "glShadeModel"
; glTexCoord1d_(a.d) As "glTexCoord1d"
; glTexCoord1dv_(a.i) As "glTexCoord1dv"
; glTexCoord1f_(a.f) As "glTexCoord1f"
; glTexCoord1fv_(a.i) As "glTexCoord1fv"
; glTexCoord1i_(a.i) As "glTexCoord1i"
; glTexCoord1iv_(a.i) As "glTexCoord1iv"
; glTexCoord1s_(a.w) As "glTexCoord1s"
; glTexCoord1sv_(a.i) As "glTexCoord1sv"
; glTexCoord2d_(a.d,b.d) As "glTexCoord2d"
; glTexCoord2dv_(a.i) As "glTexCoord2dv"
; glTexCoord2f_(a.f,b.f) As "glTexCoord2f"
; glTexCoord2fv_(a.i) As "glTexCoord2fv"
; glTexCoord2i_(a.i,b.i) As "glTexCoord2i"
; glTexCoord2iv_(a.i) As "glTexCoord2iv"
; glTexCoord2s_(a.w,b.w) As "glTexCoord2s"
; glTexCoord2sv_(a.i) As "glTexCoord2sv"
; glTexCoord3d_(a.d,b.d,c.d) As "glTexCoord3d"
; glTexCoord3dv_(a.i) As "glTexCoord3dv"
; glTexCoord3f_(a.f,b.f,c.f) As "glTexCoord3f"
; glTexCoord3fv_(a.i) As "glTexCoord3fv"
; glTexCoord3i_(a.i,b.i,c.i) As "glTexCoord3i"
; glTexCoord3iv_(a.i) As "glTexCoord3iv"
; glTexCoord3s_(a.w,b.w,c.w) As "glTexCoord3s"
; glTexCoord3sv_(a.i) As "glTexCoord3sv"
; glTexCoord4d_(a.d,b.d,c.d,d.d) As "glTexCoord4d"
; glTexCoord4dv_(a.i) As "glTexCoord4dv"
; glTexCoord4f_(a.f,b.f,c.f,d.f) As "glTexCoord4f"
; glTexCoord4fv_(a.i) As "glTexCoord4fv"
; glTexCoord4i_(a.i,b.i,c.i,d.i) As "glTexCoord4i"
; glTexCoord4iv_(a.i) As "glTexCoord4iv"
; glTexCoord4s_(a.w,b.w,c.w,d.w) As "glTexCoord4s"
; glTexCoord4sv_(a.i) As "glTexCoord4sv"
; glTexCoordPointer_(a.i,b.i,c.i,d.i) As "glTexCoordPointer"
; glTexEnvf_(a.i,b.i,c.f) As "glTexEnvf"
; glTexEnvfv_(a.i,b.i,c.i) As "glTexEnvfv"
; glTexEnvi_(a.i,b.i,c.i) As "glTexEnvi"
; glTexEnviv_(a.i,b.i,c.i) As "glTexEnviv"
; glTexGend_(a.i,b.i,c.d) As "glTexGend"
; glTexGendv_(a.i,b.i,c.i) As "glTexGendv"
; glTexGenf_(a.i,b.i,c.f) As "glTexGenf"
; glTexGenfv_(a.i,b.i,c.i) As "glTexGenfv"
; glTexGeni_(a.i,b.i,c.i) As "glTexGeni"
; glTexGeniv_(a.i,b.i,c.i) As "glTexGeniv"
; glTranslated_(a.d,b.d,c.d) As "glTranslated"
; glTranslatef_(a.f,b.f,c.f) As "glTranslatef"
; glVertex2d_(a.d,b.d) As "glVertex2d"
; glVertex2dv_(a.i) As "glVertex2dv"
; glVertex2f_(a.f,b.f) As "glVertex2f"
; glVertex2fv_(a.i) As "glVertex2fv"
; glVertex2i_(a.i,b.i) As "glVertex2i"
; glVertex2iv_(a.i) As "glVertex2iv"
; glVertex2s_(a.w,b.w) As "glVertex2s"
; glVertex2sv_(a.i) As "glVertex2sv"
; glVertex3d_(a.d,b.d,c.d) As "glVertex3d"
; glVertex3dv_(a.i) As "glVertex3dv"
; glVertex3f_(a.f,b.f,c.f) As "glVertex3f"
; glVertex3fv_(a.i) As "glVertex3fv"
; glVertex3i_(a.i,b.i,c.i) As "glVertex3i"
; glVertex3iv_(a.i) As "glVertex3iv"
; glVertex3s_(a.w,b.w,c.w) As "glVertex3s"
; glVertex3sv_(a.i) As "glVertex3sv"
; glVertex4d_(a.d,b.d,c.d,d.d) As "glVertex4d"
; glVertex4dv_(a.i) As "glVertex4dv"
; glVertex4f_(a.f,b.f,c.f,d.f) As "glVertex4f"
; glVertex4fv_(a.i) As "glVertex4fv"
; glVertex4i_(a.i,b.i,c.i,d.i) As "glVertex4i"
; glVertex4iv_(a.i) As "glVertex4iv"
; glVertex4s_(a.w,b.w,c.w,d.w) As "glVertex4s"
; glVertex4sv_(a.i) As "glVertex4sv"
; glVertexPointer_(a.i,b.i,c.i,d.i) As "glVertexPointer"
; EndImport
; 
; 
; 
; Import "Glu32.lib"
; gluErrorString_(a.i) As "gluErrorString"
; gluErrorUnicodeStringEXT_(a.i) As "gluErrorUnicodeStringEXT"
; gluGetString_(a.i) As "gluGetString" 
; gluOrtho2D_(a.d,b.d,c.d,d.d) As "gluOrtho2D"
; gluPerspective_(a.d,b.d,c.d,d.d) As "gluPerspective"
; gluPickMatrix_(a.d,b.d,c.d,d.d,e) As "gluPickMatrix"
; gluLookAt_(a.d,b.d,c.d,d.d,e.d,f.d,g.d,h.d,i.d) As "gluLookAt"
; gluProject_(a.d,b.d,c.d,d,e,f,g.i,h.i,i.i) As "gluProject"
; gluUnProject_(a.d,b.d,c.d,d,e,f,g.i,h.i,i.i) As "gluUnProject"
; gluScaleImage_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i,i.i) As "gluScaleImage"
; gluBuild1DMipmaps_(a.i,b.i,c.i,d.i,e.i,f.i) As "gluBuild1DMipmaps"
; gluBuild2DMipmaps_(a.i,b.i,c.i,d.i,e.i,f.i,g.i) As "gluBuild2DMipmaps"   
; gluNewQuadric_() As "gluNewQuadric"
; gluDeleteQuadric_(a.i) As "gluDeleteQuadric"
; gluQuadricNormals_(a.i,b.i) As "gluQuadricNormals"
; gluQuadricTexture_(a.i,b.c) As "gluQuadricTexture"
; gluQuadricOrientation_(a.i,b.i) As "gluQuadricOrientation"
; gluQuadricDrawStyle_(a.i,b.i) As "gluQuadricDrawStyle"
; gluCylinder_(a.i,b.d,c.d,d.d,e.i,f.i) As "gluCylinder"
; gluDisk_(a.i,b.d,c.d,d.i,e.i) As "gluDisk"
; gluPartialDisk_(a.i,b.d,c.d,d.i,e.i,f.d,g.d) As "gluPartialDisk"
; gluSphere_(a.i,b.d,c.i,d.i) As "gluSphere"
; gluQuadricCallback_(a.i, b.i, c.i) As "gluQuadricCallback"
; gluNewTess_() As "gluNewTess"
; gluDeleteTess_(a.i) As "gluDeleteTess"
; gluTessBeginPolygon_(a.i,b.i) As "gluTessBeginPolygon"
; gluTessBeginContour_(a.i) As "gluTessBeginContour"
; gluTessVertex_(a.i,b,c.i) As "gluTessVertex"
; gluTessEndContour_(a.i) As "gluTessEndContour"
; gluTessEndPolygon_(a.i) As "gluTessEndPolygon"
; gluTessProperty_(a.i,b.i,c.d) As "gluTessProperty"
; gluTessNormal_(a.i,b.d,c.d,d.d) As "gluTessNormal"
; gluTessCallback_(a.i, b.i, c.i) As "gluTessCallback"
; gluGetTessProperty_(a.i,b.i,c.i) As "gluGetTessProperty" 
; gluNewNurbsRenderer_() As "gluNewNurbsRenderer"
; gluDeleteNurbsRenderer_(a.i) As "gluDeleteNurbsRenderer"
; gluBeginSurface_(a.i) As "gluBeginSurface"
; gluBeginCurve_(a.i) As "gluBeginCurve"
; gluEndCurve_(a.i) As "gluEndCurve"
; gluEndSurface_(a.i) As "gluEndSurface"
; gluBeginTrim_(a.i) As "gluBeginTrim"
; gluEndTrim_(a.i) As "gluEndTrim"
; gluPwlCurve_(a.i,b.i,c.i,d.i,e.i) As "gluPwlCurve"
; gluNurbsCurve_(a.i,b.i,c.i,d.i,e.i,f.i,g.i) As "gluNurbsCurve"
; gluNurbsSurface_(a.i,b.i,c.i,d.i,e.i,f.i,g.i,h.i,i.i,j.i,k.i) As "gluNurbsSurface"
; gluLoadSamplingMatrices_(a.i,b,c,d) As "gluLoadSamplingMatrices"
; gluNurbsProperty_(a.i,b.i,c.f) As "gluNurbsProperty"
; gluGetNurbsProperty_(a.i,b.i,c.i) As "gluGetNurbsProperty"
; gluNurbsCallback_(a.i, b.i, c.i) As "gluNurbsCallback"
; gluBeginPolygon_(a.i) As "gluBeginPolygon"
; gluNextContour_(a.i,b.i) As "gluNextContour"
; gluEndPolygon_(a.i) As "gluEndPolygon"
; EndImport
; 
; 
; 
; Import "Opengl32.lib" 
; wglGetProcAddress(s.p-ascii) As "wglGetProcAddress"
; wglUseFontBitmaps_(a.i,b.i,c.i,d.i) As "wglUseFontBitmapsW" 
; wglUseFontOutlines_(a.i,b.i,c.i,d.i,e.f,f.f,g.i,*p) As "wglUseFontOutlinesW" 
; EndImport 
; 
; CompilerEndIf
; 
; CompilerEndIf 
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
; 
; 
; 
; 
; Prototype glDrawRangeElements (mode, start, end_, count, type, indices) : Global glDrawRangeElements_.glDrawRangeElements
; Prototype glTexImage3D (target, level, internalformat, width, height, depth, border, format, type, pixels) : Global glTexImage3D_.glTexImage3D
; Prototype glTexSubImage3D (target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, pixels) : Global glTexSubImage3D_.glTexSubImage3D
; Prototype glCopyTexSubImage3D (target, level, xoffset, yoffset, zoffset, x, y, width, height) : Global glCopyTexSubImage3D_.glCopyTexSubImage3D
; 
; 
; Prototype glActiveTexture (texture) : Global glActiveTexture_.glActiveTexture
; Prototype glSampleCoverage (value.f, invert) : Global glSampleCoverage_.glSampleCoverage
; Prototype glCompressedTexImage3D (target, level, internalformat, width, height, depth, border, imageSize, *data_) : Global glCompressedTexImage3D_.glCompressedTexImage3D
; Prototype glCompressedTexImage2D (target, level, internalformat, width, height, border, imageSize, *data_) : Global glCompressedTexImage2D_.glCompressedTexImage2D
; Prototype glCompressedTexImage1D (target, level, internalformat, width, border, imageSize, *data_) : Global glCompressedTexImage1D_.glCompressedTexImage1D
; Prototype glCompressedTexSubImage3D (target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, *data_) : Global glCompressedTexSubImage3D_.glCompressedTexSubImage3D
; Prototype glCompressedTexSubImage2D (target, level, xoffset, yoffset, width, height, format, imageSize, *data_) : Global glCompressedTexSubImage2D_.glCompressedTexSubImage2D
; Prototype glCompressedTexSubImage1D (target, level, xoffset, width, format, imageSize, *data_) : Global glCompressedTexSubImage1D_.glCompressedTexSubImage1D
; Prototype glGetCompressedTexImage (target, level, img) : Global glGetCompressedTexImage_.glGetCompressedTexImage
; 
; 
; Prototype glClientActiveTexture (texture) : Global glClientActiveTexture_.glClientActiveTexture
; Prototype glMultiTexCoord1d (target, s.d) : Global glMultiTexCoord1d_.glMultiTexCoord1d
; Prototype glMultiTexCoord1dv (target, *v) : Global glMultiTexCoord1dv_.glMultiTexCoord1dv
; Prototype glMultiTexCoord1f (target, s.f) : Global glMultiTexCoord1f_.glMultiTexCoord1f
; Prototype glMultiTexCoord1fv (target, *v) : Global glMultiTexCoord1fv_.glMultiTexCoord1fv
; Prototype glMultiTexCoord1i (target, s) : Global glMultiTexCoord1i_.glMultiTexCoord1i
; Prototype glMultiTexCoord1iv (target, *v) : Global glMultiTexCoord1iv_.glMultiTexCoord1iv
; Prototype glMultiTexCoord1s (target, s) : Global glMultiTexCoord1s_.glMultiTexCoord1s
; Prototype glMultiTexCoord1sv (target, *v) : Global glMultiTexCoord1sv_.glMultiTexCoord1sv
; Prototype glMultiTexCoord2d (target, s.d, t.d) : Global glMultiTexCoord2d_.glMultiTexCoord2d
; Prototype glMultiTexCoord2dv (target, *v) : Global glMultiTexCoord2dv_.glMultiTexCoord2dv
; Prototype glMultiTexCoord2f (target, s.f, t.f) : Global glMultiTexCoord2f_.glMultiTexCoord2f
; Prototype glMultiTexCoord2fv (target, *v) : Global glMultiTexCoord2fv_.glMultiTexCoord2fv
; Prototype glMultiTexCoord2i (target, s, t) : Global glMultiTexCoord2i_.glMultiTexCoord2i
; Prototype glMultiTexCoord2iv (target, *v) : Global glMultiTexCoord2iv_.glMultiTexCoord2iv
; Prototype glMultiTexCoord2s (target, s, t) : Global glMultiTexCoord2s_.glMultiTexCoord2s
; Prototype glMultiTexCoord2sv (target, *v) : Global glMultiTexCoord2sv_.glMultiTexCoord2sv
; Prototype glMultiTexCoord3d (target, s.d, t.d, r.d) : Global glMultiTexCoord3d_.glMultiTexCoord3d
; Prototype glMultiTexCoord3dv (target, *v) : Global glMultiTexCoord3dv_.glMultiTexCoord3dv
; Prototype glMultiTexCoord3f (target, s.f, t.f, r.f) : Global glMultiTexCoord3f_.glMultiTexCoord3f
; Prototype glMultiTexCoord3fv (target, *v) : Global glMultiTexCoord3fv_.glMultiTexCoord3fv
; Prototype glMultiTexCoord3i (target, s, t, r) : Global glMultiTexCoord3i_.glMultiTexCoord3i
; Prototype glMultiTexCoord3iv (target, *v) : Global glMultiTexCoord3iv_.glMultiTexCoord3iv
; Prototype glMultiTexCoord3s (target, s, t, r) : Global glMultiTexCoord3s_.glMultiTexCoord3s
; Prototype glMultiTexCoord3sv (target, *v) : Global glMultiTexCoord3sv_.glMultiTexCoord3sv
; Prototype glMultiTexCoord4d (target, s.d, t.d, r.d, q.d) : Global glMultiTexCoord4d_.glMultiTexCoord4d
; Prototype glMultiTexCoord4dv (target, *v) : Global glMultiTexCoord4dv_.glMultiTexCoord4dv
; Prototype glMultiTexCoord4f (target, s.f, t.f, r.f, q.f) : Global glMultiTexCoord4f_.glMultiTexCoord4f
; Prototype glMultiTexCoord4fv (target, *v) : Global glMultiTexCoord4fv_.glMultiTexCoord4fv
; Prototype glMultiTexCoord4i (target, s, t, r, q) : Global glMultiTexCoord4i_.glMultiTexCoord4i
; Prototype glMultiTexCoord4iv (target, *v) : Global glMultiTexCoord4iv_.glMultiTexCoord4iv
; Prototype glMultiTexCoord4s (target, s, t, r, q) : Global glMultiTexCoord4s_.glMultiTexCoord4s
; Prototype glMultiTexCoord4sv (target, *v) : Global glMultiTexCoord4sv_.glMultiTexCoord4sv
; Prototype glLoadTransposeMatrixf (*m) : Global glLoadTransposeMatrixf_.glLoadTransposeMatrixf
; Prototype glLoadTransposeMatrixd (*m) : Global glLoadTransposeMatrixd_.glLoadTransposeMatrixd
; Prototype glMultTransposeMatrixf (*m) : Global glMultTransposeMatrixf_.glMultTransposeMatrixf
; Prototype glMultTransposeMatrixd (*m) : Global glMultTransposeMatrixd_.glMultTransposeMatrixd
; 
; 
; Prototype glBlendFuncSeparate (sfactorRGB, dfactorRGB, sfactorAlpha, dfactorAlpha) : Global glBlendFuncSeparate_.glBlendFuncSeparate
; Prototype glMultiDrawArrays (mode, *first, *count, primcount) : Global glMultiDrawArrays_.glMultiDrawArrays
; Prototype glMultiDrawElements (mode, *count, type, *indices, primcount) : Global glMultiDrawElements_.glMultiDrawElements
; Prototype glPointParameterf (pname, param.f) : Global glPointParameterf_.glPointParameterf
; Prototype glPointParameterfv (pname, *param) : Global glPointParameterfv_.glPointParameterfv
; Prototype glPointParameteri (pname, param) : Global glPointParameteri_.glPointParameteri
; Prototype glPointParameteriv (pname, *param) : Global glPointParameteriv_.glPointParameteriv
; Prototype glBlendColor (red.f, green.f, blue.f, alpha.f) : Global glBlendColor_.glBlendColor
; Prototype glBlendEquation (mode) : Global glBlendEquation_.glBlendEquation
; 
; 
; Prototype glFogCoordf (coord.f) : Global glFogCoordf_.glFogCoordf
; Prototype glFogCoordfv (*coord) : Global glFogCoordfv_.glFogCoordfv
; Prototype glFogCoordd (coord.d) : Global glFogCoordd_.glFogCoordd
; Prototype glFogCoorddv (*coord) : Global glFogCoorddv_.glFogCoorddv
; Prototype glFogCoordPointer (tpye, stride, *pointer) : Global glFogCoordPointer_.glFogCoordPointer
; Prototype glSecondaryColor3b (red, green, blue) : Global glSecondaryColor3b_.glSecondaryColor3b
; Prototype glSecondaryColor3bv (*v) : Global glSecondaryColor3bv_.glSecondaryColor3bv
; Prototype glSecondaryColor3d (reg.d, green.d, blue.d) : Global glSecondaryColor3d_.glSecondaryColor3d
; Prototype glSecondaryColor3dv (*v) : Global glSecondaryColor3dv_.glSecondaryColor3dv
; Prototype glSecondaryColor3f (red.f, green.f, blue.f) : Global glSecondaryColor3f_.glSecondaryColor3f
; Prototype glSecondaryColor3fv (*v) : Global glSecondaryColor3fv_.glSecondaryColor3fv
; Prototype glSecondaryColor3i (red, green, blue) : Global glSecondaryColor3i_.glSecondaryColor3i
; Prototype glSecondaryColor3iv (*v) : Global glSecondaryColor3iv_.glSecondaryColor3iv
; Prototype glSecondaryColor3s (red, green, blue) : Global glSecondaryColor3s_.glSecondaryColor3s
; Prototype glSecondaryColor3sv (*v) : Global glSecondaryColor3sv_.glSecondaryColor3sv
; Prototype glSecondaryColor3ub (red, green, blue) : Global glSecondaryColor3ub_.glSecondaryColor3ub
; Prototype glSecondaryColor3ubv (*v) : Global glSecondaryColor3ubv_.glSecondaryColor3ubv
; Prototype glSecondaryColor3ui (red, green, blue) : Global glSecondaryColor3ui_.glSecondaryColor3ui
; Prototype glSecondaryColor3uiv (*v) : Global glSecondaryColor3uiv_.glSecondaryColor3uiv
; Prototype glSecondaryColor3us (red, green, blue) : Global glSecondaryColor3us_.glSecondaryColor3us
; Prototype glSecondaryColor3usv (*v) : Global glSecondaryColor3usv_.glSecondaryColor3usv
; Prototype glSecondaryColorPointer (size, type, stride, *pointer) : Global glSecondaryColorPointer_.glSecondaryColorPointer
; Prototype glWindowPos2d (x.d, y.d) : Global glWindowPos2d_.glWindowPos2d
; Prototype glWindowPos2dv (*v) : Global glWindowPos2dv_.glWindowPos2dv
; Prototype glWindowPos2f (x.f, y.f) : Global glWindowPos2f_.glWindowPos2f
; Prototype glWindowPos2fv (*v) : Global glWindowPos2fv_.glWindowPos2fv
; Prototype glWindowPos2i (x, y) : Global glWindowPos2i_.glWindowPos2i
; Prototype glWindowPos2iv (*v) : Global glWindowPos2iv_.glWindowPos2iv
; Prototype glWindowPos2s (x, y) : Global glWindowPos2s_.glWindowPos2s
; Prototype glWindowPos2sv (*v) : Global glWindowPos2sv_.glWindowPos2sv
; Prototype glWindowPos3d (x.d, y.d, z.d) : Global glWindowPos3d_.glWindowPos3d
; Prototype glWindowPos3dv (*v) : Global glWindowPos3dv_.glWindowPos3dv
; Prototype glWindowPos3f (x.f, y.f, z.f) : Global glWindowPos3f_.glWindowPos3f
; Prototype glWindowPos3fv (*v) : Global glWindowPos3fv_.glWindowPos3fv
; Prototype glWindowPos3i (x, y, z) : Global glWindowPos3i_.glWindowPos3i
; Prototype glWindowPos3iv (*v) : Global glWindowPos3iv_.glWindowPos3iv
; Prototype glWindowPos3s (x, y, z) : Global glWindowPos3s_.glWindowPos3s
; Prototype glWindowPos3sv (*v) : Global glWindowPos3sv_.glWindowPos3sv
; 
; 
; Prototype glGenQueries (n, *ids) : Global glGenQueries_.glGenQueries
; Prototype glDeleteQueries (n,*ids) : Global glDeleteQueries_.glDeleteQueries
; Prototype glIsQuery (id) : Global glIsQuery_.glIsQuery
; Prototype glBeginQuery (target, id) : Global glBeginQuery_.glBeginQuery
; Prototype glEndQuery (target) : Global glEndQuery_.glEndQuery
; Prototype glGetQueryiv (target, pname, *params) : Global glGetQueryiv_.glGetQueryiv
; Prototype glGetQueryObjectiv (id, pname, *params) : Global glGetQueryObjectiv_.glGetQueryObjectiv
; Prototype glGetQueryObjectuiv (id, pname, *params) : Global glGetQueryObjectuiv_.glGetQueryObjectuiv
; Prototype glBindBuffer (target, buffer) : Global glBindBuffer_.glBindBuffer
; Prototype glDeleteBuffers (n, *buffers) : Global glDeleteBuffers_.glDeleteBuffers
; Prototype glGenBuffers (n, *buffers) : Global glGenBuffers_.glGenBuffers
; Prototype glIsBuffer (buffer) : Global glIsBuffer_.glIsBuffer
; Prototype glBufferData (target, size, *data_, usage) : Global glBufferData_.glBufferData
; Prototype glBufferSubData (target, offset, size, *data_) : Global glBufferSubData_.glBufferSubData
; Prototype glGetBufferSubData (target, offset, size, *data_) : Global glGetBufferSubData_.glGetBufferSubData
; Prototype glMapBuffer (target, access) : Global glMapBuffer_.glMapBuffer
; Prototype glUnmapBuffer (target) : Global glUnmapBuffer_.glUnmapBuffer
; Prototype glGetBufferParameteriv (target, pname, *params) : Global glGetBufferParameteriv_.glGetBufferParameteriv
; Prototype glGetBufferPointerv (target, pname, *params) : Global glGetBufferPointerv_.glGetBufferPointerv
; 
; 
; Prototype glBlendEquationSeparate (modeRGB, modeAlpha) : Global glBlendEquationSeparate_.glBlendEquationSeparate
; Prototype glDrawBuffers (n, *bufs) : Global glDrawBuffers_.glDrawBuffers
; Prototype glStencilOpSeparate (face, sfail, dpfail, dppass) : Global glStencilOpSeparate_.glStencilOpSeparate
; Prototype glStencilFuncSeparate (face, func, ref, mask) : Global glStencilFuncSeparate_.glStencilFuncSeparate
; Prototype glStencilMaskSeparate (face, mask) : Global glStencilMaskSeparate_.glStencilMaskSeparate
; Prototype glAttachShader (program, shader) : Global glAttachShader_.glAttachShader
; Prototype glBindAttribLocation (program, index, name.p-ascii) : Global glBindAttribLocation_.glBindAttribLocation
; Prototype glCompileShader (shader) : Global glCompileShader_.glCompileShader
; Prototype glCreateProgram () : Global glCreateProgram_.glCreateProgram
; Prototype glCreateShader  (type) : Global glCreateShader_.glCreateShader
; Prototype glDeleteProgram (program) : Global glDeleteProgram_.glDeleteProgram
; Prototype glDeleteShader (shader) : Global glDeleteShader_.glDeleteShader
; Prototype glDetachShader (program, shader) : Global glDetachShader_.glDetachShader
; Prototype glDisableVertexAttribArray (index) : Global glDisableVertexAttribArray_.glDisableVertexAttribArray
; Prototype glEnableVertexAttribArray (index) : Global glEnableVertexAttribArray_.glEnableVertexAttribArray
; Prototype glGetActiveAttrib (program, index, bufSize, *length, *size, *type, *name) : Global glGetActiveAttrib_.glGetActiveAttrib
; Prototype glGetActiveUniform (program, index, bufSize, *length, *size, *type, *name) : Global glGetActiveUniform_.glGetActiveUniform
; Prototype glGetAttachedShaders (program, maxCount, *count, *obj) : Global glGetAttachedShaders_.glGetAttachedShaders
; Prototype glGetAttribLocation (program, name.p-ascii) : Global glGetAttribLocation_.glGetAttribLocation
; Prototype glGetProgramiv (program, pname, *params) : Global glGetProgramiv_.glGetProgramiv
; Prototype glGetProgramInfoLog (program, bufSize, *length, *infoLog) : Global glGetProgramInfoLog_.glGetProgramInfoLog
; Prototype glGetShaderiv (shader, pname, *params) : Global glGetShaderiv_.glGetShaderiv
; Prototype glGetShaderInfoLog (shader, bufSize, *length, *infoLog) : Global glGetShaderInfoLog_.glGetShaderInfoLog
; Prototype glGetShaderSource (shader, bufSize, *length, *source) : Global glGetShaderSource_.glGetShaderSource
; Prototype glGetUniformLocation (program, name.p-ascii) : Global glGetUniformLocation_.glGetUniformLocation
; Prototype glGetUniformfv (program, location, *params) : Global glGetUniformfv_.glGetUniformfv
; Prototype glGetUniformiv (program, location, *params) : Global glGetUniformiv_.glGetUniformiv
; Prototype glGetVertexAttribdv (index, pname, *params) : Global glGetVertexAttribdv_.glGetVertexAttribdv
; Prototype glGetVertexAttribfv (index, pname, *params) : Global glGetVertexAttribfv_.glGetVertexAttribfv
; Prototype glGetVertexAttribiv (index, pname, *params) : Global glGetVertexAttribiv_.glGetVertexAttribiv
; Prototype glGetVertexAttribPointerv (index, pname, *pointer) : Global glGetVertexAttribPointerv_.glGetVertexAttribPointerv
; Prototype glIsProgram (program) : Global glIsProgram_.glIsProgram
; Prototype glIsShader (shader) : Global glIsShader_.glIsShader
; Prototype glLinkProgram (program) : Global glLinkProgram_.glLinkProgram
; Prototype glShaderSource (shader, count, *stringBuffer, *length) : Global glShaderSource_.glShaderSource
; Prototype glUseProgram (program) : Global glUseProgram_.glUseProgram
; Prototype glUniform1f (location, v0.f) : Global glUniform1f_.glUniform1f
; Prototype glUniform2f (location, v0.f, v1.f) : Global glUniform2f_.glUniform2f
; Prototype glUniform3f (location, v0.f, v1.f, v2.f) : Global glUniform3f_.glUniform3f
; Prototype glUniform4f (location, v0.f, v1.f, v2.f, v3.f) : Global glUniform4f_.glUniform4f
; Prototype glUniform1i (location, v0) : Global glUniform1i_.glUniform1i
; Prototype glUniform2i (location, v0, v1) : Global glUniform2i_.glUniform2i
; Prototype glUniform3i (location, v0, v1, v2) : Global glUniform3i_.glUniform3i
; Prototype glUniform4i (location, v0, v1, v2, v3) : Global glUniform4i_.glUniform4i
; Prototype glUniform1fv (location, count, *value) : Global glUniform1fv_.glUniform1fv
; Prototype glUniform2fv (location, count, *value) : Global glUniform2fv_.glUniform2fv
; Prototype glUniform3fv (location, count, *value) : Global glUniform3fv_.glUniform3fv
; Prototype glUniform4fv (location, count, *value) : Global glUniform4fv_.glUniform4fv
; Prototype glUniform1iv (location, count, *value) : Global glUniform1iv_.glUniform1iv
; Prototype glUniform2iv (location, count, *value) : Global glUniform2iv_.glUniform2iv
; Prototype glUniform3iv (location, count, *value) : Global glUniform3iv_.glUniform3iv
; Prototype glUniform4iv (location, count, *value) : Global glUniform4iv_.glUniform4iv
; Prototype glUniformMatrix2fv (location, count, transpose, *value) : Global glUniformMatrix2fv_.glUniformMatrix2fv
; Prototype glUniformMatrix3fv (location, count, transpose, *value) : Global glUniformMatrix3fv_.glUniformMatrix3fv
; Prototype glUniformMatrix4fv (location, count, transpose, *value) : Global glUniformMatrix4fv_.glUniformMatrix4fv
; Prototype glValidateProgram (program) : Global glValidateProgram_.glValidateProgram
; Prototype glVertexAttrib1d (index, x.d) : Global glVertexAttrib1d_.glVertexAttrib1d
; Prototype glVertexAttrib1dv (index, *v) : Global glVertexAttrib1dv_.glVertexAttrib1dv
; Prototype glVertexAttrib1f (index, x.f) : Global glVertexAttrib1f_.glVertexAttrib1f
; Prototype glVertexAttrib1fv (index, *v) : Global glVertexAttrib1fv_.glVertexAttrib1fv
; Prototype glVertexAttrib1s (index, x) : Global glVertexAttrib1s_.glVertexAttrib1s
; Prototype glVertexAttrib1sv (index, *v) : Global glVertexAttrib1sv_.glVertexAttrib1sv
; Prototype glVertexAttrib2d (index, x.d, y.d) : Global glVertexAttrib2d_.glVertexAttrib2d
; Prototype glVertexAttrib2dv (index, *v) : Global glVertexAttrib2dv_.glVertexAttrib2dv
; Prototype glVertexAttrib2f (index, x.f, y.f) : Global glVertexAttrib2f_.glVertexAttrib2f
; Prototype glVertexAttrib2fv (index, *v) : Global glVertexAttrib2fv_.glVertexAttrib2fv
; Prototype glVertexAttrib2s (index, x, y) : Global glVertexAttrib2s_.glVertexAttrib2s
; Prototype glVertexAttrib2sv (index, *v) : Global glVertexAttrib2sv_.glVertexAttrib2sv
; Prototype glVertexAttrib3d (index, x.d, y.d, z.d) : Global glVertexAttrib3d_.glVertexAttrib3d
; Prototype glVertexAttrib3dv (index, *v) : Global glVertexAttrib3dv_.glVertexAttrib3dv
; Prototype glVertexAttrib3f (index, x.f, y.f, z.f) : Global glVertexAttrib3f_.glVertexAttrib3f
; Prototype glVertexAttrib3fv (index, *v) : Global glVertexAttrib3fv_.glVertexAttrib3fv
; Prototype glVertexAttrib3s (index, x, y, z) : Global glVertexAttrib3s_.glVertexAttrib3s
; Prototype glVertexAttrib3sv (index, *v) : Global glVertexAttrib3sv_.glVertexAttrib3sv
; Prototype glVertexAttrib4Nbv (index, *v) : Global glVertexAttrib4Nbv_.glVertexAttrib4Nbv
; Prototype glVertexAttrib4Niv (index, *v) : Global glVertexAttrib4Niv_.glVertexAttrib4Niv
; Prototype glVertexAttrib4Nsv (index, *v) : Global glVertexAttrib4Nsv_.glVertexAttrib4Nsv
; Prototype glVertexAttrib4Nub (index, x, y, z, w) : Global glVertexAttrib4Nub_.glVertexAttrib4Nub
; Prototype glVertexAttrib4Nubv (index, *v) : Global glVertexAttrib4Nubv_.glVertexAttrib4Nubv
; Prototype glVertexAttrib4Nuiv (index, *v) : Global glVertexAttrib4Nuiv_.glVertexAttrib4Nuiv
; Prototype glVertexAttrib4Nusv (index, *v) : Global glVertexAttrib4Nusv_.glVertexAttrib4Nusv
; Prototype glVertexAttrib4bv (index, *v) : Global glVertexAttrib4bv_.glVertexAttrib4bv
; Prototype glVertexAttrib4d (index, x.d, y.d, z.d, w.d) : Global glVertexAttrib4d_.glVertexAttrib4d
; Prototype glVertexAttrib4dv (index, *v) : Global glVertexAttrib4dv_.glVertexAttrib4dv
; Prototype glVertexAttrib4f (index, x.f, y.f, z.f, w.f) : Global glVertexAttrib4f_.glVertexAttrib4f
; Prototype glVertexAttrib4fv (index, *v) : Global glVertexAttrib4fv_.glVertexAttrib4fv
; Prototype glVertexAttrib4iv (index, *v) : Global glVertexAttrib4iv_.glVertexAttrib4iv
; Prototype glVertexAttrib4s (index, x, y, z, w) : Global glVertexAttrib4s_.glVertexAttrib4s
; Prototype glVertexAttrib4sv (index, *v) : Global glVertexAttrib4sv_.glVertexAttrib4sv
; Prototype glVertexAttrib4ubv (index, *v) : Global glVertexAttrib4ubv_.glVertexAttrib4ubv
; Prototype glVertexAttrib4uiv (index, *v) : Global glVertexAttrib4uiv_.glVertexAttrib4uiv
; Prototype glVertexAttrib4usv (index, *v) : Global glVertexAttrib4usv_.glVertexAttrib4usv
; Prototype glVertexAttribPointer (index, size, type, normalized, stride, *pointer) : Global glVertexAttribPointer_.glVertexAttribPointer
; 
; 
; Prototype glUniformMatrix2x3fv (location, count, transpose, *value) : Global glUniformMatrix2x3fv_.glUniformMatrix2x3fv
; Prototype glUniformMatrix3x2fv (location, count, transpose, *value) : Global glUniformMatrix3x2fv_.glUniformMatrix3x2fv
; Prototype glUniformMatrix2x4fv (location, count, transpose, *value) : Global glUniformMatrix2x4fv_.glUniformMatrix2x4fv
; Prototype glUniformMatrix4x2fv (location, count, transpose, *value) : Global glUniformMatrix4x2fv_.glUniformMatrix4x2fv
; Prototype glUniformMatrix3x4fv (location, count, transpose, *value) : Global glUniformMatrix3x4fv_.glUniformMatrix3x4fv
; Prototype glUniformMatrix4x3fv (location, count, transpose, *value) : Global glUniformMatrix4x3fv_.glUniformMatrix4x3fv
; 
; 
; Prototype glColorMaski (index, r, g, b, a) : Global glColorMaski_.glColorMaski
; Prototype glGetBooleani_v (target, index, *data_) : Global glGetBooleani_v_.glGetBooleani_v
; Prototype glGetIntegeri_v (target, index, *data_) : Global glGetIntegeri_v_.glGetIntegeri_v
; Prototype glEnablei (target, index) : Global glEnablei_.glEnablei
; Prototype glDisablei (target, index) : Global glDisablei_.glDisablei
; Prototype glIsEnabledi (target, index) : Global glIsEnabledi_.glIsEnabledi
; Prototype glBeginTransformFeedback (primitiveMode) : Global glBeginTransformFeedback_.glBeginTransformFeedback
; Prototype glEndTransformFeedback () : Global glEndTransformFeedback_.glEndTransformFeedback
; Prototype glBindBufferRange (target, index, buffer, offset, size) : Global glBindBufferRange_.glBindBufferRange
; Prototype glBindBufferBase (target, index, buffer) : Global glBindBufferBase_.glBindBufferBase
; Prototype glTransformFeedbackVaryings (program, count, *varyings, bufferMode) : Global glTransformFeedbackVaryings_.glTransformFeedbackVaryings
; Prototype glGetTransformFeedbackVarying (program, index, bufSize, *length, *size, *type, *name) : Global glGetTransformFeedbackVarying_.glGetTransformFeedbackVarying
; Prototype glClampColor (target, clamp) : Global glClampColor_.glClampColor
; Prototype glBeginConditionalRender (id, mode) : Global glBeginConditionalRender_.glBeginConditionalRender
; Prototype glEndConditionalRender () : Global glEndConditionalRender_.glEndConditionalRender
; Prototype glVertexAttribIPointer (index, size, type, stride, *pointer) : Global glVertexAttribIPointer_.glVertexAttribIPointer
; Prototype glGetVertexAttribIiv (index, pname, *params) : Global glGetVertexAttribIiv_.glGetVertexAttribIiv
; Prototype glGetVertexAttribIuiv (index, pname, *params) : Global glGetVertexAttribIuiv_.glGetVertexAttribIuiv
; Prototype glVertexAttribI1i (index, x) : Global glVertexAttribI1i_.glVertexAttribI1i
; Prototype glVertexAttribI2i (index, x, y) : Global glVertexAttribI2i_.glVertexAttribI2i
; Prototype glVertexAttribI3i (index, x, y, z) : Global glVertexAttribI3i_.glVertexAttribI3i
; Prototype glVertexAttribI4i (index, x, y, z, w) : Global glVertexAttribI4i_.glVertexAttribI4i
; Prototype glVertexAttribI1ui (index, x) : Global glVertexAttribI1ui_.glVertexAttribI1ui
; Prototype glVertexAttribI2ui (index, x, y) : Global glVertexAttribI2ui_.glVertexAttribI2ui
; Prototype glVertexAttribI3ui (index, x, y, z) : Global glVertexAttribI3ui_.glVertexAttribI3ui
; Prototype glVertexAttribI4ui (index, x, y, z, w) : Global glVertexAttribI4ui_.glVertexAttribI4ui
; Prototype glVertexAttribI1iv (index, *v) : Global glVertexAttribI1iv_.glVertexAttribI1iv
; Prototype glVertexAttribI2iv (index, *v) : Global glVertexAttribI2iv_.glVertexAttribI2iv
; Prototype glVertexAttribI3iv (index, *v) : Global glVertexAttribI3iv_.glVertexAttribI3iv
; Prototype glVertexAttribI4iv (index, *v) : Global glVertexAttribI4iv_.glVertexAttribI4iv
; Prototype glVertexAttribI1uiv (index, *v) : Global glVertexAttribI1uiv_.glVertexAttribI1uiv
; Prototype glVertexAttribI2uiv (index, *v) : Global glVertexAttribI2uiv_.glVertexAttribI2uiv
; Prototype glVertexAttribI3uiv (index, *v) : Global glVertexAttribI3uiv_.glVertexAttribI3uiv
; Prototype glVertexAttribI4uiv (index, *v) : Global glVertexAttribI4uiv_.glVertexAttribI4uiv
; Prototype glVertexAttribI4bv (index, *v) : Global glVertexAttribI4bv_.glVertexAttribI4bv
; Prototype glVertexAttribI4sv (index, *v) : Global glVertexAttribI4sv_.glVertexAttribI4sv
; Prototype glVertexAttribI4ubv (index, *v) : Global glVertexAttribI4ubv_.glVertexAttribI4ubv
; Prototype glVertexAttribI4usv (index, *v) : Global glVertexAttribI4usv_.glVertexAttribI4usv
; Prototype glGetUniformuiv (program, location, *params) : Global glGetUniformuiv_.glGetUniformuiv
; Prototype glBindFragDataLocation (program, color, *name) : Global glBindFragDataLocation_.glBindFragDataLocation
; Prototype glGetFragDataLocation (program, *name) : Global glGetFragDataLocation_.glGetFragDataLocation
; Prototype glUniform1ui (location, v0) : Global glUniform1ui_.glUniform1ui
; Prototype glUniform2ui (location, v0, v1) : Global glUniform2ui_.glUniform2ui
; Prototype glUniform3ui (location, v0, v1, v2) : Global glUniform3ui_.glUniform3ui
; Prototype glUniform4ui (location, v0, v1, v2, v3) : Global glUniform4ui_.glUniform4ui
; Prototype glUniform1uiv (location, count, *value) : Global glUniform1uiv_.glUniform1uiv
; Prototype glUniform2uiv (location, count, *value) : Global glUniform2uiv_.glUniform2uiv
; Prototype glUniform3uiv (location, count, *value) : Global glUniform3uiv_.glUniform3uiv
; Prototype glUniform4uiv (location, count, *value) : Global glUniform4uiv_.glUniform4uiv
; Prototype glTexParameterIiv (target, pname, *params) : Global glTexParameterIiv_.glTexParameterIiv
; Prototype glTexParameterIuiv (target, pname, *params) : Global glTexParameterIuiv_.glTexParameterIuiv
; Prototype glGetTexParameterIiv (target, pname, *params) : Global glGetTexParameterIiv_.glGetTexParameterIiv
; Prototype glGetTexParameterIuiv (target, pname, *params) : Global glGetTexParameterIuiv_.glGetTexParameterIuiv
; Prototype glClearBufferiv (buffer, drawbuffer, *value) : Global glClearBufferiv_.glClearBufferiv
; Prototype glClearBufferuiv (buffer, drawbuffer, *value) : Global glClearBufferuiv_.glClearBufferuiv
; Prototype glClearBufferfv (buffer, drawbuffer, *value) : Global glClearBufferfv_.glClearBufferfv
; Prototype glClearBufferfi (buffer, drawbuffer, depth.f, stencil) : Global glClearBufferfi_.glClearBufferfi
; Prototype glGetStringi  (name, index) : Global glGetStringi_.glGetStringi
; Prototype glIsRenderbuffer (renderbuffer) : Global glIsRenderbuffer_.glIsRenderbuffer
; Prototype glBindRenderbuffer (target, renderbuffer) : Global glBindRenderbuffer_.glBindRenderbuffer
; Prototype glDeleteRenderbuffers (n, *renderbuffers) : Global glDeleteRenderbuffers_.glDeleteRenderbuffers
; Prototype glGenRenderbuffers (n, *renderbuffers) : Global glGenRenderbuffers_.glGenRenderbuffers
; Prototype glRenderbufferStorage (target, internalformat, width, height) : Global glRenderbufferStorage_.glRenderbufferStorage
; Prototype glGetRenderbufferParameteriv (target, pname, *params) : Global glGetRenderbufferParameteriv_.glGetRenderbufferParameteriv
; Prototype glIsFramebuffer (framebuffer) : Global glIsFramebuffer_.glIsFramebuffer
; Prototype glBindFramebuffer (target, framebuffer) : Global glBindFramebuffer_.glBindFramebuffer
; Prototype glDeleteFramebuffers (n, *framebuffers) : Global glDeleteFramebuffers_.glDeleteFramebuffers
; Prototype glGenFramebuffers (n, *framebuffers) : Global glGenFramebuffers_.glGenFramebuffers
; Prototype glCheckFramebufferStatus (target) : Global glCheckFramebufferStatus_.glCheckFramebufferStatus
; Prototype glFramebufferTexture1D (target, attachment, textarget, texture, level) : Global glFramebufferTexture1D_.glFramebufferTexture1D
; Prototype glFramebufferTexture2D (target, attachment, textarget, texture, level) : Global glFramebufferTexture2D_.glFramebufferTexture2D
; Prototype glFramebufferTexture3D (target, attachment, textarget, texture, level, zoffset) : Global glFramebufferTexture3D_.glFramebufferTexture3D
; Prototype glFramebufferRenderbuffer (target, attachment, renderbuffertarget, renderbuffer) : Global glFramebufferRenderbuffer_.glFramebufferRenderbuffer
; Prototype glGetFramebufferAttachmentParameteriv (target, attachment, pname, *params) : Global glGetFramebufferAttachmentParameteriv_.glGetFramebufferAttachmentParameteriv
; Prototype glGenerateMipmap (target) : Global glGenerateMipmap_.glGenerateMipmap
; Prototype glBlitFramebuffer (srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter) : Global glBlitFramebuffer_.glBlitFramebuffer
; Prototype glRenderbufferStorageMultisample (target, samples, internalformat, width, height) : Global glRenderbufferStorageMultisample_.glRenderbufferStorageMultisample
; Prototype glFramebufferTextureLayer (target, attachment, texture, level, layer) : Global glFramebufferTextureLayer_.glFramebufferTextureLayer
; Prototype glMapBufferRange (target, offset, length, access) : Global glMapBufferRange_.glMapBufferRange
; Prototype glFlushMappedBufferRange (target, offset, length) : Global glFlushMappedBufferRange_.glFlushMappedBufferRange
; Prototype glBindVertexArray (array_) : Global glBindVertexArray_.glBindVertexArray
; Prototype glDeleteVertexArrays (n, *arrays) : Global glDeleteVertexArrays_.glDeleteVertexArrays
; Prototype glGenVertexArrays (n, *arrays) : Global glGenVertexArrays_.glGenVertexArrays
; Prototype glIsVertexArray (array_) : Global glIsVertexArray_.glIsVertexArray
; 
; 
; Prototype glDrawArraysInstanced (mode, first, count, instancecount) : Global glDrawArraysInstanced_.glDrawArraysInstanced
; Prototype glDrawElementsInstanced (mode, count, type, *indices, instancecount) : Global glDrawElementsInstanced_.glDrawElementsInstanced
; Prototype glTexBuffer (target, internalformat, buffer) : Global glTexBuffer_.glTexBuffer
; Prototype glPrimitiveRestartIndex (index) : Global glPrimitiveRestartIndex_.glPrimitiveRestartIndex
; Prototype glCopyBufferSubData (readTarget, writeTarget, readOffset, writeOffset, size) : Global glCopyBufferSubData_.glCopyBufferSubData
; Prototype glGetUniformIndices (program, uniformCount, *uniformNames, *uniformIndices) : Global glGetUniformIndices_.glGetUniformIndices
; Prototype glGetActiveUniformsiv (program, uniformCount, *uniformIndices, pname, *params) : Global glGetActiveUniformsiv_.glGetActiveUniformsiv
; Prototype glGetActiveUniformName (program, uniformIndex, bufSize, *length, *uniformName) : Global glGetActiveUniformName_.glGetActiveUniformName
; Prototype glGetUniformBlockIndex (program, *uniformBlockName) : Global glGetUniformBlockIndex_.glGetUniformBlockIndex
; Prototype glGetActiveUniformBlockiv (program, uniformBlockIndex, pname, *params) : Global glGetActiveUniformBlockiv_.glGetActiveUniformBlockiv
; Prototype glGetActiveUniformBlockName (program, uniformBlockIndex, bufSize, *length, *uniformBlockName) : Global glGetActiveUniformBlockName_.glGetActiveUniformBlockName
; Prototype glUniformBlockBinding (program, uniformBlockIndex, uniformBlockBinding) : Global glUniformBlockBinding_.glUniformBlockBinding
; 
; 
; Prototype glDrawElementsBaseVertex (mode, count, type, *indices, basevertex) : Global glDrawElementsBaseVertex_.glDrawElementsBaseVertex
; Prototype glDrawRangeElementsBaseVertex (mode, start, end_, count, type, *indices, basevertex) : Global glDrawRangeElementsBaseVertex_.glDrawRangeElementsBaseVertex
; Prototype glDrawElementsInstancedBaseVertex (mode, count, type, *indices, instancecount, basevertex) : Global glDrawElementsInstancedBaseVertex_.glDrawElementsInstancedBaseVertex
; Prototype glMultiDrawElementsBaseVertex (mode, *count, type, *indices, drawcount, *basevertex) : Global glMultiDrawElementsBaseVertex_.glMultiDrawElementsBaseVertex
; Prototype glProvokingVertex (mode) : Global glProvokingVertex_.glProvokingVertex
; Prototype glFenceSync (condition, flags) : Global glFenceSync_.glFenceSync
; Prototype glIsSync (*sync) : Global glIsSync_.glIsSync
; Prototype glDeleteSync (*sync) : Global glDeleteSync_.glDeleteSync
; Prototype glClientWaitSync (*sync, flags, timeout.q) : Global glClientWaitSync_.glClientWaitSync
; Prototype glWaitSync (*sync, flags, timeout.q) : Global glWaitSync_.glWaitSync
; Prototype glGetInteger64v (pname, *data_) : Global glGetInteger64v_.glGetInteger64v
; Prototype glGetSynciv (*sync, pname, bufSize, *length, *values) : Global glGetSynciv_.glGetSynciv
; Prototype glGetInteger64i_v (target, index, *data_) : Global glGetInteger64i_v_.glGetInteger64i_v
; Prototype glGetBufferParameteri64v (target, pname, *params) : Global glGetBufferParameteri64v_.glGetBufferParameteri64v
; Prototype glFramebufferTexture (target, attachment, texture, level) : Global glFramebufferTexture_.glFramebufferTexture
; Prototype glTexImage2DMultisample (target, samples, internalformat, width, height, fixedsamplelocations) : Global glTexImage2DMultisample_.glTexImage2DMultisample
; Prototype glTexImage3DMultisample (target, samples, internalformat, width, height, depth, fixedsamplelocations) : Global glTexImage3DMultisample_.glTexImage3DMultisample
; Prototype glGetMultisamplefv (pname, index, *val) : Global glGetMultisamplefv_.glGetMultisamplefv
; Prototype glSampleMaski (maskNumber, mask) : Global glSampleMaski_.glSampleMaski
; 
; 
; Prototype glBindFragDataLocationIndexed (program, colorNumber, index, *name) : Global glBindFragDataLocationIndexed_.glBindFragDataLocationIndexed
; Prototype glGetFragDataIndex (program, *name) : Global glGetFragDataIndex_.glGetFragDataIndex
; Prototype glGenSamplers (count, *samplers) : Global glGenSamplers_.glGenSamplers
; Prototype glDeleteSamplers (count, *samplers) : Global glDeleteSamplers_.glDeleteSamplers
; Prototype glIsSampler (sampler) : Global glIsSampler_.glIsSampler
; Prototype glBindSampler (unit, sampler) : Global glBindSampler_.glBindSampler
; Prototype glSamplerParameteri (sampler, pname, param) : Global glSamplerParameteri_.glSamplerParameteri
; Prototype glSamplerParameteriv (sampler, pname, *param) : Global glSamplerParameteriv_.glSamplerParameteriv
; Prototype glSamplerParameterf (sampler, pname, param.f) : Global glSamplerParameterf_.glSamplerParameterf
; Prototype glSamplerParameterfv (sampler, pname, *param) : Global glSamplerParameterfv_.glSamplerParameterfv
; Prototype glSamplerParameterIiv (sampler, pname, *param) : Global glSamplerParameterIiv_.glSamplerParameterIiv
; Prototype glSamplerParameterIuiv (sampler, pname, *param) : Global glSamplerParameterIuiv_.glSamplerParameterIuiv
; Prototype glGetSamplerParameteriv (sampler, pname, *params) : Global glGetSamplerParameteriv_.glGetSamplerParameteriv
; Prototype glGetSamplerParameterIiv (sampler, pname, *params) : Global glGetSamplerParameterIiv_.glGetSamplerParameterIiv
; Prototype glGetSamplerParameterfv (sampler, pname, *params) : Global glGetSamplerParameterfv_.glGetSamplerParameterfv
; Prototype glGetSamplerParameterIuiv (sampler, pname, *params) : Global glGetSamplerParameterIuiv_.glGetSamplerParameterIuiv
; Prototype glQueryCounter (id, target) : Global glQueryCounter_.glQueryCounter
; Prototype glGetQueryObjecti64v (id, pname, *params) : Global glGetQueryObjecti64v_.glGetQueryObjecti64v
; Prototype glGetQueryObjectui64v (id, pname, *params) : Global glGetQueryObjectui64v_.glGetQueryObjectui64v
; Prototype glVertexAttribDivisor (index, divisor) : Global glVertexAttribDivisor_.glVertexAttribDivisor
; Prototype glVertexAttribP1ui (index, type, normalized, value) : Global glVertexAttribP1ui_.glVertexAttribP1ui
; Prototype glVertexAttribP1uiv (index, type, normalized, *value) : Global glVertexAttribP1uiv_.glVertexAttribP1uiv
; Prototype glVertexAttribP2ui (index, type, normalized, value) : Global glVertexAttribP2ui_.glVertexAttribP2ui
; Prototype glVertexAttribP2uiv (index, type, normalized, *value) : Global glVertexAttribP2uiv_.glVertexAttribP2uiv
; Prototype glVertexAttribP3ui (index, type, normalized, value) : Global glVertexAttribP3ui_.glVertexAttribP3ui
; Prototype glVertexAttribP3uiv (index, type, normalized, *value) : Global glVertexAttribP3uiv_.glVertexAttribP3uiv
; Prototype glVertexAttribP4ui (index, type, normalized, value) : Global glVertexAttribP4ui_.glVertexAttribP4ui
; Prototype glVertexAttribP4uiv (index, type, normalized, *value) : Global glVertexAttribP4uiv_.glVertexAttribP4uiv
; 
; 
; Prototype glMinSampleShading (value.f) : Global glMinSampleShading_.glMinSampleShading
; Prototype glBlendEquationi (buf, mode) : Global glBlendEquationi_.glBlendEquationi
; Prototype glBlendEquationSeparatei (buf, modeRGB, modeAlpha) : Global glBlendEquationSeparatei_.glBlendEquationSeparatei
; Prototype glBlendFunci (buf, src, dst) : Global glBlendFunci_.glBlendFunci
; Prototype glBlendFuncSeparatei (buf, srcRGB, dstRGB, srcAlpha, dstAlpha) : Global glBlendFuncSeparatei_.glBlendFuncSeparatei
; Prototype glDrawArraysIndirect (mode, *indirect) : Global glDrawArraysIndirect_.glDrawArraysIndirect
; Prototype glDrawElementsIndirect (mode, type, *indirect) : Global glDrawElementsIndirect_.glDrawElementsIndirect
; Prototype glUniform1d (location, x.d) : Global glUniform1d_.glUniform1d
; Prototype glUniform2d (location, x.d, y.d) : Global glUniform2d_.glUniform2d
; Prototype glUniform3d (location, x.d, y.d, z.d) : Global glUniform3d_.glUniform3d
; Prototype glUniform4d (location, x.d, y.d, z.d, w.d) : Global glUniform4d_.glUniform4d
; Prototype glUniform1dv (location, count, *value) : Global glUniform1dv_.glUniform1dv
; Prototype glUniform2dv (location, count, *value) : Global glUniform2dv_.glUniform2dv
; Prototype glUniform3dv (location, count, *value) : Global glUniform3dv_.glUniform3dv
; Prototype glUniform4dv (location, count, *value) : Global glUniform4dv_.glUniform4dv
; Prototype glUniformMatrix2dv (location, count, transpose, *value) : Global glUniformMatrix2dv_.glUniformMatrix2dv
; Prototype glUniformMatrix3dv (location, count, transpose, *value) : Global glUniformMatrix3dv_.glUniformMatrix3dv
; Prototype glUniformMatrix4dv (location, count, transpose, *value) : Global glUniformMatrix4dv_.glUniformMatrix4dv
; Prototype glUniformMatrix2x3dv (location, count, transpose, *value) : Global glUniformMatrix2x3dv_.glUniformMatrix2x3dv
; Prototype glUniformMatrix2x4dv (location, count, transpose, *value) : Global glUniformMatrix2x4dv_.glUniformMatrix2x4dv
; Prototype glUniformMatrix3x2dv (location, count, transpose, *value) : Global glUniformMatrix3x2dv_.glUniformMatrix3x2dv
; Prototype glUniformMatrix3x4dv (location, count, transpose, *value) : Global glUniformMatrix3x4dv_.glUniformMatrix3x4dv
; Prototype glUniformMatrix4x2dv (location, count, transpose, *value) : Global glUniformMatrix4x2dv_.glUniformMatrix4x2dv
; Prototype glUniformMatrix4x3dv (location, count, transpose, *value) : Global glUniformMatrix4x3dv_.glUniformMatrix4x3dv
; Prototype glGetUniformdv (program, location, *params) : Global glGetUniformdv_.glGetUniformdv
; Prototype glGetSubroutineUniformLocation (program, shadertype, *name) : Global glGetSubroutineUniformLocation_.glGetSubroutineUniformLocation
; Prototype glGetSubroutineIndex (program, shadertype, *name) : Global glGetSubroutineIndex_.glGetSubroutineIndex
; Prototype glGetActiveSubroutineUniformiv (program, shadertype, index, pname, *values) : Global glGetActiveSubroutineUniformiv_.glGetActiveSubroutineUniformiv
; Prototype glGetActiveSubroutineUniformName (program, shadertype, index, bufsize, *length, *name) : Global glGetActiveSubroutineUniformName_.glGetActiveSubroutineUniformName
; Prototype glGetActiveSubroutineName (program, shadertype, index, bufsize, *length, *name) : Global glGetActiveSubroutineName_.glGetActiveSubroutineName
; Prototype glUniformSubroutinesuiv (shadertype, count, *indices) : Global glUniformSubroutinesuiv_.glUniformSubroutinesuiv
; Prototype glGetUniformSubroutineuiv (shadertype, location, *params) : Global glGetUniformSubroutineuiv_.glGetUniformSubroutineuiv
; Prototype glGetProgramStageiv (program, shadertype, pname, *values) : Global glGetProgramStageiv_.glGetProgramStageiv
; Prototype glPatchParameteri (pname, value) : Global glPatchParameteri_.glPatchParameteri
; Prototype glPatchParameterfv (pname, *values) : Global glPatchParameterfv_.glPatchParameterfv
; Prototype glBindTransformFeedback (target, id) : Global glBindTransformFeedback_.glBindTransformFeedback
; Prototype glDeleteTransformFeedbacks (n, *ids) : Global glDeleteTransformFeedbacks_.glDeleteTransformFeedbacks
; Prototype glGenTransformFeedbacks (n, *ids) : Global glGenTransformFeedbacks_.glGenTransformFeedbacks
; Prototype glIsTransformFeedback (id) : Global glIsTransformFeedback_.glIsTransformFeedback
; Prototype glPauseTransformFeedback () : Global glPauseTransformFeedback_.glPauseTransformFeedback
; Prototype glResumeTransformFeedback () : Global glResumeTransformFeedback_.glResumeTransformFeedback
; Prototype glDrawTransformFeedback (mode, id) : Global glDrawTransformFeedback_.glDrawTransformFeedback
; Prototype glDrawTransformFeedbackStream (mode, id, stream) : Global glDrawTransformFeedbackStream_.glDrawTransformFeedbackStream
; Prototype glBeginQueryIndexed (target, index, id) : Global glBeginQueryIndexed_.glBeginQueryIndexed
; Prototype glEndQueryIndexed (target, index) : Global glEndQueryIndexed_.glEndQueryIndexed
; Prototype glGetQueryIndexediv (target, index, pname, *params) : Global glGetQueryIndexediv_.glGetQueryIndexediv
; 
; 
; Prototype glReleaseShaderCompiler () : Global glReleaseShaderCompiler_.glReleaseShaderCompiler
; Prototype glShaderBinary (count, *shaders, binaryformat, *binary, length) : Global glShaderBinary_.glShaderBinary
; Prototype glGetShaderPrecisionFormat (shadertype, precisiontype, *range, *precision) : Global glGetShaderPrecisionFormat_.glGetShaderPrecisionFormat
; Prototype glDepthRangef (n.f, f.f) : Global glDepthRangef_.glDepthRangef
; Prototype glClearDepthf (d.f) : Global glClearDepthf_.glClearDepthf
; Prototype glGetProgramBinary (program, bufSize, *length, *binaryFormat, *binary) : Global glGetProgramBinary_.glGetProgramBinary
; Prototype glProgramBinary (program, binaryFormat, *binary, length) : Global glProgramBinary_.glProgramBinary
; Prototype glProgramParameteri (program, pname, value) : Global glProgramParameteri_.glProgramParameteri
; Prototype glUseProgramStages (pipeline, stages, program) : Global glUseProgramStages_.glUseProgramStages
; Prototype glActiveShaderProgram (pipeline, program) : Global glActiveShaderProgram_.glActiveShaderProgram
; Prototype glCreateShaderProgramv (type, count, *strings) : Global glCreateShaderProgramv_.glCreateShaderProgramv
; Prototype glBindProgramPipeline (pipeline) : Global glBindProgramPipeline_.glBindProgramPipeline
; Prototype glDeleteProgramPipelines (n, *pipelines) : Global glDeleteProgramPipelines_.glDeleteProgramPipelines
; Prototype glGenProgramPipelines (n, *pipelines) : Global glGenProgramPipelines_.glGenProgramPipelines
; Prototype glIsProgramPipeline (pipeline) : Global glIsProgramPipeline_.glIsProgramPipeline
; Prototype glGetProgramPipelineiv (pipeline, pname, *params) : Global glGetProgramPipelineiv_.glGetProgramPipelineiv
; Prototype glProgramUniform1i (program, location, v0) : Global glProgramUniform1i_.glProgramUniform1i
; Prototype glProgramUniform1iv (program, location, count, *value) : Global glProgramUniform1iv_.glProgramUniform1iv
; Prototype glProgramUniform1f (program, location, v0.f) : Global glProgramUniform1f_.glProgramUniform1f
; Prototype glProgramUniform1fv (program, location, count, *value) : Global glProgramUniform1fv_.glProgramUniform1fv
; Prototype glProgramUniform1d (program, location, v0.d) : Global glProgramUniform1d_.glProgramUniform1d
; Prototype glProgramUniform1dv (program, location, count, *value) : Global glProgramUniform1dv_.glProgramUniform1dv
; Prototype glProgramUniform1ui (program, location, v0) : Global glProgramUniform1ui_.glProgramUniform1ui
; Prototype glProgramUniform1uiv (program, location, count, *value) : Global glProgramUniform1uiv_.glProgramUniform1uiv
; Prototype glProgramUniform2i (program, location, v0, v1) : Global glProgramUniform2i_.glProgramUniform2i
; Prototype glProgramUniform2iv (program, location, count, *value) : Global glProgramUniform2iv_.glProgramUniform2iv
; Prototype glProgramUniform2f (program, location, v0.f, v1.f) : Global glProgramUniform2f_.glProgramUniform2f
; Prototype glProgramUniform2fv (program, location, count, *value) : Global glProgramUniform2fv_.glProgramUniform2fv
; Prototype glProgramUniform2d (program, location, v0.d, v1.d) : Global glProgramUniform2d_.glProgramUniform2d
; Prototype glProgramUniform2dv (program, location, count, *value) : Global glProgramUniform2dv_.glProgramUniform2dv
; Prototype glProgramUniform2ui (program, location, v0, v1) : Global glProgramUniform2ui_.glProgramUniform2ui
; Prototype glProgramUniform2uiv (program, location, count, *value) : Global glProgramUniform2uiv_.glProgramUniform2uiv
; Prototype glProgramUniform3i (program, location, v0, v1, v2) : Global glProgramUniform3i_.glProgramUniform3i
; Prototype glProgramUniform3iv (program, location, count, *value) : Global glProgramUniform3iv_.glProgramUniform3iv
; Prototype glProgramUniform3f (program, location, v0.f, v1.f, v2.f) : Global glProgramUniform3f_.glProgramUniform3f
; Prototype glProgramUniform3fv (program, location, count, *value) : Global glProgramUniform3fv_.glProgramUniform3fv
; Prototype glProgramUniform3d (program, location, v0.d, v1.d, v2.d) : Global glProgramUniform3d_.glProgramUniform3d
; Prototype glProgramUniform3dv (program, location, count, *value) : Global glProgramUniform3dv_.glProgramUniform3dv
; Prototype glProgramUniform3ui (program, location, v0, v1, v2) : Global glProgramUniform3ui_.glProgramUniform3ui
; Prototype glProgramUniform3uiv (program, location, count, *value) : Global glProgramUniform3uiv_.glProgramUniform3uiv
; Prototype glProgramUniform4i (program, location, v0, v1, v2, v3) : Global glProgramUniform4i_.glProgramUniform4i
; Prototype glProgramUniform4iv (program, location, count, *value) : Global glProgramUniform4iv_.glProgramUniform4iv
; Prototype glProgramUniform4f (program, location, v0.f, v1.f, v2.f, v3.f) : Global glProgramUniform4f_.glProgramUniform4f
; Prototype glProgramUniform4fv (program, location, count, *value) : Global glProgramUniform4fv_.glProgramUniform4fv
; Prototype glProgramUniform4d (program, location, v0.d, v1.d, v2.d, v3.d) : Global glProgramUniform4d_.glProgramUniform4d
; Prototype glProgramUniform4dv (program, location, count, *value) : Global glProgramUniform4dv_.glProgramUniform4dv
; Prototype glProgramUniform4ui (program, location, v0, v1, v2, v3) : Global glProgramUniform4ui_.glProgramUniform4ui
; Prototype glProgramUniform4uiv (program, location, count, *value) : Global glProgramUniform4uiv_.glProgramUniform4uiv
; Prototype glProgramUniformMatrix2fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2fv_.glProgramUniformMatrix2fv
; Prototype glProgramUniformMatrix3fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3fv_.glProgramUniformMatrix3fv
; Prototype glProgramUniformMatrix4fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4fv_.glProgramUniformMatrix4fv
; Prototype glProgramUniformMatrix2dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2dv_.glProgramUniformMatrix2dv
; Prototype glProgramUniformMatrix3dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3dv_.glProgramUniformMatrix3dv
; Prototype glProgramUniformMatrix4dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4dv_.glProgramUniformMatrix4dv
; Prototype glProgramUniformMatrix2x3fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2x3fv_.glProgramUniformMatrix2x3fv
; Prototype glProgramUniformMatrix3x2fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3x2fv_.glProgramUniformMatrix3x2fv
; Prototype glProgramUniformMatrix2x4fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2x4fv_.glProgramUniformMatrix2x4fv
; Prototype glProgramUniformMatrix4x2fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4x2fv_.glProgramUniformMatrix4x2fv
; Prototype glProgramUniformMatrix3x4fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3x4fv_.glProgramUniformMatrix3x4fv
; Prototype glProgramUniformMatrix4x3fv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4x3fv_.glProgramUniformMatrix4x3fv
; Prototype glProgramUniformMatrix2x3dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2x3dv_.glProgramUniformMatrix2x3dv
; Prototype glProgramUniformMatrix3x2dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3x2dv_.glProgramUniformMatrix3x2dv
; Prototype glProgramUniformMatrix2x4dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix2x4dv_.glProgramUniformMatrix2x4dv
; Prototype glProgramUniformMatrix4x2dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4x2dv_.glProgramUniformMatrix4x2dv
; Prototype glProgramUniformMatrix3x4dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix3x4dv_.glProgramUniformMatrix3x4dv
; Prototype glProgramUniformMatrix4x3dv (program, location, count, transpose, *value) : Global glProgramUniformMatrix4x3dv_.glProgramUniformMatrix4x3dv
; Prototype glValidateProgramPipeline (pipeline) : Global glValidateProgramPipeline_.glValidateProgramPipeline
; Prototype glGetProgramPipelineInfoLog (pipeline, bufSize, *length, *infoLog) : Global glGetProgramPipelineInfoLog_.glGetProgramPipelineInfoLog
; Prototype glVertexAttribL1d (index, x.d) : Global glVertexAttribL1d_.glVertexAttribL1d
; Prototype glVertexAttribL2d (index, x.d, y.d) : Global glVertexAttribL2d_.glVertexAttribL2d
; Prototype glVertexAttribL3d (index, x.d, y.d, z.d) : Global glVertexAttribL3d_.glVertexAttribL3d
; Prototype glVertexAttribL4d (index, x.d, y.d, z.d, w.d) : Global glVertexAttribL4d_.glVertexAttribL4d
; Prototype glVertexAttribL1dv (index, *v) : Global glVertexAttribL1dv_.glVertexAttribL1dv
; Prototype glVertexAttribL2dv (index, *v) : Global glVertexAttribL2dv_.glVertexAttribL2dv
; Prototype glVertexAttribL3dv (index, *v) : Global glVertexAttribL3dv_.glVertexAttribL3dv
; Prototype glVertexAttribL4dv (index, *v) : Global glVertexAttribL4dv_.glVertexAttribL4dv
; Prototype glVertexAttribLPointer (index, size, type, stride, *pointer) : Global glVertexAttribLPointer_.glVertexAttribLPointer
; Prototype glGetVertexAttribLdv (index, pname, *params) : Global glGetVertexAttribLdv_.glGetVertexAttribLdv
; Prototype glViewportArrayv (first, count, *v) : Global glViewportArrayv_.glViewportArrayv
; Prototype glViewportIndexedf (index, x.f, y.f, w.f, h.f) : Global glViewportIndexedf_.glViewportIndexedf
; Prototype glViewportIndexedfv (index, *v) : Global glViewportIndexedfv_.glViewportIndexedfv
; Prototype glScissorArrayv (first, count, *v) : Global glScissorArrayv_.glScissorArrayv
; Prototype glScissorIndexed (index, left, bottom, width, height) : Global glScissorIndexed_.glScissorIndexed
; Prototype glScissorIndexedv (index, *v) : Global glScissorIndexedv_.glScissorIndexedv
; Prototype glDepthRangeArrayv (first, count, *v) : Global glDepthRangeArrayv_.glDepthRangeArrayv
; Prototype glDepthRangeIndexed (index, n.d, f.d) : Global glDepthRangeIndexed_.glDepthRangeIndexed
; Prototype glGetFloati_v (target, index, *data_) : Global glGetFloati_v_.glGetFloati_v
; Prototype glGetDoublei_v (target, index, *data_) : Global glGetDoublei_v_.glGetDoublei_v
; 
; 
; Prototype glDrawArraysInstancedBaseInstance (mode, first, count, instancecount, baseinstance) : Global glDrawArraysInstancedBaseInstance_.glDrawArraysInstancedBaseInstance
; Prototype glDrawElementsInstancedBaseInstance (mode, count, type, *indices, instancecount, baseinstance) : Global glDrawElementsInstancedBaseInstance_.glDrawElementsInstancedBaseInstance
; Prototype glDrawElementsInstancedBaseVertexBaseInstance (mode, count, type, *indices, instancecount, basevertex, baseinstance) : Global glDrawElementsInstancedBaseVertexBaseInstance_.glDrawElementsInstancedBaseVertexBaseInstance
; Prototype glGetActiveAtomicCounterBufferiv (program, bufferIndex, pname, *params) : Global glGetActiveAtomicCounterBufferiv_.glGetActiveAtomicCounterBufferiv
; Prototype glBindImageTexture (unit, texture, level, layered, layer, access, format) : Global glBindImageTexture_.glBindImageTexture
; Prototype glMemoryBarrier (barriers) : Global glMemoryBarrier_.glMemoryBarrier
; Prototype glTexStorage1D (target, levels, internalformat, width) : Global glTexStorage1D_.glTexStorage1D
; Prototype glTexStorage2D (target, levels, internalformat, width, height) : Global glTexStorage2D_.glTexStorage2D
; Prototype glTexStorage3D (target, levels, internalformat, width, height, depth) : Global glTexStorage3D_.glTexStorage3D
; Prototype glDrawTransformFeedbackInstanced (mode, id, instancecount) : Global glDrawTransformFeedbackInstanced_.glDrawTransformFeedbackInstanced
; Prototype glDrawTransformFeedbackStreamInstanced (mode, id, stream, instancecount) : Global glDrawTransformFeedbackStreamInstanced_.glDrawTransformFeedbackStreamInstanced
; 
; 
; Prototype glClearBufferData (target, internalformat, format, type, *data_) : Global glClearBufferData_.glClearBufferData
; Prototype glClearBufferSubData (target, internalformat, offset, size, format, type, *data_) : Global glClearBufferSubData_.glClearBufferSubData
; Prototype glDispatchCompute (num_groups_x, num_groups_y, num_groups_z) : Global glDispatchCompute_.glDispatchCompute
; Prototype glDispatchComputeIndirect (indirect) : Global glDispatchComputeIndirect_.glDispatchComputeIndirect
; Prototype glCopyImageSubData (srcName, srcTarget, srcLevel, srcX, srcY, srcZ, dstName, dstTarget, dstLevel, dstX, dstY, dstZ, srcWidth, srcHeight, srcDepth) : Global glCopyImageSubData_.glCopyImageSubData 
; Prototype glFramebufferParameteri (target, pname, param) : Global glFramebufferParameteri_.glFramebufferParameteri
; Prototype glGetFramebufferParameteriv (target, pname, *params) : Global glGetFramebufferParameteriv_.glGetFramebufferParameteriv
; Prototype glGetInternalformati64v (target, internalformat, pname, bufSize, *params) : Global glGetInternalformati64v_.glGetInternalformati64v
; Prototype glInvalidateTexSubImage (texture, level, xoffset, yoffset, zoffset, width, height, depth) : Global glInvalidateTexSubImage_.glInvalidateTexSubImage
; Prototype glInvalidateTexImage (texture, level) : Global glInvalidateTexImage_.glInvalidateTexImage
; Prototype glInvalidateBufferSubData (buffer, offset, length) : Global glInvalidateBufferSubData_.glInvalidateBufferSubData
; Prototype glInvalidateBufferData (buffer) : Global glInvalidateBufferData_.glInvalidateBufferData
; Prototype glInvalidateFramebuffer (target, numAttachments, *attachments) : Global glInvalidateFramebuffer_.glInvalidateFramebuffer
; Prototype glInvalidateSubFramebuffer (target, numAttachments, *attachments, x, y, width, height) : Global glInvalidateSubFramebuffer_.glInvalidateSubFramebuffer
; Prototype glMultiDrawArraysIndirect (mode, *indirect, drawcount, stride) : Global glMultiDrawArraysIndirect_.glMultiDrawArraysIndirect
; Prototype glMultiDrawElementsIndirect (mode, type, *indirect, drawcount, stride) : Global glMultiDrawElementsIndirect_.glMultiDrawElementsIndirect
; Prototype glGetProgramInterfaceiv (program, programInterface, pname, *params) : Global glGetProgramInterfaceiv_.glGetProgramInterfaceiv
; Prototype glGetProgramResourceIndex (program, programInterface, *name) : Global glGetProgramResourceIndex_.glGetProgramResourceIndex
; Prototype glGetProgramResourceName (program, programInterface, index, bufSize, *length, *name) : Global glGetProgramResourceName_.glGetProgramResourceName
; Prototype glGetProgramResourceiv (program, programInterface, index, propCount, *props, bufSize, *length, *params) : Global glGetProgramResourceiv_.glGetProgramResourceiv
; Prototype glGetProgramResourceLocation (program, programInterface, *name) : Global glGetProgramResourceLocation_.glGetProgramResourceLocation
; Prototype glGetProgramResourceLocationIndex (program, programInterface, *name) : Global glGetProgramResourceLocationIndex_.glGetProgramResourceLocationIndex
; Prototype glShaderStorageBlockBinding (program, storageBlockIndex, storageBlockBinding) : Global glShaderStorageBlockBinding_.glShaderStorageBlockBinding
; Prototype glTexBufferRange (target, internalformat, buffer, offset, size) : Global glTexBufferRange_.glTexBufferRange
; Prototype glTexStorage2DMultisample (target, samples, internalformat, width, height, fixedsamplelocations) : Global glTexStorage2DMultisample_.glTexStorage2DMultisample
; Prototype glTexStorage3DMultisample (target, samples, internalformat, width, height, depth, fixedsamplelocations) : Global glTexStorage3DMultisample_.glTexStorage3DMultisample
; Prototype glTextureView (texture, target, origtexture, internalformat, minlevel, numlevels, minlayer, numlayers) : Global glTextureView_.glTextureView
; Prototype glBindVertexBuffer (bindingindex, buffer, offset, stride) : Global glBindVertexBuffer_.glBindVertexBuffer
; Prototype glVertexAttribFormat (attribindex, size, type, normalized, relativeoffset) : Global glVertexAttribFormat_.glVertexAttribFormat
; Prototype glVertexAttribIFormat (attribindex, size, type, relativeoffset) : Global glVertexAttribIFormat_.glVertexAttribIFormat
; Prototype glVertexAttribLFormat (attribindex, size, type, relativeoffset) : Global glVertexAttribLFormat_.glVertexAttribLFormat
; Prototype glVertexAttribBinding (attribindex, bindingindex) : Global glVertexAttribBinding_.glVertexAttribBinding
; Prototype glVertexBindingDivisor (bindingindex, divisor) : Global glVertexBindingDivisor_.glVertexBindingDivisor
; Prototype glDebugMessageControl (source, type, severity, count, *ids, enabled) : Global glDebugMessageControl_.glDebugMessageControl
; Prototype glDebugMessageInsert (source, type, id, severity, length, *buf) : Global glDebugMessageInsert_.glDebugMessageInsert
; Prototype glDebugMessageCallback (*callback, *userParam) : Global glDebugMessageCallback_.glDebugMessageCallback
; Prototype glGetDebugMessageLog (count, bufSize, *sources, *types, *ids, *severities, *lengths, *messageLog) : Global glGetDebugMessageLog_.glGetDebugMessageLog
; Prototype glPushDebugGroup (source, id, length, *message) : Global glPushDebugGroup_.glPushDebugGroup
; Prototype glPopDebugGroup () : Global glPopDebugGroup_.glPopDebugGroup
; Prototype glObjectLabel (identifier, name, length, *label) : Global glObjectLabel_.glObjectLabel
; Prototype glGetObjectLabel (identifier, name, bufSize, *length, *label) : Global glGetObjectLabel_.glGetObjectLabel
; Prototype glObjectPtrLabel (*ptr, length, *label) : Global glObjectPtrLabel_.glObjectPtrLabel
; Prototype glGetObjectPtrLabel (*ptr, bufSize, *length, *label) : Global glGetObjectPtrLabel_.glGetObjectPtrLabel
; 
; 
; Prototype glBufferStorage (target, size, *data_, flags) : Global glBufferStorage_.glBufferStorage
; Prototype glClearTexImage (texture, level, format, type, *data_) : Global glClearTexImage_.glClearTexImage
; Prototype glClearTexSubImage (texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, *data_) : Global glClearTexSubImage_.glClearTexSubImage
; Prototype glBindBuffersBase (target, first, count, *buffers) : Global glBindBuffersBase_.glBindBuffersBase
; Prototype glBindBuffersRange (target, first, count, *buffers, *offsets, *sizes) : Global glBindBuffersRange_.glBindBuffersRange
; Prototype glBindTextures (first, count, *textures) : Global glBindTextures_.glBindTextures
; Prototype glBindSamplers (first, count, *samplers) : Global glBindSamplers_.glBindSamplers
; Prototype glBindImageTextures (first, count, *textures) : Global glBindImageTextures_.glBindImageTextures
; Prototype glBindVertexBuffers (first, count, *buffers, *offsets, *strides) : Global glBindVertexBuffers_.glBindVertexBuffers
; 
; 
; Prototype glClipControl (origin, depth) : Global glClipControl_.glClipControl
; Prototype glCreateTransformFeedbacks (n, *ids) : Global glCreateTransformFeedbacks_.glCreateTransformFeedbacks
; Prototype glTransformFeedbackBufferBase (xfb, index, buffer) : Global glTransformFeedbackBufferBase_.glTransformFeedbackBufferBase
; Prototype glTransformFeedbackBufferRange (xfb, index, buffer, *offset, size) : Global glTransformFeedbackBufferRange_.glTransformFeedbackBufferRange
; Prototype glGetTransformFeedbackiv (xfb, pname, *param) : Global glGetTransformFeedbackiv_.glGetTransformFeedbackiv
; Prototype glGetTransformFeedbacki_v (xfb, pname, index, *param) : Global glGetTransformFeedbacki_v_.glGetTransformFeedbacki_v
; Prototype glGetTransformFeedbacki64_v (xfb, pname, index, *param) : Global glGetTransformFeedbacki64_v_.glGetTransformFeedbacki64_v
; Prototype glCreateBuffers (n, *buffers) : Global glCreateBuffers_.glCreateBuffers
; Prototype glNamedBufferStorage (buffer, size, *data_, flags) : Global glNamedBufferStorage_.glNamedBufferStorage
; Prototype glNamedBufferData (buffer, size, *data_, usage) : Global glNamedBufferData_.glNamedBufferData
; Prototype glNamedBufferSubData (buffer, *offset, size, *data_) : Global glNamedBufferSubData_.glNamedBufferSubData
; Prototype glCopyNamedBufferSubData (readBuffer, writeBuffer, *readOffset, *writeOffset, size) : Global glCopyNamedBufferSubData_.glCopyNamedBufferSubData
; Prototype glClearNamedBufferData (buffer, internalformat, format, type, *data_) : Global glClearNamedBufferData_.glClearNamedBufferData
; Prototype glClearNamedBufferSubData (buffer, internalformat, *offset, size, format, type, *data_) : Global glClearNamedBufferSubData_.glClearNamedBufferSubData
; Prototype glMapNamedBuffer (buffer, access) : Global glMapNamedBuffer_.glMapNamedBuffer
; Prototype glMapNamedBufferRange (buffer, *offset, length, access) : Global glMapNamedBufferRange_.glMapNamedBufferRange
; Prototype glUnmapNamedBuffer (buffer) : Global glUnmapNamedBuffer_.glUnmapNamedBuffer
; Prototype glFlushMappedNamedBufferRange (buffer, *offset, length) : Global glFlushMappedNamedBufferRange_.glFlushMappedNamedBufferRange
; Prototype glGetNamedBufferParameteriv (buffer, pname, *params) : Global glGetNamedBufferParameteriv_.glGetNamedBufferParameteriv
; Prototype glGetNamedBufferParameteri64v (buffer, pname, *params) : Global glGetNamedBufferParameteri64v_.glGetNamedBufferParameteri64v
; Prototype glGetNamedBufferPointerv (buffer, pname, *params) : Global glGetNamedBufferPointerv_.glGetNamedBufferPointerv
; Prototype glGetNamedBufferSubData (buffer, *offset, size, *data_) : Global glGetNamedBufferSubData_.glGetNamedBufferSubData
; Prototype glCreateFramebuffers (n, *framebuffers) : Global glCreateFramebuffers_.glCreateFramebuffers
; Prototype glNamedFramebufferRenderbuffer (framebuffer, attachment, renderbuffertarget, renderbuffer) : Global glNamedFramebufferRenderbuffer_.glNamedFramebufferRenderbuffer
; Prototype glNamedFramebufferParameteri (framebuffer, pname, param) : Global glNamedFramebufferParameteri_.glNamedFramebufferParameteri
; Prototype glNamedFramebufferTexture (framebuffer, attachment, texture, level) : Global glNamedFramebufferTexture_.glNamedFramebufferTexture
; Prototype glNamedFramebufferTextureLayer (framebuffer, attachment, texture, level, layer) : Global glNamedFramebufferTextureLayer_.glNamedFramebufferTextureLayer
; Prototype glNamedFramebufferDrawBuffer (framebuffer, buf) : Global glNamedFramebufferDrawBuffer_.glNamedFramebufferDrawBuffer
; Prototype glNamedFramebufferDrawBuffers (framebuffer, n, *bufs) : Global glNamedFramebufferDrawBuffers_.glNamedFramebufferDrawBuffers
; Prototype glNamedFramebufferReadBuffer (framebuffer, src) : Global glNamedFramebufferReadBuffer_.glNamedFramebufferReadBuffer
; Prototype glInvalidateNamedFramebufferData (framebuffer, numAttachments, *attachments) : Global glInvalidateNamedFramebufferData_.glInvalidateNamedFramebufferData
; Prototype glInvalidateNamedFramebufferSubData (framebuffer, numAttachments, *attachments, x, y, width, height) : Global glInvalidateNamedFramebufferSubData_.glInvalidateNamedFramebufferSubData
; Prototype glClearNamedFramebufferiv (framebuffer, buffer, drawbuffer, *value) : Global glClearNamedFramebufferiv_.glClearNamedFramebufferiv
; Prototype glClearNamedFramebufferuiv (framebuffer, buffer, drawbuffer, *value) : Global glClearNamedFramebufferuiv_.glClearNamedFramebufferuiv
; Prototype glClearNamedFramebufferfv (framebuffer, buffer, drawbuffer, *value) : Global glClearNamedFramebufferfv_.glClearNamedFramebufferfv
; Prototype glClearNamedFramebufferfi (framebuffer, buffer, depth.f, stencil) : Global glClearNamedFramebufferfi_.glClearNamedFramebufferfi
; Prototype glBlitNamedFramebuffer (readFramebuffer, drawFramebuffer, srcX0, srcY0, srcX1, srcY1, dstX0, dstY0, dstX1, dstY1, mask, filter) : Global glBlitNamedFramebuffer_.glBlitNamedFramebuffer
; Prototype glCheckNamedFramebufferStatus (framebuffer, target) : Global glCheckNamedFramebufferStatus_.glCheckNamedFramebufferStatus
; Prototype glGetNamedFramebufferParameteriv (framebuffer, pname, *param) : Global glGetNamedFramebufferParameteriv_.glGetNamedFramebufferParameteriv
; Prototype glGetNamedFramebufferAttachmentParameteriv (framebuffer, attachment, pname, *params) : Global glGetNamedFramebufferAttachmentParameteriv_.glGetNamedFramebufferAttachmentParameteriv
; Prototype glCreateRenderbuffers (n, *renderbuffers) : Global glCreateRenderbuffers_.glCreateRenderbuffers
; Prototype glNamedRenderbufferStorage (renderbuffer, internalformat, width, height) : Global glNamedRenderbufferStorage_.glNamedRenderbufferStorage
; Prototype glNamedRenderbufferStorageMultisample (renderbuffer, samples, internalformat, width, height) : Global glNamedRenderbufferStorageMultisample_.glNamedRenderbufferStorageMultisample
; Prototype glGetNamedRenderbufferParameteriv (renderbuffer, pname, *params) : Global glGetNamedRenderbufferParameteriv_.glGetNamedRenderbufferParameteriv
; Prototype glCreateTextures (target, n, *textures) : Global glCreateTextures_.glCreateTextures
; Prototype glTextureBuffer (texture, internalformat, buffer) : Global glTextureBuffer_.glTextureBuffer
; Prototype glTextureBufferRange (texture, internalformat, buffer, *offset, size) : Global glTextureBufferRange_.glTextureBufferRange
; Prototype glTextureStorage1D (texture, levels, internalformat, width) : Global glTextureStorage1D_.glTextureStorage1D
; Prototype glTextureStorage2D (texture, levels, internalformat, width, height) : Global glTextureStorage2D_.glTextureStorage2D
; Prototype glTextureStorage3D (texture, levels, internalformat, width, height, depth) : Global glTextureStorage3D_.glTextureStorage3D
; Prototype glTextureStorage2DMultisample (texture, samples, internalformat, width, height, fixedsamplelocations) : Global glTextureStorage2DMultisample_.glTextureStorage2DMultisample
; Prototype glTextureStorage3DMultisample (texture, samples, internalformat, width, height, depth, fixedsamplelocations) : Global glTextureStorage3DMultisample_.glTextureStorage3DMultisample
; Prototype glTextureSubImage1D (texture, level, xoffset, width, format, type, *pixels) : Global glTextureSubImage1D_.glTextureSubImage1D
; Prototype glTextureSubImage2D (texture, level, xoffset, yoffset, width, height, format, type, *pixels) : Global glTextureSubImage2D_.glTextureSubImage2D
; Prototype glTextureSubImage3D (texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, *pixels) : Global glTextureSubImage3D_.glTextureSubImage3D
; Prototype glCompressedTextureSubImage1D (texture, level, xoffset, width, format, imageSize, *data_) : Global glCompressedTextureSubImage1D_.glCompressedTextureSubImage1D
; Prototype glCompressedTextureSubImage2D (texture, level, xoffset, yoffset, width, height, format, imageSize, *data_) : Global glCompressedTextureSubImage2D_.glCompressedTextureSubImage2D
; Prototype glCompressedTextureSubImage3D (texture, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, *data_) : Global glCompressedTextureSubImage3D_.glCompressedTextureSubImage3D
; Prototype glCopyTextureSubImage1D (texture, level, xoffset, x, y, width) : Global glCopyTextureSubImage1D_.glCopyTextureSubImage1D
; Prototype glCopyTextureSubImage2D (texture, level, xoffset, yoffset, x, y, width, height) : Global glCopyTextureSubImage2D_.glCopyTextureSubImage2D
; Prototype glCopyTextureSubImage3D (texture, level, xoffset, yoffset, zoffset, x, y, width, height) : Global glCopyTextureSubImage3D_.glCopyTextureSubImage3D
; Prototype glTextureParameterf (texture, pname, param.f) : Global glTextureParameterf_.glTextureParameterf
; Prototype glTextureParameterfv (texture, pname, *param) : Global glTextureParameterfv_.glTextureParameterfv
; Prototype glTextureParameteri (texture, pname, param) : Global glTextureParameteri_.glTextureParameteri
; Prototype glTextureParameterIiv (texture, pname, *params) : Global glTextureParameterIiv_.glTextureParameterIiv
; Prototype glTextureParameterIuiv (texture, pname, *params) : Global glTextureParameterIuiv_.glTextureParameterIuiv
; Prototype glTextureParameteriv (texture, pname, *param) : Global glTextureParameteriv_.glTextureParameteriv
; Prototype glGenerateTextureMipmap (texture) : Global glGenerateTextureMipmap_.glGenerateTextureMipmap
; Prototype glBindTextureUnit (unit, texture) : Global glBindTextureUnit_.glBindTextureUnit
; Prototype glGetTextureImage (texture, level, format, type, bufSize, *pixels) : Global glGetTextureImage_.glGetTextureImage
; Prototype glGetCompressedTextureImage (texture, level, bufSize, *pixels) : Global glGetCompressedTextureImage_.glGetCompressedTextureImage
; Prototype glGetTextureLevelParameterfv (texture, level, pname, *params) : Global glGetTextureLevelParameterfv_.glGetTextureLevelParameterfv
; Prototype glGetTextureLevelParameteriv (texture, level, pname, *params) : Global glGetTextureLevelParameteriv_.glGetTextureLevelParameteriv
; Prototype glGetTextureParameterfv (texture, pname, *params) : Global glGetTextureParameterfv_.glGetTextureParameterfv
; Prototype glGetTextureParameterIiv (texture, pname, *params) : Global glGetTextureParameterIiv_.glGetTextureParameterIiv
; Prototype glGetTextureParameterIuiv (texture, pname, *params) : Global glGetTextureParameterIuiv_.glGetTextureParameterIuiv
; Prototype glGetTextureParameteriv (texture, pname, *params) : Global glGetTextureParameteriv_.glGetTextureParameteriv
; Prototype glCreateVertexArrays (n, *arrays) : Global glCreateVertexArrays_.glCreateVertexArrays
; Prototype glDisableVertexArrayAttrib (vaobj, index) : Global glDisableVertexArrayAttrib_.glDisableVertexArrayAttrib
; Prototype glEnableVertexArrayAttrib (vaobj, index) : Global glEnableVertexArrayAttrib_.glEnableVertexArrayAttrib
; Prototype glVertexArrayElementBuffer (vaobj, buffer) : Global glVertexArrayElementBuffer_.glVertexArrayElementBuffer
; Prototype glVertexArrayVertexBuffer (vaobj, bindingindex, buffer, *offset, stride) : Global glVertexArrayVertexBuffer_.glVertexArrayVertexBuffer
; Prototype glVertexArrayVertexBuffers (vaobj, first, count, *buffers, *offsets, *strides) : Global glVertexArrayVertexBuffers_.glVertexArrayVertexBuffers
; Prototype glVertexArrayAttribBinding (vaobj, attribindex, bindingindex) : Global glVertexArrayAttribBinding_.glVertexArrayAttribBinding
; Prototype glVertexArrayAttribFormat (vaobj, attribindex, size, type, normalized, relativeoffset) : Global glVertexArrayAttribFormat_.glVertexArrayAttribFormat
; Prototype glVertexArrayAttribIFormat (vaobj, attribindex, size, type, relativeoffset) : Global glVertexArrayAttribIFormat_.glVertexArrayAttribIFormat
; Prototype glVertexArrayAttribLFormat (vaobj, attribindex, size, type, relativeoffset) : Global glVertexArrayAttribLFormat_.glVertexArrayAttribLFormat
; Prototype glVertexArrayBindingDivisor (vaobj, bindingindex, divisor) : Global glVertexArrayBindingDivisor_.glVertexArrayBindingDivisor
; Prototype glGetVertexArrayiv (vaobj, pname, *param) : Global glGetVertexArrayiv_.glGetVertexArrayiv
; Prototype glGetVertexArrayIndexediv (vaobj, index, pname, *param) : Global glGetVertexArrayIndexediv_.glGetVertexArrayIndexediv
; Prototype glGetVertexArrayIndexed64iv (vaobj, index, pname, *param) : Global glGetVertexArrayIndexed64iv_.glGetVertexArrayIndexed64iv
; Prototype glCreateSamplers (n, *samplers) : Global glCreateSamplers_.glCreateSamplers
; Prototype glCreateProgramPipelines (n, *pipelines) : Global glCreateProgramPipelines_.glCreateProgramPipelines
; Prototype glCreateQueries (target, n, *ids) : Global glCreateQueries_.glCreateQueries
; Prototype glGetQueryBufferObjecti64v (id, buffer, pname, *offset) : Global glGetQueryBufferObjecti64v_.glGetQueryBufferObjecti64v
; Prototype glGetQueryBufferObjectiv (id, buffer, pname, *offset) : Global glGetQueryBufferObjectiv_.glGetQueryBufferObjectiv
; Prototype glGetQueryBufferObjectui64v (id, buffer, pname, *offset) : Global glGetQueryBufferObjectui64v_.glGetQueryBufferObjectui64v
; Prototype glGetQueryBufferObjectuiv (id, buffer, pname, *offset) : Global glGetQueryBufferObjectuiv_.glGetQueryBufferObjectuiv
; Prototype glMemoryBarrierByRegion (barriers) : Global glMemoryBarrierByRegion_.glMemoryBarrierByRegion
; Prototype glGetTextureSubImage (texture, level, xoffset, yoffset, zoffset, width, height, depth, format, type, bufSize, *pixels) : Global glGetTextureSubImage_.glGetTextureSubImage
; Prototype glGetCompressedTextureSubImage (texture, level, xoffset, yoffset, zoffset, width, height, depth, bufSize, *pixels) : Global glGetCompressedTextureSubImage_.glGetCompressedTextureSubImage
; Prototype glGetGraphicsResetStatus () : Global glGetGraphicsResetStatus_.glGetGraphicsResetStatus
; Prototype glGetnCompressedTexImage (target, lod, bufSize, *pixels) : Global glGetnCompressedTexImage_.glGetnCompressedTexImage
; Prototype glGetnTexImage (target, level, format, type, bufSize, *pixels) : Global glGetnTexImage_.glGetnTexImage
; Prototype glGetnUniformdv (program, location, bufSize, *params) : Global glGetnUniformdv_.glGetnUniformdv
; Prototype glGetnUniformfv (program, location, bufSize, *params) : Global glGetnUniformfv_.glGetnUniformfv
; Prototype glGetnUniformiv (program, location, bufSize, *params) : Global glGetnUniformiv_.glGetnUniformiv
; Prototype glGetnUniformuiv (program, location, bufSize, *params) : Global glGetnUniformuiv_.glGetnUniformuiv
; Prototype glReadnPixels (x, y, width, height, format, type, bufSize, *data_) : Global glReadnPixels_.glReadnPixels
; Prototype glGetnMapdv (target, query, bufSize, *v) : Global glGetnMapdv_.glGetnMapdv
; Prototype glGetnMapfv (target, query, bufSize, *v) : Global glGetnMapfv_.glGetnMapfv
; Prototype glGetnMapiv (target, query, bufSize, *v) : Global glGetnMapiv_.glGetnMapiv
; Prototype glGetnPixelMapfv (Map, bufSize, *values) : Global glGetnPixelMapfv_.glGetnPixelMapfv
; Prototype glGetnPixelMapuiv (Map, bufSize, *values) : Global glGetnPixelMapuiv_.glGetnPixelMapuiv
; Prototype glGetnPixelMapusv (Map, bufSize, *values) : Global glGetnPixelMapusv_.glGetnPixelMapusv
; Prototype glGetnPolygonStipple (bufSize, *pattern) : Global glGetnPolygonStipple_.glGetnPolygonStipple
; Prototype glGetnColorTable (target, format, type, bufSize, *table) : Global glGetnColorTable_.glGetnColorTable
; Prototype glGetnConvolutionFilter (target, format, type, bufSize, *image) : Global glGetnConvolutionFilter_.glGetnConvolutionFilter
; Prototype glGetnSeparableFilter (target, format, type, rowBufSize, *row, columnBufSize, *column, *span) : Global glGetnSeparableFilter_.glGetnSeparableFilter
; Prototype glGetnHistogram (target, reset, format, type, bufSize, *values) : Global glGetnHistogram_.glGetnHistogram
; Prototype glGetnMinmax (target, reset, format, type, bufSize, *values) : Global glGetnMinmax_.glGetnMinmax
; Prototype glTextureBarrier () : Global glTextureBarrier_.glTextureBarrier
; 
; 
; 
; Prototype glSpecializeShader (shader, *pEntryPoint, numSpecializationConstants, *pConstantIndex, *pConstantValue) : Global glSpecializeShader_.glSpecializeShader
; Prototype glMultiDrawArraysIndirectCount (mode, *indirect, *drawcount, maxdrawcount, stride) : Global glMultiDrawArraysIndirectCount_.glMultiDrawArraysIndirectCount
; Prototype glMultiDrawElementsIndirectCount (mode, type, *indirect, *drawcount, maxdrawcount, stride) : Global glMultiDrawElementsIndirectCount_.glMultiDrawElementsIndirectCount
; Prototype glPolygonOffsetClamp (factor.f, units.f, clamp.f) : Global glPolygonOffsetClamp_.glPolygonOffsetClamp
; EndDeclareModule
; 
; Module gl
; 
; EndModule
; 
; XIncludeFile "gl/glLoad.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; XIncludeFile "gl.pbi"
; 
; DeclareModule glLoad
; Declare     GetContextVersion (*major, *minor) 
; Declare.i   Deprecated() 
; Declare     GetProcsCount (*ImportedProcsCount.Integer, *MissingProcsCount.Integer) 
; Declare.s   GetErrString() 
; Declare     RegisterCallBack (type, *fp) 
; Declare.i   Load() 
; 
; Prototype.i  Proto_GetProcAddress (func$)
; Prototype.i  Proto_EnumerateProcs (glver$, func$, *func)
; 
; #CallBack_GetProcAddress = 0
; #CallBack_EnumFuncs = 1   
; EndDeclareModule
; 
; Module glLoad
; 
; EnableExplicit
; 
; UseModule gl
; 
; Declare.i   GPA (func$)
; Declare     ClearGlErrors()
; 
; 
; #MAX_OPENGL_SUPPORTED = 460
; 
; Structure GLLOAD_OBJ
; glver$
; ErrMsg$
; MissingProcsCount.i
; ImportedProcsCount.i
; CallBack_GetProcAddress.Proto_GetProcAddress
; CallBack_EnumerateProcs.Proto_EnumerateProcs
; EndStructure : Global GLLOAD.GLLOAD_OBJ
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; 
; 
; XIncludeFile "inc/dbg.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; DeclareModule dbg
; 
; CompilerIf Defined(MACRO_DQ, #PB_Constant) = 0
; Macro DQ
; #MACRO_DQ = 1 
; CompilerEndIf
; 
; Macro ASSERT_START
; 
; Macro ASSERT_END
; 
; Macro ASSERT (exp)
; 
; Macro ASSERT_FAIL (text)
; 
; Macro DBG_TEXT (text, interval = 0)
; 
; Macro DBG_TEXT_IF (text, exp, interval = 0)
; 
; Macro DBG_TEXT_ONCE (text)
; 
; CompilerIf (#PB_Compiler_Debugger = 1)
; 
; EndDeclareModule
; 
; Module dbg
; 
; 
; 
; CompilerIf (#PB_Compiler_Debugger = 1)
; 
; EndModule
; 
; 
; XIncludeFile "inc/vec2.pb"
; DeclareModule vec2
; 
; EnableExplicit
; 
; Structure vec2 
; float.f[0]
; x.f
; y.f
; EndStructure
; 
; Declare     Set (*Vector.vec2, x.f, y.f) 
; Declare     Dump (*Vector.vec2, decimals = 2) 
; Declare     Zero (*Vector.vec2) 
; Declare.i   IsZero (*Vector.vec2) 
; Declare     SetFromPoints (*Vector.vec2, *PointA.vec2, *PointB.vec2) 
; Declare     Copy (*Vector.vec2, *DestinationVector.vec2) 
; Declare     Add (*VectorA.vec2, *VectorB.vec2, *SumVector.vec2) 
; Declare     Sub (*VectorA.vec2, *VectorB.vec2, *DiffVector.vec2) 
; Declare.f   Length (*Vector.vec2) 
; Declare.f   LengthSquared (*Vector.vec2) 
; Declare.f   Distance (*PointA.vec2, *PointB.vec2) 
; Declare     Negate (*Vector.vec2, *NegatedVector.vec2) 
; Declare     Normalize (*Vector.vec2, *UnitVector.vec2) 
; Declare     Scale (*Vector.vec2, scalar.f, *ScaledVector.vec2) 
; Declare.f   DotProduct (*VectorA.vec2, *VectorB.vec2) 
; Declare.f   Angle (*VectorA.vec2, *VectorB.vec2) 
; Declare.f   Colinearity (*VectorA.vec2, *VectorB.vec2) 
; 
; Declare     PointAlongVector (*PointA.vec2, *PointB.vec2, distance.f, *PointAlong.vec2) 
; Declare.f   Projection (*VectorA.vec2, *VectorB.vec2) 
; Declare     Reflect (*VectorA.vec2, *VectorB.vec2, *ReflectedVector.vec2) 
; Declare     Rotate (*Vector.vec2, angle.f, *RotatedVector.vec2) 
; Declare     TransformLocalToWorld (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointLocal.vec2, *PointWorld.vec2) 
; Declare     TransformWorldToLocal (*Origin.vec2, *AxisX.vec2, *AxisY.vec2, *PointWorld.vec2, *PointLocal.vec2) 
; 
; EndDeclareModule
; 
; Module vec2
; 
; #ONE_DEG_IN_RAD = 2* #PI / 360
; #ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; 
; CompilerIf #PB_Compiler_IsMainFile
; XIncludeFile "inc/vec3.pb"
; DeclareModule vec3
; 
; EnableExplicit
; 
; Structure vec3
; float.f[0]
; x.f
; y.f
; z.f
; EndStructure
; 
; 
; Declare     Set (*Vector.vec3, x.f, y.f, z.f) 
; Declare     Dump (*Vector.vec3, desc$ = "") 
; Declare     Zero (*Vector.vec3) 
; Declare.i   IsZero (*Vector.vec3) 
; Declare     SetFromPoints (*Vector.vec3, *PointA.vec3, *PointB.vec3) 
; Declare     Copy (*Vector.vec3, *DestinationVector.vec3) 
; Declare     Add (*VectorA.vec3, *VectorB.vec3, *SumVector.vec3) 
; Declare     Sub (*VectorA.vec3, *VectorB.vec3, *DiffVector.vec3) 
; Declare.f   Length (*Vector.vec3) 
; Declare.f   LengthSquared (*Vector.vec3) 
; Declare.f   Distance (*PointA.vec3, *PointB.vec3) 
; Declare     Negate (*Vector.vec3, *NegatedVector.vec3) 
; Declare     Normalize (*Vector.vec3, *UnitVector.vec3) 
; Declare     Scale (*Vector.vec3, scalar.f, *ScaledVector.vec3) 
; Declare.f   DotProduct (*VectorA.vec3, *VectorB.vec3) 
; Declare     CrossProduct (*VectorA.vec3, *VectorB.vec3, *CrossVector.vec3)
; Declare.f   Angle (*VectorA.vec3, *VectorB.vec3) 
; Declare.f   Colinearity (*VectorA.vec3, *VectorB.vec3) 
; Declare     PointAlongVector (*PointA.vec3, *PointB.vec3, distance.f, *PointAlong.vec3) 
; 
; EndDeclareModule
; 
; Module vec3
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; XIncludeFile "inc/vec4.pb"
; DeclareModule vec4
; 
; EnableExplicit
; 
; Structure vec4
; float.f[0]
; x.f
; y.f
; z.f
; w.f
; EndStructure
; 
; Declare     Set (*Vector.vec4, x.f, y.f, z.f, w.f) 
; Declare     Dump (*Vector.vec4, decimals = 2) 
; Declare     Zero (*Vector.vec4) 
; Declare.i   IsZero (*Vector.vec4) 
; Declare     Copy (*Vector.vec4, *DestinationVector.vec4) 
; Declare     Add (*VectorA.vec4, *VectorB.vec4, *SumVector.vec4) 
; Declare     Sub (*VectorA.vec4, *VectorB.vec4, *DiffVector.vec4) 
; Declare.f   Length (*Vector.vec4) 
; Declare.f   LengthSquared (*Vector.vec4) 
; Declare     Normalize (*Vector.vec4, *UnitVector.vec4) 
; Declare     Scale (*Vector.vec4, scalar.f, *ScaledVector.vec4) 
; 
; EndDeclareModule
; 
; Module vec4
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; XIncludeFile "inc/m4x4.pb"
; XIncludeFile "math.pb"
; XIncludeFile "vec3.pb"
; XIncludeFile "vec4.pb"
; 
; DeclareModule m4x4
; 
; EnableExplicit
; 
; 
; 
; 
; 
; 
; 
; 
; Structure m4x4
; float.f[0]
; 
; Xx.f 
; Xy.f 
; Xz.f 
; Xw.f 
; 
; Yx.f 
; Yy.f 
; Yz.f 
; Yw.f 
; 
; Zx.f 
; Zy.f 
; Zz.f 
; Zw.f 
; 
; Tx.f 
; Ty.f 
; Tz.f 
; Tw.f 
; EndStructure
; 
; Declare   SetRow0 (*Matrix.m4x4, Xx.f, Yx.f, Zx.f, Tx,f) 
; Declare   SetRow1 (*Matrix.m4x4, Xy.f, Yy.f, Zy.f, Ty,f) 
; Declare   SetRow2 (*Matrix.m4x4, Xz.f, Yz.f, Zz.f, Tz.f) 
; Declare   SetRow3 (*Matrix.m4x4, Xw.f, Yw.f, Zw.f, Tw.f) 
; Declare   Dump (*Matrix.m4x4, desc$ = "") 
; Declare   Identity (*IdentityMatrix.m4x4) 
; Declare   Zero (*ZeroMatrix.m4x4) 
; Declare   Copy (*Matrix.m4x4, *DestinationMatrix.m4x4) 
; Declare   Transpose (*Matrix.m4x4, *TransposedMatrix.m4x4) 
; Declare   Multiply (*MatrixA.m4x4, *MatrixB.m4x4, *MultipliedMatrix.m4x4) 
; Declare   MultiplyByVec (*Matrix.m4x4, *Vector.vec4::vec4, *TransformedVector.vec4::vec4) 
; Declare   Translate (*TranslatedMatrix.m4x4, *Vector.vec3::vec3) 
; Declare   TranslateXYZ (*TranslatedMatrix.m4x4, x.f, y.f, z.f) 
; Declare   Scale (*ScaledMatrix.m4x4, *Vector.vec3::vec3) 
; Declare   ScaleXYZ (*ScaledMatrix.m4x4, x.f, y.f, z.f) 
; Declare   RotateX (*RotatedMatrix.m4x4, angle.f) 
; Declare   RotateY (*RotatedMatrix.m4x4, angle.f) 
; Declare   RotateZ (*RotatedMatrix.m4x4, angle.f) 
; Declare   Perspective (*PerspectiveMatrix.m4x4, fovy.f, aspect.f, near.f, far.f) 
; Declare   Ortho (*OrthoMatrix.m4x4, left.f, right.f, bottom.f, top.f, near.f, far.f) 
; Declare   LookAt (*ViewMatrix.m4x4, *eye.vec3::vec3, *target.vec3::vec3, *up.vec3::vec3) 
; 
; EndDeclareModule
; 
; Module m4x4
; 
; #ONE_DEG_IN_RAD = 2* #PI / 360
; #ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; CompilerIf #PB_Compiler_IsMainFile
; 
; 
; 
; XIncludeFile "inc/quat.pb"
; XIncludeFile "m4x4.pb"
; XIncludeFile "vec3.pb"
; 
; DeclareModule quat
; 
; EnableExplicit
; 
; Structure quat
; float.f[0] 
; q0.f 
; q1.f 
; q2.f 
; q3.f 
; EndStructure
; 
; Declare   Set (*Quat.quat, q0.f, q1.f, q2.f, q3.f) 
; Declare   Dump (*Quat.quat, decimals = 2) 
; Declare   Copy (*Quat.quat, *DestinationQuat.quat) 
; Declare   Conjugate (*Quat.quat, *ConjugateQuat.quat) 
; Declare   Normalize (*Quat.quat, *UnitQuat.quat) 
; Declare   Multiply (*QuatA.quat, *QuatB.quat, *MultipliedQuat.quat)
; Declare   Versor (*Quat.quat, *Axis.vec3::vec3, angle.f) 
; Declare   Identity (*Quat.quat) 
; Declare   GetMatrix (*Quat.quat, *Destinationmatrix.m4x4::m4x4) 
; Declare   RotateVec (*Vector.vec3::vec3,  *RotationAxis.vec3::vec3, angle.f, *RotatedVector.vec3::vec3) 
; 
; EndDeclareModule
; 
; Module quat
; #ONE_DEG_IN_RAD = 2* #PI / 360
; #ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; CompilerIf #PB_Compiler_IsMainFile
; 
; 
; 
; 
; UseModule gl 
; 
; UseModule dbg 
; 
; DeclareModule sgl
; 
; EnableExplicit
; 
; #SGL_MAJOR = 0
; #SGL_MINOR = 6
; #SGL_REVISION = 0
; 
; 
; 
; Prototype CallBack_Error (Source$, Desc$)
; Prototype CallBack_WindowClose (win)
; Prototype CallBack_WindowPos (win, x, y)
; Prototype CallBack_WindowSize (win, width, height)
; Prototype CallBack_WindowFocus (win, focused)
; Prototype CallBack_WindowMinimize (win, minimized)
; Prototype CallBack_WindowMaximize (win, maximized)
; Prototype CallBack_WindowFrameBufferSize (win, width, height)
; Prototype CallBack_WindowRefresh (win)
; Prototype CallBack_WindowScroll (win, x_offset.d, y_offset.d)
; Prototype CallBack_Key (win, key, scancode, action, mods)
; Prototype CallBack_Char (win, char)
; Prototype CallBack_CursorPos (win, x.d, y.d)
; Prototype CallBack_CursorEntering (win, entering)
; Prototype CallBack_MouseButton (win, button, action, mods)
; 
; Macro RGBA (r, g, b, a)
; 
; Macro RGB (r, g, b)
; 
; Macro BGRA (b, g, r, a)
; 
; Macro BGR (b, g, r)
; 
; Macro StartData()
; 
; Macro StopData()
; 
; 
; 
; Structure RGB 
; byte.a[0] 
; r.a
; g.a
; b.a
; EndStructure
; 
; Structure RGBA 
; byte.a[0] 
; r.a 
; g.a
; b.a
; a.a
; EndStructure
; 
; Structure BGR 
; byte.a[0] 
; b.a
; g.a
; r.a
; EndStructure
; 
; Structure BGRA 
; byte.a[0] 
; b.a
; g.a
; r.a
; a.a
; EndStructure
; 
; Structure VideoMode
; width.i 
; height.i
; depth.i 
; freq.i 
; EndStructure
; 
; Structure IconData
; width.l 
; height.l 
; *pixels 
; EndStructure
; 
; Structure TexelData
; imageWidth.i 
; imageHeight.i 
; imageDepth.i 
; imageFormat .i 
; internalTextureFormat.i 
; length.i 
; *pixels 
; EndStructure
; 
; Structure GlyphData
; char.i 
; x.i 
; y.i 
; w.i 
; h.i 
; xOffset.i 
; EndStructure
; 
; Structure BitmapFontRange
; firstChar.i 
; lastChar.i 
; Array Glyphs.GlyphData(0) 
; EndStructure
; 
; Structure BitmapFontData
; fontName$ 
; fontSize.i 
; image.i 
; italic.i 
; bold.i 
; yOffset.i 
; block.GlyphData 
; Array ranges.BitmapFontRange(0) 
; EndStructure
; 
; Structure ShaderObjects
; List shader.i() 
; EndStructure
; 
; #DONT_CARE = glfw::#GLFW_DONT_CARE
; 
; 
; 
; Enumeration 
; #CALLBACK_WINDOW_CLOSE
; #CALLBACK_WINDOW_POS
; #CALLBACK_WINDOW_SIZE
; #CALLBACK_WINDOW_FOCUS
; #CALLBACK_WINDOW_MINIMIZE
; #CALLBACK_WINDOW_MAXIMIZE
; #CALLBACK_WINDOW_FRAMEBUFFER_SIZE
; #CALLBACK_WINDOW_REFRESH
; #CALLBACK_WINDOW_SCROLL
; #CALLBACK_KEY
; #CALLBACK_CHAR
; #CALLBACK_CURSOR_POS
; #CALLBACK_CURSOR_ENTERING
; #CALLBACK_MOUSE_BUTTON
; EndEnumeration
; 
; 
; 
; Enumeration
; #DEBUG_OUPUT_NOTIFICATIONS
; #DEBUG_OUPUT_LOW 
; #DEBUG_OUPUT_MEDIUM
; #DEBUG_OUPUT_HIGH
; EndEnumeration
; 
; 
; 
; Enumeration
; #PROFILE_ANY = 1
; #PROFILE_COMPATIBLE 
; #PROFILE_CORE 
; EndEnumeration
; 
; 
; 
; Enumeration 1
; #HINT_WIN_OPENGL_DEBUG 
; #HINT_WIN_OPENGL_MAJOR 
; #HINT_WIN_OPENGL_MINOR 
; #HINT_WIN_OPENGL_DEPTH_BUFFER 
; #HINT_WIN_OPENGL_STENCIL_BITS 
; #HINT_WIN_OPENGL_ACCUMULATOR_BITS 
; #HINT_WIN_OPENGL_SAMPLES 
; 
; #HINT_WIN_OPENGL_PROFILE 
; #HINT_WIN_OPENGL_FORWARD_COMPATIBLE 
; #HINT_WIN_VISIBLE 
; #HINT_WIN_RESIZABLE 
; #HINT_WIN_MAXIMIZED 
; #HINT_WIN_DECORATED 
; #HINT_WIN_TOPMOST 
; #HINT_WIN_FOCUSED 
; #HINT_WIN_CENTERED_CURSOR 
; #HINT_WIN_AUTO_MINIMIZE 
; #HINT_WIN_FRAMEBUFFER_DEPTH  
; #HINT_WIN_FRAMEBUFFER_TRANSPARENT  
; #HINT_WIN_REFRESH_RATE 
; EndEnumeration
; 
; 
; 
; #PRESSED    = glfw::#GLFW_PRESS
; #RELEASED   = glfw::#GLFW_RELEASE
; #REPEATING  = glfw::#GLFW_REPEAT
; 
; 
; 
; #KEY_MOD_SHIFT   = glfw::#GLFW_MOD_SHIFT
; #KEY_MOD_CONTROL = glfw::#GLFW_MOD_CONTROL
; #KEY_MOD_ALT     = glfw::#GLFW_MOD_ALT  
; #KEY_MOD_SUPER   = glfw::#GLFW_MOD_SUPER
; 
; 
; 
; #CURSOR_NORMAL   = glfw::#GLFW_CURSOR_NORMAL 
; #CURSOR_HIDDEN   = glfw::#GLFW_CURSOR_HIDDEN 
; #CURSOR_DISABLED = glfw::#GLFW_CURSOR_DISABLED 
; 
; 
; 
; Enumeration 
; #MOUSE_BUTTON_1 = glfw::#GLFW_MOUSE_BUTTON_1
; #MOUSE_BUTTON_2
; #MOUSE_BUTTON_3
; #MOUSE_BUTTON_4
; #MOUSE_BUTTON_5
; #MOUSE_BUTTON_6
; #MOUSE_BUTTON_7
; #MOUSE_BUTTON_8
; 
; #MOUSE_BUTTON_LEFT   = #MOUSE_BUTTON_1
; #MOUSE_BUTTON_RIGHT  = #MOUSE_BUTTON_2
; #MOUSE_BUTTON_MIDDLE = #MOUSE_BUTTON_3
; EndEnumeration 
; 
; 
; 
; Enumeration 
; #Key_Unknown = 0
; 
; #Key_TAB = 9
; #Key_BACKSPACE = 8
; #Key_ENTER = 13
; #Key_ESCAPE = 27
; #Key_SPACE = 32
; #Key_SEMICOLON = ';'
; #Key_SINGLE_QUOTE = 39
; #Key_LEFT_BRACKET = '['
; #Key_RIGHT_BRACKET = ']'
; #Key_PERIOD = '.'
; #Key_MINUS = '-'
; #Key_COMMA = ','
; #Key_EQUAL = '='
; #Key_SLASH = '/'
; #Key_BACKSLASH = '\'
; #Key_ACCENT = '`'
; 
; #Key_0 = '0' 
; #Key_1
; #Key_2
; #Key_3
; #Key_4
; #Key_5
; #Key_6
; #Key_7
; #Key_8
; #Key_9
; 
; #Key_A = 'A' 
; #Key_B
; #Key_C
; #Key_D
; #Key_E
; #Key_F
; #Key_G
; #Key_H
; #Key_I
; #Key_J
; #Key_K
; #Key_L
; #Key_M
; #Key_N
; #Key_O
; #Key_P
; #Key_Q
; #Key_R
; #Key_S
; #Key_T
; #Key_U
; #Key_V
; #Key_W
; #Key_X
; #Key_Y
; #Key_Z
; 
; 
; #Key_F1 = 128 
; #Key_F2
; #Key_F3
; #Key_F4
; #Key_F5
; #Key_F6
; #Key_F7
; #Key_F8
; #Key_F9
; #Key_F10
; #Key_F11
; #Key_F12
; #Key_F13
; #Key_F14
; #Key_F15
; #Key_F16
; #Key_F17
; #Key_F18
; #Key_F19
; #Key_F20
; 
; 
; #Key_LEFT_SHIFT 
; #Key_LEFT_CONTROL 
; #Key_LEFT_ALT
; #Key_RIGHT_SHIFT
; #Key_RIGHT_CONTROL
; #Key_RIGHT_ALT
; 
; 
; #Key_KP_0 
; #Key_KP_1
; #Key_KP_2
; #Key_KP_3
; #Key_KP_4
; #Key_KP_5
; #Key_KP_6
; #Key_KP_7
; #Key_KP_8
; #Key_KP_9
; #Key_KP_NUMLOCK
; #Key_KP_DIVIDE
; #Key_KP_MULTIPLY
; #Key_KP_SUBTRACT
; #Key_KP_ADD
; #Key_KP_DECIMAL
; #Key_KP_ENTER
; #Key_KP_EQUAL
; 
; 
; #Key_UP
; #Key_LEFT
; #Key_RIGHT
; #Key_DOWN
; 
; 
; #Key_INSERT
; #Key_DELETE
; #Key_HOME
; #Key_END
; #Key_PAGEUP
; #Key_PAGEDOWN
; #Key_CAPSLOCK
; #Key_LEFT_SUPER
; #Key_RIGHT_SUPER
; #Key_MENU
; #Key_PRINTSCREEN
; #Key_SCROLL_LOCK
; #Key_PAUSE
; 
; #Key_LAST
; EndEnumeration
; 
; 
; 
; 
; 
; Declare.i   Init() 
; Declare     Shutdown() 
; Declare     RegisterErrorCallBack (*fp) 
; Declare.s   GetGlfwVersion() 
; Declare.s   GetSglVersion() 
; 
; 
; 
; Declare     PollEvents() 
; Declare     WaitEvents() 
; Declare     WaitEventsTimeout (timeout.d) 
; 
; 
; 
; Declare.d   GetTimerResolution() 
; Declare.s   GetTimerResolutionString() 
; Declare.d   GetTime() 
; Declare.i   CreateTimer() 
; Declare     DestroyTimer (timer) 
; Declare.d   GetDeltaTime (timer) 
; Declare.d   GetElapsedTime (timer) 
; Declare.d   GetElapsedTimeAbsolute (timer) 
; Declare     ResetTimer (timer) 
; 
; 
; 
; Declare.i   EnableDebugOutput (level = #DEBUG_OUPUT_MEDIUM) 
; Declare     ClearGlErrors() 
; Declare     CheckGlErrors() 
; 
; 
; 
; Declare     MakeContextCurrent (win) 
; Declare.i   GetCurrentContext() 
; Declare.s   GetRenderer() 
; Declare.s   GetVendor() 
; Declare.s   GetShadingLanguage() 
; Declare     GetContextVersion (*major, *minor) 
; Declare.i   GetContextVersionToken() 
; Declare.i   GetContextProfile() 
; Declare.i   IsDebugContext() 
; Declare.i   GetProcAddress (func$) 
; 
; 
; 
; Declare.i   LoadExtensionsStrings() 
; Declare.i   CountExtensionsStrings() 
; Declare.s   GetExtensionString (index) 
; Declare.i   IsExtensionAvailable (extension$) 
; 
; 
; 
; Declare.i   IsRawMouseSupported() 
; Declare     EnableRawMouse (win, flag) 
; Declare     SetCursorMode (win, mode) 
; Declare     GetMouseScroll (*xOffset.Double, *yOffset.Double) 
; Declare.i   GetCursorPos (win, *x.Double, *y.Double) 
; Declare     SetCursorPos (win, x.d, y.d) 
; Declare.s   GetMouseButtonString (button) 
; Declare.i   GetMouseButton (win, button) 
; Declare     SetStickyMouseButtons (win, flag) 
; 
; 
; 
; Declare.i   GetLastKey() 
; Declare.i   GetLastChar() 
; Declare.i   GetKey (key) 
; Declare.i   GetKeyPress (key) 
; Declare.s   GetKeyString (key) 
; Declare.s   GetKeyStringLocal (key) 
; 
; 
; 
; Declare.i   CreateWindow (w, h, title$, mon = #Null, share = #Null) 
; Declare.i   CreateWindowXY (x, y, w, h, title$, share = #Null) 
; Declare     DestroyWindow (win) 
; Declare.i   RegisterWindowCallBack (win, type, *fp) 
; Declare     ResetWindowHints() 
; Declare     ShowWindow (win, flag) 
; Declare     SetWindowHint (type, value) 
; Declare     SetWindowAutoMinimize (win, flag) 
; Declare     SetWindowText (win, text$) 
; Declare     SetWindowDefaultIcon (win) 
; Declare     SetWindowIcon (win, count, *images.IconData) 
; Declare     SetWindowDecoration (win, flag) 
; Declare     SetWindowTopMost (win, flag) 
; Declare     SetWindowResizable (win, flag) 
; Declare     SetWindowPos (win, x, y) 
; Declare     GetWindowPos (win, *x, *y) 
; Declare     SetWindowFocus (win) 
; Declare     SetWindowSize (win, widht, height) 
; Declare     SetWindowSizeLimits (win, min_widht, min_height, max_widht, max_height) 
; Declare     SetWindowAspectRatio (win, width_numerator, height_denominator) 
; Declare.i   WindowShouldClose (win) 
; Declare     SetWindowShouldClose (win, flag) 
; Declare     MinimizeWindow (win) 
; Declare     MaximizeWindow (win) 
; Declare     RestoreWindow (win) 
; Declare     GetWindowSize (win, *width, *height) 
; Declare     GetWindowFrameBufferSize (win, *width, *height) 
; Declare.i   IsWindowFocused (win) 
; Declare.i   IsWindowHovered (win) 
; Declare.i   IsWindowVisible (win) 
; Declare.i   IsWindowResizable (win) 
; Declare.i   IsWindowMinimized (win) 
; Declare.i   IsWindowMaximized (win) 
; Declare     SwapBuffers (win) 
; Declare.i   GetWindowMonitor (win) 
; Declare     SetWindowMonitor (win, mon, x, y, width, height, freq) 
; Declare     GetWindowContentScale (win, *x_float, *y_float) 
; 
; 
; 
; Declare.i   GetPrimaryMonitor() 
; Declare.i   GetMonitors (Array monitors(1)) 
; Declare.s   GetMonitorName (mon) 
; Declare.i   GetVideoMode (mon, *vmode.VideoMode) 
; Declare.i   GetVideoModes (mon, Array vmodes.VideoMode(1)) 
; Declare     GetMonitorContentScale (mon, *x_float, *y_float) 
; 
; 
; 
; Declare.s   GetOS() 
; Declare.s   GetCpuName() 
; Declare.i   GetLogicalCpuCores () 
; Declare.q   GetTotalMemory() 
; Declare.q   GetFreeMemory() 
; 
; 
; 
; Declare.i   IsPowerOfTwo (value) 
; Declare.i   NextPowerOfTwo (value) 
; Declare.i   CreateTexelData (img) 
; Declare     DestroyTexelData (*td.TexelData) 
; Declare.i   CopyImageAddingAlpha (img, alpha) 
; Declare.i   CopyImageRemovingAlpha (img) 
; Declare     SetImageAlpha (img, alpha) 
; Declare     SetImageAlphaForColor (img, color, alpha) 
; Declare.i   CreateImageFromFrameBuffer (win, x, y, w, h) 
; Declare.i   CreateImageFromAlpha (img) 
; Declare.i   CreateImage_Box (w, h, color, alpha = 255) 
; Declare.i   CreateImage_RGB (w, h, horizontal, alpha_r = 255, alpha_g = 255, alpha_b = 255) 
; Declare.i   CreateImage_DiceFace (w, h, face, color_circle, color_back, alpha_circle = 255, alpha_back = 255) 
; Declare.i   CreateImage_Checkers (w, h, sqWidth, sqHeight, color1, color2, alpha1 = 255, alpha2 = 255) 
; Declare     StickLabelToImage (img, text$, size = 12, fore = $FFFFFF, back = $000000) 
; 
; 
; 
; Declare     EnableVSync (flag) 
; Declare     SetMaxFPS (fps) 
; Declare     TrackFPS() 
; Declare.i   GetFPS() 
; Declare     StartFrameTimer() 
; Declare     StopFrameTimer() 
; Declare.f   GetFrameTime() 
; 
; 
; 
; Declare.i   CreateBitmapFontData (fontName$, fontSize, fontFlags, Array ranges.BitmapFontRange(1), width, height) 
; Declare     DestroyBitmapFontData (*bmf.BitmapFontData) 
; 
; 
; 
; Declare.i   CompileShader (string$, shaderType) 
; Declare.i   CompileShaderFromFile (file$, shaderType) 
; Declare     AddShaderObject (*objects.ShaderObjects, shader) 
; Declare     ClearShaderObjects (*objects.ShaderObjects) 
; Declare.i   BuildShaderProgram (*objects.ShaderObjects, cleanup = #True) 
; Declare     DestroyShaderProgram (program) 
; Declare     BindShaderProgram (program) 
; Declare.i   GetUniformLocation (program, name$) 
; Declare     SetUniformMatrix4x4 (uniform, *m4x4, count = 1) 
; Declare     SetUniformVec2 (uniform, *v0.vec2::vec2, count = 1) 
; Declare     SetUniformVec3 (uniform, *v0.vec3::vec3, count = 1) 
; Declare     SetUniformVec4 (uniform, *v0.vec4::vec4, count = 1) 
; Declare     SetUniformLong (uniform, v0.l) 
; Declare     SetUniformLongs (uniform, *address, count = 1) 
; Declare     SetUniformFloat (uniform, v0.f) 
; Declare     SetUniformFloats (uniform, *address, count = 1) 
; Declare     SetUniform2Floats (uniform, v0.f, v1.f) 
; Declare     SetUniform3Floats (uniform, v0.f, v1.f, v2.f) 
; Declare     SetUniform4Floats (uniform, v0.f, v1.f, v2.f, v3.f) 
; 
; EndDeclareModule
; 
; IncludeFile "../sgl.pb"
; Module sgl
; 
; UseModule gl 
; 
; UseModule glfw 
; 
; UseModule dbg 
; 
; XIncludeFile "./extensions/ARB_debug_output.pb" 
; 
; 
; 
; CompilerIf Defined(glDebugMessageControl, #PB_Prototype) = 0
; 
; CompilerIf Defined(glDebugMessageInsert, #PB_Prototype) = 0
; 
; CompilerIf Defined(glDebugMessageCallback, #PB_Prototype) = 0
; 
; CompilerIf Defined(glGetDebugMessageLog, #PB_Prototype) = 0
; 
; 
; 
; Macro CALLBACK_ERROR (source, desc)
; 
; 
; 
; #SOURCE_GLFW$   = "GLFW" 
; #SOURCE_SGL$    = "SGL"
; #SOURCE_OPENGL$ = "OPENGL"
; #SOURCE_GLSL$   = "GLSL"
; 
; 
; 
; Declare     init_sgl_obj()
; Declare     init_window_hints()
; Declare     init_mouse()
; Declare     init_keyboard()
; Declare.s   shader_type_to_string (type)
; Declare     apply_window_hints()
; Declare     callback_getprocaddress (func$)
; Declare     split_glsl_errors (errlog$)
; DeclareC    callback_error_glfw (err, *desc)
; Declare     callback_error_opengl (source, type, id, severity, length, *message, *userParam)
; DeclareC    callback_window_close (win)
; DeclareC    callback_window_pos (win, x.l, y.l)
; DeclareC    callback_window_size (win, width.l, height.l)
; DeclareC    callback_window_focus (win, focused.l)
; DeclareC    callback_window_minimize (win, minimized.l)
; DeclareC    callback_window_maximize (win, maximized.l)
; DeclareC    callback_window_frambuffer_size (win, width.l, height.l)
; DeclareC    callback_window_refresh (win)
; DeclareC    callback_window_scroll (win, x_offset.d, y_offset.d)
; DeclareC    callback_window_key (win, key, scancode, action, mods)
; DeclareC    callback_window_char (win, char)
; DeclareC    callback_window_cursor_position (win, x.d, y.d)
; DeclareC    callback_window_cursor_entering (win, entering)
; DeclareC    callback_window_mouse_button (win, button, action, mods)
; Declare.i   binary_string_lookup (Array arr$(1), key$)
; Declare.i   map_key_to_sgl (glfw_key)
; Declare.i   map_key_to_glfw (sgl_key)
; 
; 
; 
; Structure TIMER
; creationTime.d
; startTime.d
; startTime_Delta.d
; EndStructure
; 
; 
; 
; Structure SGL_KEY
; keyStatus.i 
; keyPressed.i
; EndStructure
; 
; Structure SGL_MOUSE
; scrollOffsetX.d
; scrollOffsetY.d
; EndStructure
; 
; Structure SGL_KEYBOARD
; Array GLFW2SGL.i(#GLFW_KEY_LAST)
; Array SGL2GLFW.i(#Key_LAST)
; Array Text$(#Key_LAST)
; Array Keys.SGL_KEY(#Key_LAST)
; lastChar.i
; lastKey.i
; EndStructure
; 
; Structure SGL_TRACK_FPS
; fps.i
; fpsCount.i 
; timerFps.i 
; 
; maxFps.i
; targetFrameTime.f 
; timerFullFrame.i
; EndStructure
; 
; Structure SGL_TRACK_FRAME_TIME
; timerFrame.i
; timerFrameAccum.i 
; frameCount.i 
; frameTime.f
; frameTimeAccum.f 
; EndStructure
; 
; 
; Structure SGL_OBJ
; initialized.i
; 
; debugOutputLevel.i
; 
; Mouse.SGL_MOUSE
; 
; Keyboard.SGL_KEYBOARD
; 
; TrackFps.SGL_TRACK_FPS
; 
; TrackFrameTime.SGL_TRACK_FRAME_TIME
; 
; Array ExtensionsStrings$(0) 
; 
; fpCallBack_Error.CallBack_Error
; fpCallBack_WindowClose.CallBack_WindowClose
; fpCallBack_WindowPos.CallBack_WindowPos
; fpCallBack_WindowSize.CallBack_WindowSize
; fpCallBack_WindowFocus.CallBack_WindowFocus
; fpCallBack_WindowMinimize.CallBack_WindowMinimize
; fpCallBack_WindowMaximize.CallBack_WindowMaximize
; fpCallBack_WindowFrameBufferSize.CallBack_WindowFrameBufferSize
; fpCallBack_WindowRefresh.CallBack_WindowRefresh
; fpCallBack_WindowScroll.CallBack_WindowScroll
; fpCallBack_Key.CallBack_Key
; fpCallBack_Char.CallBack_Char
; fpCallBack_CursorPos.CallBack_CursorPos
; fpCallBack_CursorEntering.CallBack_CursorEntering
; fpCallBack_MouseButton.CallBack_MouseButton
; 
; hintWinOpenglDebug.i
; hintWinOpenglMajor.i
; hintWinOpenglMinor.i
; hintWinOpenglDepthBuffer.i
; hintWinOpenglStencilBits.i
; hintWinOpenglAccumulatorBits.i
; hintWinOpenglSamples.i
; hintWinOpenglProfile.i
; hintWinOpenglForwardCompatibile.i
; 
; hintWinVisible.i
; hintWinResizable.i
; hintWinMaximized.i
; hintWinDecorated.i
; hintWinTopMost.i
; hintWinFocused.i
; hintWinCenteredCursor.i
; hintWinAutoMinimize.i
; hintWinFrameBufferDepth.i
; hintWinFrameBufferTransparent.i
; hintWinRefreshRate.i 
; EndStructure : Global SGL.SGL_OBJ : init_sgl_obj()
  CALL  _Procedure2994
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; EndModule
; 
; IncludeFile "../extras/RenderText_330/RenderText.pb"
; 
; 
; 
; 
; 
; 
; 
; 
; XIncludeFile "../../sgl.config.pbi"
; XIncludeFile "../../sgl.pbi"
; XIncludeFile "../../sgl.pb"
; 
; DeclareModule RenderText
; EnableExplicit
; 
; Structure BMFont
; fontName$ 
; fontSize.i
; italic.i
; bold.i
; yOffset.i
; texture.i 
; textureWidth.i
; textureHeight.i
; block.sgl::GlyphData 
; Array ranges.sgl::BitmapFontRange(0)
; EndStructure
; 
; Declare.i   FindGlyph (*fon.BMFont, charCode)
; Declare.i   GetTextWidth (*fon.BMFont, text$)
; Declare.i   GetFontHeight (*fon.BMFont)
; Declare     Render (win, *fon.BMFont, text$, x, y, *color.vec3::vec3)
; Declare     DestroyFont (*fon.BMFont)
; Declare.i   CreateFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width, height)
; 
; EndDeclareModule
; 
; Module RenderText
; 
; UseModule dbg
; 
; UseModule gl
; 
; Structure QuadVertex
; x.f
; y.f
; s.f
; t.f
; EndStructure
; 
; Structure QuadIndices
; index.l[6]
; EndStructure
; 
; 
; 
; 
; 
; 
; 
; DataSection
; vertex: : IncludeBinary "rt.vert.glsl" : vertex_end:
; EndDataSection
; 
; DataSection
; fragment: : IncludeBinary "rt.frag.glsl" : fragment_end:
; EndDataSection
; 
; EndModule
; 
; 
; UseModule gl
; 
; #TITLE$ = "Phong ligthing (330)"
; #WIN_WIDTH = 1024
; #WIN_HEIGHT = 768
; #VSYNC = 1
; 
; Global gWin
; Global gVSync = #VSYNC 
  MOV    qword [v_gVSync],1
; Global gLightOn 
; Global gSpecularOn
; Global gDiffuseOn
; Global gShader, gLightShader
; Global gVao, gLightVao
; Global gFon
; Global gTimer
; 
; Declare   CallBack_WindowRefresh (win)
; Declare   CallBack_Error (source$, desc$)
; Declare   SetupData()
; Declare   SetupContext()
; Declare   ShutDown()
; Declare   Render()
; Declare   MainLoop()
; Declare   Main()
; 
; 
; 
; 
; 
; 
; 
; 
  CALL  _Procedure3074
_PB_EOP:
  CALL   PB_EndFunctions
  CALL   SYS_FreeStrings
  MOV    rcx,[PB_MemoryBase]
  CALL   HeapDestroy
  MOV    rcx,[PB_ExitCode]
  CALL   ExitProcess
PB_EndFunctions:
  SUB    rsp,40
  CALL   PB_FreeLibraries
  CALL   PB_FreeFileSystem
  CALL   PB_FreeFiles
  CALL   PB_FreeImages
  CALL   PB_EndAlphaImage
  CALL   PB_EndVectorDrawing
  CALL   PB_FreeFonts
  CALL   PB_FreeObjects
  CALL   PB_FreeMemorys
  ADD    rsp,40
  RET
; 
; Procedure Shutdown()
_Procedure348:
  PS348=48
  SUB    rsp,40
; glfwTerminate()
  CALL   glfwTerminate
; EndProcedure
_EndProcedureZero349:
  XOR    rax,rax
_EndProcedure349:
  ADD    rsp,40
  RET
; Procedure.i Load()
_Procedure346:
  PS346=48
  SUB    rsp,40
; ProcedureReturn #LOAD_OK 
  XOR    rax,rax
  JMP   _EndProcedure347
; EndProcedure
_EndProcedureZero347:
  XOR    rax,rax
_EndProcedure347:
  ADD    rsp,40
  RET
; Procedure.d GetDeltaTime (timer) 
_Procedure2738:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2738=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; Protected TimeNow.d, TimeDelta.d
; Protected *t.TIMER = timer 
  PUSH   qword [rsp+PS2738+0]
  POP    rax
  MOV    qword [rsp+56],rax
; ASSERT(timer)
; 
; TimeNow = glfwGetTime()
  CALL   glfwGetTime
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FSTP   qword [rsp+40]
; 
; TimeDelta = TimeNow - *t\startTime_Delta
  FLD    qword [rsp+40]
  MOV    rbp,qword [rsp+56]
  FSUB   qword [rbp+16]
  FADD   qword [D2]
  FSTP   qword [rsp+48]
; 
; *t\startTime_Delta = TimeNow
  FLD    qword [rsp+40]
  MOV    rbp,qword [rsp+56]
  FSTP   qword [rbp+16]
; 
; ProcedureReturn TimeDelta
  FLD    qword [rsp+48]
  JMP   _EndProcedure2739
; EndProcedure
_EndProcedureZero2739:
  FLDZ
_EndProcedure2739:
  ADD    rsp,64
  FSTP   qword [rsp-8]
  MOVSD  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure SetWindowIcon (win, count, *images.IconData)
_Procedure2830:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2830=48
  SUB    rsp,40
; 
; 
; 
; 
; If count And *images
  CMP    qword [rsp+PS2830+8],0
  JE     No23
  CMP    qword [rsp+PS2830+16],0
  JE     No23
Ok23:
  MOV    rax,1
  JMP    End23
No23:
  XOR    rax,rax
End23:
  AND    rax,rax
  JE    _EndIf453
; glfwSetWindowIcon (win, count, *images)
  PUSH   qword [rsp+PS2830+16]
  PUSH   qword [rsp+PS2830+16]
  PUSH   qword [rsp+PS2830+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glfwSetWindowIcon
; EndIf
_EndIf453:
; EndProcedure
_EndProcedureZero2831:
  XOR    rax,rax
_EndProcedure2831:
  ADD    rsp,40
  RET
; ProcedureC callback_window_minimize (win, minimized.l)
_Procedure3022:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3022=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowMinimize
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+204],0
  JE    _EndIf311
; SGL\fpCallBack_WindowMinimize(win, minimized)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+204]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3022+24]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3022+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf311:
; EndProcedure
_EndProcedureZero3023:
  XOR    rax,rax
_EndProcedure3023:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetWindowShouldClose (win, flag)
_Procedure2852:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PS2852=48
  SUB    rsp,40
; 
; 
; glfwSetWindowShouldClose (win, flag)
  PUSH   qword [rsp+PS2852+8]
  PUSH   qword [rsp+PS2852+8]
  POP    rcx
  POP    rdx
  CALL   glfwSetWindowShouldClose
; EndProcedure
_EndProcedureZero2853:
  XOR    rax,rax
_EndProcedure2853:
  ADD    rsp,40
  RET
; Procedure.i IsExtensionAvailable (extension$)
_Procedure2778:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2778=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2778+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; 
; 
; 
; 
; 
; 
; If binary_string_lookup(SGL\ExtensionsStrings$(), extension$) <> -1
  PUSH   qword [rsp+40]
  LEA    rbp,[sgl.v_SGL]
  PUSH   rbp
  POP    rax
  LEA    rax,qword [rbp+156]
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure3042
  MOV    r15,rax
  CMP    r15,-1
  JE    _EndIf421
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2779
; EndIf
_EndIf421:
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2779
; EndProcedure
_EndProcedureZero2779:
  XOR    rax,rax
_EndProcedure2779:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure SetWindowHint (type, value) 
_Procedure2822:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS2822=64
  SUB    rsp,40
; 
; 
; Select type
  PUSH   qword [rsp+PS2822+0]
; Case #HINT_WIN_OPENGL_DEBUG
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case157
; SGL\hintWinOpenglDebug = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+284],rax
; Case #HINT_WIN_OPENGL_MAJOR
  JMP   _EndSelect23
_Case157:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case158
; SGL\hintWinOpenglMajor = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+292],rax
; Case #HINT_WIN_OPENGL_MINOR
  JMP   _EndSelect23
_Case158:
  MOV    r15,3
  CMP    r15,[rsp]
  JNE   _Case159
; SGL\hintWinOpenglMinor = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+300],rax
; Case #HINT_WIN_OPENGL_DEPTH_BUFFER
  JMP   _EndSelect23
_Case159:
  MOV    r15,4
  CMP    r15,[rsp]
  JNE   _Case160
; SGL\hintWinOpenglDepthBuffer = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+308],rax
; Case #HINT_WIN_OPENGL_STENCIL_BITS
  JMP   _EndSelect23
_Case160:
  MOV    r15,5
  CMP    r15,[rsp]
  JNE   _Case161
; SGL\hintWinOpenglStencilBits = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+316],rax
; Case #HINT_WIN_OPENGL_ACCUMULATOR_BITS
  JMP   _EndSelect23
_Case161:
  MOV    r15,6
  CMP    r15,[rsp]
  JNE   _Case162
; SGL\hintWinOpenglAccumulatorBits = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+324],rax
; Case #HINT_WIN_OPENGL_SAMPLES
  JMP   _EndSelect23
_Case162:
  MOV    r15,7
  CMP    r15,[rsp]
  JNE   _Case163
; SGL\hintWinOpenglSamples = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+332],rax
; Case #HINT_WIN_OPENGL_PROFILE 
  JMP   _EndSelect23
_Case163:
  MOV    r15,8
  CMP    r15,[rsp]
  JNE   _Case164
; SGL\hintWinOpenglProfile = value  
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+340],rax
; Case #HINT_WIN_OPENGL_FORWARD_COMPATIBLE
  JMP   _EndSelect23
_Case164:
  MOV    r15,9
  CMP    r15,[rsp]
  JNE   _Case165
; SGL\hintWinOpenglForwardCompatibile = value  
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+348],rax
; Case #HINT_WIN_VISIBLE
  JMP   _EndSelect23
_Case165:
  MOV    r15,10
  CMP    r15,[rsp]
  JNE   _Case166
; SGL\hintWinVisible = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+356],rax
; Case #HINT_WIN_RESIZABLE
  JMP   _EndSelect23
_Case166:
  MOV    r15,11
  CMP    r15,[rsp]
  JNE   _Case167
; SGL\hintWinResizable = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+364],rax
; Case #HINT_WIN_MAXIMIZED
  JMP   _EndSelect23
_Case167:
  MOV    r15,12
  CMP    r15,[rsp]
  JNE   _Case168
; SGL\hintWinMaximized = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+372],rax
; Case #HINT_WIN_DECORATED
  JMP   _EndSelect23
_Case168:
  MOV    r15,13
  CMP    r15,[rsp]
  JNE   _Case169
; SGL\hintWinDecorated = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+380],rax
; Case #HINT_WIN_TOPMOST
  JMP   _EndSelect23
_Case169:
  MOV    r15,14
  CMP    r15,[rsp]
  JNE   _Case170
; SGL\hintWinTopMost = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+388],rax
; Case #HINT_WIN_FOCUSED
  JMP   _EndSelect23
_Case170:
  MOV    r15,15
  CMP    r15,[rsp]
  JNE   _Case171
; SGL\hintWinFocused = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+396],rax
; Case #HINT_WIN_CENTERED_CURSOR
  JMP   _EndSelect23
_Case171:
  MOV    r15,16
  CMP    r15,[rsp]
  JNE   _Case172
; SGL\hintWinCenteredCursor = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+404],rax
; Case #HINT_WIN_AUTO_MINIMIZE
  JMP   _EndSelect23
_Case172:
  MOV    r15,17
  CMP    r15,[rsp]
  JNE   _Case173
; SGL\hintWinAutoMinimize = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+412],rax
; Case #HINT_WIN_FRAMEBUFFER_DEPTH
  JMP   _EndSelect23
_Case173:
  MOV    r15,18
  CMP    r15,[rsp]
  JNE   _Case174
; SGL\hintWinFrameBufferDepth = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+420],rax
; Case #HINT_WIN_FRAMEBUFFER_TRANSPARENT
  JMP   _EndSelect23
_Case174:
  MOV    r15,19
  CMP    r15,[rsp]
  JNE   _Case175
; SGL\hintWinFrameBufferTransparent = value
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+428],rax
; Case #HINT_WIN_REFRESH_RATE
  JMP   _EndSelect23
_Case175:
  MOV    r15,20
  CMP    r15,[rsp]
  JNE   _Case176
; SGL\hintWinRefreshRate = value           
  PUSH   qword [rsp+PS2822+16]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+436],rax
; Default
  JMP   _EndSelect23
_Case176:
; CALLBACK_ERROR (#SOURCE_SGL$, "SetWindowHint() hint type is invalid.")        
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf444
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S953
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf444:
; EndSelect
_Case177:
_EndSelect23:
  ADD    rsp,8
; EndProcedure
_EndProcedureZero2823:
  XOR    rax,rax
_EndProcedure2823:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.i IsDebugContext()
_Procedure2768:
  PUSH   r15
  PS2768=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; Protected mask
; 
; ClearGlErrors()
  CALL  _Procedure2748
; 
; glGetIntegerv_(#GL_CONTEXT_FLAGS, @mask)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33310
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
; 
; If glGetError_() <> #GL_NO_ERROR    
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf400
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2769
; EndIf
_EndIf400:
; 
; If (mask & #GL_CONTEXT_FLAG_DEBUG_BIT)
  MOV    r15,qword [rsp+40]
  AND    r15,2
  AND    r15,r15
  JE    _EndIf402
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2769
; EndIf   
_EndIf402:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2769
; EndProcedure
_EndProcedureZero2769:
  XOR    rax,rax
_EndProcedure2769:
  ADD    rsp,48
  POP    r15
  RET
; Procedure SetWindowDefaultIcon (win)
_Procedure2828:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2828=160
  MOV    rax,12
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; Protected size = 16
  MOV    qword [rsp+40],16
; Protected *buffer = AllocateMemory(size * size * 4) 
  MOV    r15,qword [rsp+40]
  IMUL   r15,qword [rsp+40]
  SAL    r15,2
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  CALL   PB_AllocateMemory
  MOV    qword [rsp+48],rax
; Protected icon.IconData
; Protected x, y, offset, s$, c$
; Protected background = RGBA(255,255,255,255)
  MOV    rax,4294967295
  MOV    qword [rsp+112],rax
; Dim color.l(0)
  SUB    rsp,24
  MOV    rdx,1
  LEA    rax,[rsp+144]
  PUSH   rax
  XOR    r9,r9
  MOV    r8,5
  MOV    rcx,4
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rsp+120],rax
; 
; color(0) = RGBA(0,0,255,255) 
  MOV    rbp,qword [rsp+120]
  MOV    rax,4294901760
  MOV    dword [rbp+0],eax
; 
; 
; 
; 
; DataSection 
; icon_mask:  
; Data.s "                "
; Data.s "     000000     "  
; Data.s "    0           "
; Data.s "    0           "
; Data.s "     00000      "
; Data.s "          0     "
; Data.s "          0     "
; Data.s "    000000      "
; Data.s "                "
; Data.s "  00000   0     "
; Data.s " 0        0     "
; Data.s " 0        0     "
; Data.s " 0  000   0     "
; Data.s " 0    0   0     "  
; Data.s "  0000    00000 "
; Data.s "                "
; EndDataSection
; 
; Restore icon_mask
  MOV    rax,sgl.ll_setwindowdefaulticon_icon_mask
  MOV    qword [PB_DataPointer],rax
; 
; For y = 0 To size - 1
  MOV    qword [rsp+80],0
  JMP   _ForSkipDebug445
_For445:
_ForSkipDebug445:
  MOV    r15,qword [rsp+40]
  DEC    r15
  CMP    r15,qword [rsp+80]
  JL    _Next446
; Read.s s$
  LEA    rcx,[rsp+96]
  MOV    rdx,qword [PB_DataPointer]
  CALL   SYS_FastAllocateStringFree4
  ADD    qword [PB_DataPointer],rax
; For x = 0 To size - 1
  MOV    qword [rsp+72],0
  JMP   _ForSkipDebug447
_For447:
_ForSkipDebug447:
  MOV    r15,qword [rsp+40]
  DEC    r15
  CMP    r15,qword [rsp+72]
  JL    _Next448
; c$ = Mid(s$, x + 1, 1)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 1
  MOV    r15,qword [rsp+104]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  PUSH   qword [rsp+136]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_Mid2
  ADD    rsp,40
  LEA    rcx,[rsp+112]
  POP    rdx
  CALL   SYS_AllocateString4
; If c$ = " "
  PUSH   qword [rsp+104]
  MOV    rcx,_S13
  POP    rdx
  CALL   SYS_StringEqual
  OR     rax,rax
  JE    _EndIf450
; PokeL(*buffer + offset, background) 
  PUSH   qword [rsp+112]
  MOV    r15,qword [rsp+56]
  ADD    r15,qword [rsp+96]
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL   PB_PokeL
; Else
  JMP   _EndIf449
_EndIf450:
; PokeL(*buffer + offset, color(Asc(c$)-'0')) 
  PUSH   qword [rsp+104]
  POP    rcx
  CALL   PB_Asc
  MOV    r15,rax
  ADD    r15,-48
  MOV    rbp,qword [rsp+120]
  SAL    r15,2
  MOVSXD rax,dword [rbp+r15]
  MOV    rax,rax
  PUSH   rax
  MOV    r15,qword [rsp+56]
  ADD    r15,qword [rsp+96]
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL   PB_PokeL
; EndIf        
_EndIf449:
; offset + 4 
  MOV    r15,qword [rsp+88]
  ADD    r15,4
  MOV    qword [rsp+88],r15
; Next    
_NextContinue448:
  INC    qword [rsp+72]
  JNO   _For447
_Next448:
; Next
_NextContinue446:
  INC    qword [rsp+80]
  JNO   _For445
_Next446:
; 
; icon\width = size
  PUSH   qword [rsp+40]
  LEA    rbp,[rsp+64]
  POP    rax
  MOV    dword [rbp],eax
; icon\height = size
  PUSH   qword [rsp+40]
  POP    rax
  MOV    dword [rbp+4],eax
; icon\pixels = *buffer
  PUSH   qword [rsp+48]
  POP    rax
  MOV    qword [rbp+8],rax
; 
; SetWindowIcon (win, 1, @icon)
  LEA    rax,[rsp+56]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+PS2828+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2830
; EndProcedure
_EndProcedureZero2829:
  XOR    rax,rax
_EndProcedure2829:
  PUSH   rax
  MOV    rcx,qword [rsp+104]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+112]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+128]
  SUB    rsp,40
  CALL   SYS_FreeArray
  ADD    rsp,40
  POP    rax
  ADD    rsp,136
  POP    r15
  POP    rbp
  RET
; Procedure init_keyboard()
_Procedure3000:
  PUSH   rbp
  PUSH   r15
  PS3000=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; Protected i
; 
; For i = 0 To #Key_LAST
  MOV    qword [rsp+40],0
  JMP   _ForSkipDebug285
_For285:
_ForSkipDebug285:
  MOV    rax,189
  CMP    rax,qword [rsp+40]
  JL    _Next286
; SGL\Keyboard\Keys(i)\keyStatus = #RELEASED
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+48]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp],0
; SGL\Keyboard\Keys(i)\keyPressed = 0
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+48]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp+8],0
; Next
_NextContinue286:
  INC    qword [rsp+40]
  JNO   _For285
_Next286:
; 
; SGL\Keyboard\Text$(#Key_Unknown) = "Unknown"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S777
  LEA    rcx,[rbp+0]
  CALL   SYS_FastAllocateStringFree4
; 
; SGL\Keyboard\Text$(#Key_SPACE) = "Space"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S778
  LEA    rcx,[rbp+256]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_SINGLE_QUOTE) = "'"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S779
  LEA    rcx,[rbp+312]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_COMMA) = ","
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S23
  LEA    rcx,[rbp+352]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_MINUS) = "-"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S15
  LEA    rcx,[rbp+360]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_PERIOD) = "."
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S17
  LEA    rcx,[rbp+368]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_SLASH) = "/"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S780
  LEA    rcx,[rbp+376]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_0) = "0"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S14
  LEA    rcx,[rbp+384]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_1) = "1"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S781
  LEA    rcx,[rbp+392]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_2) = "2"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S782
  LEA    rcx,[rbp+400]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_3) = "3"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S783
  LEA    rcx,[rbp+408]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_4) = "4"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S33
  LEA    rcx,[rbp+416]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_5) = "5"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S784
  LEA    rcx,[rbp+424]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_6) = "6"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S46
  LEA    rcx,[rbp+432]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_7) = "7"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S785
  LEA    rcx,[rbp+440]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_8) = "8"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S786
  LEA    rcx,[rbp+448]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_9) = "9"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S787
  LEA    rcx,[rbp+456]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_SEMICOLON) = ";"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S788
  LEA    rcx,[rbp+472]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_EQUAL) = "="
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S789
  LEA    rcx,[rbp+488]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_A) = "a"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S790
  LEA    rcx,[rbp+520]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_B) = "b"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S791
  LEA    rcx,[rbp+528]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_C) = "c"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S792
  LEA    rcx,[rbp+536]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_D) = "d"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S793
  LEA    rcx,[rbp+544]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_E) = "e"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S794
  LEA    rcx,[rbp+552]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F) = "f"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S795
  LEA    rcx,[rbp+560]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_G) = "g"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S796
  LEA    rcx,[rbp+568]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_H) = "h"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S797
  LEA    rcx,[rbp+576]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_I) = "i"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S798
  LEA    rcx,[rbp+584]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_J) = "j"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S799
  LEA    rcx,[rbp+592]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_K) = "k"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S800
  LEA    rcx,[rbp+600]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_L) = "l"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S801
  LEA    rcx,[rbp+608]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_M) = "m"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S802
  LEA    rcx,[rbp+616]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_N) = "n"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S803
  LEA    rcx,[rbp+624]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_O) = "o"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S804
  LEA    rcx,[rbp+632]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_P) = "p"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S805
  LEA    rcx,[rbp+640]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_Q) = "q"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S806
  LEA    rcx,[rbp+648]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_R) = "r"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S807
  LEA    rcx,[rbp+656]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_S) = "s"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S808
  LEA    rcx,[rbp+664]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_T) = "t"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S809
  LEA    rcx,[rbp+672]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_U) = "u"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S810
  LEA    rcx,[rbp+680]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_V) = "v"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S811
  LEA    rcx,[rbp+688]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_W) = "w"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S812
  LEA    rcx,[rbp+696]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_X) = "x"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S813
  LEA    rcx,[rbp+704]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_Y) = "y"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S814
  LEA    rcx,[rbp+712]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_Z) = "z"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S815
  LEA    rcx,[rbp+720]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT_BRACKET) = "["
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S816
  LEA    rcx,[rbp+728]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_BACKSLASH ) = "\"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S1
  LEA    rcx,[rbp+736]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT_BRACKET) = "]"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S817
  LEA    rcx,[rbp+744]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_ACCENT) = "`"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S818
  LEA    rcx,[rbp+768]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_ESCAPE) = "Esc"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S819
  LEA    rcx,[rbp+216]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_ENTER) = "Enter"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S820
  LEA    rcx,[rbp+104]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_TAB) = "Tab"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S821
  LEA    rcx,[rbp+72]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_BACKSPACE) = "Backspace"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S822
  LEA    rcx,[rbp+64]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_INSERT) = "Ins"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S823
  LEA    rcx,[rbp+1408]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_DELETE) = "Del"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S824
  LEA    rcx,[rbp+1416]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT) = "Right"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S825
  LEA    rcx,[rbp+1392]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT) = "Left"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S826
  LEA    rcx,[rbp+1384]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_DOWN) = "Down"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S827
  LEA    rcx,[rbp+1400]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_UP) = "Up"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S828
  LEA    rcx,[rbp+1376]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_PAGEUP) = "Page Up"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S829
  LEA    rcx,[rbp+1440]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_PAGEDOWN) = "Page Down"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S830
  LEA    rcx,[rbp+1448]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_HOME) = "Home"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S831
  LEA    rcx,[rbp+1424]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_END) = "End"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S832
  LEA    rcx,[rbp+1432]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_CAPSLOCK) = "Caps Lock"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S833
  LEA    rcx,[rbp+1456]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_SCROLL_LOCK) = "Scroll Lock"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S834
  LEA    rcx,[rbp+1496]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_NUMLOCK) = "Num Lock"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S835
  LEA    rcx,[rbp+1312]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_PRINTSCREEN) = "Print Screen"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S836
  LEA    rcx,[rbp+1488]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_PAUSE) = "Pause"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S837
  LEA    rcx,[rbp+1504]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F1) = "F1"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S838
  LEA    rcx,[rbp+1024]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F2) = "F2"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S839
  LEA    rcx,[rbp+1032]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F3) = "F3"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S840
  LEA    rcx,[rbp+1040]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F4) = "F4"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S841
  LEA    rcx,[rbp+1048]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F5) = "F5"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S842
  LEA    rcx,[rbp+1056]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F6) = "F6"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S843
  LEA    rcx,[rbp+1064]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F7) = "F7"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S844
  LEA    rcx,[rbp+1072]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F8) = "F8"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S845
  LEA    rcx,[rbp+1080]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F9) = "F9"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S846
  LEA    rcx,[rbp+1088]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F10) = "F10"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S847
  LEA    rcx,[rbp+1096]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F11) = "F11"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S848
  LEA    rcx,[rbp+1104]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F12) = "F12"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S849
  LEA    rcx,[rbp+1112]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F13) = "F13"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S850
  LEA    rcx,[rbp+1120]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F14) = "F14"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S851
  LEA    rcx,[rbp+1128]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F15) = "F15"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S852
  LEA    rcx,[rbp+1136]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F16) = "F16"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S853
  LEA    rcx,[rbp+1144]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F17) = "F17"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S854
  LEA    rcx,[rbp+1152]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F18) = "F18"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S855
  LEA    rcx,[rbp+1160]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F19) = "F19"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S856
  LEA    rcx,[rbp+1168]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_F20) = "F20"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S857
  LEA    rcx,[rbp+1176]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_0) = "Keypad 0"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S858
  LEA    rcx,[rbp+1232]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_1) = "Keypad 1"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S859
  LEA    rcx,[rbp+1240]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_2) = "Keypad 2"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S860
  LEA    rcx,[rbp+1248]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_3) = "Keypad 3"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S861
  LEA    rcx,[rbp+1256]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_4) = "Keypad 4"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S862
  LEA    rcx,[rbp+1264]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_5) = "Keypad 5"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S863
  LEA    rcx,[rbp+1272]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_6) = "Keypad 6"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S864
  LEA    rcx,[rbp+1280]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_7) = "Keypad 7"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S865
  LEA    rcx,[rbp+1288]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_8) = "Keypad 8"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S866
  LEA    rcx,[rbp+1296]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_9) = "Keypad 9"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S867
  LEA    rcx,[rbp+1304]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_DECIMAL) = "Keypad ."
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S868
  LEA    rcx,[rbp+1352]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_DIVIDE) = "Keypad /"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S869
  LEA    rcx,[rbp+1320]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_MULTIPLY) = "Keypad *"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S870
  LEA    rcx,[rbp+1328]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_SUBTRACT) = "Keypad -"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S871
  LEA    rcx,[rbp+1336]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_ADD) = "Keypad +"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S872
  LEA    rcx,[rbp+1344]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_ENTER) = "Keypad Enter"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S873
  LEA    rcx,[rbp+1360]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_KP_EQUAL) = "Keypad ="
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S874
  LEA    rcx,[rbp+1368]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT_SHIFT) = "Left Shift"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S875
  LEA    rcx,[rbp+1184]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT_CONTROL) = "Left Ctrl"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S876
  LEA    rcx,[rbp+1192]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT_ALT) = "Left Alt"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S877
  LEA    rcx,[rbp+1200]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_LEFT_SUPER) = "Left Super"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S878
  LEA    rcx,[rbp+1464]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT_SHIFT) = "Right Shift"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S879
  LEA    rcx,[rbp+1208]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT_CONTROL) = "Right Ctrl"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S880
  LEA    rcx,[rbp+1216]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT_ALT) = "Right Alt"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S881
  LEA    rcx,[rbp+1224]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_RIGHT_SUPER) = "Right Super"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S882
  LEA    rcx,[rbp+1472]
  CALL   SYS_FastAllocateStringFree4
; SGL\Keyboard\Text$(#Key_MENU) = "Menu"
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+16]
  MOV    rdx,_S883
  LEA    rcx,[rbp+1480]
  CALL   SYS_FastAllocateStringFree4
; 
; SGL\Keyboard\SGL2GLFW(#Key_SPACE) = #GLFW_KEY_SPACE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+256],32
; SGL\Keyboard\SGL2GLFW(#Key_SINGLE_QUOTE) = #GLFW_KEY_APOSTROPHE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+312],39
; SGL\Keyboard\SGL2GLFW(#Key_COMMA) = #GLFW_KEY_COMMA
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+352],44
; SGL\Keyboard\SGL2GLFW(#Key_MINUS) = #GLFW_KEY_MINUS
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+360],45
; SGL\Keyboard\SGL2GLFW(#Key_PERIOD) = #GLFW_KEY_PERIOD
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+368],46
; SGL\Keyboard\SGL2GLFW(#Key_SLASH) = #GLFW_KEY_SLASH
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+376],47
; SGL\Keyboard\SGL2GLFW(#Key_0) = #GLFW_KEY_0
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+384],48
; SGL\Keyboard\SGL2GLFW(#Key_1) = #GLFW_KEY_1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+392],49
; SGL\Keyboard\SGL2GLFW(#Key_2) = #GLFW_KEY_2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+400],50
; SGL\Keyboard\SGL2GLFW(#Key_3) = #GLFW_KEY_3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+408],51
; SGL\Keyboard\SGL2GLFW(#Key_4) = #GLFW_KEY_4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+416],52
; SGL\Keyboard\SGL2GLFW(#Key_5) = #GLFW_KEY_5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+424],53
; SGL\Keyboard\SGL2GLFW(#Key_6) = #GLFW_KEY_6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+432],54
; SGL\Keyboard\SGL2GLFW(#Key_7) = #GLFW_KEY_7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+440],55
; SGL\Keyboard\SGL2GLFW(#Key_8) = #GLFW_KEY_8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+448],56
; SGL\Keyboard\SGL2GLFW(#Key_9) = #GLFW_KEY_9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+456],57
; SGL\Keyboard\SGL2GLFW(#Key_SEMICOLON) = #GLFW_KEY_SEMICOLON
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+472],59
; SGL\Keyboard\SGL2GLFW(#Key_EQUAL) = #GLFW_KEY_EQUAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+488],61
; SGL\Keyboard\SGL2GLFW(#Key_A) = #GLFW_KEY_A
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+520],65
; SGL\Keyboard\SGL2GLFW(#Key_B) = #GLFW_KEY_B
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+528],66
; SGL\Keyboard\SGL2GLFW(#Key_C) = #GLFW_KEY_C
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+536],67
; SGL\Keyboard\SGL2GLFW(#Key_D) = #GLFW_KEY_D
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+544],68
; SGL\Keyboard\SGL2GLFW(#Key_E) = #GLFW_KEY_E
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+552],69
; SGL\Keyboard\SGL2GLFW(#Key_F) = #GLFW_KEY_F
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+560],70
; SGL\Keyboard\SGL2GLFW(#Key_G) = #GLFW_KEY_G
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+568],71
; SGL\Keyboard\SGL2GLFW(#Key_H) = #GLFW_KEY_H
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+576],72
; SGL\Keyboard\SGL2GLFW(#Key_I) = #GLFW_KEY_I
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+584],73
; SGL\Keyboard\SGL2GLFW(#Key_J) = #GLFW_KEY_J
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+592],74
; SGL\Keyboard\SGL2GLFW(#Key_K) = #GLFW_KEY_K
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+600],75
; SGL\Keyboard\SGL2GLFW(#Key_L) = #GLFW_KEY_L
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+608],76
; SGL\Keyboard\SGL2GLFW(#Key_M) = #GLFW_KEY_M
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+616],77
; SGL\Keyboard\SGL2GLFW(#Key_N) = #GLFW_KEY_N
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+624],78
; SGL\Keyboard\SGL2GLFW(#Key_O) = #GLFW_KEY_O
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+632],79
; SGL\Keyboard\SGL2GLFW(#Key_P) = #GLFW_KEY_P
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+640],80
; SGL\Keyboard\SGL2GLFW(#Key_Q) = #GLFW_KEY_Q
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+648],81
; SGL\Keyboard\SGL2GLFW(#Key_R) = #GLFW_KEY_R
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+656],82
; SGL\Keyboard\SGL2GLFW(#Key_S) = #GLFW_KEY_S
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+664],83
; SGL\Keyboard\SGL2GLFW(#Key_T) = #GLFW_KEY_T
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+672],84
; SGL\Keyboard\SGL2GLFW(#Key_U) = #GLFW_KEY_U
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+680],85
; SGL\Keyboard\SGL2GLFW(#Key_V) = #GLFW_KEY_V
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+688],86
; SGL\Keyboard\SGL2GLFW(#Key_W) = #GLFW_KEY_W
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+696],87
; SGL\Keyboard\SGL2GLFW(#Key_X) = #GLFW_KEY_X
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+704],88
; SGL\Keyboard\SGL2GLFW(#Key_Y) = #GLFW_KEY_Y
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+712],89
; SGL\Keyboard\SGL2GLFW(#Key_Z) = #GLFW_KEY_Z
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+720],90
; SGL\Keyboard\SGL2GLFW(#Key_LEFT_BRACKET) = #GLFW_KEY_LEFT_BRACKET
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+728],91
; SGL\Keyboard\SGL2GLFW(#Key_BACKSLASH ) = #GLFW_KEY_BACKSLASH
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+736],92
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT_BRACKET) = #GLFW_KEY_RIGHT_BRACKET
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+744],93
; SGL\Keyboard\SGL2GLFW(#Key_ACCENT) = #GLFW_KEY_GRAVE_ACCENT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+768],96
; SGL\Keyboard\SGL2GLFW(#Key_ESCAPE) = #GLFW_KEY_ESCAPE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+216],256
; SGL\Keyboard\SGL2GLFW(#Key_ENTER) = #GLFW_KEY_ENTER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+104],257
; SGL\Keyboard\SGL2GLFW(#Key_TAB) = #GLFW_KEY_TAB
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+72],258
; SGL\Keyboard\SGL2GLFW(#Key_BACKSPACE) = #GLFW_KEY_BACKSPACE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+64],259
; SGL\Keyboard\SGL2GLFW(#Key_INSERT) = #GLFW_KEY_INSERT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1408],260
; SGL\Keyboard\SGL2GLFW(#Key_DELETE) = #GLFW_KEY_DELETE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1416],261
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT) = #GLFW_KEY_RIGHT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1392],262
; SGL\Keyboard\SGL2GLFW(#Key_LEFT) = #GLFW_KEY_LEFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1384],263
; SGL\Keyboard\SGL2GLFW(#Key_DOWN) = #GLFW_KEY_DOWN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1400],264
; SGL\Keyboard\SGL2GLFW(#Key_UP) = #GLFW_KEY_UP
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1376],265
; SGL\Keyboard\SGL2GLFW(#Key_PAGEUP) = #GLFW_KEY_PAGE_UP
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1440],266
; SGL\Keyboard\SGL2GLFW(#Key_PAGEDOWN) = #GLFW_KEY_PAGE_DOWN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1448],267
; SGL\Keyboard\SGL2GLFW(#Key_HOME) = #GLFW_KEY_HOME
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1424],268
; SGL\Keyboard\SGL2GLFW(#Key_END) = #GLFW_KEY_END
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1432],269
; SGL\Keyboard\SGL2GLFW(#Key_CAPSLOCK) = #GLFW_KEY_CAPS_LOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1456],280
; SGL\Keyboard\SGL2GLFW(#Key_SCROLL_LOCK) = #GLFW_KEY_SCROLL_LOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1496],281
; SGL\Keyboard\SGL2GLFW(#Key_KP_NUMLOCK) = #GLFW_KEY_NUM_LOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1312],282
; SGL\Keyboard\SGL2GLFW(#Key_PRINTSCREEN) = #GLFW_KEY_PRINT_SCREEN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1488],283
; SGL\Keyboard\SGL2GLFW(#Key_PAUSE) = #GLFW_KEY_PAUSE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1504],284
; SGL\Keyboard\SGL2GLFW(#Key_F1) = #GLFW_KEY_F1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1024],290
; SGL\Keyboard\SGL2GLFW(#Key_F2) = #GLFW_KEY_F2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1032],291
; SGL\Keyboard\SGL2GLFW(#Key_F3) = #GLFW_KEY_F3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1040],292
; SGL\Keyboard\SGL2GLFW(#Key_F4) = #GLFW_KEY_F4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1048],293
; SGL\Keyboard\SGL2GLFW(#Key_F5) = #GLFW_KEY_F5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1056],294
; SGL\Keyboard\SGL2GLFW(#Key_F6) = #GLFW_KEY_F6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1064],295
; SGL\Keyboard\SGL2GLFW(#Key_F7) = #GLFW_KEY_F7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1072],296
; SGL\Keyboard\SGL2GLFW(#Key_F8) = #GLFW_KEY_F8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1080],297
; SGL\Keyboard\SGL2GLFW(#Key_F9) = #GLFW_KEY_F9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1088],298
; SGL\Keyboard\SGL2GLFW(#Key_F10) = #GLFW_KEY_F10
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1096],299
; SGL\Keyboard\SGL2GLFW(#Key_F11) = #GLFW_KEY_F11
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1104],300
; SGL\Keyboard\SGL2GLFW(#Key_F12) = #GLFW_KEY_F12
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1112],301
; SGL\Keyboard\SGL2GLFW(#Key_F13) = #GLFW_KEY_F13
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1120],302
; SGL\Keyboard\SGL2GLFW(#Key_F14) = #GLFW_KEY_F14
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1128],303
; SGL\Keyboard\SGL2GLFW(#Key_F15) = #GLFW_KEY_F15
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1136],304
; SGL\Keyboard\SGL2GLFW(#Key_F16) = #GLFW_KEY_F16
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1144],305
; SGL\Keyboard\SGL2GLFW(#Key_F17) = #GLFW_KEY_F17
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1152],306
; SGL\Keyboard\SGL2GLFW(#Key_F18) = #GLFW_KEY_F18
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1160],307
; SGL\Keyboard\SGL2GLFW(#Key_F19) = #GLFW_KEY_F19
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1168],308
; SGL\Keyboard\SGL2GLFW(#Key_F20) = #GLFW_KEY_F20
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1176],309
; SGL\Keyboard\SGL2GLFW(#Key_KP_0) = #GLFW_KEY_KP_0
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1232],320
; SGL\Keyboard\SGL2GLFW(#Key_KP_1) = #GLFW_KEY_KP_1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1240],321
; SGL\Keyboard\SGL2GLFW(#Key_KP_2) = #GLFW_KEY_KP_2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1248],322
; SGL\Keyboard\SGL2GLFW(#Key_KP_3) = #GLFW_KEY_KP_3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1256],323
; SGL\Keyboard\SGL2GLFW(#Key_KP_4) = #GLFW_KEY_KP_4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1264],324
; SGL\Keyboard\SGL2GLFW(#Key_KP_5) = #GLFW_KEY_KP_5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1272],325
; SGL\Keyboard\SGL2GLFW(#Key_KP_6) = #GLFW_KEY_KP_6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1280],326
; SGL\Keyboard\SGL2GLFW(#Key_KP_7) = #GLFW_KEY_KP_7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1288],327
; SGL\Keyboard\SGL2GLFW(#Key_KP_8) = #GLFW_KEY_KP_8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1296],328
; SGL\Keyboard\SGL2GLFW(#Key_KP_9) = #GLFW_KEY_KP_9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1304],329
; SGL\Keyboard\SGL2GLFW(#Key_KP_DECIMAL) = #GLFW_KEY_KP_DECIMAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1352],330
; SGL\Keyboard\SGL2GLFW(#Key_KP_DIVIDE) = #GLFW_KEY_KP_DIVIDE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1320],331
; SGL\Keyboard\SGL2GLFW(#Key_KP_MULTIPLY) = #GLFW_KEY_KP_MULTIPLY
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1328],332
; SGL\Keyboard\SGL2GLFW(#Key_KP_SUBTRACT) = #GLFW_KEY_KP_SUBTRACT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1336],333
; SGL\Keyboard\SGL2GLFW(#Key_KP_ADD) = #GLFW_KEY_KP_ADD
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1344],334
; SGL\Keyboard\SGL2GLFW(#Key_KP_ENTER) = #GLFW_KEY_KP_ENTER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1360],335
; SGL\Keyboard\SGL2GLFW(#Key_KP_EQUAL) = #GLFW_KEY_KP_EQUAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1368],336
; SGL\Keyboard\SGL2GLFW(#Key_LEFT_SHIFT) = #GLFW_KEY_LEFT_SHIFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1184],340
; SGL\Keyboard\SGL2GLFW(#Key_LEFT_CONTROL) = #GLFW_KEY_LEFT_CONTROL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1192],341
; SGL\Keyboard\SGL2GLFW(#Key_LEFT_ALT) = #GLFW_KEY_LEFT_ALT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1200],342
; SGL\Keyboard\SGL2GLFW(#Key_LEFT_SUPER) = #GLFW_KEY_LEFT_SUPER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1464],343
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT_SHIFT) = #GLFW_KEY_RIGHT_SHIFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1208],344
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT_CONTROL) = #GLFW_KEY_RIGHT_CONTROL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1216],345
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT_ALT) = #GLFW_KEY_RIGHT_ALT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1224],346
; SGL\Keyboard\SGL2GLFW(#Key_RIGHT_SUPER) = #GLFW_KEY_RIGHT_SUPER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1472],347
; SGL\Keyboard\SGL2GLFW(#Key_MENU) = #GLFW_KEY_MENU
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+8]
  MOV    qword [rbp+1480],348
; 
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SPACE) = #Key_SPACE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+256],32
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_APOSTROPHE) = #Key_SINGLE_QUOTE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+312],39
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_COMMA) = #Key_COMMA
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+352],44
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_MINUS) = #Key_MINUS
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+360],45
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PERIOD) = #Key_PERIOD
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+368],46
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SLASH) = #Key_SLASH
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+376],47
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_0) = #Key_0
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+384],48
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_1) = #Key_1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+392],49
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_2) = #Key_2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+400],50
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_3) = #Key_3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+408],51
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_4) = #Key_4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+416],52
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_5) = #Key_5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+424],53
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_6) = #Key_6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+432],54
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_7) = #Key_7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+440],55
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_8) = #Key_8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+448],56
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_9) = #Key_9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+456],57
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SEMICOLON) = #Key_SEMICOLON
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+472],59
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_EQUAL) = #Key_EQUAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+488],61
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_A) = #Key_A
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+520],65
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_B) = #Key_B
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+528],66
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_C) = #Key_C
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+536],67
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_D) = #Key_D
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+544],68
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_E) = #Key_E
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+552],69
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F) = #Key_F
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+560],70
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_G) = #Key_G
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+568],71
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_H) = #Key_H
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+576],72
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_I) = #Key_I
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+584],73
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_J) = #Key_J
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+592],74
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_K) = #Key_K
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+600],75
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_L) = #Key_L
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+608],76
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_M) = #Key_M
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+616],77
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_N) = #Key_N
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+624],78
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_O) = #Key_O
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+632],79
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_P) = #Key_P
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+640],80
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Q) = #Key_Q
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+648],81
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_R) = #Key_R
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+656],82
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_S) = #Key_S
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+664],83
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_T) = #Key_T
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+672],84
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_U) = #Key_U
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+680],85
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_V) = #Key_V
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+688],86
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_W) = #Key_W
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+696],87
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_X) = #Key_X
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+704],88
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Y) = #Key_Y
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+712],89
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Z) = #Key_Z
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+720],90
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_BRACKET) = #Key_LEFT_BRACKET
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+728],91
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_BACKSLASH) = #Key_BACKSLASH 
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+736],92
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_BRACKET) = #Key_RIGHT_BRACKET
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+744],93
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_GRAVE_ACCENT) = #Key_ACCENT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+768],96
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_ESCAPE) = #Key_ESCAPE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2048],27
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_ENTER) = #Key_ENTER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2056],13
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_TAB) = #Key_TAB
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2064],9
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_BACKSPACE) = #Key_BACKSPACE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2072],8
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_INSERT) = #Key_INSERT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2080],176
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_DELETE) = #Key_DELETE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2088],177
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT) = #Key_RIGHT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2096],174
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT) = #Key_LEFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2104],173
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_DOWN) = #Key_DOWN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2112],175
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_UP) = #Key_UP
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2120],172
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAGE_UP) = #Key_PAGEUP
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2128],180
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAGE_DOWN) = #Key_PAGEDOWN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2136],181
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_HOME) = #Key_HOME
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2144],178
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_END) = #Key_END
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2152],179
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_CAPS_LOCK) = #Key_CAPSLOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2240],182
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SCROLL_LOCK) = #Key_SCROLL_LOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2248],187
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_NUM_LOCK) = #Key_KP_NUMLOCK
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2256],164
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PRINT_SCREEN) = #Key_PRINTSCREEN
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2264],186
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAUSE) = #Key_PAUSE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2272],188
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F1) = #Key_F1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2320],128
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F2) = #Key_F2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2328],129
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F3) = #Key_F3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2336],130
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F4) = #Key_F4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2344],131
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F5) = #Key_F5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2352],132
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F6) = #Key_F6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2360],133
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F7) = #Key_F7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2368],134
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F8) = #Key_F8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2376],135
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F9) = #Key_F9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2384],136
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F10) = #Key_F10
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2392],137
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F11) = #Key_F11
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2400],138
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F12) = #Key_F12
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2408],139
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F13) = #Key_F13
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2416],140
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F14) = #Key_F14
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2424],141
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F15) = #Key_F15
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2432],142
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F16) = #Key_F16
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2440],143
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F17) = #Key_F17
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2448],144
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F18) = #Key_F18
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2456],145
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F19) = #Key_F19
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2464],146
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F20) = #Key_F20
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2472],147
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_0) = #Key_KP_0
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2560],154
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_1) = #Key_KP_1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2568],155
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_2) = #Key_KP_2
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2576],156
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_3) = #Key_KP_3
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2584],157
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_4) = #Key_KP_4
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2592],158
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_5) = #Key_KP_5
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2600],159
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_6) = #Key_KP_6
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2608],160
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_7) = #Key_KP_7
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2616],161
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_8) = #Key_KP_8
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2624],162
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_9) = #Key_KP_9
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2632],163
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_DECIMAL) = #Key_KP_DECIMAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2640],169
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_DIVIDE) = #Key_KP_DIVIDE
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2648],165
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_MULTIPLY) = #Key_KP_MULTIPLY
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2656],166
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_SUBTRACT) = #Key_KP_SUBTRACT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2664],167
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_ADD) = #Key_KP_ADD
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2672],168
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_ENTER) = #Key_KP_ENTER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2680],170
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_EQUAL) = #Key_KP_EQUAL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2688],171
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_SHIFT) = #Key_LEFT_SHIFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2720],148
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_CONTROL) = #Key_LEFT_CONTROL 
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2728],149
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_ALT) = #Key_LEFT_ALT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2736],150
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_SUPER) = #Key_LEFT_SUPER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2744],183
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_SHIFT) = #Key_RIGHT_SHIFT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2752],151
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_CONTROL) = #Key_RIGHT_CONTROL
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2760],152
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_ALT) = #Key_RIGHT_ALT
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2768],153
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_SUPER) = #Key_RIGHT_SUPER
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2776],184
; SGL\Keyboard\GLFW2SGL(#GLFW_KEY_MENU) = #Key_MENU
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  POP    rbp
  MOV    rbp,qword [rbp+0]
  MOV    qword [rbp+2784],185
; EndProcedure
_EndProcedureZero3001:
  XOR    rax,rax
_EndProcedure3001:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure EnableVSync (flag)
_Procedure2936:
  MOV    qword [rsp+8],rcx
  PS2936=48
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; flag = math::Clamp(flag, 0, 1) 
  PUSH   qword 1
  PUSH   qword 0
  PUSH   qword [rsp+PS2936+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure82
  MOV    qword [rsp+PS2936+0],rax
; glfwSwapInterval(flag)
  PUSH   qword [rsp+PS2936+0]
  POP    rcx
  CALL   glfwSwapInterval
; EndProcedure
_EndProcedureZero2937:
  XOR    rax,rax
_EndProcedure2937:
  ADD    rsp,40
  RET
; Procedure SetWindowPos (win, x, y)
_Procedure2838:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2838=48
  SUB    rsp,40
; 
; glfwSetWindowPos(win, x, y)
  PUSH   qword [rsp+PS2838+16]
  PUSH   qword [rsp+PS2838+16]
  PUSH   qword [rsp+PS2838+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glfwSetWindowPos
; EndProcedure
_EndProcedureZero2839:
  XOR    rax,rax
_EndProcedure2839:
  ADD    rsp,40
  RET
; Procedure SetUniformFloat (uniform, v0.f)
_Procedure2982:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  PS2982=48
  SUB    rsp,40
; 
; glUniform1f_(uniform, v0)
  MOV    eax,dword [rsp+PS2982+8]
  PUSH   rax
  PUSH   qword [rsp+PS2982+8]
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  CALL   qword [gl.v_glUniform1f_]
; EndProcedure
_EndProcedureZero2983:
  XOR    rax,rax
_EndProcedure2983:
  ADD    rsp,40
  RET
; Procedure.i GetContextVersionToken()
_Procedure2764:
  PUSH   r15
  PUSH   r14
  PS2764=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected maj, min
; GetContextVersion (@maj, @min)   
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2762
; ProcedureReturn maj * 100 + min * 10
  MOV    r15,qword [rsp+40]
  IMUL   r15,100
  MOV    r14,qword [rsp+48]
  IMUL   r14,10
  ADD    r15,r14
  MOV    rax,r15
  JMP   _EndProcedure2765
; EndProcedure
_EndProcedureZero2765:
  XOR    rax,rax
_EndProcedure2765:
  ADD    rsp,56
  POP    r14
  POP    r15
  RET
; Procedure callback_error_opengl (source, type, id, severity, length, *message, *userParam)
_Procedure3012:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PUSH   r15
  PS3012=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; Protected source$, type$, severity$, out$
; Protected myseverity 
; 
; If SGL\fpCallBack_Error     
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf299
; Select source
  PUSH   qword [rsp+PS3012+0]
; Case #GL_DEBUG_SOURCE_API:             source$ = "API"
  MOV    r15,33350
  CMP    r15,[rsp]
  JNE   _Case82
  MOV    rdx,_S896
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_SOURCE_WINDOW_SYSTEM:   source$ = "Window System" 
  JMP   _EndSelect10
_Case82:
  MOV    r15,33351
  CMP    r15,[rsp]
  JNE   _Case83
  MOV    rdx,_S897
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_SOURCE_SHADER_COMPILER: source$ = "Compiler"
  JMP   _EndSelect10
_Case83:
  MOV    r15,33352
  CMP    r15,[rsp]
  JNE   _Case84
  MOV    rdx,_S898
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_SOURCE_THIRD_PARTY:     source$ = "Third Party"
  JMP   _EndSelect10
_Case84:
  MOV    r15,33353
  CMP    r15,[rsp]
  JNE   _Case85
  MOV    rdx,_S899
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_SOURCE_APPLICATION:     source$ = "Application"
  JMP   _EndSelect10
_Case85:
  MOV    r15,33354
  CMP    r15,[rsp]
  JNE   _Case86
  MOV    rdx,_S900
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_SOURCE_OTHER:           source$ = "Other"
  JMP   _EndSelect10
_Case86:
  MOV    r15,33355
  CMP    r15,[rsp]
  JNE   _Case87
  MOV    rdx,_S901
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; EndSelect
_Case87:
_EndSelect10:
  ADD    rsp,8
; 
; Select type        
  PUSH   qword [rsp+PS3012+8]
; Case #GL_DEBUG_TYPE_ERROR:               type$ = "Error"
  MOV    r15,33356
  CMP    r15,[rsp]
  JNE   _Case88
  MOV    rdx,_S902
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: type$ = "Deprecated Behaviour"
  JMP   _EndSelect11
_Case88:
  MOV    r15,33357
  CMP    r15,[rsp]
  JNE   _Case89
  MOV    rdx,_S903
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR:  type$ = "Undefined Behaviour"
  JMP   _EndSelect11
_Case89:
  MOV    r15,33358
  CMP    r15,[rsp]
  JNE   _Case90
  MOV    rdx,_S904
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_PORTABILITY:         type$ = "Portability"
  JMP   _EndSelect11
_Case90:
  MOV    r15,33359
  CMP    r15,[rsp]
  JNE   _Case91
  MOV    rdx,_S905
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_PERFORMANCE:         type$ = "Performance"
  JMP   _EndSelect11
_Case91:
  MOV    r15,33360
  CMP    r15,[rsp]
  JNE   _Case92
  MOV    rdx,_S906
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_MARKER:              type$ = "Marker"
  JMP   _EndSelect11
_Case92:
  MOV    r15,33384
  CMP    r15,[rsp]
  JNE   _Case93
  MOV    rdx,_S907
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_PUSH_GROUP:          type$ = "Push Group"
  JMP   _EndSelect11
_Case93:
  MOV    r15,33385
  CMP    r15,[rsp]
  JNE   _Case94
  MOV    rdx,_S908
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_POP_GROUP:           type$ = "Pop Group"
  JMP   _EndSelect11
_Case94:
  MOV    r15,33386
  CMP    r15,[rsp]
  JNE   _Case95
  MOV    rdx,_S909
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_DEBUG_TYPE_OTHER:               type$ = "Other"       
  JMP   _EndSelect11
_Case95:
  MOV    r15,33361
  CMP    r15,[rsp]
  JNE   _Case96
  MOV    rdx,_S901
  LEA    rcx,[rsp+56]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; EndSelect
_Case96:
_EndSelect11:
  ADD    rsp,8
; 
; Select severity
  PUSH   qword [rsp+PS3012+24]
; Case #GL_DEBUG_SEVERITY_HIGH:         severity$ = "High" : myseverity = #DEBUG_OUPUT_HIGH
  MOV    r15,37190
  CMP    r15,[rsp]
  JNE   _Case97
  MOV    rdx,_S910
  LEA    rcx,[rsp+64]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
  MOV    qword [rsp+80],3
; Case #GL_DEBUG_SEVERITY_MEDIUM:       severity$ = "Medium" : myseverity = #DEBUG_OUPUT_MEDIUM
  JMP   _EndSelect12
_Case97:
  MOV    r15,37191
  CMP    r15,[rsp]
  JNE   _Case98
  MOV    rdx,_S911
  LEA    rcx,[rsp+64]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
  MOV    qword [rsp+80],2
; Case #GL_DEBUG_SEVERITY_LOW:          severity$ = "Low" : myseverity = #DEBUG_OUPUT_LOW
  JMP   _EndSelect12
_Case98:
  MOV    r15,37192
  CMP    r15,[rsp]
  JNE   _Case99
  MOV    rdx,_S912
  LEA    rcx,[rsp+64]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
  MOV    qword [rsp+80],1
; Case #GL_DEBUG_SEVERITY_NOTIFICATION: severity$ = "Notifications" : myseverity = #DEBUG_OUPUT_NOTIFICATIONS
  JMP   _EndSelect12
_Case99:
  MOV    r15,33387
  CMP    r15,[rsp]
  JNE   _Case100
  MOV    rdx,_S913
  LEA    rcx,[rsp+64]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
  MOV    qword [rsp+80],0
; EndSelect
_Case100:
_EndSelect12:
  ADD    rsp,8
; 
; If myseverity >= SGL\debugOutputLevel            
  MOV    r15,qword [rsp+72]
  LEA    rbp,[sgl.v_SGL]
  CMP    r15,qword [rbp+8]
  JL    _EndIf301
; out$ = "Src: " + source$ + ", Type: " + type$ + ", " + severity$ + ", " + PeekS(*message, -1, #PB_UTF8)       
  PUSH   qword [PB_StringBasePosition]
  MOV    rcx,_S914
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S915
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S771
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S771
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 2
  PUSH   qword -1
  PUSH   qword [rsp+PS3012+80]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; SGL\fpCallBack_Error(#SOURCE_OPENGL$, out$)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  PUSH   qword [rsp+80]
  MOV    rax,_S916
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf     
_EndIf301:
; EndIf
_EndIf299:
; EndProcedure
_EndProcedureZero3013:
  XOR    rax,rax
_EndProcedure3013:
  PUSH   rax
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,88
  POP    r15
  POP    rbp
  RET
; ProcedureC callback_window_maximize (win, maximized.l)
_Procedure3024:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3024=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowMaximize
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+212],0
  JE    _EndIf313
; SGL\fpCallBack_WindowMaximize(win, maximized)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+212]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3024+24]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3024+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf313:
; EndProcedure
_EndProcedureZero3025:
  XOR    rax,rax
_EndProcedure3025:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure AddShaderObject (*objects.ShaderObjects, shader)
_Procedure2958:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2958=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; AddElement(*objects\shader())
  MOV    rbp,qword [rsp+PS2958+0]
  PUSH   qword [rbp+0]
  POP    rcx
  CALL   PB_AddElement
; *objects\shader() = shader
  PUSH   qword [rsp+PS2958+8]
  MOV    rbp,qword [rsp+PS2958+8]
  MOV    rbp,qword [rbp+0+8]
  POP    rax
  MOV    qword [rbp+16],rax
; EndProcedure
_EndProcedureZero2959:
  XOR    rax,rax
_EndProcedure2959:
  ADD    rsp,48
  POP    rbp
  RET
; ProcedureC callback_error_glfw (err, *desc)
_Procedure3010:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3010=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_Error 
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf297
; SGL\fpCallBack_Error(#SOURCE_GLFW$, PeekS(*desc, -1, #PB_UTF8) + " (ErrCode = " + Str(err) + ") ")
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 2
  PUSH   qword -1
  PUSH   qword [rsp+PS3010+64]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  MOV    rcx,_S894
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+PS3010+40]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Str
  ADD    rsp,32
  POP    rax
  MOV    rcx,_S895
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  ADD    qword [PB_StringBasePosition],2
  MOV    rax,_S893
  PUSH   rax
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+8],rdx
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,32
  POP    qword [PB_StringBasePosition]
  ADD    rsp,8
; EndIf 
_EndIf297:
; EndProcedure
_EndProcedureZero3011:
  XOR    rax,rax
_EndProcedure3011:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure RegisterErrorCallBack (*fp)
_Procedure2716:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2716=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; SGL\fpCallBack_Error = *fp
  PUSH   qword [rsp+PS2716+0]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+164],rax
; EndProcedure
_EndProcedureZero2717:
  XOR    rax,rax
_EndProcedure2717:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Shutdown()
_Procedure2714:
  PUSH   rbp
  PS2714=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; glfwLoad::Shutdown()
  CALL  _Procedure348
; 
; DestroyTimer(SGL\TrackFps\timerFps)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+96]
  POP    rcx
  CALL  _Procedure2736
; DestroyTimer(SGL\TrackFps\timerFullFrame)  
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+116]
  POP    rcx
  CALL  _Procedure2736
; 
; DestroyTimer(SGL\TrackFrameTime\timerFrame) 
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+124]
  POP    rcx
  CALL  _Procedure2736
; DestroyTimer(SGL\TrackFrameTime\timerFrameAccum) 
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+132]
  POP    rcx
  CALL  _Procedure2736
; 
; init_sgl_obj()
  CALL  _Procedure2994
; EndProcedure
_EndProcedureZero2715:
  XOR    rax,rax
_EndProcedure2715:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure MakeContextCurrent (win)
_Procedure2752:
  MOV    qword [rsp+8],rcx
  PS2752=48
  SUB    rsp,40
; 
; glfwMakeContextCurrent (win)
  PUSH   qword [rsp+PS2752+0]
  POP    rcx
  CALL   glfwMakeContextCurrent
; EndProcedure
_EndProcedureZero2753:
  XOR    rax,rax
_EndProcedure2753:
  ADD    rsp,40
  RET
; Procedure ClearShaderObjects (*objects.ShaderObjects)
_Procedure2960:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2960=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; ClearList(*objects\shader())
  MOV    rbp,qword [rsp+PS2960+0]
  PUSH   qword [rbp+0]
  POP    rcx
  CALL   PB_ClearList
; EndProcedure
_EndProcedureZero2961:
  XOR    rax,rax
_EndProcedure2961:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure init_window_hints()
_Procedure2996:
  PUSH   rbp
  PS2996=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; SGL\hintWinOpenglDebug = 0
  LEA    rbp,[sgl.v_SGL]
  MOV    qword [rbp+284],0
; SGL\hintWinOpenglMajor = 1
  MOV    qword [rbp+292],1
; SGL\hintWinOpenglMinor = 0
  MOV    qword [rbp+300],0
; SGL\hintWinOpenglDepthBuffer = 24
  MOV    qword [rbp+308],24
; SGL\hintWinOpenglStencilBits = 8
  MOV    qword [rbp+316],8
; SGL\hintWinOpenglAccumulatorBits = 0
  MOV    qword [rbp+324],0
; SGL\hintWinOpenglSamples = 0
  MOV    qword [rbp+332],0
; SGL\hintWinOpenglProfile = #PROFILE_ANY
  MOV    qword [rbp+340],1
; SGL\hintWinOpenglForwardCompatibile = 0
  MOV    qword [rbp+348],0
; 
; SGL\hintWinVisible = 1 
  MOV    qword [rbp+356],1
; SGL\hintWinResizable = 1
  MOV    qword [rbp+364],1
; SGL\hintWinMaximized = 0
  MOV    qword [rbp+372],0
; SGL\hintWinDecorated = 1
  MOV    qword [rbp+380],1
; SGL\hintWinTopMost = 0
  MOV    qword [rbp+388],0
; SGL\hintWinFocused = 1
  MOV    qword [rbp+396],1
; SGL\hintWinCenteredCursor = 1
  MOV    qword [rbp+404],1
; SGL\hintWinAutoMinimize = 1
  MOV    qword [rbp+412],1
; SGL\hintWinFrameBufferDepth = 24
  MOV    qword [rbp+420],24
; SGL\hintWinFrameBufferTransparent = 0
  MOV    qword [rbp+428],0
; SGL\hintWinRefreshRate = #DONT_CARE
  MOV    qword [rbp+436],-1
; EndProcedure
_EndProcedureZero2997:
  XOR    rax,rax
_EndProcedure2997:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i GetKeyPress (key)
_Procedure2804:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2804=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; Protected pressed, status
; 
; status = GetKey (key)
  PUSH   qword [rsp+PS2804+0]
  POP    rcx
  CALL  _Procedure2802
  MOV    qword [rsp+48],rax
; 
; Select status
  PUSH   qword [rsp+48]
; Case #PRESSED
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case135
; If SGL\Keyboard\Keys(key)\keyPressed = 1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS2804+16]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    r15,qword [rbp+8]
  CMP    r15,1
  JNE   _EndIf429
; pressed = 0
  MOV    qword [rsp+48],0
; Else
  JMP   _EndIf428
_EndIf429:
; SGL\Keyboard\Keys(key)\keyPressed = 1
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS2804+16]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp+8],1
; pressed = 1
  MOV    qword [rsp+48],1
; EndIf
_EndIf428:
; Case #RELEASED
  JMP   _EndSelect20
_Case135:
  XOR    r15,r15
  CMP    r15,[rsp]
  JNE   _Case136
; pressed = 0
  MOV    qword [rsp+48],0
; EndSelect
_Case136:
_EndSelect20:
  ADD    rsp,8
; 
; ProcedureReturn pressed
  MOV    rax,qword [rsp+40]
  JMP   _EndProcedure2805
; EndProcedure
_EndProcedureZero2805:
  XOR    rax,rax
_EndProcedure2805:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure init_sgl_obj() 
_Procedure2994:
  PUSH   rbp
  PS2994=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; SGL\initialized = 0 
  LEA    rbp,[sgl.v_SGL]
  MOV    qword [rbp],0
; SGL\debugOutputLevel = 0
  MOV    qword [rbp+8],0
; 
; SGL\TrackFps\fps = 0
  MOV    qword [rbp+80],0
; SGL\TrackFps\fpsCount = 0
  MOV    qword [rbp+88],0
; SGL\TrackFps\timerFps = 0
  MOV    qword [rbp+96],0
; 
; SGL\TrackFps\maxFps = 0
  MOV    qword [rbp+104],0
; SGL\TrackFps\timerFullFrame = 0
  MOV    qword [rbp+116],0
; SGL\TrackFps\targetFrameTime = 0.0
  MOV    dword [rbp+112],0
; 
; SGL\TrackFrameTime\timerFrame = 0
  MOV    qword [rbp+124],0
; SGL\TrackFrameTime\timerFrameAccum = 0
  MOV    qword [rbp+132],0
; SGL\TrackFrameTime\frameCount = 0
  MOV    qword [rbp+140],0
; SGL\TrackFrameTime\frameTime = 0.0
  MOV    dword [rbp+148],0
; SGL\TrackFrameTime\frameTimeAccum = 0.0
  MOV    dword [rbp+152],0
; 
; SGL\fpCallBack_Error = 0
  MOV    qword [rbp+164],0
; SGL\fpCallBack_WindowClose = 0
  MOV    qword [rbp+172],0
; SGL\fpCallBack_WindowPos = 0
  MOV    qword [rbp+180],0
; SGL\fpCallBack_WindowSize = 0
  MOV    qword [rbp+188],0
; SGL\fpCallBack_WindowFocus = 0
  MOV    qword [rbp+196],0
; SGL\fpCallBack_WindowMinimize = 0
  MOV    qword [rbp+204],0
; SGL\fpCallBack_WindowMaximize = 0
  MOV    qword [rbp+212],0
; SGL\fpCallBack_WindowFrameBufferSize = 0
  MOV    qword [rbp+220],0
; SGL\fpCallBack_WindowRefresh = 0
  MOV    qword [rbp+228],0
; SGL\fpCallBack_WindowScroll = 0
  MOV    qword [rbp+236],0
; SGL\fpCallBack_Key = 0
  MOV    qword [rbp+244],0
; SGL\fpCallBack_Char = 0
  MOV    qword [rbp+252],0
; SGL\fpCallBack_CursorPos = 0
  MOV    qword [rbp+260],0
; SGL\fpCallBack_CursorEntering = 0
  MOV    qword [rbp+268],0
; SGL\fpCallBack_MouseButton = 0
  MOV    qword [rbp+276],0
; 
; Dim ExtensionsStrings$(0)
  SUB    rsp,24
  MOV    rdx,1
  LEA    rax,[rsp+64]
  PUSH   rax
  MOV    r9,s_s
  MOV    r8,8
  MOV    rcx,8
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rsp+40],rax
; 
; init_window_hints()
  CALL  _Procedure2996
; 
; init_keyboard()
  CALL  _Procedure3000
; 
; init_mouse()
  CALL  _Procedure2998
; 
; glLoad::RegisterCallBack(glLoad::#CallBack_GetProcAddress, @callback_getprocaddress())
  LEA    rax,[_Procedure3006]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 0
  POP    rcx
  POP    rdx
  CALL  _Procedure2502
; EndProcedure 
_EndProcedureZero2995:
  XOR    rax,rax
_EndProcedure2995:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeArray
  ADD    rsp,40
  POP    rax
  ADD    rsp,64
  POP    rbp
  RET
; ProcedureC callback_window_close (win)
_Procedure3014:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS3014=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowClose
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+172],0
  JE    _EndIf303
; SGL\fpCallBack_WindowClose(win)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+172]
  SUB    rsp,8
  PUSH   qword [rsp+PS3014+16]
  POP    rcx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf303:
; EndProcedure
_EndProcedureZero3015:
  XOR    rax,rax
_EndProcedure3015:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetUniformLong (uniform, v0.l)
_Procedure2978:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PS2978=48
  SUB    rsp,40
; 
; glUniform1i_(uniform, v0)
  MOVSXD rax,dword [rsp+PS2978+8]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2978+8]
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glUniform1i_]
; EndProcedure
_EndProcedureZero2979:
  XOR    rax,rax
_EndProcedure2979:
  ADD    rsp,40
  RET
; ProcedureC callback_window_frambuffer_size (win, width.l, height.l)
_Procedure3026:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS3026=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowFrameBufferSize
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+220],0
  JE    _EndIf315
; SGL\fpCallBack_WindowFrameBufferSize(win, width, height)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+220]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3026+32]
  MOV    rax,rax
  PUSH   rax
  MOVSXD rax,dword [rsp+PS3026+32]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3026+32]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf315:
; EndProcedure
_EndProcedureZero3027:
  XOR    rax,rax
_EndProcedure3027:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.s GetKeyString (key)
_Procedure2806:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2806=64
  SUB    rsp,40
  MOV    rax,[rsp+PS2806+32]
  MOV    qword [PB_StringBasePosition],rax
; 
; 
; 
; 
; 
; 
; 
; 
; 
; ProcedureReturn SGL\Keyboard\Text$(key)
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS2806+8]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  SAL    r15,3
  MOV    rcx,qword [rbp+r15]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure2807
; EndProcedure
_EndProcedureZero2807:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure2807:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.i CreateBitmapFontData (fontName$, fontSize, fontFlags, Array ranges.BitmapFontRange(1), width, height)
_Procedure2950:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PS2950=224
  MOV    rax,19
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rdx,[rsp+PS2950+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rax,qword [rsp+PS2950+24]
  MOV    qword [rsp+48],rax
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; Protected hDC, image, x, y, highestRow, highestFont
; Protected char$, char, gw, gh
; Protected font, *bmf.BitmapFontData
; Protected range, rangeSize, rangesCount = ArraySize(ranges())
  MOV    rcx,[rsp+48]
  PUSH   qword [rcx]
  POP    rcx
  CALL   PB_ArraySize
  MOV    qword [rsp+168],rax
; 
; font = LoadFont(#PB_Any, fontName$, fontSize, fontFlags)
  PUSH   qword [rsp+PS2950+16]
  PUSH   qword [rsp+PS2950+16]
  PUSH   qword [rsp+56]
  PUSH   qword -1
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   PB_LoadFont2
  MOV    qword [rsp+136],rax
; 
; If font = 0 : Goto exit : EndIf 
  MOV    r15,qword [rsp+136]
  AND    r15,r15
  JNE   _EndIf621
  JMP    sgl.ll_createbitmapfontdata_exit
_EndIf621:
; 
; image = CreateImage(#PB_Any, width, height, 32, #PB_Image_Transparent) 
  SUB    rsp,8
  PUSH   qword -1
  PUSH   qword 32
  PUSH   qword [rsp+PS2950+64]
  PUSH   qword [rsp+PS2950+64]
  PUSH   qword -1
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_CreateImage3
  ADD    rsp,48
  MOV    qword [rsp+64],rax
; 
; If image = 0 : Goto exit : EndIf
  MOV    r15,qword [rsp+64]
  AND    r15,r15
  JNE   _EndIf623
  JMP    sgl.ll_createbitmapfontdata_exit
_EndIf623:
; 
; *bmf = AllocateStructure(BitmapFontData)
  MOV    rax,s_sgl.bitmapfontdata
  PUSH   rax
  PUSH   qword 104
  POP    rcx
  POP    rdx
  CALL   PB_AllocateStructure
  MOV    qword [rsp+144],rax
; 
; If *bmf = 0 : Goto exit : EndIf
  MOV    r15,qword [rsp+144]
  AND    r15,r15
  JNE   _EndIf625
  JMP    sgl.ll_createbitmapfontdata_exit
_EndIf625:
; 
; CopyArray(ranges(), *bmf\ranges())
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+96]
  MOV    rcx,[rsp+56]
  PUSH   qword [rcx]
  POP    rcx
  POP    rdx
  CALL   PB_CopyArray
; 
; hDC = StartDrawing(ImageOutput(image)) 
  PUSH   qword [rsp+64]
  POP    rcx
  CALL   PB_ImageOutput
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL   PB_StartDrawing
  MOV    qword [rsp+56],rax
; DrawingFont(FontID(font))
  PUSH   qword [rsp+136]
  POP    rcx
  CALL   PB_FontID
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL   PB_DrawingFont
; FrontColor(RGBA(255,255,255,255))
  MOV    rax,4294967295
  PUSH   rax
  POP    rcx
  CALL   PB_FrontColor
; BackColor(RGBA(0,0,0,0))
  PUSH   qword 0
  POP    rcx
  CALL   PB_BackColor
; DrawingMode(#PB_2DDrawing_AlphaBlend)
  PUSH   qword 16
  POP    rcx
  CALL   PB_DrawingMode
; 
; x = 1 : y = 1
  MOV    qword [rsp+72],1
  MOV    qword [rsp+80],1
; 
; 
; gw = TextWidth(" ")
  MOV    rax,_S13
  PUSH   rax
  POP    rcx
  CALL   PB_TextWidth
  MOV    qword [rsp+120],rax
; gh = TextHeight(" ")
  MOV    rax,_S13
  PUSH   rax
  POP    rcx
  CALL   PB_TextHeight
  MOV    qword [rsp+128],rax
; Box(x, y, gw, gh)
  PUSH   qword [rsp+128]
  PUSH   qword [rsp+128]
  PUSH   qword [rsp+96]
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   PB_Box
; 
; 
; *bmf\block\char = -1 
  MOV    rbp,qword [rsp+144]
  MOV    qword [rbp+48],-1
; *bmf\block\x = x
  PUSH   qword [rsp+72]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+56],rax
; *bmf\block\y = y
  PUSH   qword [rsp+80]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+64],rax
; *bmf\block\w = gw
  PUSH   qword [rsp+120]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+72],rax
; *bmf\block\h = gh
  PUSH   qword [rsp+128]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+80],rax
; *bmf\block\xOffset = gw + 1
  MOV    r15,qword [rsp+120]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+88],rax
; 
; x = x + gw
  MOV    r15,qword [rsp+72]
  ADD    r15,qword [rsp+120]
  MOV    qword [rsp+72],r15
; 
; 
; 
; For range = 0 To rangesCount
  MOV    qword [rsp+152],0
  JMP   _ForSkipDebug626
_For626:
_ForSkipDebug626:
  MOV    rax,qword [rsp+168]
  CMP    rax,qword [rsp+152]
  JL    _Next627
; 
; 
; rangeSize = *bmf\ranges(range)\lastChar - *bmf\ranges(range)\firstChar
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r15,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  MOV    r15,qword [rbp+8]
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r14,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r14,24
  ADD    rbp,r14
  SUB    r15,qword [rbp]
  MOV    qword [rsp+160],r15
; 
; ASSERT(rangeSize)
; 
; 
; Dim *bmf\ranges(range)\Glyphs(rangeSize) 
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r15,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    rax,qword [rsp+168]
  INC    rax
  POP    rbp
  SUB    rsp,24
  MOV    rdx,rax
  LEA    rax,[rbp+16]
  PUSH   rax
  XOR    r9,r9
  MOV    r8,7
  MOV    rcx,48
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rbp+16],rax
; 
; For char = *bmf\ranges(range)\firstChar To *bmf\ranges(range)\lastChar
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r15,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   qword [rbp]
  POP    rax
  MOV    qword [rsp+112],rax
  JMP   _ForSkipDebug628
_For628:
_ForSkipDebug628:
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r15,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  MOV    rax,qword [rbp+8]
  CMP    rax,qword [rsp+112]
  JL    _Next629
; 
; char$ = Chr(char)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+136]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Chr
  ADD    rsp,40
  LEA    rcx,[rsp+112]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; gw = TextWidth(char$)
  PUSH   qword [rsp+104]
  POP    rcx
  CALL   PB_TextWidth
  MOV    qword [rsp+120],rax
; gh = TextHeight(char$)
  PUSH   qword [rsp+104]
  POP    rcx
  CALL   PB_TextHeight
  MOV    qword [rsp+128],rax
; 
; If y + gh > height
  MOV    r15,qword [rsp+80]
  ADD    r15,qword [rsp+128]
  CMP    r15,qword [rsp+PS2950+40]
  JLE   _EndIf631
; 
; Goto exit:
  JMP    sgl.ll_createbitmapfontdata_exit
; EndIf
_EndIf631:
; 
; If gh > highestRow
  MOV    r15,qword [rsp+128]
  CMP    r15,qword [rsp+88]
  JLE   _EndIf633
; highestRow = gh
  PUSH   qword [rsp+128]
  POP    rax
  MOV    qword [rsp+88],rax
; EndIf
_EndIf633:
; 
; If gh > highestFont
  MOV    r15,qword [rsp+128]
  CMP    r15,qword [rsp+96]
  JLE   _EndIf635
; highestFont = gh
  PUSH   qword [rsp+128]
  POP    rax
  MOV    qword [rsp+96],rax
; EndIf
_EndIf635:
; 
; If x + gw > width
  MOV    r15,qword [rsp+72]
  ADD    r15,qword [rsp+120]
  CMP    r15,qword [rsp+PS2950+32]
  JLE   _EndIf637
; y + highestRow
  MOV    r15,qword [rsp+80]
  ADD    r15,qword [rsp+88]
  MOV    qword [rsp+80],r15
; highestRow = 0
  MOV    qword [rsp+88],0
; x = 1
  MOV    qword [rsp+72],1
; EndIf
_EndIf637:
; 
; DrawText(x, y, char$)
  PUSH   qword [rsp+104]
  PUSH   qword [rsp+88]
  PUSH   qword [rsp+88]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   PB_DrawText
; 
; Protected i  = char - *bmf\ranges(range)\firstChar
  MOV    r15,qword [rsp+112]
  MOV    rbp,qword [rsp+144]
  PUSH   rbp
  MOV    r14,qword [rsp+160]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r14,24
  ADD    rbp,r14
  SUB    r15,qword [rbp]
  MOV    qword [rsp+176],r15
; 
; *bmf\ranges(range)\Glyphs(i)\char = char
  PUSH   qword [rsp+112]
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp],rax
; *bmf\ranges(range)\Glyphs(i)\x = x
  PUSH   qword [rsp+72]
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp+8],rax
; *bmf\ranges(range)\Glyphs(i)\y = y
  PUSH   qword [rsp+80]
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp+16],rax
; *bmf\ranges(range)\Glyphs(i)\w = gw
  PUSH   qword [rsp+120]
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp+24],rax
; *bmf\ranges(range)\Glyphs(i)\h = gh
  PUSH   qword [rsp+128]
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp+32],rax
; *bmf\ranges(range)\Glyphs(i)\xOffset = gw + 1
  MOV    r15,qword [rsp+120]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+152]
  PUSH   rbp
  MOV    r15,qword [rsp+168]
  POP    rbp
  MOV    rbp,qword [rbp+96]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+192]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  POP    rax
  MOV    qword [rbp+40],rax
; 
; x = x + gw
  MOV    r15,qword [rsp+72]
  ADD    r15,qword [rsp+120]
  MOV    qword [rsp+72],r15
; Next
_NextContinue629:
  INC    qword [rsp+112]
  JNO   _For628
_Next629:
; Next  
_NextContinue627:
  INC    qword [rsp+152]
  JNO   _For626
_Next627:
; StopDrawing()
  CALL   PB_StopDrawing
; 
; FreeFont(font)
  PUSH   qword [rsp+136]
  POP    rcx
  CALL   PB_FreeFont
; 
; *bmf\fontName$ = fontName$
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rbp,qword [rsp+152]
  LEA    rcx,[rbp]
  POP    rdx
  CALL   SYS_AllocateString4
; *bmf\fontSize = fontSize
  PUSH   qword [rsp+PS2950+8]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+8],rax
; *bmf\yOffset = highestFont
  PUSH   qword [rsp+96]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+40],rax
; *bmf\italic = Bool(fontFlags & #PB_Font_Italic)
  MOV    r15,qword [rsp+PS2950+16]
  AND    r15,512
_Bool1:
  AND    r15,r15
  JE    .False
  MOV    rax,1
  JMP   .True
.False:
  XOR    rax,rax
.True:
  MOV    rax,rax
  PUSH   rax
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+24],rax
; *bmf\bold = Bool(fontFlags & #PB_Font_Bold)
  MOV    r15,qword [rsp+PS2950+16]
  AND    r15,256
_Bool2:
  AND    r15,r15
  JE    .False
  MOV    rax,1
  JMP   .True
.False:
  XOR    rax,rax
.True:
  MOV    rax,rax
  PUSH   rax
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+32],rax
; *bmf\image = image
  PUSH   qword [rsp+64]
  MOV    rbp,qword [rsp+152]
  POP    rax
  MOV    qword [rbp+16],rax
; 
; ProcedureReturn *bmf
  MOV    rax,qword [rsp+144]
  JMP   _EndProcedure2951
; 
; exit:
sgl.ll_createbitmapfontdata_exit:
; 
; If hDC : StopDrawing() : EndIf
  CMP    qword [rsp+56],0
  JE    _EndIf639
  CALL   PB_StopDrawing
_EndIf639:
; If image : FreeImage(image) : EndIf
  CMP    qword [rsp+64],0
  JE    _EndIf641
  PUSH   qword [rsp+64]
  POP    rcx
  CALL   PB_FreeImage
_EndIf641:
; If font : FreeFont(font) : EndIf
  CMP    qword [rsp+136],0
  JE    _EndIf643
  PUSH   qword [rsp+136]
  POP    rcx
  CALL   PB_FreeFont
_EndIf643:
; If *bmf : FreeStructure(*bmf) : EndIf 
  CMP    qword [rsp+144],0
  JE    _EndIf645
  PUSH   qword [rsp+144]
  POP    rcx
  CALL   PB_FreeStructure
_EndIf645:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2951
; EndProcedure
_EndProcedureZero2951:
  XOR    rax,rax
_EndProcedure2951:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+112]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,192
  POP    r14
  POP    r15
  POP    rbp
  RET
; ProcedureC callback_window_refresh (win)
_Procedure3028:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS3028=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowRefresh
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+228],0
  JE    _EndIf317
; SGL\fpCallBack_WindowRefresh(win)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+228]
  SUB    rsp,8
  PUSH   qword [rsp+PS3028+16]
  POP    rcx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf317:
; EndProcedure
_EndProcedureZero3029:
  XOR    rax,rax
_EndProcedure3029:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure init_mouse()
_Procedure2998:
  PUSH   rbp
  PS2998=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; SGL\Mouse\scrollOffsetX = 0.0
  LEA    rbp,[sgl.v_SGL]
  FLD    qword [D2]
  FSTP   qword [rbp+16]
; SGL\Mouse\scrollOffsetY = 0.0
  FLD    qword [D2]
  FSTP   qword [rbp+24]
; EndProcedure
_EndProcedureZero2999:
  XOR    rax,rax
_EndProcedure2999:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i GetCurrentContext()
_Procedure2754:
  PS2754=48
  SUB    rsp,40
; 
; ProcedureReturn glfwGetCurrentContext()
  CALL   glfwGetCurrentContext
  JMP   _EndProcedure2755
; EndProcedure 
_EndProcedureZero2755:
  XOR    rax,rax
_EndProcedure2755:
  ADD    rsp,40
  RET
; Procedure.i CountExtensionsStrings()
_Procedure2774:
  PUSH   rbp
  PUSH   r15
  PS2774=64
  SUB    rsp,40
; 
; 
; 
; ProcedureReturn ArraySize(SGL\ExtensionsStrings$()) 
  LEA    rbp,[sgl.v_SGL]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+156]
  POP    rcx
  CALL   PB_ArraySize
  JMP   _EndProcedure2775
; EndProcedure
_EndProcedureZero2775:
  XOR    rax,rax
_EndProcedure2775:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; ProcedureC callback_window_cursor_position (win, x.d, y.d)
_Procedure3036:
  MOV    qword [rsp+8],rcx
  MOVSD  qword [rsp+16],xmm1
  MOVSD  qword [rsp+24],xmm2
  PUSH   rbp
  PS3036=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_CursorPos
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+260],0
  JE    _EndIf329
; SGL\fpCallBack_CursorPos(win, x, y)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+260]
  SUB    rsp,8
  PUSH   qword [rsp+PS3036+32]
  PUSH   qword [rsp+PS3036+32]
  PUSH   qword [rsp+PS3036+32]
  POP    rcx
  MOVSD  xmm1,qword [rsp]
  ADD    rsp,8
  MOVSD  xmm2,qword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf329:
; EndProcedure
_EndProcedureZero3037:
  XOR    rax,rax
_EndProcedure3037:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure GetContextVersion (*major, *minor)
_Procedure2762:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   r15
  PS2762=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; Protected maj, min, ret
; 
; ClearGlErrors()
  CALL  _Procedure2748
; 
; glGetIntegerv_(#GL_MAJOR_VERSION, @maj) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33307
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf388
  JMP    sgl.ll_getcontextversion_fallback
_EndIf388:
; glGetIntegerv_(#GL_MINOR_VERSION, @min) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33308
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf390
  JMP    sgl.ll_getcontextversion_fallback
_EndIf390:
; 
; PokeI(*major, maj)
  PUSH   qword [rsp+40]
  PUSH   qword [rsp+PS2762+8]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; PokeI(*minor, min)
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+PS2762+16]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; 
; ProcedureReturn 
  JMP   _EndProcedure2763
; 
; fallback:
sgl.ll_getcontextversion_fallback:
; 
; Protected ver$ = PeekS(glGetString_(#GL_VERSION), -1, #PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword 7938
  POP    rcx
  SUB    rsp,32
  CALL   glGetString
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; If glGetError_() = #GL_NO_ERROR
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf392
; maj = Val(StringField(ver$, 1, "."))
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+0],rdx
  POP    rcx
  SUB    rsp,32
  CALL   PB_Val
  ADD    rsp,40
  POP    qword [PB_StringBasePosition]
  MOV    qword [rsp+40],rax
; min = Val(StringField(ver$, 2, "."))
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 2
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+0],rdx
  POP    rcx
  SUB    rsp,32
  CALL   PB_Val
  ADD    rsp,40
  POP    qword [PB_StringBasePosition]
  MOV    qword [rsp+48],rax
; 
; PokeI(*major, maj)
  PUSH   qword [rsp+40]
  PUSH   qword [rsp+PS2762+8]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; PokeI(*minor, min) 
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+PS2762+16]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; EndIf
_EndIf392:
; EndProcedure
_EndProcedureZero2763:
  XOR    rax,rax
_EndProcedure2763:
  PUSH   rax
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,80
  POP    r15
  RET
; Procedure.i GetProcAddress (func$)
_Procedure2770:
  MOV    qword [rsp+8],rcx
  PS2770=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2770+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; ProcedureReturn glfwGetProcAddress(func$)
  SUB    rsp,8
  SUB    rsp,8
  MOV    rcx,qword [rsp+56]
  SUB    rsp,32
  CALL   SYS_ToUTF8
  ADD    rsp,32
  PUSH   rax
  MOV    qword [rsp+16],rax
  POP    rcx
  SUB    rsp,32
  CALL   glfwGetProcAddress
  ADD    rsp,40
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,32
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,32
  POP    rax
  ADD    rsp,8
  JMP   _EndProcedure2771
; EndProcedure
_EndProcedureZero2771:
  XOR    rax,rax
_EndProcedure2771:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  RET
; Procedure DestroyBitmapFontData (*bmf.BitmapFontData)
_Procedure2952:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2952=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; FreeImage(*bmf\Image)
  MOV    rbp,qword [rsp+PS2952+0]
  PUSH   qword [rbp+16]
  POP    rcx
  CALL   PB_FreeImage
; FreeStructure(*bmf)
  PUSH   qword [rsp+PS2952+0]
  POP    rcx
  CALL   PB_FreeStructure
; EndProcedure
_EndProcedureZero2953:
  XOR    rax,rax
_EndProcedure2953:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure split_glsl_errors (errlog$)
_Procedure3008:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS3008=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS3008+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; Protected i, lines, newline$
; Dim lines$(0)
  SUB    rsp,24
  MOV    rdx,1
  LEA    rax,[rsp+96]
  PUSH   rax
  MOV    r9,s_s
  MOV    r8,8
  MOV    rcx,8
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rsp+72],rax
; 
; If FindString(errlog$, #CRLF$)
  MOV    rax,_S891
  PUSH   rax
  PUSH   qword [rsp+48]
  POP    rcx
  POP    rdx
  CALL   PB_FindString
  AND    rax,rax
  JE    _EndIf288
; newline$ = #CRLF$
  MOV    rdx,_S891
  LEA    rcx,[rsp+64]
  CALL   SYS_FastAllocateStringFree4
; Else   
  JMP   _EndIf287
_EndIf288:
; newline$ = #LF$
  MOV    rdx,_S2
  LEA    rcx,[rsp+64]
  CALL   SYS_FastAllocateStringFree4
; EndIf
_EndIf287:
; 
; lines = str::SplitToArray(errlog$, newline$, lines$())
  LEA    rax,qword [rsp+72]
  PUSH   rax
  PUSH   qword [rsp+72]
  PUSH   qword [rsp+56]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure26
  MOV    qword [rsp+56],rax
; 
; For i = 0 To lines - 1
  MOV    qword [rsp+48],0
  JMP   _ForSkipDebug290
_For290:
_ForSkipDebug290:
  MOV    r15,qword [rsp+56]
  DEC    r15
  CMP    r15,qword [rsp+48]
  JL    _Next291
; If Len(lines$(i))
  MOV    r15,qword [rsp+48]
  MOV    rbp,qword [rsp+72]
  SAL    r15,3
  PUSH   qword [rbp+r15]
  POP    rcx
  CALL   PB_Len
  AND    rax,rax
  JE    _EndIf293
; CALLBACK_ERROR (#SOURCE_GLSL$, lines$(i))
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf295
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  MOV    r15,qword [rsp+64]
  MOV    rbp,qword [rsp+88]
  SAL    r15,3
  PUSH   qword [rbp+r15]
  MOV    rax,_S892
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
_EndIf295:
; EndIf
_EndIf293:
; Next
_NextContinue291:
  INC    qword [rsp+48]
  JNO   _For290
_Next291:
; EndProcedure
_EndProcedureZero3009:
  XOR    rax,rax
_EndProcedure3009:
  PUSH   rax
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+80]
  SUB    rsp,40
  CALL   SYS_FreeArray
  ADD    rsp,40
  POP    rax
  ADD    rsp,88
  POP    r15
  POP    rbp
  RET
; Procedure.i IsWindowMinimized (win)
_Procedure2872:
  MOV    qword [rsp+8],rcx
  PS2872=48
  SUB    rsp,40
; 
; ProcedureReturn glfwGetWindowAttrib(win, #GLFW_ICONIFIED)
  PUSH   qword 131074
  PUSH   qword [rsp+PS2872+8]
  POP    rcx
  POP    rdx
  CALL   glfwGetWindowAttrib
  JMP   _EndProcedure2873
; EndProcedure
_EndProcedureZero2873:
  XOR    rax,rax
_EndProcedure2873:
  ADD    rsp,40
  RET
; ProcedureC callback_window_mouse_button (win, button, action, mods)
_Procedure3040:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PS3040=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_MouseButton
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+276],0
  JE    _EndIf333
; SGL\fpCallBack_MouseButton(win, button, action, mods)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+276]
  SUB    rsp,8
  PUSH   qword [rsp+PS3040+40]
  PUSH   qword [rsp+PS3040+40]
  PUSH   qword [rsp+PS3040+40]
  PUSH   qword [rsp+PS3040+40]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf333:
; EndProcedure
_EndProcedureZero3041:
  XOR    rax,rax
_EndProcedure3041:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure apply_window_hints()
_Procedure3004:
  PUSH   rbp
  PUSH   r15
  PS3004=64
  SUB    rsp,40
; glfwWindowHint(#GLFW_OPENGL_DEBUG_CONTEXT, SGL\hintWinOpenglDebug)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+284]
  PUSH   qword 139271
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, SGL\hintWinOpenglMajor)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+292]
  PUSH   qword 139266
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, SGL\hintWinOpenglMinor)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+300]
  PUSH   qword 139267
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_DEPTH_BITS, SGL\hintWinOpenglDepthBuffer)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+308]
  PUSH   qword 135173
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_STENCIL_BITS, SGL\hintWinOpenglStencilBits)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+316]
  PUSH   qword 135174
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_ACCUM_RED_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+324]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135175
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_ACCUM_GREEN_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+324]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135176
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_ACCUM_BLUE_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+324]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135177
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_ACCUM_ALPHA_BITS, SGL\hintWinOpenglAccumulatorBits / 8) 
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+324]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135178
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_SAMPLES, SGL\hintWinOpenglSamples) 
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+332]
  PUSH   qword 135181
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; 
; Select SGL\hintWinOpenglProfile
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+340]
; Case #PROFILE_ANY
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case78
; glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_ANY_PROFILE)
  SUB    rsp,8
  PUSH   qword 0
  PUSH   qword 139272
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwWindowHint
  ADD    rsp,40
; Case #PROFILE_COMPATIBLE
  JMP   _EndSelect9
_Case78:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case79
; glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_COMPAT_PROFILE)
  SUB    rsp,8
  PUSH   qword 204802
  PUSH   qword 139272
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwWindowHint
  ADD    rsp,40
; Case #PROFILE_CORE
  JMP   _EndSelect9
_Case79:
  MOV    r15,3
  CMP    r15,[rsp]
  JNE   _Case80
; glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_CORE_PROFILE)
  SUB    rsp,8
  PUSH   qword 204801
  PUSH   qword 139272
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwWindowHint
  ADD    rsp,40
; Default
  JMP   _EndSelect9
_Case80:
; ASSERT_FAIL("The hinted OpenGL profile is invalid.")
; EndSelect 
_Case81:
_EndSelect9:
  ADD    rsp,8
; 
; glfwWindowHint(#GLFW_OPENGL_FORWARD_COMPAT, SGL\hintWinOpenglForwardCompatibile)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+348]
  PUSH   qword 139270
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; 
; glfwWindowHint(#GLFW_VISIBLE, SGL\hintWinVisible)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+356]
  PUSH   qword 131076
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_RESIZABLE, SGL\hintWinResizable)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+364]
  PUSH   qword 131075
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_MAXIMIZED, SGL\hintWinMaximized)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+372]
  PUSH   qword 131080
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_DECORATED, SGL\hintWinDecorated)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+380]
  PUSH   qword 131077
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_FLOATING, SGL\hintWinTopMost)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+388]
  PUSH   qword 131079
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_FOCUSED, SGL\hintWinFocused)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+396]
  PUSH   qword 131073
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_CENTER_CURSOR, SGL\hintWinCenteredCursor)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+404]
  PUSH   qword 131081
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_AUTO_ICONIFY, SGL\hintWinAutoMinimize)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+412]
  PUSH   qword 131078
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_RED_BITS, SGL\hintWinFrameBufferDepth / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+420]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135169
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_GREEN_BITS, SGL\hintWinFrameBufferDepth / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+420]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135170
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_BLUE_BITS, SGL\hintWinFrameBufferDepth / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+420]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135171
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_ALPHA_BITS, SGL\hintWinFrameBufferDepth / 8)
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+420]
  MOV    rax,r15
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 135172
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; glfwWindowHint(#GLFW_TRANSPARENT_FRAMEBUFFER, SGL\hintWinFrameBufferTransparent)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+428]
  PUSH   qword 131082
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; 
; glfwWindowHint(#GLFW_REFRESH_RATE, SGL\hintWinRefreshRate)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+436]
  PUSH   qword 135183
  POP    rcx
  POP    rdx
  CALL   glfwWindowHint
; EndProcedure
_EndProcedureZero3005:
  XOR    rax,rax
_EndProcedure3005:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure DestroyTexelData (*td.TexelData)
_Procedure2912:
  MOV    qword [rsp+8],rcx
  PS2912=48
  SUB    rsp,40
; 
; FreeMemory(*td)
  PUSH   qword [rsp+PS2912+0]
  POP    rcx
  CALL   PB_FreeMemory
; EndProcedure
_EndProcedureZero2913:
  XOR    rax,rax
_EndProcedure2913:
  ADD    rsp,40
  RET
; Procedure.s shader_type_to_string (type)
_Procedure3002:
  MOV    qword [rsp+8],rcx
  PUSH   r15
  PS3002=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
  MOV    rax,[rsp+PS3002+32]
  MOV    qword [PB_StringBasePosition],rax
; Protected type$
; 
; Select type
  PUSH   qword [rsp+PS3002+0]
; Case #GL_VERTEX_SHADER
  MOV    r15,35633
  CMP    r15,[rsp]
  JNE   _Case71
; type$ = "#GL_VERTEX_SHADER"
  MOV    rdx,_S884
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_FRAGMENT_SHADER
  JMP   _EndSelect8
_Case71:
  MOV    r15,35632
  CMP    r15,[rsp]
  JNE   _Case72
; type$ = "#GL_FRAGMENT_SHADER"
  MOV    rdx,_S885
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_GEOMETRY_SHADER
  JMP   _EndSelect8
_Case72:
  MOV    r15,36313
  CMP    r15,[rsp]
  JNE   _Case73
; type$ = "#GL_GEOMETRY_SHADER"
  MOV    rdx,_S886
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_COMPUTE_SHADER
  JMP   _EndSelect8
_Case73:
  MOV    r15,37305
  CMP    r15,[rsp]
  JNE   _Case74
; type$ = "#GL_COMPUTE_SHADER"
  MOV    rdx,_S887
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_TESS_CONTROL_SHADER
  JMP   _EndSelect8
_Case74:
  MOV    r15,36488
  CMP    r15,[rsp]
  JNE   _Case75
; type$ = "#GL_TESS_CONTROL_SHADER"
  MOV    rdx,_S888
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #GL_TESS_EVALUATION_SHADER
  JMP   _EndSelect8
_Case75:
  MOV    r15,36487
  CMP    r15,[rsp]
  JNE   _Case76
; type$ = "#GL_TESS_EVALUATION_SHADER"
  MOV    rdx,_S889
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Default
  JMP   _EndSelect8
_Case76:
; type$ = "UNKNOWN"       
  MOV    rdx,_S890
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; EndSelect
_Case77:
_EndSelect8:
  ADD    rsp,8
; 
; ProcedureReturn type$
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure3003
; EndProcedure
_EndProcedureZero3003:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure3003:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,48
  POP    r15
  RET
; Procedure.i Init()
_Procedure2712:
  PUSH   rbp
  PUSH   r15
  PS2712=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; If SGL\initialized = #True    
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp]
  CMP    r15,1
  JNE   _EndIf344
; CALLBACK_ERROR (#SOURCE_SGL$, "SGL has been already initialized.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf346
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  MOV    rax,_S918
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
_EndIf346:
; Goto exit
  JMP    sgl.ll_init_exit
; EndIf
_EndIf344:
; 
; UsePNGImageEncoder()
  CALL   PB_UsePNGImageEncoder
; 
; UsePNGImageDecoder()
  CALL   PB_UsePNGImageDecoder
; 
; Protected err = glfwLoad::Load()
  CALL  _Procedure346
  MOV    qword [rsp+40],rax
; 
; Select err
  PUSH   qword [rsp+40]
; Case glfwLoad::#LOAD_OK
  XOR    r15,r15
  CMP    r15,[rsp]
  JNE   _Case101
; 
; Case glfwLoad::#LOAD_DLL_NOT_FOUND        
  JMP   _EndSelect13
_Case101:
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case102
; CALLBACK_ERROR (#SOURCE_SGL$, "GLFW dynamic library not found.")    
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf348
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S919
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf348:
; Goto exit
  JMP    sgl.ll_init_exit
; Case glfwLoad::#LOAD_MISSING_IMPORTED_FUNCS        
  JMP   _EndSelect13
_Case102:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case103
; CALLBACK_ERROR (#SOURCE_SGL$, "Some of the GLFW dynamically imported functions are missing.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf350
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S920
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf350:
; Goto exit
  JMP    sgl.ll_init_exit
; Default
  JMP   _EndSelect13
_Case103:
; CALLBACK_ERROR (#SOURCE_SGL$, "glfw_Load() return code was unexpected.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf352
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S921
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf352:
; Goto exit
  JMP    sgl.ll_init_exit
; EndSelect 
_Case104:
_EndSelect13:
  ADD    rsp,8
; 
; glfwSetErrorCallback(@callback_error_glfw())
  LEA    rax,[_Procedure3010]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL   glfwSetErrorCallback
; 
; If glfwInit() = 0    
  CALL   glfwInit
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf354
; CALLBACK_ERROR (#SOURCE_SGL$, "glfwInit() failed.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf356
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  MOV    rax,_S922
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
_EndIf356:
; Goto exit
  JMP    sgl.ll_init_exit
; EndIf
_EndIf354:
; 
; glfwDefaultWindowHints()
  CALL   glfwDefaultWindowHints
; 
; init_window_hints()
  CALL  _Procedure2996
; 
; init_keyboard()
  CALL  _Procedure3000
; 
; SGL\initialized = #True 
  LEA    rbp,[sgl.v_SGL]
  MOV    qword [rbp],1
; 
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2713
; 
; exit:
sgl.ll_init_exit:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2713
; EndProcedure
_EndProcedureZero2713:
  XOR    rax,rax
_EndProcedure2713:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure.i map_key_to_glfw (sgl_key)
_Procedure3046:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS3046=64
  SUB    rsp,40
; If sgl_key = #Key_Unknown
  MOV    r15,qword [rsp+PS3046+0]
  AND    r15,r15
  JNE   _EndIf342
; ProcedureReturn #GLFW_KEY_UNKNOWN
  MOV    rax,-1
  JMP   _EndProcedure3047
; EndIf
_EndIf342:
; ProcedureReturn SGL\Keyboard\SGL2GLFW(sgl_key)
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS3046+8]
  POP    rbp
  MOV    rbp,qword [rbp+8]
  SAL    r15,3
  MOV    rax,qword [rbp+r15]
  JMP   _EndProcedure3047
; EndProcedure
_EndProcedureZero3047:
  XOR    rax,rax
_EndProcedure3047:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure SwapBuffers (win)
_Procedure2876:
  MOV    qword [rsp+8],rcx
  PS2876=48
  SUB    rsp,40
; 
; glfwSwapBuffers (win)
  PUSH   qword [rsp+PS2876+0]
  POP    rcx
  CALL   glfwSwapBuffers
; EndProcedure
_EndProcedureZero2877:
  XOR    rax,rax
_EndProcedure2877:
  ADD    rsp,40
  RET
; ProcedureC callback_window_char (win, char) 
_Procedure3034:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3034=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; SGL\Keyboard\lastChar = char 
  PUSH   qword [rsp+PS3034+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+64],rax
; 
; If SGL\fpCallBack_Char
  CMP    qword [rbp+252],0
  JE    _EndIf327
; SGL\fpCallBack_Char(win, char)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+252]
  SUB    rsp,8
  PUSH   qword [rsp+PS3034+24]
  PUSH   qword [rsp+PS3034+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf327:
; EndProcedure
_EndProcedureZero3035:
  XOR    rax,rax
_EndProcedure3035:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure ShowWindow (win, flag)
_Procedure2820:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PS2820=48
  SUB    rsp,40
; 
; 
; If flag    
  CMP    qword [rsp+PS2820+8],0
  JE    _EndIf441
; glfwShowWindow(win)
  PUSH   qword [rsp+PS2820+0]
  POP    rcx
  CALL   glfwShowWindow
; Else
  JMP   _EndIf440
_EndIf441:
; glfwHideWindow(win)
  PUSH   qword [rsp+PS2820+0]
  POP    rcx
  CALL   glfwHideWindow
; EndIf
_EndIf440:
; EndProcedure
_EndProcedureZero2821:
  XOR    rax,rax
_EndProcedure2821:
  ADD    rsp,40
  RET
; Procedure.i BuildShaderProgram (*objects.ShaderObjects, cleanup = #True)
_Procedure2962:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS2962=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; Protected shaderProgram, linked
; 
; shaderProgram = glCreateProgram_()
  CALL   qword [gl.v_glCreateProgram_]
  MOV    qword [rsp+40],rax
; 
; If shaderProgram = 0 : Goto exit: EndIf
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JNE   _EndIf657
  JMP    sgl.ll_buildshaderprogram_exit
_EndIf657:
; 
; ForEach *objects\shader()
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_ResetList
_ForEach658:
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_NextElement
  OR     rax,rax
  JZ    _Next658
; glAttachShader_(shaderProgram, *objects\shader())
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rbp,qword [rbp+0+8]
  PUSH   qword [rbp+16]
  PUSH   qword [rsp+48]
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glAttachShader_]
; Next
  JMP   _ForEach658
_Next658:
; 
; glLinkProgram_(shaderProgram)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   qword [gl.v_glLinkProgram_]
; 
; glGetProgramiv_(shaderProgram, #GL_LINK_STATUS, @linked)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 35714
  PUSH   qword [rsp+56]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   qword [gl.v_glGetProgramiv_]
; 
; If linked = #GL_FALSE : Goto exit: EndIf
  MOV    r15,qword [rsp+48]
  AND    r15,r15
  JNE   _EndIf660
  JMP    sgl.ll_buildshaderprogram_exit
_EndIf660:
; 
; CompilerIf (#PB_Compiler_Debugger = 1)
; 
; If cleanup
  CMP    qword [rsp+PS2962+8],0
  JE    _EndIf662
; ForEach *objects\shader()
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_ResetList
_ForEach663:
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_NextElement
  OR     rax,rax
  JZ    _Next663
; glDetachShader_(shaderProgram, *objects\shader())
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rbp,qword [rbp+0+8]
  PUSH   qword [rbp+16]
  PUSH   qword [rsp+48]
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glDetachShader_]
; glDeleteShader_(*objects\shader())
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rbp,qword [rbp+0+8]
  PUSH   qword [rbp+16]
  POP    rcx
  CALL   qword [gl.v_glDeleteShader_]
; Next     
  JMP   _ForEach663
_Next663:
; ClearShaderObjects(*objects)
  PUSH   qword [rsp+PS2962+0]
  POP    rcx
  CALL  _Procedure2960
; EndIf
_EndIf662:
; 
; ProcedureReturn shaderProgram
  MOV    rax,qword [rsp+40]
  JMP   _EndProcedure2963
; 
; exit: 
sgl.ll_buildshaderprogram_exit:
; 
; If shaderProgram
  CMP    qword [rsp+40],0
  JE    _EndIf665
; ForEach *objects\shader()        
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_ResetList
_ForEach666:
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rcx,qword [rbp+0]
  CALL   PB_NextElement
  OR     rax,rax
  JZ    _Next666
; glDetachShader_(shaderProgram, *objects\shader())
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rbp,qword [rbp+0+8]
  PUSH   qword [rbp+16]
  PUSH   qword [rsp+48]
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glDetachShader_]
; glDeleteShader_(*objects\shader())
  MOV    rbp,qword [rsp+PS2962+0]
  MOV    rbp,qword [rbp+0+8]
  PUSH   qword [rbp+16]
  POP    rcx
  CALL   qword [gl.v_glDeleteShader_]
; Next
  JMP   _ForEach666
_Next666:
; glDeleteProgram_(shaderProgram)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   qword [gl.v_glDeleteProgram_]
; EndIf
_EndIf665:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2963
; EndProcedure
_EndProcedureZero2963:
  XOR    rax,rax
_EndProcedure2963:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure.i GetKey (key)
_Procedure2802:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2802=64
  SUB    rsp,40
; 
; 
; 
; 
; ProcedureReturn  SGL\Keyboard\Keys(key)\keyStatus
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS2802+8]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    rax,qword [rbp]
  JMP   _EndProcedure2803
; EndProcedure
_EndProcedureZero2803:
  XOR    rax,rax
_EndProcedure2803:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.d GetElapsedTime (timer) 
_Procedure2740:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2740=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected *t.TIMER = timer
  PUSH   qword [rsp+PS2740+0]
  POP    rax
  MOV    qword [rsp+40],rax
; ASSERT(timer)
; 
; ProcedureReturn glfwGetTime() - *t\startTime
  CALL   glfwGetTime
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  MOV    rbp,qword [rsp+40]
  FSUB   qword [rbp+8]
  FADD   qword [D2]
  JMP   _EndProcedure2741
; EndProcedure
_EndProcedureZero2741:
  FLDZ
_EndProcedure2741:
  ADD    rsp,48
  FSTP   qword [rsp-8]
  MOVSD  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure SetUniformVec3 (uniform, *v0.vec3::vec3, count = 1)
_Procedure2974:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2974=48
  SUB    rsp,40
; 
; glUniform3fv_(uniform, count, *v0) 
  PUSH   qword [rsp+PS2974+8]
  PUSH   qword [rsp+PS2974+24]
  PUSH   qword [rsp+PS2974+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   qword [gl.v_glUniform3fv_]
; EndProcedure
_EndProcedureZero2975:
  XOR    rax,rax
_EndProcedure2975:
  ADD    rsp,40
  RET
; Procedure.i GetUniformLocation (program, name$)
_Procedure2968:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PS2968=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2968+8]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; ProcedureReturn glGetUniformLocation_(program, name$)
  SUB    rsp,8
  SUB    rsp,8
  MOV    rcx,qword [rsp+56]
  SUB    rsp,32
  CALL   SYS_ToAscii
  ADD    rsp,32
  PUSH   rax
  MOV    qword [rsp+16],rax
  PUSH   qword [rsp+PS2968+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [gl.v_glGetUniformLocation_]
  ADD    rsp,40
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,40
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,40
  POP    rax
  ADD    rsp,8
  JMP   _EndProcedure2969
; EndProcedure
_EndProcedureZero2969:
  XOR    rax,rax
_EndProcedure2969:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  RET
; Procedure ResetTimer (timer) 
_Procedure2744:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2744=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; Protected *t.TIMER = timer
  PUSH   qword [rsp+PS2744+0]
  POP    rax
  MOV    qword [rsp+40],rax
; ASSERT(timer)
; 
; *t\startTime = glfwGetTime()
  CALL   glfwGetTime
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  MOV    rbp,qword [rsp+40]
  FSTP   qword [rbp+8]
; *t\startTime_Delta = *t\startTime
  MOV    rbp,qword [rsp+40]
  FLD    qword [rbp+8]
  MOV    rbp,qword [rsp+40]
  FSTP   qword [rbp+16]
; EndProcedure
_EndProcedureZero2745:
  XOR    rax,rax
_EndProcedure2745:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetUniform4Floats (uniform, v0.f, v1.f, v2.f, v3.f)
_Procedure2990:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PS2990=48
  SUB    rsp,40
; 
; glUniform4f_(uniform, v0, v1, v2, v3) 
  SUB    rsp,8
  MOV    eax,dword [rsp+PS2990+40]
  PUSH   rax
  MOV    eax,dword [rsp+PS2990+40]
  PUSH   rax
  MOV    eax,dword [rsp+PS2990+40]
  PUSH   rax
  MOV    eax,dword [rsp+PS2990+40]
  PUSH   rax
  PUSH   qword [rsp+PS2990+40]
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL   qword [gl.v_glUniform4f_]
  ADD    rsp,48
; EndProcedure
_EndProcedureZero2991:
  XOR    rax,rax
_EndProcedure2991:
  ADD    rsp,40
  RET
; ProcedureC callback_window_focus (win, focused.l)
_Procedure3020:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3020=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowFocus
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+196],0
  JE    _EndIf309
; SGL\fpCallBack_WindowFocus(win, focused)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+196]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3020+24]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3020+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf309:
; EndProcedure
_EndProcedureZero3021:
  XOR    rax,rax
_EndProcedure3021:
  ADD    rsp,48
  POP    rbp
  RET
; ProcedureC callback_window_scroll (win, x_offset.d, y_offset.d)
_Procedure3030:
  MOV    qword [rsp+8],rcx
  MOVSD  qword [rsp+16],xmm1
  MOVSD  qword [rsp+24],xmm2
  PUSH   rbp
  PS3030=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; SGL\Mouse\scrollOffsetX = x_offset
  FLD    qword [rsp+PS3030+8]
  LEA    rbp,[sgl.v_SGL]
  FSTP   qword [rbp+16]
; SGL\Mouse\scrollOffsetY = y_offset
  FLD    qword [rsp+PS3030+16]
  FSTP   qword [rbp+24]
; 
; If SGL\fpCallBack_WindowScroll
  CMP    qword [rbp+236],0
  JE    _EndIf319
; SGL\fpCallBack_WindowScroll(win, x_offset, y_offset)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+236]
  SUB    rsp,8
  PUSH   qword [rsp+PS3030+32]
  PUSH   qword [rsp+PS3030+32]
  PUSH   qword [rsp+PS3030+32]
  POP    rcx
  MOVSD  xmm1,qword [rsp]
  ADD    rsp,8
  MOVSD  xmm2,qword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf319:
; EndProcedure
_EndProcedureZero3031:
  XOR    rax,rax
_EndProcedure3031:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i CreateTimer()
_Procedure2734:
  PUSH   rbp
  PS2734=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; Protected *t.TIMER = AllocateStructure(TIMER)
  PUSH   qword 0
  PUSH   qword 24
  POP    rcx
  POP    rdx
  CALL   PB_AllocateStructure
  MOV    qword [rsp+40],rax
; 
; If *t 
  CMP    qword [rsp+40],0
  JE    _EndIf362
; *t\creationTime = glfwGetTime()
  CALL   glfwGetTime
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  MOV    rbp,qword [rsp+40]
  FSTP   qword [rbp]
; *t\startTime = *t\creationTime    
  MOV    rbp,qword [rsp+40]
  FLD    qword [rbp]
  MOV    rbp,qword [rsp+40]
  FSTP   qword [rbp+8]
; *t\startTime_Delta = *t\creationTime
  MOV    rbp,qword [rsp+40]
  FLD    qword [rbp]
  MOV    rbp,qword [rsp+40]
  FSTP   qword [rbp+16]
; EndIf
_EndIf362:
; 
; ProcedureReturn *t
  MOV    rax,qword [rsp+40]
  JMP   _EndProcedure2735
; EndProcedure
_EndProcedureZero2735:
  XOR    rax,rax
_EndProcedure2735:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure DestroyTimer (timer) 
_Procedure2736:
  MOV    qword [rsp+8],rcx
  PS2736=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; Protected *t.TIMER = timer
  PUSH   qword [rsp+PS2736+0]
  POP    rax
  MOV    qword [rsp+40],rax
; If *t
  CMP    qword [rsp+40],0
  JE    _EndIf364
; FreeStructure(*t)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_FreeStructure
; EndIf
_EndIf364:
; EndProcedure
_EndProcedureZero2737:
  XOR    rax,rax
_EndProcedure2737:
  ADD    rsp,56
  RET
; Procedure.i EnableDebugOutput (level = #DEBUG_OUPUT_MEDIUM)
_Procedure2746:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2746=64
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; If GetContextVersionToken() < 430 
  CALL  _Procedure2764
  MOV    r15,rax
  CMP    r15,430
  JGE   _EndIf366
; If ARB_debug_output() = 0 
  CALL  _Procedure2992
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf368
; CALLBACK_ERROR (#SOURCE_SGL$, "ARB_debug_output extension not available.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf370
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  MOV    rax,_S933
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
_EndIf370:
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2747
; EndIf        
_EndIf368:
; EndIf   
_EndIf366:
; 
; 
; 
; glEnable_(#GL_DEBUG_OUTPUT)
  PUSH   qword 37600
  POP    rcx
  CALL   glEnable
; glEnable_(#GL_DEBUG_OUTPUT_SYNCHRONOUS)
  PUSH   qword 33346
  POP    rcx
  CALL   glEnable
; glDebugMessageCallback_(@callback_error_opengl(), 0)
  PUSH   qword 0
  LEA    rax,[_Procedure3012]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glDebugMessageCallback_]
; 
; Select level
  PUSH   qword [rsp+PS2746+0]
; Case #DEBUG_OUPUT_NOTIFICATIONS
  XOR    r15,r15
  CMP    r15,[rsp]
  JNE   _Case105
; SGL\debugOutputLevel = level
  PUSH   qword [rsp+PS2746+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+8],rax
; Case #DEBUG_OUPUT_LOW
  JMP   _EndSelect14
_Case105:
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case106
; SGL\debugOutputLevel = level
  PUSH   qword [rsp+PS2746+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+8],rax
; Case #DEBUG_OUPUT_MEDIUM
  JMP   _EndSelect14
_Case106:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case107
; SGL\debugOutputLevel = level
  PUSH   qword [rsp+PS2746+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+8],rax
; Case #DEBUG_OUPUT_HIGH
  JMP   _EndSelect14
_Case107:
  MOV    r15,3
  CMP    r15,[rsp]
  JNE   _Case108
; SGL\debugOutputLevel = level
  PUSH   qword [rsp+PS2746+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+8],rax
; Default
  JMP   _EndSelect14
_Case108:
; CALLBACK_ERROR (#SOURCE_SGL$, "EnableDebugOutput() level is invalid.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf372
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S934
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf372:
; ProcedureReturn 0
  XOR    rax,rax
  ADD    rsp,8
  JMP   _EndProcedure2747
; EndSelect
_Case109:
_EndSelect14:
  ADD    rsp,8
; 
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2747
; EndProcedure
_EndProcedureZero2747:
  XOR    rax,rax
_EndProcedure2747:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.i map_key_to_sgl (glfw_key)
_Procedure3044:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS3044=64
  SUB    rsp,40
; If glfw_key = #GLFW_KEY_UNKNOWN
  MOV    r15,qword [rsp+PS3044+0]
  CMP    r15,-1
  JNE   _EndIf340
; ProcedureReturn #Key_Unknown
  XOR    rax,rax
  JMP   _EndProcedure3045
; EndIf 
_EndIf340:
; ProcedureReturn SGL\Keyboard\GLFW2SGL(glfw_key)
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS3044+8]
  POP    rbp
  MOV    rbp,qword [rbp+0]
  SAL    r15,3
  MOV    rax,qword [rbp+r15]
  JMP   _EndProcedure3045
; EndProcedure
_EndProcedureZero3045:
  XOR    rax,rax
_EndProcedure3045:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure PollEvents()
_Procedure2722:
  PUSH   rbp
  PS2722=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; SGL\Keyboard\LastChar = 0
  LEA    rbp,[sgl.v_SGL]
  MOV    qword [rbp+64],0
; SGL\Keyboard\lastKey = #Key_Unknown 
  MOV    qword [rbp+72],0
; SGL\Mouse\scrollOffsetX = 0.0
  FLD    qword [D2]
  FSTP   qword [rbp+16]
; SGL\Mouse\scrollOffsetY = 0.0
  FLD    qword [D2]
  FSTP   qword [rbp+24]
; glfwPollEvents()
  CALL   glfwPollEvents
; EndProcedure
_EndProcedureZero2723:
  XOR    rax,rax
_EndProcedure2723:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i ARB_debug_output()
_Procedure2992:
  PUSH   r15
  PS2992=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; If sgl::CountExtensionsStrings() = 0
  CALL  _Procedure2774
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf274
; sgl::LoadExtensionsStrings()
  CALL  _Procedure2772
; EndIf
_EndIf274:
; 
; If sgl::IsExtensionAvailable("GL_ARB_debug_output") = 0
  MOV    rax,_S772
  PUSH   rax
  POP    rcx
  CALL  _Procedure2778
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf276
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2993
; EndIf
_EndIf276:
; 
; glDebugMessageControl_ = sgl::GetProcAddress("glDebugMessageControlARB")
  MOV    rax,_S773
  PUSH   rax
  POP    rcx
  CALL  _Procedure2770
  MOV    qword [gl.v_glDebugMessageControl_],rax
; If glDebugMessageControl_ = 0 : ProcedureReturn 0 : EndIf
  MOV    r15,qword [gl.v_glDebugMessageControl_]
  AND    r15,r15
  JNE   _EndIf278
  XOR    rax,rax
  JMP   _EndProcedure2993
_EndIf278:
; 
; glDebugMessageInsert_ = sgl::GetProcAddress("glDebugMessageInsertARB") 
  MOV    rax,_S774
  PUSH   rax
  POP    rcx
  CALL  _Procedure2770
  MOV    qword [gl.v_glDebugMessageInsert_],rax
; If glDebugMessageInsert_ = 0 : ProcedureReturn 0 : EndIf
  MOV    r15,qword [gl.v_glDebugMessageInsert_]
  AND    r15,r15
  JNE   _EndIf280
  XOR    rax,rax
  JMP   _EndProcedure2993
_EndIf280:
; 
; glDebugMessageCallback_ = sgl::GetProcAddress("glDebugMessageCallbackARB") 
  MOV    rax,_S775
  PUSH   rax
  POP    rcx
  CALL  _Procedure2770
  MOV    qword [gl.v_glDebugMessageCallback_],rax
; If glDebugMessageCallback_ = 0 : ProcedureReturn 0 : EndIf
  MOV    r15,qword [gl.v_glDebugMessageCallback_]
  AND    r15,r15
  JNE   _EndIf282
  XOR    rax,rax
  JMP   _EndProcedure2993
_EndIf282:
; 
; glGetDebugMessageLog_ = sgl::GetProcAddress("glGetDebugMessageLogARB")
  MOV    rax,_S776
  PUSH   rax
  POP    rcx
  CALL  _Procedure2770
  MOV    qword [gl.v_glGetDebugMessageLog_],rax
; If glGetDebugMessageLog_ = 0 : ProcedureReturn 0 : EndIf
  MOV    r15,qword [gl.v_glGetDebugMessageLog_]
  AND    r15,r15
  JNE   _EndIf284
  XOR    rax,rax
  JMP   _EndProcedure2993
_EndIf284:
; 
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2993
; EndProcedure
_EndProcedureZero2993:
  XOR    rax,rax
_EndProcedure2993:
  ADD    rsp,48
  POP    r15
  RET
; ProcedureC callback_window_pos (win, x.l, y.l)
_Procedure3016:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS3016=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowPos
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+180],0
  JE    _EndIf305
; SGL\fpCallBack_WindowPos(win, x, y)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+180]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3016+32]
  MOV    rax,rax
  PUSH   rax
  MOVSXD rax,dword [rsp+PS3016+32]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3016+32]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf305:
; EndProcedure
_EndProcedureZero3017:
  XOR    rax,rax
_EndProcedure3017:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i LoadExtensionsStrings()
_Procedure2772:
  PUSH   rbp
  PUSH   r15
  PS2772=144
  MOV    rax,10
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected i, count, token
; Protected buffer$, extName$, extCount, extSource
; Protected *fpGetExtensionsString, *ptr
; Protected NewMap UniqueExt()
  MOV    rcx,512
  SUB    rsp,8
  PUSH   rcx
  LEA    r9,[rsp+128]
  XOR    r8,r8
  MOV    rdx,21
  MOV    rcx,8
  SUB    rsp,32
  CALL   PB_NewMap
  ADD    rsp,40
  ADD    rsp,8
; 
; token = GetContextVersionToken()
  CALL  _Procedure2764
  MOV    qword [rsp+56],rax
; 
; count = 0
  MOV    qword [rsp+48],0
; 
; If token >= 300 
  MOV    r15,qword [rsp+56]
  CMP    r15,300
  JL    _EndIf404
; glGetIntegerv_(#GL_NUM_EXTENSIONS, @count)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33309
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
; For i = 0 To count - 1 
  MOV    qword [rsp+40],0
  JMP   _ForSkipDebug405
_For405:
_ForSkipDebug405:
  MOV    r15,qword [rsp+48]
  DEC    r15
  CMP    r15,qword [rsp+40]
  JL    _Next406
; extName$ = PeekS(glGetStringi_(#GL_EXTENSIONS, i), -1, #PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword [rsp+88]
  PUSH   qword 7939
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [gl.v_glGetStringi_]
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+80]
  POP    rdx
  CALL   SYS_AllocateString4
; UniqueExt(extName$) = 1 
  PUSH   qword [rsp+72]
  POP    rdx
  MOV    rcx,qword [rsp+112]
  CALL   PB_GetMapElement
  MOV    rbp,rax
  MOV    qword [rbp],1
; Next
_NextContinue406:
  INC    qword [rsp+40]
  JNO   _For405
_Next406:
; EndIf
_EndIf404:
; 
; 
; For extSource = 1 To 3 
  MOV    qword [rsp+88],1
  JMP   _ForSkipDebug407
_For407:
_ForSkipDebug407:
  MOV    rax,3
  CMP    rax,qword [rsp+88]
  JL    _Next408
; buffer$ = ""
  MOV    rdx,_S18
  LEA    rcx,[rsp+64]
  CALL   SYS_FastAllocateStringFree4
; 
; Select extSource
  PUSH   qword [rsp+88]
; Case 1 
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case119
; *ptr = glGetString_(#GL_EXTENSIONS)
  SUB    rsp,8
  PUSH   qword 7939
  POP    rcx
  SUB    rsp,32
  CALL   glGetString
  ADD    rsp,40
  MOV    qword [rsp+112],rax
; If *ptr
  CMP    qword [rsp+112],0
  JE    _EndIf410
; buffer$ = PeekS(*ptr,-1,#PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  PUSH   qword [rsp+144]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  LEA    rcx,[rsp+80]
  POP    rdx
  SUB    rsp,40
  CALL   SYS_AllocateString4
  ADD    rsp,40
; EndIf
_EndIf410:
; Case 2 
  JMP   _EndSelect16
_Case119:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case120
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; 
; *fpGetExtensionsString = glfwGetProcAddress("wglGetExtensionsStringARB")
  SUB    rsp,8
  MOV    rcx,_S943
  SUB    rsp,32
  CALL   SYS_ToUTF8
  ADD    rsp,32
  PUSH   rax
  MOV    qword [rsp+8],rax
  POP    rcx
  SUB    rsp,32
  CALL   glfwGetProcAddress
  ADD    rsp,32
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,40
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,40
  POP    rax
  ADD    rsp,8
  MOV    qword [rsp+104],rax
; If *fpGetExtensionsString
  CMP    qword [rsp+104],0
  JE    _EndIf412
; buffer$ = PeekS(CallFunctionFast(*fpGetExtensionsString, wglGetCurrentDC_()), -1, #PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  SUB    rsp,32
  CALL   wglGetCurrentDC
  ADD    rsp,32
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+152]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_CallFunctionFast2
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  LEA    rcx,[rsp+80]
  POP    rdx
  SUB    rsp,40
  CALL   SYS_AllocateString4
  ADD    rsp,40
; EndIf
_EndIf412:
; CompilerEndIf
; Case 3 
  JMP   _EndSelect16
_Case120:
  MOV    r15,3
  CMP    r15,[rsp]
  JNE   _Case121
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; *fpGetExtensionsString = glfwGetProcAddress("wglGetExtensionsStringEXT")            
  SUB    rsp,8
  MOV    rcx,_S944
  SUB    rsp,32
  CALL   SYS_ToUTF8
  ADD    rsp,32
  PUSH   rax
  MOV    qword [rsp+8],rax
  POP    rcx
  SUB    rsp,32
  CALL   glfwGetProcAddress
  ADD    rsp,32
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,40
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,40
  POP    rax
  ADD    rsp,8
  MOV    qword [rsp+104],rax
; If *fpGetExtensionsString
  CMP    qword [rsp+104],0
  JE    _EndIf414
; buffer$ = PeekS(CallFunctionFast(*fpGetExtensionsString), -1, #PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword [rsp+144]
  POP    rcx
  SUB    rsp,32
  CALL   PB_CallFunctionFast
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  LEA    rcx,[rsp+80]
  POP    rdx
  SUB    rsp,40
  CALL   SYS_AllocateString4
  ADD    rsp,40
; EndIf
_EndIf414:
; CompilerEndIf                        
; EndSelect 
_Case121:
_EndSelect16:
  ADD    rsp,8
; 
; If Len(buffer$) 
  PUSH   qword [rsp+64]
  POP    rcx
  CALL   PB_Len
  AND    rax,rax
  JE    _EndIf416
; buffer$ = str::TrimEx(buffer$) 
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S13
  PUSH   rax
  PUSH   qword [rsp+88]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL  _Procedure14
  ADD    rsp,40
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; extCount = CountString(buffer$, " ")
  MOV    rax,_S13
  PUSH   rax
  PUSH   qword [rsp+72]
  POP    rcx
  POP    rdx
  CALL   PB_CountString
  MOV    qword [rsp+80],rax
; For i = 1 To extCount
  MOV    qword [rsp+40],1
  JMP   _ForSkipDebug417
_For417:
_ForSkipDebug417:
  MOV    rax,qword [rsp+80]
  CMP    rax,qword [rsp+40]
  JL    _Next418
; extName$ = StringField(buffer$, i, " ")                
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S13
  PUSH   rax
  PUSH   qword [rsp+72]
  PUSH   qword [rsp+104]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+80]
  POP    rdx
  CALL   SYS_AllocateString4
; UniqueExt(extName$) = 1 
  PUSH   qword [rsp+72]
  POP    rdx
  MOV    rcx,qword [rsp+112]
  CALL   PB_GetMapElement
  MOV    rbp,rax
  MOV    qword [rbp],1
; Next
_NextContinue418:
  INC    qword [rsp+40]
  JNO   _For417
_Next418:
; EndIf 
_EndIf416:
; Next
_NextContinue408:
  INC    qword [rsp+88]
  JNO   _For407
_Next408:
; 
; count = MapSize(UniqueExt()) 
  PUSH   qword [rsp+112]
  POP    rcx
  CALL   PB_MapSize
  MOV    qword [rsp+48],rax
; 
; Dim SGL\ExtensionsStrings$(count - 1)
  LEA    rbp,[sgl.v_SGL]
  PUSH   rbp
  MOV    r15,qword [rsp+56]
  DEC    r15
  MOV    rax,r15
  INC    rax
  POP    rbp
  SUB    rsp,24
  MOV    rdx,rax
  LEA    rax,[rbp+156]
  PUSH   rax
  MOV    r9,s_s
  MOV    r8,8
  MOV    rcx,8
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rbp+156],rax
; 
; ASSERT(ArraySize(SGL\ExtensionsStrings$()) <> -1)
; 
; count = 0
  MOV    qword [rsp+48],0
; 
; ResetMap(UniqueExt())
  PUSH   qword [rsp+112]
  POP    rcx
  CALL   PB_ResetMap
; 
; 
; While NextMapElement(UniqueExt())    
_While419:
  PUSH   qword [rsp+112]
  POP    rcx
  CALL   PB_NextMapElement
  AND    rax,rax
  JE    _Wend419
; SGL\ExtensionsStrings$(count) = MapKey(UniqueExt())
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+136]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_MapKey
  ADD    rsp,40
  LEA    rbp,[sgl.v_SGL]
  PUSH   rbp
  MOV    r15,qword [rsp+64]
  POP    rbp
  MOV    rbp,qword [rbp+156]
  SAL    r15,3
  LEA    rcx,[rbp+r15]
  POP    rdx
  CALL   SYS_AllocateString4
; count + 1
  MOV    r15,qword [rsp+48]
  INC    r15
  MOV    qword [rsp+48],r15
; Wend
  JMP   _While419
_Wend419:
; 
; 
; SortArray(SGL\ExtensionsStrings$(), #PB_Sort_Ascending)
  PUSH   qword 0
  LEA    rbp,[sgl.v_SGL]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+156]
  POP    rcx
  POP    rdx
  CALL   PB_SortArray
; 
; ProcedureReturn count
  MOV    rax,qword [rsp+48]
  JMP   _EndProcedure2773
; EndProcedure
_EndProcedureZero2773:
  XOR    rax,rax
_EndProcedure2773:
  PUSH   rax
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+80]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  PUSH   qword [rsp+120]
  POP    rcx
  SUB    rsp,40
  CALL   PB_FreeMap
  ADD    rsp,40
  POP    rax
  ADD    rsp,120
  POP    r15
  POP    rbp
  RET
; ProcedureC callback_window_key (win, key, scancode, action, mods)
_Procedure3032:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PUSH   r15
  PS3032=64
  SUB    rsp,40
; key = map_key_to_sgl(key)
  PUSH   qword [rsp+PS3032+8]
  POP    rcx
  CALL  _Procedure3044
  MOV    qword [rsp+PS3032+8],rax
; 
; If action = #RELEASED
  MOV    r15,qword [rsp+PS3032+24]
  AND    r15,r15
  JNE   _EndIf321
; SGL\Keyboard\Keys(key)\KeyPressed = 0 
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS3032+16]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp+8],0
; SGL\Keyboard\Keys(key)\keyStatus = #RELEASED
  LEA    rbp,[sgl.v_SGL]
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS3032+16]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp],0
; EndIf
_EndIf321:
; 
; If action = #PRESSED Or action = #REPEATING
  MOV    r15,qword [rsp+PS3032+24]
  CMP    r15,1
  JE     Ok20
  MOV    r15,qword [rsp+PS3032+24]
  CMP    r15,2
  JE     Ok20
  JMP    No20
Ok20:
  MOV    rax,1
  JMP    End20
No20:
  XOR    rax,rax
End20:
  AND    rax,rax
  JE    _EndIf323
; SGL\Keyboard\lastKey = key 
  PUSH   qword [rsp+PS3032+8]
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+72],rax
; SGL\Keyboard\Keys(key)\keyStatus = #PRESSED
  ADD    rbp,32
  PUSH   rbp
  MOV    r15,qword [rsp+PS3032+16]
  POP    rbp
  MOV    rbp,qword [rbp+24]
  SAL    r15,4
  ADD    rbp,r15
  MOV    qword [rbp],1
; EndIf
_EndIf323:
; 
; If SGL\fpCallBack_Key    
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+244],0
  JE    _EndIf325
; SGL\fpCallBack_Key(win, key, scancode, action, mods)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+244]
  PUSH   qword [rsp+PS3032+40]
  PUSH   qword [rsp+PS3032+40]
  PUSH   qword [rsp+PS3032+40]
  PUSH   qword [rsp+PS3032+40]
  PUSH   qword [rsp+PS3032+40]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf325:
; EndProcedure
_EndProcedureZero3033:
  XOR    rax,rax
_EndProcedure3033:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.i RegisterWindowCallBack (win, type, *fp)
_Procedure2816:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PUSH   r15
  PS2816=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; ASSERT (*fp)
; 
; Protected *prevCallBack
; 
; Select type
  PUSH   qword [rsp+PS2816+8]
; Case #CALLBACK_WINDOW_CLOSE
  XOR    r15,r15
  CMP    r15,[rsp]
  JNE   _Case142
; *prevCallBack = SGL\fpCallBack_WindowClose        
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+172]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowClose = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+172],rax
; glfwSetWindowCloseCallback(win, @callback_window_close())
  SUB    rsp,8
  LEA    rax,[_Procedure3014]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowCloseCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_POS
  JMP   _EndSelect22
_Case142:
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case143
; *prevCallBack = SGL\fpCallBack_WindowPos
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+180]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowPos = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+180],rax
; glfwSetWindowPosCallback(win, @callback_window_pos())
  SUB    rsp,8
  LEA    rax,[_Procedure3016]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowPosCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_SIZE
  JMP   _EndSelect22
_Case143:
  MOV    r15,2
  CMP    r15,[rsp]
  JNE   _Case144
; *prevCallBack = SGL\fpCallBack_WindowSize
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+188]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowSize = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+188],rax
; glfwSetWindowSizeCallback(win, @callback_window_size())
  SUB    rsp,8
  LEA    rax,[_Procedure3018]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowSizeCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_FOCUS
  JMP   _EndSelect22
_Case144:
  MOV    r15,3
  CMP    r15,[rsp]
  JNE   _Case145
; *prevCallBack = SGL\fpCallBack_WindowFocus
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+196]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowFocus = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+196],rax
; glfwSetWindowFocusCallback(win, @callback_window_focus())
  SUB    rsp,8
  LEA    rax,[_Procedure3020]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowFocusCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_MINIMIZE
  JMP   _EndSelect22
_Case145:
  MOV    r15,4
  CMP    r15,[rsp]
  JNE   _Case146
; *prevCallBack = SGL\fpCallBack_WindowMinimize
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+204]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowMinimize = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+204],rax
; glfwSetWindowIconifyCallback(win, @callback_window_minimize())        
  SUB    rsp,8
  LEA    rax,[_Procedure3022]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowIconifyCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_MAXIMIZE
  JMP   _EndSelect22
_Case146:
  MOV    r15,5
  CMP    r15,[rsp]
  JNE   _Case147
; *prevCallBack = SGL\fpCallBack_WindowMaximize
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+212]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowMaximize = *fp        
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+212],rax
; glfwSetWindowMaximizeCallback(win, @callback_window_maximize())
  SUB    rsp,8
  LEA    rax,[_Procedure3024]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowMaximizeCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_FRAMEBUFFER_SIZE
  JMP   _EndSelect22
_Case147:
  MOV    r15,6
  CMP    r15,[rsp]
  JNE   _Case148
; *prevCallBack = SGL\fpCallBack_WindowFrameBufferSize
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+220]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowFrameBufferSize = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+220],rax
; glfwSetFramebufferSizeCallback(win, @callback_window_frambuffer_size())
  SUB    rsp,8
  LEA    rax,[_Procedure3026]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetFramebufferSizeCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_REFRESH
  JMP   _EndSelect22
_Case148:
  MOV    r15,7
  CMP    r15,[rsp]
  JNE   _Case149
; *prevCallBack = SGL\fpCallBack_WindowRefresh
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+228]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowRefresh = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+228],rax
; glfwSetWindowRefreshCallback(win, @callback_window_refresh())
  SUB    rsp,8
  LEA    rax,[_Procedure3028]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetWindowRefreshCallback
  ADD    rsp,40
; Case #CALLBACK_WINDOW_SCROLL
  JMP   _EndSelect22
_Case149:
  MOV    r15,8
  CMP    r15,[rsp]
  JNE   _Case150
; *prevCallBack = SGL\fpCallBack_WindowScroll
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+236]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_WindowScroll = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+236],rax
; 
; glfwSetScrollCallback(win, @callback_window_scroll())
  SUB    rsp,8
  LEA    rax,[_Procedure3030]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetScrollCallback
  ADD    rsp,40
; Case #CALLBACK_KEY
  JMP   _EndSelect22
_Case150:
  MOV    r15,9
  CMP    r15,[rsp]
  JNE   _Case151
; *prevCallBack = SGL\fpCallBack_Key
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+244]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_Key = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+244],rax
; 
; glfwSetKeyCallback(win, @callback_window_key())
  SUB    rsp,8
  LEA    rax,[_Procedure3032]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetKeyCallback
  ADD    rsp,40
; Case #CALLBACK_CHAR
  JMP   _EndSelect22
_Case151:
  MOV    r15,10
  CMP    r15,[rsp]
  JNE   _Case152
; *prevCallBack = SGL\fpCallBack_Char
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+252]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_Char = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+252],rax
; 
; glfwSetCharCallback(win, @callback_window_char())
  SUB    rsp,8
  LEA    rax,[_Procedure3034]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetCharCallback
  ADD    rsp,40
; Case #CALLBACK_CURSOR_POS
  JMP   _EndSelect22
_Case152:
  MOV    r15,11
  CMP    r15,[rsp]
  JNE   _Case153
; *prevCallBack = SGL\fpCallBack_CursorPos
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+260]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_CursorPos = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+260],rax
; glfwSetCursorPosCallback(win, @callback_window_cursor_position())
  SUB    rsp,8
  LEA    rax,[_Procedure3036]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetCursorPosCallback
  ADD    rsp,40
; Case #CALLBACK_CURSOR_ENTERING
  JMP   _EndSelect22
_Case153:
  MOV    r15,12
  CMP    r15,[rsp]
  JNE   _Case154
; *prevCallBack = SGL\fpCallBack_CursorEntering
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+268]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_CursorEntering = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+268],rax
; glfwSetCursorEnterCallback(win, @callback_window_cursor_entering())
  SUB    rsp,8
  LEA    rax,[_Procedure3038]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetCursorEnterCallback
  ADD    rsp,40
; Case #CALLBACK_MOUSE_BUTTON
  JMP   _EndSelect22
_Case154:
  MOV    r15,13
  CMP    r15,[rsp]
  JNE   _Case155
; *prevCallBack = SGL\fpCallBack_MouseButton
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+276]
  POP    rax
  MOV    qword [rsp+48],rax
; SGL\fpCallBack_MouseButton = *fp
  PUSH   qword [rsp+PS2816+24]
  POP    rax
  MOV    qword [rbp+276],rax
; glfwSetMouseButtonCallback(win, @callback_window_mouse_button())
  SUB    rsp,8
  LEA    rax,[_Procedure3040]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2816+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   glfwSetMouseButtonCallback
  ADD    rsp,40
; Default
  JMP   _EndSelect22
_Case155:
; CALLBACK_ERROR (#SOURCE_SGL$, "Window CallBack type is invalid.")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf439
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  MOV    rax,_S952
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+32]
  ADD    rsp,32
  ADD    rsp,8
_EndIf439:
; EndSelect
_Case156:
_EndSelect22:
  ADD    rsp,8
; 
; ProcedureReturn *prevCallBack
  MOV    rax,qword [rsp+40]
  JMP   _EndProcedure2817
; 
; EndProcedure
_EndProcedureZero2817:
  XOR    rax,rax
_EndProcedure2817:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure.d GetTimerResolution()
_Procedure2728:
  PS2728=48
  SUB    rsp,40
; 
; 
; ProcedureReturn 1.0 / glfwGetTimerFrequency() 
  CALL   glfwGetTimerFrequency
  MOV    qword [rsp-8],rax
  FILD   qword [rsp-8]
  FDIVR  qword [D5]
  JMP   _EndProcedure2729
; EndProcedure
_EndProcedureZero2729:
  FLDZ
_EndProcedure2729:
  ADD    rsp,40
  FSTP   qword [rsp-8]
  MOVSD  xmm0,[rsp-8]
  RET
; Procedure ClearGlErrors()
_Procedure2748:
  PUSH   rbp
  PUSH   r15
  PS2748=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected glerr
; Protected safe_bailout = 255
  MOV    qword [rsp+48],255
; 
; Repeat
_Repeat373:
; glerr = glGetError_()
  CALL   glGetError
  MOV    qword [rsp+40],rax
; safe_bailout - 1
  MOV    r15,qword [rsp+48]
  DEC    r15
  MOV    qword [rsp+48],r15
; Until (glerr = #GL_NO_ERROR) Or (safe_bailout = 0)
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JE     Ok21
  MOV    r15,qword [rsp+48]
  AND    r15,r15
  JE     Ok21
  JMP    No21
Ok21:
  MOV    rax,1
  JMP    End21
No21:
  XOR    rax,rax
End21:
  AND    rax,rax
  JE    _Repeat373
_Until373:
; 
; If glerr <> #GL_NO_ERROR
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JE    _EndIf375
; CALLBACK_ERROR (#SOURCE_SGL$, "glGetError() inside an infinite loop (no current context ?)")
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf377
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  SUB    rsp,8
  MOV    rax,_S65
  PUSH   rax
  MOV    rax,_S917
  PUSH   rax
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
_EndIf377:
; EndIf    
_EndIf375:
; EndProcedure
_EndProcedureZero2749:
  XOR    rax,rax
_EndProcedure2749:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure BindShaderProgram (program)
_Procedure2966:
  MOV    qword [rsp+8],rcx
  PS2966=48
  SUB    rsp,40
; 
; glUseProgram_(program)
  PUSH   qword [rsp+PS2966+0]
  POP    rcx
  CALL   qword [gl.v_glUseProgram_]
; EndProcedure
_EndProcedureZero2967:
  XOR    rax,rax
_EndProcedure2967:
  ADD    rsp,40
  RET
; Procedure.i binary_string_lookup (Array arr$(1), key$) 
_Procedure3042:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS3042=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rax,qword [rsp+PS3042+0]
  MOV    qword [rsp+40],rax
  MOV    rdx,[rsp+PS3042+8]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; Protected l, m, h = ArraySize(arr$()) + 1
  MOV    rcx,[rsp+40]
  PUSH   qword [rcx]
  POP    rcx
  CALL   PB_ArraySize
  MOV    r15,rax
  INC    r15
  MOV    qword [rsp+72],r15
; 
; While l <= h
_While334:
  MOV    r15,qword [rsp+56]
  CMP    r15,qword [rsp+72]
  JG    _Wend334
; m = (l + h) / 2
  MOV    r15,qword [rsp+56]
  ADD    r15,qword [rsp+72]
  MOV    rax,r15
  MOV    rcx,2
  CQO
  IDIV   rcx
  MOV    r15,rax
  MOV    qword [rsp+64],r15
; If key$ < arr$(m)
  PUSH   qword [rsp+48]
  MOV    r15,qword [rsp+72]
  MOV    rcx,[rsp+48]
  MOV    rbp,qword [rcx]
  SAL    r15,3
  MOV    rcx,qword [rbp+r15]
  POP    rdx
  CALL   SYS_StringInferior
  OR     rax,rax
  JE    _EndIf336
; h = m - 1
  MOV    r15,qword [rsp+64]
  DEC    r15
  MOV    qword [rsp+72],r15
; ElseIf key$ > arr$(m) 
  JMP   _EndIf335
_EndIf336:
  PUSH   qword [rsp+48]
  MOV    r15,qword [rsp+72]
  MOV    rcx,[rsp+48]
  MOV    rbp,qword [rcx]
  SAL    r15,3
  MOV    rcx,qword [rbp+r15]
  POP    rdx
  CALL   SYS_StringSuperior
  OR     rax,rax
  JE    _EndIf337
; l = m + 1
  MOV    r15,qword [rsp+64]
  INC    r15
  MOV    qword [rsp+56],r15
; Else
  JMP   _EndIf335
_EndIf337:
; ProcedureReturn m 
  MOV    rax,qword [rsp+64]
  JMP   _EndProcedure3043
; EndIf
_EndIf335:
; Wend
  JMP   _While334
_Wend334:
; 
; ProcedureReturn -1 
  MOV    rax,-1
  JMP   _EndProcedure3043
; EndProcedure
_EndProcedureZero3043:
  XOR    rax,rax
_EndProcedure3043:
  PUSH   rax
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,88
  POP    r15
  POP    rbp
  RET
; Procedure.i CompileShader (string$, shaderType)
_Procedure2954:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS2954=128
  MOV    rax,8
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rdx,[rsp+PS2954+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; Protected shader, *buffer
; 
; shader = glCreateShader_(shaderType)
  PUSH   qword [rsp+PS2954+8]
  POP    rcx
  CALL   qword [gl.v_glCreateShader_]
  MOV    qword [rsp+48],rax
; 
; If shader = 0 : Goto exit: EndIf
  MOV    r15,qword [rsp+48]
  AND    r15,r15
  JNE   _EndIf647
  JMP    sgl.ll_compileshader_exit
_EndIf647:
; 
; *buffer = Ascii(string$)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_Ascii
  MOV    qword [rsp+56],rax
; glShaderSource_(shader, 1, @*buffer, #Null) 
  PUSH   qword 0
  LEA    rax,[rsp+64]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+72]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glShaderSource_]
; FreeMemory(*buffer)
  PUSH   qword [rsp+56]
  POP    rcx
  CALL   PB_FreeMemory
; 
; glCompileShader_(shader)
  PUSH   qword [rsp+48]
  POP    rcx
  CALL   qword [gl.v_glCompileShader_]
; 
; Protected result, length, *errlog, errlog$ 
; 
; glGetShaderiv_(shader, #GL_COMPILE_STATUS, @result)
  LEA    rax,[rsp+64]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 35713
  PUSH   qword [rsp+64]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   qword [gl.v_glGetShaderiv_]
; 
; If result = #GL_FALSE    
  MOV    r15,qword [rsp+64]
  AND    r15,r15
  JNE   _EndIf649
; CALLBACK_ERROR (#SOURCE_GLSL$, "glCompileShader() error in " + shader_type_to_string(shaderType))
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+164],0
  JE    _EndIf651
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+164]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  MOV    rcx,_S960
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+PS2954+56]
  POP    rcx
  SUB    rsp,32
  CALL  _Procedure3002
  ADD    rsp,48
  POP    rax
  ADD    qword [PB_StringBasePosition],2
  MOV    rax,_S892
  PUSH   rax
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+8],rdx
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,32
  POP    qword [PB_StringBasePosition]
  ADD    rsp,8
_EndIf651:
; 
; glGetShaderiv_(shader, #GL_INFO_LOG_LENGTH, @length)
  LEA    rax,[rsp+72]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 35716
  PUSH   qword [rsp+64]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   qword [gl.v_glGetShaderiv_]
; 
; If length
  CMP    qword [rsp+72],0
  JE    _EndIf653
; *errlog = AllocateMemory(length)
  PUSH   qword [rsp+72]
  POP    rcx
  CALL   PB_AllocateMemory
  MOV    qword [rsp+80],rax
; glGetShaderInfoLog_(shader, length, @length, *errlog)
  PUSH   qword [rsp+80]
  LEA    rax,[rsp+80]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+88]
  PUSH   qword [rsp+72]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glGetShaderInfoLog_]
; errlog$ = PeekS(*errlog, length, #PB_UTF8) 
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 2
  PUSH   qword [rsp+104]
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+96]
  POP    rdx
  CALL   SYS_AllocateString4
; FreeMemory(*errlog)                
  PUSH   qword [rsp+80]
  POP    rcx
  CALL   PB_FreeMemory
; split_glsl_errors(errlog$)
  PUSH   qword [rsp+88]
  POP    rcx
  CALL  _Procedure3008
; EndIf
_EndIf653:
; 
; Goto exit:
  JMP    sgl.ll_compileshader_exit
; EndIf
_EndIf649:
; 
; ProcedureReturn shader
  MOV    rax,qword [rsp+48]
  JMP   _EndProcedure2955
; 
; exit:
sgl.ll_compileshader_exit:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2955
; EndProcedure
_EndProcedureZero2955:
  XOR    rax,rax
_EndProcedure2955:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+96]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,104
  POP    r15
  POP    rbp
  RET
; ProcedureC callback_window_cursor_entering (win, entering)
_Procedure3038:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS3038=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_CursorEntering
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+268],0
  JE    _EndIf331
; SGL\fpCallBack_CursorEntering(win, entering)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+268]
  SUB    rsp,8
  PUSH   qword [rsp+PS3038+24]
  PUSH   qword [rsp+PS3038+24]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf 
_EndIf331:
; EndProcedure
_EndProcedureZero3039:
  XOR    rax,rax
_EndProcedure3039:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetUniformMatrix4x4 (uniform, *m4x4, count = 1)
_Procedure2970:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2970=48
  SUB    rsp,40
; 
; glUniformMatrix4fv_(uniform, count, #GL_FALSE, *m4x4) 
  PUSH   qword [rsp+PS2970+8]
  PUSH   qword 0
  PUSH   qword [rsp+PS2970+32]
  PUSH   qword [rsp+PS2970+24]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glUniformMatrix4fv_]
; EndProcedure
_EndProcedureZero2971:
  XOR    rax,rax
_EndProcedure2971:
  ADD    rsp,40
  RET
; Procedure TrackFPS()
_Procedure2940:
  PUSH   rbp
  PUSH   r15
  PS2940=64
  SUB    rsp,40
; 
; 
; 
; 
; 
; If SGL\TrackFps\timerFps = 0
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+96]
  AND    r15,r15
  JNE   _EndIf604
; SGL\TrackFps\timerFps = CreateTimer()
  CALL  _Procedure2734
  MOV    rax,rax
  PUSH   rax
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+96],rax
; SGL\TrackFps\timerFullFrame = CreateTimer()  
  CALL  _Procedure2734
  MOV    rax,rax
  PUSH   rax
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+116],rax
; SGL\TrackFps\fpsCount = Bool(SGL\TrackFps\maxFps > 0)
  MOV    r15,qword [rbp+104]
  AND    r15,r15
_Bool0:
  JLE   .False
  MOV    rax,1
  JMP   .True
.False:
  XOR    rax,rax
.True:
  MOV    rax,rax
  PUSH   rax
  LEA    rbp,[sgl.v_SGL]
  POP    rax
  MOV    qword [rbp+88],rax
; ProcedureReturn 
  JMP   _EndProcedure2941
; EndIf
_EndIf604:
; 
; If SGL\TrackFps\maxFps 
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+104],0
  JE    _EndIf606
; While GetElapsedTime(SGL\TrackFps\timerFullFrame) < SGL\TrackFps\targetFrameTime
_While607:
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+116]
  POP    rcx
  CALL  _Procedure2740
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  LEA    rbp,[sgl.v_SGL]
  FLD    dword [rbp+112]
  FCOMPP
  FNSTSW ax
  TEST   ah,41h
  JNE   _Wend607
; Delay(0)        
  PUSH   qword 0
  POP    rcx
  CALL   PB_Delay
; Wend
  JMP   _While607
_Wend607:
; ResetTimer(SGL\TrackFps\timerFullFrame)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+116]
  POP    rcx
  CALL  _Procedure2744
; EndIf
_EndIf606:
; 
; If GetElapsedTime(SGL\TrackFps\timerFps) > 1.0
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+96]
  POP    rcx
  CALL  _Procedure2740
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FCOMP  qword [D5]
  FNSTSW ax
  TEST   ah,41h
  JNE   _EndIf609
; SGL\TrackFps\fps = SGL\TrackFps\fpsCount
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+88]
  POP    rax
  MOV    qword [rbp+80],rax
; SGL\TrackFps\fpsCount = 0
  MOV    qword [rbp+88],0
; ResetTimer(SGL\TrackFps\timerFps)
  PUSH   qword [rbp+96]
  POP    rcx
  CALL  _Procedure2744
; EndIf
_EndIf609:
; 
; SGL\TrackFps\fpsCount + 1
  LEA    rbp,[sgl.v_SGL]
  MOV    r15,qword [rbp+88]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  POP    rax
  MOV    qword [rbp+88],rax
; EndProcedure
_EndProcedureZero2941:
  XOR    rax,rax
_EndProcedure2941:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure.i CompileShaderFromFile (file$, shaderType) 
_Procedure2956:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   r15
  PS2956=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2956+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; 
; Protected fh, fmt, source$
; 
; fh = ReadFile(#PB_Any, file$)
  PUSH   qword [rsp+40]
  PUSH   qword -1
  POP    rcx
  POP    rdx
  CALL   PB_ReadFile
  MOV    qword [rsp+48],rax
; 
; If fh
  CMP    qword [rsp+48],0
  JE    _EndIf655
; fmt = ReadStringFormat(fh)
  PUSH   qword [rsp+48]
  POP    rcx
  CALL   PB_ReadStringFormat
  MOV    qword [rsp+56],rax
; source$ = ReadString(fh, fmt | #PB_File_IgnoreEOL)    
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    r15,qword [rsp+80]
  OR     r15,65536
  MOV    rax,r15
  PUSH   rax
  PUSH   qword [rsp+80]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_ReadString2
  ADD    rsp,40
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; CloseFile(fh)    
  PUSH   qword [rsp+48]
  POP    rcx
  CALL   PB_CloseFile
; ProcedureReturn CompileShader (source$, shaderType)
  PUSH   qword [rsp+PS2956+8]
  PUSH   qword [rsp+72]
  POP    rcx
  POP    rdx
  CALL  _Procedure2954
  JMP   _EndProcedure2957
; EndIf
_EndIf655:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2957
; EndProcedure
_EndProcedureZero2957:
  XOR    rax,rax
_EndProcedure2957:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,80
  POP    r15
  RET
; Procedure.i GetFPS()
_Procedure2942:
  PUSH   rbp
  PS2942=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; If SGL\TrackFps\fps
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+80],0
  JE    _EndIf611
; ProcedureReturn SGL\TrackFps\fps
  LEA    rbp,[sgl.v_SGL]
  MOV    rax,qword [rbp+80]
  JMP   _EndProcedure2943
; Else
  JMP   _EndIf610
_EndIf611:
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2943
; EndIf
_EndIf610:
; EndProcedure
_EndProcedureZero2943:
  XOR    rax,rax
_EndProcedure2943:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.s GetRenderer()
_Procedure2756:
  PS2756=48
  SUB    rsp,40
  MOV    rax,[rsp+PS2756+32]
  MOV    qword [PB_StringBasePosition],rax
; 
; 
; ProcedureReturn str::TrimEx( PeekS(glGetString_(#GL_RENDERER),-1,#PB_Ascii) + " " + PeekS(glGetString_(#GL_VERSION),-1,#PB_Ascii))
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S13
  PUSH   rax
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword 7937
  POP    rcx
  SUB    rsp,32
  CALL   glGetString
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  MOV    rcx,_S13
  SUB    rsp,32
  CALL   SYS_CopyString
  ADD    rsp,32
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword 7938
  POP    rcx
  SUB    rsp,32
  CALL   glGetString
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  POP    rax
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+0],rdx
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL  _Procedure14
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure2757
; EndProcedure
_EndProcedureZero2757:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure2757:
  ADD    rsp,40
  RET
; Procedure.i IsPowerOfTwo (value)
_Procedure2906:
  MOV    qword [rsp+8],rcx
  PUSH   r15
  PUSH   r14
  PS2906=64
  SUB    rsp,40
; 
; 
; If (value <= 1) Or (value & (value - 1)) > 0
  MOV    r15,qword [rsp+PS2906+0]
  CMP    r15,1
  JLE    Ok26
  MOV    r15,qword [rsp+PS2906+0]
  MOV    r14,qword [rsp+PS2906+0]
  DEC    r14
  AND    r15,r14
  AND    r15,r15
  JG     Ok26
  JMP    No26
Ok26:
  MOV    rax,1
  JMP    End26
No26:
  XOR    rax,rax
End26:
  AND    rax,rax
  JE    _EndIf479
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2907
; EndIf   
_EndIf479:
; ProcedureReturn 1    
  MOV    rax,1
  JMP   _EndProcedure2907
; EndProcedure
_EndProcedureZero2907:
  XOR    rax,rax
_EndProcedure2907:
  ADD    rsp,40
  POP    r14
  POP    r15
  RET
; Procedure callback_getprocaddress (func$) 
_Procedure3006:
  MOV    qword [rsp+8],rcx
  PS3006=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS3006+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; ProcedureReturn glfwGetProcAddress(func$) 
  SUB    rsp,8
  SUB    rsp,8
  MOV    rcx,qword [rsp+56]
  SUB    rsp,32
  CALL   SYS_ToUTF8
  ADD    rsp,32
  PUSH   rax
  MOV    qword [rsp+16],rax
  POP    rcx
  SUB    rsp,32
  CALL   glfwGetProcAddress
  ADD    rsp,40
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,32
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,32
  POP    rax
  ADD    rsp,8
  JMP   _EndProcedure3007
; EndProcedure
_EndProcedureZero3007:
  XOR    rax,rax
_EndProcedure3007:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  RET
; Procedure GetWindowFrameBufferSize (win, *width, *height)
_Procedure2862:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2862=48
  SUB    rsp,40
; 
; 
; glfwGetFramebufferSize (win, *width, *height)
  PUSH   qword [rsp+PS2862+16]
  PUSH   qword [rsp+PS2862+16]
  PUSH   qword [rsp+PS2862+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glfwGetFramebufferSize
; EndProcedure
_EndProcedureZero2863:
  XOR    rax,rax
_EndProcedure2863:
  ADD    rsp,40
  RET
; Procedure.i CreateWindow (w, h, title$, mon = #Null, share = #Null)
_Procedure2810:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PS2810=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2810+16]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; 
; 
; Protected win
; 
; apply_window_hints()
  CALL  _Procedure3004
; 
; win = glfwCreateWindow(w, h, title$, mon, share)
  SUB    rsp,8
  PUSH   qword [rsp+PS2810+40]
  PUSH   qword [rsp+PS2810+40]
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_ToUTF8
  ADD    rsp,40
  PUSH   rax
  MOV    qword [rsp+24],rax
  PUSH   qword [rsp+PS2810+40]
  PUSH   qword [rsp+PS2810+40]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   glfwCreateWindow
  ADD    rsp,40
  PUSH   rax
  MOV    rcx,[rsp+8]
  SUB    rsp,32
  CALL   SYS_FreeStringNoCheck
  ADD    rsp,32
  POP    rax
  ADD    rsp,8
  MOV    qword [rsp+48],rax
; 
; If win
  CMP    qword [rsp+48],0
  JE    _EndIf435
; SetWindowDefaultIcon (win)
  PUSH   qword [rsp+48]
  POP    rcx
  CALL  _Procedure2828
; glfwSetKeyCallback(win, @callback_window_key())
  LEA    rax,[_Procedure3032]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+56]
  POP    rcx
  POP    rdx
  CALL   glfwSetKeyCallback
; glfwSetCharCallback(win, @callback_window_char())
  LEA    rax,[_Procedure3034]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+56]
  POP    rcx
  POP    rdx
  CALL   glfwSetCharCallback
; glfwSetScrollCallback(win, @callback_window_scroll())
  LEA    rax,[_Procedure3030]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+56]
  POP    rcx
  POP    rdx
  CALL   glfwSetScrollCallback
; EndIf 
_EndIf435:
; 
; ProcedureReturn win
  MOV    rax,qword [rsp+48]
  JMP   _EndProcedure2811
; EndProcedure
_EndProcedureZero2811:
  XOR    rax,rax
_EndProcedure2811:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  RET
; Procedure.i WindowShouldClose (win)
_Procedure2850:
  MOV    qword [rsp+8],rcx
  PS2850=48
  SUB    rsp,40
; 
; 
; ProcedureReturn glfwWindowShouldClose (win)
  PUSH   qword [rsp+PS2850+0]
  POP    rcx
  CALL   glfwWindowShouldClose
  JMP   _EndProcedure2851
; EndProcedure
_EndProcedureZero2851:
  XOR    rax,rax
_EndProcedure2851:
  ADD    rsp,40
  RET
; ProcedureC callback_window_size (win, width.l, height.l)
_Procedure3018:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS3018=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; If SGL\fpCallBack_WindowSize
  LEA    rbp,[sgl.v_SGL]
  CMP    qword [rbp+188],0
  JE    _EndIf307
; SGL\fpCallBack_WindowSize(win, width, height)
  LEA    rbp,[sgl.v_SGL]
  PUSH   qword [rbp+188]
  SUB    rsp,8
  MOVSXD rax,dword [rsp+PS3018+32]
  MOV    rax,rax
  PUSH   rax
  MOVSXD rax,dword [rsp+PS3018+32]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3018+32]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf307:
; EndProcedure
_EndProcedureZero3019:
  XOR    rax,rax
_EndProcedure3019:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i CreateTexelData (img)
_Procedure2910:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PUSH   r13
  PS2910=176
  MOV    rax,12
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; 
; Protected *td.TexelData, depth, width, height, hDC
; Protected *drawbuff, row, rowLen, pitch, pixelFormat, isReversed
; 
; depth = ImageDepth(img)
  PUSH   qword [rsp+PS2910+0]
  POP    rcx
  CALL   PB_ImageDepth
  MOV    qword [rsp+48],rax
; width = ImageWidth(img)
  PUSH   qword [rsp+PS2910+0]
  POP    rcx
  CALL   PB_ImageWidth
  MOV    qword [rsp+56],rax
; height = ImageHeight(img)
  PUSH   qword [rsp+PS2910+0]
  POP    rcx
  CALL   PB_ImageHeight
  MOV    qword [rsp+64],rax
; 
; *td = AllocateMemory (SizeOf(TexelData) + width * height * (depth / 8))
  MOV    r15,qword [rsp+56]
  IMUL   r15,qword [rsp+64]
  MOV    r14,qword [rsp+48]
  MOV    rax,r14
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r14,rax
  IMUL   r15,r14
  ADD    r15,56
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  CALL   PB_AllocateMemory
  MOV    qword [rsp+40],rax
; 
; If *td = 0 
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JNE   _EndIf486
; Goto exit: 
  JMP    sgl.ll_createtexeldata_exit
; EndIf
_EndIf486:
; 
; *td\imageWidth = width
  PUSH   qword [rsp+56]
  MOV    rbp,qword [rsp+48]
  POP    rax
  MOV    qword [rbp],rax
; *td\imageHeight= height
  PUSH   qword [rsp+64]
  MOV    rbp,qword [rsp+48]
  POP    rax
  MOV    qword [rbp+8],rax
; *td\imageDepth= depth
  PUSH   qword [rsp+48]
  MOV    rbp,qword [rsp+48]
  POP    rax
  MOV    qword [rbp+16],rax
; *td\length = width * height * (depth / 8)
  MOV    r15,qword [rsp+56]
  IMUL   r15,qword [rsp+64]
  MOV    r14,qword [rsp+48]
  MOV    rax,r14
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r14,rax
  IMUL   r15,r14
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+48]
  POP    rax
  MOV    qword [rbp+40],rax
; *td\pixels = *td + SizeOf(TexelData)
  MOV    r15,qword [rsp+40]
  ADD    r15,56
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+48]
  POP    rax
  MOV    qword [rbp+48],rax
; 
; hDC = StartDrawing(ImageOutput(img))
  PUSH   qword [rsp+PS2910+0]
  POP    rcx
  CALL   PB_ImageOutput
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL   PB_StartDrawing
  MOV    qword [rsp+72],rax
; 
; *drawbuff = DrawingBuffer()
  CALL   PB_DrawingBuffer
  MOV    qword [rsp+80],rax
; 
; If *drawbuff = 0     
  MOV    r15,qword [rsp+80]
  AND    r15,r15
  JNE   _EndIf488
; Goto exit: 
  JMP    sgl.ll_createtexeldata_exit
; EndIf
_EndIf488:
; 
; pixelFormat = DrawingBufferPixelFormat()  
  CALL   PB_DrawingBufferPixelFormat
  MOV    qword [rsp+112],rax
; 
; If pixelFormat & #PB_PixelFormat_ReversedY
  MOV    r15,qword [rsp+112]
  AND    r15,32768
  AND    r15,r15
  JE    _EndIf490
; isReversed = #True
  MOV    qword [rsp+120],1
; EndIf    
_EndIf490:
; 
; If pixelFormat & #PB_PixelFormat_24Bits_RGB
  MOV    r15,qword [rsp+112]
  AND    r15,8
  AND    r15,r15
  JE    _EndIf492
; *td\imageFormat = #GL_RGB
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+24],6407
; *td\internalTextureFormat = #GL_RGB
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+32],6407
; EndIf
_EndIf492:
; 
; If pixelFormat & #PB_PixelFormat_32Bits_RGB
  MOV    r15,qword [rsp+112]
  AND    r15,32
  AND    r15,r15
  JE    _EndIf494
; *td\imageFormat = #GL_RGBA
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+24],6408
; *td\internalTextureFormat = #GL_RGBA
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+32],6408
; EndIf
_EndIf494:
; 
; If pixelFormat & #PB_PixelFormat_24Bits_BGR
  MOV    r15,qword [rsp+112]
  AND    r15,16
  AND    r15,r15
  JE    _EndIf496
; *td\imageFormat = #GL_BGR
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+24],32992
; *td\internalTextureFormat = #GL_RGB
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+32],6407
; EndIf
_EndIf496:
; 
; If pixelFormat & #PB_PixelFormat_32Bits_BGR
  MOV    r15,qword [rsp+112]
  AND    r15,64
  AND    r15,r15
  JE    _EndIf498
; *td\imageFormat = #GL_BGRA
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+24],32993
; *td\internalTextureFormat = #GL_RGBA
  MOV    rbp,qword [rsp+40]
  MOV    qword [rbp+32],6408
; EndIf
_EndIf498:
; 
; pitch = DrawingBufferPitch()
  CALL   PB_DrawingBufferPitch
  MOV    qword [rsp+104],rax
; 
; rowLen = *td\imageWidth * (*td\imageDepth / 8)
  MOV    rbp,qword [rsp+40]
  MOV    r15,qword [rbp]
  MOV    rbp,qword [rsp+40]
  MOV    r14,qword [rbp+16]
  MOV    rax,r14
  MOV    rcx,8
  CQO
  IDIV   rcx
  MOV    r14,rax
  IMUL   r15,r14
  MOV    qword [rsp+96],r15
; 
; If isReversed
  CMP    qword [rsp+120],0
  JE    _EndIf500
; For row = 0 To *td\imageHeight - 1
  MOV    qword [rsp+88],0
  JMP   _ForSkipDebug501
_For501:
_ForSkipDebug501:
  MOV    rbp,qword [rsp+40]
  MOV    r15,qword [rbp+8]
  DEC    r15
  CMP    r15,qword [rsp+88]
  JL    _Next502
; CopyMemory(*drawbuff + pitch * row, *td\pixels + rowLen * row, rowLen)        
  PUSH   qword [rsp+96]
  MOV    rbp,qword [rsp+48]
  MOV    r15,qword [rbp+48]
  MOV    r14,qword [rsp+104]
  IMUL   r14,qword [rsp+96]
  ADD    r15,r14
  MOV    rax,r15
  PUSH   rax
  MOV    r15,qword [rsp+96]
  MOV    r14,qword [rsp+120]
  IMUL   r14,qword [rsp+104]
  ADD    r15,r14
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  CALL   PB_CopyMemory
; Next
_NextContinue502:
  INC    qword [rsp+88]
  JNO   _For501
_Next502:
; Else   
  JMP   _EndIf499
_EndIf500:
; For row = 0 To *td\imageHeight - 1
  MOV    qword [rsp+88],0
  JMP   _ForSkipDebug504
_For504:
_ForSkipDebug504:
  MOV    rbp,qword [rsp+40]
  MOV    r15,qword [rbp+8]
  DEC    r15
  CMP    r15,qword [rsp+88]
  JL    _Next505
; CopyMemory(*drawbuff + pitch  * (*td\imageHeight - 1 - row), *td\pixels + rowLen * row, rowLen)
  PUSH   qword [rsp+96]
  MOV    rbp,qword [rsp+48]
  MOV    r15,qword [rbp+48]
  MOV    r14,qword [rsp+104]
  IMUL   r14,qword [rsp+96]
  ADD    r15,r14
  MOV    rax,r15
  PUSH   rax
  MOV    r15,qword [rsp+96]
  MOV    r14,qword [rsp+120]
  MOV    rbp,qword [rsp+56]
  MOV    r13,qword [rbp+8]
  SUB    r13,qword [rsp+104]
  DEC    r13
  IMUL   r14,r13
  ADD    r15,r14
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  CALL   PB_CopyMemory
; Next     
_NextContinue505:
  INC    qword [rsp+88]
  JNO   _For504
_Next505:
; EndIf
_EndIf499:
; 
; StopDrawing()
  CALL   PB_StopDrawing
; 
; ProcedureReturn *td
  MOV    rax,qword [rsp+40]
  JMP   _EndProcedure2911
; 
; exit:
sgl.ll_createtexeldata_exit:
; 
; If hDC : StopDrawing() :EndIf
  CMP    qword [rsp+72],0
  JE    _EndIf507
  CALL   PB_StopDrawing
_EndIf507:
; If *td : FreeMemory(*td) : EndIf
  CMP    qword [rsp+40],0
  JE    _EndIf509
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_FreeMemory
_EndIf509:
; 
; ProcedureReturn 0 
  XOR    rax,rax
  JMP   _EndProcedure2911
; EndProcedure
_EndProcedureZero2911:
  XOR    rax,rax
_EndProcedure2911:
  ADD    rsp,136
  POP    r13
  POP    r14
  POP    r15
  POP    rbp
  RET
; Procedure CPUID (leaf.l, *eax, *ebx, *ecx, *edx)
_Procedure34:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PS34=48
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; 
; CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm
; !mov eax, dword [p.v_leaf]
p.v_leaf equ rsp+PS34+0
p.p_eax equ rsp+PS34+8
p.p_ebx equ rsp+PS34+16
p.p_ecx equ rsp+PS34+24
p.p_edx equ rsp+PS34+32
mov eax, dword [p.v_leaf]
; !CPUID
CPUID
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)  
; !mov rbp, qword [p.p_eax]
mov rbp, qword [p.p_eax]
; !mov dword [rbp], eax
mov dword [rbp], eax
; !mov rbp, qword [p.p_ebx]
mov rbp, qword [p.p_ebx]
; !mov dword [rbp], ebx
mov dword [rbp], ebx
; !mov rbp, qword [p.p_ecx]
mov rbp, qword [p.p_ecx]
; !mov dword [rbp], ecx
mov dword [rbp], ecx
; !mov rbp, qword [p.p_edx]
mov rbp, qword [p.p_edx]
; !mov dword [rbp], edx
mov dword [rbp], edx
; CompilerEndIf  
; CompilerEndIf
; 
; CompilerIf #PB_Compiler_Backend = #PB_Backend_C
; EndProcedure
_EndProcedureZero35:
  XOR    rax,rax
_EndProcedure35:
  ADD    rsp,40
  RET
; Procedure GetHighestLeaf (Extended.l, *HighestLeaf, *Manufacturer = #Null)
_Procedure32:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS32=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; Protected.l mf1, mf2, mf3
; 
; CompilerIf #PB_Compiler_Backend = #PB_Backend_Asm
; !mov eax, dword [p.v_Extended]
p.p_Manufacturer equ rsp+PS32+16
p.p_HighestLeaf equ rsp+PS32+8
p.v_mf1 equ rsp+40
p.v_mf2 equ rsp+48
p.v_mf3 equ rsp+56
p.v_Extended equ rsp+PS32+0
mov eax, dword [p.v_Extended]
; !CPUID
CPUID
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)  
; !mov rbp, qword [p.p_HighestLeaf]
mov rbp, qword [p.p_HighestLeaf]
; !mov dword [rbp], eax
mov dword [rbp], eax
; CompilerEndIf 
; !mov dword [p.v_mf1], ebx
mov dword [p.v_mf1], ebx
; !mov dword [p.v_mf2], edx
mov dword [p.v_mf2], edx
; !mov dword [p.v_mf3], ecx
mov dword [p.v_mf3], ecx
; CompilerEndIf
; 
; CompilerIf #PB_Compiler_Backend = #PB_Backend_C
; 
; If *Manufacturer
  CMP    qword [rsp+PS32+16],0
  JE    _EndIf104
; PokeS(*Manufacturer, PeekS(@mf1, 4, #PB_Ascii) + PeekS(@mf2, 4, #PB_Ascii) + PeekS(@mf3, 4, #PB_Ascii))       
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+104]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+112]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  ADD    qword [PB_StringBasePosition],2
  PUSH   qword [rsp+PS32+40]
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+8],rdx
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_PokeS
  ADD    rsp,40
  POP    qword [PB_StringBasePosition]
; EndIf
_EndIf104:
; EndProcedure
_EndProcedureZero33:
  XOR    rax,rax
_EndProcedure33:
  ADD    rsp,72
  RET
; Procedure.q GetFreeMemory()
_Procedure50:
  PS50=48
  SUB    rsp,40
; 
; ProcedureReturn MemoryStatus(#PB_System_FreePhysical)
  PUSH   qword 1
  POP    rcx
  CALL   PB_MemoryStatus
  JMP   _EndProcedure51
; EndProcedure
_EndProcedureZero51:
  XOR    rax,rax
_EndProcedure51:
  ADD    rsp,40
  RET
; Procedure.q GetTotalMemory()
_Procedure48:
  PS48=48
  SUB    rsp,40
; 
; ProcedureReturn MemoryStatus(#PB_System_TotalPhysical)
  PUSH   qword 0
  POP    rcx
  CALL   PB_MemoryStatus
  JMP   _EndProcedure49
; EndProcedure
_EndProcedureZero49:
  XOR    rax,rax
_EndProcedure49:
  ADD    rsp,40
  RET
; Procedure.s GetCpuName()
_Procedure46:
  PUSH   r15
  PS46=128
  MOV    rax,9
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rax,[rsp+PS46+32]
  MOV    qword [PB_StringBasePosition],rax
; 
; 
; Protected Text$, Manufacturer$ = Space(12)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 12
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Space
  ADD    rsp,40
  ADD    qword [PB_StringBasePosition],2
  LEA    rcx,[rsp+56]
  POP    rdx
  CALL   SYS_AllocateString4
; Protected.l HighestExt, leaf, eax, ebx, ecx, edx
; 
; CPUID::GetHighestLeaf ($80000000, @HighestExt, @Manufacturer$)
  MOV    rax,qword [rsp+48]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+64]
  MOV    rax,rax
  PUSH   rax
  MOV    rax,2147483648
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure32
; 
; If (HighestExt & $7FFFFFFF) >= $0004 
  MOVSXD r15,dword [rsp+56]
  AND    r15,2147483647
  CMP    r15,4
  JL    _EndIf138
; For leaf = $80000002 To $80000004
  MOV    rax,2147483650
  MOV    dword [rsp+64],eax
  JMP   _ForSkipDebug139
_For139:
_ForSkipDebug139:
  MOV    rax,2147483652
  CMP    eax,dword [rsp+64]
  JL    _Next140
; CPUID::CPUID (leaf, @eax, @ebx, @ecx, @edx)
  SUB    rsp,8
  LEA    rax,[rsp+104]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+104]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+104]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+104]
  MOV    rax,rax
  PUSH   rax
  MOVSXD rax,dword [rsp+104]
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure34
  ADD    rsp,48
; Text$ + PeekS(@eax, 4, #PB_Ascii) + PeekS(@ebx, 4, #PB_Ascii) + PeekS(@ecx, 4, #PB_Ascii) + PeekS(@edx, 4, #PB_Ascii)         
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+112]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+120]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+128]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword 4
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,32
  POP    rax
  LEA    rcx,[rsp+48]
  POP    rdx
  CALL   SYS_AllocateString4
; Next           
_NextContinue140:
  INC    dword [rsp+64]
  JNO   _For139
_Next140:
; Else
  JMP   _EndIf137
_EndIf138:
; Text$ = Manufacturer$
  MOV    rcx,qword [rsp+48]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  LEA    rcx,[rsp+48]
  POP    rdx
  CALL   SYS_AllocateString4
; EndIf
_EndIf137:
; 
; ProcedureReturn str::TrimEx(Text$)
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S13
  PUSH   rax
  PUSH   qword [rsp+64]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL  _Procedure14
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure47
; EndProcedure
_EndProcedureZero47:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure47:
  PUSH   rax
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,112
  POP    r15
  RET
; Procedure.i WIN_Is64BitOS()
_Procedure52:
  PS52=48
  SUB    rsp,40
; CompilerIf (#PB_Compiler_Processor = #PB_Processor_x64)
; ProcedureReturn 1 
  MOV    rax,1
  JMP   _EndProcedure53
; CompilerElse   
; EndProcedure
_EndProcedureZero53:
  XOR    rax,rax
_EndProcedure53:
  ADD    rsp,40
  RET
; Procedure.s WIN_GetOS()
_Procedure56:
  PUSH   r15
  PS56=112
  MOV    rax,7
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rax,[rsp+PS56+32]
  MOV    qword [PB_StringBasePosition],rax
; Protected OS$, arch$
; Protected OS_Version$ = WIN_GetOSVersion()
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,32
  CALL  _Procedure54
  ADD    rsp,40
  ADD    qword [PB_StringBasePosition],2
  LEA    rcx,[rsp+64]
  POP    rdx
  CALL   SYS_AllocateString4
; Protected OS_Maj$ = StringField(OS_Version$, 1, ".")
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; Protected OS_Min$ = StringField(OS_Version$, 2, ".")
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 2
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+80]
  POP    rdx
  CALL   SYS_AllocateString4
; Protected OS_Release$ = StringField(OS_Version$, 3, ".")
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 3
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+88]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; Select OSVersion()
  CALL   PB_OSVersion
  MOV    rax,rax
  PUSH   rax
; Case #PB_OS_Windows_NT3_51
  MOV    r15,5
  CMP    r15,[rsp]
  JNE   _Case50
; OS$ = "Windows NT 3.51"
  MOV    rdx,_S31
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_95
  JMP   _EndSelect6
_Case50:
  MOV    r15,10
  CMP    r15,[rsp]
  JNE   _Case51
; OS$ = "Windows 95"
  MOV    rdx,_S32
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; If OS_Maj$ = "4"
  PUSH   qword [rsp+72]
  MOV    rcx,_S33
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf117
; If OS_Release$ = "1111" : OS$ = "Windows 95 OSR2" : EndIf
  PUSH   qword [rsp+88]
  MOV    rcx,_S34
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf119
  MOV    rdx,_S35
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
_EndIf119:
; EndIf        
_EndIf117:
; Case #PB_OS_Windows_NT_4
  JMP   _EndSelect6
_Case51:
  MOV    r15,20
  CMP    r15,[rsp]
  JNE   _Case52
; OS$ = "Windows NT 4.0"
  MOV    rdx,_S36
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_98
  JMP   _EndSelect6
_Case52:
  MOV    r15,30
  CMP    r15,[rsp]
  JNE   _Case53
; OS$ = "Windows 98"    
  MOV    rdx,_S37
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; If OS_Maj$ = "4" And OS_Min$ = "10"
  PUSH   qword [rsp+72]
  MOV    rcx,_S33
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No6
  PUSH   qword [rsp+80]
  MOV    rcx,_S38
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No6
Ok6:
  MOV    rax,1
  JMP    End6
No6:
  XOR    rax,rax
End6:
  AND    rax,rax
  JE    _EndIf121
; If OS_Release$ = "2222" : OS$ = "Windows 98 SE" : EndIf        
  PUSH   qword [rsp+88]
  MOV    rcx,_S39
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf123
  MOV    rdx,_S40
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
_EndIf123:
; EndIf    
_EndIf121:
; Case #PB_OS_Windows_ME
  JMP   _EndSelect6
_Case53:
  MOV    r15,40
  CMP    r15,[rsp]
  JNE   _Case54
; OS$ = "Windows ME"    
  MOV    rdx,_S41
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_2000
  JMP   _EndSelect6
_Case54:
  MOV    r15,50
  CMP    r15,[rsp]
  JNE   _Case55
; OS$ = "Windows 2000"   
  MOV    rdx,_S42
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_XP
  JMP   _EndSelect6
_Case55:
  MOV    r15,60
  CMP    r15,[rsp]
  JNE   _Case56
; OS$ = "Windows XP"    
  MOV    rdx,_S43
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_Server_2003
  JMP   _EndSelect6
_Case56:
  MOV    r15,65
  CMP    r15,[rsp]
  JNE   _Case57
; OS$ = "Windows Server 2003"    
  MOV    rdx,_S44
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_Vista
  JMP   _EndSelect6
_Case57:
  MOV    r15,70
  CMP    r15,[rsp]
  JNE   _Case58
; OS$ = "Windows Vista"   
  MOV    rdx,_S45
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; If OS_Maj$ = "6" And OS_Min$ ="0"
  PUSH   qword [rsp+72]
  MOV    rcx,_S46
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No7
  PUSH   qword [rsp+80]
  MOV    rcx,_S14
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No7
Ok7:
  MOV    rax,1
  JMP    End7
No7:
  XOR    rax,rax
End7:
  AND    rax,rax
  JE    _EndIf125
; If OS_Release$ = "6001" : OS$ = "Windows Vista (SP1)" : EndIf        
  PUSH   qword [rsp+88]
  MOV    rcx,_S47
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf127
  MOV    rdx,_S48
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
_EndIf127:
; If OS_Release$ = "6002" : OS$ = "Windows Vista (SP2)" : EndIf        
  PUSH   qword [rsp+88]
  MOV    rcx,_S49
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf129
  MOV    rdx,_S50
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
_EndIf129:
; EndIf 
_EndIf125:
; Case #PB_OS_Windows_Server_2008, #PB_OS_Windows_Server_2008_R2
  JMP   _EndSelect6
_Case58:
  MOV    r15,75
  CMP    r15,[rsp]
  JE    _Case59
  MOV    r15,85
  CMP    r15,[rsp]
  JNE   _Case60
_Case59:
; OS$ = "Windows Server 2008"    
  MOV    rdx,_S51
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_7
  JMP   _EndSelect6
_Case60:
  MOV    r15,80
  CMP    r15,[rsp]
  JNE   _Case61
; OS$ = "Windows 7"
  MOV    rdx,_S52
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; If OS_Maj$ = "6" And OS_Min$ ="0"
  PUSH   qword [rsp+72]
  MOV    rcx,_S46
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No8
  PUSH   qword [rsp+80]
  MOV    rcx,_S14
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE     No8
Ok8:
  MOV    rax,1
  JMP    End8
No8:
  XOR    rax,rax
End8:
  AND    rax,rax
  JE    _EndIf131
; If OS_Release$ = "7601": OS$ = "Windows 7 (SP1)" : EndIf        
  PUSH   qword [rsp+88]
  MOV    rcx,_S53
  POP    rdx
  SUB    rsp,40
  CALL   SYS_StringEqual
  ADD    rsp,40
  OR     rax,rax
  JE    _EndIf133
  MOV    rdx,_S54
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
_EndIf133:
; EndIf
_EndIf131:
; Case #PB_OS_Windows_8
  JMP   _EndSelect6
_Case61:
  MOV    r15,90
  CMP    r15,[rsp]
  JNE   _Case62
; OS$ = "Windows 8"
  MOV    rdx,_S55
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_Server_2012, #PB_OS_Windows_Server_2012_R2
  JMP   _EndSelect6
_Case62:
  MOV    r15,95
  CMP    r15,[rsp]
  JE    _Case63
  MOV    r15,105
  CMP    r15,[rsp]
  JNE   _Case64
_Case63:
; OS$ = "Windows Server 2012"    
  MOV    rdx,_S56
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_8_1
  JMP   _EndSelect6
_Case64:
  MOV    r15,100
  CMP    r15,[rsp]
  JNE   _Case65
; OS$ = "Windows 8.1"        
  MOV    rdx,_S57
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_10
  JMP   _EndSelect6
_Case65:
  MOV    r15,110
  CMP    r15,[rsp]
  JNE   _Case66
; OS$ = "Windows 10"        
  MOV    rdx,_S58
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Case #PB_OS_Windows_11
  JMP   _EndSelect6
_Case66:
  MOV    r15,120
  CMP    r15,[rsp]
  JNE   _Case67
; OS$ = "Windows 11"        
  MOV    rdx,_S59
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; Default
  JMP   _EndSelect6
_Case67:
; OS$ = "Windows"
  MOV    rdx,_S60
  LEA    rcx,[rsp+48]
  SUB    rsp,40
  CALL   SYS_FastAllocateStringFree4
  ADD    rsp,40
; EndSelect
_Case68:
_EndSelect6:
  POP    rax
; 
; If WIN_Is64BitOS()
  CALL  _Procedure52
  AND    rax,rax
  JE    _EndIf135
; arch$ = "x64"
  MOV    rdx,_S61
  LEA    rcx,[rsp+48]
  CALL   SYS_FastAllocateStringFree4
; Else
  JMP   _EndIf134
_EndIf135:
; arch$ = "x86"
  MOV    rdx,_S62
  LEA    rcx,[rsp+48]
  CALL   SYS_FastAllocateStringFree4
; EndIf
_EndIf134:
; 
; 
; ProcedureReturn OS$ + " " + arch$ + " (" + OS_Version$ + ")"
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S13
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S63
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,_S64
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure57
; EndProcedure
_EndProcedureZero57:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure57:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+88]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+80]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,96
  POP    r15
  RET
; Procedure.s WIN_GetOSVersion ()
_Procedure54:
  PUSH   rbp
  PUSH   r15
  PS54=400
  MOV    rax,42
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rax,[rsp+PS54+32]
  MOV    qword [PB_StringBasePosition],rax
; 
; 
; 
; Protected osvex.OSVERSIONINFOEX 
; Protected *fp, err, hDll, major, minor, release
; 
; osvex\dwOSVersionInfoSize = SizeOf(osvex)
  LEA    rbp,[rsp+40]
  MOV    dword [rbp],284
; 
; err = 1
  MOV    qword [rsp+336],1
; 
; If GetVersionEx_(@osvex)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL   GetVersionExW
  AND    rax,rax
  JE    _EndIf106
; err = 0
  MOV    qword [rsp+336],0
; 
; major = osvex\dwMajorVersion
  LEA    rbp,[rsp+40]
  MOVSXD rax,dword [rbp+4]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+352],rax
; minor = osvex\dwMinorVersion 
  MOVSXD rax,dword [rbp+8]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+360],rax
; release = osvex\dwBuildNumber
  MOVSXD rax,dword [rbp+12]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+368],rax
; 
; If (major = 6 And minor = 2) 
  MOV    r15,qword [rsp+352]
  CMP    r15,6
  JNE    No4
  MOV    r15,qword [rsp+360]
  CMP    r15,2
  JNE    No4
Ok4:
  MOV    rax,1
  JMP    End4
No4:
  XOR    rax,rax
End4:
  AND    rax,rax
  JE    _EndIf108
; err = 1
  MOV    qword [rsp+336],1
; hDll = OpenLibrary (#PB_Any, "ntdll.dll")           
  MOV    rax,_S29
  PUSH   rax
  PUSH   qword -1
  POP    rcx
  POP    rdx
  CALL   PB_OpenLibrary
  MOV    qword [rsp+344],rax
; If hDll    
  CMP    qword [rsp+344],0
  JE    _EndIf110
; *fp = GetFunction(hDll, "RtlGetVersion")
  MOV    rax,_S30
  PUSH   rax
  PUSH   qword [rsp+352]
  POP    rcx
  POP    rdx
  CALL   PB_GetFunction
  MOV    qword [rsp+328],rax
; If *fp And CallFunctionFast(*fp, @osvex) = 0 
  CMP    qword [rsp+328],0
  JE     No5
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+336]
  POP    rcx
  POP    rdx
  CALL   PB_CallFunctionFast2
  MOV    r15,rax
  AND    r15,r15
  JNE    No5
Ok5:
  MOV    rax,1
  JMP    End5
No5:
  XOR    rax,rax
End5:
  AND    rax,rax
  JE    _EndIf112
; err = 0
  MOV    qword [rsp+336],0
; major = osvex\dwMajorVersion    
  LEA    rbp,[rsp+40]
  MOVSXD rax,dword [rbp+4]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+352],rax
; minor = osvex\dwMinorVersion
  MOVSXD rax,dword [rbp+8]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+360],rax
; release = osvex\dwBuildNumber
  MOVSXD rax,dword [rbp+12]
  PUSH   rax
  POP    rax
  MOV    qword [rsp+368],rax
; EndIf     
_EndIf112:
; CloseLibrary(hDll)        
  PUSH   qword [rsp+344]
  POP    rcx
  CALL   PB_CloseLibrary
; EndIf
_EndIf110:
; EndIf      
_EndIf108:
; EndIf      
_EndIf106:
; 
; If err
  CMP    qword [rsp+336],0
  JE    _EndIf114
; ProcedureReturn #Empty$
  MOV    rcx,_S18
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure55
; Else
  JMP   _EndIf113
_EndIf114:
; 
; ProcedureReturn Str(major) + "." + Str(minor) + "." + Str(release)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+376]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Str
  ADD    rsp,40
  MOV    rcx,_S17
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+384]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Str
  ADD    rsp,32
  POP    rax
  MOV    rcx,_S17
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+392]
  POP    rcx
  POP    rdx
  SUB    rsp,32
  CALL   PB_Str
  ADD    rsp,32
  POP    rax
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure55
; EndIf
_EndIf113:
; EndProcedure
_EndProcedureZero55:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure55:
  ADD    rsp,376
  POP    r15
  POP    rbp
  RET
; Procedure.s GetOS()
_Procedure44:
  PS44=48
  SUB    rsp,40
  MOV    rax,[rsp+PS44+32]
  MOV    qword [PB_StringBasePosition],rax
; 
; 
; 
; 
; 
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
; ProcedureReturn WIN_GetOS()
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,32
  CALL  _Procedure56
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure45
; CompilerEndIf
; 
; CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
; 
; EndProcedure
_EndProcedureZero45:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure45:
  ADD    rsp,40
  RET
; Procedure ScaleXYZ (*ScaledMatrix.m4x4, x.f, y.f, z.f)
_Procedure2648:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2648=128
  MOV    rax,9
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix
; 
; Identity(TempMatrix)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; 
; TempMatrix\float[0]  = x
  FLD    dword [rsp+PS2648+8]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp]
; TempMatrix\float[5]  = y
  FLD    dword [rsp+PS2648+16]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+20]
; TempMatrix\float[10] = z
  FLD    dword [rsp+PS2648+24]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; 
; Multiply(*ScaledMatrix, TempMatrix, *ScaledMatrix)
  PUSH   qword [rsp+PS2648+0]
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2648+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2638
; EndProcedure
_EndProcedureZero2649:
  XOR    rax,rax
_EndProcedure2649:
  ADD    rsp,112
  POP    rbp
  RET
; Procedure Perspective (*PerspectiveMatrix.m4x4, fovy.f, aspect.f, near.f, far.f) 
_Procedure2656:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2656=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; 
; Protected inverseRange.f 
; 
; Zero(*PerspectiveMatrix)
  PUSH   qword [rsp+PS2656+0]
  POP    rcx
  CALL  _Procedure2632
; 
; inverseRange = 1.0 / Tan((fovy * #ONE_DEG_IN_RAD) / 2.0)
  FLD    dword [rsp+PS2656+8]
  FMUL   qword [D3]
  FDIV   qword [D4]
  FPTAN
  FSTP   dword [rsp-8]
  FDIVR  dword [F3]
  FSTP   dword [rsp+40]
; 
; *PerspectiveMatrix\float[0]  = inverseRange / aspect
  FLD    dword [rsp+40]
  FDIV   dword [rsp+PS2656+16]
  MOV    rbp,qword [rsp+PS2656+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp]
; *PerspectiveMatrix\float[5]  = inverseRange
  FLD    dword [rsp+40]
  MOV    rbp,qword [rsp+PS2656+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+20]
; *PerspectiveMatrix\float[10] = - (far + near) / (far - near)
  FLD    dword [rsp+PS2656+32]
  FADD   dword [rsp+PS2656+24]
  FADD   dword [F2]
  FCHS
  FLD    dword [rsp+PS2656+32]
  FSUB   dword [rsp+PS2656+24]
  FADD   dword [F2]
  FDIVP  st1,st0
  MOV    rbp,qword [rsp+PS2656+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; *PerspectiveMatrix\float[14] = - (2.0 * far * near) / (far - near)
  FLD    dword [rsp+PS2656+32]
  FMUL   dword [F4]
  FMUL   dword [rsp+PS2656+24]
  FCHS
  FLD    dword [rsp+PS2656+32]
  FSUB   dword [rsp+PS2656+24]
  FADD   dword [F2]
  FDIVP  st1,st0
  MOV    rbp,qword [rsp+PS2656+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+56]
; *PerspectiveMatrix\float[11] = -1.0 
  MOV    rbp,qword [rsp+PS2656+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+44],-1082130432
; EndProcedure
_EndProcedureZero2657:
  XOR    rax,rax
_EndProcedure2657:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Multiply (*MatrixA.m4x4, *MatrixB.m4x4, *MultipliedMatrix.m4x4)
_Procedure2638:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PUSH   r15
  PS2638=144
  MOV    rax,10
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix, *m
; 
; If *MatrixA = *MultipliedMatrix Or *MatrixB = *MultipliedMatrix 
  MOV    r15,qword [rsp+PS2638+0]
  CMP    r15,qword [rsp+PS2638+16]
  JE     Ok16
  MOV    r15,qword [rsp+PS2638+8]
  CMP    r15,qword [rsp+PS2638+16]
  JE     Ok16
  JMP    No16
Ok16:
  MOV    rax,1
  JMP    End16
No16:
  XOR    rax,rax
End16:
  AND    rax,rax
  JE    _EndIf256
; *m = @TempMatrix
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rax
  MOV    qword [rsp+104],rax
; Else
  JMP   _EndIf255
_EndIf256:
; *m = *MultipliedMatrix
  PUSH   qword [rsp+PS2638+16]
  POP    rax
  MOV    qword [rsp+104],rax
; EndIf
_EndIf255:
; 
; *m\float[0]  = *MatrixA\float[0] * *MatrixB\float[0]  + *MatrixA\float[4] * *MatrixB\float[1]  + *MatrixA\float[8]  * *MatrixB\float[2]  + *MatrixA\float[12] * *MatrixB\float[3]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp]
; *m\float[4]  = *MatrixA\float[0] * *MatrixB\float[4]  + *MatrixA\float[4] * *MatrixB\float[5]  + *MatrixA\float[8]  * *MatrixB\float[6]  + *MatrixA\float[12] * *MatrixB\float[7]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+20]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+24]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+28]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+16]
; *m\float[8]  = *MatrixA\float[0] * *MatrixB\float[8]  + *MatrixA\float[4] * *MatrixB\float[9]  + *MatrixA\float[8]  * *MatrixB\float[10] + *MatrixA\float[12] * *MatrixB\float[11]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+36]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+40]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+44]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+32]
; *m\float[12] = *MatrixA\float[0] * *MatrixB\float[12] + *MatrixA\float[4] * *MatrixB\float[13] + *MatrixA\float[8]  * *MatrixB\float[14] + *MatrixA\float[12] * *MatrixB\float[15]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+52]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+56]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+60]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+48]
; *m\float[1]  = *MatrixA\float[1] * *MatrixB\float[0]  + *MatrixA\float[5] * *MatrixB\float[1]  + *MatrixA\float[9]  * *MatrixB\float[2]  + *MatrixA\float[13] * *MatrixB\float[3]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+20]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+36]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+52]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+4]
; *m\float[5]  = *MatrixA\float[1] * *MatrixB\float[4]  + *MatrixA\float[5] * *MatrixB\float[5]  + *MatrixA\float[9]  * *MatrixB\float[6]  + *MatrixA\float[13] * *MatrixB\float[7]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+20]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+20]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+36]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+24]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+52]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+28]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+20]
; *m\float[9]  = *MatrixA\float[1] * *MatrixB\float[8]  + *MatrixA\float[5] * *MatrixB\float[9]  + *MatrixA\float[9]  * *MatrixB\float[10] + *MatrixA\float[13] * *MatrixB\float[11]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+20]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+36]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+36]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+40]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+52]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+44]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+36]
; *m\float[13] = *MatrixA\float[1] * *MatrixB\float[12] + *MatrixA\float[5] * *MatrixB\float[13] + *MatrixA\float[9]  * *MatrixB\float[14] + *MatrixA\float[13] * *MatrixB\float[15]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+20]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+52]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+36]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+56]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+52]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+60]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+52]
; *m\float[2]  = *MatrixA\float[2] * *MatrixB\float[0]  + *MatrixA\float[6] * *MatrixB\float[1]  + *MatrixA\float[10] * *MatrixB\float[2]  + *MatrixA\float[14] * *MatrixB\float[3]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+24]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+40]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+56]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+8]
; *m\float[6]  = *MatrixA\float[2] * *MatrixB\float[4]  + *MatrixA\float[6] * *MatrixB\float[5]  + *MatrixA\float[10] * *MatrixB\float[6]  + *MatrixA\float[14] * *MatrixB\float[7]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+24]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+20]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+40]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+24]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+56]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+28]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+24]
; *m\float[10] = *MatrixA\float[2] * *MatrixB\float[8]  + *MatrixA\float[6] * *MatrixB\float[9]  + *MatrixA\float[10] * *MatrixB\float[10] + *MatrixA\float[14] * *MatrixB\float[11]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+24]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+36]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+40]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+40]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+56]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+44]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; *m\float[14] = *MatrixA\float[2] * *MatrixB\float[12] + *MatrixA\float[6] * *MatrixB\float[13] + *MatrixA\float[10] * *MatrixB\float[14] + *MatrixA\float[14] * *MatrixB\float[15]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+24]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+52]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+40]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+56]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+56]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+60]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+56]
; *m\float[3]  = *MatrixA\float[3] * *MatrixB\float[0]  + *MatrixA\float[7] * *MatrixB\float[1]  + *MatrixA\float[11] * *MatrixB\float[2]  + *MatrixA\float[15] * *MatrixB\float[3]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+28]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+44]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+60]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+12]
; *m\float[7]  = *MatrixA\float[3] * *MatrixB\float[4]  + *MatrixA\float[7] * *MatrixB\float[5]  + *MatrixA\float[11] * *MatrixB\float[6]  + *MatrixA\float[15] * *MatrixB\float[7]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+16]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+28]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+20]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+44]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+24]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+60]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+28]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+28]
; *m\float[11] = *MatrixA\float[3] * *MatrixB\float[8]  + *MatrixA\float[7] * *MatrixB\float[9]  + *MatrixA\float[11] * *MatrixB\float[10] + *MatrixA\float[15] * *MatrixB\float[11]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+32]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+28]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+36]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+44]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+40]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+60]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+44]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+44]
; *m\float[15] = *MatrixA\float[3] * *MatrixB\float[12] + *MatrixA\float[7] * *MatrixB\float[13] + *MatrixA\float[11] * *MatrixB\float[14] + *MatrixA\float[15] * *MatrixB\float[15]     
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+48]
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+28]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+52]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+44]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+56]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2638+0]
  PUSH   rbp
  POP    rbp
  FLD    dword [rbp+60]
  MOV    rbp,qword [rsp+PS2638+8]
  PUSH   rbp
  POP    rbp
  FMUL   dword [rbp+60]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+104]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+60]
; 
; If *MatrixA = *MultipliedMatrix Or *MatrixB = *MultipliedMatrix 
  MOV    r15,qword [rsp+PS2638+0]
  CMP    r15,qword [rsp+PS2638+16]
  JE     Ok17
  MOV    r15,qword [rsp+PS2638+8]
  CMP    r15,qword [rsp+PS2638+16]
  JE     Ok17
  JMP    No17
Ok17:
  MOV    rax,1
  JMP    End17
No17:
  XOR    rax,rax
End17:
  AND    rax,rax
  JE    _EndIf259
; Copy(*m, *MultipliedMatrix)
  PUSH   qword [rsp+PS2638+16]
  PUSH   qword [rsp+112]
  POP    rcx
  POP    rdx
  CALL  _Procedure2634
; EndIf
_EndIf259:
; EndProcedure
_EndProcedureZero2639:
  XOR    rax,rax
_EndProcedure2639:
  ADD    rsp,120
  POP    r15
  POP    rbp
  RET
; Procedure RotateX (*RotatedMatrix.m4x4, angle.f)
_Procedure2650:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  PUSH   rbp
  PS2650=144
  MOV    rax,11
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix
; Protected rad.f = angle * #ONE_DEG_IN_RAD
  FLD    dword [rsp+PS2650+8]
  FMUL   dword [F5]
  FSTP   dword [rsp+104]
; Protected sine.f = Sin(rad)
  FLD    dword [rsp+104]
  FSIN
  FSTP   dword [rsp+112]
; Protected cosine.f = Cos(rad)
  FLD    dword [rsp+104]
  FCOS
  FSTP   dword [rsp+120]
; 
; Identity(TempMatrix)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; 
; TempMatrix\float[5]  =  cosine
  FLD    dword [rsp+120]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+20]
; TempMatrix\float[6]  = -sine
  FLD    dword [rsp+112]
  FCHS
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+24]
; TempMatrix\float[9]  =  sine
  FLD    dword [rsp+112]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+36]
; TempMatrix\float[10] =  cosine
  FLD    dword [rsp+120]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; 
; Multiply(*RotatedMatrix, TempMatrix, *RotatedMatrix)
  PUSH   qword [rsp+PS2650+0]
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2650+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2638
; EndProcedure
_EndProcedureZero2651:
  XOR    rax,rax
_EndProcedure2651:
  ADD    rsp,128
  POP    rbp
  RET
; Procedure RotateY (*RotatedMatrix.m4x4, angle.f)
_Procedure2652:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  PUSH   rbp
  PS2652=144
  MOV    rax,11
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix
; Protected rad.f = angle * #ONE_DEG_IN_RAD
  FLD    dword [rsp+PS2652+8]
  FMUL   dword [F5]
  FSTP   dword [rsp+104]
; Protected sine.f = Sin(rad)
  FLD    dword [rsp+104]
  FSIN
  FSTP   dword [rsp+112]
; Protected cosine.f = Cos(rad)
  FLD    dword [rsp+104]
  FCOS
  FSTP   dword [rsp+120]
; 
; Identity(TempMatrix)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; 
; TempMatrix\float[0]  =  cosine
  FLD    dword [rsp+120]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp]
; TempMatrix\float[2]  =  sine
  FLD    dword [rsp+112]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+8]
; TempMatrix\float[8]  = -sine
  FLD    dword [rsp+112]
  FCHS
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+32]
; TempMatrix\float[10] =  cosine
  FLD    dword [rsp+120]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; 
; Multiply(*RotatedMatrix, TempMatrix, *RotatedMatrix)
  PUSH   qword [rsp+PS2652+0]
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2652+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2638
; EndProcedure
_EndProcedureZero2653:
  XOR    rax,rax
_EndProcedure2653:
  ADD    rsp,128
  POP    rbp
  RET
; Procedure Zero (*ZeroMatrix.m4x4)
_Procedure2632:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2632=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *ZeroMatrix\float[0]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp],0
; *ZeroMatrix\float[1]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+4],0
; *ZeroMatrix\float[2]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+8],0
; *ZeroMatrix\float[3]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+12],0
; 
; *ZeroMatrix\float[4]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+16],0
; *ZeroMatrix\float[5]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+20],0
; *ZeroMatrix\float[6]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+24],0
; *ZeroMatrix\float[7]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+28],0
; 
; *ZeroMatrix\float[8]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+32],0
; *ZeroMatrix\float[9]  = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+36],0
; *ZeroMatrix\float[10] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+40],0
; *ZeroMatrix\float[11] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+44],0
; 
; *ZeroMatrix\float[12] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+48],0
; *ZeroMatrix\float[13] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+52],0
; *ZeroMatrix\float[14] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+56],0
; *ZeroMatrix\float[15] = 0.0
  MOV    rbp,qword [rsp+PS2632+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+60],0
; EndProcedure
_EndProcedureZero2633:
  XOR    rax,rax
_EndProcedure2633:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Identity (*IdentityMatrix.m4x4)
_Procedure2630:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2630=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *IdentityMatrix\float[0]  = 1.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp],1065353216
; *IdentityMatrix\float[1]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+4],0
; *IdentityMatrix\float[2]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+8],0
; *IdentityMatrix\float[3]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+12],0
; 
; *IdentityMatrix\float[4]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+16],0
; *IdentityMatrix\float[5]  = 1.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+20],1065353216
; *IdentityMatrix\float[6]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+24],0
; *IdentityMatrix\float[7]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+28],0
; 
; *IdentityMatrix\float[8]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+32],0
; *IdentityMatrix\float[9]  = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+36],0
; *IdentityMatrix\float[10] = 1.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+40],1065353216
; *IdentityMatrix\float[11] = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+44],0
; 
; *IdentityMatrix\float[12] = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+48],0
; *IdentityMatrix\float[13] = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+52],0
; *IdentityMatrix\float[14] = 0.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+56],0
; *IdentityMatrix\float[15] = 1.0
  MOV    rbp,qword [rsp+PS2630+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+60],1065353216
; EndProcedure
_EndProcedureZero2631:
  XOR    rax,rax
_EndProcedure2631:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Translate (*TranslatedMatrix.m4x4, *Vector.vec3::vec3)
_Procedure2642:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2642=128
  MOV    rax,9
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix
; 
; Identity(TempMatrix)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; 
; TempMatrix\float[12] = *Vector\x
  MOV    rbp,qword [rsp+PS2642+8]
  FLD    dword [rbp]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+48]
; TempMatrix\float[13] = *Vector\y
  MOV    rbp,qword [rsp+PS2642+8]
  FLD    dword [rbp+4]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+52]
; TempMatrix\float[14] = *Vector\z
  MOV    rbp,qword [rsp+PS2642+8]
  FLD    dword [rbp+8]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+56]
; 
; Multiply(*TranslatedMatrix, TempMatrix, *TranslatedMatrix)
  PUSH   qword [rsp+PS2642+0]
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2642+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2638
; EndProcedure
_EndProcedureZero2643:
  XOR    rax,rax
_EndProcedure2643:
  ADD    rsp,112
  POP    rbp
  RET
; Procedure Copy (*Matrix.m4x4, *DestinationMatrix.m4x4)
_Procedure2634:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2634=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected i
; 
; For i = 0 To 15
  MOV    qword [rsp+40],0
  JMP   _ForSkipDebug248
_For248:
_ForSkipDebug248:
  MOV    rax,15
  CMP    rax,qword [rsp+40]
  JL    _Next249
; *DestinationMatrix\float[i] = *Matrix\float[i]
  MOV    rbp,qword [rsp+PS2634+0]
  PUSH   rbp
  MOV    rax,qword [rsp+48]
  SAL    rax,2
  POP    rbp
  ADD    rbp,rax
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2634+8]
  PUSH   rbp
  MOV    rax,qword [rsp+48]
  SAL    rax,2
  POP    rbp
  ADD    rbp,rax
  FSTP   dword [rbp]
; Next
_NextContinue249:
  INC    qword [rsp+40]
  JNO   _For248
_Next249:
; EndProcedure
_EndProcedureZero2635:
  XOR    rax,rax
_EndProcedure2635:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure TranslateXYZ (*TranslatedMatrix.m4x4, x.f, y.f, z.f)
_Procedure2644:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2644=128
  MOV    rax,9
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; 
; 
; 
; Protected.m4x4 TempMatrix
; 
; Identity(TempMatrix)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; 
; TempMatrix\float[12] = x
  FLD    dword [rsp+PS2644+8]
  LEA    rbp,[rsp+40]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+48]
; TempMatrix\float[13] = y
  FLD    dword [rsp+PS2644+16]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+52]
; TempMatrix\float[14] = z
  FLD    dword [rsp+PS2644+24]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+56]
; 
; Multiply(*TranslatedMatrix, TempMatrix, *TranslatedMatrix)
  PUSH   qword [rsp+PS2644+0]
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS2644+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2638
; EndProcedure
_EndProcedureZero2645:
  XOR    rax,rax
_EndProcedure2645:
  ADD    rsp,112
  POP    rbp
  RET
; Procedure Ortho (*OrthoMatrix.m4x4, left.f, right.f, bottom.f, top.f, near.f, far.f)
_Procedure2658:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2658=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; 
; 
; Zero(*OrthoMatrix)
  PUSH   qword [rsp+PS2658+0]
  POP    rcx
  CALL  _Procedure2632
; 
; *OrthoMatrix\float[0]  =  2.0 / (right - left) 
  FLD    dword [rsp+PS2658+16]
  FSUB   dword [rsp+PS2658+8]
  FADD   dword [F2]
  FDIVR  dword [F4]
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp]
; *OrthoMatrix\float[5]  =  2.0 / (top - bottom) 
  FLD    dword [rsp+PS2658+32]
  FSUB   dword [rsp+PS2658+24]
  FADD   dword [F2]
  FDIVR  dword [F4]
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+20]
; *OrthoMatrix\float[10] = -2.0 / (far - near)
  FLD    dword [rsp+PS2658+48]
  FSUB   dword [rsp+PS2658+40]
  FADD   dword [F2]
  FDIVR  dword [F6]
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+40]
; 
; *OrthoMatrix\float[12] = -((right + left) / (right - left)) 
  FLD    dword [rsp+PS2658+16]
  FADD   dword [rsp+PS2658+8]
  FADD   dword [F2]
  FLD    dword [rsp+PS2658+16]
  FSUB   dword [rsp+PS2658+8]
  FADD   dword [F2]
  FDIVP  st1,st0
  FCHS
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+48]
; *OrthoMatrix\float[13] = -((top + bottom) / (top - bottom)) 
  FLD    dword [rsp+PS2658+32]
  FADD   dword [rsp+PS2658+24]
  FADD   dword [F2]
  FLD    dword [rsp+PS2658+32]
  FSUB   dword [rsp+PS2658+24]
  FADD   dword [F2]
  FDIVP  st1,st0
  FCHS
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+52]
; *OrthoMatrix\float[14] = -((far + near) / (far - near)) 
  FLD    dword [rsp+PS2658+48]
  FADD   dword [rsp+PS2658+40]
  FADD   dword [F2]
  FLD    dword [rsp+PS2658+48]
  FSUB   dword [rsp+PS2658+40]
  FADD   dword [F2]
  FDIVP  st1,st0
  FCHS
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  FSTP   dword [rbp+56]
; *OrthoMatrix\float[15] = 1.0    
  MOV    rbp,qword [rsp+PS2658+0]
  PUSH   rbp
  POP    rbp
  MOV    dword [rbp+60],1065353216
; EndProcedure
_EndProcedureZero2659:
  XOR    rax,rax
_EndProcedure2659:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure ShutDown()
_Procedure3068:
  PS3068=48
  SUB    rsp,40
; sgl::DestroyTimer(gTimer)
  PUSH   qword [v_gTimer]
  POP    rcx
  CALL  _Procedure2736
; sgl::Shutdown()
  CALL  _Procedure2714
; EndProcedure
_EndProcedureZero3069:
  XOR    rax,rax
_EndProcedure3069:
  ADD    rsp,40
  RET
; Procedure CallBack_WindowRefresh (win)
_Procedure3060:
  MOV    qword [rsp+8],rcx
  PS3060=48
  SUB    rsp,40
; Render()
  CALL  _Procedure3070
; EndProcedure 
_EndProcedureZero3061:
  XOR    rax,rax
_EndProcedure3061:
  ADD    rsp,40
  RET
; Procedure SetupContext() 
_Procedure3066:
  PUSH   r15
  PS3066=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; sgl::RegisterErrorCallBack(@CallBack_Error())
  LEA    rax,[_Procedure3062]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2716
; 
; If sgl::Init()
  CALL  _Procedure2712
  AND    rax,rax
  JE    _EndIf697
; sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 3)
  PUSH   qword 3
  PUSH   qword 2
  POP    rcx
  POP    rdx
  CALL  _Procedure2822
; sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 3)
  PUSH   qword 3
  PUSH   qword 3
  POP    rcx
  POP    rdx
  CALL  _Procedure2822
; sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_CORE)     
  PUSH   qword 3
  PUSH   qword 8
  POP    rcx
  POP    rdx
  CALL  _Procedure2822
; sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
  PUSH   qword 1
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL  _Procedure2822
; 
; gWin = sgl::CreateWindow(#WIN_WIDTH, #WIN_HEIGHT, #TITLE$)
  SUB    rsp,8
  PUSH   qword 0
  PUSH   qword 0
  MOV    rax,_S969
  PUSH   rax
  PUSH   qword 768
  PUSH   qword 1024
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure2810
  ADD    rsp,48
  MOV    qword [v_gWin],rax
; 
; If gWin
  CMP    qword [v_gWin],0
  JE    _EndIf699
; sgl::MakeContextCurrent(gWin)
  PUSH   qword [v_gWin]
  POP    rcx
  CALL  _Procedure2752
; 
; sgl::RegisterWindowCallBack(gWin, sgl::#CALLBACK_WINDOW_REFRESH, @CallBack_WindowRefresh())     
  LEA    rax,[_Procedure3060]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 7
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2816
; 
; If glLoad::Load() = 0
  CALL  _Procedure2504
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf701
; Debug glLoad::GetErrString()
; EndIf
_EndIf701:
; 
; sgl::LoadExtensionsStrings()
  CALL  _Procedure2772
; 
; If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
  CALL  _Procedure2768
  MOV    r15,rax
  AND    r15,r15
  JE     Ok28
  PUSH   qword 2
  POP    rcx
  CALL  _Procedure2746
  MOV    r15,rax
  AND    r15,r15
  JE     Ok28
  JMP    No28
Ok28:
  MOV    rax,1
  JMP    End28
No28:
  XOR    rax,rax
End28:
  AND    rax,rax
  JE    _EndIf703
; Debug "OpenGL debug output is not available !"
; EndIf   
_EndIf703:
; 
; sgl::EnableVSYNC(#VSYNC)
  PUSH   qword 1
  POP    rcx
  CALL  _Procedure2936
; 
; ProcedureReturn 
  JMP   _EndProcedure3067
; EndIf
_EndIf699:
; EndIf
_EndIf697:
; 
; sgl::Shutdown()
  CALL  _Procedure2714
; 
; End 
  JMP   _PB_EOP
; EndProcedure
_EndProcedureZero3067:
  XOR    rax,rax
_EndProcedure3067:
  ADD    rsp,48
  POP    r15
  RET
; Procedure SetupData()
_Procedure3064:
  PUSH   rbp
  PUSH   r15
  PS3064=160
  MOV    rax,12
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rdx,s_sgl.shaderobjects
  LEA    rcx,qword [rsp+88]
  CALL   SYS_InitDynamicStructure
; Protected vbo, ibo, lightVbo
; 
; Protected *vertex_light = sgl::StartData()   
  MOV    rbp,ll_setupdata_startdata_1
  MOV    qword [rsp+64],rbp
; 
; 
; Data.f -0.5, -0.5,  0.5 
; Data.f  0.5, -0.5,  0.5
; Data.f  0.5,  0.5,  0.5
; Data.f -0.5,  0.5,  0.5
; 
; Data.f -0.5, -0.5, -0.5 
; Data.f -0.5,  0.5, -0.5
; Data.f  0.5,  0.5, -0.5
; Data.f  0.5, -0.5, -0.5
; 
; Data.f -0.5,  0.5, -0.5 
; Data.f -0.5,  0.5,  0.5
; Data.f  0.5,  0.5,  0.5
; Data.f  0.5,  0.5, -0.5
; 
; Data.f -0.5, -0.5, -0.5 
; Data.f  0.5, -0.5, -0.5
; Data.f  0.5, -0.5,  0.5
; Data.f -0.5, -0.5,  0.5
; 
; Data.f  0.5, -0.5, -0.5 
; Data.f  0.5,  0.5, -0.5
; Data.f  0.5,  0.5,  0.5
; Data.f  0.5, -0.5,  0.5
; 
; Data.f -0.5, -0.5, -0.5 
; Data.f -0.5, -0.5,  0.5
; Data.f -0.5,  0.5,  0.5
; Data.f -0.5,  0.5, -0.5
; sgl::StopData()
; 
; Protected *vertex = sgl::StartData()   
  MOV    rbp,ll_setupdata_startdata_2
  MOV    qword [rsp+72],rbp
; 
; 
; Data.f -1.0, -1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0 
; Data.f  1.0, -1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
; Data.f  1.0,  1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
; Data.f -1.0,  1.0,  1.0,   1.0, 0.0, 0.0,   0.0,  0.0,  1.0
; 
; Data.f -1.0, -1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0 
; Data.f -1.0,  1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
; Data.f  1.0,  1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
; Data.f  1.0, -1.0, -1.0,   0.0, 1.0, 0.0,   0.0,  0.0, -1.0
; 
; Data.f -1.0,  1.0, -1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0 
; Data.f -1.0,  1.0,  1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
; Data.f  1.0,  1.0,  1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
; Data.f  1.0,  1.0, -1.0,   0.0, 0.0, 1.0,   0.0,  1.0,  0.0
; 
; Data.f -1.0, -1.0, -1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0 
; Data.f  1.0, -1.0, -1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
; Data.f  1.0, -1.0,  1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
; Data.f -1.0, -1.0,  1.0,   1.0, 1.0, 0.0,   0.0, -1.0,  0.0
; 
; Data.f  1.0, -1.0, -1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0 
; Data.f  1.0,  1.0, -1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
; Data.f  1.0,  1.0,  1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
; Data.f  1.0, -1.0,  1.0,   0.0, 1.0, 1.0,   1.0,  0.0,  0.0
; 
; Data.f -1.0, -1.0, -1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0 
; Data.f -1.0, -1.0,  1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
; Data.f -1.0,  1.0,  1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
; Data.f -1.0,  1.0, -1.0,   1.0, 0.0, 1.0,  -1.0,  0.0,  0.0
; sgl::StopData()
; 
; 
; Protected *indices = sgl::StartData()
  MOV    rbp,ll_setupdata_startdata_3
  MOV    qword [rsp+80],rbp
; Data.l  0,  1,  2,  2,  3,  0
; Data.l  4,  5,  6,  6,  7,  4
; Data.l  8,  9, 10, 10, 11,  8
; Data.l 12, 13, 14, 14, 15, 12
; Data.l 16, 17, 18, 18, 19, 16
; Data.l 20, 21, 22, 22, 23, 20
; sgl::StopData()
; 
; 
; 
; 
; glGenVertexArrays_(1, @gVao)
  LEA    rax,[v_gVao]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenVertexArrays_]
; glBindVertexArray_(gVao)
  PUSH   qword [v_gVao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; 
; 
; glGenBuffers_(1, @vbo)
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenBuffers_]
; glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
  PUSH   qword [rsp+40]
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; glBufferData_(#GL_ARRAY_BUFFER, 24 * 9 * SizeOf(Float), *vertex, #GL_STATIC_DRAW)
  PUSH   qword 35044
  PUSH   qword [rsp+80]
  PUSH   qword 864
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferData_]
; 
; glEnableVertexAttribArray_(0) 
  PUSH   qword 0
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 0)
  PUSH   qword 0
  PUSH   qword 36
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 3
  PUSH   qword 0
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; glEnableVertexAttribArray_(1) 
  PUSH   qword 1
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(1, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 3 * SizeOf(Float))
  PUSH   qword 12
  PUSH   qword 36
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 3
  PUSH   qword 1
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; glEnableVertexAttribArray_(2) 
  PUSH   qword 2
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(2, 3, #GL_FLOAT, #GL_FALSE, 9 * SizeOf(Float), 6 * SizeOf(Float))
  PUSH   qword 24
  PUSH   qword 36
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 3
  PUSH   qword 2
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; 
; glGenBuffers_(1, @ibo)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenBuffers_]
; glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
  PUSH   qword [rsp+48]
  PUSH   qword 34963
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; 
; glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 36  * SizeOf(Long), *indices, #GL_STATIC_DRAW)
  PUSH   qword 35044
  PUSH   qword [rsp+88]
  PUSH   qword 144
  PUSH   qword 34963
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferData_]
; 
; 
; 
; 
; 
; glGenVertexArrays_(1, @gLightVao)
  LEA    rax,[v_gLightVao]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenVertexArrays_]
; glBindVertexArray_(gLightVao)
  PUSH   qword [v_gLightVao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; 
; 
; glGenBuffers_(1, @lightVbo)
  LEA    rax,[rsp+56]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenBuffers_]
; glBindBuffer_(#GL_ARRAY_BUFFER, lightVbo)
  PUSH   qword [rsp+56]
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; glBufferData_(#GL_ARRAY_BUFFER, 24 * 3 * SizeOf(Float), *vertex_light, #GL_STATIC_DRAW)
  PUSH   qword 35044
  PUSH   qword [rsp+72]
  PUSH   qword 288
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferData_]
; 
; glEnableVertexAttribArray_(0) 
  PUSH   qword 0
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 3 * SizeOf(Float), 0)
  PUSH   qword 0
  PUSH   qword 12
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 3
  PUSH   qword 0
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; 
; glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
  PUSH   qword [rsp+48]
  PUSH   qword 34963
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; glBindVertexArray_(0) 
  PUSH   qword 0
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; 
; 
; 
; Protected objects.sgl::ShaderObjects
; Protected vs, fs
; 
; vs = sgl::CompileShaderFromFile("008.phong.vert.glsl", #GL_VERTEX_SHADER) 
  PUSH   qword 35633
  MOV    rax,_S964
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2956
  MOV    qword [rsp+104],rax
; sgl::AddShaderObject(@objects, vs) 
  PUSH   qword [rsp+104]
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; ASSERT(vs)
; 
; fs = sgl::CompileShaderFromFile("008.phong.frag.glsl", #GL_FRAGMENT_SHADER) 
  PUSH   qword 35632
  MOV    rax,_S965
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2956
  MOV    qword [rsp+112],rax
; sgl::AddShaderObject(@objects, fs) 
  PUSH   qword [rsp+112]
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; ASSERT(fs)
; 
; gShader = sgl::BuildShaderProgram(@objects) 
  PUSH   qword 1
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2962
  MOV    qword [v_gShader],rax
; ASSERT(gShader)
; 
; 
; vs = sgl::CompileShaderFromFile("008.light.vert.glsl", #GL_VERTEX_SHADER) 
  PUSH   qword 35633
  MOV    rax,_S966
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2956
  MOV    qword [rsp+104],rax
; sgl::AddShaderObject(@objects, vs) 
  PUSH   qword [rsp+104]
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; ASSERT(vs)
; 
; fs = sgl::CompileShaderFromFile("008.light.frag.glsl", #GL_FRAGMENT_SHADER) 
  PUSH   qword 35632
  MOV    rax,_S967
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2956
  MOV    qword [rsp+112],rax
; sgl::AddShaderObject(@objects, fs) 
  PUSH   qword [rsp+112]
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; ASSERT(fs)
; 
; gLightShader = sgl::BuildShaderProgram(@objects) 
  PUSH   qword 1
  LEA    rax,[rsp+96]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2962
  MOV    qword [v_gLightShader],rax
; ASSERT(gLightShader)
; 
; 
; 
; gTimer = sgl::CreateTimer()
  CALL  _Procedure2734
  MOV    qword [v_gTimer],rax
; 
; 
; 
; Dim ranges.sgl::BitmapFontRange(0)
  SUB    rsp,24
  MOV    rdx,1
  LEA    rax,[rsp+144]
  PUSH   rax
  MOV    r9,s_sgl.bitmapfontrange
  MOV    r8,7
  MOV    rcx,24
  SUB    rsp,32
  CALL   SYS_AllocateArray
  ADD    rsp,64
  MOV    qword [rsp+120],rax
; 
; ranges(0)\firstChar  = 32
  MOV    rbp,qword [rsp+120]
  MOV    qword [rbp],32
; ranges(0)\lastChar   = 128               
  MOV    rbp,qword [rsp+120]
  MOV    qword [rbp+8],128
; gFon = RenderText::CreateFont("Consolas", 10, #Null, ranges(), 256, 256) 
  PUSH   qword 256
  PUSH   qword 256
  LEA    rax,qword [rsp+136]
  PUSH   rax
  PUSH   qword 0
  PUSH   qword 10
  MOV    rax,_S968
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3058
  ADD    rsp,48
  MOV    qword [v_gFon],rax
; ASSERT(gFon)
; 
; EndProcedure
_EndProcedureZero3065:
  XOR    rax,rax
_EndProcedure3065:
  PUSH   rax
  MOV    rdx,s_sgl.shaderobjects
  LEA    rcx,[rsp+96]
  PUSH   rax
  SUB    rsp,32
  CALL   SYS_FreeStructureStrings
  ADD    rsp,32
  POP    rax
  MOV    rcx,qword [rsp+128]
  SUB    rsp,40
  CALL   SYS_FreeArray
  ADD    rsp,40
  POP    rax
  ADD    rsp,136
  POP    r15
  POP    rbp
  RET
; Procedure CallBack_Error (source$, desc$)
_Procedure3062:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PS3062=64
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS3062+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rdx,[rsp+PS3062+8]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; Debug "[" + source$ + "] " + desc$
; EndProcedure
_EndProcedureZero3063:
  XOR    rax,rax
_EndProcedure3063:
  PUSH   rax
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  RET
; Procedure Render()
_Procedure3070:
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PS3070=480
  MOV    rax,51
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
; Protected w, h, text$ 
; Protected delta.f
; Protected distance.f = 6.0
  MOV    dword [rsp+72],1086324736
; Protected u_model, u_view, u_projection
; Protected u_light, u_lampColor, u_eye
; 
; Protected.m4x4::m4x4 model, projection, view
; Protected.vec3::vec3 eye, lampColor
; 
; vec3::Set(eye, 0.0, 0.0, 0.0)
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+344]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; 
; Structure Light
; vPos.vec3::vec3
; vColor.vec3::vec3  
; vAmbientColor.vec3::vec3
; vSpecularColor.vec3::vec3
; shiness.f
; EndStructure
; 
; Protected Light.Light 
; 
; sgl::GetWindowFrameBufferSize (gWin, @w, @h)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2862
; glViewport_(0, 0, w, h)
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+48]
  PUSH   qword 0
  PUSH   qword 0
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   glViewport
; 
; delta = sgl::GetDeltaTime(gTimer)
  PUSH   qword [v_gTimer]
  POP    rcx
  CALL  _Procedure2738
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FSTP   dword [rsp+64]
; 
; Static rot.f
; Static orbit.f = 90.0
; 
; orbit + 80.0 * delta 
  FLD    dword [so_render.v_orbit]
  FLD    dword [rsp+64]
  FMUL   dword [F9]
  FADDP  st1,st0
  FADD   dword [F2]
  FSTP   dword [so_render.v_orbit]
; math::Clamp(orbit, 0.0, 360.0)
  PUSH   qword 360
  PUSH   qword 0
  FLD    dword [so_render.v_orbit]
  FISTP  qword [rsp-8]
  MOV    rax,qword [rsp-8]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure82
; 
; Light\vPos\x = Sin(Radian(orbit)) * 3.5
  FLD    dword [so_render.v_orbit]
  SUB    rsp,8
  FSTP   qword [rsp]
  MOVSD  xmm0,qword [rsp]
  ADD    rsp,8
  CALL   PB_Radian_DOUBLE
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FSIN
  FMUL   dword [F10]
  LEA    rbp,[rsp+352]
  FSTP   dword [rbp]
; Light\vPos\y = Sin(Radian(orbit) / 5.0) * 2.0
  FLD    dword [so_render.v_orbit]
  SUB    rsp,8
  FSTP   qword [rsp]
  MOVSD  xmm0,qword [rsp]
  ADD    rsp,8
  CALL   PB_Radian_DOUBLE
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FDIV   qword [D9]
  FSIN
  FMUL   dword [F4]
  FSTP   dword [rbp+4]
; Light\vPos\z = Cos(Radian(orbit)) * 3.5
  FLD    dword [so_render.v_orbit]
  SUB    rsp,8
  FSTP   qword [rsp]
  MOVSD  xmm0,qword [rsp]
  ADD    rsp,8
  CALL   PB_Radian_DOUBLE
  MOVSD  [rsp-8],xmm0
  FLD    qword [rsp-8]
  FCOS
  FMUL   dword [F10]
  FSTP   dword [rbp+8]
; 
; Light\shiness = 24.0
  MOV    dword [rbp+48],1103101952
; 
; If gLightOn         
  CMP    qword [v_gLightOn],0
  JE    _EndIf705
; glClearColor_(0.25, 0.25, 0.3, 1.0)
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F11]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F12]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F12]
  SUB    rsp,8
  FSTP   dword [rsp]
  MOVSS  xmm0,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL   glClearColor
; vec3::Set(Light\vColor,           0.6, 0.6, 0.6)    
  FLD    dword [F13]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F13]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F13]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+12]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Set(Light\vAmbientColor,    0.35, 0.35, 0.4)
  FLD    dword [F14]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F15]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F15]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+24]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Set(Light\vSpecularColor,   0.2, 0.2, 0.2)
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+36]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Copy(Light\vColor, lampColor)
  LEA    rax,[rsp+336]
  MOV    rax,rax
  PUSH   rax
  LEA    rbp,[rsp+360]
  LEA    rax,[rbp+12]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2570
; Else    
  JMP   _EndIf704
_EndIf705:
; glClearColor_(0.15, 0.15, 0.2, 1.0)
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F17]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F17]
  SUB    rsp,8
  FSTP   dword [rsp]
  MOVSS  xmm0,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL   glClearColor
; vec3::Set(Light\vColor,           0.0, 0.0, 0.0)
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+12]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Set(Light\vAmbientColor,    0.2, 0.2, 0.25)
  FLD    dword [F12]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F16]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+24]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Set(Light\vSpecularColor,   0.0, 0.0, 0.0)
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rbp,[rsp+376]
  LEA    rax,[rbp+36]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; vec3::Set(lampColor, 0.1, 0.1, 0.1)
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+360]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; EndIf
_EndIf704:
; 
; If gSpecularOn = 0
  MOV    r15,qword [v_gSpecularOn]
  AND    r15,r15
  JNE   _EndIf708
; vec3::Zero(Light\vSpecularColor)
  LEA    rbp,[rsp+352]
  LEA    rax,[rbp+36]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2564
; EndIf
_EndIf708:
; 
; If gDiffuseOn =  0
  MOV    r15,qword [v_gDiffuseOn]
  AND    r15,r15
  JNE   _EndIf710
; vec3::Zero(Light\vColor)
  LEA    rbp,[rsp+352]
  LEA    rax,[rbp+12]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2564
; EndIf
_EndIf710:
; 
; glEnable_(#GL_DEPTH_TEST) 
  PUSH   qword 2929
  POP    rcx
  CALL   glEnable
; glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  PUSH   qword 16640
  POP    rcx
  CALL   glClear
; 
; 
; 
; 
; 
; m4x4::Identity(view)
  LEA    rax,[rsp+256]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; m4x4::TranslateXYZ(view, 0.0, 0.0, -distance)
  FLD    dword [rsp+72]
  FCHS
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+280]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2644
; 
; 
; m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
  SUB    rsp,8
  FLD    dword [F8]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  SUB    rsp,8
  PUSH   qword [rsp+72]
  POP    rcx
  SUB    rsp,32
  CALL  _Procedure58
  ADD    rsp,40
  MOVSS  [rsp-8],xmm0
  FLD    dword [rsp-8]
  SUB    rsp,8
  FSTP   qword [rsp+0]
  PUSH   qword [rsp+80]
  POP    rcx
  SUB    rsp,32
  CALL  _Procedure58
  ADD    rsp,32
  MOVSS  [rsp-8],xmm0
  FLD    dword [rsp-8]
  FLD    qword [rsp+0]
  FXCH   st1
  ADD    rsp,8
  FDIVP  st1,st0
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F19]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+232]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL  _Procedure2656
  ADD    rsp,48
; 
; 
; 
; rot - 20 * delta 
  FLD    dword [so_render.v_rot]
  FLD    dword [rsp+64]
  FMUL   dword [F20]
  FSUBP  st1,st0
  FADD   dword [F2]
  FSTP   dword [so_render.v_rot]
; math::Clamp(rot, 0.0, 360.0)
  PUSH   qword 360
  PUSH   qword 0
  FLD    dword [so_render.v_rot]
  FISTP  qword [rsp-8]
  MOV    rax,qword [rsp-8]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure82
; 
; 
; m4x4::Identity(model)
  LEA    rax,[rsp+128]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; m4x4::RotateX(model, rot)
  MOV    eax,dword [so_render.v_rot]
  PUSH   rax
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2650
; m4x4::RotateY(model, rot)
  MOV    eax,dword [so_render.v_rot]
  PUSH   rax
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2652
; 
; sgl::BindShaderProgram(gShader)
  PUSH   qword [v_gShader]
  POP    rcx
  CALL  _Procedure2966
; 
; u_model = sgl::GetUniformLocation(gShader, "u_model")
  MOV    rax,_S970
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+80],rax
; sgl::SetUniformMatrix4x4(u_model, @model)
  PUSH   qword 1
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_view = sgl::GetUniformLocation(gShader, "u_view")
  MOV    rax,_S971
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+88],rax
; sgl::SetUniformMatrix4x4(u_view, @view)
  PUSH   qword 1
  LEA    rax,[rsp+264]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+104]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_projection = sgl::GetUniformLocation(gShader, "u_projection")
  MOV    rax,_S963
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+96],rax
; sgl::SetUniformMatrix4x4(u_projection, @projection)
  PUSH   qword 1
  LEA    rax,[rsp+200]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+112]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_eye = sgl::GetUniformLocation(gShader, "u_eye")
  MOV    rax,_S972
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+120],rax
; sgl::SetUniformVec3(u_eye, eye)
  PUSH   qword 1
  LEA    rax,[rsp+328]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+136]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; u_light = sgl::GetUniformLocation(gShader, "u_light.vPos")
  MOV    rax,_S973
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+104],rax
; sgl::SetUniformVec3(u_light, Light\vPos)
  PUSH   qword 1
  LEA    rbp,[rsp+360]
  LEA    rax,[rbp]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; u_light = sgl::GetUniformLocation(gShader, "u_light.vColor")
  MOV    rax,_S974
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+104],rax
; sgl::SetUniformVec3(u_light, Light\vColor)
  PUSH   qword 1
  LEA    rbp,[rsp+360]
  LEA    rax,[rbp+12]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; u_light = sgl::GetUniformLocation(gShader, "u_light.vAmbientColor")
  MOV    rax,_S975
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+104],rax
; sgl::SetUniformVec3(u_light, Light\vAmbientColor)  
  PUSH   qword 1
  LEA    rbp,[rsp+360]
  LEA    rax,[rbp+24]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; u_light = sgl::GetUniformLocation(gShader, "u_light.vSpecularColor")
  MOV    rax,_S976
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+104],rax
; sgl::SetUniformVec3(u_light, Light\vSpecularColor)
  PUSH   qword 1
  LEA    rbp,[rsp+360]
  LEA    rax,[rbp+36]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; u_light = sgl::GetUniformLocation(gShader, "u_light.shiness")
  MOV    rax,_S977
  PUSH   rax
  PUSH   qword [v_gShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+104],rax
; sgl::SetUniformFloat(u_light, Light\shiness)
  LEA    rbp,[rsp+352]
  MOV    eax,dword [rbp+48]
  PUSH   rax
  PUSH   qword [rsp+112]
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2982
; 
; glBindVertexArray_(gVao) 
  PUSH   qword [v_gVao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) 
  PUSH   qword 0
  PUSH   qword 5125
  PUSH   qword 36
  PUSH   qword 4
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   glDrawElements
; 
; 
; 
; 
; 
; m4x4::Identity(model)
  LEA    rax,[rsp+128]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  CALL  _Procedure2630
; m4x4::Translate(model, Light\vPos)
  LEA    rbp,[rsp+352]
  LEA    rax,[rbp]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2642
; m4x4::ScaleXYZ(model, 0.1, 0.1, 0.1)
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F18]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+152]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2648
; m4x4::RotateY(model, rot * 10)
  FLD    dword [so_render.v_rot]
  FMUL   dword [F21]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2652
; 
; sgl::BindShaderProgram(gLightShader)
  PUSH   qword [v_gLightShader]
  POP    rcx
  CALL  _Procedure2966
; 
; u_model = sgl::GetUniformLocation(gLightShader, "u_model")
  MOV    rax,_S970
  PUSH   rax
  PUSH   qword [v_gLightShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+80],rax
; sgl::SetUniformMatrix4x4(u_model, @model)
  PUSH   qword 1
  LEA    rax,[rsp+136]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+96]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_view = sgl::GetUniformLocation(gLightShader, "u_view")
  MOV    rax,_S971
  PUSH   rax
  PUSH   qword [v_gLightShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+88],rax
; sgl::SetUniformMatrix4x4(u_view, @view)
  PUSH   qword 1
  LEA    rax,[rsp+264]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+104]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_projection = sgl::GetUniformLocation(gLightShader, "u_projection")
  MOV    rax,_S963
  PUSH   rax
  PUSH   qword [v_gLightShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+96],rax
; sgl::SetUniformMatrix4x4(u_projection, @projection)
  PUSH   qword 1
  LEA    rax,[rsp+200]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+112]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; u_lampColor = sgl::GetUniformLocation(gLightShader, "u_lampColor")
  MOV    rax,_S978
  PUSH   rax
  PUSH   qword [v_gLightShader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [rsp+112],rax
; sgl::SetUniformVec3(u_lampColor, @lampColor)
  PUSH   qword 1
  LEA    rax,[rsp+344]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+128]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2974
; 
; glBindVertexArray_(gLightVao) 
  PUSH   qword [v_gLightVao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) 
  PUSH   qword 0
  PUSH   qword 5125
  PUSH   qword 36
  PUSH   qword 4
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   glDrawElements
; 
; 
; 
; Protected x, y 
; Protected.vec3::vec3 color 
; 
; 
; vec3::Set(color, 1.0, 1.0, 1.0)
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+448]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; x = 1 : y = h - RenderText::GetFontHeight(gFon)  
  MOV    qword [rsp+408],1
  MOV    r15,qword [rsp+48]
  PUSH   qword [v_gFon]
  POP    rcx
  CALL  _Procedure3052
  SUB    r15,rax
  MOV    qword [rsp+416],r15
; If sgl::GetFPS()    
  CALL  _Procedure2942
  AND    rax,rax
  JE    _EndIf712
; RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  LEA    rax,[rsp+440]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+440]
  PUSH   qword [rsp+440]
  PUSH   qword [PB_StringBasePosition]
  MOV    rcx,_S979
  SUB    rsp,32
  CALL   SYS_CopyString
  ADD    rsp,32
  SUB    rsp,32
  CALL  _Procedure2942
  ADD    rsp,32
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  POP    rdx
  SUB    rsp,40
  CALL   PB_Str
  ADD    rsp,40
  POP    rax
  ADD    qword [PB_StringBasePosition],2
  PUSH   qword [v_gFon]
  PUSH   qword [v_gWin]
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+16],rdx
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3054
  ADD    rsp,56
  POP    qword [PB_StringBasePosition]
; EndIf
_EndIf712:
; 
; vec3::Set(color, 1.0, 1.0, 0.0) 
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+448]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
  MOV    qword [rsp+408],1
  MOV    r15,qword [rsp+416]
  PUSH   qword [v_gFon]
  POP    rcx
  CALL  _Procedure3052
  MOV    r14,rax
  MOV    [rsp-8],r14
  FILD   qword [rsp-8]
  FMUL   qword [D10]
  MOV    [rsp-8],r15
  FILD   qword [rsp-8]
  FXCH
  FSUBP  st1,st0
  FADD   qword [D2]
  FISTP  qword [rsp+416]
; If gLightOn 
  CMP    qword [v_gLightOn],0
  JE    _EndIf714
; text$ = "[L]ight is ON"
  MOV    rdx,_S980
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; Else
  JMP   _EndIf713
_EndIf714:
; text$ = "[L]ight is OFF"
  MOV    rdx,_S981
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; EndIf 
_EndIf713:
; RenderText::Render(gWin, gFon, text$, x, y, color)
  LEA    rax,[rsp+424]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+80]
  PUSH   qword [v_gFon]
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3054
  ADD    rsp,48
; 
; vec3::Set(color, 1.0, 1.0, 0.0) 
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+448]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
  MOV    qword [rsp+408],1
  MOV    r15,qword [rsp+416]
  PUSH   qword [v_gFon]
  POP    rcx
  CALL  _Procedure3052
  MOV    r14,rax
  MOV    [rsp-8],r14
  FILD   qword [rsp-8]
  FMUL   qword [D10]
  MOV    [rsp-8],r15
  FILD   qword [rsp-8]
  FXCH
  FSUBP  st1,st0
  FADD   qword [D2]
  FISTP  qword [rsp+416]
; If gSpecularOn = 0 Or gLightOn = 0
  MOV    r15,qword [v_gSpecularOn]
  AND    r15,r15
  JE     Ok29
  MOV    r15,qword [v_gLightOn]
  AND    r15,r15
  JE     Ok29
  JMP    No29
Ok29:
  MOV    rax,1
  JMP    End29
No29:
  XOR    rax,rax
End29:
  AND    rax,rax
  JE    _EndIf717
; text$ = "[S]pecular lighting is OFF"
  MOV    rdx,_S982
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; Else
  JMP   _EndIf716
_EndIf717:
; text$ = "[S]pecular lighting is ON"
  MOV    rdx,_S983
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; EndIf 
_EndIf716:
; RenderText::Render(gWin, gFon, text$, x, y, color)
  LEA    rax,[rsp+424]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+80]
  PUSH   qword [v_gFon]
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3054
  ADD    rsp,48
; 
; vec3::Set(color, 1.0, 1.0, 0.0) 
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+448]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; x = 1 : y - RenderText::GetFontHeight(gFon) * 1.5
  MOV    qword [rsp+408],1
  MOV    r15,qword [rsp+416]
  PUSH   qword [v_gFon]
  POP    rcx
  CALL  _Procedure3052
  MOV    r14,rax
  MOV    [rsp-8],r14
  FILD   qword [rsp-8]
  FMUL   qword [D10]
  MOV    [rsp-8],r15
  FILD   qword [rsp-8]
  FXCH
  FSUBP  st1,st0
  FADD   qword [D2]
  FISTP  qword [rsp+416]
; If gDiffuseOn = 0 Or gLightOn = 0
  MOV    r15,qword [v_gDiffuseOn]
  AND    r15,r15
  JE     Ok30
  MOV    r15,qword [v_gLightOn]
  AND    r15,r15
  JE     Ok30
  JMP    No30
Ok30:
  MOV    rax,1
  JMP    End30
No30:
  XOR    rax,rax
End30:
  AND    rax,rax
  JE    _EndIf720
; text$ = "[D]iffuse lighting is OFF"
  MOV    rdx,_S984
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; Else
  JMP   _EndIf719
_EndIf720:
; text$ = "[D]iffuse lighting is ON"
  MOV    rdx,_S985
  LEA    rcx,[rsp+56]
  CALL   SYS_FastAllocateStringFree4
; EndIf 
_EndIf719:
; RenderText::Render(gWin, gFon, text$, x, y, color)
  LEA    rax,[rsp+424]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+80]
  PUSH   qword [v_gFon]
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3054
  ADD    rsp,48
; 
; 
; vec3::Set(color, 1.0, 1.0, 1.0)
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+448]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  CALL  _Procedure2560
; x = 1 : y = 0
  MOV    qword [rsp+408],1
  MOV    qword [rsp+416],0
; text$ = sgl::GetRenderer()
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,32
  CALL  _Procedure2756
  ADD    rsp,40
  LEA    rcx,[rsp+64]
  POP    rdx
  CALL   SYS_AllocateString4
; RenderText::Render(gWin, gFon, text$, x, y, color)
  LEA    rax,[rsp+424]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+424]
  PUSH   qword [rsp+80]
  PUSH   qword [v_gFon]
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure3054
  ADD    rsp,48
; 
; sgl::SwapBuffers(gWin)
  PUSH   qword [v_gWin]
  POP    rcx
  CALL  _Procedure2876
; EndProcedure
_EndProcedureZero3071:
  XOR    rax,rax
_EndProcedure3071:
  PUSH   rax
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,448
  POP    r14
  POP    r15
  POP    rbp
  RET
; Procedure Main()
_Procedure3074:
  PS3074=48
  SUB    rsp,40
; SetupContext()
  CALL  _Procedure3066
; SetupData()
  CALL  _Procedure3064
; MainLoop()    
  CALL  _Procedure3072
; ShutDown()
  CALL  _Procedure3068
; EndProcedure : Main()
_EndProcedureZero3075:
  XOR    rax,rax
_EndProcedure3075:
  ADD    rsp,40
  RET
; Procedure MainLoop()
_Procedure3072:
  PUSH   r15
  PS3072=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; gLightOn = 1
  MOV    qword [v_gLightOn],1
; gDiffuseOn = 1
  MOV    qword [v_gDiffuseOn],1
; gSpecularOn = 1
  MOV    qword [v_gSpecularOn],1
; 
; While sgl::WindowShouldClose(gWin) = 0
_While722:
  PUSH   qword [v_gWin]
  POP    rcx
  CALL  _Procedure2850
  MOV    r15,rax
  AND    r15,r15
  JNE   _Wend722
; 
; If sgl::GetKeyPress(sgl::#Key_ESCAPE)
  PUSH   qword 27
  POP    rcx
  CALL  _Procedure2804
  AND    rax,rax
  JE    _EndIf724
; sgl::SetWindowShouldClose(gWin, 1)
  PUSH   qword 1
  PUSH   qword [v_gWin]
  POP    rcx
  POP    rdx
  CALL  _Procedure2852
; EndIf
_EndIf724:
; 
; If sgl::GetKeyPress(sgl::#Key_V)
  PUSH   qword 86
  POP    rcx
  CALL  _Procedure2804
  AND    rax,rax
  JE    _EndIf726
; gVSync ! 1
  MOV    r15,qword [v_gVSync]
  XOR    r15,1
  MOV    qword [v_gVSync],r15
; sgl::EnableVSync(gVSync)
  PUSH   qword [v_gVSync]
  POP    rcx
  CALL  _Procedure2936
; EndIf
_EndIf726:
; 
; If sgl::GetKeyPress(sgl::#Key_L)
  PUSH   qword 76
  POP    rcx
  CALL  _Procedure2804
  AND    rax,rax
  JE    _EndIf728
; gLightOn ! 1
  MOV    r15,qword [v_gLightOn]
  XOR    r15,1
  MOV    qword [v_gLightOn],r15
; EndIf
_EndIf728:
; 
; If sgl::GetKeyPress(sgl::#Key_S)
  PUSH   qword 83
  POP    rcx
  CALL  _Procedure2804
  AND    rax,rax
  JE    _EndIf730
; gSpecularOn ! 1
  MOV    r15,qword [v_gSpecularOn]
  XOR    r15,1
  MOV    qword [v_gSpecularOn],r15
; EndIf
_EndIf730:
; 
; If sgl::GetKeyPress(sgl::#Key_D)
  PUSH   qword 68
  POP    rcx
  CALL  _Procedure2804
  AND    rax,rax
  JE    _EndIf732
; gDiffuseOn ! 1
  MOV    r15,qword [v_gDiffuseOn]
  XOR    r15,1
  MOV    qword [v_gDiffuseOn],r15
; EndIf
_EndIf732:
; 
; If sgl::IsWindowMinimized(gWin) = 0
  PUSH   qword [v_gWin]
  POP    rcx
  CALL  _Procedure2872
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf734
; Render()
  CALL  _Procedure3070
; sgl::TrackFPS()
  CALL  _Procedure2940
; EndIf     
_EndIf734:
; 
; sgl::PollEvents()          
  CALL  _Procedure2722
; Wend
  JMP   _While722
_Wend722:
; EndProcedure
_EndProcedureZero3073:
  XOR    rax,rax
_EndProcedure3073:
  ADD    rsp,48
  POP    r15
  RET
; Procedure.f Float (value)
_Procedure58:
  MOV    qword [rsp+8],rcx
  PS58=48
  SUB    rsp,40
; 
; ProcedureReturn value
  FILD   qword [rsp+PS58+0]
  MOVSXD rax,eax
  JMP   _EndProcedure59
; EndProcedure
_EndProcedureZero59:
  FLDZ
_EndProcedure59:
  ADD    rsp,40
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  RET
; Procedure.f Absf (value.f)
_Procedure74:
  MOVSS  dword [rsp+8],xmm0
  PUSH   r15
  PS74=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; If value < 0
  FLD    dword [rsp+PS74+0]
  FCOMP  dword [F2]
  FNSTSW ax
  TEST   ah,1h
  JE    _EndIf155
; ProcedureReturn  -value
  FLD    dword [rsp+PS74+0]
  FCHS
  MOVSXD rax,eax
  JMP   _EndProcedure75
; EndIf
_EndIf155:
; ProcedureReturn value
  FLD    dword [rsp+PS74+0]
  MOVSXD rax,eax
  JMP   _EndProcedure75
; EndProcedure
_EndProcedureZero75:
  FLDZ
_EndProcedure75:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    r15
  RET
; Procedure.i Absi (value)
_Procedure70:
  MOV    qword [rsp+8],rcx
  PUSH   r15
  PS70=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; If value < 0
  MOV    r15,qword [rsp+PS70+0]
  AND    r15,r15
  JGE   _EndIf151
; ProcedureReturn  -value
  MOV    r15,qword [rsp+PS70+0]
  NEG    r15
  MOV    rax,r15
  JMP   _EndProcedure71
; EndIf
_EndIf151:
; ProcedureReturn value
  MOV    rax,qword [rsp+PS70+0]
  JMP   _EndProcedure71
; EndProcedure
_EndProcedureZero71:
  XOR    rax,rax
_EndProcedure71:
  ADD    rsp,48
  POP    r15
  RET
; Procedure.i Clamp (value, min, max)
_Procedure82:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   r15
  PS82=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; If value < min
  MOV    r15,qword [rsp+PS82+0]
  CMP    r15,qword [rsp+PS82+8]
  JGE   _EndIf163
; value = min
  PUSH   qword [rsp+PS82+8]
  POP    rax
  MOV    qword [rsp+PS82+0],rax
; ElseIf value > max 
  JMP   _EndIf162
_EndIf163:
  MOV    r15,qword [rsp+PS82+0]
  CMP    r15,qword [rsp+PS82+16]
  JLE   _EndIf164
; value = max
  PUSH   qword [rsp+PS82+16]
  POP    rax
  MOV    qword [rsp+PS82+0],rax
; EndIf
_EndIf162:
_EndIf164:
; ProcedureReturn value
  MOV    rax,qword [rsp+PS82+0]
  JMP   _EndProcedure83
; EndProcedure
_EndProcedureZero83:
  XOR    rax,rax
_EndProcedure83:
  ADD    rsp,48
  POP    r15
  RET
; Procedure.i GCD (a, b)
_Procedure76:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   r15
  PS76=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; 
; Protected r
; 
; Repeat
_Repeat156:
; r = a % b    
  MOV    r15,qword [rsp+PS76+0]
  MOV    rax,r15
  CQO
  IDIV   qword [rsp+PS76+8]
  MOV    r15,rdx
  MOV    qword [rsp+40],r15
; If r = 0
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JNE   _EndIf158
; ProcedureReturn Absi(b)
  PUSH   qword [rsp+PS76+8]
  POP    rcx
  CALL  _Procedure70
  JMP   _EndProcedure77
; EndIf            
_EndIf158:
; a = b
  PUSH   qword [rsp+PS76+8]
  POP    rax
  MOV    qword [rsp+PS76+0],rax
; b = r
  PUSH   qword [rsp+40]
  POP    rax
  MOV    qword [rsp+PS76+8],rax
; ForEver
  JMP   _Repeat156
_Until156:
; EndProcedure
_EndProcedureZero77:
  XOR    rax,rax
_EndProcedure77:
  ADD    rsp,48
  POP    r15
  RET
; Procedure Sub (*VectorA.vec2, *VectorB.vec2, *DiffVector.vec2)
_Procedure2528:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS2528=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *DiffVector\x = *VectorA\x - *VectorB\x
  MOV    rbp,qword [rsp+PS2528+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2528+8]
  FSUB   dword [rbp]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2528+16]
  FSTP   dword [rbp]
; *DiffVector\y = *VectorA\y - *VectorB\y
  MOV    rbp,qword [rsp+PS2528+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2528+8]
  FSUB   dword [rbp+4]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2528+16]
  FSTP   dword [rbp+4]
; EndProcedure
_EndProcedureZero2529:
  XOR    rax,rax
_EndProcedure2529:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Add (*VectorA.vec2, *VectorB.vec2, *SumVector.vec2)
_Procedure2526:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS2526=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *SumVector\x = *VectorA\x + *VectorB\x
  MOV    rbp,qword [rsp+PS2526+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2526+8]
  FADD   dword [rbp]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2526+16]
  FSTP   dword [rbp]
; *SumVector\y = *VectorA\y + *VectorB\y
  MOV    rbp,qword [rsp+PS2526+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2526+8]
  FADD   dword [rbp+4]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2526+16]
  FSTP   dword [rbp+4]
; EndProcedure
_EndProcedureZero2527:
  XOR    rax,rax
_EndProcedure2527:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetFromPoints (*Vector.vec2, *PointA.vec2, *PointB.vec2)
_Procedure2522:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2522=48
  SUB    rsp,40
; 
; Sub(*PointB, *PointA, *Vector)
  PUSH   qword [rsp+PS2522+0]
  PUSH   qword [rsp+PS2522+16]
  PUSH   qword [rsp+PS2522+32]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2528
; EndProcedure
_EndProcedureZero2523:
  XOR    rax,rax
_EndProcedure2523:
  ADD    rsp,40
  RET
; Procedure Normalize (*Vector.vec2, *UnitVector.vec2)
_Procedure2538:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2538=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected len.f = Length(*Vector) 
  PUSH   qword [rsp+PS2538+0]
  POP    rcx
  CALL  _Procedure2530
  MOVSS  [rsp-8],xmm0
  FLD    dword [rsp-8]
  FSTP   dword [rsp+40]
; *UnitVector\x = *Vector\x / len
  MOV    rbp,qword [rsp+PS2538+0]
  FLD    dword [rbp]
  FDIV   dword [rsp+40]
  MOV    rbp,qword [rsp+PS2538+8]
  FSTP   dword [rbp]
; *UnitVector\y = *Vector\y / len
  MOV    rbp,qword [rsp+PS2538+0]
  FLD    dword [rbp+4]
  FDIV   dword [rsp+40]
  MOV    rbp,qword [rsp+PS2538+8]
  FSTP   dword [rbp+4]
; EndProcedure
_EndProcedureZero2539:
  XOR    rax,rax
_EndProcedure2539:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.f Length (*Vector.vec2)
_Procedure2530:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2530=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y))
  MOV    rbp,qword [rsp+PS2530+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2530+0]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2530+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2530+0]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  FADD   qword [D2]
  FSQRT
  MOVSXD rax,eax
  JMP   _EndProcedure2531
; EndProcedure
_EndProcedureZero2531:
  FLDZ
_EndProcedure2531:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure Scale (*Vector.vec2, scalar.f, *ScaledVector.vec2)
_Procedure2540:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS2540=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *ScaledVector\x = *Vector\x * scalar
  MOV    rbp,qword [rsp+PS2540+0]
  FLD    dword [rbp]
  FMUL   dword [rsp+PS2540+8]
  MOV    rbp,qword [rsp+PS2540+16]
  FSTP   dword [rbp]
; *ScaledVector\y = *Vector\y * scalar
  MOV    rbp,qword [rsp+PS2540+0]
  FLD    dword [rbp+4]
  FMUL   dword [rsp+PS2540+8]
  MOV    rbp,qword [rsp+PS2540+16]
  FSTP   dword [rbp+4]
; EndProcedure
_EndProcedureZero2541:
  XOR    rax,rax
_EndProcedure2541:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.f DotProduct (*VectorA.vec2, *VectorB.vec2)
_Procedure2542:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2542=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; ProcedureReturn (*VectorA\x * *VectorB\x + *VectorA\y * *VectorB\y)
  MOV    rbp,qword [rsp+PS2542+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2542+8]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2542+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2542+8]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  FADD   dword [F2]
  MOVSXD rax,eax
  JMP   _EndProcedure2543
; EndProcedure
_EndProcedureZero2543:
  FLDZ
_EndProcedure2543:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure Sub (*VectorA.vec3, *VectorB.vec3, *DiffVector.vec3)
_Procedure2574:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS2574=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *DiffVector\x = *VectorA\x - *VectorB\x
  MOV    rbp,qword [rsp+PS2574+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2574+8]
  FSUB   dword [rbp]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2574+16]
  FSTP   dword [rbp]
; *DiffVector\y = *VectorA\y - *VectorB\y
  MOV    rbp,qword [rsp+PS2574+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2574+8]
  FSUB   dword [rbp+4]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2574+16]
  FSTP   dword [rbp+4]
; *DiffVector\z = *VectorA\z - *VectorB\z
  MOV    rbp,qword [rsp+PS2574+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2574+8]
  FSUB   dword [rbp+8]
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2574+16]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2575:
  XOR    rax,rax
_EndProcedure2575:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Set (*Vector.vec3, x.f, y.f, z.f)
_Procedure2560:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2560=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *Vector\x = x
  FLD    dword [rsp+PS2560+8]
  MOV    rbp,qword [rsp+PS2560+0]
  FSTP   dword [rbp]
; *Vector\y = y
  FLD    dword [rsp+PS2560+16]
  MOV    rbp,qword [rsp+PS2560+0]
  FSTP   dword [rbp+4]
; *Vector\z = z
  FLD    dword [rsp+PS2560+24]
  MOV    rbp,qword [rsp+PS2560+0]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2561:
  XOR    rax,rax
_EndProcedure2561:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure CrossProduct (*VectorA.vec3, *VectorB.vec3, *CrossVector.vec3)
_Procedure2590:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PS2590=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *CrossVector\x = *VectorA\y * *VectorB\z - *VectorA\z * *VectorB\y
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp+8]
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp+4]
  FSUBP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2590+16]
  FSTP   dword [rbp]
; *CrossVector\y = *VectorA\z * *VectorB\x - *VectorA\x * *VectorB\z
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp+8]
  FSUBP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2590+16]
  FSTP   dword [rbp+4]
; *CrossVector\z = *VectorA\x * *VectorB\y - *VectorA\y * *VectorB\x
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp+4]
  MOV    rbp,qword [rsp+PS2590+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2590+8]
  FMUL   dword [rbp]
  FSUBP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+PS2590+16]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2591:
  XOR    rax,rax
_EndProcedure2591:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure SetFromPoints (*Vector.vec3, *PointA.vec3, *PointB.vec3)
_Procedure2568:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PS2568=48
  SUB    rsp,40
; 
; Sub(*PointB, *PointA, *Vector)
  PUSH   qword [rsp+PS2568+0]
  PUSH   qword [rsp+PS2568+16]
  PUSH   qword [rsp+PS2568+32]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2574
; EndProcedure
_EndProcedureZero2569:
  XOR    rax,rax
_EndProcedure2569:
  ADD    rsp,40
  RET
; Procedure Zero (*Vector.vec3)
_Procedure2564:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2564=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *Vector\x = 0.0
  MOV    rbp,qword [rsp+PS2564+0]
  MOV    dword [rbp],0
; *Vector\y = 0.0
  MOV    rbp,qword [rsp+PS2564+0]
  MOV    dword [rbp+4],0
; *Vector\z = 0.0
  MOV    rbp,qword [rsp+PS2564+0]
  MOV    dword [rbp+8],0
; EndProcedure
_EndProcedureZero2565:
  XOR    rax,rax
_EndProcedure2565:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Normalize (*Vector.vec3, *UnitVector.vec3)
_Procedure2584:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2584=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected len.f = Length(*Vector) 
  PUSH   qword [rsp+PS2584+0]
  POP    rcx
  CALL  _Procedure2576
  MOVSS  [rsp-8],xmm0
  FLD    dword [rsp-8]
  FSTP   dword [rsp+40]
; *UnitVector\x = *Vector\x / len
  MOV    rbp,qword [rsp+PS2584+0]
  FLD    dword [rbp]
  FDIV   dword [rsp+40]
  MOV    rbp,qword [rsp+PS2584+8]
  FSTP   dword [rbp]
; *UnitVector\y = *Vector\y / len
  MOV    rbp,qword [rsp+PS2584+0]
  FLD    dword [rbp+4]
  FDIV   dword [rsp+40]
  MOV    rbp,qword [rsp+PS2584+8]
  FSTP   dword [rbp+4]
; *UnitVector\z = *Vector\z / len
  MOV    rbp,qword [rsp+PS2584+0]
  FLD    dword [rbp+8]
  FDIV   dword [rsp+40]
  MOV    rbp,qword [rsp+PS2584+8]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2585:
  XOR    rax,rax
_EndProcedure2585:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.f Length (*Vector.vec3)
_Procedure2576:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2576=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z))
  MOV    rbp,qword [rsp+PS2576+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2576+0]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2576+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2576+0]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2576+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2576+0]
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  FADD   qword [D2]
  FSQRT
  MOVSXD rax,eax
  JMP   _EndProcedure2577
; EndProcedure
_EndProcedureZero2577:
  FLDZ
_EndProcedure2577:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure Negate (*Vector.vec3, *NegatedVector.vec3)
_Procedure2582:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2582=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *NegatedVector\x = - *Vector\x 
  MOV    rbp,qword [rsp+PS2582+0]
  FLD    dword [rbp]
  FCHS
  MOV    rbp,qword [rsp+PS2582+8]
  FSTP   dword [rbp]
; *NegatedVector\y = - *Vector\y 
  MOV    rbp,qword [rsp+PS2582+0]
  FLD    dword [rbp+4]
  FCHS
  MOV    rbp,qword [rsp+PS2582+8]
  FSTP   dword [rbp+4]
; *NegatedVector\z = - *Vector\z
  MOV    rbp,qword [rsp+PS2582+0]
  FLD    dword [rbp+8]
  FCHS
  MOV    rbp,qword [rsp+PS2582+8]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2583:
  XOR    rax,rax
_EndProcedure2583:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Copy (*Vector.vec3, *DestinationVector.vec3)
_Procedure2570:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2570=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *DestinationVector\x = *Vector\x
  MOV    rbp,qword [rsp+PS2570+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2570+8]
  FSTP   dword [rbp]
; *DestinationVector\y = *Vector\y
  MOV    rbp,qword [rsp+PS2570+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2570+8]
  FSTP   dword [rbp+4]
; *DestinationVector\z = *Vector\z
  MOV    rbp,qword [rsp+PS2570+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2570+8]
  FSTP   dword [rbp+8]
; EndProcedure
_EndProcedureZero2571:
  XOR    rax,rax
_EndProcedure2571:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.f DotProduct (*VectorA.vec3, *VectorB.vec3)
_Procedure2588:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2588=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; ProcedureReturn (*VectorA\x * *VectorB\x + *VectorA\y * *VectorB\y + *VectorA\z * *VectorB\z)
  MOV    rbp,qword [rsp+PS2588+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2588+8]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2588+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2588+8]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2588+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2588+8]
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  FADD   dword [F2]
  MOVSXD rax,eax
  JMP   _EndProcedure2589
; EndProcedure
_EndProcedureZero2589:
  FLDZ
_EndProcedure2589:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure.f Length (*Vector.vec4)
_Procedure2612:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS2612=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; ProcedureReturn Sqr((*Vector\x * *Vector\x) + (*Vector\y * *Vector\y) + (*Vector\z * *Vector\z) + (*Vector\w * *Vector\w))
  MOV    rbp,qword [rsp+PS2612+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2612+0]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2612+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2612+0]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2612+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2612+0]
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2612+0]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2612+0]
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   qword [D2]
  FSQRT
  MOVSXD rax,eax
  JMP   _EndProcedure2613
; EndProcedure
_EndProcedureZero2613:
  FLDZ
_EndProcedure2613:
  ADD    rsp,48
  FSTP   dword [rsp-8]
  MOVSS  xmm0,[rsp-8]
  POP    rbp
  RET
; Procedure Copy (*Vector.vec4, *DestinationVector.vec4)
_Procedure2606:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2606=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *DestinationVector\x = *Vector\x
  MOV    rbp,qword [rsp+PS2606+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2606+8]
  FSTP   dword [rbp]
; *DestinationVector\y = *Vector\y
  MOV    rbp,qword [rsp+PS2606+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2606+8]
  FSTP   dword [rbp+4]
; *DestinationVector\z = *Vector\z
  MOV    rbp,qword [rsp+PS2606+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2606+8]
  FSTP   dword [rbp+8]
; *DestinationVector\w = *Vector\w
  MOV    rbp,qword [rsp+PS2606+0]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2606+8]
  FSTP   dword [rbp+12]
; EndProcedure
_EndProcedureZero2607:
  XOR    rax,rax
_EndProcedure2607:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i GPA (func$) 
_Procedure2510:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PUSH   r15
  PS2510=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS2510+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; Protected *fp = GLLOAD\CallBack_GetProcAddress(func$)
  LEA    rbp,[glload.v_GLLOAD]
  PUSH   qword [rbp+32]
  SUB    rsp,8
  PUSH   qword [rsp+56]
  POP    rcx
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
  MOV    qword [rsp+48],rax
; 
; If *fp = 0
  MOV    r15,qword [rsp+48]
  AND    r15,r15
  JNE   _EndIf171
; GLLOAD\MissingProcsCount + 1    
  LEA    rbp,[glload.v_GLLOAD]
  MOV    r15,qword [rbp+16]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  POP    rax
  MOV    qword [rbp+16],rax
; Else
  JMP   _EndIf170
_EndIf171:
; GLLOAD\ImportedProcsCount + 1
  LEA    rbp,[glload.v_GLLOAD]
  MOV    r15,qword [rbp+24]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  POP    rax
  MOV    qword [rbp+24],rax
; EndIf
_EndIf170:
; 
; If GLLOAD\CallBack_EnumerateProcs
  LEA    rbp,[glload.v_GLLOAD]
  CMP    qword [rbp+40],0
  JE    _EndIf174
; GLLOAD\CallBack_EnumerateProcs(GLLOAD\glver$, func$, *fp)
  LEA    rbp,[glload.v_GLLOAD]
  PUSH   qword [rbp+40]
  SUB    rsp,8
  PUSH   qword [rsp+64]
  PUSH   qword [rsp+64]
  PUSH   qword [rbp]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   qword [rsp+40]
  ADD    rsp,40
  ADD    rsp,8
; EndIf
_EndIf174:
; 
; ProcedureReturn *fp
  MOV    rax,qword [rsp+48]
  JMP   _EndProcedure2511
; EndProcedure
_EndProcedureZero2511:
  XOR    rax,rax
_EndProcedure2511:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure GetContextVersion (*major, *minor)
_Procedure2494:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   r15
  PS2494=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected maj, min, ret
; 
; glGetIntegerv_(#GL_MAJOR_VERSION, @maj) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33307
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf179
  JMP    glload.ll_getcontextversion_fallback
_EndIf179:
; glGetIntegerv_(#GL_MINOR_VERSION, @min) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33308
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf181
  JMP    glload.ll_getcontextversion_fallback
_EndIf181:
; 
; PokeI(*major, maj)
  PUSH   qword [rsp+40]
  PUSH   qword [rsp+PS2494+8]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; PokeI(*minor, min)
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+PS2494+16]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; 
; fallback:
glload.ll_getcontextversion_fallback:
; 
; Protected ver$ = PeekS(glGetString_(#GL_VERSION), -1, #PB_Ascii)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 24
  PUSH   qword -1
  SUB    rsp,8
  PUSH   qword 7938
  POP    rcx
  SUB    rsp,32
  CALL   glGetString
  ADD    rsp,40
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+72]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; If glGetError_() = #GL_NO_ERROR
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JNE   _EndIf183
; maj = Val(StringField(ver$, 1, "."))
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+0],rdx
  POP    rcx
  SUB    rsp,32
  CALL   PB_Val
  ADD    rsp,40
  POP    qword [PB_StringBasePosition]
  MOV    qword [rsp+40],rax
; min = Val(StringField(ver$, 2, "."))
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 2
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+0],rdx
  POP    rcx
  SUB    rsp,32
  CALL   PB_Val
  ADD    rsp,40
  POP    qword [PB_StringBasePosition]
  MOV    qword [rsp+48],rax
; 
; PokeI(*major, maj)
  PUSH   qword [rsp+40]
  PUSH   qword [rsp+PS2494+8]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; PokeI(*minor, min)
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+PS2494+16]
  POP    rcx
  POP    rdx
  CALL   PB_PokeI
; EndIf
_EndIf183:
; EndProcedure
_EndProcedureZero2495:
  XOR    rax,rax
_EndProcedure2495:
  PUSH   rax
  MOV    rcx,qword [rsp+72]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,80
  POP    r15
  RET
; Procedure.i Load()
_Procedure2504:
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PS2504=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; Protected Major, Minor, Deprecated, glVer
; 
; GetContextVersion (@Major, @Minor)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2494
; 
; glVer = Major * 100 + Minor * 10
  MOV    r15,qword [rsp+40]
  IMUL   r15,100
  MOV    r14,qword [rsp+48]
  IMUL   r14,10
  ADD    r15,r14
  MOV    qword [rsp+64],r15
; 
; If glVer > #MAX_OPENGL_SUPPORTED
  MOV    r15,qword [rsp+64]
  CMP    r15,460
  JLE   _EndIf195
; glVer = #MAX_OPENGL_SUPPORTED
  MOV    qword [rsp+64],460
; DebuggerWarning("This module support OpenGL up to version " + #MAX_OPENGL_SUPPORTED)   
; EndIf
_EndIf195:
; 
; Deprecated = Deprecated()
  CALL  _Procedure2496
  MOV    qword [rsp+56],rax
; 
; If GLLOAD\CallBack_GetProcAddress = 0
  LEA    rbp,[glload.v_GLLOAD]
  MOV    r15,qword [rbp+32]
  AND    r15,r15
  JNE   _EndIf197
; GLLOAD\ErrMsg$ = "A valid GetProcAddress() function has not been registered."  
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S67
  LEA    rcx,[rbp+8]
  CALL   SYS_FastAllocateStringFree4
; DebuggerError(GLLOAD\ErrMsg$)
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2505
; EndIf
_EndIf197:
; 
; If glVer >= 120
  MOV    r15,qword [rsp+64]
  CMP    r15,120
  JL    _EndIf199
; 
; GLLOAD\glver$ = "120"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S68
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glDrawRangeElements_ = GPA("glDrawRangeElements")
  MOV    rax,_S69
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawRangeElements_],rax
; glTexImage3D_ = GPA("glTexImage3D")
  MOV    rax,_S70
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexImage3D_],rax
; glTexSubImage3D_ = GPA("glTexSubImage3D")
  MOV    rax,_S71
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexSubImage3D_],rax
; glCopyTexSubImage3D_ = GPA("glCopyTexSubImage3D")
  MOV    rax,_S72
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyTexSubImage3D_],rax
; EndIf
_EndIf199:
; 
; If glVer >= 130
  MOV    r15,qword [rsp+64]
  CMP    r15,130
  JL    _EndIf201
; 
; GLLOAD\glver$ = "130"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S73
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glActiveTexture_ = GPA("glActiveTexture")
  MOV    rax,_S74
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glActiveTexture_],rax
; glSampleCoverage_ = GPA("glSampleCoverage")
  MOV    rax,_S75
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSampleCoverage_],rax
; glCompressedTexImage3D_ = GPA("glCompressedTexImage3D")
  MOV    rax,_S76
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexImage3D_],rax
; glCompressedTexImage2D_ = GPA("glCompressedTexImage2D")
  MOV    rax,_S77
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexImage2D_],rax
; glCompressedTexImage1D_ = GPA("glCompressedTexImage1D")
  MOV    rax,_S78
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexImage1D_],rax
; glCompressedTexSubImage3D_ = GPA("glCompressedTexSubImage3D")
  MOV    rax,_S79
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexSubImage3D_],rax
; glCompressedTexSubImage2D_ = GPA("glCompressedTexSubImage2D")
  MOV    rax,_S80
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexSubImage2D_],rax
; glCompressedTexSubImage1D_ = GPA("glCompressedTexSubImage1D")
  MOV    rax,_S81
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTexSubImage1D_],rax
; glGetCompressedTexImage_ = GPA("glGetCompressedTexImage")
  MOV    rax,_S82
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetCompressedTexImage_],rax
; 
; 
; If Deprecated
  CMP    qword [rsp+56],0
  JE    _EndIf203
; GLLOAD\glver$ = "130*"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S83
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glClientActiveTexture_ = GPA("glClientActiveTexture")
  MOV    rax,_S84
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClientActiveTexture_],rax
; glMultiTexCoord1d_ = GPA("glMultiTexCoord1d")
  MOV    rax,_S85
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1d_],rax
; glMultiTexCoord1dv_ = GPA("glMultiTexCoord1dv")
  MOV    rax,_S86
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1dv_],rax
; glMultiTexCoord1f_ = GPA("glMultiTexCoord1f")
  MOV    rax,_S87
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1f_],rax
; glMultiTexCoord1fv_ = GPA("glMultiTexCoord1fv")
  MOV    rax,_S88
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1fv_],rax
; glMultiTexCoord1i_ = GPA("glMultiTexCoord1i")
  MOV    rax,_S89
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1i_],rax
; glMultiTexCoord1iv_ = GPA("glMultiTexCoord1iv")
  MOV    rax,_S90
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1iv_],rax
; glMultiTexCoord1s_ = GPA("glMultiTexCoord1s")
  MOV    rax,_S91
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1s_],rax
; glMultiTexCoord1sv_ = GPA("glMultiTexCoord1sv")
  MOV    rax,_S92
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord1sv_],rax
; glMultiTexCoord2d_ = GPA("glMultiTexCoord2d")
  MOV    rax,_S93
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2d_],rax
; glMultiTexCoord2dv_ = GPA("glMultiTexCoord2dv")
  MOV    rax,_S94
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2dv_],rax
; glMultiTexCoord2f_ = GPA("glMultiTexCoord2f")
  MOV    rax,_S95
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2f_],rax
; glMultiTexCoord2fv_ = GPA("glMultiTexCoord2fv")
  MOV    rax,_S96
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2fv_],rax
; glMultiTexCoord2i_ = GPA("glMultiTexCoord2i")
  MOV    rax,_S97
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2i_],rax
; glMultiTexCoord2iv_ = GPA("glMultiTexCoord2iv")
  MOV    rax,_S98
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2iv_],rax
; glMultiTexCoord2s_ = GPA("glMultiTexCoord2s")
  MOV    rax,_S99
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2s_],rax
; glMultiTexCoord2sv_ = GPA("glMultiTexCoord2sv")
  MOV    rax,_S100
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord2sv_],rax
; glMultiTexCoord3d_ = GPA("glMultiTexCoord3d")
  MOV    rax,_S101
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3d_],rax
; glMultiTexCoord3dv_ = GPA("glMultiTexCoord3dv")
  MOV    rax,_S102
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3dv_],rax
; glMultiTexCoord3f_ = GPA("glMultiTexCoord3f")
  MOV    rax,_S103
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3f_],rax
; glMultiTexCoord3fv_ = GPA("glMultiTexCoord3fv")
  MOV    rax,_S104
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3fv_],rax
; glMultiTexCoord3i_ = GPA("glMultiTexCoord3i")
  MOV    rax,_S105
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3i_],rax
; glMultiTexCoord3iv_ = GPA("glMultiTexCoord3iv")
  MOV    rax,_S106
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3iv_],rax
; glMultiTexCoord3s_ = GPA("glMultiTexCoord3s")
  MOV    rax,_S107
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3s_],rax
; glMultiTexCoord3sv_ = GPA("glMultiTexCoord3sv")
  MOV    rax,_S108
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord3sv_],rax
; glMultiTexCoord4d_ = GPA("glMultiTexCoord4d")
  MOV    rax,_S109
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4d_],rax
; glMultiTexCoord4dv_ = GPA("glMultiTexCoord4dv")
  MOV    rax,_S110
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4dv_],rax
; glMultiTexCoord4f_ = GPA("glMultiTexCoord4f")
  MOV    rax,_S111
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4f_],rax
; glMultiTexCoord4fv_ = GPA("glMultiTexCoord4fv")
  MOV    rax,_S112
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4fv_],rax
; glMultiTexCoord4i_ = GPA("glMultiTexCoord4i")
  MOV    rax,_S113
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4i_],rax
; glMultiTexCoord4iv_ = GPA("glMultiTexCoord4iv")
  MOV    rax,_S114
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4iv_],rax
; glMultiTexCoord4s_ = GPA("glMultiTexCoord4s")
  MOV    rax,_S115
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4s_],rax
; glMultiTexCoord4sv_ = GPA("glMultiTexCoord4sv")
  MOV    rax,_S116
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiTexCoord4sv_],rax
; glLoadTransposeMatrixf_ = GPA("glLoadTransposeMatrixf")
  MOV    rax,_S117
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glLoadTransposeMatrixf_],rax
; glLoadTransposeMatrixd_ = GPA("glLoadTransposeMatrixd")
  MOV    rax,_S118
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glLoadTransposeMatrixd_],rax
; glMultTransposeMatrixf_ = GPA("glMultTransposeMatrixf")
  MOV    rax,_S119
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultTransposeMatrixf_],rax
; glMultTransposeMatrixd_ = GPA("glMultTransposeMatrixd")        
  MOV    rax,_S120
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultTransposeMatrixd_],rax
; EndIf
_EndIf203:
; EndIf
_EndIf201:
; 
; If glVer >= 140
  MOV    r15,qword [rsp+64]
  CMP    r15,140
  JL    _EndIf205
; 
; GLLOAD\glver$ = "140"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S121
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glBlendFuncSeparate_ = GPA("glBlendFuncSeparate")
  MOV    rax,_S122
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendFuncSeparate_],rax
; glMultiDrawArrays_ = GPA("glMultiDrawArrays")
  MOV    rax,_S123
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawArrays_],rax
; glMultiDrawElements_ = GPA("glMultiDrawElements")
  MOV    rax,_S124
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawElements_],rax
; glPointParameterf_ = GPA("glPointParameterf")
  MOV    rax,_S125
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPointParameterf_],rax
; glPointParameterfv_ = GPA("glPointParameterfv")
  MOV    rax,_S126
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPointParameterfv_],rax
; glPointParameteri_ = GPA("glPointParameteri")
  MOV    rax,_S127
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPointParameteri_],rax
; glPointParameteriv_ = GPA("glPointParameteriv")
  MOV    rax,_S128
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPointParameteriv_],rax
; glBlendColor_ = GPA("glBlendColor")
  MOV    rax,_S129
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendColor_],rax
; glBlendEquation_ = GPA("glBlendEquation")
  MOV    rax,_S130
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendEquation_],rax
; 
; 
; If Deprecated
  CMP    qword [rsp+56],0
  JE    _EndIf207
; GLLOAD\glver$ = "140*"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S131
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glFogCoordf_ = GPA("glFogCoordf")
  MOV    rax,_S132
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFogCoordf_],rax
; glFogCoordfv_ = GPA("glFogCoordfv")
  MOV    rax,_S133
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFogCoordfv_],rax
; glFogCoordd_ = GPA("glFogCoordd")
  MOV    rax,_S134
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFogCoordd_],rax
; glFogCoorddv_ = GPA("glFogCoorddv")
  MOV    rax,_S135
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFogCoorddv_],rax
; glFogCoordPointer_ = GPA("glFogCoordPointer")
  MOV    rax,_S136
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFogCoordPointer_],rax
; glSecondaryColor3b_ = GPA("glSecondaryColor3b")
  MOV    rax,_S137
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3b_],rax
; glSecondaryColor3bv_ = GPA("glSecondaryColor3bv")
  MOV    rax,_S138
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3bv_],rax
; glSecondaryColor3d_ = GPA("glSecondaryColor3d")
  MOV    rax,_S139
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3d_],rax
; glSecondaryColor3dv_ = GPA("glSecondaryColor3dv")
  MOV    rax,_S140
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3dv_],rax
; glSecondaryColor3f_ = GPA("glSecondaryColor3f")
  MOV    rax,_S141
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3f_],rax
; glSecondaryColor3fv_ = GPA("glSecondaryColor3fv")
  MOV    rax,_S142
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3fv_],rax
; glSecondaryColor3i_ = GPA("glSecondaryColor3i")
  MOV    rax,_S143
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3i_],rax
; glSecondaryColor3iv_ = GPA("glSecondaryColor3iv")
  MOV    rax,_S144
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3iv_],rax
; glSecondaryColor3s_ = GPA("glSecondaryColor3s")
  MOV    rax,_S145
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3s_],rax
; glSecondaryColor3sv_ = GPA("glSecondaryColor3sv")
  MOV    rax,_S146
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3sv_],rax
; glSecondaryColor3ub_ = GPA("glSecondaryColor3ub")
  MOV    rax,_S147
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3ub_],rax
; glSecondaryColor3ubv_ = GPA("glSecondaryColor3ubv")
  MOV    rax,_S148
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3ubv_],rax
; glSecondaryColor3ui_ = GPA("glSecondaryColor3ui")
  MOV    rax,_S149
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3ui_],rax
; glSecondaryColor3uiv_ = GPA("glSecondaryColor3uiv")
  MOV    rax,_S150
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3uiv_],rax
; glSecondaryColor3us_ = GPA("glSecondaryColor3us")
  MOV    rax,_S151
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3us_],rax
; glSecondaryColor3usv_ = GPA("glSecondaryColor3usv")
  MOV    rax,_S152
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColor3usv_],rax
; glSecondaryColorPointer_ = GPA("glSecondaryColorPointer")
  MOV    rax,_S153
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSecondaryColorPointer_],rax
; glWindowPos2d_ = GPA("glWindowPos2d")
  MOV    rax,_S154
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2d_],rax
; glWindowPos2dv_ = GPA("glWindowPos2dv")
  MOV    rax,_S155
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2dv_],rax
; glWindowPos2f_ = GPA("glWindowPos2f")
  MOV    rax,_S156
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2f_],rax
; glWindowPos2fv_ = GPA("glWindowPos2fv")
  MOV    rax,_S157
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2fv_],rax
; glWindowPos2i_ = GPA("glWindowPos2i")
  MOV    rax,_S158
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2i_],rax
; glWindowPos2iv_ = GPA("glWindowPos2iv")
  MOV    rax,_S159
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2iv_],rax
; glWindowPos2s_ = GPA("glWindowPos2s")
  MOV    rax,_S160
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2s_],rax
; glWindowPos2sv_ = GPA("glWindowPos2sv")
  MOV    rax,_S161
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos2sv_],rax
; glWindowPos3d_ = GPA("glWindowPos3d")
  MOV    rax,_S162
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3d_],rax
; glWindowPos3dv_ = GPA("glWindowPos3dv")
  MOV    rax,_S163
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3dv_],rax
; glWindowPos3f_ = GPA("glWindowPos3f")
  MOV    rax,_S164
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3f_],rax
; glWindowPos3fv_ = GPA("glWindowPos3fv")
  MOV    rax,_S165
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3fv_],rax
; glWindowPos3i_ = GPA("glWindowPos3i")
  MOV    rax,_S166
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3i_],rax
; glWindowPos3iv_ = GPA("glWindowPos3iv")
  MOV    rax,_S167
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3iv_],rax
; glWindowPos3s_ = GPA("glWindowPos3s")
  MOV    rax,_S168
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3s_],rax
; glWindowPos3sv_ = GPA("glWindowPos3sv")    
  MOV    rax,_S169
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWindowPos3sv_],rax
; EndIf
_EndIf207:
; EndIf
_EndIf205:
; 
; If glVer >= 150
  MOV    r15,qword [rsp+64]
  CMP    r15,150
  JL    _EndIf209
; 
; GLLOAD\glver$ = "150"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S170
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glGenQueries_ = GPA("glGenQueries")
  MOV    rax,_S171
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenQueries_],rax
; glDeleteQueries_ = GPA("glDeleteQueries")
  MOV    rax,_S172
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteQueries_],rax
; glIsQuery_ = GPA("glIsQuery")
  MOV    rax,_S173
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsQuery_],rax
; glBeginQuery_ = GPA("glBeginQuery")
  MOV    rax,_S174
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBeginQuery_],rax
; glEndQuery_ = GPA("glEndQuery")
  MOV    rax,_S175
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEndQuery_],rax
; glGetQueryiv_ = GPA("glGetQueryiv")
  MOV    rax,_S176
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryiv_],rax
; glGetQueryObjectiv_ = GPA("glGetQueryObjectiv")
  MOV    rax,_S177
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryObjectiv_],rax
; glGetQueryObjectuiv_ = GPA("glGetQueryObjectuiv")
  MOV    rax,_S178
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryObjectuiv_],rax
; glBindBuffer_ = GPA("glBindBuffer")
  MOV    rax,_S179
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindBuffer_],rax
; glDeleteBuffers_ = GPA("glDeleteBuffers")
  MOV    rax,_S180
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteBuffers_],rax
; glGenBuffers_ = GPA("glGenBuffers")
  MOV    rax,_S181
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenBuffers_],rax
; glIsBuffer_ = GPA("glIsBuffer")
  MOV    rax,_S182
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsBuffer_],rax
; glBufferdata_ = GPA("glBufferData")
  MOV    rax,_S183
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBufferData_],rax
; glBufferSubdata_ = GPA("glBufferSubData")
  MOV    rax,_S184
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBufferSubData_],rax
; glGetBufferSubdata_ = GPA("glGetBufferSubData")
  MOV    rax,_S185
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetBufferSubData_],rax
; glMapBuffer_ = GPA("glMapBuffer")
  MOV    rax,_S186
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMapBuffer_],rax
; glUnmapBuffer_ = GPA("glUnmapBuffer")
  MOV    rax,_S187
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUnmapBuffer_],rax
; glGetBufferParameteriv_ = GPA("glGetBufferParameteriv")
  MOV    rax,_S188
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetBufferParameteriv_],rax
; glGetBufferPointerv_ = GPA("glGetBufferPointerv")
  MOV    rax,_S189
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetBufferPointerv_],rax
; EndIf
_EndIf209:
; 
; If glVer >= 200
  MOV    r15,qword [rsp+64]
  CMP    r15,200
  JL    _EndIf211
; 
; GLLOAD\glver$ = "200"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S190
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glBlendEquationSeparate_ = GPA("glBlendEquationSeparate")
  MOV    rax,_S191
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendEquationSeparate_],rax
; glDrawBuffers_ = GPA("glDrawBuffers")
  MOV    rax,_S192
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawBuffers_],rax
; glStencilOpSeparate_ = GPA("glStencilOpSeparate")
  MOV    rax,_S193
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glStencilOpSeparate_],rax
; glStencilFuncSeparate_ = GPA("glStencilFuncSeparate")
  MOV    rax,_S194
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glStencilFuncSeparate_],rax
; glStencilMaskSeparate_ = GPA("glStencilMaskSeparate")
  MOV    rax,_S195
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glStencilMaskSeparate_],rax
; glAttachShader_ = GPA("glAttachShader")
  MOV    rax,_S196
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glAttachShader_],rax
; glBindAttribLocation_ = GPA("glBindAttribLocation")
  MOV    rax,_S197
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindAttribLocation_],rax
; glCompileShader_ = GPA("glCompileShader")
  MOV    rax,_S198
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompileShader_],rax
; glCreateProgram_ = GPA("glCreateProgram")
  MOV    rax,_S199
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateProgram_],rax
; glCreateShader_ = GPA("glCreateShader")
  MOV    rax,_S200
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateShader_],rax
; glDeleteProgram_ = GPA("glDeleteProgram")
  MOV    rax,_S201
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteProgram_],rax
; glDeleteShader_ = GPA("glDeleteShader")
  MOV    rax,_S202
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteShader_],rax
; glDetachShader_ = GPA("glDetachShader")
  MOV    rax,_S203
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDetachShader_],rax
; glDisableVertexAttribArray_ = GPA("glDisableVertexAttribArray")
  MOV    rax,_S204
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDisableVertexAttribArray_],rax
; glEnableVertexAttribArray_ = GPA("glEnableVertexAttribArray")
  MOV    rax,_S205
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEnableVertexAttribArray_],rax
; glGetActiveAttrib_ = GPA("glGetActiveAttrib")
  MOV    rax,_S206
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveAttrib_],rax
; glGetActiveUniform_ = GPA("glGetActiveUniform")
  MOV    rax,_S207
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveUniform_],rax
; glGetAttachedShaders_ = GPA("glGetAttachedShaders")
  MOV    rax,_S208
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetAttachedShaders_],rax
; glGetAttribLocation_ = GPA("glGetAttribLocation")
  MOV    rax,_S209
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetAttribLocation_],rax
; glGetProgramiv_ = GPA("glGetProgramiv")
  MOV    rax,_S210
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramiv_],rax
; glGetProgramInfoLog_ = GPA("glGetProgramInfoLog")
  MOV    rax,_S211
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramInfoLog_],rax
; glGetShaderiv_ = GPA("glGetShaderiv")
  MOV    rax,_S212
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetShaderiv_],rax
; glGetShaderInfoLog_ = GPA("glGetShaderInfoLog")
  MOV    rax,_S213
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetShaderInfoLog_],rax
; glGetShaderSource_ = GPA("glGetShaderSource")
  MOV    rax,_S214
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetShaderSource_],rax
; glGetUniformLocation_ = GPA("glGetUniformLocation")
  MOV    rax,_S215
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformLocation_],rax
; glGetUniformfv_ = GPA("glGetUniformfv")
  MOV    rax,_S216
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformfv_],rax
; glGetUniformiv_ = GPA("glGetUniformiv")
  MOV    rax,_S217
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformiv_],rax
; glGetVertexAttribdv_ = GPA("glGetVertexAttribdv")
  MOV    rax,_S218
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribdv_],rax
; glGetVertexAttribfv_ = GPA("glGetVertexAttribfv")
  MOV    rax,_S219
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribfv_],rax
; glGetVertexAttribiv_ = GPA("glGetVertexAttribiv")
  MOV    rax,_S220
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribiv_],rax
; glGetVertexAttribPointerv_ = GPA("glGetVertexAttribPointerv")
  MOV    rax,_S221
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribPointerv_],rax
; glIsProgram_ = GPA("glIsProgram")
  MOV    rax,_S222
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsProgram_],rax
; glIsShader_ = GPA("glIsShader")
  MOV    rax,_S223
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsShader_],rax
; glLinkProgram_ = GPA("glLinkProgram")
  MOV    rax,_S224
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glLinkProgram_],rax
; glShaderSource_ = GPA("glShaderSource")
  MOV    rax,_S225
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glShaderSource_],rax
; glUseProgram_ = GPA("glUseProgram")
  MOV    rax,_S226
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUseProgram_],rax
; glUniform1f_ = GPA("glUniform1f")
  MOV    rax,_S227
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1f_],rax
; glUniform2f_ = GPA("glUniform2f")
  MOV    rax,_S228
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2f_],rax
; glUniform3f_ = GPA("glUniform3f")
  MOV    rax,_S229
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3f_],rax
; glUniform4f_ = GPA("glUniform4f")
  MOV    rax,_S230
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4f_],rax
; glUniform1i_ = GPA("glUniform1i")
  MOV    rax,_S231
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1i_],rax
; glUniform2i_ = GPA("glUniform2i")
  MOV    rax,_S232
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2i_],rax
; glUniform3i_ = GPA("glUniform3i")
  MOV    rax,_S233
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3i_],rax
; glUniform4i_ = GPA("glUniform4i")
  MOV    rax,_S234
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4i_],rax
; glUniform1fv_ = GPA("glUniform1fv")
  MOV    rax,_S235
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1fv_],rax
; glUniform2fv_ = GPA("glUniform2fv")
  MOV    rax,_S236
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2fv_],rax
; glUniform3fv_ = GPA("glUniform3fv")
  MOV    rax,_S237
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3fv_],rax
; glUniform4fv_ = GPA("glUniform4fv")
  MOV    rax,_S238
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4fv_],rax
; glUniform1iv_ = GPA("glUniform1iv")
  MOV    rax,_S239
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1iv_],rax
; glUniform2iv_ = GPA("glUniform2iv")
  MOV    rax,_S240
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2iv_],rax
; glUniform3iv_ = GPA("glUniform3iv")
  MOV    rax,_S241
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3iv_],rax
; glUniform4iv_ = GPA("glUniform4iv")
  MOV    rax,_S242
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4iv_],rax
; glUniformMatrix2fv_ = GPA("glUniformMatrix2fv")
  MOV    rax,_S243
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2fv_],rax
; glUniformMatrix3fv_ = GPA("glUniformMatrix3fv")
  MOV    rax,_S244
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3fv_],rax
; glUniformMatrix4fv_ = GPA("glUniformMatrix4fv")
  MOV    rax,_S245
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4fv_],rax
; glValidateProgram_ = GPA("glValidateProgram")
  MOV    rax,_S246
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glValidateProgram_],rax
; glVertexAttrib1d_ = GPA("glVertexAttrib1d")
  MOV    rax,_S247
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1d_],rax
; glVertexAttrib1dv_ = GPA("glVertexAttrib1dv")
  MOV    rax,_S248
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1dv_],rax
; glVertexAttrib1f_ = GPA("glVertexAttrib1f")
  MOV    rax,_S249
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1f_],rax
; glVertexAttrib1fv_ = GPA("glVertexAttrib1fv")
  MOV    rax,_S250
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1fv_],rax
; glVertexAttrib1s_ = GPA("glVertexAttrib1s")
  MOV    rax,_S251
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1s_],rax
; glVertexAttrib1sv_ = GPA("glVertexAttrib1sv")
  MOV    rax,_S252
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib1sv_],rax
; glVertexAttrib2d_ = GPA("glVertexAttrib2d")
  MOV    rax,_S253
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2d_],rax
; glVertexAttrib2dv_ = GPA("glVertexAttrib2dv")
  MOV    rax,_S254
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2dv_],rax
; glVertexAttrib2f_ = GPA("glVertexAttrib2f")
  MOV    rax,_S255
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2f_],rax
; glVertexAttrib2fv_ = GPA("glVertexAttrib2fv")
  MOV    rax,_S256
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2fv_],rax
; glVertexAttrib2s_ = GPA("glVertexAttrib2s")
  MOV    rax,_S257
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2s_],rax
; glVertexAttrib2sv_ = GPA("glVertexAttrib2sv")
  MOV    rax,_S258
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib2sv_],rax
; glVertexAttrib3d_ = GPA("glVertexAttrib3d")
  MOV    rax,_S259
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3d_],rax
; glVertexAttrib3dv_ = GPA("glVertexAttrib3dv")
  MOV    rax,_S260
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3dv_],rax
; glVertexAttrib3f_ = GPA("glVertexAttrib3f")
  MOV    rax,_S261
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3f_],rax
; glVertexAttrib3fv_ = GPA("glVertexAttrib3fv")
  MOV    rax,_S262
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3fv_],rax
; glVertexAttrib3s_ = GPA("glVertexAttrib3s")
  MOV    rax,_S263
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3s_],rax
; glVertexAttrib3sv_ = GPA("glVertexAttrib3sv")
  MOV    rax,_S264
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib3sv_],rax
; glVertexAttrib4Nbv_ = GPA("glVertexAttrib4Nbv")
  MOV    rax,_S265
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nbv_],rax
; glVertexAttrib4Niv_ = GPA("glVertexAttrib4Niv")
  MOV    rax,_S266
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Niv_],rax
; glVertexAttrib4Nsv_ = GPA("glVertexAttrib4Nsv")
  MOV    rax,_S267
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nsv_],rax
; glVertexAttrib4Nub_ = GPA("glVertexAttrib4Nub")
  MOV    rax,_S268
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nub_],rax
; glVertexAttrib4Nubv_ = GPA("glVertexAttrib4Nubv")
  MOV    rax,_S269
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nubv_],rax
; glVertexAttrib4Nuiv_ = GPA("glVertexAttrib4Nuiv")
  MOV    rax,_S270
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nuiv_],rax
; glVertexAttrib4Nusv_ = GPA("glVertexAttrib4Nusv")
  MOV    rax,_S271
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4Nusv_],rax
; glVertexAttrib4bv_ = GPA("glVertexAttrib4bv")
  MOV    rax,_S272
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4bv_],rax
; glVertexAttrib4d_ = GPA("glVertexAttrib4d")
  MOV    rax,_S273
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4d_],rax
; glVertexAttrib4dv_ = GPA("glVertexAttrib4dv")
  MOV    rax,_S274
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4dv_],rax
; glVertexAttrib4f_ = GPA("glVertexAttrib4f")
  MOV    rax,_S275
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4f_],rax
; glVertexAttrib4fv_ = GPA("glVertexAttrib4fv")
  MOV    rax,_S276
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4fv_],rax
; glVertexAttrib4iv_ = GPA("glVertexAttrib4iv")
  MOV    rax,_S277
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4iv_],rax
; glVertexAttrib4s_ = GPA("glVertexAttrib4s")
  MOV    rax,_S278
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4s_],rax
; glVertexAttrib4sv_ = GPA("glVertexAttrib4sv")
  MOV    rax,_S279
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4sv_],rax
; glVertexAttrib4ubv_ = GPA("glVertexAttrib4ubv")
  MOV    rax,_S280
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4ubv_],rax
; glVertexAttrib4uiv_ = GPA("glVertexAttrib4uiv")
  MOV    rax,_S281
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4uiv_],rax
; glVertexAttrib4usv_ = GPA("glVertexAttrib4usv")
  MOV    rax,_S282
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttrib4usv_],rax
; glVertexAttribPointer_ = GPA("glVertexAttribPointer")
  MOV    rax,_S283
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribPointer_],rax
; EndIf
_EndIf211:
; 
; If glVer >= 210
  MOV    r15,qword [rsp+64]
  CMP    r15,210
  JL    _EndIf213
; 
; GLLOAD\glver$ = "210"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S284
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glUniformMatrix2x3fv_ = GPA("glUniformMatrix2x3fv")
  MOV    rax,_S285
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2x3fv_],rax
; glUniformMatrix3x2fv_ = GPA("glUniformMatrix3x2fv")
  MOV    rax,_S286
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3x2fv_],rax
; glUniformMatrix2x4fv_ = GPA("glUniformMatrix2x4fv")
  MOV    rax,_S287
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2x4fv_],rax
; glUniformMatrix4x2fv_ = GPA("glUniformMatrix4x2fv")
  MOV    rax,_S288
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4x2fv_],rax
; glUniformMatrix3x4fv_ = GPA("glUniformMatrix3x4fv")
  MOV    rax,_S289
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3x4fv_],rax
; glUniformMatrix4x3fv_ = GPA("glUniformMatrix4x3fv")
  MOV    rax,_S290
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4x3fv_],rax
; EndIf 
_EndIf213:
; 
; If glVer >= 300
  MOV    r15,qword [rsp+64]
  CMP    r15,300
  JL    _EndIf215
; 
; GLLOAD\glver$ = "300"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S291
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glColorMaski_ = GPA("glColorMaski")
  MOV    rax,_S292
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glColorMaski_],rax
; glGetBooleani_v_ = GPA("glGetBooleani_v")
  MOV    rax,_S293
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetBooleani_v_],rax
; glGetIntegeri_v_ = GPA("glGetIntegeri_v")
  MOV    rax,_S294
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetIntegeri_v_],rax
; glEnablei_ = GPA("glEnablei")
  MOV    rax,_S295
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEnablei_],rax
; glDisablei_ = GPA("glDisablei")
  MOV    rax,_S296
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDisablei_],rax
; glIsEnabledi_ = GPA("glIsEnabledi")
  MOV    rax,_S297
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsEnabledi_],rax
; glBeginTransformFeedback_ = GPA("glBeginTransformFeedback")
  MOV    rax,_S298
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBeginTransformFeedback_],rax
; glEndTransformFeedback_ = GPA("glEndTransformFeedback")
  MOV    rax,_S299
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEndTransformFeedback_],rax
; glBindBufferRange_ = GPA("glBindBufferRange")
  MOV    rax,_S300
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindBufferRange_],rax
; glBindBufferBase_ = GPA("glBindBufferBase")
  MOV    rax,_S301
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindBufferBase_],rax
; glTransformFeedbackVaryings_ = GPA("glTransformFeedbackVaryings")
  MOV    rax,_S302
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTransformFeedbackVaryings_],rax
; glGetTransformFeedbackVarying_ = GPA("glGetTransformFeedbackVarying")
  MOV    rax,_S303
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTransformFeedbackVarying_],rax
; glClampColor_ = GPA("glClampColor")
  MOV    rax,_S304
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClampColor_],rax
; glBeginConditionalRender_ = GPA("glBeginConditionalRender")
  MOV    rax,_S305
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBeginConditionalRender_],rax
; glEndConditionalRender_ = GPA("glEndConditionalRender")
  MOV    rax,_S306
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEndConditionalRender_],rax
; glVertexAttribIPointer_ = GPA("glVertexAttribIPointer")
  MOV    rax,_S307
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribIPointer_],rax
; glGetVertexAttribIiv_ = GPA("glGetVertexAttribIiv")
  MOV    rax,_S308
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribIiv_],rax
; glGetVertexAttribIuiv_ = GPA("glGetVertexAttribIuiv")
  MOV    rax,_S309
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribIuiv_],rax
; glVertexAttribI1i_ = GPA("glVertexAttribI1i")
  MOV    rax,_S310
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI1i_],rax
; glVertexAttribI2i_ = GPA("glVertexAttribI2i")
  MOV    rax,_S311
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI2i_],rax
; glVertexAttribI3i_ = GPA("glVertexAttribI3i")
  MOV    rax,_S312
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI3i_],rax
; glVertexAttribI4i_ = GPA("glVertexAttribI4i")
  MOV    rax,_S313
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4i_],rax
; glVertexAttribI1ui_ = GPA("glVertexAttribI1ui")
  MOV    rax,_S314
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI1ui_],rax
; glVertexAttribI2ui_ = GPA("glVertexAttribI2ui")
  MOV    rax,_S315
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI2ui_],rax
; glVertexAttribI3ui_ = GPA("glVertexAttribI3ui")
  MOV    rax,_S316
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI3ui_],rax
; glVertexAttribI4ui_ = GPA("glVertexAttribI4ui")
  MOV    rax,_S317
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4ui_],rax
; glVertexAttribI1iv_ = GPA("glVertexAttribI1iv")
  MOV    rax,_S318
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI1iv_],rax
; glVertexAttribI2iv_ = GPA("glVertexAttribI2iv")
  MOV    rax,_S319
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI2iv_],rax
; glVertexAttribI3iv_ = GPA("glVertexAttribI3iv")
  MOV    rax,_S320
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI3iv_],rax
; glVertexAttribI4iv_ = GPA("glVertexAttribI4iv")
  MOV    rax,_S321
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4iv_],rax
; glVertexAttribI1uiv_ = GPA("glVertexAttribI1uiv")
  MOV    rax,_S322
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI1uiv_],rax
; glVertexAttribI2uiv_ = GPA("glVertexAttribI2uiv")
  MOV    rax,_S323
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI2uiv_],rax
; glVertexAttribI3uiv_ = GPA("glVertexAttribI3uiv")
  MOV    rax,_S324
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI3uiv_],rax
; glVertexAttribI4uiv_ = GPA("glVertexAttribI4uiv")
  MOV    rax,_S325
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4uiv_],rax
; glVertexAttribI4bv_ = GPA("glVertexAttribI4bv")
  MOV    rax,_S326
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4bv_],rax
; glVertexAttribI4sv_ = GPA("glVertexAttribI4sv")
  MOV    rax,_S327
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4sv_],rax
; glVertexAttribI4ubv_ = GPA("glVertexAttribI4ubv")
  MOV    rax,_S328
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4ubv_],rax
; glVertexAttribI4usv_ = GPA("glVertexAttribI4usv")
  MOV    rax,_S329
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribI4usv_],rax
; glGetUniformuiv_ = GPA("glGetUniformuiv")
  MOV    rax,_S330
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformuiv_],rax
; glBindFragDataLocation_ = GPA("glBindFragDataLocation")
  MOV    rax,_S331
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindFragDataLocation_],rax
; glGetFragDataLocation_ = GPA("glGetFragDataLocation")
  MOV    rax,_S332
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetFragDataLocation_],rax
; glUniform1ui_ = GPA("glUniform1ui")
  MOV    rax,_S333
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1ui_],rax
; glUniform2ui_ = GPA("glUniform2ui")
  MOV    rax,_S334
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2ui_],rax
; glUniform3ui_ = GPA("glUniform3ui")
  MOV    rax,_S335
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3ui_],rax
; glUniform4ui_ = GPA("glUniform4ui")
  MOV    rax,_S336
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4ui_],rax
; glUniform1uiv_ = GPA("glUniform1uiv")
  MOV    rax,_S337
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1uiv_],rax
; glUniform2uiv_ = GPA("glUniform2uiv")
  MOV    rax,_S338
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2uiv_],rax
; glUniform3uiv_ = GPA("glUniform3uiv")
  MOV    rax,_S339
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3uiv_],rax
; glUniform4uiv_ = GPA("glUniform4uiv")
  MOV    rax,_S340
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4uiv_],rax
; glTexParameterIiv_ = GPA("glTexParameterIiv")
  MOV    rax,_S341
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexParameterIiv_],rax
; glTexParameterIuiv_ = GPA("glTexParameterIuiv")
  MOV    rax,_S342
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexParameterIuiv_],rax
; glGetTexParameterIiv_ = GPA("glGetTexParameterIiv")
  MOV    rax,_S343
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTexParameterIiv_],rax
; glGetTexParameterIuiv_ = GPA("glGetTexParameterIuiv")
  MOV    rax,_S344
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTexParameterIuiv_],rax
; glClearBufferiv_ = GPA("glClearBufferiv")
  MOV    rax,_S345
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferiv_],rax
; glClearBufferuiv_ = GPA("glClearBufferuiv")
  MOV    rax,_S346
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferuiv_],rax
; glClearBufferfv_ = GPA("glClearBufferfv")
  MOV    rax,_S347
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferfv_],rax
; glClearBufferfi_ = GPA("glClearBufferfi")
  MOV    rax,_S348
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferfi_],rax
; glGetStringi_ = GPA("glGetStringi")
  MOV    rax,_S349
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetStringi_],rax
; glIsRenderbuffer_ = GPA("glIsRenderbuffer")
  MOV    rax,_S350
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsRenderbuffer_],rax
; glBindRenderbuffer_ = GPA("glBindRenderbuffer")
  MOV    rax,_S351
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindRenderbuffer_],rax
; glDeleteRenderbuffers_ = GPA("glDeleteRenderbuffers")
  MOV    rax,_S352
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteRenderbuffers_],rax
; glGenRenderbuffers_ = GPA("glGenRenderbuffers")
  MOV    rax,_S353
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenRenderbuffers_],rax
; glRenderbufferStorage_ = GPA("glRenderbufferStorage")
  MOV    rax,_S354
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glRenderbufferStorage_],rax
; glGetRenderbufferParameteriv_ = GPA("glGetRenderbufferParameteriv")
  MOV    rax,_S355
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetRenderbufferParameteriv_],rax
; glIsFramebuffer_ = GPA("glIsFramebuffer")
  MOV    rax,_S356
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsFramebuffer_],rax
; glBindFramebuffer_ = GPA("glBindFramebuffer")
  MOV    rax,_S357
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindFramebuffer_],rax
; glDeleteFramebuffers_ = GPA("glDeleteFramebuffers")
  MOV    rax,_S358
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteFramebuffers_],rax
; glGenFramebuffers_ = GPA("glGenFramebuffers")
  MOV    rax,_S359
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenFramebuffers_],rax
; glCheckFramebufferStatus_ = GPA("glCheckFramebufferStatus")
  MOV    rax,_S360
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCheckFramebufferStatus_],rax
; glFramebufferTexture1D_ = GPA("glFramebufferTexture1D")
  MOV    rax,_S361
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferTexture1D_],rax
; glFramebufferTexture2D_ = GPA("glFramebufferTexture2D")
  MOV    rax,_S362
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferTexture2D_],rax
; glFramebufferTexture3D_ = GPA("glFramebufferTexture3D")
  MOV    rax,_S363
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferTexture3D_],rax
; glFramebufferRenderbuffer_ = GPA("glFramebufferRenderbuffer")
  MOV    rax,_S364
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferRenderbuffer_],rax
; glGetFramebufferAttachmentParameteriv_ = GPA("glGetFramebufferAttachmentParameteriv")
  MOV    rax,_S365
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetFramebufferAttachmentParameteriv_],rax
; glGenerateMipmap_ = GPA("glGenerateMipmap")
  MOV    rax,_S366
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenerateMipmap_],rax
; glBlitFramebuffer_ = GPA("glBlitFramebuffer")
  MOV    rax,_S367
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlitFramebuffer_],rax
; glRenderbufferStorageMultisample_ = GPA("glRenderbufferStorageMultisample")
  MOV    rax,_S368
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glRenderbufferStorageMultisample_],rax
; glFramebufferTextureLayer_ = GPA("glFramebufferTextureLayer")
  MOV    rax,_S369
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferTextureLayer_],rax
; glMapBufferRange_ = GPA("glMapBufferRange")
  MOV    rax,_S370
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMapBufferRange_],rax
; glFlushMappedBufferRange_ = GPA("glFlushMappedBufferRange")
  MOV    rax,_S371
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFlushMappedBufferRange_],rax
; glBindVertexArray_ = GPA("glBindVertexArray")
  MOV    rax,_S372
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindVertexArray_],rax
; glDeleteVertexArrays_ = GPA("glDeleteVertexArrays")
  MOV    rax,_S373
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteVertexArrays_],rax
; glGenVertexArrays_ = GPA("glGenVertexArrays")
  MOV    rax,_S374
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenVertexArrays_],rax
; glIsVertexArray_ = GPA("glIsVertexArray")
  MOV    rax,_S375
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsVertexArray_],rax
; EndIf
_EndIf215:
; 
; If glVer >= 310
  MOV    r15,qword [rsp+64]
  CMP    r15,310
  JL    _EndIf217
; 
; GLLOAD\glver$ = "310"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S376
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glDrawArraysInstanced_ = GPA("glDrawArraysInstanced")
  MOV    rax,_S377
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawArraysInstanced_],rax
; glDrawElementsInstanced_ = GPA("glDrawElementsInstanced")
  MOV    rax,_S378
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsInstanced_],rax
; glTexBuffer_ = GPA("glTexBuffer")
  MOV    rax,_S379
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexBuffer_],rax
; glPrimitiveRestartIndex_ = GPA("glPrimitiveRestartIndex")
  MOV    rax,_S380
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPrimitiveRestartIndex_],rax
; glCopyBufferSubData_ = GPA("glCopyBufferSubData")
  MOV    rax,_S381
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyBufferSubData_],rax
; glGetUniformIndices_ = GPA("glGetUniformIndices")
  MOV    rax,_S382
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformIndices_],rax
; glGetActiveUniformsiv_ = GPA("glGetActiveUniformsiv")
  MOV    rax,_S383
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveUniformsiv_],rax
; glGetActiveUniformName_ = GPA("glGetActiveUniformName")
  MOV    rax,_S384
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveUniformName_],rax
; glGetUniformBlockIndex_ = GPA("glGetUniformBlockIndex")
  MOV    rax,_S385
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformBlockIndex_],rax
; glGetActiveUniformBlockiv_ = GPA("glGetActiveUniformBlockiv")
  MOV    rax,_S386
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveUniformBlockiv_],rax
; glGetActiveUniformBlockName_ = GPA("glGetActiveUniformBlockName")
  MOV    rax,_S387
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveUniformBlockName_],rax
; glUniformBlockBinding_ = GPA("glUniformBlockBinding")
  MOV    rax,_S388
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformBlockBinding_],rax
; EndIf
_EndIf217:
; 
; If glVer >= 320   
  MOV    r15,qword [rsp+64]
  CMP    r15,320
  JL    _EndIf219
; 
; GLLOAD\glver$ = "320"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S389
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glDrawElementsBaseVertex_ = GPA("glDrawElementsBaseVertex")
  MOV    rax,_S390
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsBaseVertex_],rax
; glDrawRangeElementsBaseVertex_ = GPA("glDrawRangeElementsBaseVertex")
  MOV    rax,_S391
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawRangeElementsBaseVertex_],rax
; glDrawElementsInstancedBaseVertex_ = GPA("glDrawElementsInstancedBaseVertex")
  MOV    rax,_S392
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsInstancedBaseVertex_],rax
; glMultiDrawElementsBaseVertex_ = GPA("glMultiDrawElementsBaseVertex")
  MOV    rax,_S393
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawElementsBaseVertex_],rax
; glProvokingVertex_ = GPA("glProvokingVertex")
  MOV    rax,_S394
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProvokingVertex_],rax
; glFenceSync_ = GPA("glFenceSync")
  MOV    rax,_S395
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFenceSync_],rax
; glIsSync_ = GPA("glIsSync")
  MOV    rax,_S396
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsSync_],rax
; glDeleteSync_ = GPA("glDeleteSync")
  MOV    rax,_S397
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteSync_],rax
; glClientWaitSync_ = GPA("glClientWaitSync")
  MOV    rax,_S398
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClientWaitSync_],rax
; glWaitSync_ = GPA("glWaitSync")
  MOV    rax,_S399
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glWaitSync_],rax
; glGetInteger64v_ = GPA("glGetInteger64v")
  MOV    rax,_S400
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetInteger64v_],rax
; glGetSynciv_ = GPA("glGetSynciv")
  MOV    rax,_S401
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSynciv_],rax
; glGetInteger64i_v_ = GPA("glGetInteger64i_v")
  MOV    rax,_S402
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetInteger64i_v_],rax
; glGetBufferParameteri64v_ = GPA("glGetBufferParameteri64v")
  MOV    rax,_S403
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetBufferParameteri64v_],rax
; glFramebufferTexture_ = GPA("glFramebufferTexture")
  MOV    rax,_S404
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferTexture_],rax
; glTexImage2DMultisample_ = GPA("glTexImage2DMultisample")
  MOV    rax,_S405
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexImage2DMultisample_],rax
; glTexImage3DMultisample_ = GPA("glTexImage3DMultisample")
  MOV    rax,_S406
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexImage3DMultisample_],rax
; glGetMultisamplefv_ = GPA("glGetMultisamplefv")
  MOV    rax,_S407
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetMultisamplefv_],rax
; glSampleMaski_ = GPA("glSampleMaski")
  MOV    rax,_S408
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSampleMaski_],rax
; EndIf
_EndIf219:
; 
; If glVer >= 330
  MOV    r15,qword [rsp+64]
  CMP    r15,330
  JL    _EndIf221
; 
; GLLOAD\glver$ = "330"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S409
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glBindFragDataLocationIndexed_ = GPA("glBindFragDataLocationIndexed")
  MOV    rax,_S410
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindFragDataLocationIndexed_],rax
; glGetFragDataIndex_ = GPA("glGetFragDataIndex")
  MOV    rax,_S411
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetFragDataIndex_],rax
; glGenSamplers_ = GPA("glGenSamplers")
  MOV    rax,_S412
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenSamplers_],rax
; glDeleteSamplers_ = GPA("glDeleteSamplers")
  MOV    rax,_S413
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteSamplers_],rax
; glIsSampler_ = GPA("glIsSampler")
  MOV    rax,_S414
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsSampler_],rax
; glBindSampler_ = GPA("glBindSampler")
  MOV    rax,_S415
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindSampler_],rax
; glSamplerParameteri_ = GPA("glSamplerParameteri")
  MOV    rax,_S416
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameteri_],rax
; glSamplerParameteriv_ = GPA("glSamplerParameteriv")
  MOV    rax,_S417
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameteriv_],rax
; glSamplerParameterf_ = GPA("glSamplerParameterf")
  MOV    rax,_S418
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameterf_],rax
; glSamplerParameterfv_ = GPA("glSamplerParameterfv")
  MOV    rax,_S419
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameterfv_],rax
; glSamplerParameterIiv_ = GPA("glSamplerParameterIiv")
  MOV    rax,_S420
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameterIiv_],rax
; glSamplerParameterIuiv_ = GPA("glSamplerParameterIuiv")
  MOV    rax,_S421
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSamplerParameterIuiv_],rax
; glGetSamplerParameteriv_ = GPA("glGetSamplerParameteriv")
  MOV    rax,_S422
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSamplerParameteriv_],rax
; glGetSamplerParameterIiv_ = GPA("glGetSamplerParameterIiv")
  MOV    rax,_S423
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSamplerParameterIiv_],rax
; glGetSamplerParameterfv_ = GPA("glGetSamplerParameterfv")
  MOV    rax,_S424
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSamplerParameterfv_],rax
; glGetSamplerParameterIuiv_ = GPA("glGetSamplerParameterIuiv")
  MOV    rax,_S425
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSamplerParameterIuiv_],rax
; glQueryCounter_ = GPA("glQueryCounter")
  MOV    rax,_S426
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glQueryCounter_],rax
; glGetQueryObjecti64v_ = GPA("glGetQueryObjecti64v")
  MOV    rax,_S427
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryObjecti64v_],rax
; glGetQueryObjectui64v_ = GPA("glGetQueryObjectui64v")
  MOV    rax,_S428
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryObjectui64v_],rax
; glVertexAttribDivisor_ = GPA("glVertexAttribDivisor")
  MOV    rax,_S429
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribDivisor_],rax
; glVertexAttribP1ui_ = GPA("glVertexAttribP1ui")
  MOV    rax,_S430
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP1ui_],rax
; glVertexAttribP1uiv_ = GPA("glVertexAttribP1uiv")
  MOV    rax,_S431
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP1uiv_],rax
; glVertexAttribP2ui_ = GPA("glVertexAttribP2ui")
  MOV    rax,_S432
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP2ui_],rax
; glVertexAttribP2uiv_ = GPA("glVertexAttribP2uiv")
  MOV    rax,_S433
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP2uiv_],rax
; glVertexAttribP3ui_ = GPA("glVertexAttribP3ui")
  MOV    rax,_S434
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP3ui_],rax
; glVertexAttribP3uiv_ = GPA("glVertexAttribP3uiv")
  MOV    rax,_S435
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP3uiv_],rax
; glVertexAttribP4ui_ = GPA("glVertexAttribP4ui")
  MOV    rax,_S436
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP4ui_],rax
; glVertexAttribP4uiv_ = GPA("glVertexAttribP4uiv")
  MOV    rax,_S437
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribP4uiv_],rax
; EndIf
_EndIf221:
; 
; If glVer >= 400
  MOV    r15,qword [rsp+64]
  CMP    r15,400
  JL    _EndIf223
; 
; GLLOAD\glver$ = "400"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S438
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glMinSampleShading_ = GPA("glMinSampleShading")
  MOV    rax,_S439
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMinSampleShading_],rax
; glBlendEquationi_ = GPA("glBlendEquationi")
  MOV    rax,_S440
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendEquationi_],rax
; glBlendEquationSeparatei_ = GPA("glBlendEquationSeparatei")
  MOV    rax,_S441
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendEquationSeparatei_],rax
; glBlendFunci_ = GPA("glBlendFunci")
  MOV    rax,_S442
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendFunci_],rax
; glBlendFuncSeparatei_ = GPA("glBlendFuncSeparatei")
  MOV    rax,_S443
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlendFuncSeparatei_],rax
; glDrawArraysIndirect_ = GPA("glDrawArraysIndirect")
  MOV    rax,_S444
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawArraysIndirect_],rax
; glDrawElementsIndirect_ = GPA("glDrawElementsIndirect")
  MOV    rax,_S445
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsIndirect_],rax
; glUniform1d_ = GPA("glUniform1d")
  MOV    rax,_S446
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1d_],rax
; glUniform2d_ = GPA("glUniform2d")
  MOV    rax,_S447
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2d_],rax
; glUniform3d_ = GPA("glUniform3d")
  MOV    rax,_S448
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3d_],rax
; glUniform4d_ = GPA("glUniform4d")
  MOV    rax,_S449
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4d_],rax
; glUniform1dv_ = GPA("glUniform1dv")
  MOV    rax,_S450
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform1dv_],rax
; glUniform2dv_ = GPA("glUniform2dv")
  MOV    rax,_S451
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform2dv_],rax
; glUniform3dv_ = GPA("glUniform3dv")
  MOV    rax,_S452
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform3dv_],rax
; glUniform4dv_ = GPA("glUniform4dv")
  MOV    rax,_S453
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniform4dv_],rax
; glUniformMatrix2dv_ = GPA("glUniformMatrix2dv")
  MOV    rax,_S454
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2dv_],rax
; glUniformMatrix3dv_ = GPA("glUniformMatrix3dv")
  MOV    rax,_S455
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3dv_],rax
; glUniformMatrix4dv_ = GPA("glUniformMatrix4dv")
  MOV    rax,_S456
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4dv_],rax
; glUniformMatrix2x3dv_ = GPA("glUniformMatrix2x3dv")
  MOV    rax,_S457
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2x3dv_],rax
; glUniformMatrix2x4dv_ = GPA("glUniformMatrix2x4dv")
  MOV    rax,_S458
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix2x4dv_],rax
; glUniformMatrix3x2dv_ = GPA("glUniformMatrix3x2dv")
  MOV    rax,_S459
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3x2dv_],rax
; glUniformMatrix3x4dv_ = GPA("glUniformMatrix3x4dv")
  MOV    rax,_S460
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix3x4dv_],rax
; glUniformMatrix4x2dv_ = GPA("glUniformMatrix4x2dv")
  MOV    rax,_S461
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4x2dv_],rax
; glUniformMatrix4x3dv_ = GPA("glUniformMatrix4x3dv")
  MOV    rax,_S462
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformMatrix4x3dv_],rax
; glGetUniformdv_ = GPA("glGetUniformdv")
  MOV    rax,_S463
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformdv_],rax
; glGetSubroutineUniformLocation_ = GPA("glGetSubroutineUniformLocation")
  MOV    rax,_S464
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSubroutineUniformLocation_],rax
; glGetSubroutineIndex_ = GPA("glGetSubroutineIndex")
  MOV    rax,_S465
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetSubroutineIndex_],rax
; glGetActiveSubroutineUniformiv_ = GPA("glGetActiveSubroutineUniformiv")
  MOV    rax,_S466
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveSubroutineUniformiv_],rax
; glGetActiveSubroutineUniformName_ = GPA("glGetActiveSubroutineUniformName")
  MOV    rax,_S467
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveSubroutineUniformName_],rax
; glGetActiveSubroutineName_ = GPA("glGetActiveSubroutineName")
  MOV    rax,_S468
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveSubroutineName_],rax
; glUniformSubroutinesuiv_ = GPA("glUniformSubroutinesuiv")
  MOV    rax,_S469
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUniformSubroutinesuiv_],rax
; glGetUniformSubroutineuiv_ = GPA("glGetUniformSubroutineuiv")
  MOV    rax,_S470
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetUniformSubroutineuiv_],rax
; glGetProgramStageiv_ = GPA("glGetProgramStageiv")
  MOV    rax,_S471
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramStageiv_],rax
; glPatchParameteri_ = GPA("glPatchParameteri")
  MOV    rax,_S472
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPatchParameteri_],rax
; glPatchParameterfv_ = GPA("glPatchParameterfv")
  MOV    rax,_S473
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPatchParameterfv_],rax
; glBindTransformFeedback_ = GPA("glBindTransformFeedback")
  MOV    rax,_S474
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindTransformFeedback_],rax
; glDeleteTransformFeedbacks_ = GPA("glDeleteTransformFeedbacks")
  MOV    rax,_S475
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteTransformFeedbacks_],rax
; glGenTransformFeedbacks_ = GPA("glGenTransformFeedbacks")
  MOV    rax,_S476
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenTransformFeedbacks_],rax
; glIsTransformFeedback_ = GPA("glIsTransformFeedback")
  MOV    rax,_S477
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsTransformFeedback_],rax
; glPauseTransformFeedback_ = GPA("glPauseTransformFeedback")
  MOV    rax,_S478
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPauseTransformFeedback_],rax
; glResumeTransformFeedback_ = GPA("glResumeTransformFeedback")
  MOV    rax,_S479
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glResumeTransformFeedback_],rax
; glDrawTransformFeedback_ = GPA("glDrawTransformFeedback")
  MOV    rax,_S480
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawTransformFeedback_],rax
; glDrawTransformFeedbackStream_ = GPA("glDrawTransformFeedbackStream")
  MOV    rax,_S481
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawTransformFeedbackStream_],rax
; glBeginQueryIndexed_ = GPA("glBeginQueryIndexed")
  MOV    rax,_S482
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBeginQueryIndexed_],rax
; glEndQueryIndexed_ = GPA("glEndQueryIndexed")
  MOV    rax,_S483
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEndQueryIndexed_],rax
; glGetQueryIndexediv_ = GPA("glGetQueryIndexediv")
  MOV    rax,_S484
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryIndexediv_],rax
; EndIf
_EndIf223:
; 
; If glVer >= 410
  MOV    r15,qword [rsp+64]
  CMP    r15,410
  JL    _EndIf225
; 
; GLLOAD\glver$ = "410"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S485
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glReleaseShaderCompiler_ = GPA("glReleaseShaderCompiler")
  MOV    rax,_S486
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glReleaseShaderCompiler_],rax
; glShaderBinary_ = GPA("glShaderBinary")
  MOV    rax,_S487
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glShaderBinary_],rax
; glGetShaderPrecisionFormat_ = GPA("glGetShaderPrecisionFormat")
  MOV    rax,_S488
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetShaderPrecisionFormat_],rax
; glDepthRangef_ = GPA("glDepthRangef")
  MOV    rax,_S489
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDepthRangef_],rax
; glClearDepthf_ = GPA("glClearDepthf")
  MOV    rax,_S490
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearDepthf_],rax
; glGetProgramBinary_ = GPA("glGetProgramBinary")
  MOV    rax,_S491
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramBinary_],rax
; glProgramBinary_ = GPA("glProgramBinary")
  MOV    rax,_S492
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramBinary_],rax
; glProgramParameteri_ = GPA("glProgramParameteri")
  MOV    rax,_S493
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramParameteri_],rax
; glUseProgramStages_ = GPA("glUseProgramStages")
  MOV    rax,_S494
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUseProgramStages_],rax
; glActiveShaderProgram_ = GPA("glActiveShaderProgram")
  MOV    rax,_S495
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glActiveShaderProgram_],rax
; glCreateShaderProgramv_ = GPA("glCreateShaderProgramv")
  MOV    rax,_S496
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateShaderProgramv_],rax
; glBindProgramPipeline_ = GPA("glBindProgramPipeline")
  MOV    rax,_S497
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindProgramPipeline_],rax
; glDeleteProgramPipelines_ = GPA("glDeleteProgramPipelines")
  MOV    rax,_S498
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDeleteProgramPipelines_],rax
; glGenProgramPipelines_ = GPA("glGenProgramPipelines")
  MOV    rax,_S499
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenProgramPipelines_],rax
; glIsProgramPipeline_ = GPA("glIsProgramPipeline")
  MOV    rax,_S500
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glIsProgramPipeline_],rax
; glGetProgramPipelineiv_ = GPA("glGetProgramPipelineiv")
  MOV    rax,_S501
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramPipelineiv_],rax
; glProgramUniform1i_ = GPA("glProgramUniform1i")
  MOV    rax,_S502
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1i_],rax
; glProgramUniform1iv_ = GPA("glProgramUniform1iv")
  MOV    rax,_S503
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1iv_],rax
; glProgramUniform1f_ = GPA("glProgramUniform1f")
  MOV    rax,_S504
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1f_],rax
; glProgramUniform1fv_ = GPA("glProgramUniform1fv")
  MOV    rax,_S505
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1fv_],rax
; glProgramUniform1d_ = GPA("glProgramUniform1d")
  MOV    rax,_S506
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1d_],rax
; glProgramUniform1dv_ = GPA("glProgramUniform1dv")
  MOV    rax,_S507
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1dv_],rax
; glProgramUniform1ui_ = GPA("glProgramUniform1ui")
  MOV    rax,_S508
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1ui_],rax
; glProgramUniform1uiv_ = GPA("glProgramUniform1uiv")
  MOV    rax,_S509
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform1uiv_],rax
; glProgramUniform2i_ = GPA("glProgramUniform2i")
  MOV    rax,_S510
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2i_],rax
; glProgramUniform2iv_ = GPA("glProgramUniform2iv")
  MOV    rax,_S511
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2iv_],rax
; glProgramUniform2f_ = GPA("glProgramUniform2f")
  MOV    rax,_S512
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2f_],rax
; glProgramUniform2fv_ = GPA("glProgramUniform2fv")
  MOV    rax,_S513
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2fv_],rax
; glProgramUniform2d_ = GPA("glProgramUniform2d")
  MOV    rax,_S514
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2d_],rax
; glProgramUniform2dv_ = GPA("glProgramUniform2dv")
  MOV    rax,_S515
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2dv_],rax
; glProgramUniform2ui_ = GPA("glProgramUniform2ui")
  MOV    rax,_S516
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2ui_],rax
; glProgramUniform2uiv_ = GPA("glProgramUniform2uiv")
  MOV    rax,_S517
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform2uiv_],rax
; glProgramUniform3i_ = GPA("glProgramUniform3i")
  MOV    rax,_S518
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3i_],rax
; glProgramUniform3iv_ = GPA("glProgramUniform3iv")
  MOV    rax,_S519
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3iv_],rax
; glProgramUniform3f_ = GPA("glProgramUniform3f")
  MOV    rax,_S520
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3f_],rax
; glProgramUniform3fv_ = GPA("glProgramUniform3fv")
  MOV    rax,_S521
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3fv_],rax
; glProgramUniform3d_ = GPA("glProgramUniform3d")
  MOV    rax,_S522
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3d_],rax
; glProgramUniform3dv_ = GPA("glProgramUniform3dv")
  MOV    rax,_S523
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3dv_],rax
; glProgramUniform3ui_ = GPA("glProgramUniform3ui")
  MOV    rax,_S524
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3ui_],rax
; glProgramUniform3uiv_ = GPA("glProgramUniform3uiv")
  MOV    rax,_S525
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform3uiv_],rax
; glProgramUniform4i_ = GPA("glProgramUniform4i")
  MOV    rax,_S526
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4i_],rax
; glProgramUniform4iv_ = GPA("glProgramUniform4iv")
  MOV    rax,_S527
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4iv_],rax
; glProgramUniform4f_ = GPA("glProgramUniform4f")
  MOV    rax,_S528
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4f_],rax
; glProgramUniform4fv_ = GPA("glProgramUniform4fv")
  MOV    rax,_S529
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4fv_],rax
; glProgramUniform4d_ = GPA("glProgramUniform4d")
  MOV    rax,_S530
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4d_],rax
; glProgramUniform4dv_ = GPA("glProgramUniform4dv")
  MOV    rax,_S531
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4dv_],rax
; glProgramUniform4ui_ = GPA("glProgramUniform4ui")
  MOV    rax,_S532
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4ui_],rax
; glProgramUniform4uiv_ = GPA("glProgramUniform4uiv")
  MOV    rax,_S533
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniform4uiv_],rax
; glProgramUniformMatrix2fv_ = GPA("glProgramUniformMatrix2fv")
  MOV    rax,_S534
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2fv_],rax
; glProgramUniformMatrix3fv_ = GPA("glProgramUniformMatrix3fv")
  MOV    rax,_S535
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3fv_],rax
; glProgramUniformMatrix4fv_ = GPA("glProgramUniformMatrix4fv")
  MOV    rax,_S536
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4fv_],rax
; glProgramUniformMatrix2dv_ = GPA("glProgramUniformMatrix2dv")
  MOV    rax,_S537
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2dv_],rax
; glProgramUniformMatrix3dv_ = GPA("glProgramUniformMatrix3dv")
  MOV    rax,_S538
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3dv_],rax
; glProgramUniformMatrix4dv_ = GPA("glProgramUniformMatrix4dv")
  MOV    rax,_S539
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4dv_],rax
; glProgramUniformMatrix2x3fv_ = GPA("glProgramUniformMatrix2x3fv")
  MOV    rax,_S540
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2x3fv_],rax
; glProgramUniformMatrix3x2fv_ = GPA("glProgramUniformMatrix3x2fv")
  MOV    rax,_S541
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3x2fv_],rax
; glProgramUniformMatrix2x4fv_ = GPA("glProgramUniformMatrix2x4fv")
  MOV    rax,_S542
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2x4fv_],rax
; glProgramUniformMatrix4x2fv_ = GPA("glProgramUniformMatrix4x2fv")
  MOV    rax,_S543
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4x2fv_],rax
; glProgramUniformMatrix3x4fv_ = GPA("glProgramUniformMatrix3x4fv")
  MOV    rax,_S544
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3x4fv_],rax
; glProgramUniformMatrix4x3fv_ = GPA("glProgramUniformMatrix4x3fv")
  MOV    rax,_S545
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4x3fv_],rax
; glProgramUniformMatrix2x3dv_ = GPA("glProgramUniformMatrix2x3dv")
  MOV    rax,_S546
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2x3dv_],rax
; glProgramUniformMatrix3x2dv_ = GPA("glProgramUniformMatrix3x2dv")
  MOV    rax,_S547
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3x2dv_],rax
; glProgramUniformMatrix2x4dv_ = GPA("glProgramUniformMatrix2x4dv")
  MOV    rax,_S548
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix2x4dv_],rax
; glProgramUniformMatrix4x2dv_ = GPA("glProgramUniformMatrix4x2dv")
  MOV    rax,_S549
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4x2dv_],rax
; glProgramUniformMatrix3x4dv_ = GPA("glProgramUniformMatrix3x4dv")
  MOV    rax,_S550
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix3x4dv_],rax
; glProgramUniformMatrix4x3dv_ = GPA("glProgramUniformMatrix4x3dv")
  MOV    rax,_S551
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glProgramUniformMatrix4x3dv_],rax
; glValidateProgramPipeline_ = GPA("glValidateProgramPipeline")
  MOV    rax,_S552
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glValidateProgramPipeline_],rax
; glGetProgramPipelineInfoLog_ = GPA("glGetProgramPipelineInfoLog")
  MOV    rax,_S553
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramPipelineInfoLog_],rax
; glVertexAttribL1d_ = GPA("glVertexAttribL1d")
  MOV    rax,_S554
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL1d_],rax
; glVertexAttribL2d_ = GPA("glVertexAttribL2d")
  MOV    rax,_S555
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL2d_],rax
; glVertexAttribL3d_ = GPA("glVertexAttribL3d")
  MOV    rax,_S556
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL3d_],rax
; glVertexAttribL4d_ = GPA("glVertexAttribL4d")
  MOV    rax,_S557
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL4d_],rax
; glVertexAttribL1dv_ = GPA("glVertexAttribL1dv")
  MOV    rax,_S558
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL1dv_],rax
; glVertexAttribL2dv_ = GPA("glVertexAttribL2dv")
  MOV    rax,_S559
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL2dv_],rax
; glVertexAttribL3dv_ = GPA("glVertexAttribL3dv")
  MOV    rax,_S560
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL3dv_],rax
; glVertexAttribL4dv_ = GPA("glVertexAttribL4dv")
  MOV    rax,_S561
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribL4dv_],rax
; glVertexAttribLPointer_ = GPA("glVertexAttribLPointer")
  MOV    rax,_S562
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribLPointer_],rax
; glGetVertexAttribLdv_ = GPA("glGetVertexAttribLdv")
  MOV    rax,_S563
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexAttribLdv_],rax
; glViewportArrayv_ = GPA("glViewportArrayv")
  MOV    rax,_S564
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glViewportArrayv_],rax
; glViewportIndexedf_ = GPA("glViewportIndexedf")
  MOV    rax,_S565
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glViewportIndexedf_],rax
; glViewportIndexedfv_ = GPA("glViewportIndexedfv")
  MOV    rax,_S566
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glViewportIndexedfv_],rax
; glScissorArrayv_ = GPA("glScissorArrayv")
  MOV    rax,_S567
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glScissorArrayv_],rax
; glScissorIndexed_ = GPA("glScissorIndexed")
  MOV    rax,_S568
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glScissorIndexed_],rax
; glScissorIndexedv_ = GPA("glScissorIndexedv")
  MOV    rax,_S569
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glScissorIndexedv_],rax
; glDepthRangeArrayv_ = GPA("glDepthRangeArrayv")
  MOV    rax,_S570
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDepthRangeArrayv_],rax
; glDepthRangeIndexed_ = GPA("glDepthRangeIndexed")
  MOV    rax,_S571
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDepthRangeIndexed_],rax
; glGetFloati_v_ = GPA("glGetFloati_v")
  MOV    rax,_S572
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetFloati_v_],rax
; glGetDoublei_v_ = GPA("glGetDoublei_v")    
  MOV    rax,_S573
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetDoublei_v_],rax
; EndIf
_EndIf225:
; 
; If glVer >= 420
  MOV    r15,qword [rsp+64]
  CMP    r15,420
  JL    _EndIf227
; 
; GLLOAD\glver$ = "420"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S574
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glDrawArraysInstancedBaseInstance_ = GPA("glDrawArraysInstancedBaseInstance")
  MOV    rax,_S575
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawArraysInstancedBaseInstance_],rax
; glDrawElementsInstancedBaseInstance_ = GPA("glDrawElementsInstancedBaseInstance")
  MOV    rax,_S576
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsInstancedBaseInstance_],rax
; glDrawElementsInstancedBaseVertexBaseInstance_ = GPA("glDrawElementsInstancedBaseVertexBaseInstance")
  MOV    rax,_S577
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawElementsInstancedBaseVertexBaseInstance_],rax
; glGetActiveAtomicCounterBufferiv_ = GPA("glGetActiveAtomicCounterBufferiv")
  MOV    rax,_S578
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetActiveAtomicCounterBufferiv_],rax
; glBindImageTexture_ = GPA("glBindImageTexture")
  MOV    rax,_S579
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindImageTexture_],rax
; glMemoryBarrier_ = GPA("glMemoryBarrier")
  MOV    rax,_S580
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMemoryBarrier_],rax
; glTexStorage1D_ = GPA("glTexStorage1D")
  MOV    rax,_S581
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexStorage1D_],rax
; glTexStorage2D_ = GPA("glTexStorage2D")
  MOV    rax,_S582
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexStorage2D_],rax
; glTexStorage3D_ = GPA("glTexStorage3D")
  MOV    rax,_S583
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexStorage3D_],rax
; glDrawTransformFeedbackInstanced_ = GPA("glDrawTransformFeedbackInstanced")
  MOV    rax,_S584
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawTransformFeedbackInstanced_],rax
; glDrawTransformFeedbackStreamInstanced_ = GPA("glDrawTransformFeedbackStreamInstanced")
  MOV    rax,_S585
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDrawTransformFeedbackStreamInstanced_],rax
; EndIf
_EndIf227:
; 
; If glVer >= 430
  MOV    r15,qword [rsp+64]
  CMP    r15,430
  JL    _EndIf229
; 
; GLLOAD\glver$ = "430"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S586
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glClearBufferData_ = GPA("glClearBufferData")
  MOV    rax,_S587
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferData_],rax
; glClearBufferSubData_ = GPA("glClearBufferSubData")
  MOV    rax,_S588
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearBufferSubData_],rax
; glDispatchCompute_ = GPA("glDispatchCompute")
  MOV    rax,_S589
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDispatchCompute_],rax
; glDispatchComputeIndirect_ = GPA("glDispatchComputeIndirect")
  MOV    rax,_S590
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDispatchComputeIndirect_],rax
; glCopyImageSubData_ = GPA("glCopyImageSubData")
  MOV    rax,_S591
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyImageSubData_],rax
; glFramebufferParameteri_ = GPA("glFramebufferParameteri")
  MOV    rax,_S592
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFramebufferParameteri_],rax
; glGetFramebufferParameteriv_ = GPA("glGetFramebufferParameteriv")
  MOV    rax,_S593
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetFramebufferParameteriv_],rax
; glGetInternalformati64v_ = GPA("glGetInternalformati64v")
  MOV    rax,_S594
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetInternalformati64v_],rax
; glInvalidateTexSubImage_ = GPA("glInvalidateTexSubImage")
  MOV    rax,_S595
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateTexSubImage_],rax
; glInvalidateTexImage_ = GPA("glInvalidateTexImage")
  MOV    rax,_S596
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateTexImage_],rax
; glInvalidateBufferSubData_ = GPA("glInvalidateBufferSubData")
  MOV    rax,_S597
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateBufferSubData_],rax
; glInvalidateBufferData_ = GPA("glInvalidateBufferData")
  MOV    rax,_S598
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateBufferData_],rax
; glInvalidateFramebuffer_ = GPA("glInvalidateFramebuffer")
  MOV    rax,_S599
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateFramebuffer_],rax
; glInvalidateSubFramebuffer_ = GPA("glInvalidateSubFramebuffer")
  MOV    rax,_S600
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateSubFramebuffer_],rax
; glMultiDrawArraysIndirect_ = GPA("glMultiDrawArraysIndirect")
  MOV    rax,_S601
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawArraysIndirect_],rax
; glMultiDrawElementsIndirect_ = GPA("glMultiDrawElementsIndirect")
  MOV    rax,_S602
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawElementsIndirect_],rax
; glGetProgramInterfaceiv_ = GPA("glGetProgramInterfaceiv")
  MOV    rax,_S603
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramInterfaceiv_],rax
; glGetProgramResourceIndex_ = GPA("glGetProgramResourceIndex")
  MOV    rax,_S604
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramResourceIndex_],rax
; glGetProgramResourceName_ = GPA("glGetProgramResourceName")
  MOV    rax,_S605
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramResourceName_],rax
; glGetProgramResourceiv_ = GPA("glGetProgramResourceiv")
  MOV    rax,_S606
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramResourceiv_],rax
; glGetProgramResourceLocation_ = GPA("glGetProgramResourceLocation")
  MOV    rax,_S607
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramResourceLocation_],rax
; glGetProgramResourceLocationIndex_ = GPA("glGetProgramResourceLocationIndex")
  MOV    rax,_S608
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetProgramResourceLocationIndex_],rax
; glShaderStorageBlockBinding_ = GPA("glShaderStorageBlockBinding")
  MOV    rax,_S609
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glShaderStorageBlockBinding_],rax
; glTexBufferRange_ = GPA("glTexBufferRange")
  MOV    rax,_S610
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexBufferRange_],rax
; glTexStorage2DMultisample_ = GPA("glTexStorage2DMultisample")
  MOV    rax,_S611
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexStorage2DMultisample_],rax
; glTexStorage3DMultisample_ = GPA("glTexStorage3DMultisample")
  MOV    rax,_S612
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTexStorage3DMultisample_],rax
; glTextureView_ = GPA("glTextureView")
  MOV    rax,_S613
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureView_],rax
; glBindVertexBuffer_ = GPA("glBindVertexBuffer")
  MOV    rax,_S614
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindVertexBuffer_],rax
; glVertexAttribFormat_ = GPA("glVertexAttribFormat")
  MOV    rax,_S615
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribFormat_],rax
; glVertexAttribIFormat_ = GPA("glVertexAttribIFormat")
  MOV    rax,_S616
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribIFormat_],rax
; glVertexAttribLFormat_ = GPA("glVertexAttribLFormat")
  MOV    rax,_S617
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribLFormat_],rax
; glVertexAttribBinding_ = GPA("glVertexAttribBinding")
  MOV    rax,_S618
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexAttribBinding_],rax
; glVertexBindingDivisor_ = GPA("glVertexBindingDivisor")
  MOV    rax,_S619
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexBindingDivisor_],rax
; glDebugMessageControl_ = GPA("glDebugMessageControl")
  MOV    rax,_S620
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDebugMessageControl_],rax
; glDebugMessageInsert_ = GPA("glDebugMessageInsert")
  MOV    rax,_S621
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDebugMessageInsert_],rax
; glDebugMessageCallback_ = GPA("glDebugMessageCallback")
  MOV    rax,_S622
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDebugMessageCallback_],rax
; glGetDebugMessageLog_ = GPA("glGetDebugMessageLog")
  MOV    rax,_S623
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetDebugMessageLog_],rax
; glPushDebugGroup_ = GPA("glPushDebugGroup")
  MOV    rax,_S624
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPushDebugGroup_],rax
; glPopDebugGroup_ = GPA("glPopDebugGroup")
  MOV    rax,_S625
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPopDebugGroup_],rax
; glObjectLabel_ = GPA("glObjectLabel")
  MOV    rax,_S626
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glObjectLabel_],rax
; glGetObjectLabel_ = GPA("glGetObjectLabel")
  MOV    rax,_S627
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetObjectLabel_],rax
; glObjectPtrLabel_ = GPA("glObjectPtrLabel")
  MOV    rax,_S628
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glObjectPtrLabel_],rax
; glGetObjectPtrLabel_ = GPA("glGetObjectPtrLabel")
  MOV    rax,_S629
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetObjectPtrLabel_],rax
; EndIf
_EndIf229:
; 
; If glVer >= 440
  MOV    r15,qword [rsp+64]
  CMP    r15,440
  JL    _EndIf231
; 
; GLLOAD\glver$ = "440"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S630
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glBufferStorage_ = GPA("glBufferStorage")
  MOV    rax,_S631
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBufferStorage_],rax
; glClearTexImage_ = GPA("glClearTexImage")
  MOV    rax,_S632
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearTexImage_],rax
; glClearTexSubImage_ = GPA("glClearTexSubImage")
  MOV    rax,_S633
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearTexSubImage_],rax
; glBindBuffersBase_ = GPA("glBindBuffersBase")
  MOV    rax,_S634
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindBuffersBase_],rax
; glBindBuffersRange_ = GPA("glBindBuffersRange")
  MOV    rax,_S635
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindBuffersRange_],rax
; glBindTextures_ = GPA("glBindTextures")
  MOV    rax,_S636
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindTextures_],rax
; glBindSamplers_ = GPA("glBindSamplers")
  MOV    rax,_S637
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindSamplers_],rax
; glBindImageTextures_ = GPA("glBindImageTextures")
  MOV    rax,_S638
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindImageTextures_],rax
; glBindVertexBuffers_ = GPA("glBindVertexBuffers")
  MOV    rax,_S639
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindVertexBuffers_],rax
; EndIf
_EndIf231:
; 
; If glVer >= 450
  MOV    r15,qword [rsp+64]
  CMP    r15,450
  JL    _EndIf233
; 
; GLLOAD\glver$ = "450"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S640
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glClipControl_ = GPA("glClipControl")
  MOV    rax,_S641
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClipControl_],rax
; glCreateTransformFeedbacks_ = GPA("glCreateTransformFeedbacks")
  MOV    rax,_S642
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateTransformFeedbacks_],rax
; glTransformFeedbackBufferBase_ = GPA("glTransformFeedbackBufferBase")
  MOV    rax,_S643
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTransformFeedbackBufferBase_],rax
; glTransformFeedbackBufferRange_ = GPA("glTransformFeedbackBufferRange")
  MOV    rax,_S644
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTransformFeedbackBufferRange_],rax
; glGetTransformFeedbackiv_ = GPA("glGetTransformFeedbackiv")
  MOV    rax,_S645
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTransformFeedbackiv_],rax
; glGetTransformFeedbacki_v_ = GPA("glGetTransformFeedbacki_v")
  MOV    rax,_S646
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTransformFeedbacki_v_],rax
; glGetTransformFeedbacki64_v_ = GPA("glGetTransformFeedbacki64_v")
  MOV    rax,_S647
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTransformFeedbacki64_v_],rax
; glCreateBuffers_ = GPA("glCreateBuffers")
  MOV    rax,_S648
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateBuffers_],rax
; glNamedBufferStorage_ = GPA("glNamedBufferStorage")
  MOV    rax,_S649
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedBufferStorage_],rax
; glNamedBufferData_ = GPA("glNamedBufferData")
  MOV    rax,_S650
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedBufferData_],rax
; glNamedBufferSubData_ = GPA("glNamedBufferSubData")
  MOV    rax,_S651
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedBufferSubData_],rax
; glCopyNamedBufferSubData_ = GPA("glCopyNamedBufferSubData")
  MOV    rax,_S652
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyNamedBufferSubData_],rax
; glClearNamedBufferData_ = GPA("glClearNamedBufferData")
  MOV    rax,_S653
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedBufferData_],rax
; glClearNamedBufferSubData_ = GPA("glClearNamedBufferSubData")
  MOV    rax,_S654
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedBufferSubData_],rax
; glMapNamedBuffer_ = GPA("glMapNamedBuffer")
  MOV    rax,_S655
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMapNamedBuffer_],rax
; glMapNamedBufferRange_ = GPA("glMapNamedBufferRange")
  MOV    rax,_S656
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMapNamedBufferRange_],rax
; glUnmapNamedBuffer_ = GPA("glUnmapNamedBuffer")
  MOV    rax,_S657
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glUnmapNamedBuffer_],rax
; glFlushMappedNamedBufferRange_ = GPA("glFlushMappedNamedBufferRange")
  MOV    rax,_S658
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glFlushMappedNamedBufferRange_],rax
; glGetNamedBufferParameteriv_ = GPA("glGetNamedBufferParameteriv")
  MOV    rax,_S659
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedBufferParameteriv_],rax
; glGetNamedBufferParameteri64v_ = GPA("glGetNamedBufferParameteri64v")
  MOV    rax,_S660
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedBufferParameteri64v_],rax
; glGetNamedBufferPointerv_ = GPA("glGetNamedBufferPointerv")
  MOV    rax,_S661
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedBufferPointerv_],rax
; glGetNamedBufferSubData_ = GPA("glGetNamedBufferSubData")
  MOV    rax,_S662
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedBufferSubData_],rax
; glCreateFramebuffers_ = GPA("glCreateFramebuffers")
  MOV    rax,_S663
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateFramebuffers_],rax
; glNamedFramebufferRenderbuffer_ = GPA("glNamedFramebufferRenderbuffer")
  MOV    rax,_S664
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferRenderbuffer_],rax
; glNamedFramebufferParameteri_ = GPA("glNamedFramebufferParameteri")
  MOV    rax,_S665
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferParameteri_],rax
; glNamedFramebufferTexture_ = GPA("glNamedFramebufferTexture")
  MOV    rax,_S666
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferTexture_],rax
; glNamedFramebufferTextureLayer_ = GPA("glNamedFramebufferTextureLayer")
  MOV    rax,_S667
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferTextureLayer_],rax
; glNamedFramebufferDrawBuffer_ = GPA("glNamedFramebufferDrawBuffer")
  MOV    rax,_S668
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferDrawBuffer_],rax
; glNamedFramebufferDrawBuffers_ = GPA("glNamedFramebufferDrawBuffers")
  MOV    rax,_S669
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferDrawBuffers_],rax
; glNamedFramebufferReadBuffer_ = GPA("glNamedFramebufferReadBuffer")
  MOV    rax,_S670
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedFramebufferReadBuffer_],rax
; glInvalidateNamedFramebufferData_ = GPA("glInvalidateNamedFramebufferData")
  MOV    rax,_S671
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateNamedFramebufferData_],rax
; glInvalidateNamedFramebufferSubData_ = GPA("glInvalidateNamedFramebufferSubData")
  MOV    rax,_S672
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glInvalidateNamedFramebufferSubData_],rax
; glClearNamedFramebufferiv_ = GPA("glClearNamedFramebufferiv")
  MOV    rax,_S673
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedFramebufferiv_],rax
; glClearNamedFramebufferuiv_ = GPA("glClearNamedFramebufferuiv")
  MOV    rax,_S674
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedFramebufferuiv_],rax
; glClearNamedFramebufferfv_ = GPA("glClearNamedFramebufferfv")
  MOV    rax,_S675
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedFramebufferfv_],rax
; glClearNamedFramebufferfi_ = GPA("glClearNamedFramebufferfi")
  MOV    rax,_S676
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glClearNamedFramebufferfi_],rax
; glBlitNamedFramebuffer_ = GPA("glBlitNamedFramebuffer")
  MOV    rax,_S677
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBlitNamedFramebuffer_],rax
; glCheckNamedFramebufferStatus_ = GPA("glCheckNamedFramebufferStatus")
  MOV    rax,_S678
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCheckNamedFramebufferStatus_],rax
; glGetNamedFramebufferParameteriv_ = GPA("glGetNamedFramebufferParameteriv")
  MOV    rax,_S679
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedFramebufferParameteriv_],rax
; glGetNamedFramebufferAttachmentParameteriv_ = GPA("glGetNamedFramebufferAttachmentParameteriv")
  MOV    rax,_S680
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedFramebufferAttachmentParameteriv_],rax
; glCreateRenderbuffers_ = GPA("glCreateRenderbuffers")
  MOV    rax,_S681
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateRenderbuffers_],rax
; glNamedRenderbufferStorage_ = GPA("glNamedRenderbufferStorage")
  MOV    rax,_S682
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedRenderbufferStorage_],rax
; glNamedRenderbufferStorageMultisample_ = GPA("glNamedRenderbufferStorageMultisample")
  MOV    rax,_S683
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glNamedRenderbufferStorageMultisample_],rax
; glGetNamedRenderbufferParameteriv_ = GPA("glGetNamedRenderbufferParameteriv")
  MOV    rax,_S684
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetNamedRenderbufferParameteriv_],rax
; glCreateTextures_ = GPA("glCreateTextures")
  MOV    rax,_S685
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateTextures_],rax
; glTextureBuffer_ = GPA("glTextureBuffer")
  MOV    rax,_S686
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureBuffer_],rax
; glTextureBufferRange_ = GPA("glTextureBufferRange")
  MOV    rax,_S687
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureBufferRange_],rax
; glTextureStorage1D_ = GPA("glTextureStorage1D")
  MOV    rax,_S688
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureStorage1D_],rax
; glTextureStorage2D_ = GPA("glTextureStorage2D")
  MOV    rax,_S689
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureStorage2D_],rax
; glTextureStorage3D_ = GPA("glTextureStorage3D")
  MOV    rax,_S690
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureStorage3D_],rax
; glTextureStorage2DMultisample_ = GPA("glTextureStorage2DMultisample")
  MOV    rax,_S691
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureStorage2DMultisample_],rax
; glTextureStorage3DMultisample_ = GPA("glTextureStorage3DMultisample")
  MOV    rax,_S692
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureStorage3DMultisample_],rax
; glTextureSubImage1D_ = GPA("glTextureSubImage1D")
  MOV    rax,_S693
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureSubImage1D_],rax
; glTextureSubImage2D_ = GPA("glTextureSubImage2D")
  MOV    rax,_S694
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureSubImage2D_],rax
; glTextureSubImage3D_ = GPA("glTextureSubImage3D")
  MOV    rax,_S695
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureSubImage3D_],rax
; glCompressedTextureSubImage1D_ = GPA("glCompressedTextureSubImage1D")
  MOV    rax,_S696
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTextureSubImage1D_],rax
; glCompressedTextureSubImage2D_ = GPA("glCompressedTextureSubImage2D")
  MOV    rax,_S697
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTextureSubImage2D_],rax
; glCompressedTextureSubImage3D_ = GPA("glCompressedTextureSubImage3D")
  MOV    rax,_S698
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCompressedTextureSubImage3D_],rax
; glCopyTextureSubImage1D_ = GPA("glCopyTextureSubImage1D")
  MOV    rax,_S699
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyTextureSubImage1D_],rax
; glCopyTextureSubImage2D_ = GPA("glCopyTextureSubImage2D")
  MOV    rax,_S700
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyTextureSubImage2D_],rax
; glCopyTextureSubImage3D_ = GPA("glCopyTextureSubImage3D")
  MOV    rax,_S701
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCopyTextureSubImage3D_],rax
; glTextureParameterf_ = GPA("glTextureParameterf")
  MOV    rax,_S702
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameterf_],rax
; glTextureParameterfv_ = GPA("glTextureParameterfv")
  MOV    rax,_S703
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameterfv_],rax
; glTextureParameteri_ = GPA("glTextureParameteri")
  MOV    rax,_S704
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameteri_],rax
; glTextureParameterIiv_ = GPA("glTextureParameterIiv")
  MOV    rax,_S705
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameterIiv_],rax
; glTextureParameterIuiv_ = GPA("glTextureParameterIuiv")
  MOV    rax,_S706
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameterIuiv_],rax
; glTextureParameteriv_ = GPA("glTextureParameteriv")
  MOV    rax,_S707
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureParameteriv_],rax
; glGenerateTextureMipmap_ = GPA("glGenerateTextureMipmap")
  MOV    rax,_S708
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGenerateTextureMipmap_],rax
; glBindTextureUnit_ = GPA("glBindTextureUnit")
  MOV    rax,_S709
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glBindTextureUnit_],rax
; glGetTextureImage_ = GPA("glGetTextureImage")
  MOV    rax,_S710
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureImage_],rax
; glGetCompressedTextureImage_ = GPA("glGetCompressedTextureImage")
  MOV    rax,_S711
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetCompressedTextureImage_],rax
; glGetTextureLevelParameterfv_ = GPA("glGetTextureLevelParameterfv")
  MOV    rax,_S712
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureLevelParameterfv_],rax
; glGetTextureLevelParameteriv_ = GPA("glGetTextureLevelParameteriv")
  MOV    rax,_S713
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureLevelParameteriv_],rax
; glGetTextureParameterfv_ = GPA("glGetTextureParameterfv")
  MOV    rax,_S714
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureParameterfv_],rax
; glGetTextureParameterIiv_ = GPA("glGetTextureParameterIiv")
  MOV    rax,_S715
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureParameterIiv_],rax
; glGetTextureParameterIuiv_ = GPA("glGetTextureParameterIuiv")
  MOV    rax,_S716
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureParameterIuiv_],rax
; glGetTextureParameteriv_ = GPA("glGetTextureParameteriv")
  MOV    rax,_S717
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureParameteriv_],rax
; glCreateVertexArrays_ = GPA("glCreateVertexArrays")
  MOV    rax,_S718
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateVertexArrays_],rax
; glDisableVertexArrayAttrib_ = GPA("glDisableVertexArrayAttrib")
  MOV    rax,_S719
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glDisableVertexArrayAttrib_],rax
; glEnableVertexArrayAttrib_ = GPA("glEnableVertexArrayAttrib")
  MOV    rax,_S720
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glEnableVertexArrayAttrib_],rax
; glVertexArrayElementBuffer_ = GPA("glVertexArrayElementBuffer")
  MOV    rax,_S721
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayElementBuffer_],rax
; glVertexArrayVertexBuffer_ = GPA("glVertexArrayVertexBuffer")
  MOV    rax,_S722
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayVertexBuffer_],rax
; glVertexArrayVertexBuffers_ = GPA("glVertexArrayVertexBuffers")
  MOV    rax,_S723
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayVertexBuffers_],rax
; glVertexArrayAttribBinding_ = GPA("glVertexArrayAttribBinding")
  MOV    rax,_S724
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayAttribBinding_],rax
; glVertexArrayAttribFormat_ = GPA("glVertexArrayAttribFormat")
  MOV    rax,_S725
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayAttribFormat_],rax
; glVertexArrayAttribIFormat_ = GPA("glVertexArrayAttribIFormat")
  MOV    rax,_S726
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayAttribIFormat_],rax
; glVertexArrayAttribLFormat_ = GPA("glVertexArrayAttribLFormat")
  MOV    rax,_S727
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayAttribLFormat_],rax
; glVertexArrayBindingDivisor_ = GPA("glVertexArrayBindingDivisor")
  MOV    rax,_S728
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glVertexArrayBindingDivisor_],rax
; glGetVertexArrayiv_ = GPA("glGetVertexArrayiv")
  MOV    rax,_S729
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexArrayiv_],rax
; glGetVertexArrayIndexediv_ = GPA("glGetVertexArrayIndexediv")
  MOV    rax,_S730
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexArrayIndexediv_],rax
; glGetVertexArrayIndexed64iv_ = GPA("glGetVertexArrayIndexed64iv")
  MOV    rax,_S731
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetVertexArrayIndexed64iv_],rax
; glCreateSamplers_ = GPA("glCreateSamplers")
  MOV    rax,_S732
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateSamplers_],rax
; glCreateProgramPipelines_ = GPA("glCreateProgramPipelines")
  MOV    rax,_S733
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateProgramPipelines_],rax
; glCreateQueries_ = GPA("glCreateQueries")
  MOV    rax,_S734
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glCreateQueries_],rax
; glGetQueryBufferObjecti64v_ = GPA("glGetQueryBufferObjecti64v")
  MOV    rax,_S735
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryBufferObjecti64v_],rax
; glGetQueryBufferObjectiv_ = GPA("glGetQueryBufferObjectiv")
  MOV    rax,_S736
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryBufferObjectiv_],rax
; glGetQueryBufferObjectui64v_ = GPA("glGetQueryBufferObjectui64v")
  MOV    rax,_S737
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryBufferObjectui64v_],rax
; glGetQueryBufferObjectuiv_ = GPA("glGetQueryBufferObjectuiv")
  MOV    rax,_S738
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetQueryBufferObjectuiv_],rax
; glMemoryBarrierByRegion_ = GPA("glMemoryBarrierByRegion")
  MOV    rax,_S739
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMemoryBarrierByRegion_],rax
; glGetTextureSubImage_ = GPA("glGetTextureSubImage")
  MOV    rax,_S740
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetTextureSubImage_],rax
; glGetCompressedTextureSubImage_ = GPA("glGetCompressedTextureSubImage")
  MOV    rax,_S741
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetCompressedTextureSubImage_],rax
; glGetGraphicsResetStatus_ = GPA("glGetGraphicsResetStatus")
  MOV    rax,_S742
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetGraphicsResetStatus_],rax
; glGetnCompressedTexImage_ = GPA("glGetnCompressedTexImage")
  MOV    rax,_S743
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnCompressedTexImage_],rax
; glGetnTexImage_ = GPA("glGetnTexImage")
  MOV    rax,_S744
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnTexImage_],rax
; glGetnUniformdv_ = GPA("glGetnUniformdv")
  MOV    rax,_S745
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnUniformdv_],rax
; glGetnUniformfv_ = GPA("glGetnUniformfv")
  MOV    rax,_S746
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnUniformfv_],rax
; glGetnUniformiv_ = GPA("glGetnUniformiv")
  MOV    rax,_S747
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnUniformiv_],rax
; glGetnUniformuiv_ = GPA("glGetnUniformuiv")
  MOV    rax,_S748
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnUniformuiv_],rax
; glReadnPixels_ = GPA("glReadnPixels")
  MOV    rax,_S749
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glReadnPixels_],rax
; glGetnMapdv_ = GPA("glGetnMapdv")
  MOV    rax,_S750
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnMapdv_],rax
; glGetnMapfv_ = GPA("glGetnMapfv")
  MOV    rax,_S751
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnMapfv_],rax
; glGetnMapiv_ = GPA("glGetnMapiv")
  MOV    rax,_S752
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnMapiv_],rax
; glGetnPixelMapfv_ = GPA("glGetnPixelMapfv")
  MOV    rax,_S753
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnPixelMapfv_],rax
; glGetnPixelMapuiv_ = GPA("glGetnPixelMapuiv")
  MOV    rax,_S754
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnPixelMapuiv_],rax
; glGetnPixelMapusv_ = GPA("glGetnPixelMapusv")
  MOV    rax,_S755
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnPixelMapusv_],rax
; glGetnPolygonStipple_ = GPA("glGetnPolygonStipple")
  MOV    rax,_S756
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnPolygonStipple_],rax
; glGetnColorTable_ = GPA("glGetnColorTable")
  MOV    rax,_S757
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnColorTable_],rax
; glGetnConvolutionFilter_ = GPA("glGetnConvolutionFilter")
  MOV    rax,_S758
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnConvolutionFilter_],rax
; glGetnSeparableFilter_ = GPA("glGetnSeparableFilter")
  MOV    rax,_S759
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnSeparableFilter_],rax
; glGetnHistogram_ = GPA("glGetnHistogram")
  MOV    rax,_S760
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnHistogram_],rax
; glGetnMinmax_ = GPA("glGetnMinmax")
  MOV    rax,_S761
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glGetnMinmax_],rax
; glTextureBarrier_ = GPA("glTextureBarrier")
  MOV    rax,_S762
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glTextureBarrier_],rax
; EndIf
_EndIf233:
; 
; If glVer >= 460
  MOV    r15,qword [rsp+64]
  CMP    r15,460
  JL    _EndIf235
; 
; GLLOAD\glver$ = "460"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S763
  LEA    rcx,[rbp]
  CALL   SYS_FastAllocateStringFree4
; glSpecializeShader_ = GPA("glSpecializeShader")
  MOV    rax,_S764
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glSpecializeShader_],rax
; glMultiDrawArraysIndirectCount_ = GPA("glMultiDrawArraysIndirectCount")
  MOV    rax,_S765
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawArraysIndirectCount_],rax
; glMultiDrawElementsIndirectCount_ = GPA("glMultiDrawElementsIndirectCount")
  MOV    rax,_S766
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glMultiDrawElementsIndirectCount_],rax
; glPolygonOffsetClamp_ = GPA("glPolygonOffsetClamp")   
  MOV    rax,_S767
  PUSH   rax
  POP    rcx
  CALL  _Procedure2510
  MOV    qword [gl.v_glPolygonOffsetClamp_],rax
; EndIf
_EndIf235:
; 
; If GLLOAD\MissingProcsCount = 0 
  LEA    rbp,[glload.v_GLLOAD]
  MOV    r15,qword [rbp+16]
  AND    r15,r15
  JNE   _EndIf237
; GLLOAD\ErrMsg$ = "OK"
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S768
  LEA    rcx,[rbp+8]
  CALL   SYS_FastAllocateStringFree4
; ProcedureReturn 1
  MOV    rax,1
  JMP   _EndProcedure2505
; EndIf
_EndIf237:
; 
; GLLOAD\ErrMsg$ = "Some functions entry point were not found."    
  LEA    rbp,[glload.v_GLLOAD]
  MOV    rdx,_S769
  LEA    rcx,[rbp+8]
  CALL   SYS_FastAllocateStringFree4
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure2505
; EndProcedure
_EndProcedureZero2505:
  XOR    rax,rax
_EndProcedure2505:
  ADD    rsp,80
  POP    r14
  POP    r15
  POP    rbp
  RET
; Procedure ClearGlErrors()
_Procedure2512:
  PUSH   r15
  PS2512=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected glerr
; Protected safe_bailout = 255
  MOV    qword [rsp+48],255
; 
; Repeat
_Repeat175:
; glerr = glGetError_()
  CALL   glGetError
  MOV    qword [rsp+40],rax
; safe_bailout - 1
  MOV    r15,qword [rsp+48]
  DEC    r15
  MOV    qword [rsp+48],r15
; Until (glerr = #GL_NO_ERROR) Or (safe_bailout = 0)
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JE     Ok9
  MOV    r15,qword [rsp+48]
  AND    r15,r15
  JE     Ok9
  JMP    No9
Ok9:
  MOV    rax,1
  JMP    End9
No9:
  XOR    rax,rax
End9:
  AND    rax,rax
  JE    _Repeat175
_Until175:
; 
; If glerr <> #GL_NO_ERROR
  MOV    r15,qword [rsp+40]
  AND    r15,r15
  JE    _EndIf177
; DebuggerError("glGetError() inside an infinite loop (no current context ?)")    
; EndIf    
_EndIf177:
; EndProcedure
_EndProcedureZero2513:
  XOR    rax,rax
_EndProcedure2513:
  ADD    rsp,64
  POP    r15
  RET
; Procedure.i Deprecated()
_Procedure2496:
  PUSH   r15
  PS2496=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected mask, flags
; 
; ClearGlErrors()
  CALL  _Procedure2512
; 
; glGetIntegerv_(#GL_CONTEXT_FLAGS, @flags)
  LEA    rax,[rsp+48]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 33310
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
; 
; If glGetError_() <> #GL_NO_ERROR
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf185
; ProcedureReturn 1 
  MOV    rax,1
  JMP   _EndProcedure2497
; EndIf
_EndIf185:
; 
; If (flags & #GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT)
  MOV    r15,qword [rsp+48]
  AND    r15,1
  AND    r15,r15
  JE    _EndIf187
; ProcedureReturn 0 
  XOR    rax,rax
  JMP   _EndProcedure2497
; EndIf
_EndIf187:
; 
; glGetIntegerv_(#GL_CONTEXT_PROFILE_MASK, @mask) 
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 37158
  POP    rcx
  POP    rdx
  CALL   glGetIntegerv
; 
; If glGetError_() <> #GL_NO_ERROR
  CALL   glGetError
  MOV    r15,rax
  AND    r15,r15
  JE    _EndIf189
; ProcedureReturn 1 
  MOV    rax,1
  JMP   _EndProcedure2497
; EndIf
_EndIf189:
; 
; If (mask & #GL_CONTEXT_CORE_PROFILE_BIT)
  MOV    r15,qword [rsp+40]
  AND    r15,1
  AND    r15,r15
  JE    _EndIf191
; ProcedureReturn 0 
  XOR    rax,rax
  JMP   _EndProcedure2497
; EndIf
_EndIf191:
; 
; If (mask & #GL_CONTEXT_COMPATIBILITY_PROFILE_BIT)
  MOV    r15,qword [rsp+40]
  AND    r15,2
  AND    r15,r15
  JE    _EndIf193
; ProcedureReturn 1 
  MOV    rax,1
  JMP   _EndProcedure2497
; EndIf
_EndIf193:
; EndProcedure
_EndProcedureZero2497:
  XOR    rax,rax
_EndProcedure2497:
  ADD    rsp,64
  POP    r15
  RET
; Procedure RegisterCallBack (type, *fp)
_Procedure2502:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS2502=64
  SUB    rsp,40
; 
; Select type
  PUSH   qword [rsp+PS2502+0]
; Case #CallBack_GetProcAddress
  XOR    r15,r15
  CMP    r15,[rsp]
  JNE   _Case69
; GLLOAD\CallBack_GetProcAddress = *fp
  PUSH   qword [rsp+PS2502+16]
  LEA    rbp,[glload.v_GLLOAD]
  POP    rax
  MOV    qword [rbp+32],rax
; Case #CallBack_EnumFuncs
  JMP   _EndSelect7
_Case69:
  MOV    r15,1
  CMP    r15,[rsp]
  JNE   _Case70
; GLLOAD\CallBack_EnumerateProcs = *fp
  PUSH   qword [rsp+PS2502+16]
  LEA    rbp,[glload.v_GLLOAD]
  POP    rax
  MOV    qword [rbp+40],rax
; EndSelect
_Case70:
_EndSelect7:
  ADD    rsp,8
; EndProcedure
_EndProcedureZero2503:
  XOR    rax,rax
_EndProcedure2503:
  ADD    rsp,40
  POP    r15
  POP    rbp
  RET
; Procedure Multiply (*QuatA.quat, *QuatB.quat, *MultipliedQuat.quat)
_Procedure2672:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PUSH   r15
  PS2672=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; Protected.quat TempQuat, *q
; 
; If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
  MOV    r15,qword [rsp+PS2672+0]
  CMP    r15,qword [rsp+PS2672+16]
  JE     Ok18
  MOV    r15,qword [rsp+PS2672+8]
  CMP    r15,qword [rsp+PS2672+16]
  JE     Ok18
  JMP    No18
Ok18:
  MOV    rax,1
  JMP    End18
No18:
  XOR    rax,rax
End18:
  AND    rax,rax
  JE    _EndIf269
; *q = @TempQuat
  LEA    rax,[rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rax
  MOV    qword [rsp+56],rax
; Else
  JMP   _EndIf268
_EndIf269:
; *q = *MultipliedQuat
  PUSH   qword [rsp+PS2672+16]
  POP    rax
  MOV    qword [rsp+56],rax
; EndIf
_EndIf268:
; 
; *q\q0 = *QuatB\q0 * *QuatA\q0 - *QuatB\q1 * *QuatA\q1 - *QuatB\q2 * *QuatA\q2 - *QuatB\q3 * *QuatA\q3 
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+4]
  FSUBP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+8]
  FSUBP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+12]
  FSUBP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp]
; *q\q1 = *QuatB\q0 * *QuatA\q1 + *QuatB\q1 * *QuatA\q0 - *QuatB\q2 * *QuatA\q3 + *QuatB\q3 * *QuatA\q2
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+4]
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+12]
  FSUBP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+4]
; *q\q2 = *QuatB\q0 * *QuatA\q2 + *QuatB\q1 * *QuatA\q3 + *QuatB\q2 * *QuatA\q0 - *QuatB\q3 * *QuatA\q1 
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+8]
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+4]
  FSUBP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+8]
; *q\q3 = *QuatB\q0 * *QuatA\q3 - *QuatB\q1 * *QuatA\q2 + *QuatB\q2 * *QuatA\q1 + *QuatB\q3 * *QuatA\q0 
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+12]
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+8]
  FSUBP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2672+8]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2672+0]
  FMUL   dword [rbp]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+12]
; 
; If *QuatA = *MultipliedQuat Or *QuatB = *MultipliedQuat
  MOV    r15,qword [rsp+PS2672+0]
  CMP    r15,qword [rsp+PS2672+16]
  JE     Ok19
  MOV    r15,qword [rsp+PS2672+8]
  CMP    r15,qword [rsp+PS2672+16]
  JE     Ok19
  JMP    No19
Ok19:
  MOV    rax,1
  JMP    End19
No19:
  XOR    rax,rax
End19:
  AND    rax,rax
  JE    _EndIf272
; Copy(*q, *MultipliedQuat )
  PUSH   qword [rsp+PS2672+16]
  PUSH   qword [rsp+64]
  POP    rcx
  POP    rdx
  CALL  _Procedure2666
; EndIf
_EndIf272:
; EndProcedure
_EndProcedureZero2673:
  XOR    rax,rax
_EndProcedure2673:
  ADD    rsp,72
  POP    r15
  POP    rbp
  RET
; Procedure Set (*Quat.quat, q0.f, q1.f, q2.f, q3.f)
_Procedure2662:
  MOV    qword [rsp+8],rcx
  MOVSS  dword [rsp+16],xmm1
  MOVSS  dword [rsp+24],xmm2
  MOVSS  dword [rsp+32],xmm3
  PUSH   rbp
  PS2662=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; *Quat\q0 = q0
  FLD    dword [rsp+PS2662+8]
  MOV    rbp,qword [rsp+PS2662+0]
  FSTP   dword [rbp]
; *Quat\q1 = q1
  FLD    dword [rsp+PS2662+16]
  MOV    rbp,qword [rsp+PS2662+0]
  FSTP   dword [rbp+4]
; *Quat\q2 = q2
  FLD    dword [rsp+PS2662+24]
  MOV    rbp,qword [rsp+PS2662+0]
  FSTP   dword [rbp+8]
; *Quat\q3 = q3
  FLD    dword [rsp+PS2662+32]
  MOV    rbp,qword [rsp+PS2662+0]
  FSTP   dword [rbp+12]
; EndProcedure
_EndProcedureZero2663:
  XOR    rax,rax
_EndProcedure2663:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Conjugate (*Quat.quat, *ConjugateQuat.quat)
_Procedure2668:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2668=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; 
; *ConjugateQuat\q0 =  *Quat\q0  
  MOV    rbp,qword [rsp+PS2668+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2668+8]
  FSTP   dword [rbp]
; *ConjugateQuat\q1 = -*Quat\q1  
  MOV    rbp,qword [rsp+PS2668+0]
  FLD    dword [rbp+4]
  FCHS
  MOV    rbp,qword [rsp+PS2668+8]
  FSTP   dword [rbp+4]
; *ConjugateQuat\q2 = -*Quat\q2  
  MOV    rbp,qword [rsp+PS2668+0]
  FLD    dword [rbp+8]
  FCHS
  MOV    rbp,qword [rsp+PS2668+8]
  FSTP   dword [rbp+8]
; *ConjugateQuat\q3 = -*Quat\q3
  MOV    rbp,qword [rsp+PS2668+0]
  FLD    dword [rbp+12]
  FCHS
  MOV    rbp,qword [rsp+PS2668+8]
  FSTP   dword [rbp+12]
; EndProcedure
_EndProcedureZero2669:
  XOR    rax,rax
_EndProcedure2669:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Normalize (*Quat.quat, *UnitQuat.quat)
_Procedure2670:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PS2670=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; 
; Protected sq_magnitude.f, magnitude.f
; 
; 
; sq_magnitude = *Quat\q0 * *Quat\q0 + *Quat\q1 * *Quat\q1 + *Quat\q2 * *Quat\q2 + *Quat\q3 * *Quat\q3
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2670+0]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2670+0]
  FMUL   dword [rbp+4]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2670+0]
  FMUL   dword [rbp+8]
  FADDP  st1,st0
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2670+0]
  FMUL   dword [rbp+12]
  FADDP  st1,st0
  FADD   dword [F2]
  FSTP   dword [rsp+40]
; 
; If Abs(1.0 - sq_magnitude) < 0.0001
  FLD    dword [rsp+40]
  FCHS
  FADD   qword [D5]
  FABS
  FCOMP  qword [D6]
  FNSTSW ax
  TEST   ah,1h
  JE    _EndIf266
; 
; *UnitQuat\q0 = *Quat\q0
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp]
; *UnitQuat\q1 = *Quat\q1
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+4]
; *UnitQuat\q2 = *Quat\q2
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+8]
; *UnitQuat\q3 = *Quat\q3
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+12]
; Else
  JMP   _EndIf265
_EndIf266:
; 
; magnitude  = Sqr(sq_magnitude)
  FLD    dword [rsp+40]
  FSQRT
  FSTP   dword [rsp+48]
; *UnitQuat\q0 = *Quat\q0 / magnitude
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp]
  FDIV   dword [rsp+48]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp]
; *UnitQuat\q1 = *Quat\q1 / magnitude
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+4]
  FDIV   dword [rsp+48]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+4]
; *UnitQuat\q2 = *Quat\q2 / magnitude
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+8]
  FDIV   dword [rsp+48]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+8]
; *UnitQuat\q3 = *Quat\q3 / magnitude
  MOV    rbp,qword [rsp+PS2670+0]
  FLD    dword [rbp+12]
  FDIV   dword [rsp+48]
  MOV    rbp,qword [rsp+PS2670+8]
  FSTP   dword [rbp+12]
; EndIf
_EndIf265:
; EndProcedure
_EndProcedureZero2671:
  XOR    rax,rax
_EndProcedure2671:
  ADD    rsp,56
  POP    r15
  POP    rbp
  RET
; Procedure Versor (*Quat.quat, *Axis.vec3::vec3, angle.f)
_Procedure2674:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOVSS  dword [rsp+24],xmm2
  PUSH   rbp
  PS2674=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; Protected rad_half_angle.f = angle * #ONE_DEG_IN_RAD / 2.0
  FLD    dword [rsp+PS2674+16]
  FMUL   dword [F5]
  FDIV   dword [F4]
  FSTP   dword [rsp+40]
; 
; *Quat\q0 = Cos(rad_half_angle)
  FLD    dword [rsp+40]
  FCOS
  MOV    rbp,qword [rsp+PS2674+0]
  FSTP   dword [rbp]
; *Quat\q1 = Sin(rad_half_angle) * *Axis\x
  FLD    dword [rsp+40]
  FSIN
  MOV    rbp,qword [rsp+PS2674+8]
  FMUL   dword [rbp]
  MOV    rbp,qword [rsp+PS2674+0]
  FSTP   dword [rbp+4]
; *Quat\q2 = Sin(rad_half_angle) * *Axis\y
  FLD    dword [rsp+40]
  FSIN
  MOV    rbp,qword [rsp+PS2674+8]
  FMUL   dword [rbp+4]
  MOV    rbp,qword [rsp+PS2674+0]
  FSTP   dword [rbp+8]
; *Quat\q3 = Sin(rad_half_angle) * *Axis\z 
  FLD    dword [rsp+40]
  FSIN
  MOV    rbp,qword [rsp+PS2674+8]
  FMUL   dword [rbp+8]
  MOV    rbp,qword [rsp+PS2674+0]
  FSTP   dword [rbp+12]
; 
; Normalize(*Quat, *Quat)
  PUSH   qword [rsp+PS2674+0]
  PUSH   qword [rsp+PS2674+8]
  POP    rcx
  POP    rdx
  CALL  _Procedure2670
; EndProcedure
_EndProcedureZero2675:
  XOR    rax,rax
_EndProcedure2675:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure Copy (*Quat.quat, *DestinationQuat.quat)
_Procedure2666:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PS2666=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; 
; 
; *DestinationQuat\q0 = *Quat\q0
  MOV    rbp,qword [rsp+PS2666+0]
  FLD    dword [rbp]
  MOV    rbp,qword [rsp+PS2666+8]
  FSTP   dword [rbp]
; *DestinationQuat\q1 = *Quat\q1
  MOV    rbp,qword [rsp+PS2666+0]
  FLD    dword [rbp+4]
  MOV    rbp,qword [rsp+PS2666+8]
  FSTP   dword [rbp+4]
; *DestinationQuat\q2 = *Quat\q2
  MOV    rbp,qword [rsp+PS2666+0]
  FLD    dword [rbp+8]
  MOV    rbp,qword [rsp+PS2666+8]
  FSTP   dword [rbp+8]
; *DestinationQuat\q3 = *Quat\q3 
  MOV    rbp,qword [rsp+PS2666+0]
  FLD    dword [rbp+12]
  MOV    rbp,qword [rsp+PS2666+8]
  FSTP   dword [rbp+12]
; EndProcedure
_EndProcedureZero2667:
  XOR    rax,rax
_EndProcedure2667:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.i FindGlyph (*fon.BMFont, charCode)
_Procedure3048:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PS3048=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
; Protected i
; Protected range, rangesCount = ArraySize(*fon\ranges())
  MOV    rbp,qword [rsp+PS3048+0]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+112]
  POP    rcx
  CALL   PB_ArraySize
  MOV    qword [rsp+56],rax
; 
; For range = 0 To rangesCount 
  MOV    qword [rsp+48],0
  JMP   _ForSkipDebug667
_For667:
_ForSkipDebug667:
  MOV    rax,qword [rsp+56]
  CMP    rax,qword [rsp+48]
  JL    _Next668
; If charCode >= *fon\ranges(range)\firstChar And charCode <= *fon\ranges(range)\lastChar
  MOV    r15,qword [rsp+PS3048+8]
  MOV    rbp,qword [rsp+PS3048+0]
  PUSH   rbp
  MOV    r14,qword [rsp+56]
  POP    rbp
  MOV    rbp,qword [rbp+112]
  IMUL   r14,24
  ADD    rbp,r14
  CMP    r15,qword [rbp]
  JL     No27
  MOV    r15,qword [rsp+PS3048+8]
  MOV    rbp,qword [rsp+PS3048+0]
  PUSH   rbp
  MOV    r14,qword [rsp+56]
  POP    rbp
  MOV    rbp,qword [rbp+112]
  IMUL   r14,24
  ADD    rbp,r14
  CMP    r15,qword [rbp+8]
  JG     No27
Ok27:
  MOV    rax,1
  JMP    End27
No27:
  XOR    rax,rax
End27:
  AND    rax,rax
  JE    _EndIf670
; i = charCode - *fon\ranges(range)\firstChar
  MOV    r15,qword [rsp+PS3048+8]
  MOV    rbp,qword [rsp+PS3048+0]
  PUSH   rbp
  MOV    r14,qword [rsp+56]
  POP    rbp
  MOV    rbp,qword [rbp+112]
  IMUL   r14,24
  ADD    rbp,r14
  SUB    r15,qword [rbp]
  MOV    qword [rsp+40],r15
; ProcedureReturn @*fon\ranges(range)\Glyphs(i)
  MOV    rbp,qword [rsp+PS3048+0]
  PUSH   rbp
  MOV    r15,qword [rsp+56]
  POP    rbp
  MOV    rbp,qword [rbp+112]
  IMUL   r15,24
  ADD    rbp,r15
  PUSH   rbp
  MOV    r15,qword [rsp+48]
  POP    rbp
  MOV    rbp,qword [rbp+16]
  IMUL   r15,48
  ADD    rbp,r15
  LEA    rax,[rbp]
  JMP   _EndProcedure3049
; EndIf
_EndIf670:
; Next
_NextContinue668:
  INC    qword [rsp+48]
  JNO   _For667
_Next668:
; 
; ProcedureReturn @*fon\block
  MOV    rbp,qword [rsp+PS3048+0]
  LEA    rax,[rbp+64]
  JMP   _EndProcedure3049
; EndProcedure
_EndProcedureZero3049:
  XOR    rax,rax
_EndProcedure3049:
  ADD    rsp,64
  POP    r14
  POP    r15
  POP    rbp
  RET
; Procedure.i CreateFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width, height)
_Procedure3058:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PUSH   r15
  PS3058=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS3058+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rax,qword [rsp+PS3058+24]
  MOV    qword [rsp+48],rax
; Protected *td.sgl::TexelData
; Protected *bmf.sgl::BitmapFontData
; Protected *fon.BMFont
; Protected texture
; 
; *bmf = sgl::CreateBitmapFontData(fontName$, fontSize, fontFlags, ranges(), width, height)
  PUSH   qword [rsp+PS3058+40]
  PUSH   qword [rsp+PS3058+40]
  MOV    rcx,[rsp+64]
  MOV    rcx,[rsp+64]
  LEA    rax,qword [rcx]
  PUSH   rax
  PUSH   qword [rsp+PS3058+40]
  PUSH   qword [rsp+PS3058+40]
  PUSH   qword [rsp+80]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL  _Procedure2950
  ADD    rsp,48
  MOV    qword [rsp+64],rax
; 
; If (*bmf = 0) : Goto exit: EndIf
  MOV    r15,qword [rsp+64]
  AND    r15,r15
  JNE   _EndIf685
  JMP    rendertext.ll_createfont_exit
_EndIf685:
; 
; *td = sgl::CreateTexelData(*bmf\image)
  MOV    rbp,qword [rsp+64]
  PUSH   qword [rbp+16]
  POP    rcx
  CALL  _Procedure2910
  MOV    qword [rsp+56],rax
; 
; If (*td = 0) : Goto exit: EndIf
  MOV    r15,qword [rsp+56]
  AND    r15,r15
  JNE   _EndIf687
  JMP    rendertext.ll_createfont_exit
_EndIf687:
; 
; *fon = AllocateStructure(BMFont)
  MOV    rax,s_rendertext.bmfont
  PUSH   rax
  PUSH   qword 120
  POP    rcx
  POP    rdx
  CALL   PB_AllocateStructure
  MOV    qword [rsp+72],rax
; 
; If (*fon = 0) : Goto exit: EndIf
  MOV    r15,qword [rsp+72]
  AND    r15,r15
  JNE   _EndIf689
  JMP    rendertext.ll_createfont_exit
_EndIf689:
; 
; glGenTextures_(1, @texture)
  LEA    rax,[rsp+80]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   glGenTextures
; glBindTexture_(#GL_TEXTURE_2D, texture)
  PUSH   qword [rsp+80]
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  CALL   glBindTexture
; 
; glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
  PUSH   qword 33071
  PUSH   qword 10242
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glTexParameteri
; glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
  PUSH   qword 33071
  PUSH   qword 10243
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glTexParameteri
; 
; glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR_MIPMAP_LINEAR)
  PUSH   qword 9987
  PUSH   qword 10241
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glTexParameteri
; glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
  PUSH   qword 9729
  PUSH   qword 10240
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  POP    r8
  CALL   glTexParameteri
; 
; glTexImage2D_(#GL_TEXTURE_2D, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)
  SUB    rsp,8
  MOV    rbp,qword [rsp+64]
  PUSH   qword [rbp+48]
  PUSH   qword 5121
  MOV    rbp,qword [rsp+80]
  PUSH   qword [rbp+24]
  PUSH   qword 0
  MOV    rbp,qword [rsp+96]
  PUSH   qword [rbp+8]
  MOV    rbp,qword [rsp+104]
  PUSH   qword [rbp]
  MOV    rbp,qword [rsp+112]
  PUSH   qword [rbp+32]
  PUSH   qword 0
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   glTexImage2D
  ADD    rsp,80
; glGenerateMipmap_(#GL_TEXTURE_2D)
  PUSH   qword 3553
  POP    rcx
  CALL   qword [gl.v_glGenerateMipmap_]
; 
; *fon\fontName$ = fontName$
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rbp,qword [rsp+80]
  LEA    rcx,[rbp]
  POP    rdx
  CALL   SYS_AllocateString4
; *fon\fontSize = fontSize
  PUSH   qword [rsp+PS3058+8]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+8],rax
; *fon\yOffset = *bmf\yOffset
  MOV    rbp,qword [rsp+64]
  PUSH   qword [rbp+40]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+32],rax
; *fon\texture = texture
  PUSH   qword [rsp+80]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+40],rax
; *fon\textureWidth = *td\imageWidth
  MOV    rbp,qword [rsp+56]
  PUSH   qword [rbp]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+48],rax
; *fon\textureHeight = *td\imageHeight
  MOV    rbp,qword [rsp+56]
  PUSH   qword [rbp+8]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+56],rax
; *fon\italic = *bmf\italic
  MOV    rbp,qword [rsp+64]
  PUSH   qword [rbp+24]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+16],rax
; *fon\bold = *bmf\bold
  MOV    rbp,qword [rsp+64]
  PUSH   qword [rbp+32]
  MOV    rbp,qword [rsp+80]
  POP    rax
  MOV    qword [rbp+24],rax
; 
; CopyArray(*bmf\ranges(), *fon\ranges())
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+112]
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rax
  PUSH   qword [rbp+96]
  POP    rcx
  POP    rdx
  CALL   PB_CopyArray
; 
; CopyStructure(*bmf\block, *fon\block, sgl::GlyphData)
  PUSH   qword 0
  PUSH   qword 48
  MOV    rbp,qword [rsp+88]
  LEA    rax,[rbp+64]
  MOV    rax,rax
  PUSH   rax
  MOV    rbp,qword [rsp+88]
  LEA    rax,[rbp+48]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   PB_CopyStructure
; 
; sgl::DestroyBitmapFontData(*bmf)
  PUSH   qword [rsp+64]
  POP    rcx
  CALL  _Procedure2952
; 
; sgl::DestroyTexelData(*td)
  PUSH   qword [rsp+56]
  POP    rcx
  CALL  _Procedure2912
; 
; ProcedureReturn *fon
  MOV    rax,qword [rsp+72]
  JMP   _EndProcedure3059
; 
; exit:
rendertext.ll_createfont_exit:
; 
; If *bmf : sgl::DestroyBitmapFontData(*bmf) :  EndIf
  CMP    qword [rsp+64],0
  JE    _EndIf691
  PUSH   qword [rsp+64]
  POP    rcx
  CALL  _Procedure2952
_EndIf691:
; 
; If *td : sgl::DestroyTexelData(*td) : EndIf
  CMP    qword [rsp+56],0
  JE    _EndIf693
  PUSH   qword [rsp+56]
  POP    rcx
  CALL  _Procedure2912
_EndIf693:
; 
; If *fon : FreeStructure(*fon) : EndIf
  CMP    qword [rsp+72],0
  JE    _EndIf695
  PUSH   qword [rsp+72]
  POP    rcx
  CALL   PB_FreeStructure
_EndIf695:
; 
; ProcedureReturn 0
  XOR    rax,rax
  JMP   _EndProcedure3059
; EndProcedure
_EndProcedureZero3059:
  XOR    rax,rax
_EndProcedure3059:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,88
  POP    r15
  POP    rbp
  RET
; Procedure Render (win, *fon.BMFont, text$, x, y, *color.vec3::vec3)
_Procedure3054:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   rbp
  PUSH   r15
  PS3054=320
  MOV    rax,32
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rdx,s_sgl.shaderobjects
  LEA    rcx,qword [rsp+184]
  CALL   SYS_InitDynamicStructure
  MOV    rdx,[rsp+PS3054+16]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; Protected *c.Character, *cursorVertex.QuadVertex, *cursorIndices.QuadIndices
; Protected w, h, i, charsCount = Len(text$)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_Len
  MOV    qword [rsp+96],rax
; Protected vertex$, fragment$
; Protected.m4x4::m4x4 projection
; 
; Static vao, vbo, ibo
; Static shader, u_texture, u_color, u_projection
; Static *vertices, *indices, storageCount
; 
; Static firstRun = 1
; 
; If firstRun
  CMP    qword [so_render.rendertext.v_firstRun],0
  JE    _EndIf676
; 
; 
; firstRun = 0
  MOV    qword [so_render.rendertext.v_firstRun],0
; 
; vertex$ = PeekS(?vertex, ?vertex_end - ?vertex, #PB_UTF8)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 2
  MOV    rbp,rendertext.ll_render_vertex_end
  MOV    r15,rbp
  MOV    rbp,rendertext.ll_render_vertex
  SUB    r15,rbp
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,rendertext.ll_render_vertex
  MOV    rax,rbp
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+112]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; fragment$ = PeekS(?fragment, ?fragment_end - ?fragment, #PB_UTF8)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 2
  MOV    rbp,rendertext.ll_render_fragment_end
  MOV    r15,rbp
  MOV    rbp,rendertext.ll_render_fragment
  SUB    r15,rbp
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,rendertext.ll_render_fragment
  MOV    rax,rbp
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_PeekS3
  ADD    rsp,40
  LEA    rcx,[rsp+120]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; 
; glGenVertexArrays_(1, @vao)    
  LEA    rax,[so_render.rendertext.v_vao]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenVertexArrays_]
; 
; 
; glGenBuffers_(1, @vbo)
  LEA    rax,[so_render.rendertext.v_vbo]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenBuffers_]
; 
; 
; glGenBuffers_(1, @ibo)
  LEA    rax,[so_render.rendertext.v_ibo]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword 1
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glGenBuffers_]
; 
; Protected objects.sgl::ShaderObjects
; Protected vs, fs
; 
; vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) 
  PUSH   qword 35633
  PUSH   qword [rsp+112]
  POP    rcx
  POP    rdx
  CALL  _Procedure2954
  MOV    qword [rsp+200],rax
; sgl::AddShaderObject(@objects, vs) 
  PUSH   qword [rsp+200]
  LEA    rax,[rsp+192]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; 
; fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) 
  PUSH   qword 35632
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  CALL  _Procedure2954
  MOV    qword [rsp+208],rax
; sgl::AddShaderObject(@objects, fs) 
  PUSH   qword [rsp+208]
  LEA    rax,[rsp+192]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2958
; 
; shader = sgl::BuildShaderProgram(@objects)
  PUSH   qword 1
  LEA    rax,[rsp+192]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  POP    rdx
  CALL  _Procedure2962
  MOV    qword [so_render.rendertext.v_shader],rax
; ASSERT(shader)
; 
; u_texture = sgl::GetUniformLocation(shader, "u_texture")    
  MOV    rax,_S961
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_shader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [so_render.rendertext.v_u_texture],rax
; ASSERT(u_texture <> -1)
; 
; u_color = sgl::GetUniformLocation(shader, "u_color")    
  MOV    rax,_S962
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_shader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [so_render.rendertext.v_u_color],rax
; ASSERT(u_color <> -1)
; 
; u_projection = sgl::GetUniformLocation(shader, "u_projection")    
  MOV    rax,_S963
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_shader]
  POP    rcx
  POP    rdx
  CALL  _Procedure2968
  MOV    qword [so_render.rendertext.v_u_projection],rax
; ASSERT(u_projection <> -1)
; EndIf
_EndIf676:
; 
; sgl::GetWindowFrameBufferSize (win, @w, @h)
  LEA    rax,[rsp+80]
  MOV    rax,rax
  PUSH   rax
  LEA    rax,[rsp+80]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3054+16]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2862
; 
; If charsCount > storageCount
  MOV    r15,qword [rsp+96]
  CMP    r15,qword [so_render.rendertext.v_storageCount]
  JLE   _EndIf678
; 
; 
; If storageCount
  CMP    qword [so_render.rendertext.v_storageCount],0
  JE    _EndIf680
; 
; FreeMemory(*vertices)
  PUSH   qword [so_render.rendertext.p_vertices]
  POP    rcx
  CALL   PB_FreeMemory
; FreeMemory(*indices)
  PUSH   qword [so_render.rendertext.p_indices]
  POP    rcx
  CALL   PB_FreeMemory
; EndIf
_EndIf680:
; 
; 
; *vertices = AllocateMemory(charsCount * 4 * SizeOf(QuadVertex))
  MOV    r15,qword [rsp+96]
  SAL    r15,2
  SAL    r15,4
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  CALL   PB_AllocateMemory
  MOV    qword [so_render.rendertext.p_vertices],rax
; *indices = AllocateMemory(charsCount * SizeOf(QuadIndices))
  MOV    r15,qword [rsp+96]
  IMUL   r15,24
  MOV    rax,r15
  PUSH   rax
  POP    rcx
  CALL   PB_AllocateMemory
  MOV    qword [so_render.rendertext.p_indices],rax
; storageCount = charsCount
  PUSH   qword [rsp+96]
  POP    rax
  MOV    qword [so_render.rendertext.v_storageCount],rax
; 
; glBindVertexArray_(vao)
  PUSH   qword [so_render.rendertext.v_vao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; 
; 
; glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
  PUSH   qword [so_render.rendertext.v_vbo]
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; 
; glBufferData_(#GL_ARRAY_BUFFER, charsCount * 4 * SizeOf(QuadVertex), #Null, #GL_DYNAMIC_DRAW)
  PUSH   qword 35048
  PUSH   qword 0
  MOV    r15,qword [rsp+112]
  SAL    r15,2
  SAL    r15,4
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferData_]
; 
; glEnableVertexAttribArray_(0) 
  PUSH   qword 0
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(0, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), 0)
  PUSH   qword 0
  PUSH   qword 16
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 2
  PUSH   qword 0
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; glEnableVertexAttribArray_(1) 
  PUSH   qword 1
  POP    rcx
  CALL   qword [gl.v_glEnableVertexAttribArray_]
; glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), OffsetOf(QuadVertex\s))
  PUSH   qword 8
  PUSH   qword 16
  PUSH   qword 0
  PUSH   qword 5126
  PUSH   qword 2
  PUSH   qword 1
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   qword [gl.v_glVertexAttribPointer_]
  ADD    rsp,48
; 
; 
; glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
  PUSH   qword [so_render.rendertext.v_ibo]
  PUSH   qword 34963
  POP    rcx
  POP    rdx
  CALL   qword [gl.v_glBindBuffer_]
; 
; *cursorIndices = *indices
  PUSH   qword [so_render.rendertext.p_indices]
  POP    rax
  MOV    qword [rsp+64],rax
; 
; For i = 0 To charsCount - 1
  MOV    qword [rsp+88],0
  JMP   _ForSkipDebug681
_For681:
_ForSkipDebug681:
  MOV    r15,qword [rsp+96]
  DEC    r15
  CMP    r15,qword [rsp+88]
  JL    _Next682
; *cursorIndices\index[0] = 0 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp],eax
; *cursorIndices\index[1] = 1 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  INC    r15
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp+4],eax
; *cursorIndices\index[2] = 2 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  ADD    r15,2
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp+8],eax
; *cursorIndices\index[3] = 2 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  ADD    r15,2
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp+12],eax
; *cursorIndices\index[4] = 3 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  ADD    r15,3
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp+16],eax
; *cursorIndices\index[5] = 0 + (i * 4)
  MOV    r15,qword [rsp+88]
  SAL    r15,2
  MOV    rax,r15
  PUSH   rax
  MOV    rbp,qword [rsp+72]
  PUSH   rbp
  POP    rbp
  POP    rax
  MOV    dword [rbp+20],eax
; *cursorIndices + SizeOf(QuadIndices)
  MOV    r15,qword [rsp+64]
  ADD    r15,24
  MOV    qword [rsp+64],r15
; Next
_NextContinue682:
  INC    qword [rsp+88]
  JNO   _For681
_Next682:
; 
; 
; glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, charsCount * SizeOf(QuadIndices), *indices, #GL_DYNAMIC_DRAW)
  PUSH   qword 35048
  PUSH   qword [so_render.rendertext.p_indices]
  MOV    r15,qword [rsp+112]
  IMUL   r15,24
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 34963
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferData_]
; EndIf
_EndIf678:
; 
; m4x4::Ortho(projection, 0, w, 0, h, 0.0, 100.0)
  SUB    rsp,8
  FLD    dword [F8]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FILD   qword [rsp+104]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  FILD   qword [rsp+112]
  SUB    rsp,8
  FSTP   dword [rsp]
  FLD    dword [F2]
  SUB    rsp,8
  FSTP   dword [rsp]
  LEA    rax,[rsp+176]
  MOV    rax,rax
  PUSH   rax
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL  _Procedure2658
  ADD    rsp,64
; 
; sgl::BindShaderProgram(shader)
  PUSH   qword [so_render.rendertext.v_shader]
  POP    rcx
  CALL  _Procedure2966
; 
; glActiveTexture_(#GL_TEXTURE0)
  PUSH   qword 33984
  POP    rcx
  CALL   qword [gl.v_glActiveTexture_]
; glBindTexture_(#GL_TEXTURE_2D, *fon\texture) 
  MOV    rbp,qword [rsp+PS3054+8]
  PUSH   qword [rbp+40]
  PUSH   qword 3553
  POP    rcx
  POP    rdx
  CALL   glBindTexture
; 
; glEnable_(#GL_BLEND)
  PUSH   qword 3042
  POP    rcx
  CALL   glEnable
; glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA) 
  PUSH   qword 771
  PUSH   qword 770
  POP    rcx
  POP    rdx
  CALL   glBlendFunc
; 
; sgl::SetUniformLong(u_texture, 0) 
  XOR    rax,rax
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_u_texture]
  POP    rcx
  POP    rdx
  CALL  _Procedure2978
; 
; sgl::SetUniform4Floats(u_color, *color\x, *color\y, *color\z, 1.0)
  SUB    rsp,8
  FLD    dword [F3]
  SUB    rsp,8
  FSTP   dword [rsp]
  MOV    rbp,qword [rsp+PS3054+56]
  MOV    eax,dword [rbp+8]
  PUSH   rax
  MOV    rbp,qword [rsp+PS3054+64]
  MOV    eax,dword [rbp+4]
  PUSH   rax
  MOV    rbp,qword [rsp+PS3054+72]
  MOV    eax,dword [rbp]
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_u_color]
  POP    rcx
  MOVSS  xmm1,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm2,dword [rsp]
  ADD    rsp,8
  MOVSS  xmm3,dword [rsp]
  ADD    rsp,8
  SUB    rsp,32
  CALL  _Procedure2990
  ADD    rsp,48
; 
; sgl::SetUniformMatrix4x4(u_projection, @projection)
  PUSH   qword 1
  LEA    rax,[rsp+128]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [so_render.rendertext.v_u_projection]
  POP    rcx
  POP    rdx
  POP    r8
  CALL  _Procedure2970
; 
; *c = @text$
  MOV    rax,qword [rsp+40]
  MOV    rax,rax
  PUSH   rax
  POP    rax
  MOV    qword [rsp+48],rax
; 
; *cursorVertex = *vertices
  PUSH   qword [so_render.rendertext.p_vertices]
  POP    rax
  MOV    qword [rsp+56],rax
; 
; While *c\c 
_While683:
  MOV    rbp,qword [rsp+48]
  CMP    word [rbp],0
  JE    _Wend683
; Protected *glyph.sgl::GlyphData
; Protected xc, yc, wc, hc
; 
; *glyph = FindGlyph(*fon, *c\c)
  MOV    rbp,qword [rsp+48]
  MOVZX  rax,word [rbp]
  MOV    rax,rax
  PUSH   rax
  PUSH   qword [rsp+PS3054+16]
  POP    rcx
  POP    rdx
  CALL  _Procedure3048
  MOV    qword [rsp+216],rax
; 
; 
; xc = *glyph\x
  MOV    rbp,qword [rsp+216]
  PUSH   qword [rbp+8]
  POP    rax
  MOV    qword [rsp+224],rax
; yc = *glyph\y
  MOV    rbp,qword [rsp+216]
  PUSH   qword [rbp+16]
  POP    rax
  MOV    qword [rsp+232],rax
; wc = *glyph\w
  MOV    rbp,qword [rsp+216]
  PUSH   qword [rbp+24]
  POP    rax
  MOV    qword [rsp+240],rax
; hc = *glyph\h
  MOV    rbp,qword [rsp+216]
  PUSH   qword [rbp+32]
  POP    rax
  MOV    qword [rsp+248],rax
; 
; Protected xf.f, yf.f, wf.f, hf.f
; 
; 
; xf = 1.0 / (*fon\textureWidth / xc)
  MOV    rbp,qword [rsp+PS3054+8]
  FILD   qword [rbp+48]
  FILD   qword [rsp+224]
  FDIVP  st1,st0
  FDIVR  dword [F3]
  FSTP   dword [rsp+256]
; yf = 1.0 - 1.0 / (*fon\textureHeight / yc)
  MOV    rbp,qword [rsp+PS3054+8]
  FILD   qword [rbp+56]
  FILD   qword [rsp+232]
  FDIVP  st1,st0
  FDIVR  dword [F3]
  FCHS
  FADD   dword [F3]
  FSTP   dword [rsp+264]
; wf = 1.0 / (*fon\TextureWidth / (xc + wc))
  MOV    rbp,qword [rsp+PS3054+8]
  FILD   qword [rbp+48]
  FILD   qword [rsp+224]
  FILD   qword [rsp+240]
  FADDP  st1,st0
  FADD   dword [F2]
  FDIVP  st1,st0
  FDIVR  dword [F3]
  FSTP   dword [rsp+272]
; hf = 1.0 - 1.0 / (*fon\TextureHeight / (yc + hc))
  MOV    rbp,qword [rsp+PS3054+8]
  FILD   qword [rbp+56]
  FILD   qword [rsp+232]
  FILD   qword [rsp+248]
  FADDP  st1,st0
  FADD   dword [F2]
  FDIVP  st1,st0
  FDIVR  dword [F3]
  FCHS
  FADD   dword [F3]
  FSTP   dword [rsp+280]
; 
; 
; 
; *cursorVertex\x = x  
  FILD   qword [rsp+PS3054+24]
  PUSH   rax
  FSTP   dword [rsp]
  MOV    rbp,qword [rsp+64]
  POP    rax
  MOV    dword [rbp],eax
; *cursorVertex\y = y
  FILD   qword [rsp+PS3054+32]
  PUSH   rax
  FSTP   dword [rsp]
  MOV    rbp,qword [rsp+64]
  POP    rax
  MOV    dword [rbp+4],eax
; *cursorVertex\s = xf 
  FLD    dword [rsp+256]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+8]
; *cursorVertex\t = hf    
  FLD    dword [rsp+280]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+12]
; *cursorVertex + SizeOf(QuadVertex)
  MOV    r15,qword [rsp+56]
  ADD    r15,16
  MOV    qword [rsp+56],r15
; 
; *cursorVertex\x = x + wc
  FILD   qword [rsp+PS3054+24]
  FILD   qword [rsp+240]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp]
; *cursorVertex\y = y
  FILD   qword [rsp+PS3054+32]
  PUSH   rax
  FSTP   dword [rsp]
  MOV    rbp,qword [rsp+64]
  POP    rax
  MOV    dword [rbp+4],eax
; *cursorVertex\s = wf
  FLD    dword [rsp+272]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+8]
; *cursorVertex\t = hf
  FLD    dword [rsp+280]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+12]
; *cursorVertex + SizeOf(QuadVertex)
  MOV    r15,qword [rsp+56]
  ADD    r15,16
  MOV    qword [rsp+56],r15
; 
; *cursorVertex\x = x + wc
  FILD   qword [rsp+PS3054+24]
  FILD   qword [rsp+240]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp]
; *cursorVertex\y = y + hc
  FILD   qword [rsp+PS3054+32]
  FILD   qword [rsp+248]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+4]
; *cursorVertex\s = wf
  FLD    dword [rsp+272]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+8]
; *cursorVertex\t = yf
  FLD    dword [rsp+264]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+12]
; *cursorVertex + SizeOf(QuadVertex)
  MOV    r15,qword [rsp+56]
  ADD    r15,16
  MOV    qword [rsp+56],r15
; 
; *cursorVertex\x = x
  FILD   qword [rsp+PS3054+24]
  PUSH   rax
  FSTP   dword [rsp]
  MOV    rbp,qword [rsp+64]
  POP    rax
  MOV    dword [rbp],eax
; *cursorVertex\y = y + hc
  FILD   qword [rsp+PS3054+32]
  FILD   qword [rsp+248]
  FADDP  st1,st0
  FADD   dword [F2]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+4]
; *cursorVertex\s = xf
  FLD    dword [rsp+256]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+8]
; *cursorVertex\t = yf
  FLD    dword [rsp+264]
  MOV    rbp,qword [rsp+56]
  FSTP   dword [rbp+12]
; *cursorVertex + SizeOf(QuadVertex)
  MOV    r15,qword [rsp+56]
  ADD    r15,16
  MOV    qword [rsp+56],r15
; 
; x + *glyph\xOffset
  MOV    r15,qword [rsp+PS3054+24]
  MOV    rbp,qword [rsp+216]
  ADD    r15,qword [rbp+40]
  MOV    qword [rsp+PS3054+24],r15
; 
; *c + SizeOf(Character)
  MOV    r15,qword [rsp+48]
  ADD    r15,2
  MOV    qword [rsp+48],r15
; Wend
  JMP   _While683
_Wend683:
; 
; 
; 
; glBindVertexArray_(vao)
  PUSH   qword [so_render.rendertext.v_vao]
  POP    rcx
  CALL   qword [gl.v_glBindVertexArray_]
; 
; glBufferSubData_(#GL_ARRAY_BUFFER, 0, charsCount * 4 * SizeOf(QuadVertex), *vertices)
  PUSH   qword [so_render.rendertext.p_vertices]
  MOV    r15,qword [rsp+104]
  SAL    r15,2
  SAL    r15,4
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 0
  PUSH   qword 34962
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   qword [gl.v_glBufferSubData_]
; 
; 
; 
; glDrawElements_(#GL_TRIANGLES, charsCount * 6, #GL_UNSIGNED_INT, 0) 
  PUSH   qword 0
  PUSH   qword 5125
  MOV    r15,qword [rsp+112]
  IMUL   r15,6
  MOV    rax,r15
  PUSH   rax
  PUSH   qword 4
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  CALL   glDrawElements
; 
; glDisable_(#GL_BLEND)
  PUSH   qword 3042
  POP    rcx
  CALL   glDisable
; EndProcedure
_EndProcedureZero3055:
  XOR    rax,rax
_EndProcedure3055:
  PUSH   rax
  MOV    rcx,qword [rsp+120]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rdx,s_sgl.shaderobjects
  LEA    rcx,[rsp+192]
  PUSH   rax
  SUB    rsp,32
  CALL   SYS_FreeStructureStrings
  ADD    rsp,32
  POP    rax
  MOV    rcx,qword [rsp+112]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,296
  POP    r15
  POP    rbp
  RET
; Procedure.i GetFontHeight (*fon.BMFont)
_Procedure3052:
  MOV    qword [rsp+8],rcx
  PUSH   rbp
  PS3052=64
  XOR    rax,rax
  PUSH   rax
  SUB    rsp,40
; ProcedureReturn *fon\yOffset
  MOV    rbp,qword [rsp+PS3052+0]
  MOV    rax,qword [rbp+32]
  JMP   _EndProcedure3053
; EndProcedure
_EndProcedureZero3053:
  XOR    rax,rax
_EndProcedure3053:
  ADD    rsp,48
  POP    rbp
  RET
; Procedure.s TrimEx (in$, char$ = " ")
_Procedure14:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  PUSH   r15
  PS14=96
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rax,[rsp+PS14+32]
  MOV    qword [PB_StringBasePosition],rax
  MOV    rdx,[rsp+PS14+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rdx,[rsp+PS14+8]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; 
; Protected lbef, laft
; 
; char$ = Left (char$, 1)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 1
  PUSH   qword [rsp+80]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_Left
  ADD    rsp,40
  LEA    rcx,[rsp+56]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; in$ = Trim(in$, char$)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+72]
  PUSH   qword [rsp+72]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_Trim2
  ADD    rsp,40
  LEA    rcx,[rsp+48]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; Repeat
_Repeat59:
; lbef = Len(in$)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_Len
  MOV    qword [rsp+56],rax
; in$ = ReplaceString(in$, char$ + char$, char$)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+72]
  MOV    rcx,qword [rsp+80]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+88]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  ADD    qword [PB_StringBasePosition],2
  PUSH   qword [rsp+80]
  MOV    rdx,[PB_StringBase]
  ADD    [rsp+8],rdx
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_ReplaceString
  ADD    rsp,40
  LEA    rcx,[rsp+48]
  POP    rdx
  CALL   SYS_AllocateString4
; laft = Len(in$)
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_Len
  MOV    qword [rsp+64],rax
; If lbef = laft
  MOV    r15,qword [rsp+56]
  CMP    r15,qword [rsp+64]
  JNE   _EndIf61
; Break
  JMP   _Until59
; EndIf
_EndIf61:
; ForEver
  JMP   _Repeat59
_Until59:
; 
; ProcedureReturn in$
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure15
; EndProcedure
_EndProcedureZero15:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure15:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,80
  POP    r15
  RET
; Procedure.i SplitToArray (s$, sep$, Array arr$(1))
_Procedure26:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   rbp
  PUSH   r15
  PUSH   r14
  PS26=112
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rdx,[rsp+PS26+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rdx,[rsp+PS26+8]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rax,qword [rsp+PS26+16]
  MOV    qword [rsp+56],rax
; 
; 
; 
; 
; 
; 
; 
; Protected i, items
; 
; If Len(sep$) > 0 
  PUSH   qword [rsp+48]
  POP    rcx
  CALL   PB_Len
  MOV    r15,rax
  AND    r15,r15
  JLE   _EndIf86
; items = CountString(s$,sep$) + 1
  PUSH   qword [rsp+48]
  PUSH   qword [rsp+48]
  POP    rcx
  POP    rdx
  CALL   PB_CountString
  MOV    r15,rax
  INC    r15
  MOV    qword [rsp+72],r15
; 
; If items > ArraySize(arr$()) + 1
  MOV    r15,qword [rsp+72]
  MOV    rcx,[rsp+56]
  PUSH   qword [rcx]
  POP    rcx
  CALL   PB_ArraySize
  MOV    r14,rax
  INC    r14
  CMP    r15,r14
  JLE   _EndIf88
; ReDim arr$(items - 1)
  MOV    r15,qword [rsp+72]
  DEC    r15
  MOV    rax,r15
  INC    rax
  MOV    rcx,[rsp+56]
  LEA    rdx,[rcx]
  MOV    rcx,rax
  CALL   SYS_ReAllocateArray
; EndIf
_EndIf88:
; 
; For i = 1 To items    
  MOV    qword [rsp+64],1
  JMP   _ForSkipDebug89
_For89:
_ForSkipDebug89:
  MOV    rax,qword [rsp+72]
  CMP    rax,qword [rsp+64]
  JL    _Next90
; arr$(i-1) = StringField(s$, i, sep$)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+72]
  PUSH   qword [rsp+96]
  PUSH   qword [rsp+80]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  MOV    r15,qword [rsp+72]
  DEC    r15
  MOV    rcx,[rsp+64]
  MOV    rbp,qword [rcx]
  SAL    r15,3
  LEA    rcx,[rbp+r15]
  POP    rdx
  CALL   SYS_AllocateString4
; Next
_NextContinue90:
  INC    qword [rsp+64]
  JNO   _For89
_Next90:
; EndIf
_EndIf86:
; 
; ProcedureReturn items
  MOV    rax,qword [rsp+72]
  JMP   _EndProcedure27
; EndProcedure
_EndProcedureZero27:
  XOR    rax,rax
_EndProcedure27:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,80
  POP    r14
  POP    r15
  POP    rbp
  RET
; Procedure.s FormatDouble (value.d,  decimals = 2, decSep$ =".", thouSep$=",", alwaysSign = #False)
_Procedure22:
  MOVSD  qword [rsp+8],xmm0
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  MOV    qword [rsp+32],r9
  PUSH   r15
  PS22=128
  MOV    rax,9
.ClearLoop:
  SUB    rsp,8
  MOV    qword [rsp],0
  DEC    rax
  JNZ   .ClearLoop
  SUB    rsp,40
  MOV    rax,[rsp+PS22+40]
  MOV    qword [PB_StringBasePosition],rax
  MOV    rdx,[rsp+PS22+16]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rdx,[rsp+PS22+24]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; Protected ret$
; Protected sign, i
; Protected num$, left$, right$
; 
; If value < 0
  FLD    qword [rsp+PS22+0]
  FCOMP  qword [D2]
  FNSTSW ax
  TEST   ah,1h
  JE    _EndIf71
; value = -value
  FLD    qword [rsp+PS22+0]
  FCHS
  FSTP   qword [rsp+PS22+0]
; sign = 1
  MOV    qword [rsp+64],1
; EndIf
_EndIf71:
; 
; num$ = StrD(value, decimals) + "."
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+PS22+32]
  PUSH   qword [rsp+PS22+32]
  MOVSD  xmm0,qword [rsp]
  ADD    rsp,8
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_StrD2
  ADD    rsp,40
  MOV    rcx,_S17
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  LEA    rcx,[rsp+88]
  POP    rdx
  CALL   SYS_AllocateString4
; left$ = StringField(num$, 1, ".")
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 1
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+96]
  POP    rdx
  CALL   SYS_AllocateString4
; right$ = StringField(num$, 2, ".")
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  MOV    rax,_S17
  PUSH   rax
  PUSH   qword 2
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_StringField
  ADD    rsp,40
  LEA    rcx,[rsp+104]
  POP    rdx
  CALL   SYS_AllocateString4
; 
; i = Len(left$) - 3
  PUSH   qword [rsp+88]
  POP    rcx
  CALL   PB_Len
  MOV    r15,rax
  ADD    r15,-3
  MOV    qword [rsp+72],r15
; 
; While i > 0
_While72:
  MOV    r15,qword [rsp+72]
  AND    r15,r15
  JLE   _Wend72
; left$ = Left(left$,i) + thouSep$ + Mid(left$, i+1)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+96]
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_Left
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [PB_StringBasePosition]
  MOV    r15,qword [rsp+96]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  PUSH   qword [rsp+120]
  POP    rcx
  POP    rdx
  POP    r8
  SUB    rsp,32
  CALL   PB_Mid
  ADD    rsp,32
  POP    rax
  LEA    rcx,[rsp+96]
  POP    rdx
  CALL   SYS_AllocateString4
; i-3
  MOV    r15,qword [rsp+72]
  ADD    r15,-3
  MOV    qword [rsp+72],r15
; Wend
  JMP   _While72
_Wend72:
; 
; If left$ = #Empty$
  PUSH   qword [rsp+88]
  MOV    rcx,_S18
  POP    rdx
  CALL   SYS_StringEqual
  OR     rax,rax
  JE    _EndIf74
; left$ = "0"
  MOV    rdx,_S14
  LEA    rcx,[rsp+88]
  CALL   SYS_FastAllocateStringFree4
; EndIf
_EndIf74:
; 
; If right$ <> #Empty$
  PUSH   qword [rsp+96]
  MOV    rcx,_S18
  POP    rdx
  CALL   SYS_StringEqual
  OR     rax,rax
  JNE   _EndIf76
; ret$ = left$ + decSep$ + right$
  MOV    rcx,qword [rsp+88]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  MOV    rcx,qword [rsp+104]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  LEA    rcx,[rsp+64]
  POP    rdx
  CALL   SYS_AllocateString4
; Else
  JMP   _EndIf75
_EndIf76:
; ret$ = left$
  MOV    rcx,qword [rsp+88]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  LEA    rcx,[rsp+64]
  POP    rdx
  CALL   SYS_AllocateString4
; EndIf
_EndIf75:
; 
; If sign Or alwaysSign
  CMP    qword [rsp+64],0
  JNE    Ok3
  CMP    qword [rsp+PS22+32],0
  JNE    Ok3
  JMP    No3
Ok3:
  MOV    rax,1
  JMP    End3
No3:
  XOR    rax,rax
End3:
  AND    rax,rax
  JE    _EndIf79
; ret$ = Mid("+-", sign + 1, 1) + ret$
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword 1
  MOV    r15,qword [rsp+96]
  INC    r15
  MOV    rax,r15
  PUSH   rax
  MOV    rax,_S19
  PUSH   rax
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_Mid2
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  LEA    rcx,[rsp+64]
  POP    rdx
  CALL   SYS_AllocateString4
; EndIf
_EndIf79:
; 
; ProcedureReturn ret$
  MOV    rcx,qword [rsp+56]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure23
; EndProcedure
_EndProcedureZero23:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure23:
  PUSH   rax
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+104]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+96]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+88]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+64]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,112
  POP    r15
  RET
; Procedure.s PadLeft (s$, newlen, char$ = " ")
_Procedure16:
  MOV    qword [rsp+8],rcx
  MOV    qword [rsp+16],rdx
  MOV    qword [rsp+24],r8
  PUSH   r15
  PS16=80
  XOR    rax,rax
  PUSH   rax
  PUSH   rax
  PUSH   rax
  SUB    rsp,40
  MOV    rax,[rsp+PS16+32]
  MOV    qword [PB_StringBasePosition],rax
  MOV    rdx,[rsp+PS16+0]
  LEA    rcx,[rsp+40]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
  MOV    rdx,[rsp+PS16+16]
  LEA    rcx,[rsp+48]
  SUB    rsp,16
  CALL   SYS_FastAllocateString4
  ADD    rsp,16
; 
; 
; 
; If newlen > Len(s$)
  MOV    r15,qword [rsp+PS16+8]
  PUSH   qword [rsp+40]
  POP    rcx
  CALL   PB_Len
  CMP    r15,rax
  JLE   _EndIf63
; ProcedureReturn RSet(s$, newlen, char$)
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,8
  PUSH   qword [PB_StringBasePosition]
  PUSH   qword [rsp+72]
  PUSH   qword [rsp+PS16+40]
  PUSH   qword [rsp+80]
  POP    rcx
  POP    rdx
  POP    r8
  POP    r9
  SUB    rsp,32
  CALL   PB_RSet2
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure17
; EndIf
_EndIf63:
; ProcedureReturn s$
  MOV    rcx,qword [rsp+40]
  PUSH   qword [PB_StringBasePosition]
  SUB    rsp,40
  CALL   SYS_CopyString
  ADD    rsp,40
  POP    rax
  ADD    rax,[PB_StringBase]
  JMP   _EndProcedure17
; EndProcedure
_EndProcedureZero17:
  MOV    rax,[PB_StringBasePosition]
  ADD    rax,[PB_StringBase]
  MOV    word [rax],0
_EndProcedure17:
  PUSH   rax
  MOV    rcx,qword [rsp+48]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  MOV    rcx,qword [rsp+56]
  SUB    rsp,40
  CALL   SYS_FreeString
  ADD    rsp,40
  POP    rax
  ADD    rsp,64
  POP    r15
  RET
; 
section '.data' data readable writeable
; 
_PB_DataSection:
pb_public PB_DEBUGGER_LineNumber
  dd     -1
pb_public PB_DEBUGGER_IncludedFiles
  dd     0
pb_public PB_DEBUGGER_FileName
  db     0
PB_OpenGLSubsystem: db 1
pb_public PB_Compiler_Unicode
  dd     1
pb_public PB_Compiler_Thread
  dd     0
pb_public PB_Compiler_Purifier
  dd     0
pb_public PB_Compiler_Debugger
  dd     0
pb_public PB_Compiler_DPIAware
  dd     0
pb_public PB_Compiler_XPSkins
  dd     0
PB_ExecutableType: dd 0
pb_align 8
public _SYS_StaticStringStart
_SYS_StaticStringStart:
_S18: dw 0
_S747: dw 103,108,71,101,116,110,85,110,105,102,111,114,109,105,118,0
_S82: dw 103,108,71,101,116,67,111,109,112,114,101,115,115,101,100,84,101,120,73,109,97,103,101,0
_S826: dw 76,101,102,116,0
_S7: dw 7,0
_S63: dw 32,40,0
_S8: dw 8,0
_S503: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,105,118,0
_S4: dw 9,0
_S556: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,51,100,0
_S2: dw 10,0
_S5: dw 11,0
_S9: dw 12,0
_S3: dw 13,0
_S670: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,82,101,97,100,66,117,102,102,101,114,0
_S459: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,50,100,118,0
_S458: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,52,100,118,0
_S381: dw 103,108,67,111,112,121,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S20: dw 75,105,66,44,77,105,66,44,71,105,66,44,84,105,66,44,80,105,66,0
_S29: dw 110,116,100,108,108,46,100,108,108,0
_S463: dw 103,108,71,101,116,85,110,105,102,111,114,109,100,118,0
_S686: dw 103,108,84,101,120,116,117,114,101,66,117,102,102,101,114,0
_S882: dw 82,105,103,104,116,32,83,117,112,101,114,0
_S282: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,117,115,118,0
_S471: dw 103,108,71,101,116,80,114,111,103,114,97,109,83,116,97,103,101,105,118,0
_S32: dw 87,105,110,100,111,119,115,32,57,53,0
_S957: dw 103,108,102,119,71,101,116,86,105,100,101,111,77,111,100,101,40,41,32,102,97,105,108,101,100,32,116,111,32,114,101,116,114,105,101,118,101,32,116,104,101,32,99,117,114,114,101,110,116,32,118,105,100,101,111,32,109,111,100,101,32,102,111,114,32,116,104,101,32,109,111,110,105,116,111,114,46,0
_S10: dw 27,0
_S37: dw 87,105,110,100,111,119,115,32,57,56,0
_S27: dw 92,123,51,52,125,0
_S623: dw 103,108,71,101,116,68,101,98,117,103,77,101,115,115,97,103,101,76,111,103,0
_S292: dw 103,108,67,111,108,111,114,77,97,115,107,105,0
_S749: dw 103,108,82,101,97,100,110,80,105,120,101,108,115,0
_S13: dw 32,0
_S595: dw 103,108,73,110,118,97,108,105,100,97,116,101,84,101,120,83,117,98,73,109,97,103,101,0
_S112: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,102,118,0
_S6: dw 34,0
_S264: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,115,118,0
_S137: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,98,0
_S102: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,100,118,0
_S562: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,80,111,105,110,116,101,114,0
_S497: dw 103,108,66,105,110,100,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,0
_S948: dw 35,77,79,85,83,69,95,66,85,84,84,79,78,95,77,73,68,68,76,69,0
_S188: dw 103,108,71,101,116,66,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S139: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,100,0
_S11: dw 37,0
_S522: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,100,0
_S779: dw 39,0
_S141: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,102,0
_S520: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,102,0
_S64: dw 41,0
_S890: dw 85,78,75,78,79,87,78,0
_S777: dw 85,110,107,110,111,119,110,0
_S143: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,105,0
_S518: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,105,0
_S16: dw 43,0
_S23: dw 44,0
_S637: dw 103,108,66,105,110,100,83,97,109,112,108,101,114,115,0
_S433: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,50,117,105,118,0
_S15: dw 45,0
_S17: dw 46,0
_S880: dw 82,105,103,104,116,32,67,116,114,108,0
_S780: dw 47,0
_S68: dw 49,50,48,0
_S14: dw 48,0
_S781: dw 49,0
_S782: dw 50,0
_S783: dw 51,0
_S145: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,115,0
_S33: dw 52,0
_S784: dw 53,0
_S46: dw 54,0
_S785: dw 55,0
_S786: dw 56,0
_S625: dw 103,108,80,111,112,68,101,98,117,103,71,114,111,117,112,0
_S499: dw 103,108,71,101,110,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,115,0
_S787: dw 57,0
_S414: dw 103,108,73,115,83,97,109,112,108,101,114,0
_S788: dw 59,0
_S713: dw 103,108,71,101,116,84,101,120,116,117,114,101,76,101,118,101,108,80,97,114,97,109,101,116,101,114,105,118,0
_S789: dw 61,0
_S650: dw 103,108,78,97,109,101,100,66,117,102,102,101,114,68,97,116,97,0
_S647: dw 103,108,71,101,116,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,105,54,52,95,118,0
_S38: dw 49,48,0
_S12: dw 63,0
_S707: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,105,118,0
_S627: dw 103,108,71,101,116,79,98,106,101,99,116,76,97,98,101,108,0
_S755: dw 103,108,71,101,116,110,80,105,120,101,108,77,97,112,117,115,118,0
_S84: dw 103,108,67,108,105,101,110,116,65,99,116,105,118,101,84,101,120,116,117,114,101,0
_S590: dw 103,108,68,105,115,112,97,116,99,104,67,111,109,112,117,116,101,73,110,100,105,114,101,99,116,0
_S543: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,50,102,118,0
_S727: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,76,70,111,114,109,97,116,0
_S557: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,52,100,0
_S544: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,52,102,118,0
_S577: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,73,110,115,116,97,110,99,101,100,66,97,115,101,86,101,114,116,101,120,66,97,115,101,73,110,115,116,97,110,99,101,0
_S748: dw 103,108,71,101,116,110,85,110,105,102,111,114,109,117,105,118,0
_S24: dw 32,66,121,116,101,115,0
_S304: dw 103,108,67,108,97,109,112,67,111,108,111,114,0
_S733: dw 103,108,67,114,101,97,116,101,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,115,0
_S725: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,70,111,114,109,97,116,0
_S618: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,66,105,110,100,105,110,103,0
_S317: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,117,105,0
_S404: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,0
_S367: dw 103,108,66,108,105,116,70,114,97,109,101,98,117,102,102,101,114,0
_S100: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,115,118,0
_S456: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,100,118,0
_S443: dw 103,108,66,108,101,110,100,70,117,110,99,83,101,112,97,114,97,116,101,105,0
_S688: dw 103,108,84,101,120,116,117,114,101,83,116,111,114,97,103,101,49,68,0
_S816: dw 91,0
_S950: dw 71,101,116,77,111,117,115,101,66,117,116,116,111,110,83,116,114,105,110,103,40,41,32,115,112,101,99,105,102,105,101,100,32,98,117,116,116,111,110,32,105,115,32,105,110,118,97,108,105,100,46,0
_S719: dw 103,108,68,105,115,97,98,108,101,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,0
_S1: dw 92,0
_S817: dw 93,0
_S982: dw 91,83,93,112,101,99,117,108,97,114,32,108,105,103,104,116,105,110,103,32,105,115,32,79,70,70,0
_S973: dw 117,95,108,105,103,104,116,46,118,80,111,115,0
_S818: dw 96,0
_S790: dw 97,0
_S944: dw 119,103,108,71,101,116,69,120,116,101,110,115,105,111,110,115,83,116,114,105,110,103,69,88,84,0
_S791: dw 98,0
_S926: dw 32,87,105,110,100,111,119,115,0
_S792: dw 99,0
_S793: dw 100,0
_S931: dw 32,956,115,0
_S794: dw 101,0
_S530: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,100,0
_S795: dw 102,0
_S796: dw 103,0
_S528: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,102,0
_S951: dw 103,108,102,119,71,101,116,77,111,117,115,101,66,117,116,116,111,110,40,41,32,114,101,116,117,114,110,101,100,32,115,116,97,116,117,115,32,105,115,32,105,110,118,97,108,105,100,46,0
_S797: dw 104,0
_S798: dw 105,0
_S799: dw 106,0
_S526: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,105,0
_S800: dw 107,0
_S429: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,68,105,118,105,115,111,114,0
_S801: dw 108,0
_S605: dw 103,108,71,101,116,80,114,111,103,114,97,109,82,101,115,111,117,114,99,101,78,97,109,101,0
_S802: dw 109,0
_S803: dw 110,0
_S73: dw 49,51,48,0
_S971: dw 117,95,118,105,101,119,0
_S804: dw 111,0
_S805: dw 112,0
_S806: dw 113,0
_S276: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,102,118,0
_S807: dw 114,0
_S587: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,68,97,116,97,0
_S260: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,100,118,0
_S808: dw 115,0
_S767: dw 103,108,80,111,108,121,103,111,110,79,102,102,115,101,116,67,108,97,109,112,0
_S758: dw 103,108,71,101,116,110,67,111,110,118,111,108,117,116,105,111,110,70,105,108,116,101,114,0
_S809: dw 116,0
_S810: dw 117,0
_S811: dw 118,0
_S672: dw 103,108,73,110,118,97,108,105,100,97,116,101,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,83,117,98,68,97,116,97,0
_S658: dw 103,108,70,108,117,115,104,77,97,112,112,101,100,78,97,109,101,100,66,117,102,102,101,114,82,97,110,103,101,0
_S812: dw 119,0
_S813: dw 120,0
_S814: dw 121,0
_S907: dw 77,97,114,107,101,114,0
_S815: dw 122,0
_S928: dw 32,65,83,77,0
_S47: dw 54,48,48,49,0
_S49: dw 54,48,48,50,0
_S25: dw 124,0
_S897: dw 87,105,110,100,111,119,32,83,121,115,116,101,109,0
_S338: dw 103,108,85,110,105,102,111,114,109,50,117,105,118,0
_S67: dw 65,32,118,97,108,105,100,32,71,101,116,80,114,111,99,65,100,100,114,101,115,115,40,41,32,102,117,110,99,116,105,111,110,32,104,97,115,32,110,111,116,32,98,101,101,110,32,114,101,103,105,115,116,101,114,101,100,46,0
_S34: dw 49,49,49,49,0
_S588: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S469: dw 103,108,85,110,105,102,111,114,109,83,117,98,114,111,117,116,105,110,101,115,117,105,118,0
_S60: dw 87,105,110,100,111,119,115,0
_S247: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,100,0
_S757: dw 103,108,71,101,116,110,67,111,108,111,114,84,97,98,108,101,0
_S480: dw 103,108,68,114,97,119,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S249: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,102,0
_S773: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,67,111,110,116,114,111,108,65,82,66,0
_S286: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,50,102,118,0
_S287: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,52,102,118,0
_S974: dw 117,95,108,105,103,104,116,46,118,67,111,108,111,114,0
_S761: dw 103,108,71,101,116,110,77,105,110,109,97,120,0
_S457: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,51,100,118,0
_S74: dw 103,108,65,99,116,105,118,101,84,101,120,116,117,114,101,0
_S45: dw 87,105,110,100,111,119,115,32,86,105,115,116,97,0
_S216: dw 103,108,71,101,116,85,110,105,102,111,114,109,102,118,0
_S251: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,115,0
_S85: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,100,0
_S689: dw 103,108,84,101,120,116,117,114,101,83,116,111,114,97,103,101,50,68,0
_S500: dw 103,108,73,115,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,0
_S453: dw 103,108,85,110,105,102,111,114,109,52,100,118,0
_S129: dw 103,108,66,108,101,110,100,67,111,108,111,114,0
_S87: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,102,0
_S66: dw 84,104,105,115,32,109,111,100,117,108,101,32,115,117,112,112,111,114,116,32,79,112,101,110,71,76,32,117,112,32,116,111,32,118,101,114,115,105,111,110,32,52,54,48,0
_S89: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,105,0
_S886: dw 35,71,76,95,71,69,79,77,69,84,82,89,95,83,72,65,68,69,82,0
_S656: dw 103,108,77,97,112,78,97,109,101,100,66,117,102,102,101,114,82,97,110,103,101,0
_S653: dw 103,108,67,108,101,97,114,78,97,109,101,100,66,117,102,102,101,114,68,97,116,97,0
_S413: dw 103,108,68,101,108,101,116,101,83,97,109,112,108,101,114,115,0
_S822: dw 66,97,99,107,115,112,97,99,101,0
_S104: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,102,118,0
_S258: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,115,118,0
_S94: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,100,118,0
_S959: dw 65,114,105,97,108,0
_S934: dw 69,110,97,98,108,101,68,101,98,117,103,79,117,116,112,117,116,40,41,32,108,101,118,101,108,32,105,115,32,105,110,118,97,108,105,100,46,0
_S696: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,49,68,0
_S383: dw 103,108,71,101,116,65,99,116,105,118,101,85,110,105,102,111,114,109,115,105,118,0
_S343: dw 103,108,71,101,116,84,101,120,80,97,114,97,109,101,116,101,114,73,105,118,0
_S325: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,117,105,118,0
_S91: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,115,0
_S370: dw 103,108,77,97,112,66,117,102,102,101,114,82,97,110,103,101,0
_S192: dw 103,108,68,114,97,119,66,117,102,102,101,114,115,0
_S490: dw 103,108,67,108,101,97,114,68,101,112,116,104,102,0
_S400: dw 103,108,71,101,116,73,110,116,101,103,101,114,54,52,118,0
_S738: dw 103,108,71,101,116,81,117,101,114,121,66,117,102,102,101,114,79,98,106,101,99,116,117,105,118,0
_S717: dw 103,108,71,101,116,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,105,118,0
_S121: dw 49,52,48,0
_S474: dw 103,108,66,105,110,100,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S903: dw 68,101,112,114,101,99,97,116,101,100,32,66,101,104,97,118,105,111,117,114,0
_S444: dw 103,108,68,114,97,119,65,114,114,97,121,115,73,110,100,105,114,101,99,116,0
_S942: dw 85,78,75,78,79,87,78,32,69,82,82,79,82,0
_S770: dw 84,40,0
_S270: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,117,105,118,0
_S172: dw 103,108,68,101,108,101,116,101,81,117,101,114,105,101,115,0
_S720: dw 103,108,69,110,97,98,108,101,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,0
_S922: dw 103,108,102,119,73,110,105,116,40,41,32,102,97,105,108,101,100,46,0
_S917: dw 83,71,76,0
_S612: dw 103,108,84,101,120,83,116,111,114,97,103,101,51,68,77,117,108,116,105,115,97,109,112,108,101,0
_S401: dw 103,108,71,101,116,83,121,110,99,105,118,0
_S336: dw 103,108,85,110,105,102,111,114,109,52,117,105,0
_S465: dw 103,108,71,101,116,83,117,98,114,111,117,116,105,110,101,73,110,100,101,120,0
_S410: dw 103,108,66,105,110,100,70,114,97,103,68,97,116,97,76,111,99,97,116,105,111,110,73,110,100,101,120,101,100,0
_S762: dw 103,108,84,101,120,116,117,114,101,66,97,114,114,105,101,114,0
_S753: dw 103,108,71,101,116,110,80,105,120,101,108,77,97,112,102,118,0
_S741: dw 103,108,71,101,116,67,111,109,112,114,101,115,115,101,100,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,0
_S393: dw 103,108,77,117,108,116,105,68,114,97,119,69,108,101,109,101,110,116,115,66,97,115,101,86,101,114,116,101,120,0
_S174: dw 103,108,66,101,103,105,110,81,117,101,114,121,0
_S253: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,100,0
_S726: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,73,70,111,114,109,97,116,0
_S296: dw 103,108,68,105,115,97,98,108,101,105,0
_S484: dw 103,108,71,101,116,81,117,101,114,121,73,110,100,101,120,101,100,105,118,0
_S255: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,102,0
_S547: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,50,100,118,0
_S923: dw 71,76,70,87,32,0
_S548: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,52,100,118,0
_S189: dw 103,108,71,101,116,66,117,102,102,101,114,80,111,105,110,116,101,114,118,0
_S677: dw 103,108,66,108,105,116,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,0
_S135: dw 103,108,70,111,103,67,111,111,114,100,100,118,0
_S729: dw 103,108,71,101,116,86,101,114,116,101,120,65,114,114,97,121,105,118,0
_S316: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,51,117,105,0
_S943: dw 119,103,108,71,101,116,69,120,116,101,110,115,105,111,110,115,83,116,114,105,110,103,65,82,66,0
_S92: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,115,118,0
_S122: dw 103,108,66,108,101,110,100,70,117,110,99,83,101,112,97,114,97,116,101,0
_S915: dw 44,32,84,121,112,101,58,32,0
_S495: dw 103,108,65,99,116,105,118,101,83,104,97,100,101,114,80,114,111,103,114,97,109,0
_S257: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,115,0
_S245: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,102,118,0
_S93: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,100,0
_S455: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,100,118,0
_S893: dw 71,76,70,87,0
_S690: dw 103,108,84,101,120,116,117,114,101,83,116,111,114,97,103,101,51,68,0
_S95: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,102,0
_S963: dw 117,95,112,114,111,106,101,99,116,105,111,110,0
_S97: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,105,0
_S72: dw 103,108,67,111,112,121,84,101,120,83,117,98,73,109,97,103,101,51,68,0
_S954: dw 80,114,105,109,97,114,121,32,109,111,110,105,116,111,114,32,110,111,116,32,100,101,116,101,99,116,101,100,46,0
_S193: dw 103,108,83,116,101,110,99,105,108,79,112,83,101,112,97,114,97,116,101,0
_S42: dw 87,105,110,100,111,119,115,32,50,48,48,48,0
_S386: dw 103,108,71,101,116,65,99,116,105,118,101,85,110,105,102,111,114,109,66,108,111,99,107,105,118,0
_S114: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,105,118,0
_S697: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,50,68,0
_S366: dw 103,108,71,101,110,101,114,97,116,101,77,105,112,109,97,112,0
_S332: dw 103,108,71,101,116,70,114,97,103,68,97,116,97,76,111,99,97,116,105,111,110,0
_S99: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,115,0
_S614: dw 103,108,66,105,110,100,86,101,114,116,101,120,66,117,102,102,101,114,0
_S918: dw 83,71,76,32,104,97,115,32,98,101,101,110,32,97,108,114,101,97,100,121,32,105,110,105,116,105,97,108,105,122,101,100,46,0
_S615: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,70,111,114,109,97,116,0
_S635: dw 103,108,66,105,110,100,66,117,102,102,101,114,115,82,97,110,103,101,0
_S435: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,51,117,105,118,0
_S170: dw 49,53,48,0
_S30: dw 82,116,108,71,101,116,86,101,114,115,105,111,110,0
_S927: dw 32,83,116,97,116,105,99,0
_S302: dw 103,108,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,86,97,114,121,105,110,103,115,0
_S949: dw 35,77,79,85,83,69,95,66,85,84,84,79,78,95,0
_S262: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,102,118,0
_S254: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,100,118,0
_S475: dw 103,108,68,101,108,101,116,101,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,115,0
_S775: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,67,97,108,108,98,97,99,107,65,82,66,0
_S946: dw 35,77,79,85,83,69,95,66,85,84,84,79,78,95,76,69,70,84,0
_S169: dw 103,108,87,105,110,100,111,119,80,111,115,51,115,118,0
_S643: dw 103,108,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,66,117,102,102,101,114,66,97,115,101,0
_S834: dw 83,99,114,111,108,108,32,76,111,99,107,0
_S718: dw 103,108,67,114,101,97,116,101,86,101,114,116,101,120,65,114,114,97,121,115,0
_S492: dw 103,108,80,114,111,103,114,97,109,66,105,110,97,114,121,0
_S398: dw 103,108,67,108,105,101,110,116,87,97,105,116,83,121,110,99,0
_S342: dw 103,108,84,101,120,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S39: dw 50,50,50,50,0
_S705: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,73,105,118,0
_S472: dw 103,108,80,97,116,99,104,80,97,114,97,109,101,116,101,114,105,0
_S259: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,100,0
_S176: dw 103,108,71,101,116,81,117,101,114,121,105,118,0
_S427: dw 103,108,71,101,116,81,117,101,114,121,79,98,106,101,99,116,105,54,52,118,0
_S306: dw 103,108,69,110,100,67,111,110,100,105,116,105,111,110,97,108,82,101,110,100,101,114,0
_S261: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,102,0
_S652: dw 103,108,67,111,112,121,78,97,109,101,100,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S552: dw 103,108,86,97,108,105,100,97,116,101,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,0
_S899: dw 84,104,105,114,100,32,80,97,114,116,121,0
_S639: dw 103,108,66,105,110,100,86,101,114,116,101,120,66,117,102,102,101,114,115,0
_S298: dw 103,108,66,101,103,105,110,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S285: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,51,102,118,0
_S310: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,49,105,0
_S183: dw 103,108,66,117,102,102,101,114,68,97,116,97,0
_S938: dw 35,71,76,95,83,84,65,67,75,95,79,86,69,82,70,76,79,87,0
_S660: dw 103,108,71,101,116,78,97,109,101,100,66,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,54,52,118,0
_S750: dw 103,108,71,101,116,110,77,97,112,100,118,0
_S682: dw 103,108,78,97,109,101,100,82,101,110,100,101,114,98,117,102,102,101,114,83,116,111,114,97,103,101,0
_S711: dw 103,108,71,101,116,67,111,109,112,114,101,115,115,101,100,84,101,120,116,117,114,101,73,109,97,103,101,0
_S439: dw 103,108,77,105,110,83,97,109,112,108,101,83,104,97,100,105,110,103,0
_S263: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,51,115,0
_S138: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,98,118,0
_S101: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,100,0
_S238: dw 103,108,85,110,105,102,111,114,109,52,102,118,0
_S103: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,102,0
_S41: dw 87,105,110,100,111,119,115,32,77,69,0
_S452: dw 103,108,85,110,105,102,111,114,109,51,100,118,0
_S412: dw 103,108,71,101,110,83,97,109,112,108,101,114,115,0
_S105: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,105,0
_S266: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,105,118,0
_S194: dw 103,108,83,116,101,110,99,105,108,70,117,110,99,83,101,112,97,114,97,116,101,0
_S57: dw 87,105,110,100,111,119,115,32,56,46,49,0
_S898: dw 67,111,109,112,105,108,101,114,0
_S96: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,102,118,0
_S698: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,51,68,0
_S295: dw 103,108,69,110,97,98,108,101,105,0
_S252: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,115,118,0
_S86: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,100,118,0
_S107: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,115,0
_S764: dw 103,108,83,112,101,99,105,97,108,105,122,101,83,104,97,100,101,114,0
_S28: dw 92,123,49,50,52,125,0
_S732: dw 103,108,67,114,101,97,116,101,83,97,109,112,108,101,114,115,0
_S441: dw 103,108,66,108,101,110,100,69,113,117,97,116,105,111,110,83,101,112,97,114,97,116,101,105,0
_S277: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,105,118,0
_S580: dw 103,108,77,101,109,111,114,121,66,97,114,114,105,101,114,0
_S222: dw 103,108,73,115,80,114,111,103,114,97,109,0
_S820: dw 69,110,116,101,114,0
_S335: dw 103,108,85,110,105,102,111,114,109,51,117,105,0
_S208: dw 103,108,71,101,116,65,116,116,97,99,104,101,100,83,104,97,100,101,114,115,0
_S346: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,117,105,118,0
_S828: dw 85,112,0
_S203: dw 103,108,68,101,116,97,99,104,83,104,97,100,101,114,0
_S339: dw 103,108,85,110,105,102,111,114,109,51,117,105,118,0
_S970: dw 117,95,109,111,100,101,108,0
_S827: dw 68,111,119,110,0
_S501: dw 103,108,71,101,116,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,105,118,0
_S146: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,115,118,0
_S273: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,100,0
_S756: dw 103,108,71,101,116,110,80,111,108,121,103,111,110,83,116,105,112,112,108,101,0
_S742: dw 103,108,71,101,116,71,114,97,112,104,105,99,115,82,101,115,101,116,83,116,97,116,117,115,0
_S380: dw 103,108,80,114,105,109,105,116,105,118,101,82,101,115,116,97,114,116,73,110,100,101,120,0
_S275: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,102,0
_S163: dw 103,108,87,105,110,100,111,119,80,111,115,51,100,118,0
_S541: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,50,102,118,0
_S913: dw 78,111,116,105,102,105,99,97,116,105,111,110,115,0
_S542: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,52,102,118,0
_S546: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,51,100,118,0
_S838: dw 70,49,0
_S35: dw 87,105,110,100,111,119,115,32,57,53,32,79,83,82,50,0
_S839: dw 70,50,0
_S133: dw 103,108,70,111,103,67,111,111,114,100,102,118,0
_S840: dw 70,51,0
_S311: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,50,105,0
_S841: dw 70,52,0
_S916: dw 79,80,69,78,71,76,0
_S842: dw 70,53,0
_S843: dw 70,54,0
_S315: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,50,117,105,0
_S217: dw 103,108,71,101,116,85,110,105,102,111,114,109,105,118,0
_S844: dw 70,55,0
_S531: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,100,118,0
_S845: dw 70,56,0
_S278: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,115,0
_S175: dw 103,108,69,110,100,81,117,101,114,121,0
_S109: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,100,0
_S846: dw 70,57,0
_S244: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,102,118,0
_S454: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,100,118,0
_S111: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,102,0
_S576: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,73,110,115,116,97,110,99,101,100,66,97,115,101,73,110,115,116,97,110,99,101,0
_S118: dw 103,108,76,111,97,100,84,114,97,110,115,112,111,115,101,77,97,116,114,105,120,100,0
_S117: dw 103,108,76,111,97,100,84,114,97,110,115,112,111,115,101,77,97,116,114,105,120,102,0
_S113: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,105,0
_S684: dw 103,108,71,101,116,78,97,109,101,100,82,101,110,100,101,114,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S633: dw 103,108,67,108,101,97,114,84,101,120,83,117,98,73,109,97,103,101,0
_S832: dw 69,110,100,0
_S610: dw 103,108,84,101,120,66,117,102,102,101,114,82,97,110,103,101,0
_S885: dw 35,71,76,95,70,82,65,71,77,69,78,84,95,83,72,65,68,69,82,0
_S21: dw 75,66,44,77,66,44,71,66,44,84,66,0
_S106: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,105,118,0
_S115: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,115,0
_S687: dw 103,108,84,101,120,116,117,114,101,66,117,102,102,101,114,82,97,110,103,101,0
_S924: dw 83,71,76,32,0
_S321: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,105,118,0
_S373: dw 103,108,68,101,108,101,116,101,86,101,114,116,101,120,65,114,114,97,121,115,0
_S256: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,50,102,118,0
_S248: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,100,118,0
_S532: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,117,105,0
_S402: dw 103,108,71,101,116,73,110,116,101,103,101,114,54,52,105,95,118,0
_S202: dw 103,108,68,101,108,101,116,101,83,104,97,100,101,114,0
_S669: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,68,114,97,119,66,117,102,102,101,114,115,0
_S419: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,102,118,0
_S161: dw 103,108,87,105,110,100,111,119,80,111,115,50,115,118,0
_S308: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,73,105,118,0
_S716: dw 103,108,71,101,116,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S665: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,0
_S171: dw 103,108,71,101,110,81,117,101,114,105,101,115,0
_S671: dw 103,108,73,110,118,97,108,105,100,97,116,101,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,68,97,116,97,0
_S369: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,76,97,121,101,114,0
_S666: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,0
_S368: dw 103,108,82,101,110,100,101,114,98,117,102,102,101,114,83,116,111,114,97,103,101,77,117,108,116,105,115,97,109,112,108,101,0
_S177: dw 103,108,71,101,116,81,117,101,114,121,79,98,106,101,99,116,105,118,0
_S740: dw 103,108,71,101,116,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,0
_S509: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,117,105,118,0
_S195: dw 103,108,83,116,101,110,99,105,108,77,97,115,107,83,101,112,97,114,97,116,101,0
_S663: dw 103,108,67,114,101,97,116,101,70,114,97,109,101,98,117,102,102,101,114,115,0
_S624: dw 103,108,80,117,115,104,68,101,98,117,103,71,114,111,117,112,0
_S436: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,52,117,105,0
_S312: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,51,105,0
_S445: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,73,110,100,105,114,101,99,116,0
_S428: dw 103,108,71,101,116,81,117,101,114,121,79,98,106,101,99,116,117,105,54,52,118,0
_S751: dw 103,108,71,101,116,110,77,97,112,102,118,0
_S378: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,73,110,115,116,97,110,99,101,100,0
_S218: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,100,118,0
_S140: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,100,118,0
_S648: dw 103,108,67,114,101,97,116,101,66,117,102,102,101,114,115,0
_S491: dw 103,108,71,101,116,80,114,111,103,114,97,109,66,105,110,97,114,121,0
_S237: dw 103,108,85,110,105,102,111,114,109,51,102,118,0
_S451: dw 103,108,85,110,105,102,111,114,109,50,100,118,0
_S88: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,102,118,0
_S935: dw 35,71,76,95,73,78,86,65,76,73,68,95,69,78,85,77,0
_S281: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,117,105,118,0
_S876: dw 76,101,102,116,32,67,116,114,108,0
_S847: dw 70,49,48,0
_S184: dw 103,108,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S848: dw 70,49,49,0
_S778: dw 83,112,97,99,101,0
_S375: dw 103,108,73,115,86,101,114,116,101,120,65,114,114,97,121,0
_S849: dw 70,49,50,0
_S395: dw 103,108,70,101,110,99,101,83,121,110,99,0
_S937: dw 35,71,76,95,73,78,86,65,76,73,68,95,79,80,69,82,65,84,73,79,78,0
_S850: dw 70,49,51,0
_S134: dw 103,108,70,111,103,67,111,111,114,100,100,0
_S851: dw 70,49,52,0
_S678: dw 103,108,67,104,101,99,107,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,83,116,97,116,117,115,0
_S246: dw 103,108,86,97,108,105,100,97,116,101,80,114,111,103,114,97,109,0
_S852: dw 70,49,53,0
_S132: dw 103,108,70,111,103,67,111,111,114,100,102,0
_S853: dw 70,49,54,0
_S437: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,52,117,105,118,0
_S854: dw 70,49,55,0
_S147: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,98,0
_S855: dw 70,49,56,0
_S352: dw 103,108,68,101,108,101,116,101,82,101,110,100,101,114,98,117,102,102,101,114,115,0
_S856: dw 70,49,57,0
_S901: dw 79,116,104,101,114,0
_S626: dw 103,108,79,98,106,101,99,116,76,97,98,101,108,0
_S209: dw 103,108,71,101,116,65,116,116,114,105,98,76,111,99,97,116,105,111,110,0
_S644: dw 103,108,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,66,117,102,102,101,114,82,97,110,103,101,0
_S214: dw 103,108,71,101,116,83,104,97,100,101,114,83,111,117,114,99,101,0
_S683: dw 103,108,78,97,109,101,100,82,101,110,100,101,114,98,117,102,102,101,114,83,116,111,114,97,103,101,77,117,108,116,105,115,97,109,112,108,101,0
_S702: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,102,0
_S149: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,105,0
_S969: dw 80,104,111,110,103,32,108,105,103,116,104,105,110,103,32,40,51,51,48,41,0
_S704: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,105,0
_S651: dw 103,108,78,97,109,101,100,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S607: dw 103,108,71,101,116,80,114,111,103,114,97,109,82,101,115,111,117,114,99,101,76,111,99,97,116,105,111,110,0
_S40: dw 87,105,110,100,111,119,115,32,57,56,32,83,69,0
_S334: dw 103,108,85,110,105,102,111,114,109,50,117,105,0
_S589: dw 103,108,68,105,115,112,97,116,99,104,67,111,109,112,117,116,101,0
_S221: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,80,111,105,110,116,101,114,118,0
_S962: dw 117,95,99,111,108,111,114,0
_S498: dw 103,108,68,101,108,101,116,101,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,115,0
_S151: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,115,0
_S870: dw 75,101,121,112,97,100,32,42,0
_S872: dw 75,101,121,112,97,100,32,43,0
_S831: dw 72,111,109,101,0
_S478: dw 103,108,80,97,117,115,101,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S940: dw 35,71,76,95,79,85,84,95,79,70,95,77,69,77,79,82,89,0
_S871: dw 75,101,121,112,97,100,32,45,0
_S868: dw 75,101,121,112,97,100,32,46,0
_S869: dw 75,101,121,112,97,100,32,47,0
_S212: dw 103,108,71,101,116,83,104,97,100,101,114,105,118,0
_S858: dw 75,101,121,112,97,100,32,48,0
_S165: dw 103,108,87,105,110,100,111,119,80,111,115,51,102,118,0
_S859: dw 75,101,121,112,97,100,32,49,0
_S155: dw 103,108,87,105,110,100,111,119,80,111,115,50,100,118,0
_S860: dw 75,101,121,112,97,100,32,50,0
_S415: dw 103,108,66,105,110,100,83,97,109,112,108,101,114,0
_S861: dw 75,101,121,112,97,100,32,51,0
_S540: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,120,51,102,118,0
_S862: dw 75,101,121,112,97,100,32,52,0
_S385: dw 103,108,71,101,116,85,110,105,102,111,114,109,66,108,111,99,107,73,110,100,101,120,0
_S863: dw 75,101,121,112,97,100,32,53,0
_S153: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,80,111,105,110,116,101,114,0
_S864: dw 75,101,121,112,97,100,32,54,0
_S148: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,98,118,0
_S865: dw 75,101,121,112,97,100,32,55,0
_S313: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,105,0
_S976: dw 117,95,108,105,103,104,116,46,118,83,112,101,99,117,108,97,114,67,111,108,111,114,0
_S866: dw 75,101,121,112,97,100,32,56,0
_S867: dw 75,101,121,112,97,100,32,57,0
_S754: dw 103,108,71,101,116,110,80,105,120,101,108,77,97,112,117,105,118,0
_S529: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,102,118,0
_S314: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,49,117,105,0
_S523: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,100,118,0
_S874: dw 75,101,121,112,97,100,32,61,0
_S744: dw 103,108,71,101,116,110,84,101,120,73,109,97,103,101,0
_S571: dw 103,108,68,101,112,116,104,82,97,110,103,101,73,110,100,101,120,101,100,0
_S243: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,50,102,118,0
_S242: dw 103,108,85,110,105,102,111,114,109,52,105,118,0
_S198: dw 103,108,67,111,109,112,105,108,101,83,104,97,100,101,114,0
_S925: dw 32,120,54,52,0
_S956: dw 103,108,102,119,71,101,116,77,111,110,105,116,111,114,78,97,109,101,40,41,32,102,97,105,108,101,100,46,0
_S939: dw 35,71,76,95,83,84,65,67,75,95,85,78,68,69,82,70,76,79,87,0
_S351: dw 103,108,66,105,110,100,82,101,110,100,101,114,98,117,102,102,101,114,0
_S300: dw 103,108,66,105,110,100,66,117,102,102,101,114,82,97,110,103,101,0
_S570: dw 103,108,68,101,112,116,104,82,97,110,103,101,65,114,114,97,121,118,0
_S394: dw 103,108,80,114,111,118,111,107,105,110,103,86,101,114,116,101,120,0
_S98: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,50,105,118,0
_S622: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,67,97,108,108,98,97,99,107,0
_S723: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,86,101,114,116,101,120,66,117,102,102,101,114,115,0
_S120: dw 103,108,77,117,108,116,84,114,97,110,115,112,111,115,101,77,97,116,114,105,120,100,0
_S119: dw 103,108,77,117,108,116,84,114,97,110,115,112,111,115,101,77,97,116,114,105,120,102,0
_S579: dw 103,108,66,105,110,100,73,109,97,103,101,84,101,120,116,117,114,101,0
_S424: dw 103,108,71,101,116,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,102,118,0
_S857: dw 70,50,48,0
_S875: dw 76,101,102,116,32,83,104,105,102,116,0
_S833: dw 67,97,112,115,32,76,111,99,107,0
_S320: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,51,105,118,0
_S425: dw 103,108,71,101,116,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S476: dw 103,108,71,101,110,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,115,0
_S250: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,49,102,118,0
_S617: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,70,111,114,109,97,116,0
_S524: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,117,105,0
_S603: dw 103,108,71,101,116,80,114,111,103,114,97,109,73,110,116,101,114,102,97,99,101,105,118,0
_S331: dw 103,108,66,105,110,100,70,114,97,103,68,97,116,97,76,111,99,97,116,105,111,110,0
_S294: dw 103,108,71,101,116,73,110,116,101,103,101,114,105,95,118,0
_S358: dw 103,108,68,101,108,101,116,101,70,114,97,109,101,98,117,102,102,101,114,115,0
_S61: dw 120,54,52,0
_S215: dw 103,108,71,101,116,85,110,105,102,111,114,109,76,111,99,97,116,105,111,110,0
_S152: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,115,118,0
_S191: dw 103,108,66,108,101,110,100,69,113,117,97,116,105,111,110,83,101,112,97,114,97,116,101,0
_S709: dw 103,108,66,105,110,100,84,101,120,116,117,114,101,85,110,105,116,0
_S340: dw 103,108,85,110,105,102,111,114,109,52,117,105,118,0
_S364: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,82,101,110,100,101,114,98,117,102,102,101,114,0
_S493: dw 103,108,80,114,111,103,114,97,109,80,97,114,97,109,101,116,101,114,105,0
_S330: dw 103,108,71,101,116,85,110,105,102,111,114,109,117,105,118,0
_S601: dw 103,108,77,117,108,116,105,68,114,97,119,65,114,114,97,121,115,73,110,100,105,114,101,99,116,0
_S978: dw 117,95,108,97,109,112,67,111,108,111,114,0
_S199: dw 103,108,67,114,101,97,116,101,80,114,111,103,114,97,109,0
_S467: dw 103,108,71,101,116,65,99,116,105,118,101,83,117,98,114,111,117,116,105,110,101,85,110,105,102,111,114,109,78,97,109,101,0
_S411: dw 103,108,71,101,116,70,114,97,103,68,97,116,97,73,110,100,101,120,0
_S224: dw 103,108,76,105,110,107,80,114,111,103,114,97,109,0
_S584: dw 103,108,68,114,97,119,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,73,110,115,116,97,110,99,101,100,0
_S349: dw 103,108,71,101,116,83,116,114,105,110,103,105,0
_S591: dw 103,108,67,111,112,121,73,109,97,103,101,83,117,98,68,97,116,97,0
_S434: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,51,117,105,0
_S721: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,69,108,101,109,101,110,116,66,117,102,102,101,114,0
_S606: dw 103,108,71,101,116,80,114,111,103,114,97,109,82,101,115,111,117,114,99,101,105,118,0
_S341: dw 103,108,84,101,120,80,97,114,97,109,101,116,101,114,73,105,118,0
_S219: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,102,118,0
_S142: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,102,118,0
_S983: dw 91,83,93,112,101,99,117,108,97,114,32,108,105,103,104,116,105,110,103,32,105,115,32,79,78,0
_S539: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,100,118,0
_S961: dw 117,95,116,101,120,116,117,114,101,0
_S236: dw 103,108,85,110,105,102,111,114,109,50,102,118,0
_S450: dw 103,108,85,110,105,102,111,114,109,49,100,118,0
_S297: dw 103,108,73,115,69,110,97,98,108,101,100,105,0
_S186: dw 103,108,77,97,112,66,117,102,102,101,114,0
_S442: dw 103,108,66,108,101,110,100,70,117,110,99,105,0
_S58: dw 87,105,110,100,111,119,115,32,49,48,0
_S59: dw 87,105,110,100,111,119,115,32,49,49,0
_S879: dw 82,105,103,104,116,32,83,104,105,102,116,0
_S662: dw 103,108,71,101,116,78,97,109,101,100,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S981: dw 91,76,93,105,103,104,116,32,105,115,32,79,70,70,0
_S884: dw 35,71,76,95,86,69,82,84,69,88,95,83,72,65,68,69,82,0
_S604: dw 103,108,71,101,116,80,114,111,103,114,97,109,82,101,115,111,117,114,99,101,73,110,100,101,120,0
_S417: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S372: dw 103,108,66,105,110,100,86,101,114,116,101,120,65,114,114,97,121,0
_S912: dw 76,111,119,0
_S567: dw 103,108,83,99,105,115,115,111,114,65,114,114,97,121,118,0
_S438: dw 52,48,48,0
_S566: dw 103,108,86,105,101,119,112,111,114,116,73,110,100,101,120,101,100,102,118,0
_S333: dw 103,108,85,110,105,102,111,114,109,49,117,105,0
_S895: dw 41,32,0
_S185: dw 103,108,71,101,116,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S668: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,68,114,97,119,66,117,102,102,101,114,0
_S646: dw 103,108,71,101,116,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,105,95,118,0
_S565: dw 103,108,86,105,101,119,112,111,114,116,73,110,100,101,120,101,100,102,0
_S65: dw 103,108,71,101,116,69,114,114,111,114,40,41,32,105,110,115,105,100,101,32,97,110,32,105,110,102,105,110,105,116,101,32,108,111,111,112,32,40,110,111,32,99,117,114,114,101,110,116,32,99,111,110,116,101,120,116,32,63,41,0
_S53: dw 55,54,48,49,0
_S44: dw 87,105,110,100,111,119,115,32,83,101,114,118,101,114,32,50,48,48,51,0
_S157: dw 103,108,87,105,110,100,111,119,80,111,115,50,102,118,0
_S517: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,117,105,118,0
_S51: dw 87,105,110,100,111,119,115,32,83,101,114,118,101,114,32,50,48,48,56,0
_S489: dw 103,108,68,101,112,116,104,82,97,110,103,101,102,0
_S628: dw 103,108,79,98,106,101,99,116,80,116,114,76,97,98,101,108,0
_S752: dw 103,108,71,101,116,110,77,97,112,105,118,0
_S581: dw 103,108,84,101,120,83,116,111,114,97,103,101,49,68,0
_S680: dw 103,108,71,101,116,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,65,116,116,97,99,104,109,101,110,116,80,97,114,97,109,101,116,101,114,105,118,0
_S521: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,102,118,0
_S699: dw 103,108,67,111,112,121,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,49,68,0
_S515: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,100,118,0
_S900: dw 65,112,112,108,105,99,97,116,105,111,110,0
_S241: dw 103,108,85,110,105,102,111,114,109,51,105,118,0
_S743: dw 103,108,71,101,116,110,67,111,109,112,114,101,115,115,101,100,84,101,120,73,109,97,103,101,0
_S301: dw 103,108,66,105,110,100,66,117,102,102,101,114,66,97,115,101,0
_S594: dw 103,108,71,101,116,73,110,116,101,114,110,97,108,102,111,114,109,97,116,105,54,52,118,0
_S933: dw 65,82,66,95,100,101,98,117,103,95,111,117,116,112,117,116,32,101,120,116,101,110,115,105,111,110,32,110,111,116,32,97,118,97,105,108,97,98,108,101,46,0
_S173: dw 103,108,73,115,81,117,101,114,121,0
_S681: dw 103,108,67,114,101,97,116,101,82,101,110,100,101,114,98,117,102,102,101,114,115,0
_S360: dw 103,108,67,104,101,99,107,70,114,97,109,101,98,117,102,102,101,114,83,116,97,116,117,115,0
_S90: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,49,105,118,0
_S207: dw 103,108,71,101,116,65,99,116,105,118,101,85,110,105,102,111,114,109,0
_S975: dw 117,95,108,105,103,104,116,46,118,65,109,98,105,101,110,116,67,111,108,111,114,0
_S676: dw 103,108,67,108,101,97,114,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,102,105,0
_S180: dw 103,108,68,101,108,101,116,101,66,117,102,102,101,114,115,0
_S423: dw 103,108,71,101,116,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,73,105,118,0
_S674: dw 103,108,67,108,101,97,114,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,117,105,118,0
_S972: dw 117,95,101,121,101,0
_S322: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,49,117,105,118,0
_S319: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,50,105,118,0
_S675: dw 103,108,67,108,101,97,114,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,102,118,0
_S616: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,70,111,114,109,97,116,0
_S561: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,52,100,118,0
_S71: dw 103,108,84,101,120,83,117,98,73,109,97,103,101,51,68,0
_S516: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,117,105,0
_S485: dw 52,49,48,0
_S464: dw 103,108,71,101,116,83,117,98,114,111,117,116,105,110,101,85,110,105,102,111,114,109,76,111,99,97,116,105,111,110,0
_S390: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,66,97,115,101,86,101,114,116,101,120,0
_S62: dw 120,56,54,0
_S305: dw 103,108,66,101,103,105,110,67,111,110,100,105,116,105,111,110,97,108,82,101,110,100,101,114,0
_S774: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,73,110,115,101,114,116,65,82,66,0
_S56: dw 87,105,110,100,111,119,115,32,83,101,114,118,101,114,32,50,48,49,50,0
_S354: dw 103,108,82,101,110,100,101,114,98,117,102,102,101,114,83,116,111,114,97,103,101,0
_S167: dw 103,108,87,105,110,100,111,119,80,111,115,51,105,118,0
_S22: dw 107,66,44,77,66,44,71,66,44,84,66,44,80,66,0
_S211: dw 103,108,71,101,116,80,114,111,103,114,97,109,73,110,102,111,76,111,103,0
_S881: dw 82,105,103,104,116,32,65,108,116,0
_S486: dw 103,108,82,101,108,101,97,115,101,83,104,97,100,101,114,67,111,109,112,105,108,101,114,0
_S468: dw 103,108,71,101,116,65,99,116,105,118,101,83,117,98,114,111,117,116,105,110,101,78,97,109,101,0
_S200: dw 103,108,67,114,101,97,116,101,83,104,97,100,101,114,0
_S384: dw 103,108,71,101,116,65,99,116,105,118,101,85,110,105,102,111,114,109,78,97,109,101,0
_S919: dw 71,76,70,87,32,100,121,110,97,109,105,99,32,108,105,98,114,97,114,121,32,110,111,116,32,102,111,117,110,100,46,0
_S432: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,50,117,105,0
_S582: dw 103,108,84,101,120,83,116,111,114,97,103,101,50,68,0
_S348: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,102,105,0
_S527: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,105,118,0
_S178: dw 103,108,71,101,116,81,117,101,114,121,79,98,106,101,99,116,117,105,118,0
_S700: dw 103,108,67,111,112,121,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,50,68,0
_S536: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,102,118,0
_S408: dw 103,108,83,97,109,112,108,101,77,97,115,107,105,0
_S538: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,100,118,0
_S958: dw 103,108,102,119,71,101,116,86,105,100,101,111,77,111,100,101,115,40,41,32,102,97,105,108,101,100,32,116,111,32,114,101,116,114,105,101,118,101,32,116,104,101,32,108,105,115,116,32,111,102,32,118,105,100,101,111,32,109,111,100,101,115,46,0
_S462: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,51,100,118,0
_S936: dw 35,71,76,95,73,78,86,65,76,73,68,95,86,65,76,85,69,0
_S766: dw 103,108,77,117,108,116,105,68,114,97,119,69,108,101,109,101,110,116,115,73,110,100,105,114,101,99,116,67,111,117,110,116,0
_S235: dw 103,108,85,110,105,102,111,114,109,49,102,118,0
_S819: dw 69,115,99,0
_S54: dw 87,105,110,100,111,119,115,32,55,32,40,83,80,49,41,0
_S347: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,102,118,0
_S953: dw 83,101,116,87,105,110,100,111,119,72,105,110,116,40,41,32,104,105,110,116,32,116,121,112,101,32,105,115,32,105,110,118,97,108,105,100,46,0
_S422: dw 103,108,71,101,116,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S553: dw 103,108,71,101,116,80,114,111,103,114,97,109,80,105,112,101,108,105,110,101,73,110,102,111,76,111,103,0
_S179: dw 103,108,66,105,110,100,66,117,102,102,101,114,0
_S929: dw 32,40,80,66,32,0
_S403: dw 103,108,71,101,116,66,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,54,52,118,0
_S905: dw 80,111,114,116,97,98,105,108,105,116,121,0
_S724: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,65,116,116,114,105,98,66,105,110,100,105,110,103,0
_S691: dw 103,108,84,101,120,116,117,114,101,83,116,111,114,97,103,101,50,68,77,117,108,116,105,115,97,109,112,108,101,0
_S81: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,83,117,98,73,109,97,103,101,49,68,0
_S574: dw 52,50,48,0
_S291: dw 51,48,48,0
_S821: dw 84,97,98,0
_S572: dw 103,108,71,101,116,70,108,111,97,116,105,95,118,0
_S631: dw 103,108,66,117,102,102,101,114,83,116,111,114,97,103,101,0
_S629: dw 103,108,71,101,116,79,98,106,101,99,116,80,116,114,76,97,98,101,108,0
_S494: dw 103,108,85,115,101,80,114,111,103,114,97,109,83,116,97,103,101,115,0
_S636: dw 103,108,66,105,110,100,84,101,120,116,117,114,101,115,0
_S131: dw 49,52,48,42,0
_S883: dw 77,101,110,117,0
_S563: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,76,100,118,0
_S19: dw 43,45,0
_S620: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,67,111,110,116,114,111,108,0
_S649: dw 103,108,78,97,109,101,100,66,117,102,102,101,114,83,116,111,114,97,103,101,0
_S745: dw 103,108,71,101,116,110,85,110,105,102,111,114,109,100,118,0
_S728: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,66,105,110,100,105,110,103,68,105,118,105,115,111,114,0
_S583: dw 103,108,84,101,120,83,116,111,114,97,103,101,51,68,0
_S947: dw 35,77,79,85,83,69,95,66,85,84,84,79,78,95,82,73,71,72,84,0
_S873: dw 75,101,121,112,97,100,32,69,110,116,101,114,0
_S220: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,105,118,0
_S144: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,105,118,0
_S701: dw 103,108,67,111,112,121,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,51,68,0
_S513: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,102,118,0
_S920: dw 83,111,109,101,32,111,102,32,116,104,101,32,71,76,70,87,32,100,121,110,97,109,105,99,97,108,108,121,32,105,109,112,111,114,116,101,100,32,102,117,110,99,116,105,111,110,115,32,97,114,101,32,109,105,115,115,105,110,103,46,0
_S507: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,100,118,0
_S126: dw 103,108,80,111,105,110,116,80,97,114,97,109,101,116,101,114,102,118,0
_S124: dw 103,108,77,117,108,116,105,68,114,97,119,69,108,101,109,101,110,116,115,0
_S240: dw 103,108,85,110,105,102,111,114,109,50,105,118,0
_S223: dw 103,108,73,115,83,104,97,100,101,114,0
_S201: dw 103,108,68,101,108,101,116,101,80,114,111,103,114,97,109,0
_S960: dw 103,108,67,111,109,112,105,108,101,83,104,97,100,101,114,40,41,32,101,114,114,111,114,32,105,110,32,0
_S573: dw 103,108,71,101,116,68,111,117,98,108,101,105,95,118,0
_S836: dw 80,114,105,110,116,32,83,99,114,101,101,110,0
_S968: dw 67,111,110,115,111,108,97,115,0
_S210: dw 103,108,71,101,116,80,114,111,103,114,97,109,105,118,0
_S619: dw 103,108,86,101,114,116,101,120,66,105,110,100,105,110,103,68,105,118,105,115,111,114,0
_S446: dw 103,108,85,110,105,102,111,114,109,49,100,0
_S759: dw 103,108,71,101,116,110,83,101,112,97,114,97,98,108,101,70,105,108,116,101,114,0
_S693: dw 103,108,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,49,68,0
_S227: dw 103,108,85,110,105,102,111,114,109,49,102,0
_S735: dw 103,108,71,101,116,81,117,101,114,121,66,117,102,102,101,114,79,98,106,101,99,116,105,54,52,118,0
_S307: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,80,111,105,110,116,101,114,0
_S231: dw 103,108,85,110,105,102,111,114,109,49,105,0
_S318: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,49,105,118,0
_S374: dw 103,108,71,101,110,86,101,114,116,101,120,65,114,114,97,121,115,0
_S397: dw 103,108,68,101,108,101,116,101,83,121,110,99,0
_S328: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,117,98,118,0
_S560: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,51,100,118,0
_S80: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,83,117,98,73,109,97,103,101,50,68,0
_S985: dw 91,68,93,105,102,102,117,115,101,32,108,105,103,104,116,105,110,103,32,105,115,32,79,78,0
_S508: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,117,105,0
_S303: dw 103,108,71,101,116,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,86,97,114,121,105,110,103,0
_S586: dw 52,51,48,0
_S440: dw 103,108,66,108,101,110,100,69,113,117,97,116,105,111,110,105,0
_S154: dw 103,108,87,105,110,100,111,119,80,111,115,50,100,0
_S376: dw 51,49,48,0
_S353: dw 103,108,71,101,110,82,101,110,100,101,114,98,117,102,102,101,114,115,0
_S830: dw 80,97,103,101,32,68,111,119,110,0
_S156: dw 103,108,87,105,110,100,111,119,80,111,115,50,102,0
_S771: dw 44,32,0
_S31: dw 87,105,110,100,111,119,115,32,78,84,32,51,46,53,49,0
_S911: dw 77,101,100,105,117,109,0
_S772: dw 71,76,95,65,82,66,95,100,101,98,117,103,95,111,117,116,112,117,116,0
_S399: dw 103,108,87,97,105,116,83,121,110,99,0
_S941: dw 35,71,76,95,73,78,86,65,76,73,68,95,70,82,65,77,69,66,85,70,70,69,82,95,79,80,69,82,65,84,73,79,78,0
_S158: dw 103,108,87,105,110,100,111,119,80,111,115,50,105,0
_S405: dw 103,108,84,101,120,73,109,97,103,101,50,68,77,117,108,116,105,115,97,109,112,108,101,0
_S608: dw 103,108,71,101,116,80,114,111,103,114,97,109,82,101,115,111,117,114,99,101,76,111,99,97,116,105,111,110,73,110,100,101,120,0
_S269: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,117,98,118,0
_S418: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,102,0
_S160: dw 103,108,87,105,110,100,111,119,80,111,115,50,115,0
_S159: dw 103,108,87,105,110,100,111,119,80,111,115,50,105,118,0
_S26: dw 92,92,0
_S634: dw 103,108,66,105,110,100,66,117,102,102,101,114,115,66,97,115,101,0
_S642: dw 103,108,67,114,101,97,116,101,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,115,0
_S416: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,105,0
_S525: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,117,105,118,0
_S760: dw 103,108,71,101,116,110,72,105,115,116,111,103,114,97,109,0
_S585: dw 103,108,68,114,97,119,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,83,116,114,101,97,109,73,110,115,116,97,110,99,101,100,0
_S578: dw 103,108,71,101,116,65,99,116,105,118,101,65,116,111,109,105,99,67,111,117,110,116,101,114,66,117,102,102,101,114,105,118,0
_S564: dw 103,108,86,105,101,119,112,111,114,116,65,114,114,97,121,118,0
_S430: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,49,117,105,0
_S977: dw 117,95,108,105,103,104,116,46,115,104,105,110,101,115,115,0
_S980: dw 91,76,93,105,103,104,116,32,105,115,32,79,78,0
_S519: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,51,105,118,0
_S487: dw 103,108,83,104,97,100,101,114,66,105,110,97,114,121,0
_S371: dw 103,108,70,108,117,115,104,77,97,112,112,101,100,66,117,102,102,101,114,82,97,110,103,101,0
_S706: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S904: dw 85,110,100,101,102,105,110,101,100,32,66,101,104,97,118,105,111,117,114,0
_S535: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,102,118,0
_S78: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,73,109,97,103,101,49,68,0
_S48: dw 87,105,110,100,111,119,115,32,86,105,115,116,97,32,40,83,80,49,41,0
_S659: dw 103,108,71,101,116,78,97,109,101,100,66,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S537: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,100,118,0
_S667: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,76,97,121,101,114,0
_S290: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,51,102,118,0
_S461: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,50,100,118,0
_S638: dw 103,108,66,105,110,100,73,109,97,103,101,84,101,120,116,117,114,101,115,0
_S460: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,52,100,118,0
_S654: dw 103,108,67,108,101,97,114,78,97,109,101,100,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S426: dw 103,108,81,117,101,114,121,67,111,117,110,116,101,114,0
_S329: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,117,115,118,0
_S52: dw 87,105,110,100,111,119,115,32,55,0
_S657: dw 103,108,85,110,109,97,112,78,97,109,101,100,66,117,102,102,101,114,0
_S55: dw 87,105,110,100,111,119,115,32,56,0
_S356: dw 103,108,73,115,70,114,97,109,101,98,117,102,102,101,114,0
_S661: dw 103,108,71,101,116,78,97,109,101,100,66,117,102,102,101,114,80,111,105,110,116,101,114,118,0
_S447: dw 103,108,85,110,105,102,111,114,109,50,100,0
_S407: dw 103,108,71,101,116,77,117,108,116,105,115,97,109,112,108,101,102,118,0
_S379: dw 103,108,84,101,120,66,117,102,102,101,114,0
_S694: dw 103,108,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,50,68,0
_S228: dw 103,108,85,110,105,102,111,114,109,50,102,0
_S350: dw 103,108,73,115,82,101,110,100,101,114,98,117,102,102,101,114,0
_S965: dw 48,48,56,46,112,104,111,110,103,46,102,114,97,103,46,103,108,115,108,0
_S323: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,50,117,105,118,0
_S232: dw 103,108,85,110,105,102,111,114,109,50,105,0
_S181: dw 103,108,71,101,110,66,117,102,102,101,114,115,0
_S673: dw 103,108,67,108,101,97,114,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,105,118,0
_S271: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,117,115,118,0
_S377: dw 103,108,68,114,97,119,65,114,114,97,121,115,73,110,115,116,97,110,99,101,100,0
_S600: dw 103,108,73,110,118,97,108,105,100,97,116,101,83,117,98,70,114,97,109,101,98,117,102,102,101,114,0
_S79: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,83,117,98,73,109,97,103,101,51,68,0
_S909: dw 80,111,112,32,71,114,111,117,112,0
_S630: dw 52,52,48,0
_S162: dw 103,108,87,105,110,100,111,119,80,111,115,51,100,0
_S389: dw 51,50,48,0
_S190: dw 50,48,48,0
_S164: dw 103,108,87,105,110,100,111,119,80,111,115,51,102,0
_S596: dw 103,108,73,110,118,97,108,105,100,97,116,101,84,101,120,73,109,97,103,101,0
_S166: dw 103,108,87,105,110,100,111,119,80,111,115,51,105,0
_S739: dw 103,108,77,101,109,111,114,121,66,97,114,114,105,101,114,66,121,82,101,103,105,111,110,0
_S83: dw 49,51,48,42,0
_S891: dw 13,10,0
_S984: dw 91,68,93,105,102,102,117,115,101,32,108,105,103,104,116,105,110,103,32,105,115,32,79,70,70,0
_S479: dw 103,108,82,101,115,117,109,101,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S168: dw 103,108,87,105,110,100,111,119,80,111,115,51,115,0
_S197: dw 103,108,66,105,110,100,65,116,116,114,105,98,76,111,99,97,116,105,111,110,0
_S136: dw 103,108,70,111,103,67,111,111,114,100,80,111,105,110,116,101,114,0
_S910: dw 72,105,103,104,0
_S887: dw 35,71,76,95,67,79,77,80,85,84,69,95,83,72,65,68,69,82,0
_S835: dw 78,117,109,32,76,111,99,107,0
_S225: dw 103,108,83,104,97,100,101,114,83,111,117,114,99,101,0
_S361: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,49,68,0
_S964: dw 48,48,56,46,112,104,111,110,103,46,118,101,114,116,46,103,108,115,108,0
_S746: dw 103,108,71,101,116,110,85,110,105,102,111,114,109,102,118,0
_S204: dw 103,108,68,105,115,97,98,108,101,86,101,114,116,101,120,65,116,116,114,105,98,65,114,114,97,121,0
_S769: dw 83,111,109,101,32,102,117,110,99,116,105,111,110,115,32,101,110,116,114,121,32,112,111,105,110,116,32,119,101,114,101,32,110,111,116,32,102,111,117,110,100,46,0
_S597: dw 103,108,73,110,118,97,108,105,100,97,116,101,66,117,102,102,101,114,83,117,98,68,97,116,97,0
_S551: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,51,100,118,0
_S505: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,102,118,0
_S77: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,73,109,97,103,101,50,68,0
_S50: dw 87,105,110,100,111,119,115,32,86,105,115,116,97,32,40,83,80,50,41,0
_S979: dw 70,80,83,58,32,0
_S239: dw 103,108,85,110,105,102,111,114,109,49,105,118,0
_S621: dw 103,108,68,101,98,117,103,77,101,115,115,97,103,101,73,110,115,101,114,116,0
_S345: dw 103,108,67,108,101,97,114,66,117,102,102,101,114,105,118,0
_S116: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,115,118,0
_S602: dw 103,108,77,117,108,116,105,68,114,97,119,69,108,101,109,101,110,116,115,73,110,100,105,114,101,99,116,0
_S448: dw 103,108,85,110,105,102,111,114,109,51,100,0
_S213: dw 103,108,71,101,116,83,104,97,100,101,114,73,110,102,111,76,111,103,0
_S265: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,98,118,0
_S695: dw 103,108,84,101,120,116,117,114,101,83,117,98,73,109,97,103,101,51,68,0
_S229: dw 103,108,85,110,105,102,111,114,109,51,102,0
_S226: dw 103,108,85,115,101,80,114,111,103,114,97,109,0
_S736: dw 103,108,71,101,116,81,117,101,114,121,66,117,102,102,101,114,79,98,106,101,99,116,105,118,0
_S233: dw 103,108,85,110,105,102,111,114,109,51,105,0
_S930: dw 32,109,115,0
_S592: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,0
_S559: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,50,100,118,0
_S967: dw 48,48,56,46,108,105,103,104,116,46,102,114,97,103,46,103,108,115,108,0
_S829: dw 80,97,103,101,32,85,112,0
_S344: dw 103,108,71,101,116,84,101,120,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S823: dw 73,110,115,0
_S431: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,49,117,105,118,0
_S640: dw 52,53,48,0
_S182: dw 103,108,73,115,66,117,102,102,101,114,0
_S409: dw 51,51,48,0
_S359: dw 103,108,71,101,110,70,114,97,109,101,98,117,102,102,101,114,115,0
_S284: dw 50,49,48,0
_S776: dw 103,108,71,101,116,68,101,98,117,103,77,101,115,115,97,103,101,76,111,103,65,82,66,0
_S123: dw 103,108,77,117,108,116,105,68,114,97,119,65,114,114,97,121,115,0
_S272: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,98,118,0
_S837: dw 80,97,117,115,101,0
_S473: dw 103,108,80,97,116,99,104,80,97,114,97,109,101,116,101,114,102,118,0
_S365: dw 103,108,71,101,116,70,114,97,109,101,98,117,102,102,101,114,65,116,116,97,99,104,109,101,110,116,80,97,114,97,109,101,116,101,114,105,118,0
_S496: dw 103,108,67,114,101,97,116,101,83,104,97,100,101,114,80,114,111,103,114,97,109,118,0
_S130: dw 103,108,66,108,101,110,100,69,113,117,97,116,105,111,110,0
_S593: dw 103,108,71,101,116,70,114,97,109,101,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S568: dw 103,108,83,99,105,115,115,111,114,73,110,100,101,120,101,100,0
_S470: dw 103,108,71,101,116,85,110,105,102,111,114,109,83,117,98,114,111,117,116,105,110,101,117,105,118,0
_S569: dw 103,108,83,99,105,115,115,111,114,73,110,100,101,120,101,100,118,0
_S712: dw 103,108,71,101,116,84,101,120,116,117,114,101,76,101,118,101,108,80,97,114,97,109,101,116,101,114,102,118,0
_S488: dw 103,108,71,101,116,83,104,97,100,101,114,80,114,101,99,105,115,105,111,110,70,111,114,109,97,116,0
_S421: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,73,117,105,118,0
_S703: dw 103,108,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,102,118,0
_S150: dw 103,108,83,101,99,111,110,100,97,114,121,67,111,108,111,114,51,117,105,118,0
_S392: dw 103,108,68,114,97,119,69,108,101,109,101,110,116,115,73,110,115,116,97,110,99,101,100,66,97,115,101,86,101,114,116,101,120,0
_S362: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,50,68,0
_S481: dw 103,108,68,114,97,119,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,83,116,114,101,97,109,0
_S293: dw 103,108,71,101,116,66,111,111,108,101,97,110,105,95,118,0
_S511: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,105,118,0
_S70: dw 103,108,84,101,120,73,109,97,103,101,51,68,0
_S955: dw 69,114,114,111,114,32,103,101,116,116,105,110,103,32,116,104,101,32,108,105,115,116,32,111,102,32,109,111,110,105,116,111,114,115,46,0
_S128: dw 103,108,80,111,105,110,116,80,97,114,97,109,101,116,101,114,105,118,0
_S76: dw 103,108,67,111,109,112,114,101,115,115,101,100,84,101,120,73,109,97,103,101,51,68,0
_S554: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,49,100,0
_S534: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,50,102,118,0
_S966: dw 48,48,56,46,108,105,103,104,116,46,118,101,114,116,46,103,108,115,108,0
_S599: dw 103,108,73,110,118,97,108,105,100,97,116,101,70,114,97,109,101,98,117,102,102,101,114,0
_S288: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,50,102,118,0
_S664: dw 103,108,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,82,101,110,100,101,114,98,117,102,102,101,114,0
_S289: dw 103,108,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,52,102,118,0
_S196: dw 103,108,65,116,116,97,99,104,83,104,97,100,101,114,0
_S267: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,115,118,0
_S710: dw 103,108,71,101,116,84,101,120,116,117,114,101,73,109,97,103,101,0
_S921: dw 103,108,102,119,95,76,111,97,100,40,41,32,114,101,116,117,114,110,32,99,111,100,101,32,119,97,115,32,117,110,101,120,112,101,99,116,101,100,46,0
_S722: dw 103,108,86,101,114,116,101,120,65,114,114,97,121,86,101,114,116,101,120,66,117,102,102,101,114,0
_S715: dw 103,108,71,101,116,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,73,105,118,0
_S75: dw 103,108,83,97,109,112,108,101,67,111,118,101,114,97,103,101,0
_S309: dw 103,108,71,101,116,86,101,114,116,101,120,65,116,116,114,105,98,73,117,105,118,0
_S894: dw 32,40,69,114,114,67,111,100,101,32,61,32,0
_S299: dw 103,108,69,110,100,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S187: dw 103,108,85,110,109,97,112,66,117,102,102,101,114,0
_S483: dw 103,108,69,110,100,81,117,101,114,121,73,110,100,101,120,101,100,0
_S449: dw 103,108,85,110,105,102,111,114,109,52,100,0
_S230: dw 103,108,85,110,105,102,111,114,109,52,102,0
_S477: dw 103,108,73,115,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,0
_S205: dw 103,108,69,110,97,98,108,101,86,101,114,116,101,120,65,116,116,114,105,98,65,114,114,97,121,0
_S945: dw 83,101,116,67,117,114,115,111,114,77,111,100,101,40,41,32,115,112,101,99,105,102,105,101,100,32,109,111,100,101,32,105,115,32,105,110,118,97,108,105,100,46,0
_S382: dw 103,108,71,101,116,85,110,105,102,111,114,109,73,110,100,105,99,101,115,0
_S279: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,115,118,0
_S234: dw 103,108,85,110,105,102,111,114,109,52,105,0
_S110: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,52,100,118,0
_S932: dw 32,110,115,0
_S466: dw 103,108,71,101,116,65,99,116,105,118,101,83,117,98,114,111,117,116,105,110,101,85,110,105,102,111,114,109,105,118,0
_S388: dw 103,108,85,110,105,102,111,114,109,66,108,111,99,107,66,105,110,100,105,110,103,0
_S902: dw 69,114,114,111,114,0
_S506: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,100,0
_S125: dw 103,108,80,111,105,110,116,80,97,114,97,109,101,116,101,114,102,0
_S598: dw 103,108,73,110,118,97,108,105,100,97,116,101,66,117,102,102,101,114,68,97,116,97,0
_S504: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,102,0
_S283: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,80,111,105,110,116,101,114,0
_S824: dw 68,101,108,0
_S357: dw 103,108,66,105,110,100,70,114,97,109,101,98,117,102,102,101,114,0
_S127: dw 103,108,80,111,105,110,116,80,97,114,97,109,101,116,101,114,105,0
_S692: dw 103,108,84,101,120,116,117,114,101,83,116,111,114,97,103,101,51,68,77,117,108,116,105,115,97,109,112,108,101,0
_S502: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,49,105,0
_S482: dw 103,108,66,101,103,105,110,81,117,101,114,121,73,110,100,101,120,101,100,0
_S763: dw 52,54,48,0
_S737: dw 103,108,71,101,116,81,117,101,114,121,66,117,102,102,101,114,79,98,106,101,99,116,117,105,54,52,118,0
_S765: dw 103,108,77,117,108,116,105,68,114,97,119,65,114,114,97,121,115,73,110,100,105,114,101,99,116,67,111,117,110,116,0
_S889: dw 35,71,76,95,84,69,83,83,95,69,86,65,76,85,65,84,73,79,78,95,83,72,65,68,69,82,0
_S326: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,98,118,0
_S731: dw 103,108,71,101,116,86,101,114,116,101,120,65,114,114,97,121,73,110,100,101,120,101,100,54,52,105,118,0
_S611: dw 103,108,84,101,120,83,116,111,114,97,103,101,50,68,77,117,108,116,105,115,97,109,112,108,101,0
_S908: dw 80,117,115,104,32,71,114,111,117,112,0
_S685: dw 103,108,67,114,101,97,116,101,84,101,120,116,117,114,101,115,0
_S730: dw 103,108,71,101,116,86,101,114,116,101,120,65,114,114,97,121,73,110,100,101,120,101,100,105,118,0
_S387: dw 103,108,71,101,116,65,99,116,105,118,101,85,110,105,102,111,114,109,66,108,111,99,107,78,97,109,101,0
_S825: dw 82,105,103,104,116,0
_S768: dw 79,75,0
_S888: dw 35,71,76,95,84,69,83,83,95,67,79,78,84,82,79,76,95,83,72,65,68,69,82,0
_S337: dw 103,108,85,110,105,102,111,114,109,49,117,105,118,0
_S533: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,52,117,105,118,0
_S363: dw 103,108,70,114,97,109,101,98,117,102,102,101,114,84,101,120,116,117,114,101,51,68,0
_S641: dw 103,108,67,108,105,112,67,111,110,116,114,111,108,0
_S609: dw 103,108,83,104,97,100,101,114,83,116,111,114,97,103,101,66,108,111,99,107,66,105,110,100,105,110,103,0
_S545: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,51,102,118,0
_S914: dw 83,114,99,58,32,0
_S549: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,52,120,50,100,118,0
_S396: dw 103,108,73,115,83,121,110,99,0
_S555: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,50,100,0
_S550: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,77,97,116,114,105,120,51,120,52,100,118,0
_S645: dw 103,108,71,101,116,84,114,97,110,115,102,111,114,109,70,101,101,100,98,97,99,107,105,118,0
_S906: dw 80,101,114,102,111,114,109,97,110,99,101,0
_S877: dw 76,101,102,116,32,65,108,116,0
_S420: dw 103,108,83,97,109,112,108,101,114,80,97,114,97,109,101,116,101,114,73,105,118,0
_S679: dw 103,108,71,101,116,78,97,109,101,100,70,114,97,109,101,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S952: dw 87,105,110,100,111,119,32,67,97,108,108,66,97,99,107,32,116,121,112,101,32,105,115,32,105,110,118,97,108,105,100,46,0
_S108: dw 103,108,77,117,108,116,105,84,101,120,67,111,111,114,100,51,115,118,0
_S43: dw 87,105,110,100,111,119,115,32,88,80,0
_S896: dw 65,80,73,0
_S391: dw 103,108,68,114,97,119,82,97,110,103,101,69,108,101,109,101,110,116,115,66,97,115,101,86,101,114,116,101,120,0
_S327: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,52,115,118,0
_S206: dw 103,108,71,101,116,65,99,116,105,118,101,65,116,116,114,105,98,0
_S878: dw 76,101,102,116,32,83,117,112,101,114,0
_S655: dw 103,108,77,97,112,78,97,109,101,100,66,117,102,102,101,114,0
_S734: dw 103,108,67,114,101,97,116,101,81,117,101,114,105,101,115,0
_S324: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,73,51,117,105,118,0
_S514: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,100,0
_S280: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,117,98,118,0
_S708: dw 103,108,71,101,110,101,114,97,116,101,84,101,120,116,117,114,101,77,105,112,109,97,112,0
_S512: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,102,0
_S558: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,76,49,100,118,0
_S69: dw 103,108,68,114,97,119,82,97,110,103,101,69,108,101,109,101,110,116,115,0
_S510: dw 103,108,80,114,111,103,114,97,109,85,110,105,102,111,114,109,50,105,0
_S714: dw 103,108,71,101,116,84,101,120,116,117,114,101,80,97,114,97,109,101,116,101,114,102,118,0
_S355: dw 103,108,71,101,116,82,101,110,100,101,114,98,117,102,102,101,114,80,97,114,97,109,101,116,101,114,105,118,0
_S575: dw 103,108,68,114,97,119,65,114,114,97,121,115,73,110,115,116,97,110,99,101,100,66,97,115,101,73,110,115,116,97,110,99,101,0
_S274: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,100,118,0
_S406: dw 103,108,84,101,120,73,109,97,103,101,51,68,77,117,108,116,105,115,97,109,112,108,101,0
_S36: dw 87,105,110,100,111,119,115,32,78,84,32,52,46,48,0
_S268: dw 103,108,86,101,114,116,101,120,65,116,116,114,105,98,52,78,117,98,0
_S613: dw 103,108,84,101,120,116,117,114,101,86,105,101,119,0
_S632: dw 103,108,67,108,101,97,114,84,101,120,73,109,97,103,101,0
_S892: dw 71,76,83,76,0
pb_public PB_NullString
  dw     0
public _SYS_StaticStringEnd
_SYS_StaticStringEnd:
pb_align 8
F1: dd 1132396544
F2: dd 0
F3: dd 1065353216
F4: dd 1073741824
F5: dd 1016003125
F6: dd -1073741824
F7: dd 1148846080
F8: dd 1120403456
F9: dd 1117782016
F10: dd 1080033280
F11: dd 1050253722
F12: dd 1048576000
F13: dd 1058642330
F14: dd 1053609165
F15: dd 1051931443
F16: dd 1045220557
F17: dd 1041865114
F18: dd 1036831949
F19: dd 1114636288
F20: dd 1101004800
F21: dd 1092616192
D1: dd 0,1081073664
D2: dd 0,0
D3: dd -1571644103,1066524486
D4: dd 0,1073741824
D5: dd 0,1072693248
D6: dd -350469331,1058682594
D7: dd 0,1083129856
D8: dd 0,1075838976
D9: dd 0,1075052544
D10: dd 0,1073217536
pb_align 8
pb_align 8
s_s:
  dq     0
  dq     -1
s_sgl.sgl_obj:
  dq     -3,32,48,s_sgl.sgl_keyboard
  dq     -4,156,8,1,8,s_s
  dq     -1
s_sgl.bitmapfontdata:
  dq     0
  dq     -4,96,24,1,7,s_sgl.bitmapfontrange
  dq     -1
s_sgl.shaderobjects:
  dq     -5,0,8,0,21
  dq     -1
s_sgl.bitmapfontrange:
  dq     -4,16,48,1,7,0
  dq     -1
s_sgl.sgl_keyboard:
  dq     -4,0,8,349,21,0
  dq     -4,8,8,190,21,0
  dq     -4,16,8,190,8,s_s
  dq     -4,24,16,190,7,0
  dq     -1
s_glload.glload_obj:
  dq     0
  dq     8
  dq     -1
s_rendertext.bmfont:
  dq     0
  dq     -4,112,24,1,7,s_sgl.bitmapfontrange
  dq     -1
pb_align 8
so_render.rendertext.v_firstRun dd 1
  dd     0
so_render.v_orbit dd 1119092736
; 
section '.bss' readable writeable
_PB_BSSSection:
pb_bssalign 8
; 
I_BSSStart:
_PB_MemoryBase:
PB_MemoryBase: rq 1
_PB_Instance:
PB_Instance: rq 1
PB_ExitCode: rq 1
; 
pb_bssalign 8
v_gShader rq 1
v_gWin rq 1
PB_DataPointer rq 1
v_gLightOn rq 1
v_gLightShader rq 1
v_gLightVao rq 1
v_gTimer rq 1
v_gFon rq 1
v_gSpecularOn rq 1
v_gVao rq 1
v_gDiffuseOn rq 1
v_gVSync rq 1
gl.v_glGetProgramResourceLocation_ rq 1
gl.v_glInvalidateTexImage_ rq 1
gl.v_glTextureParameterIiv_ rq 1
gl.v_glSecondaryColor3sv_ rq 1
gl.v_glGetRenderbufferParameteriv_ rq 1
gl.v_glIsBuffer_ rq 1
gl.v_glDeleteSync_ rq 1
gl.v_glSecondaryColor3i_ rq 1
gl.v_glProgramUniform2f_ rq 1
gl.v_glProgramUniform1d_ rq 1
gl.v_glViewportIndexedfv_ rq 1
gl.v_glGetnConvolutionFilter_ rq 1
gl.v_glProgramUniform4ui_ rq 1
gl.v_glWindowPos2f_ rq 1
gl.v_glDrawArraysInstanced_ rq 1
gl.v_glGetSamplerParameterIuiv_ rq 1
gl.v_glDrawBuffers_ rq 1
gl.v_glVertexAttribI1uiv_ rq 1
gl.v_glUniform4i_ rq 1
gl.v_glDeleteBuffers_ rq 1
gl.v_glInvalidateTexSubImage_ rq 1
gl.v_glTexBuffer_ rq 1
gl.v_glMultiTexCoord4s_ rq 1
gl.v_glGetProgramResourceiv_ rq 1
gl.v_glViewportArrayv_ rq 1
gl.v_glVertexAttribI4usv_ rq 1
gl.v_glWindowPos2dv_ rq 1
gl.v_glProgramUniform3uiv_ rq 1
gl.v_glGetActiveSubroutineUniformName_ rq 1
gl.v_glGetQueryiv_ rq 1
gl.v_glClientWaitSync_ rq 1
gl.v_glProgramUniformMatrix4fv_ rq 1
gl.v_glCopyTextureSubImage3D_ rq 1
gl.v_glScissorIndexed_ rq 1
gl.v_glVertexAttrib4Nub_ rq 1
gl.v_glVertexAttribL2d_ rq 1
gl.v_glProgramUniformMatrix3x2dv_ rq 1
gl.v_glUniform2ui_ rq 1
gl.v_glSecondaryColorPointer_ rq 1
gl.v_glGetnUniformfv_ rq 1
gl.v_glStencilMaskSeparate_ rq 1
gl.v_glDeleteVertexArrays_ rq 1
gl.v_glProgramUniform3i_ rq 1
gl.v_glVertexAttribL1dv_ rq 1
gl.v_glGetSynciv_ rq 1
gl.v_glBlendEquation_ rq 1
gl.v_glEnableVertexArrayAttrib_ rq 1
gl.v_glWindowPos3i_ rq 1
gl.v_glVertexBindingDivisor_ rq 1
gl.v_glBindImageTexture_ rq 1
gl.v_glGetNamedBufferPointerv_ rq 1
gl.v_glVertexAttrib4uiv_ rq 1
gl.v_glDebugMessageCallback_ rq 1
gl.v_glVertexAttrib3fv_ rq 1
gl.v_glCompressedTexSubImage1D_ rq 1
gl.v_glBeginQueryIndexed_ rq 1
gl.v_glClearDepthf_ rq 1
gl.v_glBlendFunci_ rq 1
gl.v_glBindFramebuffer_ rq 1
gl.v_glVertexAttrib4Nusv_ rq 1
gl.v_glPointParameteri_ rq 1
gl.v_glUniform4fv_ rq 1
gl.v_glVertexAttrib4s_ rq 1
gl.v_glUniformMatrix2fv_ rq 1
gl.v_glGetActiveUniformsiv_ rq 1
gl.v_glUniform2f_ rq 1
gl.v_glEnableVertexAttribArray_ rq 1
gl.v_glUniform1d_ rq 1
gl.v_glVertexAttribI2ui_ rq 1
gl.v_glGetProgramPipelineInfoLog_ rq 1
gl.v_glVertexAttrib1sv_ rq 1
gl.v_glUniformMatrix2x3fv_ rq 1
gl.v_glShaderBinary_ rq 1
gl.v_glTexStorage3D_ rq 1
gl.v_glVertexArrayAttribIFormat_ rq 1
gl.v_glDisablei_ rq 1
gl.v_glFramebufferTexture2D_ rq 1
gl.v_glBeginQuery_ rq 1
gl.v_glRenderbufferStorageMultisample_ rq 1
gl.v_glActiveShaderProgram_ rq 1
gl.v_glSecondaryColor3bv_ rq 1
gl.v_glVertexAttribBinding_ rq 1
gl.v_glMultiTexCoord4d_ rq 1
gl.v_glGetTextureLevelParameterfv_ rq 1
gl.v_glSamplerParameterIiv_ rq 1
gl.v_glProgramUniformMatrix3dv_ rq 1
gl.v_glBindTextures_ rq 1
gl.v_glProgramUniform1fv_ rq 1
gl.v_glProgramUniform3iv_ rq 1
gl.v_glDrawElementsInstancedBaseVertexBaseInstance_ rq 1
gl.v_glProgramUniformMatrix2x4dv_ rq 1
gl.v_glGetBooleani_v_ rq 1
gl.v_glClipControl_ rq 1
gl.v_glProgramUniformMatrix4x2fv_ rq 1
gl.v_glGetnHistogram_ rq 1
gl.v_glDeleteShader_ rq 1
gl.v_glDispatchComputeIndirect_ rq 1
gl.v_glCreateProgram_ rq 1
gl.v_glNamedBufferData_ rq 1
gl.v_glUniform3uiv_ rq 1
gl.v_glTransformFeedbackBufferBase_ rq 1
gl.v_glProgramUniform1f_ rq 1
gl.v_glBlendEquationSeparate_ rq 1
gl.v_glTextureParameteri_ rq 1
gl.v_glBufferStorage_ rq 1
gl.v_glGetQueryBufferObjectiv_ rq 1
gl.v_glScissorArrayv_ rq 1
gl.v_glGetIntegeri_v_ rq 1
gl.v_glMultiTexCoord2fv_ rq 1
gl.v_glVertexAttrib2dv_ rq 1
gl.v_glMultTransposeMatrixd_ rq 1
gl.v_glMultiTexCoord4iv_ rq 1
gl.v_glObjectLabel_ rq 1
gl.v_glVertexAttribI4ubv_ rq 1
gl.v_glGenVertexArrays_ rq 1
gl.v_glUniform3dv_ rq 1
gl.v_glUniform3i_ rq 1
gl.v_glMultiTexCoord3s_ rq 1
gl.v_glUniform1iv_ rq 1
gl.v_glDrawElementsIndirect_ rq 1
gl.v_glClearNamedFramebufferfi_ rq 1
gl.v_glVertexArrayElementBuffer_ rq 1
gl.v_glVertexAttribP1ui_ rq 1
gl.v_glDrawElementsInstancedBaseInstance_ rq 1
gl.v_glVertexAttrib4d_ rq 1
gl.v_glVertexArrayVertexBuffer_ rq 1
gl.v_glTextureBarrier_ rq 1
gl.v_glCompileShader_ rq 1
gl.v_glBlendFuncSeparate_ rq 1
gl.v_glCreateBuffers_ rq 1
gl.v_glTexParameterIuiv_ rq 1
gl.v_glCopyBufferSubData_ rq 1
gl.v_glDeleteProgramPipelines_ rq 1
gl.v_glGetSubroutineIndex_ rq 1
gl.v_glCopyTextureSubImage2D_ rq 1
gl.v_glVertexAttribL1d_ rq 1
gl.v_glProgramUniformMatrix3x4fv_ rq 1
gl.v_glUseProgramStages_ rq 1
gl.v_glDrawTransformFeedbackStream_ rq 1
gl.v_glWindowPos2sv_ rq 1
gl.v_glSamplerParameteriv_ rq 1
gl.v_glMultiDrawArraysIndirectCount_ rq 1
gl.v_glProgramBinary_ rq 1
gl.v_glProgramUniform2i_ rq 1
gl.v_glFramebufferRenderbuffer_ rq 1
gl.v_glClearTexImage_ rq 1
gl.v_glScissorIndexedv_ rq 1
gl.v_glVertexAttrib4Nubv_ rq 1
gl.v_glVertexAttribI1iv_ rq 1
gl.v_glTexStorage3DMultisample_ rq 1
gl.v_glIsSampler_ rq 1
gl.v_glWindowPos2i_ rq 1
gl.v_glGetFloati_v_ rq 1
gl.v_glGenerateMipmap_ rq 1
gl.v_glMultiTexCoord1dv_ rq 1
gl.v_glMemoryBarrier_ rq 1
gl.v_glVertexAttribP1uiv_ rq 1
gl.v_glClearNamedBufferData_ rq 1
gl.v_glVertexAttrib3s_ rq 1
gl.v_glGetUniformfv_ rq 1
gl.v_glUniform1f_ rq 1
gl.v_glNamedFramebufferRenderbuffer_ rq 1
gl.v_glAttachShader_ rq 1
gl.v_glGetNamedFramebufferAttachmentParameteriv_ rq 1
gl.v_glGetSamplerParameteriv_ rq 1
gl.v_glUniformMatrix3x2fv_ rq 1
gl.v_glCopyNamedBufferSubData_ rq 1
gl.v_glTexStorage2D_ rq 1
gl.v_glPointParameteriv_ rq 1
gl.v_glCreateRenderbuffers_ rq 1
gl.v_glDrawTransformFeedbackInstanced_ rq 1
gl.v_glFramebufferTexture1D_ rq 1
gl.v_glWindowPos3dv_ rq 1
gl.v_glGetFragDataIndex_ rq 1
gl.v_glGetCompressedTextureSubImage_ rq 1
gl.v_glGetQueryObjectiv_ rq 1
gl.v_glMultiTexCoord4f_ rq 1
gl.v_glMultiTexCoord3d_ rq 1
gl.v_glCreateVertexArrays_ rq 1
gl.v_glGetnMapfv_ rq 1
gl.v_glGetVertexAttribiv_ rq 1
gl.v_glSecondaryColor3iv_ rq 1
gl.v_glNamedFramebufferParameteri_ rq 1
gl.v_glValidateProgramPipeline_ rq 1
gl.v_glUniform3ui_ rq 1
gl.v_glPatchParameteri_ rq 1
gl.v_glGetTransformFeedbacki_v_ rq 1
gl.v_glBindFragDataLocationIndexed_ rq 1
gl.v_glVertexAttribL2dv_ rq 1
gl.v_glTextureView_ rq 1
gl.v_glGetVertexArrayIndexed64iv_ rq 1
gl.v_glGetInteger64i_v_ rq 1
gl.v_glMultTransposeMatrixf_ rq 1
gl.v_glVertexAttrib4fv_ rq 1
gl.v_glVertexAttribIFormat_ rq 1
gl.v_glGenTransformFeedbacks_ rq 1
gl.v_glGetProgramBinary_ rq 1
gl.v_glUniform2i_ rq 1
gl.v_glUniformMatrix3fv_ rq 1
gl.v_glBindProgramPipeline_ rq 1
gl.v_glVertexAttribI4uiv_ rq 1
gl.v_glGetVertexArrayiv_ rq 1
gl.v_glVertexAttribI3ui_ rq 1
gl.v_glMultiTexCoord2s_ rq 1
gl.v_glIsTransformFeedback_ rq 1
gl.v_glVertexAttrib2sv_ rq 1
gl.v_glUniformMatrix2x4fv_ rq 1
gl.v_glNamedBufferStorage_ rq 1
gl.v_glClearBufferfv_ rq 1
gl.v_glProgramUniform2uiv_ rq 1
gl.v_glVertexAttrib4f_ rq 1
gl.v_glVertexAttrib3d_ rq 1
gl.v_glGetnPixelMapfv_ rq 1
gl.v_glGetNamedBufferParameteri64v_ rq 1
gl.v_glProgramUniformMatrix4dv_ rq 1
gl.v_glActiveTexture_ rq 1
gl.v_glCopyTextureSubImage1D_ rq 1
gl.v_glNamedFramebufferDrawBuffer_ rq 1
gl.v_glProgramUniform2fv_ rq 1
gl.v_glProgramUniform4iv_ rq 1
gl.v_glGetQueryObjectuiv_ rq 1
gl.v_glCreateShaderProgramv_ rq 1
gl.v_glGetnUniformdv_ rq 1
gl.v_glShaderStorageBlockBinding_ rq 1
gl.v_glProgramUniformMatrix4x3fv_ rq 1
gl.v_glDrawTransformFeedback_ rq 1
gl.v_glGetCompressedTexImage_ rq 1
gl.v_glClientActiveTexture_ rq 1
gl.v_glGetShaderiv_ rq 1
gl.v_glMultiDrawArraysIndirect_ rq 1
gl.v_glProgramUniform1i_ rq 1
gl.v_glFramebufferTextureLayer_ rq 1
gl.v_glGetProgramResourceLocationIndex_ rq 1
gl.v_glVertexAttrib4Nuiv_ rq 1
gl.v_glUseProgram_ rq 1
gl.v_glMultiTexCoord3fv_ rq 1
gl.v_glClearBufferData_ rq 1
gl.v_glVertexAttrib3dv_ rq 1
gl.v_glGetProgramResourceIndex_ rq 1
gl.v_glGetDoublei_v_ rq 1
gl.v_glUnmapNamedBuffer_ rq 1
gl.v_glGetTextureParameterIiv_ rq 1
gl.v_glUniform4dv_ rq 1
gl.v_glBlendColor_ rq 1
gl.v_glUniformMatrix2dv_ rq 1
gl.v_glVertexAttrib2s_ rq 1
gl.v_glMinSampleShading_ rq 1
gl.v_glBufferSubData_ rq 1
gl.v_glGetnCompressedTexImage_ rq 1
gl.v_glMultiTexCoord1sv_ rq 1
gl.v_glUniform2iv_ rq 1
gl.v_glCompressedTextureSubImage3D_ rq 1
gl.v_glNamedFramebufferTextureLayer_ rq 1
gl.v_glUniformMatrix2x3dv_ rq 1
gl.v_glBlitNamedFramebuffer_ rq 1
gl.v_glEndQueryIndexed_ rq 1
gl.v_glBeginTransformFeedback_ rq 1
gl.v_glTexStorage1D_ rq 1
gl.v_glObjectPtrLabel_ rq 1
gl.v_glVertexAttribP2ui_ rq 1
gl.v_glDrawTransformFeedbackStreamInstanced_ rq 1
gl.v_glCreateTransformFeedbacks_ rq 1
gl.v_glMultiTexCoord3f_ rq 1
gl.v_glMultiTexCoord2d_ rq 1
gl.v_glPauseTransformFeedback_ rq 1
gl.v_glProgramUniform1dv_ rq 1
gl.v_glGenQueries_ rq 1
gl.v_glProgramUniformMatrix4x2dv_ rq 1
gl.v_glWindowPos3sv_ rq 1
gl.v_glBindFragDataLocation_ rq 1
gl.v_glLinkProgram_ rq 1
gl.v_glBlendEquationSeparatei_ rq 1
gl.v_glUniform2uiv_ rq 1
gl.v_glInvalidateBufferData_ rq 1
gl.v_glVertexAttribI2iv_ rq 1
gl.v_glVertexAttribIPointer_ rq 1
gl.v_glTexStorage2DMultisample_ rq 1
gl.v_glDispatchCompute_ rq 1
gl.v_glMultiTexCoord2dv_ rq 1
gl.v_glVertexArrayVertexBuffers_ rq 1
gl.v_glTransformFeedbackVaryings_ rq 1
gl.v_glGetQueryBufferObjectuiv_ rq 1
gl.v_glUniform1i_ rq 1
gl.v_glIsVertexArray_ rq 1
gl.v_glMultiTexCoord1s_ rq 1
gl.v_glGetNamedFramebufferParameteriv_ rq 1
gl.v_glGetActiveAttrib_ rq 1
gl.v_glGetActiveUniformBlockiv_ rq 1
gl.v_glVertexArrayAttribLFormat_ rq 1
gl.v_glVertexAttrib3f_ rq 1
gl.v_glVertexAttrib2d_ rq 1
gl.v_glMultiTexCoord4i_ rq 1
gl.v_glBlitFramebuffer_ rq 1
gl.v_glWindowPos2iv_ rq 1
gl.v_glMultiDrawElements_ rq 1
gl.v_glProgramUniformMatrix3x4dv_ rq 1
gl.v_glUniform4ui_ rq 1
gl.v_glGetBufferSubData_ rq 1
gl.v_glDeleteFramebuffers_ rq 1
gl.v_glDepthRangef_ rq 1
gl.v_glGetQueryIndexediv_ rq 1
gl.v_glDrawArraysIndirect_ rq 1
gl.v_glSamplerParameterf_ rq 1
gl.v_glRenderbufferStorage_ rq 1
gl.v_glGetProgramResourceName_ rq 1
gl.v_glVertexAttribL3dv_ rq 1
gl.v_glGetActiveUniformBlockName_ rq 1
gl.v_glGetFramebufferParameteriv_ rq 1
gl.v_glSpecializeShader_ rq 1
gl.v_glInvalidateNamedFramebufferSubData_ rq 1
gl.v_glGetSamplerParameterIiv_ rq 1
gl.v_glMapNamedBuffer_ rq 1
gl.v_glDrawArraysInstancedBaseInstance_ rq 1
gl.v_glGetProgramiv_ rq 1
gl.v_glGetDebugMessageLog_ rq 1
gl.v_glProgramUniform1ui_ rq 1
gl.v_glTextureStorage3DMultisample_ rq 1
gl.v_glDeleteRenderbuffers_ rq 1
gl.v_glEndTransformFeedback_ rq 1
gl.v_glVertexAttribP4uiv_ rq 1
gl.v_glBindRenderbuffer_ rq 1
gl.v_glValidateProgram_ rq 1
gl.v_glGetUniformdv_ rq 1
gl.v_glVertexAttrib1s_ rq 1
gl.v_glUniformMatrix4fv_ rq 1
gl.v_glIsShader_ rq 1
gl.v_glVertexAttribI4ui_ rq 1
gl.v_glVertexAttrib3sv_ rq 1
gl.v_glCompressedTextureSubImage2D_ rq 1
gl.v_glTextureSubImage3D_ rq 1
gl.v_glUniformMatrix3x2dv_ rq 1
gl.v_glFogCoordfv_ rq 1
gl.v_glCompressedTexImage3D_ rq 1
gl.v_glIsSync_ rq 1
gl.v_glCopyImageSubData_ rq 1
gl.v_glGetNamedRenderbufferParameteriv_ rq 1
gl.v_glGetTextureSubImage_ rq 1
gl.v_glIsProgramPipeline_ rq 1
gl.v_glGetnPolygonStipple_ rq 1
gl.v_glGetObjectLabel_ rq 1
gl.v_glMultiTexCoord2f_ rq 1
gl.v_glMultiTexCoord1d_ rq 1
gl.v_glGetProgramPipelineiv_ rq 1
gl.v_glTextureParameteriv_ rq 1
gl.v_glGetnMapdv_ rq 1
gl.v_glGetTextureImage_ rq 1
gl.v_glBindImageTextures_ rq 1
gl.v_glDrawElementsInstanced_ rq 1
gl.v_glProgramUniform3fv_ rq 1
gl.v_glClearBufferfi_ rq 1
gl.v_glNamedBufferSubData_ rq 1
gl.v_glWaitSync_ rq 1
gl.v_glDrawElementsBaseVertex_ rq 1
gl.v_glBindSampler_ rq 1
gl.v_glGetTransformFeedbacki64_v_ rq 1
gl.v_glGetVertexArrayIndexediv_ rq 1
gl.v_glTexImage3DMultisample_ rq 1
gl.v_glGenProgramPipelines_ rq 1
gl.v_glMapBufferRange_ rq 1
gl.v_glGetQueryBufferObjecti64v_ rq 1
gl.v_glBindBuffer_ rq 1
gl.v_glMultiTexCoord4fv_ rq 1
gl.v_glVertexAttribI4sv_ rq 1
gl.v_glVertexAttrib4dv_ rq 1
gl.v_glGenFramebuffers_ rq 1
gl.v_glGetTextureParameteriv_ rq 1
gl.v_glSecondaryColor3ub_ rq 1
gl.v_glGenerateTextureMipmap_ rq 1
gl.v_glUniformMatrix3dv_ rq 1
gl.v_glVertexAttribI3uiv_ rq 1
gl.v_glMultiTexCoord2sv_ rq 1
gl.v_glGetUniformIndices_ rq 1
gl.v_glUniform1fv_ rq 1
gl.v_glUniform3iv_ rq 1
gl.v_glGetNamedBufferSubData_ rq 1
gl.v_glUniformMatrix2x4dv_ rq 1
gl.v_glVertexAttrib4Nsv_ rq 1
gl.v_glReadnPixels_ rq 1
gl.v_glUniformMatrix4x2fv_ rq 1
gl.v_glIsFramebuffer_ rq 1
gl.v_glUnmapBuffer_ rq 1
gl.v_glVertexAttribP3ui_ rq 1
gl.v_glBindBufferRange_ rq 1
gl.v_glGetActiveUniformName_ rq 1
gl.v_glVertexAttrib2f_ rq 1
gl.v_glCopyTexSubImage3D_ rq 1
gl.v_glProgramUniform1uiv_ rq 1
gl.v_glVertexAttrib1d_ rq 1
gl.v_glMultiTexCoord3i_ rq 1
gl.v_glClearBufferSubData_ rq 1
gl.v_glGetCompressedTextureImage_ rq 1
gl.v_glProgramUniform2dv_ rq 1
gl.v_glGetQueryObjectui64v_ rq 1
gl.v_glProgramUniformMatrix4x3dv_ rq 1
gl.v_glVertexAttribI4i_ rq 1
gl.v_glGetUniformLocation_ rq 1
gl.v_glVertexArrayBindingDivisor_ rq 1
gl.v_glSamplerParameterfv_ rq 1
gl.v_glGetActiveSubroutineName_ rq 1
gl.v_glGetnPixelMapusv_ rq 1
gl.v_glNamedFramebufferTexture_ rq 1
gl.v_glFogCoordPointer_ rq 1
gl.v_glSecondaryColor3us_ rq 1
gl.v_glVertexAttribI3iv_ rq 1
gl.v_glGetBufferParameteri64v_ rq 1
gl.v_glBindVertexBuffer_ rq 1
gl.v_glNamedFramebufferDrawBuffers_ rq 1
gl.v_glGetTexParameterIiv_ rq 1
gl.v_glSecondaryColor3b_ rq 1
gl.v_glMultiTexCoord3dv_ rq 1
gl.v_glGetShaderInfoLog_ rq 1
gl.v_glMultiDrawArrays_ rq 1
gl.v_glVertexAttribLFormat_ rq 1
gl.v_glDisableVertexArrayAttrib_ rq 1
gl.v_glMultiTexCoord1iv_ rq 1
gl.v_glClearNamedFramebufferiv_ rq 1
gl.v_glTextureStorage3D_ rq 1
gl.v_glFramebufferParameteri_ rq 1
gl.v_glUniformBlockBinding_ rq 1
gl.v_glGetnSeparableFilter_ rq 1
gl.v_glCompressedTextureSubImage1D_ rq 1
gl.v_glTextureSubImage2D_ rq 1
gl.v_glGetSamplerParameterfv_ rq 1
gl.v_glEnablei_ rq 1
gl.v_glUniformMatrix3x4fv_ rq 1
gl.v_glCreateProgramPipelines_ rq 1
gl.v_glDrawRangeElementsBaseVertex_ rq 1
gl.v_glPointParameterfv_ rq 1
gl.v_glCompressedTexImage2D_ rq 1
gl.v_glPushDebugGroup_ rq 1
gl.v_glProvokingVertex_ rq 1
gl.v_glMapNamedBufferRange_ rq 1
gl.v_glDisableVertexAttribArray_ rq 1
gl.v_glCreateFramebuffers_ rq 1
gl.v_glClearNamedBufferSubData_ rq 1
gl.v_glGetQueryObjecti64v_ rq 1
gl.v_glMapBuffer_ rq 1
gl.v_glMultiTexCoord1f_ rq 1
gl.v_glGetInternalformati64v_ rq 1
gl.v_glWindowPos3iv_ rq 1
gl.v_glGetVertexAttribfv_ rq 1
gl.v_glSecondaryColor3fv_ rq 1
gl.v_glClearBufferuiv_ rq 1
gl.v_glSecondaryColor3usv_ rq 1
gl.v_glInvalidateBufferSubData_ rq 1
gl.v_glGetBufferPointerv_ rq 1
gl.v_glGetVertexAttribIiv_ rq 1
gl.v_glSecondaryColor3s_ rq 1
gl.v_glPolygonOffsetClamp_ rq 1
gl.v_glDebugMessageControl_ rq 1
gl.v_glMultiDrawElementsBaseVertex_ rq 1
gl.v_glVertexAttribI4bv_ rq 1
gl.v_glBlendEquationi_ rq 1
gl.v_glSamplerParameteri_ rq 1
gl.v_glUniform1uiv_ rq 1
gl.v_glVertexAttribL4dv_ rq 1
gl.v_glProgramParameteri_ rq 1
gl.v_glBindTextureUnit_ rq 1
gl.v_glGetUniformSubroutineuiv_ rq 1
gl.v_glTextureBufferRange_ rq 1
gl.v_glGetActiveSubroutineUniformiv_ rq 1
gl.v_glProgramUniform4d_ rq 1
gl.v_glGetFramebufferAttachmentParameteriv_ rq 1
gl.v_glDeleteQueries_ rq 1
gl.v_glGetProgramInterfaceiv_ rq 1
gl.v_glVertexAttrib4Nbv_ rq 1
gl.v_glProgramUniform2ui_ rq 1
gl.v_glGetActiveUniform_ rq 1
gl.v_glGetQueryBufferObjectui64v_ rq 1
gl.v_glTexBufferRange_ rq 1
gl.v_glTextureStorage2DMultisample_ rq 1
gl.v_glVertexAttribDivisor_ rq 1
gl.v_glLoadTransposeMatrixd_ rq 1
gl.v_glFramebufferTexture_ rq 1
gl.v_glVertexAttrib4sv_ rq 1
gl.v_glGetTransformFeedbackiv_ rq 1
gl.v_glTextureParameterIuiv_ rq 1
gl.v_glStencilFuncSeparate_ rq 1
gl.v_glMultiDrawElementsIndirect_ rq 1
gl.v_glStencilOpSeparate_ rq 1
gl.v_glGetnColorTable_ rq 1
gl.v_glVertexAttrib1f_ rq 1
gl.v_glMultiTexCoord2i_ rq 1
gl.v_glGetProgramStageiv_ rq 1
gl.v_glGetVertexAttribIuiv_ rq 1
gl.v_glShaderSource_ rq 1
gl.v_glGenSamplers_ rq 1
gl.v_glProgramUniform4fv_ rq 1
gl.v_glDetachShader_ rq 1
gl.v_glProgramUniformMatrix2fv_ rq 1
gl.v_glVertexAttribI3i_ rq 1
gl.v_glBeginConditionalRender_ rq 1
gl.v_glProgramUniformMatrix2x3fv_ rq 1
gl.v_glReleaseShaderCompiler_ rq 1
gl.v_glGetnUniformiv_ rq 1
gl.v_glDrawElementsInstancedBaseVertex_ rq 1
gl.v_glBindBuffersBase_ rq 1
gl.v_glWindowPos3s_ rq 1
gl.v_glClearNamedFramebufferuiv_ rq 1
gl.v_glTexImage2DMultisample_ rq 1
gl.v_glSecondaryColor3d_ rq 1
gl.v_glIsProgram_ rq 1
gl.v_glBindTransformFeedback_ rq 1
gl.v_glDepthRangeArrayv_ rq 1
gl.v_glVertexAttrib1fv_ rq 1
gl.v_glTexSubImage3D_ rq 1
gl.v_glClearTexSubImage_ rq 1
gl.v_glVertexAttribP3uiv_ rq 1
gl.v_glTextureStorage2D_ rq 1
gl.v_glCheckNamedFramebufferStatus_ rq 1
gl.v_glUniformMatrix4dv_ rq 1
gl.v_glFenceSync_ rq 1
gl.v_glMultiTexCoord3sv_ rq 1
gl.v_glUniform2fv_ rq 1
gl.v_glTextureSubImage1D_ rq 1
gl.v_glUniform4iv_ rq 1
gl.v_glEndQuery_ rq 1
gl.v_glNamedRenderbufferStorage_ rq 1
gl.v_glUniformMatrix4x3fv_ rq 1
gl.v_glBufferData_ rq 1
gl.v_glFogCoorddv_ rq 1
gl.v_glUniform4d_ rq 1
gl.v_glCompressedTexImage1D_ rq 1
gl.v_glVertexAttribP4ui_ rq 1
gl.v_glFlushMappedBufferRange_ rq 1
gl.v_glSecondaryColor3ubv_ rq 1
gl.v_glGetUniformBlockIndex_ rq 1
gl.v_glSamplerParameterIuiv_ rq 1
gl.v_glProgramUniform3dv_ rq 1
gl.v_glTexParameterIiv_ rq 1
gl.v_glGetTextureLevelParameteriv_ rq 1
gl.v_glBindVertexBuffers_ rq 1
gl.v_glProgramUniform1iv_ rq 1
gl.v_glGetProgramInfoLog_ rq 1
gl.v_glCreateSamplers_ rq 1
gl.v_glVertexAttribI4iv_ rq 1
gl.v_glGenBuffers_ rq 1
gl.v_glProgramUniform4f_ rq 1
gl.v_glProgramUniform3d_ rq 1
gl.v_glMultiTexCoord4dv_ rq 1
gl.v_glVertexAttrib4bv_ rq 1
gl.v_glGetMultisamplefv_ rq 1
gl.v_glNamedRenderbufferStorageMultisample_ rq 1
gl.v_glGetAttribLocation_ rq 1
gl.v_glWindowPos3d_ rq 1
gl.v_glMultiTexCoord2iv_ rq 1
gl.v_glVertexAttrib4Niv_ rq 1
gl.v_glVertexAttribPointer_ rq 1
gl.v_glLoadTransposeMatrixf_ rq 1
gl.v_glFogCoordd_ rq 1
gl.v_glUniform1dv_ rq 1
gl.v_glVertexAttribI2uiv_ rq 1
gl.v_glCreateQueries_ rq 1
gl.v_glMultiDrawElementsIndirectCount_ rq 1
gl.v_glGetnTexImage_ rq 1
gl.v_glUniformMatrix4x2dv_ rq 1
gl.v_glClampColor_ rq 1
gl.v_glTexImage3D_ rq 1
gl.v_glMultiTexCoord1i_ rq 1
gl.v_glIsQuery_ rq 1
gl.v_glEndConditionalRender_ rq 1
gl.v_glGetGraphicsResetStatus_ rq 1
gl.v_glTextureBuffer_ rq 1
gl.v_glProgramUniform4uiv_ rq 1
gl.v_glWindowPos2fv_ rq 1
gl.v_glBindAttribLocation_ rq 1
gl.v_glVertexArrayAttribFormat_ rq 1
gl.v_glGetVertexAttribLdv_ rq 1
gl.v_glInvalidateNamedFramebufferData_ rq 1
gl.v_glGetnPixelMapuiv_ rq 1
gl.v_glGetNamedBufferParameteriv_ rq 1
gl.v_glSampleMaski_ rq 1
gl.v_glVertexAttribI2i_ rq 1
gl.v_glGetAttachedShaders_ rq 1
gl.v_glVertexAttribL4d_ rq 1
gl.v_glProgramUniformMatrix3x2fv_ rq 1
gl.v_glGetSubroutineUniformLocation_ rq 1
gl.v_glDeleteTransformFeedbacks_ rq 1
gl.v_glGenRenderbuffers_ rq 1
gl.v_glTransformFeedbackBufferRange_ rq 1
gl.v_glWindowPos2s_ rq 1
gl.v_glSecondaryColor3f_ rq 1
gl.v_glIsRenderbuffer_ rq 1
gl.v_glFlushMappedNamedBufferRange_ rq 1
gl.v_glProgramUniform3ui_ rq 1
gl.v_glGetTransformFeedbackVarying_ rq 1
gl.v_glDeleteSamplers_ rq 1
gl.v_glCompressedTexSubImage3D_ rq 1
gl.v_glTextureStorage1D_ rq 1
gl.v_glVertexAttrib4usv_ rq 1
gl.v_glSampleCoverage_ rq 1
gl.v_glBlendFuncSeparatei_ rq 1
gl.v_glDebugMessageInsert_ rq 1
gl.v_glUniformMatrix3x4dv_ rq 1
gl.v_glGetUniformiv_ rq 1
gl.v_glGetnMinmax_ rq 1
gl.v_glUniform4f_ rq 1
gl.v_glUniform3d_ rq 1
gl.v_glTextureParameterfv_ rq 1
gl.v_glSecondaryColor3uiv_ rq 1
gl.v_glDepthRangeIndexed_ rq 1
gl.v_glViewportIndexedf_ rq 1
gl.v_glGetVertexAttribdv_ rq 1
gl.v_glSecondaryColor3dv_ rq 1
gl.v_glInvalidateFramebuffer_ rq 1
gl.v_glProgramUniformMatrix3fv_ rq 1
gl.v_glGetnMapiv_ rq 1
gl.v_glProgramUniformMatrix2x4fv_ rq 1
gl.v_glUniform1ui_ rq 1
gl.v_glGetUniformuiv_ rq 1
gl.v_glUniform4uiv_ rq 1
gl.v_glMemoryBarrierByRegion_ rq 1
gl.v_glProgramUniform3f_ rq 1
gl.v_glProgramUniform2d_ rq 1
gl.v_glPopDebugGroup_ rq 1
gl.v_glGetVertexAttribPointerv_ rq 1
gl.v_glGetObjectPtrLabel_ rq 1
gl.v_glVertexAttribLPointer_ rq 1
gl.v_glWindowPos3f_ rq 1
gl.v_glWindowPos2d_ rq 1
gl.v_glGetTextureParameterfv_ rq 1
gl.v_glVertexAttrib2fv_ rq 1
gl.v_glVertexAttrib4iv_ rq 1
gl.v_glDrawRangeElements_ rq 1
gl.v_glFogCoordf_ rq 1
gl.v_glPointParameterf_ rq 1
gl.v_glMultiTexCoord4sv_ rq 1
gl.v_glUniform3fv_ rq 1
gl.v_glBindBufferBase_ rq 1
gl.v_glVertexAttribI1ui_ rq 1
gl.v_glGetnUniformuiv_ rq 1
gl.v_glCreateShader_ rq 1
gl.v_glClearBufferiv_ rq 1
gl.v_glProgramUniform4dv_ rq 1
gl.v_glProgramUniformMatrix2dv_ rq 1
gl.v_glVertexAttribI1i_ rq 1
gl.v_glCreateTextures_ rq 1
gl.v_glVertexAttribL3d_ rq 1
gl.v_glProgramUniform2iv_ rq 1
gl.v_glProgramUniformMatrix2x3dv_ rq 1
gl.v_glPatchParameterfv_ rq 1
gl.v_glPrimitiveRestartIndex_ rq 1
gl.v_glUniformSubroutinesuiv_ rq 1
gl.v_glBindSamplers_ rq 1
gl.v_glInvalidateSubFramebuffer_ rq 1
gl.v_glResumeTransformFeedback_ rq 1
gl.v_glBindBuffersRange_ rq 1
gl.v_glVertexArrayAttribBinding_ rq 1
gl.v_glVertexAttribFormat_ rq 1
gl.v_glProgramUniform4i_ rq 1
gl.v_glVertexAttrib4ubv_ rq 1
gl.v_glGetTextureParameterIuiv_ rq 1
gl.v_glGetBufferParameteriv_ rq 1
gl.v_glTextureParameterf_ rq 1
gl.v_glBindVertexArray_ rq 1
gl.v_glSecondaryColor3ui_ rq 1
gl.v_glColorMaski_ rq 1
gl.v_glGetShaderSource_ rq 1
gl.v_glMultiTexCoord1fv_ rq 1
gl.v_glVertexAttrib1dv_ rq 1
gl.v_glMultiTexCoord3iv_ rq 1
gl.v_glCheckFramebufferStatus_ rq 1
gl.v_glCompressedTexSubImage2D_ rq 1
gl.v_glVertexAttribP2uiv_ rq 1
gl.v_glClearNamedFramebufferfv_ rq 1
gl.v_glGetTexParameterIuiv_ rq 1
gl.v_glQueryCounter_ rq 1
gl.v_glGetInteger64v_ rq 1
gl.v_glIsEnabledi_ rq 1
gl.v_glUniform2dv_ rq 1
gl.v_glUniformMatrix4x3dv_ rq 1
gl.v_glGetFragDataLocation_ rq 1
gl.v_glUniform3f_ rq 1
gl.v_glNamedFramebufferReadBuffer_ rq 1
gl.v_glUniform2d_ rq 1
gl.v_glGetActiveAtomicCounterBufferiv_ rq 1
gl.v_glGetStringi_ rq 1
gl.v_glFramebufferTexture3D_ rq 1
gl.v_glWindowPos3fv_ rq 1
gl.v_glDeleteProgram_ rq 1
gl.v_glGetShaderPrecisionFormat_ rq 1
pb_bssalign 8
sgl.v_SGL rb 444
glload.v_GLLOAD rb 48
pb_bssalign 8
so_render.rendertext.v_vao rq 1
so_render.rendertext.v_vbo rq 1
so_render.rendertext.v_ibo rq 1
so_render.rendertext.v_shader rq 1
so_render.rendertext.v_u_texture rq 1
so_render.rendertext.v_u_color rq 1
so_render.rendertext.v_u_projection rq 1
so_render.rendertext.p_vertices rq 1
so_render.rendertext.p_indices rq 1
so_render.rendertext.v_storageCount rq 1
so_render.v_rot rd 1
pb_bssalign 8
pb_bssalign 8
I_BSSEnd:
section '.data' data readable writeable
sgl.ll_setwindowdefaulticon_icon_mask:
PB_DataSectionStart:
  dw     32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,0
  dw     32,32,32,32,32,48,48,48,48,48,48,32,32,32,32,32,0
  dw     32,32,32,32,48,32,32,32,32,32,32,32,32,32,32,32,0
  dw     32,32,32,32,48,32,32,32,32,32,32,32,32,32,32,32,0
  dw     32,32,32,32,32,48,48,48,48,48,32,32,32,32,32,32,0
  dw     32,32,32,32,32,32,32,32,32,32,48,32,32,32,32,32,0
  dw     32,32,32,32,32,32,32,32,32,32,48,32,32,32,32,32,0
  dw     32,32,32,32,48,48,48,48,48,48,32,32,32,32,32,32,0
  dw     32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,0
  dw     32,32,48,48,48,48,48,32,32,32,48,32,32,32,32,32,0
  dw     32,48,32,32,32,32,32,32,32,32,48,32,32,32,32,32,0
  dw     32,48,32,32,32,32,32,32,32,32,48,32,32,32,32,32,0
  dw     32,48,32,32,48,48,48,32,32,32,48,32,32,32,32,32,0
  dw     32,48,32,32,32,32,48,32,32,32,48,32,32,32,32,32,0
  dw     32,32,48,48,48,48,32,32,32,32,48,48,48,48,48,32,0
  dw     32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,0
rendertext.l_vertex:
file "N:\sgl\extras\RenderText_330\rt.vert.glsl"
rendertext.l_vertex_end:
rendertext.l_fragment:
file "N:\sgl\extras\RenderText_330\rt.frag.glsl"
rendertext.l_fragment_end:
ll_setupdata_startdata_1:
  dd     -1090519040,-1090519040,1056964608
  dd     1056964608,-1090519040,1056964608
  dd     1056964608,1056964608,1056964608
  dd     -1090519040,1056964608,1056964608
  dd     -1090519040,-1090519040,-1090519040
  dd     -1090519040,1056964608,-1090519040
  dd     1056964608,1056964608,-1090519040
  dd     1056964608,-1090519040,-1090519040
  dd     -1090519040,1056964608,-1090519040
  dd     -1090519040,1056964608,1056964608
  dd     1056964608,1056964608,1056964608
  dd     1056964608,1056964608,-1090519040
  dd     -1090519040,-1090519040,-1090519040
  dd     1056964608,-1090519040,-1090519040
  dd     1056964608,-1090519040,1056964608
  dd     -1090519040,-1090519040,1056964608
  dd     1056964608,-1090519040,-1090519040
  dd     1056964608,1056964608,-1090519040
  dd     1056964608,1056964608,1056964608
  dd     1056964608,-1090519040,1056964608
  dd     -1090519040,-1090519040,-1090519040
  dd     -1090519040,-1090519040,1056964608
  dd     -1090519040,1056964608,1056964608
  dd     -1090519040,1056964608,-1090519040
ll_setupdata_startdata_2:
  dd     -1082130432,-1082130432,1065353216,1065353216,0,0,0,0,1065353216
  dd     1065353216,-1082130432,1065353216,1065353216,0,0,0,0,1065353216
  dd     1065353216,1065353216,1065353216,1065353216,0,0,0,0,1065353216
  dd     -1082130432,1065353216,1065353216,1065353216,0,0,0,0,1065353216
  dd     -1082130432,-1082130432,-1082130432,0,1065353216,0,0,0,-1082130432
  dd     -1082130432,1065353216,-1082130432,0,1065353216,0,0,0,-1082130432
  dd     1065353216,1065353216,-1082130432,0,1065353216,0,0,0,-1082130432
  dd     1065353216,-1082130432,-1082130432,0,1065353216,0,0,0,-1082130432
  dd     -1082130432,1065353216,-1082130432,0,0,1065353216,0,1065353216,0
  dd     -1082130432,1065353216,1065353216,0,0,1065353216,0,1065353216,0
  dd     1065353216,1065353216,1065353216,0,0,1065353216,0,1065353216,0
  dd     1065353216,1065353216,-1082130432,0,0,1065353216,0,1065353216,0
  dd     -1082130432,-1082130432,-1082130432,1065353216,1065353216,0,0,-1082130432,0
  dd     1065353216,-1082130432,-1082130432,1065353216,1065353216,0,0,-1082130432,0
  dd     1065353216,-1082130432,1065353216,1065353216,1065353216,0,0,-1082130432,0
  dd     -1082130432,-1082130432,1065353216,1065353216,1065353216,0,0,-1082130432,0
  dd     1065353216,-1082130432,-1082130432,0,1065353216,1065353216,1065353216,0,0
  dd     1065353216,1065353216,-1082130432,0,1065353216,1065353216,1065353216,0,0
  dd     1065353216,1065353216,1065353216,0,1065353216,1065353216,1065353216,0,0
  dd     1065353216,-1082130432,1065353216,0,1065353216,1065353216,1065353216,0,0
  dd     -1082130432,-1082130432,-1082130432,1065353216,0,1065353216,-1082130432,0,0
  dd     -1082130432,-1082130432,1065353216,1065353216,0,1065353216,-1082130432,0,0
  dd     -1082130432,1065353216,1065353216,1065353216,0,1065353216,-1082130432,0,0
  dd     -1082130432,1065353216,-1082130432,1065353216,0,1065353216,-1082130432,0,0
ll_setupdata_startdata_3:
  dd     0,1,2,2,3,0
  dd     4,5,6,6,7,4
  dd     8,9,10,10,11,8
  dd     12,13,14,14,15,12
  dd     16,17,18,18,19,16
  dd     20,21,22,22,23,20
SYS_EndDataSection:
