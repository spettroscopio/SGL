; An include to simplify and wrap Vertex Array Object used in conjunction of Vertex Buffers and Index Buffers.

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

EnableExplicit

Structure VertexBufferLayoutAttribute
 count.i
 type.i ; #GL_UNSIGNED_INT, #GL_FLOAT
EndStructure

Structure VertexBufferLayout
 items.i
 stride.i
 Array attributes.VertexBufferLayoutAttribute(0)
EndStructure

Structure VertexBuffer
 vbo.i ; OpenGL handle 
 vbl.VertexBufferLayout
EndStructure

Structure IndexBuffer
 ibo.i ; OpenGL handle 
EndStructure

Structure VertexArray
 vao.i ; OpenGL handle 
EndStructure

;- vertex array

Procedure.i CreateVertexArray()
 Protected *vao.VertexArray = AllocateStructure(VertexArray)
 If *vao
     glGenVertexArrays_(1, @*vao\vao)
     glBindVertexArray_(*vao\vao)
 EndIf
 ProcedureReturn *vao
EndProcedure

Procedure BindVertexArray (*vao.VertexArray)
 If *vao
    glBindVertexArray_(*vao\vao)
 Else
    glBindVertexArray_(0)
 EndIf
EndProcedure

Procedure DestroyVertexArray (*vao.VertexArray)
 glDeleteVertexArrays_(1, @*vao\vao)
 FreeStructure(*vao)
EndProcedure

;- vertex buffer

Procedure.i CreateVertexBuffer (*buffer, size, hint = #GL_STATIC_DRAW)
 Protected *vbo.VertexBuffer = AllocateStructure(VertexBuffer)
 If *vbo
     glGenBuffers_(1, @*vbo\vbo)
     glBindBuffer_(#GL_ARRAY_BUFFER, *vbo\vbo)     
     glBufferData_(#GL_ARRAY_BUFFER, size, *buffer, hint)
 EndIf
 ProcedureReturn *vbo
EndProcedure

Procedure DestroyVertexBuffer (*vbo.VertexBuffer) 
 glDeleteBuffers_(1, @*vbo\vbo)
 FreeStructure(*vbo)
EndProcedure

Procedure BindVertexBuffer (*vbo.VertexBuffer)
 If *vbo
    glBindBuffer_(#GL_ARRAY_BUFFER, *vbo\vbo)
 Else
    glBindBuffer_(#GL_ARRAY_BUFFER, 0)
 EndIf
EndProcedure

Procedure.i VertexBufferAttribute (*vbo.VertexBuffer, count, type)
 Protected i, dataTypeSize
 
 ASSERT(type = #GL_UNSIGNED_INT Or type = #GL_FLOAT)
 
 *vbo\vbl\items + 1
 
 i = *vbo\vbl\items - 1

 ReDim *vbo\vbl\attributes(i)
 
 Select type
    Case #GL_UNSIGNED_INT
        dataTypeSize = SizeOf(Long)            
    Case #GL_FLOAT
        dataTypeSize = SizeOf(Float)
 EndSelect

 *vbo\vbl\attributes(i)\count = count
 *vbo\vbl\attributes(i)\type = type
 
 *vbo\vbl\stride + count * dataTypeSize
 
 ProcedureReturn i
EndProcedure

Procedure BindVertexBufferLayout (*vbo.VertexBuffer)
 Protected i, count, type, stride, offset, dataTypeSize
   
 stride = *vbo\vbl\stride
 
 For i = 0 To *vbo\vbl\items - 1
    count = *vbo\vbl\attributes(i)\count
    type = *vbo\vbl\attributes(i)\type   
  
    ASSERT(type = #GL_UNSIGNED_INT Or type = #GL_FLOAT)  
    
    Select type
        Case #GL_UNSIGNED_INT
            dataTypeSize = SizeOf(Long)            
        Case #GL_FLOAT
            dataTypeSize = SizeOf(Float)
    EndSelect
    
    glVertexAttribPointer_(i, count, type, #GL_FALSE, stride, offset)
    glEnableVertexAttribArray_(i)
    
    offset + count * dataTypeSize
 Next 
EndProcedure

;- index buffer

Procedure.i CreateIndexBuffer (*indices, count, hint = #GL_STATIC_DRAW)
 Protected *ibo.IndexBuffer = AllocateStructure(IndexBuffer)
 If *ibo
     glGenBuffers_(1, @*ibo\ibo)
     glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, *ibo\ibo)
     glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, count * SizeOf(Long), *indices, hint)
 EndIf
 ProcedureReturn *ibo
EndProcedure

Procedure DestroyIndexBuffer (*ibo.IndexBuffer)
 glDeleteBuffers_(1, @*ibo\ibo)
 FreeStructure(*ibo)
EndProcedure

Procedure BindIndexBuffer (*ibo.IndexBuffer)
 If *ibo
    glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, *ibo\ibo)
 Else
    glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, 0)
 EndIf
EndProcedure

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 1
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory