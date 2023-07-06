; Batch Renderer for Quads using normal textures (#GL_TEXTURE_2D).

EnableExplicit

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

DeclareModule BatchRenderer
EnableExplicit

Structure Stats
 bufferSizeInQuads.i
 bufferSizeInBytes.i
 totalQuadsDrawn.i 
 drawCalls.i
EndStructure

Declare     GetStats (*stats.Stats)
Declare     ResetStats()
Declare.i   Init (NumberOfQuads)
Declare     Destroy()
Declare     StartRenderer (width, height)
Declare     StartBatch()
Declare     StopBatch()
Declare     Flush()
Declare     DrawQuad (x, y, w, h, *color.vec4::vec4, texture = 0)
Declare     DrawQuadAtlas (x, y, w, h, *color.vec4::vec4, texture, *texCoord.vec2::vec2)

EndDeclareModule

Module BatchRenderer
UseModule dbg

UseModule gl

Global vao, vbo, ibo, shader

Structure QuadVertex
 xPos.f ; pos x
 yPos.f ; pos y
 xTex.f ; tex coord x
 yTex.f ; tex coord y
 color.vec4::vec4  ; vertex color
 texture.f ; texture ID
EndStructure

Structure QuadObject
 v1.QuadVertex
 v2.QuadVertex
 v3.QuadVertex
 v4.QuadVertex
EndStructure

Structure QuadIndices
 index.l[6]
EndStructure

Structure BATCH
 init.i
  
 bufferSizeInQuads.i
 bufferSizeInBytes.i
 drawCalls.i
 totalQuadsDrawn.i 
 
 storedQuads.i
 storedTextures.i

 maxTextureUnits.i
 Array Units.l(0)
 Array Textures.i(0)
 
 *DataBuffer.QuadObject
 *DataPointer.QuadObject
 
 *IndexBuffer.QuadIndices
 *IndexPointer.QuadIndices
EndStructure : Global BATCH.BATCH

Procedure init_textures_cache()
 Protected i
 
 glGetIntegerv_(#GL_MAX_TEXTURE_IMAGE_UNITS, @BATCH\maxTextureUnits)
 
 BATCH\maxTextureUnits = math::Clamp3i(BATCH\maxTextureUnits, 0, 32) ; max 32 texture units supported
 
 Dim BATCH\Units(BATCH\maxTextureUnits - 1)
 Dim BATCH\Textures(BATCH\maxTextureUnits - 1)

 For i = 0 To BATCH\maxTextureUnits - 1
    BATCH\Units(i) = i
    BATCH\Textures(i) = 0
 Next  
 
 ; creates a 1 x 1 white texture
 
 Protected pixels.l = $FFFFFFFF ; white, full alpha
 Protected texture
 
 glGenTextures_(1, @texture)
 glBindTexture_(#GL_TEXTURE_2D, texture)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
 
 glTexImage2D_(#GL_TEXTURE_2D, 0, #GL_RGBA8, 1, 1, 0, #GL_RGBA, #GL_UNSIGNED_BYTE, @pixels) 
 
 BATCH\Textures(0) = texture

 BATCH\storedTextures = 1
EndProcedure

Procedure.i add_texture_to_cache (unit, texture) 
 BATCH\Textures(unit) = texture ; stores the texture id in the specified texture unit 
 BATCH\storedTextures + 1 ; one more texture unit is in use now
 ProcedureReturn unit
EndProcedure

Procedure.i check_if_texture_cached (texture)
 Protected i
  
 For i = 0 To BATCH\storedTextures - 1 ; looping is ok, 32 items top
    If BATCH\Textures(i) = texture
        ProcedureReturn i ; already there, return the index of the associated texture unit
    EndIf
 Next
 
 ProcedureReturn 0 ; not there (0 is reserved for the white 1 x 1 texture)
EndProcedure

Procedure.i check_if_flushing_required (texture)
 Protected unit 
 
 ; checks if the texture units are all used up
 
 If texture <> 0 
    unit = check_if_texture_cached (texture)
    
    If unit = 0 ; the texture is not in cache
        If BATCH\storedTextures = BATCH\maxTextureUnits ; if no space left
            StopBatch()
            Flush()
            StartBatch()            
            
            ; the first unit available is 1 at the start of a new batch
            unit = add_texture_to_cache (1, texture) 
        Else
            ; we simply add the texture to the cache
            unit = add_texture_to_cache (BATCH\storedTextures, texture)            
        EndIf                
    EndIf    
 EndIf
 
 ; checks if the space for quads in the allocated buffer it's all used up
  
 If BATCH\storedQuads >= BATCH\bufferSizeInQuads
    StopBatch()
    Flush()
    StartBatch()
    
    If texture <> 0
        ; the first unit available is 1 at the start of a new batch
        unit = add_texture_to_cache (1, texture) 
    EndIf
 EndIf

 ProcedureReturn unit
EndProcedure

Procedure bind_textures()
 Protected i
 Protected u_texUnits 
 
 u_texUnits = sgl::GetUniformLocation(shader, "u_texUnits")
 ASSERT(u_texUnits <> -1) 
 
 For i = 0 To BATCH\storedTextures - 1
    glActiveTexture_(#GL_TEXTURE0 + i)
    glBindTexture_(#GL_TEXTURE_2D, BATCH\Textures(i))
 Next
 
 sgl::SetUniformLongs(u_texUnits, BATCH\Units(), BATCH\storedTextures)
EndProcedure

Procedure GetStats (*stats.Stats)
 *stats\bufferSizeInQuads =  BATCH\bufferSizeInQuads
 *stats\bufferSizeInBytes = BATCH\bufferSizeInBytes
 *stats\totalQuadsDrawn = BATCH\totalQuadsDrawn
 *stats\drawCalls = BATCH\drawCalls
EndProcedure

Procedure ResetStats()
 BATCH\drawCalls = 0
 BATCH\totalQuadsDrawn = 0
EndProcedure

Procedure.i Init (NumberOfQuads)
 Protected vertex$, fragment$
 
 If NumberOfQuads <= 0
    ProcedureReturn 0
 EndIf
 
 If BATCH\init
    ProcedureReturn 0
 EndIf
  
 init_textures_cache()
 
 BATCH\DataBuffer = AllocateMemory(NumberOfQuads * SizeOf(QuadObject))
 
 If (BATCH\DataBuffer = 0) : Goto exit : EndIf
 
 BATCH\IndexBuffer = AllocateMemory(NumberOfQuads * SizeOf(QuadIndices))
 
 If (BATCH\IndexBuffer = 0) : Goto exit :  EndIf

 BATCH\bufferSizeInQuads = NumberOfQuads
 
 BATCH\bufferSizeInBytes = SizeOf(QuadObject) * BATCH\bufferSizeInQuads + SizeOf(QuadIndices) * BATCH\bufferSizeInQuads

 BATCH\DataPointer = BATCH\DataBuffer
 
 BATCH\IndexPointer = BATCH\IndexBuffer

 vertex$ = PeekS(?vertex, ?vertex_end - ?vertex, #PB_UTF8)
 
 If BATCH\maxTextureUnits < 32     
    fragment$ = PeekS(?fragment_16, ?fragment_16_end - ?fragment_16, #PB_UTF8)
 Else
    fragment$ = PeekS(?fragment_32, ?fragment_32_end - ?fragment_32, #PB_UTF8)
 EndIf

 Protected objects.sgl::ShaderObjects
 Protected vs, fs
     
 vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) 
 ASSERT(vs)
 
 sgl::AddShaderObject(@objects, vs) 
 
 fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) 
 ASSERT(fs)
 
 sgl::AddShaderObject(@objects, fs) 
     
 shader = sgl::BuildShaderProgram(@objects)
 ASSERT(shader)
  
 ; vertex array
 glGenVertexArrays_(1, @vao)    

 ; vertex buffer
 glGenBuffers_(1, @vbo)

 ; index buffer
 glGenBuffers_(1, @ibo)
 
 glBindVertexArray_(vao)
    
 ; vertex buffer
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 glBufferData_(#GL_ARRAY_BUFFER, SizeOf(QuadObject) * BATCH\bufferSizeInQuads, #Null, #GL_DYNAMIC_DRAW)
    
 glEnableVertexAttribArray_(0) ; position
 glVertexAttribPointer_(0, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), 0)
 
 glEnableVertexAttribArray_(1) ; tex coords
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), OffsetOf(QuadVertex\xTex))

 glEnableVertexAttribArray_(2) ; color
 glVertexAttribPointer_(2, 4, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), OffsetOf(QuadVertex\color))

 glEnableVertexAttribArray_(3) ; tex unit
 glVertexAttribPointer_(3, 1, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), OffsetOf(QuadVertex\texture))
 
 ; index buffer   
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 Protected i
 
 For i = 0 To BATCH\bufferSizeInQuads - 1
    BATCH\IndexPointer\index[0] = 0 + (i * 4)
    BATCH\IndexPointer\index[1] = 1 + (i * 4)
    BATCH\IndexPointer\index[2] = 2 + (i * 4)
    BATCH\IndexPointer\index[3] = 2 + (i * 4)
    BATCH\IndexPointer\index[4] = 3 + (i * 4)
    BATCH\IndexPointer\index[5] = 0 + (i * 4)
    
    BATCH\IndexPointer + SizeOf(QuadIndices)
 Next
    
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, SizeOf(QuadIndices) * BATCH\bufferSizeInQuads, BATCH\IndexBuffer, #GL_DYNAMIC_DRAW)   
 
 BATCH\init = 1
 
 ProcedureReturn 1
 
 exit:
  
 If (BATCH\DataBuffer) : FreeMemory(BATCH\DataBuffer) : EndIf
 If (BATCH\IndexBuffer) : FreeMemory(BATCH\IndexBuffer) : EndIf 
 
 ProcedureReturn 0
EndProcedure

Procedure Destroy()
 glBindVertexArray_(0)
 glBindBuffer_(#GL_ARRAY_BUFFER, 0)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, 0)
 sgl::DestroyShaderProgram (shader)
 FreeMemory(BATCH\DataBuffer)  
 FreeMemory(BATCH\IndexBuffer)  
EndProcedure

Procedure StartRenderer (width, height)
 Protected u_projection
 Protected projection.m4x4::m4x4
 
 m4x4::Ortho(projection, 0, width, height, 0, 0.0, 100.0)
 
 sgl::BindShaderProgram(shader)
   
 u_projection = sgl::GetUniformLocation(shader, "u_projection")    
 ASSERT(u_projection <> -1)
 
 sgl::SetUniformMatrix4x4(u_projection, @projection) 
 
 ResetStats()
EndProcedure

Procedure StartBatch()
 BATCH\DataPointer = BATCH\DataBuffer
 BATCH\storedTextures = 1
 BATCH\storedQuads = 0
EndProcedure

Procedure StopBatch()
 ; send data to the GPU
 glBindVertexArray_(vao)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo) 
 glBufferSubData_(#GL_ARRAY_BUFFER, 0, SizeOf(QuadObject) * BATCH\storedQuads, BATCH\DataBuffer) 
EndProcedure

Procedure Flush()   
 glBindVertexArray_(vao) 
 
 glEnable_(#GL_BLEND)
 glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA)
 
 bind_textures() ; bind the cached textures
 
 glDrawElements_(#GL_TRIANGLES, 6 * BATCH\storedQuads, #GL_UNSIGNED_INT, 0) 

 glDisable_(#GL_BLEND)
   
 ; update stats  
 BATCH\totalQuadsDrawn + BATCH\storedQuads
 BATCH\drawCalls + 1
EndProcedure

Procedure DrawQuad (x, y, w, h, *color.vec4::vec4, texture = 0)
 Protected unit
 
 unit = check_if_flushing_required (texture)
    
 BATCH\DataPointer\v1\xPos = x
 BATCH\DataPointer\v1\yPos = y + h
 BATCH\DataPointer\v1\xTex = 0.0
 BATCH\DataPointer\v1\yTex = 0.0
 BATCH\DataPointer\v1\color\x = *color\x
 BATCH\DataPointer\v1\color\y = *color\y
 BATCH\DataPointer\v1\color\z = *color\z
 BATCH\DataPointer\v1\color\w = *color\w
 BATCH\DataPointer\v1\texture = unit

 BATCH\DataPointer\v2\xPos = x + w
 BATCH\DataPointer\v2\yPos = y + h
 BATCH\DataPointer\v2\xTex = 1.0
 BATCH\DataPointer\v2\yTex = 0.0
 BATCH\DataPointer\v2\color\x = *color\x
 BATCH\DataPointer\v2\color\y = *color\y
 BATCH\DataPointer\v2\color\z = *color\z
 BATCH\DataPointer\v2\color\w = *color\w
 BATCH\DataPointer\v2\texture = unit

 BATCH\DataPointer\v3\xPos = x + w
 BATCH\DataPointer\v3\yPos = y
 BATCH\DataPointer\v3\xTex = 1.0
 BATCH\DataPointer\v3\yTex = 1.0
 BATCH\DataPointer\v3\color\x = *color\x
 BATCH\DataPointer\v3\color\y = *color\y
 BATCH\DataPointer\v3\color\z = *color\z
 BATCH\DataPointer\v3\color\w = *color\w
 BATCH\DataPointer\v3\texture = unit
 
 BATCH\DataPointer\v4\xPos = x
 BATCH\DataPointer\v4\yPos = y
 BATCH\DataPointer\v4\xTex = 0.0
 BATCH\DataPointer\v4\yTex = 1.0
 BATCH\DataPointer\v4\color\x = *color\x
 BATCH\DataPointer\v4\color\y = *color\y
 BATCH\DataPointer\v4\color\z = *color\z
 BATCH\DataPointer\v4\color\w = *color\w
 BATCH\DataPointer\v4\texture = unit
 
 BATCH\DataPointer + SizeOf(QuadObject)
    
 BATCH\storedQuads + 1
EndProcedure


Procedure DrawQuadAtlas (x, y, w, h, *color.vec4::vec4, texture, *texCoord.vec2::vec2)
 Protected unit
 
 unit = check_if_flushing_required (texture)
    
 BATCH\DataPointer\v1\xPos = x
 BATCH\DataPointer\v1\yPos = y + h
 BATCH\DataPointer\v1\xTex = *texCoord\x
 BATCH\DataPointer\v1\yTex = *texCoord\y
 BATCH\DataPointer\v1\color\x = *color\x
 BATCH\DataPointer\v1\color\y = *color\y
 BATCH\DataPointer\v1\color\z = *color\z
 BATCH\DataPointer\v1\color\w = *color\w
 BATCH\DataPointer\v1\texture = unit

 *texCoord + SizeOf(vec2::vec2)

 BATCH\DataPointer\v2\xPos = x + w
 BATCH\DataPointer\v2\yPos = y + h
 BATCH\DataPointer\v2\xTex = *texCoord\x
 BATCH\DataPointer\v2\yTex = *texCoord\y
 BATCH\DataPointer\v2\color\x = *color\x
 BATCH\DataPointer\v2\color\y = *color\y
 BATCH\DataPointer\v2\color\z = *color\z
 BATCH\DataPointer\v2\color\w = *color\w
 BATCH\DataPointer\v2\texture = unit

 *texCoord + SizeOf(vec2::vec2)
 
 BATCH\DataPointer\v3\xPos = x + w
 BATCH\DataPointer\v3\yPos = y 
 BATCH\DataPointer\v3\xTex = *texCoord\x
 BATCH\DataPointer\v3\yTex = *texCoord\y
 BATCH\DataPointer\v3\color\x = *color\x
 BATCH\DataPointer\v3\color\y = *color\y
 BATCH\DataPointer\v3\color\z = *color\z
 BATCH\DataPointer\v3\color\w = *color\w
 BATCH\DataPointer\v3\texture = unit
 
 *texCoord + SizeOf(vec2::vec2)
 
 BATCH\DataPointer\v4\xPos = x
 BATCH\DataPointer\v4\yPos = y 
 BATCH\DataPointer\v4\xTex = *texCoord\x
 BATCH\DataPointer\v4\yTex = *texCoord\y
 BATCH\DataPointer\v4\color\x = *color\x
 BATCH\DataPointer\v4\color\y = *color\y
 BATCH\DataPointer\v4\color\z = *color\z
 BATCH\DataPointer\v4\color\w = *color\w
 BATCH\DataPointer\v4\texture = unit
 
 BATCH\DataPointer + SizeOf(QuadObject)
    
 BATCH\storedQuads + 1
EndProcedure

DataSection
vertex: : IncludeBinary "batch.vs" : vertex_end:
EndDataSection

DataSection
fragment_16: : IncludeBinary "batch_16.fs" : fragment_16_end:
EndDataSection

DataSection
fragment_32: : IncludeBinary "batch_32.fs" : fragment_32_end:
EndDataSection

EndModule




; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; Folding = ----
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier