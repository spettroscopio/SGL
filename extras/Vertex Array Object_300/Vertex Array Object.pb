; An include to simplify and wrap Vertex Array Object used in conjunction of Vertex Buffers and Index Buffers.

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"


DeclareModule VAO
EnableExplicit

UseModule gl
UseModule dbg

Declare     GetHandle (obj)
Declare.i   CreateVao()
Declare     BindVao (vao)
Declare     DestroyVao (vao)
Declare.i   CreateVbo (*buffer, size, hint = #GL_STATIC_DRAW)
Declare     BindVbo (vbo)
Declare     DestroyVbo(vbo)
Declare.i   Attribute (vbo, count, type)
Declare     SetLayout (vbo)
Declare.i   CreateIbo (*indices, count, hint = #GL_STATIC_DRAW)
Declare     BindIbo (ibo)
Declare     DestroyIbo (ibo)

EndDeclareModule

Module VAO

#SIG_VAO = $88888801
#SIG_VBO = $7f7f7f02
#SIG_IBO = $5A5A5A03

Structure LayoutAttribute
 count.i
 type.i ; #GL_UNSIGNED_INT, #GL_FLOAT
EndStructure

Structure Layout
 items.i
 stride.i
 Array attributes.LayoutAttribute(0)
EndStructure

Structure obj
 signature.l
EndStructure

Structure VAO Extends obj
 handle.i ; OpenGL handle 
EndStructure

Structure VBO Extends obj
 handle.i ; OpenGL handle 
 layout.Layout
EndStructure

Structure IBO Extends obj
 handle.i ; OpenGL handle 
EndStructure

Procedure GetHandle (obj)
 Protected *obj.obj = obj

 If *obj\signature = #SIG_VAO
    Protected *vao.VAO = *obj
    ProcedureReturn *vao\handle
 EndIf
 
 If *obj\signature = #SIG_VBO
    Protected *vbo.VBO = *obj
    ProcedureReturn *vbo\handle
 EndIf
 
 If *obj\signature = #SIG_IBO
    Protected *ibo.IBO = *obj
    ProcedureReturn *ibo\handle
 EndIf

 ProcedureReturn 0
EndProcedure


;- vertex array

Procedure.i CreateVao()
 Protected *vao.VAO = AllocateStructure(VAO)
 
 If *vao
    *vao\signature = #SIG_VAO    
    glGenVertexArrays_(1, @*vao\handle)
    glBindVertexArray_(*vao\handle)
 EndIf
 ProcedureReturn *vao
EndProcedure

Procedure BindVao (vao)
 Protected *vao.VAO = vao
 
 If *vao ; 0 to unbind
    ASSERT(*vao\signature = #SIG_VAO)   
    glBindVertexArray_(*vao\handle)
 Else
    glBindVertexArray_(0)
 EndIf
EndProcedure

Procedure DestroyVao (vao)
 Protected *vao.VAO = vao
 ASSERT(*vao\signature = #SIG_VAO)
 
 glDeleteVertexArrays_(1, @*vao\handle)
 FreeStructure(*vao)
EndProcedure

;- vertex buffer

Procedure.i CreateVbo (*buffer, size, hint = #GL_STATIC_DRAW)
 Protected *vbo.VBO = AllocateStructure(VBO)
 
 If *vbo
    *vbo\signature = #SIG_VBO   
    glGenBuffers_(1, @*vbo\handle)
    glBindBuffer_(#GL_ARRAY_BUFFER, *vbo\handle)     
    glBufferData_(#GL_ARRAY_BUFFER, size, *buffer, hint)
 EndIf
 ProcedureReturn *vbo
EndProcedure

Procedure BindVbo (vbo)
 Protected *vbo.VBO = vbo
 
 If *vbo ; 0 to unbind
    ASSERT(*vbo\signature = #SIG_VBO)
    glBindBuffer_(#GL_ARRAY_BUFFER, *vbo\handle)
 Else
    glBindBuffer_(#GL_ARRAY_BUFFER, 0)
 EndIf
EndProcedure

Procedure DestroyVbo(vbo)
 Protected *vbo.VBO = vbo
 ASSERT(*vbo\signature = #SIG_VBO)
 
 glDeleteBuffers_(1, @*vbo\handle)
 FreeStructure(*vbo)
EndProcedure

Procedure.i Attribute (vbo, count, type)
 Protected *vbo.VBO = vbo
 ASSERT(*vbo\signature = #SIG_VBO)
 
 Protected i, dataTypeSize
 
 ASSERT(type = #GL_UNSIGNED_INT Or type = #GL_FLOAT)
 
 *vbo\layout\items + 1
 
 i = *vbo\layout\items - 1

 ReDim *vbo\layout\attributes(i)
 
 Select type
    Case #GL_UNSIGNED_INT
        dataTypeSize = SizeOf(Long)            
    Case #GL_FLOAT
        dataTypeSize = SizeOf(Float)
 EndSelect

 *vbo\layout\attributes(i)\count = count
 *vbo\layout\attributes(i)\type = type
 
 *vbo\layout\stride + count * dataTypeSize
 
 ProcedureReturn i
EndProcedure

Procedure SetLayout (vbo)
 Protected *vbo.VBO = vbo
 ASSERT(*vbo\signature = #SIG_VBO)
 
 Protected i, count, type, stride, offset, dataTypeSize
   
 stride = *vbo\layout\stride
 
 For i = 0 To *vbo\layout\items - 1
    count = *vbo\layout\attributes(i)\count
    type = *vbo\layout\attributes(i)\type   
  
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

Procedure.i CreateIbo (*indices, count, hint = #GL_STATIC_DRAW)
 Protected *ibo.IBO = AllocateStructure(IBO)
 
 If *ibo
    *ibo\signature = #SIG_IBO
     glGenBuffers_(1, @*ibo\handle)
     glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, *ibo\handle)
     glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, count * SizeOf(Long), *indices, hint)
 EndIf
 ProcedureReturn *ibo
EndProcedure

Procedure BindIbo (ibo)
 Protected *ibo.IBO = ibo
 
 If *ibo ; 0 to unbind
    ASSERT(*ibo\signature = #SIG_IBO)
    glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, *ibo\handle)
 Else
    glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, 0)
 EndIf
EndProcedure

Procedure DestroyIbo (ibo)
 Protected *ibo.IBO = ibo
 ASSERT(*ibo\signature = #SIG_IBO)   
 
 glDeleteBuffers_(1, @*ibo\handle)
 FreeStructure(*ibo)
EndProcedure

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 25
; Folding = ----
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory