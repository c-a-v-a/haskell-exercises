-- Ex.1 Create function that reverses a list
rev :: [a] -> [a]
rev = foldl (\acc x -> x:acc) []
-- rev = foldl (flip (:)) []

-- Ex.2 Create a function that returns all the prefixes of a given list.
prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) acc)) []
{- my solution
prefixes = foldl (\acc x -> if null acc then [[x]] else acc ++ [(last acc) ++ [x]]) []
-}

-- Ex.3 Lagrange polynomial.
lagrange :: [(Float, Float)] -> Float -> Float
lagrange xs x = foldr (\(xj, yj) -> (+) (yj * l xj)) 0 xs
  where
    l xj = foldr (\(xm, _) -> (*) ((x-xm) / (xj - xm))) 1 $ filter (\(a, _) -> a /= xj) xs

-- Ex.4 Create a function that folds the elements of a trie in a preoprder traversal.
data Trie a = Leaf a | Node a [Trie a]

foldtrie :: (b -> a -> b) -> b -> Trie a -> b
foldtrie f acc (Leaf x) = f acc x
foldtrie f acc (Node x xs) = foldl (foldtrie f) (f acc x) xs
