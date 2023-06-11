; A simple include to render text in OpenGL 3.30, built around the SGL functions CreateBitmapFontData() and CreateTexelData().
; This satisfy the immediate urge of putting some text on the screen while still learning OpenGL.
; Supports Unicode too.

; This implementation batches the characters of the text$ parameter and send them with one drawing call instead of one per char.
; This gives a big improvememt, and it may possible to squeeze some more speed by using a full batch renderer and draw all
; the strings in every frame with just one drawing call, at that point the code become CPU limited.

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

DeclareModule RenderText
EnableExplicit

Structure BMFont
 *bmf.sgl::BitmapFontData   
 texture.i 
 textureWidth.i
 textureHeight.i
EndStructure

Declare.i   FindGlyph (*fon.BMFont, charCode)
Declare.i   GetTextWidth (*fon.BMFont, text$)
Declare.i   GetFontHeight (*fon.BMFont)
Declare     Render (win, *fon.BMFont, text$, x, y, *color.vec3::vec3)
Declare     DestroyBitmapFont (*fon.BMFont)
Declare.i   BuildBitmapFont (*bmf.sgl::BitmapFontData)
Declare.i   LoadBitmapFont (file$)
Declare.i   CreateBitmapFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width, height)

EndDeclareModule

Module RenderText

UseModule dbg

UseModule gl

Structure QuadVertex
 x.f
 y.f
 s.f
 t.f
EndStructure
  
Structure QuadIndices
 index.l[6]
EndStructure
 
Procedure.i FindGlyph (*fon.BMFont, charCode)   
 Protected *glyph
 
 If sbbt::Search(*fon\bmf\glyphs, charCode, @*glyph) 
    ProcedureReturn *glyph ; the glyph structure for the desired char
 EndIf
 
 ProcedureReturn @*fon\bmf\block
EndProcedure
 
Procedure.i GetTextWidth (*fon.BMFont, text$)
 Protected i, c$, len, width
 Protected *glyph.sgl::GlyphData
 
 len = Len(text$)
 
 For i = 1 To len
    c$ = Mid(text$, i, 1)
    *glyph = FindGlyph (*fon, Asc(c$))
    If *glyph
        width + *glyph\w + *glyph\xOffset
    EndIf
 Next
 
 ProcedureReturn width
EndProcedure

Procedure.i GetFontHeight (*fon.BMFont)
 ProcedureReturn *fon\bmf\yOffset
EndProcedure

Procedure Render (win, *fon.BMFont, text$, x, y, *color.vec3::vec3)
 Protected *c.Character, *cursorVertex.QuadVertex, *cursorIndices.QuadIndices
 Protected w, h, i, charsCount = Len(text$)
 Protected vertex$, fragment$
 Protected.m4x4::m4x4 projection
  
 Static vao, vbo, ibo
 Static shader, u_texture, u_color, u_projection
 Static *vertices, *indices, storageCount
 
 Static firstRun = 1
 
 If firstRun
    ; only the first time
    
    firstRun = 0

    vertex$ = PeekS(?vertex, ?vertex_end - ?vertex, #PB_UTF8)
    
    fragment$ = PeekS(?fragment, ?fragment_end - ?fragment, #PB_UTF8)
        
    ; vertex array
    glGenVertexArrays_(1, @vao)    
    
    ; vertex buffer
    glGenBuffers_(1, @vbo)
    
    ; index buffer
    glGenBuffers_(1, @ibo)
    
    Protected objects.sgl::ShaderObjects
    Protected vs, fs
     
    vs = sgl::CompileShader(vertex$, #GL_VERTEX_SHADER) 
    sgl::AddShaderObject(@objects, vs) 
     
    fs = sgl::CompileShader(fragment$, #GL_FRAGMENT_SHADER) 
    sgl::AddShaderObject(@objects, fs) 
     
    shader = sgl::BuildShaderProgram(@objects)
    ASSERT(shader)
    
    u_texture = sgl::GetUniformLocation(shader, "u_texture")    
    ASSERT(u_texture <> -1)
    
    u_color = sgl::GetUniformLocation(shader, "u_color")    
    ASSERT(u_color <> -1)
  
    u_projection = sgl::GetUniformLocation(shader, "u_projection")    
    ASSERT(u_projection <> -1)
 EndIf
    
 sgl::GetWindowFrameBufferSize (win, @w, @h)
 
 If charsCount > storageCount
    ; only when reallocation is required
    
    If storageCount
        ; reallocate until the largest string is found        
        FreeMemory(*vertices)
        FreeMemory(*indices)
    EndIf
    
    ; after a few calls the buffer will grow to the largest string used and then it will remain constant.
    *vertices = AllocateMemory(charsCount * 4 * SizeOf(QuadVertex))
    *indices = AllocateMemory(charsCount * SizeOf(QuadIndices))
    storageCount = charsCount
    
    glBindVertexArray_(vao)
    
    ; vertex buffer
    glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
    
    ; 4 QuadVertex * charsCount    
    glBufferData_(#GL_ARRAY_BUFFER, charsCount * 4 * SizeOf(QuadVertex), #Null, #GL_DYNAMIC_DRAW)
    
    glEnableVertexAttribArray_(0) ; point coords
    glVertexAttribPointer_(0, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), 0)
 
    glEnableVertexAttribArray_(1) ; texture coords
    glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, SizeOf(QuadVertex), OffsetOf(QuadVertex\s))
    
    ; generates indices
    glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
    
    *cursorIndices = *indices
    
    For i = 0 To charsCount - 1
        *cursorIndices\index[0] = 0 + (i * 4)
        *cursorIndices\index[1] = 1 + (i * 4)
        *cursorIndices\index[2] = 2 + (i * 4)
        *cursorIndices\index[3] = 2 + (i * 4)
        *cursorIndices\index[4] = 3 + (i * 4)
        *cursorIndices\index[5] = 0 + (i * 4)
        *cursorIndices + SizeOf(QuadIndices)
    Next
    
    ; 1 QuadIndices * charsCount
    glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, charsCount * SizeOf(QuadIndices), *indices, #GL_DYNAMIC_DRAW)
 EndIf
  
 m4x4::Ortho(projection, 0, w, 0, h, 0.0, 100.0)
 
 sgl::BindShaderProgram(shader)
 
 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, *fon\texture) ; select the bitmap font texture
  
 sgl::SetUniformLong(u_texture, 0) ; 0 is the texture unit 
 
 sgl::SetUniform4Floats(u_color, *color\x, *color\y, *color\z, 1.0)
 
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 *c = @text$
 
 *cursorVertex = *vertices
 
 While *c\c 
    Protected *glyph.sgl::GlyphData
    Protected xc, yc, wc, hc
    
    *glyph = FindGlyph(*fon, *c\c)
        
    ; char position and size inside the texture
    xc = *glyph\x
    yc = *glyph\y
    wc = *glyph\w
    hc = *glyph\h
    
    Protected xf.f, yf.f, wf.f, hf.f
    
    ; char texture data selection inside the texture
    xf = 1.0 / (*fon\textureWidth / xc)
    yf = 1.0 - 1.0 / (*fon\textureHeight / yc)
    wf = 1.0 / (*fon\TextureWidth / (xc + wc))
    hf = 1.0 - 1.0 / (*fon\TextureHeight / (yc + hc))
    
    ; these are the four vertices of the quad
         
    *cursorVertex\x = x  ; screen coordinates for the text
    *cursorVertex\y = y
    *cursorVertex\s = xf ; texture coordinates to sample the required glyph
    *cursorVertex\t = hf    
    *cursorVertex + SizeOf(QuadVertex)
    
    *cursorVertex\x = x + wc
    *cursorVertex\y = y
    *cursorVertex\s = wf
    *cursorVertex\t = hf
    *cursorVertex + SizeOf(QuadVertex)
    
    *cursorVertex\x = x + wc
    *cursorVertex\y = y + hc
    *cursorVertex\s = wf
    *cursorVertex\t = yf
    *cursorVertex + SizeOf(QuadVertex)
    
    *cursorVertex\x = x
    *cursorVertex\y = y + hc
    *cursorVertex\s = xf
    *cursorVertex\t = yf
    *cursorVertex + SizeOf(QuadVertex)
        
    x + *glyph\w + *glyph\xOffset
      
    *c + SizeOf(Character)
 Wend
  
 ; now the whole string vertex data is available and ready to be sent to the GPU
  
 glBindVertexArray_(vao)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 glBufferSubData_(#GL_ARRAY_BUFFER, 0, charsCount * 4 * SizeOf(QuadVertex), *vertices)

 glEnable_(#GL_BLEND)
 glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA) 
  
 ; draw the whole string in one shot
     
 glDrawElements_(#GL_TRIANGLES, charsCount * 6, #GL_UNSIGNED_INT, 0) 
 
 glDisable_(#GL_BLEND)
EndProcedure

Procedure DestroyBitmapFont (*fon.BMFont)
 glDeleteTextures_(1, @*fon\texture)
 sgl::DestroyBitmapFontData(*fon\bmf)
 FreeStructure(*fon)
EndProcedure

Procedure.i BuildBitmapFont (*bmf.sgl::BitmapFontData)
 Protected *td.sgl::TexelData
 Protected *fon.BMFont
 Protected texture
 
 If (*bmf = 0) : Goto exit: EndIf
 
 *td = sgl::CreateTexelData(*bmf\image)
 
 If (*td = 0) : Goto exit: EndIf
 
 *fon = AllocateStructure(BMFont)

 If (*fon = 0) : Goto exit: EndIf
 
 glGenTextures_(1, @texture)
 glBindTexture_(#GL_TEXTURE_2D, texture)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR_MIPMAP_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
 
 glTexImage2D_(#GL_TEXTURE_2D, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)
 glGenerateMipmap_(#GL_TEXTURE_2D)
 
 *fon\bmf = *bmf
 *fon\texture = texture
 *fon\textureWidth = *td\imageWidth
 *fon\textureHeight = *td\imageHeight
   
 sgl::DestroyTexelData(*td)
 
 ProcedureReturn *fon
 
 exit:
 
 If *td : sgl::DestroyTexelData(*td) : EndIf
 
 If *fon : FreeStructure(*fon) : EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i LoadBitmapFont (file$) 
 Protected *bmf.sgl::BitmapFontData = sgl::LoadBitmapFontData(file$)

 ProcedureReturn BuildBitmapFont(*bmf)
EndProcedure

Procedure.i CreateBitmapFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width, height)
 Protected *bmf.sgl::BitmapFontData = sgl::CreateBitmapFontData(fontName$, fontSize, fontFlags, ranges(), width, height)

 ProcedureReturn BuildBitmapFont(*bmf)
EndProcedure

DataSection
vertex: : IncludeBinary "rt.vs" : vertex_end:
EndDataSection

DataSection
fragment: : IncludeBinary "rt.fs" : fragment_end:
EndDataSection

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 253
; FirstLine = 227
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; DisableDebugger
; CompileSourceDirectory