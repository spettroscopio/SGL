; Time and timers 01

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
    Debug sgl::GetTime() ; total time elapsed from sgl::Init() 
    Delay(1000)
    Debug sgl::GetTime() ; same as above 1 second later
    
    t1 = sgl::CreateTimer()
    
    For k = 1 To 5
        Delay(1000)
        Debug sgl::GetDeltaTime(t1) ; time from last delta
    Next    
    
    Debug sgl::GetTime() ; total time elapsed from sgl::Init()
        
    sgl::DestroyTimer(t1)
    
    sgl::Shutdown()
EndIf
 
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 25
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory