-- Haskell Coursework Sheet
-- Author : Daiqi Wu
-- Email : daiqi.wu.17@ucl.ac.uk

newtype Horse = Horsify { getHorse :: [ String ] }
-- Task 1
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
                  "     ;;' \\   ",
                  "  ,;;' ( '\\  ",
                  "      / '\\_) " ]


printHorse :: Horse -> IO ()
-- print Horse for debug purposes
printHorse horse = printHorseHelper (getHorse horse)

printHorseHelper :: [ String ] -> IO ()
printHorseHelper strs = mapM_ (putStrLn) strs

reverseList :: [ String ] -> [ String ]
-- self-implemented debug function
reverseList [] = []
reverseList (str : strs) = reverseList strs ++ [ str ]

transposeHorse :: Horse -> Horse
-- Task 3 turn 90 right
transposeHorse horse = Horsify (transposeHorseHelper (reverseList(getHorse horse)))

transposeHorseHelper :: [ String ] -> [ String ]
transposeHorseHelper [] = []
transposeHorseHelper (h : t) = if (null h) then []
                                           else map head ((h : t)) : transposeHorseHelper (map tail ((h : t)))
mirrorHorse :: Horse -> Horse
-- Task 3 vertical mirror
mirrorHorse horse = Horsify ( reverseList(getHorse horse) )

squareSequenceGenerator :: Int -> [ Int ]
-- Task 4 Generate 0, 1, 4, 9, 16 .. n ^ 2
squareSequenceGenerator 0 = [ 0 ]
squareSequenceGenerator n = squareSequenceGenerator (n - 1) ++ [ n * n ]

anotherSequenceGenerator :: Int -> [ Int ]
-- Task 4 Generate 1, 3, 5 .. (new number = previous * 2 - 1)
anotherSequenceGenerator 1 = [ 1 ]
anotherSequenceGenerator n = anotherSequenceGenerator (n - 1) ++ [last ( anotherSequenceGenerator (n - 1) ) * 2 + 1]

justAddOneSequenceGenerator :: Int -> [ Int ]
-- Task 4 Generate 0, 1, 2, 3, 4 ... n
justAddOneSequenceGenerator 0 = [ 0 ]
justAddOneSequenceGenerator n = justAddOneSequenceGenerator (n - 1) ++ [ n ]

pretty :: Horse -> IO ()
-- Task 5 Print Horse
pretty horse = printHorse horse 

duplicateHorse :: Horse -> Int  -> Horse
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



