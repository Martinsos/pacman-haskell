module Pacman
    ( Pacman(..)
    ) where

import qualified Board

data Pacman = Pacman
    { direction :: Board.Direction
    , position :: Board.Position
    }
