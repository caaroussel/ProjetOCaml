open Graph

let find_path gr s p = 
  let (dest,_) = p in

  let eq h p = List.exists (fun x -> let (node,lab)=x in node==h) p in

  let rec search path = function
  | [] -> []
  | (head,lab):: tail -> if (head == dest) then ((dest,lab)::path) 
    else 
      if eq head path then [] 
      else search ((head,lab)::path) (out_arcs gr head)
in search [] [s]



let profondeur gr s =
  let rec search visited = function
  | [] -> visited
  | (head,_)::tail -> 
    if List.mem head visited then search visited tail
    else search (head::visited) (List.append tail (out_arcs gr head))
  in search [] [s]















    
    
  
  



