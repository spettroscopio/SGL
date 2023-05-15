; Using OpenGLGadget() with gl.pbi + glLoad.pb to write a simple OpenGL 2.1 program.
   
IncludeFile "../gl.pbi"
IncludeFile "../glLoad.pb"

UseModule gl

EnableExplicit

Global Major, Minor
Global GoodProcsCount, BadProcsCount
Global shaderProgram , vao

Procedure CallBack_GetProcAddress (func$)
 ProcedureReturn wglGetProcAddress_(func$) ; use the appropriate API here, or the applicable function from a framework like glfw
EndProcedure

Procedure CallBack_EnumFuncs (glver$, func$, *func) 
 Debug Left(glver$ + Space(4), 4) + " -> " + func$ + " ($" + Hex(*func) + ")"
EndProcedure

Procedure.i CompileShader (source$, shaderType)
 Protected shader, *buffer

 shader = glCreateShader_(shaderType)
 
 If shader = 0 : Goto exit: EndIf
 
 *buffer = Ascii(source$)
 glShaderSource_(shader, 1, @*buffer, #Null) ; yes, a double pointer ...
 FreeMemory(*buffer)
 
 glCompileShader_(shader)
 
 Protected result, length, *errlog, errlog$ 
 
 glGetShaderiv_(shader, #GL_COMPILE_STATUS, @result)
 
 If result = #GL_FALSE        
    glGetShaderiv_(shader, #GL_INFO_LOG_LENGTH, @length)
    
    If length
        *errlog = AllocateMemory(length)
        glGetShaderInfoLog_(shader, length, @length, *errlog)
        errlog$ = PeekS(*errlog, length, #PB_UTF8) 
        FreeMemory(*errlog)                
        Debug errlog$
    EndIf
    
    Goto exit:
 EndIf

 ProcedureReturn shader
 
 exit:
 
 ProcedureReturn 0
EndProcedure

Procedure.i BuildShaderProgram (vs, fs)

 Protected shaderProgram

 shaderProgram = glCreateProgram_()
 
 If shaderProgram = 0 : Goto exit: EndIf
 
 glAttachShader_(shaderProgram, vs)

 glAttachShader_(shaderProgram, fs)

 glLinkProgram_(shaderProgram)


CompilerIf (#PB_Compiler_Debugger = 1)
 ; validation only while debugging
 
 Protected result, length, *errlog, errlog$
 
 glValidateProgram_(shaderProgram) 
 
 glGetProgramiv_(shaderProgram, #GL_VALIDATE_STATUS, @result)
 
 If result = #GL_FALSE        
    glGetProgramiv_(shaderProgram, #GL_INFO_LOG_LENGTH, @length)
    
    If length
        *errlog = AllocateMemory(length)        
        glGetProgramInfoLog_(shaderProgram, length, @length, *errlog)
        errlog$ = PeekS(*errlog, length, #PB_UTF8)
        FreeMemory(*errlog)
        
        Debug errlog$
    EndIf
    
    Goto exit:
 EndIf
CompilerEndIf   
 
 glDetachShader_(shaderProgram, vs)
 glDeleteShader_(vs) 
 glDetachShader_(shaderProgram, fs) 
 glDeleteShader_(fs)
 
 ProcedureReturn shaderProgram
 
 exit: 
  
 If shaderProgram
    glDetachShader_(shaderProgram, vs)
    glDeleteShader_(vs)
    glDetachShader_(shaderProgram, fs)
    glDeleteShader_(fs)
    glDeleteProgram_(shaderProgram)
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure Render()
 Protected w, h
 
 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 w = WindowWidth(0)
 h = WindowHeight(0)
  
 glViewport_(0, 0, w, h)
 
 glUseProgram_(shaderProgram)
 
 glBindVertexArray_(vao)
 glDrawArrays_(#GL_TRIANGLES, 0, 3) 
  
 SetGadgetAttribute(0, #PB_OpenGL_FlipBuffers, #True)
EndProcedure

Procedure Setup()
Protected vertexShader$, fragmentShader$ 
 Protected vbo, vs, fs
 
 DataSection
  vertex_data: 
  Data.f -0.5, -0.5, 0.0 
  Data.f  0.0,  0.5, 0.0
  Data.f  0.5, -0.5, 0.0 
 EndDataSection

 Protected *vertexPos = ?vertex_data
 
 ; these are slightly different in the way params are passed
 
 vertexShader$ = "#version 120" + #CRLF$ 
 vertexShader$ + "attribute vec4 position;" + #CRLF$
 vertexShader$ + "void main () {" + #CRLF$
 vertexShader$ + " gl_Position = position;" + #CRLF$
 vertexShader$ + "}"
 
 fragmentShader$ = "#version 120" + #CRLF$ 
 fragmentShader$ + "void main () {" + #CRLF$
 fragmentShader$ + " gl_FragColor = vec4 (1.0, 1.0, 0.0, 1.0);" + #CRLF$
 fragmentShader$ + "}" 

 ; vertex buffer object
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 glBufferData_(#GL_ARRAY_BUFFER, 9 * SizeOf(Float), *vertexPos, #GL_STATIC_DRAW)
 
 ; vertex array object
 glGenVertexArrays_(1, @vao)
 glBindVertexArray_(vao)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 glEnableVertexAttribArray_(0)
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 0, 0)

 vs = CompileShader (vertexShader$, #GL_VERTEX_SHADER)

 fs = CompileShader (fragmentShader$, #GL_FRAGMENT_SHADER)

 shaderProgram = BuildShaderProgram (vs, fs)
EndProcedure

If OpenWindow(0, 100, 100, 640, 480, "Using gl.pbi", #PB_Window_SystemMenu)
    Define event, shouldClose = 0
    
    If OpenGLGadget(0, 0, 0, 640, 480) 
        ; PB will always request the highest possible COMPATIBLE context or a LEGACY one

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
    
                While shouldClose = 0                              
                    Repeat
                        event = WindowEvent()
                        
                        If event = #PB_Event_CloseWindow
                            shouldClose = 1
                        EndIf
                        
                    Until event = 0
                    
                    Render()
                Wend  
            EndIf        
        EndIf
                     
    EndIf  
EndIf  


; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 210
; FirstLine = 186
; Folding = --
; EnableXP
; EnableUser
; Executable = test.exe
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableExeConstant