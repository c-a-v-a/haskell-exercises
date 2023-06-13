-- Ex.1 Create a function that returns True if and element is in a given list.
myElem :: (Eq a) => a -> [a] -> Bool
myElem _ [] = False
myElem e (x:xs) = (e == x) || myElem e xs
{-
myElem e (x:xs)
  | e == x = True
  | otherwise = myElem e xs
-}

-- Ex.2 Create function that removes all duplicates from a given list.
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs)
  | x `myElem` xs = nub xs
  | otherwise = x : nub xs
-- nub (x:xs) = [ y | y <- [x], not (myElem x xs) ] ++ nub xs

-- Ex.3 Create function that returns True if the list given to it is a list of ascending order.
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [_] = True
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

-- Ex.4 Create a function that determines if a path from one node to another exists within a directed graph
hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] a b = a == b
hasPath xs a b
  | a == b = True
  | otherwise =
    let xs' = [ (n,m) | (n,m) <- xs, n /= a ] in
    or [ hasPath xs' m b | (n,m) <- xs, n == a ]
{- My solution
hasPath [] a b = a == b
hasPath (x:xs) a b
  | (fst x) == a = hasPath xs (snd x) b || hasPath xs a b
  | otherwise = hasPath xs a b
-}
