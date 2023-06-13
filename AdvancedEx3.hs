module Main where

import System.IO
import Data.Char

getList :: IO [String]
getList = f [] where
  f xs = do
    x <- getLine
    if x == "" then return xs else f $ xs ++ [x]

matching :: [String] -> [String] -> [(String, Bool)]
matching xs ys = map (\x -> (x, elem (lowercase x) ys)) xs

stringifyMatches :: [(String, Bool)] -> [String]
stringifyMatches = map (\(x,y) -> if y then x ++ " was found" else x ++ " was not found")

lowercase :: String -> String
lowercase = map toLower

main = do
  putStrLn "Specify words to search: "
  searchWords <- getList

  putStr "Specify file to search in: "
  file <- getLine

  handle <- openFile file ReadMode
  contents <- hGetContents handle

  let fileWords = map lowercase $ words contents
  let result = stringifyMatches $ matching searchWords fileWords

  mapM print result

  hClose handle
