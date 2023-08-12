open Base

module Int_map = Map.M(Int)
type school = string list Int_map.t

let empty_school = Map.empty (module Int)

let add name number school =
    Map.add_multi school ~key: number ~data: name

let grade number school =
    Map.find school number 
    |> Option.value ~default: []

let sorted school =
    Map.fold school ~init: empty_school ~f: (fun ~key: number ~data: names acc ->
        Map.add_exn acc ~key: number ~data: (List.sort names ~compare: String.compare))

let roster school =
    Map.to_alist school 
    |> List.sort ~compare: (fun (n1, _) (n2, _) -> Int.compare n1 n2)
    |> List.map ~f: (fun (_, names) -> (List.sort names ~compare: String.compare))
    |> List.concat
