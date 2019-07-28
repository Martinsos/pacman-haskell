module Game
    ( Game
    , newGame
    , getScore
    , numStepsElapsed
    , isOver
    ) where

import Board (Board)
import qualified Board
import Pacman (Pacman)

data Game = Game
    { board :: Board
    , pacman :: Pacman
    }

board1 :: Board
board1 = Board.fromList
    [ [Board.Food,  Board.Food,  Board.Food]
    , [Board.Food,  Board.Empty, Board.Food]
    , [Board.Food,  Board.Food,  Board.Food]
    ]

newGame :: Game
newGame = Game { board = board1 }
