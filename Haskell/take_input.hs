module Main where
import ShowParser ( parseShow )

data PersonRecord  = MkPersonRecord {
    name :: String,
    address :: Address,
    id :: Integer,
    labels :: [Label]    
} deriving (Show)

data Address = MkAddress {
    line1 :: String,
    number :: Integer,
    street :: String,
    town :: String,
    postcode :: String
} deriving (Show)

data Label = Green | Red | Blue | Yellow deriving (Show)

main :: IO ()
main = do
    putStrLn "Enter a sentence:"
    sentence <- getLine
    let result = parseShow sentence
    putStrLn $ show result

rec1 = MkPersonRecord 
    "Wim Vanderbauwhede" 
    (MkAddress "School of Computing Science" 17 "Lilybank Gdns" "Glasgow" "G12 8QQ")
    557188
    [Green, Red]

rec2 = MkPersonRecord 
    "Jeremy Singer" 
    (MkAddress "School of Computing Science" 17 "Lilybank Gdns" "Glasgow" "G12 8QQ")
    42
    [Blue, Yellow]

rec_str =  show [rec1,rec2]
