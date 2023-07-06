; Example of a very simple IMGUI using the Quads Batch Renderer
; I've implemented some of the widgets I felt were most needed, but more or less anything can be added as required, spending enough time on it :)

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

; Batch Renderer (Array Texture version)
XIncludeFile "../Batch_ AT/BatchRenderer.pb"

DeclareModule imgui
EnableExplicit

Macro ID()
 MacroExpandedCount
EndMacro

#Bytes  = 1
#Floats = 2

Declare     Init (fontPath$, fontSize = 9)
Declare     Shutdown()
Declare     NewFrame (win)
Declare     SetX (x)
Declare     SetY (y)
Declare     AddY (pixels)
Declare     NewLine (pixels = 0)
Declare     SetMask (mask$)
Declare     SetDecimals (decimals)
Declare     SetPos (x, y)
Declare     SetBackgroundPos (x, y)
Declare     Background (id, text$, w, h, *color.vec4::vec4)
Declare.i   GuiButton (id, text$, w = 0)
Declare     Text (id, text$)
Declare.i   Button (id, text$, w = 0, h = 0)
Declare     SliderFloat (id, *float.Float, min.f, max.f, w = 0, h = 0)
Declare     SliderInt (id, *int.Integer, min, max, w = 0, h = 0)
Declare.s   SliderEnum (id, *item.Integer, enum$, w = 0, h = 0)
Declare.i   CheckBox (id, *flag.Integer, text$)
Declare     SliderRGB (id, *color.vec4::vec4, mode = #Bytes, w = 0, h = 0)

EndDeclareModule

Module imgui

UseModule gl
UseModule DBG

#IMGUI_ADVANCE_X_MIN = 5
#IMGUI_MARGINS_VERT_MIN = 2
#IMGUI_MARGINS_HORZ_MIN = 8
#IMGUI_BUTTON_MARGINS_HORZ_MIN = 12
#IMGUI_NEWLINE_MIN = 6
  
Structure UI_context 
 win.i ; SGL win
 winWidth.i ; win width
 winHeight.i ; win height 
 
 fon.i ; BMF font used
 fonHeight.i ; height of font

 cursorX.i ; last mouse pos
 cursorY.i ; last mouse pos
 
 backGroundID.i ; used the fake a window container 
 backgroundX.i ; start X position for the background quad
 backgroundY.i ; start Y 
 backgroundRelativeClickX.i ; X offset from the start to the titlebar clicked point
 backgroundRelativeClickY.i ; Y offset 
 
 startPosX.i ; start X position for a new frame
 startPosY.i ; start Y 
 currPosX.i ; next widget X starting position for the current frame
 currPosY.i ; next widget Y
 
 baseX.i ; base X starting position to restore currPosX value after consecutive same line widgets are drawn
 lastLineMaxY.i ; the max Y value reached while rendering the last line
 currLineOffsY.i ; the Y offset used for the next widget while rendering the current line
 
 hot.i ; id of the hot widget if any
 active.i ; id of the active widget if any
 
 showThumb.i ; used to hide the thumbs for example in the SliderRGB
 mask$ ; sprintf mask used by the widgets who follow to format the data
 decimals.i ; number of decimals used by the widgets who follow
 
 thumbWidth.i ; thumb cursor width
 checkBoxWidth.i ; checkmark box width
EndStructure : Global UIC.UI_context

Structure BMFont
 *bmf.sgl::BitmapFontData   
 texture.i 
 textureWidth.i
 textureHeight.i
EndStructure

Global.vec4::vec4 widgetStdColor, widgetHotColor, widgetActiveColor
Global.vec4::vec4 txtColor
Global.vec4::vec4 thumbColor

vec4::Set(widgetStdColor, 0.14, 0.20, 0.30, 1.0)
vec4::Set(widgetHotColor, 0.15, 0.29, 0.45, 1.0)
vec4::Set(widgetActiveColor, 0.20, 0.38, 0.60, 1.0)
vec4::Set(thumbColor, 0.24, 0.52, 0.88, 1.0)
vec4::Set(txtColor, 1.0, 1.0, 1.0, 1.0)

;- Private

Procedure.i find_glyph (*fon.BMFont, charCode)   
 Protected *glyph
 
 If sbbt::Search(*fon\bmf\glyphs, charCode, @*glyph) 
    ProcedureReturn *glyph ; the glyph structure for the desired char
 EndIf
 
 ProcedureReturn @*fon\bmf\block
EndProcedure

Procedure.i get_text_width (*fon.BMFont, text$)
 Protected width
 Protected *glyph.sgl::GlyphData
 Protected *p.Unicode
 
 *p = @text$
 
 While *p\u     
    *glyph = find_glyph(*fon, *p\u)
    If *glyph
        width + *glyph\w + *glyph\xOffset
    EndIf
    *p + SizeOf(Unicode)
 Wend
 
 ProcedureReturn width
EndProcedure
 
Procedure.i get_font_height (*fon.BMFont)
 ProcedureReturn *fon\bmf\yOffset
EndProcedure

Procedure draw_text (win, *fon.BMFont, text$, x, y, *color.vec4::vec4)
 Protected *c.Character
 Protected Dim texCood.vec2::vec2(3)
   
 *c = @text$

 While *c\c 
    Protected *glyph.sgl::GlyphData
    Protected xc, yc, wc, hc
    
    *glyph = find_glyph(*fon, *c\c)
        
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
        
    BatchRenderer::DrawQuadAtlas(x, y, wc, hc, *color, *fon\texture, texCood()) 
    
    x + *glyph\w + *glyph\xOffset
      
    *c + SizeOf(Character)
 Wend
EndProcedure

Procedure destroy_bitmap_font (*fon.BMFont)
 glDeleteTextures_(1, @*fon\texture)
 sgl::DestroyBitmapFontData(*fon\bmf)
 FreeStructure(*fon)
EndProcedure

Procedure.i build_bitmap_font (*bmf.sgl::BitmapFontData)
 Protected *td.sgl::TexelData
 Protected *fon.BMFont
 Protected texture
 
 If (*bmf = 0) : Goto exit: EndIf
 
 *td = sgl::CreateTexelData(*bmf\image)
 
 If (*td = 0) : Goto exit: EndIf
 
 *fon = AllocateStructure(BMFont)

 If (*fon = 0) : Goto exit: EndIf
 
 glGenTextures_(1, @texture)
 glBindTexture_(#GL_TEXTURE_2D_ARRAY, texture)
 
 ; this define how many layers (subtextures) will be present in the Array Texture
 ; the third "1" after the width x height dimensions is used in this case
 
 glTexImage3D_(#GL_TEXTURE_2D_ARRAY, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 1, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 

 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR_MIPMAP_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D_ARRAY, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)

 glGenerateMipmap_(#GL_TEXTURE_2D_ARRAY)
 
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

Procedure.i load_bitmap_font (file$) 
 Protected *bmf.sgl::BitmapFontData = sgl::LoadBitmapFontData(file$)
 ProcedureReturn build_bitmap_font(*bmf)
EndProcedure

Procedure.i create_bitmap_font (fontName$, fontSize, fontFlags,  Array ranges.sgl::BitmapFontRange(1), width = 0, height = 0)
 Protected *bmf.sgl::BitmapFontData = sgl::CreateBitmapFontData(fontName$, fontSize, fontFlags, ranges(), width, height)
 ProcedureReturn build_bitmap_font(*bmf)
EndProcedure

Procedure set_active (id)
 If UIC\active = 0
     If UIC\hot = id
        UIC\active = id
     EndIf
 EndIf
EndProcedure

Procedure set_inactive (id)
 UIC\active = 0
EndProcedure

Procedure set_hot (id)
 If UIC\active = 0
     If UIC\hot = 0 
        UIC\hot = id
     EndIf
 EndIf
EndProcedure

Procedure set_cold (id)
 If UIC\hot = id
    UIC\hot = 0
 EndIf
EndProcedure
 
Procedure.i active (id)
 If id = UIC\active
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure.i hot (id)  
 If id = UIC\hot
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure.i hover (x, y, w, h)
 If UIC\cursorX > x And UIC\cursorX < x + w And UIC\cursorY > y And UIC\cursorY < y + h
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure set_advance_x (x)
 UIC\currPosX + x
EndProcedure

Procedure set_advance_y (y)
 If y > UIC\lastLineMaxY
    UIC\lastLineMaxY = y 
 EndIf  
EndProcedure

Procedure.s apply_mask (s$)
 If UIC\mask$
    ProcedureReturn str::Sprintf(UIC\mask$, @s$)
 EndIf
 ProcedureReturn s$
EndProcedure

;- Public 

Procedure Init (fontPath$, fontSize = 9)
 Dim ranges.sgl::BitmapFontRange(0)
 
 Select fontSize
    Case 8, 9, 10, 12, 14
        UIC\fon = load_bitmap_font(fontPath$ + "consolas-" + Str(fontSize) + ".zip")
    Default
        UIC\fon = load_bitmap_font(fontPath$ + "consolas-9.zip")
 EndSelect
 
 ASSERT(UIC\fon)
 
 UIC\fonHeight = get_font_height(UIC\fon)
 UIC\thumbWidth = get_text_width(UIC\fon, "M") * 1.1
 UIC\checkBoxWidth = UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN
EndProcedure

Procedure Shutdown()
 destroy_bitmap_font(UIC\fon)
EndProcedure
 
Procedure NewFrame (win)
 UIC\win  = win
 ASSERT (UIC\win)
   
 sgl::GetWindowFrameBufferSize(UIC\win, @UIC\winWidth, @UIC\winHeight)

 sgl::GetCursorPos(UIC\win, @UIC\cursorX, @UIC\cursorY)
 
 UIC\currPosX = UIC\startPosX
 UIC\currPosY = UIC\startPosY
 
 UIC\mask$ = "" 
 UIC\decimals = 3
 UIC\showThumb = 1
EndProcedure 

Procedure SetX (x)
 UIC\currPosX = x
EndProcedure 

Procedure SetY (y)
 UIC\currPosX = y
EndProcedure 

Procedure AddY (pixels)
 UIC\currLineOffsY = pixels
EndProcedure 

Procedure NewLine (pixels = 0)
 UIC\currPosX = UIC\baseX
 UIC\currPosY + UIC\lastLineMaxY + pixels + #IMGUI_NEWLINE_MIN
 UIC\lastLineMaxY = 0
 UIC\currLineOffsY = 0
 UIC\mask$ = ""
 UIC\decimals = 3
 UIC\showThumb = 1
EndProcedure 

Procedure SetMask (mask$)
 ; value reset to empty after a NewLine()
 UIC\mask$ = mask$
EndProcedure

Procedure SetDecimals (decimals)
 ; value reset to 3 after a NewLine()
 UIC\decimals = decimals
EndProcedure

Procedure SetPos (x, y)
 UIC\startPosX = x
 UIC\startPosY = Y
 UIC\currPosX = x
 UIC\currPosY = y
 UIC\baseX = x
EndProcedure

Procedure SetBackgroundPos (x, y)
 UIC\backgroundX = x
 UIC\backgroundY = y
EndProcedure

Procedure Background (id, text$, w, h, *color.vec4::vec4) 
 UIC\backGroundID = id
 
 Protected x, y
 Protected xt, yt, wt, ht
 Protected.vec4::vec4 color
 
 x = UIC\backgroundX
 y = UIC\backgroundY
 
 xt = UIC\backGroundX
 yt = UIC\backGroundY - UIC\fonHeight - 2
 wt = w
 ht = UIC\fonHeight + 2
 
 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        set_inactive (id)
    Else
        SetBackgroundPos(UIC\cursorX - UIC\backgroundRelativeClickX, UIC\cursorY - UIC\backgroundRelativeClickY)
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED                
        UIC\backgroundRelativeClickX = UIC\cursorX - x
        UIC\backgroundRelativeClickY = UIC\cursorY - y
        set_active (id)
    EndIf
 EndIf
 
 If hover (xt, yt, wt, ht)   
    set_hot (id)    
 Else
    set_cold (id)
 EndIf

 If active(id)    
    vec4::Copy(widgetActiveColor, color)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, color)
 Else
    vec4::Copy(widgetStdColor, color)     
 EndIf
    
 ; draw title bar
 BatchRenderer::DrawQuad (xt, yt, wt, ht, color)
 ; draw title
 draw_text(UIC\win, UIC\fon, text$, UIC\backGroundX + 2, UIC\backGroundY - UIC\fonHeight + 1, txtColor)
 ; draw background area
 BatchRenderer::DrawQuad (UIC\backGroundX, UIC\backGroundY, w, h, *color)
EndProcedure

Procedure.i GuiButton (id, text$, w = 0)
 Protected x, y, h
 Protected.vec4::vec4 color
 Protected ret = #False
 Protected text_width = get_text_width(UIC\fon, text$)
  
 ; check if w is wide enough  
 w = std::IIF(Bool(text_width + #IMGUI_MARGINS_HORZ_MIN > w), text_width + #IMGUI_MARGINS_HORZ_MIN, w)
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN > h), UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN, h) 
 
 x = UIC\winWidth - w - 2
 
 y = 2
 
 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        If hot(id) 
            ret = #True
        EndIf
        set_inactive (id)
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w, h)   
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, color)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, color)
 Else
    vec4::Copy(widgetStdColor, color)
 EndIf
   
 ; draw button
 BatchRenderer::DrawQuad (x-1, y-1, w+2, h+2, widgetActiveColor)
 BatchRenderer::DrawQuad (x, y, w, h, color)
 
 ; center text
 Protected xc, yc
 
 xc = x + (w - text_width) / 2
 yc = y + (h - UIC\fonHeight) / 2
 
 ; draw label
 draw_text(UIC\win, UIC\fon, text$, xc, yc, txtColor)
  
 ProcedureReturn ret
EndProcedure

Procedure Text (id, text$)
 Protected x, y, h
 Protected w = get_text_width(UIC\fon, text$)
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0)
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY
 h = UIC\fonHeight
 
 ; draw text
 draw_text(UIC\win, UIC\fon, text$, x, y, txtColor) 
 
 set_advance_x (w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure

Procedure.i Button (id, text$, w = 0, h = 0)
 Protected x, y
 Protected.vec4::vec4 color
 Protected text_width = get_text_width(UIC\fon, text$)
 Protected ret = #False

 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY
  
 ; check if w is wide enough  
 w = std::IIF(Bool(text_width + #IMGUI_BUTTON_MARGINS_HORZ_MIN > w), text_width + #IMGUI_BUTTON_MARGINS_HORZ_MIN, w)
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN > h), UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN, h) 
 
 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        If hot(id) 
            ret = #True
        EndIf
        set_inactive (id)
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w, h)   
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, color)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, color)
 Else
    vec4::Copy(widgetStdColor, color)     
 EndIf
   
 ; draw button
 BatchRenderer::DrawQuad (x, y, w, h, color)
 
 ; center text
 Protected xc, yc
 
 xc = x + (w - text_width) / 2
 yc = y + (h - UIC\fonHeight) / 2
 
 ; draw label
 draw_text(UIC\win, UIC\fon, text$, xc, yc, txtColor)
 
 set_advance_x (w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
   
 ProcedureReturn ret
 EndProcedure

Procedure SliderFloat (id, *float.Float, min.f, max.f, w = 0, h = 0)
 Protected x, y 
 Protected.vec4::vec4 widgetColor
 Protected float.f = *float\f
 Protected float$ = StrF(float, UIC\decimals)
 Protected float_width = get_text_width(UIC\fon, apply_mask(float$))
 
 ASSERT(float >= min And float <= max)
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY

  ; check if w is wide enough  
 w = std::IIF(Bool(float_width + #IMGUI_MARGINS_HORZ_MIN > w), float_width + #IMGUI_MARGINS_HORZ_MIN, w)
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN > h), UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN, h) 

 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        set_inactive (id)
    EndIf
        
    Protected xClickPosition = math::Clamp3i(UIC\cursorX - x, 0, w)  
    
    If xClickPosition >= w
        float = max
    ElseIf xClickPosition <= 0
        float = min
    Else
        float = math::MapToRange5f(xClickPosition, 0, w, min, max)
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w, h)   
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, widgetColor)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, widgetColor)
 Else
    vec4::Copy(widgetStdColor, widgetColor)     
 EndIf
 
 float$ = apply_mask(StrF(float, UIC\decimals))
 float_width = get_text_width(UIC\fon, float$) 
 
 Protected xCenterThumb = math::MapToRange5f(float, min, max, 0 + UIC\thumbWidth / 2, w - UIC\thumbWidth / 2)
 
 Protected xc, yc 
 xc = x + (w - float_width) / 2
 yc = y + (h - UIC\fonHeight) / 2  
 
 ; draw slider
 BatchRenderer::DrawQuad (x, y, w, h, widgetColor)
 
 ; draw thumb
 If UIC\showThumb
    BatchRenderer::DrawQuad (x + xCenterThumb - UIC\thumbWidth / 2, y, UIC\thumbWidth, h, thumbColor) 
 EndIf 
 
 ; draw float value
 draw_text(UIC\win, UIC\fon, float$, xc, yc, txtColor)
 
 *float\f = float
 
 set_advance_x(w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure 

Procedure SliderInt (id, *int.Integer, min, max, w = 0, h = 0)
 Protected x, y 
 Protected.vec4::vec4 widgetColor
 Protected int = *int\i
 Protected int$ = Str(int)
 Protected int_width = get_text_width(UIC\fon, apply_mask(Str(int)))
 
 ASSERT(int >= min And int <= max)
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY

  ; check if w is wide enough  
 w = std::IIF(Bool(int_width + #IMGUI_MARGINS_HORZ_MIN > w), int_width + #IMGUI_MARGINS_HORZ_MIN, w)
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN > h), UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN, h) 

 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        set_inactive (id)
    EndIf
        
    Protected xClickPosition = math::Clamp3i(UIC\cursorX - x, 0, w)  
    
    If xClickPosition >= w
        int = max
    ElseIf xClickPosition <= 0
        int = min
    Else
        int = math::Nearest(math::MapToRange5f(xClickPosition, 0, w, min, max))
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w, h)   
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, widgetColor)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, widgetColor)
 Else
    vec4::Copy(widgetStdColor, widgetColor)     
 EndIf
 
 int$ = apply_mask(Str(int))
 int_width = get_text_width(UIC\fon, int$)
 
 Protected xCenterThumb = math::MapToRange5i(int, min, max, 0 + UIC\thumbWidth / 2, w - UIC\thumbWidth / 2)
 
 Protected xc, yc 
 xc = x + (w - int_width) / 2
 yc = y + (h - UIC\fonHeight) / 2  
 
 ; draw slider
 BatchRenderer::DrawQuad (x, y, w, h, widgetColor)
 
 ; draw thumb
 If UIC\showThumb
    BatchRenderer::DrawQuad (x + xCenterThumb - UIC\thumbWidth / 2, y, UIC\thumbWidth, h, thumbColor) 
 EndIf
 
 ; draw int value
 draw_text(UIC\win, UIC\fon, int$, xc, yc, txtColor)
  
 *int\i = int
 
 set_advance_x(w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure 

Procedure.s SliderEnum (id, *item.Integer, enum$, w = 0, h = 0)
 Protected x, y 
 Protected.vec4::vec4 widgetColor
 Protected item$, Dim items$(0)   
 Protected item = *item\i ; 0-based
 Protected items = str::SplitToArray(enum$, ",", items$())
 Protected width, max_width, item_width, widest_item, i
 
 ASSERT(item >=0 And item < items)
 
 For i = 0 To items - 1
    width = get_text_width(UIC\fon, items$(i))
    If width > max_width
        max_width = width
        widest_item = i
    EndIf
 Next
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY

 ; check if w is wide enough  
 w = std::IIF(Bool(max_width + #IMGUI_MARGINS_HORZ_MIN > w), max_width + #IMGUI_MARGINS_HORZ_MIN, w)
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN > h), UIC\fonHeight + #IMGUI_MARGINS_VERT_MIN, h) 
 
 
 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        set_inactive (id)
    EndIf
        
    Protected xClickPosition = math::Clamp3i(UIC\cursorX - x, 0, w)  
    
    If xClickPosition >= w
        item = items - 1
    ElseIf xClickPosition <= 0
        item = 0
    Else
        item = math::Nearest(math::MapToRange5f(xClickPosition, 0, w, 0, items - 1))        
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w, h)   
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, widgetColor)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, widgetColor)
 Else
    vec4::Copy(widgetStdColor, widgetColor)     
 EndIf
  
 item$ = items$(item)
 item_width = get_text_width(UIC\fon, item$)
  
 Protected xCenterThumb = math::MapToRange5i(item, 0, items - 1, 0 + UIC\thumbWidth / 2, w - UIC\thumbWidth / 2)
  
 Protected xc, yc 
 xc = x + (w - item_width) / 2
 yc = y + (h - UIC\fonHeight) / 2  

 ; draw slider
 BatchRenderer::DrawQuad (x, y, w, h, widgetColor)
 ; draw thumb
 BatchRenderer::DrawQuad (x + xCenterThumb - UIC\thumbWidth / 2, y, UIC\thumbWidth, h, thumbColor) 
 ; draw enumn value
 draw_text(UIC\win, UIC\fon, item$, xc, yc, txtColor)
 
 ; draw label
 ;draw_text(UIC\win, UIC\fon, text$, x + w + #IMGUI_MARGINS_HORZ_MIN / 2, y + #IMGUI_MARGINS_VERT_MIN / 2, txtColor)
  
 *item\i = item
 
 set_advance_x(w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure 

Procedure.i CheckBox (id, *flag.Integer, text$)
 Protected x, y, w, h
 Protected.vec4::vec4 widgetColor
 Protected text_width = get_text_width(UIC\fon, text$)
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY

 w = UIC\checkBoxWidth
 h = UIC\checkBoxWidth
 
 ; check if h is tall enough  
 h = std::IIF(Bool(UIC\checkBoxWidth > h), UIC\checkBoxWidth, h) 

 If active(id)
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#RELEASED
        set_inactive (id)

        If *flag\i
            *flag\i = 0
        Else
            *flag\i = 1
        EndIf        
    EndIf
 Else
    If sgl::GetMouseButton(UIC\win, sgl::#MOUSE_BUTTON_LEFT) = sgl::#PRESSED
        set_active (id)
    EndIf
 EndIf
 
 If hover (x, y, w + #IMGUI_MARGINS_HORZ_MIN + text_width, h)
    set_hot (id)
 Else
    set_cold (id)
 EndIf
 
 If active(id)    
    vec4::Copy(widgetActiveColor, widgetColor)
 ElseIf hot(id)
    vec4::Copy(widgetHotColor, widgetColor)
 Else
    vec4::Copy(widgetStdColor, widgetColor)     
 EndIf
 
 Protected xc, yc, mw, mh
 mw = UIC\checkBoxWidth / 3
 mh = mw
 xc = x + mw
 yc = y + mh
 
 ; draw checkbox
 BatchRenderer::DrawQuad (x, y, w, h, widgetColor)
 
 ;draw marker
 If *flag\i
    BatchRenderer::DrawQuad (xc, yc, w - mw * 2, h - mh * 2, thumbColor)
 EndIf
 
 ; draw label
 draw_text(UIC\win, UIC\fon, text$, x + w + #IMGUI_MARGINS_HORZ_MIN, y + #IMGUI_MARGINS_VERT_MIN / 2, txtColor)
 
 set_advance_x(w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure 

Procedure SliderRGB (id, *color.vec4::vec4, mode = #Bytes, w = 0, h = 0)
 Protected x, y 
 Protected.vec4::vec4 widgetColor
 Protected.vec4::vec4 color
 
 Protected r, g, b 
 Protected.f rf, gf, bf
 
 ASSERT(mode = #Bytes Or mode = #Floats)

 vec4::Copy(*color, color)
 
 Protected rgb_width = get_text_width(UIC\fon, "R:0.00") + #IMGUI_MARGINS_HORZ_MIN
 
 rgb_width = std::IIF(Bool(rgb_width > w), rgb_width, w)
 
 w = UIC\checkBoxWidth
 h = UIC\checkBoxWidth
 
 UIC\showThumb = 0
 
 If mode = #Bytes
    r = sgl::F2B(color\x)
    g = sgl::F2B(color\y)
    b = sgl::F2B(color\z)

    SetMask("R:%'03s")
    SliderInt(ID(), @r, 0, 255, rgb_width, h)
     
    SetMask("G:%'03s")
    SliderInt(ID(), @g, 0, 255, rgb_width, h)
     
    SetMask("B:%'03s")
    SliderInt(ID(), @b, 0, 255, rgb_width, h)
    
    color\x = sgl::B2F(r)
    color\y = sgl::B2F(g)
    color\z = sgl::B2F(b)
    color\w = 1.0
    
    vec4::Copy(color, widgetColor)
 EndIf

 If mode = #Floats
    rf = color\x
    gf = color\y
    bf = color\z
    
    SetDecimals(2)
    SetMask("R:%'03s")
    SliderFloat(ID(), @rf, 0.0, 1.0, rgb_width, h)
     
    SetMask("G:%'03s")
    SliderFloat(ID(), @gf, 0.0, 1.0, rgb_width, h)
     
    SetMask("B:%'03s")
    SliderFloat(ID(), @bf, 0.0, 1.0, rgb_width, h)
    
    color\x = rf
    color\y = gf
    color\z = bf
    color\w = 1.0        
    
    vec4::Copy(color, widgetColor)
 EndIf

 UIC\showThumb = 1
 
 x = UIC\currPosX + std::IIF(UIC\backGroundID, UIC\backgroundX, 0) 
 y = UIC\currPosY + std::IIF(UIC\backGroundID, UIC\backgroundY, 0) + UIC\currLineOffsY

 ; draw colored quad
 BatchRenderer::DrawQuad (x, y, w, h, widgetColor)

 *color\x = color\x
 *color\y = color\y
 *color\z = color\z

 set_advance_x(w + #IMGUI_ADVANCE_X_MIN)
 set_advance_y (h)
EndProcedure 

EndModule

; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 40
; Folding = --------
; Markers = 54,315
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory