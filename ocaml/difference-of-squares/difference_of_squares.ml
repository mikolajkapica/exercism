let square_of_sum n = 
    (* build a list of numbers from 1 to n *)
    let rec build_list n = 
        match n with
        | 0 -> []
        | _ -> n :: build_list (n-1)
    in
    (* sum the list *)
    let rec sum_list list = 
        match list with
        | [] -> 0
        | x::xs -> x + sum_list xs
    in
    (* square the sum *)
    let square n = n * n in
    square (sum_list (build_list n))

let sum_of_squares n =
    (* build a list of squares from 1 to n *)
    let rec build_list n = 
        match n with
        | 0 -> []
        | _ -> n * n :: build_list (n-1)
    in
    (* sum the list *)
    List.fold_left (+) 0 (build_list n)


let difference_of_squares n =
    square_of_sum n - sum_of_squares n

