
  ; Create xml tree
  xml = CreateXML(#PB_Any) 
  mainNode = CreateXMLNode(RootXMLNode(xml), "BitmapFont") 
  
  
  item = CreateXMLNode(mainNode, "FontName") 
  SetXMLNodeText(item, "Elephant")
  

  item = CreateXMLNode(mainNode, "FontSize") 
  SetXMLNodeText(item, "18") 
  
  item = CreateXMLNode(mainNode, "FirstChar") 
  SetXMLNodeText(item, "32") 
  item = CreateXMLNode(mainNode, "LastChar") 
  SetXMLNodeText(item, "128") 
  
  item = CreateXMLNode(mainNode, "Char") 
  SetXMLAttribute(item, "Asc", "32")
  SetXMLAttribute(item, "X", "1")
  SetXMLAttribute(item, "Y", "1")
  SetXMLAttribute(item, "W", "17")
  SetXMLAttribute(item, "H", "52")
  
  item = CreateXMLNode(mainNode, "Char") 
  SetXMLAttribute(item, "Asc", "32")
  SetXMLAttribute(item, "X", "1")
  SetXMLAttribute(item, "Y", "1")
  SetXMLAttribute(item, "W", "17")
  SetXMLAttribute(item, "H", "52")

  item = CreateXMLNode(mainNode, "Char") 
  SetXMLAttribute(item, "Asc", "32")
  SetXMLAttribute(item, "X", "1")
  SetXMLAttribute(item, "Y", "1")
  SetXMLAttribute(item, "W", "17")
  SetXMLAttribute(item, "H", "52")
  
  ; Save the xml tree into a xml file
  FormatXML(xml, #PB_XML_ReFormat)

  SaveXML(xml, "demo.xml")
  
  FreeXML(xml)
  
  xml = LoadXML(#PB_Any, "demo.xml")  
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
  Debug GetXMLAttribute(node, "Asc")
  Debug GetXMLAttribute(node, "X")
  Debug GetXMLAttribute(node, "Y")
  Debug GetXMLAttribute(node, "W")
  Debug GetXMLAttribute(node, "H")
  

  FreeXML(xml)
; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 76
; FirstLine = 31
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory