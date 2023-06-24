; How to use the many available CallBacks.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "CallBacks... so many CallBacks"

Declare   Render (win)

; Helpers

Procedure.s ModsToString (mods)
 Protected ret$ = "("+ Hex(mods) + ") "
 If mods & sgl::#KEY_MOD_SHIFT
    ret$ + "#KEY_MOD_SHIFT "
 EndIf
 If mods & sgl::#KEY_MOD_CONTROL
    ret$ + "#KEY_MOD_CONTROL "
 EndIf
 If mods & sgl::#KEY_MOD_ALT
    ret$ + "#KEY_MOD_ALT "
 EndIf
 If mods & sgl::#KEY_MOD_SUPER
    ret$ + "#KEY_MOD_SUPER "
 EndIf
 ProcedureReturn ret$
EndProcedure

Procedure.s ActionToString (action)
 Protected ret$
 Select action
    Case sgl::#PRESSED
        ret$ = "#PRESSED"
    Case sgl::#RELEASED
        ret$ = "#RELEASED"
    Case sgl::#REPEATING
        ret$ = "#REPEATING"
 EndSelect
 ProcedureReturn ret$
EndProcedure

; CallBacks
 
Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

Procedure CallBack_WindowRefresh (win)
 Render (win)
EndProcedure

Procedure CallBack_WindowClose (win)
 Debug #PB_Compiler_Procedure
 Debug "The window is closing." 
EndProcedure

Procedure CallBack_WindowPos (win, x, y)
 Debug #PB_Compiler_Procedure
 Debug "The window new position is " + str::Sprintf("(%i, %i)", @x, @y) 
EndProcedure

Procedure CallBack_WindowSize (win, width, height)
 Debug #PB_Compiler_Procedure
 Debug "The window new size is " + str::Sprintf("(%i x %i)", @width, @height) 
EndProcedure

Procedure CallBack_WindowFocus (win, focused)
 Debug #PB_Compiler_Procedure
 If focused
    Debug "The window gained input focus."
 Else
    Debug "The window lost input focus."
 EndIf
EndProcedure

Procedure CallBack_WindowMinimize (win, minimized)
 Debug #PB_Compiler_Procedure
 If minimized
    Debug "The window has been minimized."
 Else
    Debug "The window has been restored from minimized."
 EndIf
EndProcedure

Procedure CallBack_WindowMaximize (win, maximized)
 Debug #PB_Compiler_Procedure
 If maximized
    Debug "The window has been maximized."
 Else
    Debug "The window has been restored from maximized."
 EndIf
EndProcedure

Procedure CallBack_WindowFrameBufferSize (win, width, height)
 Debug #PB_Compiler_Procedure
 Debug "The window new framebuffer size is " + str::Sprintf("(%i x %i)", @width, @height)
EndProcedure

Procedure CallBack_Key (win, key, scancode, action, mods)
 Debug #PB_Compiler_Procedure
 Debug "key String = " + sgl::GetKeyString(key) 
 Debug "key String Local = " + sgl::GetKeyStringLocal(key) 
 Debug "scan code = " + scancode + " ($" + Hex(scancode) + ")" 
 Debug "action = " + ActionToString(action)
 Debug "mods = " + ModsToString(mods) 
EndProcedure

Procedure CallBack_MouseButton (win, button, action, mods)
 Debug #PB_Compiler_Procedure
 Debug "Button = " + sgl::GetMouseButtonString(button) 
 Debug "action = " + ActionToString(action)
 Debug "mods = " + ModsToString(mods) 
EndProcedure

Procedure CallBack_Char (win, char)
 Debug #PB_Compiler_Procedure
 Debug "char unicode = " + char + " ('" + Chr(char) + "')"
EndProcedure

Procedure CallBack_CursorPos (win, x.d, y.d)
 Debug #PB_Compiler_Procedure
 Debug "The cursor position is " + str::Sprintf("(%d, %d)", @x, @y)
EndProcedure

Procedure CallBack_CursorEntering (win, entering)
 Debug #PB_Compiler_Procedure
 If entering
    Debug "The cursor is entering the client area."
 Else
    Debug "The cursor is leaving the client area."
 EndIf
EndProcedure

Procedure CallBack_WindowScroll (win, x_offset.d, y_offset.d)
 Debug #PB_Compiler_Procedure
 Debug "The scroll offset is " + str::Sprintf("(%.3d, %.3d)", @x_offset, @y_offset)
EndProcedure

Procedure Render (win)
 Protected w, h
 
 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 glMatrixMode_ (#GL_PROJECTION)
 glLoadIdentity_()
 gluPerspective_(60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
 
 glMatrixMode_(#GL_MODELVIEW)
 glLoadIdentity_()
 glTranslatef_(0.0, 0.0, -2.0)
 
 glBegin_(#GL_TRIANGLES)      
  glColor3f_ ( 1.0, 0.0, 0.0) 
  glVertex3f_( 0.0, 1.0, 0.0) 
  glColor3f_ ( 0.0, 1.0, 0.0) 
  glVertex3f_(-1.0,-1.0, 0.0) 
  glColor3f_ ( 0.0, 0.0, 1.0) 
  glVertex3f_( 1.0,-1.0, 0.0) 
 glEnd_() 
 
 sgl::SwapBuffers(win)
EndProcedure

Define win

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()        
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 2)
       
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win
        ; enable what you would like to test
                            
        sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_REFRESH, @CallBack_WindowRefresh())
                
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_CLOSE, @CallBack_WindowClose())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_POS, @CallBack_WindowPos())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_SIZE, @CallBack_WindowSize())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_FOCUS, @CallBack_WindowFocus())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_MINIMIZE, @CallBack_WindowMinimize())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_MAXIMIZE, @CallBack_WindowMaximize())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_FRAMEBUFFER_SIZE, @CallBack_WindowFrameBufferSize())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_WINDOW_SCROLL, @CallBack_WindowScroll())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_KEY, @CallBack_Key())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_CHAR, @CallBack_Char())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_CURSOR_POS, @CallBack_CursorPos())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_CURSOR_ENTERING, @CallBack_CursorEntering())
        
        ;sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_MOUSE_BUTTON, @CallBack_MouseButton())
        
        sgl::MakeContextCurrent(win)
        
        While sgl::WindowShouldClose(win) = 0
            Render(win)    
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 206
; FirstLine = 166
; Folding = ----
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier