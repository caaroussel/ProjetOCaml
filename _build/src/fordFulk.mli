open Graph
 


(* Trouver un chemin de source vers destination*)
val find_path: int graph -> (id * int)  -> (id * int)  -> int out_arcs

val profondeur: 'a graph -> (id * 'a) -> id list

val get_flow: 'a graph -> (id* int) list -> int

val upd_graph: 'a graph -> (id * int) list -> int -> id -> 'a graph


