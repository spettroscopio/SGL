; This example draw two triangles to render a quad.
; The problem with this approach is vertices are repeated in the memory buffer.
; We store 6 verticies when we would need only 4. 
; We could simply use them repeatedly to draw the two triangles.
; The next example solve this problem using indices.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

UseModule gl ; to get autocompletion in the IDE

Define Title$ = "Draw two triangles (VBO + VAO)"

#VSYNC = 1

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

Global gShader, gVao, gWireframe
 
Procedure Render (win)
 Protected w, h
 
 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 If gWireframe
    glPolygonMode_(#GL_FRONT_AND_BACK, #GL_LINE)
 Else
    glPolygonMode_(#GL_FRONT_AND_BACK, #GL_FILL)
 EndIf
 
 glViewport_(0, 0, w, h)
 
 sgl::BindShaderProgram(gShader)
 
 ; this bring in all the settings for the VBO and the specs of its attributes in one shot   
 glBindVertexArray_(gVao) 
 
 glDrawArrays_(#GL_TRIANGLES, 0, 6)    
EndProcedure

Procedure SetupShaders() 
 Protected vertex$, fragment$ 
 Protected vbo, vs, fs
 
 ; some of the vertices are shared, would be nice if it was possible to reuse them insted of duplicating them
 
 Protected *vertexPos = sgl::StartData()
  Data.f  -0.5,-0.5, 0.0 ; triangle 1
  Data.f   0.5,-0.5, 0.0 
  Data.f   0.5, 0.5, 0.0
  Data.f   0.5, 0.5, 0.0 ; triangle 2
  Data.f  -0.5, 0.5, 0.0
  Data.f  -0.5,-0.5, 0.0
 sgl::StopData()

 vertex$ = "#version 330 core" + #CRLF$ 
 vertex$ + "layout (location = 0) in vec4 position;" + #CRLF$
 vertex$ + "void main () {" + #CRLF$
 vertex$ + " gl_Position = position;" + #CRLF$
 vertex$ + "}"
 
 fragment$ = "#version 330 core" + #CRLF$ 
 fragment$ + "out vec4 fragColor;" + #CRLF$ 
 fragment$ + "void main () {" + #CRLF$
 fragment$ + " fragColor = vec4 (0.2, 0.2, 1.0, 1.0);" + #CRLF$
 fragment$ + "}" 

 ; vertex array object
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 ; vertex buffer object
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 ; 6 vertices made by 3 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 6 * 3 * SizeOf(Float), *vertexPos, #GL_STATIC_DRAW)
 
 ; associates the currently bound VBO to the VAO 
 glEnableVertexAttribArray_(0)
 ; each attribute (vertex positions) is 3 floats
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 0, 0)

 Protected objects.sgl::ShaderObjects
 
 vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 
 fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 
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
            
            If sgl::GetKeyPress(sgl::#key_W) ; toggle wireframe on/off to see the two triangles
                gWireframe ! 1
            EndIf
                
            sgl::SwapBuffers(win)
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 133
; FirstLine = 95
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory