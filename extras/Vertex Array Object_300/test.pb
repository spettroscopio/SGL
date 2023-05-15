; Vertex Array Object wrapper test

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "Vertex Array Object.pb"

UseModule gl 

Define Title$ = "Vertex Array Object wrapper test"

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

Global shader, vao
 
Procedure Render (win)
 Protected w, h
 Protected uColor, vc.vec4::vec4
 Static nextStep, timer
 
 If timer = 0
    timer = sgl::CreateTimer()
 EndIf
 
 glClearColor_(0.25,0.25,0.5,1.0)
 glClear_(#GL_COLOR_BUFFER_BIT)
 
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 glViewport_(0, 0, w, h)
 
 BindVertexArray(vao)
 
 sgl::BindShaderProgram(shader)
 
 uColor = sgl::GetUniformLocation(shader, "uColor")
 
 Select nextStep
    Case 0
        vc\float[0] = 1.0
        vc\float[1] = 0.0
        vc\float[2] = 0.0
        vc\float[3] = 1.0        
    Case 1
        vc\float[0] = 0.0
        vc\float[1] = 1.0
        vc\float[2] = 0.0
        vc\float[3] = 1.0        
    Case 2
        vc\float[0] = 0.0
        vc\float[1] = 0.0
        vc\float[2] = 1.0
        vc\float[3] = 1.0        
 EndSelect 
 
 sgl::SetUniformVec4(uColor, @vc)
 
 glDrawElements_(#GL_TRIANGLES, 6, #GL_UNSIGNED_INT, 0)
 
 If sgl::GetElapsedTime(timer) > 0.5
    sgl::ResetTimer(timer)
    nextStep = math::Cycle(nextStep + 1, 0, 2)
 EndIf
EndProcedure

Procedure SetupShaders() 
 Protected vertex$, fragment$
 Protected vbo, ibo
 Protected vbl.VertexBufferLayout 
 
 Protected *vertexPos = sgl::StartData()  
  Data.f  -0.5,-0.5, 0.0 ; 0
  Data.f   0.5,-0.5, 0.0 ; 1
  Data.f   0.5, 0.5, 0.0 ; 2 
  Data.f  -0.5, 0.5, 0.0 ; 3     
 sgl::StopData()

 Protected *indices = sgl::StartData()
  Data.l 0, 1, 2, 2, 3, 0
 sgl::StopData()

 vertex$ = "#version 330 core" + #CRLF$ 
 vertex$ + "layout (location = 0) in vec4 position;" + #CRLF$
 vertex$ + "void main () {" + #CRLF$
 vertex$ + " gl_Position = position;" + #CRLF$
 vertex$ + "}" + #CRLF$
  
 fragment$ = "#version 330 core" + #CRLF$ 
 fragment$ + "out vec4 fragColor;" + #CRLF$ 
 fragment$ + "uniform vec4 uColor;" + #CRLF$ 
 fragment$ + "void main () {" + #CRLF$
 fragment$ + " fragColor = vec4 (uColor);" + #CRLF$
 fragment$ + "}" 

 ; vertex array
 vao = CreateVertexArray()
 
 ; 4 vertices made of 3 floats each
 vbo = CreateVertexBuffer(*vertexPos, 4 * 3 * SizeOf(Float))
 
 ; define layout 
 VertexBufferAttribute(vbo, 3, #GL_FLOAT) 
 
 ; associate the layout to the current bound vao
 BindVertexBufferLayout(vbo)
 
 ; 6 indices made of longs ... this will be also associated to the vao
 ibo = CreateIndexBuffer(*indices, 6)
 
 BindVertexArray(0)
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 
 fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 
 shader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(shader)
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

        sgl::LoadExtensionsStrings()
                
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf   
            
        SetupShaders()
        
        sgl::EnableVSYNC(1)
        
        While sgl::WindowShouldClose(win) = 0
            Render(win)  
            sgl::SwapBuffers(win)
            sgl::PollEvents()
        Wend    
    EndIf    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 126
; FirstLine = 118
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory