open Graph

let find_path gr s p = 
  let (dest,_) = p in

  let appartient h p = List.exists (fun x -> let (node,lab)=x in node==h) p in

  let rec search path iter  = 
  match iter with 
  | [] -> []
  | (head,lab)::tail -> if (lab = 0) then search path tail 
    else if head = dest then List.rev ((dest,lab)::path) 
    else  if appartient head path then search path tail
    else match (search ((head,lab)::path) (out_arcs gr head)) with
    |[] -> search path tail
    | _ -> (search ((head,lab)::path) (out_arcs gr head))
    (*(search ((head,lab)::path) (out_arcs gr head)) *)


in if s = p then [s]
else let (head,_) = s in search [s] (out_arcs gr head)



let profondeur gr s =
  let rec search visited = function
  | [] -> visited
  | (head,_)::tail -> 
    if List.mem head visited then search visited tail
    else search (head::visited) (List.append tail (out_arcs gr head))
  in search [] [s]

  let get_flow graph path =
    let rec loop graph path flot = match path with
    |[] -> flot
    |(_,f)::rest -> loop graph rest (min f flot)
  in loop graph path max_int

(**)
let upd_graph graph path flot origin=assert false
  (*let rec loop graph path flot origin = match path with
  |[]*)












    
    
  
  



