open Graph
 


(* Trouver un chemin de source vers destination*)
val find_path: int graph -> (id * int)  -> (id * int)  -> int out_arcs

val get_flow: int graph -> (id * int) list -> int

val upd_graph: int graph -> (id * int) list -> int -> int graph

val fordFulkerson int graph -> (id * int) -> (id * int) ->int graph


