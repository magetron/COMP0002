-- Haskell Coursework Sheet
-- Author : Daiqi Wu
-- Email : daiqi.wu.17@ucl.ac.uk

newtype Horse = Horsify { getHorse :: [ String ] }
-- Task 1



instance Show Horse where
-- Task 6 Typeclass instance to redefine Show Horse
         show (horse) = printStringHorse horse

printStringHorse :: Horse -> String
printStringHorse horse = printStringHorseHelper ( getHorse  horse )

printStringHorseHelper :: [ String ] -> String
printStringHorseHelper [] = ""
printStringHorseHelper strs = foldr (\x y -> x ++ if y == "" then y else "\n" ++ y) "" strs
--printStringHorseHelper (str : strs) = str ++ "\n" ++ (printStringHorseHelper strs)

instance Eq Horse where
-- Task 6 Typeclass instance to redefine Eq Horse
         horseX == horseY  =  (horseEq horseX horseY)

horseEq :: Horse -> Horse -> Bool
horseEq horseX horseY = horseEqHelper (getHorse horseX) (getHorse horseY)

horseEqHelper :: [ String ] -> [ String ] -> Bool
horseEqHelper [] [] = True
horseEqHelper [ strX ] [] = False
horseEqHelper [] [ strY ] = False
horseEqHelper ( strX : strXs ) ( strY : strYs ) | (strX == strY) = True && (horseEqHelper strXs strYs)
                                                | otherwise = False 




niceHorse :: Horse
-- Task 2 get a nice horse than the one on the coursework sheet call it niceHorse or you can use the horse beneath
niceHorse = Horsify [   "                                               #    #     ",
                        "                                           %%% ##   ##    ",
                        "                                        %%%%% ###%%###    ",
                        "                                       %%%%% ### %%% #    ",
                        "                                     %%%%%% ### %%% ###   ",
                        "                                      %%%% ## %% #######  ",
                        "                                     %%%%% # %% #######   ",
                        "                                   %%%%%% # % #########   ",
                        "                                  %%%%% ##### #########   ",
                        "                        ###        %% ####### #########   ",
                        "               %%% ############    ########### ########   ",
                        "            %%%% ############################### #######  ",
                        "          %%%%% ################################## ###### ",
                        "        %%%%%% #################################### ##### ",
                        "       %%%%%% #####################################  ###  ",
                        "       %%%%% #######################################      ",
                        "      %%%%%% ########################################     ",
                        "   % %%%%%%% ########################################     ",
                        "    %%%%%%%%% #######################################     ",
                        "   %%%%%%%%%% ########################################    ",
                        "%%% %%%%%%%%   ###### ################################    ",
                        "  %%%%%%%%      ###### #################### ##########    ",
                        " %%%%%%%%        ####### ########### ###### ##########    ",
                        "%%%%%%%%%         #######  ########### ###### ########    ",
                        "%%%%%%%%%          ##### ###  ######### ####### ######    ",
                        "%%%%%%%%%%          #### ##               ####### ####    ",
                        "%%%%%%%%%%%           ## #                  ##### ###     ",
                        " %%  %% % %%         # ##                      ## ###     ",
                        "   %   %    %        # ###                      # ###     ",
                        "                      # ###                     ## ###    ",
                        "                      # ###                     ## ###    ",
                        "                      # ####                   #### ##    ",
                        "                     ### ###                  ##### ###   ",
                        "                    ####  ###                 ####   ##   ",
                        "                   #####   ###                 ##    ##   ",
                        "                  #####    ####                      ###  ",
                        "                   ##        ###                     ###  ",
                        "                              ####                     ## ",
                        "                               ####                    ###",
                        "                                                       ###",
                        "                                                        ##"]
-- Credits of the above ASCII Art above to http://www.asciiworld.com/-Horses-.html
-- CC0 License (Public Domain)

horse :: Horse
horse = Horsify [ "     ,/)      ",
                  "     ;;' \\    ",
                  "  ,;;' ( '\\   ",
                  "      / '\\_)  " ]


printHorse :: Horse -> IO ()
-- print Horse for debug purposes
printHorse horse = printHorseHelper (getHorse horse)

printHorseHelper :: [ String ] -> IO ()
printHorseHelper strs = mapM_ (putStrLn) strs



modifyHorse :: ([ String ] -> [ String ]) -> Horse -> Horse
-- Task 3 high order function 
-- Usage: modifyHorse transpose horse
--        modifyHorse mirror niceHorse
modifyHorse func horse = Horsify (func (getHorse horse) )

transpose :: [ String ] -> [ String ]
transpose strs = transposeHelper ( reverseList strs ) 

transposeHelper :: [ String ] -> [ String ]
transposeHelper [] = []
transposeHelper (h : t) = if (null h) then []
                                else map head ((h : t)) : transposeHelper (map tail ((h : t)))

mirror :: [ String ] -> [ String ]
mirror strs = map reverseString strs

reverseString :: String -> String
reverseString [] = []
reverseString str = foldr (\ch str -> str ++ [ ch ]) [] str 

verticalMirror :: [ String ] -> [ String ]
verticalMirror strs = reverseList strs 

reverseList :: [ String ] -> [ String ]
reverseList [] = []
reverseList strs = foldr (\str strs -> strs ++ [ str ]) [] strs

-- All rotations possible :
-- Turn 90 : modifyHorse transpose horse
-- Turn 180 : modifyHorse transpose ( modifyHorse transpose horse )
-- Turn 270 : modifyHorse transpose ( modifyHorse transpose ( modifyHorse transpose horse ))
-- Mirror : modifyHorse mirror horse


addOneSequenceGenerator :: Int -> [ Int ]
-- Task 4 genreate sequence 0, 1, 2 ... n
addOneSequenceGenerator n = enumFromTo 0 n

squareSequenceGenerator :: Int -> [ Int ]
-- Task 4 generate sequence 0, 1, 4, 9 ... n ^ 2
squareSequenceGenerator n = map ( ^ 2 ) ( addOneSequenceGenerator n )

powerOfTwoSequenceGenerator :: Int -> [ Int ]
-- Task 4 genreate sequence 1, 2, 4, 8, 16 ... 2 ^ n
powerOfTwoSequenceGenerator n = map ( 2 ^ ) ( addOneSequenceGenerator n )

tribonacciGenerator :: Int -> [ Int ]
-- Task 4 generate sequence 0, 0, 1, 1, 2, 4, 7, 13, 24 ... (add previous 3 numbers)
tribonacciGenerator 1 = [ 0 ]
tribonacciGenerator 2 = [ 0, 0 ]
tribonacciGenerator 3 = [ 0, 0, 1]
tribonacciGenerator n = tribonacciGenerator (n - 1) ++ [sum (drop (n - 4) (tribonacciGenerator (n - 1)) )]

pretty :: Horse -> IO ()
-- Task 5 Print Horse
pretty horse = printHorse horse

duplicateHorse :: Horse -> Int -> Horse
-- helper function to generate horse image with multiple horses
duplicateHorse horse 0 = Horsify ( ["\n\n ** no horse ** \n\n"] )
duplicateHorse horse n = Horsify ( duplicateHorseHelper (getHorse horse) n )

duplicateHorseHelper :: [ String ] -> Int -> [ String ]
duplicateHorseHelper [] n = []
duplicateHorseHelper (str : strs) n  = repeatString str n : duplicateHorseHelper strs n

repeatString :: String -> Int -> String
repeatString str 0 = []
repeatString str 1 = str
repeatString str n = str ++ repeatString str (n - 1)

horseSeq :: (Int -> [ Int ]) -> Int -> Horse -> IO ()
-- Task 5 Prints Horse in accordance with the sequence generated
horseSeq seqGen n horse = mapM_ (printHorse.duplicateHorse horse) (seqGen n)
