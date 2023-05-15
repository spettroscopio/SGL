EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define i

If sgl::Init()        
    i = sgl::CreateImage_Box(512, 512, RGB(0, 0, 255))
    sgl::StickLabelToImage (i, "CreateImage_Box()")
    i = sgl::CreateImage_RGB(512, 512, 1)
    sgl::StickLabelToImage (i, "CreateImage_RGB()")
    i = sgl::CreateImage_RGB(512, 512, 0)
    sgl::StickLabelToImage (i, "CreateImage_RGB()")    
    i = sgl::CreateImage_Checkers(512, 512, 64, 64, RGB(255, 255, 255), RGB(0, 0, 0))
    sgl::StickLabelToImage (i, "CreateImage_Checkers()")
    i = sgl::CreateImage_Checkers(512, 512, 128, 32, RGB(255, 255, 255), RGB(0, 0, 0))
    sgl::StickLabelToImage (i, "CreateImage_Checkers()")
    i = sgl::CreateImage_Checkers(512, 512, 256, 256, RGB(255, 255, 255), RGB(0, 0, 0))
    sgl::StickLabelToImage (i, "CreateImage_Checkers()")
    i = sgl::CreateImage_DiceFace(512, 512, 1, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(1)")
    i = sgl::CreateImage_DiceFace(512, 512, 2, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(2)")
    i = sgl::CreateImage_DiceFace(512, 512, 3, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(3)")
    i = sgl::CreateImage_DiceFace(512, 512, 4, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(4)")
    i = sgl::CreateImage_DiceFace(512, 512, 5, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(5)")
    i = sgl::CreateImage_DiceFace(512, 512, 6, RGB(0, 0, 0), RGB(255, 255, 255))
    sgl::StickLabelToImage (i, "CreateImage_DiceFace(6)") 
    ShowLibraryViewer("Image")
    CallDebugger
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 32
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory