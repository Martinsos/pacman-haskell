module Game
    ( Game (getScore, numStepsElapsed, isOver)
    , makeNewGame
    ) where

import Board (Board)
import Pacman (Pacman)

data Game = Game
    { getBoard :: Board
    , getPacman :: Pacman
    , getScore :: Int
    , numStepsElapsed :: Int
    , isOver :: Bool
    }

makeNewGame :: Board -> Pacman -> Game
makeNewGame board pacman  = Game
    { getBoard = board
    , getPacman = pacman
    , getScore = 0
    , numStepsElapsed = 0
    , isOver = False
    }
