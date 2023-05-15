; Collect some info about the the hardware and the OpenGL capabilities 

EnableExplicit

IncludeFile "../sgl.config.pbi"
IncludeFile "../sgl.pbi"
IncludeFile "../sgl.pb"

IncludeFile "../inc/logfile.pb"

Procedure InsideIDE()
 If FindString(GetFilePart(ProgramFilename()),"PureBasic_Compilation", #PB_String_NoCase)
    ProcedureReturn 1
 EndIf
 ProcedureReturn 0
EndProcedure

Macro out (line)
 Debug line
 LogFile::Write(lf, line) ; this can be safely called without an open file
EndMacro

Global l$, file$, lf

If InsideIDE() = 0 ; creates a logfile if a standalone exe
 file$ = LogFile::GetProgramDirectory() + "sysinfo.logfile.txt" ; in the same directory of the process 
 lf = LogFile::Open(file$, LogFile::#TimeStamp)
EndIf

Define i, w, h, temp, depth, freq, mon, maj, min, xf.f, yf.f
Define win, monitors, modes, extensions
Define GoodProcsCount, BadProcsCount
Define profile

Procedure CallBack_Error (Source$, Desc$)
 out ("[" + Source$ + "] " + Desc$)
EndProcedure

Procedure CallBack_EnumFuncs (glver$, func$, *func) 
 If *func
    l$ = str::PadRight(glver$, 4) + " -> " + func$ + " ($" + Hex(*func) + ")"    
 Else       
    l$ = str::PadRight(glver$, 4) + " -> " + func$ + " [ NOT FOUND ]"
 EndIf
 out(l$)
EndProcedure

sgl::RegisterErrorCallBack(@CallBack_Error())

sgl::Init()

l$ = sgl::GetSglVersion() 
out(l$)

l$ = sgl::GetGlfwVersion()
out(l$)

l$ = "OS: " + sgl::GetOS()
out(l$)

l$ = "CPU: " + sgl::GetCpuName()
out(l$)

l$ = "Total Memory: " + str::FormatQuad(sgl::GetTotalMemory())
out(l$)

l$ = "Free Memory: " + str::FormatQuad(sgl::GetFreeMemory())
out(l$)

l$ = "Timer resolution: " + sgl::GetTimerResolutionString()
out(l$)

Dim monitors(0)
Define vmode.sgl::VideoMode
monitors = sgl::GetMonitors (monitors())

For mon = 1 To monitors
    sgl::GetVideoMode(monitors(mon-1), @vmode)
    l$ = "Monitor #" + mon + " " + sgl::GetMonitorName(monitors(mon-1)) + str::Sprintf(" (%ix%i, %i bits, %i Hz)", @vmode\width, @vmode\height, @vmode\depth, @vmode\freq)
    out(l$)

    sgl::GetMonitorContentScale(monitors(mon-1), @xf, @yf)
    l$ = str::Sprintf("Monitor #%i DPI scaling factor: %.2f x %.2f", @mon, @xf, @yf)
    out(l$)

    l$ = str::Sprintf("Monitor #%i Video modes: ", @mon)    
    out(l$)
    
    Dim vmodes.sgl::VideoMode(0)
    modes = sgl::GetVideoModes(monitors(mon-1), vmodes())
    For i = 1 To modes
        l$ = str::Sprintf("Mode %'02i: %i x %i, %i bits (%i Hz)", @i, @vmodes(i-1)\width, @vmodes(i-1)\height, @vmodes(i-1)\depth, @vmodes(i-1)\freq)
        out(l$)
    Next 
Next

sgl::SetWindowHint(sgl::#HINT_WIN_VISIBLE, 0)
sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 1)
sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 0)
sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_ANY)
sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)

win = sgl::CreateWindow(640, 480, "")

sgl::MakeContextCurrent(win)

sgl::GetContextVersion(@maj, @min)
l$ = "OpenGL context version: " + Str(maj) + "." + Str(min)
out(l$)

profile = sgl::GetContextProfile()

Select profile 
    Case sgl::#PROFILE_COMPATIBLE
        l$ = "OpenGL profile: COMPATIBLE"
        out(l$)
    Case sgl::#PROFILE_CORE
        l$ = "OpenGL profile: CORE"
        out(l$)
EndSelect

l$ = "Vendor: " + sgl::GetVendor()
out(l$)

l$ = "Renderer: " + sgl::GetRenderer()
out(l$)

l$ = "Shading Language: " + sgl::GetShadingLanguage()
out(l$)

l$ = "Debug context: " + std::IIFs(sgl::IsDebugContext(), "Yes", "No")
out(l$)

glGetIntegerv_(#GL_MAX_TEXTURE_SIZE, @temp)
l$ = "Max texture size: " + Str(temp)
out(l$)

glGetIntegerv_(#GL_MAX_TEXTURE_UNITS, @temp)
l$ = "Max texture units (fixed pipeline): " + Str(temp)
out(l$)

If sgl::GetContextVersionToken() >= 200
    glGetIntegerv_(#GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS, @temp)
    l$ = "Max combined texture units: " + Str(temp)
    out(l$)
    
    glGetIntegerv_(#GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS, @temp)
    l$ = "Max texture units (vertex shader): " + Str(temp)
    out(l$)
    
    glGetIntegerv_(#GL_MAX_TEXTURE_IMAGE_UNITS, @temp)
    l$ = "Max texture units (fragment shader): " + Str(temp)
    out(l$)
    
    glGetIntegerv_(#GL_MAX_VERTEX_UNIFORM_COMPONENTS, @temp)
    l$ = "Max uniforms (vertex shader): " + Str(temp)
    out(l$)
    
    glGetIntegerv_(#GL_MAX_FRAGMENT_UNIFORM_COMPONENTS , @temp)
    l$ = "Max uniforms (fragment shader): " + Str(temp)
    out(l$)
EndIf

glLoad::RegisterCallBack(glLoad::#CallBack_EnumFuncs, @CallBack_EnumFuncs())
                                
l$ = "Imported OpenGL functions:"
out(l$)

If glLoad::Load () = 0
    l$ = glLoad::GetErrString()
    out(l$)
EndIf

glLoad::GetProcsCount(@GoodProcsCount, @BadProcsCount)
l$ = Str(GoodProcsCount) + " functions imported, " + Str(BadProcsCount) + " missing."            
out(l$)

l$ = "List of the available OpenGL extensions:"
out(l$)

extensions = sgl::LoadExtensionsStrings()

For i = 0 To extensions - 1
    l$ = sgl::GetExtensionString(i)    
    out(l$)
Next

l$ = Str(extensions) + " extensions found."
out(l$)

sgl::DestroyWindow(win)

sgl::Shutdown()

logfile::Close(lf)

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 119
; FirstLine = 96
; Folding = -
; Optimizer
; EnableXP
; EnableUser
; Executable = sysinfo.exe
; CPU = 1
; CompileSourceDirectory