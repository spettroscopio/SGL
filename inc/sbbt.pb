; *********************************************************************************************************************
; sbbt.pb
; by Luis
;
; Implementation of a Self-Balancing Binary Tree.
;
; 1.20, May 06 2023, PB 6.01
; Reworked, added the ability to have an integer or a string as the key, added some new functions.
;
; 1.10, Jan 06 2018, PB 5.61
; Reworked, many functions added.
;
; 1.00, Apr 30 2017, PB 5.60
; First release.
; *********************************************************************************************************************

; A self-balancing binary tree based on the AA-Tree data structure as defined by Arne Andersson.
; http://en.wikipedia.org/wiki/AA_tree
; A self-balancing tree keeps its height to the minimum, so its lookup operations are faster and it does not degenerate into a list 
; in case it has been fed with a sorted input.

; Insertions and deletions are costly operations compared to other data structures, anyway it has some advantages:

; - Its height is constantly optimized so lookups are very vast and require few iterations.
; - It is kept in a constantly sorted state.
; - The whole tree can be traversed in ascending or descending order.
; - It's possibile to enumerate in a orderly fashion the keys before or after the current one, for example after a lookup operation.
; - Its lowest and highest keys are immediately accessible.

; This implementation supports insertion, search, deletion, enumeration in ascending/descending order and manual navigation. 
; Can be used with just the key (a string or an integer) or with an optional value associated to the key. 
; You can use that value to store a pointer to a complex data structure, or use it as a counter or anything else.
; All the keys must be UNIQUE.

DeclareModule sbbt
EnableExplicit

#EnumAscending  = 0
#EnumDescending = 1

Declare.i   New (type) ; Allocates a new tree, specifying the type of the key as #PB_Integer or #PB_String.
Declare     Free (t) ; Deallocates the tree releasing all memory.
Declare     Clear (t) ; Empties the tree but keeps it allocated.
Declare.i   Count (t) ; Returns the number of nodes in the tree.
Declare.i   Empty (t) ; Returns #True if the tree is empty.
Declare.i   GetHeight (t) ; Returns the height of the tree: 0 for a tree with just the root node, -1 for an empty tree.
Declare.i   EnumStart (t, dir = #EnumAscending) ; Prepares the tree to be enumerated with EnumNext() in ascending or descending order.
Declare.i   EnumStartFrom (t, n, dir = #EnumAscending) ; Prepares the tree to be enumerated with EnumNext() in ascending or descending order starting from the specified node.
Declare.i   EnumNext (t) ; Enumerates the next node from the tree, setting the current node to it.
Declare     EnumEnd (t) ; Ends the current enumeration sequence.
Declare.i   Insert (t, key, value = 0) ; Inserts a new node in the tree (if not already present) with key and optionally assigning a value to it.
Declare.i   InsertStr (t, key$, value = 0) ; Inserts a new node in the tree (if not already present) with key$ and optionally assigning a value to it.
Declare.i   Search (t, key, *value = 0) ; Search for an item in the tree using key and optionally copies its associated value to the pointed integer *value.
Declare.i   SearchStr (t, key$, *value = 0) ; Search for an item in the tree using key$ and optionally copies its associated value to the pointed integer *value.
Declare.i   Delete (t, key, *value = 0) ; Delete the node indexed by key from the tree and optionally copies its integer value to the pointed integer *value.
Declare.i   DeleteStr (t, key$, *value = 0) ; Delete the node indexed by key$ from the tree and optionally copies its integer value to the pointed integer *value.
Declare.i   GetRoot (t) ; Returns the root node of the specified tree.
Declare.i   GetCurrent (t) ; Returns 0 if there is no current node, else the address of the node.
Declare.i   GetKeyType (t) ; Returns the key type of the tree.
Declare.i   GetKey (t) ; Returns the key of the current node.
Declare.s   GetKeyStr (t) ; Returns the key of the current node.
Declare.i   GetKeyOf (t, n) ; Returns the key of the specified node.
Declare.s   GetKeyStrOf (t, n) ; Returns the key of the specified node.
Declare.i   GetLowestKey (t) ; Returns the lowest key from the tree.
Declare.s   GetLowestKeyStr (t) ; Returns the lowest key$ from the tree.
Declare.i   GetHighestKey (t) ; Returns the highest key from the tree.
Declare.s   GetHighestKeyStr (t) ; Returns the highest key$ from the tree.
Declare.i   GetValue (t) ; Returns the value associated with the current node.
Declare.i   GetValueOf (t, n) ; Returns the value associated with the specified node.
Declare     SetValue (t, value) ; Set the value associated with the current node to value.
Declare     SetValueOf (t, n, value) ; Set the value associated with the specified node.
Declare     AddValue (t, value) ; Add value to the value associated with the current node.
Declare     AddValueOf (t, n, value) ; Add value to the value associated with the specified node.
Declare     IncValue (t) ; Increments the value associated with the current node.
Declare     IncValueOf (t, n) ; Increments the value associated with the specified node.
Declare     DecValue (t) ; Decrements the value associated with the current node.
Declare     DecValueOf (t, n) ; Decrements the value associated with the specified node.
Declare.i   GetLeft (t) ; Returns the node to the left of the current node.
Declare.i   GetRight (t) ; Returns the node to the right of the current node.
Declare.i   GetTop (t) ; Returns the address of the parent of the current node, or 0 if there is no such node.
Declare.i   GetLeftOf (t, n) ; Returns the address of the node to the left of the specified node, or 0 if there is no such node.
Declare.i   GetRightOf (t, n) ; Returns the address of the node to the right of the specified node, or 0 if there is no such node.
Declare.i   GetTopOf (t, n) ; Returns the address of the parent of the specified node, 0 if there is no such node.
Declare.i   GetFirst (t) ; Returns the address of the node with the lowest key, or 0 if there are no nodes.
Declare.i   GetLast (t) ; Returns the address of the node with the highest key, or 0 if there are no nodes.
Declare.i   GoFirst (t) ; Jumps to the node with the lowest key and makes it the current node.
Declare.i   GoLast (t) ; Jumps to the node with the highest key and makes it the current node.
Declare.i   GoNext (t) ; Moves  to the next node with a key immediately greater then the current one and makes it the current node.
Declare.i   GoPrev (t) ; Moves  to the previous node with a key immediately smaller then the current one and makes it the current node.

EndDeclareModule

Module sbbt
 
Structure SbbtObj
 *root.SbbtNode
 *CurrentNode.SbbtNode
 *PostDelete.SbbtNode
 *PostInsert.SbbtNode
 EnumDirection.i
 TotalNodes.i 
 Modified.i  
 KeyType.i
EndStructure 

Structure SbbtNode
 *left.SbbtNode
 *right.SbbtNode
 *top.SbbtNode
 key$
 key.i
 value.i
 level.i
EndStructure

;- Internals

Procedure.i Min (a, b)
 If a < b
   ProcedureReturn a
 EndIf  
 ProcedureReturn b  
EndProcedure

Procedure.i Max (a, b)
 If a < b
   ProcedureReturn b
 EndIf  
 ProcedureReturn a
EndProcedure

Procedure TreeHeight (n)
 ; the root node must be passed, so the tree must have at least one node to call this
 Protected *n.SbbtNode = n
 
 If *n\left = 0 And *n\right = 0
    ProcedureReturn 0
 ElseIf *n\left = 0
    ProcedureReturn 1 + TreeHeight(*n\right)
 ElseIf *n\right = 0   
    ProcedureReturn 1 + TreeHeight(*n\left)
 Else
    ProcedureReturn 1 + Max(TreeHeight(*n\left), TreeHeight(*n\right))
 EndIf
EndProcedure

Procedure.i SplitTreeNode (*n.SbbtNode)
 Protected *rn.SbbtNode
 
 If *n = #Null
    ProcedureReturn #Null
 EndIf

 If *n\right = #Null Or *n\right\right = #Null
    ProcedureReturn *n
 EndIf
 
 If *n\level = *n\right\right\level
     *rn = *n\right
     *n\right = *rn\left
     If *n\right
        *n\right\top = *n
     EndIf
     *rn\left = *n
     *n\top = *rn
     *rn\level + 1
     ProcedureReturn *rn
 EndIf
 
 ProcedureReturn *n
EndProcedure

Procedure.i SkewTreeNode (*n.SbbtNode)
 Protected *ln.SbbtNode
 
 If *n = #Null
    ProcedureReturn #Null
 EndIf
 
 If *n\left = #Null
    ProcedureReturn *n
 EndIf
 
 If *n\left\level = *n\level
    *ln = *n\left
    *n\left = *ln\right
    If *n\left
        *n\left\top = *n
    EndIf
    *ln\right = *n
    *ln\right\top = *ln
    ProcedureReturn *ln
 Else
    ProcedureReturn *n
 EndIf
EndProcedure

Procedure.i DecreaseTreeLevel (*n.SbbtNode)
 Protected target, ll, lr
 
 If *n\left 
    ll = *n\left\level
 EndIf
 
 If *n\right
    lr = *n\right\level
 EndIf

 target = Min(ll, lr) + 1
 
 If target < *n\level
    *n\level = target
    If *n\right
        If target < *n\right\level
            *n\right\level = target
        EndIf
    EndIf
 EndIf
 ProcedureReturn *n
EndProcedure

Procedure.i PredecessorTreeNode (*n.SbbtNode)
 While *n\right 
    *n = *n\right 
 Wend
 ProcedureReturn *n
EndProcedure

Procedure.i SuccessorTreeNode (*n.SbbtNode)
 While *n\left
    *n = *n\left
 Wend
 ProcedureReturn *n
EndProcedure

Procedure.i NextSmallerTreeNode (*t.SbbtObj) 
 Protected *n.SbbtNode = *t\CurrentNode   
 Protected key$ = *n\key$
 Protected key = *n\key
 
 If *t\KeyType = #PB_Integer
    If *n\left = 0 ; nothing right here, go up and check
        While *n\top
            *n = *n\top
            If *n\key < key
                ProcedureReturn *n ; the first one which is smaller is the one
            EndIf       
        Wend
        ProcedureReturn 0 ; nothing greater
    EndIf
 Else ; #PB_String   
    If *n\left = 0 ; nothing right here, go up and check
        While *n\top
            *n = *n\top
            If *n\key$ < key$
                ProcedureReturn *n ; the first one which is smaller is the one
            EndIf       
        Wend
        ProcedureReturn 0 ; nothing greater
    EndIf
 EndIf
 
 *n = *n\left ; this is smaller
 
 If *n\right = 0 ; if there is nothing a little bigger 
    ProcedureReturn *n ; that's it
 EndIf
 
 While *n\right ; descend to the bottom 
    *n = *n\right
 Wend
 
 ProcedureReturn *n ; this at the bottom is the biggest just smaller than the input
EndProcedure

Procedure.i NextGreaterTreeNode (*t.SbbtObj) 
 Protected *n.SbbtNode = *t\CurrentNode    
 Protected key$ = *n\key$
 Protected key = *n\key
 
 If *t\KeyType = #PB_Integer
    If *n\right = 0 ; nothing right here, go up and check
        While *n\top
            *n = *n\top
            If *n\key > key
                ProcedureReturn *n ; the first one which is greater is the one
            EndIf       
        Wend
        ProcedureReturn 0 ; nothing greater
    EndIf 
 Else ; #PB_String
    If *n\right = 0 ; nothing right here, go up and check
        While *n\top
            *n = *n\top
            If *n\key$ > key$
                ProcedureReturn *n ; the first one which is greater is the one
            EndIf       
        Wend
        ProcedureReturn 0 ; nothing greater
    EndIf
 EndIf
 
 *n = *n\right ; this is greater
 
 If *n\left = 0 ; if there is nothing a little smaller
    ProcedureReturn *n ; that's it
 EndIf
 
 While *n\left ; descend to the bottom 
    *n = *n\left
 Wend
 
 ProcedureReturn *n ; this at the bottom is the smallest just greater than the input
EndProcedure

Procedure FreeTreeNode (*t.SbbtObj, *n.SbbtNode)
 If *n
    FreeTreeNode (*t, *n\left)
    FreeTreeNode (*t, *n\right)    
    *t\TotalNodes - 1
    FreeStructure(*n)    
 EndIf
EndProcedure

Procedure.i DeleteTreeNode (*t.SbbtObj, *n.SbbtNode, key, *value)
 ; returns the address of the new root of the new re-balanced tree
 Protected *ln.SbbtNode
 Protected match
 
 If *n = #Null
    ProcedureReturn 0
 EndIf
 
 If *t\KeyType = #PB_Integer
    If key > *n\key
        *n\right = DeleteTreeNode(*t, *n\right, key, *value)
        If *n\right
            *n\right\top = *n
        EndIf
    ElseIf key < *n\key
        *n\left = DeleteTreeNode(*t, *n\left, key, *value)
        If *n\left
            *n\left\top = *n
        EndIf
    Else          
        match = 1 
    EndIf
 Else ; #PB_String
    If PeekS(key) > *n\key$ 
        *n\right = DeleteTreeNode(*t, *n\right, key, *value)
        If *n\right
            *n\right\top = *n
        EndIf
    ElseIf PeekS(key) < *n\key$
        *n\left = DeleteTreeNode(*t, *n\left, key, *value)
        If *n\left
            *n\left\top = *n
        EndIf
    Else                  
        match = 1
    EndIf
 EndIf
 
 If match
    If *value And *t\Modified = #False            
        PokeI(*value, *n\value)
    EndIf        
    
    *t\Modified = #True

    If (*n\left = #Null) And (*n\right = #Null) ; leaf            
        *t\PostDelete = *n
        ProcedureReturn #Null
    EndIf
    
    If *n\left = #Null 
        *ln = SuccessorTreeNode(*n\right)
        If *t\KeyType = #PB_Integer
            *n\right = DeleteTreeNode(*t, *n\right, *ln\key, *value)
        Else
            *n\right = DeleteTreeNode(*t, *n\right, @*ln\key$, *value)
        EndIf
        
        If *n\right
            *n\right\top = *n
        EndIf
    Else
        *ln = PredecessorTreeNode(*n\left)
        If *t\KeyType = #PB_Integer
            *n\left = DeleteTreeNode(*t, *n\left, *ln\key, *value)
        Else
            *n\left = DeleteTreeNode(*t, *n\left, @*ln\key$, *value)
        EndIf
        If *n\left
            *n\left\top = *n
        EndIf            
    EndIf        

    If *t\KeyType = #PB_Integer                     
        *n\key = *ln\key
    Else
        *n\key$ = *ln\key$
    EndIf
    
    *n\value = *ln\value                         
 EndIf
   
 *n = DecreaseTreeLevel(*n)
  
 *n = SkewTreeNode(*n) 
 
 *n\right = SkewTreeNode(*n\right) 

 If *n\right
    *n\right\top = *n
 EndIf
 
 If *n\right
    *n\right\right = SkewTreeNode(*n\right\right) 
 EndIf 

 *n = SplitTreeNode(*n) 
 
 *n\right = SplitTreeNode(*n\right)
 
 If *n\right
    *n\right\top = *n
 EndIf
 
 ProcedureReturn *n
EndProcedure

Procedure.i InsertTreeNode (*t.SbbtObj, *n.SbbtNode, key)  
 ; returns the address of the new root of the new re-balanced tree
 
 If *n = #Null 
    *n = AllocateStructure(SbbtNode)
    If *n
        If *t\KeyType = #PB_Integer
            *n\key = key
        Else
            *n\key$ = PeekS(key)
        EndIf
        *n\level = 1
        *t\PostInsert = *n
        *t\Modified = #True
    EndIf
    ProcedureReturn *n
 Else
    If *t\KeyType = #PB_Integer
        If key < *n\key
            *n\left = InsertTreeNode(*t, *n\left, key)
            *n\left\top = *n
        ElseIf key > *n\key
            *n\right = InsertTreeNode (*t, *n\right, key)
            *n\right\top = *n
        EndIf
        If *t\PostInsert = 0
            *t\PostInsert = *n
        EndIf        
    Else ; #PB_String   
        If PeekS(key) < *n\key$ 
            *n\left = InsertTreeNode (*t, *n\left, key)
            *n\left\top = *n
        ElseIf PeekS(key) > *n\key$ 
            *n\right = InsertTreeNode (*t, *n\right, key)
            *n\right\top = *n
        EndIf
        If *t\PostInsert = 0
            *t\PostInsert = *n
        EndIf
    EndIf    
 EndIf
    
 *n = SkewTreeNode(*n) 
 
 *n = SplitTreeNode(*n) 
 
 ProcedureReturn *n
EndProcedure

Procedure.i SearchTreeNode (*t.SbbtObj, *n.SbbtNode, key)
 ; return the address of the matching node     
 If *t\KeyType = #PB_Integer
     While *n        
        If key < *n\key
            *n = *n\left
            Continue
        EndIf
        
        If key > *n\key
            *n = *n\right
            Continue
        EndIf
        
        ProcedureReturn *n
     Wend 
 Else ; #PB_String
     While *n        
        If PeekS(key) < *n\key$
            *n = *n\left
            Continue
        EndIf
        
        If PeekS(key) > *n\key$
            *n = *n\right
            Continue
        EndIf
        
        ProcedureReturn *n
     Wend 
 EndIf
  
 ProcedureReturn 0
EndProcedure

Procedure.i EnumNextAscending (*t.SbbtObj) 
 Protected *n.SbbtNode

 If *t\CurrentNode
    *n = NextGreaterTreeNode(*t)
    If *n
        *t\CurrentNode = *n
    Else        
        ProcedureReturn 0
    EndIf    
 Else
    *t\CurrentNode = SuccessorTreeNode(*t\root)            
 EndIf
 
 ProcedureReturn *t\CurrentNode
EndProcedure

Procedure.i EnumNextDescending (*t.SbbtObj) 
 Protected *n.SbbtNode

 If *t\CurrentNode
    *n = NextSmallerTreeNode(*t)
    If *n
        *t\CurrentNode = *n
    Else        
        ProcedureReturn 0
    EndIf    
 Else
    *t\CurrentNode = PredecessorTreeNode(*t\root)            
 EndIf
 
 ProcedureReturn *t\CurrentNode
EndProcedure

;- Public

Procedure.i New (type) 
;> Allocates a new tree, specifying the type of the key as #PB_Integer or #PB_String.
 
 Protected *t.SbbtObj
 
 If type <> #PB_Integer And type <> #PB_String
    ProcedureReturn 0
 EndIf

 *t.SbbtObj = AllocateStructure(SbbtObj)
 
 If *t    
    *t\KeyType = type
 EndIf
  
 ProcedureReturn *t
EndProcedure

Procedure Free (t)
;> Deallocates the tree releasing all memory.

 Protected *t.SbbtObj = t
 
 If *t\root
    FreeTreeNode(*t, *t\root)  
    FreeStructure(*t)
 EndIf
EndProcedure

Procedure Clear (t)
;> Empties the tree but keeps it allocated.

 Protected *t.SbbtObj = t
 
 If *t\root
    FreeTreeNode(*t, *t\root)
    ClearStructure(*t, SbbtObj)
 EndIf
EndProcedure

Procedure.i Count (t) 
;> Returns the number of nodes in the tree.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\TotalNodes
EndProcedure

Procedure.i Empty (t) 
;> Returns #True if the tree is empty.

 Protected *t.SbbtObj = t
 ProcedureReturn Bool(*t\TotalNodes = 0)
EndProcedure

Procedure.i GetHeight (t)
;> Returns the height of the tree: 0 for a tree with just the root node, -1 for an empty tree.  

 Protected *t.SbbtObj = t 
 If *t\root = #Null
    ProcedureReturn -1
 EndIf
 ProcedureReturn TreeHeight(*t\root)
EndProcedure

Procedure.i EnumStart (t, dir = #EnumAscending) 
;> Prepares the tree to be enumerated with EnumNext() in ascending or descending order.

; Returns 1 if ready to enumerate, 0 if the tree is empty.
; The current node is undefined after calling this.
; NOTE: You should not alter the tree structure while an enumeration is in progress or use a command which select a different node.
 
 Protected *t.SbbtObj = t

 If(dir = #EnumAscending Or dir = #EnumDescending) 
     If *t\TotalNodes  
         *t\CurrentNode = 0
         *t\EnumDirection = dir
         ProcedureReturn 1
     EndIf
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i EnumStartFrom (t, n, dir = #EnumAscending) 
;> Prepares the tree to be enumerated with EnumNext() in ascending or descending order starting from the specified node.

; Returns 1 if ready to enumerate, 0 if the tree is empty.
; NOTE: You should not alter the tree structure while an enumeration is in progress or use a command which select a different node.
 
 Protected *t.SbbtObj = t
 Protected *n.SbbtNode = n
 
 If(dir = #EnumAscending Or dir = #EnumDescending) 
     If *t\TotalNodes  
         *t\CurrentNode = n
         *t\EnumDirection = dir
         ProcedureReturn 1
     EndIf
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i EnumNext (t)
;> Enumerates the next node from the tree, setting the current node to it.

; Returns 0 if there are not more nodes to enumerate.
 
 Protected *t.SbbtObj = t

 If *t\EnumDirection = #EnumAscending
    ProcedureReturn EnumNextAscending (*t)
 Else
    ProcedureReturn EnumNextDescending (*t)
 EndIf
EndProcedure

Procedure EnumEnd (t) 
;> Ends the current enumeration sequence.

; The current node is undefined after calling this. 

 Protected *t.SbbtObj = t 
 *t\CurrentNode = 0 
EndProcedure

Procedure.i Insert (t, key, value = 0)   
;> Inserts a new node in the tree (if not already present) with key and optionally assigning a value to it.

; If the node is inserted the current node is set to it, its value is set to 'value' and 1 is returned.
; If the node is not inserted the current node is set to the one already present, its value is not touched and 0 is returned.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode 

 *n = InsertTreeNode (*t, *t\root, key)
 
 *t\root = *n
 *t\root\top = 0     
    
 If *t\Modified
    *t\Modified = 0
    *t\TotalNodes + 1
    *t\CurrentNode = *t\PostInsert ; current node is set to the new node        
    *t\CurrentNode\value = value ; value is set
    *t\PostInsert = 0
    ProcedureReturn 1 ; inserted
 EndIf
 
 *t\CurrentNode = *t\PostInsert ; current node is set to the node found
 *t\PostInsert = 0
 
 ProcedureReturn 0 ; already there
EndProcedure

Procedure.i InsertStr (t, key$, value = 0)   
;> Inserts a new node in the tree (if not already present) with key$ and optionally assigning a value to it.

; If the node is inserted the current node is set to it, its value is set to 'value' and 1 is returned.
; If the node is not inserted the current node is set to the one already present, its value is not touched and 0 is returned.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode 
 
 *n = InsertTreeNode(*t, *t\root, @key$)
 
 *t\root = *n
 *t\root\top = 0     
    
 If *t\Modified
    *t\Modified = 0
    *t\TotalNodes + 1
    *t\CurrentNode = *t\PostInsert ; current node is set to the new node        
    *t\CurrentNode\value = value ; value is set
    *t\PostInsert = 0
    ProcedureReturn 1 ; inserted
 EndIf
 
 *t\CurrentNode = *t\PostInsert ; current node is set to the node found
 *t\PostInsert = 0
 ProcedureReturn 0 ; already there
EndProcedure

Procedure.i Search (t, key, *value = 0)   
;> Search for an item in the tree using key and optionally copies its associated value to the pointed integer *value.

; Returns 1 if the node is found and set the current node to it, else 0.
 
 Protected *t.SbbtObj = t
 Protected *n.SbbtNode 

 *n = SearchTreeNode (*t, *t\root, key) 
 
 If *n 
    *t\CurrentNode = *n
    If *value 
        PokeI(*value, *t\CurrentNode\value)
    EndIf
    ProcedureReturn 1
 EndIf    
 
 ProcedureReturn 0
EndProcedure

Procedure.i SearchStr (t, key$, *value = 0)   
;> Search for an item in the tree using key$ and optionally copies its associated value to the pointed integer *value.

; Returns 1 if the node is found and set the current node to it, else 0.
 
 Protected *t.SbbtObj = t
 Protected *n.SbbtNode
 
 *n = SearchTreeNode (*t, *t\root, @key$) 
 
 If *n 
    *t\CurrentNode = *n
    If *value 
        PokeI(*value, *t\CurrentNode\value)
    EndIf
    ProcedureReturn 1
 EndIf    
 
 ProcedureReturn 0
EndProcedure

Procedure.i Delete (t, key, *value = 0)   
;> Delete the node indexed by key from the tree and optionally copies its integer value to the pointed integer *value.

; Returns 1 if the item has been deleted, else 0.
; The current node is undefined after calling this. 

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode 

 *n = DeleteTreeNode (*t, *t\root, key, *value)

 *t\root = *n
 
 If *t\root
    *t\root\top = 0
 EndIf 
 
 If *t\Modified       
    *t\Modified = #False
    *t\TotalNodes - 1    
    *t\CurrentNode = 0    
    FreeStructure(*t\PostDelete)
    ProcedureReturn 1
 EndIf

 ProcedureReturn 0
EndProcedure

Procedure.i DeleteStr (t, key$, *value = 0)   
;> Delete the node indexed by key$ from the tree and optionally copies its integer value to the pointed integer *value.

; Returns 1 if the item has been deleted, else 0.
; The current node is undefined after calling this. 

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode 
 
 *n = DeleteTreeNode (*t, *t\root, @key$, *value)
 
 *t\root = *n
 
 If *t\root
    *t\root\top = 0
 EndIf 
 
 If *t\Modified       
    *t\Modified = #False
    *t\TotalNodes - 1    
    *t\CurrentNode = 0
    FreeStructure(*t\PostDelete)
    ProcedureReturn 1
 EndIf

 ProcedureReturn 0
EndProcedure

Procedure.i GetRoot (t)
;> Returns the root node of the specified tree.

; Returns <> 0 if successful, else 0 meaning the tree is empty.

 Protected *t.SbbtObj = t
 
 If *t\root    
    ProcedureReturn *t\root
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure.i GetCurrent (t)
;> Returns 0 if there is no current node, else the address of the node.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\CurrentNode
EndProcedure

Procedure.i GetKeyType (t)
;> Returns the key type of the tree.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\KeyType
EndProcedure

Procedure.i GetKey (t)
;> Returns the key of the current node.

 Protected *t.SbbtObj = t
 
 ProcedureReturn *t\CurrentNode\key
EndProcedure

Procedure.s GetKeyStr (t)
;> Returns the key of the current node.

 Protected *t.SbbtObj = t
 
 ProcedureReturn *t\CurrentNode\key$
EndProcedure

Procedure.i GetKeyOf (t, n)
;> Returns the key of the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 
 ProcedureReturn *n\key
EndProcedure

Procedure.s GetKeyStrOf (t, n)
;> Returns the key of the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 
 ProcedureReturn *n\key$
EndProcedure

Procedure.i GetLowestKey (t)
;> Returns the lowest key from the tree.

; If the tree is empty the result is undefined.

 Protected *t.SbbtObj = t
 Protected *n
 
 *n = GetFirst(*t)
 If *n
    ProcedureReturn GetKeyOf(*t, *n)
 EndIf
EndProcedure

Procedure.s GetLowestKeyStr (t)
;> Returns the lowest key$ from the tree.

; If the tree is empty the result is undefined.

 Protected *t.SbbtObj = t
 Protected *n
 
 *n = GetFirst(*t)
 If *n
    ProcedureReturn GetKeyStrOf(*t, *n)
 EndIf
EndProcedure

Procedure.i GetHighestKey (t)
;> Returns the highest key from the tree.

; If the tree is empty the result is undefined.

 Protected *t.SbbtObj = t
 Protected *n
 
 *n = GetLast(*t)
 If *n
    ProcedureReturn GetKeyOf(*t, *n)
 EndIf
EndProcedure

Procedure.s GetHighestKeyStr (t)
;> Returns the highest key$ from the tree.

; If the tree is empty the result is undefined.

 Protected *t.SbbtObj = t
 Protected *n
 
 *n = GetLast(*t)
 If *n
    ProcedureReturn GetKeyStrOf(*t, *n)
 EndIf
EndProcedure

Procedure.i GetValue (t)
;> Returns the value associated with the current node.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\CurrentNode\value
EndProcedure

Procedure.i GetValueOf (t, n)
;> Returns the value associated with the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 ProcedureReturn *n\value
EndProcedure

Procedure SetValue (t, value)
;> Set the value associated with the current node to value.

 Protected *t.SbbtObj = t
 *t\CurrentNode\value = value
EndProcedure

Procedure SetValueOf (t, n, value)
;> Set the value associated with the specified node.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode = n 
 *n\value = value
EndProcedure

Procedure AddValue (t, value)
;> Add value to the value associated with the current node.

 Protected *t.SbbtObj = t
 *t\CurrentNode\value + value
EndProcedure

Procedure AddValueOf (t, n, value)
;> Add value to the value associated with the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 *n\value + value
EndProcedure

Procedure IncValue (t)
;> Increments the value associated with the current node.

 Protected *t.SbbtObj = t
 *t\CurrentNode\value + 1
EndProcedure

Procedure IncValueOf (t, n)
;> Increments the value associated with the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 *n\value + 1
EndProcedure

Procedure DecValue (t)
;> Decrements the value associated with the current node.

 Protected *t.SbbtObj = t
 *t\CurrentNode\value - 1
EndProcedure

Procedure DecValueOf (t, n)
;> Decrements the value associated with the specified node.

 Protected *n.SbbtNode = n
 Protected *t.SbbtObj = t
 *n\value - 1
EndProcedure

Procedure.i GetLeft (t)
;> Returns the node to the left of the current node.

; Returns the address of the node, or 0 if there is no such node.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\CurrentNode\left
EndProcedure

Procedure.i GetRight (t)
;> Returns the node to the right of the current node.

; Returns the address of the node, or 0 if there is no such node.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\CurrentNode\right
EndProcedure

Procedure.i GetTop (t)
;> Returns the address of the parent of the current node, or 0 if there is no such node.

 Protected *t.SbbtObj = t
 ProcedureReturn *t\CurrentNode\top
EndProcedure

Procedure.i GetLeftOf (t, n)
;> Returns the address of the node to the left of the specified node, or 0 if there is no such node.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode = n
 ProcedureReturn *n\left
EndProcedure

Procedure.i GetRightOf (t, n)
;> Returns the address of the node to the right of the specified node, or 0 if there is no such node.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode = n
 ProcedureReturn *n\right
EndProcedure

Procedure.i GetTopOf (t, n)
;> Returns the address of the parent of the specified node, 0 if there is no such node.

 Protected *t.SbbtObj = t
 Protected *n.SbbtNode = n
 ProcedureReturn *n\top
EndProcedure

Procedure.i GetFirst (t)
;> Returns the address of the node with the lowest key, or 0 if there are no nodes.

 Protected *t.SbbtObj = t
 ProcedureReturn SuccessorTreeNode(*t\root) 
EndProcedure

Procedure.i GetLast (t)
;> Returns the address of the node with the highest key, or 0 if there are no nodes.

 Protected *t.SbbtObj = t
 ProcedureReturn PredecessorTreeNode(*t\root) 
EndProcedure

Procedure.i GoFirst (t)
;> Jumps to the node with the lowest key and makes it the current node.

; Returns its address if successful or 0 if the tree is empty (the current node is undefined in this case).

 Protected *t.SbbtObj = t  
 
 If *t\root
    *t\CurrentNode = SuccessorTreeNode(*t\root) 
    ProcedureReturn *t\CurrentNode
 EndIf 
 ProcedureReturn 0     
EndProcedure

Procedure.i GoLast (t)
;> Jumps to the node with the highest key and makes it the current node.

; Returns its address if successful or 0 if the tree is empty (the current node is undefined in this case).

 Protected *t.SbbtObj = t 
 
 If *t\root
    *t\CurrentNode = PredecessorTreeNode(*t\root) 
    ProcedureReturn *t\CurrentNode
 EndIf

 ProcedureReturn 0     
EndProcedure

Procedure.i GoNext (t) 
;> Moves  to the next node with a key immediately greater then the current one and makes it the current node.

; Returns its address if successful or 0 if there is no such node (the current node is unchanged in this case).

 Protected *t.SbbtObj = t
 Protected *n
   
 If *t\CurrentNode
    *n = NextGreaterTreeNode (*t) 
 
    If *n
        *t\CurrentNode = *n
        ProcedureReturn *n
    EndIf
 EndIf
 
 ProcedureReturn 0
EndProcedure

Procedure.i GoPrev (t) 
;> Moves  to the previous node with a key immediately smaller then the current one and makes it the current node.

; Returns its address if successful or 0 if there is no such node (the current node is unchanged in this case).

 Protected *t.SbbtObj = t
 Protected *n
 
 If *t\CurrentNode
    *n = NextSmallerTreeNode(*t) 
 
    If *n
        *t\CurrentNode = *n
        ProcedureReturn *n
    EndIf
 EndIf
 
 ProcedureReturn 0
EndProcedure

EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x86)
; CursorPosition = 19
; Folding = PAA9--------
; EnableXP
; EnableUser
; CPU = 1
; CompileSourceDirectory
; EnablePurifier