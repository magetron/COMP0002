mult :: [ Int ] -> Int 
mult xs = foldr ( * ) 1 xs

posList :: [ Int ] -> [ Int ]
posList xs = filter ( >0 ) xs

trueList :: [ Bool ] -> Bool
trueList bs = foldr ( && ) True bs

isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

evenList :: [ Int ] -> Bool
evenList xs = foldr ( && ) True (map (isEven) xs)

maxList :: (Ord a) => [ a ] -> a
maxList (x : xs) = foldr max x xs

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange min max xs = filter (\x -> x >= min && x <= max) xs

countPositives :: [ Int ] -> Int
countPositives xs = length (posList xs)

myLength :: [ a ] -> Int
myLength xs = foldr (+) 0 (map (\x -> 1) xs)

myMap :: (a -> b) -> [ a ] -> [ b ]
myMap f as = foldr (\a ls -> (f a) : ls) [ ] as

myLength' :: [ a ] -> Int 
myLength' xs = foldr (\_ x -> x + 1) 0 xs
