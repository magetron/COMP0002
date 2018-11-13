import Data.Char as Char

square :: Int -> Int
square x = x * x

pyth :: Int -> Int -> Int
pyth x y = square x + square y

isTriple :: Int -> Int -> Int -> Bool
isTriple x y z = pyth x y == square z

isTripleAny :: Int -> Int -> Int -> Bool
isTripleAny x y z = isTriple x y z || isTriple x z y || isTriple y z x

halfEvens :: [ Int ] -> [ Int ]
halfEvens xs = [if mod x 2 == 0 then div x 2 else x | x <- xs]

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange a b xs = [x | x <- xs, a <= x && x <= b]

countPositives :: [ Int ] -> Int
countPositives xs = sum [ 1 | x <- xs, x > 0]

capitalised :: String -> String
capitalised [] = []
capitalised (h:t)  = toUpper h : [ toLower y | y <- t]


