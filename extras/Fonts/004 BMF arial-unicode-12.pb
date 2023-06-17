; With this little program you can create BMF files from the fonts installed in your OS or from an external font file
; This builds arial-unicode-12.zip

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

; font to be registered, if any
#FONT_FILE_DIR$     = "./fonts/" 
#FONT_FILE$         = ""

; font to be converted to BMF
#FONT_NAME$         = "Arial"
#FONT_SIZE          = 12
#FONT_FLAGS         = 0 ; 0, #PB_Font_Bold, #PB_Font_Italic

; the name of the resulting BMF
#BMF_FILE_DIR$      = "./bmf/"
#BMF_FILE_NAME$     = "arial-unicode-" + #FONT_SIZE
#BMF_FILE_EXT$      = ".zip"

If #FONT_FILE$ <> #Empty$
    If RegisterFontFile(#FONT_FILE_DIR$ + #FONT_FILE$) = 0
        Debug "RegisterFontFile() failed ..."
        Goto exit
    EndIf
EndIf

If sgl::Init()
    Define *bmf.sgl::BitmapFontData
    
    Define out$ = #BMF_FILE_DIR$ + #BMF_FILE_NAME$ + #BMF_FILE_EXT$
    
    Dim ranges.sgl::BitmapFontRange(2)
    
    ; Latin (ascii)
    ranges(0)\firstChar  = 32
    ranges(0)\lastChar   = 128    

    ; Greek
    ranges(1)\firstChar  = $0370
    ranges(1)\lastChar   = $03FF    
    
    ; Cyrillic
    ranges(2)\firstChar  = $0400
    ranges(2)\lastChar   = $04FF
     
    *bmf = sgl::CreateBitmapFontData(#FONT_NAME$, #FONT_SIZE, #FONT_FLAGS, ranges())    
      
    If *bmf = 0
        Debug "Bitmap too small ..."
        Goto exit
    EndIf
          
    If sgl::SaveBitmapFontData(out$, *bmf)
        Debug "Saved to " + out$
    Else
        Debug "Something went wrong ..."
    EndIf
    
    sgl::DestroyBitmapFontData(*bmf)
exit:    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.03 beta 1 LTS (Windows - x86)
; CursorPosition = 55
; FirstLine = 17
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory