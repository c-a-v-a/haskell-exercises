import Data.List hiding (insert)

-- Ex.1 Create the function `cut` and the infinite tree as described
data Tree a = Leaf | Node (Tree a) a (Tree a)
  deriving (Show)

inv_tup_tree :: Tree (Integer, Integer)
inv_tup_tree = tree 0 0
  where
    tree l r = Node (tree (l + 1) r) (l,r) (tree l (r + 1))

cut :: Integer -> Tree a -> Tree a
cut 0 _ = Leaf
cut x Leaf = Leaf
cut x (Node l t r) = Node (cut (x - 1) l) t (cut (x - 1) r)

-- Ex.2 Write functions `insert` and `inorder` for the binary tree. 
insert :: (Ord a) => a -> Tree a -> Tree a
insert a Leaf = Node Leaf a Leaf
insert a (Node l v r)
  | a <= v = Node (insert a l) v r
  | a > v = Node l v (insert a r)

inorder :: Tree a -> [a]
inorder Leaf = []
inorder (Node l v r) = (inorder l) ++ [v] ++ (inorder r)
