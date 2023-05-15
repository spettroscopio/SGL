; Not-so-simple example of an ArcBall 
; This type of camera is more suited to look at a 3D model.
; Info: http://courses.cms.caltech.edu/cs171/assignments/hw3/hw3-notes/notes-hw3.html
; Tip: if you click and drag starting from one of the corners, you will be outside the virtual track ball, so you'll get a rotation around the Z axis.

XIncludeFile "../../sgl.config.pbi"
XIncludeFile "../../sgl.pbi"
XIncludeFile "../../sgl.pb"

DeclareModule ArcBall

EnableExplicit

Structure Sphere
 x.f
 y.f
 z.f
 vStart.vec3::vec3
 vEnd.vec3::vec3 
 vAxisOfRotation.vec3::vec3 
EndStructure 

Structure ArcBall
 win.i
 lastMouseX.f
 lastMouseY.f
 strafeX.f
 strafeY.f
 mouseCapture.i

 speed.f
 distance.f
 
 startDistance.f
 
 sphere.Sphere
 
 qLastRotation.quat::quat
 qCurrRotation.quat::quat
  
 view.m4x4::m4x4  
EndStructure

 
Declare.i   Create (win, distance.f)
Declare     Reset (*camera.ArcBall)
Declare     Destroy (*camera.ArcBall)
Declare     Update (*camera.ArcBall, delta.f)
Declare.i   GetMatrix (*camera.ArcBall)
EndDeclareModule

Module ArcBall

#ONE_DEG_IN_RAD = 2* #PI / 360
#ONE_RAD_IN_DEG = 360.0 / ( 2.0 * #PI ) 

#MOUSE_STATUS_FREE = 0
#MOUSE_STATUS_ROTATE = 1
#MOUSE_STATUS_STRAFE = 2

Procedure.i Create (win, distance.f)
 Protected *camera.ArcBall
 
 *camera = AllocateStructure(ArcBall)
 
 *camera\startDistance = -distance
 
 *camera\win = win
 *camera\speed = 1.5 ; units/sec  
  
 Reset(*camera)
 
 ProcedureReturn *camera
EndProcedure

Procedure Reset (*camera.ArcBall)
 *camera\distance = *camera\startDistance
 *camera\strafeX = 0.0
 *camera\strafeY = 0.0
 quat::Identity(*camera\qLastRotation) 
 quat::Identity(*camera\qCurrRotation) 
EndProcedure

Procedure Destroy (*camera.ArcBall)
 FreeStructure(*camera)
EndProcedure

Procedure.i GetMatrix (*camera.ArcBall)
 Protected.m4x4::m4x4 model, rotation
 Protected.quat::quat qCompositeRotation
 
 quat::Multiply(*camera\qCurrRotation, *camera\qLastRotation, qCompositeRotation)
 quat::GetMatrix(qCompositeRotation, rotation)

 m4x4::Identity(model) ; model offsetting
 m4x4::TranslateXYZ(model, *camera\strafeX, *camera\strafeY, *camera\distance)
 
 m4x4::Multiply(model, rotation, *camera\view) ; model * composite rotation = view matrix
 
 ProcedureReturn *camera\view
EndProcedure

Procedure Update (*camera.ArcBall, delta.f)
 Protected offsetX.d, offsetY.d
 Protected w, h 
 Protected x.d, y.d, nx.f, ny.f, nz.f
 Protected dot.f, angle.f, len.f
 Protected scrollOffsetX.d, scrollOffsetY.d
 
 sgl::GetWindowFrameBufferSize(*camera\win, @w, @h)
 sgl::GetCursorPos(*camera\win, @x, @y)
  
 If *camera\mouseCapture = #MOUSE_STATUS_FREE ; if right or middle buttons were not pressed
    If sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_RIGHT) = sgl::#PRESSED ; is pressed now ?
        *camera\mouseCapture = #MOUSE_STATUS_ROTATE ; enable rotation
    ElseIf sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_MIDDLE) = sgl::#PRESSED ; is pressed now ?
        *camera\mouseCapture = #MOUSE_STATUS_STRAFE ; enable strafing
    EndIf
 EndIf

 If *camera\mouseCapture <> #MOUSE_STATUS_FREE ; if right or middle buttons were pressed
    If sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_RIGHT) = sgl::#RELEASED And *camera\mouseCapture = #MOUSE_STATUS_ROTATE
        *camera\mouseCapture = #MOUSE_STATUS_FREE ; release rotation
    ElseIf sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_MIDDLE) = sgl::#RELEASED And *camera\mouseCapture = #MOUSE_STATUS_STRAFE
        *camera\mouseCapture = #MOUSE_STATUS_FREE ; release strafing
    EndIf
 EndIf 
 
 If sgl::GetKeyPress(sgl::#Key_R)
    Reset(*camera)
 EndIf
 
 x = math::Clamp(x, 0, w)
 y = math::Clamp(y, 0, h)

 offsetX = x - *camera\lastMouseX 
 offsetY = y - *camera\lastMouseY 

 ; map the coordinate system so it's going from (-1,1) (bottom left) to (1,1) (top right) and (0.0) is at the center
 nx = math::MapToRangef(x, 0, w, -1.0,  1.0)
 ny = math::MapToRangef(y, 0, h,  1.0, -1.0)

 Protected.vec3::vec3 vCenter, vClickPoint
 
 vec3::Zero(vCenter)
 vec3::Set(vClickPoint, nx, ny, 0.0)
 
 len = vec3::Length(vClickPoint)
    
 If len > 1.0
    ; clip the points out of the circonference to the radius length   
    nz = 0.0
    vec3::Normalize(vClickPoint, vClickPoint)
 Else
    ; r*r = x*x + y*y + z*z   =>   z = sqr(r*r - x*x - y*y)
    nz = Sqr(1.0 - (nx * nx) - (ny * ny))
    vec3::Set(vClickPoint, nx, ny, nz)
 EndIf          
 
 If *camera\mouseCapture = #MOUSE_STATUS_ROTATE ; right mouse button pressed, we are dragging to rotate
    If vec3::IsZero (*camera\sphere\vStart) ; we have a new start   
        ; save the start dragging point
        vec3::Copy(vClickPoint, *camera\sphere\vStart) 
    Else
        vec3::Copy(vClickPoint, *camera\sphere\vEnd) ; update the ending point while we are dragging the arc

        ; calc the angle between the tow vectors
        dot = vec3::DotProduct(*camera\sphere\vStart, *camera\sphere\vEnd)
        dot = math::Minf(dot, 1.0) ; make sure is below 1.0 or the arcosine would fail
        angle = ACos(dot) * #ONE_RAD_IN_DEG * 2.0
         
        ; vector orthogonal to both, to be used as the axis to rotate around 
        vec3::CrossProduct(*camera\sphere\vStart, *camera\sphere\vEnd, *camera\sphere\vAxisOfRotation)
        
        ; use a versor to store the rotation information
        quat::Versor(*camera\qCurrRotation, *camera\sphere\vAxisOfRotation, angle)                
    EndIf    
 Else ; nothing is happening, check if we ended a drag operation
    If vec3::IsZero (*camera\sphere\vStart) = #False
        vec3::Zero(*camera\sphere\vStart)  
        vec3::Zero(*camera\sphere\vEnd)
        ; save the current composite rotation as the last rotation to be used in a new iteration
        quat::Multiply(*camera\qCurrRotation, *camera\qLastRotation, *camera\qLastRotation)
        ; and clear the current rotation to start a new drag operation
        quat::Identity(*camera\qCurrRotation)
    EndIf    
 EndIf
 
 ; mouse wheel
 
 sgl::GetMouseScroll(@scrollOffsetX, @scrollOffsetY)
 
 ; mouse wheel
 If scrollOffsetY <> 0.0 
    *camera\distance + scrollOffsetY * delta * *camera\speed * 5.0
 EndIf
 
 ; middle mouse strafe
 If sgl::GetMouseButton(*camera\win, sgl::#MOUSE_BUTTON_MIDDLE) = sgl::#PRESSED 
    *camera\strafeX + offsetX * delta * *camera\speed
    *camera\strafeY - offsetY * delta * *camera\speed            
 EndIf
  
 ; update virtual position inside the semisphere 
 *camera\sphere\x = nx
 *camera\sphere\y = ny
 *camera\sphere\z = nz
 
 *camera\lastMouseX = x
 *camera\lastMousey = y
EndProcedure

EndModule



; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 2
; Folding = --
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory