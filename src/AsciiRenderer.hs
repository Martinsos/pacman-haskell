module AsciiRenderer
    ( renderBoard
    -- For tests only:
    , renderField
    ) where

import Data.List (intercalate)

import Board (Board, Field(..), toList)


renderBoard :: Board -> String
renderBoard board = intercalate "\n" $ map renderRow rows
  where
    rows = toList (board)
    renderRow = map renderField

renderField :: Field -> Char
renderField Food = '.'
renderField Wall = '#'
renderField Empty = ' '
