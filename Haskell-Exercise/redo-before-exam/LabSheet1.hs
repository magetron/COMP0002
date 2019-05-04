import Data.Char as Char

square :: Int -> Int
square x = x * x

pyth :: (Int, Int) -> Int
pyth (x, y) = square x + square y

isTriple :: Int -> Int -> Int -> Bool
isTriple x y z = pyth (x, y) == square z

isTripleAny :: Int -> Int -> Int -> Bool
isTripleAny x y z = isTriple x y z || isTriple x z y || isTriple y z x

halfEvens :: [ Int ] -> [ Int ]
halfEvens [ ] = [ ]
halfEvens (x : xs) 	| x `mod` 2 == 0	= x `div` 2 : halfEvens xs
  					| otherwise 		= x : halfEvens xs

halfEvens2 :: [ Int ] -> [ Int ]
halfEvens2 xs = [if x `mod` 2 == 0 then x `div` 2 else x | x <- xs]

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange min max xs = filter (inRangeHelper min max) xs

inRangeHelper :: Int -> Int -> Int -> Bool
inRangeHelper min max x = x >= min && x <= max

inRangeList :: Int -> Int -> [ Int ] -> [ Int ]
inRangeList min max xs = [x | x <- xs, x >= min && x <= max]

countPositives :: [ Int ] -> Int 
countPositives xs = sum [1 | x <- xs, x > 0]

capitalised :: String -> String
capitalised (x : xs) = toUpper x : [toLower x | x <- xs]

title :: [ String ] -> [ String ]
title (str : strs) = capitalised str : titleHelper strs

titleHelper :: [ String ] -> [ String ]
titleHelper strs = [if length str >= 4 then capitalised str else map toLower str | str <- strs]

