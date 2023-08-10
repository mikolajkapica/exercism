type allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats

let allergies score =
    let rec aux curr_score acc items =
        match items with
        | [] -> List.rev acc
        | _ -> match Int.logand curr_score 1 with
                | 0 -> aux (curr_score / 2) acc (List.tl items)
                | 1 -> aux (curr_score / 2) (List.hd items :: acc) (List.tl items)
                | _ -> failwith "Impossible"
    in
    aux score [] [Eggs; Peanuts; Shellfish; Strawberries; Tomatoes; Chocolate; Pollen; Cats]

let allergic_to score item =
    List.mem item (allergies score)

