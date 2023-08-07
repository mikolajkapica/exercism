let transform init_list =
    let final_list = ref [] in
    List.iter (fun tuple ->
        let num = fst tuple in
        List.iter (fun letter ->
            final_list := (Char.lowercase_ascii letter, num) :: !final_list
        ) (snd tuple)
    ) init_list;
    List.sort (fun x y -> compare (fst x) (fst y)) !final_list
