type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna dna =
   List.fold_left (fun acc x -> match x with
        | `G -> `C :: acc
        | `C -> `G :: acc
        | `T -> `A :: acc
        | `A -> `U :: acc
   ) [] dna |> List.rev
