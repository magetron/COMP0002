safetail :: [ a ] -> [ a ]
safetail xs
	| null xs = []
 	| otherwise = tail xs

safetail2 :: [ a ] -> [ a ]
safetail2 xs = if null xs then [] else tail xs

insert :: Int -> [ Int ] -> [ Int ]
insert x [] = [x]
insert x (y : ys) = if x <= y then x : y : ys
			      else y : insert x ys
			      
