Procedure.i SaveFontBitmapData (f$, *fbd.FontBitmapData)
;> Saves a PNG image and a complementary XML file with all the data mapping the chars inside the image.
; See LoadFontBitmapData()

; f$ is the base filename without extension
; example: "C:\bitmapped\arial" will save a "arial.png" and a "arial.xml" 

 Protected baseName$, pathOnly$, fullPathName$ 
 baseName$ = GetFilePart(f$, #PB_FileSystem_NoExtension)
 pathOnly$ = GetPathPart(f$)
 fullPathName$ = pathOnly$ + baseName$
 
 If IsImage(*fbd\image) = 0
    ProcedureReturn 0
 EndIf
    
 If SaveImage(*fbd\image, fullPathName$ + ".png", #PB_ImagePlugin_PNG)
 
    Protected count
    Protected xml, main, child
    
    xml = CreateXML(#PB_Any) 
    
    If xml 
        main = CreateXMLNode(RootXMLNode(xml), "BitmapFont") 
        
        child = CreateXMLNode(main, "FontName") 
        SetXMLNodeText(child, *fbd\fontName$)    
        child = CreateXMLNode(main, "FontSize") 
        SetXMLNodeText(child, Str(*fbd\fontSize))
        child = CreateXMLNode(main, "FirstChar") 
        SetXMLNodeText(child, Str(*fbd\firstChar))
        child = CreateXMLNode(main, "LastChar") 
        SetXMLNodeText(child, Str(*fbd\lastChar))
      
        For count = *fbd\firstChar To *fbd\lastChar
            child = CreateXMLNode(main, "Char") 
            SetXMLAttribute(child , "Asc", Str(count) )
            SetXMLAttribute(child , "X", Str(*fbd\Glyphs(count)\x))
            SetXMLAttribute(child , "Y", Str(*fbd\Glyphs(count)\y))
            SetXMLAttribute(child , "W", Str(*fbd\Glyphs(count)\w))
            SetXMLAttribute(child , "H", Str(*fbd\Glyphs(count)\h))
        Next
        
        FormatXML(xml, #PB_XML_ReFormat)
    
        SaveXML(xml, fullPathName$ + ".xml")
      
        FreeXML(xml) 
    EndIf            
    ProcedureReturn 1     
 EndIf
  
 ProcedureReturn 0
EndProcedure

Procedure.i LoadFontBitmapData (f$)
;> Load a PNG image and a complementary XML and return a pointer to a populated FontBitmapData.
; See SaveFontBitmapData()

; f$ is the base filename without extension
; example: "C:\bitmapped\arial" will load a "arial.png" and a "arial.xml" 

 Protected *fbd.FontBitmapData, img
 Protected baseName$, pathOnly$, fullPathName$ 
 
 baseName$ = GetFilePart(f$, #PB_FileSystem_NoExtension)
 pathOnly$ = GetPathPart(f$)
 fullPathName$ = pathOnly$ + baseName$
     
 *fbd = AllocateStructure(FontBitmapData)
 If *fbd =  0 : Goto exit : EndIf
 
 img = LoadImage(#PB_Any, fullPathName$ + ".png", #PB_ImagePlugin_PNG) 
 If img = 0 : Goto exit : EndIf
 
 Protected c, count
 Protected xml, main, child, node

 xml = LoadXML(#PB_Any, fullPathName$ + ".xml")   
 If xml = 0 : Goto exit : EndIf 
 If XMLStatus(xml) <> #PB_XML_Success : Goto exit : EndIf 
  
 main  = MainXMLNode(xml)
 count = XMLChildCount(main)
  
 If GetXMLNodeName(main) <> "BitmapFont" : Goto exit : EndIf
  
 node = ChildXMLNode(main, 1) 
 If GetXMLNodeName(node) <> "FontName" : Goto exit : EndIf
 *fbd\fontName$ = GetXMLNodeText(node)

 node = ChildXMLNode(main, 2) 
 If GetXMLNodeName(node) <> "FontSize" : Goto exit : EndIf
 *fbd\fontSize = Val(GetXMLNodeText(node))
 
 node = ChildXMLNode(main, 3) 
 If GetXMLNodeName(node) <> "FirstChar" : Goto exit : EndIf
 *fbd\firstChar = Val(GetXMLNodeText(node))
 
 node = ChildXMLNode(main, 4) 
 If GetXMLNodeName(node) <> "LastChar" : Goto exit : EndIf
 *fbd\lastChar = Val(GetXMLNodeText(node))
 
 Dim *fbd\Glyphs(count - 5)
 
 For c = 5 To count 
    node = ChildXMLNode(main, c)
    *fbd\Glyphs(c - 5)\char = Val(GetXMLAttribute(node, "Asc"))
    *fbd\Glyphs(c - 5)\x = Val(GetXMLAttribute(node, "X"))
    *fbd\Glyphs(c - 5)\y = Val(GetXMLAttribute(node, "Y"))
    *fbd\Glyphs(c - 5)\w = Val(GetXMLAttribute(node, "W"))
    *fbd\Glyphs(c - 5)\h = Val(GetXMLAttribute(node, "H"))  
 Next
 
 FreeXML(xml)
 
 *fbd\image = img
    
 ProcedureReturn *fbd
  
 exit:
 
 If *fbd : FreeStructure(*fbd) : EndIf
 If img : FreeImage(img) : EndIf
 If xml : FreeXML(xml) : EndIf 
 
 ProcedureReturn 0
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; Folding = -
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory