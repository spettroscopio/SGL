; This is a variant of the RenderText for OpenGL 3.30 but modified to use our batch renderer for quads.

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

XIncludeFile "../Batch/BatchRenderer.pb"

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
Declare.i   CreateBitmapFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width = 0, height = 0)

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
 Protected *c.Character
 Protected qcolor.vec4::vec4
 Protected Dim texCood.vec2::vec2(3)
 
 qcolor\x = *color\x
 qcolor\y = *color\y
 qcolor\z = *color\z
 qcolor\w = 1.0     
   
 *c = @text$

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
                
    ; texture coordinates to sample the required glyph
    texCood(0)\x = xf 
    texCood(0)\y = hf    
    texCood(1)\x = wf
    texCood(1)\y = hf    
    texCood(2)\x = wf
    texCood(2)\y = yf    
    texCood(3)\x = xf
    texCood(3)\y = yf
        
    BatchRenderer::DrawQuadAtlas(x, y, wc, hc, qcolor, *fon\texture, texCood()) 
    
    x + *glyph\w + *glyph\xOffset
      
    *c + SizeOf(Character)
 Wend
  
 ; now the whole string vertex data is available and ready to be sent to the GPU
  
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

Procedure.i CreateBitmapFont (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width = 0, height = 0)
 Protected *bmf.sgl::BitmapFontData = sgl::CreateBitmapFontData(fontName$, fontSize, fontFlags, ranges(), width, height)

 ProcedureReturn BuildBitmapFont(*bmf)
EndProcedure

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 122
; FirstLine = 87
; Folding = ---
; EnableXP
; EnableUser
; CPU = 1
; DisableDebugger
; CompileSourceDirectory