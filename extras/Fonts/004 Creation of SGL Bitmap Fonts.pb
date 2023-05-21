; With this little program you can create BMF from the fonts installed in your OS or from a single font file

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

; the name of the resulting BMF
#BMF_FILE_DIR$      = "./bmf-test/"
#BMF_FILE_NAME$     = "arial-12-unicode"

If #FONT_FILE$ <> #Empty$
    If RegisterFontFile(#FONT_FILE_DIR$ + #FONT_FILE$) = 0
        Debug "RegisterFontFile() failed ..."
        Goto exit
    EndIf
EndIf

If sgl::Init()
    Define *bmf.sgl::BitmapFontData
    
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

    *bmf = sgl::CreateBitmapFontData(#FONT_NAME$, #FONT_SIZE, #Null, ranges(), 320, 320)
    
    If *bmf = 0
        Debug "Bitmap too small ..."
        Goto exit
    EndIf

    If sgl::SaveBitmapFontData(#BMF_FILE_DIR$ + #BMF_FILE_NAME$, *bmf)
        Debug "Done!"
    Else
        Debug "Something went wrong ..."
    EndIf
    
    sgl::DestroyBitmapFontData(*bmf)
exit:    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 17
; FirstLine = 12
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory