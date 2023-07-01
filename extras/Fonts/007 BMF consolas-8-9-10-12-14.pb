; With this little program you can create BMF files from the fonts installed in your OS or from an external font file
; This builds consolas-9.zip

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

; font to be registered, if any
#FONT_FILE_DIR$     = "./fonts/" 
#FONT_FILE$         = ""

; font to be converted to BMF
#FONT_NAME$         = "Consolas"
#FONT_FLAGS         = 0 ; 0, #PB_Font_Bold, #PB_Font_Italic

; the name of the resulting BMF
#BMF_FILE_DIR$      = "./bmf/"
#BMF_FILE_EXT$      = ".zip"

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
            
    Define fontSize, fontName$ 
    
    DataSection
     font_sizes:     
     Data.i 8, 9, 10, 12, 14, -1
    EndDataSection : Restore font_sizes
    
    Repeat
        Read.i fontSize : If fontSize = -1 : Break : EndIf
        
        fontName$ = "consolas-" +Str(fontSize)
        
        *bmf = sgl::CreateBitmapFontData(fontName$, fontSize, #FONT_FLAGS, ranges())    
          
        If *bmf = 0
            Debug "Bitmap too small ..."
            Goto exit
        EndIf
        
        Define out$ = #BMF_FILE_DIR$ + fontName$ + #BMF_FILE_EXT$
              
        If sgl::SaveBitmapFontData(out$, *bmf)
            Debug "Saved to " + out$
        Else
            Debug "Something went wrong ..."
        EndIf
        
        sgl::DestroyBitmapFontData(*bmf)
    ForEver
exit:    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 41
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory