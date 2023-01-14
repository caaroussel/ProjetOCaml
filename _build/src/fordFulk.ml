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


(*

let fonction_appliquée_a_toute_les_listes_out_arcs id lout_arcs = 
  let rec loop id lout_arcs =
    match lout_arcs with
    | [] -> 
    | (id_dest,lab)::rest-> 
      match (find_arc graph_result id_dest id) with
      | None -> new_arc graph_final id id_dest ("0/"^string_of_int(lab)) , loop id rest
      | Some lab_retour -> new arc graph_final id id_dest (string_of_int(lab_retour)^string_of_int(lab_retour+lab)) , loop id rest
      
in
loop id lout_arcs
              

    let func_noeud graph_initial id = match out_arcs graph_initial id with 
      | (id1,x)::->
    n_iter graph_initial func_noeud 
  
*)



let get_final_string_graph (init_graph: int graph) (ff_graph: int graph) = 

  (* For a given flow arc, will create the flow/capacity arc on the initial graph *)
  let create_arcs init_graph from_id to_id flow =
    (* The arcs containing the flow are the ones that are in the opposite directions
       from the arcs inside of the initial graph *)
    match find_arc init_graph to_id from_id with 
    | Some(capacity) -> new_arc (init_graph) (to_id) (from_id) (flow ^ "/" ^ capacity )
    | None -> init_graph
  in

  (* For the arcs with no flow going through them, will create a 0/capacity label *)
  let create_null_flow_arcs final_graph from_id to_id capacity =
    (* The arcs with no flow are the ones that haven't changed in the inital graph, they dont contain a '/' yet *)
    if String.contains_from capacity 0 '/' then final_graph
    else new_arc (final_graph) (from_id) (to_id) ("0/" ^ capacity )
  in

  let string_ff_graph = (gmap ff_graph string_of_int) in 
  let final_graph = e_fold string_ff_graph create_arcs (gmap init_graph string_of_int) in
  e_fold final_graph create_null_flow_arcs final_graph






    
    
  
  



