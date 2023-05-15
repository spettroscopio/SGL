UseZipPacker()

  If CreatePack(0, "myfont.zip", #PB_PackerPlugin_Zip) 
  
    ; add your files 
    AddPackFile(0, "demo.xml", "demo.xml")  
    ClosePack(0) 
  EndIf


  If OpenPack(0, "myfont.zip") 
    
     If ExaminePack(0)
       While NextPackEntry(0)
         Debug "Name: " + PackEntryName(0) + ", Size: " + PackEntrySize(0)
         size = PackEntrySize(0)
         *buffer = AllocateMemory(size) 
         Debug UncompressPackMemory(0, *buffer, size)
         ;ShowMemoryViewer(*buffer, size)
         ;FreeMemory(*buffer)
       Wend
     EndIf
    
    ClosePack(0)
  EndIf


  xml = CatchXML(#PB_Any, *buffer, size)  
  Debug XMLStatus(xml)  
  
  mn = MainXMLNode(xml)
  Debug XMLChildCount(mn)
  
  Debug GetXMLNodeName(mn)
  
  node = ChildXMLNode(mn, 1)
  Debug GetXMLNodeName(node)
  Debug GetXMLNodeText(node)
  
  node = ChildXMLNode(mn, 2)
  Debug GetXMLNodeName(node)
  Debug GetXMLNodeText(node)

  node = ChildXMLNode(mn, 3)
  Debug GetXMLNodeName(node)
  Debug GetXMLNodeText(node)

  node = ChildXMLNode(mn, 4)
  Debug GetXMLNodeName(node)
  Debug GetXMLNodeText(node)

  node = ChildXMLNode(mn, 5)
  Debug GetXMLNodeName(node)
  Debug GetXMLAttribute(node, "asc")
  Debug GetXMLAttribute(node, "x")
  Debug GetXMLAttribute(node, "y")
  Debug GetXMLAttribute(node, "w")
  Debug GetXMLAttribute(node, "h")
  

  FreeXML(xml)
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 18
; FirstLine = 1
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory