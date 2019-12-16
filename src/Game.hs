module Game
    ( Game (getBoard, getScore, numStepsElapsed, isOver)
    , makeNewGame
    ) where

import Board (Board)

data Game = Game
    { getBoard :: Board
    , getScore :: Int
    , numStepsElapsed :: Int
    , isOver :: Bool
    } deriving (Show, Eq)

makeNewGame :: Board -> Game
makeNewGame board  = Game
    { getBoard = board
    , getScore = 0
    , numStepsElapsed = 0
    , isOver = False
    }
