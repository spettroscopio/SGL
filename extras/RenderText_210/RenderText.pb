; A simple include to render text in legacy OpenGL, built around the SGL functions CreateBitmapFontData() and CreateTexelData().
; This satisfy the immediate urge of putting some text on the screen while still learning OpenGL.
; Supports Unicode too.

; This just uses immediate mode even if vertex buffer are available even in OpenGL 2.10, you can see the impact of using them
; in the implementation for OpenGL 3.30

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

XIncludeFile "../../inc/vec3.pb"

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

UseModule gl

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
 Protected width, height

 sgl::GetWindowFrameBufferSize (win, @width, @height)
 
 glMatrixMode_(#GL_MODELVIEW) 
 glLoadIdentity_() 
 glPushMatrix_() 
 
 glMatrixMode_(#GL_PROJECTION) 
 glPushMatrix_() 
 glLoadIdentity_()  
 glOrtho_(0, width, 0, height, 0.0, 100.0) 
   
 glPushAttrib_(#GL_ENABLE_BIT)
 
 glDisable_(#GL_DEPTH_TEST)
 
 glTranslatef_ (x, y, 0) ; put the text at those coordinates
 glColor3f_(*color\x, *color\y, *color\z) ; set the color for all the following vertices
 
 glEnable_(#GL_TEXTURE_2D)
 glBindTexture_(#GL_TEXTURE_2D, *fon\texture) ; select the bitmap font texture
  
 glEnable_(#GL_BLEND)
 glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA)  
 
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
     
    glBegin_(#GL_QUADS)
     glTexCoord2f_(xf, hf) ; bottom left
     glVertex2i_(0, 0)
     glTexCoord2f_(wf, hf) ; bottom right
     glVertex2i_(wc, 0)
     glTexCoord2f_(wf, yf) ; top right
     glVertex2i_(wc, hc)
     glTexCoord2f_(xf, yf) ; top left
     glVertex2i_(0, hc)
    glEnd_()           

    glTranslatef_ (*glyph\w + *glyph\xOffset, 0.0, 0.0)
 
    *c + SizeOf(Character)
 Wend
  
 glPopAttrib_() 
 
 glMatrixMode_(#GL_PROJECTION) 
 glPopMatrix_()
 
 glMatrixMode_(#GL_MODELVIEW)  
 glPopMatrix_()

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
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP) 
 
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
; IDE Options = PureBasic 6.03 beta 1 LTS (Windows - x86)
; CursorPosition = 22
; Folding = --
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory