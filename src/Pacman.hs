module Pacman
    ( Pacman
    , newPacman
    , getDirection
    , setDirection
    ) where

import Direction

data Pacman = Pacman
    { direction :: Direction
    }

newPacman :: Pacman
newPacman = Pacman { direction = East }

getDirection :: Pacman -> Direction
getDirection pacman = direction pacman

setDirection :: Pacman -> Direction -> Pacman
setDirection pacman newDirection = pacman { direction = newDirection }
