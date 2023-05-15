; Keyboard input

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define Title$ = "Keyboard input"

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

Procedure CallBack_Key (win, key, scancode, action, mods)
 Debug #PB_Compiler_Procedure
 Debug "key String = " + sgl::GetKeyString(key) 
 Debug "key String Local = " + sgl::GetKeyStringLocal(key) 
 Debug "scan code = " + scancode + " ($" + Hex(scancode) + ")" 
 Debug "action = " + ActionToString(action)
 Debug "mods = " + ModsToString(mods) 
EndProcedure

Procedure CallBack_Char (win, char)
 Debug #PB_Compiler_Procedure
 Debug "char unicode = " + char + " ('" + Chr(char) + "')"
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
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)
       
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win                                
        ; sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_KEY, @CallBack_Key())
        ; sgl::RegisterWindowCallBack(win, sgl::#CALLBACK_CHAR, @CallBack_Char())
        
        sgl::MakeContextCurrent(win)
        
        While sgl::WindowShouldClose(win) = 0
            Render(win)

            If sgl::GetKeyPress(sgl::#Key_ESCAPE) 
                ; terminate the program                
                sgl::SetWindowShouldClose(win, 1)
            EndIf
            
            ; SPACE
            
            If sgl::GetKeyPress(sgl::#Key_SPACE) 
                ; should be detected only once for keypress
                Debug sgl::GetKeyString(sgl::#Key_SPACE)
            EndIf
            
            ; ARROW UP
              
            If sgl::GetKey(sgl::#Key_UP) = sgl::#PRESSED
                ; should be detected for the time is kept pressed 
                Debug sgl::GetKeyString(sgl::#Key_UP)
            EndIf

            ; LEFT ALT
            
            If sgl::GetKey(sgl::#Key_LEFT_ALT) = sgl::#PRESSED
                ; should be detected for the time is kept pressed 
                Debug sgl::GetKeyString(sgl::#Key_LEFT_ALT)
            EndIf

            ; CTRL + SHIFT + X
            
            If sgl::GetKey(sgl::#Key_LEFT_CONTROL)  = sgl::#PRESSED And 
               sgl::GetKey(sgl::#Key_LEFT_SHIFT)    = sgl::#PRESSED And 
               sgl::GetKey(sgl::#KEY_X)             = sgl::#PRESSED 
               
                ; should be detected for the time the combination is kept pressed
                Debug "CTRL + SHIFT + X"
            EndIf
            
;             Define key = sgl::GetLastKey()
;             If key ; if there is a key pressed
;                 Debug "key = " + key 
;                 Debug "GetKeyString(key) = " + sgl::GetKeyString(key) 
;                 Debug "GetKeyStringLocal(key) = " + sgl::GetKeyStringLocal(key) 
;             EndIf
;             
;             Define char = sgl::GetLastChar()      
;             If char ; if there is a printable char ready
;                 Debug "char = " + char 
;                 Debug "Chr(char) = " + Chr(34) + Chr(char) + Chr(34)
;             EndIf
            
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 118
; FirstLine = 105
; Folding = --
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier