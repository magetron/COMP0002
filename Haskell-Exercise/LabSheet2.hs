import Data.Char as Char

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange a b [] = []
inRange a b (x : xs) = if (a <= x && x <= b) then x : inRange a b xs
					     else inRange a b xs

countPositives :: [ Int ] -> Int
countPositives [] = 0
countPositives (x : xs) = if (x > 0) then 1 + countPositives xs
				     else countPositives xs

capitalisedHelper :: String -> String
capitalisedHelper [] = []
capitalisedHelper (h : t) = toLower h : capitalisedHelper t

capitalised :: String -> String
capitalised [] = []
capitalised (h : t) = toUpper h : capitalisedHelper t

title :: [ String ] -> [ String ]
title [] = []
title (str : strs) = capitalised str : title strs

isortHelper :: Ord a => a -> [ a ] -> [ a ]
isortHelper x [] = [ x ]
isortHelper x (y : ys) =  if (x <= y) then x : y : ys
				      else y : isortHelper x ys
isort :: Ord a => [ a ] -> [ a ]
isort [] = [] 
isort (h : t) = isortHelper h ( isort t )

merge :: Ord a => [ a ] -> [ a ] -> [ a ] 
merge [] [] = []
merge xs [] = xs
merge [] ys = ys
merge (x : xs) (y : ys) = if (x <= y) then x : merge xs (y : ys)
				      else y : merge (x : xs) ys

getfirsthalf :: [ a ] -> [ a ]
getfirsthalf xs = take (length xs `div` 2 ) xs

getsecondhalf :: [ a ] -> [ a ]
getsecondhalf xs = drop (length xs `div` 2) xs

msort :: Ord a => [ a ] -> [ a ]
msort [] = []
msort [ x ] = [ x ]
msort xs = merge (msort( getfirsthalf xs )) (msort ( getsecondhalf xs))

rotor :: Int -> [ Char ] -> [ Char ]
rotor n [] = []
rotor 0 str = str
rotor n (h : t) = if (n >= 0) && (n < length (h : t)) then rotor (n - 1) (t ++ [h])
						      else error "out of range"

makeKey :: Int -> [(Char, Char)]
makeKey n = zip alphabets (rotor n alphabets)
		where alphabets = ['A' .. 'Z']

lookUp :: Char -> [(Char, Char)] -> Char 
lookUp ch [] = ch
lookUp ch ((a, key) : aks) = if (ch == a) then key
					  else lookUp ch aks

encipher :: Int -> Char -> Char
encipher n ch = lookUp ch (makeKey n)

normalise :: String -> String
normalise [] = []
normalise (ch : str) | (ch `elem` ['A' .. 'Z']) || (ch `elem` ['0' .. '9']) = ch : (normalise str)
                     | (ch `elem` ['a' .. 'z']) = toUpper ch : normalise str
                     | otherwise = normalise str
		
encipherStr :: Int -> String -> String
encipherStr n [] = []
encipherStr 0 str = str
encipherStr n str = [encipher n ch | ch <- newstr] where newstr = normalise str

decipherStr :: String -> [ String ]
decipherStr str = decipherStrHelper 0 str

decipherStrHelper :: Int -> String -> [ String ]
decipherStrHelper 26 str = []
decipherStrHelper n str = (encipherStr n str) : decipherStrHelper (n + 1) str



