import Test.QuickCheck
import Data.Char as Char
import Data.List

halfEvens :: [ Int ] -> [ Int ]
halfEvens [ ] = [ ]
halfEvens (x : xs) 	| x `mod` 2 == 0	= x `div` 2 : halfEvens xs
  					| otherwise 		= x : halfEvens xs

inRange :: Int -> Int -> [ Int ] -> [ Int ]
inRange min max xs = [x | x <- xs, x >= min && x <= max]

countPositives :: [ Int ] -> Int 
countPositives xs = sum [1 | x <- xs, x > 0]


prop_halfEvens :: [ Int ] -> Bool
prop_halfEvens xs = length xs == length (halfEvens xs)

prop_inRange :: Int -> Int -> [ Int ] -> Bool
prop_inRange min max xs = length (inRange min max xs) <= length [min..max]

prop_inRangeRev :: Int -> Int -> Int -> Bool
prop_inRangeRev min max x = inRange min max [0 .. x] == reverse (inRange min max [x, x - 1 .. 0])

prop_countPositives :: [ Int ] -> Bool
prop_countPositives xs = countPositives xs == length (filter ( >0 ) xs)

alphabets :: String
alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

rotor :: Int -> String -> String
rotor offset [ ] 		| offset < 0 	= error "offset smaller than 0"
  						| otherwise 	= error "offset larger than / equal to string length"
rotor 0 xs				= xs
rotor offset (x : xs)	| offset < 0 	= error "offset smaller than 0"
  						| offset >= length (x : xs) = error "offset larger than / equal to string length"
						| otherwise 	= (rotor (offset - 1) (xs ++ [ x ]))

lookUp :: Char -> [(Char, Char)] -> Char
lookUp ch [ ] = ch
lookUp ch ((x, y) : dict) = if (ch == x) then y else lookUp ch dict

makeKey :: Int -> [(Char, Char)]
makeKey offset = zip alphabets (rotor offset alphabets)

encipher :: Int -> Char -> Char
encipher offset ch = lookUp ch (makeKey offset)

normalise :: String -> String
normalise str = map toUpper (filter isAlphaNum str)

qsort :: (Ord a) => [ a ] -> [ a ]
qsort [ ] = [ ]
qsort (x : xs) = qsort [l | l <- xs, l <= x] ++ [ x ] ++ qsort [r | r <- xs, r > x]


prop_rotor :: Int -> String -> Property
prop_rotor offset str = 
	offset < (length str) && 0 <= offset ==>
		take offset str == drop (length str - offset) result 
		&& drop offset str == take (length str - offset) result
		where 	result = rotor offset str

prop_encipher :: Int -> Char -> Bool
prop_encipher offset ch = encipher 10 (encipher 16 ch) == ch

prop_norm :: String -> Bool
prop_norm str = normalise str == filter isAlphaNum (map toUpper str)

myWords :: String -> [ String ]
myWords [ ] = [ ]
myWords xxs @ (x : xs) 	| isSpace x 	= myWords xs
  						| otherwise 	= word : myWords rest
							where (word, rest) = break isSpace xxs

myUnWords :: [ String ] -> String
myUnWords [ ] = [ ]
myUnWords strs = init (foldr (\x y -> x ++ " " ++ y) [ ] strs)

trim :: String -> String
trim str = map cleanify ((dropWhileEnd isSpace . dropWhile isSpace) str)

cleanify :: Char -> Char
cleanify ch	| isSpace ch	= ' '
 			| otherwise 	= ch

prop_wording :: String -> Property
prop_wording str = 
	length str >= 1 ==>
		(myUnWords . myWords) str == trim str

