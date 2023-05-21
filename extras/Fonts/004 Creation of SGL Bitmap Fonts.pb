; With this little program you can create BMF from the fonts installed in your OS or from a single font file

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

; font to be registered, if any
#FONT_FILE_DIR$     = "./fonts/" 
#FONT_FILE$         = "Neuropolitical.otf"

; font to be converted to BMF
#FONT_NAME$         = "Neuropolitical"
#FONT_SIZE          = 14

; the name of the resulting BMF
#BMF_FILE_DIR$      = "./bmf-test/"
#BMF_FILE_NAME$     = "neuropolitical-14"

If #FONT_FILE$ <> #Empty$
    If RegisterFontFile(#FONT_FILE_DIR$ + #FONT_FILE$) = 0
        Debug "RegisterFontFile() failed ..."
        Goto exit
    EndIf
EndIf

If sgl::Init()
    Define *bmf.sgl::BitmapFontData
    
    Dim ranges.sgl::BitmapFontRange(0)
    
    ; Latin (ascii)
    ranges(0)\firstChar  = 32
    ranges(0)\lastChar   = 128    
    
    *bmf = sgl::CreateBitmapFontData(#FONT_NAME$, #FONT_SIZE, #Null, ranges(), 256, 256)
    
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
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 36
; FirstLine = 4
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory