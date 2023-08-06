let permutations word =
    let chars = String.fold_left (fun acc c -> c :: acc) [] word in
    let lst = ref [] in
    let rec aux not_used word =
        if List.length not_used = 0 then lst := String.lowercase_ascii word :: !lst
        else List.iteri (fun idx c -> aux (List.filteri (fun idx2 x -> not (idx == idx2 && x == c)) not_used) (word ^ (String.make 1 c))) not_used
    in
    aux chars "";
    !lst

let anagrams target_word candidate_words =
    let permutations = permutations target_word in
    let anagrams = ref [] in
    List.iter (fun x -> if ((List.mem (String.lowercase_ascii x) permutations) && 
                            (String.lowercase_ascii x <> String.lowercase_ascii target_word)) 
                            then anagrams := x :: !anagrams) candidate_words;
    List.rev !anagrams




            
            




