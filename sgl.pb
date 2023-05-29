Module sgl

UseModule gl ; import gl namespace

UseModule glfw ; import glfw namespace

UseModule dbg ; import dbg namespace

XIncludeFile "./extensions/ARB_debug_output.pb" ; for modern debug support

Macro CALLBACK_ERROR (source, desc)
 If SGL\fpCallBack_Error : SGL\fpCallBack_Error(source, desc) : EndIf 
EndMacro

; error callback sources

#SOURCE_ERROR_GLFW$   = "GLFW" 
#SOURCE_ERROR_SGL$    = "SGL"
#SOURCE_ERROR_OPENGL$ = "OPENGL"
#SOURCE_ERROR_GLSL$   = "GLSL"

;- Declares

Declare     init_sgl_obj()
Declare     init_window_hints()
Declare     init_mouse()
Declare     init_keyboard()
Declare.s   shader_type_to_string (type)
Declare     apply_window_hints()
Declare     callback_getprocaddress (func$)
Declare     split_glsl_errors (errlog$)
DeclareC    callback_error_glfw (err, *desc)
Declare     callback_error_opengl (source, type, id, severity, length, *message, *userParam)
DeclareC    callback_window_close (win)
DeclareC    callback_window_pos (win, x.l, y.l)
DeclareC    callback_window_size (win, width.l, height.l)
DeclareC    callback_window_focus (win, focused.l)
DeclareC    callback_window_minimize (win, minimized.l)
DeclareC    callback_window_maximize (win, maximized.l)
DeclareC    callback_window_frambuffer_size (win, width.l, height.l)
DeclareC    callback_window_refresh (win)
DeclareC    callback_window_scroll (win, x_offset.d, y_offset.d)
DeclareC    callback_window_key (win, key, scancode, action, mods)
DeclareC    callback_window_char (win, char)
DeclareC    callback_window_cursor_position (win, x.d, y.d)
DeclareC    callback_window_cursor_entering (win, entering)
DeclareC    callback_window_mouse_button (win, button, action, mods)
Declare.i   binary_lookup_string (Array arr$(1), key$)
Declare.i   map_key_to_sgl (glfw_key)
Declare.i   map_key_to_glfw (sgl_key)

;- Structures
  
Structure TIMER
 creationTime.d
 startTime.d
 startTime_Delta.d
EndStructure

;- SGL OBJ

Structure SGL_KEY
 keyStatus.i 
 keyPressed.i
EndStructure

Structure SGL_MOUSE
 scrollOffsetX.d
 scrollOffsetY.d
EndStructure

Structure SGL_KEYBOARD
 Array GLFW2SGL.i(#GLFW_KEY_LAST)
 Array SGL2GLFW.i(#Key_LAST)
 Array Text$(#Key_LAST)
 Array Keys.SGL_KEY(#Key_LAST)
 lastChar.i
 lastKey.i
EndStructure

Structure SGL_TRACK_FPS
 fps.i
 fpsCount.i 
 timerFps.i 
 
 maxFps.i
 targetFrameTime.f 
 timerFullFrame.i
EndStructure

Structure SGL_TRACK_FRAME_TIME
 timerFrame.i
 timerFrameAccum.i 
 frameCount.i 
 frameTime.f
 frameTimeAccum.f 
EndStructure


Structure SGL_OBJ
 initialized.i
  
 debugOutputLevel.i

 Mouse.SGL_MOUSE
 
 Keyboard.SGL_KEYBOARD
 
 TrackFps.SGL_TRACK_FPS
  
 TrackFrameTime.SGL_TRACK_FRAME_TIME
  
 Array ExtensionsStrings$(0) ; cached extensions strings 
 
 fpCallBack_Error.CallBack_Error
 fpCallBack_WindowClose.CallBack_WindowClose
 fpCallBack_WindowPos.CallBack_WindowPos
 fpCallBack_WindowSize.CallBack_WindowSize
 fpCallBack_WindowFocus.CallBack_WindowFocus
 fpCallBack_WindowMinimize.CallBack_WindowMinimize
 fpCallBack_WindowMaximize.CallBack_WindowMaximize
 fpCallBack_WindowFrameBufferSize.CallBack_WindowFrameBufferSize
 fpCallBack_WindowRefresh.CallBack_WindowRefresh
 fpCallBack_WindowScroll.CallBack_WindowScroll
 fpCallBack_Key.CallBack_Key
 fpCallBack_Char.CallBack_Char
 fpCallBack_CursorPos.CallBack_CursorPos
 fpCallBack_CursorEntering.CallBack_CursorEntering
 fpCallBack_MouseButton.CallBack_MouseButton
 
 hintWinOpenglDebug.i
 hintWinOpenglMajor.i
 hintWinOpenglMinor.i
 hintWinOpenglDepthBuffer.i
 hintWinOpenglStencilBits.i
 hintWinOpenglAccumulatorBits.i
 hintWinOpenglSamples.i
 hintWinOpenglProfile.i
 hintWinOpenglForwardCompatibile.i
 
 hintWinVisible.i
 hintWinResizable.i
 hintWinMaximized.i
 hintWinDecorated.i
 hintWinTopMost.i
 hintWinFocused.i
 hintWinCenteredCursor.i
 hintWinAutoMinimize.i
 hintWinFrameBufferDepth.i
 hintWinFrameBufferTransparent.i
 hintWinRefreshRate.i 
EndStructure : Global SGL.SGL_OBJ : init_sgl_obj()

;- Private

Procedure init_sgl_obj() 
 SGL\initialized = 0 
 SGL\debugOutputLevel = 0
 
 SGL\TrackFps\fps = 0
 SGL\TrackFps\fpsCount = 0
 SGL\TrackFps\timerFps = 0
 
 SGL\TrackFps\maxFps = 0
 SGL\TrackFps\timerFullFrame = 0
 SGL\TrackFps\targetFrameTime = 0.0

 SGL\TrackFrameTime\timerFrame = 0
 SGL\TrackFrameTime\timerFrameAccum = 0
 SGL\TrackFrameTime\frameCount = 0
 SGL\TrackFrameTime\frameTime = 0.0
 SGL\TrackFrameTime\frameTimeAccum = 0.0
 
 SGL\fpCallBack_Error = 0
 SGL\fpCallBack_WindowClose = 0
 SGL\fpCallBack_WindowPos = 0
 SGL\fpCallBack_WindowSize = 0
 SGL\fpCallBack_WindowFocus = 0
 SGL\fpCallBack_WindowMinimize = 0
 SGL\fpCallBack_WindowMaximize = 0
 SGL\fpCallBack_WindowFrameBufferSize = 0
 SGL\fpCallBack_WindowRefresh = 0
 SGL\fpCallBack_WindowScroll = 0
 SGL\fpCallBack_Key = 0
 SGL\fpCallBack_Char = 0
 SGL\fpCallBack_CursorPos = 0
 SGL\fpCallBack_CursorEntering = 0
 SGL\fpCallBack_MouseButton = 0

 Dim ExtensionsStrings$(0)
 
 init_window_hints()
 
 init_keyboard()
 
 init_mouse()
 
 glLoad::RegisterCallBack(glLoad::#CallBack_GetProcAddress, @callback_getprocaddress())
EndProcedure 

Procedure init_window_hints()
 SGL\hintWinOpenglDebug = 0
 SGL\hintWinOpenglMajor = 1
 SGL\hintWinOpenglMinor = 0
 SGL\hintWinOpenglDepthBuffer = 24
 SGL\hintWinOpenglStencilBits = 8
 SGL\hintWinOpenglAccumulatorBits = 0
 SGL\hintWinOpenglSamples = 0
 SGL\hintWinOpenglProfile = #PROFILE_ANY
 SGL\hintWinOpenglForwardCompatibile = 0

 SGL\hintWinVisible = 1 
 SGL\hintWinResizable = 1
 SGL\hintWinMaximized = 0
 SGL\hintWinDecorated = 1
 SGL\hintWinTopMost = 0
 SGL\hintWinFocused = 1
 SGL\hintWinCenteredCursor = 1
 SGL\hintWinAutoMinimize = 1
 SGL\hintWinFrameBufferDepth = 24
 SGL\hintWinFrameBufferTransparent = 0
 SGL\hintWinRefreshRate = #DONT_CARE
EndProcedure

Procedure init_mouse()
 SGL\Mouse\scrollOffsetX = 0.0
 SGL\Mouse\scrollOffsetY = 0.0
EndProcedure

Procedure init_keyboard()
 Protected i
  
 For i = 0 To #Key_LAST
    SGL\Keyboard\Keys(i)\keyStatus = #RELEASED
    SGL\Keyboard\Keys(i)\keyPressed = 0
 Next
 
 SGL\Keyboard\Text$(#Key_Unknown) = "Unknown"

 SGL\Keyboard\Text$(#Key_SPACE) = "Space"
 SGL\Keyboard\Text$(#Key_SINGLE_QUOTE) = "'"
 SGL\Keyboard\Text$(#Key_COMMA) = ","
 SGL\Keyboard\Text$(#Key_MINUS) = "-"
 SGL\Keyboard\Text$(#Key_PERIOD) = "."
 SGL\Keyboard\Text$(#Key_SLASH) = "/"
 SGL\Keyboard\Text$(#Key_0) = "0"
 SGL\Keyboard\Text$(#Key_1) = "1"
 SGL\Keyboard\Text$(#Key_2) = "2"
 SGL\Keyboard\Text$(#Key_3) = "3"
 SGL\Keyboard\Text$(#Key_4) = "4"
 SGL\Keyboard\Text$(#Key_5) = "5"
 SGL\Keyboard\Text$(#Key_6) = "6"
 SGL\Keyboard\Text$(#Key_7) = "7"
 SGL\Keyboard\Text$(#Key_8) = "8"
 SGL\Keyboard\Text$(#Key_9) = "9"
 SGL\Keyboard\Text$(#Key_SEMICOLON) = ";"
 SGL\Keyboard\Text$(#Key_EQUAL) = "="
 SGL\Keyboard\Text$(#Key_A) = "a"
 SGL\Keyboard\Text$(#Key_B) = "b"
 SGL\Keyboard\Text$(#Key_C) = "c"
 SGL\Keyboard\Text$(#Key_D) = "d"
 SGL\Keyboard\Text$(#Key_E) = "e"
 SGL\Keyboard\Text$(#Key_F) = "f"
 SGL\Keyboard\Text$(#Key_G) = "g"
 SGL\Keyboard\Text$(#Key_H) = "h"
 SGL\Keyboard\Text$(#Key_I) = "i"
 SGL\Keyboard\Text$(#Key_J) = "j"
 SGL\Keyboard\Text$(#Key_K) = "k"
 SGL\Keyboard\Text$(#Key_L) = "l"
 SGL\Keyboard\Text$(#Key_M) = "m"
 SGL\Keyboard\Text$(#Key_N) = "n"
 SGL\Keyboard\Text$(#Key_O) = "o"
 SGL\Keyboard\Text$(#Key_P) = "p"
 SGL\Keyboard\Text$(#Key_Q) = "q"
 SGL\Keyboard\Text$(#Key_R) = "r"
 SGL\Keyboard\Text$(#Key_S) = "s"
 SGL\Keyboard\Text$(#Key_T) = "t"
 SGL\Keyboard\Text$(#Key_U) = "u"
 SGL\Keyboard\Text$(#Key_V) = "v"
 SGL\Keyboard\Text$(#Key_W) = "w"
 SGL\Keyboard\Text$(#Key_X) = "x"
 SGL\Keyboard\Text$(#Key_Y) = "y"
 SGL\Keyboard\Text$(#Key_Z) = "z"
 SGL\Keyboard\Text$(#Key_LEFT_BRACKET) = "["
 SGL\Keyboard\Text$(#Key_BACKSLASH ) = "\"
 SGL\Keyboard\Text$(#Key_RIGHT_BRACKET) = "]"
 SGL\Keyboard\Text$(#Key_ACCENT) = "`"
 SGL\Keyboard\Text$(#Key_ESCAPE) = "Esc"
 SGL\Keyboard\Text$(#Key_ENTER) = "Enter"
 SGL\Keyboard\Text$(#Key_TAB) = "Tab"
 SGL\Keyboard\Text$(#Key_BACKSPACE) = "Backspace"
 SGL\Keyboard\Text$(#Key_INSERT) = "Ins"
 SGL\Keyboard\Text$(#Key_DELETE) = "Del"
 SGL\Keyboard\Text$(#Key_RIGHT) = "Right"
 SGL\Keyboard\Text$(#Key_LEFT) = "Left"
 SGL\Keyboard\Text$(#Key_DOWN) = "Down"
 SGL\Keyboard\Text$(#Key_UP) = "Up"
 SGL\Keyboard\Text$(#Key_PAGEUP) = "Page Up"
 SGL\Keyboard\Text$(#Key_PAGEDOWN) = "Page Down"
 SGL\Keyboard\Text$(#Key_HOME) = "Home"
 SGL\Keyboard\Text$(#Key_END) = "End"
 SGL\Keyboard\Text$(#Key_CAPSLOCK) = "Caps Lock"
 SGL\Keyboard\Text$(#Key_SCROLL_LOCK) = "Scroll Lock"
 SGL\Keyboard\Text$(#Key_KP_NUMLOCK) = "Num Lock"
 SGL\Keyboard\Text$(#Key_PRINTSCREEN) = "Print Screen"
 SGL\Keyboard\Text$(#Key_PAUSE) = "Pause"
 SGL\Keyboard\Text$(#Key_F1) = "F1"
 SGL\Keyboard\Text$(#Key_F2) = "F2"
 SGL\Keyboard\Text$(#Key_F3) = "F3"
 SGL\Keyboard\Text$(#Key_F4) = "F4"
 SGL\Keyboard\Text$(#Key_F5) = "F5"
 SGL\Keyboard\Text$(#Key_F6) = "F6"
 SGL\Keyboard\Text$(#Key_F7) = "F7"
 SGL\Keyboard\Text$(#Key_F8) = "F8"
 SGL\Keyboard\Text$(#Key_F9) = "F9"
 SGL\Keyboard\Text$(#Key_F10) = "F10"
 SGL\Keyboard\Text$(#Key_F11) = "F11"
 SGL\Keyboard\Text$(#Key_F12) = "F12"
 SGL\Keyboard\Text$(#Key_F13) = "F13"
 SGL\Keyboard\Text$(#Key_F14) = "F14"
 SGL\Keyboard\Text$(#Key_F15) = "F15"
 SGL\Keyboard\Text$(#Key_F16) = "F16"
 SGL\Keyboard\Text$(#Key_F17) = "F17"
 SGL\Keyboard\Text$(#Key_F18) = "F18"
 SGL\Keyboard\Text$(#Key_F19) = "F19"
 SGL\Keyboard\Text$(#Key_F20) = "F20"
 SGL\Keyboard\Text$(#Key_KP_0) = "Keypad 0"
 SGL\Keyboard\Text$(#Key_KP_1) = "Keypad 1"
 SGL\Keyboard\Text$(#Key_KP_2) = "Keypad 2"
 SGL\Keyboard\Text$(#Key_KP_3) = "Keypad 3"
 SGL\Keyboard\Text$(#Key_KP_4) = "Keypad 4"
 SGL\Keyboard\Text$(#Key_KP_5) = "Keypad 5"
 SGL\Keyboard\Text$(#Key_KP_6) = "Keypad 6"
 SGL\Keyboard\Text$(#Key_KP_7) = "Keypad 7"
 SGL\Keyboard\Text$(#Key_KP_8) = "Keypad 8"
 SGL\Keyboard\Text$(#Key_KP_9) = "Keypad 9"
 SGL\Keyboard\Text$(#Key_KP_DECIMAL) = "Keypad ."
 SGL\Keyboard\Text$(#Key_KP_DIVIDE) = "Keypad /"
 SGL\Keyboard\Text$(#Key_KP_MULTIPLY) = "Keypad *"
 SGL\Keyboard\Text$(#Key_KP_SUBTRACT) = "Keypad -"
 SGL\Keyboard\Text$(#Key_KP_ADD) = "Keypad +"
 SGL\Keyboard\Text$(#Key_KP_ENTER) = "Keypad Enter"
 SGL\Keyboard\Text$(#Key_KP_EQUAL) = "Keypad ="
 SGL\Keyboard\Text$(#Key_LEFT_SHIFT) = "Left Shift"
 SGL\Keyboard\Text$(#Key_LEFT_CONTROL) = "Left Ctrl"
 SGL\Keyboard\Text$(#Key_LEFT_ALT) = "Left Alt"
 SGL\Keyboard\Text$(#Key_LEFT_SUPER) = "Left Super"
 SGL\Keyboard\Text$(#Key_RIGHT_SHIFT) = "Right Shift"
 SGL\Keyboard\Text$(#Key_RIGHT_CONTROL) = "Right Ctrl"
 SGL\Keyboard\Text$(#Key_RIGHT_ALT) = "Right Alt"
 SGL\Keyboard\Text$(#Key_RIGHT_SUPER) = "Right Super"
 SGL\Keyboard\Text$(#Key_MENU) = "Menu"

 SGL\Keyboard\SGL2GLFW(#Key_SPACE) = #GLFW_KEY_SPACE
 SGL\Keyboard\SGL2GLFW(#Key_SINGLE_QUOTE) = #GLFW_KEY_APOSTROPHE
 SGL\Keyboard\SGL2GLFW(#Key_COMMA) = #GLFW_KEY_COMMA
 SGL\Keyboard\SGL2GLFW(#Key_MINUS) = #GLFW_KEY_MINUS
 SGL\Keyboard\SGL2GLFW(#Key_PERIOD) = #GLFW_KEY_PERIOD
 SGL\Keyboard\SGL2GLFW(#Key_SLASH) = #GLFW_KEY_SLASH
 SGL\Keyboard\SGL2GLFW(#Key_0) = #GLFW_KEY_0
 SGL\Keyboard\SGL2GLFW(#Key_1) = #GLFW_KEY_1
 SGL\Keyboard\SGL2GLFW(#Key_2) = #GLFW_KEY_2
 SGL\Keyboard\SGL2GLFW(#Key_3) = #GLFW_KEY_3
 SGL\Keyboard\SGL2GLFW(#Key_4) = #GLFW_KEY_4
 SGL\Keyboard\SGL2GLFW(#Key_5) = #GLFW_KEY_5
 SGL\Keyboard\SGL2GLFW(#Key_6) = #GLFW_KEY_6
 SGL\Keyboard\SGL2GLFW(#Key_7) = #GLFW_KEY_7
 SGL\Keyboard\SGL2GLFW(#Key_8) = #GLFW_KEY_8
 SGL\Keyboard\SGL2GLFW(#Key_9) = #GLFW_KEY_9
 SGL\Keyboard\SGL2GLFW(#Key_SEMICOLON) = #GLFW_KEY_SEMICOLON
 SGL\Keyboard\SGL2GLFW(#Key_EQUAL) = #GLFW_KEY_EQUAL
 SGL\Keyboard\SGL2GLFW(#Key_A) = #GLFW_KEY_A
 SGL\Keyboard\SGL2GLFW(#Key_B) = #GLFW_KEY_B
 SGL\Keyboard\SGL2GLFW(#Key_C) = #GLFW_KEY_C
 SGL\Keyboard\SGL2GLFW(#Key_D) = #GLFW_KEY_D
 SGL\Keyboard\SGL2GLFW(#Key_E) = #GLFW_KEY_E
 SGL\Keyboard\SGL2GLFW(#Key_F) = #GLFW_KEY_F
 SGL\Keyboard\SGL2GLFW(#Key_G) = #GLFW_KEY_G
 SGL\Keyboard\SGL2GLFW(#Key_H) = #GLFW_KEY_H
 SGL\Keyboard\SGL2GLFW(#Key_I) = #GLFW_KEY_I
 SGL\Keyboard\SGL2GLFW(#Key_J) = #GLFW_KEY_J
 SGL\Keyboard\SGL2GLFW(#Key_K) = #GLFW_KEY_K
 SGL\Keyboard\SGL2GLFW(#Key_L) = #GLFW_KEY_L
 SGL\Keyboard\SGL2GLFW(#Key_M) = #GLFW_KEY_M
 SGL\Keyboard\SGL2GLFW(#Key_N) = #GLFW_KEY_N
 SGL\Keyboard\SGL2GLFW(#Key_O) = #GLFW_KEY_O
 SGL\Keyboard\SGL2GLFW(#Key_P) = #GLFW_KEY_P
 SGL\Keyboard\SGL2GLFW(#Key_Q) = #GLFW_KEY_Q
 SGL\Keyboard\SGL2GLFW(#Key_R) = #GLFW_KEY_R
 SGL\Keyboard\SGL2GLFW(#Key_S) = #GLFW_KEY_S
 SGL\Keyboard\SGL2GLFW(#Key_T) = #GLFW_KEY_T
 SGL\Keyboard\SGL2GLFW(#Key_U) = #GLFW_KEY_U
 SGL\Keyboard\SGL2GLFW(#Key_V) = #GLFW_KEY_V
 SGL\Keyboard\SGL2GLFW(#Key_W) = #GLFW_KEY_W
 SGL\Keyboard\SGL2GLFW(#Key_X) = #GLFW_KEY_X
 SGL\Keyboard\SGL2GLFW(#Key_Y) = #GLFW_KEY_Y
 SGL\Keyboard\SGL2GLFW(#Key_Z) = #GLFW_KEY_Z
 SGL\Keyboard\SGL2GLFW(#Key_LEFT_BRACKET) = #GLFW_KEY_LEFT_BRACKET
 SGL\Keyboard\SGL2GLFW(#Key_BACKSLASH ) = #GLFW_KEY_BACKSLASH
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT_BRACKET) = #GLFW_KEY_RIGHT_BRACKET
 SGL\Keyboard\SGL2GLFW(#Key_ACCENT) = #GLFW_KEY_GRAVE_ACCENT
 SGL\Keyboard\SGL2GLFW(#Key_ESCAPE) = #GLFW_KEY_ESCAPE
 SGL\Keyboard\SGL2GLFW(#Key_ENTER) = #GLFW_KEY_ENTER
 SGL\Keyboard\SGL2GLFW(#Key_TAB) = #GLFW_KEY_TAB
 SGL\Keyboard\SGL2GLFW(#Key_BACKSPACE) = #GLFW_KEY_BACKSPACE
 SGL\Keyboard\SGL2GLFW(#Key_INSERT) = #GLFW_KEY_INSERT
 SGL\Keyboard\SGL2GLFW(#Key_DELETE) = #GLFW_KEY_DELETE
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT) = #GLFW_KEY_RIGHT
 SGL\Keyboard\SGL2GLFW(#Key_LEFT) = #GLFW_KEY_LEFT
 SGL\Keyboard\SGL2GLFW(#Key_DOWN) = #GLFW_KEY_DOWN
 SGL\Keyboard\SGL2GLFW(#Key_UP) = #GLFW_KEY_UP
 SGL\Keyboard\SGL2GLFW(#Key_PAGEUP) = #GLFW_KEY_PAGE_UP
 SGL\Keyboard\SGL2GLFW(#Key_PAGEDOWN) = #GLFW_KEY_PAGE_DOWN
 SGL\Keyboard\SGL2GLFW(#Key_HOME) = #GLFW_KEY_HOME
 SGL\Keyboard\SGL2GLFW(#Key_END) = #GLFW_KEY_END
 SGL\Keyboard\SGL2GLFW(#Key_CAPSLOCK) = #GLFW_KEY_CAPS_LOCK
 SGL\Keyboard\SGL2GLFW(#Key_SCROLL_LOCK) = #GLFW_KEY_SCROLL_LOCK
 SGL\Keyboard\SGL2GLFW(#Key_KP_NUMLOCK) = #GLFW_KEY_NUM_LOCK
 SGL\Keyboard\SGL2GLFW(#Key_PRINTSCREEN) = #GLFW_KEY_PRINT_SCREEN
 SGL\Keyboard\SGL2GLFW(#Key_PAUSE) = #GLFW_KEY_PAUSE
 SGL\Keyboard\SGL2GLFW(#Key_F1) = #GLFW_KEY_F1
 SGL\Keyboard\SGL2GLFW(#Key_F2) = #GLFW_KEY_F2
 SGL\Keyboard\SGL2GLFW(#Key_F3) = #GLFW_KEY_F3
 SGL\Keyboard\SGL2GLFW(#Key_F4) = #GLFW_KEY_F4
 SGL\Keyboard\SGL2GLFW(#Key_F5) = #GLFW_KEY_F5
 SGL\Keyboard\SGL2GLFW(#Key_F6) = #GLFW_KEY_F6
 SGL\Keyboard\SGL2GLFW(#Key_F7) = #GLFW_KEY_F7
 SGL\Keyboard\SGL2GLFW(#Key_F8) = #GLFW_KEY_F8
 SGL\Keyboard\SGL2GLFW(#Key_F9) = #GLFW_KEY_F9
 SGL\Keyboard\SGL2GLFW(#Key_F10) = #GLFW_KEY_F10
 SGL\Keyboard\SGL2GLFW(#Key_F11) = #GLFW_KEY_F11
 SGL\Keyboard\SGL2GLFW(#Key_F12) = #GLFW_KEY_F12
 SGL\Keyboard\SGL2GLFW(#Key_F13) = #GLFW_KEY_F13
 SGL\Keyboard\SGL2GLFW(#Key_F14) = #GLFW_KEY_F14
 SGL\Keyboard\SGL2GLFW(#Key_F15) = #GLFW_KEY_F15
 SGL\Keyboard\SGL2GLFW(#Key_F16) = #GLFW_KEY_F16
 SGL\Keyboard\SGL2GLFW(#Key_F17) = #GLFW_KEY_F17
 SGL\Keyboard\SGL2GLFW(#Key_F18) = #GLFW_KEY_F18
 SGL\Keyboard\SGL2GLFW(#Key_F19) = #GLFW_KEY_F19
 SGL\Keyboard\SGL2GLFW(#Key_F20) = #GLFW_KEY_F20
 SGL\Keyboard\SGL2GLFW(#Key_KP_0) = #GLFW_KEY_KP_0
 SGL\Keyboard\SGL2GLFW(#Key_KP_1) = #GLFW_KEY_KP_1
 SGL\Keyboard\SGL2GLFW(#Key_KP_2) = #GLFW_KEY_KP_2
 SGL\Keyboard\SGL2GLFW(#Key_KP_3) = #GLFW_KEY_KP_3
 SGL\Keyboard\SGL2GLFW(#Key_KP_4) = #GLFW_KEY_KP_4
 SGL\Keyboard\SGL2GLFW(#Key_KP_5) = #GLFW_KEY_KP_5
 SGL\Keyboard\SGL2GLFW(#Key_KP_6) = #GLFW_KEY_KP_6
 SGL\Keyboard\SGL2GLFW(#Key_KP_7) = #GLFW_KEY_KP_7
 SGL\Keyboard\SGL2GLFW(#Key_KP_8) = #GLFW_KEY_KP_8
 SGL\Keyboard\SGL2GLFW(#Key_KP_9) = #GLFW_KEY_KP_9
 SGL\Keyboard\SGL2GLFW(#Key_KP_DECIMAL) = #GLFW_KEY_KP_DECIMAL
 SGL\Keyboard\SGL2GLFW(#Key_KP_DIVIDE) = #GLFW_KEY_KP_DIVIDE
 SGL\Keyboard\SGL2GLFW(#Key_KP_MULTIPLY) = #GLFW_KEY_KP_MULTIPLY
 SGL\Keyboard\SGL2GLFW(#Key_KP_SUBTRACT) = #GLFW_KEY_KP_SUBTRACT
 SGL\Keyboard\SGL2GLFW(#Key_KP_ADD) = #GLFW_KEY_KP_ADD
 SGL\Keyboard\SGL2GLFW(#Key_KP_ENTER) = #GLFW_KEY_KP_ENTER
 SGL\Keyboard\SGL2GLFW(#Key_KP_EQUAL) = #GLFW_KEY_KP_EQUAL
 SGL\Keyboard\SGL2GLFW(#Key_LEFT_SHIFT) = #GLFW_KEY_LEFT_SHIFT
 SGL\Keyboard\SGL2GLFW(#Key_LEFT_CONTROL) = #GLFW_KEY_LEFT_CONTROL
 SGL\Keyboard\SGL2GLFW(#Key_LEFT_ALT) = #GLFW_KEY_LEFT_ALT
 SGL\Keyboard\SGL2GLFW(#Key_LEFT_SUPER) = #GLFW_KEY_LEFT_SUPER
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT_SHIFT) = #GLFW_KEY_RIGHT_SHIFT
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT_CONTROL) = #GLFW_KEY_RIGHT_CONTROL
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT_ALT) = #GLFW_KEY_RIGHT_ALT
 SGL\Keyboard\SGL2GLFW(#Key_RIGHT_SUPER) = #GLFW_KEY_RIGHT_SUPER
 SGL\Keyboard\SGL2GLFW(#Key_MENU) = #GLFW_KEY_MENU

 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SPACE) = #Key_SPACE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_APOSTROPHE) = #Key_SINGLE_QUOTE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_COMMA) = #Key_COMMA
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_MINUS) = #Key_MINUS
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PERIOD) = #Key_PERIOD
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SLASH) = #Key_SLASH
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_0) = #Key_0
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_1) = #Key_1
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_2) = #Key_2
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_3) = #Key_3
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_4) = #Key_4
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_5) = #Key_5
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_6) = #Key_6
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_7) = #Key_7
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_8) = #Key_8
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_9) = #Key_9
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SEMICOLON) = #Key_SEMICOLON
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_EQUAL) = #Key_EQUAL
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_A) = #Key_A
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_B) = #Key_B
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_C) = #Key_C
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_D) = #Key_D
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_E) = #Key_E
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F) = #Key_F
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_G) = #Key_G
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_H) = #Key_H
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_I) = #Key_I
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_J) = #Key_J
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_K) = #Key_K
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_L) = #Key_L
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_M) = #Key_M
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_N) = #Key_N
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_O) = #Key_O
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_P) = #Key_P
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Q) = #Key_Q
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_R) = #Key_R
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_S) = #Key_S
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_T) = #Key_T
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_U) = #Key_U
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_V) = #Key_V
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_W) = #Key_W
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_X) = #Key_X
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Y) = #Key_Y
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_Z) = #Key_Z
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_BRACKET) = #Key_LEFT_BRACKET
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_BACKSLASH) = #Key_BACKSLASH 
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_BRACKET) = #Key_RIGHT_BRACKET
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_GRAVE_ACCENT) = #Key_ACCENT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_ESCAPE) = #Key_ESCAPE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_ENTER) = #Key_ENTER
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_TAB) = #Key_TAB
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_BACKSPACE) = #Key_BACKSPACE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_INSERT) = #Key_INSERT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_DELETE) = #Key_DELETE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT) = #Key_RIGHT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT) = #Key_LEFT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_DOWN) = #Key_DOWN
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_UP) = #Key_UP
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAGE_UP) = #Key_PAGEUP
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAGE_DOWN) = #Key_PAGEDOWN
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_HOME) = #Key_HOME
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_END) = #Key_END
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_CAPS_LOCK) = #Key_CAPSLOCK
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_SCROLL_LOCK) = #Key_SCROLL_LOCK
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_NUM_LOCK) = #Key_KP_NUMLOCK
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PRINT_SCREEN) = #Key_PRINTSCREEN
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_PAUSE) = #Key_PAUSE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F1) = #Key_F1
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F2) = #Key_F2
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F3) = #Key_F3
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F4) = #Key_F4
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F5) = #Key_F5
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F6) = #Key_F6
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F7) = #Key_F7
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F8) = #Key_F8
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F9) = #Key_F9
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F10) = #Key_F10
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F11) = #Key_F11
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F12) = #Key_F12
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F13) = #Key_F13
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F14) = #Key_F14
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F15) = #Key_F15
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F16) = #Key_F16
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F17) = #Key_F17
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F18) = #Key_F18
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F19) = #Key_F19
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_F20) = #Key_F20
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_0) = #Key_KP_0
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_1) = #Key_KP_1
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_2) = #Key_KP_2
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_3) = #Key_KP_3
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_4) = #Key_KP_4
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_5) = #Key_KP_5
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_6) = #Key_KP_6
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_7) = #Key_KP_7
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_8) = #Key_KP_8
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_9) = #Key_KP_9
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_DECIMAL) = #Key_KP_DECIMAL
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_DIVIDE) = #Key_KP_DIVIDE
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_MULTIPLY) = #Key_KP_MULTIPLY
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_SUBTRACT) = #Key_KP_SUBTRACT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_ADD) = #Key_KP_ADD
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_ENTER) = #Key_KP_ENTER
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_KP_EQUAL) = #Key_KP_EQUAL
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_SHIFT) = #Key_LEFT_SHIFT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_CONTROL) = #Key_LEFT_CONTROL 
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_ALT) = #Key_LEFT_ALT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_LEFT_SUPER) = #Key_LEFT_SUPER
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_SHIFT) = #Key_RIGHT_SHIFT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_CONTROL) = #Key_RIGHT_CONTROL
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_ALT) = #Key_RIGHT_ALT
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_RIGHT_SUPER) = #Key_RIGHT_SUPER
 SGL\Keyboard\GLFW2SGL(#GLFW_KEY_MENU) = #Key_MENU
EndProcedure

Procedure apply_window_hints()
 glfwWindowHint(#GLFW_OPENGL_DEBUG_CONTEXT, SGL\hintWinOpenglDebug)
 glfwWindowHint(#GLFW_CONTEXT_VERSION_MAJOR, SGL\hintWinOpenglMajor)
 glfwWindowHint(#GLFW_CONTEXT_VERSION_MINOR, SGL\hintWinOpenglMinor)
 glfwWindowHint(#GLFW_DEPTH_BITS, SGL\hintWinOpenglDepthBuffer)
 glfwWindowHint(#GLFW_STENCIL_BITS, SGL\hintWinOpenglStencilBits)
 glfwWindowHint(#GLFW_ACCUM_RED_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
 glfwWindowHint(#GLFW_ACCUM_GREEN_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
 glfwWindowHint(#GLFW_ACCUM_BLUE_BITS, SGL\hintWinOpenglAccumulatorBits / 8)
 glfwWindowHint(#GLFW_ACCUM_ALPHA_BITS, SGL\hintWinOpenglAccumulatorBits / 8) 
 glfwWindowHint(#GLFW_SAMPLES, SGL\hintWinOpenglSamples) 
 
 Select SGL\hintWinOpenglProfile
    Case #PROFILE_ANY
        glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_ANY_PROFILE)
    Case #PROFILE_COMPATIBLE
        glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_COMPAT_PROFILE)
    Case #PROFILE_CORE
        glfwWindowHint(#GLFW_OPENGL_PROFILE, #GLFW_OPENGL_CORE_PROFILE)
    Default
        ASSERT_FAIL("The hinted OpenGL profile is invalid.")
 EndSelect 
 
 glfwWindowHint(#GLFW_OPENGL_FORWARD_COMPAT, SGL\hintWinOpenglForwardCompatibile)
 
 glfwWindowHint(#GLFW_VISIBLE, SGL\hintWinVisible)
 glfwWindowHint(#GLFW_RESIZABLE, SGL\hintWinResizable)
 glfwWindowHint(#GLFW_MAXIMIZED, SGL\hintWinMaximized)
 glfwWindowHint(#GLFW_DECORATED, SGL\hintWinDecorated)
 glfwWindowHint(#GLFW_FLOATING, SGL\hintWinTopMost)
 glfwWindowHint(#GLFW_FOCUSED, SGL\hintWinFocused)
 glfwWindowHint(#GLFW_CENTER_CURSOR, SGL\hintWinCenteredCursor)
 glfwWindowHint(#GLFW_AUTO_ICONIFY, SGL\hintWinAutoMinimize)
 glfwWindowHint(#GLFW_RED_BITS, SGL\hintWinFrameBufferDepth / 8)
 glfwWindowHint(#GLFW_GREEN_BITS, SGL\hintWinFrameBufferDepth / 8)
 glfwWindowHint(#GLFW_BLUE_BITS, SGL\hintWinFrameBufferDepth / 8)
 glfwWindowHint(#GLFW_ALPHA_BITS, SGL\hintWinFrameBufferDepth / 8)
 glfwWindowHint(#GLFW_TRANSPARENT_FRAMEBUFFER, SGL\hintWinFrameBufferTransparent)
 
 glfwWindowHint(#GLFW_REFRESH_RATE, SGL\hintWinRefreshRate)
EndProcedure

Procedure.s shader_type_to_string (type)
 Protected type$
 
 Select type
    Case #GL_VERTEX_SHADER
        type$ = "#GL_VERTEX_SHADER"
    Case #GL_FRAGMENT_SHADER
        type$ = "#GL_FRAGMENT_SHADER"
    Case #GL_GEOMETRY_SHADER
        type$ = "#GL_GEOMETRY_SHADER"
    Case #GL_COMPUTE_SHADER
        type$ = "#GL_COMPUTE_SHADER"
    Case #GL_TESS_CONTROL_SHADER
        type$ = "#GL_TESS_CONTROL_SHADER"
    Case #GL_TESS_EVALUATION_SHADER
        type$ = "#GL_TESS_EVALUATION_SHADER"
    Default
        type$ = "UNKNOWN"       
 EndSelect
    
 ProcedureReturn type$
EndProcedure

Procedure split_glsl_errors (errlog$)
 Protected i, lines, newline$
 Dim lines$(0)
 
 If FindString(errlog$, #CRLF$)
    newline$ = #CRLF$
 Else   
    newline$ = #LF$
 EndIf
 
 lines = str::SplitToArray(errlog$, newline$, lines$())
   
 For i = 0 To lines - 1
    If Len(lines$(i))
        CALLBACK_ERROR (#SOURCE_ERROR_GLSL$, lines$(i))
    EndIf
 Next
EndProcedure

Procedure callback_getprocaddress (func$) 
 ProcedureReturn glfwGetProcAddress(func$) 
EndProcedure

ProcedureC callback_error_glfw (err, *desc)
 If SGL\fpCallBack_Error 
    SGL\fpCallBack_Error(#SOURCE_ERROR_GLFW$, PeekS(*desc, -1, #PB_UTF8) + " (ErrCode = " + Str(err) + ") ")
 EndIf 
EndProcedure

Procedure callback_error_opengl (source, type, id, severity, length, *message, *userParam)
 Protected source$, type$, severity$, out$ 
 
 If SGL\fpCallBack_Error     
    Select source
        Case #GL_DEBUG_SOURCE_API:               source$ = "API"
        Case #GL_DEBUG_SOURCE_WINDOW_SYSTEM:     source$ = "Window System" 
        Case #GL_DEBUG_SOURCE_SHADER_COMPILER:   source$ = "Compiler"
        Case #GL_DEBUG_SOURCE_THIRD_PARTY:       source$ = "Third Party"
        Case #GL_DEBUG_SOURCE_APPLICATION:       source$ = "Application"
        Default : source$ = "Other"
    EndSelect

    Select type        
        Case #GL_DEBUG_TYPE_ERROR:               type$ = "Error"
        Case #GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR: type$ = "Deprecated Behaviour"
        Case #GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR:  type$ = "Undefined Behaviour"
        Case #GL_DEBUG_TYPE_PORTABILITY:         type$ = "Portability"
        Case #GL_DEBUG_TYPE_PERFORMANCE:         type$ = "Performance"
        Case #GL_DEBUG_TYPE_MARKER:              type$ = "Marker"
        Case #GL_DEBUG_TYPE_PUSH_GROUP:          type$ = "Push Group"
        Case #GL_DEBUG_TYPE_POP_GROUP:           type$ = "Pop Group"
        Default : source$ = "Other"
    EndSelect
    
   Select severity
        Case #GL_DEBUG_SEVERITY_HIGH:            severity$ = "High" : severity = #DEBUG_OUPUT_HIGH
        Case #GL_DEBUG_SEVERITY_MEDIUM:          severity$ = "Medium" : severity = #DEBUG_OUPUT_MEDIUM
        Case #GL_DEBUG_SEVERITY_LOW:             severity$ = "Low" : severity = #DEBUG_OUPUT_LOW
        Case #GL_DEBUG_SEVERITY_NOTIFICATION:    severity$ = "Notifications" : severity = #DEBUG_OUPUT_NOTIFICATIONS
        Default : severity = #DEBUG_OUPUT_NOTIFICATIONS
    EndSelect
    
    If severity >= SGL\debugOutputLevel            
        out$ = "Src: " + source$ + ", Type: " + type$ + ", " + severity$ + ", " + PeekS(*message, -1, #PB_UTF8)
        SGL\fpCallBack_Error(#SOURCE_ERROR_OPENGL$, out$)
    EndIf     
 EndIf
EndProcedure

ProcedureC callback_window_close (win)
 If SGL\fpCallBack_WindowClose
    SGL\fpCallBack_WindowClose(win)
 EndIf
EndProcedure

ProcedureC callback_window_pos (win, x.l, y.l)
 If SGL\fpCallBack_WindowPos
    SGL\fpCallBack_WindowPos(win, x, y)
 EndIf
EndProcedure

ProcedureC callback_window_size (win, width.l, height.l)
 If SGL\fpCallBack_WindowSize
    SGL\fpCallBack_WindowSize(win, width, height)
 EndIf
EndProcedure

ProcedureC callback_window_focus (win, focused.l)
 If SGL\fpCallBack_WindowFocus
    SGL\fpCallBack_WindowFocus(win, focused)
 EndIf
EndProcedure

ProcedureC callback_window_minimize (win, minimized.l)
 If SGL\fpCallBack_WindowMinimize
    SGL\fpCallBack_WindowMinimize(win, minimized)
 EndIf
EndProcedure

ProcedureC callback_window_maximize (win, maximized.l)
 If SGL\fpCallBack_WindowMaximize
    SGL\fpCallBack_WindowMaximize(win, maximized)
 EndIf
EndProcedure

ProcedureC callback_window_frambuffer_size (win, width.l, height.l)
 If SGL\fpCallBack_WindowFrameBufferSize
    SGL\fpCallBack_WindowFrameBufferSize(win, width, height)
 EndIf 
EndProcedure

ProcedureC callback_window_refresh (win)
 If SGL\fpCallBack_WindowRefresh
    SGL\fpCallBack_WindowRefresh(win)
 EndIf 
EndProcedure

ProcedureC callback_window_scroll (win, x_offset.d, y_offset.d)
 SGL\Mouse\scrollOffsetX = x_offset
 SGL\Mouse\scrollOffsetY = y_offset
 
 If SGL\fpCallBack_WindowScroll
    SGL\fpCallBack_WindowScroll(win, x_offset, y_offset)
 EndIf 
EndProcedure

ProcedureC callback_window_key (win, key, scancode, action, mods)
 key = map_key_to_sgl(key)
 
 If action = #RELEASED
    SGL\Keyboard\Keys(key)\KeyPressed = 0 ; release the "sticky" status of GetKeyPress()
    SGL\Keyboard\Keys(key)\keyStatus = #RELEASED
 EndIf
 
 If action = #PRESSED Or action = #REPEATING
    SGL\Keyboard\lastKey = key ; used by GetLastKey()
    SGL\Keyboard\Keys(key)\keyStatus = #PRESSED
 EndIf

 If SGL\fpCallBack_Key    
    SGL\fpCallBack_Key(win, key, scancode, action, mods)
 EndIf 
EndProcedure

ProcedureC callback_window_char (win, char) 
 SGL\Keyboard\lastChar = char ; used by GetLastChar()
 
 If SGL\fpCallBack_Char
    SGL\fpCallBack_Char(win, char)
 EndIf 
EndProcedure

ProcedureC callback_window_cursor_position (win, x.d, y.d)
 If SGL\fpCallBack_CursorPos
    SGL\fpCallBack_CursorPos(win, x, y)
 EndIf 
EndProcedure

ProcedureC callback_window_cursor_entering (win, entering)
 If SGL\fpCallBack_CursorEntering
    SGL\fpCallBack_CursorEntering(win, entering)
 EndIf 
EndProcedure

ProcedureC callback_window_mouse_button (win, button, action, mods)
 If SGL\fpCallBack_MouseButton
    SGL\fpCallBack_MouseButton(win, button, action, mods)
 EndIf 
EndProcedure

Procedure.i binary_lookup_string (Array arr$(1), key$) 
 Protected l, m, h = ArraySize(arr$()) + 1
 
 While l <= h
    m = (l + h) / 2
    If key$ < arr$(m)
        h = m - 1
    ElseIf key$ > arr$(m) 
        l = m + 1
    Else
        ProcedureReturn m ; found 
    EndIf
 Wend
 
 ProcedureReturn -1 ; not found
EndProcedure

Procedure.i map_key_to_sgl (glfw_key)
 If glfw_key = #GLFW_KEY_UNKNOWN
    ProcedureReturn #Key_Unknown
 EndIf 
 ProcedureReturn SGL\Keyboard\GLFW2SGL(glfw_key)
EndProcedure

Procedure.i map_key_to_glfw (sgl_key)
 If sgl_key = #Key_Unknown
    ProcedureReturn #GLFW_KEY_UNKNOWN
 EndIf
 ProcedureReturn SGL\Keyboard\SGL2GLFW(sgl_key)
EndProcedure

Procedure.i find_zero_alpha_vertically (stripX, stripHeight, stripWidth) 
 Protected stripY = 0
 
 While stripX < stripWidth
     While stripY < stripHeight
        If Alpha(Point(stripX, stripY)) <> 0
            If stripX < stripWidth
                stripX + 1
                stripY = 0
                Continue
            EndIf
            ProcedureReturn stripWidth 
        EndIf
        stripY + 1
     Wend          
     ProcedureReturn stripX
 Wend
 
 ProcedureReturn stripWidth 
EndProcedure

Procedure.i find_some_alpha_vertically (stripX, stripHeight, stripWidth) 
 Protected stripY = 0
 
 While stripX < stripWidth
     While stripY < stripHeight
        If Alpha(Point(stripX, stripY)) <> 0
            ProcedureReturn stripX
        EndIf
        stripY + 1
     Wend          
     stripX + 1
     stripY = 0
 Wend
 
 ProcedureReturn stripWidth 
EndProcedure

;- Public 

;- [ CORE ]

Procedure.i Init()
;> Initialize the SGL library.
 
 If SGL\initialized = #True    
    CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "SGL has been already initialized.")
    Goto exit
 EndIf
 
 UsePNGImageEncoder() 
 UsePNGImageDecoder()

 UseJPEGImageEncoder() 
 UseJPEGImageDecoder()
 
 UseZipPacker()

 Protected err = glfwLoad::Load()

 Select err
    Case glfwLoad::#LOAD_OK
        ; NOP
    Case glfwLoad::#LOAD_DLL_NOT_FOUND        
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "GLFW dynamic library not found.")    
        Goto exit
    Case glfwLoad::#LOAD_MISSING_IMPORTED_FUNCS        
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "Some of the GLFW dynamically imported functions are missing.")
        Goto exit
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwLoad::Load() return code was unexpected.")
        Goto exit
 EndSelect 
 
 glfwSetErrorCallback(@callback_error_glfw())
 
 If glfwInit() = 0    
    CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwInit() failed.")
    Goto exit
 EndIf
 
 glfwDefaultWindowHints()
  
 init_window_hints()
 
 init_keyboard()
 
 SGL\initialized = #True 
 
 ProcedureReturn 1
 
 exit:
 
 ProcedureReturn 0
EndProcedure

Procedure Shutdown()
;> Terminates the library, destroying any window still open and releasing resources.
 glfwLoad::Shutdown()
 
 DestroyTimer(SGL\TrackFps\timerFps)
 DestroyTimer(SGL\TrackFps\timerFullFrame)  
 
 DestroyTimer(SGL\TrackFrameTime\timerFrame) 
 DestroyTimer(SGL\TrackFrameTime\timerFrameAccum) 
 
 init_sgl_obj()
EndProcedure

Procedure.s GetGlfwVersion()
;> Returns a string representing the version of the GLFW backend.
 ProcedureReturn "GLFW " + PeekS(glfwGetVersionString(), -1, #PB_Ascii) 
EndProcedure

Procedure.s GetSglVersion()
;> Returns a string representing the SGL version.
 Protected s$
 
 s$ = "SGL " + Str(#SGL_MAJOR) + "." + Str(#SGL_MINOR) + "." + Str(#SGL_REVISION)
 
 CompilerIf (#PB_Compiler_Processor = #PB_Processor_x86)
 s$ + " x86"
 CompilerElse   
 s$ + " x64"
 CompilerEndIf 
 
 CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
  s$ + " Windows" 
 CompilerEndIf
 
 CompilerIf (#PB_Compiler_OS = #PB_OS_Linux)
  s$ + " Linux" 
 CompilerEndIf
 
 CompilerIf (sgl_config::#LINK_DYNAMIC = 1)
 s$ + " Dynamic"  
 CompilerElse
 s$ + " Static"
 CompilerEndIf
 
 CompilerIf (#PB_Compiler_Backend = #PB_Backend_Asm)
 s$ + " ASM"  
 CompilerElse
 s$ + " gcc"
 CompilerEndIf

 CompilerIf (#PB_Compiler_Optimizer)
 s$ + " (Optimize ON)"  
 CompilerEndIf
 
 s$ + " (PB " + Str(#PB_Compiler_Version / 100) + "." + str::PadLeft(Str(#PB_Compiler_Version % 100),2,"0") + ")"
  
 ProcedureReturn s$
EndProcedure

Procedure RegisterErrorCallBack (*fp)
;> Registers a callback to get runtime error messages from the library.
; Can and should be called before Init().   
; *fp = 0 is equivalent to unregistering the callback
 SGL\fpCallBack_Error = *fp
EndProcedure

;- [ EVENTS ]

Procedure PollEvents()
;> Processes the events that are in the queue and then returns immediately.
 SGL\Keyboard\LastChar = 0
 SGL\Keyboard\lastKey = #Key_Unknown 
 SGL\Mouse\scrollOffsetX = 0.0
 SGL\Mouse\scrollOffsetY = 0.0
 glfwPollEvents()
EndProcedure

Procedure WaitEvents()
;> Wait for an event pausing the thread.
 glfwWaitEvents()
EndProcedure

Procedure WaitEventsTimeout (timeout.d)
;> Like WaitEvents() but it will return after a timeout if there is no event.
; timeout is expressed in seconds.
 glfwWaitEventsTimeout (timeout)
EndProcedure

;- [ TIMERS ]

Procedure.d GetTimerResolution()
;> Returns the timer resolution in seconds.
; Example: 0.0000001
 ProcedureReturn 1.0 / glfwGetTimerFrequency() 
EndProcedure

Procedure.s GetTimerResolutionString()
;> Returns the timer resolution as a string, expressed in milliseconds, microseconds or nanoseconds.
; Example: "100 ns"

 Protected  resol.d = GetTimerResolution() 
 
 resol = resol * 1000

 If resol >= 1.0
    ProcedureReturn StrD(resol) + " ms"
 EndIf

 resol = resol * 1000
 
 If resol >= 1.0
    ProcedureReturn StrD(resol) + " " + Chr($03BC) + "s"
 EndIf

 resol = resol * 1000
 
 ProcedureReturn StrD(resol) + " ns"
EndProcedure

Procedure.d GetTime()
;> Returns the current SGL time in seconds (the time elapsed since SGL was initialized).
; This is the simplest way to keep track of time, you can use the SGL timers instead to simplify the most common tasks.
 ProcedureReturn glfwGetTime() 
EndProcedure

Procedure.i CreateTimer()
;> Returns a new initialiazed timer.
; The handle of the timer if successful else 0.
 
 Protected *t.TIMER = AllocateStructure(TIMER)
 
 If *t 
    *t\creationTime = glfwGetTime()
    *t\startTime = *t\creationTime    
    *t\startTime_Delta = *t\creationTime
 EndIf
 
 ProcedureReturn *t
EndProcedure

Procedure DestroyTimer (timer) 
;> Destroys the timer.
 Protected *t.TIMER = timer
 If *t
    FreeStructure(*t)
 EndIf
EndProcedure

Procedure.d GetDeltaTime (timer) 
;> Returns the time elapsed from the last call to GetDeltaTime(), or from the timer's last reset, or from the timer's creation.

; If you call GetDeltaTime() multiple times you get the time elapsed between each call.
; If you reset the timer with ResetTimer() a subsequent call of GetDeltaTime() returns the time elapsed from the reset.
; If you have just created the timer a subsequent call of GetDeltaTime() returns the time elapsed from its creation.

 Protected TimeNow.d, TimeDelta.d
 Protected *t.TIMER = timer 
 ASSERT(timer)
 
 TimeNow = glfwGetTime()
 
 TimeDelta = TimeNow - *t\startTime_Delta
 
 *t\startTime_Delta = TimeNow
 
 ProcedureReturn TimeDelta
EndProcedure

Procedure.d GetElapsedTime (timer) 
;> Returns the time elapsed from the creation of the timer or from its last reset.

 Protected *t.TIMER = timer
 ASSERT(timer)
 
 ProcedureReturn glfwGetTime() - *t\startTime
EndProcedure

Procedure.d GetElapsedTimeAbsolute (timer)
;> Returns the time elapsed from the creation of the timer, irrespective of any reset in between.

 Protected *t.TIMER = timer
 ASSERT(timer)
  
 ProcedureReturn glfwGetTime() - *t\creationTime
EndProcedure

Procedure ResetTimer (timer) 
;> Resets the timer internal counters.

; This will reset the internal counters for GetDeltaTime() and GetElapsedTime().
; GetElapsedTimeAbsolute() will remain unaffected.

 Protected *t.TIMER = timer
 ASSERT(timer)
 
 *t\startTime = glfwGetTime()
 *t\startTime_Delta = *t\startTime
EndProcedure

;- [ DEBUG ]

Procedure.i EnableDebugOutput (level = #DEBUG_OUPUT_MEDIUM)
;> Enables the modern OpenGL debug output using the same callback specified to RegisterErrorCallBack().

; To be called only if you have a debug context available, check with IsDebugContext().
; level can be #DEBUG_OUPUT_NOTIFICATIONS, #DEBUG_OUPUT_LOW, #DEBUG_OUPUT_MEDIUM, #DEBUG_OUPUT_HIGH.
; All the levels >= the specified level will be routed to the callback.

 If GetContextVersionToken() < 430 ; debug output is core in 4.30  
    If ARB_debug_output() = 0 ; try to load the extension
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "ARB_debug_output extension not available.")
        ProcedureReturn 0
    EndIf        
 EndIf   
 
 ; core or extension now we have it ...
 
 glEnable_(#GL_DEBUG_OUTPUT)
 glEnable_(#GL_DEBUG_OUTPUT_SYNCHRONOUS)
 glDebugMessageCallback_(@callback_error_opengl(), 0)
 
 Select level
    Case #DEBUG_OUPUT_NOTIFICATIONS
        SGL\debugOutputLevel = level
    Case #DEBUG_OUPUT_LOW
        SGL\debugOutputLevel = level
    Case #DEBUG_OUPUT_MEDIUM
        SGL\debugOutputLevel = level
    Case #DEBUG_OUPUT_HIGH
        SGL\debugOutputLevel = level
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "EnableDebugOutput() level is invalid.")
        ProcedureReturn 0
 EndSelect
 
 ProcedureReturn 1
EndProcedure

Procedure ClearGlErrors()
;> Clears any pending OpenGL error status for glGetError().

 Protected glerr
 Protected safe_bailout = 255
 
 Repeat
    glerr = glGetError_()
    safe_bailout - 1
 Until (glerr = #GL_NO_ERROR) Or (safe_bailout = 0)
 
 If glerr <> #GL_NO_ERROR
    CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glGetError() inside an infinite loop, no current context ?")
 EndIf    
EndProcedure

Procedure CheckGlErrors()
;> Checks for any pending OpenGL error, and routes it to the same callback specified to RegisterErrorCallBack().

 Protected glerr, err$
 Protected safe_bailout = 255
 
 Repeat
    glerr = glGetError_()
    
    Select glerr
        Case #GL_NO_ERROR
            ; NOP
        Case #GL_INVALID_ENUM
            err$ = "#GL_INVALID_ENUM"
        Case #GL_INVALID_VALUE
            err$ = "#GL_INVALID_VALUE"
        Case #GL_INVALID_OPERATION
            err$ = "#GL_INVALID_OPERATION"
        Case #GL_STACK_OVERFLOW
            err$ = "#GL_STACK_OVERFLOW"
        Case #GL_STACK_UNDERFLOW
            err$ = "#GL_STACK_UNDERFLOW"
        Case #GL_OUT_OF_MEMORY
            err$ = "#GL_OUT_OF_MEMORY"
        Case #GL_INVALID_FRAMEBUFFER_OPERATION
            err$ = "#GL_INVALID_FRAMEBUFFER_OPERATION"
        Default
            err$ = "UNKNOWN ERROR"        
    EndSelect
    
    If err$ <> #Empty$
        CALLBACK_ERROR (#SOURCE_ERROR_OPENGL$, err$)
    EndIf    
    
    safe_bailout - 1
    
 Until (glerr = #GL_NO_ERROR) Or (safe_bailout = 0)
 
 If glerr <> #GL_NO_ERROR
    CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glGetError() inside an infinite loop, no current context ?")
 EndIf    
EndProcedure

;- [ CONTEXT ] 

Procedure MakeContextCurrent (win)
;> Makes the context associated to the specified window current.
 glfwMakeContextCurrent (win)
EndProcedure

Procedure.i GetCurrentContext()
;> Returns the window associated to the current context.
 ProcedureReturn glfwGetCurrentContext()
EndProcedure 

Procedure.s GetRenderer()
;> Returns the description of the OpenGL renderer.
; A string identifying the OpenGL renderer (for example: "AMD Radeon RX 6700 XT 4.6.0 Compatibility Profile Context 23.3.1.230305").
 ProcedureReturn str::TrimEx( PeekS(glGetString_(#GL_RENDERER),-1,#PB_Ascii) + " " + PeekS(glGetString_(#GL_VERSION),-1,#PB_Ascii))
EndProcedure

Procedure.s GetVendor()
;> Returns the name of the OpenGL vendor.
; A string identifying the OpenGL vendor (for example: "NVIDIA Corporation").
 ProcedureReturn str::TrimEx(PeekS(glGetString_(#GL_VENDOR),-1,#PB_Ascii))
EndProcedure

Procedure.s GetShadingLanguage()
;> Returns the description of the OpenGL shading language.
; A string identifying the supported shading language version (for example: "4.20").
 ProcedureReturn str::TrimEx( PeekS(glGetString_(#GL_SHADING_LANGUAGE_VERSION),-1,#PB_Ascii) )
EndProcedure

Procedure GetContextVersion (*major, *minor)
;> Gets the version of the OpenGL context divided in major and minor.
 Protected maj, min, ret
 Protected ver$, *buf
 
 ClearGlErrors()
 
 glGetIntegerv_(#GL_MAJOR_VERSION, @maj) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf
 glGetIntegerv_(#GL_MINOR_VERSION, @min) : If glGetError_() <> #GL_NO_ERROR : Goto fallback : EndIf

 PokeI(*major, maj)
 PokeI(*minor, min)
 
 ProcedureReturn 
  
 fallback:
 
 *buf = glGetString_(#GL_VERSION)
 
 If *buf 
    ver$ = PeekS(glGetString_(#GL_VERSION), -1, #PB_Ascii)
 
     If glGetError_() = #GL_NO_ERROR
        maj = Val(StringField(ver$, 1, "."))
        min = Val(StringField(ver$, 2, "."))
     
        PokeI(*major, maj)
        PokeI(*minor, min) 
     EndIf
     
     ProcedureReturn 
 EndIf
 
 CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "GetContextVersion() failed, no current context ?")
EndProcedure

Procedure.i GetContextVersionToken()
;> Returns the version of the OpenGL context as a token (a single integer).
; A integer number, for example: 410 for OpenGL 4.1, 210 for OpenGL 2.1, etc.
 Protected maj, min
 GetContextVersion (@maj, @min)   
 ProcedureReturn maj * 100 + min * 10
EndProcedure

Procedure.i GetContextProfile()
;> Returns #PROFILE_COMPATIBLE or #PROFILE_CORE as the profile type for a context >= 3.2, else 0.

; https://community.khronos.org/t/nvidia-drivers-not-returning-the-right-profile-mas/61370

 Protected mask
 
 ClearGlErrors()
 
 If sgl::GetContextVersionToken() >= 320
  
     glGetIntegerv_(#GL_CONTEXT_PROFILE_MASK, @mask) 
     
     If glGetError_() <> #GL_NO_ERROR
        ProcedureReturn 0
     EndIf
     
     If (mask & #GL_CONTEXT_CORE_PROFILE_BIT)
        ProcedureReturn #PROFILE_CORE
     EndIf
     
          
     ProcedureReturn #PROFILE_COMPATIBLE
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i IsDebugContext()
;> Returns 1 if the current context is supporting the debug features of OpenGL 4.3, else 0.
; The debug context can be enabled only is the context is >= 4.3, or if the debug features are presents through an extension (ARB_debug_output).

 Protected mask

 ClearGlErrors()
 
 glGetIntegerv_(#GL_CONTEXT_FLAGS, @mask)

 If glGetError_() <> #GL_NO_ERROR    
    ProcedureReturn 0
 EndIf
 
 If (mask & #GL_CONTEXT_FLAG_DEBUG_BIT)
    ProcedureReturn 1
 EndIf   
 
 ProcedureReturn 0
EndProcedure

Procedure.i GetProcAddress (func$)
;> Returns the address of the specified OpenGL function or extension if supported by the current context.
 ProcedureReturn glfwGetProcAddress(func$)
EndProcedure

;- [ EXTENSIONS ]

Procedure.i LoadExtensionsStrings()
;> Load a list of the available extensions strings and cache them internally.
; See GetExtensionString() to see how to query the stored list.

 Protected i, count, token
 Protected buffer$, extName$, extCount, extSource
 Protected *fpGetExtensionsString, *ptr
 Protected NewMap UniqueExt()
 
 token = GetContextVersionToken()
 
 count = 0
 
 If token >= 300 ; modern way
    glGetIntegerv_(#GL_NUM_EXTENSIONS, @count)
    For i = 0 To count - 1 
        extName$ = PeekS(glGetStringi_(#GL_EXTENSIONS, i), -1, #PB_Ascii)
        UniqueExt(extName$) = 1 
    Next
 EndIf
 
 ; legacy way, we can do this even in modern OpenGL
 For extSource = 1 To 3 ; three different ways 
    buffer$ = ""
    
    Select extSource
        Case 1 ; usual way
            *ptr = glGetString_(#GL_EXTENSIONS)
            If *ptr
                buffer$ = PeekS(*ptr,-1,#PB_Ascii)
            EndIf
        Case 2 
            CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
                ; some of them are only available through a "wiggle" 
                *fpGetExtensionsString = glfwGetProcAddress("wglGetExtensionsStringARB")
                If *fpGetExtensionsString
                    buffer$ = PeekS(CallFunctionFast(*fpGetExtensionsString, wglGetCurrentDC_()), -1, #PB_Ascii)
                EndIf
            CompilerEndIf
        Case 3 ; possible alias of the "wiggle" above, just to be sure
            CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
                *fpGetExtensionsString = glfwGetProcAddress("wglGetExtensionsStringEXT")            
                If *fpGetExtensionsString
                    buffer$ = PeekS(CallFunctionFast(*fpGetExtensionsString), -1, #PB_Ascii)
                EndIf
            CompilerEndIf                        
    EndSelect 
    
    If Len(buffer$) ; split the buffer contents
        buffer$ = str::TrimEx(buffer$) ; to remove internal multiple spaces (BUG in some drivers as Virtualbox Chromium)
        extCount = CountString(buffer$, " ")
        For i = 1 To extCount
            extName$ = StringField(buffer$, i, " ")                
            UniqueExt(extName$) = 1 
        Next
    EndIf 
  Next
 
 count = MapSize(UniqueExt()) ; now we have [count] unique extensions
           
 Dim SGL\ExtensionsStrings$(count - 1)
 
 ASSERT(ArraySize(SGL\ExtensionsStrings$()) <> -1)
 
 count = 0
 
 ResetMap(UniqueExt())
 
 ; let's copy them
 While NextMapElement(UniqueExt())    
    SGL\ExtensionsStrings$(count) = MapKey(UniqueExt())
    count + 1
 Wend
 
 ; and sort them
 SortArray(SGL\ExtensionsStrings$(), #PB_Sort_Ascending)
 
 ProcedureReturn count
EndProcedure

Procedure.i CountExtensionsStrings()
;> Counts the number of OpenGL extensions strings available.
; The list of strings is loaded with LoadExtensionsStrings() and then cached.

 ProcedureReturn ArraySize(SGL\ExtensionsStrings$()) 
EndProcedure

Procedure.s GetExtensionString (index)
;> Returns the n-item in the collection of extensions strings.

; The list of strings is loaded with LoadExtensionsStrings() and then cached.
; index must be in the range 0 ... CountExtensionsStrings() - 1.
; The extensions are sorted in alphabetical order.
 
; Example: 
; Debug GetExtensionString (21) ; "GL_ARB_multitexture"

 ProcedureReturn (SGL\ExtensionsStrings$(index))
EndProcedure

Procedure.i IsExtensionAvailable (extension$)
;> Checks if the specified extension string is defined.

; extension$: the name of the extension string to look for (ie: "GL_ARB_multitexture").
; Returns 1 if available, else 0.

; The list of strings is loaded with LoadExtensionsStrings() and then cached.
; Please note extension$ is the extension string representing the actual extension, so you must use "GL_ARB_multitexture" 
; to check if the extension ARB_multitexture is supported.

 If binary_lookup_string(SGL\ExtensionsStrings$(), extension$) <> -1
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

;- [ MOUSE ] 

Procedure.i IsRawMouseSupported()
;> Returns 1 if the raw mouse motion is supported on the system.
; Raw mouse motion is closer to the actual motion of the mouse across a surface. 
; It is not affected by the scaling and acceleration applied to the motion of the desktop cursor. 
; Raw motion is better for controlling for a 3D camera, and is only provided when the cursor has been disabled (see SetCursorMode()).
 ProcedureReturn glfwRawMouseMotionSupported()
EndProcedure

Procedure EnableRawMouse (win, flag) 
;> Enables or disable the raw mouse motion mode.
; See IsRawMouseSupported()
 glfwSetInputMode(win, #GLFW_RAW_MOUSE_MOTION, flag)
EndProcedure

Procedure SetCursorMode (win, mode)
;> Sets the mouse cursor as normal, hidden, or disabled for the specified window.
 
; #CURSOR_NORMAL makes the cursor visible and behaving normally.
; #CURSOR_HIDDEN makes the cursor invisible when it is over the client area of the window but does not restrict the cursor from leaving.
; #CURSOR_DISABLED hides and grabs the cursor, providing virtual and unlimited cursor movement. 

 Select mode
    Case #CURSOR_NORMAL
        ; NOP
    Case #CURSOR_HIDDEN
        ; NOP
    Case #CURSOR_DISABLED
        ; NOP
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "SetCursorMode() specified mode is invalid.")
 EndSelect
 
 glfwSetInputMode(win, #GLFW_CURSOR, mode)
EndProcedure

Procedure GetMouseScroll (*xOffset.Double, *yOffset.Double)
;> Gets the scroll offset for the x and y axis generated by a mouse wheel or a trackpad.
; The values can be zero if no movement has been registered.
 *xOffset\d = SGL\Mouse\scrollOffsetX
 *yOffset\d = SGL\Mouse\scrollOffsetY
EndProcedure

Procedure.i GetCursorPos (win, *x.Double, *y.Double)
;> Get the position of the cursor in screen coordinates relative to the upper-left corner of the client area of the specified window. 
; If the cursor is disabled then the cursor position is unbounded.
 glfwGetCursorPos(win, *x, *y)
EndProcedure

Procedure SetCursorPos (win, x.d, y.d)
;> Set the position of the cursor in screen coordinates relative to the upper-left corner of the client area of the specified window. 
; The window must have input focus else the function fails silently.
 glfwSetCursorPos(win, x, y)
EndProcedure

Procedure.s GetMouseButtonString (button)
;> Returns the descriptive string for the specified SGL mouse button.
 Protected desc$
 
 Select button
    Case #MOUSE_BUTTON_LEFT
        desc$ = "#MOUSE_BUTTON_LEFT"
    Case #MOUSE_BUTTON_RIGHT
        desc$ = "#MOUSE_BUTTON_RIGHT"
    Case #MOUSE_BUTTON_MIDDLE
        desc$ = "#MOUSE_BUTTON_MIDDLE"
    Case #MOUSE_BUTTON_4 To #MOUSE_BUTTON_8
        desc$ = "#MOUSE_BUTTON_" + Str(button - #MOUSE_BUTTON_4 + 4)
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "GetMouseButtonString() specified button is invalid.")
 EndSelect
 
 ProcedureReturn desc$
EndProcedure

Procedure.i GetMouseButton (win, button)
;> Returns the last state reported for the specified mouse button on the specified window (#PRESSED or #RELEASED).
; If the sticky mouse buttons input mode is enabled, this function returns #PRESSED even if the mouse button had been released before the call.
 Protected status = glfwGetMouseButton(win, button)
 
 Select status
    Case #GLFW_PRESS
        status = #PRESSED
    Case #GLFW_RELEASE
        status = #RELEASED
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwGetMouseButton() returned status is invalid.")        
 EndSelect
 
 ProcedureReturn status 
EndProcedure

Procedure SetStickyMouseButtons (win, flag)
;> Sets or disable the sticky mouse buttons input mode for the specific window.
; If this is enabled, a mouse button press will ensure that GetMouseButton() returns #PRESSED even if the mouse button has been released before the call.
; This is useful when you are only interested in whether mouse buttons have been pressed or not.
 flag = math::Clamp(flag, 0 , 1)
 glfwSetInputMode(win, #GLFW_STICKY_MOUSE_BUTTONS, flag)
EndProcedure

;- [ KEYBOARD ]

Procedure.i GetLastKey()
;> Returns the SGL key code of the last key which has been #PRESSED and still is, else 0.
; Useful for remapping keys for a game, as an immediate mode alternative to the callback CallBack_Key()
 ProcedureReturn SGL\Keyboard\lastKey
EndProcedure

Procedure.i GetLastChar()
;> Returns the unicode code of the last printable char generated, else 0.
; Useful for text input, as an immediate mode alternative to the callback CallBack_Char()

 ProcedureReturn SGL\Keyboard\lastChar
EndProcedure

Procedure.i GetKey (key)
;> Returns the last state reported for the specified SGL key (#PRESSED or #RELEASED).
; This may be used to check if a key is being kept down, for example to control the engine thrust of a spaceship.
; The action #REPEATED is only reported through the callback CallBack_Key().

 ProcedureReturn  SGL\Keyboard\Keys(key)\keyStatus
EndProcedure

Procedure.i GetKeyPress (key)
;> Returns 1 once if the specified key has been pressed, and then 0 until the key has been released and pressed again.
; This may be used to switch a status between on/off in your program.

 Protected pressed, status
 
 status = GetKey (key)
 
 Select status
    Case #PRESSED
        If SGL\Keyboard\Keys(key)\keyPressed = 1
            pressed = 0
        Else
            SGL\Keyboard\Keys(key)\keyPressed = 1
            pressed = 1
        EndIf
    Case #RELEASED
        pressed = 0
 EndSelect
 
 ProcedureReturn pressed
EndProcedure

Procedure.s GetKeyString (key)
;> Returns the descriptive string for the specified SGL key according to the USA layout.
; See also GetKeyStringLocal()

; Example:
; "Ins" for #Key_INSERT
; "F1"  for #Key_F1
; "["   for #Key_LEFT_BRACKET 
; "`"   for #Key_ACCENT 

 ProcedureReturn SGL\Keyboard\Text$(key)
EndProcedure

Procedure.s GetKeyStringLocal (key)
;> Returns the descriptive string for the specified SGL key according to the locale layout.
; See also GetKeyString()

; Example for ITA layout:
; "Ins" for #Key_INSERT
; "F1"  for #Key_F1
; "è"   for #Key_LEFT_BRACKET 
; "\"   for #Key_ACCENT 
 
 Protected key$, *str
 
 Select key 
    Case #Key_KP_0 To #Key_KP_9
        key$ = GetKeyString (key)
    Case #Key_KP_ADD, #Key_KP_DECIMAL, #Key_KP_DIVIDE, #Key_KP_ENTER, #Key_KP_EQUAL, #Key_KP_MULTIPLY, #Key_KP_NUMLOCK, #Key_KP_SUBTRACT
        key$ = GetKeyString (key)   
    Default
        *str = glfwGetKeyName(map_key_to_glfw(key), 0)
        If *str
            key$ = PeekS(*str, -1, #PB_UTF8)
        Else 
            key$ = GetKeyString (key)   
        EndIf 
 EndSelect
  
 ProcedureReturn key$
 
EndProcedure

;- [ WINDOWS ]

Procedure.i CreateWindow (w, h, title$, mon = #Null, share = #Null)
;> Creates a window and its OpenGL context, optionally in full screen mode.
; You can specify most of the attributes of the window to be created using specific hints. See SetWindowHint().
; If a monitor is specified the window will be fullscreen, else windowed.
; share is the handle of a previously create window, and if specified, the new window will share the resource with it.
 
 Protected win
 
 apply_window_hints()
 
 win = glfwCreateWindow(w, h, title$, mon, share)
 
 If win
    SetWindowDefaultIcon (win)
    glfwSetKeyCallback(win, @callback_window_key())
    glfwSetCharCallback(win, @callback_window_char())
    glfwSetScrollCallback(win, @callback_window_scroll())
 EndIf 
 
 ProcedureReturn win
EndProcedure

Procedure.i CreateWindowXY (x, y, w, h, title$, share = #Null)
;> Creates a windowed window and its OpenGL context at the coordinates x,y.
; You can specify most of the attributes of the window to be created using specific hints. See SetWindowHint().
; share is the handle of a previously create window, and if specified, the new window will share the resource with it.
; To create a full screen window see CreateWindow()
 
 Protected win
 
 apply_window_hints()
 
 glfwWindowHint(#GLFW_VISIBLE, 0)
 
 win = glfwCreateWindow(w, h, title$, #Null, share)
 
 If win
    SetWindowDefaultIcon (win)
    glfwSetKeyCallback(win, @callback_window_key())
    glfwSetCharCallback(win, @callback_window_char())    
    SetWindowPos(win, x, y)
    ShowWindow(win, SGL\hintWinVisible)
 EndIf 
 
 ; restores the user specified setting
 glfwWindowHint(#GLFW_VISIBLE, SGL\hintWinVisible)
 
 ProcedureReturn win
EndProcedure

Procedure DestroyWindow (win)
;> Close and destroys the specied window.
; This funtion does not trigger CallBack_WindowClose()
 glfwDestroyWindow(win)
EndProcedure

Procedure.i RegisterWindowCallBack (win, type, *fp)
;> Registers the specified callback event for the specified window.
; Returns the address of the previously installed callback, if any, else returns 0.
 
 ASSERT (*fp)
 
 Protected *prevCallBack
 
 Select type
    Case #CALLBACK_WINDOW_CLOSE
        *prevCallBack = SGL\fpCallBack_WindowClose        
        SGL\fpCallBack_WindowClose = *fp
        glfwSetWindowCloseCallback(win, @callback_window_close())
    Case #CALLBACK_WINDOW_POS
        *prevCallBack = SGL\fpCallBack_WindowPos
        SGL\fpCallBack_WindowPos = *fp
        glfwSetWindowPosCallback(win, @callback_window_pos())
    Case #CALLBACK_WINDOW_SIZE
        *prevCallBack = SGL\fpCallBack_WindowSize
        SGL\fpCallBack_WindowSize = *fp
        glfwSetWindowSizeCallback(win, @callback_window_size())
    Case #CALLBACK_WINDOW_FOCUS
        *prevCallBack = SGL\fpCallBack_WindowFocus
        SGL\fpCallBack_WindowFocus = *fp
        glfwSetWindowFocusCallback(win, @callback_window_focus())
    Case #CALLBACK_WINDOW_MINIMIZE
        *prevCallBack = SGL\fpCallBack_WindowMinimize
        SGL\fpCallBack_WindowMinimize = *fp
        glfwSetWindowIconifyCallback(win, @callback_window_minimize())        
    Case #CALLBACK_WINDOW_MAXIMIZE
        *prevCallBack = SGL\fpCallBack_WindowMaximize
        SGL\fpCallBack_WindowMaximize = *fp        
        glfwSetWindowMaximizeCallback(win, @callback_window_maximize())
    Case #CALLBACK_WINDOW_FRAMEBUFFER_SIZE
        *prevCallBack = SGL\fpCallBack_WindowFrameBufferSize
        SGL\fpCallBack_WindowFrameBufferSize = *fp
        glfwSetFramebufferSizeCallback(win, @callback_window_frambuffer_size())
    Case #CALLBACK_WINDOW_REFRESH
        *prevCallBack = SGL\fpCallBack_WindowRefresh
        SGL\fpCallBack_WindowRefresh = *fp
        glfwSetWindowRefreshCallback(win, @callback_window_refresh())
    Case #CALLBACK_WINDOW_SCROLL
        *prevCallBack = SGL\fpCallBack_WindowScroll
        SGL\fpCallBack_WindowScroll = *fp
        ; the internal callback is always activated on window creation 
        glfwSetScrollCallback(win, @callback_window_scroll())
    Case #CALLBACK_KEY
        *prevCallBack = SGL\fpCallBack_Key
        SGL\fpCallBack_Key = *fp
        ; the internal callback is always activated on window creation 
        glfwSetKeyCallback(win, @callback_window_key())
    Case #CALLBACK_CHAR
        *prevCallBack = SGL\fpCallBack_Char
        SGL\fpCallBack_Char = *fp
        ; the internal callback is always activated on window creation 
        glfwSetCharCallback(win, @callback_window_char())
    Case #CALLBACK_CURSOR_POS
        *prevCallBack = SGL\fpCallBack_CursorPos
        SGL\fpCallBack_CursorPos = *fp
        glfwSetCursorPosCallback(win, @callback_window_cursor_position())
    Case #CALLBACK_CURSOR_ENTERING
        *prevCallBack = SGL\fpCallBack_CursorEntering
        SGL\fpCallBack_CursorEntering = *fp
        glfwSetCursorEnterCallback(win, @callback_window_cursor_entering())
    Case #CALLBACK_MOUSE_BUTTON
        *prevCallBack = SGL\fpCallBack_MouseButton
        SGL\fpCallBack_MouseButton = *fp
        glfwSetMouseButtonCallback(win, @callback_window_mouse_button())
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "Window CallBack type is invalid.")
 EndSelect
 
 ProcedureReturn *prevCallBack
 
EndProcedure

Procedure ResetWindowHints()
;> Resets all the window hints to their default values.
 glfwDefaultWindowHints()
 init_window_hints()
EndProcedure

Procedure ShowWindow (win, flag)
;> Makes the specified window visible or hidden based on the flag.
; If the window is already visible / hidden or is in full screen mode, this function does nothing.
 If flag    
    glfwShowWindow(win)
 Else
    glfwHideWindow(win)
 EndIf
EndProcedure

Procedure SetWindowHint (type, value) 
;> Set various hinting attributes which influence the creation of a window.

 Select type
    Case #HINT_WIN_OPENGL_DEBUG
        SGL\hintWinOpenglDebug = value
    Case #HINT_WIN_OPENGL_MAJOR
        SGL\hintWinOpenglMajor = value
    Case #HINT_WIN_OPENGL_MINOR
        SGL\hintWinOpenglMinor = value
    Case #HINT_WIN_OPENGL_DEPTH_BUFFER
        SGL\hintWinOpenglDepthBuffer = value
    Case #HINT_WIN_OPENGL_STENCIL_BITS
        SGL\hintWinOpenglStencilBits = value
    Case #HINT_WIN_OPENGL_ACCUMULATOR_BITS
        SGL\hintWinOpenglAccumulatorBits = value
    Case #HINT_WIN_OPENGL_SAMPLES
        SGL\hintWinOpenglSamples = value
    Case #HINT_WIN_OPENGL_PROFILE 
        SGL\hintWinOpenglProfile = value  
    Case #HINT_WIN_OPENGL_FORWARD_COMPATIBLE
        SGL\hintWinOpenglForwardCompatibile = value  
    Case #HINT_WIN_VISIBLE
        SGL\hintWinVisible = value
    Case #HINT_WIN_RESIZABLE
        SGL\hintWinResizable = value
    Case #HINT_WIN_MAXIMIZED
        SGL\hintWinMaximized = value
    Case #HINT_WIN_DECORATED
        SGL\hintWinDecorated = value
    Case #HINT_WIN_TOPMOST
        SGL\hintWinTopMost = value
    Case #HINT_WIN_FOCUSED
        SGL\hintWinFocused = value
    Case #HINT_WIN_CENTERED_CURSOR
        SGL\hintWinCenteredCursor = value
    Case #HINT_WIN_AUTO_MINIMIZE
        SGL\hintWinAutoMinimize = value
    Case #HINT_WIN_FRAMEBUFFER_DEPTH
        SGL\hintWinFrameBufferDepth = value
    Case #HINT_WIN_FRAMEBUFFER_TRANSPARENT
        SGL\hintWinFrameBufferTransparent = value
    Case #HINT_WIN_REFRESH_RATE
        SGL\hintWinRefreshRate = value           
    Default
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "SetWindowHint() hint type is invalid.")        
 EndSelect
EndProcedure

Procedure SetWindowAutoMinimize (win, flag)
;> Set the specified window auto-minimize setting based on the flag.
 glfwSetWindowAttrib (win, #GLFW_AUTO_ICONIFY, flag)
EndProcedure

Procedure SetWindowText (win, text$)
 ;> Sets the window title.
 glfwSetWindowTitle (win, text$)
EndProcedure

Procedure SetWindowDefaultIcon (win)
;> Sets the window icon back to its default.

 Protected size = 16
 Protected *buffer = AllocateMemory(size * size * 4) 
 Protected icon.IconData
 Protected x, y, offset, s$, c$
 Protected background = RGBA(255,255,255,255)
 Dim color.l(0)
 
 color(0) = RGBA(0,0,255,255) ; just one color in this case
  
 ; space means the background color
 ; 0-9 means one of the colors from the array color()
  
 DataSection 
  icon_mask:  
  Data.s "                "
  Data.s "     000000     "  
  Data.s "    0           "
  Data.s "    0           "
  Data.s "     00000      "
  Data.s "          0     "
  Data.s "          0     "
  Data.s "    000000      "
  Data.s "                "
  Data.s "  00000   0     "
  Data.s " 0        0     "
  Data.s " 0        0     "
  Data.s " 0  000   0     "
  Data.s " 0    0   0     "  
  Data.s "  0000    00000 "
  Data.s "                "
 EndDataSection
 
 Restore icon_mask
 
 For y = 0 To size - 1
    Read.s s$
    For x = 0 To size - 1
        c$ = Mid(s$, x + 1, 1)
        If c$ = " "
            PokeL(*buffer + offset, background) 
        Else
            PokeL(*buffer + offset, color(Asc(c$)-'0')) ; gets the color from the array
        EndIf        
        offset + 4 ; it's an array of 4 bytes integers
    Next    
 Next
 
 icon\width = size
 icon\height = size
 icon\pixels = *buffer
 
 SetWindowIcon (win, 1, @icon)
EndProcedure

Procedure SetWindowIcon (win, count, *images.IconData)
 ;> Sets the icon of the specified window. 
 ; If passed an array of candidate images, the one closest to the sizes desired by the system is selected. 
 ; For an example on how prepare the data see the implementation of SetDefaultIcon().
 
 If count And *images
    glfwSetWindowIcon (win, count, *images)
 EndIf
EndProcedure

Procedure SetWindowDecoration (win, flag)
;> Set the specified window decoration status based on the flag.
 glfwSetWindowAttrib (win, #GLFW_DECORATED, flag)
EndProcedure

Procedure SetWindowTopMost (win, flag)
;> Set the specified window topmost status based on the flag.
 glfwSetWindowAttrib (win, #GLFW_FLOATING, flag)
EndProcedure

Procedure SetWindowResizable (win, flag)
;> Set the specified window resizeable status based on the flag.
 glfwSetWindowAttrib (win, #GLFW_RESIZABLE, flag)
EndProcedure

Procedure SetWindowPos (win, x, y)
;> Set the specified window position in screen coordinates.
 glfwSetWindowPos(win, x, y)
EndProcedure

Procedure GetWindowPos (win, *x, *y)
;> get the specified window position in screen coordinates.
 glfwGetWindowPos(win, *x, *y)
EndProcedure

Procedure SetWindowFocus (win)
;> Brings the specified window to front and set the input focus to it. 
; The window should already be visible and not minimized.
 glfwFocusWindow(win)
EndProcedure

Procedure SetWindowSize (win, widht, height)
;> Set the specified window size in screen coordinates or changes the full screen resolution.
; For a full screen windows, this function suggests the desired new dimensions and switches to the video mode closest to them.
 glfwSetWindowSize(win, widht, height)
EndProcedure

Procedure SetWindowSizeLimits (win, min_widht, min_height, max_widht, max_height)
;> Set the specified window size limits to control how far the user can resize a window.
; To specify only a minimum size or only a maximum one, set the other pair to 4.
; To disable size limits for a window, set them all to #DONT_CARE.
 glfwSetWindowSizeLimits(win, min_widht, min_height, max_widht, max_height)
EndProcedure

Procedure SetWindowAspectRatio (win, width_numerator, height_denominator)
;> Forces the required aspect ratio of the clieant area of the specified window. 
; If the window is full screen, the aspect ratio only takes effect once it is made windowed. 
; If the window is not resizable, this function does nothing.
; The aspect ratio is specified as a numerator and denominator, corresponding to the width and height, respectively. 
; If you want a window to maintain its current aspect ratio, use its current size as the ratio.
; To disable the aspect ratio limit for a window, set both terms to #DONT_CARE.
  glfwSetWindowAspectRatio (win, width_numerator, height_denominator)
EndProcedure

Procedure.i WindowShouldClose (win)
;> Returns 1 if the internal flag signaling the window should close has been set, else 0.
; See SetWindowShouldClose()
 ProcedureReturn glfwWindowShouldClose (win)
EndProcedure

Procedure SetWindowShouldClose (win, flag)
;> Set the flag signaling if the window should be closed or not.
; See WindowShouldClose()
 glfwSetWindowShouldClose (win, flag)
EndProcedure

Procedure MinimizeWindow (win)
;> Minimizes the specified window.
; If the window is a full screen window, SGL restores the original video mode of the monitor. 
; The window's desired video mode is set again when the window is restored.
 glfwIconifyWindow (win)
EndProcedure

Procedure MaximizeWindow (win)
;> Maximizes the specified window.
; If the window is a full screen window, this function does nothing.
 glfwMaximizeWindow(win)
EndProcedure

Procedure RestoreWindow (win)
;> Restores the specified window.
; If the window is a minimized full screen window, its desired video mode is set again for its monitor when the window is restored.
 glfwRestoreWindow(win)
EndProcedure

Procedure GetWindowSize (win, *width, *height)
;> Get the size in screen coordinates of the content area of the specified window. 
; If you wish to retrieve the size of the framebuffer in pixels, see GetWindowFramebufferSize()
glfwSetWindowSize (win, *width, *height)
EndProcedure

Procedure GetWindowFrameBufferSize (win, *width, *height)
;> Gets the size in pixels of the framebuffer of the specified window. 
; If you wish to retrieve the size of the window in screen coordinates, see GetWindowSize()
 glfwGetFramebufferSize (win, *width, *height)
EndProcedure

Procedure.i IsWindowFocused (win)
;> Returns 1 if window has the input focus.
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_FOCUSED)
EndProcedure

Procedure.i IsWindowHovered (win)
;> Returns 1 if the mouse cursor is currently hovering directly over the content area of the window. 
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_HOVERED)
EndProcedure

Procedure.i IsWindowVisible (win)
;> Returns 1 if window is visible.
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_VISIBLE)
EndProcedure

Procedure.i IsWindowResizable (win)
;> Returns 1 if window is resizable by the user.
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_RESIZABLE)
EndProcedure

Procedure.i IsWindowMinimized (win)
;> Returns 1 if window is currently minimized.
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_ICONIFIED)
EndProcedure

Procedure.i IsWindowMaximized (win)
;> Returns 1 if window is currently maximized.
 ProcedureReturn glfwGetWindowAttrib(win, #GLFW_MAXIMIZED)
EndProcedure

Procedure SwapBuffers (win)
;> Swaps the OpenGL buffers.
 glfwSwapBuffers (win)
EndProcedure

Procedure.i GetWindowMonitor (win)
;> Returns the handle of the monitor associated with the specified full screen window.
; Returns 0 if the window is not a full screen window.
 ProcedureReturn glfwGetWindowMonitor (win)
EndProcedure

Procedure SetWindowMonitor (win, mon, x, y, width, height, freq)
;> Sets the monitor that the window uses in full screen mode or, if the monitor is #Null, switches it to windowed mode.

; When the monitor is specified uses the provided width, height and refresh rate of the desired video mode and switches to the video mode closest to it. 
; The window position is ignored.

; When the monitor is #Null, the position, width and height are used to place the window client area. 
; The refresh rate is ignored.

; If you only wish to update the resolution of a full screen window or the size of a windowed mode window, see SetWindowSize().
; When a window transitions from full screen to windowed mode, this function restores any previous window settings.

 glfwSetWindowMonitor(win, mon, x, y, width, height, freq)
EndProcedure

Procedure GetWindowContentScale (win, *x_float, *y_float)
;> Gets the content scale for the specified window.
; The two pointers point to floats.
; The content scale is the ratio between the current DPI and the platform's default DPI. 
; This is especially important for text and any UI elements. 
; If the pixel dimensions of your UI scaled by this look appropriate on your machine then it should appear at a reasonable size 
; on other machines regardless of their DPI and scaling settings. 
 glfwGetWindowContentScale(win, *x_float, *y_float)
EndProcedure

;- [ MONITORS ]

Procedure.i GetPrimaryMonitor()
;> Returns the handle of the primary monitor.
 Protected mon = glfwGetPrimaryMonitor()
 
 If mon = #Null
     CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "Primary monitor not detected.")
     ProcedureReturn 0
 EndIf
    
 ProcedureReturn mon
EndProcedure

Procedure.i GetMonitors (Array monitors(1))
;> Returns the number of monitors and an array of handles for them.

; The array is redimensioned inside the procedure.
; Returns 0 in case of failure.

 Protected *monitors, i, count
 
 *monitors = glfwGetMonitors(@count) 
 
 If *monitors And count > 0
    Dim monitors(count - 1)
    For i = 0 To count - 1
        monitors(i) = PeekI(*monitors + i * SizeOf(Integer))
    Next
    ProcedureReturn count 
 EndIf
 
 CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "Error getting the list of monitors.")
 
 ProcedureReturn 0 
EndProcedure

Procedure.s GetMonitorName (mon) 
;> Returns the specified monitor name as string.

 Protected mon$ = PeekS(glfwGetMonitorName(mon), -1, #PB_UTF8)
 
 If mon$ = #Empty$
    CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwGetMonitorName() failed.")        
 EndIf
 
 ProcedureReturn mon$
EndProcedure

Procedure.i GetVideoMode (mon, *vmode.VideoMode)
;> Gets the current dimensions, color depth and refresh frequency of the specified monitor as a VideoMode structure.

 Protected *vm.GLFW_vidmode = glfwGetVideoMode (mon)
 
 If *vm
     *vmode\width = *vm\width
     *vmode\height = *vm\height
     *vmode\depth =  *vm\redBits + *vm\greenBits + *vm\blueBits
     *vmode\freq = *vm\refreshRate
     ProcedureReturn 1
 EndIf
 
 CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwGetVideoMode() failed to retrieve the current video mode for the monitor.")
 
 ProcedureReturn 0
EndProcedure

Procedure.i GetVideoModes (mon, Array vmodes.VideoMode(1))
;> Returns the number of video modes for the specified monitor and an array of said video modes.

; The array is redimensioned inside the procedure.
; Returns 0 in case of failure.

 Protected *vmodes, *vmode.GLFW_vidmode, i, count
 
 *vmodes = glfwGetVideoModes(mon, @count) 
 
 If *vmodes And count > 0
    Dim vmodes(count - 1)
    For i = 0 To count - 1
        *vmode = *vmodes + i * SizeOf(GLFW_vidmode)
        vmodes(i)\width = *vmode\width
        vmodes(i)\height = *vmode\height
        vmodes(i)\depth = *vmode\redBits + *vmode\greenBits + *vmode\blueBits
        vmodes(i)\freq = *vmode\refreshRate
    Next
    ProcedureReturn count 
 EndIf
 
 CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "glfwGetVideoModes() failed to retrieve the list of video modes.")
 ProcedureReturn 0 
EndProcedure

Procedure GetMonitorContentScale (mon, *x_float, *y_float)
;> Gets the content scale for the specified monitor.
; The two pointers point to floats.
; The content scale is the ratio between the current DPI and the platform's default DPI. 
; This is especially important for text and any UI elements. 
; If the pixel dimensions of your UI scaled by this look appropriate on your machine then it should appear at a reasonable size 
; on other machines regardless of their DPI and scaling settings. 
 glfwGetMonitorContentScale(mon, *x_float, *y_float)
EndProcedure

;- [ SYSTEM ]

Procedure.s GetOS()
;> Returns a string describing the OS and its version.
 ProcedureReturn sys::GetOS()
EndProcedure

Procedure.s GetCpuName()
;> Returns a string describing the CPU model and brand.
 ProcedureReturn sys::GetCpuName()
EndProcedure

Procedure.i GetLogicalCpuCores ()
;> Returns the number of logical CPU cores as reported by the OS.

; An integer at least equal 1 on single core CPUs, or greater for multicore CPUs.
; The number can be greater than the number of phisical cores, for example if the CPU does support hyperthreading.

 ProcedureReturn CountCPUs(#PB_System_CPUs)
EndProcedure

Procedure.q GetTotalMemory()
;> Returns the size of the total memory available in the system in bytes. 
 ProcedureReturn sys::GetTotalMemory()
EndProcedure

Procedure.q GetFreeMemory()
;> Returns the size of the free memory available in the system in bytes.
 ProcedureReturn sys::GetFreeMemory()
EndProcedure

;- [ IMAGES ]

Procedure.i IsPowerOfTwo (value)
;> Returns 1 if the specified positive number is a POT.

 If (value <= 1) Or (value & (value - 1)) > 0
    ProcedureReturn 0
 EndIf   
 ProcedureReturn 1    
EndProcedure

Procedure.i NextPowerOfTwo (value)
;> Returns the next greater POT for the specified value.

; Max returned value is 2^49.

; Debug NextPowerOfTwo(1) ; 2
; Debug NextPowerOfTwo (5) ; 8
; Debug NextPowerOfTwo(255) ; 256
; Debug NextPowerOfTwo(257) ; 512
 
 If Value = 1 
    ProcedureReturn 2
 Else
    If IsPowerOfTwo(value)
        value + 1
    EndIf
    ProcedureReturn 1 << Int(Round(Log(Value) / Log(2), #PB_Round_Up))
 EndIf    
EndProcedure

Procedure.i CreateTexelData (img)
;> Returns a pointer to TexelData containing the image data ready to be sent to an OpenGL texture.

; The possible values for TexelData\imageFormat are:
; #GL_RGB, #GL_RGBA, #GL_BGR, #GL_BGRA

; The possible values for TexelData\internalTextureFormat are:
; #GL_RGB, #GL_RGBA, #GL_RGB, #GL_RGBA

 Protected *td.TexelData, depth, width, height, hDC
 Protected *drawbuff, row, rowLen, pitch, pixelFormat, isReversed
 
 depth = ImageDepth(img)
 width = ImageWidth(img)
 height = ImageHeight(img)
 
 *td = AllocateMemory (SizeOf(TexelData) + width * height * (depth / 8))
 
 If *td = 0 
    Goto exit: 
 EndIf
 
 *td\imageWidth = width
 *td\imageHeight= height
 *td\imageDepth= depth
 *td\length = width * height * (depth / 8)
 *td\pixels = *td + SizeOf(TexelData)

 hDC = StartDrawing(ImageOutput(img))
     
 *drawbuff = DrawingBuffer()
 
 If *drawbuff = 0     
    Goto exit: 
 EndIf
 
 pixelFormat = DrawingBufferPixelFormat()  

 If pixelFormat & #PB_PixelFormat_ReversedY
    isReversed = #True
 EndIf    

 If pixelFormat & #PB_PixelFormat_24Bits_RGB
    *td\imageFormat = #GL_RGB
    *td\internalTextureFormat = #GL_RGB
 EndIf
 
 If pixelFormat & #PB_PixelFormat_32Bits_RGB
    *td\imageFormat = #GL_RGBA
    *td\internalTextureFormat = #GL_RGBA
 EndIf

 If pixelFormat & #PB_PixelFormat_24Bits_BGR
    *td\imageFormat = #GL_BGR
    *td\internalTextureFormat = #GL_RGB
 EndIf
 
 If pixelFormat & #PB_PixelFormat_32Bits_BGR
    *td\imageFormat = #GL_BGRA
    *td\internalTextureFormat = #GL_RGBA
 EndIf
 
 pitch = DrawingBufferPitch()
 
 rowLen = *td\imageWidth * (*td\imageDepth / 8)
 
 If isReversed
     For row = 0 To *td\imageHeight - 1
        CopyMemory(*drawbuff + pitch * row, *td\pixels + rowLen * row, rowLen)        
     Next
 Else   
    For row = 0 To *td\imageHeight - 1
        CopyMemory(*drawbuff + pitch  * (*td\imageHeight - 1 - row), *td\pixels + rowLen * row, rowLen)
    Next     
 EndIf

 StopDrawing()
 
 ProcedureReturn *td
 
 exit:
 
 If hDC : StopDrawing() :EndIf
 If *td : FreeMemory(*td) : EndIf
 
 ProcedureReturn 0 
EndProcedure

Procedure DestroyTexelData (*td.TexelData)
;> Release the memory allocated by CreateTexelData() 
 FreeMemory(*td)
EndProcedure

Procedure.i CopyImageAddingAlpha (img, alpha)
;> Creates a new image from the source image passed, adding an alpha channel.

; img : A valid PB image with a color depth of 24 bits.
; alpha : The alpha to write in the alpha channel (0 ... 255)
; Returns a 32 bit PB image with the alpha channel set to alpha, or 0 in case of error.

 Protected out, w, h
 
 If ImageDepth(img) <> 24
    ProcedureReturn 0
 EndIf
 
 Math::Clamp(alpha, 0, 255)
 
 w = ImageWidth(img)
 h = ImageHeight(img)
 
 out = CreateImage(#PB_Any, w, h, 32)
 
 If IsImage(out)
     StartDrawing(ImageOutput(out))
      DrawImage(ImageID(img),0,0)   
      DrawingMode(#PB_2DDrawing_AlphaChannel)
      Box(0,0,w,h, alpha << 24)
     StopDrawing()
 EndIf
 
 ProcedureReturn out 
EndProcedure

Procedure.i CopyImageRemovingAlpha (img)
;> Creates a new image from the source image passed, removing the alpha channel.
;
; img : A valid PB image with a color depth of 32 bits.
; Returns a new 24 bit image or 0 in case of error.

 Protected out, w, h
 
 If ImageDepth(img) <> 24
    ProcedureReturn 0
 EndIf
 
 w = ImageWidth(img)
 h = ImageHeight(img)
 
 out = CreateImage(#PB_Any, w, h, 24)
 
 If IsImage(out) 
    StartDrawing(ImageOutput(out))
     DrawImage(ImageID(img),0,0)       
    StopDrawing()
 EndIf
 
 ProcedureReturn out
EndProcedure

Procedure SetImageAlpha (img, alpha)
;> Fills the alpha channel of the image with alpha.

; img : A valid 32 bit image with alpha channel.
; alpha : The alpha to write in the alpha channel (0 ... 255)

 Protected w, h
 
 If ImageDepth(img) <> 32
    ProcedureReturn 
 EndIf

 Math::Clamp(alpha, 0, 255)
 
 w = ImageWidth(img)
 h = ImageHeight(img)
   
 StartDrawing(ImageOutput(img))     
  DrawingMode(#PB_2DDrawing_AlphaChannel)     
  Box(0,0,w,h, RGBA(0,0,0,alpha))
 StopDrawing()  
EndProcedure

Procedure SetImageColorAlpha (img, color, alpha)
;> Sets the alpha channel of the image to alpha but only for the pixels of the specified color.

; img : A valid 32 bit image with alpha channel.
; color : RGB color for which the alpha channel will be modified.
; alpha : The alpha to write in the alpha channel (0 ... 255)

 Protected x, y, w, h
 Protected *drawbuff, pitch, pixelFormat
 
 If ImageDepth(img) <> 32
    ProcedureReturn 
 EndIf       
 
 Math::Clamp(alpha, 0, 255)
 
 w = ImageWidth(img)
 h = ImageHeight(img)
 
 StartDrawing(ImageOutput(img))
  *drawbuff = DrawingBuffer()
  pitch = DrawingBufferPitch()  
  pixelFormat = DrawingBufferPixelFormat()  
  
  Protected *p, *color.Ascii, c1.a, c2.a, c3.a
  
  If pixelFormat & #PB_PixelFormat_32Bits_RGB
    c1 = Red(color)
    c2 = Green(color)
    c3 = Blue(color)
  EndIf
  
  If pixelFormat & #PB_PixelFormat_32Bits_BGR
    c1 = Blue(color)
    c2 = Green(color)
    c3 = Red(color)
  EndIf
    
  *p = *drawbuff
    
  For y = 0 To h - 1
    For x = 0 To w - 1
        *color = *p        
        *p + 4 ; rgba / bgra
        If *color\a <> c1 : Continue : EndIf
        *color + 1
        If *color\a <> c2 : Continue : EndIf
        *color + 1
        If *color\a <> c3 : Continue : EndIf
        *color + 1
        *color\a = alpha
    Next
    *p = *drawbuff + pitch
    *drawbuff = *p
  Next
 StopDrawing()
EndProcedure

Procedure.i CreateImageFromFrameBuffer (win, x, y, w, h)
;> Grabs a specified area from the OpenGL framebuffer screen and creates a PB image from it.

; x, y : The lower left corner of the rectangle area.
; w, h : The width and height of the rectangle area.
; Returns a 32 bit PB image with the original framebuffer alpha channel or 0 in case of error.
; The coordinates are expressed in pixels and they start at (0,0) in the lower left corner of the client area (standard OpenGL)
        
 Protected *drawbuff, *buffer, rowLen, pitch, pixelFormat, isReversed, row, out
 Protected win_width, win_height
 Protected hDC, ReadPixelsFormat
 
 If GetCurrentContext() <> win ; the context of the specified window must be current
    Goto exit:
 EndIf
 
 GetWindowFrameBufferSize(win, @win_width, @win_height)

 *buffer = AllocateMemory(w * h * 4)

 If *buffer = 0 
    Goto exit: 
 EndIf
  
 out = CreateImage(#PB_Any, w, h, 32)
 
 If IsImage(out) = 0
    Goto exit:
 EndIf
 
 hDC = StartDrawing(ImageOutput(out))
     
 *drawbuff = DrawingBuffer()
 
 pixelFormat = DrawingBufferPixelFormat()  

 If pixelFormat & #PB_PixelFormat_ReversedY
    isReversed = 1
 EndIf    

 If pixelFormat & #PB_PixelFormat_32Bits_BGR
    ReadPixelsFormat = #GL_BGRA
 EndIf
 
 If pixelFormat & #PB_PixelFormat_32Bits_RGB
    ReadPixelsFormat = #GL_RGBA
 EndIf

 glReadPixels_(x, y, w, h, ReadPixelsFormat, #GL_UNSIGNED_BYTE, *buffer) 

 pitch = DrawingBufferPitch()
 
 rowLen = w * 4
 
 If isReversed
     For row = 0 To h - 1 
        CopyMemory(*buffer + (rowLen * row), *drawbuff + (pitch * row), rowLen)
     Next
 Else   
    For row = 0 To h - 1 
        CopyMemory(*buffer + (rowLen * (h - 1 - row)), *drawbuff + (pitch * row), rowLen)
    Next     
 EndIf

 StopDrawing()
 
 ProcedureReturn out
 
 exit:
 
 If hDC : StopDrawing() :EndIf
 If *buffer : FreeMemory(*buffer) : EndIf
 If out : FreeImage(out) : EndIf
 
 ProcedureReturn 0 
EndProcedure

Procedure.i CreateImageFromAlpha (img)
;> Creates a new image whose color bits are copied from the alpha channel of the source image.

; img : A valid 32 bit image with alpha channel.
; Returns a 32 bit PB image with the alpha set to 255, or 0 in case of error.

; This function takes the alpha channel information from an existing 32 bit image and copies it as the color bits of a new 32 bit image.
; The result is an image containing the grayscale representation of the alpha channel from the original image.
; The colors will range from (0,0,0) where originally fully transparent to (255,255,255) where originally fully opaque.
 
 Protected w, h, x, y, out
 Protected *alphabuff, *outbase
 Protected *s.RGBA, *o.RGBA, *b.Ascii
 Protected *drawbuff, pitch, bufSize
  
 If ImageDepth(img) <> 32
    Goto exit:
 EndIf
 
 w = ImageWidth(img)
 h = ImageHeight(img) 
 bufSize = w * h
 
 *alphabuff = AllocateMemory(bufSize) ; to store alpha values

 If *alphabuff = 0
    Goto exit:
 EndIf
 
 StartDrawing(ImageOutput(img))
  *drawbuff = DrawingBuffer()
  pitch = DrawingBufferPitch()     
  
  *b = *alphabuff  
  *s = *drawbuff
    
  For y = 0 To h - 1
    For x = 0 To w - 1
        *b\a = *s\A ; copy the alpha values to the allocated memory
        *b + 1
        *s + 4
    Next
    *s = *drawbuff + pitch
    *drawbuff = *s  
  Next
 StopDrawing()
 
 out = CreateImage (#PB_Any, w, h, 32)  
 
 If IsImage(out) = 0
    Goto exit:
 EndIf
 
 StartDrawing(ImageOutput(out))
  *outbase = DrawingBuffer()
  pitch = DrawingBufferPitch()         
       
  *b = *alphabuff   
  *o = *outbase
    
  For y = 0 To h - 1
    For x = 0 To w - 1 
        ; rgba or bgra is indifferent   
        *o\byte[0] = *b\a 
        *o\byte[1] = *b\a
        *o\byte[2] = *b\a

        *o\a = 255 ; fully opaque
        *o + 4 ; 32 bits
            
        *b + 1
    Next
    *o = *outbase + pitch
    *outbase = *o
  Next 
 StopDrawing() 
 
 FreeMemory(*alphabuff)
 
 ProcedureReturn out
 
 exit:
 
 If *alphabuff : FreeMemory(*alphabuff) : EndIf 
   
 ProcedureReturn 0
EndProcedure

Procedure.i CreateImage_Box (w, h, color, alpha = 255)
;> Creates an image filled with a single color and with the specified alpha value.
; Returns a 32 bit PB image or 0 in case of error.
 
 Protected img
 
 Math::Clamp(alpha, 0, 255)
   
 img = CreateImage(#PB_Any, w, h, 32)
 
 If img
    StartDrawing(ImageOutput(img))
     Box(0,0,w,h,color)
     DrawingMode(#PB_2DDrawing_AlphaChannel)     
     Box(0,0,w,h, RGBA(0,0,0,alpha))
    StopDrawing()  
 EndIf 
  
 ProcedureReturn img
EndProcedure

Procedure.i CreateImage_RGB (w, h, horizontal, alpha_r = 255, alpha_g = 255, alpha_b = 255)
;> Creates an image filled with 3 RGB bands with the specified alpha value for each band.
; 
; horizontal : 1 for horizontal bars, 0 for vertical.
; alpha_r : Alpha value for the red band (0 ... 255) 
; alpha_g : Alpha value for the green band (0 ... 255) 
; alpha_b : Alpha value for the blue band (0 ... 255) 
; Returns a 32 bit PB image or 0 in case of error.
 
 Protected img, inc
 
 If horizontal
    inc = h / 3
 Else
    inc = w / 3    
 EndIf
  
 Math::Clamp(alpha_r, 0, 255)
 Math::Clamp(alpha_g, 0, 255)
 Math::Clamp(alpha_b, 0, 255)
 
 img = CreateImage(#PB_Any, w, h, 32)
  
 If img
    StartDrawing(ImageOutput(img)) 
     DrawingMode(#PB_2DDrawing_AllChannels)
     If horizontal
          Box(0, 0, w, inc, RGBA(255,0,0,alpha_r))
          Box(0, inc, w, inc, RGBA(0,255,0,alpha_g))
          Box(0, inc * 2, w, inc + 1, RGBA(0,0,255,alpha_b))
      Else          
          Box(0, 0, inc, h, RGBA(255,0,0,alpha_r))
          Box(inc, 0, inc, h, RGBA(0,255,0,alpha_g))
          Box(inc * 2, 0, inc + 1, h, RGBA(0,0,255,alpha_b))
      EndIf
     StopDrawing()  
 EndIf 
  
 ProcedureReturn img
EndProcedure

Procedure.i CreateImage_DiceFace (w, h, face, color_circle, color_back, alpha_circle = 255, alpha_back = 255)
;> Creates an image with a circle inside and separated alpha values for the circle and the background.
; Returns a 32 bit PB image or 0 in case of error.
 
 Protected img, radius
 
 If w < h
    radius = w/8.0
 Else
    radius = h/8.0
 EndIf  
 
 Math::Clamp(alpha_circle, 0, 255)
 Math::Clamp(alpha_back, 0, 255)
 Math::Clamp(face, 1, 6)
   
 img = CreateImage(#PB_Any, w, h, 32)
 
 If img
    StartDrawing(ImageOutput(img))
     DrawingMode(#PB_2DDrawing_AllChannels)
     Box(0, 0, w, h, color_back | alpha_back << 24)
     Select face
        Case 1
            Circle(w/2, h/2, radius, color_circle | alpha_circle << 24)
        Case 2
            Circle(w/4, h/4, radius, color_circle | alpha_circle << 24)   
            Circle(w - w/4, h - h/4, radius, color_circle | alpha_circle << 24)
        Case 3
            Circle(w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w/2, h/2, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h - h/6, radius, color_circle | alpha_circle << 24)
        Case 4
            Circle(w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w/5, h - h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h - h/6, radius, color_circle | alpha_circle << 24)
        Case 5
            Circle(w/2, h/2, radius, color_circle | alpha_circle << 24)
            Circle(w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w/5, h - h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h - h/6, radius, color_circle | alpha_circle << 24)            
        Case 6
            Circle(w/5, h/2, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h/2, radius, color_circle | alpha_circle << 24)
            Circle(w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h/6, radius, color_circle | alpha_circle << 24)
            Circle(w/5, h - h/6, radius, color_circle | alpha_circle << 24)
            Circle(w - w/5, h - h/6, radius, color_circle | alpha_circle << 24)            
     EndSelect
     
     DrawingMode(#PB_2DDrawing_AllChannels | #PB_2DDrawing_Outlined)
     Box(0, 0, w, h, color_circle | alpha_circle << 24)   
     
    StopDrawing()  
 EndIf 
 
 ProcedureReturn img
EndProcedure

Procedure.i CreateImage_Checkers (w, h, sqWidth, sqHeight, color1, color2, alpha1 = 255, alpha2 = 255)
;> Creates an image with a checkerboard pattern and separated alpha values for the two squares.
; Returns a 32 bit PB image or 0 in case of error.

 Protected x, y
 Protected img
 
 Math::Clamp(alpha1, 0, 255)
 Math::Clamp(alpha2, 0, 255)  
 Math::Clamp(sqWidth, 1, w)
 Math::Clamp(sqHeight, 1, h)
  
 color1 | alpha1 << 24
 color2 | alpha2 << 24
 
 img = CreateImage(#PB_Any, w, h, 32)
   
 If img
    StartDrawing(ImageOutput(img))
     DrawingMode(#PB_2DDrawing_AllChannels)      
     Box(0, 0, w, h, color2)      
     While y < h + sqWidth
        While x < w + sqWidth
            Box(x, y, sqWidth, sqHeight, color1)
            Box(x + sqWidth, y + sqHeight, sqWidth, sqHeight, color1)
            x + sqWidth * 2
        Wend
        x = 0
        y + sqHeight * 2
    Wend     
   StopDrawing()
 EndIf
   
 ProcedureReturn img
EndProcedure

Procedure StickLabelToImage (img, text$, size = 12, fore = $FFFFFF, back = $000000)
;> Add a label in the upper left corner of the image.
; This is intended to make recognizable specific images to be used as textures during testing.

 Protected w, h, font, border
 
 If IsImage(img) = 0
    ProcedureReturn 
 EndIf
  
 font = LoadFont(#PB_Any, "Arial", size, #PB_Font_HighQuality)
 
 If font
    StartDrawing(ImageOutput(img))
     FrontColor(fore | 255 << 24)
     BackColor(back | 255 << 24)
     
     DrawingFont(FontID(font))     
     w = TextWidth(text$) 
     h = TextHeight(text$)
     
     border = h / 2
     
     DrawingMode(#PB_2DDrawing_AllChannels)
     Box(0, 0, w + border, h + border, back | 255 << 24)
     DrawText(border/2, border/2, text$)
     
     DrawingMode(#PB_2DDrawing_AllChannels | #PB_2DDrawing_Outlined)
     Box(0, 0, w + border, h + border)
    StopDrawing() 
 EndIf
 FreeFont(font)
EndProcedure

;- [ FPS ]

Procedure EnableVSync (flag)
;> Enable or disable vertical synchronization, if possible.
; This request may be ignored by the driver, and the user may override it in the settings of his graphic card.
; Also at least on Windows, VSync in windowed windows it is not perfect.
; Moral of the story: go full screen or at least borderless full screen windowed to have a proper VSync.
; https://stackoverflow.com/questions/45676892/reliable-windowed-vsync-with-opengl-on-windows

 flag = math::Clamp(flag, 0, 1) 
 glfwSwapInterval(flag)
EndProcedure

Procedure SetMaxFPS (fps)
;> Limit the number of FPS your main loop is going to render.

; Requires TrackFPS() in your main loop to work.

 SGL\TrackFps\maxFps = fps
 
 If fps > 0
    SGL\TrackFps\targetFrameTime = 1.0 / fps
 Else 
    SGL\TrackFps\targetFrameTime = 0.0
 EndIf
EndProcedure

Procedure TrackFPS()
;> Tracks the current number of frame per seconds.
; Just put this in you main loop and it will keep track the number of iterations per seconds, which normally it's equal to the number of FPS
; unless you are using a different loop logic. In that case you have to put this where is appropriate.
; If used in conjunction with SetMaxFPS() can limit the number of FPS to reduce the load on the GPU at the cost of some more load on the CPU.
 
 If SGL\TrackFps\timerFps = 0
    SGL\TrackFps\timerFps = CreateTimer()
    SGL\TrackFps\timerFullFrame = CreateTimer()  
    SGL\TrackFps\fpsCount = Bool(SGL\TrackFps\maxFps > 0)
    ProcedureReturn 
 EndIf

 If SGL\TrackFps\maxFps ; if the FPS limiter is enabled
    While GetElapsedTime(SGL\TrackFps\timerFullFrame) < SGL\TrackFps\targetFrameTime
        Delay(0)        
    Wend
    ResetTimer(SGL\TrackFps\timerFullFrame)
 EndIf
 
 If GetElapsedTime(SGL\TrackFps\timerFps) > 1.0
    SGL\TrackFps\fps = SGL\TrackFps\fpsCount
    SGL\TrackFps\fpsCount = 0
    ResetTimer(SGL\TrackFps\timerFps)
 EndIf
 
 SGL\TrackFps\fpsCount + 1
EndProcedure

Procedure.i GetFPS()
;> Returns the number of the frame per seconds in the last second.
; See TrackFPS()

 If SGL\TrackFps\fps
    ProcedureReturn SGL\TrackFps\fps
 Else
    ProcedureReturn 0
 EndIf
EndProcedure

Procedure StartFrameTimer()
;> Set the point in code where a frame start, and starts counting the passing time.
 
 If SGL\TrackFrameTime\timerFrame = 0
    SGL\TrackFrameTime\timerFrame = CreateTimer()
    SGL\TrackFrameTime\timerFrameAccum = CreateTimer()
 EndIf 
 
 ResetTimer(SGL\TrackFrameTime\timerFrame)
EndProcedure

Procedure StopFrameTimer()
;> Set the point in code where a frame ends, and saves the elasped frame time.

 SGL\TrackFrameTime\frameCount + 1
 SGL\TrackFrameTime\frameTimeAccum + GetElapsedTime(SGL\TrackFrameTime\timerFrame)
 
 If GetElapsedTime(SGL\TrackFrameTime\timerFrameAccum) > 1.0
    SGL\TrackFrameTime\frameTime = SGL\TrackFrameTime\frameTimeAccum / SGL\TrackFrameTime\frameCount
    SGL\TrackFrameTime\frameCount = 0
    SGL\TrackFrameTime\frameTimeAccum = 0.0
    ResetTimer(SGL\TrackFrameTime\timerFrameAccum)
 EndIf

EndProcedure

Procedure.f GetFrameTime()
;> Returns the average frame time sampled in the last second expressed in milliseconds.

 If SGL\TrackFrameTime\frameTime
    ProcedureReturn SGL\TrackFrameTime\frameTime * 1000
 Else
    ProcedureReturn 0
 EndIf
EndProcedure

;- [ FONTS ]

Procedure.i LoadBitmapFontData (file$)
;> Load a PNG image and a complementary XML and returns a pointer to a populated BitmapFontData.
; See SaveBitmapFontData()

; file$ is the filename of the font file, if no extension is specified .zip is used.
; example: "C:\bitmapped\arial-10-bold" will result in "arial-10-bold.zip"

 Protected *bmf.BitmapFontData
 Protected *glyph.GlyphData
 Protected zip, entry$, entries
 Protected bufsize, *bufPNG, *bufXML
 Protected baseName$, extension$, pathOnly$, fullPathName$ 
 Protected versionToken, chars, i
 Protected xml, main, node
     
 baseName$ = GetFilePart(file$, #PB_FileSystem_NoExtension)
 extension$ = GetExtensionPart(file$) 
 pathOnly$ = GetPathPart(file$)
 
 If extension$ = #Empty$
    extension$ = "zip"
 EndIf
 
 fullPathName$ = pathOnly$ + baseName$ + "." + extension$
     
 *bmf = AllocateStructure(BitmapFontData)
 If *bmf =  0 : Goto exit : EndIf
 
 zip = OpenPack(#PB_Any, fullPathName$, #PB_PackerPlugin_Zip)
 If zip = 0 : Goto exit: EndIf

 If ExaminePack(zip) = 0 : Goto exit : EndIf
 
 While NextPackEntry(zip)
    entry$ = PackEntryName(zip)
 
    If LCase(GetExtensionPart(entry$)) = "png"
        entries + 1
        bufsize = PackEntrySize(zip)
        
        *bufPNG = AllocateMemory(bufsize)
        If *bufPNG = 0 : Goto exit : EndIf
        
        If UncompressPackMemory(zip, *bufPNG, bufsize) = -1
            Goto exit
        EndIf
        
        *bmf\image = CatchImage(#PB_Any, *bufPNG)      
        
        If IsImage(*bmf\image) = 0
            Goto exit
        EndIf
        
        FreeMemory(*bufPNG) : *bufPNG = 0
    EndIf
    
    If LCase(GetExtensionPart(entry$)) = "xml"           
        entries + 1
        
        bufsize = PackEntrySize(zip)

        *bufXML = AllocateMemory(bufsize)
        If *bufXML = 0 : Goto exit : EndIf
        
        If UncompressPackMemory(zip, *bufXML, bufsize) = -1
            Goto exit
        EndIf

        xml = CatchXML(#PB_Any, *bufXML, bufsize)
        If xml = 0 : Goto exit : EndIf
        
        FreeMemory(*bufXML) : *bufXML = 0
           
        If XMLStatus(xml) <> #PB_XML_Success : Goto exit : EndIf 
      
        main  = MainXMLNode(xml)        
      
        If GetXMLNodeName(main) <> "SGL-BMF" : Goto exit : EndIf
        versionToken = Val(GetXMLAttribute(main, "version")) * 100 
        If versionToken  <> 100 : Goto exit : EndIf 
     
        node = ChildXMLNode(main, 1) 
        If GetXMLNodeName(node) <> "name" : Goto exit : EndIf
        *bmf\fontName$ = GetXMLNodeText(node)
    
        node = ChildXMLNode(main, 2) 
        If GetXMLNodeName(node) <> "size" : Goto exit : EndIf
        *bmf\fontSize = Val(GetXMLNodeText(node))
    
        node = ChildXMLNode(main, 3) 
        If GetXMLNodeName(node) <> "italic" : Goto exit : EndIf
        *bmf\italic = Val(GetXMLNodeText(node))
    
        node = ChildXMLNode(main, 4) 
        If GetXMLNodeName(node) <> "bold" : Goto exit : EndIf
        *bmf\bold = Val(GetXMLNodeText(node))
    
        ; block char 
        node = ChildXMLNode(main, 5) 
        If GetXMLNodeName(node) <> "block" : Goto exit : EndIf
    
        *bmf\block\code = -1
        *bmf\block\x = Val(GetXMLAttribute(node, "x"))
        *bmf\block\y = Val(GetXMLAttribute(node, "y"))
        *bmf\block\w = Val(GetXMLAttribute(node, "w"))
        *bmf\block\h = Val(GetXMLAttribute(node, "h"))
        *bmf\block\xOffset = Val(GetXMLAttribute(node, "xoffs"))

        node = ChildXMLNode(main, 6) 
        If GetXMLNodeName(node) <> "yoffs" : Goto exit : EndIf
        *bmf\yOffset = Val(GetXMLNodeText(node))
    
        node = ChildXMLNode(main, 7) 
        If GetXMLNodeName(node) <> "chars" : Goto exit : EndIf
        chars = Val(GetXMLNodeText(node)) 
              
        *bmf\glyphs = sbbt::New(#PB_Integer)
        
        For i = 1 To chars
            node = NextXMLNode(node)
            If node = 0 : Goto exit : EndIf
            
            *glyph = AllocateStructure(GlyphData)
                   
            *glyph\code = Val(GetXMLAttribute(node, "code"))
            *glyph\x = Val(GetXMLAttribute(node, "x"))
            *glyph\y = Val(GetXMLAttribute(node, "y"))
            *glyph\w = Val(GetXMLAttribute(node, "w"))
            *glyph\h = Val(GetXMLAttribute(node, "h"))
            *glyph\xOffset = Val(GetXMLAttribute(node, "xoffs"))
            
            If sbbt::Insert(*bmf\glyphs, *glyph\code, *glyph) = 0
                CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "LoadBitmapFontData() encountered duplicated char codes.")
                Goto exit
            EndIf
        Next
     
        FreeXML(xml)    
    EndIf
 Wend
 
 ClosePack(zip) : zip = 0
 
 If entries = 2 ; both png and xml have been retrieved 
    ProcedureReturn *bmf
 EndIf
  
 exit: 

 If *bufPNG : FreeMemory(*bufPNG) : EndIf
 If *bufXML : FreeMemory(*bufXML) : EndIf
 If IsXML(xml) : FreeXML(xml) : EndIf  
 If *bmf : DestroyBitmapFontData(*bmf) : EndIf
 If zip : ClosePack(zip) : EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i SaveBitmapFontData (file$, *bmf.BitmapFontData)
;> Saves a PNG image and a complementary XML file with the mapping of the chars inside the image.
; See LoadFontBitmapData()

; file$ is the filename of the font file, if no extension is specified .zip is used.
; example: "C:\bitmapped\arial-10-bold" will result in "arial-10-bold.zip"

 Protected baseName$, extension$, pathOnly$, fullPathName$
 Protected *bufXML, *bufPNG , bufSize, zip 
 Protected xml, main, child
 Protected *glyph.GlyphData
 
 ASSERT(*bmf)
 
 baseName$ = GetFilePart(file$, #PB_FileSystem_NoExtension)
 extension$ = GetExtensionPart(file$) 
 pathOnly$ = GetPathPart(file$)
 
 If extension$ = #Empty$
    extension$ = "zip"
 EndIf
 
 fullPathName$ = pathOnly$ + baseName$ + "." + extension$
 
 If IsImage(*bmf\image) = 0
    ProcedureReturn 0
 EndIf
 
 zip = CreatePack(#PB_Any, fullPathName$, #PB_PackerPlugin_Zip)
 If zip = 0 : Goto exit: EndIf
 
 *bufPNG = EncodeImage(*bmf\image, #PB_ImagePlugin_PNG)
 If *bufPNG  = 0 : Goto exit : EndIf

 bufSize = MemorySize(*bufPNG)

 If AddPackMemory(zip, *bufPNG, bufSize, *bmf\fontName$ + ".png") = 0
     Goto exit
 EndIf

 FreeMemory(*bufPNG) : *bufPNG = 0

 xml = CreateXML(#PB_Any) 

 If xml = 0 : Goto exit: EndIf
 
 main = CreateXMLNode(RootXMLNode(xml), "SGL-BMF")
 SetXMLAttribute(main , "version", "1.00")
    
 child = CreateXMLNode(main, "name") 
 SetXMLNodeText(child, *bmf\fontName$)
 child = CreateXMLNode(main, "size") 
 SetXMLNodeText(child, Str(*bmf\fontSize))
 child = CreateXMLNode(main, "italic")
 SetXMLNodeText(child, Str(*bmf\italic))
 child = CreateXMLNode(main, "bold")
 SetXMLNodeText(child, Str(*bmf\bold))

 child = CreateXMLNode(main, "block") 
 SetXMLAttribute(child , "x", Str(*bmf\block\x))
 SetXMLAttribute(child , "y", Str(*bmf\block\y))
 SetXMLAttribute(child , "w", Str(*bmf\block\w))
 SetXMLAttribute(child , "h", Str(*bmf\block\h))
 SetXMLAttribute(child , "xoffs", Str(*bmf\block\xOffset))

 child = CreateXMLNode(main, "yoffs") 
 SetXMLNodeText(child, Str(*bmf\yOffset))

 child = CreateXMLNode(main, "chars") 
 SetXMLNodeText(child, Str(sbbt::Count(*bmf\glyphs)))

 sbbt::EnumStart(*bmf\glyphs)

 While sbbt::EnumNext(*bmf\glyphs)
    *glyph = sbbt::GetValue(*bmf\glyphs)
    
    child = CreateXMLNode(main, "char")    
    SetXMLAttribute(child, "code", Str(*glyph\code))
    SetXMLAttribute(child, "x", Str(*glyph\x))
    SetXMLAttribute(child, "y", Str(*glyph\y))
    SetXMLAttribute(child, "w", Str(*glyph\w))
    SetXMLAttribute(child, "h", Str(*glyph\h))
    SetXMLAttribute(child, "xoffs", Str(*glyph\xOffset))
 Wend
 
 sbbt::EnumEnd(*bmf\glyphs)
    
 FormatXML(xml, #PB_XML_ReFormat)
    
 bufSize = ExportXMLSize(xml)   
 If bufSize = 0 : Goto exit : EndIf
    
 *bufXML = AllocateMemory(bufSize)
 If *bufXML =  0 : Goto exit : EndIf
 
 ExportXML(xml, *bufXML, bufSize)
    
 If AddPackMemory(zip, *bufXML, bufSize, *bmf\fontName$ + ".xml") = 0
    Goto exit
 EndIf
    
 FreeMemory(*bufXML) : *bufXML = 0
    
 FreeXML(xml) 
 
 ClosePack(zip) : zip = 0

 ProcedureReturn 1

 exit: 
 
 If *bufPNG : FreeMemory(*bufPNG) : EndIf
 If *bufXML : FreeMemory(*bufXML) : EndIf
 If IsXML(xml) : FreeXML(xml) : EndIf
 If zip : ClosePack(zip) : DeleteFile(fullPathName$) : EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i CreateBitmapFontData (fontName$, fontSize, fontFlags, Array ranges.BitmapFontRange(1), width, height, spacing = 0)
;> Returns an allocated BitmapFontData structure which can be used to display bitmapped fonts, or 0 in case of error.
; This function creates the bitmap font on the fly at runtime without the need of an external BMF.
; But keep in mind even using the same identical font on Windows and Linux the actual rendering will not be 100% the same and
; there will be still some differences in size.
; If you need a font to be rendered exactly the same on both platform is probably better to use a BMF.
; See LoadFontBitmapData()

; fontName$ is the name of the font
; fontSize is the size in points
; fontFlags are the PB constants used for LoadFont(), typically #Null or #PB_Font_Bold or #PB_Font_Italic
; ranges is an array of ranges of unicode chars to be included in the bitmap font 
; width, height are the dimensions of the image to be created (and later texture) 
; spacing is the number of pixels to be left unused around the glyph in the vertical and horizontal directions

; The function returns 0 if (width x height) results in an image too small to store all the glyphs.

 Protected hDC, image, x, y, highestRow, highestFont
 Protected char$, code, gw, gh
 Protected font, *bmf.BitmapFontData, *glyph.GlyphData
 Protected range, ranges = ArraySize(ranges())
 
 font = LoadFont(#PB_Any, fontName$, fontSize, fontFlags)
 
 If font = 0 : Goto exit : EndIf 
 
 image = CreateImage(#PB_Any, width, height, 32, #PB_Image_Transparent)
 
 If image = 0 : Goto exit : EndIf
 
 *bmf = AllocateStructure(BitmapFontData)
 
 If *bmf = 0 : Goto exit : EndIf
 
 hDC = StartDrawing(ImageOutput(image)) 
  DrawingFont(FontID(font))
  FrontColor(RGBA(255,255,255,255))
  BackColor(RGBA(0,0,0,0))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  
  x = 1 : y = 1
  
  ; BLOCK char for missing glyphs (a space in reverse)
  gw = TextWidth(" ")
  gh = TextHeight(" ")
  Box(x, y, gw, gh)
  
  ; fill up the metrics for the special BLOCK char
  *bmf\block\code = -1
  *bmf\block\x = x
  *bmf\block\y = y
  *bmf\block\w = gw
  *bmf\block\h = gh
  *bmf\block\xOffset = 1
   
  x = x + gw + spacing

  *bmf\glyphs = sbbt::New(#PB_Integer)
    
  ; now we process the requested unicode ranges 
  
  For range = 0 To ranges
    For code = ranges(range)\firstChar To ranges(range)\lastChar
      
        char$ = Chr(code)
        
        gw = TextWidth(char$)
        gh = TextHeight(char$)
        
        If y + gh > height
            ; not enough space
            Goto exit:
        EndIf
    
        If gh > highestRow
            highestRow = gh
        EndIf
        
        If gh > highestFont
            highestFont = gh
        EndIf
            
        If x + gw > width
            y + highestRow + spacing
            highestRow = 0
            x = 1
        EndIf
        
        DrawText(x, y, char$)
                
        *glyph = AllocateStructure(GlyphData)                
        
        If *glyph = 0 : Goto exit : EndIf
        
        *glyph\code = code
        *glyph\x = x
        *glyph\y = y
        *glyph\w = gw
        *glyph\h = gh
        *glyph\xOffset = 1
        
        If sbbt::Insert(*bmf\glyphs, *glyph\code, *glyph) = 0
            CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "CreateBitmapFontData() encountered duplicated char codes.")
            Goto exit
        EndIf
                      
        x = x + gw + spacing
    Next
  Next  
 StopDrawing()
   
 FreeFont(font)
 
 *bmf\fontName$ = fontName$
 *bmf\fontSize = fontSize
 *bmf\yOffset = highestFont + 1
 *bmf\italic = Bool(fontFlags & #PB_Font_Italic)
 *bmf\bold = Bool(fontFlags & #PB_Font_Bold)
 *bmf\image = image

 ProcedureReturn *bmf
 
 exit:
 
 If hDC : StopDrawing() : EndIf
 If image : FreeImage(image) : EndIf
 If font : FreeFont(font) : EndIf 
 If *bmf : DestroyBitmapFontData(*bmf) : EndIf 
 
 ProcedureReturn 0
EndProcedure

Procedure.i CreateBitmapFontDataFromStrip (file$, fontSize, width, height, spacing = 0)
;> Returns an allocated BitmapFontData structure which can be used to display bitmapped fonts, or 0 in case of error.
; This function creates the bitmap font data from a strip of chars and a text file used for mapping the ascii codes to the sub images.

; file$ is the name of the image file containing the strip of chars
; fontSize is the size in points
; width, height are the dimensions of the image to be created
; spacing is the number of pixels to be left unused around the glyph in the vertical and horizontal directions
;
; The function returns 0 if (width x height) results in an image too small to store all the glyphs.

; The strip image and text files must observe these rules:
; The image must contain an alpha channel filled with zeros where the chars glyphs are not present
; The start of the first and the end of the last sub image must coincide with the start and end of the strip
; Glyphs must be separated by at least one vertical line of zeros in the alpha channel
; A space char (ascii 32) must always be present in the .txt
; Only the first line of the text file is used, the rest can be used for remarks.
; See gimp-font\gimp-42.png and gimp-font\gimp-42.txt for an example.

 Protected gw, gh, x, y, i
 Protected hDC, image, highestRow, highestFont
 Protected *bmf.BitmapFontData, *glyph.GlyphData
 Protected stripCharsCount, stripChars$
 Protected fontName$ = GetFilePart(file$, #PB_FileSystem_NoExtension)
 Protected imgStrip, imgStrip$ = file$
 Protected txtFile, txtFile$ = GetPathPart(file$) + fontName$ + ".txt"
  
 Structure GlyphFromStrip
  image.i
  code.i
 EndStructure
 
 txtFile = ReadFile(#PB_Any, txtFile$)
 If txtFile = 0 : Goto exit : EndIf
 
 stripChars$ = ReadString(txtFile)
 stripCharsCount = Len(stripChars$)
 CloseFile(txtFile)
 
 Dim glyphs.GlyphFromStrip(stripCharsCount - 1)
 
 Protected spaceIndex = -1
 
 For i = 0 To stripCharsCount - 1
    glyphs(i)\code = Asc(Mid(stripChars$, i+1, 1))
    If glyphs(i)\code = 32
        spaceIndex = i
    EndIf
 Next
 
 ASSERT(spaceIndex <> -1)
 
 imgStrip = LoadImage(#PB_Any, imgStrip$)
 If imgStrip = 0 : Goto exit : EndIf
 
 Protected stripHeight, stripWidth, stripX, stripY, stripCharStart, stripCharEnd, stripCharWidth 
 
 stripHeight = ImageHeight(imgStrip) - 1
 stripWidth  = ImageWidth(imgStrip) - 1
 
 ; Debug "Strip size = " + Str(stripWidth) + " x " + Str(stripHeight) 
 
 For i = 0 To stripCharsCount - 1
    hDC = StartDrawing(ImageOutput(imgStrip))
    DrawingMode(#PB_2DDrawing_AllChannels)
  
    stripX = find_some_alpha_vertically(stripX, stripHeight, stripWidth) 
    stripCharStart = stripX
    
    stripX = find_zero_alpha_vertically(stripX, stripHeight, stripWidth) 
    stripCharEnd = stripX
 
    StopDrawing()
    
    stripCharWidth = stripCharEnd - stripCharStart
    
    glyphs(i)\image = GrabImage(imgStrip, #PB_Any, stripCharStart, 0, stripCharWidth, stripHeight)
    
    ; Debug "char n. " + Str(i) + ", code = " + Str(glyphs(i)\code) + " (" + Str(stripCharStart) + "," + Str(stripCharEnd) + ")"
    
    stripX + 1
 Next
 
 *bmf = AllocateStructure(BitmapFontData)
 
 If *bmf = 0 : Goto exit : EndIf

 image = CreateImage(#PB_Any, width, height, 32, #PB_Image_Transparent)
 
 If image = 0 : Goto exit : EndIf

 hDC = StartDrawing(ImageOutput(image)) 
  FrontColor(RGBA(255,255,255,255))
  BackColor(RGBA(0,0,0,0))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  
  x = 1 : y = 1
      
  ; BLOCK char for missing glyphs (a space in reverse)
  gw = ImageWidth(glyphs(spaceIndex)\image)
  gh = ImageHeight(glyphs(spaceIndex)\image)
  Box(x, y, gw, gh)
  
  ; fill up the metrics for the special BLOCK char
  *bmf\block\code = -1
  *bmf\block\x = x
  *bmf\block\y = y
  *bmf\block\w = gw
  *bmf\block\h = gh
  *bmf\block\xOffset = 2
   
  x = x + gw + spacing

  *bmf\glyphs = sbbt::New(#PB_Integer)
  
  Protected code
  
  For i = 0 To stripCharsCount - 1
  
    code = glyphs(i)\code    
    
    gw = ImageWidth(glyphs(i)\image)
    gh = ImageHeight(glyphs(i)\image)
        
    If y + gh > height
        ; not enough space
        Goto exit:
    EndIf
    
    If gh > highestRow
        highestRow = gh
    EndIf
    
    If gh > highestFont
        highestFont = gh
    EndIf
        
    If x + gw > width
        y + highestRow + spacing
        highestRow = 0
        x = 1
    EndIf
    
    If code <> 32
        DrawImage(ImageID(glyphs(i)\image), x, y)
    EndIf
    
    FreeImage(glyphs(i)\image)
            
    *glyph = AllocateStructure(GlyphData)
    
    If *glyph = 0 : Goto exit : EndIf
    
    *glyph\code = code
    *glyph\x = x
    *glyph\y = y
    *glyph\w = gw
    *glyph\h = gh
    *glyph\xOffset = 2
    
    If sbbt::Insert(*bmf\glyphs, *glyph\code, *glyph) = 0
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "CreateBitmapFontDataFromStrip() encountered duplicated char codes.")
        Goto exit
    EndIf
                  
    x = x + gw + spacing
  Next
  
 StopDrawing()
  
 *bmf\fontName$ = fontName$
 *bmf\fontSize = fontSize
 *bmf\yOffset = highestFont + 2
 *bmf\italic = 0
 *bmf\bold = 0
 *bmf\image = image

 ProcedureReturn *bmf

 exit:

 If hDC : StopDrawing() : EndIf
 If IsImage(imgStrip) : FreeImage(imgStrip): EndIf
 If IsImage(image) : FreeImage(image) : EndIf
 If txtFile : CloseFile(txtFile): EndIf
 If *bmf : DestroyBitmapFontData(*bmf) : EndIf
 
 ProcedureReturn 0
  
EndProcedure

Procedure DestroyBitmapFontData (*bmf.BitmapFontData)
;> Release the memory allocated by CreateBitmapFontData() 
 
 Protected *glyph.GlyphData
 
 If IsImage(*bmf\Image)
    FreeImage(*bmf\Image)
 EndIf

 If *bmf\glyphs
     sbbt::EnumStart(*bmf\glyphs)
     
     While sbbt::EnumNext(*bmf\glyphs)
        *glyph = sbbt::GetValue(*bmf\glyphs)
        FreeStructure(*glyph)
     Wend
     
     sbbt::EnumEnd(*bmf\glyphs)
    
     sbbt::Free(*bmf\glyphs)
 EndIf
      
 FreeStructure(*bmf)
EndProcedure

;- [ SHADERS ]

Procedure.i CompileShader (string$, shaderType)
;> Compile the shader from the specified source string and returns its handle or 0 in case of error.

; string$ is a Unicode string, it's internally converted to Ascii before passing it to GLSL.

; Invokes CallBack_Error() if the compilation fails.

; The sequence to build a shader is as follows: 
;
;  Protected objects.sgl::ShaderObjects
;  
;  vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) ; compiles a vertex shader
;  sgl::AddShaderObject(@objects, vs) ; add the object to the list of the objects to be linked
;  
;  fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) ; compiles a fragment shader
;  sgl::AddShaderObject(@objects, fs) ; add the object to the list of the objects to be linked
;  
;  shader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects
 
 Protected shader, *buffer
 
 shader = glCreateShader_(shaderType)
 
 If shader = 0 : Goto exit: EndIf
 
 *buffer = Ascii(string$)
 glShaderSource_(shader, 1, @*buffer, #Null) ; yes, a double pointer ...
 FreeMemory(*buffer)
 
 glCompileShader_(shader)
 
 Protected result, length, *errlog, errlog$ 
 
 glGetShaderiv_(shader, #GL_COMPILE_STATUS, @result)
 
 If result = #GL_FALSE    
    CALLBACK_ERROR (#SOURCE_ERROR_GLSL$, "glCompileShader() error in " + shader_type_to_string(shaderType))
    
    glGetShaderiv_(shader, #GL_INFO_LOG_LENGTH, @length)
    
    If length
        *errlog = AllocateMemory(length)
        glGetShaderInfoLog_(shader, length, @length, *errlog)
        errlog$ = PeekS(*errlog, length, #PB_UTF8) 
        FreeMemory(*errlog)                
        split_glsl_errors(errlog$)
    EndIf
    
    Goto exit:
 EndIf

 ProcedureReturn shader
 
 exit:
 
 ProcedureReturn 0
EndProcedure

Procedure.i CompileShaderFromFile (file$, shaderType)
;> Compile a shader from file and returns its handle or 0 in case of error.

; Invokes CallBack_Error() if the shader cannot be successfully compiled.
 
 Protected fh, fmt, source$, shader
 
 fh = ReadFile(#PB_Any, file$)
 
 If fh
    fmt = ReadStringFormat(fh)
    source$ = ReadString(fh, fmt | #PB_File_IgnoreEOL)    
    CloseFile(fh)    
    shader = CompileShader (source$, shaderType)
    If shader = 0
        CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "CompileShaderFromFile() failed for " + file$)
    EndIf
    ProcedureReturn shader
 EndIf

 ProcedureReturn 0
EndProcedure

Procedure AddShaderObject (*objects.ShaderObjects, shader)
;> Adds the compiled shader object to the list of objects to be linked with BuildShaderProgram()
 AddElement(*objects\shader())
 *objects\shader() = shader
EndProcedure

Procedure ClearShaderObjects (*objects.ShaderObjects)
;> Clears the compiled shader object list.
 ClearList(*objects\shader())
EndProcedure

Procedure.i BuildShaderProgram (*objects.ShaderObjects, cleanup = #True)
;> Build the shader program linking the specified compiled shaders together and returns its handle or 0 in case of error.

; If cleanup is true, the shaders objects are detached and deleted, and the passed *objects list is emptied.
; If cleanup is false, nothing of the above is done.

; Invokes CallBack_Error() if the program cannot be successfully built.

 Protected shaderProgram, linked
 
 shaderProgram = glCreateProgram_()
 
 If shaderProgram = 0 : Goto exit: EndIf
 
 ForEach *objects\shader()
    glAttachShader_(shaderProgram, *objects\shader())
 Next
 
 glLinkProgram_(shaderProgram)
 
 glGetProgramiv_(shaderProgram, #GL_LINK_STATUS, @linked)
 
 If linked = #GL_FALSE : Goto exit: EndIf

CompilerIf (#PB_Compiler_Debugger = 1)
 ; validation only while debugging
 
 Protected result, length, *errlog, errlog$
 
 glValidateProgram_(shaderProgram) 
 
 glGetProgramiv_(shaderProgram, #GL_VALIDATE_STATUS, @result)
 
 If result = #GL_FALSE
    CALLBACK_ERROR (#SOURCE_ERROR_GLSL$, "glValidateProgram() failed.")
    
    glGetProgramiv_(shaderProgram, #GL_INFO_LOG_LENGTH, @length)
    
    If length
        *errlog = AllocateMemory(length)        
        glGetProgramInfoLog_(shaderProgram, length, @length, *errlog)
        errlog$ = PeekS(*errlog, length, #PB_UTF8)
        FreeMemory(*errlog)
        
        split_glsl_errors(errlog$)
    EndIf
    
    Goto exit:
 EndIf   
CompilerEndIf
 
 If cleanup
     ForEach *objects\shader()
        glDetachShader_(shaderProgram, *objects\shader())
        glDeleteShader_(*objects\shader())
     Next     
     ClearShaderObjects(*objects)
 EndIf
   
 ProcedureReturn shaderProgram
 
 exit: 
  
 If shaderProgram
     ForEach *objects\shader()        
        glDetachShader_(shaderProgram, *objects\shader())
        glDeleteShader_(*objects\shader())
     Next
    glDeleteProgram_(shaderProgram)
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure DestroyShaderProgram (program)
;> Delete the shader program.
 glDeleteProgram_(program)
EndProcedure

Procedure BindShaderProgram (program)
;> Enable the shader program to be used for rendering.
 glUseProgram_(program)
EndProcedure

Procedure.i GetUniformLocation (program, name$)
;> Returns the location of the specified uniform used by shader, or -1 if not found.
; The access to the uniform should be cached because if done repeatedly inside the main loop it can be a little expensive.
 ProcedureReturn glGetUniformLocation_(program, name$)
EndProcedure

Procedure SetUniformMatrix4x4 (uniform, *m4x4, count = 1)
;> Pass a uniform to the shader: one or multiple m4x4 matrices.
 glUniformMatrix4fv_(uniform, count, #GL_FALSE, *m4x4) 
EndProcedure

Procedure SetUniformVec2 (uniform, *v0.vec2::vec2, count = 1)
;> Pass a uniform to the shader: one or multiple vec2 vectors.
 glUniform2fv_(uniform, count, *v0) 
EndProcedure

Procedure SetUniformVec3 (uniform, *v0.vec3::vec3, count = 1)
;> Pass a uniform to the shader: one or multiple vec3 vectors.
 glUniform3fv_(uniform, count, *v0) 
EndProcedure

Procedure SetUniformVec4 (uniform, *v0.vec4::vec4, count = 1)
;> Pass a uniform to the shader: one or multiple vec4 vectors.
 glUniform4fv_(uniform, count, *v0) 
EndProcedure

Procedure SetUniformLong (uniform, v0.l)
;> Pass a uniform to the shader: one long.
 glUniform1i_(uniform, v0)
EndProcedure

Procedure SetUniformLongs (uniform, *address, count = 1)
;> Pass a uniform to the shader: multiple longs.
 glUniform1iv_(uniform, count, *address) 
EndProcedure

Procedure SetUniformFloat (uniform, v0.f)
;> Pass a uniform to the shader: 1 float.
 glUniform1f_(uniform, v0)
EndProcedure

Procedure SetUniformFloats (uniform, *address, count = 1)
;> Pass a uniform to the shader: multiple floats.
 glUniform1fv_(uniform, count, *address)
EndProcedure

Procedure SetUniform2Floats (uniform, v0.f, v1.f)
;> Pass a uniform to the shader: 2 floats.
 glUniform2f_(uniform, v0, v1) 
EndProcedure

Procedure SetUniform3Floats (uniform, v0.f, v1.f, v2.f)
;> Pass a uniform to the shader: 3 floats.
 glUniform3f_(uniform, v0, v1, v2) 
EndProcedure

Procedure SetUniform4Floats (uniform, v0.f, v1.f, v2.f, v3.f)
;> Pass a uniform to the shader: 4 floats.
 glUniform4f_(uniform, v0, v1, v2, v3) 
EndProcedure

EndModule
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 3444
; FirstLine = 3441
; Folding = --------------------------------
; Markers = 2975,3133
; EnableXP
; EnableUser
; UseMainFile = examples\001 Minimal.pb
; CPU = 1
; CompileSourceDirectory