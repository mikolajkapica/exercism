type base = int

let convert_bases ~from ~digits ~target =
    let is_input_correct = not (from < 2 || target < 2 || List.exists (fun x -> x >= from || x < 0) digits) in
    let decimal = 
        List.fold_left (fun acc n -> (n * int_of_float (float_of_int from ** float_of_int ((List.length digits) - (List.length acc) - 1)) :: acc)) [] digits |>
        List.fold_left (fun acc n -> n + acc) 0 
    in
    let rec to_target curr_dec target_digits =
        match curr_dec with
        | 0 -> Some(match target_digits with | [] -> [0] | _ -> target_digits)
        | _ -> to_target (curr_dec / target) ((curr_dec mod target) :: target_digits)
    in
    match is_input_correct with
    | true -> to_target decimal []
    | false -> None


