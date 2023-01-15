open Graph

(*calcule la valeur que chaque personne doit*)
val duePerPerson : (int* int) list -> int

(*calcule la différence entre ce que la personne a donné et ce qu'elle doit*)
val diffPerson : (int* int) -> int -> int

(*rajoute chaque personne dans un graph vide à partir d'une liste (id de la personne * argent qu'elle doit)*)
val node_graph : int graph -> (int* int) list  -> int graph

(*rajoute des arcs connectant chaque noeud à tous les autres dans le graph*)
val arc_graph : int graph -> (int* int) list  -> int graph

(*rajoute un noeud avec un arc entrant ou sortant définissant la valeur calculer par diffPerson*)
(*Si cette valeur est positive l'arc est sortant et si elle est négative il est entrant*)
val edge : int graph -> (int* int) -> int -> int graph

(*applique la fonction edge à tout un graph*)
val intermediate_graph : int graph -> (int* int) list -> int graph

(*renvoie une liste d'int qui sont les id des personnes dont diffPerson est négatif, donc les arcs entrant*)
val ingoing_edge : (int* int) list -> int list

(*renvoie une liste d'int qui sont les id des personnes dont diffPerson est positif, donc les arcs sortant*)
val outgoing_edge : (int* int) list -> int list

(*Applique l'algorithme de fordfulkerson entre chaque noeud entrant et chaque noeud sortant*)
val moneyshare : int graph -> (int* int) list -> int graph