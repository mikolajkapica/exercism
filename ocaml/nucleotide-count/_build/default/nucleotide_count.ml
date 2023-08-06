open Base 

let empty = Map.empty (module Char)

(* Count the number of times a nucleotide occurs in the string. *)
(* val count_nucleotide : string -> char -> (int, char) Result.t *)
let count_nucleotide s c =
    let count = String.count s ~f:(Char.equal c) in
    Ok count

(* Count the nucleotides in the string. *)
(* val count_nucleotides : string -> (int Map.M(Char).t, char) Result.t *)
let count_nucleotides s =
    let map = Map.update empty 'A' ~f:(fun _ -> count_nucleotide s 'A') in
    Ok map
(*     let acount = count_nucleotide s 'A' in *)
(*     let map = Map.empty (module Char) in *)
(*     let map = Result.map acount ~f:(fun a -> Map.add map ~key:'A' ~data:a) in *)
(*     Ok map, 'A' *)
