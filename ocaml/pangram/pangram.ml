open Base
let is_pangram sentence =
    sentence 
    |> String.uppercase
    |> String.fold ~init: [] ~f: (fun acc c -> if Char.is_alpha c && not (Stdlib.List.mem c acc) then c :: acc else acc)
    |> List.length = 26

