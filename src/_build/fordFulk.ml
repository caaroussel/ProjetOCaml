open Graph
open Tools

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

let get_flow graph path =
  let rec loop graph path flot = match path with 
    |[]->flot
    |(_,f)::rest-> loop graph rest (min f flot)
  in
  loop graph path max_int

let upd_graph graph path flot =
  let rec loop graph path flot = match path with
    |(i1,_)::(i2,f2)::rest-> 
      let graph1 = add_arc graph i1 i2 (-flot) in 
      let graph2 = add_arc graph1 i2 i1 flot in 
      loop graph2 ((i2,f2)::rest) flot
    |(i,_)::[]-> graph
    | [] -> assert false
    in loop graph path flot

let fordFulkerson graph source puit =
  let rec loop graph s p = match find_path graph s p with
    | []-> graph
    | path ->loop (upd_graph graph path (get_flow graph path)) s p
  in 
  loop graph source puit
  (* bon mais pas résultat final il faut revenir a un graph classique qui contient des arcs normaux pas un graph d'écart*)












    
    
  
  



