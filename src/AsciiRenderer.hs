module AsciiRenderer
    ( renderBoard
    -- For tests only:
    , renderField
    , renderPacman
    ) where

import Data.List (intercalate)

import Board (Board, Field(..), toList)
import Pacman (Pacman(..))
import Direction


renderBoard :: Board -> String
renderBoard board = intercalate "\n" $ map renderRow rows
  where
    rows = toList (board)
    renderRow = map renderField

renderField :: Field -> Char
renderField Food = '.'
renderField Wall = '#'
renderField Empty = ' '

renderPacman :: Pacman -> Char
renderPacman pacman = case (direction pacman) of
    North -> 'v'
    East -> '<'
    South -> '^'
    West -> '>'
