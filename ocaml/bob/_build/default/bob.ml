module Sentences = struct
    let is_question sentence =
        let sentence = String.trim sentence in
        String.sub sentence (String.length sentence - 1) 1 = "?"

    let is_whitespace sentence =
        sentence |> String.trim |> String.length = 0

    let is_yelling sentence =
        let is_between x (a, b) =
            x >= a && x <= b
        in
        let is_uppercase c = 
            let numeric_value = Char.code c in
            is_between numeric_value (65, 90) 
            in
        let is_letter c =
            let numeric_value = Char.code c in
            is_between numeric_value (65, 90) || is_between numeric_value (97, 122)
        in
        let string_filter p s =
            String.fold_left (fun acc c -> if p c then acc ^ (String.make 1 c) else acc) "" s
        in
        let letters = sentence |> string_filter is_letter in
        letters |> String.length > 0 && letters |> String.for_all is_uppercase
end

open Sentences

let response_for s =
    if is_whitespace s then "Fine. Be that way!"
    else if is_yelling s && is_question s then "Calm down, I know what I'm doing!"
    else if is_yelling s then "Whoa, chill out!"
    else if is_question s then "Sure."
    else "Whatever."

