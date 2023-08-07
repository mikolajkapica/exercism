open Base

type t = 
    | Empty 
    | Node of t * int * t


let empty = Empty

let value = function
    | Empty -> Error "no value" 
    | Node (_, v, _) -> Ok v

let left = function
    | Empty -> Error "empty" 
    | Node (l, _, _) -> Ok l

let right = function
    | Empty -> Error "empty"
    | Node (_, _, r) -> Ok r

let rec insert value = function  
    | Empty -> Node (Empty, value, Empty)
    | Node (l, v, r) -> 
            match value > v with
            | true  -> Node (l, v, insert value r)
            | false -> Node (insert value l, v, r)

let to_list t = 
    let list = ref [] in
    let rec in_order node =
        match node with
        | Empty -> ()
        | Node (left, value, right) ->
                in_order left;
                list := value :: !list;
                in_order right;
    in
    in_order t;
    List.rev !list

(** nicer solution - https://exercism.org/tracks/ocaml/exercises/binary-search-tree/solutions/bcc32*)
(* let to_list t =  *)
(*     let rec loop acc = function *)
(*         | Empty -> acc *)
(*         | Node (l, v, r) -> loop (v :: loop acc r) l *)
(*     in *)
(*     loop [] t *)

