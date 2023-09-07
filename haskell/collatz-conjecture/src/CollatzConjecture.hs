module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = aux n 0 where
    aux 1 acc = Just acc
    aux x acc
        | x < 1 = Nothing
        | even x = aux (x `div` 2) (acc + 1)
        | otherwise = aux (3 * x + 1) (acc + 1)