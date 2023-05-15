; Using OpenGLGadget() with gl.pbi + glLoad.pb to draw a cube with legacy OpenGL

IncludeFile "../gl.pbi"
IncludeFile "../glLoad.pb"

UseModule gl

Procedure CallBack_GetProcAddress (func$)
 ProcedureReturn wglGetProcAddress_(func$) ; use the appropriate API here, or the applicable function from a framework like glfw
EndProcedure

Procedure CallBack_EnumFuncs (glver$, func$, *func) 
 Debug Left(glver$ + Space(4), 4) + " -> " + func$ + " ($" + Hex(*func) + ")"
EndProcedure

Global GoodProcsCount, BadProcsCount

Global RollAxisX.f
Global RollAxisY.f
Global RollAxisZ.f

Global RotateSpeedX.f = 1.2
Global RotateSpeedY.f = 1.0
Global RotateSpeedZ.f = 1.0

Procedure DrawCube () 
  glPushMatrix_()                 
  glMatrixMode_(#GL_MODELVIEW)

  glRotatef_(RollAxisX, 1.0, 0, 0) 
  glRotatef_(RollAxisY, 0, 1.0, 0) 
  glRotatef_(RollAxisZ, 0, 0, 1.0) 
 
  RollAxisX + RotateSpeedX 
  RollAxisY + RotateSpeedY 
  RollAxisZ + RotateSpeedZ 

  glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
  glDisable_(#GL_LIGHTING)
  
  glBegin_(#GL_QUADS)
    
  glColor3ub_(0, 255, 0) ; Green  
  glVertex3f_( 1.0, 1.0, -1.0) ; top right of the quad (top)
  glVertex3f_(-1.0, 1.0, -1.0) ; top left of the quad (top)
  glVertex3f_(-1.0, 1.0, 1.0) ; bottom left of the quad (top)
  glVertex3f_( 1.0, 1.0, 1.0) ; bottom right of the quad (top)

  glColor3ub_(255, 255, 0) ; Yellow
  glVertex3f_(-1.0, 1.0, 1.0) ; top right of the quad (left)
  glVertex3f_(-1.0, 1.0,-1.0) ; top left of the quad (left)
  glVertex3f_(-1.0,-1.0,-1.0) ; bottom left of the quad (left)
  glVertex3f_(-1.0,-1.0, 1.0) ; bottom right of the quad (left)
  
  glColor3ub_(255, 0, 0) ; Red
  glVertex3f_( 1.0, 1.0, 1.0) ; top right of the quad (front)
  glVertex3f_(-1.0, 1.0, 1.0) ; top left of the quad (front)  
  glVertex3f_(-1.0,-1.0, 1.0) ; bottom left of the quad (front)
  glVertex3f_( 1.0,-1.0, 1.0) ; bottom right of the quad (front)
  
  glColor3ub_(224, 64, 32) ; Orange
  glVertex3f_(-1.0, 1.0, -1.0) ; top right of the quad (Back)
  glVertex3f_( 1.0, 1.0, -1.0) ; top left of the quad (Back)
  glVertex3f_( 1.0,-1.0, -1.0) ; bottom left of the quad (Back)
  glVertex3f_(-1.0,-1.0, -1.0) ; bottom right of the quad (Back)
  
  glColor3ub_(0, 0, 255) ; Blue
  glVertex3f_( 1.0, -1.0, 1.0) ; top right of the quad (bottom)
  glVertex3f_(-1.0, -1.0, 1.0) ; top left of the quad (bottom)  
  glVertex3f_(-1.0, -1.0,-1.0) ; bottom left of the quad (bottom)
  glVertex3f_( 1.0, -1.0,-1.0) ; bottom right of the quad (bottom)
  
  glColor3ub_(228, 225, 255) ; White
  glVertex3f_( 1.0, 1.0,-1.0) ; top right of the quad (right)
  glVertex3f_( 1.0, 1.0, 1.0) ; top left of the quad (right)
  glVertex3f_( 1.0, -1.0, 1.0) ; bottom left of the quad (right)
  glVertex3f_( 1.0, -1.0,-1.0) ; bottom right of the quad (right)

  glEnd_()

  glPopMatrix_()
  glFinish_()

  SetGadgetAttribute(0, #PB_OpenGL_FlipBuffers, #True)
EndProcedure

Procedure Setup() 
  glMatrixMode_(#GL_PROJECTION)  
  gluPerspective_(45.0, GadgetWidth(0)/GadgetHeight(0), 1.0, 10.0) 
  
  glMatrixMode_(#GL_MODELVIEW)  
  glTranslatef_(0, 0, -5.0)
  
  glEnable_(#GL_DEPTH_TEST)                               
  
  glEnable_(#GL_CULL_FACE)  
                                
  glShadeModel_(#GL_SMOOTH)
EndProcedure

Global GoodProcsCount, BadProcsCount
Global Major, Minor

If OpenWindow(0, 100, 100, 640, 480, "Using gl.pbi", #PB_Window_SystemMenu)
    Define evt, loop = 1
    
    If OpenGLGadget(0, 0, 0, 640, 480)     
        ; PB will always request the highest possible COMPATIBLE context or a LEGACY one

        SetGadgetAttribute(0, #PB_OpenGL_SetContext, #True)
        
        Debug "#GL_VENDOR = " + PeekS(glGetString_(#GL_VENDOR), -1, #PB_Ascii)
        Debug "#GL_RENDERER = " + PeekS(glGetString_(#GL_RENDERER), -1, #PB_Ascii)
        Debug "#GL_VERSION = " + PeekS(glGetString_(#GL_VERSION), -1, #PB_Ascii)
                        
        glLoad::GetContextVersion(@Major, @Minor)
                
        Debug "OpenGL context version = " + Str(Major) + "." + Str(Minor)

        If glLoad::Deprecated()
            Debug "Deprecated functions are included."
        Else
            Debug "Deprecated functions are not included."
        EndIf    
        
        If Major >= 2 And Minor >= 1 ; have we got it ?
                
            glLoad::RegisterCallBack(glLoad::#CallBack_GetProcAddress, @CallBack_GetProcAddress())
            glLoad::RegisterCallBack(glLoad::#CallBack_EnumFuncs, @CallBack_EnumFuncs())
            
            If glLoad::Load() 
            
                glLoad::GetProcsCount(@GoodProcsCount, @BadProcsCount)
                Debug Str(GoodProcsCount) + " functions imported, " + Str(BadProcsCount) + " missing."    

                Setup()           
                
                While loop
                    Repeat
                        evt = WindowEvent()                
                        If evt = #PB_Event_CloseWindow
                            loop = 0
                        EndIf
                    Until evt = 0                
                    DrawCube()    
                Wend          
            EndIf
        
        EndIf
                     
    EndIf  
EndIf  

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 132
; FirstLine = 104
; Folding = -
; EnableXP
; EnableUser
; Executable = test.exe
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant