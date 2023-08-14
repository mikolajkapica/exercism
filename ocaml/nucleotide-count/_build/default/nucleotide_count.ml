(* Count the number of times a nucleotide occurs in the string. *)
(* val count_nucleotide : string -> char -> (int, char) Result.t *)

(* Count the nucleotides in the string. *)
(* val count_nucleotides : string -> (int Map.M(Char).t, char) Result.t *)


open Base

let empty = Map.empty (module Char)

let count_nucleotide s c =
    if (c != 'A' && c != 'C' && c != 'G' && c != 'T') then Error c else 
    let first_none_dna_char = String.find s ~f: (fun sc -> not (Char.equal sc 'A' || Char.equal sc 'C' || Char.equal sc 'G' || Char.equal sc 'T')) in
    if Option.is_some (first_none_dna_char) then Error (Option.value_exn first_none_dna_char)
    else Ok (String.fold s ~init: 0 ~f: (fun acc sc -> if (sc == c) then acc + 1 else acc))

let count_nucleotides s =
    let first_none_dna_char = String.find s ~f: (fun sc -> not (Char.equal sc 'A' || Char.equal sc 'C' || Char.equal sc 'G' || Char.equal sc 'T')) in
    if Option.is_some (first_none_dna_char) then Error (Option.value_exn first_none_dna_char)
    else
    let n_quantities =
        empty
        |> Map.add_exn ~key: 'A' ~data: 0
        |> Map.add_exn ~key: 'C' ~data: 0
        |> Map.add_exn ~key: 'G' ~data: 0
        |> Map.add_exn ~key: 'T' ~data: 0
    in
    let map = String.fold s ~init: n_quantities ~f: (fun acc sc -> match sc with
        | 'A' -> Map.update acc 'A' ~f: (fun x -> Option.value_exn x + 1)
        | 'C' -> Map.update acc 'C' ~f: (fun x -> Option.value_exn x + 1)
        | 'G' -> Map.update acc 'G' ~f: (fun x -> Option.value_exn x + 1)
        | 'T' -> Map.update acc 'T' ~f: (fun x -> Option.value_exn x + 1)
        | _ -> acc
    ) 
    in
    let map = Map.filteri map ~f: (fun ~key:_ ~data -> data != 0) in
    Ok map



