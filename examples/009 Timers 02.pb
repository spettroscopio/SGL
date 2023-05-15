; Time and timers 02

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

Define t1, k

Procedure CallBack_Error (Source$, Desc$)
 Debug "[" + Source$ + "] " + Desc$
EndProcedure

sgl::RegisterErrorCallBack(@CallBack_Error())

If sgl::Init()    
    t1 = sgl::CreateTimer()
    
    For k = 1 To 5
        Delay(1000)
        Debug sgl::GetDeltaTime(t1) ; time from last delta 
        Debug sgl::GetElapsedTime(t1) ; time from the timer creation 
    Next
        
    sgl::DestroyTimer(t1)
    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 22
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory