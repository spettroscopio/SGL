; Simple example of an FPS camera.
; Better would be to make it as a black box receiving movement messages fron the outside and not polling mouse and keyboard by itself.
; All the movements are calculated using vectors and a little of trigonometry, and then the results are feeded to m4x4::LookAt()

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

DeclareModule CameraFPS
EnableExplicit

Structure CameraFPS
 win.i
 mouseCapture.i
 lastMouseX.f
 lastMouseY.f
 height.f
 
 yaw.f
 pitch.f
 pitchMin.f
 pitchMax.f
 speed.f
 sensitivityX.f
 sensitivityY.f
 
 startYaw.f
 startPitch.f
 startPos.vec3::vec3
 
 front.vec3::vec3

 pos.vec3::vec3
 target.vec3::vec3
 up.vec3::vec3
 
 view.m4x4::m4x4  
EndStructure
 
Declare.i   Create (win, *pos.vec3::vec3, yaw.f, pitch.f)
Declare     SetSensitivity (*camera.CameraFPS, x.f, y.f)
Declare     SetSpeed (*camera.CameraFPS, speed.f)
Declare     Reset (*camera.CameraFPS)
Declare     Destroy (*camera.CameraFPS)
Declare     SetLimits (*camera.CameraFPS, pitchMin.f, pitchMax.f)
Declare     Update (*camera.CameraFPS, delta.f)
Declare.i   GetMatrix(*camera.CameraFPS)

EndDeclareModule

Module CameraFPS

#ONE_DEG_IN_RAD = 2* #PI / 360
#ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 

Procedure.i Create (win, *pos.vec3::vec3, yaw.f, pitch.f)
 Protected *camera.CameraFPS
 
 *camera = AllocateStructure(CameraFPS)
 
 *camera\win = win
 *camera\speed = 5.0 ; units/sec
 
 *camera\sensitivityX = 0.1 ; mouse sensitivity 
 *camera\sensitivityY = 0.1 ; mouse sensitivity
 
 *camera\startYaw = yaw - 90.0
 *camera\startPitch = pitch
 *camera\height = *pos\y
 
 *camera\pitchMax =  89.0
 *camera\pitchMin = -89.0
 
 vec3::Copy(*pos, *camera\startPos)

 Reset(*camera)
 
 ProcedureReturn *camera
EndProcedure

Procedure SetSensitivity (*camera.CameraFPS, x.f, y.f)
 *camera\sensitivityX = x
 *camera\sensitivityY = y
EndProcedure

Procedure SetSpeed (*camera.CameraFPS, speed.f)
 *camera\speed = speed
EndProcedure

Procedure Reset (*camera.CameraFPS)
 Protected rad_yaw.f, rad_pitch.f
 
 *camera\yaw = *camera\startYaw
 *camera\pitch = *camera\startPitch
 
 rad_yaw = *camera\yaw * #ONE_DEG_IN_RAD
 rad_pitch = *camera\pitch * #ONE_DEG_IN_RAD

 *camera\front\x = Cos(rad_yaw) * Cos(rad_pitch)
 *camera\front\y = Sin(rad_pitch)
 *camera\front\z = Sin(rad_yaw) * Cos(rad_pitch)
 vec3::Normalize(*camera\front, *camera\front)
 
 vec3::set(*camera\up, 0.0, 1.0, 0.0) 
 vec3::Copy(*camera\startPos, *camera\pos)
 vec3::Add(*camera\pos, *camera\front, *camera\target)
EndProcedure

Procedure Destroy (*camera.CameraFPS)
 FreeStructure(*camera)
EndProcedure

Procedure SetLimits (*camera.CameraFPS, pitchMin.f, pitchMax.f)

 math::Clamp3f(pitchMin, 0.0, 89.0)
 math::Clamp3f(pitchMax, 0.0, 89.0)
 
 *camera\pitchMin = pitchMin
 *camera\pitchMax = pitchMax
EndProcedure

Procedure Update (*camera.CameraFPS, delta.f)
 Protected.vec3::vec3 move
 Protected.vec3::vec3 right, left
 Protected rad_yaw.f, rad_pitch.f
 Protected x.d, y.d, offsetX.d, offsetY.d
 
 sgl::GetCursorPos(*camera\win, @x, @y)
 
 If *camera\mouseCapture = 0
    If sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_RIGHT) = sgl::#PRESSED    
        *camera\mouseCapture = 1
        sgl::SetCursorMode(*camera\win, sgl::#CURSOR_DISABLED)
     EndIf
 EndIf

 If *camera\mouseCapture = 1
      If sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_RIGHT) = sgl::#RELEASED
        *camera\mouseCapture = 0
        sgl::SetCursorMode(*camera\win, sgl::#CURSOR_NORMAL)                
     EndIf
 EndIf 

 If *camera\mouseCapture
    offsetX = x - *camera\lastMouseX 
    offsetY = y - *camera\lastMouseY
    
    *camera\yaw + offsetX * *camera\sensitivityX
    *camera\pitch - offsetY * *camera\sensitivityY

    If *camera\yaw > 270.0
        *camera\yaw = -90.0
    EndIf

    If *camera\yaw < -90.0
        *camera\yaw = 270.0
    EndIf
    
    If *camera\pitch > *camera\pitchMax
        *camera\pitch = *camera\pitchMax
    EndIf
    
    If *camera\pitch < *camera\pitchMin
        *camera\pitch = *camera\pitchMin
    EndIf
    
    rad_yaw = *camera\yaw * #ONE_DEG_IN_RAD
    rad_pitch = *camera\pitch * #ONE_DEG_IN_RAD

    *camera\front\x = Cos(rad_yaw) * Cos(rad_pitch)
    *camera\front\y = Sin(rad_pitch)
    *camera\front\z = Sin(rad_yaw) * Cos(rad_pitch)  
    vec3::Normalize(*camera\front, *camera\front)
     
    vec3::Add(*camera\pos, *camera\front, *camera\target)
 EndIf
 
 If sgl::GetKeyPress(sgl::#Key_R)
    Reset(*camera)
 EndIf
 
 If sgl::GetKey(sgl::#Key_UP)
    vec3::Scale(*camera\front, *camera\speed * delta, move)
    vec3::Add(*camera\pos, move, *camera\pos)
    vec3::Add(*camera\pos, *camera\front, *camera\target)
 EndIf

 If sgl::GetKey(sgl::#Key_DOWN)
    vec3::Scale(*camera\front, *camera\speed * delta, move)
    vec3::Sub(*camera\pos, move, *camera\pos)
    vec3::Add(*camera\pos, *camera\front, *camera\target)
 EndIf
 
 If sgl::GetKey(sgl::#Key_RIGHT)
    vec3::CrossProduct(*camera\front, *camera\up, right)
    vec3::Normalize(right, right)    
    vec3::Scale(right, *camera\speed * delta, move)
    vec3::Add(*camera\pos, move, *camera\pos)
    vec3::Add(*camera\target, move, *camera\target)
 EndIf

 If sgl::GetKey(sgl::#Key_LEFT)
    vec3::CrossProduct(*camera\up, *camera\front, left)
    vec3::Normalize(left, left)    
    vec3::Scale(left, *camera\speed * delta, move)
    vec3::Add(*camera\pos, move, *camera\pos)
    vec3::Add(*camera\target, move, *camera\target)
 EndIf
 
 *camera\pos\y = *camera\height ; to keep the camera glued at its original height
 
 *camera\lastMouseX = x
 *camera\lastMousey = y
EndProcedure

Procedure.i GetMatrix(*camera.CameraFPS)
 m4x4::LookAt(*camera\view, *camera\pos, *camera\target, *camera\up)
 ProcedureReturn *camera\view
EndProcedure

EndModule


; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 115
; FirstLine = 110
; Folding = --
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory