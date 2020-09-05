{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import Data.Semigroup


-- some goog functions from the Module

T.pack :: String -> T.Text
T.unpack :: T.text -> String 

firstWord :: String
firstWord = "optimizm"

secondWord :: T.Text
secondWord = T.pack firstWord

thirdWord :: String
thirdWord = T.unpack secondWord


-- the code throws an error : 
-- Couldn't match expected type 'T.Text' with actual type '[Char]'
-- if we will use normal Haskell
-- Have to use language extensions
-- {-# LANGUAGE OverloadedStrings #-}

myWord :: T.Text
myWord = "dog"


sampleInput :: T.Text
sampleInput = "this\nis\ninput"

toLines = T.lines sampleInput

someText :: T.Text
someText = "Some\ntext for\t you"
toWords = T.words someText

-- splitOn split up  text by any substring of text

breakText :: T.Text
breakText = "simple"
 
exampleText :: T.Text
exampleText = "This is simple to do"

onSplit = T.splitOn breakText exampleText

-- intercolate, unwords, unlines

unWords = T.unwords (T.words sampleInput) 
unlines = T.lines (T.lines sampleInput) 

reverse = T.intercalate breackText (T.splitOn breackText exampleText) 


combinedTextMonoid :: T.Text
combinedTextMonoid = mconcat ["some"," ","text"]

combinedTextSemigroup :: T.Text
combinedTextSemigroup = "some" <> " " <> "text"

myLines :: T.Text -> [T.Text]
myLines text = T.splitOn "\n" text 

myUnLines :: [T.Text] -> T.Text
myUnLines textLines = T.intercalate "\n" textLines



