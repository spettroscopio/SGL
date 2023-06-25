; This is similar to the previous one, but with the addition of two new maps, an emissive map and a normal map.
; The emissive map is very easy to implement and adds the ability to have some parts of the object illuminated indipendently from the incoming light.
; It's typically used to emit light from the object (hence the name)

; The normal map is more complex even if the concept is simple, but it adds realism capturing how the light is supposed to be reflected with the resolution
; of a single fragment instead of a vertex.
; In this example if you try to enable/disable normal mapping you should notice a more realistic shimmering of the light
; on the many metal reliefs on the box and even at the extremities of the box, when the border tend to reflect some light.

; For an in depth explanation 
; https://learnopengl.com/Advanced-Lighting/Normal-Mapping
; https://ogldev.org/www/tutorial26/tutorial26.html

EnableExplicit

IncludeFile "../../sgl.config.pbi"
IncludeFile "../../sgl.pbi"
IncludeFile "../../sgl.pb"

IncludeFile "../../extras/RenderText/RenderText.pb"

UseModule gl

#TITLE$ = "Emissive and Normal maps (330)"
#WIN_WIDTH = 1024
#WIN_HEIGHT = 768
#VSYNC = 1

Global gWin
Global gVSync = #VSYNC 
Global gAmbientOn, gSpecularOn, gDiffuseOn, gNormalMappingOn
Global gPulsating
Global gShader, gLightShader
Global gDiffuseMap, gSpecularMap, gNormalMap, gEmissiveMap, gLampTex
Global gVao, gLightVao
Global gFon
Global gTimer

Structure CubeVertex
 position.vec3::vec3  ; 3 floats
 texCoord.vec2::vec2  ; 2 floats
 normal.vec3::vec3    ; 3 floats
 tangent.vec3::vec3   ; 3 floats
 bitangent.vec3::vec3 ; 3 floats
EndStructure
 
DataSection
 DiffuseMap:
 IncludeBinary "../assets/scifi_box.png"
 SpecularMap:
 IncludeBinary "../assets/scifi_box_specular.png"
 NormalMap:
 IncludeBinary "../assets/scifi_box_normal.png" 
 EmissiveMap:
 IncludeBinary "../assets/scifi_box_emissive.png" 
 lamp:
 IncludeBinary "../assets/lamp.png"  
EndDataSection

Declare   CallBack_WindowRefresh (win)
Declare   CallBack_Error (source$, desc$)
Declare   SetupData()
Declare   SetupContext()
Declare   ShutDown()
Declare   Render()
Declare   MainLoop()
Declare   Main()
 
Procedure CallBack_WindowRefresh (win)
 Render()
EndProcedure 

Procedure CallBack_Error (source$, desc$)
 Debug "[" + source$ + "] " + desc$
EndProcedure

Procedure.i ImageTotexture (img) 
 Protected *td.sgl::TexelData
 Protected texid
 Protected maxAnisotropy.f
 
 *td = sgl::CreateTexelData (img)
  
 glGenTextures_(1, @texid) 
 glBindTexture_(#GL_TEXTURE_2D, texid)
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_S, #GL_CLAMP_TO_EDGE)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_WRAP_T, #GL_CLAMP_TO_EDGE) 
 
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MIN_FILTER, #GL_LINEAR_MIPMAP_LINEAR)
 glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAG_FILTER, #GL_LINEAR)
 
 If sgl::IsExtensionAvailable("GL_EXT_texture_filter_anisotropic") Or sgl::IsExtensionAvailable("GL_ARB_texture_filter_anisotropic")
    glGetFloatv_(#GL_MAX_TEXTURE_MAX_ANISOTROPY, @maxAnisotropy)
    glTexParameteri_(#GL_TEXTURE_2D, #GL_TEXTURE_MAX_ANISOTROPY, maxAnisotropy)
 EndIf
  
 glTexImage2D_(#GL_TEXTURE_2D, 0, *td\internalTextureFormat, *td\imageWidth, *td\imageHeight, 0, *td\imageFormat, #GL_UNSIGNED_BYTE, *td\pixels)
 glGenerateMipmap_(#GL_TEXTURE_2D)
 
 sgl::DestroyTexelData(*td)
 
 ProcedureReturn texid
EndProcedure

Procedure.i CatchTexture (address) 
 ProcedureReturn ImageTotexture (CatchImage(#PB_Any, address)) 
EndProcedure

Procedure CalcTangents (Array vertex.CubeVertex(1), Array index.l(1))
; calculate tangent and bitangent for every triangle in the cube

 Protected i, indices, vertices
 Protected.CubeVertex *v0, *v1, *v2 
 Protected.vec3::vec3 edge1, edge2, tangent, bitangent
 Protected.f deltaU1, deltaV1, deltaU2, deltaV2, f
 
 vertices = ArraySize(vertex()) - 1
 indices = ArraySize(index()) - 1
  
 For i = 0 To indices Step 3 ; loop through the indices to retrieve the triangles vertices
    *v0 = @vertex(index(i)) 
    *v1 = @vertex(index(i + 1))
    *v2 = @vertex(index(i + 2))
    
    vec3::Sub(*v1\position, *v0\position, edge1)
    vec3::Sub(*v2\position, *v0\position, edge2)
    
    deltaU1 = *v1\texCoord\x - *v0\texCoord\x
    deltaV1 = *v1\texCoord\y - *v0\texCoord\y
    deltaU2 = *v2\texCoord\x - *v0\texCoord\x
    deltaV2 = *v2\texCoord\y - *v0\texCoord\y
    
    f = 1.0 / (deltaU1 * deltaV2 - deltaU2 * deltaV1)
    
    tangent\x = f * (deltaV2 * edge1\x - deltaV1 * edge2\x)
    tangent\y = f * (deltaV2 * edge1\y - deltaV1 * edge2\y)
    tangent\z = f * (deltaV2 * edge1\z - deltaV1 * edge2\z)

    bitangent\x = f * (-deltaU2 * edge1\x - deltaU1 * edge2\x)
    bitangent\y = f * (-deltaU2 * edge1\y - deltaU1 * edge2\y)
    bitangent\z = f * (-deltaU2 * edge1\z - deltaU1 * edge2\z)
        
    vec3::Copy(tangent, *v0\tangent)
    vec3::Copy(tangent, *v1\tangent)
    vec3::Copy(tangent, *v2\tangent)

    vec3::Copy(bitangent, *v0\bitangent)
    vec3::Copy(bitangent, *v1\bitangent)
    vec3::Copy(bitangent, *v2\bitangent)
 Next
 
 For i = 0 To vertices
    vec3::Normalize(vertex(i)\tangent, vertex(i)\tangent)
    vec3::Normalize(vertex(i)\bitangent, vertex(i)\bitangent)
 Next 
EndProcedure

Procedure SetupData()
 Protected vbo, ibo, lightVbo

 DataSection  
  cube_vertex_data:
  
  ; 3 * vertex_pos + 2 * tex_coord + 3 * normals
  
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0,   0.0,  0.0,  1.0 ; front 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0,   0.0,  0.0,  1.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0,   0.0,  0.0,  1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0,   0.0,  0.0,  1.0
                  
  Data.f -1.0, -1.0, -1.0,   1.0, 0.0,   0.0,  0.0, -1.0 ; back 
  Data.f -1.0,  1.0, -1.0,   1.0, 1.0,   0.0,  0.0, -1.0
  Data.f  1.0,  1.0, -1.0,   0.0, 1.0,   0.0,  0.0, -1.0
  Data.f  1.0, -1.0, -1.0,   0.0, 0.0,   0.0,  0.0, -1.0
                    
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,   0.0,  1.0,  0.0 ; top
  Data.f -1.0,  1.0,  1.0,   0.0, 0.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 0.0,   0.0,  1.0,  0.0
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   0.0,  1.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,   0.0, -1.0,  0.0 ; bottom
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   0.0, -1.0,  0.0
  Data.f  1.0, -1.0,  1.0,   1.0, 1.0,   0.0, -1.0,  0.0
  Data.f -1.0, -1.0,  1.0,   0.0, 1.0,   0.0, -1.0,  0.0
                  
  Data.f  1.0, -1.0, -1.0,   1.0, 0.0,   1.0,  0.0,  0.0 ; right
  Data.f  1.0,  1.0, -1.0,   1.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0,  1.0,  1.0,   0.0, 1.0,   1.0,  0.0,  0.0
  Data.f  1.0, -1.0,  1.0,   0.0, 0.0,   1.0,  0.0,  0.0
                  
  Data.f -1.0, -1.0, -1.0,   0.0, 0.0,  -1.0,  0.0,  0.0 ; left
  Data.f -1.0, -1.0,  1.0,   1.0, 0.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0,  1.0,   1.0, 1.0,  -1.0,  0.0,  0.0
  Data.f -1.0,  1.0, -1.0,   0.0, 1.0,  -1.0,  0.0,  0.0
 EndDataSection

 ; this time we copy the vertex data in an array of structures to be able to manipulate them more easily (update the tangents)
 
 Dim vertex_cube.CubeVertex(23) ; 6 faces * 4 quads  
 Restore cube_vertex_data
 Protected.f x, y, z
 Protected i
 
 For i = 0 To 23 ; 24 vertices
    Read.f x : Read.f y :  Read.f z 
    vec3::Set(vertex_cube(i)\position, x, y, z)
    
    Read.f x : Read.f y
    vec2::Set(vertex_cube(i)\texCoord, x, y)
    
    Read.f x : Read.f y : Read.f z 
    vec3::Set(vertex_cube(i)\normal, x, y, z)
    
    vec3::Zero(vertex_cube(i)\tangent)
    
    vec3::Zero(vertex_cube(i)\bitangent)
 Next
     
 ; using indices to draw a quad
 
 Dim index.l (35) ; 6 indices * 6 quads
 Restore indices_data
 Protected index

 For i = 0 To 35 ; 36 indices 
    Read.l index
    index(i) = index
 Next
  
 DataSection
  indices_data:
  Data.l  0,  1,  2,  2,  3,  0
  Data.l  4,  5,  6,  6,  7,  4
  Data.l  8,  9, 10, 10, 11,  8
  Data.l 12, 13, 14, 14, 15, 12
  Data.l 16, 17, 18, 18, 19, 16
  Data.l 20, 21, 22, 22, 23, 20
 EndDataSection 

 ; the hard part (tangent and bitangent)
 
 CalcTangents(vertex_cube(), index())
 
 Protected *vertex_light = sgl::StartData() 
  ; 3 * vertex_pos + 2 * tex_coord 
  Data.f -1.0, -1.0,  1.0,   0.0, 0.0 ; one simple quad 
  Data.f  1.0, -1.0,  1.0,   1.0, 0.0
  Data.f  1.0,  1.0,  1.0,   1.0, 1.0
  Data.f -1.0,  1.0,  1.0,   0.0, 1.0
 sgl::StopData()

 
 ; the OBJECT
 
 ; vertex array
 glGenVertexArrays_(1, @gVao)
 glBindVertexArray_(gVao)
 
 ; vertex buffer
 glGenBuffers_(1, @vbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, vbo)
 ; 24 vertices made by 14 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 24 * 14 * SizeOf(Float), vertex_cube(), #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 14 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coord
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 14 * SizeOf(Float), 3 * SizeOf(Float))

 glEnableVertexAttribArray_(2) ; normals
 glVertexAttribPointer_(2, 3, #GL_FLOAT, #GL_FALSE, 14 * SizeOf(Float), 5 * SizeOf(Float))
 
 glEnableVertexAttribArray_(3) ; tangents
 glVertexAttribPointer_(3, 3, #GL_FLOAT, #GL_FALSE, 14 * SizeOf(Float), 8 * SizeOf(Float))

 glEnableVertexAttribArray_(4) ; bitangents
 glVertexAttribPointer_(4, 3, #GL_FLOAT, #GL_FALSE, 14 * SizeOf(Float), 11 * SizeOf(Float))

 ; index buffer
 glGenBuffers_(1, @ibo)
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 ; 36 indices made by 1 long each
 glBufferData_(#GL_ELEMENT_ARRAY_BUFFER, 36  * SizeOf(Long), index(), #GL_STATIC_DRAW)

 
 ; ... and the LIGHT
 
 ; vertex array
 glGenVertexArrays_(1, @gLightVao)
 glBindVertexArray_(gLightVao)
 
 ; vertex buffer
 glGenBuffers_(1, @lightVbo)
 glBindBuffer_(#GL_ARRAY_BUFFER, lightVbo)
 ; 4 vertices made by 5 floats each
 glBufferData_(#GL_ARRAY_BUFFER, 4 * 5 * SizeOf(Float), *vertex_light, #GL_STATIC_DRAW)

 glEnableVertexAttribArray_(0) ; point coords
 glVertexAttribPointer_(0, 3, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 0)
 
 glEnableVertexAttribArray_(1) ; texture coord
 glVertexAttribPointer_(1, 2, #GL_FLOAT, #GL_FALSE, 5 * SizeOf(Float), 3 * SizeOf(Float))
 
 ; we can share the same index buffer
 glBindBuffer_(#GL_ELEMENT_ARRAY_BUFFER, ibo)
 
 glBindVertexArray_(0) ; we are done

 ; Shaders
  
 Protected objects.sgl::ShaderObjects
 Protected vs, fs
 
 vs = sgl::CompileShaderFromFile("010.phong.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("010.phong.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gShader)
 

 vs = sgl::CompileShaderFromFile("010.light.vs", #GL_VERTEX_SHADER) 
 sgl::AddShaderObject(@objects, vs) 
 ASSERT(vs)
 
 fs = sgl::CompileShaderFromFile("010.light.fs", #GL_FRAGMENT_SHADER) 
 sgl::AddShaderObject(@objects, fs) 
 ASSERT(fs)
 
 gLightShader = sgl::BuildShaderProgram(@objects) ; link and build the program using the specified shader objects 
 ASSERT(gLightShader)
  
 ; Textures 
 
  ; build textures
 gDiffuseMap = CatchTexture(?DiffuseMap) 
 gSpecularMap = CatchTexture(?SpecularMap) 
 gNormalMap = CatchTexture(?NormalMap) 
 gEmissiveMap = CatchTexture(?EmissiveMap) 
 gLampTex = CatchTexture(?lamp)
  
 ; Timers
 
 gTimer = sgl::CreateTimer()

 ; Fonts 
 
 Dim ranges.sgl::BitmapFontRange(0)
 ; Latin (ascii)
 ranges(0)\firstChar  = 32
 ranges(0)\lastChar   = 128               
 gFon = RenderText::CreateBitmapFont("Arial", 10, #Null, ranges()) 
 ASSERT(gFon)
  
EndProcedure

Procedure SetupContext() 
 sgl::RegisterErrorCallBack(@CallBack_Error())
 
 If sgl::Init()
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MAJOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_MINOR, 3)
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_PROFILE, sgl::#PROFILE_CORE)     
     sgl::SetWindowHint(sgl::#HINT_WIN_OPENGL_DEBUG, 1)
           
     gWin = sgl::CreateWindow(#WIN_WIDTH, #WIN_HEIGHT, #TITLE$)
     
     If gWin
        sgl::MakeContextCurrent(gWin)
        
        sgl::RegisterWindowCallBack(gWin, sgl::#CALLBACK_WINDOW_REFRESH, @CallBack_WindowRefresh())     
     
        If glLoad::Load() = 0
            Debug glLoad::GetErrString()
        EndIf
     
        sgl::LoadExtensionsStrings()
         
        If sgl::IsDebugContext() = 0 Or sgl::EnableDebugOutput()  = 0 
            Debug "OpenGL debug output is not available !"
        EndIf   
             
        sgl::EnableVSYNC(#VSYNC)
        
        ProcedureReturn 
    EndIf
 EndIf
  
 sgl::Shutdown()
 
 End 
EndProcedure

Procedure ShutDown()
 sgl::DestroyTimer(gTimer)
 sgl::Shutdown()
EndProcedure

Procedure Render()
 Protected w, h, text$ 
 Protected delta.f
 Protected distance.f = 5.0
 Protected u_model, u_view, u_projection
 Protected u_light, u_material, u_lamp, u_eye, u_NormalMapping
 
 Protected.m4x4::m4x4 model, projection, view
 Protected.vec3::vec3 eye, lampColor

 Static rot.f
 Static orbit.f = 90.0
 Static emissiveFactor.f = 1.0, emissiveFactorInc.f = 1.0

 vec3::Set(eye, 0.0, 0.0, 0.0)
 
 Structure Light
  vPos.vec3::vec3
  vAmbientColor.vec3::vec3
  vDiffuseColor.vec3::vec3  
  vSpecularColor.vec3::vec3
  vEmissiveColor.vec3::vec3
 EndStructure
 
 Protected Light.Light
 
 Structure Material
  diffuseMap.i
  specularMap.i
  normalMap.i
  emissiveMap.i
  shiness.f   
 EndStructure
 
 Protected Material.Material
 
 sgl::GetWindowFrameBufferSize (gWin, @w, @h)
 glViewport_(0, 0, w, h)

 delta = sgl::GetDeltaTime(gTimer)
  
 orbit + 70.0 * delta 
 math::Clamp3f(orbit, 0.0, 360.0)
 
 ; light pos
 Light\vPos\x = Sin(Radian(orbit)) * 3.5
 Light\vPos\y = Sin(Radian(orbit) / 4.0) * 2.0
 Light\vPos\z = Cos(Radian(orbit)) * 3.5
 
 ; material  
 Material\diffuseMap  = 0 ; texture unit 0
 Material\specularMap = 1 ; texture unit 1 
 Material\normalMap   = 2 ; texture unit 2
 Material\emissiveMap = 3 ; texture unit 3
 Material\shiness = 32.0
 
 vec3::Set(Light\vEmissiveColor,   1.0, 1.0, 0.0)
 
 If gAmbientOn         
    glClearColor_(0.3, 0.3, 0.35, 1.0)
    vec3::Set(Light\vAmbientColor,    0.4, 0.4, 0.4)
    vec3::Set(Light\vDiffuseColor,    0.45, 0.45, 0.45)    
    vec3::Set(Light\vSpecularColor,   0.5, 0.5, 0.5)
    vec3::Set(lampColor, 1.0, 1.0, 1.0)
 Else    
    glClearColor_(0.15, 0.15, 0.2, 1.0)
    vec3::Set(Light\vAmbientColor,    0.2, 0.2, 0.25)
    vec3::Set(Light\vDiffuseColor,    0.0, 0.0, 0.0)
    vec3::Set(Light\vSpecularColor,   0.0, 0.0, 0.0)
    vec3::Set(lampColor, 0.1, 0.1, 0.1)
 EndIf
 
 If gSpecularOn = 0
    vec3::Zero(Light\vSpecularColor)
 EndIf
 
 If gDiffuseOn =  0
    vec3::Zero(Light\vDiffuseColor)
 EndIf
    
 glEnable_(#GL_DEPTH_TEST) 
 glClear_(#GL_COLOR_BUFFER_BIT | #GL_DEPTH_BUFFER_BIT)
 
 ; the view matrix and the projection matrix are common to the two shaders
 ; what we need to calculate separately are the two model matrix for the two objects
    
 ; view 
 m4x4::Identity(view)
 m4x4::TranslateXYZ(view, 0.0, 0.0, -distance)
 
 ; projection (the perspective projection is obviously the same)
 m4x4::Perspective(projection, 60.0, Math::Float(w)/Math::Float(h), 0.1, 100.0)
  
 ; this section is for the CUBE
 
 If gPulsating
    emissiveFactor + emissiveFactorInc * delta 
    If emissiveFactor > 1.0
        emissiveFactor = 1.0
        emissiveFactorInc = - emissiveFactorInc 
    EndIf
    If emissiveFactor < 0.0
        emissiveFactor = 0.0
        emissiveFactorInc = - emissiveFactorInc 
    EndIf
 Else
    emissiveFactor = 1.0
 EndIf
 
 rot - 15  * delta 
 math::Clamp3f(rot, 0.0, 360.0)
 
 ; model (the cube will rotate at the origin)
 m4x4::Identity(model)
 m4x4::RotateX(model, -20.0)
 m4x4::RotateY(model, rot)

 sgl::BindShaderProgram(gShader)
 
 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gDiffuseMap)

 glActiveTexture_(#GL_TEXTURE1)
 glBindTexture_(#GL_TEXTURE_2D, gSpecularMap)
 
 glActiveTexture_(#GL_TEXTURE2)
 glBindTexture_(#GL_TEXTURE_2D, gNormalMap)
 
 glActiveTexture_(#GL_TEXTURE3)
 glBindTexture_(#GL_TEXTURE_2D, gEmissiveMap)

 u_NormalMapping = sgl::GetUniformLocation(gShader, "u_NormalMapping")
 sgl::SetUniformLong(u_NormalMapping, gNormalMappingOn)
 
 u_model = sgl::GetUniformLocation(gShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)
 
 u_eye = sgl::GetUniformLocation(gShader, "u_eye")
 sgl::SetUniformVec3(u_eye, eye)

 ; light
 
 u_light = sgl::GetUniformLocation(gShader, "u_light.vPos")
 sgl::SetUniformVec3(u_light, Light\vPos)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vDiffuseColor")
 sgl::SetUniformVec3(u_light, Light\vDiffuseColor)

 u_light = sgl::GetUniformLocation(gShader, "u_light.vAmbientColor")
 sgl::SetUniformVec3(u_light, Light\vAmbientColor)  

 u_light = sgl::GetUniformLocation(gShader, "u_light.vSpecularColor")
 sgl::SetUniformVec3(u_light, Light\vSpecularColor)
 
 Protected.vec3::vec3 pulseColor
 vec3::Scale(Light\vEmissiveColor, emissiveFactor, pulseColor)
 
 u_light = sgl::GetUniformLocation(gShader, "u_light.vEmissiveColor")
 sgl::SetUniformVec3(u_light, pulseColor)
  
 ; material 

 u_material = sgl::GetUniformLocation(gShader, "u_material.diffuseMap")
 sgl::SetUniformLong(u_material, Material\diffuseMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.specularMap")
 sgl::SetUniformLong(u_material, Material\specularMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.normalMap")
 sgl::SetUniformLong(u_material, Material\normalMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.emissiveMap")
 sgl::SetUniformLong(u_material, Material\emissiveMap)
 
 u_material = sgl::GetUniformLocation(gShader, "u_material.shiness")
 sgl::SetUniformFloat(u_material, Material\shiness)
 
 glBindVertexArray_(gVao) 
 glDrawElements_(#GL_TRIANGLES, 36, #GL_UNSIGNED_INT, 0) 

 ; this section is for the LIGHT

 ; model (the light will orbit around the origin)
     
 m4x4::Identity(model)
 m4x4::Translate(model, Light\vPos)
 m4x4::ScaleXYZ(model, 0.15, 0.15, 0.15)
 
 sgl::BindShaderProgram(gLightShader)

 glActiveTexture_(#GL_TEXTURE0)
 glBindTexture_(#GL_TEXTURE_2D, gLampTex)
 
 u_model = sgl::GetUniformLocation(gLightShader, "u_model")
 sgl::SetUniformMatrix4x4(u_model, @model)
 
 u_view = sgl::GetUniformLocation(gLightShader, "u_view")
 sgl::SetUniformMatrix4x4(u_view, @view)
 
 u_projection = sgl::GetUniformLocation(gLightShader, "u_projection")
 sgl::SetUniformMatrix4x4(u_projection, @projection)

 u_lamp  = sgl::GetUniformLocation(gLightShader, "u_lamp.color")
 sgl::SetUniformVec3(u_lamp, @lampColor)

 u_lamp  = sgl::GetUniformLocation(gLightShader, "u_lamp.texture")
 sgl::SetUniformLong(u_lamp, 0)

 glEnable_(#GL_BLEND)
 glBlendFunc_(#GL_SRC_ALPHA, #GL_ONE_MINUS_SRC_ALPHA) 
 
 glBindVertexArray_(gLightVao) 
 glDrawElements_(#GL_TRIANGLES, 6, #GL_UNSIGNED_INT, 0) ; our light
 
 glDisable_(#GL_BLEND)
 
 ; text info
 
 Protected x, y 
 Protected.vec3::vec3 color 
 
 ; top
 vec3::Set(color, 1.0, 1.0, 1.0)
 x = 1 : y = 0
 If sgl::GetFPS()    
    RenderText::Render(gWin, gFon, "FPS: " + sgl::GetFPS(), x, y, color)
 EndIf

 vec3::Set(color, 1.0, 1.0, 0.5) 
 x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
 If gAmbientOn 
    text$ = "[L]ight is ON"
 Else
    text$ = "[L]ight is OFF"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)

 If gAmbientOn     
     x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
     If gSpecularOn = 0 
        text$ = "[S]pecular lighting is OFF"
     Else
        text$ = "[S]pecular lighting is ON"
     EndIf 
     RenderText::Render(gWin, gFon, text$, x, y, color)
    
     x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
     If gDiffuseOn = 0 
        text$ = "[D]iffuse lighting is OFF"
     Else
        text$ = "[D]iffuse lighting is ON"
     EndIf 
     RenderText::Render(gWin, gFon, text$, x, y, color)
   
     x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
     If gNormalMappingOn = 0 
        text$ = "[N]ormal mapping is OFF"
     Else
        text$ = "[N]ormal mapping is ON"
     EndIf 
     RenderText::Render(gWin, gFon, text$, x, y, color)     
 EndIf
 
 x = 1 : y + RenderText::GetFontHeight(gFon) * 1.5
 If gPulsating = 0 
    text$ = "[P]ulsating light is OFF"
 Else
    text$ = "[P]ulsating light is ON"
 EndIf 
 RenderText::Render(gWin, gFon, text$, x, y, color)

 ; bottom
 vec3::Set(color, 1.0, 1.0, 1.0) 
 x = 1 : y = h - RenderText::GetFontHeight(gFon)  
 text$ = sgl::GetRenderer()
 RenderText::Render(gWin, gFon, text$, x, y, color)

 sgl::SwapBuffers(gWin)
EndProcedure

Procedure MainLoop()

 gAmbientOn = 1
 gDiffuseOn = 1
 gSpecularOn = 1
 gNormalMappingOn = 1
 gPulsating = 1
 
 While sgl::WindowShouldClose(gWin) = 0
 
    If sgl::GetKeyPress(sgl::#Key_ESCAPE)
        sgl::SetWindowShouldClose(gWin, 1)
    EndIf

    If sgl::GetKeyPress(sgl::#Key_V)
        gVSync ! 1
        sgl::EnableVSync(gVSync)
    EndIf
    
    If sgl::GetKeyPress(sgl::#Key_P)
        gPulsating ! 1        
    EndIf

    If sgl::GetKeyPress(sgl::#Key_L)
        gAmbientOn ! 1
    EndIf
    
    If sgl::GetKeyPress(sgl::#Key_N)
        If gAmbientOn
            gNormalMappingOn ! 1
        EndIf
    EndIf
    
    If sgl::GetKeyPress(sgl::#Key_S)
        If gAmbientOn
            gSpecularOn ! 1
        EndIf
    EndIf

    If sgl::GetKeyPress(sgl::#Key_D)
        If gAmbientOn
            gDiffuseOn ! 1
        EndIf
    EndIf
    
    If sgl::IsWindowMinimized(gWin) = 0
        Render()
        sgl::TrackFPS()
    EndIf     
   
    sgl::PollEvents()          
 Wend
EndProcedure

Procedure Main()
 SetupContext()
 SetupData()
 MainLoop()    
 ShutDown()
EndProcedure : Main()
; IDE Options = PureBasic 6.02 LTS (Windows - x86)
; CursorPosition = 684
; FirstLine = 640
; Folding = ---
; Optimizer
; EnableXP
; EnableUser
; Executable = C:\Users\luis\Desktop\Share\sgl\010\normal_map.exe
; CPU = 1
; CompileSourceDirectory