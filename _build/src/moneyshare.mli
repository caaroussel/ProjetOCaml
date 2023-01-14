open Graph

val duePerPerson : (int* int) list -> int
val diffPerson : (int* int) -> int -> int
val node_graph : int graph -> (int* int) list  -> int graph
val arc_graph : int graph -> (int* int) list  -> int graph
val edge : int graph -> (int* int) -> int -> int graph
val intermediate_graph : int graph -> (int* int) list -> int graph
val ingoing_edge : (int* int) list -> int list
val outgoing_edge : (int* int) list -> int list
val moneyshare : int graph -> (int* int) list -> int graph