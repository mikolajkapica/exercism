type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let time f x name =
    let start = Unix.gettimeofday () in 
    let res = f x in
    let stop = Unix.gettimeofday () in
    let () = Printf.printf "Execution %s time: %fs\n%!" name (stop -. start) in
    res

let to_rna dna =
   List.fold_left (fun acc x -> match x with
        | `G -> `C :: acc
        | `C -> `G :: acc
        | `T -> `A :: acc
        | `A -> `U :: acc
   ) [] dna |> List.rev

let to_rna2 nucleotides = 
  let translate = function
      | `A -> `U
      | `C -> `G
      | `G -> `C
      | `T -> `A 
  in
  List.map translate nucleotides

let () = 
    let dna = List.init 10000000 (fun _ -> match Random.int 4 with
        | 0 -> `A
        | 1 -> `C
        | 2 -> `G
        | 3 -> `T
        | _ -> failwith "impossible"
    ) in
    time to_rna2 dna "2" |> ignore;
    time to_rna dna "1" |> ignore;

