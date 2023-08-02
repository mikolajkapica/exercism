type nucleotide = A | C | G | T

let hamming_distance (seq1: nucleotide list) (seq2: nucleotide list) =
    match List.length seq1, List.length seq2 with
    | 0, _ -> Error "left strand must not be empty"
    | _, 0 -> Error "right strand must not be empty"
    | x, y when x <> y -> Error "left and right strands must be of equal length"
    | _ -> Ok (List.fold_left2 (fun acc x y -> if x = y then acc else acc + 1) 0 seq1 seq2)
