; This example draw two triangles to render a quad, not duplicating vertices.
; This may seem irrelevant here, but with a complex model made my many triangles, where multiple triangles are sharing vertices, 
; and where vertices contains not only coordinates but normals, textures coordinates, etc. the space wasted become important.

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

UseModule gl ; to get autocompletion in the IDE

Define Title$ = "Draw two triangles using indices."

#VSYNC = 1

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

Global gShader, gVao
 
Procedure Render (win)
 Protected w, h
 
 glClearColor_(0.1,0.1,0.25,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 sgl::BindShaderProgram(gShader)
 
 ; this bring in all the settings for the VBO and the specs of its attributes in one shot   
 ; and now even the index buffer !
 glBindVertexArray_(gVao)
 
 glDrawElements_(#GL_TRIANGLES, 6, #GL_UNSIGNED_INT, 0) 
    
EndProcedure

Procedure SetupShaders() 
 Protected vertex$, fragment$ 
 Protected vbo, ibo, vs, fs

;  Protected *vertexPos = sgl::StartData()
;   Data.f  -0.5,-0.5, 0.0 
;   Data.f   0.5,-0.5, 0.0 
;   Data.f   0.5, 0.5, 0.0 
;   Data.f   0.5, 0.5, 0.0 
;   Data.f  -0.5, 0.5, 0.0 
;   Data.f  -0.5,-0.5, 0.0
;  sgl::StopData()
 
 ; compact version of the above with the duplicated vertices removed 
 Protected *vertexPos = sgl::StartData()
  Data.f  -0.5,-0.5, 0.0 ; 0
  Data.f   0.5,-0.5, 0.0 ; 1
  Data.f   0.5, 0.5, 0.0 ; 2 
  Data.f  -0.5, 0.5, 0.0 ; 3
 sgl::StopData()

 ; using indices we can reuse the same vertices multiple times !
 Protected *indices = sgl::StartData()
  Data.l 0, 1, 2, 2, 3, 0
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

 ; vertex array
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 ; vertex buffer
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 ; 4 vertices made by 3 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 4 * 3 * SizeOf(Float), *vertexPos, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0)
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 0, 0)

; index buffer
 glGenBuffers_(1, @ibo)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 ; 6 indices made by 1 long each
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 6 * SizeOf(Long), *indices, #GL_STATIC_DRAW)
 
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
            sgl::SwapBuffers(win)
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 108
; FirstLine = 99
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory