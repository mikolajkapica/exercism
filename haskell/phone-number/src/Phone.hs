module Phone (number) where
import System.Environment (withArgs)

import Control.Monad ((>=>))

import Data.Char (isDigit)
import Data.List (isPrefixOf)

clean :: String -> Maybe String
clean xs = Just $ filter isDigit xs

checkLength :: String -> Maybe String
checkLength xs
  | length xs == 10 = Just xs
  | length xs == 11 && head xs == '1' = Just $ tail xs
  | otherwise = Nothing

checkCountryCode :: String -> Maybe String
checkCountryCode xs
  | head xs == '0' = Nothing
  | head xs == '1' = Nothing
  | otherwise = Just xs

checkAreaCode :: String -> Maybe String
checkAreaCode xs
  | head xs == '0' = Nothing
  | head xs == '1' = Nothing
  | xs !! 3 == '0' = Nothing
  | xs !! 3 == '1' = Nothing
  | otherwise = Just xs

formatNumber :: String -> String
formatNumber xs = areaCode ++ exchangeCode ++ subscriberNumber
  where
    areaCode = take 3 xs
    exchangeCode = take 3 $ drop 3 xs
    subscriberNumber = drop 6 xs

validate :: String -> Maybe String
validate = clean >=> checkLength >=> checkCountryCode >=> checkAreaCode

number :: String -> Maybe String
number xs = validate xs >>= Just . formatNumber