; Just a test to check for the PB image internal pixel format on different platforms.

EnableExplicit

Define img, *buffer, pitch, pixelFormat

img = CreateImage(#PB_Any, 320, 200, 24)

StartDrawing(ImageOutput(img))
  *buffer     = DrawingBuffer()             ; Get the start address of the screen buffer
  pitch       = DrawingBufferPitch()        ; Get the length (in byte) taken by one horizontal line
  pixelFormat = DrawingBufferPixelFormat()  ; Get the pixel format
  
  Debug "*buffer = " + *buffer
  Debug "pitch = " + pitch
        
  If pixelFormat & #PB_PixelFormat_24Bits_RGB 
    Debug "PixelFormat 24 bits RGB"
  EndIf
  If pixelFormat & #PB_PixelFormat_24Bits_BGR
    Debug "PixelFormat 24 bits BGR"
  EndIf
  If pixelFormat & #PB_PixelFormat_32Bits_RGB
    Debug "PixelFormat 32 bits RGB"
  EndIf
  If pixelFormat & #PB_PixelFormat_32Bits_BGR
    Debug "PixelFormat 32 bits BGR"
  EndIf
  If pixelFormat & #PB_PixelFormat_ReversedY
    Debug "Y reversed"
  EndIf        
StopDrawing() 
           
FreeImage(img)


; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory