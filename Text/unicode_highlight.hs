-- some code is from: https://livebook.manning.com/book/get-programming-with-haskell/chapter-23/43

{-# LANGUAGE OverloadedStrings #-}
import qualified Data.Text as T
import qualified Data.Text.IO as TIO


highlight :: T.Text -> T.Text -> T.Text
highlight query fullText = T.intercalate highlighted pieces
    where pieces = T.splitOn query fullText
          highlighted = mconcat ["{", query, "}"]

dharma :: T.Text
--dharma = "धर्मः"
dharma = " "

--fullText :: T.Text
--fullText = 
--धर्म

--श्रेयान्स्वधर्मो विगुणः परधर्मात्स्वनुष्ठितात्।
--स्वधर्मे निधनं श्रेयः परधर्मो भयावहः

main = do 
    bgText <- TIO.readFile "gistfile1.txt"
    TIO.putStrLn (highlight dharma bgText)
