let remove chars s = 
    String.fold_left (fun acc x -> if (List.mem x chars) then acc else acc ^ String.make 1 x) "" s
    
let split_on_chars chars string = 
    let rec aux s acc =
        let split_string_first_rest string = (String.get string 0, String.sub string 1 (String.length string - 1)) in
        if String.length s = 0 then acc else
        let (first, rest) = split_string_first_rest s in
        match List.mem first chars with
        | false -> aux rest ((List.hd acc ^ String.make 1 first) :: List.tl acc)
        | true -> if List.hd acc <> "" then (aux rest ("" :: acc)) else (aux rest acc)
    in
    aux string [""]

let first_letter_in_each slist =
    List.map (fun s -> String.get s 0 |> String.make 1) slist |> List.fold_left (^) ""

let string_reverse string =
    let rec aux s acc =
        if String.length s = 0 then acc else
        let (first, rest) = (String.get s 0, String.sub s 1 (String.length s - 1)) in
        aux rest (String.make 1 first ^ acc)
    in
    aux string ""

let acronym s =
    s 
    |> remove ['_'; '.'] 
    |> split_on_chars ['-'; ' ']
    |> first_letter_in_each 
    |> string_reverse
    |> String.uppercase_ascii

