; *********************************************************************************************************************
; sgl.pbi
; by Luis
;
; SGL intended use is to be an instructional aid for myself first, but also for any PurebBasic user interested in 
; learning OpenGL.
; 
; As a second step from this, the idea is to use it for writing some more advanced demos, or a simple 2D game engine.
;
; OS: Windows x86/x64, Linux x64
;
; https://www.purebasic.fr/english/viewtopic.php?t=81764
;
; 1.00, Jun 03 2023, PB 6.02
; First public release on GitHub.
;
; 0.90, Feb 06 2023, PB 6.01
; First release.
; *********************************************************************************************************************

CompilerIf Defined(sgl_config, #PB_Module) = 0 
 CompilerError "You must include the configuration module sgl.config.pbi"
CompilerEndIf

; GLFW linking configuration
CompilerIf sgl_config::#LINK_DYNAMIC = 1
 XIncludeFile "glfw/glfw.config.dynamic.pbi"
CompilerElse
 XIncludeFile "glfw/glfw.config.static.pbi"
CompilerEndIf

; Support
XIncludeFile "inc/std.pb"
XIncludeFile "inc/str.pb"
XIncludeFile "inc/sys.pb"
XIncludeFile "inc/math.pb"
XIncludeFile "inc/sbbt.pb"

; GLFW
XIncludeFile "glfw/glfw.pbi"
XIncludeFile "glfw/glfwLoad.pb"

; OpenGL imports and constants up to 4.6
XIncludeFile "gl/gl.pbi"
XIncludeFile "gl/glLoad.pb"

; Assert 
XIncludeFile "inc/dbg.pb"

; Vectors, Matrices, Quaternions 
XIncludeFile "inc/vec2.pb"
XIncludeFile "inc/vec3.pb"
XIncludeFile "inc/vec4.pb"
XIncludeFile "inc/m4x4.pb"
XIncludeFile "inc/quat.pb"

UseModule gl ; import gl namespace

UseModule dbg ; import dbg namespace

DeclareModule sgl

EnableExplicit

#SGL_MAJ = 1
#SGL_MIN = 0
#SGL_REV = 0
  
;- CallBacks 
  
Prototype CallBack_Error (Source$, Desc$)
Prototype CallBack_WindowClose (win)
Prototype CallBack_WindowPos (win, x, y)
Prototype CallBack_WindowSize (win, width, height)
Prototype CallBack_WindowFocus (win, focused)
Prototype CallBack_WindowMinimize (win, minimized)
Prototype CallBack_WindowMaximize (win, maximized)
Prototype CallBack_WindowFrameBufferSize (win, width, height)
Prototype CallBack_WindowRefresh (win)
Prototype CallBack_WindowScroll (win, x_offset.d, y_offset.d)
Prototype CallBack_Key (win, key, scancode, action, mods)
Prototype CallBack_Char (win, char)
Prototype CallBack_CursorPos (win, x, y)
Prototype CallBack_CursorEntering (win, entering)
Prototype CallBack_MouseButton (win, button, action, mods)

;- Macros 

Macro B2F (byte) ; byte to float
 ; byte MUST be in the range 0 .. 255
 (byte / 255.0)
EndMacro

Macro F2B (float) ; float to byte
 ; float MUST be in the range 0.0 .. 1.0
 (float * 255.0)
EndMacro

Macro RGBA (r, g, b, a) ; 4 integers to RGBA integer
 (r | g << 8 | b << 16 | a << 24)
EndMacro

Macro RGB (r, g, b) ; 3 integers to RGB integer
 (r | g << 8 | b << 16)
EndMacro

Macro BGRA (b, g, r, a) ; 4 integers to BGRA integer
 (b | g << 8 | r << 16 | 0 << 24)
EndMacro

Macro BGR (b, g, r) ; 3 integers to BGR integer
 (b | g << 8 | r << 16)
EndMacro

Macro F2RGB (r, g, b) ; 3 floats to RGB integer
 RGB (F2B(r), F2B(g), F2B(b))
EndMacro

Macro F2RGBA (r, g, b, a) ; 4 floats to RGBA integer
 RGBA (F2B(r), F2B(g), F2B(b), F2B(a))
EndMacro

Macro StartData()
 ?StartData_#MacroExpandedCount
 DataSection : StartData_#MacroExpandedCount: 
EndMacro

Macro StopData()
 : EndDataSection
EndMacro

;- Structures 

Structure RGB 
 byte.a[0] ; unsigned bytes
 r.a
 g.a
 b.a
EndStructure

Structure RGBA 
 byte.a[0] ; unsigned bytes
 r.a 
 g.a
 b.a
 a.a
EndStructure

Structure BGR 
 byte.a[0] ; unsigned bytes
 b.a
 g.a
 r.a
EndStructure

Structure BGRA 
 byte.a[0] ; unsigned bytes
 b.a
 g.a
 r.a
 a.a
EndStructure

Structure VideoMode
 width.i ; x 
 height.i; y
 depth.i ; color depth
 freq.i ; refresh freq.
EndStructure

Structure IconData
 width.l ; x
 height.l ; y
 *pixels ; pointer to the pixels buffer 
EndStructure

Structure TexelData
 imageWidth.i ; width of the source image
 imageHeight.i ; height of the source image 
 imageDepth.i ; color depth of the source image (24/32)
 imageFormat .i ; color format of the source image (#GL_RGB, #GL_BGR, #GL_RGBA, #GL_BGRA)
 internalTextureFormat.i ; suggested internal format for the OpenGL texture (#GL_RGB, #GL_RGBA)
 length.i ; length in bytes of the pixels buffer
 *pixels ; pointer to the pixels buffer ready to be sent to the texture
EndStructure

Structure GlyphData
 code.i ; unicode code
 x.i ; upper left x
 y.i ; upper left y
 w.i ; width of the char cell
 h.i ; height of the char cell
 xOffset.i ; how much the horizontal position should be advanced after drawing the character
EndStructure

Structure BitmapFontRange
 firstChar.i ; the first unicode char in this range
 lastChar.i ; the last unicode char in this range
EndStructure

Structure BitmapFontData
 fontName$ ; font name
 fontSize.i ; font size (points)
 image.i ; bitmap 32 bits
 italic.i ; 1 if italic
 bold.i ; 1 if bold
 yOffset.i ; how much the vertical position should be advanced after drawing a line
 block.GlyphData ; the special BLOCK charater to use for any missing glyph
 *glyphs  ; this is a binary tree filled by CreateBitmapFontData()
EndStructure

Structure ShaderObjects
 List shader.i() ; OpenGL handles for the compiled shader objects
EndStructure

#DONT_CARE = glfw::#GLFW_DONT_CARE

;- Constants

Enumeration ; CallBacks Constants 
 #CALLBACK_WINDOW_CLOSE
 #CALLBACK_WINDOW_POS
 #CALLBACK_WINDOW_SIZE
 #CALLBACK_WINDOW_FOCUS
 #CALLBACK_WINDOW_MINIMIZE
 #CALLBACK_WINDOW_MAXIMIZE
 #CALLBACK_WINDOW_FRAMEBUFFER_SIZE
 #CALLBACK_WINDOW_REFRESH
 #CALLBACK_WINDOW_SCROLL
 #CALLBACK_KEY
 #CALLBACK_CHAR
 #CALLBACK_CURSOR_POS
 #CALLBACK_CURSOR_ENTERING
 #CALLBACK_MOUSE_BUTTON
EndEnumeration

Enumeration ; OpenGL Debug Output
 #DEBUG_OUPUT_NOTIFICATIONS
 #DEBUG_OUPUT_LOW 
 #DEBUG_OUPUT_MEDIUM
 #DEBUG_OUPUT_HIGH
EndEnumeration

Enumeration ; OpenGL Profiles
 #PROFILE_ANY = 1
 #PROFILE_COMPATIBLE 
 #PROFILE_CORE 
EndEnumeration

Enumeration 1 ; Window Hints Constants
 #HINT_WIN_OPENGL_DEBUG ; default 0
 #HINT_WIN_OPENGL_MAJOR ; default 1
 #HINT_WIN_OPENGL_MINOR ; default 0
 #HINT_WIN_OPENGL_DEPTH_BUFFER ; default 24
 #HINT_WIN_OPENGL_STENCIL_BITS ; default 8
 #HINT_WIN_OPENGL_ACCUMULATOR_BITS ; default 0
 #HINT_WIN_OPENGL_SAMPLES ; default 0
 
 #HINT_WIN_OPENGL_PROFILE ; default #PROFILE_ANY
 #HINT_WIN_OPENGL_FORWARD_COMPATIBLE ; default 0 (better to avoid this, and just use 3.2 or higher for modern OpenGL)
 #HINT_WIN_VISIBLE ; default 1
 #HINT_WIN_RESIZABLE ; default 1
 #HINT_WIN_MAXIMIZED ; default 0
 #HINT_WIN_DECORATED ; default 1
 #HINT_WIN_TOPMOST ; default 0
 #HINT_WIN_FOCUSED ; default 1
 #HINT_WIN_CENTERED_CURSOR ; default 1 (full screen only)
 #HINT_WIN_AUTO_MINIMIZE ; default 1 (full screen only)
 #HINT_WIN_FRAMEBUFFER_DEPTH  ; default 24
 #HINT_WIN_FRAMEBUFFER_TRANSPARENT  ; default 0
 #HINT_WIN_REFRESH_RATE ; default #DONT_CARE (full screen only)
EndEnumeration

; Pressed and Released for keys and buttons

#PRESSED    = glfw::#GLFW_PRESS
#RELEASED   = glfw::#GLFW_RELEASE
#REPEATING  = glfw::#GLFW_REPEAT

; Keys Modifiers

#KEY_MOD_SHIFT   = glfw::#GLFW_MOD_SHIFT
#KEY_MOD_CONTROL = glfw::#GLFW_MOD_CONTROL
#KEY_MOD_ALT     = glfw::#GLFW_MOD_ALT  
#KEY_MOD_SUPER   = glfw::#GLFW_MOD_SUPER

; Mouse Cursor

#CURSOR_NORMAL   = glfw::#GLFW_CURSOR_NORMAL 
#CURSOR_HIDDEN   = glfw::#GLFW_CURSOR_HIDDEN 
#CURSOR_DISABLED = glfw::#GLFW_CURSOR_DISABLED 

; Mouse Buttons

Enumeration 
 #MOUSE_BUTTON_1 = glfw::#GLFW_MOUSE_BUTTON_1
 #MOUSE_BUTTON_2
 #MOUSE_BUTTON_3
 #MOUSE_BUTTON_4
 #MOUSE_BUTTON_5
 #MOUSE_BUTTON_6
 #MOUSE_BUTTON_7
 #MOUSE_BUTTON_8

 #MOUSE_BUTTON_LEFT   = #MOUSE_BUTTON_1
 #MOUSE_BUTTON_RIGHT  = #MOUSE_BUTTON_2
 #MOUSE_BUTTON_MIDDLE = #MOUSE_BUTTON_3
EndEnumeration 

; Keys

Enumeration 
 #Key_Unknown = 0

 #Key_TAB = 9
 #Key_BACKSPACE = 8
 #Key_ENTER = 13
 #Key_ESCAPE = 27
 #Key_SPACE = 32
 #Key_SEMICOLON = ';'
 #Key_SINGLE_QUOTE = 39
 #Key_LEFT_BRACKET = '['
 #Key_RIGHT_BRACKET = ']'
 #Key_PERIOD = '.'
 #Key_MINUS = '-'
 #Key_COMMA = ','
 #Key_EQUAL = '='
 #Key_SLASH = '/'
 #Key_BACKSLASH = '\'
 #Key_ACCENT = '`'

 #Key_0 = '0' ; digits go from 48 to 57
 #Key_1
 #Key_2
 #Key_3
 #Key_4
 #Key_5
 #Key_6
 #Key_7
 #Key_8
 #Key_9

 #Key_A = 'A' ; chars go from 65 to 90
 #Key_B
 #Key_C
 #Key_D
 #Key_E
 #Key_F
 #Key_G
 #Key_H
 #Key_I
 #Key_J
 #Key_K
 #Key_L
 #Key_M
 #Key_N
 #Key_O
 #Key_P
 #Key_Q
 #Key_R
 #Key_S
 #Key_T
 #Key_U
 #Key_V
 #Key_W
 #Key_X
 #Key_Y
 #Key_Z

 ; function keys
 #Key_F1 = 128 ; special keys go from 128
 #Key_F2
 #Key_F3
 #Key_F4
 #Key_F5
 #Key_F6
 #Key_F7
 #Key_F8
 #Key_F9
 #Key_F10
 #Key_F11
 #Key_F12
 #Key_F13
 #Key_F14
 #Key_F15
 #Key_F16
 #Key_F17
 #Key_F18
 #Key_F19
 #Key_F20

 ; modifiers
 #Key_LEFT_SHIFT 
 #Key_LEFT_CONTROL 
 #Key_LEFT_ALT
 #Key_RIGHT_SHIFT
 #Key_RIGHT_CONTROL
 #Key_RIGHT_ALT

 ; keypad
 #Key_KP_0 
 #Key_KP_1
 #Key_KP_2
 #Key_KP_3
 #Key_KP_4
 #Key_KP_5
 #Key_KP_6
 #Key_KP_7
 #Key_KP_8
 #Key_KP_9
 #Key_KP_NUMLOCK
 #Key_KP_DIVIDE
 #Key_KP_MULTIPLY
 #Key_KP_SUBTRACT
 #Key_KP_ADD
 #Key_KP_DECIMAL
 #Key_KP_ENTER
 #Key_KP_EQUAL

 ; arrows
 #Key_UP
 #Key_LEFT
 #Key_RIGHT
 #Key_DOWN

 ; extra
 #Key_INSERT
 #Key_DELETE
 #Key_HOME
 #Key_END
 #Key_PAGEUP
 #Key_PAGEDOWN
 #Key_CAPSLOCK
 #Key_LEFT_SUPER
 #Key_RIGHT_SUPER
 #Key_MENU
 #Key_PRINTSCREEN
 #Key_SCROLL_LOCK
 #Key_PAUSE
 
 #Key_LAST
EndEnumeration

;- Declares

; [ CORE ]

Declare.i   Init() ; Initialize the SGL library.
Declare     Shutdown() ; Terminates the library, destroying any window still open and releasing resources.
Declare.s   GetGlfwVersion() ; Returns a string representing the version of the GLFW backend.
Declare.s   GetSglVersion() ; Returns a string representing the SGL version.
Declare     RegisterErrorCallBack (*fp) ; Registers a callback to get runtime error messages from the library.

; [ EVENTS ]

Declare     PollEvents() ; Processes the events that are in the queue and then returns immediately.
Declare     WaitEvents() ; Wait for an event pausing the thread.
Declare     WaitEventsTimeout (timeout.d) ; Like WaitEvents() but it will return after a timeout if there is no event.

; [ TIMERS ]

Declare.d   GetTimerResolution() ; Returns the timer resolution in seconds.
Declare.s   GetTimerResolutionString() ; Returns the timer resolution as a string, expressed in milliseconds, microseconds or nanoseconds.
Declare.d   GetTime() ; Returns the current SGL time in seconds (the time elapsed since SGL was initialized).
Declare.i   CreateTimer() ; Returns a new initialiazed timer.
Declare     DestroyTimer (timer) ; Destroys the timer.
Declare.d   GetDeltaTime (timer) ; Returns the time elapsed from the last call to GetDeltaTime(), or from the timer's last reset, or from the timer's creation.
Declare.d   GetElapsedTime (timer) ; Returns the time elapsed from the creation of the timer or from its last reset.
Declare.d   GetElapsedTimeAbsolute (timer) ; Returns the time elapsed from the creation of the timer, irrespective of any reset in between.
Declare     ResetTimer (timer) ; Resets the timer internal counters.

; [ DEBUG ]

Declare.i   EnableDebugOutput (level = #DEBUG_OUPUT_MEDIUM) ; Enables the modern OpenGL debug output using the same callback specified to RegisterErrorCallBack().
Declare     ClearGlErrors() ; Clears any pending OpenGL error status for glGetError().
Declare     CheckGlErrors() ; Checks for any pending OpenGL error, and routes it to the same callback specified to RegisterErrorCallBack().

; [ CONTEXT ]

Declare     MakeContextCurrent (win) ; Makes the context associated to the specified window current.
Declare.i   GetCurrentContext() ; Returns the window associated to the current context.
Declare.s   GetRenderer() ; Returns the description of the OpenGL renderer.
Declare.s   GetVendor() ; Returns the name of the OpenGL vendor.
Declare.s   GetShadingLanguage() ; Returns the description of the OpenGL shading language.
Declare     GetContextVersion (*major, *minor) ; Gets the version of the OpenGL context divided in major and minor.
Declare.i   GetContextVersionToken() ; Returns the version of the OpenGL context as a token (a single integer).
Declare.i   GetContextProfile() ; Returns #PROFILE_COMPATIBLE or #PROFILE_CORE as the profile type for a context >= 3.2, else 0.
Declare.i   IsDebugContext() ; Returns 1 if the current context is supporting the debug features of OpenGL 4.3, else 0.
Declare.i   GetProcAddress (func$) ; Returns the address of the specified OpenGL function or extension if supported by the current context.

; [ EXTENSIONS ]

Declare.i   LoadExtensionsStrings() ; Load a list of the available extensions strings and cache them internally.
Declare.i   CountExtensionsStrings() ; Counts the number of OpenGL extensions strings available.
Declare.s   GetExtensionString (index) ; Returns the n-item in the collection of extensions strings.
Declare.i   IsExtensionAvailable (extension$) ; Checks if the specified extension string is defined.

; [ MOUSE ]

Declare.i   IsRawMouseSupported() ; Returns 1 if the raw mouse motion is supported on the system.
Declare     EnableRawMouse (win, flag) ; Enables or disable the raw mouse motion mode.
Declare     SetCursorMode (win, mode) ; Sets the mouse cursor as normal, hidden, or disabled for the specified window.
Declare     GetMouseScroll (*xOffset.Double, *yOffset.Double) ; Gets the scroll offset for the x and y axis generated by a mouse wheel or a trackpad.
Declare.i   GetCursorPos (win, *x.Integer, *y.Integer) ; Get the position of the cursor in screen coordinates relative to the upper-left corner of the client area of the specified window.
Declare     SetCursorPos (win, x, y) ; Set the position of the cursor in screen coordinates relative to the upper-left corner of the client area of the specified window.
Declare.s   GetMouseButtonString (button) ; Returns the descriptive string for the specified SGL mouse button.
Declare.i   GetMouseButton (win, button) ; Returns the last state reported for the specified mouse button on the specified window (#PRESSED or #RELEASED).
Declare     SetStickyMouseButtons (win, flag) ; Sets or disable the sticky mouse buttons input mode for the specific window.

; [ KEYBOARD ]

Declare.i   GetLastKey() ; Returns the SGL key code of the last key which has been #PRESSED and still is, else 0.
Declare.i   GetLastChar() ; Returns the unicode code of the last printable char generated, else 0.
Declare.i   GetKey (key) ; Returns the last state reported for the specified SGL key (#PRESSED or #RELEASED).
Declare.i   GetKeyPress (key) ; Returns 1 once if the specified key has been pressed, and then 0 until the key has been released and pressed again.
Declare.s   GetKeyString (key) ; Returns the descriptive string for the specified SGL key according to the USA layout.
Declare.s   GetKeyStringLocal (key) ; Returns the descriptive string for the specified SGL key according to the locale layout.

; [ WINDOWS ]

Declare.i   CreateWindow (w, h, title$, mon = #Null, share = #Null) ; Creates a window and its OpenGL context, optionally in full screen mode.
Declare.i   CreateWindowXY (x, y, w, h, title$, share = #Null) ; Creates a windowed window and its OpenGL context at the coordinates x,y.
Declare     DestroyWindow (win) ; Close and destroys the specied window.
Declare.i   RegisterWindowCallBack (win, type, *fp) ; Registers the specified callback event for the specified window.
Declare     ResetWindowHints() ; Resets all the window hints to their default values.
Declare     ShowWindow (win, flag) ; Makes the specified window visible or hidden based on the flag.
Declare     SetWindowHint (type, value) ; Set various hinting attributes which influence the creation of a window.
Declare     SetWindowAutoMinimize (win, flag) ; Set the specified window auto-minimize setting based on the flag.
Declare     SetWindowText (win, text$) ; Sets the window title.
Declare     SetWindowDefaultIcon (win) ; Sets the window icon back to its default.
Declare     SetWindowIcon (win, count, *images.IconData) ; Sets the icon of the specified window.
Declare     SetWindowDecoration (win, flag) ; Set the specified window decoration status based on the flag.
Declare     SetWindowTopMost (win, flag) ; Set the specified window topmost status based on the flag.
Declare     SetWindowResizable (win, flag) ; Set the specified window resizeable status based on the flag.
Declare     SetWindowPos (win, x, y) ; Set the specified window position in screen coordinates.
Declare     GetWindowPos (win, *x, *y) ; get the specified window position in screen coordinates.
Declare     SetWindowFocus (win) ; Brings the specified window to front and set the input focus to it.
Declare     SetWindowSize (win, widht, height) ; Set the specified window size in screen coordinates or changes the full screen resolution.
Declare     SetWindowSizeLimits (win, min_widht, min_height, max_widht, max_height) ; Set the specified window size limits to control how far the user can resize a window.
Declare     SetWindowAspectRatio (win, width_numerator, height_denominator) ; Forces the required aspect ratio of the clieant area of the specified window.
Declare.i   WindowShouldClose (win) ; Returns 1 if the internal flag signaling the window should close has been set, else 0.
Declare     SetWindowShouldClose (win, flag) ; Set the flag signaling if the window should be closed or not.
Declare     MinimizeWindow (win) ; Minimizes the specified window.
Declare     MaximizeWindow (win) ; Maximizes the specified window.
Declare     RestoreWindow (win) ; Restores the specified window.
Declare     GetWindowSize (win, *width, *height) ; Get the size in screen coordinates of the content area of the specified window.
Declare     GetWindowFrameBufferSize (win, *width, *height) ; Gets the size in pixels of the framebuffer of the specified window.
Declare.i   IsWindowFocused (win) ; Returns 1 if window has the input focus.
Declare.i   IsWindowHovered (win) ; Returns 1 if the mouse cursor is currently hovering directly over the content area of the window.
Declare.i   IsWindowVisible (win) ; Returns 1 if window is visible.
Declare.i   IsWindowResizable (win) ; Returns 1 if window is resizable by the user.
Declare.i   IsWindowMinimized (win) ; Returns 1 if window is currently minimized.
Declare.i   IsWindowMaximized (win) ; Returns 1 if window is currently maximized.
Declare     SwapBuffers (win) ; Swaps the OpenGL buffers.
Declare.i   GetWindowMonitor (win) ; Returns the handle of the monitor associated with the specified full screen window.
Declare     SetWindowMonitor (win, mon, x, y, width, height, freq) ; Sets the monitor that the window uses in full screen mode or, if the monitor is #Null, switches it to windowed mode.
Declare     GetWindowContentScale (win, *x_float, *y_float) ; Gets the content scale for the specified window.

; [ MONITORS ]

Declare.i   GetPrimaryMonitor() ; Returns the handle of the primary monitor.
Declare.i   GetMonitors (Array monitors(1)) ; Returns the number of monitors and an array of handles for them.
Declare.s   GetMonitorName (mon) ; Returns the specified monitor name as string.
Declare.i   GetVideoMode (mon, *vmode.VideoMode) ; Gets the current dimensions, color depth and refresh frequency of the specified monitor as a VideoMode structure.
Declare.i   GetVideoModes (mon, Array vmodes.VideoMode(1)) ; Returns the number of video modes for the specified monitor and an array of said video modes.
Declare     GetMonitorContentScale (mon, *x_float, *y_float) ; Gets the content scale for the specified monitor.

; [ SYSTEM ]

Declare.s   GetOS() ; Returns a string describing the OS and its version.
Declare.s   GetCpuName() ; Returns a string describing the CPU model and brand.
Declare.i   GetLogicalCpuCores () ; Returns the number of logical CPU cores as reported by the OS.
Declare.q   GetTotalMemory() ; Returns the size of the total memory available in the system in bytes.
Declare.q   GetFreeMemory() ; Returns the size of the free memory available in the system in bytes.
Declare.i   GetSysInfo (Array sysInfo$(1)) ; Retrieves a lot of info about the system configuration and its OpenGL capabilities, useful for logging.

; [ IMAGES ]

Declare.i   IsPowerOfTwo (value) ; Returns 1 if the specified positive number is a POT.
Declare.i   NextPowerOfTwo (value) ; Returns the next greater POT for the specified value.
Declare.i   NextMultiple (value, multiple) ; Returns the next integer value which is a multiple of multiple.
Declare.i   CreateTexelData (img) ; Returns a pointer to TexelData containing the image data ready to be sent to an OpenGL texture.
Declare     DestroyTexelData (*td.TexelData) ; Release the memory allocated by CreateTexelData()
Declare.i   CopyImageAddingAlpha (img, alpha) ; Creates a new image from the source image passed, adding an alpha channel.
Declare.i   CopyImageRemovingAlpha (img) ; Creates a new image from the source image passed, removing the alpha channel.
Declare     SetImageAlpha (img, alpha) ; Fills the alpha channel of the image with alpha.
Declare     SetImageColorAlpha (img, color, alpha) ; Sets the alpha channel of the image to alpha but only for the pixels of the specified color.
Declare.i   CreateImageFromFrameBuffer (win, x, y, w, h) ; Grabs a specified area from the OpenGL framebuffer screen and creates a PB image from it.
Declare.i   CreateImageFromAlpha (img) ; Creates a new image whose color bits are copied from the alpha channel of the source image.
Declare.i   CreateImage_Box (w, h, color, alpha = 255) ; Creates an image filled with a single color and with the specified alpha value.
Declare.i   CreateImage_RGB (w, h, horizontal, alpha_r = 255, alpha_g = 255, alpha_b = 255) ; Creates an image filled with 3 RGB bands with the specified alpha value for each band.
Declare.i   CreateImage_DiceFace (w, h, face, color_circle, color_back, alpha_circle = 255, alpha_back = 255) ; Creates an image with a circle inside and separated alpha values for the circle and the background.
Declare.i   CreateImage_Checkers (w, h, sqWidth, sqHeight, color1, color2, alpha1 = 255, alpha2 = 255) ; Creates an image with a checkerboard pattern and separated alpha values for the two squares.
Declare     StickLabelToImage (img, text$, size = 12, fore = $FFFFFF, back = $000000) ; Add a label in the upper left corner of the image.

; [ FPS ]

Declare     EnableVSync (flag) ; Enable or disable vertical synchronization, if possible.
Declare     SetMaxFPS (fps) ; Limit the number of FPS your main loop is going to render.
Declare     TrackFPS() ; Tracks the current number of frame per seconds.
Declare.i   GetFPS() ; Returns the number of the frame per seconds in the last second.
Declare     StartFrameTimer() ; Set the point in code where a frame starts, and starts counting the passing time.
Declare     StopFrameTimer() ; Set the point in code where a frame ends, and saves the elasped frame time.
Declare.f   GetFrameTime() ; Returns the average frame time sampled in the last second expressed in seconds.

; [ FONTS ]

Declare.i   LoadBitmapFontData (file$) ; Load a PNG image and a complementary XML file from a zip file and returns a pointer to a populated BitmapFontData.
Declare.i   SaveBitmapFontData (file$, *bmf.BitmapFontData) ; Saves a zip file containing a PNG image and a complementary XML file with the mapping of the chars.
Declare.i   CreateBitmapFontData (fontName$, fontSize, fontFlags, Array ranges.BitmapFontRange(1), width = 0, height = 0, spacing = 0) ; Returns an allocated BitmapFontData structure which can be used to display bitmapped fonts, or 0 in case of error.
Declare.i   CreateBitmapFontDataFromStrip (file$, fontSize, width, height, spacing) ; Returns an allocated BitmapFontData structure which can be used to display bitmapped fonts, or 0 in case of error.
Declare     DestroyBitmapFontData (*bmf.BitmapFontData) ; Release the memory allocated by CreateBitmapFontData()

; [ SHADERS ]

Declare.i   CompileShader (string$, shaderType) ; Compile the shader from the specified source string and returns its handle or 0 in case of error.
Declare.i   CompileShaderFromFile (file$, shaderType) ; Compile a shader from file and returns its handle or 0 in case of error.
Declare     AddShaderObject (*objects.ShaderObjects, shader) ; Adds the compiled shader object to the list of objects to be linked with BuildShaderProgram()
Declare     ClearShaderObjects (*objects.ShaderObjects) ; Clears the compiled shader object list.
Declare.i   BuildShaderProgram (*objects.ShaderObjects, cleanup = #True) ; Build the shader program linking the specified compiled shaders together and returns its handle or 0 in case of error.
Declare     DestroyShaderProgram (program) ; Delete the shader program.
Declare     BindShaderProgram (program) ; Enable the shader program to be used for rendering.
Declare.i   GetUniformLocation (program, name$) ; Returns the location of the specified uniform used by shader, or -1 if not found.
Declare     SetUniformMatrix4x4 (uniform, *m4x4, count = 1) ; Pass a uniform to the shader: one or multiple m4x4 matrices.
Declare     SetUniformVec2 (uniform, *v0.vec2::vec2, count = 1) ; Pass a uniform to the shader: one or multiple vec2 vectors.
Declare     SetUniformVec3 (uniform, *v0.vec3::vec3, count = 1) ; Pass a uniform to the shader: one or multiple vec3 vectors.
Declare     SetUniformVec4 (uniform, *v0.vec4::vec4, count = 1) ; Pass a uniform to the shader: one or multiple vec4 vectors.
Declare     SetUniformLong (uniform, v0.l) ; Pass a uniform to the shader: one long.
Declare     SetUniformLongs (uniform, *address, count = 1) ; Pass a uniform to the shader: multiple longs.
Declare     SetUniformFloat (uniform, v0.f) ; Pass a uniform to the shader: 1 float.
Declare     SetUniformFloats (uniform, *address, count = 1) ; Pass a uniform to the shader: multiple floats.
Declare     SetUniform2Floats (uniform, v0.f, v1.f) ; Pass a uniform to the shader: 2 floats.
Declare     SetUniform3Floats (uniform, v0.f, v1.f, v2.f) ; Pass a uniform to the shader: 3 floats.
Declare     SetUniform4Floats (uniform, v0.f, v1.f, v2.f, v3.f) ; Pass a uniform to the shader: 4 floats.

EndDeclareModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 522
; FirstLine = 520
; Folding = -----
; Markers = 444
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory