; *********************************************************************************************************************
; glfw.pbi
; by Luis
;
; The glfw module namespace *MUST* be imported with "Usemodule glfw".
; This include must be used in conjunction with glfwLoad.pb (glfw functions importer).
; Must be configured through a configuration module named glfw_config (see examples)
;
; glfw 3.3.8
; https://www.glfw.org
;
; #LINK_DYNAMIC = 1 (Dynamic linking on Windows, Linux)
; #LINK_DYNAMIC = 0 (Static linking on Windows)
;
; 1.10, Apr 12 2023, PB 6.01
; Splitted into gl.pbi and glLoad.pb 
;
; 1.02 Oct 30 2022, PB 6.00
; Updated for glfw 3.3.8
;
; 1.01, Nov 19 2021, PB 5.73
; Updated for glfw 3.3.5
;
; 1.00, Apr 15 2016, PB 5.42
; Initial release for glfw 3.1.2
; *********************************************************************************************************************

; /*************************************************************************
; * GLFW 3.3 - www.glfw.org
; * A library for OpenGL, window and input
; *------------------------------------------------------------------------
; * Copyright (c) 2002-2006 Marcus Geelnard
; * Copyright (c) 2006-2019 Camilla Löwy <elmindreda@glfw.org>
; *
; * This software is provided 'as-is', without any express or implied
; * warranty. In no event will the authors be held liable for any damages
; * arising from the use of this software.
; *
; * Permission is granted to anyone to use this software for any purpose,
; * including commercial applications, and to alter it and redistribute it
; * freely, subject to the following restrictions:
; *
; * 1. The origin of this software must not be misrepresented; you must not
; *    claim that you wrote the original software. If you use this software
; *    in a product, an acknowledgment in the product documentation would
; *    be appreciated but is not required.
; *
; * 2. Altered source versions must be plainly marked as such, and must not
; *    be misrepresented as being the original software.
; *
; * 3. This notice may not be removed or altered from any source
; *    distribution.
; *************************************************************************/
 
CompilerIf Defined(glfw_config, #PB_Module) = 0 
 CompilerError "The configuration module is missing."
CompilerEndIf

DeclareModule glfw

EnableExplicit

;- GLFW STRUCTURES 

Structure GLFW_vidmode Align #PB_Structure_AlignC
 width.l
 height.l
 redBits.l
 greenBits.l
 blueBits.l
 refreshRate.l
EndStructure

Structure GLFW_gammaramp Align #PB_Structure_AlignC
 *red
 *green
 *blue
 size.l
EndStructure

Structure GLFW_image Align #PB_Structure_AlignC
 width.l
 height.l
 *pixels
EndStructure

Structure GLFWgamepadstate Align #PB_Structure_AlignC
 buttons.a[15]
 axes.f[6]
EndStructure

;- GLFW CONSTANTS 

#GLFW_VERSION_MAJOR = 3
#GLFW_VERSION_MINOR = 3
#GLFW_VERSION_REVISION = 8

#GLFW_TRUE = 1
#GLFW_FALSE = 0

#GLFW_RELEASE = 0
#GLFW_PRESS = 1
#GLFW_REPEAT = 2

#GLFW_HAT_CENTERED = 0
#GLFW_HAT_UP = 1
#GLFW_HAT_RIGHT = 2
#GLFW_HAT_DOWN = 4
#GLFW_HAT_LEFT = 8
#GLFW_HAT_RIGHT_UP = (#GLFW_HAT_RIGHT | #GLFW_HAT_UP)
#GLFW_HAT_RIGHT_DOWN = (#GLFW_HAT_RIGHT | #GLFW_HAT_DOWN)
#GLFW_HAT_LEFT_UP = (#GLFW_HAT_LEFT | #GLFW_HAT_UP)
#GLFW_HAT_LEFT_DOWN = (#GLFW_HAT_LEFT | #GLFW_HAT_DOWN)

; These key codes are inspired by the *USB HID Usage Tables v1.12* (p. 53-60),
; but re-arranged to map to 7-bit ASCII for printable keys (function keys are
; put in the 256+ range).
;
; The naming of the key codes follow these rules:
;  - The US keyboard layout is used
;  - Names of printable alpha-numeric characters are used (e.g. "A", "R",
;    "3", etc.)
;  - for non-alphanumeric characters, Unicode:ish names are used (e.g.
;    "COMMA", "LEFT_SQUARE_BRACKET", etc.). Note that some names do not
;    correspond to the Unicode standard (usually for brevity)
;  - Keys that lack a clear US mapping are named "WORLD_x"
;  - for non-printable keys, custom names are used (e.g. "F4",
;    "BACKSPACE", etc.)


; /* The unknown key */
#GLFW_KEY_UNKNOWN = -1

; /* Printable keys */
#GLFW_KEY_SPACE = 32
#GLFW_KEY_APOSTROPHE = 39 ; /* ' */
#GLFW_KEY_COMMA = 44 ; /* , */
#GLFW_KEY_MINUS = 45 ; /* - */
#GLFW_KEY_PERIOD = 46 ; /* . */
#GLFW_KEY_SLASH = 47 ; /* / */
#GLFW_KEY_0 = 48
#GLFW_KEY_1 = 49
#GLFW_KEY_2 = 50
#GLFW_KEY_3 = 51
#GLFW_KEY_4 = 52
#GLFW_KEY_5 = 53
#GLFW_KEY_6 = 54
#GLFW_KEY_7 = 55
#GLFW_KEY_8 = 56
#GLFW_KEY_9 = 57
#GLFW_KEY_SEMICOLON = 59 ; /* ; */
#GLFW_KEY_EQUAL = 61 ; /* = */
#GLFW_KEY_A = 65
#GLFW_KEY_B = 66
#GLFW_KEY_C = 67
#GLFW_KEY_D = 68
#GLFW_KEY_E = 69
#GLFW_KEY_F = 70
#GLFW_KEY_G = 71
#GLFW_KEY_H = 72
#GLFW_KEY_I = 73
#GLFW_KEY_J = 74
#GLFW_KEY_K = 75
#GLFW_KEY_L = 76
#GLFW_KEY_M = 77
#GLFW_KEY_N = 78
#GLFW_KEY_O = 79
#GLFW_KEY_P = 80
#GLFW_KEY_Q = 81
#GLFW_KEY_R = 82
#GLFW_KEY_S = 83
#GLFW_KEY_T = 84
#GLFW_KEY_U = 85
#GLFW_KEY_V = 86
#GLFW_KEY_W = 87
#GLFW_KEY_X = 88
#GLFW_KEY_Y = 89
#GLFW_KEY_Z = 90
#GLFW_KEY_LEFT_BRACKET = 91 ; /* [ */
#GLFW_KEY_BACKSLASH = 92 ; /* \ */
#GLFW_KEY_RIGHT_BRACKET = 93 ; /* ] */
#GLFW_KEY_GRAVE_ACCENT = 96 ; /* ` */
#GLFW_KEY_WORLD_1 = 161 ; /* non-US #1 */
#GLFW_KEY_WORLD_2 = 162 ; /* non-US #2 */

; /* Function keys */
#GLFW_KEY_ESCAPE = 256
#GLFW_KEY_ENTER = 257
#GLFW_KEY_TAB = 258
#GLFW_KEY_BACKSPACE = 259
#GLFW_KEY_INSERT = 260
#GLFW_KEY_DELETE = 261
#GLFW_KEY_RIGHT = 262
#GLFW_KEY_LEFT = 263
#GLFW_KEY_DOWN = 264
#GLFW_KEY_UP = 265
#GLFW_KEY_PAGE_UP = 266
#GLFW_KEY_PAGE_DOWN = 267
#GLFW_KEY_HOME = 268
#GLFW_KEY_END = 269
#GLFW_KEY_CAPS_LOCK = 280
#GLFW_KEY_SCROLL_LOCK = 281
#GLFW_KEY_NUM_LOCK = 282
#GLFW_KEY_PRINT_SCREEN = 283
#GLFW_KEY_PAUSE = 284
#GLFW_KEY_F1 = 290
#GLFW_KEY_F2 = 291
#GLFW_KEY_F3 = 292
#GLFW_KEY_F4 = 293
#GLFW_KEY_F5 = 294
#GLFW_KEY_F6 = 295
#GLFW_KEY_F7 = 296
#GLFW_KEY_F8 = 297
#GLFW_KEY_F9 = 298
#GLFW_KEY_F10 = 299
#GLFW_KEY_F11 = 300
#GLFW_KEY_F12 = 301
#GLFW_KEY_F13 = 302
#GLFW_KEY_F14 = 303
#GLFW_KEY_F15 = 304
#GLFW_KEY_F16 = 305
#GLFW_KEY_F17 = 306
#GLFW_KEY_F18 = 307
#GLFW_KEY_F19 = 308
#GLFW_KEY_F20 = 309
#GLFW_KEY_F21 = 310
#GLFW_KEY_F22 = 311
#GLFW_KEY_F23 = 312
#GLFW_KEY_F24 = 313
#GLFW_KEY_F25 = 314
#GLFW_KEY_KP_0 = 320
#GLFW_KEY_KP_1 = 321
#GLFW_KEY_KP_2 = 322
#GLFW_KEY_KP_3 = 323
#GLFW_KEY_KP_4 = 324
#GLFW_KEY_KP_5 = 325
#GLFW_KEY_KP_6 = 326
#GLFW_KEY_KP_7 = 327
#GLFW_KEY_KP_8 = 328
#GLFW_KEY_KP_9 = 329
#GLFW_KEY_KP_DECIMAL = 330
#GLFW_KEY_KP_DIVIDE = 331
#GLFW_KEY_KP_MULTIPLY = 332
#GLFW_KEY_KP_SUBTRACT = 333
#GLFW_KEY_KP_ADD = 334
#GLFW_KEY_KP_ENTER = 335
#GLFW_KEY_KP_EQUAL = 336
#GLFW_KEY_LEFT_SHIFT = 340
#GLFW_KEY_LEFT_CONTROL = 341
#GLFW_KEY_LEFT_ALT = 342
#GLFW_KEY_LEFT_SUPER = 343
#GLFW_KEY_RIGHT_SHIFT = 344
#GLFW_KEY_RIGHT_CONTROL = 345
#GLFW_KEY_RIGHT_ALT = 346
#GLFW_KEY_RIGHT_SUPER = 347
#GLFW_KEY_MENU = 348
#GLFW_KEY_LAST = #GLFW_KEY_MENU

#GLFW_MOD_SHIFT = $0001
#GLFW_MOD_CONTROL = $0002
#GLFW_MOD_ALT = $0004
#GLFW_MOD_SUPER = $0008
#GLFW_MOD_CAPS_LOCK = $0010
#GLFW_MOD_NUM_LOCK = $0020

#GLFW_MOUSE_BUTTON_1 = 0
#GLFW_MOUSE_BUTTON_2 = 1
#GLFW_MOUSE_BUTTON_3 = 2
#GLFW_MOUSE_BUTTON_4 = 3
#GLFW_MOUSE_BUTTON_5 = 4
#GLFW_MOUSE_BUTTON_6 = 5
#GLFW_MOUSE_BUTTON_7 = 6
#GLFW_MOUSE_BUTTON_8 = 7
#GLFW_MOUSE_BUTTON_LAST = #GLFW_MOUSE_BUTTON_8
#GLFW_MOUSE_BUTTON_LEFT = #GLFW_MOUSE_BUTTON_1
#GLFW_MOUSE_BUTTON_RIGHT = #GLFW_MOUSE_BUTTON_2
#GLFW_MOUSE_BUTTON_MIDDLE = #GLFW_MOUSE_BUTTON_3

#GLFW_JOYSTICK_1 = 0
#GLFW_JOYSTICK_2 = 1
#GLFW_JOYSTICK_3 = 2
#GLFW_JOYSTICK_4 = 3
#GLFW_JOYSTICK_5 = 4
#GLFW_JOYSTICK_6 = 5
#GLFW_JOYSTICK_7 = 6
#GLFW_JOYSTICK_8 = 7
#GLFW_JOYSTICK_9 = 8
#GLFW_JOYSTICK_10 = 9
#GLFW_JOYSTICK_11 = 10
#GLFW_JOYSTICK_12 = 11
#GLFW_JOYSTICK_13 = 12
#GLFW_JOYSTICK_14 = 13
#GLFW_JOYSTICK_15 = 14
#GLFW_JOYSTICK_16 = 15
#GLFW_JOYSTICK_LAST = #GLFW_JOYSTICK_16

#GLFW_GAMEPAD_BUTTON_A = 0
#GLFW_GAMEPAD_BUTTON_B = 1
#GLFW_GAMEPAD_BUTTON_X = 2
#GLFW_GAMEPAD_BUTTON_Y = 3
#GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = 4
#GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5
#GLFW_GAMEPAD_BUTTON_BACK = 6
#GLFW_GAMEPAD_BUTTON_START = 7
#GLFW_GAMEPAD_BUTTON_GUIDE = 8
#GLFW_GAMEPAD_BUTTON_LEFT_THUMB = 9
#GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = 10
#GLFW_GAMEPAD_BUTTON_DPAD_UP = 11
#GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = 12
#GLFW_GAMEPAD_BUTTON_DPAD_DOWN = 13
#GLFW_GAMEPAD_BUTTON_DPAD_LEFT = 14
#GLFW_GAMEPAD_BUTTON_LAST = #GLFW_GAMEPAD_BUTTON_DPAD_LEFT
#GLFW_GAMEPAD_BUTTON_CROSS = #GLFW_GAMEPAD_BUTTON_A
#GLFW_GAMEPAD_BUTTON_CIRCLE = #GLFW_GAMEPAD_BUTTON_B
#GLFW_GAMEPAD_BUTTON_SQUARE = #GLFW_GAMEPAD_BUTTON_X
#GLFW_GAMEPAD_BUTTON_TRIANGLE = #GLFW_GAMEPAD_BUTTON_Y
#GLFW_GAMEPAD_AXIS_LEFT_X = 0
#GLFW_GAMEPAD_AXIS_LEFT_Y = 1
#GLFW_GAMEPAD_AXIS_RIGHT_X = 2
#GLFW_GAMEPAD_AXIS_RIGHT_Y = 3
#GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = 4
#GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5
#GLFW_GAMEPAD_AXIS_LAST = #GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER

#GLFW_NO_ERROR = 0
#GLFW_NOT_INITIALIZED = $00010001
#GLFW_NO_CURRENT_CONTEXT = $00010002
#GLFW_INVALID_ENUM = $00010003
#GLFW_INVALID_VALUE = $00010004
#GLFW_OUT_OF_MEMORY = $00010005
#GLFW_API_UNAVAILABLE = $00010006
#GLFW_VERSION_UNAVAILABLE = $00010007
#GLFW_PLATFORM_ERROR = $00010008
#GLFW_FORMAT_UNAVAILABLE = $00010009
#GLFW_NO_WINDOW_CONTEXT = $0001000A

#GLFW_FOCUSED = $00020001
#GLFW_ICONIFIED = $00020002
#GLFW_RESIZABLE = $00020003
#GLFW_VISIBLE = $00020004
#GLFW_DECORATED = $00020005
#GLFW_AUTO_ICONIFY = $00020006
#GLFW_FLOATING = $00020007
#GLFW_MAXIMIZED = $00020008
#GLFW_CENTER_CURSOR = $00020009

#GLFW_TRANSPARENT_FRAMEBUFFER = $0002000A
#GLFW_HOVERED = $0002000B
#GLFW_FOCUS_ON_SHOW = $0002000C
#GLFW_RED_BITS = $00021001
#GLFW_GREEN_BITS = $00021002
#GLFW_BLUE_BITS = $00021003
#GLFW_ALPHA_BITS = $00021004
#GLFW_DEPTH_BITS = $00021005
#GLFW_STENCIL_BITS = $00021006
#GLFW_ACCUM_RED_BITS = $00021007
#GLFW_ACCUM_GREEN_BITS = $00021008
#GLFW_ACCUM_BLUE_BITS = $00021009
#GLFW_ACCUM_ALPHA_BITS = $0002100A
#GLFW_AUX_BUFFERS = $0002100B
#GLFW_STEREO = $0002100C
#GLFW_SAMPLES = $0002100D
#GLFW_SRGB_CAPABLE = $0002100E
#GLFW_REFRESH_RATE = $0002100F
#GLFW_DOUBLEBUFFER = $00021010

#GLFW_CLIENT_API = $00022001
#GLFW_CONTEXT_VERSION_MAJOR = $00022002
#GLFW_CONTEXT_VERSION_MINOR = $00022003
#GLFW_CONTEXT_REVISION = $00022004
#GLFW_CONTEXT_ROBUSTNESS = $00022005
#GLFW_OPENGL_FORWARD_COMPAT = $00022006
#GLFW_OPENGL_DEBUG_CONTEXT = $00022007
#GLFW_OPENGL_PROFILE = $00022008
#GLFW_CONTEXT_RELEASE_BEHAVIOR = $00022009
#GLFW_CONTEXT_NO_ERROR = $0002200A
#GLFW_CONTEXT_CREATION_API = $0002200B
#GLFW_SCALE_TO_MONITOR = $0002200C
#GLFW_COCOA_RETINA_FRAMEBUFFER = $00023001
#GLFW_COCOA_FRAME_NAME = $00023002
#GLFW_COCOA_GRAPHICS_SWITCHING = $00023003
#GLFW_X11_CLASS_NAME = $00024001
#GLFW_X11_INSTANCE_NAME = $00024002

#GLFW_NO_API = 0
#GLFW_OPENGL_API = $00030001
#GLFW_OPENGL_ES_API = $00030002

#GLFW_NO_ROBUSTNESS = 0
#GLFW_NO_RESET_NOTIFICATION = $00031001
#GLFW_LOSE_CONTEXT_ON_RESET = $00031002

#GLFW_OPENGL_ANY_PROFILE = 0
#GLFW_OPENGL_CORE_PROFILE = $00032001
#GLFW_OPENGL_COMPAT_PROFILE = $00032002

#GLFW_CURSOR = $00033001
#GLFW_STICKY_KEYS = $00033002
#GLFW_STICKY_MOUSE_BUTTONS = $00033003

#GLFW_LOCK_KEY_MODS = $00033004
#GLFW_RAW_MOUSE_MOTION = $00033005

#GLFW_CURSOR_NORMAL = $00034001
#GLFW_CURSOR_HIDDEN = $00034002
#GLFW_CURSOR_DISABLED = $00034003

#GLFW_ANY_RELEASE_BEHAVIOR = 0
#GLFW_RELEASE_BEHAVIOR_FLUSH = $00035001
#GLFW_RELEASE_BEHAVIOR_NONE = $00035002

#GLFW_NATIVE_CONTEXT_API = $00036001
#GLFW_EGL_CONTEXT_API = $00036002
#GLFW_OSMESA_CONTEXT_API = $00036003

#GLFW_ARROW_CURSOR = $00036001
#GLFW_IBEAM_CURSOR = $00036002
#GLFW_CROSSHAIR_CURSOR = $00036003
#GLFW_HAND_CURSOR = $00036004
#GLFW_HRESIZE_CURSOR = $00036005
#GLFW_VRESIZE_CURSOR = $00036006
#GLFW_CONNECTED = $00040001
#GLFW_DISCONNECTED = $00040002
#GLFW_JOYSTICK_HAT_BUTTONS = $00050001
#GLFW_COCOA_CHDIR_RESOURCES = $00051001
#GLFW_COCOA_MENUBAR = $00051002

#GLFW_DONT_CARE = -1

CompilerIf glfw_config::#LINK_DYNAMIC = 0

;- GLFW STATIC IMPORTS 

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
  ImportC "./lib/glfw3.x86.lib"
 CompilerElse   
  ImportC "./lib/glfw3.x64.lib"
 CompilerEndIf
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
 CompilerError "On Linux static linking is not supported."
 
 ; YOU can help !
 ; https://www.purebasic.fr/english/viewtopic.php?p=596547#p596547
  
 ; The glfw3.pc pkg-config file generated by CMake when the GLFW library is built contains this:
  
 ; prefix=/usr/local
 ; exec_prefix=${prefix}
 ; includedir=/usr/local/include
 ; libdir=/usr/local/lib
 ; 
 ; Name: GLFW
 ; Description: A multi-platform library for OpenGL, window and input
 ; Version: 3.3.8
 ; URL: https://www.glfw.org/
 ; Requires.private:  x11
 ; Libs: -L${libdir} -lglfw3
 ; Libs.private:  -lrt -lm -ldl
 ; Cflags: -I${includedir}
  
 ; env PKG_CONFIG_PATH=/home/luis/Dev/glfw.x64/src pkg-config --static --libs glfw3 
 ; -L/usr/local/lib -lglfw3 -lrt -lm -ldl -lX11 -lpthread -lxcb -lXau -lXdmcp

 ; ImportC "./lib/glfw3.lin.x64.a":EndImport
 ;   
 ; ImportC "-lrt" : EndImport  
 ; ImportC "-lm" : EndImport
 ; ImportC "-ldl" : EndImport
 ; ImportC "-lX11" : EndImport 
 ; ImportC "-lpthread" : EndImport 
 ; ImportC "-lxcb" : EndImport 
 ; ImportC "-lXau" : EndImport 
 ; ImportC "-lXdmcp" : EndImport 
   
 ; The error dialog from PB:
 ;
 ; /usr/bin/ld: /mnt/WIN10/Dev/PB/engine/sgl/glfw/test/.././lib/glfw3.lin.x64.a(x11_window.c.o): undefined reference to symbol 'XConvertSelection'
 ; /usr/bin/ld: /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/libX11.so: error adding symbols: DSO missing from command line
 ; collect2: error: ld returned 1 exit status
  
 ImportC "./lib/glfw3.x64.a"
CompilerEndIf

glfwInit.i()
glfwTerminate()
glfwInitHint(hint, value)
glfwGetVersion(*major, *minor, *rev)
glfwGetVersionString.i()
glfwGetError.i(*description) 
glfwSetErrorCallback.i(*cbfun)
glfwGetMonitors.i(*count)
glfwGetPrimaryMonitor.i() 
glfwGetMonitorPos(*monitor, *xpos, *ypos)
glfwGetMonitorWorkarea(*monitor, *xpos, *ypos, *width, *height)
glfwGetMonitorPhysicalSize(*monitor, *widthMM, *heightMM)
glfwGetMonitorContentScale(*monitor, *xscale, *yscale)
glfwGetMonitorName.i(*monitor)
glfwSetMonitorUserPointer(*monitor, *pointer)
glfwGetMonitorUserPointer.i(*monitor) 
glfwSetMonitorCallback.i(*cbfun)
glfwGetVideoModes.i(*monitor, *count)
glfwGetVideoMode.i(*monitor)
glfwSetGamma(*monitor, gamma.f)
glfwGetGammaRamp.i(*monitor)
glfwSetGammaRamp(*monitor, *ramp)
glfwDefaultWindowHints()
glfwWindowHint(hint, value) 
glfwWindowHintString(hint, value.p-utf8)
glfwCreateWindow.i(width, height, title.p-utf8, *monitor, *share)
glfwDestroyWindow(*window)
glfwWindowShouldClose.i(*window)
glfwSetWindowShouldClose(*window, value)
glfwSetWindowTitle(*window, title.p-utf8)
glfwSetWindowIcon(*window, count, *images)
glfwGetWindowPos(*window, *xpos, *ypos)
glfwSetWindowPos(*window, xpos, ypos)
glfwGetWindowSize(*window, *width, *height)
glfwSetWindowSizeLimits(*window, minwidth, minheight, maxwidth, maxheight)
glfwSetWindowAspectRatio(*window, numer, denom)
glfwSetWindowSize(*window, width, height)
glfwGetFramebufferSize(*window, *width, *height)
glfwGetWindowFrameSize(*window, *left, *top, *right, *bottom)
glfwGetWindowContentScale(*window, *xscale, *yscale)
glfwGetWindowOpacity.f(*window)
glfwSetWindowOpacity(*window, opacity.f)
glfwIconifyWindow(*window)
glfwRestoreWindow(*window)
glfwMaximizeWindow(*window)
glfwShowWindow(*window)
glfwHideWindow(*window)
glfwFocusWindow(*window)
glfwRequestWindowAttention(*window)
glfwGetWindowMonitor.i(*window)
glfwSetWindowMonitor(*window, *monitor, xpos, ypos, width, height, refreshRate)
glfwGetWindowAttrib.i(*window, attrib)
glfwSetWindowAttrib(*window, attrib, value) 
glfwSetWindowUserPointer(*window, *pointer)
glfwGetWindowUserPointer.i(*window)
glfwSetWindowPosCallback.i(*window, *cbfun)
glfwSetWindowSizeCallback.i(*window, *cbfun)
glfwSetWindowCloseCallback.i(*window, *cbfun)
glfwSetWindowRefreshCallback.i(*window, *cbfun)
glfwSetWindowFocusCallback.i(*window, *cbfun)
glfwSetWindowIconifyCallback.i(*window, *cbfun)
glfwSetWindowMaximizeCallback.i(*window, *cbfun)
glfwSetFramebufferSizeCallback.i(*window, *cbfun)
glfwSetWindowContentScaleCallback.i(*window, *cbfun)
glfwPollEvents()
glfwWaitEvents()
glfwWaitEventsTimeout(timeout.d)
glfwPostEmptyEvent()
glfwGetInputMode.i(*window, mode)
glfwSetInputMode(*window, mode, value)
glfwRawMouseMotionSupported.i()
glfwGetKeyName.i(key, scancode)
glfwGetKeyScancode.i(key)
glfwGetKey.i(*window, key)
glfwGetMouseButton.i(*window, button)
glfwGetCursorPos(*window, *xpos, *ypos)
glfwSetCursorPos(*window, xpos.d, ypos.d)
glfwCreateCursor.i(*image, xhot, yhot)
glfwCreateStandardCursor.i(shape)
glfwDestroyCursor(*cursor)
glfwSetCursor(*window, *cursor)
glfwSetKeyCallback.i(*window, *cbfun)
glfwSetCharCallback.i(*window, *cbfun)
glfwSetCharModsCallback.i(*window, *cbfun)
glfwSetMouseButtonCallback.i(*window, *cbfun)
glfwSetCursorPosCallback.i(*window, *cbfun)
glfwSetCursorEnterCallback.i(*window, *cbfun)
glfwSetScrollCallback.i(*window, *cbfun)
glfwSetDropCallback.i(*window, *cbfun)
glfwJoystickPresent.i(joy)
glfwGetJoystickAxes.i(joy, *count)
glfwGetJoystickButtons.i(joy, *count)
glfwGetJoystickHats.i(jid, *count)
glfwGetJoystickName.i(joy)
glfwGetJoystickGUID.i(jid)
glfwSetJoystickUserPointer(jid, *pointer)
glfwGetJoystickUserPointer.i(jid)
glfwJoystickIsGamepad.i(jid)
glfwSetJoystickCallback.i(*cbfun)
glfwUpdateGamepadMappings.i(string.p-utf8)
glfwGetGamepadName.i(jid)
glfwGetGamepadState.i(jid, *state)
glfwSetClipboardString(*window, string.p-utf8)
glfwGetClipboardString.i(*window)
glfwGetTime.d()
glfwSetTime(time.d)
glfwGetTimerValue.q()
glfwGetTimerFrequency.q()
glfwMakeContextCurrent(*window)
glfwGetCurrentContext.i()
glfwSwapBuffers(*window)
glfwSwapInterval(interval)
glfwExtensionSupported.i(extension.p-utf8)
glfwGetProcAddress.i(procname.p-utf8)
glfwVulkanSupported.i()
glfwGetRequiredInstanceExtensions.i(*count)
glfwGetInstanceProcAddress.i(*instance, procname.p-utf8)
glfwGetPhysicalDevicePresentationSupport.i(*instance, device, queuefamily)
glfwCreateWindowSurface.i(*instance, *window, *allocator, *surface)

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
glfwGetWin32Adapter.i(*monitor)
glfwGetWin32Monitor.i(*monitor)
glfwGetWin32Window.i(*window) 
glfwGetWGLContext.i(*window)
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux) ; not supported for now
glfwGetX11Display.i() 
glfwGetX11Adapter.i(*monitor) 
glfwGetX11Monitor.i(*monitor) 
glfwGetX11Window.i(*window) 
glfwGetGLXContext.i(*window)
glfwGetGLXWindow.i(*window) 
CompilerEndIf

EndImport

CompilerElse

;- GLFW PROTOTYPES FOR DYNAMIC LINKING

PrototypeC.i    glfwInit() : Global glfwInit.glfwInit
PrototypeC      glfwTerminate() : Global glfwTerminate.glfwTerminate
PrototypeC      glfwInitHint(hint, value) : Global glfwInitHint.glfwInitHint
PrototypeC      glfwGetVersion(*major, *minor, *rev) : Global glfwGetVersion.glfwGetVersion
PrototypeC.i    glfwGetVersionString() : Global glfwGetVersionString.glfwGetVersionString
PrototypeC.i    glfwGetError(*description) : Global glfwGetError.glfwGetError
PrototypeC.i    glfwSetErrorCallback(*cbfun) : Global glfwSetErrorCallback.glfwSetErrorCallback
PrototypeC.i    glfwGetMonitors(*count) : Global glfwGetMonitors.glfwGetMonitors
PrototypeC.i    glfwGetPrimaryMonitor() : Global glfwGetPrimaryMonitor.glfwGetPrimaryMonitor
PrototypeC      glfwGetMonitorPos(*monitor, *xpos, *ypos) : Global glfwGetMonitorPos.glfwGetMonitorPos
PrototypeC      glfwGetMonitorWorkarea(*monitor, *xpos, *ypos, *width, *height) : Global glfwGetMonitorWorkarea.glfwGetMonitorWorkarea
PrototypeC      glfwGetMonitorPhysicalSize(*monitor, *widthMM, *heightMM) : Global glfwGetMonitorPhysicalSize.glfwGetMonitorPhysicalSize
PrototypeC      glfwGetMonitorContentScale(*monitor, *xscale, *yscale) : Global glfwGetMonitorContentScale.glfwGetMonitorContentScale
PrototypeC.i    glfwGetMonitorName(*monitor) : Global glfwGetMonitorName.glfwGetMonitorName
PrototypeC      glfwSetMonitorUserPointer(*monitor, *pointer) : Global glfwSetMonitorUserPointer.glfwSetMonitorUserPointer
PrototypeC.i    glfwGetMonitorUserPointer(*monitor) : Global glfwGetMonitorUserPointer.glfwGetMonitorUserPointer
PrototypeC.i    glfwSetMonitorCallback(*cbfun) : Global glfwSetMonitorCallback.glfwSetMonitorCallback
PrototypeC.i    glfwGetVideoModes(*monitor, *count) : Global glfwGetVideoModes.glfwGetVideoModes
PrototypeC.i    glfwGetVideoMode(*monitor) : Global glfwGetVideoMode.glfwGetVideoMode
PrototypeC      glfwSetGamma(*monitor, gamma.f) : Global glfwSetGamma.glfwSetGamma
PrototypeC.i    glfwGetGammaRamp(*monitor) : Global glfwGetGammaRamp.glfwGetGammaRamp
PrototypeC      glfwSetGammaRamp(*monitor, *ramp) : Global glfwSetGammaRamp.glfwSetGammaRamp
PrototypeC      glfwDefaultWindowHints() : Global glfwDefaultWindowHints.glfwDefaultWindowHints
PrototypeC      glfwWindowHint(hint, value) : Global glfwWindowHint.glfwWindowHint
PrototypeC      glfwWindowHintString(hint, value.p-utf8) : Global glfwWindowHintString.glfwWindowHintString
PrototypeC.i    glfwCreateWindow(width, height, title.p-utf8, *monitor, *share) : Global glfwCreateWindow.glfwCreateWindow
PrototypeC      glfwDestroyWindow(*window) : Global glfwDestroyWindow.glfwDestroyWindow
PrototypeC.i    glfwWindowShouldClose(*window) : Global glfwWindowShouldClose.glfwWindowShouldClose
PrototypeC      glfwSetWindowShouldClose(*window, value) : Global glfwSetWindowShouldClose.glfwSetWindowShouldClose
PrototypeC      glfwSetWindowTitle(*window, title.p-utf8) : Global glfwSetWindowTitle.glfwSetWindowTitle
PrototypeC      glfwSetWindowIcon(*window, count, *images) : Global glfwSetWindowIcon.glfwSetWindowIcon
PrototypeC      glfwGetWindowPos(*window, *xpos, *ypos) : Global glfwGetWindowPos.glfwGetWindowPos
PrototypeC      glfwSetWindowPos(*window, xpos, ypos) : Global glfwSetWindowPos.glfwSetWindowPos
PrototypeC      glfwGetWindowSize(*window, *width, *height) : Global glfwGetWindowSize.glfwGetWindowSize
PrototypeC      glfwSetWindowSizeLimits(*window, minwidth, minheight, maxwidth, maxheight) : Global glfwSetWindowSizeLimits.glfwSetWindowSizeLimits
PrototypeC      glfwSetWindowAspectRatio(*window, numer, denom) : Global glfwSetWindowAspectRatio.glfwSetWindowAspectRatio
PrototypeC      glfwSetWindowSize(*window, width, height) : Global glfwSetWindowSize.glfwSetWindowSize
PrototypeC      glfwGetFramebufferSize(*window, *width, *height) : Global glfwGetFramebufferSize.glfwGetFramebufferSize
PrototypeC      glfwGetWindowFrameSize(*window, *left, *top, *right, *bottom) : Global glfwGetWindowFrameSize.glfwGetWindowFrameSize
PrototypeC      glfwGetWindowContentScale(*window, *xscale, *yscale) : Global glfwGetWindowContentScale.glfwGetWindowContentScale
PrototypeC.f    glfwGetWindowOpacity(*window) : Global glfwGetWindowOpacity.glfwGetWindowOpacity
PrototypeC      glfwSetWindowOpacity(*window, opacity.f) : Global glfwSetWindowOpacity.glfwSetWindowOpacity
PrototypeC      glfwIconifyWindow(*window) : Global glfwIconifyWindow.glfwIconifyWindow
PrototypeC      glfwRestoreWindow(*window) : Global glfwRestoreWindow.glfwRestoreWindow
PrototypeC      glfwMaximizeWindow(*window) : Global glfwMaximizeWindow.glfwMaximizeWindow
PrototypeC      glfwShowWindow(*window) : Global glfwShowWindow.glfwShowWindow
PrototypeC      glfwHideWindow(*window) : Global glfwHideWindow.glfwHideWindow
PrototypeC      glfwFocusWindow(*window) : Global glfwFocusWindow.glfwFocusWindow
PrototypeC      glfwRequestWindowAttention(*window) : Global glfwRequestWindowAttention.glfwRequestWindowAttention
PrototypeC.i    glfwGetWindowMonitor(*window) : Global glfwGetWindowMonitor.glfwGetWindowMonitor
PrototypeC      glfwSetWindowMonitor(*window, *monitor, xpos, ypos, width, height, refreshRate) : Global glfwSetWindowMonitor.glfwSetWindowMonitor
PrototypeC.i    glfwGetWindowAttrib(*window, attrib) : Global glfwGetWindowAttrib.glfwGetWindowAttrib
PrototypeC      glfwSetWindowAttrib(*window, attrib, value) : Global glfwSetWindowAttrib.glfwSetWindowAttrib
PrototypeC      glfwSetWindowUserPointer(*window, *pointer) : Global glfwSetWindowUserPointer.glfwSetWindowUserPointer
PrototypeC.i    glfwGetWindowUserPointer(*window) : Global glfwGetWindowUserPointer.glfwGetWindowUserPointer
PrototypeC.i    glfwSetWindowPosCallback(*window, *cbfun) : Global glfwSetWindowPosCallback.glfwSetWindowPosCallback
PrototypeC.i    glfwSetWindowSizeCallback(*window, *cbfun) : Global glfwSetWindowSizeCallback.glfwSetWindowSizeCallback
PrototypeC.i    glfwSetWindowCloseCallback(*window, *cbfun) : Global glfwSetWindowCloseCallback.glfwSetWindowCloseCallback
PrototypeC.i    glfwSetWindowRefreshCallback(*window, *cbfun) : Global glfwSetWindowRefreshCallback.glfwSetWindowRefreshCallback
PrototypeC.i    glfwSetWindowFocusCallback(*window, *cbfun) : Global glfwSetWindowFocusCallback.glfwSetWindowFocusCallback
PrototypeC.i    glfwSetWindowIconifyCallback(*window, *cbfun) : Global glfwSetWindowIconifyCallback.glfwSetWindowIconifyCallback
PrototypeC.i    glfwSetWindowMaximizeCallback(*window, *cbfun) : Global glfwSetWindowMaximizeCallback.glfwSetWindowMaximizeCallback
PrototypeC.i    glfwSetFramebufferSizeCallback(*window, *cbfun) : Global glfwSetFramebufferSizeCallback.glfwSetFramebufferSizeCallback
PrototypeC.i    glfwSetWindowContentScaleCallback(*window, *cbfun) : Global glfwSetWindowContentScaleCallback.glfwSetWindowContentScaleCallback
PrototypeC      glfwPollEvents() : Global glfwPollEvents.glfwPollEvents
PrototypeC      glfwWaitEvents() : Global glfwWaitEvents.glfwWaitEvents
PrototypeC      glfwWaitEventsTimeout(timeout.d) : Global glfwWaitEventsTimeout.glfwWaitEventsTimeout
PrototypeC      glfwPostEmptyEvent() : Global glfwPostEmptyEvent.glfwPostEmptyEvent
PrototypeC.i    glfwGetInputMode(*window, mode) : Global glfwGetInputMode.glfwGetInputMode
PrototypeC      glfwSetInputMode(*window, mode, value) : Global glfwSetInputMode.glfwSetInputMode
PrototypeC.i    glfwRawMouseMotionSupported() : Global glfwRawMouseMotionSupported.glfwRawMouseMotionSupported
PrototypeC.i    glfwGetKeyName(key, scancode) : Global glfwGetKeyName.glfwGetKeyName
PrototypeC      glfwGetKeyScancode(key) : Global glfwGetKeyScancode.glfwGetKeyScancode
PrototypeC.i    glfwGetKey(*window, key) : Global glfwGetKey.glfwGetKey
PrototypeC.i    glfwGetMouseButton(*window, button) : Global glfwGetMouseButton.glfwGetMouseButton
PrototypeC      glfwGetCursorPos(*window, *xpos, *ypos) : Global glfwGetCursorPos.glfwGetCursorPos
PrototypeC      glfwSetCursorPos(*window, xpos.d, ypos.d) : Global glfwSetCursorPos.glfwSetCursorPos
PrototypeC.i    glfwCreateCursor(*image, xhot, yhot) : Global glfwCreateCursor.glfwCreateCursor
PrototypeC.i    glfwCreateStandardCursor(shape) : Global glfwCreateStandardCursor.glfwCreateStandardCursor
PrototypeC      glfwDestroyCursor(*cursor) : Global glfwDestroyCursor.glfwDestroyCursor
PrototypeC      glfwSetCursor(*window, *cursor) : Global glfwSetCursor.glfwSetCursor
PrototypeC.i    glfwSetKeyCallback(*window, *cbfun) : Global glfwSetKeyCallback.glfwSetKeyCallback
PrototypeC.i    glfwSetCharCallback(*window, *cbfun) : Global glfwSetCharCallback.glfwSetCharCallback
PrototypeC.i    glfwSetCharModsCallback(*window, *cbfun) : Global glfwSetCharModsCallback.glfwSetCharModsCallback
PrototypeC.i    glfwSetMouseButtonCallback(*window, *cbfun) : Global glfwSetMouseButtonCallback.glfwSetMouseButtonCallback
PrototypeC.i    glfwSetCursorPosCallback(*window, *cbfun) : Global glfwSetCursorPosCallback.glfwSetCursorPosCallback
PrototypeC.i    glfwSetCursorEnterCallback(*window, *cbfun) : Global glfwSetCursorEnterCallback.glfwSetCursorEnterCallback
PrototypeC.i    glfwSetScrollCallback(*window, *cbfun) : Global glfwSetScrollCallback.glfwSetScrollCallback
PrototypeC.i    glfwSetDropCallback(*window, *cbfun) : Global glfwSetDropCallback.glfwSetDropCallback
PrototypeC.i    glfwJoystickPresent(joy) : Global glfwJoystickPresent.glfwJoystickPresent
PrototypeC.i    glfwGetJoystickAxes(joy, *count) : Global glfwGetJoystickAxes.glfwGetJoystickAxes
PrototypeC.i    glfwGetJoystickButtons(joy, *count) : Global glfwGetJoystickButtons.glfwGetJoystickButtons
PrototypeC.i    glfwGetJoystickHats(jid, *count) : Global glfwGetJoystickHats.glfwGetJoystickHats
PrototypeC.i    glfwGetJoystickName(joy) : Global glfwGetJoystickName.glfwGetJoystickName
PrototypeC.i    glfwGetJoystickGUID(jid) : Global glfwGetJoystickGUID.glfwGetJoystickGUID
PrototypeC      glfwSetJoystickUserPointer(jid, *pointer) : Global glfwSetJoystickUserPointer.glfwSetJoystickUserPointer
PrototypeC.i    glfwGetJoystickUserPointer(jid) : Global glfwGetJoystickUserPointer.glfwGetJoystickUserPointer
PrototypeC.i    glfwJoystickIsGamepad(jid) : Global glfwJoystickIsGamepad.glfwJoystickIsGamepad
PrototypeC.i    glfwSetJoystickCallback(*cbfun) : Global glfwSetJoystickCallback.glfwSetJoystickCallback
PrototypeC.i    glfwUpdateGamepadMappings(string.p-utf8) : Global glfwUpdateGamepadMappings.glfwUpdateGamepadMappings
PrototypeC.i    glfwGetGamepadName(jid) : Global glfwGetGamepadName.glfwGetGamepadName
PrototypeC.i    glfwGetGamepadState(jid, *state) : Global glfwGetGamepadState.glfwGetGamepadState
PrototypeC      glfwSetClipboardString(*window, string.p-utf8) : Global glfwSetClipboardString.glfwSetClipboardString
PrototypeC.i    glfwGetClipboardString(*window) : Global glfwGetClipboardString.glfwGetClipboardString
PrototypeC.d    glfwGetTime() : Global glfwGetTime.glfwGetTime
PrototypeC      glfwSetTime(time.d) : Global glfwSetTime.glfwSetTime
PrototypeC.q    glfwGetTimerValue() : Global glfwGetTimerValue.glfwGetTimerValue
PrototypeC.q    glfwGetTimerFrequency() : Global glfwGetTimerFrequency.glfwGetTimerFrequency
PrototypeC      glfwMakeContextCurrent(*window) : Global glfwMakeContextCurrent.glfwMakeContextCurrent
PrototypeC.i    glfwGetCurrentContext() : Global glfwGetCurrentContext.glfwGetCurrentContext
PrototypeC      glfwSwapBuffers(*window) : Global glfwSwapBuffers.glfwSwapBuffers
PrototypeC      glfwSwapInterval(interval) : Global glfwSwapInterval.glfwSwapInterval
PrototypeC.i    glfwExtensionSupported(extension.p-utf8) : Global glfwExtensionSupported.glfwExtensionSupported
PrototypeC.i    glfwGetProcAddress(procname.p-utf8) : Global glfwGetProcAddress.glfwGetProcAddress

PrototypeC.i    glfwVulkanSupported() : Global glfwVulkanSupported.glfwVulkanSupported
PrototypeC      glfwGetRequiredInstanceExtensions(*count) : Global glfwGetRequiredInstanceExtensions.glfwGetRequiredInstanceExtensions
PrototypeC.i    glfwGetInstanceProcAddress(*instance, procname.p-utf8) : Global glfwGetInstanceProcAddress.glfwGetInstanceProcAddress
PrototypeC.i    glfwGetPhysicalDevicePresentationSupport(*instance, device, queuefamily) : Global glfwGetPhysicalDevicePresentationSupport.glfwGetPhysicalDevicePresentationSupport
PrototypeC.i    glfwCreateWindowSurface(*instance, *window, *allocator, *surface) : Global glfwCreateWindowSurface.glfwCreateWindowSurface

CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
PrototypeC.i    glfwGetWin32Adapter(*monitor) : Global glfwGetWin32Adapter.glfwGetWin32Adapter
PrototypeC.i    glfwGetWin32Monitor(*monitor) : Global glfwGetWin32Monitor.glfwGetWin32Monitor
PrototypeC.i    glfwGetWin32Window(*window) : Global glfwGetWin32Window.glfwGetWin32Window
PrototypeC.i    glfwGetWGLContext(*window) : Global glfwGetWGLContext.glfwGetWGLContext
CompilerEndIf

CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
PrototypeC.i    glfwGetX11Display() : Global glfwGetX11Display.glfwGetX11Display
PrototypeC.i    glfwGetX11Adapter(*monitor) : Global glfwGetX11Adapter.glfwGetX11Adapter
PrototypeC.i    glfwGetX11Monitor(*monitor)  : Global glfwGetX11Monitor.glfwGetX11Monitor
PrototypeC.i    glfwGetX11Window(*window) : Global glfwGetX11Window.glfwGetX11Window
PrototypeC.i    glfwGetGLXContext(*window) : Global glfwGetGLXContext.glfwGetGLXContext
PrototypeC.i    glfwGetGLXWindow(*window) : Global glfwGetGLXWindow.glfwGetGLXWindow
CompilerEndIf

CompilerEndIf 

EndDeclareModule

Module glfw
 ; NOP
EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 15
; Folding = ---
; Markers = 770
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant
; EnableUnicode