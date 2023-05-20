; Triangle translated passing a uniform matrix 4x4

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

UseModule gl ; to get autocompletion in the IDE

Define Title$ = "Triangle translated passing a uniform matrix 4x4"

#VSYNC = 1

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure
 
Global gShader, gVao
 
Procedure Render (win)
 Protected w, h
 Protected u_matrix
 
 ; For now the matrix is built manually, also is instructive :)
 ; Please note the matrix is visualized transposed in the source, since the first 4 floats of the first column
 ; are sequential in memory, hence you see them horizontally in the data section
 
 ; The OpenGL matrix would look like this:
 ; X   Y   Z   W
 ; 1.0 0.0 0.0 0.5
 ; 0.0 1.0 0.0 0.0
 ; 0.0 0.0 1.0 0.0
 ; 0.0 0.0 0.0 0.0
 
 Protected *mat4x4 = sgl::StartData()
  Data.f 1.0, 0.0, 0.0, 0.0 ; X
  Data.f 0.0, 1.0, 0.0, 0.0 ; Y
  Data.f 0.0, 0.0, 1.0, 0.0 ; Z
  Data.f 0.5, 0.0, 0.0, 1.0 ; T
  ;       ^--------------- ; The 0.5 here is in the translation row, first position, so translates along the X
 sgl::StopData()

 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 sgl::BindShaderProgram(gShader)
 
 u_matrix = sgl::GetUniformLocation(gShader, "u_matrix")
 
 sgl::SetUniformMatrix4x4(u_matrix, *mat4x4)
 
 ; this bring in all the settings for the VBO and the specs of its attributes in one shot   
 glBindVertexArray_(gVao) 
 
 glDrawArrays_(#GL_TRIANGLES, 0, 3)    
EndProcedure

Procedure SetupShaders() 
 Protected vboPos, vboCol 
 
 ; attribute 0
 Protected *vertexPos = sgl::StartData()
  Data.f  -0.5,-0.5, 0.0 ; triangle CCW
  Data.f   0.5,-0.5, 0.0 
  Data.f   0.0, 0.5, 0.0
 sgl::StopData()

; attribute 1
 Protected *vertexCol = sgl::StartData()
  Data.f   1.0, 0.0, 0.0 ; R
  Data.f   0.0, 1.0, 0.0 ; G
  Data.f   0.0, 0.0, 1.0 ; B
 sgl::StopData()
 
 ; vertex array object
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 glGenBuffers_(1, @vboPos) ; vbo for the positions
 glBindBuffer_(#GL_ARRAY_BUFFER, vboPos)
 ; 6 vertices made by 3 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 3 * 3 * SizeOf(Float), *vertexPos, #GL_STATIC_DRAW)
 glEnableVertexAttribArray_(0)
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 0, 0)

 glGenBuffers_(1, @vboCol) ; vbo for the colors
 glBindBuffer_(#GL_ARRAY_BUFFER, vboCol)
 ; 6 vertices made by 3 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 3 * 3 * SizeOf(Float), *vertexCol, #GL_STATIC_DRAW)
 glEnableVertexAttribArray_(1)
 glVertexAttribPointer_(1, 3, #GL_FLOAT, #GL_FALSE, 0, 0)
  
 glBindVertexArray_(0) ; we are done for now
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("023.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
  
 fs = sgl::CompileShaderFromFile("023.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
EndProcedure


Define win

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()        
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 3)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 3)
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_CORE)
    
    sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
            
    win = sgl::CreateWindow(640, 480, Title$)
    
    If win                
        sgl::MakeContextCurrent(win)        
        
        glLoad::Load()
        
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf   
             
        sgl::EnableVSYNC(#VSYNC)
                    
        SetupShaders()
        
        While sgl::WindowShouldClose(win) = 0
            Render(win)  
            sgl::SwapBuffers(win)
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 106
; FirstLine = 99
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory