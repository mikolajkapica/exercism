type nucleotide = A | C | G | T

(* let hamming_distance (seq1: nucleotide list) (seq2: nucleotide list) = *)
(*     match (List.length seq1, List.length seq2) with *)
(*     | (seq1, seq2) when seq1 == seq2 -> Ok (List.fold_left2 (fun acc x y -> if x == y then acc else acc + 1) 0 seq1 seq2) *)
(*     | (0, _) -> Error "left strand must not be empty" *)
(*     | (_, 0) -> Error "right strand must not be empty" *)
(*     | (_)    -> Error "left and right strands must be of equal length" *)



let hamming_distance (a: nucleotide list) (b: nucleotide list) =
    match ( List.length a, List.length b ) with
    | (x, y) when x == y -> List.fold_left (fun acc (x, y) -> if x == y then acc else acc + 1) 0 (List.combine a b) |> Result.ok
    | (0, _) -> Result.error "left strand must not be empty"
    | (_, 0) -> Result.error "right strand must not be empty"
    | _ -> Result.error "left and right strands must be of equal length"
