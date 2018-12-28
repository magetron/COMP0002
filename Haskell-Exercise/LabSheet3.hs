mult :: Int -> [ Int ] -> [ Int ]
mult a xs = map ( a * ) xs

posList :: [ Int ] -> [ Int ] 
posList xs = filter ( > 0 ) xs

trueList :: [ Bool ] -> Bool
trueList bs = foldr ( && ) True bs

evenList :: [ Int ] -> Bool
evenList xs = foldr ( ( && ). even ) True xs

maxList :: [ Int ] -> Int
maxList (h : t) = foldr max h t

inRange :: Int -> Int -> [ Int ] -> [ Int ] 
inRange min max xs = filter (\x -> ( x >= min) && ( x <= max) ) xs

countPositives :: [ Int ] -> Int
countPositives xs = foldr ( + ) 0 ( map (\x -> 1 ) ( filter (\x -> x > 0) xs ) )

myLength :: [ Int ] -> Int
myLength xs = foldr ( + ) 0 ( map (\x -> 1) xs )

myMap :: (a -> b) -> [ a ] -> [ b ]
myMap func = foldr ( (:). func) [ ]

myLength' :: [ Int ] -> Int
myLength' xs = foldr ( + ) 0 ( myMap (\x -> 1) xs )
