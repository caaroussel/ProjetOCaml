open Graph
open FordFulk


let duePerPerson list_users = 
  let rec loop list_users acu1 acu2 = 
    match list_users with 
    | (_person, x)::rest -> loop rest (x+acu1) (1+acu2)
    | [] -> (acu1/acu2)
  in loop list_users 0 0
;;

let diffPerson (person,money) duePerPerson = money - duePerPerson ;;

let node_graph graph list_users =
  let rec loop graph list_users =
    match list_users with
    | (person,_money)::rest -> loop (new_node graph person) rest
    | []-> graph
  in loop empty_graph list_users
;;

let arc_graph graph list_users=
  let rec sin graph person1 list_users=
    match list_users with
    | (person2,_money)::rest -> if person1 = person2 then sin graph person1 rest else sin (new_arc graph person1 person2 0) person1 rest
    | [] -> graph
  in
  let rec loop graph list_users =
    match list_users with
    | (person,_money)::rest -> loop (sin graph person list_users) rest
    | [] -> graph
  in loop graph list_users
;;

let edge graph (person,money) duePerPerson =
  let diff = diffPerson (person, money) duePerPerson in
  if diff >0 then new_arc (new_node graph (-person)) person (-person) diff else new_arc (new_node graph (-person)) (-person) person (-diff)
;;

let intermediate_graph graph list_users = 
  let rec loop graph list_users = match list_users with
    | (person,money)::rest -> loop (edge graph (person,money) (duePerPerson list_users)) rest
    | []-> graph
  in
  loop graph list_users
;;

let ingoing_edge list_users =
  let due = duePerPerson list_users in
  let rec loop list_users acu =
    match list_users with
    | (person,money):: rest -> if (diffPerson (person,money) due) < 0 then loop rest (person::acu) else loop rest acu
    | [] -> acu
  in
  loop list_users []
;;

let outgoing_edge list_users =
  let due = duePerPerson list_users in
  let rec loop list_users acu =
    match list_users with
    | (person,money):: rest -> if (diffPerson (person,money) due) > 0 then loop rest (person::acu) else loop rest acu
    | [] -> acu
  in
  loop list_users []
;;




let moneyshare graph list_users=
  let in_list = ingoing_edge list_users and out_list = outgoing_edge list_users in
  let rec loop2 graph x out_list = match out_list with
    | y::rest -> loop2 (fordFulkerson graph (x,max_int) (y,max_int)) x rest
    |[]-> graph 
  in
  let rec loop graph in_list out_list =
    match in_list with 
    | x::rest -> loop (loop2 graph x out_list) rest out_list
    |[]-> graph
  in 
  loop graph in_list out_list
;;





  

