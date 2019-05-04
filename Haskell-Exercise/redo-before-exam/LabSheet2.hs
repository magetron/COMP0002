import Data.Char as Char

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange min max [ ] = [ ]
inRange min max (x : xs) = if (x >= min && x <= max) then x : inRange min max xs else inRange min max xs

countPositives :: [ Int ] -> Int 
countPositives [ ] = 0
countPositives (x : xs) = if (x > 0) then 1 + countPositives xs else countPositives xs

capitalised :: String -> String
capitalised (x : xs) = toUpper x : lowerString xs

lowerString :: String -> String
lowerString [ ] = [ ]
lowerString (x : xs) = toLower x : lowerString xs

title :: [ String ] -> [ String ] 
title (str : strs) = capitalised str : titleHelper strs

titleHelper :: [ String ] -> [ String ] 
titleHelper [ ] = [ ]
titleHelper (str : strs) = if (length str >= 4) then capitalised str : titleHelper strs else lowerString str : titleHelper strs

insert :: (Ord a) => a -> [ a ] -> [ a ] 
insert x [ ] = [ x ]
insert x (x1 : xs) = if (x1 > x) then x : (x1 : xs)
								 else x1 : (insert x xs)

isort :: (Ord a) => [ a ] -> [ a ]
isort [ ] = [ ]
isort (h : t) = insert h (isort t)

merge :: (Ord a) => [ a ] -> [ a ] -> [ a ]
merge [ ] [ ] = [ ]
merge [ ] r = r
merge l [ ] = l
merge (l : ls) (r : rs) = if (l < r) then l : (merge ls (r : rs))
									 else r : (merge (l : ls) rs)


msort :: (Ord a) => [ a ] -> [ a ]
msort [ ] = [ ]
msort [ x ] = [ x ]
msort xs = merge (msort (take (length xs `div` 2) xs)) (msort (drop (length xs `div` 2) xs))


