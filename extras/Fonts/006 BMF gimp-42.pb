; With this little program you can create BMF files from an image containing a bitmap font in strip form and a text file.
; See gimp-font\gimp-42.png and gimp-font\gimp-42.txt

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

Procedure.i FindZeroAlpha (stripX, stripHeight, stripWidth) 
 Protected stripY = 0
 
 While stripX < stripWidth
     While stripY < stripHeight
        If Alpha(Point(stripX, stripY)) <> 0
            If stripX < stripWidth
                stripX + 1
                stripY = 0
                Continue
            EndIf
            ProcedureReturn stripWidth 
        EndIf
        stripY + 1
     Wend          
     ProcedureReturn stripX
 Wend
 ProcedureReturn stripWidth 
EndProcedure

Procedure.i FindSomeAlpha (stripX, stripHeight, stripWidth) 
 Protected stripY = 0
 
 While stripX < stripWidth
     While stripY < stripHeight
        If Alpha(Point(stripX, stripY)) <> 0
            ProcedureReturn stripX
        EndIf
        stripY + 1
     Wend          
     stripX + 1
     stripY = 0
 Wend
 ProcedureReturn stripWidth 
EndProcedure

Procedure.i CreateBitmapFontDataFromStrip (file$, fontSize, width, height, spacing = 0)
;> Returns an allocated BitmapFontData structure which can be used to display bitmapped fonts, or 0 in case of error.
; This function creates the bitmap font data from a strip of chars and a text file used for mapping the ascii codes to the sub images.

; file$ is the name of the image file containing the strip of chars
; fontSize is the size in points
; width, height are the dimensions of the image to be created
; spacing is the number of pixels to be left unused around the glyph in the vertical and horizontal directions
;
; The function returns 0 if (width x height) results in an image too small to store all the glyphs.

; The strip image and text files must observe these rules:
; The image must contain an alpha channel filled with zeros where the chars glyphs are not present
; The start of the first and the end of the last sub image must coincide with the start and end of the strip
; Glyphs must be separated by at least one vertical line of zeros in the alpha channel
; A space char (ascii 32) must always be present in the .txt
; Only the first line of the text file is used, the rest can be used for remarks.
; See gimp-font\gimp-42.png and gimp-font\gimp-42.txt for an example.

 Protected gw, gh, x, y, i
 Protected hDC, image, highestRow, highestFont
 Protected *bmf.sgl::BitmapFontData, *glyph.sgl::GlyphData
 Protected stripCharsCount, stripChars$
 Protected fontName$ = GetFilePart(file$, #PB_FileSystem_NoExtension)
 Protected imgStrip, imgStrip$ = file$
 Protected txtFile, txtFile$ = GetPathPart(file$) + fontName$ + ".txt"
  
 Structure GlyphFromStrip
  image.i
  code.i
 EndStructure
 
 txtFile = ReadFile(#PB_Any, txtFile$)
 If txtFile = 0 : Goto exit : EndIf
 
 stripChars$ = ReadString(txtFile)
 stripCharsCount = Len(stripChars$)
 CloseFile(txtFile)
 
 Dim glyphs.GlyphFromStrip(stripCharsCount - 1)
 
 Protected spaceIndex = -1
 
 For i = 0 To stripCharsCount - 1
    glyphs(i)\code = Asc(Mid(stripChars$, i+1, 1))
    If glyphs(i)\code = 32
        spaceIndex = i
    EndIf
 Next
 
 ASSERT(spaceIndex <> -1)
 
 imgStrip = LoadImage(#PB_Any, imgStrip$)
 If imgStrip = 0 : Goto exit : EndIf
 
 Protected stripHeight, stripWidth, stripX, stripY, stripCharStart, stripCharEnd, stripCharWidth 
 
 stripHeight = ImageHeight(imgStrip) - 1
 stripWidth  = ImageWidth(imgStrip) - 1
 
 Debug "Strip size = " + Str(stripWidth) + " x " + Str(stripHeight) 
 
 For i = 0 To stripCharsCount - 1
    hDC = StartDrawing(ImageOutput(imgStrip))
    DrawingMode(#PB_2DDrawing_AllChannels)
  
    stripX = FindSomeAlpha (stripX, stripHeight, stripWidth) 
    stripCharStart = stripX
    
    stripX = FindZeroAlpha (stripX, stripHeight, stripWidth) 
    stripCharEnd = stripX
 
    StopDrawing()
    
    stripCharWidth = stripCharEnd - stripCharStart
    
    glyphs(i)\image = GrabImage(imgStrip, #PB_Any, stripCharStart, 0, stripCharWidth, stripHeight)
    
    Debug "char n. " + Str(i) + ", code = " + Str(glyphs(i)\code) + " (" + Str(stripCharStart) + "," + Str(stripCharEnd) + ")"
    stripX + 1
 Next
 
 *bmf = AllocateStructure(sgl::BitmapFontData)
 
 If *bmf = 0 : Goto exit : EndIf

 image = CreateImage(#PB_Any, width, height, 32, #PB_Image_Transparent)
 
 If image = 0 : Goto exit : EndIf

 hDC = StartDrawing(ImageOutput(image)) 
  FrontColor(RGBA(255,255,255,255))
  BackColor(RGBA(0,0,0,0))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  
  x = 1 : y = 1
      
  ; BLOCK char for missing glyphs (a space in reverse)
  gw = ImageWidth(glyphs(spaceIndex)\image)
  gh = ImageHeight(glyphs(spaceIndex)\image)
  Box(x, y, gw, gh)
  
  ; fill up the metrics for the special BLOCK char
  *bmf\block\code = -1
  *bmf\block\x = x
  *bmf\block\y = y
  *bmf\block\w = gw
  *bmf\block\h = gh
  *bmf\block\xOffset = 2
   
  x = x + gw + spacing

  *bmf\glyphs = sbbt::New(#PB_Integer)
  
  Protected code
  
  For i = 0 To stripCharsCount - 1
  
    code = glyphs(i)\code
    Debug code 
    
    gw = ImageWidth(glyphs(i)\image)
    gh = ImageHeight(glyphs(i)\image)
        
    If y + gh > height
        ; not enough space
        Goto exit:
    EndIf
    
    If gh > highestRow
        highestRow = gh
    EndIf
    
    If gh > highestFont
        highestFont = gh
    EndIf
        
    If x + gw > width
        y + highestRow + spacing
        highestRow = 0
        x = 1
    EndIf
    
    If code <> 32
        DrawImage(ImageID(glyphs(i)\image), x, y)
    EndIf
    
    FreeImage(glyphs(i)\image)
            
    *glyph = AllocateStructure(sgl::GlyphData)
    
    If *glyph = 0 : Goto exit : EndIf
    
    *glyph\code = code
    *glyph\x = x
    *glyph\y = y
    *glyph\w = gw
    *glyph\h = gh
    *glyph\xOffset = 2
    
    If sbbt::Insert(*bmf\glyphs, *glyph\code, *glyph) = 0
        ;CALLBACK_ERROR (#SOURCE_ERROR_SGL$, "CreateBitmapFontData() encountered duplicated char codes.")
        Goto exit
    EndIf
                  
    x = x + gw + spacing
  Next
  
 StopDrawing()
  
 *bmf\fontName$ = fontName$
 *bmf\fontSize = fontSize
 *bmf\yOffset = highestFont + 2
 *bmf\italic = 0
 *bmf\bold = 0
 *bmf\image = image

 ProcedureReturn *bmf

 exit:

 If hDC : StopDrawing() : EndIf
 If IsImage(imgStrip) : FreeImage(imgStrip): EndIf
 If IsImage(image) : FreeImage(image) : EndIf
 If txtFile : CloseFile(txtFile): EndIf
 If *bmf : sgl::DestroyBitmapFontData(*bmf) : EndIf  
 ProcedureReturn 0
  
EndProcedure


; font to be converted to BMF
#BITMAP_STRIP$      = "./gimp-font/gimp-42.png"
#FONT_SIZE          = 42

; the name of the resulting BMF
#BMF_FILE_DIR$      = "./bmf/"
#BMF_FILE_NAME$     = "gimp-" + #FONT_SIZE
#BMF_FILE_EXT$      = ".zip"

If sgl::Init()
    Define *bmf.sgl::BitmapFontData
    
    Define out$ = #BMF_FILE_DIR$ + #BMF_FILE_NAME$ + #BMF_FILE_EXT$
         
    *bmf = CreateBitmapFontDataFromStrip (#BITMAP_STRIP$, #FONT_SIZE, 512, 512, 1)
    
    If *bmf = 0
        Debug "Bitmap too small ..."
        Goto exit
    EndIf
       
    If sgl::SaveBitmapFontData(out$, *bmf)
        Debug "Saved to " + out$
    Else
        Debug "Something went wrong ..."
    EndIf
    
    ;sgl::DestroyBitmapFontData(*bmf)
exit:    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 238
; FirstLine = 207
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory