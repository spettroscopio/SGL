EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Procedure.i CreateMap_Normal (w, h, *normal.vec3::vec3)
; Returns a 24 bit PB image or 0 in case of error.

 Protected x, y, value
 Protected img, normal.vec3::vec3
 
 vec3::Normalize(*normal, normal)
 
 ; remap it between 0.0 ... 1.0
 normal\x = normal\x * 0.5 + 0.5 
 normal\y = normal\y * 0.5 + 0.5 
 normal\z = normal\z * 0.5 + 0.5 
 
 value = RGB (Int(normal\x * 255), Int(normal\y * 255), Int(normal\z * 255))
  
 img = CreateImage(#PB_Any, w, h, 24)
   
 If img
    StartDrawing(ImageOutput(img))    
     Box(0, 0, w, h, value)
    StopDrawing()
 EndIf
   
 ProcedureReturn img
EndProcedure

Define.vec3::vec3 normal

If sgl::Init()        
    ShowLibraryViewer("Image")
    vec3::Set(normal, 0.0, 0.0, 1.0)
    CreateMap_Normal (512, 512, normal) ; normals pointing towards the observer
    CallDebugger
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 6
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory