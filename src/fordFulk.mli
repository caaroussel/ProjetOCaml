open Graph
 


(* Trouve un chemin de source vers destination*)
val find_path: int graph -> (id * int)  -> (id * int)  -> int out_arcs

(*Trouve le flow maximum à partir d'un graph d'int et d'une liste de noeud*)
val get_flow: int graph -> (id * int) list -> int

(*Update le graph suivant une liste de noeud avec un flow maximum*)
val upd_graph: int graph -> (id * int) list -> int -> int graph

(*algorithme de Ford Fulkerson*)
val fordFulkerson: int graph -> (id * int) -> (id * int) -> int graph

(*Renvoie une version intelligible du graph après qu'il ait été modifié par notre alogrithme de ford fulkerson*)
val get_final_string_graph: int graph -> int graph -> string graph
