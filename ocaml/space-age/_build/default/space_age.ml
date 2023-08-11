type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let age_on p seconds =
    let age_on_earth = float_of_int seconds /. float_of_int (365 * 24 * 60 * 60) in
    match p with
    | Mercury -> age_on_earth /. 0.2408467
    | Venus   -> age_on_earth /. 0.61519726
    | Earth   -> age_on_earth /. 1.0
    | Mars    -> age_on_earth /. 1.8808158
    | Jupiter -> age_on_earth /. 11.862615
    | Saturn  -> age_on_earth /. 29.447498
    | Uranus  -> age_on_earth /. 84.016846
    | Neptune -> age_on_earth /. 164.79132
