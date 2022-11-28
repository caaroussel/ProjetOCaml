open Graph

let find_path gr s p = []


let profondeur gr s =
  let rec search visited = function
  | [] -> visited
  | (head,_)::tail -> 
    if List.mem head visited then search visited tail
    else search (head::visited) (List.append tail (out_arcs gr head))
  in search [] [s]















    
    
  
  



