(* imperative approach *)
(*
let transform init_list =
    let final_list = ref [] in
    List.iter (fun tuple ->
        let num = fst tuple in
        List.iter (fun letter ->
            final_list := (Char.lowercase_ascii letter, num) :: !final_list
        ) (snd tuple)
    ) init_list;
    List.sort (fun x y -> compare (fst x) (fst y)) !final_list
*)

(* functional approach *)
let transform init_list =
    init_list 
    |> List.map (fun (score, letters) -> List.map (fun x -> (Char.lowercase_ascii x, score)) letters)
    |> List.flatten
    |> List.sort (fun x y -> compare (fst x) (fst y))
