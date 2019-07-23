module Board
    ( defaultBoard
    , Board(..)
    ) where


data Board = Board
    { width :: Int
    , height :: Int
    }

defaultBoard :: Board
defaultBoard = Board { width = 10, height = 10 }
