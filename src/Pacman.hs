module Pacman
    ( Pacman(..)
    ) where

import Direction
import qualified Board

data Pacman = Pacman
    { direction :: Direction
    , position :: Board.Position
    }

-- TODO: Create makeNewPacman function and use that to create new Pacman,
--   while I hide internals of "data Pacman"?
--   General question: when I have data like this, do I create functions as an
--   interface for it, or do I export it directly? Should I create "constructor"
--   function? How much do I want to hide, how much to expose?
--   Also, how do I import stuff: qualified, not, how to not make it a mess?
