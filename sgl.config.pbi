; To configure how SGL will link with its supporting GLFW in your project just include your private copy of this file.
; Inside it define the constant #LINK_DYNAMIC and set it to 0 or 1.
; If set to 1, the executable will look for the library inside its own directory, or ./lib, or ./bin
; If set to 0, the library will be statically linked.

DeclareModule sgl_config
 CompilerIf (#PB_Compiler_OS = #PB_OS_Windows)
  #LINK_DYNAMIC = 0
 CompilerElse
  #LINK_DYNAMIC = 1    
 CompilerEndIf       
EndDeclareModule : Module sgl_config : EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 2
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory