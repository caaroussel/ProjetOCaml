open Gfile
open Tools 
open FordFulk

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)
  
  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and source = int_of_string Sys.argv.(2)
  and sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  let int_graph = gmap graph int_of_string in 

 (*
  (*let test = profondeur graph (4,0) in *)
  
  let testpath = find_path int_graph (source,max_int) (sink,max_int) in 

  
  let rec pp t = 
    match t with
    | [] -> Printf.printf "%s\n " "FIN "
    | head::tail -> let (node,lab) = head in Printf.printf "%d  ----  %d   \n" node lab ; pp tail

  in pp testpath;

  
  let flot = (get_flow int_graph testpath) in 
  Printf.printf "Flot min = %d \n" flot ;

  let test_upd = upd_graph int_graph testpath flot in write_file outfile (gmap test_upd string_of_int);
 *)

 (*
  let test_addarc = add_arc int_graph source sink 10 in

  write_file outfile (gmap test_addarc string_of_int);
*)

let fulk = (fordFulkerson int_graph (source,max_int) (sink,max_int)) in write_file outfile (gmap fulk string_of_int);

export (outfile^".dot") (gmap fulk string_of_int)