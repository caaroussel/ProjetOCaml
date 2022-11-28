open Graph
 


(* Trouver un chemin de source vers destination*)
val find_path: 'a graph -> (id * 'a)  -> (id * 'a)  -> 'a out_arcs

val profondeur: 'a graph -> (id * 'a) -> id list


