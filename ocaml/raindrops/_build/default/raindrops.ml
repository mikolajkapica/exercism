let raindrop n =
    let aux x str_add str =
        match n mod x with
        | 0 -> str ^ str_add
        | _ -> str
    in
    let str = "" 
        |> aux 3 "Pling" 
        |> aux 5 "Plang" 
        |> aux 7 "Plong"
    in
    match str with
    | "" -> string_of_int n
    | _ -> str


