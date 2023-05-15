; Time and timers 03

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
    
    For k = 1 To 10
        Delay(1000)
        Debug sgl::GetDeltaTime(t1) ; time from last delta
        Debug sgl::GetElapsedTime(t1) ; time from the timer creation (or reset)
        If k = 5 : sgl::ResetTimer(t1) : EndIf
    Next
          
    Debug sgl::GetElapsedTimeAbsolute(t1) ; always the time from the timer creation
        
    sgl::DestroyTimer(t1)
    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 28
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory