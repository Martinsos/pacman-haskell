module Board
    ( Board
    , Field(..)
    , getWidth
    , getHeight
    , fromList
    , toList
    ) where


data Board = Board
    { getRows :: [[Field]]
    }

data Field = Food | Wall | Empty deriving (Show, Eq)

getWidth :: Board -> Int
getWidth board = length $ (getRows board) !! 0

getHeight :: Board -> Int
getHeight board = length $ getRows board

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
