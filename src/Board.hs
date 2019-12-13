module Board
    ( Board
    , Field(..)
    , Position(..)
    , newPosition
    , Direction(..)
    , getWidth
    , getHeight
    , fromList
    , toList
    ) where


data Board = Board
    { getRows :: [[Field]]
    }

data Field = Food | Wall | Empty deriving (Show, Eq)

data Position = Position
    { getX :: Int
    , getY :: Int
    }

newPosition :: Int -> Int -> Position
newPosition x y = Position { getX = x, getY = y }

data Direction = North | East | South | West deriving (Eq, Show, Ord)

getWidth :: Board -> Int
getWidth board = length $ (getRows board) !! 0

getHeight :: Board -> Int
getHeight board = length $ getRows board

-- TODO: add method that constructs board from string, from ascii characters, so it is easier to construct it (more readable).

fromList :: [[Field]] -> Board
fromList rows
    | not areRowsValid = error "Rows are invalid!"
    | otherwise = Board { getRows = rows }
  where
    width = length (rows !! 0)
    areRowsValid = (length rows > 0)
        && (width > 0)
        && (all (\row -> length row == width) rows)

toList :: Board -> [[Field]]
toList board = getRows board
