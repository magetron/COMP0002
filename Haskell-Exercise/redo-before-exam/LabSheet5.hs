fac :: Int -> Int
fac 0 = 1
fac x 	| x < 0 		= error "factorial error"
		| otherwise 	= x * fac (x - 1)


fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x  	| x < 0 		= error "fibonacci error"
		| otherwise 	= fib (x - 1) + fib (x - 2)

