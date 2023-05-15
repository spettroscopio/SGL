; *********************************************************************************************************************
; glfwLoad.pb
; by Luis
;
; glfw 3.3.8 functions importer.
; Must be used in conjunction of glfw.pbi (where the symbols and constants are defined).
; Must be configured through a configuration module named glfw_config (see examples)
;
; Tested on: Windows (x86, x64), Linux (x64)
;
; 1.0, Apr 12 2023, PB 6.01
; Splitted from glfw.pbi in its own module to be usable with glfwLoad::Load()
; *********************************************************************************************************************

DeclareModule glfwLoad
 
EnableExplicit
 
Declare.i    Load()
Declare      Shutdown()
 
;- GLFW LOAD ERROR CONSTANTS 

#LOAD_OK = 0
#LOAD_DLL_NOT_FOUND = 1
#LOAD_MISSING_IMPORTED_FUNCS = 2

EndDeclareModule

Module glfwLoad

UseModule glfw
 
CompilerIf glfw_config::#LINK_DYNAMIC = 1

; If the distributed executable requires the dynamic library it will look for it inside its own directory or ./lib or ./bin

#DLL_PATH_CURRENT_DIR$ = "./" ; same dir of the executable
#DLL_PATH_LIB_DIR$ = "./lib/" ; ./lib just below the executable
#DLL_PATH_BIN_DIR$ = "./bin/" ; ./bin just below the executable
#DLL_PATH_DEVELOP_DIR$ = #PB_Compiler_FilePath + "lib/" ; only when compiled from the IDE in the dev environment

Structure GLFW_OBJ
 hglfw.i
 MissingEntries.i
EndStructure : Global GLFW.GLFW_OBJ

Procedure InsideIDE()
 ; Checks if the program is running inside the PB IDE or not.
 ; Returns 0 if the program is currently executed as standalone, or 1 if it is executed from the PB ide.
 ; http://www.purebasic.fr/english/viewtopic.php?p=372778#p372778
  
 If FindString(GetFilePart(ProgramFilename()),"PureBasic_Compilation", 1, #PB_String_NoCase)
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure.i GPA (func$) ; get address from the name of the func
 Protected *fp = GetFunction(GLFW\hglfw, func$) 
 If *fp = 0
    GLFW\MissingEntries + 1    
    DebuggerWarning("glfw function " + #DQUOTE$ + func$ + #DQUOTE$ + " not found.")
 EndIf
 ProcedureReturn *fp
EndProcedure

;- DYNAMIC LINKING

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
  #GLFW_LIBRARY_NAME$ = "glfw3.x86.dll"
 CompilerElse   
  #GLFW_LIBRARY_NAME$ = "glfw3.x64.dll"
 CompilerEndIf
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
  CompilerError "On Linux the library has been built for x64 only."
 CompilerElse   
  #GLFW_LIBRARY_NAME$ = "glfw3.x64.so"
 CompilerEndIf
CompilerEndIf

Procedure.i Load()
 Protected hglfw

 ; try dynamic library from the exe path
 hglfw = OpenLibrary(#PB_Any, #DLL_PATH_CURRENT_DIR$ + #GLFW_LIBRARY_NAME$) 
 
 ; try dynamic library from the predefined directory below the exe path: ./lib
 If hglfw = 0
    hglfw = OpenLibrary(#PB_Any, #DLL_PATH_LIB_DIR$ + #GLFW_LIBRARY_NAME$) 
 EndIf

 ; try dynamic library from the predefined directory below the exe path: ./bin
 If hglfw = 0
    hglfw = OpenLibrary(#PB_Any, #DLL_PATH_BIN_DIR$ + #GLFW_LIBRARY_NAME$) 
 EndIf

 ; try dynamic library from the predefined directory for the development environment
 If hglfw = 0 And InsideIDE()    
    hglfw = OpenLibrary(#PB_Any, #DLL_PATH_DEVELOP_DIR$ + #GLFW_LIBRARY_NAME$) 
 EndIf
  
 If hglfw 
    GLFW\hglfw = hglfw
    
    glfwInit = GPA("glfwInit")
    glfwTerminate = GPA("glfwTerminate")
    glfwInitHint = GPA("glfwInitHint")
    glfwGetVersion = GPA("glfwGetVersion")
    glfwGetVersionString = GPA("glfwGetVersionString")
    glfwGetError = GPA("glfwGetError")
    glfwSetErrorCallback = GPA("glfwSetErrorCallback")
    glfwGetMonitors = GPA("glfwGetMonitors")
    glfwGetPrimaryMonitor = GPA("glfwGetPrimaryMonitor")
    glfwGetMonitorPos = GPA("glfwGetMonitorPos")
    glfwGetMonitorWorkarea = GPA("glfwGetMonitorWorkarea")
    glfwGetMonitorPhysicalSize = GPA("glfwGetMonitorPhysicalSize")
    glfwGetMonitorContentScale = GPA("glfwGetMonitorContentScale")
    glfwGetMonitorName = GPA("glfwGetMonitorName")
    glfwSetMonitorUserPointer = GPA("glfwSetMonitorUserPointer")
    glfwGetMonitorUserPointer = GPA("glfwGetMonitorUserPointer")
    glfwSetMonitorCallback = GPA("glfwSetMonitorCallback")
    glfwGetVideoModes = GPA("glfwGetVideoModes")
    glfwGetVideoMode = GPA("glfwGetVideoMode")
    glfwSetGamma = GPA("glfwSetGamma")
    glfwGetGammaRamp = GPA("glfwGetGammaRamp")
    glfwSetGammaRamp = GPA("glfwSetGammaRamp")
    glfwDefaultWindowHints = GPA("glfwDefaultWindowHints")
    glfwWindowHint = GPA("glfwWindowHint")
    glfwWindowHintString = GPA("glfwWindowHintString")
    glfwCreateWindow = GPA("glfwCreateWindow")
    glfwDestroyWindow = GPA("glfwDestroyWindow")
    glfwWindowShouldClose = GPA("glfwWindowShouldClose")
    glfwSetWindowShouldClose = GPA("glfwSetWindowShouldClose")
    glfwSetWindowTitle = GPA("glfwSetWindowTitle")
    glfwSetWindowIcon = GPA("glfwSetWindowIcon")
    glfwGetWindowPos = GPA("glfwGetWindowPos")
    glfwSetWindowPos = GPA("glfwSetWindowPos")
    glfwGetWindowSize = GPA("glfwGetWindowSize")
    glfwSetWindowSizeLimits = GPA("glfwSetWindowSizeLimits")
    glfwSetWindowAspectRatio = GPA("glfwSetWindowAspectRatio")
    glfwSetWindowSize = GPA("glfwSetWindowSize")
    glfwGetFramebufferSize = GPA("glfwGetFramebufferSize")
    glfwGetWindowFrameSize = GPA("glfwGetWindowFrameSize")
    glfwGetWindowContentScale = GPA("glfwGetWindowContentScale")
    glfwGetWindowOpacity = GPA("glfwGetWindowOpacity")
    glfwSetWindowOpacity = GPA("glfwSetWindowOpacity")
    glfwIconifyWindow = GPA("glfwIconifyWindow")
    glfwRestoreWindow = GPA("glfwRestoreWindow")
    glfwMaximizeWindow = GPA("glfwMaximizeWindow")
    glfwShowWindow = GPA("glfwShowWindow")
    glfwHideWindow = GPA("glfwHideWindow")
    glfwFocusWindow = GPA("glfwFocusWindow")
    glfwRequestWindowAttention = GPA("glfwRequestWindowAttention")
    glfwGetWindowMonitor = GPA("glfwGetWindowMonitor")
    glfwSetWindowMonitor = GPA("glfwSetWindowMonitor")
    glfwGetWindowAttrib = GPA("glfwGetWindowAttrib")
    glfwSetWindowUserPointer = GPA("glfwSetWindowUserPointer")
    glfwGetWindowUserPointer = GPA("glfwGetWindowUserPointer")
    glfwSetWindowPosCallback = GPA("glfwSetWindowPosCallback")
    glfwSetWindowSizeCallback = GPA("glfwSetWindowSizeCallback")
    glfwSetWindowCloseCallback = GPA("glfwSetWindowCloseCallback")
    glfwSetWindowRefreshCallback = GPA("glfwSetWindowRefreshCallback")
    glfwSetWindowFocusCallback = GPA("glfwSetWindowFocusCallback")
    glfwSetWindowIconifyCallback = GPA("glfwSetWindowIconifyCallback")
    glfwSetWindowMaximizeCallback = GPA("glfwSetWindowMaximizeCallback")    
    glfwSetFramebufferSizeCallback = GPA("glfwSetFramebufferSizeCallback")
    glfwSetWindowContentScaleCallback = GPA("glfwSetWindowContentScaleCallback")
    glfwPollEvents = GPA("glfwPollEvents")
    glfwWaitEvents = GPA("glfwWaitEvents")
    glfwWaitEventsTimeout = GPA("glfwWaitEventsTimeout")
    glfwPostEmptyEvent = GPA("glfwPostEmptyEvent")
    glfwGetInputMode = GPA("glfwGetInputMode")
    glfwSetInputMode = GPA("glfwSetInputMode")
    glfwRawMouseMotionSupported = GPA("glfwRawMouseMotionSupported")
    glfwGetKeyName = GPA("glfwGetKeyName")
    glfwGetKeyScancode = GPA("glfwGetKeyScancode")
    glfwGetKey = GPA("glfwGetKey")
    glfwGetMouseButton = GPA("glfwGetMouseButton")
    glfwGetCursorPos = GPA("glfwGetCursorPos")
    glfwSetCursorPos = GPA("glfwSetCursorPos")
    glfwCreateCursor = GPA("glfwCreateCursor")
    glfwCreateStandardCursor = GPA("glfwCreateStandardCursor")
    glfwDestroyCursor = GPA("glfwDestroyCursor")
    glfwSetCursor = GPA("glfwSetCursor")
    glfwSetKeyCallback = GPA("glfwSetKeyCallback")    
    glfwSetCharCallback = GPA("glfwSetCharCallback")
    glfwSetCharModsCallback = GPA("glfwSetCharModsCallback")
    glfwSetMouseButtonCallback = GPA("glfwSetMouseButtonCallback")
    glfwSetCursorPosCallback = GPA("glfwSetCursorPosCallback")
    glfwSetCursorEnterCallback = GPA("glfwSetCursorEnterCallback")
    glfwSetScrollCallback = GPA("glfwSetScrollCallback")
    glfwSetDropCallback = GPA("glfwSetDropCallback")
    glfwJoystickPresent = GPA("glfwJoystickPresent")
    glfwGetJoystickAxes = GPA("glfwGetJoystickAxes")
    glfwGetJoystickButtons = GPA("glfwGetJoystickButtons")
    glfwGetJoystickHats = GPA("glfwGetJoystickHats")
    glfwGetJoystickName = GPA("glfwGetJoystickName")
    glfwGetJoystickGUID = GPA("glfwGetJoystickGUID")
    glfwSetJoystickUserPointer = GPA("glfwSetJoystickUserPointer")
    glfwGetJoystickUserPointer = GPA("glfwGetJoystickUserPointer")
    glfwJoystickIsGamepad = GPA("glfwJoystickIsGamepad")
    glfwSetJoystickCallback = GPA("glfwSetJoystickCallback")
    glfwUpdateGamepadMappings = GPA("glfwUpdateGamepadMappings")
    glfwGetGamepadName = GPA("glfwGetGamepadName")
    glfwGetGamepadState = GPA("glfwGetGamepadState")
    glfwSetClipboardString = GPA("glfwSetClipboardString")
    glfwGetClipboardString = GPA("glfwGetClipboardString")
    glfwGetTime = GPA("glfwGetTime")
    glfwSetTime = GPA("glfwSetTime")
    glfwGetTimerValue = GPA("glfwGetTimerValue")
    glfwGetTimerFrequency = GPA("glfwGetTimerFrequency")
    glfwMakeContextCurrent = GPA("glfwMakeContextCurrent")
    glfwGetCurrentContext = GPA("glfwGetCurrentContext")
    glfwSwapBuffers = GPA("glfwSwapBuffers")
    glfwSwapInterval = GPA("glfwSwapInterval")
    glfwExtensionSupported = GPA("glfwExtensionSupported")
    glfwGetProcAddress = GPA("glfwGetProcAddress")
    
    glfwVulkanSupported = GPA("glfwVulkanSupported")
    glfwGetRequiredInstanceExtensions = GPA("glfwGetRequiredInstanceExtensions")
    glfwGetInstanceProcAddress = GPA("glfwGetInstanceProcAddress")
    glfwGetPhysicalDevicePresentationSupport = GPA("glfwGetPhysicalDevicePresentationSupport")
    glfwCreateWindowSurface = GPA("glfwCreateWindowSurface")
    
   CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
    glfwGetWin32Adapter = GPA("glfwGetWin32Adapter")
    glfwGetWin32Monitor = GPA("glfwGetWin32Monitor")
    glfwGetWin32Window = GPA("glfwGetWin32Window")
    glfwGetWGLContext = GPA("glfwGetWGLContext")
   CompilerEndIf

   CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
    glfwGetX11Display = GPA("glfwGetX11Display")
    glfwGetX11Adapter = GPA("glfwGetX11Adapter") 
    glfwGetX11Monitor = GPA("glfwGetX11Monitor") 
    glfwGetX11Window = GPA("glfwGetX11Window")
    glfwGetGLXContext = GPA("glfwGetGLXContext")
    glfwGetGLXWindow = GPA("glfwGetGLXWindow")
   CompilerEndIf
       
    If GLFW\MissingEntries > 0
        ProcedureReturn #LOAD_MISSING_IMPORTED_FUNCS
    EndIf
     
    ProcedureReturn #LOAD_OK
 EndIf
 
 ProcedureReturn #LOAD_DLL_NOT_FOUND
EndProcedure

Procedure Shutdown()
 glfwTerminate()
 CloseLibrary(GLFW\hglfw)   
EndProcedure

CompilerEndIf 

;- STATIC LINKING

CompilerIf glfw_config::#LINK_DYNAMIC = 0

Procedure.i Load()
 ProcedureReturn #LOAD_OK ; Static linking cannot fail at runtime !
EndProcedure

Procedure Shutdown()
 glfwTerminate()
EndProcedure

CompilerEndIf 
EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 9
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory