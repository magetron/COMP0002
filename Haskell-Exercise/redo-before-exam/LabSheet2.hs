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

rotor :: Int -> String -> String
rotor offset [ ] 		| offset < 0 	= error "offset smaller than 0"
  						| otherwise 	= error "offset larger than / equal to string length"
rotor 0 xs				= xs
rotor offset (x : xs)	| offset < 0 	= error "offset smaller than 0"
  						| offset >= length (x : xs) = error "offset larger than / equal to string length"
						| otherwise 	= (rotor (offset - 1) (xs ++ [ x ]))

alphabets :: String
alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

makeKey :: Int -> [(Char, Char)]
makeKey offset = zip alphabets (rotor offset alphabets)

lookUp :: Char -> [(Char, Char)] -> Char
lookUp ch [ ] = ch
lookUp ch ((x, y) : dict) = if (ch == x) then y else lookUp ch dict

encipher :: Int -> Char -> Char
encipher offset ch = lookUp ch (makeKey offset)

normalise :: String -> String
normalise str = map toUpper (filter isAlphaNum str)

encipherStr :: Int -> String -> String
encipherStr offset str = [encipher offset ch | ch <- (normalise str)]
