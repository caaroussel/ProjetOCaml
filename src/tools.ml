open Graph 

let clone_nodes gr = n_fold gr new_node empty_graph

let gmap (gr : 'a graph) (f :('a -> 'b)) = 
  let g acu id1 id2 x = new_arc acu id1 id2 (f x) in
  e_fold gr g (clone_nodes gr) 


let add_arc g id1 id2 n = assert false
