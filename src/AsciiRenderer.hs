module AsciiRenderer
    ( renderBoard
    -- For tests only:
    , renderField
    , renderPacman
    , renderGame
    ) where

import Data.List (intercalate)

import Game (Game)
import Board (Board, Field(..), Direction(..), toList)
import Pacman (Pacman(..))


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

renderGame :: Game -> String
renderGame _ = "todo"
