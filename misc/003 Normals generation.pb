EnableExplicit

; https://stackoverflow.com/questions/68731311/normal-map-not-applying-correctly

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Procedure.i ValidateNormalMap (img)
; The colors in a normal map must be in the range (0, 0, 128) to (255, 255, 255)

 Protected x, y, w, h
 Protected *drawbuff, pitch, pixelFormat
 Protected blue_offs
 
 If ImageDepth(img) <> 24
    ProcedureReturn 0
 EndIf
 
 w = ImageWidth(img)
 h = ImageHeight(img)
 
 StartDrawing(ImageOutput(img))
  *drawbuff = DrawingBuffer()
  pitch = DrawingBufferPitch()  
  pixelFormat = DrawingBufferPixelFormat()  
  
  Protected *p, *color.Ascii
  
  If pixelFormat & #PB_PixelFormat_24Bits_RGB
    blue_offs = 2
  EndIf
  
  If pixelFormat & #PB_PixelFormat_24Bits_BGR
    blue_offs = 0
  EndIf
    
  *p = *drawbuff
    
  For y = 0 To h - 1
    For x = 0 To w - 1
        *color = *p + blue_offs ; let's check the blue color
        *p + 3 ; rgb / bgr
        If *color\a >= 128 : Continue : EndIf ; the Z of the vector cannot point backwards
        Goto exit:
    Next
    *p = *drawbuff + pitch
    *drawbuff = *p
  Next
 StopDrawing()
 
 ProcedureReturn 1
  
 exit:
 
 StopDrawing()
 
 ProcedureReturn 0
EndProcedure

Procedure.i CreateNormalMap (w, h, *normal.vec3::vec3)
; Creates a normal map in tangent space.
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
Define i

If sgl::Init()        
    ShowLibraryViewer("Image")
    
    vec3::Set(normal, 0.0, 0.0, 1.0)
    i = CreateNormalMap(512, 512, normal) ; normals pointing towards the observer
    Debug ValidateNormalMap(i)
    
    vec3::Set(normal, 1.0, 0.0, 1.0)
    i = CreateNormalMap(512, 512, normal) ; normals pointing somewhat to the right of the observer    
    Debug ValidateNormalMap(i)
    
    vec3::Set(normal, -1.0, 0.0, 1.0)
    i = CreateNormalMap(512, 512, normal) ; normals pointing somewhat to the left of the observer    
    Debug ValidateNormalMap(i)
    
    CallDebugger
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.02 LTS (Windows - x64)
; CursorPosition = 101
; FirstLine = 58
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory